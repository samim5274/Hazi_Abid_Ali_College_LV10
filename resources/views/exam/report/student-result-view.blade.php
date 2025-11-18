<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results Marks - (SMS)</title>

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
                        <li class="breadcrumb-item"><a href="{{url('/total-report-result')}}">Class list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Student list</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <!-- <div class="card rounded-lg border shadow-sm ">
                <div class="bg-gray-100 border-b px-4 py-4 sm:py-6 rounded-t-lg">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                        
                        <h2 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-blue-500 text-xl">📌</span>
                            <span class="text-gray-700">{{ $students[0]->room->name ?? 'N/A' }}</span> 
                            (<span class="text-gray-700">{{ $students[0]->room->section ?? 'N/A' }}</span>)
                        </h2>
                    </div>
                </div>
                 <table class="table table-striped table-hover table-bordered align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>
                            @foreach($subjects as $subject)
                                <th>{{ $subject->name }}</th>
                            @endforeach
                            <th class="text-end">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($studentResults as $key => $data)
                        <tr>
                            <td class="fw-bold">{{ $key + 1 }}</td>
                            <td>{{ $data['student']->first_name }} {{ $data['student']->last_name }}</td>
                            @foreach($subjects as $subject)
                                @php
                                    $result = $data['student']->results->firstWhere('subject_id', $subject->id);
                                @endphp
                                <td class="{{ $result && $result->marks_obtained < 40 ? 'text-danger fw-bold' : '' }}">
                                    {{ $result ? $result->marks_obtained : '-' }}
                                </td>
                            @endforeach
                            <td class="text-end fw-bold text-primary">{{ $data['total_marks'] }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="table-light">
                        <tr>
                            <td colspan="2" class="fw-bold text-center">Class Average</td>
                            @foreach($subjects as $subject)
                                @php
                                    $avg = $studentResults
                                        ? round(
                                            collect($studentResults)->map(function($s) use($subject) {
                                                $r = $s['student']->results->firstWhere('subject_id', $subject->id);
                                                return $r ? $r->marks_obtained : 0;
                                            })->avg(), 
                                        2)
                                        : 0;
                                @endphp
                                <td class="fw-semibold">{{ $avg }}</td>
                            @endforeach
                            <td></td>
                        </tr>
                    </tfoot>
                </table> 
            </div> -->

            <div class="row g-4">
                <div class="bg-gray-100 border-b px-4 py-4 sm:py-6 rounded-t-lg">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                        <!-- Student Info -->
                        <h2 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-blue-500 text-xl">📌</span>
                            <span class="text-gray-700">{{ $students[0]->room->name ?? 'N/A' }}</span> 
                            (<span class="text-gray-700">{{ $students[0]->room->section ?? 'N/A' }}</span>)
                        </h2>
                    </div>
                </div>
                @foreach($studentResults as $key => $data)
                    <div class="col-md-6 col-lg-4">
                        <div class="card shadow-md border-0 h-100 rounded-lg">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                <h2 class="text-lg">{{ $key + 1 }}. {{ $data['student']->first_name }} {{ $data['student']->last_name }}</h2> 
                                <!-- <span class="badge bg-light text-dark">Total: {{ $data['total_marks'] }}</span> -->
                            </div>
                            <div class="card-body p-2">
                                <div class="table-responsive">
                                    <table class="table table-sm table-bordered mb-0">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Subject</th>
                                                <th class="text-center">Marks</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($subjects as $subject)
                                                @php
                                                    $result = $data['student']->results->firstWhere('subject_id', $subject->id);
                                                @endphp
                                                <tr>
                                                    <td>{{ $subject->name }}</td>
                                                    <td class="text-center {{ $result && $result->marks_obtained < 40 ? 'text-danger fw-bold' : '' }}">
                                                        {{ $result ? $result->marks_obtained : '-' }}
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer bg-light text-center fw-bold">
                                Final Total: <span class="text-primary">{{ $data['total_marks'] }}</span>
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
