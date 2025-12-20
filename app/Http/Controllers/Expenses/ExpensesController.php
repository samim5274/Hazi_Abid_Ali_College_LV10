<?php

namespace App\Http\Controllers\Expenses;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use App\Models\Excategory;
use App\Models\Exsubcategory;
use App\Models\Expenses;
use App\Models\Company;

class ExpensesController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function index(){
        $company = Company::first();
        $categries = Excategory::all();
        $expenses = Expenses::with('category','subcategory', 'user')->get();
        return view('expenses.expenses', compact('categries','expenses','company'));
    }

    public function getSubCategory($id) {
        $subcategories = Exsubcategory::where('cat_id', $id)->get();
        return response()->json($subcategories);
    }

    public function store(Request $request){
        $request->validate([
            'title' => 'required|string|max:255',
            'category_id' => 'required|exists:excategories,id',
            'subcategory_id' => 'required|exists:exsubcategories,id',
            'amount' => 'required|numeric|min:1',
            'description' => 'nullable|string|max:1000',
        ]);


        $data = new Expenses();
        $data->title = $request->title;
        $data->catId = $request->category_id;
        $data->subcatId = $request->subcategory_id;
        $data->userId = Auth::guard('teacher')->user()->id;
        $data->amount = $request->amount;
        $data->date = Carbon::now()->format('Y-m-d');
        $data->remark = $request->description;
        $data->save();

        return redirect()->back()->with('success', 'Expense added successfully!');
    }

    public function print($id){
        $company = Company::first();
        $expense = Expenses::with(['category', 'subcategory', 'user'])->find($id);
        if(!$expense){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        return view('expenses.expenses-print', compact('expense','company'));
    }

    public function delete($id){
        $data = Expenses::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        // $data->delete();
        return redirect()->back()->with('success', 'Expenses deleted successfully.');
    }

    public function expensesView($id){
        $company = Company::first();
        $expense = Expenses::find($id);
        if(!$expense){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        return view('expenses.expenses-view', compact('expense','company'));
    }

    public function edit($id){
        $company = Company::first();
        $expense = Expenses::find($id);
        $categries = Excategory::all();
        $subcategories = Exsubcategory::all();
        if(!$expense){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        return view('expenses.expenses-edit', compact('expense','categries','subcategories','company'));
    }

    public function update(Request $request, $id){
        $request->validate([
            'title' => 'required|string|max:255',
            'catId' => 'required|exists:excategories,id',
            'subcategory_id' => 'required|exists:exsubcategories,id',
            'amount' => 'required|numeric|min:1',
            'description' => 'nullable|string|max:1000',
        ]);

        $data = Expenses::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        $data->title = $request->title;
        $data->catId = $request->catId;
        $data->subcatId = $request->subcategory_id;
        $data->userId = Auth::guard('teacher')->user()->id;
        $data->amount = $request->amount;
        $data->date = Carbon::now()->format('Y-m-d');
        $data->remark = $request->description;
        $data->update();

        return redirect()->back()->with('success', 'Expense added successfully!');
    }

    public function dateExpenses(){
        $company = Company::first();
        $date = Carbon::today();
        $expenses = Expenses::where('date', $date)->get();
        return view('expenses.report.expenses-report', compact('expenses','company'));
    }

    public function filterExpenses(Request $request){
        $request->validate([
            'from_date' => 'required|date',
            'to_date'   => 'required|date|after_or_equal:from_date',
        ]);

        $company = Company::first();

        $from_date = $request->from_date;
        $to_date = $request->to_date;

        $query = Expenses::query();

        if ($request->filled('from_date') && $request->filled('to_date')) {
            $query->whereBetween('date', [
                Carbon::parse($from_date)->startOfDay(),
                Carbon::parse($to_date)->endOfDay()
            ]);
        } 
        elseif ($request->filled('from_date')) {
            $query->whereDate('date', '>=', $from_date);
        } 
        elseif ($request->filled('to_date')) {
            $query->whereDate('date', '<=', $to_date);
        }

        $expenses = $query->latest()->get();

        if($request->has('print')){
            return view('expenses.report.print.print-expenses-report', compact('expenses','from_date','to_date','company'));
        }

        return view('expenses.report.expenses-report', compact('expenses','company'));
    }

    public function categroyExpenses(){
        $date = Carbon::today();
        $company = Company::first();
        $categories = Excategory::all();
        $expenses = Expenses::where('date', $date)->get();
        return view('expenses.report.category-expenses-report', compact('expenses','categories','company'));
    }

    public function filterCatExpen(Request $request){
        $request->validate([
            'from_date'   => 'required|date',
            'to_date'     => 'required|date|after_or_equal:from_date',
            'category_id' => 'required|exists:excategories,id',
        ]);

        $company = Company::first();

        $from_date = $request->from_date;
        $to_date   = $request->to_date;
        $category_id = $request->category_id;

        $categories = Excategory::all();

        $query = Expenses::where('catId', $category_id);

        $query->whereBetween('date', [
            Carbon::parse($from_date)->startOfDay(),
            Carbon::parse($to_date)->endOfDay(),
        ]);

        $expenses = $query->latest()->get();

        if($request->has('print')){
            return view('expenses.report.print.print-category-expenses-report', compact(
                'expenses',
                'categories',
                'from_date',
                'to_date',
                'category_id',
                'company'
            ));
        }

        return view('expenses.report.category-expenses-report', compact(
            'expenses',
            'categories',
            'from_date',
            'to_date',
            'category_id',
            'company'
        ));
    }

    public function subCategoyExpenses(){
        $date = Carbon::today();
        $company = Company::first();
        $categories = Excategory::all();
        $expenses = Expenses::where('date', $date)->get();
        return view('expenses.report.sub-category-expenses-report', compact('expenses','categories','company'));
    }

    public function filterSubCatExpen(Request $request){
        $request->validate([
            'from_date'   => 'required|date',
            'to_date'     => 'required|date|after_or_equal:from_date',
            'category_id' => 'required|exists:excategories,id',
            'subcategory_id' => 'required|exists:exsubcategories,id',
        ]);

        $company = Company::first();

        $from_date = $request->from_date;
        $to_date   = $request->to_date;
        $category_id = $request->category_id;
        $sub_category_id = $request->subcategory_id;

        $categories = Excategory::all();

        $expenses = Expenses::where('catId', $category_id)
                        ->where('subcatId', $sub_category_id)
                        ->whereBetween('date', [
                            Carbon::parse($from_date)->startOfDay(),
                            Carbon::parse($to_date)->endOfDay(),
                        ])->latest()->get();

        if($request->has('print')){
            return view('expenses.report.print.print-sub-category-expenses-report', compact(
                'expenses',
                'categories',
                'from_date',
                'to_date',
                'category_id',
                'sub_category_id',
                'company'
            ));
        }

        return view('expenses.report.sub-category-expenses-report', compact(
            'expenses',
            'categories',
            'from_date',
            'to_date',
            'category_id',
            'sub_category_id',
            'company'
        ));
    }
}
