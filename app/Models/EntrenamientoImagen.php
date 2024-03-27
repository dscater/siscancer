<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EntrenamientoImagen extends Model
{
    use HasFactory;

    protected $fillable = [
        "entrenamiento_id",
        "imagen",
    ];

    protected $appends = ["url_imagen", "url_file", "name"];

    public function getNameAttribute()
    {
        return $this->imagen;
    }

    public function getUrlFileAttribute()
    {
        return asset("imgs/entrenamientos/" . $this->imagen);
    }

    public function getUrlImagenAttribute()
    {
        return asset("imgs/entrenamientos/" . $this->imagen);
    }

    public function entrenamiento()
    {
        return $this->belongsTo(Entrenamiento::class, 'entrenamiento_id');
    }
}
