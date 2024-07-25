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

        Schema::create('participants', function (Blueprint $table) {
            $table->id();
            $table->string('username', 255)->unique();
            $table->string('firstname', 255);
            $table->string('lastname', 255);
            $table->string('school_registration_number', 255)->nullable();
            $table->foreign('school_registration_number')->references('school_registration_number')->on('schools');
            $table->string('email', 255);
            $table->date('date_of_birth');
            $table->string('status', 255)->default('confirmed');
            $table->string('password', 255);
            $table->integer('image')->nullable();
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
        Schema::dropIfExists('participants');
    }
};
