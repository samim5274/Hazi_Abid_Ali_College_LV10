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
            <!-- Exams Grid -->
             <div class="card rounded-lg border shadow-sm ">                
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white border rounded-xl shadow-md">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="text-left px-6 py-3 text-md font-semibold text-gray-900">#</th>
                                <th class="text-left px-6 py-3 text-md font-semibold text-gray-900">Subject</th>
                                <th class="text-left px-6 py-3 text-md font-semibold text-gray-900">Exam</th>
                                <th class="px-6 py-3 text-md text-center font-semibold text-gray-900">Marks</th>
                                <th class="px-6 py-3 text-md text-center font-semibold text-gray-900">Grade</th>
                                <th class="px-6 py-3 text-md text-center font-semibold text-gray-900">GPA</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                            @foreach($marks->groupBy('exam.name') as $examName => $examMarks)
                                <!-- Exam Header Row -->
                                <tr class="bg-gray-100">
                                    <td colspan="7" class="px-6 py-3 text-left font-bold text-gray-700 text-lg">
                                        {{ $examName ?? 'No Exam' }}
                                    </td>
                                </tr>

                                <!-- Marks Rows -->
                                @foreach($examMarks as $val)
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="px-6 py-4 text-md text-gray-900">{{ $loop->iteration }}</td>
                                    <td class="px-6 py-4 text-md text-gray-900 font-semibold hover:text-blue-600 transition">
                                        {{ $val->subject->name }}
                                    </td>
                                    <td class="px-6 py-4 text-md font-medium flex items-center gap-1
                                        {{ $val->exam->name == 'Midterm' ? 'text-blue-500' : ($val->exam->name == 'Final' ? 'text-green-500' : 'text-gray-500') }}">
                                        <i class="fa fa-comments"></i> {{ $val->exam->name ?? 'No Exam' }}
                                    </td>
                                    <td class="px-6 py-4 text-md text-center text-gray-600 truncate max-w-[220px]">
                                        {{ $val->marks_obtained }}
                                    </td>
                                    <td class="px-6 py-4 text-md text-center text-gray-600 truncate max-w-[220px]">
                                        {{ $val->grade }}
                                    </td>
                                    <td class="px-6 py-4 text-md text-center text-gray-600 truncate max-w-[220px]">
                                        {{ $val->gpa }}
                                    </td>
                                </tr>
                                @endforeach
                            @endforeach
                        </tbody>
                    </table>
                </div>


            </div>
            <!-- Exams Grid End -->
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
