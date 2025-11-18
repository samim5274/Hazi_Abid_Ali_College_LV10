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
        Schema::create('class_schedules', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('class_id');
            $table->unsignedBigInteger('period');   // 1-8
            $table->time('start_time');
            $table->time('end_time');
            $table->unsignedBigInteger('teacher_id');
            $table->unsignedBigInteger('subject_id');
            $table->string('day'); // Monday, Tuesday...
            $table->timestamps();

            // Foreign keys
            $table->foreign('class_id')->references('id')->on('rooms')->onDelete('restrict');
            $table->foreign('teacher_id')->references('id')->on('teachers')->onDelete('restrict');
            $table->foreign('subject_id')->references('id')->on('subjects')->onDelete('restrict');

            // Unique constraints
            $table->unique(['class_id','day','period'], 'class_period_unique');  // Class cannot have 2 subjects same period/day
            $table->unique(['teacher_id','day','period'], 'teacher_period_unique'); // Teacher cannot teach 2 classes same period/day
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('class_schedules');
    }
};
