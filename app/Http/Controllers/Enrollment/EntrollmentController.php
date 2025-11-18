<?php

namespace App\Http\Controllers\Enrollment;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\StudentSubject;

class EntrollmentController extends Controller
{
    
    public function enrollmentClass(){
        $classes = Room::with('teachers')->get();        
        return view('subject.enrollment', compact('classes'));
    }

    public function enrollmentClassStudent($class){
        $students = Student::where('class_id', $class)->get();
        return view('subject.enrollment-class-student', compact('students', 'class'));
    }

    public function enClaStdSubject($class, $student){
        $subjects = Subject::where('class_id', $class)->get();
        $students = Student::where('id', $student)->first();
        $enrollmented = StudentSubject::where('student_id', $student)->get();
        return view('subject.enrollment-class-student-subject', compact('subjects','student', 'students', 'class','enrollmented'));
    }

    public function enrollment(Request $request ,$class, $student, $subject){
        $validatedData = $request->validate([
            'studentId' => ['required', 'integer', 'exists:students,id'],
            'subjectId' => ['required', 'integer', 'exists:subjects,id'],
        ]);

        $studnetId = $request->input('studentId', '');
        $subjectId = $request->input('subjectId', '');

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
