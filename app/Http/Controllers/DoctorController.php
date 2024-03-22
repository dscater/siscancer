<?php

namespace App\Http\Controllers;

use App\Models\Doctor;
use App\Models\HistorialAccion;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class DoctorController extends Controller
{
    public $validacion = [
        "nombre" => "required|min:1",
        "paterno" => "required|min:1",
        "ci" => "required|min:1",
        "ci_exp" => "required",
        "fono" => "required|min:1",
        "fecha_nac" => "required",
        "estado_civil" => "required",
        "sexo" => "required",
    ];

    public $mensajes = [
        "nombre.required" => "Este campo es obligatorio",
        "nombre.min" => "Debes ingresar al menos :min caracteres",
        "paterno.required" => "Este campo es obligatorio",
        "paterno.min" => "Debes ingresar al menos :min caracteres",
        "ci.required" => "Este campo es obligatorio",
        "ci.unique" => "Este C.I. ya fue registrado",
        "ci.min" => "Debes ingresar al menos :min caracteres",
        "ci_exp.required" => "Este campo es obligatorio",
        "dir.required" => "Este campo es obligatorio",
        "dir.min" => "Debes ingresar al menos :min caracteres",
        "fono.required" => "Este campo es obligatorio",
        "fono.min" => "Debes ingresar al menos :min caracteres",
        "fecha_nac.required" => "Este campo es obligatorio",
        "estado_civil.required" => "Este campo es obligatorio",
        "sexo.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        return Inertia::render("Doctors/Index");
    }

    public function listado()
    {
        $doctors = Doctor::with("user")->get();
        return response()->JSON([
            "doctors" => $doctors
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $doctors = Doctor::with("user")->select("doctors.*")
            ->join("users", "users.id", "=", "doctors.user_id");
        if (trim($search) != "") {
            $doctors->where("users.usuario", "LIKE", "%$search%");
            $doctors->orWhereRaw("CONCAT(users.nombre,' ', users.paterno,' ', users.materno) LIKE ?", ["%$search%"]);
            $doctors->orWhere("users.ci", "LIKE", "%$search%");
        }

        $doctors = $doctors->paginate($request->itemsPerPage);
        return response()->JSON([
            "doctors" => $doctors
        ]);
    }

    public function store(Request $request)
    {
        $this->validacion['ci'] = 'required|min:4|numeric|unique:users,ci';
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }
        $request->validate($this->validacion, $this->mensajes);

        $cont = 0;
        do {
            $nombre_usuario = User::getNombreUsuario($request->nombre, $request->paterno);
            if ($cont > 0) {
                $nombre_usuario = $nombre_usuario . $cont;
            }
            $request['usuario'] = $nombre_usuario;
            $cont++;
        } while (User::where('usuario', $nombre_usuario)->get()->first());

        $request['password'] = 'NoNulo';
        $request['tipo'] = "DOCTOR";
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // Registrar Usuario
            $nuevo_usuario = User::create(array_map('mb_strtoupper', $request->except('foto')));
            $request["user_id"] = $nuevo_usuario->id;
            // crear Registro Doctor
            $nuevo_doctor = Doctor::create(array_map('mb_strtoupper', $request->except('foto')));

            // completar informacion usuario
            $nuevo_usuario->password = Hash::make($request->ci);
            $nuevo_usuario->save();
            if ($request->hasFile('foto')) {
                $file = $request->foto;
                $nom_foto = time() . '_' . $nuevo_usuario->usuario . '.' . $file->getClientOriginalExtension();
                $nuevo_usuario->foto = $nom_foto;
                $file->move(public_path() . '/imgs/users/', $nom_foto);
            }
            $nuevo_usuario->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_doctor, "doctors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL DOCTOR ' . Auth::user()->usuario . ' REGISTRO UN DOCTOR',
                'datos_original' => $datos_original,
                'modulo' => 'DOCTORES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("doctors.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Doctor $doctor)
    {
    }

    public function update(Doctor $doctor, Request $request)
    {
        $this->validacion['ci'] = 'required|min:4|numeric|unique:users,ci,' . $doctor->user_id;
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {

            $user = $doctor->user;
            $user->update(array_map('mb_strtoupper', $request->except('foto')));

            $datos_original = HistorialAccion::getDetalleRegistro($doctor, "doctors");
            $doctor->update(array_map('mb_strtoupper', $request->except('foto')));
            if ($request->hasFile('foto')) {
                $antiguo = $user->foto;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/users/' . $antiguo);
                }
                $file = $request->foto;
                $nom_foto = time() . '_' . $user->usuario . '.' . $file->getClientOriginalExtension();
                $user->foto = $nom_foto;
                $file->move(public_path() . '/imgs/users/', $nom_foto);
            }
            $user->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($doctor, "doctors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL DOCTOR ' . Auth::user()->usuario . ' MODIFICÓ UN DOCTOR',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'DOCTORES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);


            DB::commit();
            return redirect()->route("doctors.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(Doctor $doctor)
    {
        DB::beginTransaction();
        try {
            $antiguo = $doctor->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/doctors/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($doctor, "doctors");
            $user = $doctor->user;
            $doctor->delete();
            $user->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL DOCTOR ' . Auth::user()->usuario . ' ELIMINÓ UN DOCTOR',
                'datos_original' => $datos_original,
                'modulo' => 'DOCTORES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
