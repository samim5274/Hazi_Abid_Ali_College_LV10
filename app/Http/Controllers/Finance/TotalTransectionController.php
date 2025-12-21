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

class TotalTransectionController extends Controller
{
    public function totalTransectionSummary(){
        $company = Company::first();
        $today = Carbon::today()->toDateString();
        $total = feePaymentDetails::where('payment_date', $today)->get();
        $expenses = Expenses::where('date', $today)->get();
        return view('finance.total-transection-summary', compact('company', 'expenses', 'total'));
    }
}
