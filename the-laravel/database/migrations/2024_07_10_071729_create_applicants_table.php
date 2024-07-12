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

        Schema::create('applicants', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('username', 255)->unique();
            $table->string('firstname', 255);
            $table->string('lastname', 255);
            $table->string('school_registration_number', 255)->nullable();
            $table->string('email', 255);
            $table->date('date_of_birth');
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
        Schema::dropIfExists('applicants');
    }
};
