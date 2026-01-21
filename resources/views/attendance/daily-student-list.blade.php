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
                        <li class="breadcrumb-item"><a href="{{url('/class-list')}}">Attendance</a></li>
                        <li class="breadcrumb-item" aria-current="page">Class List</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm">             
                <div class="card-body">  

                    <div class="flex flex-wrap items-center justify-between mb-4 gap-3">
                        <!-- Title -->
                        <h2 class="text-xl font-bold text-gray-700 flex items-center gap-2">
                            📌 Student Attendance - @php $date = now()->format('d-M-Y'); @endphp {{$date}}
                        </h2>
                        <!-- Badges -->
                        <div class="flex flex-wrap gap-3">
                            
                            <span class="text-black bg-green-200 px-4 py-2 rounded-full font-medium shadow hover:bg-green-300 transition-colors duration-300">
                                Total: {{ $totalStudent }}
                            </span>

                            <span class="text-black bg-blue-200 px-4 py-2 rounded-full font-medium shadow hover:bg-blue-300 transition-colors duration-300">
                                Present: {{ $present }}
                            </span>

                            <span class="text-black bg-yellow-200 px-4 py-2 rounded-full font-medium shadow hover:bg-yellow-300 transition-colors duration-300">
                                Absent: {{ $absent }}
                            </span>
                        </div>
                    </div>
                    <!-- Scrollable Table Wrapper -->
                    <div class="overflow-y-auto border border-gray-200 rounded-lg" style="max-height: 700px;">
                        <table class="min-w-full divide-y divide-gray-200 text-sm text-gray-700">
                            <thead class="bg-gray-50 sticky top-0">
                                <tr>
                                    <th class="px-4 py-3 text-center">#</th>
                                    <th class="px-4 py-3 text-left">Student Name</th>
                                    <th class="px-4 py-3 text-center">Subject</th>
                                    <th class="px-4 py-3 text-center">Class</th>
                                    <th class="px-4 py-3 text-center">Date</th>
                                    <th class="px-4 py-3 text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200">
                                @foreach($studentWise as $studentId => $subjects)
                                    @php
                                        $student = $subjects->first()->student;
                                    @endphp

                                    <tr class="bg-gray-100">
                                        <td colspan="7" class="px-6 py-3 text-left font-bold text-gray-700 text-lg">
                                            {{ $student->first_name }} {{ $student->last_name }}
                                        </td>
                                    </tr>

                                    @foreach($subjects as $val)
                                        <tr class="hover:bg-gray-50 transition">
                                            <td class="px-4 py-3 border text-center font-medium text-gray-600">
                                                {{ $loop->iteration }}
                                            </td>
                                            <td class="px-4 py-3 border">
                                                {{ $val->student->first_name }} {{ $val->student->last_name }} - {{ $val->student->roll_number }}
                                            </td>
                                            <td class="px-4 py-3 border text-center">
                                                {{ $val->subject->name ?? '' }}
                                            </td>
                                            <td class="px-4 py-3 border text-center">
                                                {{ $val->class->name ?? '' }} - {{ $val->class->section ?? '' }}
                                            </td>
                                            <td class="px-4 py-3 border text-center">
                                                {{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}
                                            </td>
                                            <td class="px-4 py-3 border text-center">
                                                @if($val->status === 'Present')
                                                    <span class="px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">
                                                        Present
                                                    </span>
                                                @else
                                                    <span class="px-3 py-1 rounded-full text-xs font-semibold bg-red-100 text-red-700">
                                                        Absent
                                                    </span>
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                @endforeach
                            </tbody>

                        </table>
                    </div>

                </div>
            </div>

            <div class="card rounded-lg border shadow-sm">             
                <div class="card-body">  

                    <div class="flex flex-wrap items-center justify-between mb-4 gap-3">
                        <!-- Title -->
                        <h2 class="text-xl font-bold text-gray-700 flex items-center gap-2">
                            📌 Subject Attendance - @php $date = now()->format('d-M-Y'); @endphp {{$date}}
                        </h2>
                        <!-- Badges -->
                        <div class="flex flex-wrap gap-3">
                            
                            <span class="text-black bg-green-200 px-4 py-2 rounded-full font-medium shadow hover:bg-green-300 transition-colors duration-300">
                                Total: {{ $totalStudent }}
                            </span>

                            <span class="text-black bg-blue-200 px-4 py-2 rounded-full font-medium shadow hover:bg-blue-300 transition-colors duration-300">
                                Present: {{ $present }}
                            </span>

                            <span class="text-black bg-yellow-200 px-4 py-2 rounded-full font-medium shadow hover:bg-yellow-300 transition-colors duration-300">
                                Absent: {{ $absent }}
                            </span>
                        </div>
                    </div>
                    <!-- Scrollable Table Wrapper -->
                    <div class="overflow-y-auto border border-gray-200 rounded-lg" style="max-height: 700px;">
                        <table class="min-w-full divide-y divide-gray-200 text-sm text-gray-700">
                            <thead class="bg-gray-50 sticky top-0">
                                <tr>
                                    <th class="px-4 py-3 text-center">#</th>
                                    <th class="px-4 py-3 text-left">Student Name</th>
                                    <th class="px-4 py-3 text-center">Subject</th>
                                    <th class="px-4 py-3 text-center">Class</th>
                                    <th class="px-4 py-3 text-center">Date</th>
                                    <th class="px-4 py-3 text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200">
                                @foreach($subjectWise as $subjectId => $attendList)
                                    @php
                                        $subj = $attendList->first()->subject;
                                    @endphp

                                    <tr class="bg-gray-100">
                                        <td colspan="7" class="px-6 py-3 text-left font-bold text-gray-700 text-lg">
                                            Subject: {{ $subj->name }} - {{ $attendList->first()->class->name ?? '-' }}
                                        </td>
                                    </tr>

                                    @foreach($attendList as $val)
                                    <tr class="hover:bg-gray-50 transition">
                                        <td class="px-4 py-3 border text-center font-medium text-gray-600">{{ $loop->iteration }}</td>
                                        <td class="px-4 py-3 border">{{ $val->student->first_name }} {{ $val->student->last_name }} - {{ $val->student->roll_number }}</td>
                                        <td class="px-4 py-3 border text-center">{{ $val->subject->name }}</td>
                                        <td class="px-4 py-3 border text-center">{{ $val->class->name }} - {{ $val->class->section }}</td>
                                        <td class="px-4 py-3 border text-center">{{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}</td>
                                        <td class="px-4 py-3 border text-center">
                                            @if($val->status == 'Present')
                                                <span onclick="openModal({{ $val->id }})" class="px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">Present</span>
                                            @else
                                                <span onclick="openModal({{ $val->id }})" class="px-3 py-1 rounded-full text-xs font-semibold bg-red-100 text-red-700">Absent</span>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <!-- Card End -->


            @foreach($subjectWise as $subjectId => $attendList)
                @foreach($attendList as $val)
                <div id="examModal{{ $val->id }}" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
                    <div class="bg-white rounded-lg shadow-lg w-full max-w-2xl p-6 relative">

                        <div class="flex items-center justify-between border-b pb-3 mb-4">
                            <h5 class="text-lg font-semibold text-gray-700"><strong>Edit Attendance of </strong> - {{ $val->student->first_name }} {{ $val->student->last_name }}</h5>
                            <button onclick="closeModal({{ $val->id }})" class="text-gray-500 hover:text-red-600 text-2xl">&times;</button>
                        </div>

                        <form action="{{url('/edit-attendance/'.$val->id)}}" method="POST" class="space-y-6" enctype="multipart/form-data">
                            @csrf
                            <div class="bg-gray-50 border border-gray-200 rounded-lg p-5 mb-4 shadow-sm">

                                <!-- Class + Date -->
                                <div class="flex items-center justify-between mb-3">
                                    <h5 class="text-base font-semibold text-gray-800 flex items-center gap-2">
                                        <span class="text-green-600">&#x1F393;</span>
                                        {{ $val->class->name }} ({{ $val->class->section }})
                                    </h5>

                                    <h5 class="text-base font-semibold text-gray-700 flex items-center gap-2">
                                        <span class="text-blue-600">&#128197;</span>
                                        <strong>Date:</strong> {{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}
                                    </h5>
                                </div>

                                <!-- Course -->
                                <div>
                                    <h5 class="text-base font-semibold text-gray-800 flex items-center gap-2">
                                        <span class="text-purple-600">&#128218;</span>
                                        Subject: {{ $val->subject->name }}
                                    </h5>
                                </div>

                            </div>

                            <div>
                                <label class="font-medium mb-2 block">Attendance Status</label>
                                <div class="flex gap-6 mt-2">
                                    <!-- Present -->
                                    <label class="flex items-center gap-2 cursor-pointer">
                                        <input type="radio" name="attendanceStatus" value="Present"
                                            class="h-5 w-5 border-gray-400"
                                            {{ $val->status == 'Present' ? 'checked' : '' }} required>
                                        <span class="text-gray-700 font-medium">Present</span>
                                    </label>
                                    <!-- Absent -->
                                    <label class="flex items-center gap-2 cursor-pointer">
                                        <input type="radio" name="attendanceStatus" value="Absent"
                                            class="h-5 w-5 border-gray-400"
                                            {{ $val->status == 'Absent' ? 'checked' : '' }}>
                                        <span class="text-gray-700 font-medium">Absent</span>
                                    </label>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="bg-green-500 hover:bg-green-600 text-white w-full rounded-md py-2 px-6">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
                @endforeach
            @endforeach


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

        function openModal(id) {
            document.getElementById('examModal'+ id).classList.remove('hidden');
            document.getElementById('examModal'+ id).classList.add('flex');
        }

        function closeModal(id) {
            document.getElementById('examModal'+ id).classList.remove('flex');
            document.getElementById('examModal'+ id).classList.add('hidden');
        }
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
