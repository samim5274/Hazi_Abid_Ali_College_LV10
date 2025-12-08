<?php

namespace App\Http\Controllers\Enrollment;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Company;
use App\Models\StudentSubject;

class EntrollmentController extends Controller
{
    
    public function enrollmentClass(){
        $company = Company::first();
        $classes = Room::with('teachers')->get();        
        return view('subject.enrollment', compact('classes','company'));
    }

    public function enrollmentClassStudent($class){
        $company = Company::first();
        $students = Student::where('class_id', $class)->where('status', 1)->get();
        return view('subject.enrollment-class-student', compact('students', 'class','company'));
    }

    public function enClaStdSubject($class, $student){
        $company = Company::first();
        $subjects = Subject::where('class_id', $class)->get();
        $students = Student::where('id', $student)->first();
        $enrollmented = StudentSubject::where('student_id', $student)->get();
        return view('subject.enrollment-class-student-subject', compact('subjects','student', 'students', 'class','enrollmented','company'));
    }

    public function enrollment(Request $request ,$class, $student, $subject){
        $validatedData = $request->validate([
            'studentId' => ['required', 'integer', 'exists:students,id'],
            'subjectId' => ['required', 'integer', 'exists:subjects,id'],
        ]);

        $studnetId = $request->input('studentId', '');
        $subjectId = $request->input('subjectId', '');

        // un-enrollment code here
        if ($request->has('delete')) {
            $findData = StudentSubject::where('student_id', $studnetId)->where('subject_id', $subjectId)->first();
            if($findData){
                $findData->delete();
                return redirect()->back()->with('success', 'Student un-enrollment successfully!');
            }
        }

        $findData = StudentSubject::where('student_id', $studnetId)->where('subject_id', $subjectId)->first();
        if($findData){
            return redirect()->back()->with('warning', 'Student already enrolled in the subject!');
        }

        $subStd = new StudentSubject();
        $subStd->student_id = $studnetId;
        $subStd->subject_id = $subjectId;
        $subStd->save();
        return redirect()->back()->with('success', 'Student successfully enrolled in the subject!');
    }
}
