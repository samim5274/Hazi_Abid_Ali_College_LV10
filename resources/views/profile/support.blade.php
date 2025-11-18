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
                <!-- Left: Contact Support -->
                <div class="w-full">
                    <div class="bg-gray-50 shadow-md rounded-lg p-8">
                        <h1 class="text-3xl font-bold text-gray-800 mb-6">Contact Support</h1>
                        <p class="text-gray-600 mb-10">
                            Need help? Contact our support team or the developer directly. We’re here to assist you 24/7 via your preferred communication channel.
                        </p>

                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                            <!-- Call Us -->
                            <div class="bg-white shadow-md rounded-lg p-6 text-center hover:shadow-lg transition">
                                <div class="mx-auto bg-blue-100 text-blue-600 w-16 h-16 flex items-center justify-center rounded-full text-3xl mb-4">
                                    <i class="fas fa-phone"></i>
                                </div>
                                <h2 class="font-semibold text-lg mb-2">Call Us</h2>
                                <p class="text-gray-500 mb-2">Available 9am - 10pm</p>
                                <a href="tel:+8801762164746" class="text-blue-600 font-medium hover:underline">+880 1762-164 746</a>
                            </div>

                            <!-- WhatsApp -->
                            <div class="bg-white shadow-md rounded-lg p-6 text-center hover:shadow-lg transition">
                                <div class="mx-auto bg-green-100 text-green-500 w-16 h-16 flex items-center justify-center rounded-full text-3xl mb-4">
                                    <i class="fab fa-whatsapp"></i>
                                </div>
                                <h2 class="font-semibold text-lg mb-2">WhatsApp</h2>
                                <p class="text-gray-500 mb-2">Chat with our agent</p>
                                <a href="https://wa.me/+8801762164746" target="_blank" class="text-green-500 font-medium hover:underline">Start Chat</a>
                            </div>

                            <!-- Telegram -->
                            <div class="bg-white shadow-md rounded-lg p-6 text-center hover:shadow-lg transition">
                                <div class="mx-auto bg-blue-100 text-blue-400 w-16 h-16 flex items-center justify-center rounded-full text-3xl mb-4">
                                    <i class="fab fa-telegram"></i>
                                </div>
                                <h2 class="font-semibold text-lg mb-2">Telegram</h2>
                                <p class="text-gray-500 mb-2">Send us a message</p>
                                <a href="https://t.me/samim5274" target="_blank" class="text-blue-400 font-medium hover:underline">Message on Telegram</a>
                            </div>

                            <!-- Email -->
                            <div class="bg-white shadow-md rounded-lg p-6 text-center hover:shadow-lg transition">
                                <div class="mx-auto bg-red-100 text-yellow-500 w-16 h-16 flex items-center justify-center rounded-full text-3xl mb-4">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <h2 class="font-semibold text-lg mb-2">Email</h2>
                                <p class="text-gray-500 mb-2">Get support via email</p>
                                <a href="mailto:cse.shamim.cub@gamil.com" class="text-yellow-500 font-medium hover:underline">cse.shamim.cub@gamil.com</a>
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