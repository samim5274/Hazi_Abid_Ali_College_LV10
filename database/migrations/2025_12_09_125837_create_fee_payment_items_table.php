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
        Schema::create('fee_payment_items', function (Blueprint $table) {
            $table->id();

            $table->foreignId('fee_payment_id')->constrained('fee_payment_details')->onDelete('restrict');
            $table->foreignId('student_id')->constrained('students')->onDelete('restrict');
            $table->foreignId('fee_structure_id')->constrained('fee_structures')->onDelete('restrict');

            $table->decimal('amount', 10, 2);
            $table->decimal('paid', 10, 2);     // paid for this item
            $table->decimal('discount', 10, 2)->default(0);
            $table->decimal('due', 10, 2)->default(0);
            $table->date('payment_date');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fee_payment_items');
    }
};
