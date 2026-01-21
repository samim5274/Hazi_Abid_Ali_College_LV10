<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;

use App\Models\Student;
use App\Models\Room;
use App\Models\Subject;
use App\Models\Mark;
use App\Models\Company;
use App\Models\Group;

class StudentController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function studentList(){
        $company = Company::first();
        $student = Student::with('room')->paginate(20);
        return view('student.student-list', compact('student','company'));
    }

    public function addStudentView(){
        $company = Company::first();
        $room = Room::all();
        $groups = Group::all();
        return view('student.add-student' , compact('room','company','groups'));
    }

    // helper function inside your controller
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


    public function addStudent(Request $request){

        $validated = $request->validate([
            'first_name'         => 'required|string|max:100',
            'last_name'          => 'required|string|max:100',
            'dob'                => 'nullable|date',
            'gender'             => 'nullable|in:Male,Female,Other',
            'blood_group'        => 'nullable|in:A+,A-,B+,B-,AB+,AB-,O+,O-',
            'religion'           => 'nullable|string|max:50',
            'nationality'        => 'nullable|string|max:50',
            'national_id'        => 'nullable|string|max:50',

            'contact_number'     => 'nullable|numeric|digits_between:8,15',
            'email'              => 'nullable|email|unique:students,email',
            'password'           => 'nullable|string|min:6',

            'present_address'    => 'nullable|string|max:255',
            'permanent_address'  => 'nullable|string|max:255',

            'cbxSection'         => 'required|string|max:255',
            'cbxGroup'           => 'required|string|max:255',
            'previous_school'    => 'nullable|string|max:255',

            'father_name'        => 'nullable|string|max:100',
            'father_profession'  => 'nullable|string|max:100',
            'father_contact'     => 'nullable|numeric|digits_between:8,15',
            'father_email'       => 'nullable|email',
            'father_nid'         => 'nullable|string|max:50',
            'father_income'      => 'nullable|string|max:50',

            'mother_name'        => 'nullable|string|max:100',
            'mother_profession'  => 'nullable|string|max:100',
            'mother_contact'     => 'nullable|numeric|digits_between:8,15',
            'mother_email'       => 'nullable|email',
            'mother_nid'         => 'nullable|string|max:50',
            'mother_income'      => 'nullable|string|max:50',

            'guardian_name'      => 'nullable|string|max:100',
            'guardian_contact'   => 'nullable|numeric|digits_between:8,15',
            'guardian_email'     => 'nullable|email',
            'guardian_nid'       => 'nullable|string|max:50',
            'guardian_relationship' => 'nullable|string|max:50',

            'class_id'           => 'required|exists:rooms,id',
            'remark'             => 'nullable|string|max:255',

            'b_reg_no'           => 'nullable|max:255',
            'b_roll_no'          => 'nullable|max:255',
        ]);

        $findStudent = Student::where('email', $request->email)->first();
        if($findStudent){
            return redirect()->back()->with('error', 'Email id already taken. Please try to another email. Thank You.');
        }

        $admissionDate = $request->attend_date ?? now();
        $year = date('Y', strtotime($admissionDate));
        $month = date('m', strtotime($admissionDate));

        if ($month >= 6) {
            $startYear = $year;
            $endYear = $year + 1;
        } else {
            $startYear = $year - 1;
            $endYear = $year;
        }

        do { $admission_no = rand(100000, 999999); }
        while (Student::where('admission_no', $admission_no)->exists());

        $student = new Student();

        // Basic Info
        $student->first_name     = $request->first_name;
        $student->last_name      = $request->last_name;
        $student->dob            = $request->dob;
        $student->gender         = $request->gender;
        $student->blood_group    = $request->blood_group;
        $student->religion       = $request->religion;
        $student->nationality    = $request->nationality;
        $student->national_id    = $request->national_id;
        $student->contact_number = $request->contact_number;
        $student->email          = $request->email;
        $student->password       = Hash::make('123456789'); // default password
        $student->address1       = $request->present_address;
        $student->address2       = $request->permanent_address;

        $student->admission_no   = $admission_no;
        $student->admission_date = $admissionDate;

        $student->section        = $request->cbxSection;
        $student->group          = $request->cbxGroup;
        $student->session_year   = $startYear . $endYear;
        $student->previous_school= $request->previous_school;

        // Father Info
        $student->father_name       = $request->father_name;
        $student->father_profession = $request->father_profession;
        $student->father_contact    = $request->father_contact;
        $student->father_email      = $request->father_email;
        $student->father_nid        = $request->father_nid;
        $student->father_monthly_income        = $request->father_income;

        // Mother Info
        $student->mother_name       = $request->mother_name;
        $student->mother_profession = $request->mother_profession;
        $student->mother_contact    = $request->mother_contact;
        $student->mother_email      = $request->mother_email;
        $student->mother_nid        = $request->mother_nid;
        $student->mother_monthly_income        = $request->mother_income;

        // Guardian Info
        $student->guardian_name         = $request->guardian_name;
        $student->guardian_contact      = $request->guardian_contact;
        $student->guardian_email        = $request->guardian_email;
        $student->guardian_nid          = $request->guardian_nid;
        $student->guardian_relationship = $request->guardian_relationship;

        // Others
        $student->status   = 1; // default active
        $student->class_id = $request->class_id;
        $student->remark   = $request->remark;

        $student->b_reg_no = $request->b_reg_no;
        $student->b_roll_no= $request->b_roll_no;

        if ($request->hasFile('student_photo')) {
            $student->photo = $this->uploadPhoto(
                $request->file('student_photo'),
                'student',
                'std-' . $request->first_name
            );
        }

        if ($request->hasFile('father_photo')) {
            $student->father_photo = $this->uploadPhoto(
                $request->file('father_photo'),
                'father',
                'std-' . $request->first_name . '-' . $request->father_name
            );
        }

        if ($request->hasFile('mother_photo')) {
            $student->mother_photo = $this->uploadPhoto(
                $request->file('mother_photo'),
                'mother',
                'std-' . $request->first_name . '-' . $request->mother_name
            );
        }


        $student->save();

        return redirect()->back()->with('success', 'Student created successfully!');
    }

    public function editStudentView($id){
        $company = Company::first();
        $student = Student::findOrFail($id);
        $room = Room::all();
        $groups = Group::all();
        return view('student.edit-student', compact('student','room','company','groups'));
    }

    public function editStudent(Request $request, $id)
    {
        $student = Student::where('id',$id)->first();

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
            'class_id'         => 'required',

            'cbxSection'       => 'required|string|max:255',
            'cbxGroup'         => 'required|string|max:255',
            'previous_school'  => 'nullable|string|max:255',

            // Guardian / Parent Information
            'father_name'       => 'required|string|max:100',
            'father_profession' => 'nullable|string|max:100',
            'father_contact'    => 'nullable|string|max:20',
            'father_email'      => 'nullable|email',
            'father_nid'        => 'nullable|string|max:50',
            'father_income'     => 'nullable|string|max:50',

            'mother_name'       => 'required|string|max:100',
            'mother_profession' => 'nullable|string|max:100',
            'mother_contact'    => 'nullable|string|max:20',
            'mother_email'      => 'nullable|email',
            'mother_nid'        => 'nullable|string|max:50',
            'mother_income'     => 'nullable|string|max:50',

            'guardian_name'         => 'required|string|max:100',
            'guardian_contact'      => 'nullable|string|max:20',
            'guardian_email'        => 'nullable|email',
            'guardian_nid'          => 'nullable|string|max:50',
            'guardian_relationship' => 'nullable|string|max:50',

            'b_reg_no'           => 'nullable|max:255',
            'b_roll_no'          => 'nullable|max:255',
            'status'             => 'nullable',
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
        $student->email          = $request->email;

         // Address
        $student->address1 = $request->present_address;
        $student->address2 = $request->permanent_address ?? $request->present_address; // যদি permanent না থাকে, তাহলে present বসবে

        // Father Info
        $student->father_name       = $request->father_name;
        $student->father_profession = $request->father_profession;
        $student->father_contact    = $request->father_contact;
        $student->father_email      = $request->father_email;
        $student->father_nid        = $request->father_nid;
        $student->father_monthly_income        = $request->father_income;

        // Mother Info
        $student->mother_name       = $request->mother_name;
        $student->mother_profession = $request->mother_profession;
        $student->mother_contact    = $request->mother_contact;
        $student->mother_email      = $request->mother_email;
        $student->mother_nid        = $request->mother_nid;
        $student->mother_monthly_income        = $request->mother_income;

        // Guardian Info
        $student->guardian_name         = $request->guardian_name;
        $student->guardian_contact      = $request->guardian_contact;
        $student->guardian_email        = $request->guardian_email;
        $student->guardian_nid          = $request->guardian_nid;
        $student->guardian_relationship = $request->guardian_relationship;

        // Others
        $student->class_id      = $request->class_id;
        $student->status        = $request->status;

        $student->section        = $request->cbxSection;
        $student->group          = $request->cbxGroup;
        $student->previous_school= $request->previous_school;

        $student->b_reg_no      = $request->b_reg_no;
        $student->b_roll_no     = $request->b_roll_no;

        // Handle photos
        $photos = [
            'student_photo' => ['field' => 'photo', 'folder' => 'student', 'prefix' => 'std-' . $request->first_name],
            'father_photo' => ['field' => 'father_photo', 'folder' => 'father', 'prefix' => 'std-' . $request->first_name . '-' . $request->father_name],
            'mother_photo' => ['field' => 'mother_photo', 'folder' => 'mother', 'prefix' => 'std-' . $request->first_name . '-' . $request->mother_name],
        ];

        foreach ($photos as $input => $info) {
            if ($request->hasFile($input)) {
                // Delete old file
                $oldFile = $student->{$info['field']};
                if ($oldFile) {
                    $path = public_path("/img/{$info['folder']}/" . $oldFile);
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

        return redirect()->back()->with('success', 'Student information edited successfully!');
    }

    public function liveSearch(Request $request){
        $output = '';
        $students = Student::with('room')
            ->where('first_name', 'like', '%'.$request->liveSearchStudent.'%')
            ->orWhere('last_name', 'like', '%'.$request->liveSearchStudent.'%')
            ->orWhere('email', 'like', '%'.$request->liveSearchStudent.'%')
            ->orWhere('father_name', 'like', '%'.$request->liveSearchStudent.'%')
            ->orWhere('father_contact', 'like', '%'.$request->liveSearchStudent.'%')
            ->orWhere('mother_name', 'like', '%'.$request->liveSearchStudent.'%')
            ->orWhere('contact_number', 'like', '%'.$request->liveSearchStudent.'%')->get();

        $i = 1;
        foreach ($students as $val) {
            $name = strlen($val->first_name.' '.$val->last_name) > 22
                ? substr($val->first_name.' '.$val->last_name, 0, 22).'...'
                : $val->first_name.' '.$val->last_name;

            $img = asset('img/student/' . $val->photo);
            $editUrl = url('/edit-student-view/'.$val->id);
            $address = strlen($val->address1) > 22 ? substr($val->address1, 0, 22).'...' : $val->address1;
            $email = $val->email;
            $contact = $val->contact_number;
            $roomName = $val->room->name ?? 'N/A';
            $section = $val->room->section ?? 'N/A';
            $dob = \Carbon\Carbon::parse($val->dob)->format('d M, Y');
            $bloodGroup = $val->blood_group;

            $output .= '
                <tr class="resultData hover:bg-gray-50/70 border-b border-gray-100">
                    <td class="px-5 py-4 whitespace-nowrap text-gray-500 text-sm">'.$i++.'</td>

                    <td class="px-5 py-4 whitespace-nowrap">
                        <a href="'.$editUrl.'" class="inline-flex items-center">
                ';

                if ($val->photo) {
                    $output .= '
                            <img class="w-10 h-10 rounded-full border border-gray-200 object-cover"
                                src="'.$img.'" alt="Student photo" />
                    ';
                } else {
                    $output .= '
                            <div class="w-10 h-10 rounded-full bg-gray-100 border border-gray-200 flex items-center justify-center font-bold text-gray-700">
                                '.strtoupper(substr($val->first_name ?? "S", 0, 1)).'
                            </div>
                    ';
                }

                $output .= '
                        </a>
                    </td>

                    <td class="px-5 py-4 min-w-[260px]">
                        <a href="'.$editUrl.'" class="block font-semibold text-gray-900 hover:text-[#19b6b6] transition">
                            '.$val->roll_number.' — '.$name.'
                        </a>
                        <div class="mt-1 text-xs text-gray-500 flex items-center gap-2">
                            <i class="fa-solid fa-location-dot text-gray-400"></i>
                            <span class="truncate max-w-[360px]">'.$address.'</span>
                        </div>
                    </td>

                    <td class="px-5 py-4 whitespace-nowrap">
                        <div class="font-medium text-gray-800">'.$email.'</div>
                        <div class="text-xs text-gray-500 mt-1 flex items-center gap-2">
                            <i class="fa-solid fa-phone text-gray-400"></i>
                            <span>'.$contact.'</span>
                        </div>
                    </td>

                    <td class="px-5 py-4 whitespace-nowrap">
                        <div class="font-semibold text-gray-800">'.$roomName.'</div>
                        <div class="text-xs text-gray-500 mt-1">Section: '.$section.'</div>
                    </td>

                    <td class="px-5 py-4 whitespace-nowrap">
                        <div class="inline-flex items-center gap-2 text-gray-700">
                            <i class="fa-solid fa-calendar-days text-gray-400"></i>
                            <span class="font-medium">'.$dob.'</span>
                        </div>
                        <div class="mt-2">
                            <span class="inline-flex items-center gap-2 px-2.5 py-1 rounded-full bg-red-50 text-red-700 text-xs font-semibold ring-1 ring-red-200">
                                <i class="fa-solid fa-droplet"></i>
                                '.$bloodGroup.'
                            </span>
                        </div>
                    </td>

                    <td class="px-5 py-4 whitespace-nowrap text-right">
                        <a href="'.$editUrl.'"
                        class="inline-flex items-center gap-2 px-4 py-2 rounded-xl bg-[#19b6b6] text-white text-xs font-semibold
                                hover:opacity-90 transition shadow-sm">
                            <i class="fa-solid fa-pen-to-square"></i>
                            Edit
                        </a>
                    </td>
                </tr>
                ';

        }

        return response($output);
    }


}
