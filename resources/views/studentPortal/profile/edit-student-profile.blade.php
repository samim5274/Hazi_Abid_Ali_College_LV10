<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ Auth::guard('student')->user()->first_name }} {{ Auth::guard('student')->user()->last_name }} - {{ $company->name ?? "HAAC" }}</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600&display=swap" rel="stylesheet" />

    <!-- Icon Fonts -->
    <link rel="stylesheet" href="{{ asset('assets/fonts/phosphor/duotone/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/tabler-icons.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/feather.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/material.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}" id="main-style-link" />

    <!-- Vite (Tailwind last to avoid override) -->
    @vite('resources/css/app.css')
    @vite('resources/js/app.js')
</head>

<body>
    
    <!-- [ Sidebar Menu ] start -->
    @include('studentPortal.layouts.navbar')
    <!-- [ Sidebar Menu ] end -->
     
    <!-- [ Header Topbar ] start -->
    @include('studentPortal.layouts.header')
    <!-- [ Header ] end -->
    


    <!-- [ Main Content ] start -->
    <div class="pc-container min-h-screen">
        <div class="pc-content py-8 px-4 sm:px-6 lg:px-8">
            <!-- Flash Message -->
            @include('layouts.message')

            <div class="max-w-7xl mx-auto">                
                <form action="{{ url('/modify-student-information') }}" method="POST" enctype="multipart/form-data" class="space-y-6">
                    @csrf
                    
                    <!-- Profile Header -->
                    <div class="bg-gradient-to-r from-[#273b61] to-[#3F4D67] rounded-lg shadow-lg text-white p-6 md:p-8 mb-8 flex flex-col md:flex-row items-center gap-6">
                        <div class="text-center mb-4">
                            <img id="student_preview" src="{{ $student->photo ? asset('img/student/'.$student->photo) : asset('assets/images/default-avatar.png') }}" 
                                alt="Student Photo" class="w-32 h-32 rounded-full object-cover mx-auto mb-2 border-2 border-gray-300">
                            <input type="file" name="student_photo" id="student_photo" accept="image/*" class="mx-auto">
                        </div>
                        <div class="flex-1">
                            <h1 class="text-3xl md:text-4xl font-bold">
                                <input type="text" name="first_name" value="{{ old('first_name', $student->first_name) }}" class="bg-transparent border-b border-white text-white font-bold text-3xl md:text-4xl w-full" placeholder="First Name">
                                <input type="text" name="last_name" value="{{ old('last_name', $student->last_name) }}" class="bg-transparent border-b border-white text-white font-bold text-3xl md:text-4xl w-full" placeholder="Last Name">
                            </h1>
                            <p class="text-lg mt-1">Roll: {{ old('roll_number', $student->roll_number) }}</p>
                            <p class="text-md">
                                Class: <span class="font-semibold">{{ $student->room->name ?? '-' }}</span> | 
                                Section: <span class="font-semibold">{{ $student->section ?? '-' }}</span>
                            </p>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                        <!-- Left Column -->
                        <div class="lg:col-span-1 space-y-8">

                            <!-- Contact Info -->
                            <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-xl transition-shadow duration-300">
                                <h3 class="text-xl font-semibold mb-4 border-b pb-3 text-gray-800">Contact Information</h3>
                                <ul class="space-y-3 text-gray-600">
                                    <li>Email: <input type="email" name="email" value="{{ old('email', $student->email) }}" class="border rounded px-2 py-1 w-full"></li>
                                    <li>Phone: <input type="text" name="contact_number" value="{{ old('contact_number', $student->contact_number) }}" class="border rounded px-2 py-1 w-full"></li>
                                    <li>Present Address: <textarea name="present_address" class="border rounded px-2 py-1 w-full">{{ old('address1', $student->address1) }}</textarea></li>
                                    <li>Permanent Address: <textarea name="permanent_address" class="border rounded px-2 py-1 w-full">{{ old('address2', $student->address2) }}</textarea></li>
                                </ul>
                            </div>

                            <!-- Guardian Info -->
                            <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-xl transition-shadow duration-300">
                                <h3 class="text-xl font-semibold mb-4 border-b pb-3 text-gray-800">Guardian Information</h3>
                                <ul class="space-y-3 text-gray-600">
                                    <li>Name: <input type="text" name="guardian_name" value="{{ old('guardian_name', $student->guardian_name) }}" class="border rounded px-2 py-1 w-full"></li>
                                    <li>Relationship: <input type="text" name="guardian_relationship" value="{{ old('guardian_relationship', $student->guardian_relationship) }}" class="border rounded px-2 py-1 w-full"></li>
                                    <li>Contact: <input type="text" name="guardian_contact" value="{{ old('guardian_contact', $student->guardian_contact) }}" class="border rounded px-2 py-1 w-full"></li>
                                    <li>Email: <input type="email" name="guardian_email" value="{{ old('guardian_email', $student->guardian_email) }}" class="border rounded px-2 py-1 w-full"></li>
                                    <li>NID: <input type="text" name="guardian_nid" value="{{ old('guardian_nid', $student->guardian_nid) }}" class="border rounded px-2 py-1 w-full"></li>
                                </ul>                                
                            </div>   
                            
                            <!-- Photos -->
                            <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 p-6">
                                <h3 class="text-base font-semibold text-gray-700 mb-4 border-b pb-2">Photos</h3>
                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700 mt-4">
                                    <div class="text-center mb-4">
                                        <img id="father_preview" src="{{ $student->father_photo ? asset('img/father/'.$student->father_photo) : asset('assets/images/default-avatar.png') }}" 
                                            alt="Father Photo" class="w-32 h-32 rounded-full object-cover mx-auto mb-2 border-2 border-gray-300">
                                        <input type="file" name="father_photo" id="father_photo" accept="image/*" class="mx-auto">
                                    </div>
                                    <div class="text-center mb-4">
                                        <img id="mother_preview" src="{{ $student->mother_photo ? asset('img/mother/'.$student->mother_photo) : asset('assets/images/default-avatar.png') }}" 
                                            alt="Mother Photo" class="w-32 h-32 rounded-full object-cover mx-auto mb-2 border-2 border-gray-300">
                                        <input type="file" name="mother_photo" id="mother_photo" accept="image/*" class="mx-auto">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Right Column -->
                        <div class="lg:col-span-2 space-y-8">
                            <!-- Personal Details -->
                            <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 p-6">
                                <h3 class="text-base font-semibold text-gray-700 mb-4 border-b pb-2">Personal Details</h3>
                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700">
                                    <div>Gender: 
                                        <select name="gender" class="border rounded px-2 py-1 w-full">
                                            <option value="Male" {{ old('gender', $student->gender)=='Male' ? 'selected' : '' }}>Male</option>
                                            <option value="Female" {{ old('gender', $student->gender)=='Female' ? 'selected' : '' }}>Female</option>
                                            <option value="Other" {{ old('gender', $student->gender)=='Other' ? 'selected' : '' }}>Other</option>
                                        </select>
                                    </div>
                                    <div>Date of Birth: <input type="date" name="dob" value="{{ old('dob', $student->dob?->format('Y-m-d')) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Blood Group: <input type="text" name="blood_group" value="{{ old('blood_group', $student->blood_group) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Religion: <input type="text" name="religion" value="{{ old('religion', $student->religion) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Nationality: <input type="text" name="nationality" value="{{ old('nationality', $student->nationality) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>NID: <input type="text" name="national_id" value="{{ old('national_id', $student->national_id) }}" class="border rounded px-2 py-1 w-full"></div>
                                </div>
                            </div>

                            <!-- Academic Details -->
                            <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 p-6">
                                <h3 class="text-base font-semibold text-gray-700 mb-4 border-b pb-2">Academic Details</h3>
                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700">
                                    <div>Group: <input type="text" name="group" value="{{ old('group', $student->group) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Admission No: <input type="text" name="admission_no" value="{{ old('admission_no', $student->admission_no) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Admission Date: <input type="date" name="attend_date" value="{{ old('attend_date', $student->attend_date?->format('Y-m-d')) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Session Year: <input type="text" name="session_year" value="{{ old('session_year', $student->session_year) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Previous School: <input type="text" name="previous_school" value="{{ old('previous_school', $student->previous_school) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Board Reg No: <input type="text" name="b_reg_no" value="{{ old('b_reg_no', $student->b_reg_no) }}" class="border rounded px-2 py-1 w-full"></div>
                                    <div>Board Roll No: <input type="text" name="b_roll_no" value="{{ old('b_roll_no', $student->b_roll_no) }}" class="border rounded px-2 py-1 w-full"></div>
                                </div>
                            </div>

                            <!-- Parent Information -->
                            <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 p-6">
                                <h3 class="text-base font-semibold text-gray-700 mb-4 border-b pb-2">
                                    Parent Information
                                </h3>

                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700">

                                    <div>
                                        Father Name
                                        <input type="text" name="father_name"
                                            value="{{ old('father_name', $student->father_name) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Father Profession
                                        <input type="text" name="father_profession"
                                            value="{{ old('father_profession', $student->father_profession) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Father Contact
                                        <input type="text" name="father_contact"
                                            value="{{ old('father_contact', $student->father_contact) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Father Email
                                        <input type="email" name="father_email"
                                            value="{{ old('father_email', $student->father_email) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Father NID
                                        <input type="text" name="father_nid"
                                            value="{{ old('father_nid', $student->father_nid) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <!-- Mother Info -->
                                    <div>
                                        Mother Name
                                        <input type="text" name="mother_name"
                                            value="{{ old('mother_name', $student->mother_name) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Mother Profession
                                        <input type="text" name="mother_profession"
                                            value="{{ old('mother_profession', $student->mother_profession) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Mother Contact
                                        <input type="text" name="mother_contact"
                                            value="{{ old('mother_contact', $student->mother_contact) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Mother Email
                                        <input type="email" name="mother_email"
                                            value="{{ old('mother_email', $student->mother_email) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                    <div>
                                        Mother NID
                                        <input type="text" name="mother_nid"
                                            value="{{ old('mother_nid', $student->mother_nid) }}"
                                            class="border rounded px-2 py-1 w-full">
                                    </div>

                                </div>
                            </div>


                            <!-- Submit Button -->
                            <div class="mt-6 text-center">
                                <button type="submit" class="bg-green-500 hover:bg-green-600 text-white font-semibold py-2 px-6 w-full rounded-md shadow-md transition duration-300" onclick="confirm('Are you sure? You want to update your information?')">
                                    Update Profile
                                </button>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- [ Main Content ] end -->
    @include('studentPortal.layouts.footer')

 
    <!-- Required Js -->
    <script src="{{ asset('assets/js/plugins/simplebar.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/popper.min.js') }}"></script>
    <script src="{{ asset('assets/js/icon/custom-icon.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/feather.min.js') }}"></script>
    <script src="{{ asset('assets/js/component.js') }}"></script>
    <script src="{{ asset('assets/js/theme.js') }}"></script>
    <script src="{{ asset('assets/js/script.js') }}"></script>

    <!-- JS for Live Preview -->
    <script>
        // Pop up message (auto-hide)
        document.addEventListener("DOMContentLoaded", () => {
            const popup = document.getElementById('popup');
            if (popup) {
                // Show popup
                setTimeout(() => {
                    popup.classList.remove('opacity-0', 'translate-y-10');
                }, 100); // small delay for animation

                // Hide popup after 3 seconds
                setTimeout(() => {
                    popup.classList.add('opacity-0', 'translate-y-10');
                }, 3000);
            }
        });

        // image preview
        function previewImage(input, previewId) {
            const preview = document.getElementById(previewId);
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        document.getElementById('student_photo').addEventListener('change', function() {
            previewImage(this, 'student_preview');
        });

        document.getElementById('father_photo').addEventListener('change', function() {
            previewImage(this, 'father_preview');
        });

        document.getElementById('mother_photo').addEventListener('change', function() {
            previewImage(this, 'mother_preview');
        });
    </script>
    
    <script>
      layout_change('light');
    </script>
     
    
    <script>
      layout_theme_sidebar_change('false');
    </script>
    
     
    <script>
      change_box_container('false');
    </script>
     
    <script>
      layout_caption_change('true');
    </script>
     
    <script>
      layout_rtl_change('false');
    </script>
     
    <script>
      preset_change('preset-1');
    </script>
     
    <script>
      main_layout_change('vertical');
    </script>
    

  </body>
  <!-- [Body] end -->
</html>