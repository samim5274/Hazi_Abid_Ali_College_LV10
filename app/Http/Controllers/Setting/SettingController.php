<?php

namespace App\Http\Controllers\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Carbon\Carbon;

use Auth;
use Session;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\Company;
use App\Models\Group;

class SettingController extends Controller
{
    public function profile(){
        $company = Company::first();
        return view('profile.my-account', compact('company'));
    }

    public function setting(){
        $company = Company::first();
        $groups = Group::get();
        return view('profile.setting', compact('company','groups'));
    }

    public function support(){
        $company = Company::first();
        return view('profile.support', compact('company'));
    }

    public function editProfile(Request $request){
        $teacher = Auth::guard('teacher')->user();

        if (!$teacher) {
            return redirect()->back()->with('error', 'User not found.');
        }

        // Validation rules
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string|max:50',
            'last_name' => 'required|string|max:50',
            'contact_number' => 'required|string|max:15',
            'email' => 'required|email|unique:teachers,email,' . $teacher->id,
            'dob' => 'nullable|date',
            'gender' => 'nullable|in:Male,Female,Other',
            'blood_group' => 'nullable|string|max:5',
            'nationality' => 'nullable|string|max:50',
            'address1' => 'nullable|string|max:255',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Update profile
        $teacher->first_name = $request->first_name;
        $teacher->last_name = $request->last_name;
        $teacher->contact_number = $request->contact_number;
        $teacher->email = $request->email;
        $teacher->dob = $request->dob;
        $teacher->gender = $request->gender;
        $teacher->blood_group = $request->blood_group;
        $teacher->national_id = $request->nationality;
        $teacher->address = $request->address1;

        $teacher->update();

        return redirect()->back()->with('success', 'Profile updated successfully.');

        // return redirect()->back()->with('warning', 'Profile edit under maintanance! Please contact with Super Admin or Developer. Thank You!');
    }

    public function modifyProfile(){
        $company = Company::first();
        $data = Auth::guard('teacher')->user();

        if (!$data) {
            return redirect()->back()->with('error', 'User not found.');
        }

        return view('profile.my-account-edit', compact('company','data'));
    }

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

    public function modifyTeacherProfile(Request $request){
        $id = Auth::guard('teacher')->user()->id;

        $teacher = Teacher::find($id);

        if (!$teacher) {
            return redirect()->back()->with('error', 'Selected teacher not found!');
        }

        // Validation
        $request->validate([
            'first_name'        => 'required|string|max:255',
            'last_name'         => 'required|string|max:255',
            'dob'               => 'required|date',
            'gender'            => 'required|in:Male,Female,Other',
            'blood_group'       => 'nullable|string|max:10',
            'national_id'       => 'required|string|max:50|unique:teachers,national_id,' . $teacher->id,
            'contact_number'    => 'required|string|max:20',
            'email'             => 'required|email|unique:teachers,email,' . $teacher->id,
            'designation'       => 'nullable|string|max:255',
            'address'           => 'required|string',
            'status'            => 'required|string',
            'joining_date'      => 'required|date',
            'mop_date'          => 'nullable|date',
            'txtTraning'        => 'nullable|string',
            'txtIndexNumber'    => 'nullable|string',
            'father_name'       => 'nullable|string|max:255',
            'father_contact'    => 'nullable|string|max:20',
            'mother_name'       => 'nullable|string|max:255',
            'mother_contact'    => 'nullable|string|max:20',
            'guardian_name'     => 'nullable|string|max:255',
            'guardian_contact'  => 'nullable|string|max:20',
            'guardian_relationship' => 'nullable|string|max:100',
            'photo'             => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'father_photo'      => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'mother_photo'      => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        ]);

        // Fill data
        $teacher->fill([
            'first_name'            => $request->first_name,
            'last_name'             => $request->last_name,
            'dob'                   => $request->dob,
            'gender'                => $request->gender,
            'blood_group'           => $request->blood_group,
            'national_id'           => $request->national_id,
            'contact_number'        => $request->contact_number,
            'email'                 => $request->email,
            'designation'           => $request->designation,
            'address'               => $request->address,
            'joning_date'           => $request->joining_date,
            'mop_date'              => $request->mop_date,
            'traning'               => $request->txtTraning,
            'index_no'              => $request->txtIndexNumber,
            'status'                => $request->status,
            'father_name'           => $request->father_name,
            'father_contact'        => $request->father_contact,
            'mother_name'           => $request->mother_name,
            'mother_contact'        => $request->mother_contact,
            'guardian_name'         => $request->guardian_name,
            'guardian_contact'      => $request->guardian_contact,
            'guardian_relationship' => $request->guardian_relationship,
        ]);

        // Photo uploads
        $photos = [
            'photo'         => ['db_field' => 'photo', 'folder' => 'teacher', 'prefix' => 'tch-' . $request->first_name],
            'father_photo'  => ['db_field' => 'father_photo', 'folder' => 'father', 'prefix' => 'ftr-' . $request->first_name . '-' . $request->father_name],
            'mother_photo'  => ['db_field' => 'mother_photo', 'folder' => 'mother', 'prefix' => 'mtr-' . $request->first_name . '-' . $request->mother_name],
        ];

        foreach ($photos as $input => $info) {
            if ($request->hasFile($input)) {
                $oldFile = $teacher->{$info['db_field']};
                if ($oldFile && file_exists(public_path("img/{$info['folder']}/$oldFile"))) {
                    unlink(public_path("img/{$info['folder']}/$oldFile"));
                }
                $teacher->{$info['db_field']} = $this->uploadPhoto($request->file($input), $info['folder'], $info['prefix']);
            }
        }

        $teacher->save();

        return redirect()->back()->with('success', 'Teacher information updated successfully!');
    }

    public function storeGroup(Request $request)
    {
        // Validation
        $request->validate([
            'name' => 'required|string|max:50|unique:groups,name',
        ]);

        // Create group
        Group::create([
            'name' => $request->name,
        ]);

        return redirect()->back()->with('success', 'Group created successfully!');
    }

    public function editGroup($id){
        $company = Company::first();
        $group = Group::findOrFail($id);
        return view('profile.edit-group', compact('company','group'));
    }

    public function modifyGroup(Request $request, $id){
        $group = Group::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255|unique:groups,name,' . $group->id,
        ]);

        $group->update([
            'name' => $request->name,
        ]);

        return redirect()->route('setting-view')
            ->with('success', 'Group updated successfully');
    }

    public function deleteGroup($id)
    {
        $group = Group::findOrFail($id);

        // $group->delete();

        return redirect()->route('setting-view')
            ->with('warning', 'Group delete not possible ringt now. Thank You!');
    }

}
