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

class FinanceController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function FeeCollection(){
        $classes = Room::all();
        return view('finance.finance-structure', compact('classes'));
    }

    public function StudentList($class_id){
        $student = Student::with('room')->where('class_id', $class_id)->get();
        
        if ($student->isEmpty()){
            return redirect('class-list')->with('error','This class no student available now.');
        }

        return view('finance.finance-student-list', compact('class_id','student'));
    }

    public function feeView($class_id, $student_id){
        //
    }

    public function financeManagement(){
        $category = FeeCategory::paginate(10);
        return view('finance.finance-management', compact('category'));
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
        $category = FeeCategory::all();
        $classes = Room::all();
        $feeStructure = FeeStructure::paginate(10);
        return view('finance.finance-fee-structure', compact('category','classes','feeStructure'));
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
        $category = FeeCategory::all();
        $student = Student::all();
        $classes = Room::all();
        $feeStructure = FeeStructure::all();
        $feePayment = FeePayment::where('payment_date', now()->toDateString())->paginate(10);
        return view('finance.finance-fee-payment', compact('category','classes','feeStructure','student','feePayment'));
    }

    public function getStudentsByClass($class_id)
    {
        $students = Student::where('class_id', $class_id)->get();
        return response()->json($students);
    }

    public function getFeeStructuresByClass($class_id)
    {
        $feeStructures = FeeStructure::with('category', 'room')->where('class_id', $class_id)->get();
        return response()->json($feeStructures);
    }

    // public function confirmPayment(Request $request){

    //     $request->validate([ 
    //         'student_id'      => 'required|exists:students,id', 
    //         'fee_structure'   => 'required|array|min:1', 
    //         'fee_structure.*' => 'exists:fee_structures,id', 
    //         'amount_paid'     => 'required|numeric|min:0',
    //         'discount'        => 'nullable|numeric|min:0',
    //         'payment_method'  => 'required|string|in:Cash,Card,Bank Transfer,Mobile Banking', 
    //     ]);

    //     $month = Carbon::now()->format('m');
    //     $year  = Carbon::now()->format('Y');

    //     $feeStructures = FeeStructure::whereIn('id', $request->fee_structure)->get();

    //     $totalAmount = $feeStructures->sum('amount');

    //     $totalPaid     = $request->amount_paid;
    //     $totalDiscount = $request->discount ?? 0;

    //     foreach ($feeStructures as $feeStructure) {

    //         $weight = $feeStructure->amount / $totalAmount;

    //         $paidForThis = round($totalPaid * $weight, 2);
    //         $discountForThis = round($totalDiscount * $weight, 2);
    //         $dueForThis = $feeStructure->amount - $paidForThis - $discountForThis;

    //         $existing = FeePayment::where('student_id', $request->student_id)
    //                     ->where('fee_structure_id', $feeStructure->id)
    //                     ->where('month', $month)
    //                     ->where('year', $year)
    //                     ->first();
    //         if ($existing) {
    //             return redirect()->back()->with('error', 'এই মাসের জন্য "' . $feeStructure->name . '" ফি ইতিমধ্যেই পেমেন্ট করা হয়েছে।');
    //         }

    //         $payment = new FeePayment();
    //         $payment->student_id       = $request->student_id;
    //         $payment->fee_structure_id = $feeStructure->id;
    //         $payment->amount_paid      = $paidForThis;
    //         $payment->discount         = $discountForThis;
    //         $payment->due_amount       = $dueForThis;
    //         $payment->month            = $month;
    //         $payment->year             = $year;
    //         $payment->payment_date     = $request->payment_date ?? now()->toDateString();
    //         $payment->payment_method   = $request->payment_method ?? 'Cash';
    //         $payment->status           = $dueForThis > 0 ? 'Due' : 'Paid';

    //         do {
    //             $receipt = strtoupper(Str::random(8));
    //         } while (FeePayment::where('receipt_no', $receipt)->exists());

    //         $payment->receipt_no = $receipt;
    //         $payment->save();
    //     }

    //     return redirect()->back()->with('success', 'ফি পেমেন্ট সফলভাবে রেকর্ড করা হয়েছে!');
    // }

    public function confirmPayment(Request $request){

        $request->validate([ 
            'student_id'      => 'required|exists:students,id', 
            'fee_structure'   => 'required|array|min:1', 
            'fee_structure.*' => 'exists:fee_structures,id', 
            'amount_paid'     => 'required|numeric|min:0',
            'discount'        => 'nullable|numeric|min:0',
            'payment_method'  => 'required|string|in:Cash,Card,Bank Transfer,Mobile Banking', 
        ]);

        $month = Carbon::now()->format('m');
        $year  = Carbon::now()->format('Y');

        $feeStructures = FeeStructure::whereIn('id', $request->fee_structure)->get();
        $totalFee = $feeStructures->sum('amount');

        $paid = min($request->amount_paid, $totalFee);
        $discount = $request->discount ?? 0;

        $remaining = max($totalFee - $discount, 0);

        $paid = min($paid, $remaining);

        $due = max($remaining - $paid, 0);

        $accPaid = 0;
        $accDiscount = 0;
        $accDue = 0;
        $count = $feeStructures->count();
        $i = 0;

        foreach ($feeStructures as $feeStructure) {
            $i++;

            $weight = $feeStructure->amount / $totalFee;

            $paidForThis = round($paid * $weight, 2);
            $discountForThis = round($discount * $weight, 2);
            $dueForThis = round($due * $weight, 2);

            if ($i === $count) {
                $paidForThis = $paid - $accPaid;
                $discountForThis = $discount - $accDiscount;
                $dueForThis = $due - $accDue;
            }

            $existing = FeePayment::where('student_id', $request->student_id)
                ->where('fee_structure_id', $feeStructure->id)
                ->where('month', $month)
                ->where('year', $year)
                ->first();
            if ($existing) {
                return redirect()->back()->with('error', $feeStructure->name . 'Fees for this month have already been paid.');
            }

            $payment = new FeePayment();
            $payment->student_id       = $request->student_id;
            $payment->fee_structure_id = $feeStructure->id;
            $payment->amount_paid      = $paidForThis;
            $payment->discount         = $discountForThis;
            $payment->due_amount       = $dueForThis > 0 ? $dueForThis : 0;
            $payment->month            = $month;
            $payment->year             = $year;
            $payment->payment_date     = $request->payment_date ?? now()->toDateString();
            $payment->payment_method   = $request->payment_method ?? 'Cash';
            $payment->status           = $dueForThis > 0 ? 'Partial' : 'Paid';

            do {
                $receipt = strtoupper(Str::random(8));
            } while (FeePayment::where('receipt_no', $receipt)->exists());
            $payment->receipt_no = $receipt;

            $payment->save();

            $accPaid += $paidForThis;
            $accDiscount += $discountForThis;
            $accDue += $dueForThis;
        }

        return redirect()->back()->with('success', 'Fee payment has been recorded successfully!');
    }

}
