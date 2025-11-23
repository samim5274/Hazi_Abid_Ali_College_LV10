<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Jenssegers\Agent\Agent;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\TeacherAttendance;
use App\Models\Teacher;

class AttendTeacherController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now();
    }

    public function index(){
        $user = Auth::guard('teacher')->user()->id;
        $data = TeacherAttendance::where('teacher_id', $user)
                                ->whereBetween('attendance_date', [
                                    $this->date->copy()->subDays(30)->format('Y-m-d'),
                                    $this->date->format('Y-m-d')
                                ])->with('teacher')->get();
        $total   = $data->count();
        $present = $data->where('status', 'present')->count();
        $absent  = $data->where('status', 'absent')->count();
        return view('teacher.attendance.teacher-attendance', compact('data','total', 'present', 'absent'));
    }

    public function store(Request $request)
    {
        $teacher_id = Auth::guard('teacher')->user()->id;
        $date = Carbon::now()->format('Y-m-d');
        $time = Carbon::now()->format('H:i:s');

        // check duplicate for the day
        $existing = TeacherAttendance::where('teacher_id', $teacher_id)
                                     ->where('attendance_date', $date)
                                     ->first();
        if($existing){
            return redirect()->back()->with('warning','Attendance already recorded for today.');
        }

        $agent = new Agent();
        $agent->setUserAgent($request->header('User-Agent'));

        $browser = $agent->browser() ?: 'Unknown';
        $device = $agent->device() ?: ($agent->isDesktop() ? 'Desktop' : 'Unknown');

        $location = $this->getLocation($request->ip());

        $attendance = TeacherAttendance::create([
            'teacher_id'      => $teacher_id,
            'attendance_date' => $date,
            'attendance_time' => $time,
            'status'          => $request->status ?? 'present',
            'ip_address'      => $request->ip(),
            'browser'         => $browser,
            'device'          => $device,
            'location'        => $location,
        ]);

        return redirect()->back()->with('success','Your attendance submited successfully.');
    }

    private function getLocation($ip)
    {
        try {
            // Localhost handling
            if($ip == '127.0.0.1' || $ip == '::1'){
                // Replace with your public IP for testing
                $ip = 'YOUR_PUBLIC_IP';
            }

            $response = @file_get_contents("https://ip-api.com/json/{$ip}?fields=status,country,regionName,city");

            if(!$response) return 'Unknown';

            $data = json_decode($response, true);

            if($data && $data['status'] == 'success'){
                return $data['country'].' / '.$data['regionName'].' / '.$data['city'];
            }
        } catch (\Exception $e) {
            return 'Unknown';
        }

        return 'Unknown';
    }

    public function attendanceReport()
    {
        $data = TeacherAttendance::whereBetween('attendance_date', [
                                    $this->date->copy()->subDays(30)->format('Y-m-d'),
                                    $this->date->format('Y-m-d')
                                ])->with('teacher')->get();
        $total   = $data->count();
        $present = $data->where('status', 'present')->count();
        $absent  = $data->where('status', 'absent')->count();
        $teachers = Teacher::all();
        return view('teacher.attendance.teacher-attendance-report', compact('data','total', 'present', 'absent','teachers'));
    }

    public function filterTeacherAttendace(Request $request)
    {
        $query = TeacherAttendance::with('teacher');

        // If teacher is selected → filter by teacher
        if ($request->filled('teacher_id')) {
            $query->where('teacher_id', $request->teacher_id);
        }

        // If date range is selected → apply date filter (for both single or all teacher)
        if ($request->filled('start_date') && $request->filled('end_date')) {
            $query->whereBetween('attendance_date', [$request->start_date, $request->end_date]);
        }

        // Get filtered data
        $data = $query->get();

        // Summary
        $total   = $data->count();
        $present = $data->where('status', 'present')->count();
        $absent  = $data->where('status', 'absent')->count();

        // For dropdown
        $teachers = Teacher::all();

        if ($request->input('print')) {
            return view('teacher.attendance.teacher-attendance-report-print', compact(
                'data', 'teachers'
            ));
        }

        return view('teacher.attendance.teacher-attendance-report', compact(
            'data', 'total', 'present', 'absent', 'teachers'
        ));
    }

    public function editTeacherAttend($id)
    {
        $attendance = TeacherAttendance::with('teacher')->findOrFail($id);
        return view('teacher.attendance.edit-teacher-attendance', compact('attendance'));
    }

    public function updateTeacherAttend(Request $request, $id)
    {
        $attendance = TeacherAttendance::findOrFail($id);
        $attendance->attendance_date = $request->attendance_date;
        $attendance->attendance_time = $request->attendance_time;
        $attendance->status = $request->status;
        $attendance->save();

        return redirect()->route('teacher-attendance-report')->with('success', 'Teacher attendance updated successfully.');
    }

}
