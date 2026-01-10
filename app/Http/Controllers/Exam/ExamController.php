<?php

namespace App\Http\Controllers\Exam;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use Auth;
use App\Models\Room;
use App\Models\Company;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\StudentSubject;
use App\Models\ExamName;

class ExamController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function viewExam(){
        $company = Company::first();
        $exams = Exam::with('room', 'subject')->orderBy('date', 'asc')->get();
        $subjects = Subject::all();
        $rooms = Room::with('teachers')->get();
        $examName = ExamName::all();
        return view('exam.exam-list', compact('subjects', 'rooms', 'exams','examName','company'));
    }

    public function addExam(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'class_id' => 'required|exists:rooms,id',
            'subject_id' => 'required|exists:subjects,id',
            'max_marks' => 'required|numeric',
        ]);

        $exists = Exam::where('name', $request->name)->where('date', $request->date)->where('class_id', $request->class_id)->where('subject_id', $request->subject_id)->exists();

        if ($exists) {
            return redirect()->back()->with('warning', 'This exam already exists for this date, class and subject. Please try another!');
        }

        $exists = Exam::where('class_id', $request->class_id)
            ->where('subject_id', $request->subject_id)
            ->where('date', $request->date) 
            ->exists();

        if ($exists) {
            return redirect()->back()->with('warning', 'This subject already has an exam in this class. Duplicate not allowed!');
        }

        $exam = new Exam();
        // Exam Info
        $exam->name       = $request->name;
        $exam->date       = $request->date;
        $exam->class_id   = $request->class_id;
        $exam->subject_id = $request->subject_id;
        $exam->max_marks  = $request->max_marks;

        $exam->save();

        return redirect()->back()->with('success', 'Exam added successfully!');
    }

    public function modifyExam(Request $request, $exam_id){
        $request->validate([
            'name' => 'required|string|max:255',
            'class_id' => 'required|exists:rooms,id',
            'subject_id' => 'required|exists:subjects,id',
            'max_marks' => 'required|numeric',
        ]);

        $exists = Exam::where('name', $request->name)->where('date', $request->date)->where('class_id', $request->class_id)->where('subject_id', $request->subject_id)->exists();

        if ($exists) {
            return redirect()->back()->with('warning', 'This exam already exists for this date, class and subject. Please try another!');
        }

        $exists = Exam::where('class_id', $request->class_id)
            ->where('subject_id', $request->subject_id)
            ->where('id', '!=', $exam_id) 
            ->exists();

        if ($exists) {
            return redirect()->back()->with('warning', 'This subject already has an exam in this class. Duplicate not allowed!');
        }

        // Find exam
        $findData = Exam::where('id', $exam_id)->first();

        if($findData){
            // Exam Info
            $findData->name       = $request->name;
            $findData->date       = $request->date;
            $findData->class_id   = $request->class_id;
            $findData->subject_id = $request->subject_id;
            $findData->max_marks  = $request->max_marks;
            $findData->update();
            return redirect()->back()->with('success', 'Exam update successfully!');
        }

        
    }








    public function classList(){
        $company = Company::first();
        $classes = Room::with('teachers')->get();
        return view('exam.exam-class-list', compact('classes','company'));
    }

    public function examView($class){
        $company = Company::first();
        $exam = Exam::with(['room','subject'])->where('class_id', $class)->get();
        return view('exam.class-exam-list', compact('exam','class','company'));
    }

    public function classExam($class, $subject , $exam){
        $company = Company::first();
        $students = Student::where('class_id', $class)->where('status', 1)
            ->whereHas('subjects', function ($query) use ($subject) {
                $query->where('subjects.id', $subject);
            })->get();

        $sub = Subject::find($subject);
        $room = Room::find($class);
        $exam = Exam::find($exam);
        $marks = Mark::where('subject_id', $subject)->where('exam_id', $exam->id)->get();
        //dd($exam);
        return view('exam.mark-submit', compact('students','sub','exam','room','marks','company'));
    }
    
    public function submitMark(Request $request, $id){
        $request->validate([
            'subject_id'     => 'required|exists:subjects,id',
            'exam_id'     => 'required|exists:subjects,id',
            'marks_obtained' => 'required|numeric|min:0|max:100',
            'grade'          => 'nullable|string|max:2',
            'gpa'            => 'nullable|numeric|min:0|max:4',
            'remarks'        => 'nullable|string|max:255',
        ]);

        $findData = Mark::where('student_id', $id)->where('subject_id', $request->subject_id)->where('exam_id', $request->exam_id)->first();
        if($findData){
            if($request->edit){
                $exam = Exam::where('id', $request->exam_id)->first();
                $max_mark = $exam->max_marks;
                $number = $request->marks_obtained;

                $percentage = ($number / $max_mark) * 100;

                if ($percentage >= 80) {
                    $grade = 'A+';
                    $gpa   = 5.00;
                } elseif ($percentage >= 70) {
                    $grade = 'A';
                    $gpa   = 4.00;
                } elseif ($percentage >= 60) {
                    $grade = 'A-';
                    $gpa   = 3.50;
                } elseif ($percentage >= 50) {
                    $grade = 'B';
                    $gpa   = 3.00;
                } elseif ($percentage >= 40) {
                    $grade = 'C';
                    $gpa   = 2.00;
                } elseif ($percentage >= 33) {
                    $grade = 'D';
                    $gpa   = 1.00;
                } else {
                    $grade = 'F';
                    $gpa   = 0.00;
                }

                $findData->student_id     = $id;
                $findData->subject_id     = $request->subject_id;
                $findData->exam_id        = $request->exam_id;
                $findData->marks_obtained = $number;
                $findData->grade          = $grade;
                $findData->gpa            = $gpa;
                $findData->remarks        = 'Updated by ' . Auth::guard('teacher')->user()->first_name .' '.Auth::guard('teacher')->user()->last_name;
                
                // $findData->update();
                return redirect()->back()->with('success', 'Mark updated successfully!');
            }
            // return redirect()->back()->with('warning', 'Mark already submited. Please try another student. Thank you.');
        }

        $exam = Exam::where('id', $request->exam_id)->first();
        $max_mark = $exam->max_marks;
        $number = $request->marks_obtained;

        $percentage = ($number / $max_mark) * 100;

        if ($percentage >= 80) {
            $grade = 'A+';
            $gpa   = 5.00;
        } elseif ($percentage >= 70) {
            $grade = 'A';
            $gpa   = 4.00;
        } elseif ($percentage >= 60) {
            $grade = 'A-';
            $gpa   = 3.50;
        } elseif ($percentage >= 50) {
            $grade = 'B';
            $gpa   = 3.00;
        } elseif ($percentage >= 40) {
            $grade = 'C';
            $gpa   = 2.00;
        } elseif ($percentage >= 33) {
            $grade = 'D';
            $gpa   = 1.00;
        } else {
            $grade = 'F';
            $gpa   = 0.00;
        }

        $mark = new Mark();
        $mark->student_id     = $id;
        $mark->subject_id     = $request->subject_id;
        $mark->exam_id        = $request->exam_id;
        $mark->marks_obtained = $number;
        $mark->grade          = $grade;
        $mark->gpa            = $gpa;
        $mark->remarks        = 'N/A';
        
        $mark->save();
        return redirect()->back()->with('success', 'Mark submitted successfully!');
    }

    public function resultReport(){
        $classes = Room::with('teachers')->get();
        $company = Company::first();
        return view('exam.report.class-list', compact('classes','company'));
    }

    public function resultReportClass($class){
        $students = Student::where('class_id', $class)->where('status', 1)->get();
        $company = Company::first();
        return view('exam.report.student-list', compact('class','students','company'));
    }

    public function showResult($class, $student){
        $company = Company::first();
        $marks = Mark::with(['student','subject','exam'])->where('student_id', $student)->get();
        return view('exam.report.result-view', compact('marks','class','student','company'));
    }

    public function totalReport(){
        $classes = Room::with('teachers')->get();
        $company = Company::first();
        return view('exam.report.class-list-2', compact('classes','company'));
    }

    public function totalResult($class){
        $company = Company::first();
        $students = Student::where('class_id', $class)->where('status', 1)->with('results.subject')->get();
        $subjects = Subject::where('class_id', $class)->get();

        $studentResults = [];

        foreach ($students as $student) {
            $totalMarks = 0;
            foreach ($subjects as $subject) {
                $subjectResults = $student->results->where('subject_id', $subject->id);
                foreach ($subjectResults as $result) {
                    $totalMarks += $result->marks_obtained;
                }
            }

            $studentResults[] = [
                'student' => $student,
                'total_marks' => $totalMarks
            ];
        }
        
        //dd($studentResults);
        return view('exam.report.student-result-view', compact('students','subjects','studentResults','company'));
    }

    public function createExam(){
        $exams = ExamName::all();
        $company = Company::first();
        return view('exam.create-exam', compact('exams','company'));
    }

    public function createNewExam(Request $request){
        $name = $request->input('exam_name','');
        $data = new ExamName();
        $data->exam_name = $name;
        $data->save();
        return redirect()->back()->with('success', 'New exam created successfully!');
    }

    public function updateExam(Request $request, $id){
        try {
            $exam = ExamName::findOrFail($id);
            if ($request->has('delete')) {
                // $exam->delete();
                return back()->with('success', 'Exam deleted successfully!');
            }
            $request->validate([
                'exam_name' => 'required|string|max:255'
            ]);
            $exam->exam_name = $request->exam_name;
            $exam->save();
            return back()->with('success', 'Exam updated successfully!');
        }
        catch (ModelNotFoundException $e) {
            return back()->with('error', 'Exam not found.');
        }
        catch (\Exception $e) {
            return back()->with('error', 'Something went wrong. Please try again.');
        }
    }
}
