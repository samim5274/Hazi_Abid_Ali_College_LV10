<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use App\Models\Student;
use App\Models\Room;
use App\Models\Subject;
use App\Models\Mark;

class StudentReportController extends Controller
{
    public function genderReport(){
        $findData = Student::paginate(45);
        $classes = Room::all();
        $students = Student::all();
        $allProfessions = Student::select('father_profession')->distinct()->orderBy('father_profession')->get();
        return view('student.report.student-report', compact('findData','classes', 'students','allProfessions'));
    }

    public function findGenderReport(Request $request){
        $classes = Room::all();
        $students = Student::all();

        $query = Student::query();

        if ($request->filled('gender_id')) {
            $query->where('gender', $request->gender_id);
        }

        if ($request->filled('class_id')) {
            $query->where('class_id', $request->class_id);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('religion')) {
            $query->where('religion', $request->religion);
        }

        if ($request->filled('blood_group')) {
            $query->where('blood_group', $request->blood_group);
        }

        if ($request->filled('Father_profession')) {
            $query->where('father_profession', $request->Father_profession);
        }

        $findData = $query->paginate(45)->appends($request->all());
        $allProfessions = Student::select('father_profession')->distinct()->orderBy('father_profession')->get();

        return view('student.report.student-report', compact('findData', 'classes', 'students','allProfessions'));
    }
}