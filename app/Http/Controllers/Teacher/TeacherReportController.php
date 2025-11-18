<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;

use App\Models\Teacher;

class TeacherReportController extends Controller
{
    public function teacherReport(Request $request){

        $query = Teacher::query();

        if ($request->filled('gender_id')) {
            $query->where('gender', $request->gender_id);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // if ($request->filled('religion')) {
        //     $query->where('religion', $request->religion);
        // }

        if ($request->filled('blood_group')) {
            $query->where('blood_group', $request->blood_group);
        }

        $teacher = $query->paginate(45)->appends($request->all());
        return view('teacher.report.teacher-report', compact('teacher'));
    }
}
