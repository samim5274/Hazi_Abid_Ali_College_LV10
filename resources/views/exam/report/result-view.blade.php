<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results - {{ $company->name }}</title>

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
            @php
                // ---- Normalize marks: grouped OR not grouped ----
                $isGrouped = $marks instanceof \Illuminate\Support\Collection
                    && $marks->count()
                    && $marks->first() instanceof \Illuminate\Support\Collection;

                $groupedMarks = $isGrouped
                    ? $marks
                    : $marks->groupBy(fn($item) => optional($item->exam)->name ?? 'No Exam');

                // ---- Student ----
                $student = optional($groupedMarks->flatten()->first())->student;

                // ---- Overall Summary ----
                $flat = $groupedMarks->flatten();
                $overallTotal = (int) $flat->sum('marks_obtained');
                $overallSubjectsCount = (int) $flat->count();
                $overallAvgGpa = $overallSubjectsCount ? ($flat->sum('gpa') / $overallSubjectsCount) : 0;

                $allGrades = $flat->pluck('grade')->filter()->toArray();
                $overallAvgGrade = count($allGrades)
                    ? collect($allGrades)->countBy()->sortDesc()->keys()->first()
                    : '-';
            @endphp

            <div class="card rounded-xl border shadow-sm bg-white overflow-hidden">

                <!-- ================= Student Header ================= -->
                <div class="bg-gray-50 border-b px-4 py-4 sm:py-6">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                        <h2 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-blue-600 text-xl">📌</span>
                            Student:
                            <span class="text-gray-700">
                                {{ $student->first_name ?? 'N/A' }} {{ $student->last_name ?? '' }}
                            </span>
                        </h2>

                        <!-- <div class="text-sm text-gray-500">
                            Total Subjects: <span class="font-semibold text-gray-700">{{ $overallSubjectsCount }}</span>
                        </div> -->
                    </div>
                </div>

                <div class="p-4 sm:p-6 space-y-8">

                    <!-- ================= PART 1: BIG TABLE ================= -->
                     <div>
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-base sm:text-lg font-bold text-gray-800">📊 Summary & Exam Cards</h3>
                            <a href="{{ url('/print-student-result/'.$student->id) }}" target="_blank"
                                class="inline-flex items-center gap-2 px-3 py-1.5
                                    text-sm text-gray-600 bg-gray-100 rounded-md
                                    hover:bg-gray-200 hover:text-gray-900 transition">
                                <i class="fa-solid fa-print"></i> Print
                            </a>

                        </div>

                        <!-- Overall Summary -->
                        <div class="bg-gradient-to-r from-indigo-50 to-indigo-100 rounded-xl shadow-sm p-4 border border-indigo-200 mb-6">
                            <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">

                                <div class="flex items-center gap-3">
                                    <span class="text-indigo-700 text-2xl font-bold">📊</span>
                                    <div>
                                        <p class="text-gray-600 font-semibold text-sm">Overall Total Marks</p>
                                        <p class="text-gray-900 font-extrabold text-2xl">{{ $overallTotal }}</p>
                                    </div>
                                </div>

                                <div class="flex items-center gap-3">
                                    <span class="text-emerald-700 text-2xl font-bold">🎯</span>
                                    <div>
                                        <p class="text-gray-600 font-semibold text-sm">Overall Avg GPA / Grade</p>
                                        <p class="text-gray-900 font-extrabold text-2xl">
                                            {{ number_format($overallAvgGpa, 2) }} <span class="text-gray-400">/</span> {{ $overallAvgGrade }}
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- Exam Wise Grid -->
                        <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-5">
                            @foreach($groupedMarks as $examName => $examMarks)
                                @php
                                    $examTotal = (int) $examMarks->sum('marks_obtained');
                                    $count = (int) $examMarks->count();
                                    $examAvgGpa = $count ? ($examMarks->sum('gpa') / $count) : 0;

                                    $grades = $examMarks->pluck('grade')->filter()->toArray();
                                    $examAvgGrade = count($grades)
                                        ? collect($grades)->countBy()->sortDesc()->keys()->first()
                                        : '-';
                                @endphp

                                <div class="rounded-xl border shadow-sm overflow-hidden bg-white">
                                    <div class="bg-gradient-to-r from-indigo-100 to-indigo-200 px-4 py-3 font-bold text-indigo-800 flex justify-between items-center">
                                        <span class="truncate">{{ $examName }}</span>
                                        <span class="text-sm font-semibold whitespace-nowrap">Total: {{ $examTotal }}</span>
                                    </div>

                                    <div class="overflow-x-auto">
                                        <table class="min-w-full table-auto">
                                            <thead class="bg-gray-50">
                                                <tr>
                                                    <th class="px-3 py-2 text-left text-sm font-semibold text-gray-700 w-10">#</th>
                                                    <th class="px-3 py-2 text-left text-sm font-semibold text-gray-700">Subject</th>
                                                    <th class="px-3 py-2 text-center text-sm font-semibold text-gray-700 w-16">Marks</th>
                                                    <th class="px-3 py-2 text-center text-sm font-semibold text-gray-700 w-16">Grade</th>
                                                    <th class="px-3 py-2 text-center text-sm font-semibold text-gray-700 w-16">GPA</th>
                                                </tr>
                                            </thead>

                                            <tbody class="divide-y divide-gray-200">
                                                @foreach($examMarks as $val)
                                                    <tr class="hover:bg-gray-50 transition">
                                                        <td class="px-3 py-2 text-sm text-gray-700">{{ $loop->iteration }}</td>
                                                        <td class="px-3 py-2 text-sm text-gray-900 font-medium">
                                                            {{ optional($val->subject)->name ?? '-' }}
                                                        </td>
                                                        <td class="px-3 py-2 text-sm text-center text-gray-700">{{ $val->marks_obtained ?? '-' }}</td>
                                                        <td class="px-3 py-2 text-sm text-center text-gray-700">{{ $val->grade ?? '-' }}</td>
                                                        <td class="px-3 py-2 text-sm text-center text-gray-700">{{ number_format($val->gpa ?? 0, 2) }}</td>
                                                    </tr>
                                                @endforeach

                                                <tr class="bg-gray-100 font-semibold text-gray-800">
                                                    <td colspan="2" class="px-3 py-2 text-right">Avg GPA / Grade:</td>
                                                    <td colspan="3" class="px-3 py-2 text-center">
                                                        {{ number_format($examAvgGpa, 2) }} / {{ $examAvgGrade }}
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="px-4 py-3 bg-gray-50 border-t text-sm text-gray-700 flex justify-between">
                                        <span>Subjects: <span class="font-semibold">{{ $count }}</span></span>
                                        <span>Avg GPA: <span class="font-semibold text-indigo-700">{{ number_format($examAvgGpa, 2) }}</span></span>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    

                    <!-- Divider -->
                    <div class="border-t pt-6"></div>

                    <!-- ================= PART 2: SUMMARY + GRID ================= -->
                    <div>
                        <div class="flex items-center justify-between mb-3">
                            <h3 class="text-base sm:text-lg font-bold text-gray-800">📑 Exam-wise Details</h3>
                            <span class="text-sm text-gray-500">Full table view</span>
                        </div>

                        <div class="overflow-x-auto rounded-xl border">
                            <table class="min-w-full bg-white">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 w-12">#</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700">Subject</th>
                                        <th class="px-4 py-3 text-center text-sm font-semibold text-gray-700 w-40">Exam</th>
                                        <th class="px-4 py-3 text-center text-sm font-semibold text-gray-700 w-24">Marks</th>
                                        <th class="px-4 py-3 text-center text-sm font-semibold text-gray-700 w-24">Grade</th>
                                        <th class="px-4 py-3 text-center text-sm font-semibold text-gray-700 w-24">GPA</th>
                                    </tr>
                                </thead>

                                <tbody class="divide-y divide-gray-200">
                                    @foreach($groupedMarks as $examName => $examMarks)
                                        <!-- Exam Title Row -->
                                        <tr>
                                            <td colspan="6"
                                                class="px-4 py-3 bg-gradient-to-r from-indigo-50 to-indigo-100 text-indigo-700 font-bold">
                                                📘 {{ $examName }} Examination
                                            </td>
                                        </tr>

                                        <!-- Rows -->
                                        @foreach($examMarks as $val)
                                            <tr class="hover:bg-gray-50 transition">
                                                <td class="px-4 py-3 text-sm text-gray-700">{{ $loop->iteration }}</td>

                                                <td class="px-4 py-3">
                                                    <div class="text-sm font-semibold text-gray-900">
                                                        {{ optional($val->subject)->name ?? '-' }}
                                                    </div>
                                                </td>

                                                <td class="px-4 py-3 text-center">
                                                    <span class="px-3 py-1 rounded-full text-xs font-semibold
                                                        {{ str_contains(strtolower($examName),'mid') ? 'bg-blue-50 text-blue-700' :
                                                        (str_contains(strtolower($examName),'final') ? 'bg-green-50 text-green-700' :
                                                        'bg-purple-50 text-purple-700') }}">
                                                        {{ $examName }}
                                                    </span>
                                                </td>

                                                <td class="px-4 py-3 text-center font-semibold text-gray-800">
                                                    {{ $val->marks_obtained ?? '-' }}
                                                </td>

                                                <td class="px-4 py-3 text-center">
                                                    <span class="px-3 py-1 rounded-md bg-yellow-50 text-yellow-700 font-semibold text-xs">
                                                        {{ $val->grade ?? '-' }}
                                                    </span>
                                                </td>

                                                <td class="px-4 py-3 text-center">
                                                    <span class="px-3 py-1 rounded-md bg-indigo-50 text-indigo-700 font-semibold text-xs">
                                                        {{ number_format($val->gpa ?? 0, 2) }}
                                                    </span>
                                                </td>
                                            </tr>
                                        @endforeach

                                        <!-- Exam Footer -->
                                        <tr>
                                            <td colspan="6" class="px-4 py-3 text-right bg-gray-50 font-semibold text-gray-700">
                                                🎯 Average GPA:
                                                <span class="text-indigo-700">{{ number_format($examMarks->avg('gpa'), 2) }}</span>
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
