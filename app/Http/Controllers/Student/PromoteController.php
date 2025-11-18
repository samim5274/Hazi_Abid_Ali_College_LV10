<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;

use App\Models\Student;
use App\Models\Room;
use App\Models\Subject;
use App\Models\Mark;

class PromoteController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function classList(){
        $classes = Room::all();
        return view('student.class-list', compact('classes'));
    }

    public function stdList($class){
        $students = Student::where('class_id', $class)->get();
        $classes = Room::all();
        return view('student.class-student-list', compact('students','classes'));
    }

    public function updateStudent(Request $request, $student){
        
        $students = Student::where('id', $student)->first();

        if (!$students) {
            return redirect()->back()->with('error', 'Selected student not found. Please try another!');
        }

        $classId = $request->class_id;
        $rollNo = $request->roll;

        if($classId == 13){
            $students->remark = 'B'.Carbon::now()->format('Y');
            $students->class_id = $classId;
            $students->update();
            return redirect()->back()->with('success', 'Student pass from "'.$students->room->name.'" this school.');
        }

        $students->class_id    = $classId;
        $students->roll_number = $rollNo;

        $students->update();

        return redirect()->back()->with('success', 'Selected student to "'.$students->room->name.'" class updated successfully.');
    }

    // this code use kor student promoto without condition
    // public function promoteClass(Request $request, $class_id){

    //     $students = Student::where('class_id', $class_id)->get();

    //     if ($students->isEmpty()) {
    //         return redirect()->back()->with('error', 'No students found in this class!');
    //     }

    //     $totalSubjects = Subject::where('class_id', $class_id)->count();

    //     if ($totalSubjects == 0) {
    //         return redirect()->back()->with('error', 'This class has no subjects enrolled. Please try again.');
    //     }

    //     try {
    //         DB::transaction(function () use ($students, $class_id, $totalSubjects) {
    //             foreach ($students as $student) {
    //                 // Check student marks
    //                 $marksCount = Mark::where('student_id', $student->id)
    //                                 ->whereHas('subject', function ($q) use ($class_id) {
    //                                     $q->where('class_id', $class_id);
    //                                 })
    //                                 ->count();

    //                 if ($marksCount < $totalSubjects) {
    //                     throw new \Exception('Student: ' . $student->first_name . ' ' . $student->last_name . ' has not submitted all subject marks!');
    //                 }

    //                 // Promotion Logic
    //                 if ($class_id == 13) {
    //                     // Final class = Pass out
    //                     $student->remark = 'B' . Carbon::now()->format('Y');
    //                 } else {
    //                     // Next class
    //                     $student->class_id = $class_id + 1;
    //                 }

    //                 $student->save();
    //             }
    //         });

    //         return redirect()->back()->with('success', 'All students promoted successfully!');

    //     } catch (\Exception $e) {
    //         return redirect()->back()->with('error', $e->getMessage());
    //     }
    // }

    public function promoteClass(Request $request, $class_id) {
        $students = Student::where('class_id', $class_id)->get();

        if ($students->isEmpty()) {
            return redirect()->back()->with('error', 'No students found in this class!');
        }

        $totalSubjects = Subject::where('class_id', $class_id)->count();

        if ($totalSubjects == 0) {
            return redirect()->back()->with('error', 'This class has no subjects enrolled. Please try again.');
        }

        // Check if all students have submitted marks
        foreach ($students as $student) {
            $marksCount = Mark::where('student_id', $student->id)
                            ->whereHas('subject', function ($q) use ($class_id) {
                                $q->where('class_id', $class_id);
                            })
                            ->count();

            if ($marksCount < $totalSubjects) {
                return redirect()->back()->with('error', 'All students must submit marks before promotion!');
            }
        }

        try {
            DB::transaction(function () use ($students, $class_id, $totalSubjects) {

                // Step 1: Check grade F and calculate total marks for eligible students
                $eligibleStudents = collect();

                foreach ($students as $student) {
                    $hasFail = Mark::where('student_id', $student->id)
                                ->whereHas('subject', function ($q) use ($class_id) {
                                    $q->where('class_id', $class_id);
                                })
                                ->where('grade', 'F')
                                ->exists();

                    if (!$hasFail) {
                        // Calculate total marks only for eligible students
                        $totalMarks = Mark::where('student_id', $student->id)
                                        ->whereHas('subject', function ($q) use ($class_id) {
                                            $q->where('class_id', $class_id);
                                        })
                                        ->sum('marks_obtained');

                        $student->total_marks = $totalMarks;
                        $eligibleStudents->push($student);
                    }
                }

                // Step 2: Sort eligible students by total marks descending
                $studentsSorted = $eligibleStudents->sortByDesc('total_marks')->values();

                // Step 3: Promote eligible students and assign roll numbers
                foreach ($studentsSorted as $index => $student) {

                    if ($class_id == 13) {
                        // Final class = Pass out
                        $student->remark = 'B' . Carbon::now()->format('Y');
                        $student->roll_number = null;
                    } else {
                        $student->class_id = $class_id + 1;
                        $student->roll_number = $index + 1;
                    }

                    $student->save();
                }

            });

            return redirect()->back()->with('success', 'Eligible students promoted successfully!');

        } catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

}
