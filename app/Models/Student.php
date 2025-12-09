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
        'father_monthly_income',

        'mother_name',
        'mother_profession',
        'mother_contact',
        'mother_email',
        'mother_nid',
        'mother_monthly_income',

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

        'b_reg_no',
        'b_roll_no',

        'photo',
        'father_photo',
        'mother_photo',

        'otp',
        'otp_expires_at',
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

    public function rotine()
    {
        return $this->hasMany(StudentDailyRoutine::class, 'student_id');
    }

    public function payments()
    {
        return $this->hasMany(FeePaymentDetails::class);
    }

    public function paymentItems()
    {
        return $this->hasMany(FeePaymentItem::class);
    }

}
