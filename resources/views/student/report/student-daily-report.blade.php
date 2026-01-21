<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Daily Report - {{ $company->name }}</title>

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
    
    <!-- Sidebar -->
    @include('layouts.navbar')

    <!-- Header -->
    @include('layouts.header')


    <!-- [ Main Content ] start -->
    <div class="pc-container min-h-screen">
        <div class="pc-content py-8 px-4 sm:px-6 lg:px-8 space-y-8">
            <!-- Flash Message -->
            @include('layouts.message')
            <!-- Page Header -->
            <form action="{{ route('filter-student-daily-report') }}" method="GET" class="grid md:grid-cols-2 gap-6">

                <!-- Class Dropdown -->
                <div class="flex flex-col">
                    <label class="text-gray-700 font-medium mb-1">Select Class</label>
                    <select id="class_id" name="class_id"
                        class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:outline-none bg-gray-50">
                        <option value="">-- Select Class --</option>
                        @foreach($classes as $class)
                            <option value="{{ $class->id }}">{{ $class->name }}</option>
                        @endforeach
                    </select>
                </div>

                <!-- Student Dropdown -->
                <div class="flex flex-col">
                    <label class="text-gray-700 font-medium mb-1">Select Student</label>
                    <select id="student_id" name="student_id"
                        class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:outline-none bg-gray-50">
                        <option value="">-- Select Student --</option>
                    </select>
                </div>

                <!-- Date From -->
                <div class="flex flex-col">
                    <label class="text-gray-700 font-medium mb-1">From Date</label>
                    <input type="date" name="from_date" id="from_date"
                        class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 bg-gray-50">
                </div>

                <!-- Date To -->
                <div class="flex flex-col">
                    <label class="text-gray-700 font-medium mb-1">To Date</label>
                    <input type="date" name="to_date" id="to_date"
                        class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 bg-gray-50">
                </div>

                <!-- Submit Button -->
                <div class="md:col-span-2 flex justify-end mt-4">
                    <button type="submit"
                        class="px-8 py-3 bg-blue-600 text-white font-semibold rounded-xl shadow hover:bg-blue-700 transition">
                        Filter Report
                    </button>
                </div>

            </form>
        </div>
        <div class="pc-content py-8 px-4 sm:px-6 lg:px-8 space-y-6">

            <!-- Title + Meta -->
            <div class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-2">
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Student Daily Routine</h2>
                    <p class="text-sm text-gray-500 mt-1">Daily routine reports (sleep, attendance, activities)</p>
                </div>
                <div class="text-sm text-gray-500">
                    Total: <span class="font-semibold text-gray-800">{{ $routine->count() }}</span>
                </div>
            </div>

            <!-- Table Card -->
            <div class="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="min-w-full text-sm">
                        <!-- Head -->
                        <thead class="bg-gray-50 sticky top-0 z-10 border-b border-gray-200">
                            <tr class="text-left text-gray-600">
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Date</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Student</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Awake</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Attendance</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Arrival</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Prayer</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Morning</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Evening</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Night</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Bed</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Hours</th>
                                <th class="px-5 py-3 font-semibold whitespace-nowrap">Remark</th>
                            </tr>
                        </thead>

                        <!-- Body -->
                        <tbody class="divide-y divide-gray-100">
                            @forelse($routine as $val)
                                @php
                                    $roll_number = $val->student->roll_number;
                                    $classRoom = $val->student->room->name;
                                    $section = $val->student->room->section;
                                    $date = $val->date ? \Carbon\Carbon::parse($val->date)->format('M d, Y') : 'N/A';
                                    $studentName = trim(($val->student->first_name ?? '').' '.($val->student->last_name ?? ''));
                                    $present = (bool) $val->attendance_in_college;
                                    $remarkFull = $val->remark ?? '-';
                                    $remarkShort = \Illuminate\Support\Str::limit($remarkFull, 22);
                                @endphp

                                <tr class="hover:bg-gray-50/70 transition">
                                    <td class="px-5 py-4 whitespace-nowrap text-gray-700 font-medium">{{ $date }}</td>

                                    <td class="px-5 py-4 whitespace-nowrap">
                                        <div class="flex items-center gap-3">
                                            <div class="w-9 h-9 rounded-full bg-gray-100 border border-gray-200 flex items-center justify-center font-bold text-gray-700">
                                               {{ strtoupper(substr($studentName ?: 'S', 0, 1)) }}
                                            </div>
                                            <div class="min-w-0">
                                                <div class="font-semibold text-gray-900 truncate max-w-[180px]">
                                                    {{ $roll_number ?? 'N/A' }} - {{ $studentName ?: 'N/A' }}
                                                </div>
                                                <div class="text-xs text-gray-500">{{ $classRoom }} - {{ $section }}</div>
                                            </div>
                                        </div>
                                    </td>

                                    <td class="px-5 py-4 whitespace-nowrap text-gray-700">{{ $val->time_to_awake ?? '-' }}</td>

                                    <td class="px-5 py-4 whitespace-nowrap">
                                        <span class="inline-flex items-center gap-2 px-2.5 py-1 rounded-full text-xs font-semibold ring-1
                                            {{ $present ? 'bg-green-50 text-green-700 ring-green-200' : 'bg-red-50 text-red-700 ring-red-200' }}">
                                            <i class="fa-solid {{ $present ? 'fa-circle-check' : 'fa-circle-xmark' }}"></i>
                                            {{ $present ? 'Present' : 'Absent' }}
                                        </span>
                                    </td>

                                    <td class="px-5 py-4 whitespace-nowrap text-gray-700">{{ $val->arrival_in_residence ?? '-' }}</td>
                                    <td class="px-5 py-4 whitespace-nowrap text-gray-700">{{ $val->prayer ?? '-' }}</td>
                                    <td class="px-5 py-4 text-gray-700">{{ $val->morning_activity ?? '-' }}</td>
                                    <td class="px-5 py-4 text-gray-700">{{ $val->evening_activity ?? '-' }}</td>
                                    <td class="px-5 py-4 text-gray-700">{{ $val->night_activity ?? '-' }}</td>

                                    <td class="px-5 py-4 whitespace-nowrap text-gray-700">{{ $val->time_to_bed ?? '-' }}</td>

                                    <td class="px-5 py-4 whitespace-nowrap">
                                        <span class="inline-flex items-center gap-2 px-2.5 py-1 rounded-full bg-gray-50 text-gray-700 text-xs font-semibold ring-1 ring-gray-200">
                                            <i class="fa-solid fa-hourglass-half text-gray-400"></i>
                                            {{ $val->total_hours ?? 0 }} hrs
                                        </span>
                                    </td>

                                    <td class="px-5 py-4">
                                        <span class="text-gray-700" title="{{ $remarkFull }}">
                                            {{ $remarkShort }}
                                        </span>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="12" class="px-6 py-14 text-center">
                                        <div class="text-gray-500">
                                            <i class="fa-regular fa-folder-open text-3xl mb-3"></i>
                                            <div class="font-semibold text-gray-700">No daily reports found</div>
                                            <div class="text-sm text-gray-500 mt-1">Try selecting another date range or student.</div>
                                        </div>
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

        </div>


    </div>

    <!-- [ Main Content ] end -->
    @include('studentPortal.layouts.footer')

 
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

        // Dynamic Student Dropdown based on Class selection
        document.getElementById('class_id').addEventListener('change', function () {
            let classId = this.value;
            let studentDropdown = document.getElementById('student_id');

            studentDropdown.innerHTML = '<option value="">-- Select Student --</option>';

            if (classId) {
                fetch(`/get-students/${classId}`)
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(student => {
                            let option = document.createElement('option');
                            option.value = student.id;
                            option.textContent = student.first_name + ' ' + student.last_name;
                            studentDropdown.appendChild(option);
                        });
                    });
            }
        });

        const today = new Date().toISOString().split("T")[0];
        const dateInput = document.getElementById('from_date');
        const dateInput2 = document.getElementById('to_date');

        dateInput.value = today;
        dateInput.max = today;

        dateInput2.value = today;
        dateInput2.max = today;
    </script>
    <!-- Layout Settings -->

    
    <script>layout_change('light');</script>
    <script>layout_theme_sidebar_change('false');</script>
    <script>change_box_container('false');</script>
    <script>layout_caption_change('true');</script>
    <script>layout_rtl_change('false');</script>
    <script>preset_change('preset-1');</script>
    <script>main_layout_change('vertical');</script>
    

  </body>
  <!-- [Body] end -->
</html>