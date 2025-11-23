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
        Schema::create('student_daily_routines', function (Blueprint $table) {
            $table->id();

            $table->date('date'); // date of record
            $table->foreignId('student_id')->constrained('students')->onDelete('restrict');
            
            $table->time('time_to_awake')->nullable();
            $table->boolean('attendance_in_college')->nullable();
            $table->string('arrival_in_residence')->nullable();
            $table->string('prayer')->nullable();
            $table->string('morning_activity')->nullable();
            $table->string('evening_activity')->nullable();
            $table->string('night_activity')->nullable();
            $table->time('time_to_bed')->nullable();
            $table->integer('total_hours')->nullable();
            $table->string('remark')->default('N/A');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('student_daily_routines');
    }
};
