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

        Schema::create('participant_attempts', function (Blueprint $table) {
            $table->id();
            $table->integer('participant_id');
            $table->foreign('participant_id')->references('id')->on('participants');
            $table->integer('challenge_id');
            $table->foreign('challenge_id')->references('id')->on('challenges');
            $table->integer('question_id');
            $table->foreign('question_id')->references('id')->on('questions');
            $table->integer('attempt_number');
            $table->boolean('is_correct');
            $table->integer('score');
            $table->integer('time_taken');
            $table->timestamp('attempt_date')->nullable()->useCurrent();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrent();
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('participant_attempts');
    }
};
