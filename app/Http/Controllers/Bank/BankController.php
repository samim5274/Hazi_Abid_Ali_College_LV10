<?php

namespace App\Http\Controllers\Bank;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;
use Illuminate\Validation\Rule;

use App\Models\Company;
use App\Models\BankDetail;
use App\Models\BankTransectionDetail;
use App\Models\Teacher;

class BankController extends Controller
{
    public function setting()
    {
        $company = Company::first();
        $bankDetails = BankDetail::all();
        return view('bank.bank-setting', compact('company','bankDetails'));
    }

    public function createBank(Request $request){
        // Validation
        $request->validate([
            'bank_name' => 'required|string|max:255',
            'branch_name' => 'nullable|string|max:255',
            'account_name' => 'required|string|max:255',
            'account_number' => [
                'required',
                'string',
                'max:255',
                // Unique in bank_details table
                Rule::unique('bank_details', 'account_number')->ignore($request->id ?? null)
            ],
            'routing_number' => 'nullable|string|max:255',
            'remarks' => 'nullable|string',
        ]);

        // -------------------------------
        // Insert Bank Details
        // -------------------------------
        $bank = new BankDetail();
        $bank->bank_name      = $request->bank_name;
        $bank->branch_name    = $request->branch_name;
        $bank->account_name   = $request->account_name;
        $bank->account_number = $request->account_number;
        $bank->routing_number = $request->routing_number;
        $bank->remarks        = $request->remarks;
        $bank->save();
        return back()->with('success', 'Bank details added successfully.');
    }

    public function editView($id){
        $company = Company::first();
        $bankDetails = BankDetail::find($id);
        return view('bank.bank-edit', compact('company','bankDetails'));
    }

    public function modifyBank(Request $request, $id){
        // Validate input
        $request->validate([
            'bank_name'      => 'required|string|max:255',
            'branch_name'    => 'nullable|string|max:255',
            'account_name'   => 'required|string|max:255',
            'account_number' => [
                'required',
                'string',
                'max:255',
                Rule::unique('bank_details', 'account_number')->ignore($id),
            ],
            'routing_number' => 'nullable|string|max:255',
            'remarks'        => 'nullable|string',
        ]);

        $bank = BankDetail::findOrFail($id);
        $bank->bank_name      = $request->bank_name;
        $bank->branch_name    = $request->branch_name;
        $bank->account_name   = $request->account_name;
        $bank->account_number = $request->account_number;
        $bank->routing_number = $request->routing_number;
        $bank->remarks        = $request->remarks;

        $bank->update();

        return redirect()->back()->with('success', 'Bank details modified successfully.');
    }

    public function deleteBank($id){
        $bank = BankDetail::findOrFail($id);
        // $bank->delete();
        return redirect()->back()->with('success', 'Bank deleted successfully.');
    }

    public function bankDepositView(){
        $company = Company::first();
        $bankDetails = BankDetail::all();
        $dipositDetails = BankTransectionDetail::with(['bank','teacher'])->where('status','Deposit')->where('date', Carbon::now()->format('Y-m-d'))->get();
        return view('bank.bank-deposit', compact('company','bankDetails','dipositDetails'));
    }

    public function dipositEdit($id){
        $company = Company::first();
        $bankDetails = BankDetail::all();
        $dipositDetails = BankTransectionDetail::with(['bank','teacher'])->where('id', $id)->where('status','Deposit')->first();
        return view('bank.bank-deposit-edit', compact('company','bankDetails','dipositDetails'));
    }

    public function dipositModify(Request $request, $id){
        // Validation
        $request->validate([
            'bank_name' => 'required|exists:bank_details,id',
            'amount'    => 'required|numeric|min:0',
            'remarks'   => 'nullable|string|max:500',
        ]);

        $deposit = BankTransectionDetail::find($id);

        if (!$deposit) {
            return redirect()->back()->with('error', 'Deposit not found!');
        }

        // Update data
        $deposit->bank_id = $request->bank_name;
        $deposit->amount  = $request->amount;
        $deposit->remarks = $request->remarks ?? 'N/A';
        $deposit->save();

        return redirect()->back()->with('success', 'Deposit updated successfully.');
    }

    public function deleteDiposit($id){
        $deposit = BankTransectionDetail::find($id);

        if (!$deposit) {
            return redirect()->back()->with('error', 'Deposit record not found!');
        }

        // $deposit->delete();

        return redirect()->back()->with('success', 'Deposit record deleted successfully.');
    }

    public function bankDepositAmount(Request $request){
        // Validation
        $request->validate([
            'bank_name' => 'required|exists:bank_details,id',
            'amount' => 'required|numeric|min:0',
            'remarks' => 'nullable|string',
        ]);

        $data = new BankTransectionDetail();
        $data->bank_id   = $request->bank_name;
        $data->user_id   = Auth::guard('teacher')->user()->id;
        $data->amount    = $request->amount;
        $data->date      = Carbon::now()->format('Y-m-d');
        $data->status    = 'Deposit';
        $data->remarks   = $request->remarks ?? 'N/A';
        $data->save();
        
        return back()->with('success', 'Amount deposited successfully.');
    }

    public function bankWithdrawView(){
        $company = Company::first();
        $bankDetails = BankDetail::all();
        $withdrawDetails = BankTransectionDetail::with(['bank','teacher'])->where('status','Withdraw')->where('date', Carbon::now()->format('Y-m-d'))->get();
        return view('bank.bank-withdraw', compact('company','bankDetails','withdrawDetails'));
    }

    public function bankWithdrawAmount(Request $request){
        // Validation
        $request->validate([
            'bank_name' => 'required|exists:bank_details,id',
            'amount' => 'required|numeric|min:0.01',
            'remarks' => 'nullable|string|max:255',
        ]);

        // Get Current Bank Balance
        $fromBankBalance = BankTransectionDetail::where('bank_id', $request->bank_name)
            ->selectRaw("
                COALESCE(SUM(CASE WHEN status='Deposit' THEN amount ELSE 0 END),0) -
                COALESCE(SUM(CASE WHEN status='Withdraw' THEN amount ELSE 0 END),0)
                AS balance
            ")->value('balance');

        $fromBankBalance = $fromBankBalance ?? 0;

        // Check If Enough Balance
        if ($request->amount > $fromBankBalance) {
            return back()->with('error', 'Insufficient balance! Available balance: ৳ ' . number_format($fromBankBalance, 2));
        }

        // Insert Withdraw Record
        $withdraw = new BankTransectionDetail();
        $withdraw->bank_id   = $request->bank_name;
        $withdraw->user_id   = Auth::guard('teacher')->id(); // Adjust guard if needed
        $withdraw->amount    = $request->amount;
        $withdraw->date      = Carbon::now()->format('Y-m-d');
        $withdraw->status    = 'Withdraw';
        $withdraw->remarks   = $request->remarks ?? 'N/A';
        $withdraw->save();

        return back()->with('success', 'Amount withdrawn successfully.');
    }

    public function withdrawEdit($id){
        $company = Company::first();
        $bankDetails = BankDetail::all();
        $withdrawDetails = BankTransectionDetail::with(['bank','teacher'])->where('id', $id)->where('status','Withdraw')->first();
        return view('bank.bank-withdraw-edit', compact('company','bankDetails','withdrawDetails'));
    }

    public function withdrawModify(Request $request, $id){
        // Validate input
        $request->validate([
            'bank_name' => 'required|exists:bank_details,id',
            'amount'    => 'required|numeric|min:0.01',
            'remarks'   => 'nullable|string|max:255',
        ]);

        // Find the withdraw record
        $withdraw = BankTransectionDetail::where('id', $id)->where('status', 'Withdraw')->first();

        if (!$withdraw) {
            return back()->with('error', 'Withdraw record not found.');
        }

        $newBankId = $request->bank_name;

        // Get current balance for the selected bank excluding this withdraw
        $currentBalance = BankTransectionDetail::where('bank_id', $newBankId)
                    ->where('id', '<>', $withdraw->id)
                    ->selectRaw("
                        COALESCE(SUM(CASE WHEN status='Deposit' THEN amount ELSE 0 END),0) -
                        COALESCE(SUM(CASE WHEN status='Withdraw' THEN amount ELSE 0 END),0) AS balance
                    ")->value('balance');        

        $currentBalance = $currentBalance ?? 0;

        // Check if requested amount is available
        if ($request->amount > $currentBalance) {
            return back()->with('error', 'Insufficient balance! Available balance: ৳ ' . number_format($currentBalance, 2));
        }

        // Update the withdraw record
        $withdraw->bank_id = $newBankId;
        $withdraw->user_id = Auth::guard('teacher')->id();
        $withdraw->amount  = $request->amount;
        $withdraw->remarks = $request->remarks ?? 'N/A';
        $withdraw->date    = Carbon::now()->format('Y-m-d');
        $withdraw->save();

        return back()->with('success', 'Withdraw updated successfully.');
    }

    public function withdrawDelete($id){
        
        $withdraw = BankTransectionDetail::where('id', $id)
                    ->where('status', 'Withdraw')
                    ->first();

        if (!$withdraw) {
            return back()->with('error', 'Withdraw record not found.');
        }

        // $withdraw->delete();

        return back()->with('success', 'Withdraw record deleted successfully.');
    }

    public function bankToTransectionView(){
        $company = Company::first();
        $bankDetails = BankDetail::all();
        $transectionDetails = BankTransectionDetail::with(['bank','teacher'])->where('date', Carbon::now()->format('Y-m-d'))->get();

        $depositSum = BankTransectionDetail::where('status','Deposit')
                ->where('date', Carbon::now()->format('Y-m-d'))
                ->sum('amount');

        $withdrawSum = BankTransectionDetail::where('status','Withdraw')
                        ->where('date', Carbon::now()->format('Y-m-d'))
                        ->sum('amount');

        $balance = $depositSum - $withdrawSum;
        return view('bank.bank-to-bank-transection', compact('company','bankDetails','transectionDetails','depositSum','withdrawSum','balance'));
    }

    public function bankToBankTransection(Request $request){
        // Validation
        $request->validate([
            'from_bank' => 'required|exists:bank_details,id',
            'to_bank' => 'required|exists:bank_details,id|different:from_bank',
            'amount' => 'required|numeric|min:0',
            'remarks' => 'nullable|string',
        ]);

        // Get From Bank Current Balance
        $fromBankBalance = BankTransectionDetail::where('bank_id', $request->from_bank)
                            ->selectRaw("
                                SUM(CASE WHEN status='Deposit' THEN amount ELSE 0 END) -
                                SUM(CASE WHEN status='Withdraw' THEN amount ELSE 0 END)
                                AS balance
                            ")
                            ->value('balance');

        $fromBankBalance = $fromBankBalance ?? 0;

        // Check Enough Balance
        if ($request->amount > $fromBankBalance) {
            return back()->with('error', 'Not enough balance! Available balance: ' . number_format($fromBankBalance, 2));
        }

        // Withdraw from From Bank
        $withdraw = new BankTransectionDetail();
        $withdraw->bank_id   = $request->from_bank;
        $withdraw->user_id   = Auth::guard('teacher')->user()->id;
        $withdraw->amount    = $request->amount;
        $withdraw->date      = Carbon::now()->format('Y-m-d');
        $withdraw->status    = 'Withdraw';
        $withdraw->remarks   = 'Transfer to Bank ID: ' . $request->to_bank . '. ' . ($request->remarks ?? '');
        $withdraw->save();

        // Deposit to To Bank
        $deposit = new BankTransectionDetail();
        $deposit->bank_id   = $request->to_bank;
        $deposit->user_id   = Auth::guard('teacher')->user()->id;
        $deposit->amount    = $request->amount;
        $deposit->date      = Carbon::now()->format('Y-m-d');
        $deposit->status    = 'Deposit';
        $deposit->remarks   = 'Transfer from Bank ID: ' . $request->from_bank . '. ' . ($request->remarks ?? '');
        $deposit->save();

        return back()->with('success', 'Bank to bank transection completed successfully.');
    }

    public function totalTransectionReport(){
        $company = Company::first();
        $transectionDetails = BankTransectionDetail::with(['bank','teacher'])->orderBy('date', 'desc')->get();
        $balance = BankTransectionDetail::where('date', Carbon::now()->format('Y-m-d'))
                    ->where('status', 'Deposit')
                    ->sum('amount') - BankTransectionDetail::where('date', Carbon::now()->format('Y-m-d'))
                    ->where('status', 'Withdraw')
                    ->sum('amount');    
        return view('bank.report.total-transection-report', compact('company','transectionDetails','balance'));
    }

    public function filterTransectionDate(Request $request){
        $request->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $company = Company::first();
        $transectionDetails = BankTransectionDetail::with(['bank','teacher'])->whereBetween('date', [$request->start_date, $request->end_date])
                                    ->orderBy('date', 'desc')
                                    ->get();
        $balance = BankTransectionDetail::whereBetween('date', [$request->start_date, $request->end_date])
                    ->where('status', 'Deposit')
                    ->sum('amount') - BankTransectionDetail::whereBetween('date', [$request->start_date, $request->end_date])
                    ->where('status', 'Withdraw')
                    ->sum('amount'); 
        if($request->print){
            return view('bank.report.print.print-total-transection', compact('company','transectionDetails','balance'));
        }   
        return view('bank.report.total-transection-report', compact('company','transectionDetails','balance'));
    }

    public function totalDiposit(){
        $date = Carbon::now()->format('Y-m-d');
        $company = Company::first();
        $bankDetails = BankDetail::all();
        $dipositDetails = BankTransectionDetail::with(['bank','teacher'])->where('status','Deposit')->where('date', $date)->orderBy('date', 'desc')->get();
        $total = BankTransectionDetail::where('status', 'Deposit')->sum('amount');
        return view('bank.report.total-diposit-report', compact('company','dipositDetails','total','bankDetails'));
    }

    public function filterDipositDate(Request $request){
        // Validation
        $request->validate([
            'start_date' => 'required|date',
            'end_date'   => 'required|date|after_or_equal:start_date',
            'cbxBankid'  => 'nullable|exists:bank_details,id', // Bank is optional
        ]);

        $company = Company::first();
        $bankDetails = BankDetail::all();

        $dipositQuery = BankTransectionDetail::with(['bank','teacher'])->where('status', 'Deposit')
            ->whereBetween('date', [$request->start_date, $request->end_date]);

        if ($request->filled('cbxBankid')) {
            $dipositQuery->where('bank_id', $request->cbxBankid);
        }

        $dipositDetails = $dipositQuery->orderBy('date', 'desc')->get();

        $totalQuery = BankTransectionDetail::where('status', 'Deposit')
            ->whereBetween('date', [$request->start_date, $request->end_date]);

        if ($request->filled('cbxBankid')) {
            $totalQuery->where('bank_id', $request->cbxBankid);
        }

        $total = $totalQuery->sum('amount');

        if($request->print){
            return view('bank.report.print.total-diposit-report-print', compact(
                'company',
                'dipositDetails',
                'total',
                'bankDetails'
            ));
        }

        return view('bank.report.total-diposit-report', compact(
            'company',
            'dipositDetails',
            'total',
            'bankDetails'
        ));
    }

    public function totalWithdraw(){
        $company = Company::first();
        $bankDetails = BankDetail::all();
        $withdrawDetails = BankTransectionDetail::with(['bank','teacher'])->where('status','Withdraw')->orderBy('date', 'desc')->get();
        $total = BankTransectionDetail::where('status', 'Withdraw')->sum('amount');
        return view('bank.report.total-withdraw-report', compact('company','withdrawDetails','total','bankDetails'));
    }

    public function filterWithdrawDate(Request $request){
        // Validation
        $request->validate([
            'start_date' => 'required|date',
            'end_date'   => 'required|date|after_or_equal:start_date',
            'cbxBankid'  => 'nullable|exists:bank_details,id', // bank optional
        ]);

        $company = Company::first();
        $bankDetails = BankDetail::all();

        // Withdraw query
        $withdrawQuery = BankTransectionDetail::where('status', 'Withdraw')
            ->whereBetween('date', [$request->start_date, $request->end_date]);

        // Only filter by bank if selected
        if ($request->filled('cbxBankid')) {
            $withdrawQuery->where('bank_id', $request->cbxBankid);
        }

        $withdrawDetails = $withdrawQuery->orderBy('date', 'desc')->get();

        // Total calculation
        $totalQuery = BankTransectionDetail::where('status', 'Withdraw')
            ->whereBetween('date', [$request->start_date, $request->end_date]);

        if ($request->filled('cbxBankid')) {
            $totalQuery->where('bank_id', $request->cbxBankid);
        }

        $total = $totalQuery->sum('amount');

        if($request->print){
            return view('bank.report.print.total-withdraw-report-print', compact(
                'company',
                'withdrawDetails',
                'total',
                'bankDetails'
            ));
        }

        return view('bank.report.total-withdraw-report', compact(
            'company',
            'withdrawDetails',
            'total',
            'bankDetails'
        ));
    }
}
