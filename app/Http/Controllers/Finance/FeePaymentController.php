<?php

namespace App\Http\Controllers\Finance;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

use Auth;
use App\Models\Company;
use App\Models\Room;
use App\Models\Student;
use App\Models\FeeCategory;
use App\Models\FeeStructure;
use App\Models\feePaymentDetails;
use App\Models\FeePaymentItem;

class FeePaymentController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function FeeCollection(){
        $classes = Room::all();
        $company = Company::first();
        return view('finance.finance-structure', compact('classes','company'));
    }

    public function StudentList($class_id){
        $company = Company::first();
        $student = Student::with('room')->where('class_id', $class_id)->get();
        
        if ($student->isEmpty()){
            return redirect('class-list')->with('error','This class no student available now.');
        }

        return view('finance.finance-student-list', compact('class_id','student','company'));
    }

    public function feeView($class_id, $student_id){
        //
    }

    public function financeManagement(){
        $category = FeeCategory::paginate(10);
        $company = Company::first();
        return view('finance.finance-management', compact('category','company'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'category_name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        FeeCategory::create([
            'name' => $request->category_name,
            'description' => $request->description,
        ]);

        return redirect()->route('finance-management')->with('success', 'Fee category created successfully.');
    }

    public function financeFeeStructure(){
        $company = Company::first();
        $category = FeeCategory::all();
        $classes = Room::all();
        $feeStructure = FeeStructure::paginate(10);
        return view('finance.finance-fee-structure', compact('category','classes','feeStructure','company'));
    }

    public function insertFeeStructure(Request $request){
        $request->validate([
            'fee_category_id' => 'required',
            'class'           => 'required',
            'amount'          => 'required|numeric|min:1',
        ]);

        $class = $request->input('class', '');
        $fee   = $request->input('fee_category_id', '');

        $findClassFee = FeeStructure::where('class_id', $class)->where('fee_cat_id', $fee)->first();

        if($findClassFee){
            return redirect()->back()->with('warning', 'Class and Category already added. Please try again. Thank You!');
        }

        FeeStructure::create([
            'fee_cat_id' => $request->fee_category_id,
            'class_id'   => $request->class,
            'amount'     => $request->amount,
            'due_date'   => now()->addMonth(), // Optional: set default due date
        ]);

        return redirect()->back()->with('success', 'Fee Structure added successfully!');
    }

    public function financeFeePayment(){
        $company = Company::first();
        $category = FeeCategory::all();
        $student = Student::where('status', 1)->get();
        $classes = Room::all();
        $feeStructure = FeeStructure::all();
        $feePayment = feePaymentDetails::where('payment_date', now()->toDateString())->paginate(10);
        return view('finance.finance-fee-payment-details', compact('category','classes','feeStructure','student','feePayment','company'));
    }

    public function getStudentsByClass($class_id)
    {
        $students = Student::where('class_id', $class_id)->where('status', 1)->get();
        return response()->json($students);
    }

    public function getFeeStructuresByClass($class_id)
    {
        $feeStructures = FeeStructure::with('category', 'room')->where('class_id', $class_id)->get();
        return response()->json($feeStructures);
    }
    
    public function feePayment(Request $request){
        
        $request->validate([
            'student_id'      => 'required|exists:students,id',
            'fee_structure'   => 'required|array|min:1',
            'fee_structure.*' => 'exists:fee_structures,id',
            'amount_paid'     => 'required|numeric|min:0',
            'discount'        => 'nullable|numeric|min:0',
            'payment_method' => 'required|in:Cash,Card,Bank Transfer,Mobile Banking',
        ]);

        $month = now()->format('m');
        $year  = now()->format('Y');

        $feeStructures = FeeStructure::whereIn('id', $request->fee_structure)->get();

        $totalAmount   = $feeStructures->sum('amount');
        $discount      = $request->discount ?? 0;
        $netPayable    = max($totalAmount - $discount, 0);

        $paidAmount    = min($request->amount_paid, $netPayable);
        $dueAmount     = $netPayable - $paidAmount;

        // Duplicate Protection
        foreach ($feeStructures as $fee) {
            $exists = FeePaymentItem::where('student_id', $request->student_id)
                ->where('fee_structure_id', $fee->id)
                ->whereMonth('created_at', now()->month)
                ->whereYear('created_at', now()->year)
                ->exists();

            if ($exists) {
                return back()->with('error', $fee->name . ' already paid this month.');
            }
        }

        DB::beginTransaction();

        try {

            // Generate Receipt & Invoice
            do { $receipt = strtoupper(Str::random(10)); }
            while (FeePaymentDetails::where('receipt_no', $receipt)->exists());

            do { $invoice = 'INV-' . rand(10000, 99999); }
            while (FeePaymentDetails::where('invoice_no', $invoice)->exists());

            // Store Master Invoice
            $payment = FeePaymentDetails::create([
                'student_id'    => $request->student_id,
                'user_id'       => Auth::guard('teacher')->user()->id,
                'total_amount'  => $totalAmount,
                'total_paid'    => $paidAmount,
                'total_discount'=> $discount,
                'total_due'     => $dueAmount,
                'payment_date'  => $request->payment_date ?? now(),
                'month'         => $month,
                'year'          => $year,
                'payment_method'=> $request->payment_method,
                'status'        => $dueAmount > 0 ? 'Partial' : 'Paid',
                'receipt_no'    => $receipt,
                'invoice_no'    => $invoice,
            ]);

            // Distribute Amount Per Fee
            $accPaid = 0;
            $accDiscount = 0;
            $accDue = 0;
            $i = 0;
            $count = $feeStructures->count();

            foreach ($feeStructures as $fee) {
                $i++;
                $weight = $fee->amount / $totalAmount;

                $paid  = round($paidAmount * $weight, 2);
                $disc  = round($discount * $weight, 2);
                $due   = round(($fee->amount - $paid - $disc), 2);

                if ($i == $count) {
                    $paid = $paidAmount - $accPaid;
                    $disc = $discount - $accDiscount;
                    $due  = $netPayable - ($accPaid + $paid);
                }

                FeePaymentItem::create([
                    'fee_payment_id'  => $payment->id,
                    'student_id'      => $request->student_id,
                    'fee_structure_id'=> $fee->id,
                    'amount'          => $fee->amount,
                    'paid'            => $paid,
                    'discount'        => $disc,
                    'due'             => $due,
                ]);

                $accPaid += $paid;
                $accDiscount += $disc;
                $accDue += $due;
            }

            DB::commit();

            return back()->with('success', 'Fee payment successfully recorded.');

        } catch (\Exception $e) {

            DB::rollBack();

            return back()->with('error', 'Payment failed: ' . $e->getMessage());
        }
    }

    public function dueCollection(){
        $company = Company::first();
        $students = Student::all();
        $classes = Room::all();
        return view('finance.due-collection', compact('students','company','classes'));
    }

    public function showPayment($id){
        $company = Company::first();
        $feeStructures = FeePaymentItem::with(['student', 'feeStructure','payment'])->where('fee_payment_id', $id)->get();
        if ($feeStructures->isEmpty()) {
            return redirect()->back()
                ->with('error', 'Payment history not found. Please try again.');
        }

        $payment = feePaymentDetails::with('student','items','teacher')->findOrFail($id);

        // dd($feeStructures, $payment);

        return view('finance.fee-payment-structure-show', compact('feeStructures', 'payment','company'));
    }
}
