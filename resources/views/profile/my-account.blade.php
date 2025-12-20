<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $company->name }}</title>

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

<!-- [Body] Start -->

<body>
    
    <!-- [ Sidebar Menu ] start -->
    @include('layouts.navbar')
    <!-- [ Sidebar Menu ] end -->
    <!-- [ Header Topbar ] start -->
    @include('layouts.header')
    <!-- [ Header ] end -->
    
    <!-- Flash Message -->
    @include('layouts.message')


    <!-- [ Main Content ] start -->
    @php
        $teacher = Auth::guard('teacher')->user();
    @endphp

    <div class="pc-container">
        <div class="pc-content">
            <div class="max-w-full px-4">

                <!-- [ breadcrumb ] start -->
                <div class="page-header">
                    <div class="page-block">
                        <div class="page-header-title">
                            <h5 class="mb-0 font-medium">Account</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                            <li class="breadcrumb-item">Setting</li>
                            <li class="breadcrumb-item"><a href="#">Account</a></li>
                            <li class="breadcrumb-item" aria-current="page">Profile</li>
                        </ul>
                    </div>
                </div>
                <!-- [ breadcrumb ] end -->

                <!-- [ Main Content ] start -->
                <div class="flex items-center justify-center bg-gray-100 py-10 px-4">
                    <div class="w-full max-w-4xl mx-auto bg-white shadow-xl rounded-2xl overflow-hidden border border-gray-100">

                        <div class="p-6 sm:p-10">

                            <!-- PROFILE HEADER -->
                            <div class="text-center mb-10">

                                <!-- Profile Image -->
                                <div class="mx-auto flex justify-center">
                                    <div class="w-40 h-40 rounded-full overflow-hidden border-4 border-white shadow-lg bg-gray-200">
                                        <img
                                            src="{{ $teacher && $teacher->photo
                                                ? asset('img/teacher/'.$teacher->photo)
                                                : asset('img/default-user.png') }}"
                                            class="w-full h-full object-cover"
                                            alt="Teacher Photo">
                                    </div>
                                </div>

                                <!-- Name -->
                                @if($teacher)
                                    <h2 class="mt-5 text-xl sm:text-2xl font-semibold text-gray-800">
                                        <a href="{{ url('/edit-teacher-view/'.$teacher->id) }}" class="hover:underline">
                                            {{ $teacher->first_name }} {{ $teacher->last_name }}
                                        </a>
                                    </h2>

                                    <!-- Email -->
                                    <p class="text-gray-600 text-sm sm:text-base">
                                        {{ $teacher->email }}
                                    </p>

                                    <!-- Designation -->
                                    <p class="text-gray-500 text-xs sm:text-sm mt-1">
                                        {{ $teacher->designation }}
                                    </p>
                                @endif
                            </div>

                            <!-- PROFILE DETAILS -->
                            @if($teacher)
                            <div class="border-t border-gray-200">
                                <dl class="divide-y divide-gray-200">

                                    <div class="py-4 grid grid-cols-1 sm:grid-cols-3 gap-2 sm:gap-4">
                                        <dt class="text-sm font-medium text-gray-500">Full Name</dt>
                                        <dd class="text-sm sm:col-span-2 text-gray-900 font-semibold">
                                            {{ $teacher->first_name }} {{ $teacher->last_name }}
                                            <p class="text-xs text-gray-500">
                                                ({{ $teacher->designation }})
                                            </p>
                                        </dd>
                                    </div>

                                    <div class="py-4 grid grid-cols-1 sm:grid-cols-3 gap-2 sm:gap-4">
                                        <dt class="text-sm font-medium text-gray-500">Email Address</dt>
                                        <dd class="text-sm sm:col-span-2 text-gray-900">
                                            {{ $teacher->email }}
                                        </dd>
                                    </div>

                                    <div class="py-4 grid grid-cols-1 sm:grid-cols-3 gap-2 sm:gap-4">
                                        <dt class="text-sm font-medium text-gray-500">Phone Number</dt>
                                        <dd class="text-sm sm:col-span-2 text-gray-900">
                                            {{ $teacher->contact_number }}
                                        </dd>
                                    </div>

                                    <div class="py-4 grid grid-cols-1 sm:grid-cols-3 gap-2 sm:gap-4">
                                        <dt class="text-sm font-medium text-gray-500">Address</dt>
                                        <dd class="text-sm sm:col-span-2 text-gray-900">
                                            {{ $teacher->address }}
                                        </dd>
                                    </div>

                                </dl>
                            </div>

                            <!-- EDIT BUTTON -->
                            <div class="text-center mt-10">
                                <a href="{{ url('/edit-teacher-view/'.$teacher->id) }}"
                                class="inline-flex items-center gap-2 bg-[#3F4D67] hover:bg-[#2f3b52] transition-colors duration-300 text-white font-medium py-2.5 px-6 rounded-full shadow-md">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                    <span>Edit Profile</span>
                                </a>
                            </div>
                            @endif

                        </div>
                    </div>
                </div>
                <!-- [ Main Content ] end -->

            </div>
        </div>
    </div>
    <!-- [ Main Content ] end -->
    @include('layouts.footer')

 
    <!-- Required Js -->
    <script src="{{ asset('assets/js/plugins/simplebar.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/popper.min.js') }}"></script>
    <script src="{{ asset('assets/js/icon/custom-icon.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/feather.min.js') }}"></script>
    <script src="{{ asset('assets/js/component.js') }}"></script>
    <script src="{{ asset('assets/js/theme.js') }}"></script>
    <script src="{{ asset('assets/js/script.js') }}"></script>

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