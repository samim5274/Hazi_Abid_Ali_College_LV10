<?php

namespace App\Http\Controllers\Room;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Teacher;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\StudentSubject;
use App\Models\ClassSchedule;

class ClassController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function index(){
        $classes = Room::all();
        return view('room.class-details', compact('classes'));
    }

    public function addNew(){
        $teachers = Teacher::all();
        $classes = Room::all();
        return view('room.new-class', compact('teachers','classes'));
    }

    public function insertClass(Request $request){
        $request->validate([
            'name'       => 'required|string|max:100',
            'section'    => 'nullable|string|max:50',
            'capacity'   => 'required|integer|min:1',
            'teacher_id' => 'required|exists:teachers,id',
        ]);

        $teacher = $request->input('teacher_id','');
        $findData = Room::where('class_teacher_id', $teacher)->first();
        if($findData){
            return redirect()->back()->with('warning', 'This Teacher already assign another class. Please try another Teacher to assign this class. Thank You!');
        }

        $class = new Room();
        $class->name       = $request->name;
        $class->section    = $request->section;
        $class->capacity   = $request->capacity;
        $class->class_teacher_id = $request->teacher_id;
        $class->save();

        return redirect()->back()->with('success', 'Class added successfully!');
    }

    public function assignTeacehr(){
        $teachers = Teacher::all();
        $classes = Room::all();
        return view('room.assign-teacher', compact('teachers','classes'));
    }

    public function update(Request $request){
        $request->validate([
            'class_teacher_id' => 'required',
            'class_id'        => 'required',
        ]);

        $classTeacher = $request->class_teacher_id;

        $existingAssignment = Room::where('class_teacher_id', $classTeacher)->where('id', '!=', $request->class_id)->first();

        if ($existingAssignment) {
            return redirect()->back()->with('error', 'Teacher already assigned to another class. Please select a different teacher.');
        }

        $class = Room::findOrFail($request->class_id);

        $class->class_teacher_id = $classTeacher;
        $class->update();

        return redirect()->back()->with('success', 'Teacher updated successfully!');
    }

    public function classSchedule(){        
        $teachers = Teacher::all();
        $subjects = Subject::all();
        $classes  = Room::all();
        $days     = ['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'];
        $schedules = ClassSchedule::all();
        return view('room.schedule.class-schedule', compact('classes','teachers','subjects','days','schedules'));
    }

    public function store(Request $request) {
        $request->validate([
            'class_id'    => 'required|exists:rooms,id',
            'day'         => 'required|string',
            'teacher'     => 'required|array',
            'subject'     => 'required|array',
            'start_time'  => 'required|array',
            'end_time'    => 'required|array',
        ]);

        $total = count($request->subject);

        for($i=0; $i<$total; $i++) {
            // skip if any required field missing
            if (
                empty($request->teacher[$i]) ||
                empty($request->subject[$i]) ||
                empty($request->start_time[$i]) ||
                empty($request->end_time[$i])
            ) {
                continue; // this row skip
            }

            $teacher_id = $request->teacher[$i];
            $period     = $i+1;
            $day        = $request->day;
            $class_id   = $request->class_id;

            // Teacher conflict check
            $teacherConflict = ClassSchedule::where('teacher_id', $teacher_id)
                ->where('day', $day)
                ->where('period', $period)
                ->exists();

            if($teacherConflict) {
                return redirect()->back()->with('error', "Teacher assigned in period {$period} already. Please choose another teacher.");
            }

            // Class conflict check (optional, DB constraint exists)
            $classConflict = ClassSchedule::where('class_id', $class_id)
                ->where('day', $day)
                ->where('period', $period)
                ->exists();

            if($classConflict) {
                return redirect()->back()->with('error', "Class already has a subject in period {$period} on {$day}.");
            }

            // Save schedule
            $schedule = new ClassSchedule();
            $schedule->class_id = $class_id;
            $schedule->day = $day;
            $schedule->period = $period;
            $schedule->teacher_id = $teacher_id;
            $schedule->subject_id = $request->subject[$i];
            $schedule->start_time = $request->start_time[$i];
            $schedule->end_time = $request->end_time[$i];
            $schedule->save();            
        }

        return redirect()->back()->with('success', 'Class schedule created successfully!');
    }

    public function modifySchedule(){
        $classes  = Room::all();
        $days     = ['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'];
        $schedules = ClassSchedule::all();
        return view('room.schedule.modify-class-schedule', compact('classes','days','schedules'));
    }

    public function searchSchedule(Request $request){
        $classes  = Room::all();
        $days     = ['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'];
        $schedules = ClassSchedule::where('class_id', $request->class_id)->where('day', $request->day)->get();
        return view('room.schedule.modify-class-schedule', compact('classes','days','schedules'));
    }

    public function editSchedule($scheduleId){
        $schedules = classSchedule::where('id', $scheduleId)->first();

        $teachers = Teacher::all();
        $subjects = Subject::all();
        $classes  = Room::all();
        $days     = ['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'];

        return view('room.schedule.class-schedule-edit', compact('classes','teachers','subjects','days','schedules'));
    }

    public function updateClassSchedule(Request $request, $id){
        $request->validate([
            'class_id'   => 'required|exists:rooms,id',
            'day'        => 'required|string',
            'teacher'    => 'required|array|size:1',
            'subject'    => 'required',
            'start_time' => 'required|array|size:1',
            'end_time'   => 'required|array|size:1',
        ]);

        // Get existing schedule
        $schedule = ClassSchedule::findOrFail($id);

        $class_id   = $request->class_id;
        $day        = $request->day;
        $period     = $schedule->period;
        $teacher_id = $request->teacher[0];
        $subject_id = $request->subject;
        $start_time = $request->start_time[0];
        $end_time   = $request->end_time[0];

        // Skip check if same teacher/time not changed
        $teacherConflict = ClassSchedule::where('teacher_id', $teacher_id)
            ->where('day', $day)
            ->where('period', $period)
            ->where('id', '!=', $id)
            ->exists();

        if ($teacherConflict) {
            return redirect()->back()
                ->with('error', "Teacher already assigned in period {$period} on {$day}. Please choose another teacher.")
                ->withInput();
        }

        $classConflict = ClassSchedule::where('class_id', $class_id)
            ->where('day', $day)
            ->where('period', $period)
            ->where('id', '!=', $id)
            ->exists();

        if ($classConflict) {
            return redirect()->back()
                ->with('error', "Class already has a schedule in period {$period} on {$day}.")
                ->withInput();
        }

        if (strtotime($end_time) <= strtotime($start_time)) {
            return redirect()->back()
                ->with('error', 'End time must be later than start time.')
                ->withInput();
        }

        // --- Update the Schedule ---
        $schedule->teacher_id = $teacher_id;
        $schedule->subject_id = $subject_id;
        $schedule->start_time = $start_time;
        $schedule->end_time   = $end_time;
        $schedule->update();

        return redirect()->route('class-schedule-modify-view')->with('success', 'Class schedule updated successfully!');
    }
}
