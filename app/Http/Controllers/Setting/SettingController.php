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
