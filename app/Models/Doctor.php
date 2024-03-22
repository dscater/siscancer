<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "fecha_nac",
        "estado_civil",
        "sexo",
        "especialidad",
        "fono2",
    ];

    protected $appends = ["mas"];

    public function getMasAttribute()
    {
        return false;
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
