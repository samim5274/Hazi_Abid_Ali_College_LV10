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


    <!-- [ Main Content ] start -->
    <div class="pc-container min-h-screen">
        <div class="pc-content py-8 px-4 sm:px-6 lg:px-8">
            <div class="space-y-6">
                <!-- Class Info -->
                <!-- <div class="bg-white p-4 rounded-lg shadow">
                    <h2 class="text-lg font-semibold text-gray-700 mb-3">Class Information</h2>
                    <p><span class="font-semibold">Class:</span> {{ $student->room->name }}</p>
                    <p><span class="font-semibold">Section:</span> {{ $student->room->section }}</p>
                    <p><span class="font-semibold">Class Teacher:</span> {{ $student->room->teachers->first_name ?? 'N/A' }} {{ $student->room->teachers->last_name ?? 'N/A' }}</p>
                </div> -->

                <div class="bg-white rounded-xl shadow-md p-6 max-w-md mx-auto hover:shadow-lg transition-shadow duration-300">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-6 border-b border-gray-200 pb-2">Class Information</h2>

                    <div class="space-y-4">
                        <!-- Class -->
                        <div class="flex items-center justify-between bg-gray-50 p-3 rounded-lg">
                            <div class="flex items-center gap-2">
                                <i class="fa-solid fa-chalkboard text-blue-500"></i>
                                <span class="text-gray-600 font-medium">Class</span>
                            </div>
                            <span class="text-gray-900 font-semibold">{{ $student->room->name ?? 'N/A' }}</span>
                        </div>

                        <!-- Section -->
                        <div class="flex items-center justify-between bg-gray-50 p-3 rounded-lg">
                            <div class="flex items-center gap-2">
                                <i class="fa-solid fa-layer-group text-green-500"></i>
                                <span class="text-gray-600 font-medium">Section</span>
                            </div>
                            <span class="text-gray-900 font-semibold">{{ $student->room->section ?? 'N/A' }}</span>
                        </div>

                        <!-- Class Teacher -->
                        <div class="flex items-center justify-between bg-gray-50 p-3 rounded-lg">
                            <div class="flex items-center gap-2">
                                <i class="fa-solid fa-user-tie text-purple-500"></i>
                                <span class="text-gray-600 font-medium">Class Teacher</span>
                            </div>
                            <span class="text-gray-900 font-semibold">
                                {{ $student->room->teachers->first_name ?? 'N/A' }} {{ $student->room->teachers->last_name ?? '' }}
                            </span>
                        </div>
                    </div>
                </div>


                <!-- Class Schedule -->
                <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                    @foreach($routine->groupBy('day') as $day => $classes)
                    <div class="bg-white rounded-lg shadow-lg border border-gray-200 overflow-hidden hover:shadow-xl transition-all duration-300">
                        <!-- Day Header -->
                        <div class="bg-blue-600 text-white px-4 py-2">
                            <h3 class="text-lg font-bold tracking-wide text-white">{{ $day }}</h3>
                        </div>
                        <!-- Classes List -->
                        <div class="p-4 space-y-4">
                            @foreach($classes as $row)
                            @php
                                $start = \Carbon\Carbon::parse($row->start_time);
                                $end = \Carbon\Carbon::parse($row->end_time);
                                $diff = $start->diff($end);
                                $duration = ($diff->h > 0 ? $diff->h.'h ' : '').$diff->i.'m';
                            @endphp
                            <div class="bg-gray-50 p-3 rounded-lg shadow-sm hover:shadow-md border-l-4 border-blue-500 transition-colors">
                                <div class="flex justify-between mb-1">
                                    <span class="font-semibold ">Period - {{ $row->period }}</span>
                                    <span class="text-gray-500 text-xs">{{ $row->start_time }} - {{ $row->end_time }} ({{ $duration }})</span>
                                </div>
                                <p class="text-blue-700 font-medium">{{ $row->subject->name ?? 'N/A' }}</p>
                                <p class="text-gray-600 text-sm">Teacher: {{ $row->teacher->first_name ?? '' }} {{ $row->teacher->last_name ?? '' }}</p>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    @endforeach
                </div>

                
                <!-- <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                    @foreach($routine->groupBy('day') as $day => $classes)
                    <div class="bg-white shadow rounded-lg p-4">
                        <h3 class="text-gray-700 font-bold mb-3">{{ $day }}</h3>
                        @foreach($classes as $row)
                        @php
                            $start = \Carbon\Carbon::parse($row->start_time);
                            $end = \Carbon\Carbon::parse($row->end_time);
                            $diff = $start->diff($end);
                            $duration = ($diff->h > 0 ? $diff->h.'h ' : '').$diff->i.'m';
                        @endphp
                        <div class="bg-gray-50 rounded p-2 mb-2 shadow-sm">
                            <p><span class="font-medium">Period:</span> {{ $row->period }}</p>
                            <p><span class="font-medium">Time:</span> {{ $row->start_time }} - {{ $row->end_time }} ({{ $duration }})</p>
                            <p><span class="font-medium">Subject:</span> {{ $row->subject->name ?? 'N/A' }}</p>
                            <p><span class="font-medium">Teacher:</span> {{ $row->teacher->first_name ?? '' }} {{ $row->teacher->last_name ?? '' }}</p>
                        </div>
                        @endforeach
                    </div>
                    @endforeach
                </div> -->

                <!-- <div class="bg-white p-4 rounded-lg shadow">
                    <h2 class="text-lg font-semibold text-gray-700 mb-3">Class Routine</h2>
                    <table class="w-full border text-sm">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="border px-2 py-1">Day</th>
                                <th class="border px-2 py-1">Period</th>
                                <th class="border px-2 py-1">Time</th>
                                <th class="border px-2 py-1">Subject</th>
                                <th class="border px-2 py-1">Teacher</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            @foreach($routine as $row)
                            <tr>
                                <td class="border px-2 py-1">{{ $row->day }}</td>
                                <td class="border px-2 py-1">Period - {{ $row->period }}</td>
                                @php
                                    $start = \Carbon\Carbon::parse($row->start_time);
                                    $end = \Carbon\Carbon::parse($row->end_time);
                                    $diff = $start->diff($end);
                                @endphp
                                <td class="border px-2 py-1">{{ $row->start_time }} - {{ $row->end_time }} = {{ $diff->h }} hours {{ $diff->i }} minutes </td>
                                <td class="border px-2 py-1">{{ $row->subject->name }}</td>
                                <td class="border px-2 py-1">{{ $row->teacher->first_name }} {{ $row->teacher->last_name }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div> -->

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
      layout_change('light');
    </script>
     
    
    <script>
      layout_theme_sidebar_change('false');
    </script>
    
     
    <script>
      change_box_container('false');
    </script>
     
    <script>
      layout_caption_change('true');
    </script>
     
    <script>
      layout_rtl_change('false');
    </script>
     
    <script>
      preset_change('preset-1');
    </script>
     
    <script>
      main_layout_change('vertical');
    </script>
    

  </body>
  <!-- [Body] end -->
</html>