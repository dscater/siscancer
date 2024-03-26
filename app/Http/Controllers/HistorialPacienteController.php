<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\HistorialPaciente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class HistorialPacienteController extends Controller
{
    public $validacion = [
        "paciente_id" => "required",
        "fecha_pc" => "required",
        "meses_dpc" => "required",
        "mamografia_aa" => "required",
        "biopsias_mp" => "required",
        "hiperplasia_a" => "required",
        "cancer_mp" => "required",
        "lado_ta" => "required",
        "cancer_olc" => "required",
        "parientes_pgcm" => "required",
        "otros_pccm" => "required",
        "parientes_cco" => "required",
        "parientes_ccc" => "required",
        "parientes_cce" => "required",
        "parientes_cotc" => "required",

    ];

    public $mensajes = [
        "paciente_id.required" => "Este campo es obligatorio",
        "fecha_pc.required" => "Este campo es obligatorio",
        "meses_dpc.required" => "Este campo es obligatorio",
        "mamografia_aa.required" => "Este campo es obligatorio",
        "biopsias_mp.required" => "Este campo es obligatorio",
        "hiperplasia_a.required" => "Este campo es obligatorio",
        "cancer_mp.required" => "Este campo es obligatorio",
        "lado_ta.required" => "Este campo es obligatorio",
        "cancer_olc.required" => "Este campo es obligatorio",
        "parientes_pgcm.required" => "Este campo es obligatorio",
        "otros_pccm.required" => "Este campo es obligatorio",
        "parientes_cco.required" => "Este campo es obligatorio",
        "parientes_ccc.required" => "Este campo es obligatorio",
        "parientes_cce.required" => "Este campo es obligatorio",
        "parientes_cotc.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        return Inertia::render("HistorialPacientes/Index");
    }

    public function listado()
    {
        $historial_pacientes = HistorialPaciente::select("historial_pacientes.*")->get();
        return response()->JSON([
            "historial_pacientes" => $historial_pacientes
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $historial_pacientes = HistorialPaciente::with(["paciente", "historial_archivos"])->select("historial_pacientes.*");

        if (trim($search) != "") {
            $historial_pacientes->orWhereRaw("CONCAT(nombre,' ', paterno,' ', materno) LIKE ?", ["%$search%"]);
            $historial_pacientes->orWhere("ci", "LIKE", "%$search%");
        }

        $historial_pacientes = $historial_pacientes->paginate($request->itemsPerPage);
        return response()->JSON([
            "historial_pacientes" => $historial_pacientes
        ]);
    }

    public function create()
    {
        return Inertia::render("HistorialPacientes/Create");
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el HistorialPaciente
            $nuevo_historial_paciente = HistorialPaciente::create(array_map('mb_strtoupper', $request->except('historial_archivos')));

            if ($request->file("historial_archivos")) {
                $historial_archivos = $request->file('historial_archivos');
                foreach ($historial_archivos as $key => $file) {
                    $nom_archivo = "Estudio" . $nuevo_historial_paciente->id . "_" . time() . $key . "." . $file->getClientOriginalExtension();
                    $nuevo_historial_paciente->historial_archivos()->create([
                        "archivo" => $nom_archivo,
                    ]);
                    $file->move(public_path() . '/files/', $nom_archivo);
                }
            }

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_historial_paciente, "historial_pacientes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN HISTORIAL DE PACIENTE',
                'datos_original' => $datos_original,
                'modulo' => 'HISTORIAL DE PACIENTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("historial_pacientes.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(HistorialPaciente $historial_paciente)
    {
    }

    public function edit(HistorialPaciente $historial_paciente)
    {
        return Inertia::render("HistorialPacientes/Edit", compact("historial_paciente"));
    }

    public function update(HistorialPaciente $historial_paciente, Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($historial_paciente, "historial_pacientes");
            $historial_paciente->update(array_map('mb_strtoupper', $request->except('historial_archivos')));

            if ($request->file("historial_archivos")) {
                $historial_archivos = $request->file('historial_archivos');
                foreach ($historial_archivos as $key => $file) {
                    $nom_archivo = "Estudio" . ($historial_paciente->id) . "_" . time() . $key . "." . $file->getClientOriginalExtension();
                    $historial_paciente->historial_archivos()->create([
                        "archivo" => $nom_archivo,
                    ]);
                    $file->move(public_path() . '/files/', $nom_archivo);
                }
            }

            $datos_nuevo = HistorialAccion::getDetalleRegistro($historial_paciente, "historial_pacientes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN HISTORIAL DE PACIENTE',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'HISTORIAL DE PACIENTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("historial_pacientes.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(HistorialPaciente $historial_paciente)
    {
        DB::beginTransaction();
        try {
            foreach ($historial_paciente->historial_archivos as $item) {
                if (file_exists(public_path("files/" . $item->archivo))) {
                    \File::delete(public_path("files/" . $item->archivo));
                }
                $item->delete();
            }

            $datos_original = HistorialAccion::getDetalleRegistro($historial_paciente, "historial_pacientes");
            $historial_paciente->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN HISTORIAL DE PACIENTE',
                'datos_original' => $datos_original,
                'modulo' => 'HISTORIAL DE PACIENTES',
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
