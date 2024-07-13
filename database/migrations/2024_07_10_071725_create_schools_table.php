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

        Schema::create('schools', function (Blueprint $table) {
            $table->integer('id')->primary()->autoIncrement();
            $table->string('name', 255);
            $table->string('district', 255);
            $table->string('school_registration_number', 255)->unique();
            $table->string('representative_email', 255);
            $table->foreign('representative_email')->references('email')->on('school_representatives');
            $table->string('representative_name', 255);
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
        Schema::dropIfExists('schools');
    }
};
