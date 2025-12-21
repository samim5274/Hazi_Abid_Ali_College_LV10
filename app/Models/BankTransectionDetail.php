<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BankTransectionDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'bank_id',
        'user_id',
        'amount',
        'date',
        'status',
        'remarks',
    ];

    public function bank()
    {
        return $this->belongsTo(BankDetail::class, 'bank_id');
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'user_id');
    }
}
