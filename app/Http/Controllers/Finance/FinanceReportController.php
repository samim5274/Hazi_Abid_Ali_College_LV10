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
use App\Models\feePaymentDetails;
use App\Models\FeePaymentItem;
use App\Models\Company;

class FinanceReportController extends Controller
{
    public function studentFinanceReport(){
        $company = Company::first();

        $feePayment = feePaymentDetails::paginate(45);
        $total = $feePayment->sum('total_amount');
        $discount = $feePayment->sum('total_discount');
        $paid = $feePayment->sum('total_paid');
        $due = $feePayment->sum('total_due');
        return view('finance.report.student-finance-report', compact('feePayment','total','discount','paid','due','company'));
    }

    public function findPaymentReport(Request $request){
        $company = Company::first();
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');

        $query = feePaymentDetails::query();

        if ($start && $end) {
            $query->whereBetween('payment_date', [$start, $end]);
        }

        $feePayment = feePaymentDetails::whereBetween('payment_date', [$start, $end])->paginate(45);
        $total = $feePayment->sum('total_amount');
        $discount = $feePayment->sum('total_discount');
        $paid = $feePayment->sum('total_paid');
        $due = $feePayment->sum('total_due');
        return view('finance.report.student-finance-report', compact('feePayment','total','discount','paid','due','company'));
    }

    public function categroyReport(){
        $company = Company::first();
        $category = FeeCategory::all();

        $feePaymentItem = FeePaymentItem::paginate(20);

        $total = $feePaymentItem->sum('amount');
        $discount = $feePaymentItem->sum('discount');
        $paid = $feePaymentItem->sum('paid');
        $due = $feePaymentItem->sum('due');
        return view('finance.report.category-finance-report', compact('feePaymentItem','total','discount','paid','due','category','company'));
    }

    public function findCategoryFeeReport(Request $request){
        $company = Company::first();
        $category = FeeCategory::all();
        
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');
        $stracture_Id = $request->input('Category_id', '');

        $query = FeePaymentItem::query();

        if ($start && $end) {
            $query->whereBetween('payment_date', [$start, $end]);
        }

        $feePaymentItem = FeePaymentItem::where('fee_structure_id', $stracture_Id)->whereBetween('payment_date', [$start, $end])->paginate(20);
        $total = $feePaymentItem->sum('amount');
        $discount = $feePaymentItem->sum('discount');
        $paid = $feePaymentItem->sum('paid');
        $due = $feePaymentItem->sum('due');

        return view('finance.report.category-finance-report', compact('feePaymentItem','total','discount','paid','due','category','company'));
    }

    public function studentFeeReport(){
        $company = Company::first();

        $student = Student::where('status', 1)->get();

        $feePayment = FeePaymentItem::paginate(20);

        $total = $feePayment->sum('amount');
        $discount = $feePayment->sum('discount');
        $paid = $feePayment->sum('paid');
        $due = $feePayment->sum('due');

        return view('finance.report.student-fee-report', compact('feePayment','total','discount','paid','due','student','company'));
    }

    public function findStudentFeeReport(Request $request){
        $company = Company::first();
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');

        $studentId = $request->input('Student_id', '');
        $student = Student::where('status', 1)->get();

        $query = FeePaymentItem::query();

        if ($studentId) {
            $query->where('student_id', $studentId);
        }
        if ($start && $end) {
            $query->whereBetween('payment_date', [$start, $end]);
        }

        $feePayment = FeePaymentItem::where('student_id', $studentId)->whereBetween('payment_date', [$start, $end])->paginate(20);

        $total = $feePayment->sum('amount');
        $discount = $feePayment->sum('discount');
        $paid = $feePayment->sum('paid');
        $due = $feePayment->sum('due');

        return view('finance.report.student-fee-report', compact('feePayment','total','discount','paid','due','student','company'));
    }
}
