<?php

namespace App\Http\Controllers\Finance;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

use App\Models\Room;
use App\Models\Student;
use App\Models\FeeCategory;
use App\Models\FeeStructure;
use App\Models\FeePayment;

class FinanceReportController extends Controller
{
    public function studentFinanceReport(){
        $feePayment = FeePayment::paginate(45);
        $total = FeePayment::sum('amount_paid');
        $discount = FeePayment::sum('discount');
        $due = FeePayment::sum('due_amount');
        return view('finance.report.student-finance-report', compact('feePayment','total','discount','due'));
    }

    public function findPaymentReport(Request $request){
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');

        $query = FeePayment::query();

        if ($start && $end) {
            $query->whereBetween('payment_date', [$start, $end]);
        }

        $feePayment = FeePayment::whereBetween('payment_date', [$start, $end])->paginate(45);
        $total = FeePayment::whereBetween('payment_date', [$start, $end])->sum('amount_paid');
        $discount = FeePayment::whereBetween('payment_date', [$start, $end])->sum('discount');
        $due = FeePayment::whereBetween('payment_date', [$start, $end])->sum('due_amount');
        return view('finance.report.student-finance-report', compact('feePayment','total','discount','due'));
    }

    public function categroyReport(){
        $category = FeeCategory::all();
        $feePayment = FeePayment::paginate(45);
        $total = FeePayment::sum('amount_paid');
        $discount = FeePayment::sum('discount');
        $due = FeePayment::sum('due_amount');
        return view('finance.report.category-finance-report', compact('feePayment','total','discount','due','category'));
    }

    public function findCategoryFeeReport(Request $request){
        $category = FeeCategory::all();
        
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');
        $stracture_Id = $request->input('Category_id', '');

        $query = FeePayment::query();

        if ($start && $end) {
            $query->whereBetween('payment_date', [$start, $end]);
        }

        $feePayment = FeePayment::where('fee_structure_id', $stracture_Id)->whereBetween('payment_date', [$start, $end])->paginate(45);
        $total = FeePayment::where('fee_structure_id', $stracture_Id)->whereBetween('payment_date', [$start, $end])->sum('amount_paid');
        $discount = FeePayment::where('fee_structure_id', $stracture_Id)->whereBetween('payment_date', [$start, $end])->sum('discount');
        $due = FeePayment::where('fee_structure_id', $stracture_Id)->whereBetween('payment_date', [$start, $end])->sum('due_amount');

        return view('finance.report.category-finance-report', compact('feePayment','total','discount','due','category'));
    }

    public function studentFeeReport(){
        $feePayment = FeePayment::paginate(45);
        $total = FeePayment::sum('amount_paid');
        $discount = FeePayment::sum('discount');
        $due = FeePayment::sum('due_amount');
        $student = Student::all();
        return view('finance.report.student-fee-report', compact('feePayment','total','discount','due','student'));
    }

    public function findStudentFeeReport(Request $request){
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');

        $studentId = $request->input('Student_id', '');
        $student = Student::all();

        $query = FeePayment::query();

        if ($studentId) {
            $query->where('student_id', $studentId);
        }
        if ($start && $end) {
            $query->whereBetween('payment_date', [$start, $end]);
        }

        $feePayment = FeePayment::where('student_id', $studentId)->whereBetween('payment_date', [$start, $end])->paginate(45);
        $total = FeePayment::where('student_id', $studentId)->whereBetween('payment_date', [$start, $end])->sum('amount_paid');
        $discount = FeePayment::where('student_id', $studentId)->whereBetween('payment_date', [$start, $end])->sum('discount');
        $due = FeePayment::where('student_id', $studentId)->whereBetween('payment_date', [$start, $end])->sum('due_amount');

        return view('finance.report.student-fee-report', compact('feePayment','total','discount','due','student'));
    }
}
