<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class feePaymentDetails extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'user_id',
        
        'total_amount',
        'total_paid',
        'total_discount',
        'total_due',

        'payment_date',
        'month',
        'year',

        'payment_method',
        'status',

        'receipt_no',
        'invoice_no',
    ];

    protected $casts = [
        'payment_date' => 'date',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class, 'student_id');
    }

    public function teacher(){
        return $this->belongsTo(Teacher::class, 'user_id');
    }

    public function items()
    {
        return $this->hasMany(FeePaymentItem::class, 'fee_payment_id');
    }
}
