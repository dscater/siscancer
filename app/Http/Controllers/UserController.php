<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{


    public static $permisos = [
        "SUPER USUARIO" => [
            "usuarios.index",
            "usuarios.create",
            "usuarios.edit",
            "usuarios.destroy",

            "doctors.index",
            "doctors.create",
            "doctors.edit",
            "doctors.destroy",

            "pacientes.index",
            "pacientes.create",
            "pacientes.edit",
            "pacientes.destroy",

            "historial_pacientes.index",
            "historial_pacientes.create",
            "historial_pacientes.edit",
            "historial_pacientes.destroy",

            "diagnosticos.index",
            "diagnosticos.create",
            "diagnosticos.edit",
            "diagnosticos.destroy",

            "entrenamientos.index",
            "entrenamientos.create",
            "entrenamientos.edit",
            "entrenamientos.destroy",
        ],
        "DOCTOR" => [
            "vuetify",
        ],
    ];

    public static function getPermisosUser()
    {
        $array_permisos = self::$permisos;
        if ($array_permisos[Auth::user()->tipo]) {
            return $array_permisos[Auth::user()->tipo];
        }
        return [];
    }


    public static function verificaPermiso($permiso)
    {
        if (in_array($permiso, self::$permisos[Auth::user()->tipo])) {
            return true;
        }
        return false;
    }

    public function permisos(Request $request)
    {
        return response()->JSON([
            "permisos" => $this->permisos[Auth::user()->tipo]
        ]);
    }

    public function getUser()
    {
        return response()->JSON([
            "user" => Auth::user()
        ]);
    }
}
