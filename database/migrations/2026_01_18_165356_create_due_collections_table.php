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
        Schema::create('due_collections', function (Blueprint $table) {
            $table->id();
            $table->string('receipt_no')->unique();
            $table->string('invoice_no')->unique();

            $table->foreignId('student_id')->constrained('students')->onDelete('restrict');
            $table->foreignId('user_id')->constrained('teachers')->onDelete('restrict');

            // Due tracking
            $table->decimal('previous_due', 10, 2);     // due before this collection
            $table->decimal('paid_amount', 10, 2);      // collected now
            $table->decimal('remaining_due', 10, 2);    // due after collection

            // Date & method
            $table->date('collection_date');
            $table->string('payment_method')->nullable();
            $table->text('remarks')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('due_collections');
    }
};
