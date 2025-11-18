<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Student extends Authenticatable
{
    use HasFactory;


    protected $fillable = [
        'first_name',
        'last_name',
        'dob',
        'gender',
        'blood_group',
        'religion',
        'nationality',
        'national_id',
        'contact_number',
        'email',
        'password',
        'address1',
        'address2',

        'father_name',
        'father_profession',
        'father_contact',
        'father_email',
        'father_nid',

        'mother_name',
        'mother_profession',
        'mother_contact',
        'mother_email',
        'mother_nid',

        'guardian_name',
        'guardian_contact',
        'guardian_email',
        'guardian_nid',
        'guardian_relationship',

        'status',
        'roll_number',
        'class_id',
        'attend_date',
        'remark',

        'photo',
        'father_photo',
        'mother_photo',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'dob' => 'date',
        'attend_date' => 'date',
    ];

    public function room()
    {
        return $this->belongsTo(Room::class, 'class_id', 'id');
    }

    public function attend(){
        return $this->hasMany(Attendance::class, 'student_id', 'id');
    }

    public function subjects(): BelongsToMany
    {
        return $this->belongsToMany(Subject::class, 'student_subjects', 'student_id', 'subject_id');
    }

    public function results()
    {
        return $this->hasMany(Mark::class, 'student_id');
    }

}
