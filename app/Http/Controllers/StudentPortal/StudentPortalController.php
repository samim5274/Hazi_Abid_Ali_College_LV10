<?php

namespace App\Http\Controllers\StudentPortal;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Subject;
use App\Models\StudentSubject;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\Attendance;
use App\Models\FeeStructure;
use App\Models\feePaymentDetails;
use App\Models\FeePaymentItem;
use App\Models\ClassSchedule;
use App\Models\StudentDailyRoutine;
use Auth;

class StudentPortalController extends Controller
{
    public function stdDashboard(){
        // return view('studentPortal.std-dashboard');
        return redirect()->route('student-profile-view');
    }

    public function profile(){
        $student = $student = Auth::guard('student')->user();
        return view('studentPortal.profile.student-profile', compact('student'));
    }

    public function myClass(){
        $student = $student = Auth::guard('student')->user();
        $routine = ClassSchedule::where('class_id', $student->class_id)->get();
        return view('studentPortal.classes.student-class', compact('student','routine'));
    }

    public function attendance(){
        $date = Carbon::today()->format('Y-m-d');
        $student = $student = Auth::guard('student')->user();
        $attendance = Attendance::where('student_id', $student->id)->where('attendance_date', $date)->paginate(30);
        return view('studentPortal.attendance.student-attendance', compact('student','attendance'));
    }

    public function getAttedance(Request $request){
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');

        $student = $student = Auth::guard('student')->user();
        $attendance = Attendance::where('student_id', $student->id)->whereBetween('attendance_date', [$start, $end])->paginate(30);
        return view('studentPortal.attendance.student-attendance', compact('student','attendance'));
    }

    public function examList(){
        $student = $student = Auth::guard('student')->user();
        $exams = Exam::where('class_id', $student->class_id)->get();
        return view('studentPortal.exam.student-exam', compact('student','exams'));
    }

    public function results(){
        $student = $student = Auth::guard('student')->user();
        $marks = Mark::where('student_id', $student->id)->get();
        return view('studentPortal.exam.student-marks', compact('student','marks'));
    }

    // public function feeDetails(){
    //     $student = $student = Auth::guard('student')->user();
    //     $structures = FeeStructure::where('class_id', $student->class_id)->get();
    //     $payments = FeePayment::where('student_id', $student->id)->get();
    //     $groupedPayments = $payments->groupBy('fee_structure_id');

    //     // previowus payment caltulation
    //     $currentClassId = $student->class_id;
    //     $previousStructures = FeeStructure::where('class_id', '<', $currentClassId)->get();

    //     $previousClassIds = $previousStructures->pluck('id')->toArray();

    //     $previousPayments = FeePayment::where('student_id', $student->id)
    //                         ->whereIn('fee_structure_id', $previousClassIds)
    //                         ->get()
    //                         ->groupBy('fee_structure_id'); 
    //     $previousDue = 0;

    //     foreach($previousStructures as $structure){
    //         $payments = $previousPayments[$structure->id] ?? collect();
    //         $totalPaid = $payments->sum('amount_paid');
    //         $totalDiscount = $payments->sum('discount');
    //         $due = ($structure->amount * 12) - ($totalPaid + $totalDiscount);
    //         $previousDue += max($due, 0);
    //     }

    //     return view('studentPortal.fee.student-fee-details', compact('student','structures','groupedPayments','previousDue'));
    // }

    public function feeDetails(){
        $student = Auth::guard('student')->user();
        $structures = FeeStructure::where('class_id', $student->class_id)->get();
        $payments = feePaymentDetails::where('student_id', $student->id)->get();
        return view('studentPortal.fee.student-fee-details', compact('student','structures'));
    }

    // public function feeHistory(){
    //     $student = $student = Auth::guard('student')->user();
    //     $payment = FeePayment::where('student_id', $student->id)->orderBy('id', 'desc')->paginate(15);
    //     $paid = FeePayment::where('student_id', $student->id)->sum('amount_paid');
    //     $discount = FeePayment::where('student_id', $student->id)->sum('discount');
    //     $due = FeePayment::where('student_id', $student->id)->sum('due_amount');
    //     return view('studentPortal.fee.student-fee-history', compact('student','payment','paid','discount','due'));
    // }

    public function feeHistory(){
        $student = $student = Auth::guard('student')->user();
        $payment = FeePaymentItem::where('student_id', $student->id)->paginate(15);
        return view('studentPortal.fee.student-fee-history', compact('student','payment'));
    }

    public function dailyReport(){
        $student = Auth::guard('student')->user();
        $date = Carbon::today()->format('Y-m-d');
        $routine = StudentDailyRoutine::where('student_id', $student->id)->get();
        return view('studentPortal.daily-report.my-daily-report', compact('routine'));
    }

    public function dailyReportStore(Request $request){
        $student = Auth::guard('student')->user();
        $date = Carbon::today()->format('Y-m-d');

        $data = StudentDailyRoutine::where('student_id', $student->id)->where('date', $date)->first();

        if($data){
            return redirect()->back()->with('error', 'Daily report for today has already been submitted.');
        }

        $request->validate([
            'time_to_awake' => 'required',
            'attendance_in_college' => 'required|in:0,1',
            'arrival_in_residence' => 'required',
            'prayer' => 'nullable|string|max:255',
            'morning_activity' => 'nullable|string|max:255',
            'evening_activity' => 'nullable|string|max:255',
            'night_activity' => 'nullable|string|max:255',
            'time_to_bed' => 'required',
            'total_hours' => 'required|numeric|min:0',
            'remark' => 'nullable|string|max:500',
        ]);

        $routine = new StudentDailyRoutine();
        $routine->student_id = $student->id;
        $routine->date = $date;
        $routine->time_to_awake = $request->time_to_awake;
        $routine->attendance_in_college = $request->attendance_in_college;
        $routine->arrival_in_residence = $request->arrival_in_residence;
        $routine->prayer = $request->prayer;
        $routine->morning_activity = $request->morning_activity;
        $routine->evening_activity = $request->evening_activity;
        $routine->night_activity = $request->night_activity;
        $routine->time_to_bed = $request->time_to_bed;
        $routine->total_hours = $request->total_hours;
        $routine->remark = $request->remark ?? 'N/A';
        $routine->save();
        
        return redirect()->back()->with('success', 'Daily report submitted successfully.');
    }

    public function editStudentDailyRoutine($id){
        $student = Auth::guard('student')->user();
        $routine = StudentDailyRoutine::where('id', $id)->where('student_id', $student->id)->firstOrFail();
        return view('studentPortal.daily-report.edit-daily-report', compact('routine'));
    }

    public function dailyReportEdit(Request $request){
        $student = Auth::guard('student')->user();

        $request->validate([
            'time_to_awake' => 'required',
            'attendance_in_college' => 'required|in:0,1',
            'arrival_in_residence' => 'required',
            'prayer' => 'nullable|string|max:255',
            'morning_activity' => 'nullable|string|max:255',
            'evening_activity' => 'nullable|string|max:255',
            'night_activity' => 'nullable|string|max:255',
            'time_to_bed' => 'required',
            'total_hours' => 'required|numeric|min:0',
            'remark' => 'nullable|string|max:500',
        ]);

        $routine = StudentDailyRoutine::where('id', $request->id)->where('student_id', $student->id)->firstOrFail();
        $routine->time_to_awake = $request->time_to_awake;
        $routine->attendance_in_college = $request->attendance_in_college;
        $routine->arrival_in_residence = $request->arrival_in_residence;
        $routine->prayer = $request->prayer;
        $routine->morning_activity = $request->morning_activity;
        $routine->evening_activity = $request->evening_activity;
        $routine->night_activity = $request->night_activity;
        $routine->time_to_bed = $request->time_to_bed;
        $routine->total_hours = $request->total_hours;
        $routine->remark = $request->remark ?? 'N/A';
        $routine->update();
        
        return redirect()->route('my-daily-report')->with('success', 'Daily report updated successfully.');
    }

    public function enrollment(){
        $student = Auth::guard('student')->user(); 
        $subjects = Subject::where('class_id', $student->class_id)->get();
        $enrollmented = StudentSubject::where('student_id', $student->id)->get(); 
        return view('studentPortal.enrollment.student-enrollment', compact('subjects','student','enrollmented'));
    }

    public function enrollmentStore(Request $request){
        $validatedData = $request->validate([
            'subjectId' => ['required', 'integer', 'exists:subjects,id'],
        ]);

        $studnetId = Auth::guard('student')->user()->id;
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
