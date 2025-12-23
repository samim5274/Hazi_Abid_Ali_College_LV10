<?php

namespace App\Http\Controllers\Income;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use App\Models\Income;
use App\Models\IncomeCategory;
use App\Models\IncomeSubCategory;
use App\Models\Company;

class IncomeController extends Controller
{
    public function index()
    {
        $company = Company::first();
        $Incomes = Income::with(['category', 'subcategory', 'user'])->get();
        $categories = IncomeCategory::get();
        $subcategories = IncomeSubCategory::get();
        return view('income.income_view', compact('company', 'Incomes', 'categories', 'subcategories'));
    }

    public function getIncomeSubCategory($id)
    {
        $subcategories = IncomeSubCategory::where('category_id', $id)->get(['id', 'name']);
        return response()->json($subcategories);
    }

    public function store(Request $request)
    {
        // Validation
        $request->validate([
            'title'            => 'required|string|max:255',
            'category_id'      => 'required|exists:income_categories,id',
            'subcategory_id'   => 'required|exists:income_sub_categories,id',
            'amount'           => 'required|numeric|min:0',
            'description'      => 'nullable|string|max:500',
        ], [
            'category_id.required'    => 'Please select a valid category',
            'category_id.exists'      => 'Selected category does not exist',
            'subcategory_id.required' => 'Please select a valid subcategory',
            'subcategory_id.exists'   => 'Selected subcategory does not exist',
            'title.required'          => 'Income title is required',
            'amount.required'         => 'Please enter an amount',
        ]);

        $income = new Income();
        $income->category_id = $request->category_id;
        $income->subcategory_id = $request->subcategory_id;
        $income->user_id = Auth::guard('teacher')->user()->id;
        $income->income_date = Carbon::now()->format('Y-m-d');
        $income->title = $request->title ?? 'N/A';
        $income->description = $request->remarks ?? 'N/A';
        $income->amount = $request->amount;
        $income->save();

        return redirect()->back()->with('success', 'Income Recorded Successfully');
    }

    public function incomeView($id)
    {
        $company = Company::first();
        $income = Income::with('category', 'subcategory', 'user')->findOrFail($id);
        return view('income.income_details_view', compact('company', 'income'));
    }

    public function print($id)
    {
        $company = Company::first();
        $income = Income::with('category', 'subcategory', 'user')->findOrFail($id);
        return view('income.income_print_view', compact('company', 'income'));
    }

    public function delete($id)
    {
        $income = Income::findOrFail($id);
        // $income->delete();

        return redirect()->back()->with('success', 'Income Deleted Successfully');
    }

    public function edit($id)
    {
        $company = Company::first();
        $income = Income::with(['category', 'subcategory', 'user'])->findOrFail($id);
        $categories = IncomeCategory::get();
        $subcategories = IncomeSubCategory::get();
        return view('income.edit_income_view', compact('company', 'income', 'categories', 'subcategories'));
    }

    public function update(Request $request, $id)
    {
        // Validation
        $request->validate([
            'title'            => 'required|string|max:255',
            'category_id'      => 'required|exists:income_categories,id',
            'subcategory_id'   => 'required|exists:income_sub_categories,id',
            'amount'           => 'required|numeric|min:0',
            'description'      => 'nullable|string|max:500',
        ], [
            'category_id.required'    => 'Please select a valid category',
            'category_id.exists'      => 'Selected category does not exist',
            'subcategory_id.required' => 'Please select a valid subcategory',
            'subcategory_id.exists'   => 'Selected subcategory does not exist',
            'title.required'          => 'Income title is required',
            'amount.required'         => 'Please enter an amount',
        ]);

        $income = Income::findOrFail($id);
        $income->category_id = $request->category_id;
        $income->subcategory_id = $request->subcategory_id;
        $income->title = $request->title;
        $income->description = ($request->description ?? 'N/A') 
                                    . " || Date:" 
                                    . Carbon::now() 
                                    . " || Updated by " 
                                    . Auth::guard('teacher')->user()->first_name . " " . Auth::guard('teacher')->user()->last_name.".";
        $income->amount = $request->amount;
        $income->save();

        return redirect()->back()->with('success', 'Income Updated Successfully');
    }

    public function incomeSetting()
    {
        $company = Company::first();
        $categories = IncomeCategory::get();
        $subcategories = IncomeSubCategory::with('category')->get();
        return view('income.income_setting_view', compact('company', 'categories', 'subcategories'));
    }

    public function storeIncomeCategory(Request $request)
    {
        $request->validate([
            'txtCategoryName' => 'required|string|max:255|unique:income_categories,name',
            'remarks'         => 'nullable|string|max:500',
        ], [
            'txtCategoryName.required' => 'Category name is required',
            'txtCategoryName.unique'  => 'This category already exists',
        ]);

        $category = new IncomeCategory();
        $category->name = $request->txtCategoryName;
        $category->description = $request->remarks ?? 'N/A';
        $category->save();

        return redirect()->back()->with('success', 'Income Category Created Successfully');
    }

    public function editIncomeCategory($id)
    {
        $company = Company::first();
        $category = IncomeCategory::findOrFail($id);
        return view('income.edit_income_category_view', compact('company', 'category'));
    }

    public function modifyIncomeCategory(Request $request, $id)
    {
        $request->validate([
            'txtCategoryName' => 'required|string|max:255|unique:income_categories,name,' . $id,
            'remarks'         => 'nullable|string|max:500',
        ], [
            'txtCategoryName.required' => 'Category name is required',
            'txtCategoryName.unique'  => 'This category already exists',
        ]);

        $category = IncomeCategory::findOrFail($id);
        $category->name = $request->txtCategoryName;
        $category->description = $request->remarks ?? 'N/A';
        $category->save();

        return redirect()->back()->with('success', 'Income Category Updated Successfully');
    }

    public function deleteIncomeCategory($id)
    {
        $category = IncomeCategory::findOrFail($id);
        // $category->delete();

        return redirect()->back()->with('success', 'Income Category Deleted Successfully');
    }

    // sub category function here
    public function storeIncomeSubCategory(Request $request)
    {
        $request->validate([
            'txtSubCategoryName' => 'required|string|max:255|unique:income_sub_categories,name',
            'category_id'        => 'required|exists:income_categories,id',
            'remarks'            => 'nullable|string|max:500',
        ], [
            'txtSubCategoryName.required' => 'Subcategory name is required',
            'txtSubCategoryName.unique'   => 'This subcategory already exists',
            'category_id.required'        => 'Please select a valid category',
            'category_id.exists'          => 'Selected category does not exist',
        ]);

        $subcategory = new IncomeSubCategory();
        $subcategory->name = $request->txtSubCategoryName;
        $subcategory->category_id = $request->category_id;
        $subcategory->description = $request->remarks ?? 'N/A';
        $subcategory->save();

        return redirect()->back()->with('success', 'Income Subcategory Created Successfully');
    }

    public function editIncomeSubCategory($id)
    {
        $company = Company::first();
        $subcategory = IncomeSubCategory::findOrFail($id);
        $categories = IncomeCategory::get();
        return view('income.edit_income_subcategory_view', compact('company', 'subcategory', 'categories'));
    }

    public function modifyIncomeSubCategory(Request $request, $id)
    {
        $request->validate([
            'txtSubCategoryName' => 'required|string|max:255|unique:income_sub_categories,name,' . $id,
            'category_id'        => 'required|exists:income_categories,id',
            'remarks'            => 'nullable|string|max:500',
        ], [
            'txtSubCategoryName.required' => 'Subcategory name is required',
            'txtSubCategoryName.unique'   => 'This subcategory already exists',
            'category_id.required'        => 'Please select a valid category',
            'category_id.exists'          => 'Selected category does not exist',
        ]);

        $subcategory = IncomeSubCategory::findOrFail($id);
        $subcategory->name = $request->txtSubCategoryName;
        $subcategory->category_id = $request->category_id;
        $subcategory->description = $request->remarks ?? 'N/A';
        $subcategory->save();

        return redirect()->back()->with('success', 'Income Subcategory Updated Successfully');
    }

    public function deleteIncomeSubCategory($id)
    {
        $subcategory = IncomeSubCategory::findOrFail($id);
        // $subcategory->delete();

        return redirect()->back()->with('success', 'Income Subcategory Deleted Successfully');
    }

    // Income Report Functions
    public function dateIncome()
    {
        $company = Company::first();
        $today = Carbon::now()->format('Y-m-d');
        $Incomes = Income::with(['category', 'subcategory', 'user'])->where('income_date', $today)->get();
        return view('income.report.date_wise_income_report', compact('company', 'Incomes'));
    }

    public function filterIncome(Request $request){

        $request->validate([
            'from_date' => 'required|date',
            'to_date'   => 'required|date|after_or_equal:from_date',
        ]);

        $company = Company::first();

        $from_date = Carbon::parse($request->from_date)->format('Y-m-d');
        $to_date   = Carbon::parse($request->to_date)->format('Y-m-d');

        $Incomes = Income::with(['category', 'subcategory', 'user'])->whereBetween('income_date', [$from_date, $to_date])->get();
        
        if($request->has('print')){
            return view('income.report.print.print-income-report', compact('Incomes','from_date','to_date','company'));
        }

        return view('income.report.date_wise_income_report', compact('company', 'Incomes'));
    }

    public function categroyIncome()
    {
        $company = Company::first();
        $categories = IncomeCategory::get();
        $today = Carbon::now()->format('Y-m-d');
        $Incomes = Income::with(['category', 'subcategory', 'user'])->where('income_date', $today)->get();
        return view('income.report.category_wise_income_report', compact('company', 'categories', 'Incomes'));
    }

    public function filterCatIncome(Request $request){

        $request->validate([
            'category_id' => 'required|exists:income_categories,id',
            'from_date'   => 'required|date',
            'to_date'     => 'required|date|after_or_equal:from_date',
        ]);

        $company = Company::first();

        $from_date = Carbon::parse($request->from_date)->format('Y-m-d');
        $to_date   = Carbon::parse($request->to_date)->format('Y-m-d');
        $category_id = $request->category_id;

        $Incomes = Income::with(['category', 'subcategory', 'user'])->where('category_id', $category_id)
                    ->whereBetween('income_date', [$from_date, $to_date])
                    ->get();
        
        if($request->has('print')){
            return view('income.report.print.print-category-wise-income-report', compact('Incomes','from_date','to_date','company','category_id'));
        }

        $categories = IncomeCategory::get();
        return view('income.report.category_wise_income_report', compact('company', 'categories', 'Incomes'));
    }

    public function subCategoyIncome(){
        $company = Company::first();
        $subcategories = IncomeSubCategory::get();
        $categories = IncomeCategory::get();
        $today = Carbon::now()->format('Y-m-d');
        $Incomes = Income::with(['category', 'subcategory', 'user'])->where('income_date', $today)->get();
        return view('income.report.subcategory_wise_income_report', compact('company', 'subcategories', 'Incomes','categories'));
    }

    public function filterSubCatIncome(Request $request){

        $request->validate([
            'subcategory_id' => 'required|exists:income_sub_categories,id',
            'from_date'      => 'required|date',
            'to_date'        => 'required|date|after_or_equal:from_date',
        ]);

        $company = Company::first();

        $from_date = Carbon::parse($request->from_date)->format('Y-m-d');
        $to_date   = Carbon::parse($request->to_date)->format('Y-m-d');
        $subcategory_id = $request->subcategory_id;

        $Incomes = Income::with(['category', 'subcategory', 'user'])->where('subcategory_id', $subcategory_id)
                    ->whereBetween('income_date', [$from_date, $to_date])
                    ->get();
        
        if($request->has('print')){
            return view('income.report.print.print-subcategory-wise-income-report', compact('Incomes','from_date','to_date','company','subcategory_id'));
        }

        $subcategories = IncomeSubCategory::get();
        $categories = IncomeCategory::get();
        return view('income.report.subcategory_wise_income_report', compact('company', 'subcategories', 'Incomes','categories'));
    }
}
