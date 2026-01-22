<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results Marks - {{ $company->name }}</title>

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
                        <li class="breadcrumb-item"><a href="{{url('/total-report-result')}}">Class list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Student list</li>
                    </ul>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-12">
                    <div class="bg-gray-100 border rounded-lg px-4 py-4 shadow-sm
                                flex items-center justify-between">

                        <h2 class="text-lg font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-blue-600 text-xl">📌</span>
                            Room:
                            <span class="text-gray-700">
                                {{ $students[0]->room->name ?? 'N/A' }}
                                ({{ $students[0]->room->section ?? 'N/A' }})
                            </span>
                        </h2>

                        <a href="{{ url('/print-class-student-result/'.$students[0]->room->id) }}"
                        target="_blank"
                        class="inline-flex items-center gap-2 px-3 py-2
                                text-sm text-gray-600 bg-white border rounded-md
                                hover:bg-gray-50 hover:text-gray-900
                                shadow-sm transition print:hidden">
                            <i class="fa-solid fa-print"></i>
                            Print
                        </a>
                    </div>

                </div>
                @foreach($studentResults as $index => $data)
                    @php
                        $student = $data['student'];
                    @endphp

                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="card border-0 shadow-sm h-100 rounded-4 overflow-hidden">

                            <!-- Header -->
                            <div class="px-3 py-3 border-bottom bg-white">
                                <div class="d-flex align-items-start justify-content-between gap-2">
                                    <div style="display:flex;justify-content:space-between;gap:12px;align-items:center;flex-wrap:wrap;">

                                        <!-- Left -->
                                        <div style="display:flex;align-items:center;gap:12px;min-width:260px;">

                                            <!-- Avatar -->
                                            <div style="
                                                width:52px;height:52px;border:1px solid #d1d5db;border-radius:9999px;
                                                display:flex;align-items:center;justify-content:center;
                                                background:#fff;font-weight:800;font-size:16px;flex-shrink:0;">
                                                {{ strtoupper(substr($student->first_name ?? 'S', 0, 1)) }}
                                            </div>

                                            <!-- Name + Subtitle -->
                                            <div>
                                                <div style="font-weight:800;font-size:16px;line-height:1.2;color:#111827;">
                                                    {{ $student->first_name }} {{ $student->last_name }}
                                                </div>

                                                <div style="margin-top:4px;font-size:12px;color:#6b7280;display:flex;gap:8px;align-items:center;flex-wrap:wrap;">
                                                    <span style="border:1px solid #d1d5db;background:#f9fafb;color:#111827;
                                                                padding:2px 10px;border-radius:9999px;font-weight:700;">
                                                        Student
                                                    </span>

                                                    @if(!empty($student->email))
                                                        <span style="color:#9ca3af;">•</span>
                                                        <span style="color:#6b7280;">{{ $student->email }}</span>
                                                    @endif
                                                </div>
                                            </div>

                                        </div>

                                        <!-- Right -->
                                        <div style="display:flex;gap:8px;flex-wrap:wrap;justify-content:flex-end;">

                                            @if(!empty($student->roll_number))
                                                <span style="border:1px solid #d1d5db;background:#fff;color:#111827;
                                                            padding:6px 10px;border-radius:9999px;font-size:12px;font-weight:800;">
                                                    Roll: <span style="font-weight:900;">{{ $student->roll_number }}</span>
                                                </span>
                                            @endif

                                            @if(!empty($student->admission_no))
                                                <span style="border:1px solid #d1d5db;background:#fff;color:#111827;
                                                            padding:6px 10px;border-radius:9999px;font-size:12px;font-weight:800;">
                                                    ID: <span style="font-weight:900;">{{ $student->admission_no }}</span>
                                                </span>
                                            @endif

                                            @if(!empty($student->room?->name))
                                                <span style="border:1px solid #d1d5db;background:#fff;color:#111827;
                                                            padding:6px 10px;border-radius:9999px;font-size:12px;font-weight:800;">
                                                    Class:
                                                    <span style="font-weight:900;">
                                                        {{ $student->room->name }}
                                                        @if(!empty($student->room->section)) - 
                                                            ({{ $student->room->section }})
                                                        @endif
                                                    </span>
                                                </span>
                                            @endif

                                        </div>

                                    </div>

                                </div>
                            </div>

                            <!-- Body -->
                            <div class="card-body p-3">

                                @foreach($data['exam_results'] as $exam)
                                    <div class="border rounded-4 mb-3 overflow-hidden">
                                        <!-- Exam title row -->
                                        <div class="d-flex align-items-center justify-content-between px-3 py-2 border-bottom bg-light">
                                            <div class="fw-bold text-dark">
                                                <span class="me-1">📝</span> {{ $exam['exam_name'] }}
                                            </div>
                                            <span class="badge rounded-pill text-bg-secondary">
                                                Total: {{ $exam['total'] }}
                                            </span>
                                        </div>

                                        <!-- Subjects table -->
                                        <div class="table-responsive">
                                            <table class="table table-sm mb-0 align-middle">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="px-3 py-2">Subject</th>

                                                        <!-- fixed width for numeric columns -->
                                                        <th class="px-3 py-2 text-end" style="width: 90px;">Objective</th>
                                                        <th class="px-3 py-2 text-end" style="width: 90px;">Theory</th>
                                                        <th class="px-3 py-2 text-end" style="width: 90px;">Total</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    @foreach($exam['subjects'] as $subject)
                                                        @php
                                                            $obj   = $subject['marks_objective'] ?? null;
                                                            $the   = $subject['marks_theury'] ?? null;
                                                            $total = $subject['marks_obtained'] ?? null;

                                                            $isFail = is_numeric($total) && $total < 33;
                                                        @endphp

                                                        <tr>
                                                            <!-- Subject -->
                                                            <td class="px-3 py-2">
                                                                <span class="text-dark fw-semibold d-block text-truncate" style="max-width: 220px;">
                                                                    {{ $subject['subject'] }}
                                                                </span>
                                                            </td>

                                                            <!-- Objective -->
                                                            <td class="px-3 py-2 text-end">
                                                                @if($obj !== null)
                                                                    <span class="fw-bold {{ $isFail ? 'text-danger' : 'text-dark' }}">
                                                                        {{ $obj }}
                                                                    </span>
                                                                @else
                                                                    <span class="text-muted">—</span>
                                                                @endif
                                                            </td>

                                                            <!-- Theory -->
                                                            <td class="px-3 py-2 text-end">
                                                                @if($the !== null)
                                                                    <span class="fw-bold {{ $isFail ? 'text-danger' : 'text-dark' }}">
                                                                        {{ $the }}
                                                                    </span>
                                                                @else
                                                                    <span class="text-muted">—</span>
                                                                @endif
                                                            </td>

                                                            <!-- Total -->
                                                            <td class="px-3 py-2 text-end">
                                                                @if($total !== null)
                                                                    <span class="fw-bold {{ $isFail ? 'text-danger' : 'text-dark' }}">
                                                                        {{ $total }}
                                                                    </span>
                                                                @else
                                                                    <span class="text-muted">—</span>
                                                                @endif
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>


                                        <!-- Exam footer -->
                                        <div class="px-3 py-2 border-top bg-white d-flex justify-content-between align-items-center">
                                            <small class="text-muted">Exam Total</small>
                                            <span class="fw-bold text-dark">{{ $exam['total'] }}</span>
                                        </div>
                                    </div>
                                @endforeach

                                @if(empty($data['exam_results']) || count($data['exam_results']) === 0)
                                    <div class="text-center py-4 text-muted">
                                        No exam results found.
                                    </div>
                                @endif
                            </div>

                            <!-- Footer -->
                            <div class="px-3 py-3 border-top bg-white text-center">
                                <div class="text-muted small">🎯 Overall Total</div>
                                <div class="fw-bold fs-4 text-dark">
                                    {{ $data['overall_total'] }}
                                </div>
                            </div>

                        </div>
                    </div>
                @endforeach
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
