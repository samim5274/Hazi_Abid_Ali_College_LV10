<?php

namespace App\Http\Controllers\Finance;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;

use App\Models\Room;
use App\Models\Student;
use App\Models\FeeCategory;
use App\Models\FeeStructure;
use App\Models\feePaymentDetails;
use App\Models\FeePaymentItem;
use App\Models\Company;
use App\Models\DueCollection;
use App\Mail\StudentDueMail;

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

    public function paymentHistory(){
        $company = Company::first();
        return view('finance.report.student-fee-payment-history', compact('company'));
    }

    public function findPaymentHistory(Request $request){
        $request->validate([
            'txtSearch'        => 'required',
        ]);

        $company = Company::first();

        $search = $request->txtSearch;

        $data = feePaymentDetails::where('receipt_no', $search)->orWhere('invoice_no', $search)->first();
        if(!$data){
            return redirect()->back()->with('error', 'Payment history not found. Please try again. Thank You!');
        }
        $total = $data->sum('total_amount');
        $discount = $data->sum('total_discount');
        $paid = $data->sum('total_paid');
        $due = $data->sum('total_due');
        return view('finance.report.student-fee-payment-history', compact('data','total','discount','paid','due','company'));
    }

    public function dueList(){
        $company = Company::first();
        $studentsWithDue = DB::table('students')
            ->leftJoin('rooms', 'students.class_id', '=', 'rooms.id')
            ->leftJoin('fee_payment_details', 'students.id', '=', 'fee_payment_details.student_id')
            ->leftJoin('due_collections', 'students.id', '=', 'due_collections.student_id')
            ->select(
                'students.id',
                'students.roll_number',
                'students.first_name',
                'students.last_name',
                'rooms.name as class_name',
                'rooms.section as class_section',
                DB::raw('COALESCE(SUM(fee_payment_details.total_due),0) as total_due'),
                DB::raw('COALESCE(SUM(due_collections.paid_amount),0) as total_paid'),
                DB::raw('(COALESCE(SUM(fee_payment_details.total_due),0) - COALESCE(SUM(due_collections.paid_amount),0)) as final_due')
            )
            ->groupBy(
                'students.id','students.roll_number','students.first_name','students.last_name',
                'rooms.name','rooms.section'
            )
            ->having('final_due', '>', 0)
            ->orderByDesc('final_due')
            ->paginate(10);

        // dd($studentsWithDue);
        return view('finance.report.student-due-list', compact('company','studentsWithDue'));
    }

    public function printDueList(){
        $company = Company::first();
        $studentsWithDue = DB::table('students')
            ->leftJoin('rooms', 'students.class_id', '=', 'rooms.id')
            ->leftJoin('fee_payment_details', 'students.id', '=', 'fee_payment_details.student_id')
            ->leftJoin('due_collections', 'students.id', '=', 'due_collections.student_id')
            ->select(
                'students.id',
                'students.roll_number',
                'students.first_name',
                'students.last_name',
                'rooms.name as class_name',
                'rooms.section as class_section',
                DB::raw('COALESCE(SUM(fee_payment_details.total_due),0) as total_due'),
                DB::raw('COALESCE(SUM(due_collections.paid_amount),0) as total_paid'),
                DB::raw('(COALESCE(SUM(fee_payment_details.total_due),0) - COALESCE(SUM(due_collections.paid_amount),0)) as final_due')
            )
            ->groupBy(
                'students.id','students.roll_number','students.first_name','students.last_name',
                'rooms.name','rooms.section'
            )
            ->having('final_due', '>', 0)
            ->orderByDesc('final_due')
            ->get();

        // dd($studentsWithDue);
        return view('finance.report.print-student-due-list', compact('company','studentsWithDue'));
    }

    public function sendMailDueStaudent(){
        $company = Company::first();
        $studentsWithDue = DB::table('students')
            ->leftJoin('rooms', 'students.class_id', '=', 'rooms.id')
            ->leftJoin('fee_payment_details', 'students.id', '=', 'fee_payment_details.student_id')
            ->leftJoin('due_collections', 'students.id', '=', 'due_collections.student_id')
            ->select(
                'students.id','students.roll_number','students.first_name','students.last_name','students.email',
                'rooms.name as class_name','rooms.section as class_section',
                DB::raw('COALESCE(SUM(fee_payment_details.total_due),0) as total_due'),
                DB::raw('COALESCE(SUM(due_collections.paid_amount),0) as total_paid'),
                DB::raw('(COALESCE(SUM(fee_payment_details.total_due),0) - COALESCE(SUM(due_collections.paid_amount),0)) as final_due')
            )
            ->groupBy('students.id','students.roll_number','students.first_name','students.last_name','students.email','rooms.name','rooms.section')
            ->having('final_due', '>', 0)
            ->get();

        $sent = 0;
        $failed = 0;
        $skipped = 0;

        foreach ($studentsWithDue as $st) {

            // empty / invalid format হলে skip
            if (empty($st->email) || !filter_var($st->email, FILTER_VALIDATE_EMAIL)) {
                $skipped++;
                continue;
            }

            try {
                Mail::to($st->email)->send(new StudentDueMail($company, $st));
                $sent++;
            } catch (\Throwable $e) {
                $failed++;

                Log::error('Due mail failed', [
                    'student_id' => $st->id ?? null,
                    'email' => $st->email ?? null,
                    'error' => $e->getMessage(),
                ]);

                continue;
            }
        }

        return back()->with('success', "Due mail sent: {$sent}, skipped (no email): {$skipped}");
    }

    public function dueCollectionReport(){
        $company = Company::first();
        $dueCollections = DueCollection::with(['student', 'user'])->where('collection_date', Carbon::today())->orderBy('collection_date', 'desc')->paginate(20); // dd($dueCollections);
        return view('finance.report.due-collection-report', compact('company','dueCollections'));
    }

    public function filterDueCollection(Request $request){
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');

        $company = Company::first();

        $startDate = $start ? Carbon::parse($start)->startOfDay() : Carbon::today()->startOfDay();
        $endDate   = $end   ? Carbon::parse($end)->endOfDay()     : Carbon::today()->endOfDay();

        $query = DueCollection::with(['student', 'user'])->whereBetween('collection_date', [$startDate, $endDate])->orderBy('collection_date', 'desc');

        if($request->print){
            $dueCollections = $query->get();
            return view('finance.report.print-due-collection-report', compact('company','dueCollections','startDate','endDate'));
        }

        $dueCollections = $query->paginate(20);
        return view('finance.report.due-collection-report', compact('company','dueCollections','startDate','endDate'));
    }
}
