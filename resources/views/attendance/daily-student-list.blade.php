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
                <div class="card-body">  

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
                                    <th class="px-4 py-3 border text-center" style="width: 50px">#</th>
                                    <th class="px-4 py-3 border">Student Name</th>
                                    <th class="px-4 py-3 border text-center" style="width: 150px">Date</th>
                                    <th class="px-4 py-3 border text-center" style="width: 150px">Class</th>
                                    <th class="px-4 py-3 border text-center" style="width: 100px">Status</th>
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
                                    <!-- Student Name -->
                                    <td class="px-4 py-3 border text-center"> {{ $val->class->name }} - ({{ $val->class->section }})</td>
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
                    <!-- paginatior -->
                    @if ($attend->hasPages())
                        <div class="flex flex-wrap items-center justify-between mt-4 w-full">

                            {{-- Page Info --}}
                            <div class="text-sm md:text-base text-gray-600">
                                Page {{ $attend->currentPage() }} of {{ $attend->lastPage() }} 
                                (Total Records: {{ $attend->total() }})
                            </div>

                            {{-- Pagination --}}
                            <div class="flex items-center space-x-2">

                                {{-- Previous Button --}}
                                @if ($attend->onFirstPage())
                                    <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                        &laquo; 
                                    </span>
                                @else
                                    <a href="{{ $attend->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                        &laquo; 
                                    </a>
                                @endif

                                {{-- Page Numbers --}}
                                @php
                                    $start = max(1, $attend->currentPage() - 2);
                                    $end = min($attend->lastPage(), $attend->currentPage() + 2);
                                @endphp

                                @for ($i = $start; $i <= $end; $i++)
                                    @if ($i == $attend->currentPage())
                                        <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                                    @else
                                        <a href="{{ $attend->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                                    @endif
                                @endfor

                                {{-- Next Button --}}
                                @if ($attend->hasMorePages())
                                    <a href="{{ $attend->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                        &raquo;
                                    </a>
                                @else
                                    <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                        &raquo;
                                    </span>
                                @endif

                            </div>
                        </div>
                    @endif

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
