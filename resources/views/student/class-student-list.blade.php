<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student - (SMS)</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Student Migration Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/student/migration')}}">Class list</a></li>
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
                            Student: <span class="text-gray-700">{{ $students[0]->room->name ?? 'N/A' }}</span> 
                            (<span class="text-gray-700">{{ $students[0]->room->section ?? 'N/A' }}</span>)
                        </h2>
                        @if($students->isNotEmpty())
                        <a href="{{url('/promote-class/'.$students[0]->class_id ?? 'N/A')}}" class="px-4 py-3 text-md border border-gray-400 rounded-md bg-[#3F4D67] text-white hover:bg-[#54668a] transition-all duration-300">Update Student</a>
                        @else
                            <p class="text-red-500">No students found for promotion.</p>
                        @endif
                    </div>
                </div>
                <div class="space-y-6 p-4">                    
                    @foreach($students as $val)
                        <div class="bg-white border rounded-xl shadow-md hover:shadow-lg transition duration-300 p-5">
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 items-center">
                                
                                <!-- Student Info -->
                                <div class="flex flex-col">
                                    <a href="{{ url('/edit-student-view/'.$val->id) }}" 
                                        class="text-lg font-semibold text-gray-900 hover:text-blue-600 transition">
                                        {{ $loop->iteration }}. {{ $val->first_name }} {{ $val->last_name }}
                                    </a>
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

                                <!-- Class Select -->
                                <!-- <div class="sm:text-center">
                                    <form action="{{ url('/update/student/class/'.$val->id) }}" method="POST" class="flex flex-col sm:flex-row gap-3 items-center justify-center">
                                        @csrf
                                        <input type="hidden" name="student_id" value="{{ $val->id }}">
                                        
                                        <input type="number" name="roll" min="1" max="{{ $val->room->capacity }}" value="{{ $val->roll_number }}" class="w-full sm:w-48 border border-gray-300 rounded-md p-2 text-gray-900 focus:outline-none focus:ring-2 focus:ring-green-500 shadow-sm">
                                        

                                        <select name="class_id" 
                                            class="w-full sm:w-48 border border-gray-300 rounded-md p-2 text-gray-900 
                                                focus:outline-none focus:ring-2 focus:ring-green-500 shadow-sm">
                                            <option disabled selected>-- Select Class --</option>
                                            @foreach($classes as $cls)
                                                <option value="{{ $cls->id }}" {{ $cls->id == $val->class_id ? 'selected' : '' }}>
                                                    {{ $cls->name }} {{ $cls->section ? ' - '.$cls->section : '' }}
                                                </option>
                                            @endforeach
                                        </select>

                                        <button type="submit"
                                            class="flex items-center gap-2 bg-green-500 hover:bg-green-600 text-white 
                                                font-semibold text-sm px-4 py-2 rounded-lg transition duration-200 
                                                shadow-md hover:shadow-lg w-full sm:w-auto">
                                            <i class="fa-solid fa-check"></i> Submit
                                        </button>
                                    </form>
                                </div> -->
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
