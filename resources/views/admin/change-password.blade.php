<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System (SMS)</title>

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
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-0 font-medium">Account & Privacy</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
                        <li class="breadcrumb-item">Setting</li>
                        <li class="breadcrumb-item">Account</li>
                        <li class="breadcrumb-item">Securty</li>
                        <li class="breadcrumb-item" aria-current="page">Password</li>
                    </ul>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->

            <!-- [ Main Content ] start -->
            <div class="flex items-center justify-center bg-gray-100 py-10 px-4">
                <div class="w-full max-w-md">
                    <div class="bg-white p-6 rounded-lg shadow-lg">
                        <h2 class="text-2xl font-semibold mb-6 text-center">Change Password</h2>
                        <form id="changePasswordForm" action="{{ url('/update-password') }}" method="POST">
                            @csrf
                            <!-- Current Password -->
                            <div class="mb-5">
                                <label for="current_password" class="block text-gray-700 font-medium mb-2">Current Password</label>
                                <input type="password" name="current_password" id="current_password"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200"
                                    required>
                            </div>

                            <!-- New Password -->
                            <div class="mb-5">
                                <label for="new_password" class="block text-gray-700 font-medium mb-2">New Password</label>
                                <input type="password" name="new_password" id="new_password"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200"
                                    required>
                                <p id="passwordHelp" class="text-sm text-gray-500 mt-1">
                                    Must contain at least 6 characters, 1 capital letter, 1 small letter, 1 number, and 1 special character.
                                </p>
                            </div>

                            <!-- Confirm Password -->
                            <div class="mb-5">
                                <label for="confirm_password" class="block text-gray-700 font-medium mb-2">Confirm Password</label>
                                <input type="password" name="confirm_password" id="confirm_password"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200"
                                    required>
                            </div>

                            <!-- Validation Message -->
                            <div id="passwordError" class="text-red-500 text-sm mb-4 hidden"></div>

                            <button type="submit" id="submitBtn"
                                class="w-full bg-blue-500 text-white py-3 px-4 rounded-lg hover:bg-blue-600 transition font-medium">
                                Update Password
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- [ Main Content ] end -->        
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

        const newPassword = document.getElementById('new_password');
        const confirmPassword = document.getElementById('confirm_password');
        const form = document.getElementById('changePasswordForm');
        const passwordError = document.getElementById('passwordError');
        const submitBtn = document.getElementById('submitBtn');

        function validatePassword(password) {
            const minLength = /.{6,}/;
            const capital = /[A-Z]/;
            const small = /[a-z]/;
            const number = /[0-9]/;
            const special = /[!@#$%^&*(),.?":{}|<>]/;

            return minLength.test(password) &&
                capital.test(password) &&
                small.test(password) &&
                number.test(password) &&
                special.test(password);
        }

        function checkPasswords() {
            passwordError.classList.add('hidden');
            let valid = true;

            if(!validatePassword(newPassword.value)) {
                passwordError.textContent = 'Password must have at least 6 characters, 1 capital, 1 small, 1 number, and 1 special character.';
                passwordError.classList.remove('hidden');
                valid = false;
            } else if(newPassword.value !== confirmPassword.value) {
                passwordError.textContent = 'New Password and Confirm Password do not match.';
                passwordError.classList.remove('hidden');
                valid = false;
            }

            submitBtn.disabled = !valid;
        }

        newPassword.addEventListener('keyup', checkPasswords);
        confirmPassword.addEventListener('keyup', checkPasswords);

        form.addEventListener('submit', function(e) {
            if(submitBtn.disabled) {
                e.preventDefault();
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