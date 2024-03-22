<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Paciente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class PacienteController extends Controller
{
    public $validacion = [
        "nombre" => "required|min:1",
        "paterno" => "required|min:1",
        "ci" => "required|min:1",
        "ci_exp" => "required",
        "fecha_nac" => "required",
        "sexo" => "required",
        "estado_civil" => "required",
        "ocupacion" => "required",
        "cel" => "required",
        "cel_familiar" => "required",
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
        "fecha_nac.required" => "Este campo es obligatorio",
        "sexo.required" => "Este campo es obligatorio",
        "estado_civil.required" => "Este campo es obligatorio",
        "ocupacion.required" => "Este campo es obligatorio",
        "cel.required" => "Este campo es obligatorio",
        "cel_familiar.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        return Inertia::render("Pacientes/Index");
    }

    public function listado()
    {
        $pacientes = Paciente::select("pacientes.*")->get();
        return response()->JSON([
            "pacientes" => $pacientes
        ]);
    }

    public function byTipo(Request $request)
    {
        $pacientes = Paciente::select("pacientes.*");
        if (isset($request->tipo) && trim($request->tipo) != "") {
            $pacientes = $pacientes->where("tipo", $request->tipo);
        }

        if ($request->order && $request->order == "desc") {
            $pacientes->orderBy("pacientes.id", "desc");
        }

        $pacientes = $pacientes->get();

        return response()->JSON([
            "pacientes" => $pacientes
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $pacientes = Paciente::select("pacientes.*");

        if (trim($search) != "") {
            $pacientes->orWhereRaw("CONCAT(nombre,' ', paterno,' ', materno) LIKE ?", ["%$search%"]);
            $pacientes->orWhere("ci", "LIKE", "%$search%");
        }

        $pacientes = $pacientes->paginate($request->itemsPerPage);
        return response()->JSON([
            "pacientes" => $pacientes
        ]);
    }

    public function store(Request $request)
    {
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }
        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el Paciente
            $nuevo_paciente = Paciente::create(array_map('mb_strtoupper', $request->except('foto')));
            if ($request->hasFile('foto')) {
                $file = $request->foto;
                $nom_foto = time() . '_' . $nuevo_paciente->paciente . '.' . $file->getClientOriginalExtension();
                $nuevo_paciente->foto = $nom_foto;
                $file->move(public_path() . '/imgs/pacientes/', $nom_foto);
            }
            $nuevo_paciente->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_paciente, "pacientes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN PACIENTE',
                'datos_original' => $datos_original,
                'modulo' => 'PACIENTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("pacientes.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Paciente $paciente)
    {
    }

    public function update(Paciente $paciente, Request $request)
    {
        $this->validacion['ci'] = 'required|min:4|numeric|unique:pacientes,ci,' . $paciente->id;
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($paciente, "pacientes");
            $paciente->update(array_map('mb_strtoupper', $request->except('foto')));
            if ($request->hasFile('foto')) {
                $antiguo = $paciente->foto;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/pacientes/' . $antiguo);
                }
                $file = $request->foto;
                $nom_foto = time() . '_' . $paciente->paciente . '.' . $file->getClientOriginalExtension();
                $paciente->foto = $nom_foto;
                $file->move(public_path() . '/imgs/pacientes/', $nom_foto);
            }
            $paciente->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($paciente, "pacientes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN PACIENTE',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PACIENTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);


            DB::commit();
            return redirect()->route("pacientes.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(Paciente $paciente)
    {
        DB::beginTransaction();
        try {
            $antiguo = $paciente->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/pacientes/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($paciente, "pacientes");
            $paciente->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN PACIENTE',
                'datos_original' => $datos_original,
                'modulo' => 'PACIENTES',
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
