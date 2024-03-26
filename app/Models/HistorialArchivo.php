<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistorialArchivo extends Model
{
    use HasFactory;

    protected $fillable = [
        "historial_paciente_id",
        "archivo",
    ];

    public function historial_paciente()
    {
        return $this->belongsTo(HistorialPaciente::class, 'historial_paciente_id');
    }
}
