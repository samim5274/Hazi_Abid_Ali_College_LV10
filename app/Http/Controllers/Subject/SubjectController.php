<?php

namespace App\Http\Controllers\Subject;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\SubjectStudent;

class SubjectController extends Controller
{
    public function subjectView(){
        $subjects = Subject::with('room')->get();
        $rooms = Room::all();
        return view('subject.subject-list', compact('subjects', 'rooms'));
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
}
