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
                        <li class="breadcrumb-item"><a href="{{url('/exam-class-list')}}">Class</a></li>
                        <li class="breadcrumb-item" aria-current="page">Subject</li>
                        <li class="breadcrumb-item" aria-current="page">Mark</li>
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

                        <!-- Subject Info -->
                        <h3 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-green-500 text-xl">📌</span>
                            Subject: <span class="text-gray-700">{{ $sub->name }}</span>
                        </h3>
                    </div>
                </div>
                <div class="space-y-4">                    
                    @foreach($students as $val)
                    <div class="bg-white border rounded-xl shadow-sm hover:shadow-lg transition p-5">
                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-5 items-center">
                            
                            <!-- Student Info -->
                            <div>
                                <a href="{{ url('/edit-student-view/'.$val->id) }}" 
                                class="text-gray-900 font-semibold text-lg hover:text-blue-600 transition">
                                    {{ $loop->iteration }}. {{ $val->first_name }} {{ $val->last_name }}
                                </a>
                                <div class="flex items-center gap-2 text-sm text-gray-600 mt-1">
                                    <span class="text-red-500 font-medium">
                                        <i class="fa fa-droplet"></i> {{ $val->blood_group }}
                                    </span>
                                    <span class="text-gray-400">|</span>
                                    <span class="truncate max-w-[250px]">
                                        {{ $val->address1 }}
                                    </span>
                                </div>
                            </div>

                            <!-- Marks Display -->
                            <div class="sm:text-center">
                                @php
                                    $studentMarks = $marks->where('student_id', $val->id)->first();
                                @endphp

                                @if($studentMarks)
                                    <span class="inline-block px-3 py-1 rounded-full text-sm font-medium 
                                        {{ $studentMarks->gpa >= 2.0 ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                                        {{ $studentMarks->marks_obtained }} → ({{ $studentMarks->grade }})
                                    </span>
                                @else
                                    <span class="inline-block px-3 py-1 rounded-full bg-gray-100 text-gray-500 text-sm italic">
                                        No marks yet
                                    </span>
                                @endif
                            </div>

                            <!-- Marks Input & Submit -->
                            <form action="{{ url('/submit-mark/'.$val->id) }}" method="POST" 
                                class="flex flex-col sm:flex-row sm:justify-end items-center gap-3">
                                @csrf
                                <input type="hidden" name="subject_id" value="{{ $sub->id }}">
                                <input type="hidden" name="class_id" value="{{ $room->id }}">
                                <input type="hidden" name="exam_id" value="{{ $exam->id }}">

                                <input type="number" name="marks_obtained" min="0" max="{{$exam->max_marks}}" required
                                    class="w-full sm:w-28 border border-gray-300 rounded-md px-3 py-2 text-gray-800 
                                        placeholder-gray-400 focus:outline-none focus:ring-2 
                                        focus:ring-green-500 focus:border-green-500"
                                    placeholder="Enter Mark">

                                <button type="submit"
                                        class="flex items-center justify-center bg-green-500 hover:bg-green-600 
                                            text-white font-semibold text-sm px-4 py-2 rounded-md w-full sm:w-auto 
                                            transition duration-200 shadow-md hover:shadow-lg">
                                    <i class="fa-solid fa-check mr-2"></i> Submit
                                </button>
                            </form>
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
