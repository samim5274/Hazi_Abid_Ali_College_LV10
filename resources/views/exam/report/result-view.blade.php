<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results - (SMS)</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Report & Result Analytices</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/result-and-report-analytics')}}">Class list</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/result-report/class/'.$class)}}">Student list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Student list</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm ">
                <div class="bg-gray-100 border-b px-4 py-4 sm:py-6 rounded-t-lg">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                        <!-- Student Info -->
                        <h2 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-blue-500 text-xl">📌</span>
                            Student: <span class="text-gray-700">{{ $marks[0]->student->first_name ?? 'N/A' }} {{ $marks[0]->student->first_name ?? 'N/A' }}</span> 
                            (<span class="text-gray-700">{{ $marks[0]->exam->name ?? 'N/A' }}</span>)
                        </h2>
                    </div>
                </div>
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
                            @foreach($marks as $val)
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-6 py-4 text-md text-gray-900">{{ $loop->iteration }}</td>
                                <td class="px-6 py-4 text-md text-gray-900 font-semibold hover:text-blue-600 transition">
                                    {{ $val->subject->name }}
                                </td>
                                @if($val->exam->name == 'Midterm')
                                <td class="px-6 py-4 text-md text-blue-500 font-medium flex items-center gap-1">
                                    <i class="fa fa-comments"></i> {{ $val->exam->name }}
                                </td>
                                @elseif($val->exam->name == 'Final')
                                <td class="px-6 py-4 text-md text-green-500 font-medium flex items-center gap-1">
                                    <i class="fa fa-comments"></i> {{ $val->exam->name }}
                                </td>
                                @else 
                                <td class="px-6 py-4 text-md text-green-500 font-medium flex items-center gap-1">
                                    <i class="fa fa-comments"></i> No Exam
                                </td>
                                @endif
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
                        </tbody>
                    </table>
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
