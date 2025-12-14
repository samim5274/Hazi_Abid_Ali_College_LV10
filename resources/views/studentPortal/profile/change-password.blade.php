<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - {{ Auth::guard('student')->user()->first_name }} {{ Auth::guard('student')->user()->last_name }} - {{ $company->name ?? "HAAC" }}</title>

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
                <!-- Flash Message -->
                @include('layouts.message')
                <!-- Profile Header -->
                <div class="bg-gradient-to-r from-[#273b61] to-[#3F4D67] rounded-lg shadow-lg text-white p-6 md:p-8 mb-8">
                    <div class="flex flex-col md:flex-row items-center gap-6">
                        <img src="{{ $student->photo ? asset('img/student/'.$student->photo) : asset('assets/images/default-avatar.png') }}" 
                            alt="Student Photo" class="w-24 h-24 md:w-32 md:h-32 rounded-full object-cover border-4 border-white shadow-md">                        
                        <div class="text-center md:text-left">
                            <h1 class="text-3xl text-white md:text-4xl font-bold">
                                {{ $student->first_name }} {{ $student->last_name }} - <small>Change password</small>
                            </h1>
                            <p class="text-lg mt-1">Roll: <span class="font-semibold">{{ $student->roll_number }}</span></p>
                            <p class="text-md">
                                Class: <span class="font-semibold">{{ $student->room->name ?? '-' }}</span> | 
                                Section: <span class="font-semibold">{{ $student->section ?? '-' }}</span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 gap-8">
                    <form action="{{ url('/update-password') }}" method="POST">
                        @csrf
                        <!-- Change Password -->
                        <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 p-6">
                            <h3 class="text-base font-semibold text-gray-700 mb-4 border-b pb-2">Modify Password</h3>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700">

                                <!-- New Password -->
                                <div>
                                    <label class="block mb-1 font-medium">New Password</label>
                                    <input type="password" id="password" name="password"
                                        class="border rounded px-2 py-1 text-md w-full focus:ring-2 focus:ring-green-500"
                                        placeholder="Enter new password"
                                        onkeyup="checkPassword()">
                                </div>

                                <!-- Confirm Password -->
                                <div>
                                    <label class="block mb-1 font-medium">Confirm Password</label>
                                    <input type="password" id="confirm_password" name="password_confirmation"
                                        class="border rounded px-2 py-1 text-md w-full focus:ring-2 focus:ring-green-500"
                                        placeholder="Confirm password"
                                        onkeyup="checkConfirmPassword()">
                                </div>

                                <!-- Rules -->
                                <div class="sm:col-span-2">
                                    <ul class="space-y-1 text-sm">
                                        <li id="length" class="text-gray-500">• Minimum 8 characters</li>
                                        <li id="uppercase" class="text-gray-500">• At least 1 capital letter</li>
                                        <li id="lowercase" class="text-gray-500">• At least 1 small letter</li>
                                        <li id="number" class="text-gray-500">• At least 1 number</li>
                                        <li id="special" class="text-gray-500">• At least 1 special character</li>
                                        <li id="match" class="text-gray-500">• Passwords must match</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="mt-4">
                                <input type="submit" class="bg-blue-500 text-white font-semibold border rounded px-2 py-1 w-full focus:ring-2 focus:ring-green-500" value="Submit">
                            </div>
                        </div>
                    </form>
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

        // password validation
        function setStatus(id, isValid, hasInput = true) {
            const el = document.getElementById(id);

            if (!hasInput) {
                el.className = "text-gray-500";
            } else if (isValid) {
                el.className = "text-green-600 font-medium";
            } else {
                el.className = "text-red-500";
            }
        }

        function checkPassword() {
            const password = document.getElementById("password").value;

            setStatus("length", password.length >= 8, password.length > 0);
            setStatus("uppercase", /[A-Z]/.test(password), password.length > 0);
            setStatus("lowercase", /[a-z]/.test(password), password.length > 0);
            setStatus("number", /\d/.test(password), password.length > 0);
            setStatus("special", /[@$!%*?&#]/.test(password), password.length > 0);

            checkConfirmPassword();
        }

        function checkConfirmPassword() {
            const password = document.getElementById("password").value;
            const confirm = document.getElementById("confirm_password").value;

            setStatus("match", confirm === password && confirm.length > 0, confirm.length > 0);
        }
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