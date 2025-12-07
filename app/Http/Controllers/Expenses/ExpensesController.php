<?php

namespace App\Http\Controllers\Expenses;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use App\Models\Excategory;
use App\Models\Exsubcategory;
use App\Models\Expenses;

class ExpensesController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function index(){
        $categries = Excategory::all();
        $expenses = Expenses::with('category','subcategory', 'user')->get();
        return view('expenses.expenses', compact('categries','expenses'));
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
        $expense = Expenses::with(['category', 'subcategory', 'user'])->find($id);
        if(!$expense){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        return view('expenses.expenses-print', compact('expense'));
    }

    public function delete($id){
        $data = Expenses::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        $data->delete();
        return redirect()->back()->with('success', 'Expenses deleted successfully.');
    }

    public function expensesView($id){
        $expense = Expenses::find($id);
        if(!$expense){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        return view('expenses.expenses-view', compact('expense'));
    }

    public function edit($id){
        $expense = Expenses::find($id);
        $categries = Excategory::all();
        $subcategories = Exsubcategory::all();
        if(!$expense){
            return redirect()->back()->with('error', 'Expenses not found. Please try again. Thank You!');
        }
        return view('expenses.expenses-edit', compact('expense','categries','subcategories'));
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
}
