<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mark extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id', 
        'subject_id', 
        'exam_id', 
        'marks_obtained', 
        'grade', 
        'gpa', 
        'remarks'
    ];

    protected static function booted()
    {
        static::saving(function ($result) {
            $objective = $result->marks_objective ?? 0;
            $theory    = $result->marks_theury ?? 0;

            $result->marks_obtained = $objective + $theory;
        });
    }

    public function student()
    {
        return $this->belongsTo(Student::class, 'student_id');
    }

    public function subject()
    {
        return $this->belongsTo(Subject::class, 'subject_id');
    }

    public function exam()
    {
        return $this->belongsTo(Exam::class, 'exam_id');
    }
}
