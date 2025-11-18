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
                        <li class="breadcrumb-item"><a href="{{url('/class-list')}}">Attendance</a></li>
                        <li class="breadcrumb-item" aria-current="page">Class List</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm">
                <div class="card-header px-4 py-3 border-b bg-gray-100">
                    <h3 class="text-lg font-semibold text-gray-700">Class Rooms - {{ $attend[0]->class->name ?? 'N/A' }} ( {{ $attend[0]->class->section ?? 'N/A' }} )</h3>
                </div>
                <div class="card-body p-6 bg-gray-50 rounded-b-lg">
                    <div class="overflow-x-auto">
                        <table class="min-w-full table-auto border-collapse">
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach($student as $val)
                                <tr class="hover:bg-gray-50">
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <span class="text-gray-400 text-sm">{{ $val->roll_number }}</span>
                                    </td>
                                    <!-- Photo -->
                                    <!-- <td class="px-4 py-3 whitespace-nowrap">
                                        @if($val->photo)
                                            <a href="{{ url('/edit-student-view/'.$val->id) }}">
                                                <img class="w-12 h-12 rounded-full border border-gray-300 object-cover" src="{{ asset('img/student/' . $val->photo) }}" alt="student-photo" />
                                            </a>
                                        @else
                                            <span class="text-gray-400 text-sm">No Image</span>
                                        @endif
                                    </td> -->

                                    <!-- Name & Address -->
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <div class="flex flex-col gap-1">
                                            <a href="{{ url('/edit-student-view/'.$val->id) }}" class="text-gray-900 font-semibold hover:text-blue-600 transition">
                                                {{ $val->first_name }} {{ $val->last_name }} - <i class="fa fa-droplet text-red-500"></i> {{ $val->blood_group }}
                                            </a>
                                            <span class="text-gray-500 text-sm">{{ $val->address1 }}</span>
                                        </div>
                                    </td>

                                    <!-- <td class="px-4 py-3 whitespace-nowrap">
                                        <div class="flex flex-col gap-1">
                                            <div class="mb-4">
                                                <label class="block text-gray-600 mb-1">Remarks</label>
                                                <div class="flex space-x-6">
                                                    <label class="inline-flex items-center">
                                                        <input type="radio" name="remarks{{$val->id}}" checked value="On time" class="text-green-600 focus:ring-green-500">
                                                        <span class="ml-2 text-gray-700">On time</span>
                                                    </label>

                                                    <label class="inline-flex items-center">
                                                        <input type="radio" name="remarks{{$val->id}}" value="Sick Leave" class="text-green-600 focus:ring-green-500">
                                                        <span class="ml-2 text-gray-700">Sick Leave</span>
                                                    </label>

                                                    <label class="inline-flex items-center">
                                                        <input type="radio" name="remarks{{$val->id}}" value="Late" class="text-green-600 focus:ring-green-500">
                                                        <span class="ml-2 text-gray-700">Late</span>
                                                    </label>

                                                    <label class="inline-flex items-center">
                                                        <input type="radio" name="remarks{{$val->id}}" value="Absent" class="text-green-600 focus:ring-green-500">
                                                        <span class="ml-2 text-gray-700">Absent</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </td> -->

                                    <!-- Actions -->
                                    <td class="px-4 py-3 whitespace-nowrap text-right">
                                        <div class="flex gap-2 justify-end">
                                            <a href="{{url('/std-absend/'.$val->id)}}" class="bg-red-500 hover:bg-red-600 text-white text-xs px-2 py-1 rounded flex items-center justify-center">
                                                <i class="fa-solid fa-xmark"></i>
                                            </a>
                                            <a href="{{url('/std-present/'.$val->id)}}" class="bg-green-500 hover:bg-green-600 text-white text-xs px-2 py-1 rounded flex items-center justify-center">
                                                <i class="fa-solid fa-check"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-body">
                    <div class="bg-white shadow-lg rounded-lg p-6">
                        <div class="flex flex-wrap items-center justify-between mb-4 gap-3">
                            <!-- Title -->
                            <h2 class="text-xl font-bold text-gray-700 flex items-center gap-2">
                                📌 Student Attendance
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
                        <div class="overflow-x-auto">
                            <table class="min-w-full text-sm text-left text-gray-600 border border-gray-200 rounded-lg">
                                <thead class="bg-gray-100 text-gray-700 uppercase text-xs">
                                    <tr>
                                        <th class="px-4 py-3 border text-center">#</th>
                                        <th class="px-4 py-3 border">Student Name</th>
                                        <th class="px-4 py-3 border text-center">Date</th>
                                        <th class="px-4 py-3 border text-center">Status</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 text-sm text-gray-700">
                                    @foreach($attend as $val)
                                    <tr class="hover:bg-gray-50 transition">
                                        <!-- Serial Number -->
                                        <td class="px-4 py-3 border text-center font-medium text-gray-600">
                                            {{ $loop->iteration }}
                                        </td>

                                        <!-- Student Name -->
                                        <td class="px-4 py-3 border"> {{ $val->student->first_name }} {{ $val->student->last_name }}</td>

                                        <!-- Attendance Date -->
                                        <td class="px-4 py-3 border text-center"> {{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}</td>

                                        <!-- Attendance Status -->
                                        <td class="px-4 py-3 border text-center">
                                            @if($val->status == 'Present')
                                                <span class="px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">Present</span>
                                            @else
                                                <span class="px-3 py-1 rounded-full text-xs font-semibold bg-red-100 text-red-700">Absent</span>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>

                            </table>
                        </div>
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
