<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Subject extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 
        'class_id'
    ];

    public function room(){
        return $this->belongsTo(Room::class, 'class_id');
    }

    public function students(): BelongsToMany
    {
        return $this->belongsToMany(Student::class, 'student_subjects', 'subject_id', 'student_id');
    }

    public function results()
    {
        return $this->hasMany(Mark::class, 'subject_id');
    }

    public function classSchedule() {
        return $this->hasMany(ClassSchedule::class);
    }

}
