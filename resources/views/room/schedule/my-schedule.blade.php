<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classes/Room - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Classes Schedule Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/class-details')}}">Class list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Schedule</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            

            <div class="p-6 space-y-8">

                @php
                    $groupedSchedules = $schedules->groupBy('class_id')->sortKeys();
                    $days = ['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'];
                @endphp

                @foreach($groupedSchedules as $classId => $classSchedules)
                    <div class="bg-white shadow-lg rounded-2xl p-6 overflow-x-auto hover:shadow-2xl transition duration-300">
                        
                        <div class="flex flex-col md:flex-row justify-between items-center mb-6">
                            <h2 class="text-2xl font-bold text-indigo-700 text-center md:text-left">
                                Class: {{ $classSchedules->first()->classRoom->name ?? 'N/A' }}
                                <span class="text-sm text-gray-500 ml-2">
                                    ({{ $classSchedules->first()->classRoom->section ?? '' }})
                                </span>
                            </h2>
                            <span class="text-gray-500 text-sm mt-2 md:mt-0">Teacher: {{ $classSchedules->first()->teacher->first_name ?? '' }} {{ $classSchedules->first()->teacher->last_name ?? '' }}</span>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="min-w-full border border-gray-200 text-sm text-center rounded-lg overflow-hidden">
                                <thead>
                                    <tr class="bg-gradient-to-r from-blue-600 to-indigo-600 text-white">
                                        <th class="px-4 py-3 border">Day</th>
                                        @for($i = 1; $i <= 8; $i++)
                                            <th class="px-4 py-3 border">Period {{ $i }}</th>
                                        @endfor
                                    </tr>
                                </thead>

                                <tbody>
                                    @foreach($days as $day)
                                        <tr class="hover:bg-gray-50 transition">
                                            <td class="px-4 py-3 font-semibold text-gray-800 border bg-gray-100">
                                                {{ $day }}
                                            </td>

                                            @php
                                                $daySchedules = $classSchedules->where('day', $day)->take(8);
                                            @endphp

                                            @for($p = 1; $p <= 8; $p++)
                                                @php
                                                    $period = $daySchedules->firstWhere('period', $p);
                                                @endphp

                                                @if($period)
                                                    <td class="px-3 py-3 border">
                                                        <div class="font-medium text-blue-700 truncate">
                                                            {{ $period->subject->name ?? 'N/A' }}
                                                        </div>
                                                        <div class="text-xs text-gray-500 truncate">
                                                            {{ $period->teacher->first_name ?? '' }} {{ $period->teacher->last_name ?? '' }}
                                                        </div>
                                                        <div class="text-[11px] text-gray-400 mt-1">
                                                            {{ \Carbon\Carbon::parse($period->start_time)->format('h:i A') }}
                                                            –
                                                            {{ \Carbon\Carbon::parse($period->end_time)->format('h:i A') }}
                                                        </div>
                                                    </td>
                                                @else
                                                    <td class="px-3 py-3 border text-gray-400 italic bg-gray-50">
                                                        Free
                                                    </td>
                                                @endif
                                            @endfor
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        <p class="text-xs text-gray-500 mt-3 text-center md:text-left">
                            Note: Maximum 8 periods per day. Free periods are highlighted in light gray.
                        </p>

                    </div>
                @endforeach

            </div>


            <div class="p-6 space-y-6">

                @php
                    $days = ['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'];
                    $groupedByDay = $schedules->groupBy('day');
                @endphp

                @foreach($days as $day)
                    <div class="bg-white shadow-lg rounded-2xl p-6 overflow-x-auto hover:shadow-2xl transition duration-300">
                        
                        <h2 class="text-2xl font-bold text-indigo-700 text-center mb-6">
                            {{ $day }}
                        </h2>

                        <table class="min-w-full border border-gray-200 text-sm text-center rounded-lg overflow-hidden">
                            <thead>
                                <tr class="bg-gradient-to-r from-blue-600 to-indigo-600 text-white">
                                    <th class="px-4 py-3 border">Period</th>
                                    <th class="px-4 py-3 border">Class</th>
                                    <th class="px-4 py-3 border">Subject</th>
                                    <th class="px-4 py-3 border">Time</th>
                                </tr>
                            </thead>

                            <tbody>
                                @php
                                    $daySchedules = $groupedByDay[$day] ?? collect();
                                @endphp

                                @for($p = 1; $p <= 8; $p++)
                                    @php
                                        $period = $daySchedules->firstWhere('period', $p);
                                    @endphp

                                    <tr class="hover:bg-gray-50 transition">
                                        <td class="px-4 py-3 border font-semibold text-gray-800">{{ $p }}</td>

                                        @if($period)
                                            <td class="px-4 py-3 border text-gray-700">{{ $period->classRoom->name ?? 'N/A' }} ({{ $period->classRoom->section ?? '' }})</td>
                                            <td class="px-4 py-3 border text-blue-700 font-medium">{{ $period->subject->name ?? 'N/A' }}</td>
                                            <td class="px-4 py-3 border text-gray-500 text-sm">
                                                {{ \Carbon\Carbon::parse($period->start_time)->format('h:i A') }}
                                                –
                                                {{ \Carbon\Carbon::parse($period->end_time)->format('h:i A') }}
                                            </td>
                                        @else
                                            <td colspan="3" class="px-4 py-3 border text-gray-400 italic bg-gray-50">Free Period</td>
                                        @endif
                                    </tr>
                                @endfor
                            </tbody>
                        </table>

                        <p class="text-xs text-gray-500 mt-3 text-center md:text-left">
                            Note: Maximum 8 periods per day. Free periods are highlighted in light gray.
                        </p>
                    </div>
                @endforeach

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
