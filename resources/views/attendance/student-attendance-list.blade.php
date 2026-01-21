<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance - {{ $company->name }}</title>

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

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            <!-- Flash Message -->
            @include('layouts.message')
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
                        Class: {{ $students->first()->room->name ?? 'N/A' }} 
                        ({{ $students->first()->room->section ?? 'N/A' }}) 
                        - {{ $subject->name }}
                    </h3>
                </div>

                <div class="bg-white border border-gray-200 rounded-2xl shadow-sm overflow-hidden">

                    <!-- Table Header -->
                    <div class="px-5 py-4 border-b border-gray-200 flex items-center justify-between">
                        <div>
                            <h3 class="text-base font-bold text-gray-800">📌 Student Attendance</h3>
                            <p class="text-sm text-gray-500"> Class: {{ $students->first()->room->name ?? 'N/A' }} ({{ $students->first()->room->section ?? 'N/A' }}) - {{ $subject->name }}</p>
                        </div>

                        <div class="text-xs text-gray-500">
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
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto">
                        <table class="min-w-full text-sm">
                            <thead class="bg-gray-50 sticky top-0 z-10">
                                <tr class="text-left text-gray-600">
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">Roll</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">Student</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap text-right">Status</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap text-right">Action</th>
                                </tr>
                            </thead>

                            <tbody class="divide-y divide-gray-100">
                                @forelse($students as $val)
                                    @php
                                        $isAttended = in_array($val->id, $attendanceCheck);

                                        $status = $isAttended ? ($attendanceData[$val->id]->status ?? '') : null;

                                        $badge = match($status) {
                                            'Present' => 'bg-green-50 text-green-700 ring-green-200',
                                            'Absent'  => 'bg-red-50 text-red-700 ring-red-200',
                                            default   => 'bg-gray-50 text-gray-700 ring-gray-200',
                                        };

                                        $avatar = strtoupper(substr($val->first_name ?? 'S', 0, 1));
                                    @endphp

                                    <tr class="hover:bg-gray-50/70">
                                        <!-- Roll -->
                                        <td class="px-5 py-4 whitespace-nowrap text-gray-600">
                                            <span class="inline-flex items-center px-2.5 py-1 rounded-lg bg-gray-100 text-gray-700 font-semibold">
                                                {{ $val->roll_number }}
                                            </span>
                                        </td>

                                        <!-- Student -->
                                        <td class="px-5 py-4 whitespace-nowrap">
                                            <div class="flex items-center gap-3">
                                                <!-- Avatar -->
                                                <div class="w-10 h-10 rounded-full bg-gray-100 border border-gray-200 flex items-center justify-center font-bold text-gray-700">
                                                    {{ $avatar }}
                                                </div>

                                                <div class="leading-tight">
                                                    <div class="font-semibold text-gray-900">
                                                        {{ $val->first_name }} {{ $val->last_name }}
                                                        <span class="text-gray-400 font-normal">• {{ $val->roll_number }}</span>
                                                    </div>
                                                    <div class="text-xs text-gray-500 flex items-center gap-2 mt-1">
                                                        <span class="inline-flex items-center gap-1">
                                                            <i class="fa-solid fa-droplet text-red-500"></i>
                                                            {{ $val->blood_group ?? 'N/A' }}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <!-- Status -->
                                        <td class="px-5 py-4 whitespace-nowrap text-right">
                                            @if($isAttended)
                                                <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-semibold ring-1 {{ $badge }}">
                                                    @if($status === 'Present')
                                                        <i class="fa-solid fa-circle-check"></i>
                                                    @elseif($status === 'Absent')
                                                        <i class="fa-solid fa-circle-xmark"></i>
                                                    @else
                                                        <i class="fa-solid fa-circle-info"></i>
                                                    @endif
                                                    {{ $status }}
                                                </span>
                                            @else
                                                <span class="inline-flex items-center px-3 py-1.5 rounded-full text-xs font-semibold ring-1 bg-yellow-50 text-yellow-700 ring-yellow-200">
                                                    <i class="fa-solid fa-clock mr-1"></i> Pending
                                                </span>
                                            @endif
                                        </td>

                                        <!-- Actions -->
                                        <td class="px-5 py-4 whitespace-nowrap text-right">
                                            @if($isAttended)
                                                <span class="text-xs text-gray-400">Marked</span>
                                            @else
                                                <div class="inline-flex items-center gap-2">
                                                    <a href="{{ url('/std-absend/subject/'.$val->id.'/'.$subject->id) }}"
                                                    class="inline-flex items-center gap-2 px-3 py-2 rounded-xl text-xs font-semibold
                                                            bg-red-50 text-red-700 ring-1 ring-red-200 hover:bg-red-100 transition">
                                                        <i class="fa-solid fa-xmark"></i>
                                                        Absent
                                                    </a>

                                                    <a href="{{ url('/std-present/subject/'.$val->id.'/'.$subject->id) }}"
                                                    class="inline-flex items-center gap-2 px-3 py-2 rounded-xl text-xs font-semibold
                                                            bg-green-50 text-green-700 ring-1 ring-green-200 hover:bg-green-100 transition">
                                                        <i class="fa-solid fa-check"></i>
                                                        Present
                                                    </a>
                                                </div>
                                            @endif
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="px-5 py-10 text-center text-gray-500">
                                            <i class="fa-regular fa-folder-open text-2xl mb-2"></i>
                                            <div class="font-semibold text-gray-700">No students found</div>
                                            <div class="text-sm text-gray-500">Try changing filters or class.</div>
                                        </td>
                                    </tr>
                                @endforelse
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
