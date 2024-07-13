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
        Schema::disableForeignKeyConstraints();

        Schema::create('challenge_questions', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('challenge_id');
            $table->foreign('challenge_id')->references('id')->on('challenges');
            $table->integer('question_id');
            $table->foreign('question_id')->references('id')->on('questions');
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('challenge_questions');
    }
};
