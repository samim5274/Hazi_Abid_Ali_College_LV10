<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ Auth::guard('student')->user()->first_name }} {{ Auth::guard('student')->user()->last_name }} - (SMS)</title>

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
            <div class="max-w-7xl mx-auto">

                <!-- Profile Header -->
                <div class="bg-gradient-to-r from-[#273b61] to-[#3F4D67] rounded-lg shadow-lg text-white p-6 md:p-8 mb-8">
                    <div class="flex flex-col md:flex-row items-center gap-6">
                        <img src="{{ $student->photo ? asset('img/student/'.$student->photo) : asset('assets/images/default-avatar.png') }}" alt="Student Photo" class="w-24 h-24 md:w-32 md:h-32 rounded-full object-cover border-4 border-white shadow-md">                        
                        <div class="text-center md:text-left">
                            <h1 class="text-3xl text-white md:text-4xl font-bold">{{ $student->first_name }} {{ $student->last_name }}</h1>
                            <p class="text-lg mt-1">Roll: <span class="font-semibold">{{ $student->roll_number }}</span></p>
                            <p class="text-md">Class: <span class="font-semibold">{{ $student->room->name ?? '-' }}</span> | Section: <span class="font-semibold">{{ $student->room->section ?? '-' }}</span></p>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Left Column -->
                    <div class="lg:col-span-1 space-y-8">
                        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-xl transition-shadow duration-300">
                            <h3 class="text-xl font-semibold mb-4 border-b pb-3 text-gray-800">Contact Information</h3>
                            <ul class="space-y-3 text-gray-600">
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-envelope"></i></span>{{ $student->email ?? '-' }}</li>
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-phone"></i></span>{{ $student->contact_number ?? '-' }}</li>
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-location-pin-lock"></i></span>{{ $student->address1 ?? '-' }}</li>
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-map-location-dot"></i></span>{{ $student->address2 ?? '' }}</li>
                            </ul>
                        </div>
                        <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-xl transition-shadow duration-300">
                            <h3 class="text-xl font-semibold mb-4 border-b pb-3 text-gray-800">Guardian Information</h3>
                            <ul class="space-y-3 text-gray-600">
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-user-shield"></i></span>{{ $student->guardian_name ?? '-' }} ({{ $student->guardian_relationship ?? '-' }})</li>
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-phone-alt"></i></span>{{ $student->guardian_contact ?? '-' }}</li>
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-envelope"></i></span>{{ $student->guardian_email ?? '-' }}</li>
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-font-awesome"></i></span>{{ $student->guardian_nid ?? '-' }}</li>
                                <li class="flex items-center"><span class="w-8 h-8 bg-blue-100 text-[#3F4D67] rounded-full flex items-center justify-center mr-3"><i class="fa-solid fa-heart"></i></span>{{ $student->guardian_relationship ?? '-' }}</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="lg:col-span-2">
                        <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300">
                            <div class="p-6">
                                <div class="border-b border-gray-200 mb-4">
                                    <h3 class="text-base font-semibold text-gray-700">Personal Details</h3>
                                </div>
                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700">
                                    <div><span class="font-semibold text-gray-900">Full Name:</span> {{ $student->first_name }} {{ $student->last_name }}</div>
                                    <div><span class="font-semibold text-gray-900">Gender:</span> {{ $student->gender ? ucfirst($student->gender) : '-' }}</div>
                                    <div><span class="font-semibold text-gray-900">Date of Birth:</span> {{ $student->dob ? $student->dob->format('d M, Y') : '-' }}</div>
                                    <div><span class="font-semibold text-gray-900">Blood Group:</span> {{ $student->blood_group ?? '-' }}</div>
                                    <div><span class="font-semibold text-gray-900">Religion:</span> {{ $student->religion ?? '-' }}</div>
                                    <div><span class="font-semibold text-gray-900">Nationality:</span> {{ $student->nationality ?? 'N/A' }}</div>
                                    <div><span class="font-semibold text-gray-900">NID no:</span> {{ $student->national_id ?? 'N/A' }}</div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 mt-8">
                            <div class="p-6">
                                <div class="border-b border-gray-200 mb-4">
                                    <h3 class="text-base font-semibold text-gray-700">Academic Details</h3>
                                </div>
                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700">
                                    <div><span class="font-semibold text-gray-900">Class:</span> {{ $student->room->name ?? '-' }}</div>
                                    <div><span class="font-semibold text-gray-900">Section:</span> {{ $student->room->section ?? '-' }}</div>
                                    <div><span class="font-semibold text-gray-900">Roll Number:</span> {{ $student->roll_number }}</div>
                                    <div><span class="font-semibold text-gray-900">Admission Date:</span> {{ $student->attend_date ? $student->attend_date->format('d M, Y') : '-' }}</div>
                                    <div>
                                        <span class="font-semibold text-gray-900">Status:</span> 
                                        <span class="{{ $student->status == 1 ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800' }} text-xs font-medium px-2.5 py-0.5 rounded-full">
                                            {{ $student->status == 1 ? 'Active' : 'Inactive' }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-white rounded-lg shadow-md mt-8 hover:shadow-xl transition-shadow duration-300">
                            <div class="p-6">
                                <div class="border-b border-gray-200 mb-6">
                                    <h3 class="text-base font-semibold text-gray-700">Parent Details</h3>
                                </div>

                                <!-- Father Info -->
                                <div class="flex items-start gap-6 mb-8">
                                    <img src="{{ $student->father_photo ? asset('img/father/'.$student->father_photo) : asset('assets/images/default-avatar.png') }}" 
                                        alt="Father Photo" 
                                        class="w-24 h-24 md:w-28 md:h-28 rounded-full object-cover border-2 border-gray-200 shadow">
                                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3 text-gray-700 flex-1">
                                        <div><span class="font-semibold text-gray-900">Father's Name:</span> {{ $student->father_name ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">Profession:</span> {{ $student->father_profession ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">Contact:</span> {{ $student->father_contact ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">Email:</span> {{ $student->father_email ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">NID:</span> {{ $student->father_nid ?? 'N/A' }}</div>
                                    </div>
                                </div>

                                <!-- Mother Info -->
                                <div class="flex items-start gap-6">
                                    <img src="{{ $student->mother_photo ? asset('img/mother/'.$student->mother_photo) : asset('assets/images/default-avatar.png') }}" 
                                        alt="Mother Photo" 
                                        class="w-24 h-24 md:w-28 md:h-28 rounded-full object-cover border-2 border-gray-200 shadow">
                                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3 text-gray-700 flex-1">
                                        <div><span class="font-semibold text-gray-900">Mother's Name:</span> {{ $student->mother_name ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">Profession:</span> {{ $student->mother_profession ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">Contact:</span> {{ $student->mother_contact ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">Email:</span> {{ $student->mother_email ?? 'N/A' }}</div>
                                        <div><span class="font-semibold text-gray-900">NID:</span> {{ $student->mother_nid ?? 'N/A' }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="mt-8 flex flex-col sm:flex-row gap-4">
                            <a href="{{ url('/student/edit-profile/'.$student->id) }}" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-[#3F4D67] hover:bg-blue-900 transition-colors duration-300">
                                Edit Profile
                            </a>
                            <a href="{{ url('/student/change-password') }}" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-gray-700 bg-gray-200 hover:bg-gray-400 transition-colors duration-300">
                                Change Password
                            </a>
                        </div>
                    </div>
                </div>
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