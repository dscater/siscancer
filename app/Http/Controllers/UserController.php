<?php

namespace App\Http\Controllers;

use App\Models\Doctor;
use App\Models\User;
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

            "reportes.usuarios",
            "reportes.historial_pacientes",
            "reportes.pacientes",
            "reportes.diagnosticos",

        ],
        "DOCTOR" => [
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

            "reportes.historial_pacientes",
            "reportes.pacientes",
            "reportes.diagnosticos",
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

    public static function getInfoBoxUser()
    {
        $tipo = Auth::user()->tipo;
        $array_infos = [];
        if (in_array('usuarios.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Usuarios',
                'cantidad' => count(User::where('id', '!=', 1)->get()),
                'color' => 'bg-blue-darken-2',
                'icon' => asset("imgs/icon_users.png"),
                "url" => "usuarios.index"
            ];
        }
        if (in_array('doctors.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Doctores',
                'cantidad' => count(Doctor::all()),
                'color' => 'bg-orange-darken-3',
                'icon' => asset("imgs/medical_team.png"),
                "url" => "doctors.index"
            ];
        }
        if (in_array('pacientes.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Pacientes',
                'cantidad' => count(Doctor::all()),
                'color' => 'bg-cyan-darken-2',
                'icon' => asset("imgs/teamwork.png"),
                "url" => "pacientes.index"
            ];
        }
        if (in_array('diagnosticos.index', self::$permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Diagnósticos por Imágenes',
                'cantidad' => count(Doctor::all()),
                'color' => 'bg-grey-darken-2',
                'icon' => asset("imgs/icon_inscripcion.png"),
                "url" => "diagnosticos.index"
            ];
        }


        return $array_infos;
    }
}
