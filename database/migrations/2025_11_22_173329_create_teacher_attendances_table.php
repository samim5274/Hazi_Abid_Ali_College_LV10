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
        Schema::create('teacher_attendances', function (Blueprint $table) {
            $table->id();
            $table->foreignId('teacher_id')->constrained('teachers')->onDelete('restrict');
            $table->date('attendance_date');
            $table->time('attendance_time');
            $table->enum('status', ['present','absent'])->default('present');
            $table->string('ip_address', 45)->nullable();
            $table->string('browser', 255)->nullable();
            $table->string('device', 255)->nullable();
            $table->string('location', 255)->nullable();
            $table->timestamps();

            $table->unique(['teacher_id','attendance_date']); // avoid duplicate attendance for same day
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('teacher_attendances');
    }
};
