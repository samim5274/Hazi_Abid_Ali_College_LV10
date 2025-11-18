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
        Schema::create('fee_payments', function (Blueprint $table) {
            $table->id();

            $table->foreignId('student_id')->constrained('students')->onDelete('restrict');
            $table->foreignId('fee_structure_id')->constrained('fee_structures')->onDelete('restrict');

            $table->decimal('amount_paid', 10, 2)->default(0);
            $table->decimal('discount', 10, 2)->default(0);
            $table->decimal('due_amount', 10, 2)->default(0);

            $table->date('payment_date');
            $table->integer('month');
            $table->integer('year');

            $table->string('payment_method')->default('Cash');
            $table->string('status')->default('Pending');
            $table->string('receipt_no')->nullable();
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fee_payments');
    }
};
