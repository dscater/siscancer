<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\HistorialPaciente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class HistorialPacienteController extends Controller
{
    public $validacion = [
        "nombre" => "required",
    ];

    public $mensajes = [
        "nombre.required" => "Este campo es obligatorio",
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
        $historial_pacientes = HistorialPaciente::select("historial_pacientes.*");

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
            $nuevo_historial_paciente = HistorialPaciente::create(array_map('mb_strtoupper', $request->except('foto')));

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
            $historial_paciente->update(array_map('mb_strtoupper', $request->except('foto')));

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
