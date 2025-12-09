<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FeePaymentItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'fee_payment_id',
        'student_id',
        'fee_structure_id',

        'amount',
        'paid',
        'discount',
        'due',
    ];

    public function payment()
    {
        return $this->belongsTo(feePaymentDetails::class, 'fee_payment_id');
    }

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function feeStructure()
    {
        return $this->belongsTo(FeeStructure::class);
    }
}
