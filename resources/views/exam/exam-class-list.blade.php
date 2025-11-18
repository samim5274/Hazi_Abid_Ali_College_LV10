<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam's - (SMS)</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Result Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/exam-management')}}">Exam</a></li>
                        <li class="breadcrumb-item" aria-current="page">Class List</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm">
                <div class="card-header px-4 py-3 border-b bg-gray-100">
                    <h3 class="text-lg font-semibold text-gray-700">Classes List</h3>
                </div>
                <!-- <div class="card-body p-6">
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                        @foreach($classes as $val)
                            <a href="{{url('/class/subject/'.$val->id)}}">
                                <div class="border p-5 rounded-md bg-white shadow-sm transform transition duration-300 hover:-translate-y-2 hover:shadow-xl">
                                    <div class="flex items-center justify-between mb-3">
                                        <h3 class="text-lg font-semibold text-[#3F4D67]">
                                            {{ $val->name }} - {{ $val->section ?? 'N/A' }}
                                        </h3>
                                        <span class="px-2 py-1 text-xs rounded bg-green-100 text-green-700">
                                            {{ $val->section ?? 'N/A' }}
                                        </span>
                                    </div>
                                    <div class="space-y-2 text-sm text-gray-600">
                                        <p>
                                            <i class="fa-solid fa-user-tie mr-2 text-blue-500"></i>
                                            Teacher: {{ $val->class_teacher_id ?? 'Not Assigned' }}
                                        </p>
                                        <p>
                                            <i class="fa-solid fa-users mr-2 text-purple-500"></i>
                                            Capacity: {{ $val->capacity }}
                                        </p>
                                    </div>
                                </div>
                            </a>
                        @endforeach
                    </div>
                </div> -->
                <div class="card-body p-6">
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                        @foreach($classes as $val)
                        @if($val->id != 13)
                            <a href="{{url('/class/exam/'.$val->id)}}">
                                <div class="border p-5 rounded-md bg-white shadow-md transform transition duration-300 hover:-translate-y-2 hover:shadow-xl">
                                    <div class="flex items-center justify-between mb-3">
                                        <h3 class="text-lg font-semibold text-[#3F4D67]">
                                            {{ $val->name }} - {{ $val->section ?? 'N/A' }}
                                        </h3>
                                        <span class="px-2 py-1 text-xs rounded bg-green-100 text-green-700">
                                            {{ $val->section ?? 'N/A' }}
                                        </span>
                                    </div>
                                    <div class="space-y-2 text-sm text-gray-600">
                                        <p>
                                            <i class="fa-solid fa-user-tie mr-2 text-blue-500"></i>
                                            Teacher: {{ $val->teachers->first_name }} {{ $val->teachers->last_name }}
                                        </p>
                                        <p>
                                            <i class="fa-solid fa-users mr-2 text-purple-500"></i>
                                            Capacity: {{ $val->capacity }}
                                        </p>
                                    </div>
                                </div>
                            </a>
                        @endif
                        @endforeach
                    </div>
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
