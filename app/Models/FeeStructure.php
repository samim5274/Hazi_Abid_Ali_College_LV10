<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FeeStructure extends Model
{
    use HasFactory;

    protected $fillable = [
        'class_id',
        'fee_cat_id',
        'amount',
        'due_date',
    ];

    public function room()
    {
        return $this->belongsTo(Room::class, 'class_id'); // class/room relation
    }

    public function category()
    {
        return $this->belongsTo(FeeCategory::class, 'fee_cat_id'); // fee category relation
    }

    public function payments()
    {
        return $this->hasMany(FeePayment::class, 'fee_structure_id'); // related payments
    }
}
