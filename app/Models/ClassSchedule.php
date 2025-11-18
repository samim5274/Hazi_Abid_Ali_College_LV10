<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassSchedule extends Model
{
    use HasFactory;

    protected $fillable = [
        'class_id', 'period', 'start_time', 'end_time', 'teacher_id', 'subject_id', 'day'
    ];

    public function teacher() {
        return $this->belongsTo(Teacher::class);
    }

    public function subject() {
        return $this->belongsTo(Subject::class);
    }

    public function classRoom() {
        return $this->belongsTo(Room::class, 'class_id');
    }
}
