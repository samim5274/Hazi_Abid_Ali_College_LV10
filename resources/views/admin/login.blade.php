<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - (SMS)</title>

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
  <!-- Flash Message -->
  @include('layouts.message')


  <!-- [ Main Content ] start -->
  <div class="auth-main relative">
    <div class="auth-wrapper v1 flex items-center w-full h-full min-h-screen">
      <div class="auth-form flex items-center justify-center grow flex-col min-h-screen relative p-6">
        <div class="w-full max-w-[350px] relative">
          <div class="auth-bg">
            <span class="absolute top-[-100px] right-[-100px] w-[300px] h-[300px] block rounded-full bg-theme-bg-1 animate-[floating_7s_infinite]"></span>
            <span class="absolute top-[150px] right-[-150px] w-5 h-5 block rounded-full bg-primary-500 animate-[floating_9s_infinite]"></span>
            <span class="absolute left-[-150px] bottom-[150px] w-5 h-5 block rounded-full bg-theme-bg-1 animate-[floating_7s_infinite]"></span>
            <span class="absolute left-[-100px] bottom-[-100px] w-[300px] h-[300px] block rounded-full bg-theme-bg-2 animate-[floating_9s_infinite]"></span>
          </div>

          <div class="card sm:my-12 w-full shadow-none">
            <div class="card-body !p-10">
              <div class="text-center mb-8">
                <img src="{{ asset('assets/images/logo-dark.svg') }}" alt="logo" class="mx-auto auth-logo"/>
              </div>
              <h4 class="text-center font-medium mb-4">Login</h4>
              
              <form action="{{ url('/user-login') }}" method="POST">
                @csrf
                <div class="mb-3">
                  <input type="email" name="txtUsername" class="form-control" placeholder="Email Address" required />
                </div>
                <div class="mb-4">
                  <input type="password" name="txtPassword" class="form-control" placeholder="Password" required />
                </div>
                <div class="mb-3">
                  <select name="cbxRole" class="form-control" required>
                    <option selected disabled>-- Select Role --</option>
                    <option value="1">Teacher</option>
                    <option value="2">Student</option>
                  </select>
                </div>
                <div class="flex mt-1 justify-between items-center flex-wrap">
                  <div class="form-check">
                    <input class="form-check-input input-primary" checked type="checkbox" id="rememberMe" name="cbxRemember" />
                    <label class="form-check-label text-muted" for="rememberMe">Remember me?</label>
                  </div>
                  <h6 class="font-normal text-primary-500 mb-0">
                    <a href="#">Forgot Password?</a>
                  </h6>
                </div>
                <div class="mt-4 text-center">
                  <button type="submit" class="btn btn-primary mx-auto shadow-2xl w-full">Login</button>
                </div>
              </form>

              <div class="flex justify-between items-end flex-wrap mt-4">
                <h6 class="font-medium mb-0">Don't have an Account?</h6>
                <a href="register-v1.html" class="text-primary-500">Create Account</a>
              </div>
            </div>
          </div>

        </div>
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

</body>
</html>
