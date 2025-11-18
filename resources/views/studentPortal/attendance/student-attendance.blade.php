<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ Auth::guard('student')->user()->first_name }} {{ Auth::guard('student')->user()->last_name }} - (SMS)</title>

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
    
    <!-- [ Sidebar Menu ] start -->
    @include('studentPortal.layouts.navbar')
    <!-- [ Sidebar Menu ] end -->
     
    <!-- [ Header Topbar ] start -->
    @include('studentPortal.layouts.header')
    <!-- [ Header ] end -->

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- search section -->
            <div class="card rounded-md border shadow-md">
                <div class="card-body">
                    @php
                        $today = date('Y-m-d');
                    @endphp
                    <form action="{{url('/get-student-attendace')}}" method="GET" class="p-4">
                        @csrf
                        <div class="grid md:grid-cols-2 gap-6">

                            {{-- Start Date --}}
                            <div class="flex flex-col">
                                <label for="start_date" class="text-sm font-medium text-gray-700 mb-1">Start Date</label>
                                <input type="date" 
                                    name="start_date" 
                                    id="start_date"
                                    value="{{ $today }}"
                                    max="{{ $today }}"
                                    class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none">
                            </div>

                            {{-- End Date --}}
                            <div class="flex flex-col">
                                <label for="end_date" class="text-sm font-medium text-gray-700 mb-1">End Date</label>
                                <input type="date" 
                                    name="end_date" 
                                    id="end_date"
                                    value="{{ $today }}"
                                    max="{{ $today }}" 
                                    required
                                    class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none">
                            </div>
                        </div>   
                        
                        {{-- Submit Button --}}
                        <div class="flex items-end mt-6">
                            <button type="submit" 
                                class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg text-md font-medium shadow hover:bg-[#3F4D67] transition w-full">
                                Search
                            </button>
                        </div>

                    </form>

                </div>
             </div>

            <!-- Card -->
            <div class="overflow-x-auto bg-white rounded-lg shadow-lg border border-gray-200">
                <table class="min-w-full text-gray-700">
                    <thead class="bg-gray-100 text-gray-700 uppercase text-xs font-medium tracking-wider">
                        <tr>
                            <th class="px-5 py-3 border text-center w-12">#</th>
                            <th class="px-5 py-3 border text-left">Student Name</th>
                            <th class="px-5 py-3 border text-center w-36">Class & Section</th>
                            <th class="px-5 py-3 border text-center w-36">Date</th>
                            <th class="px-5 py-3 border text-center w-28">Status</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        @foreach($attendance as $val)
                        <tr class="hover:bg-gray-50 transition duration-200 ease-in-out">
                            <td class="px-5 py-3 text-center font-semibold text-gray-600">{{ $loop->iteration }}</td>
                            <td class="px-5 py-3">{{ $val->student->first_name }} {{ $val->student->last_name }}</td>
                            <td class="px-5 py-3 text-center">{{ $val->class->name }} - {{ $val->class->section }}</td>
                            <td class="px-5 py-3 text-center">{{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}</td>
                            <td class="px-5 py-3 text-center">
                                @if($val->status == 'Present')
                                    <span class="inline-block px-3 py-1 text-xs font-semibold text-green-800 bg-green-100 rounded-full shadow-sm">Present</span>
                                @else
                                    <span class="inline-block px-3 py-1 text-xs font-semibold text-red-800 bg-red-100 rounded-full shadow-sm">Absent</span>
                                @endif
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <!-- paginatior -->
            @if ($attendance->hasPages())
                <div class="flex flex-wrap items-center justify-between mt-4 w-full">

                    {{-- Page Info --}}
                    <div class="text-sm md:text-base text-gray-600">
                        Page {{ $attendance->currentPage() }} of {{ $attendance->lastPage() }} 
                        (Total Records: {{ $attendance->total() }})
                    </div>

                    {{-- Pagination --}}
                    <div class="flex items-center space-x-2">

                        {{-- Previous Button --}}
                        @if ($attendance->onFirstPage())
                            <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                &laquo; 
                            </span>
                        @else
                            <a href="{{ $attendance->appends(request()->query())->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                &laquo; 
                            </a>
                        @endif

                        {{-- Page Numbers --}}
                        @php
                            $start = max(1, $attendance->currentPage() - 2);
                            $end = min($attendance->lastPage(), $attendance->currentPage() + 2);
                        @endphp

                        @for ($i = $start; $i <= $end; $i++)
                            @if ($i == $attendance->currentPage())
                                <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                            @else
                                <a href="{{ $attendance->appends(request()->query())->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                            @endif
                        @endfor

                        {{-- Next Button --}}
                        @if ($attendance->hasMorePages())
                            <a href="{{ $attendance->appends(request()->query())->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
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

    <script> layout_change('false'); </script>
    <script> layout_theme_sidebar_change('dark'); </script>
    <script> change_box_container('false'); </script>
    <script> layout_caption_change('true'); </script>
    <script> layout_rtl_change('false'); </script>
    <script> preset_change('preset-1'); </script>
    <script> main_layout_change('vertical'); </script>

</body>
</html>
