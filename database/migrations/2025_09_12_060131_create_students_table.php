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
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->string('first_name');
            $table->string('last_name');
            $table->date('dob')->nullable();
            $table->string('gender')->nullable();
            $table->string('blood_group')->nullable();

            $table->string('religion')->nullable();
            $table->string('nationality')->nullable();

            $table->string('national_id')->nullable();
            $table->string('contact_number')->nullable();
            $table->string('email')->unique()->nullable();
            $table->string('password')->nullable();

            $table->text('address1')->nullable();
            $table->text('address2')->nullable();
            
            $table->string('father_name')->nullable();
            $table->string('father_profession')->nullable();
            $table->string('father_contact')->nullable();
            $table->string('father_email')->nullable();
            $table->string('father_nid')->nullable();

            $table->string('mother_name')->nullable();
            $table->string('mother_profession')->nullable();
            $table->string('mother_contact')->nullable();
            $table->string('mother_email')->nullable();
            $table->string('mother_nid')->nullable();

            $table->string('guardian_name')->nullable();
            $table->string('guardian_contact')->nullable();
            $table->string('guardian_email')->nullable();
            $table->string('guardian_nid')->nullable();
            $table->string('guardian_relationship')->nullable();
            
            $table->integer('status')->default(1);
            $table->integer('roll_number')->default(1);
            $table->foreignId('class_id')->constrained('rooms')->onDelete('restrict');
            $table->date('attend_date')->nullable();
            $table->string('remark')->nullable();

            $table->string('photo')->nullable();
            $table->string('father_photo')->nullable();
            $table->string('mother_photo')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
