<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;

use App\Models\Teacher;

class TeacherController extends Controller
{
    public function teacherList(){
        $teacher = Teacher::all();
        return view('teacher.teacher', compact('teacher'));
    }

    public function addTeacherView(){
        return view('teacher.add-teacher');
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

    public function addTeacher(Request $request){
        $request->validate([
            'first_name'        => 'required|string|max:255',
            'last_name'         => 'required|string|max:255',
            'dob'               => 'required|date',
            'gender'            => 'required|in:Male,Female,Other',
            'blood_group'       => 'nullable|string|max:10',
            'national_id'       => 'required|string|max:50|unique:teachers,national_id',
            'contact_number'    => 'required|string|max:20',
            'email'             => 'required|email|unique:teachers,email',
            'designation'       => 'required|string|max:255',
            'address'           => 'required|string',

            'father_name'       => 'nullable|string|max:255',
            'father_contact'    => 'nullable|string|max:20',
            'mother_name'       => 'nullable|string|max:255',
            'mother_contact'    => 'nullable|string|max:20',
            'guardian_name'     => 'nullable|string|max:255',
            'guardian_contact'  => 'nullable|string|max:20',
            'guardian_relationship' => 'nullable|string|max:100'
        ]);

        $teacher = new Teacher();

        $teacher->first_name           = $request->first_name;
        $teacher->last_name            = $request->last_name;
        $teacher->dob                  = $request->dob;
        $teacher->gender               = $request->gender;
        $teacher->blood_group          = $request->blood_group;
        $teacher->national_id          = $request->national_id;
        $teacher->contact_number       = $request->contact_number;
        $teacher->email                = $request->email;
        $teacher->designation          = $request->designation;
        $teacher->address              = $request->address;

        $teacher->father_name          = $request->father_name;
        $teacher->father_contact       = $request->father_contact;
        $teacher->mother_name          = $request->mother_name;
        $teacher->mother_contact       = $request->mother_contact;
        $teacher->guardian_name        = $request->guardian_name;
        $teacher->guardian_contact     = $request->guardian_contact;
        $teacher->guardian_relationship = $request->guardian_relationship;
        $teacher->password             = Hash::make('123456789');

        if ($request->hasFile('teacher_photo')) {
            $teacher->photo = $this->uploadPhoto(
                $request->file('teacher_photo'),
                'teacher',
                'tech-' . $request->first_name
            );
        }

        if ($request->hasFile('father_photo')) {
            $teacher->father_photo = $this->uploadPhoto(
                $request->file('father_photo'),
                'father',
                'tech-' . $request->first_name . '-' . $request->father_name
            );
        }

        if ($request->hasFile('mother_photo')) {
            $teacher->mother_photo = $this->uploadPhoto(
                $request->file('mother_photo'),
                'mother',
                'tech-' . $request->first_name . '-' . $request->mother_name
            );
        }

        $teacher->save();
        return redirect()->back()->with('success', 'Teacher created successfully!');
    }

    public function editTeacherView($id){
        $teacher = Teacher::where('id', $id)->first();
        return view('teacher.edit-teacher', compact('teacher'));
    }

    public function editTeacher(Request $request, $id)
    {
        $teacher = Teacher::find($id);

        if (!$teacher) {
            return redirect()->back()->with('error', 'Selected teacher not found. Please try another!');
        }

        $request->validate([
            'first_name'        => 'required|string|max:255',
            'last_name'         => 'required|string|max:255',
            'dob'               => 'required|date',
            'gender'            => 'required|in:Male,Female,Other',
            'blood_group'       => 'nullable|string|max:10',
            'national_id'       => 'required|string|max:50|unique:teachers,national_id,' . $teacher->id,
            'contact_number'    => 'required|string|max:20',
            'email'             => 'required|email|unique:teachers,email,' . $teacher->id,
            'designation'       => 'required|string|max:255',
            'address'           => 'required|string',

            'father_name'       => 'nullable|string|max:255',
            'father_contact'    => 'nullable|string|max:20',
            'mother_name'       => 'nullable|string|max:255',
            'mother_contact'    => 'nullable|string|max:20',
            'guardian_name'     => 'nullable|string|max:255',
            'guardian_contact'  => 'nullable|string|max:20',
            'guardian_relationship' => 'nullable|string|max:100',
        ]);

        $teacher->fill([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'dob' => $request->dob,
            'gender' => $request->gender,
            'blood_group' => $request->blood_group,
            'national_id' => $request->national_id,
            'contact_number' => $request->contact_number,
            'email' => $request->email,
            'designation' => $request->designation,
            'address' => $request->address,
            'father_name' => $request->father_name,
            'father_contact' => $request->father_contact,
            'mother_name' => $request->mother_name,
            'mother_contact' => $request->mother_contact,
            'guardian_name' => $request->guardian_name,
            'guardian_contact' => $request->guardian_contact,
            'guardian_relationship' => $request->guardian_relationship,
        ]);

        $photos = [
            'teacher_photo' => ['db_field' => 'photo', 'folder' => 'teacher', 'prefix' => 'tch-' . $request->first_name],
            'father_photo' => ['db_field' => 'father_photo', 'folder' => 'father', 'prefix' => 'ftr-' . $request->first_name . '-' . $request->father_name],
            'mother_photo' => ['db_field' => 'mother_photo', 'folder' => 'mother', 'prefix' => 'mtr-' . $request->first_name . '-' . $request->mother_name],
        ];

        foreach ($photos as $input => $info) {
            if ($request->hasFile($input)) {
                // Delete old file if exists
                $oldFile = $teacher->{$info['db_field']};
                if ($oldFile) {
                    $path = public_path("img/{$info['folder']}/" . $oldFile);
                    if (file_exists($path)) {
                        unlink($path);
                    }
                }

                // Upload new file
                $teacher->{$info['db_field']} = $this->uploadPhoto(
                    $request->file($input),
                    $info['folder'],
                    $info['prefix']
                );
            }
        }

        $teacher->update();

        return redirect()->back()->with('success', 'Teacher information updated successfully!');
    }

    public function liveSearchTeacher(Request $request){
        $output = '';
        $teachers = Teacher::where('first_name', 'like', '%'.$request->liveSearchTeacher.'%')
            ->orWhere('last_name', 'like', '%'.$request->liveSearchTeacher.'%')
            ->orWhere('email', 'like', '%'.$request->liveSearchTeacher.'%')
            ->orWhere('father_name', 'like', '%'.$request->liveSearchTeacher.'%')
            ->orWhere('father_contact', 'like', '%'.$request->liveSearchTeacher.'%')
            ->orWhere('mother_name', 'like', '%'.$request->liveSearchTeacher.'%')
            ->orWhere('contact_number', 'like', '%'.$request->liveSearchTeacher.'%')
            ->get();

        $i = 1;

        foreach ($teachers as $val) {
            $name = strlen($val->first_name.' '.$val->last_name) > 22
                ? substr($val->first_name.' '.$val->last_name, 0, 22).'...'
                : $val->first_name.' '.$val->last_name;

            $img = asset('img/teacher/' . $val->photo);
            $editUrl = url('/edit-teacher-view/'.$val->id);
            $designation = $val->designation ?? 'N/A';
            $email = $val->email;
            $address = $val->address ?? 'N/A';
            $contact = $val->contact_number;
            $dob = \Carbon\Carbon::parse($val->dob)->format('d M, Y');
            $bloodGroup = $val->blood_group ?? 'N/A';

            $output .= '<tr class="unread resultData">
                <td>'.$i++.'</td>
                <td>';

            if ($val->photo) {
                $output .= '<a href="'.$editUrl.'"><img class="rounded-full" style="width: 40px" src="'.$img.'" alt="Teacher" /></a>';
            } else {
                $output .= '<a href="'.$editUrl.'"><span class="text-muted">No Image</span></a>';
            }

            $output .= '</td>
                <td>
                    <h6 class="mb-1"><a href="'.$editUrl.'">'.$name.'</a></h6>
                    <p class="m-0">'.$designation.'</p>
                </td>
                <td>
                    <h6 class="mb-1">'.$email.'</h6>
                    <p class="m-0">'.$address.' || 0'.$contact.'</p>
                </td>
                <td>
                    <h6 class="text-muted">
                        <i class="fas fa-circle text-success text-[10px]"></i> '.$dob.'
                    </h6>
                    <p class="m-0"><i class="fa fa-droplet text-red-500 text-[10px]"></i> '.$bloodGroup.'</p>
                </td>
                <td>
                    <a href="'.$editUrl.'" class="badge bg-theme-bg-1 text-white text-[12px]">
                        <i class="fa-solid fa-pen-to-square"></i> Edit
                    </a>
                </td>
            </tr>';
        }

        return response($output);
    }

}
