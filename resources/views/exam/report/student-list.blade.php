<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results Marks - (SMS)</title>

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

<body class="bg-gray-50 font-sans">
    
    <!-- Sidebar -->
    @include('layouts.navbar')

    <!-- Header -->
    @include('layouts.header')

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Report & Result Analytices</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/result-and-report-analytics')}}">Class list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Student list</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm ">
                <div class="bg-gray-100 border-b px-4 py-4 sm:py-6 rounded-t-lg">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                        <!-- Student Info -->
                        <h2 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-blue-500 text-xl">📌</span>
                            <span class="text-gray-700">{{ $students[0]->room->name ?? 'N/A' }}</span> 
                            (<span class="text-gray-700">{{ $students[0]->room->section ?? 'N/A' }}</span>)
                        </h2>
                    </div>
                </div>
                <div class="space-y-6 p-4">                    
                    @foreach($students as $val)                    
                        <div class="bg-white border rounded-xl shadow-md hover:shadow-xl transition duration-300 p-5">
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 items-center">
                                <a href="{{ url('/result-report/class/student/'.$class.'/'.$val->id) }}">
                                    <!-- Student Info -->
                                    <div class="flex flex-col">
                                        <p class="text-lg font-semibold text-gray-900 hover:text-blue-600 transition">
                                            {{ $loop->iteration }}. {{ $val->first_name }} {{ $val->last_name }}
                                        </p>
                                        <div class="flex items-center gap-3 mt-2 text-sm text-gray-600">
                                            <span class="flex items-center gap-1 text-red-500 font-medium">
                                                <i class="fa fa-droplet"></i> {{ $val->blood_group }}
                                            </span>
                                            <span class="text-gray-400">|</span>
                                            <span class="truncate max-w-[220px]">
                                                {{ $val->address1 }}
                                            </span>
                                        </div>
                                    </div>
                                </a>
                                <a href="{{ url('/result-report/class/student/'.$class.'/'.$val->id) }}">
                                    <!-- Student Info -->
                                    <div class="flex flex-col items-end justify-end text-xl">
                                        <span class="text-[#3F4D67]"><i class="fa-solid fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        </div>                    
                    @endforeach
                </div>

            </div>
            <!-- Card End -->
        </div>
    </div>
    <!-- [ Main Content ] end -->

    @include('layouts.footer')
        
    <!-- Scripts -->
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

    <script> layout_change('false'); </script>
    <script> layout_theme_sidebar_change('dark'); </script>
    <script> change_box_container('false'); </script>
    <script> layout_caption_change('true'); </script>
    <script> layout_rtl_change('false'); </script>
    <script> preset_change('preset-1'); </script>
    <script> main_layout_change('vertical'); </script>

</body>
</html>
