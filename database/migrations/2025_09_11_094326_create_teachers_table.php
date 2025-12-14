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
        Schema::create('teachers', function (Blueprint $table) {
            $table->id();
            $table->string('first_name');
            $table->string('last_name');
            $table->date('dob')->nullable();
            $table->string('gender')->nullable();
            $table->string('blood_group')->nullable();
            $table->string('national_id')->unique();
            $table->string('contact_number')->nullable();
            $table->string('email')->unique();
            $table->string('password')->nullable();
            $table->string('designation')->nullable();
            $table->text('address')->nullable();

            $table->string('father_name')->nullable();
            $table->string('father_contact')->nullable();
            $table->string('mother_name')->nullable();
            $table->string('mother_contact')->nullable();

            $table->string('guardian_name')->nullable();
            $table->string('guardian_contact')->nullable();
            $table->string('guardian_relationship')->nullable();

            $table->string('photo')->nullable();
            $table->string('father_photo')->nullable();
            $table->string('mother_photo')->nullable();

            $table->date('joning_date')->nullable();
            $table->date('mop_date')->nullable();
            $table->string('traning')->nullable();
            $table->string('index_no')->nullable();

            $table->string('role')->default('Admin');

            // System Info
            $table->integer('status')->default(1); // Active by default
            $table->string('remark')->nullable();
            
            $table->timestamp('email_verified_at')->nullable();
            $table->timestamp('last_login_at')->nullable();
            $table->string('last_login_ip')->nullable();
            $table->boolean('is_profile_completed')->default(false);

            $table->string('otp')->nullable();
            $table->timestamp('otp_expires_at')->nullable();
            
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('teachers');
    }
};
