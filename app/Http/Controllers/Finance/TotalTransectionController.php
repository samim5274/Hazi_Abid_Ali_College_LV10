<?php

namespace App\Http\Controllers\Finance;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

use Auth;
use App\Models\Company;
use App\Models\feePaymentDetails;
use App\Models\FeePaymentItem;
use App\Models\Expenses;
use App\Models\BankTransectionDetail;
use App\Models\Income;

class TotalTransectionController extends Controller
{
    public function totalTransectionSummary(){
        $company = Company::first();
        $today = Carbon::today()->toDateString();

        // Fee payment
        $total = feePaymentDetails::where('payment_date', $today)->get();

        // Expenses
        $expenses = Expenses::where('date', $today)->get();

        // Extra Income
        $incomes = Income::where('income_date', $today)->get();

        // Banking section
        $bankTransactions = BankTransectionDetail::whereDate('date', $today)->get();
        $depositSum = $bankTransactions->where('status', 'Deposit')->sum('amount');
        $withdrawSum = $bankTransactions->where('status', 'Withdraw')->sum('amount');
        $bankBalance = $depositSum - $withdrawSum;

        // Calculated values
        $totalTransactions = $total->sum('total_amount');
        $totalIncome = $total->sum('total_paid') + $incomes->sum('amount') + $bankBalance;
        $totalExpense = $expenses->sum('amount');
        $netBalance = $totalIncome - $totalExpense;

        $feeCollection = $total->sum('total_paid');
        $totalDue = $total->sum('total_due');
        $discount = $total->sum('total_discount');
        $refund = 0; // add if exists

        return view('finance.total-transection-summary', compact(
            'company', 'expenses', 'total', 'depositSum', 'withdrawSum', 
            'bankBalance', 'incomes', 'totalTransactions', 'totalIncome', 
            'totalExpense', 'netBalance', 'feeCollection', 'totalDue', 'discount', 'refund'
        ));
    }
}
