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

    <!-- Flash Message -->
    @include('layouts.message')
    <!-- [ Header ] end -->


    <!-- [ Main Content ] start -->
    <div class="pc-container min-h-screen">
        <div class="pc-content py-8 px-4 sm:px-6 lg:px-8 space-y-8">
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
        <div class="pc-content py-8 px-4 sm:px-6 lg:px-8 space-y-8">
            <!-- Table View -->
            <h2 class="text-2xl font-bold text-gray-700 mb-6">Student Daily Routine</h2>
            <div class="bg-white rounded-xl shadow-md border overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Date</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Student</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Time to Awake</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Attendance</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Arrival</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Prayer</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Morning</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Evening</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Night</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Time to Bed</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Total Hours</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Remark</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200 text-sm">
                        @forelse($routine as $val)
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-6 py-3">{{ \Carbon\Carbon::parse($val->date)->format('F j, Y') }}</td>
                                <td class="px-6 py-3">{{ $val->student->first_name }} {{ $val->student->last_name }}</td>
                                <td class="px-6 py-3">{{ $val->time_to_awake }}</td>
                                <td class="px-6 py-3">{{ $val->attendance_in_college ? 'Present' : 'Absent' }}</td>
                                <td class="px-6 py-3">{{ $val->arrival_in_residence }}</td>
                                <td class="px-6 py-3">{{ $val->prayer ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->morning_activity ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->evening_activity ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->night_activity ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->time_to_bed }}</td>
                                <td class="px-6 py-3">{{ $val->total_hours }} hrs</td>
                                <td class="px-6 py-3">{{ \Illuminate\Support\Str::limit($val->remark ?? '-', 15) }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="11" class="px-6 py-4 text-center text-gray-500">No daily reports found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
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