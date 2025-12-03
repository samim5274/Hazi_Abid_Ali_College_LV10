<?php

namespace App\Http\Controllers\Attendance;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Attendance;

class AttendanceController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function classList(){
        $room = Room::with('teachers')->get();
        return view('attendance.class-list', compact('room'));
    }

    public function attendanceView($class_id){        
        $subject = Subject::with('room')->where('class_id', $class_id)->get();
        return view('attendance.subject-attendance-list', compact('subject','class_id'));        
    }

    public function studentList($class_id,$subject_id){        
        $date = now()->format('Y-m-d');

        $subject = Subject::findOrFail($subject_id);

        // All students of the class
        $student = Student::with('room')
                    ->where('class_id', $class_id)
                    ->where('status', 1)
                    ->orderBy('roll_number', 'ASC')
                    ->get();

        $totalStudent = $student->count();

        // Attendance for today
        $attend = Attendance::with('student', 'subject', 'class')
                    ->where('class_id', $class_id)
                    ->where('attendance_date', $date)
                    ->where('subject_id', $subject_id)
                    ->get();

        // Count
        $present = $attend->where('status', 'Present')->count();
        $absent = $attend->where('status', 'Absent')->count();

        // To check if a student already attended today for this subject
        $attendanceCheck = Attendance::where('class_id', $class_id)
                            ->where('subject_id', $subject_id)
                            ->where('attendance_date', $date)
                            ->pluck('student_id')
                            ->toArray();

        $attendanceData = Attendance::where('class_id', $class_id)
                    ->where('subject_id', $subject_id)
                    ->where('attendance_date', $date)
                    ->get()
                    ->keyBy('student_id'); // student_id কে Key করা

        return view('attendance.student-attendance-list', compact(
            'student', 'totalStudent', 'attend', 'present', 'absent', 'subject', 'attendanceCheck', 'attendanceData'
        ));
    }

    public function stdPresent($id, $subjectId){
        $student = Student::where('id', $id)->first();

        if (empty($student)){
            return redirect()->back()->with('error','Student not found. Please try again.');
        }

        $findData = Attendance::where('student_id', $id)->where('subject_id', $subjectId)->where('attendance_date',$this->date)->first();
        if(!empty($findData)){
            return redirect()->back()->with('warning','This student attendance already done. Try to another.');
        }

        $attend = new Attendance();
        $attend->student_id = $id;
        $attend->class_id = $student->class_id;
        $attend->subject_id = $subjectId;
        $attend->attendance_date = $this->date;
        $attend->status = 'Present';
        $attend->remarks = 'N/A';

        $attend->save();
        return redirect()->back()->with('success','Student attend in the class. Thank you.');
    }

    public function stdAbsend($id, $subjectId){
        $student = Student::where('id', $id)->first();

        if(empty($student)){
            return redirect()->back()->with('error','Student not found. Please try again.');
        }

        $findData = Attendance::where('student_id', $id)->where('subject_id', $subjectId)->where('attendance_date',$this->date)->first();
        if(!empty($findData)){
            return redirect()->back()->with('warning','This student attendance already done. Try to another.');
        }

        $attend = new Attendance();
        $attend->student_id = $id;
        $attend->class_id = $student->class_id;
        $attend->subject_id = $subjectId;
        $attend->attendance_date = $this->date;
        $attend->status = 'Absent';
        $attend->remarks = 'N/A';

        $attend->save();        
        return redirect()->back()->with('warning','Student not attend in the class. Thank you.');
    }

    public function attendApply(){
        $students = Student::all();
        foreach($students as $student){
            $student->attend_date = $this->date;
            $student->update();
        }
        return redirect()->back()->with('success','Student attendance apply for all classes. Thank you.');
    }

    public function dailyAttendet(){
        $date = now()->format('Y-m-d');
        $attend = Attendance::with('student', 'class', 'subject')->where('attendance_date', $date)->get()->groupBy('student_id'); // student wise grouping
        $subject = Attendance::with('student', 'class', 'subject')->where('attendance_date', $date)->get()->groupBy('subject_id'); // subject wise grouping

        $totalStudent = Student::count(); 
        $present = Attendance::where('status', 'Present')->where('attendance_date', $date)->count();
        $absent = Attendance::where('status', 'Absent')->where('attendance_date', $date)->count();

        return view('attendance.daily-student-list', compact('attend','totalStudent','present','absent','subject'));
    }

    public function searchAttendView(){
        $start = $this->date;
        $end = $this->date;
        $findData = Attendance::with('student')->whereBetween('attendance_date', [$start, $end])->paginate(45);
        $totalStudent = Student::count(); 
        $present = Attendance::where('status', 'Present')->where('attendance_date', $this->date)->count();
        $absent = Attendance::where('status', 'Absent')->where('attendance_date', $this->date)->count();
        return view('attendance.find-student-list', compact('findData','totalStudent','present','absent'));
    }

    public function searchAttendStudent(Request $request){
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');
        $findData = Attendance::with('student')->whereBetween('attendance_date', [$start, $end])->paginate(45);
        return view('attendance.find-student-list', compact('findData'));
    }

    public function classListAttend(){
        $start = $this->date;
        $end = $this->date;
        $classes = Room::all();
        $findData = Attendance::with('student')->whereBetween('attendance_date', [$start, $end])->paginate(45);
        return view('attendance.find-class-student-list', compact('findData','classes'));
    }

    public function findClassAttend(Request $request){
        $request->validate([
            'class_id' => ['required'],
        ]);

        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');
        $class_id = $request->input('class_id', '');
        $classes = Room::all();
        $findData = Attendance::with('student')->where('class_id', $class_id)->whereBetween('attendance_date', [$start, $end])->paginate(45);
        return view('attendance.find-class-student-list', compact('findData','classes'));
    }

    public function studentAttend(){
        $start = $this->date;
        $end = $this->date;
        $classes = Room::all();
        $students = Student::all();
        $findData = Attendance::with('student')->whereBetween('attendance_date', [$start, $end])->paginate(45);
        return view('attendance.find-student-attendance', compact('findData','classes','students'));
    }

    public function findStudentAttend(Request $request){
        $request->validate([
            'class_id' => ['required'],
            'student_id' => ['required'],
        ]);

        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');
        $class_id = $request->input('class_id', '');
        $student_id = $request->input('student_id', '');

        $classes = Room::all();
        $students = Student::all();

        $findData = Attendance::with('student')
            ->where('class_id', $class_id)
            ->where('student_id', $student_id)
            ->whereBetween('attendance_date', [$start, $end])
            ->paginate(45);

        return view('attendance.find-student-attendance', compact('findData','classes','students'));
    }

    public function subjectAttend(){
        $start = $this->date;
        $end = $this->date;
        $classes = Room::all();
        $students = Student::where('status',1)->get();
        $subjects = Subject::all();
        $findData = Attendance::with('student')->whereBetween('attendance_date', [$start, $end])->paginate(45);
        return view('attendance.find-subject-attendance', compact('findData','classes','students','subjects'));
    }

    public function getSubjectsByClass($class_id){
        $subjects = Subject::where('class_id', $class_id)->get();
        return response()->json($subjects);
    }

    public function getStudentsBySubject($subject_id){
        $subject = Subject::findOrFail($subject_id);
        $students = Student::where('class_id', $subject->class_id)
                        ->where('status',1)
                        ->orderBy('roll_number', 'ASC')
                        ->get();
        return response()->json($students);
    }

    public function findSubjectAttent(Request $request){
        $request->validate([
            'class_id' => ['required'],
            'student_id' => ['required'],
            'subject_id' => ['required'],
        ]);

        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');
        $class_id = $request->input('class_id', '');
        $student_id = $request->input('student_id', '');
        $subject_id = $request->input('subject_id', '');

        $classes = Room::all();
        $students = Student::all();
        $subjects = Subject::all();

        $findData = Attendance::with('student')
            ->where('class_id', $class_id)
            ->where('student_id', $student_id)
            ->where('subject_id', $subject_id)
            ->whereBetween('attendance_date', [$start, $end])
            ->paginate(45);
        
        return view('attendance.find-subject-attendance', compact('findData','classes','students','subjects'));
    }

    public function editStudentAttendance(Request $request, $id){
        $data = Attendance::find($id);
        if(!$data){
            return redirect()->back()->with('warning','Attendance not found. Please try another. Thank You!');
        }
        $data->status = $request->attendanceStatus;
        $data->update();
        return redirect()->back()->with('success','Student attendance update successfully.');
    }

}
