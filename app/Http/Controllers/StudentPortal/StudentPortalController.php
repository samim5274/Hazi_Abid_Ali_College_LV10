<?php

namespace App\Http\Controllers\StudentPortal;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Room;
use App\Models\Student;
use App\Models\Subject;
use App\Models\StudentSubject;
use App\Models\Exam;
use App\Models\Mark;
use App\Models\Attendance;
use App\Models\FeeStructure;
use App\Models\feePaymentDetails;
use App\Models\FeePaymentItem;
use App\Models\ClassSchedule;
use App\Models\StudentDailyRoutine;
use Auth;
use App\Models\Company;

class StudentPortalController extends Controller
{
    public function stdDashboard(){
        // return view('studentPortal.std-dashboard');
        $company = Company::first();
        return redirect()->route('student-profile-view', compact('company'));
    }

    public function profile(){
        $company = Company::first();
        $student = $student = Auth::guard('student')->user();
        return view('studentPortal.profile.student-profile', compact('student','company'));
    }

    public function myClass(){
        $company = Company::first();
        $student = $student = Auth::guard('student')->user();
        $routine = ClassSchedule::with([
                    'subject:id,name',
                    'teacher:id,first_name,last_name'
                ])->where('class_id', $student->class_id)->get();
        return view('studentPortal.classes.student-class', compact('student','routine','company'));
    }

    public function attendance(){
        $company = Company::first();
        $date = Carbon::today()->format('Y-m-d');
        $student = $student = Auth::guard('student')->user();
        $attendance = Attendance::where('student_id', $student->id)->where('attendance_date', $date)->paginate(30);
        return view('studentPortal.attendance.student-attendance', compact('student','attendance','company'));
    }

    public function getAttedance(Request $request){
        $company = Company::first();
        $start = $request->input('start_date', '');
        $end = $request->input('end_date', '');

        $student = $student = Auth::guard('student')->user();
        $attendance = Attendance::where('student_id', $student->id)->whereBetween('attendance_date', [$start, $end])->paginate(30);
        return view('studentPortal.attendance.student-attendance', compact('student','attendance','company'));
    }

    public function examList(){
        $company = Company::first();
        $student = $student = Auth::guard('student')->user();
        $exams = Exam::where('class_id', $student->class_id)->get();
        return view('studentPortal.exam.student-exam', compact('student','exams','company'));
    }

    public function results(){
        $company = Company::first();
        $student = $student = Auth::guard('student')->user();
        $marks = Mark::where('student_id', $student->id)->get();
        return view('studentPortal.exam.student-marks', compact('student','marks','company'));
    }

    // public function feeDetails(){
    //     $student = $student = Auth::guard('student')->user();
    //     $structures = FeeStructure::where('class_id', $student->class_id)->get();
    //     $payments = FeePayment::where('student_id', $student->id)->get();
    //     $groupedPayments = $payments->groupBy('fee_structure_id');

    //     // previowus payment caltulation
    //     $currentClassId = $student->class_id;
    //     $previousStructures = FeeStructure::where('class_id', '<', $currentClassId)->get();

    //     $previousClassIds = $previousStructures->pluck('id')->toArray();

    //     $previousPayments = FeePayment::where('student_id', $student->id)
    //                         ->whereIn('fee_structure_id', $previousClassIds)
    //                         ->get()
    //                         ->groupBy('fee_structure_id'); 
    //     $previousDue = 0;

    //     foreach($previousStructures as $structure){
    //         $payments = $previousPayments[$structure->id] ?? collect();
    //         $totalPaid = $payments->sum('amount_paid');
    //         $totalDiscount = $payments->sum('discount');
    //         $due = ($structure->amount * 12) - ($totalPaid + $totalDiscount);
    //         $previousDue += max($due, 0);
    //     }

    //     return view('studentPortal.fee.student-fee-details', compact('student','structures','groupedPayments','previousDue'));
    // }

    public function feeDetails(){
        $company = Company::first();
        $student = Auth::guard('student')->user();
        $structures = FeeStructure::where('class_id', $student->class_id)->get();
        $payments = feePaymentDetails::where('student_id', $student->id)->get();
        return view('studentPortal.fee.student-fee-details', compact('student','structures','company'));
    }

    // public function feeHistory(){
    //     $student = $student = Auth::guard('student')->user();
    //     $payment = FeePayment::where('student_id', $student->id)->orderBy('id', 'desc')->paginate(15);
    //     $paid = FeePayment::where('student_id', $student->id)->sum('amount_paid');
    //     $discount = FeePayment::where('student_id', $student->id)->sum('discount');
    //     $due = FeePayment::where('student_id', $student->id)->sum('due_amount');
    //     return view('studentPortal.fee.student-fee-history', compact('student','payment','paid','discount','due'));
    // }

    public function feeHistory(){
        $company = Company::first();
        $student = $student = Auth::guard('student')->user();
        $payment = FeePaymentItem::with(['payment','student','feeStructure'])->where('student_id', $student->id)->paginate(15);
        return view('studentPortal.fee.student-fee-history', compact('student','payment','company'));
    }

    public function myPaymentHistory(){
        $company = Company::first();
        $student = $student = Auth::guard('student')->user();
        $payments = feePaymentDetails::with(['teacher','student','items'])->where('student_id', $student->id)->orderBy('payment_date', 'desc')->paginate(15);
        return view('studentPortal.fee.my-fee-history', compact('student','payments','company'));
    }

    public function paymentDetails($id){
        $company = Company::first();
        $feeStructures = FeePaymentItem::with(['student', 'feeStructure','payment'])->where('fee_payment_id', $id)->get();
        if ($feeStructures->isEmpty()) {
            return redirect()->back()
                ->with('error', 'Payment history not found. Please try again.');
        }

        $payment = feePaymentDetails::with(['student','teacher','items.student','items.feeStructure'])->findOrFail($id);

        return view('studentPortal.fee.fee-payment-details', compact('feeStructures', 'payment','company'));
    }

    public function dailyReport(){
        $company = Company::first();
        $student = Auth::guard('student')->user();
        $date = Carbon::today()->format('Y-m-d');
        $routine = StudentDailyRoutine::where('student_id', $student->id)->get();
        return view('studentPortal.daily-report.my-daily-report', compact('routine','company'));
    }

    public function dailyReportStore(Request $request){
        $student = Auth::guard('student')->user();
        $date = Carbon::today()->format('Y-m-d');

        $data = StudentDailyRoutine::where('student_id', $student->id)->where('date', $date)->first();

        if($data){
            return redirect()->back()->with('error', 'Daily report for today has already been submitted.');
        }

        $request->validate([
            'time_to_awake' => 'required',
            'attendance_in_college' => 'required|in:0,1',
            'arrival_in_residence' => 'required',
            'prayer' => 'nullable|string|max:255',
            'morning_activity' => 'nullable|string|max:255',
            'evening_activity' => 'nullable|string|max:255',
            'night_activity' => 'nullable|string|max:255',
            'time_to_bed' => 'required',
            'total_hours' => 'required|numeric|min:0',
            'remark' => 'nullable|string|max:500',
        ]);

        $routine = new StudentDailyRoutine();
        $routine->student_id = $student->id;
        $routine->date = $date;
        $routine->time_to_awake = $request->time_to_awake;
        $routine->attendance_in_college = $request->attendance_in_college;
        $routine->arrival_in_residence = $request->arrival_in_residence;
        $routine->prayer = $request->prayer;
        $routine->morning_activity = $request->morning_activity;
        $routine->evening_activity = $request->evening_activity;
        $routine->night_activity = $request->night_activity;
        $routine->time_to_bed = $request->time_to_bed;
        $routine->total_hours = $request->total_hours;
        $routine->remark = $request->remark ?? 'N/A';
        $routine->save();
        
        return redirect()->back()->with('success', 'Daily report submitted successfully.');
    }

    public function editStudentDailyRoutine($id){
        $company = Company::first();
        $student = Auth::guard('student')->user();
        $routine = StudentDailyRoutine::where('id', $id)->where('student_id', $student->id)->firstOrFail();
        return view('studentPortal.daily-report.edit-daily-report', compact('routine','company'));
    }

    public function dailyReportEdit(Request $request){
        $student = Auth::guard('student')->user();

        $request->validate([
            'time_to_awake' => 'required',
            'attendance_in_college' => 'required|in:0,1',
            'arrival_in_residence' => 'required',
            'prayer' => 'nullable|string|max:255',
            'morning_activity' => 'nullable|string|max:255',
            'evening_activity' => 'nullable|string|max:255',
            'night_activity' => 'nullable|string|max:255',
            'time_to_bed' => 'required',
            'total_hours' => 'required|numeric|min:0',
            'remark' => 'nullable|string|max:500',
        ]);

        $routine = StudentDailyRoutine::where('id', $request->id)->where('student_id', $student->id)->firstOrFail();
        $routine->time_to_awake = $request->time_to_awake;
        $routine->attendance_in_college = $request->attendance_in_college;
        $routine->arrival_in_residence = $request->arrival_in_residence;
        $routine->prayer = $request->prayer;
        $routine->morning_activity = $request->morning_activity;
        $routine->evening_activity = $request->evening_activity;
        $routine->night_activity = $request->night_activity;
        $routine->time_to_bed = $request->time_to_bed;
        $routine->total_hours = $request->total_hours;
        $routine->remark = $request->remark ?? 'N/A';
        $routine->update();
        
        return redirect()->route('my-daily-report')->with('success', 'Daily report updated successfully.');
    }

    public function enrollment(){
        $company = Company::first();
        $student = Auth::guard('student')->user(); 
        $subjects = Subject::where('class_id', $student->class_id)->get();
        $enrollmented = StudentSubject::where('student_id', $student->id)->get(); 
        return view('studentPortal.enrollment.student-enrollment', compact('subjects','student','enrollmented','company'));
    }

    public function enrollmentStore(Request $request){
        $validatedData = $request->validate([
            'subjectId' => ['required', 'integer', 'exists:subjects,id'],
        ]);

        $studnetId = Auth::guard('student')->user()->id;
        $subjectId = $request->input('subjectId', '');
        
        // un-enrollment code here
        if ($request->has('delete')) {
            $findData = StudentSubject::where('student_id', $studnetId)->where('subject_id', $subjectId)->first();
            if($findData){
                $findData->delete();
                return redirect()->back()->with('success', 'Student un-enrollment successfully!');
            }
        }

        $findData = StudentSubject::where('student_id', $studnetId)->where('subject_id', $subjectId)->first();
        if($findData){
            return redirect()->back()->with('warning', 'Student already enrolled in the subject!');
        }

        $subStd = new StudentSubject();
        $subStd->student_id = $studnetId;
        $subStd->subject_id = $subjectId;
        $subStd->save();
        return redirect()->back()->with('success', 'Student successfully enrolled in the subject!');
    }

    public function stdSupport(){
        $company = Company::first();
        return view('studentPortal.support.support', compact('company'));
    }

    public function editProfile(){
        $company = Company::first();
        $student = Auth::guard('student')->user();
        $room = Room::all();
        return view('studentPortal.profile.edit-student-profile', compact('company','student','room'));
    }

    // Helper function to upload images
    private function uploadPhoto($file, $folder, $fileName)
    {
        $maxSize = 2 * 1024 * 1024; // 2MB

        if ($file->getSize() > $maxSize) {
            return redirect()->back()->with('warning', 'Image size must not exceed 2MB.');
        }

        $ext = $file->getClientOriginalExtension();
        $finalName = $fileName . '-' . time() . '.' . $ext;

        $location = public_path("img/{$folder}");
        if (!file_exists($location)) {
            mkdir($location, 0755, true);
        }

        $file->move($location, $finalName);

        return $finalName;
    }

    // Update Student Info
    public function modifyProfile(Request $request)
    {
        $id = Auth::guard('student')->user()->id;
        $student = Student::find($id);

        if (!$student) {
            return redirect()->back()->with('error', 'Selected student not found. Please try another!');
        }

        // Validation
        $request->validate([
            // Personal Information
            'first_name'       => 'required|string|max:100',
            'last_name'        => 'required|string|max:100',
            'dob'              => 'nullable|date',
            'gender'           => 'required|in:Male,Female,Other',
            'blood_group'      => 'nullable|string|max:10',
            'religion'         => 'nullable|string|max:50',
            'nationality'      => 'nullable|string|max:50',
            'national_id'      => 'nullable|string|max:50',
            'contact_number'   => 'required|string|max:20',
            'email'            => 'required|email',
            'present_address'  => 'required|string|max:255',
            'permanent_address'=> 'nullable|string|max:255',            

            // Guardian / Parent Information
            'father_name'       => 'required|string|max:100',
            'father_profession' => 'nullable|string|max:100',
            'father_contact'    => 'nullable|string|max:20',
            'father_email'      => 'nullable|email',
            'father_nid'        => 'nullable|string|max:50',

            'mother_name'       => 'required|string|max:100',
            'mother_profession' => 'nullable|string|max:100',
            'mother_contact'    => 'nullable|string|max:20',
            'mother_email'      => 'nullable|email',
            'mother_nid'        => 'nullable|string|max:50',

            'guardian_name'         => 'required|string|max:100',
            'guardian_contact'      => 'nullable|string|max:20',
            'guardian_email'        => 'nullable|email',
            'guardian_nid'          => 'nullable|string|max:50',
            'guardian_relationship' => 'nullable|string|max:50',
        ]);

        // Student Update
        $student->first_name     = $request->first_name;
        $student->last_name      = $request->last_name;
        $student->dob            = $request->dob;
        $student->gender         = $request->gender;
        $student->blood_group    = $request->blood_group;
        $student->religion       = $request->religion;
        $student->nationality    = $request->nationality;
        $student->national_id    = $request->national_id;
        $student->contact_number = $request->contact_number;
        // $student->email          = $request->email;

        // Address
        $student->address1 = $request->present_address;
        $student->address2 = $request->permanent_address ?? $request->present_address;

        // Father Info
        $student->father_name       = $request->father_name;
        $student->father_profession = $request->father_profession;
        $student->father_contact    = $request->father_contact;
        $student->father_email      = $request->father_email;
        $student->father_nid        = $request->father_nid;

        // Mother Info
        $student->mother_name       = $request->mother_name;
        $student->mother_profession = $request->mother_profession;
        $student->mother_contact    = $request->mother_contact;
        $student->mother_email      = $request->mother_email;
        $student->mother_nid        = $request->mother_nid;

        // Guardian Info
        $student->guardian_name         = $request->guardian_name;
        $student->guardian_contact      = $request->guardian_contact;
        $student->guardian_email        = $request->guardian_email;
        $student->guardian_nid          = $request->guardian_nid;
        $student->guardian_relationship = $request->guardian_relationship;

        // Academic Info not editable
        

        // Handle Photos
        $photos = [
            'student_photo' => ['field' => 'photo', 'folder' => 'student', 'prefix' => 'std-' . $request->first_name],
            'father_photo'  => ['field' => 'father_photo', 'folder' => 'father', 'prefix' => 'std-' . $request->first_name . '-' . $request->father_name],
            'mother_photo'  => ['field' => 'mother_photo', 'folder' => 'mother', 'prefix' => 'std-' . $request->first_name . '-' . $request->mother_name],
        ];

        foreach ($photos as $input => $info) {
            if ($request->hasFile($input)) {
                // Delete old file
                $oldFile = $student->{$info['field']};
                if ($oldFile) {
                    $path = public_path("img/{$info['folder']}/{$oldFile}");
                    if (file_exists($path)) unlink($path);
                }

                // Upload new file
                $student->{$info['field']} = $this->uploadPhoto(
                    $request->file($input),
                    $info['folder'],
                    $info['prefix']
                );
            }
        }
        
        $student->update();

        return redirect()->back()->with('success', 'Student information updated successfully!');
    }

    public function passChange(){
        $company = Company::first();
        $student = Auth::guard('student')->user();
        $room = Room::all();
        return view('studentPortal.profile.change-password', compact('company','student','room'));
    }

    public function updatePass(Request $request){

        $id = Auth::guard('student')->user()->id;
        $student = Student::find($id);

        if (!$student) {
            return back()->with('error', 'Student not found!');
        }

        $request->validate([
            'password' => [
                'required',
                'string',
                'min:8',
                'confirmed', // password_confirmation field required
                'regex:/[a-z]/',      // small letter
                'regex:/[A-Z]/',      // capital letter
                'regex:/[0-9]/',      // number
                'regex:/[@$!%*?&#]/', // special character
            ],
        ], [
            'password.required' => 'Password is required',
            'password.min' => 'Password must be at least 8 characters',
            'password.confirmed' => 'Password confirmation does not match',
            'password.regex' => 'Password must contain uppercase, lowercase, number & special character',
        ]);

        // Update password
        $student->password = Hash::make($request->password);
        $student->save();

        return back()->with('success', 'Password updated successfully!');
    }
}
