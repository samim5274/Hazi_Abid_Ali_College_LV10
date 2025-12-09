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
        Schema::create('fee_payment_details', function (Blueprint $table) {
            $table->id();

            $table->foreignId('student_id')->constrained('students')->onDelete('restrict');
            $table->foreignId('user_id')->constrained('teachers')->onDelete('restrict');

            $table->decimal('total_amount', 10, 2);
            $table->decimal('total_paid', 10, 2);
            $table->decimal('total_discount', 10, 2)->default(0);
            $table->decimal('total_due', 10, 2);

            $table->date('payment_date');
            $table->string('month', 2);
            $table->string('year', 4);

            $table->string('payment_method');
            $table->string('status'); // Paid | Partial | Due

            $table->string('receipt_no')->unique();
            $table->string('invoice_no')->unique();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fee_payment_details');
    }
};
