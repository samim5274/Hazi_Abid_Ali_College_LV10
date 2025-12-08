<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Teacher Attendance - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Teacher Attendance Report</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/teacher-attendance">Attendance</a></li>
                        <li class="breadcrumb-item"><a href="/teacher-attendance/report">Report Filter</a></li>
                        <li class="breadcrumb-item" aria-current="page">{{ $attendance->teacher->first_name }} {{ $attendance->teacher->last_name }}</li>
                    </ul>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md border border-gray-200 p-6 max-w-3xl mx-auto">
                <div class="text-sm mb-6 text-gray-500">
                    <a href="{{ url()->previous() }}" class="hover:text-[#1DE4BD]">← Back to Notices</a>
                </div>
                <h2 class="text-xl font-bold text-gray-700 mb-6">Update Teacher Attendance</h2>
                <form action="{{ route('edit-teacher-attendance-update', $attendance->id) }}" method="POST" class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                    @csrf
                    <!-- Teacher Name -->
                    <div class="flex flex-col">
                        <label for="teacher_name" class="text-gray-700 font-medium mb-1">Teacher Name</label>
                        <input type="text" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1 focus:border-theme-bg-1 bg-gray-50 cursor-not-allowed" 
                            name="teacher_name" 
                            value="{{ $attendance->teacher->first_name }} {{ $attendance->teacher->last_name }}" 
                            readonly>
                    </div>

                    <!-- Attendance Date -->
                    <div class="flex flex-col">
                        <label for="attendance_date" class="text-gray-700 font-medium mb-1">Attendance Date</label>
                        <input type="date" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1 focus:border-theme-bg-1 bg-gray-50 cursor-not-allowed" id="attendance_date"
                            name="attendance_date" 
                            value="{{ $attendance->attendance_date }}" >
                    </div>

                    <!-- Attendance Time -->
                    <div class="flex flex-col">
                        <label for="attendance_time" class="text-gray-700 font-medium mb-1">Attendance Time</label>
                        <input type="time" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1 focus:border-theme-bg-1 bg-gray-50 cursor-not-allowed" id="attendance_time"
                            name="attendance_time" 
                            value="{{ $attendance->attendance_time }}" >
                    </div>

                    <div class="flex flex-col">
                        <label for="device" class="text-gray-700 font-medium mb-1">Device</label>
                        <input type="text" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1 focus:border-theme-bg-1 bg-gray-50 cursor-not-allowed" 
                            name="device" 
                            value="{{ $attendance->device }}" 
                            readonly>
                    </div>

                    <!-- Attendance Status -->
                    <div class="flex flex-col sm:col-span-2">
                        <label class="text-gray-700 font-medium mb-2">Status</label>
                        <div class="flex gap-4">
                            <label class="flex-1 flex items-center justify-center bg-green-100 rounded-xl py-2 cursor-pointer hover:bg-green-200 transition duration-150">
                                <input type="radio" name="status" value="Present" class="mr-2" {{ $attendance->status == 'present' ? 'checked' : '' }}> Present
                            </label>
                            <label class="flex-1 flex items-center justify-center bg-red-100 rounded-xl py-2 cursor-pointer hover:bg-red-200 transition duration-150">
                                <input type="radio" name="status" value="Absent" class="mr-2" {{ $attendance->status == 'absent' ? 'checked' : '' }}> Absent
                            </label>
                        </div>
                    </div>

                    <!-- Update Button -->
                    <div class="sm:col-span-2">
                        <button type="submit" 
                            class="w-full bg-theme-bg-1 text-white px-5 py-3 rounded-lg shadow hover:bg-theme-bg-2 transition duration-150 font-semibold text-sm" onclick="return confirm('Are you sure you want to update this attendance?')">
                            Update Attendance
                        </button>
                    </div>
                </form>
            </div>
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
