<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentDailyRoutine extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'student_id',
        'time_to_awake',
        'attendance_in_college',
        'arrival_in_residence',
        'prayer',
        'morning_activity',
        'evening_activity',
        'night_activity',
        'time_to_bed',
        'total_hours',
        'remark',
    ];

    // Relationship with Student
    public function student()
    {
        return $this->belongsTo(Student::class, 'student_id');
    }
}
