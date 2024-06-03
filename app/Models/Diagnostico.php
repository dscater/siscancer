<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Diagnostico extends Model
{
    use HasFactory;

    protected $fillable = [
        "paciente_id",
        "imagen1",
        "imagen2",
        "diagnostico",
        "descripcion",
        "fecha_diagnostico",
        "fecha_registro",
    ];

    protected $appends = ["url_imagen1", "url_imagen2", "fecha_diagnostico_t", "fecha_registro_t"];

    public function getFechaDiagnosticoTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_diagnostico));
    }

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function getUrlImagen1Attribute()
    {
        return asset("imgs/diagnosticos/" . $this->imagen1) . '?p=' . random_int(199, 1000);
    }

    public function getUrlImagen2Attribute()
    {
        return asset("imgs/diagnosticos/" . $this->imagen2) . '?p=' . random_int(199, 1000);
    }

    public function paciente()
    {
        return $this->belongsTo(Paciente::class, 'paciente_id');
    }
}
