<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Attendance Report - (SMS)</title>

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
                        <li class="breadcrumb-item" aria-current="page">Report</li>
                    </ul>
                </div>
            </div>

            <!-- search section -->
            <div class="card rounded-md border shadow-md">
                <div class="card-body">
                    <form action="{{ route('filter-teacher-attendace') }}" method="GET" class="p-4 bg-white rounded-xl shadow-sm border" id="filter-form" target="_blank">
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-6">

                            <!-- Teacher -->
                            <div class="flex flex-col">
                                <label for="teacher_id" class="text-sm font-medium text-gray-700 mb-1">Teacher</label>
                                <select name="teacher_id" id="teacher_id" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                    <option selected value="">-- Select Teacher --</option>
                                    @foreach ($teachers as $teacher)
                                        <option value="{{ $teacher->id }}" {{ request('teacher_id') == $teacher->id ? 'selected' : '' }}>
                                            {{ $teacher->first_name }}
                                            {{ $teacher->last_name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Start Date -->
                            <div class="flex flex-col">
                                <label class="text-sm font-medium text-gray-700 mb-1">Start Date</label>
                                <input type="date" 
                                    name="start_date" 
                                    id="start_date" 
                                    class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1"
                                    value="{{ request('start_date') }}">
                            </div>

                            <!-- End Date -->
                            <div class="flex flex-col">
                                <label class="text-sm font-medium text-gray-700 mb-1">End Date</label>
                                <input type="date" 
                                    name="end_date" 
                                    id="end_date" 
                                    class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1"
                                    value="{{ request('end_date') }}">
                            </div>

                            <!-- Buttons -->
                            <div class="flex items-end gap-3">
                                <button type="submit" 
                                    class="bg-theme-bg-1 text-white px-5 py-2 rounded-lg shadow hover:bg-theme-bg-2 transition text-sm font-semibold w-full">
                                    Search
                                </button>

                                <button type="submit" name="print" value="1" class="bg-gray-700 text-white px-5 py-2 rounded-lg shadow hover:bg-black transition text-sm font-semibold w-full text-center">
                                    <i class="fa-solid fa-print"></i> Print
                                </button>
                            </div>

                        </div>
                    </form>


                </div>
            </div>
            
            <!-- Card -->
            <div class="bg-white rounded-xl shadow-md border border-gray-200">
                <div class="p-4">
                    <div class="overflow-x-auto">
                        <div class="flex flex-wrap items-center justify-between mb-4 gap-3">    
                            <h2 class="text-xl font-bold text-gray-700 flex items-center gap-2">
                                📌 Filter Teacher Attendance Report
                            </h2>
                            <div class="flex flex-wrap gap-3">
                                <span class="text-black bg-green-200 px-4 py-2 rounded-full font-medium shadow hover:bg-green-300 transition">
                                    Total: {{ $total }}
                                </span>
                                <span class="text-black bg-blue-200 px-4 py-2 rounded-full font-medium shadow hover:bg-blue-300 transition">
                                    Present: {{ $present }}
                                </span>
                                <span class="text-black bg-yellow-200 px-4 py-2 rounded-full font-medium shadow hover:bg-yellow-300 transition">
                                    Absent: {{ $absent }}
                                </span>
                            </div>
                        </div>
                        <table class="min-w-full divide-y divide-gray-200">      
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach ($data as $val)
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="px-6 py-3 text-sm text-gray-700">{{ $loop->iteration }}</td>

                                    <td class="px-6 py-3 text-sm font-medium text-gray-900">
                                        {{ $val->teacher->first_name }}
                                        {{ $val->teacher->last_name }}
                                    </td>

                                    <td class="px-6 py-3 text-sm text-gray-700">
                                        {{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}
                                    </td>

                                    <td class="px-6 py-3 text-sm text-gray-700">
                                        {{ \Carbon\Carbon::parse($val->attendance_time)->format('h:i A') }}
                                    </td>

                                    <td class="px-6 py-3">
                                        <span class="px-3 py-1 rounded-full text-xs font-semibold 
                                            {{ $val->status === 'present' ? 'bg-green-100 text-green-700' : 
                                            ($val->status === 'absent' ? 'bg-red-100 text-red-700' : 
                                            'bg-yellow-100 text-yellow-700') }}">
                                            {{ ucfirst($val->status) }}
                                        </span>
                                    </td>

                                    <td class="px-6 py-3 text-center">
                                        <a href="{{ url('/teacher/attend/edit/'. $val->id) }}" class="text-blue-600 hover:text-blue-800 text-lg">
                                            <i class="fa-solid fa-pen-to-square"></i> 
                                        </a>
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

        // Set max date to today for date inputs
        document.addEventListener("DOMContentLoaded", function () {
            let today = new Date().toISOString().split("T")[0];

            let start = document.getElementById("start_date");
            let end = document.getElementById("end_date");

            start.setAttribute("max", today);
            end.setAttribute("max", today);

            if (!start.value) start.value = today;
            if (!end.value) end.value = today;
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
