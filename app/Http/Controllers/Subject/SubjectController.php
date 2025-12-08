<?php

namespace App\Http\Controllers\Subject;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Company;
use App\Models\Subject;

class SubjectController extends Controller
{
    public function subjectView(){
        $company = Company::first();
        $subjects = Subject::with('room')->get();
        $rooms = Room::all();
        return view('subject.subject-list', compact('subjects', 'rooms','company'));
    }

    public function addSubject(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'class_id' => 'required|exists:rooms,id',
        ]);

        $subject = $request->input('name', '');
        $classId = $request->input('class_id', '');

        $data = Subject::where('name', $subject)->where('class_id', $classId)->first();
        if($data){
            return redirect()->back()->with('error', 'Subject already added. Please try another one. Thank You!');
        }

        Subject::create([
            'name' => $request->name,
            'class_id' => $request->class_id,
        ]);

        return redirect()->back()->with('success', 'Subject added successfully!');
    }

    public function getSubjectsByClass($classId)
    {
        $subjects = Subject::where('class_id', $classId)->get();
        return response()->json($subjects);
    }

    public function modify(Request $request, $id){
        $request->validate([
            'name' => 'required|string|max:255',
            'class_id' => 'required|exists:rooms,id',
        ]);

        $subject = $request->input('name', '');
        $classId = $request->input('class_id', '');

        $data = Subject::where('id', $id)->first();
        if(!$data){
            return redirect()->back()->with('error', 'Subject not found. Please try another one. Thank You!');
        }

        $data->name = $subject;
        $data->class_id = $classId;
        $data->update();
        return redirect()->back()->with('success', 'Subject updated successfully!');
    }
}
