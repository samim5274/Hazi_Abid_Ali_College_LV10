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
use App\Models\StudentSubject;
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
        $students = Student::where('class_id', $class)->where('status', 1)->get();
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


    // this part check condition all student all mark submited or not
    // public function promoteClass(Request $request, $class_id) {
    //     $students = Student::where('class_id', $class_id)->get();

    //     if ($students->isEmpty()) {
    //         return redirect()->back()->with('error', 'No students found in this class!');
    //     }

    //     $totalSubjects = Subject::where('class_id', $class_id)->count();

    //     if ($totalSubjects == 0) {
    //         return redirect()->back()->with('error', 'This class has no subjects enrolled. Please try again.');
    //     }

    //     // Check if all students have submitted marks
    //     foreach ($students as $student) {
    //         $marksCount = Mark::where('student_id', $student->id)
    //                         ->whereHas('subject', function ($q) use ($class_id) {
    //                             $q->where('class_id', $class_id);
    //                         })
    //                         ->count();

    //         if ($marksCount < $totalSubjects) {
    //             return redirect()->back()->with('error', 'All students must submit marks before promotion!');
    //         }
    //     }

    //     try {
    //         DB::transaction(function () use ($students, $class_id, $totalSubjects) {

    //             // Step 1: Check grade F and calculate total marks for eligible students
    //             $eligibleStudents = collect();

    //             foreach ($students as $student) {
    //                 $hasFail = Mark::where('student_id', $student->id)
    //                             ->whereHas('subject', function ($q) use ($class_id) {
    //                                 $q->where('class_id', $class_id);
    //                             })
    //                             ->where('grade', 'F')
    //                             ->exists();

    //                 if (!$hasFail) {
    //                     // Calculate total marks only for eligible students
    //                     $totalMarks = Mark::where('student_id', $student->id)
    //                                     ->whereHas('subject', function ($q) use ($class_id) {
    //                                         $q->where('class_id', $class_id);
    //                                     })
    //                                     ->sum('marks_obtained');

    //                     $student->total_marks = $totalMarks;
    //                     $eligibleStudents->push($student);
    //                 }
    //             }

    //             // Step 2: Sort eligible students by total marks descending
    //             $studentsSorted = $eligibleStudents->sortByDesc('total_marks')->values();

    //             // Step 3: Promote eligible students and assign roll numbers
    //             foreach ($studentsSorted as $index => $student) {

    //                 if ($class_id == 5) {
    //                     // Final class = Pass out
    //                     $student->remark = 'B' . Carbon::now()->format('Y');
    //                     $student->roll_number = null;
    //                 } else {
    //                     $student->class_id = $class_id + 1;
    //                     $student->roll_number = $index + 1;
    //                 }

    //                 $student->save();
    //             }

    //         });

    //         return redirect()->back()->with('success', 'Eligible students promoted successfully!');

    //     } catch (\Exception $e) {
    //         return redirect()->back()->with('error', $e->getMessage());
    //     }
    // }


















    // this part check only enrollment subject marks submited or not then that wise student migration working
    // public function promoteClass(Request $request, $class_id) 
    // {
    //     // Step 1: Get all students of this class
    //     $students = Student::where('class_id', $class_id)->get();
    //     if ($students->isEmpty()) {
    //         return redirect()->back()->with('error', 'No students found in this class!');
    //     }


        

    //     // Step 2: Check if any subject exists in this class (Optional)
    //     $totalSubjects = Subject::where('class_id', $class_id)->count();
    //     if ($totalSubjects == 0) {
    //         return redirect()->back()->with('error', 'This class has no subjects enrolled. Please try again.');
    //     }








    //     // Step 3: Check if all students submitted marks
    //     // ONLY for the subjects they actually enrolled in
    //     $eligibleStudents = collect();

    //     foreach ($students as $student) {

    //         // Use local variable instead of attaching to model
    //         $enrolledSubjects = StudentSubject::where('student_id', $student->id)
    //             ->pluck('subject_id') ?? collect();

    //         if ($enrolledSubjects->isEmpty()) {
    //             continue; // skip student if no subjects
    //         }

    //         $subjectIds = $enrolledSubjects->toArray(); // null-safe

    //         // Check marks submission
    //         $marksCount = Mark::where('student_id', $student->id)
    //             ->whereIn('subject_id', $subjectIds)
    //             ->count();

    //         if ($marksCount < count($subjectIds)) {
    //             throw new \Exception('All enrolled students must submit subject marks before promotion!');
    //         }

    //         // Calculate total marks (temporary, not attached to model)
    //         $totalMarks = Mark::where('student_id', $student->id)
    //             ->whereIn('subject_id', $subjectIds)
    //             ->sum('marks_obtained');

    //         $eligibleStudents->push([
    //             'student' => $student,
    //             'total_marks' => $totalMarks
    //         ]);
    //     }

    //     // Sort eligible students by total marks descending
    //     $studentsSorted = collect($eligibleStudents)
    //         ->sortByDesc(fn($s) => $s['total_marks'])
    //         ->values();

    //     // Promote and save
    //     foreach ($studentsSorted as $index => $item) {
    //         $student = $item['student']; // Get actual Student model

    //         if ($class_id == 5) {
    //             $student->remark = 'B' . Carbon::now()->format('Y');
    //             $student->roll_number = 0; // or null if DB allows
    //             $student->status = 0; 
    //             $student->class_id = 0; 
    //         } else {
    //             $student->class_id = $class_id + 1;
    //             $student->roll_number = $index + 1;
    //         }

    //         $student->save();
    //     }



    //     try {
    //         DB::transaction(function () use ($students, $class_id) {

    //             $eligibleStudents = collect();

    //             foreach ($students as $student) {

    //                 // Use local variable instead of attaching to model
    //                 $enrolledSubjects = StudentSubject::where('student_id', $student->id)
    //                     ->pluck('subject_id') ?? collect();

    //                 if ($enrolledSubjects->isEmpty()) {
    //                     continue;
    //                 }

    //                 $subjectIds = $enrolledSubjects->toArray();

    //                 $hasFail = Mark::where('student_id', $student->id)
    //                     ->whereIn('subject_id', $subjectIds)
    //                     ->where('grade', 'F')
    //                     ->exists();

    //                 if (!$hasFail) {
    //                     // Store student + total marks in a local array
    //                     $totalMarks = Mark::where('student_id', $student->id)
    //                         ->whereIn('subject_id', $subjectIds)
    //                         ->sum('marks_obtained');

    //                     $eligibleStudents->push([
    //                         'student' => $student,
    //                         'total_marks' => $totalMarks
    //                     ]);
    //                 }
    //             }

    //             // Sort eligible students by total marks descending
    //             $studentsSorted = collect($eligibleStudents)
    //                 ->sortByDesc(fn($s) => $s['total_marks'])
    //                 ->values();

    //             // Promote and assign roll number
    //             foreach ($studentsSorted as $index => $item) {
    //                 $student = $item['student'];

    //                 if ($class_id == 5) {
    //                     $student->remark = 'B' . Carbon::now()->format('Y');
    //                     $student->roll_number = 0;
    //                     $student->status = 0; 
    //                     $student->class_id = 0; 
    //                 } else {
    //                     $student->class_id = $class_id + 1;
    //                     $student->roll_number = $index + 1;
    //                 }
                    
    //                 $student->save(); // Safe: no temporary property attached
    //             }

    //         });

    //         return redirect()->back()->with('success', 'Eligible students promoted successfully!');

    //     } catch (\Exception $e) {
    //         return redirect()->back()->with('error', $e->getMessage());
    //     }

    // }


    public function promoteClass(Request $request, $class_id) 
    {
        // Step 1: Get all students of this class
        $students = Student::where('class_id', $class_id)->get();
        if ($students->isEmpty()) {
            return redirect()->back()->with('error', 'No students found in this class!');
        }

        // Step 2: Optional - Check if any subject exists
        $totalSubjects = Subject::where('class_id', $class_id)->count();
        if ($totalSubjects == 0) {
            return redirect()->back()->with('error', 'This class has no subjects enrolled. Please try again.');
        }

        try {
            DB::transaction(function () use ($students, $class_id) {

                $eligibleStudents = collect();

                foreach ($students as $student) {
                    // Step 3: Get student's enrolled subjects
                    $enrolledSubjects = StudentSubject::where('student_id', $student->id)
                        ->pluck('subject_id') ?? collect();

                    if ($enrolledSubjects->isEmpty()) {
                        continue; // skip students with no enrolled subjects
                    }

                    $subjectIds = $enrolledSubjects->toArray();

                    // Step 4: Check if all enrolled subjects have marks
                    $marksCount = Mark::where('student_id', $student->id)
                        ->whereIn('subject_id', $subjectIds)
                        ->count();

                    if ($marksCount < count($subjectIds)) {
                        throw new \Exception('All enrolled students must submit subject marks before promotion!');
                    }

                    // Step 5: Check if student has failed any subject
                    $hasFail = Mark::where('student_id', $student->id)
                        ->whereIn('subject_id', $subjectIds)
                        ->where('grade', 'F')
                        ->exists();

                    if (!$hasFail) {
                        // Step 6: Calculate total marks for sorting
                        $totalMarks = Mark::where('student_id', $student->id)
                            ->whereIn('subject_id', $subjectIds)
                            ->sum('marks_obtained');

                        $eligibleStudents->push([
                            'student' => $student,
                            'total_marks' => $totalMarks
                        ]);
                    }
                }

                if ($eligibleStudents->isEmpty()) {
                    throw new \Exception('No eligible students found for promotion!');
                }

                // Step 7: Sort eligible students by total marks descending
                $studentsSorted = $eligibleStudents
                    ->sortByDesc(fn($s) => $s['total_marks'])
                    ->values();

                // Step 8: Promote students
                foreach ($studentsSorted as $index => $item) {
                    $student = $item['student'];

                    if ($class_id == 5) { // Final class logic
                        $student->remark = 'B' . Carbon::now()->format('Y');
                        $student->roll_number = 0; // or null if DB allows
                        $student->status = 0;      // mark as inactive
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
