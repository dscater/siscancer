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

    protected $appends = ["url_archivo", "thumb"];

    public function getThumbAttribute()
    {
        $array_archivo = explode(".", $this->archivo);
        $extension = $array_archivo[1];

        $imagenes = ["jpg", "jpeg", "png", "webp", "gif", "jfif"];

        if (in_array($extension, $imagenes)) {
            return asset("files/" . $this->archivo);
        }
        return asset("imgs/attach.png");
    }


    public function getUrlArchivoAttribute()
    {
        return asset("files/" . $this->archivo);
    }

    public function historial_paciente()
    {
        return $this->belongsTo(HistorialPaciente::class, 'historial_paciente_id');
    }
}
