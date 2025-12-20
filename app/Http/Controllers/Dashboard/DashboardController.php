<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Mail;


use App\Notifications\BackupCompleted;
use Auth;
use Session;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\Subject;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\Attendance;
use App\Models\Room;
use App\Models\StudentSubject;
use App\Models\Notice;
use App\Models\Company;

class DashboardController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function index(){
        $company = Company::first();
        $totalStudent = Student::count();        
        $maleStudent = Student::where('gender', 'Male')->count();
        $femaleStudent = Student::where('gender', 'Female')->count();
        $otherStudent = Student::where('gender', 'Other')->count();
        
        $totalAttendance = Attendance::where('attendance_date', $this->date)->where('status', 'Present')->count();
        $totalAbsent = Attendance::where('attendance_date', $this->date)->where('status', 'Absent')->count();
        $class = Room::count();

        $totalTeacher = Teacher::count();
        $maleTeacher = Teacher::where('gender', 'Male')->count();
        $femaleTeacher = Teacher::where('gender', 'Female')->count();

        $notices = Notice::latest()->take(3)->get();

        return view('welcome', compact(
            'totalStudent',
            'maleStudent',
            'femaleStudent',
            'otherStudent',
            'totalAttendance',
            'totalAbsent',
            'class',
            'totalTeacher',
            'maleTeacher',
            'femaleTeacher',
            'notices',
            'company',
        )); 
    }

    public function dbBackup(){
        // Run backup
        Artisan::call('backup:run', ['--only-db' => true]);

        $diskName = config('backup.backup.destination.disks')[0];
        $disk = Storage::disk($diskName);

        $files = collect($disk->allFiles(config('backup.backup.name')))
                    ->filter(fn ($file) => Str::endsWith($file, '.zip'))
                    ->sortDesc();

        $latestBackup = $files->first();

        if (!$latestBackup) {
            return back()->with('error', 'No backup file found!');
        }

        $path = $disk->path($latestBackup);

        $user = Auth::guard('teacher')->user();

        if ($user) {
            Notification::send($user, new BackupCompleted($path));
            return redirect()->back()->with('success', 'Database backup email queued successfully.');
        }

        return redirect()->back()->with('error', 'No authenticated user found.');
        
        // return response()->download($path);
    }
}
