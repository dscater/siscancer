<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistorialPaciente extends Model
{
    use HasFactory;

    protected $fillable = [
        "paciente_id",
        "fecha_pc",
        "meses_dpc",
        "mamografia_aa",
        "biopsias_mp",
        "hiperplasia_a",
        "cancer_mp",
        "lado_ta",
        "cancer_olc",
        "parientes_pgcm",
        "otros_pccm",
        "parientes_cco",
        "parientes_ccc",
        "parientes_cce",
        "parientes_cotc",
        "fecha_registro",
    ];


    protected $appends = ["fecha_registro_t", "fecha_pc_t", "mas"];

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function getFechaPcTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_pc));
    }

    public function getMasAttribute()
    {
        return false;
    }

    public function paciente()
    {
        return $this->belongsTo(Paciente::class, 'paciente_id');
    }

    public function historial_archivos()
    {
        return $this->hasMany(HistorialArchivo::class, 'historial_paciente_id');
    }
}
