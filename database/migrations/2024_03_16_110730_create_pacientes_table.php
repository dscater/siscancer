<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pacientes', function (Blueprint $table) {
            $table->id();
            $table->string("nombre", 155);
            $table->string("paterno", 155);
            $table->string("materno", 155)->nullable();
            $table->string("ci", 155);
            $table->string("ci_exp", 155);
            $table->date("fecha_nac");
            $table->string("sexo", 155);
            $table->string("estado_civil");
            $table->string("ocupacion", 255);
            $table->string("correo", 255)->nullable();
            $table->string("cel");
            $table->string("cel_familiar");
            $table->string("dir_trabajo", 255)->nullable();
            $table->string("dir_domicilio", 255)->nullable();
            $table->string("foto", 255)->nullable();
            $table->date("fecha_registro");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pacientes');
    }
};
