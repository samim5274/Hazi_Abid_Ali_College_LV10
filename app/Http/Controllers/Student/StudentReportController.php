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
use App\Models\StudentDailyRoutine;
use App\Models\Company;

class StudentReportController extends Controller
{
    public function genderReport(){
        $company = Company::first();
        $classes = Room::select('id','name','section')->get();

        // 🔹 Paginated students with room
        $students = Student::with('room:id,name,section')->paginate(45);

        // 🔹 Distinct father professions for filter
        $allProfessions = Student::select('father_profession')
            ->distinct()
            ->orderBy('father_profession')
            ->get();

        return view(
            'student.report.student-report',
            compact('students','classes','allProfessions','company')
        );
        
    }

    public function findGenderReport(Request $request){
        $company = Company::first();

        $classes = Room::select('id','name','section')->get();

        $query = Student::with('room:id,name,section');

        // 🔹 Apply filters
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

        // 🔹 Paginate filtered data
        $students = $query->paginate(45)->appends($request->all());

        // 🔹 Distinct father professions for filter
        $allProfessions = Student::select('father_profession')
            ->distinct()
            ->orderBy('father_profession')
            ->get();

        return view(
            'student.report.student-report',
            compact('students','classes','allProfessions','company')
        );
    }

    public function studentDailyReport(){
        $routine = StudentDailyRoutine::get();
        $classes = Room::select('id','name','section')->get();
        $company = Company::first();
        return view('student.report.student-daily-report', compact('routine','classes','company'));
    }

    public function getStudents($class_id){
        $students = Student::where('class_id', $class_id)->where('status', 1)->select('id', 'first_name', 'last_name')->get();
        return response()->json($students);
    }

    public function findStudentDailyReport(Request $request){
        $company = Company::first();

        $classes = Room::select('id','name','section')->get();

        $query = StudentDailyRoutine::query();

        if ($request->filled('student_id')) {
            $query->where('student_id', $request->student_id);
        }

        if ($request->filled('from_date') && $request->filled('to_date')) {

            $query->whereBetween('date', [
                $request->from_date,
                $request->to_date
            ]);

        } elseif ($request->filled('from_date')) {
            $query->where('date', '>=', $request->from_date);
        } elseif ($request->filled('to_date')) {
            $query->where('date', '<=', $request->to_date);
        }

        $routine = $query->orderBy('date', 'desc')->get();

        return view('student.report.student-daily-report', compact('routine','classes','company'));
    }
}