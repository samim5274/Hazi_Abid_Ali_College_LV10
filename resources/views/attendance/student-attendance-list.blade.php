<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance - (SMS)</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Attendance Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/attendance')}}">Class</a></li>
                        <li class="breadcrumb-item" aria-current="page">Subject</li>
                        <li class="breadcrumb-item" aria-current="page">Student</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
             <div class="card rounded-lg border shadow-sm">
                <div class="card-header px-4 py-3 border-b bg-gray-100">
                    <h3 class="text-lg font-semibold text-gray-700">
                        Class: {{ $student->first()->room->name ?? 'N/A' }} 
                        ({{ $student->first()->room->section ?? 'N/A' }}) 
                        - {{ $subject->name }}
                    </h3>
                </div>

                <div class="card-body p-6 bg-gray-50 rounded-b-lg">
                    <div class="overflow-x-auto">
                        <div class="flex flex-wrap items-center justify-between mb-4 gap-3">    
                            <h2 class="text-xl font-bold text-gray-700 flex items-center gap-2">
                                📌 Student Attendance
                            </h2>
                            <!-- Attendance Summary -->
                            <div class="flex flex-wrap gap-3">
                                <span class="text-black bg-green-200 px-4 py-2 rounded-full font-medium shadow hover:bg-green-300 transition">
                                    Total: {{ $totalStudent }}
                                </span>
                                <span class="text-black bg-blue-200 px-4 py-2 rounded-full font-medium shadow hover:bg-blue-300 transition">
                                    Present: {{ $present }}
                                </span>
                                <span class="text-black bg-yellow-200 px-4 py-2 rounded-full font-medium shadow hover:bg-yellow-300 transition">
                                    Absent: {{ $absent }}
                                </span>
                            </div>
                        </div>

                        <table class="min-w-full table-auto border-collapse">
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach($student as $val)
                                <tr class="hover:bg-gray-50">

                                    <!-- Roll -->
                                    <td class="px-4 py-3 whitespace-nowrap text-gray-500 text-sm">
                                        {{ $val->roll_number }}
                                    </td>

                                    <!-- Name -->
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <div class="flex flex-col">
                                            <span class="text-gray-900 font-semibold">
                                                {{ $val->first_name }} {{ $val->last_name }}
                                            </span>
                                            <span class="text-gray-400 text-sm">
                                                <i class="fa fa-droplet text-red-500"></i> {{ $val->blood_group }}
                                            </span>
                                        </div>
                                    </td>

                                    <!-- Attendance Buttons -->
                                    <td class="px-4 py-3 whitespace-nowrap text-right">

                                        @if(in_array($val->id, $attendanceCheck))
                                            @php
                                                $status = $attendanceData[$val->id]->status ?? '';
                                                $bgColor  = $status === 'Present' ? 'bg-green-100' : 'bg-red-100';
                                                $textColor = $status === 'Present' ? 'text-green-700' : 'text-red-700';
                                            @endphp
                                            <!-- Already attended -->
                                            <span class="px-3 py-1 text-xs rounded-full {{ $bgColor }} {{ $textColor }}">
                                                {{ $status }}
                                            </span>
                                        @else
                                            <div class="flex gap-2 justify-end">
                                                <a href="{{ url('/std-absend/subject/'.$val->id.'/'.$subject->id) }}"
                                                    class="bg-red-500 hover:bg-red-600 text-white text-xs px-2 py-1 rounded">
                                                    ✘
                                                </a>

                                                <a href="{{ url('/std-present/subject/'.$val->id.'/'.$subject->id) }}"
                                                    class="bg-green-500 hover:bg-green-600 text-white text-xs px-2 py-1 rounded">
                                                    ✔
                                                </a>
                                            </div>
                                        @endif

                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
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
