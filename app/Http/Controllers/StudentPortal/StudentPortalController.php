<?php

namespace App\Http\Controllers\StudentPortal;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\Attendance;
use App\Models\FeeStructure;
use App\Models\FeePayment;
use App\Models\ClassSchedule;
use Auth;

class StudentPortalController extends Controller
{
    public function stdDashboard(){
        return view('studentPortal.std-dashboard');
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

    public function feeDetails(){
        $student = $student = Auth::guard('student')->user();
        $structures = FeeStructure::where('class_id', $student->class_id)->get();
        $payments = FeePayment::where('student_id', $student->id)->get();
        $groupedPayments = $payments->groupBy('fee_structure_id');

        // previowus payment caltulation
        $currentClassId = $student->class_id;
        $previousStructures = FeeStructure::where('class_id', '<', $currentClassId)->get();

        $previousClassIds = $previousStructures->pluck('id')->toArray();

        $previousPayments = FeePayment::where('student_id', $student->id)
                            ->whereIn('fee_structure_id', $previousClassIds)
                            ->get()
                            ->groupBy('fee_structure_id'); 
        $previousDue = 0;

        foreach($previousStructures as $structure){
            $payments = $previousPayments[$structure->id] ?? collect();
            $totalPaid = $payments->sum('amount_paid');
            $totalDiscount = $payments->sum('discount');
            $due = ($structure->amount * 12) - ($totalPaid + $totalDiscount);
            $previousDue += max($due, 0);
        }

        return view('studentPortal.fee.student-fee-details', compact('student','structures','groupedPayments','previousDue'));
    }

    public function feeHistory(){
        $student = $student = Auth::guard('student')->user();
        $payment = FeePayment::where('student_id', $student->id)->orderBy('id', 'desc')->paginate(15);
        $paid = FeePayment::where('student_id', $student->id)->sum('amount_paid');
        $discount = FeePayment::where('student_id', $student->id)->sum('discount');
        $due = FeePayment::where('student_id', $student->id)->sum('due_amount');
        return view('studentPortal.fee.student-fee-history', compact('student','payment','paid','discount','due'));
    }
}
