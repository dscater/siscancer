<?php

use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\DiagnosticoController;
use App\Http\Controllers\DoctorController;
use App\Http\Controllers\EntrenamientoController;
use App\Http\Controllers\EntrenamientoImagenController;
use App\Http\Controllers\HistorialArchivoController;
use App\Http\Controllers\HistorialPacienteController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\InstitucionController;
use App\Http\Controllers\MaquinariaController;
use App\Http\Controllers\MaterialController;
use App\Http\Controllers\ObraController;
use App\Http\Controllers\OperarioController;
use App\Http\Controllers\PacienteController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });

Route::get('/', function () {
    if (Auth::check()) {
        return redirect()->route('inicio');
    }
    return Inertia::render('Auth/Login');
});

Route::get("institucions/getInstitucion", [InstitucionController::class, 'getInstitucion'])->name("institucions.getInstitucion");

Route::middleware('auth')->group(function () {
    // BORRAR
    Route::get('/vuetify', function () {
        return Inertia::render('Vuetify/Index');
    })->name("vuetify");

    // INICIO
    Route::get('/inicio', [InicioController::class, 'inicio'])->name('inicio');
    Route::get("/inicio/getMaximoImagenes", [InicioController::class, 'getMaximoImagenes'])->name("entrenamientos.getMaximoImagenes");

    // INSTITUCION
    Route::resource("institucions", InstitucionController::class)->only(
        ["index", "show", "update"]
    );

    // USUARIO
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::patch('/profile/update_foto', [ProfileController::class, 'update_foto'])->name('profile.update_foto');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get("/getUser", [UserController::class, 'getUser'])->name('users.getUser');
    Route::get("/permisos", [UserController::class, 'permisos']);
    Route::get("/menu_user", [UserController::class, 'permisos']);

    // USUARIOS
    Route::put("/usuarios/password/{user}", [UsuarioController::class, 'actualizaPassword'])->name("usuarios.password");
    Route::put("/usuarios/password/doctor/{user}", [UsuarioController::class, 'actualizaPasswordDoctor'])->name("usuarios.actualizaPasswordDoctor");
    Route::get("/usuarios/paginado", [UsuarioController::class, 'paginado'])->name("usuarios.paginado");
    Route::get("/usuarios/listado", [UsuarioController::class, 'listado'])->name("usuarios.listado");
    Route::get("/usuarios/listado/byTipo", [UsuarioController::class, 'byTipo'])->name("usuarios.byTipo");
    Route::get("/usuarios/show/{user}", [UsuarioController::class, 'show'])->name("usuarios.show");
    Route::put("/usuarios/update/{user}", [UsuarioController::class, 'update'])->name("usuarios.update");
    Route::delete("/usuarios/{user}", [UsuarioController::class, 'destroy'])->name("usuarios.destroy");
    Route::resource("usuarios", UsuarioController::class)->only(
        ["index", "store"]
    );

    // DOCTORES
    Route::get("/doctors/paginado", [DoctorController::class, 'paginado'])->name("doctors.paginado");
    Route::get("/doctors/listado", [DoctorController::class, 'listado'])->name("doctors.listado");
    Route::resource("doctors", DoctorController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // PACIENTES
    Route::get("/pacientes/paginado", [PacienteController::class, 'paginado'])->name("pacientes.paginado");
    Route::get("/pacientes/listado", [PacienteController::class, 'listado'])->name("pacientes.listado");
    Route::resource("pacientes", PacienteController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // HISTORIAL DE PACIENTES
    Route::get("/historial_pacientes/paginado", [HistorialPacienteController::class, 'paginado'])->name("historial_pacientes.paginado");
    Route::get("/historial_pacientes/listado", [HistorialPacienteController::class, 'listado'])->name("historial_pacientes.listado");
    Route::resource("historial_pacientes", HistorialPacienteController::class)->only(
        ["index", "create", "store", "edit", "update", "show", "destroy"]
    );

    // HISTORIAL ARCHIVOS
    Route::delete("/historial_archivos/{historial_archivo}", [HistorialArchivoController::class, 'destroy'])->name("historial_archivos.destroy");

    // DIAGNOSTICOS
    Route::get("/diagnosticos/paginado", [DiagnosticoController::class, 'paginado'])->name("diagnosticos.paginado");
    Route::get("/diagnosticos/listado", [DiagnosticoController::class, 'listado'])->name("diagnosticos.listado");
    Route::post("/diagnosticos/procesarImagen", [DiagnosticoController::class, 'procesarImagen'])->name("diagnosticos.procesarImagen");
    Route::resource("diagnosticos", DiagnosticoController::class)->only(
        ["index", "create", "store", "edit", "update", "show", "destroy"]
    );

    // ENTRENAMIENTO IMAGENES
    Route::delete("/entrenamiento_imagens/{entrenamiento_imagen}", [EntrenamientoImagenController::class, 'destroy'])->name("entrenamiento_imagens.destroy");

    // ENTRENAMIENTOS
    Route::get("/entrenamientos/getTiposDiagnosticos", [EntrenamientoController::class, 'getTiposDiagnosticos'])->name("entrenamientos.getTiposDiagnosticos");
    Route::get("/entrenamientos/paginado", [EntrenamientoController::class, 'paginado'])->name("entrenamientos.paginado");
    Route::get("/entrenamientos/listado", [EntrenamientoController::class, 'listado'])->name("entrenamientos.listado");
    Route::post("/entrenamientos/procesarImagen", [EntrenamientoController::class, 'procesarImagen'])->name("entrenamientos.procesarImagen");
    Route::resource("entrenamientos", EntrenamientoController::class)->only(
        ["index", "create", "store", "edit", "update", "show", "destroy"]
    );

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");

    Route::get('reportes/pacientes', [ReporteController::class, 'pacientes'])->name("reportes.pacientes");
    Route::get('reportes/r_pacientes', [ReporteController::class, 'r_pacientes'])->name("reportes.r_pacientes");

    Route::get('reportes/historial_pacientes', [ReporteController::class, 'historial_pacientes'])->name("reportes.historial_pacientes");
    Route::get('reportes/r_historial_pacientes', [ReporteController::class, 'r_historial_pacientes'])->name("reportes.r_historial_pacientes");

    Route::get('reportes/diagnosticos', [ReporteController::class, 'diagnosticos'])->name("reportes.diagnosticos");
    Route::get('reportes/r_diagnosticos', [ReporteController::class, 'r_diagnosticos'])->name("reportes.r_diagnosticos");
});

require __DIR__ . '/auth.php';
