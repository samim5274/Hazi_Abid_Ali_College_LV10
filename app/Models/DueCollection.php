<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DueCollection extends Model
{
    use HasFactory;

    protected $fillable = [
        'receipt_no',
        'invoice_no',
        'student_id',
        'user_id',
        'previous_due',
        'paid_amount',
        'remaining_due',
        'collection_date',
        'payment_method',
        'remarks',
    ];

    /**
     * Casts
     */
    protected $casts = [
        'collection_date' => 'date',
        'previous_due'    => 'decimal:2',
        'paid_amount'     => 'decimal:2',
        'remaining_due'   => 'decimal:2',
    ];

    // Student
    public function student()
    {
        return $this->belongsTo(Student::class, 'student_id');
    }

    // Collected by (Teacher/User)
    public function user()
    {
        return $this->belongsTo(Teacher::class, 'user_id');
    }
}
