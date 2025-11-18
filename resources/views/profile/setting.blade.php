<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System - (SMS)</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600&display=swap" rel="stylesheet" />

    <!-- Icon Fonts -->
    <link rel="stylesheet" href="{{ asset('assets/fonts/phosphor/duotone/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/tabler-icons.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/feather.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/material.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Toastr CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>

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
    <div class="pc-container">
        <div class="pc-content py-10 px-4 md:px-8 lg:px-16">
            <div class="flex flex-col lg:flex-row gap-6">
                <!-- Left: General Settings -->
                <div class="lg:w-2/3">
                    <div class="bg-white shadow-md rounded-lg">
                        <div class="container mx-auto py-8 px-4">
                            <h1 class="text-2xl font-bold mb-6">Settings</h1>
                            <div class="flex flex-col md:flex-row gap-6">
                                <!-- Sidebar -->
                                <div class="md:w-1/4 bg-white rounded-lg p-4">
                                    <ul class="space-y-2">
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none active-tab" data-tab="personal">Personal Details</button>
                                        </li>
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="privacy">Privacy</button>
                                        </li>
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="verification">Verification</button>
                                        </li>
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="account-checkup">Account Checkup</button>
                                        </li>
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="terms">Terms of Service</button>
                                        </li>
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="privacy-policy">Privacy Policy</button>
                                        </li>
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="cookies-policy">Cookies Policy</button>
                                        </li>
                                        <li>
                                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="backup">Backup</button>
                                        </li>
                                    </ul>
                                </div>

                                <!-- Content -->
                                <div class="md:w-3/4 bg-white rounded-lg shadow p-6">
                                    <div id="personal" class="tab-content">
                                        <h2 class="text-xl font-semibold mb-4">Personal Details</h2>
                                        
                                        <form action="#" method="POST" enctype="multipart/form-data" class="space-y-4">
                                            @csrf

                                            <!-- Name -->
                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                                <div>
                                                    <label for="first_name" class="block text-gray-700 font-medium mb-1">First Name</label>
                                                    <input type="text" name="first_name" id="first_name" value="{{ Auth::guard('teacher')->user()->first_name }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                </div>
                                                <div>
                                                    <label for="last_name" class="block text-gray-700 font-medium mb-1">Last Name</label>
                                                    <input type="text" name="last_name" id="last_name" value="{{ Auth::guard('teacher')->user()->last_name }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                </div>
                                            </div>

                                            <!-- Contact & Email -->
                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                                <div>
                                                    <label for="contact_number" class="block text-gray-700 font-medium mb-1">Contact Number</label>
                                                    <input type="text" name="contact_number" id="contact_number" value="{{ Auth::guard('teacher')->user()->contact_number }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                </div>
                                                <div>
                                                    <label for="email" class="block text-gray-700 font-medium mb-1">Email</label>
                                                    <input type="email" name="email" id="email" value="{{ Auth::guard('teacher')->user()->email }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                </div>
                                            </div>

                                            <!-- DOB & Gender -->
                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                                <div>
                                                    <label for="dob" class="block text-gray-700 font-medium mb-1">Date of Birth</label>
                                                    <input type="date" name="dob" id="dob" value="{{ Auth::guard('teacher')->user()->dob }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                </div>
                                                <div>
                                                    <label for="gender" class="block text-gray-700 font-medium mb-1">Gender</label>
                                                    <select name="gender" id="gender" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                        <option value="Male" {{ Auth::guard('teacher')->user()->gender == 'Male' ? 'selected' : '' }}>Male</option>
                                                        <option value="Female" {{ Auth::guard('teacher')->user()->gender == 'Female' ? 'selected' : '' }}>Female</option>
                                                        <option value="Other" {{ Auth::guard('teacher')->user()->gender == 'Other' ? 'selected' : '' }}>Other</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <!-- Blood Group & Nationality -->
                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                                <div>
                                                    <label for="blood_group" class="block text-gray-700 font-medium mb-1">Blood Group</label>
                                                    <input type="text" name="blood_group" id="blood_group" value="{{ Auth::guard('teacher')->user()->blood_group }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                </div>
                                                <div>
                                                    <label for="nationality" class="block text-gray-700 font-medium mb-1">Nationality</label>
                                                    <input type="text" name="nationality" id="nationality" value="{{ Auth::guard('teacher')->user()->national_id }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                                </div>
                                            </div>

                                            <!-- Address -->
                                            <div>
                                                <label for="address1" class="block text-gray-700 font-medium mb-1">Address</label>
                                                <input type="text" name="address1" id="address1" value="{{ Auth::guard('teacher')->user()->address }}" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200 mb-2">
                                            </div>

                                            <!-- Submit -->
                                            <button type="submit" class="bg-[#3F4D67] text-white px-6 py-2 rounded-lg hover:bg-[#4f6388] transition">Save Changes</button>
                                        </form>
                                    </div>


                                    <div id="privacy" class="tab-content hidden">
                                        <h2 class="text-xl font-semibold mb-4">Privacy</h2>
                                        <p>Control your privacy settings and manage who can see your information.</p>
                                    </div>

                                    <div id="verification" class="tab-content hidden">
                                        <h2 class="text-xl font-semibold mb-4">Verification</h2>
                                        <p>Verify your email, phone number, and identity documents.</p>
                                    </div>

                                    <div id="account-checkup" class="tab-content hidden">
                                        <h2 class="text-xl font-semibold mb-4">Account Checkup</h2>
                                        <p>Review your account activity, security checks, and connected devices.</p>
                                    </div>

                                    <div id="terms" class="tab-content hidden">
                                        <h2 class="text-xl font-semibold mb-4">Terms of Service</h2>
                                        <p>Read the Terms of Service agreement.</p>
                                    </div>

                                    <div id="privacy-policy" class="tab-content hidden">
                                        <h2 class="text-xl font-semibold mb-4">Privacy Policy</h2>
                                        <p>Review the Privacy Policy of our platform.</p>
                                    </div>

                                    <div id="cookies-policy" class="tab-content hidden">
                                        <h2 class="text-xl font-semibold mb-4">Cookies Policy</h2>
                                        <p>Learn how cookies are used on our platform.</p>
                                    </div>

                                    <div id="backup" class="tab-content hidden">
                                        <h2 class="text-xl font-semibold mb-4">Backup</h2>
                                        <a href="{{url('/database-backup')}}" class="hover:text-blue-500"> <i class="fa-solid fa-download me-3"></i> Download your database for your own security.</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right: Profile Picture -->
                <div class="lg:w-1/3">
                    <div class="bg-white shadow-md rounded-lg">
                        <div class="border-b px-6 py-4">
                            <h5 class="text-lg font-semibold">Profile Picture</h5>
                        </div>
                        <div class="p-6 flex flex-col items-center">
                            <img src="{{ asset('img/teacher/'. Auth::guard('teacher')->user()->photo ) }}" alt="Profile Picture" class="w-32 h-32 object-cover rounded-full mb-4 border shadow-lg">
                            <a href="{{url('/edit-teacher-view/'. Auth::guard('teacher')->user()->id )}}" class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg hover:bg-gray-600 transition text-sm">Edit Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [ Main Content ] end -->
    @include('layouts.footer')
 
    <script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.4/socket.io.min.js"></script>
    <script src="//js.pusher.com/7.2/pusher.min.js"></script>
    <script src="{{ asset('js/app.js') }}"></script>

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

        // setting content show
        const tabs = document.querySelectorAll('[data-tab]');
        const contents = document.querySelectorAll('.tab-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                // Remove active classes
                tabs.forEach(t => t.classList.remove('bg-blue-100', 'active-tab'));
                contents.forEach(c => c.classList.add('hidden'));

                // Add active class to clicked tab
                tab.classList.add('bg-blue-100', 'active-tab');
                const contentId = tab.getAttribute('data-tab');
                document.getElementById(contentId).classList.remove('hidden');
            });
        });

        // notification
        window.Echo.private('App.Models.User.{{ auth()->id() }}')
        .listen('BackupCompleted', (e) => {
            alert(e.message + ' File: ' + e.file); // বা Toastr ব্যবহার করতে পারো
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