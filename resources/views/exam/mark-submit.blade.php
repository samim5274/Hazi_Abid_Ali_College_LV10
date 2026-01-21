<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam's - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Result Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/exam-class-list')}}">Class</a></li>
                        <li class="breadcrumb-item" aria-current="page">Subject</li>
                        <li class="breadcrumb-item" aria-current="page">Mark</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm ">
                <div class="bg-gray-100 border-b px-4 py-4 sm:py-6 rounded-t-lg flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">

                    <!-- Left: Previous Button + Student Info -->
                    <div class="flex items-center gap-4">
                        <!-- Previous Button -->
                        <a href="{{ url()->previous() }}" 
                        class="inline-flex items-center gap-2 px-3 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition">
                            <i class="fa-solid fa-angle-left"></i> Back
                        </a>

                        <!-- Student Info -->
                        <h2 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-blue-500 text-xl">📌</span>
                            Class: <span class="text-gray-700">{{ $students[0]->room->name ?? 'N/A' }}</span> 
                            (<span class="text-gray-700">{{ $students[0]->room->section ?? 'N/A' }}</span>)
                        </h2>
                    </div>

                    <div class="mb-4">
                        <div class="relative">
                            <i class="fa-solid fa-magnifying-glass absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"></i>
                            <input
                            id="studentSearch"
                            type="text"
                            placeholder="Search by name, roll, blood group, address..."
                            class="w-full pl-11 pr-4 py-3 rounded-2xl border border-gray-200 bg-white
                                    focus:outline-none focus:ring-2 focus:ring-[#3F4D67] focus:border-[#3F4D67]"
                            />
                        </div>
                        <p id="searchMeta" class="mt-2 text-xs text-gray-500"></p>
                    </div>

                    <!-- Right: Subject Info -->
                    <h3 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                        <span class="text-green-500 text-xl">📌</span>
                        Subject: <span class="text-gray-700">{{ $sub->name }}</span>
                    </h3>
                </div>

                <div class="space-y-4">
                    @foreach($students as $val)
                        @php
                            $studentMarks = $marks->where('student_id', $val->id)->first();
                            $initial = strtoupper(substr($val->first_name ?? 'S', 0, 1));
                            $hasMarks = !empty($studentMarks);
                        @endphp   

                        @php
                            $searchText = strtolower(
                                ($val->first_name ?? '').' '.
                                ($val->last_name ?? '').' '.
                                ($val->roll_number ?? '').' '.
                                ($val->blood_group ?? '').' '.
                                ($val->address1 ?? '')
                            );
                        @endphp

                        <div class="student-card bg-white border border-gray-200 rounded-2xl shadow-sm hover:shadow-md transition overflow-hidden" data-search="{{ $searchText }}">
                            <div class="p-5 sm:p-6">
                                <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-5">

                                    <!-- Left: Student Info -->
                                    <div class="flex items-start gap-4 min-w-0">
                                        <!-- Avatar -->
                                        <div class="w-12 h-12 rounded-full bg-gray-100 border border-gray-200 flex items-center justify-center font-bold text-gray-700 flex-shrink-0">
                                            {{ $initial }}
                                        </div>

                                        <div class="min-w-0">
                                            <a href="{{ url('/edit-student-view/'.$val->id) }}"
                                            class="block text-gray-900 font-bold text-base sm:text-lg hover:text-[#3F4D67] transition truncate">
                                                {{ $loop->iteration }}. {{ $val->first_name }} {{ $val->last_name }}
                                                <span class="text-gray-400 font-semibold">• Roll: {{ $val->roll_number }}</span>
                                            </a>

                                            <div class="mt-2 flex flex-wrap items-center gap-2 text-xs sm:text-sm text-gray-600">
                                                <span class="inline-flex items-center gap-1 px-2.5 py-1 rounded-full bg-red-50 text-red-700 ring-1 ring-red-200">
                                                    <i class="fa-solid fa-droplet"></i>
                                                    {{ $val->blood_group ?? 'N/A' }}
                                                </span>

                                                @if(!empty($val->address1))
                                                    <span class="inline-flex items-center gap-1 px-2.5 py-1 rounded-full bg-gray-50 text-gray-700 ring-1 ring-gray-200 max-w-full">
                                                        <i class="fa-solid fa-location-dot text-gray-400"></i>
                                                        <span class="truncate max-w-[260px] sm:max-w-[360px]">{{ $val->address1 }}</span>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Middle: Marks Status -->
                                    <div class="lg:text-center">
                                        @if($hasMarks)
                                            <div class="inline-flex flex-col items-start lg:items-center gap-2">
                                                <span class="inline-flex items-center gap-2 px-4 py-2 rounded-full text-sm font-bold ring-1
                                                    {{ ($studentMarks->gpa ?? 0) >= 2.0 ? 'bg-green-50 text-green-700 ring-green-200' : 'bg-red-50 text-red-700 ring-red-200' }}">
                                                    <i class="fa-solid {{ ($studentMarks->gpa ?? 0) >= 2.0 ? 'fa-circle-check' : 'fa-circle-xmark' }}"></i>
                                                    {{ $studentMarks->marks_obtained }} / {{ $exam->max_marks }}
                                                    <span class="font-semibold">({{ $studentMarks->grade }})</span>
                                                </span>

                                                @if(!empty($studentMarks->remarks) && $studentMarks->remarks !== 'N/A')
                                                    <span class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-gray-50 text-gray-700 text-xs ring-1 ring-gray-200">
                                                        <i class="fa-solid fa-comment-dots text-gray-400"></i>
                                                        {{ $studentMarks->remarks }}
                                                    </span>
                                                @endif
                                            </div>
                                        @else
                                            <span class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-yellow-50 text-yellow-800 text-sm font-semibold ring-1 ring-yellow-200">
                                                <i class="fa-solid fa-clock"></i>
                                                No marks yet
                                            </span>
                                        @endif
                                    </div>

                                    <!-- Right: Input + Action -->
                                    <div class="w-full lg:w-auto">
                                        <form action="{{ url('/submit-mark/'.$val->id) }}" method="POST"
                                            class="flex flex-col sm:flex-row sm:items-center lg:justify-end gap-3">
                                            @csrf
                                            <input type="hidden" name="subject_id" value="{{ $sub->id }}">
                                            <input type="hidden" name="class_id" value="{{ $room->id }}">
                                            <input type="hidden" name="exam_id" value="{{ $exam->id }}">

                                            <div class="w-full sm:w-44">
                                                <label class="block text-xs font-semibold text-gray-500 mb-1">
                                                    Mark (0 - {{ $exam->max_marks }})
                                                </label>
                                                <input type="number" name="marks_obtained" min="0" max="{{ $exam->max_marks }}" required
                                                    class="w-full border border-gray-300 rounded-xl px-3 py-2 text-gray-800
                                                            placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-[#3F4D67] focus:border-[#3F4D67]"
                                                    placeholder="Enter mark">
                                            </div>

                                            @if($hasMarks)
                                                <button type="submit" name="edit" value="1"
                                                        onclick="return confirm('Are you sure want to update this mark?')"
                                                        class="inline-flex items-center justify-center gap-2 px-5 py-2.5 rounded-xl
                                                            bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold
                                                            shadow-sm hover:shadow transition w-full sm:w-auto">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                    Update
                                                </button>
                                            @else
                                                <button type="submit"
                                                        onclick="return confirm('Are you sure want to save this mark?')"
                                                        class="inline-flex items-center justify-center gap-2 px-5 py-2.5 rounded-xl
                                                            bg-green-600 hover:bg-green-700 text-white text-sm font-semibold
                                                            shadow-sm hover:shadow transition w-full sm:w-auto">
                                                    <i class="fa-solid fa-check"></i>
                                                    Save
                                                </button>
                                            @endif
                                        </form>

                                        <!-- Small helper text -->
                                        <div class="mt-2 text-xs text-gray-400 lg:text-right">
                                            {{ $hasMarks ? 'You can update the mark anytime.' : 'Submit mark to generate grade & GPA.' }}
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <!-- Footer Strip -->
                            <div class="px-5 sm:px-6 py-3 bg-gray-50 border-t border-gray-100 flex items-center justify-between text-xs text-gray-500">
                                <span class="inline-flex items-center gap-2">
                                    <i class="fa-solid fa-book text-gray-400"></i>
                                    Subject: <span class="font-semibold text-gray-700">{{ $sub->name ?? 'N/A' }}</span>
                                </span>

                                <span class="inline-flex items-center gap-2">
                                    <i class="fa-solid fa-graduation-cap text-gray-400"></i>
                                    Exam: <span class="font-semibold text-gray-700">{{ $exam->name ?? 'N/A' }}</span>
                                </span>
                            </div>
                        </div>
                    @endforeach
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
            
            // search section        
            const input = document.getElementById("studentSearch");
            const cards = Array.from(document.querySelectorAll(".student-card"));
            const meta  = document.getElementById("searchMeta");

            if (!input || cards.length === 0) return;

            function updateMeta(visible, total, q) {
                if (!meta) return;
                if (!q) meta.textContent = `Showing ${visible} of ${total} students`;
                else meta.textContent = `Found ${visible} of ${total} for "${q}"`;
            }

            function filter() {
                const q = input.value.trim().toLowerCase();
                let visible = 0;

                cards.forEach(card => {
                const hay = (card.getAttribute("data-search") || "").toLowerCase();
                const match = hay.includes(q);

                card.classList.toggle("hidden", q && !match);
                if (!q || match) visible++;
                });

                updateMeta(visible, cards.length, q);
            }

            // initial count
            updateMeta(cards.length, cards.length, "");

            // live search
            input.addEventListener("input", filter);

            // ESC চাপলে search clear
            input.addEventListener("keydown", (e) => {
                if (e.key === "Escape") {
                input.value = "";
                filter();
                }
            });
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
