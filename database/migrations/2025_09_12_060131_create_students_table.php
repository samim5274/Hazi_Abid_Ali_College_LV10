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

            $table->string('admission_no')->unique()->nullable();
            $table->date('admission_date')->nullable();
            $table->string('section')->nullable();
            $table->string('group')->nullable(); // Science / Arts / Commerce
            $table->string('session_year')->nullable(); // 2024–2025
            $table->string('previous_school')->nullable();
            
            $table->string('father_name')->nullable();
            $table->string('father_profession')->nullable();
            $table->string('father_contact')->nullable();
            $table->string('father_email')->nullable();
            $table->string('father_nid')->nullable();
            $table->string('father_monthly_income')->nullable();

            $table->string('mother_name')->nullable();
            $table->string('mother_profession')->nullable();
            $table->string('mother_contact')->nullable();
            $table->string('mother_email')->nullable();
            $table->string('mother_nid')->nullable();
            $table->string('mother_monthly_income')->nullable();

            $table->string('guardian_name')->nullable();
            $table->string('guardian_contact')->nullable();
            $table->string('guardian_email')->nullable();
            $table->string('guardian_nid')->nullable();
            $table->string('guardian_relationship')->nullable();
            
            $table->integer('status')->default(1);
            $table->integer('roll_number')->default(0);
            $table->foreignId('class_id')->constrained('rooms')->onDelete('restrict');
            $table->date('attend_date')->nullable();
            $table->string('remark')->nullable();
            
            $table->bigInteger('b_reg_no')->nullable()->unique();
            $table->bigInteger('b_roll_no')->nullable()->unique();

            $table->string('photo')->nullable();
            $table->string('father_photo')->nullable();
            $table->string('mother_photo')->nullable();

            $table->string('otp')->nullable();
            $table->timestamp('otp_expires_at')->nullable();

            $table->timestamp('email_verified_at')->nullable();
            $table->timestamp('last_login_at')->nullable();
            $table->string('last_login_ip')->nullable();
            $table->boolean('is_profile_completed')->default(false);
            
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
