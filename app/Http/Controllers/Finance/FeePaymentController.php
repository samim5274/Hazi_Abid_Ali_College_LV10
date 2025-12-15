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

    public function editCategory($id){
        $category = FeeCategory::find($id);
        if(!$category){
            return redirect()->back()->with('error', 'Finance category not found. Please try again. Thank you!');
        }
        $company = Company::first();
        return view('finance.edit-finance-category', compact('category','company'));
    }

    public function updateCategory(Request $request, $id){
        $request->validate([
            'category_name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $category = FeeCategory::find($id);
        if(!$category){
            return redirect()->back()->with('error', 'Finance category not found. Please try again. Thank you!');
        }

        $category->name = $request->category_name;
        $category->description = $request->description;
        $category->update();
        return redirect()->route('finance-management')->with('success', 'Fee category updated successfully');
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

    public function updateStructre($id){
        $company = Company::first();
        $category = FeeCategory::all();
        $classes = Room::all();
        $feeStructure = FeeStructure::find($id);
        if(!$feeStructure){
            return redirect()->back()->with('error', 'Finance fee structure not found. Please try again. Thank you!');
        }
        return view('finance.edit-finance-fee-structure', compact('category','classes','feeStructure','company'));
    }

    public function editStructre(Request $request, $id){
        $request->validate([
            'fee_category_id' => 'required',
            'class_id'        => 'required',
            'amount'          => 'required|numeric|min:1',
        ]);

        $feeStructure = FeeStructure::findOrFail($id);

        // 🔹 Check if class/category actually changed
        $isChanged = $feeStructure->class_id != $request->class_id || $feeStructure->fee_cat_id != $request->fee_category_id;

        // 🔹 Only check duplicate if changed
        if ($isChanged) {
            $exists = FeeStructure::where('class_id', $request->class_id)
                ->where('fee_cat_id', $request->fee_category_id)
                ->exists();

            if ($exists) {
                return redirect()->back()
                    ->withInput()
                    ->with('warning', 'This class and fee category already exists.');
            }
        }

        $feeStructure->fee_cat_id   = $request->fee_category_id;
        $feeStructure->class_id     = $request->class_id;
        $feeStructure->amount       = $request->amount;
        $feeStructure->update();
        return redirect()->back()->with('success', 'Finance fee structure updated successfully.');
    }

    public function financeFeePayment(){
        $company = Company::first();
        $category = FeeCategory::all();
        $student = Student::where('status', 1)->get();
        $classes = Room::all();
        $feeStructure = FeeStructure::with('room','category','paymentItems')->get();
        $feePayment = feePaymentDetails::with('student','teacher','items')->where('payment_date', now()->toDateString())->orderBy('id', 'desc')->paginate(10);
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
            'payment_method'  => 'required|in:Cash,Card,Bank Transfer,Mobile Banking',
        ]);

        if ($request->amount_paid <= '0') {
            return back()->with('error', 'Full due payment not exceed. Thank You!');
        }

        $month = now()->format('m');
        $year  = now()->format('Y');

        $feeStructures = FeeStructure::whereIn('id', $request->fee_structure)->get();

        $totalAmount   = $feeStructures->sum('amount');
        if ($totalAmount <= 0) {
            return back()->with('error', 'Invalid fee amount configuration.');
        }

        $discount      = $request->discount ?? 0;
        $netPayable    = max($totalAmount - $discount, 0);

        if ($request->amount_paid > $netPayable) {
            return back()->with('error', 'Paid amount cannot exceed payable amount.');
        }

        $paidAmount    = min($request->amount_paid, $netPayable);
        $dueAmount     = $netPayable - $paidAmount;

        // Duplicate Protection
        foreach ($feeStructures as $fee) {
            $exists = FeePaymentItem::where('student_id', $request->student_id)
                ->where('fee_structure_id', $fee->id)
                ->whereMonth('payment_date', $month)
                ->whereYear('payment_date', $year)
                ->exists();

            if ($exists) {
                return back()->with('error', $fee->category->name . ' already paid this month & year.');
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
                    $due = $fee->amount - ($paid + $disc);
                }

                FeePaymentItem::create([
                    'fee_payment_id'  => $payment->id,
                    'student_id'      => $request->student_id,
                    'fee_structure_id'=> $fee->id,
                    'amount'          => $fee->amount,
                    'paid'            => $paid,
                    'discount'        => $disc,
                    'due'             => $due,
                    'payment_date'    => $this->date,
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

    public function feePayPrintReceipt($receipt){
        $company = Company::first();
        
        $payment = feePaymentDetails::with('student','items','teacher')->where('receipt_no', $receipt)->first();
        if (!$payment) {
            return redirect()->back()->with('error', 'Payment history not found. Please try again.');
        }

        $feeStructures = $payment->items;

        return view('finance.print-fee-payment', compact('feeStructures', 'payment','company'));
    }
}
