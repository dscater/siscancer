<?php

namespace App\Http\Controllers;

use App\Models\HistorialArchivo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HistorialArchivoController extends Controller
{
    public function destroy(HistorialArchivo $historial_archivo)
    {
        DB::beginTransaction();
        try {
            $historial_paciente = $historial_archivo->historial_paciente;

            $ruta_archivo  = public_path("files/" . $historial_archivo->archivo);
            $historial_archivo->delete();
            DB::commit();
            if (file_exists($ruta_archivo)) {
                \File::delete($ruta_archivo);
            }
            return response()->JSON([
                "message" => "Registro eliminado",
                "historial_paciente" => $historial_paciente->load("historial_archivos")
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                "message" => $e->getMessage()
            ], 500);
        }
    }
}
