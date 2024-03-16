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
        Schema::create('historial_pacientes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("paciente_id");
            $table->date("fecha_pc");
            $table->string("meses_dpc");
            $table->string("mamografia_aa");
            $table->string("biopsias_mp");
            $table->string("hiperplasia_a");
            $table->string("cancer_mp");
            $table->string("lado_ta");
            $table->string("cancer_olc");
            $table->string("parientes_pgcm");
            $table->string("otros_pccm");
            $table->string("parientes_cco");
            $table->string("parientes_ccc");
            $table->string("parientes_cce");
            $table->string("parientes_cotc");
            $table->date("fecha_registro");
            $table->timestamps();

            $table->foreign("paciente_id")->on("pacientes")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('historial_pacientes');
    }
};
