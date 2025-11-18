<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subject - (SMS)</title>

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
                            <h5 class="mb-0 font-medium">Student Entrollment</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{url('/enrollment/class')}}">Class</a></li>
                            <li class="breadcrumb-item" aria-current="page">Student</li>
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
                            Student: <span class="text-gray-700">{{ $students[0]->room->name ?? 'N/A' }}</span> 
                            (<span class="text-gray-700">{{ $students[0]->room->section ?? 'N/A' }}</span>)
                        </h2>

                        <!-- Subject Info 
                        <h3 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-green-500 text-xl">📌</span>
                            <span class="text-gray-700"></span>
                        </h3> -->
                    </div>
                </div>
                <div class="space-y-6 p-4">
                    @foreach($students as $val)
                        <a href="{{ url('/enrollment/class/student/subject/'. $class. '/' . $val->id) }}" class="block bg-white border border-gray-200 rounded-xl shadow-sm hover:shadow-lg transition-shadow duration-300 overflow-hidden">
                            <div class="flex flex-col sm:flex-row items-center p-6 gap-6">

                                <div class="flex-shrink-0">
                                    @if($val->photo)
                                        <img class="w-16 h-16 rounded-full object-cover border-2 border-gray-300" src="{{ asset('img/student/' . $val->photo) }}" alt="{{ $val->first_name }} {{ $val->last_name }} photo" />
                                    @else
                                        <div class="w-16 h-16 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 font-medium">
                                            {{ substr($val->first_name, 0, 1) }}{{ substr($val->last_name, 0, 1) }}
                                        </div>
                                    @endif
                                </div>

                                <div class="flex-grow text-center sm:text-left">
                                    <h5 class="text-xl font-bold text-gray-900 tracking-tight leading-tight mb-1">
                                        {{ $val->first_name }} {{ $val->last_name }}
                                    </h5>
                                    <p class="text-gray-500 text-sm mb-2">{{ $val->address }}</p>

                                    <div class="flex flex-col sm:flex-row sm:items-center gap-3 text-sm">
                                        <span class="flex items-center gap-1.5 text-red-600 font-medium">
                                            <i class="fa fa-droplet text-red-500 text-[10px] fa-lg ltr:mr-4 rtl:ml-4"></i>
                                            {{ $val->blood_group }}
                                        </span>

                                        <span class="hidden sm:inline-block text-gray-400">|</span>

                                        <span class="flex items-center gap-1.5 text-gray-700">
                                            <i class="fas fa-school fa-lg text-gray-400"></i>
                                            <span class="font-medium">{{ $val->room->section }}</span> ({{ $val->room->name }})
                                        </span>
                                    </div>
                                </div>

                                <div class="flex-shrink-0 text-center sm:text-right">
                                    <p class="text-sm font-semibold text-gray-700">{{ $val->email }}</p>
                                    <p class="text-sm font-medium text-gray-500">0{{ $val->contact_number }}</p>
                                </div>

                            </div>
                        </a>
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
