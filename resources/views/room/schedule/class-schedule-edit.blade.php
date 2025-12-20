<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classes/Room - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Classes Schedule Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/class-schedule')}}">Class Schedule</a></li>
                        <li class="breadcrumb-item" aria-current="page">Edit Schedule</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="max-w-7xl mx-auto px-6 py-8 bg-white border border-gray-200 shadow-sm rounded-xl">

                <!-- Header -->
                <div class="flex items-center justify-between mb-8">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 flex items-center justify-center rounded-full bg-indigo-100 text-indigo-600">
                            <i class="fa-solid fa-calendar-days text-xl"></i>
                        </div>
                        <div>
                            <h1 class="text-xl font-semibold text-gray-800">
                                Modify Class Schedule
                            </h1>
                            <p class="text-sm text-gray-500">
                                Update routine details for selected class and period
                            </p>
                        </div>
                    </div>
                </div>

                <form action="{{ url('/update-class-schedule/'.$schedules->id) }}" method="POST" class="space-y-8">
                    @csrf

                    <!-- Class & Day Info -->
                    <div class="grid md:grid-cols-2 gap-6 bg-gray-50 border border-gray-200 rounded-lg p-4">
                        <div>
                            <label class="block text-xs font-medium text-gray-500 mb-1 uppercase tracking-wide">
                                Class & Section
                            </label>
                            <p class="text-sm font-semibold text-gray-800">
                                {{ $schedules->classRoom->name }} - ({{ $schedules->classRoom->section }})
                            </p>
                            <input type="hidden" name="class_id" value="{{ isset($schedules) ? $schedules->class_id : '' }}">
                        </div>

                        <div>
                            <label class="block text-xs font-medium text-gray-500 mb-1 uppercase tracking-wide">
                                Day
                            </label>
                            <p class="text-sm font-semibold text-gray-800">
                                {{ $schedules->day }}
                            </p>
                            <input type="hidden" name="day" value="{{ isset($schedules) ? $schedules->day : '' }}">
                        </div>
                    </div>

                    <!-- Schedule Table -->
                    <div class="overflow-x-auto border border-gray-200 rounded-xl">
                        <table class="min-w-full text-sm text-left">
                            <thead class="bg-gray-100 text-gray-700">
                                <tr>
                                    <th class="px-4 py-3 font-semibold">Period</th>
                                    <th class="px-4 py-3 font-semibold">Teacher</th>
                                    <th class="px-4 py-3 font-semibold">Subject</th>
                                    <th class="px-4 py-3 font-semibold">Start Time</th>
                                    <th class="px-4 py-3 font-semibold">End Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="border-t hover:bg-gray-50 transition">
                                    <td class="px-4 py-3 font-medium text-gray-800">
                                        Period {{ $schedules->period }}
                                    </td>

                                    <td class="px-4 py-3">
                                        <select name="teacher[]"
                                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm
                                                focus:ring-2 focus:ring-indigo-500 focus:outline-none">
                                            <option disabled selected>-- Select Teacher --</option>
                                            @foreach($teachers as $teacher)
                                                <option value="{{ $teacher->id }}"
                                                    {{ isset($schedules) && $schedules->teacher_id == $teacher->id ? 'selected' : '' }}>
                                                    {{ $teacher->first_name }} {{ $teacher->last_name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </td>

                                    <td class="px-4 py-3">
                                        <select name="subject"
                                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm
                                                focus:ring-2 focus:ring-indigo-500 focus:outline-none">
                                            <option disabled selected>-- Select Subject --</option>
                                            @foreach($subjects as $subject)
                                                <option value="{{ $subject->id }}"
                                                    {{ isset($schedules) && $schedules->subject_id == $subject->id ? 'selected' : '' }}>
                                                    {{ $subject->name }} - {{ $subject->room->name }} ({{ $subject->room->section }})
                                                </option>
                                            @endforeach
                                        </select>
                                    </td>

                                    <td class="px-4 py-3">
                                        <input type="time"
                                            name="start_time[]"
                                            value="{{ isset($schedules) ? $schedules->start_time : '' }}"
                                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm
                                                focus:ring-2 focus:ring-indigo-500 focus:outline-none">
                                    </td>

                                    <td class="px-4 py-3">
                                        <input type="time"
                                            name="end_time[]"
                                            value="{{ isset($schedules) ? $schedules->end_time : '' }}"
                                            class="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm
                                                focus:ring-2 focus:ring-indigo-500 focus:outline-none">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Submit -->
                    <div class="flex justify-end pt-4 border-t">
                        <button type="submit"
                            class="inline-flex items-center gap-2 px-6 py-2 text-sm font-medium text-white
                                bg-gradient-to-r from-indigo-500 to-blue-600 rounded-lg shadow
                                hover:from-indigo-600 hover:to-blue-700 transition"
                                onclick="return confirm('Are you sure you want to update this schedule?')">
                            <i class="fa-solid fa-floppy-disk"></i>
                            Update Schedule
                        </button>
                    </div>
                </form>
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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const classDropdown = document.querySelector('select[name="class_id"]');
            const subjectDropdowns = document.querySelectorAll('select[name="subject[]"]');

            classDropdown.addEventListener('change', function () {
                const classId = this.value;

                // Disable and show loading text in all subject dropdowns
                subjectDropdowns.forEach(subjectDropdown => {
                    subjectDropdown.innerHTML = '<option disabled selected>-- Loading subjects --</option>';
                    subjectDropdown.disabled = true;
                });

                if (classId) {
                    fetch(`/get-subjects/${classId}`)
                        .then(response => response.json())
                        .then(data => {
                            subjectDropdowns.forEach(subjectDropdown => {
                                subjectDropdown.innerHTML = '<option disabled selected>-- Select Subject --</option>';
                                data.forEach(subject => {
                                    const option = document.createElement('option');
                                    option.value = subject.id;
                                    option.textContent = subject.name;
                                    subjectDropdown.appendChild(option);
                                });
                                subjectDropdown.disabled = false;
                            });
                        })
                        .catch(error => {
                            console.error('Error fetching subjects:', error);
                            subjectDropdowns.forEach(subjectDropdown => {
                                subjectDropdown.innerHTML = '<option disabled selected>-- Error loading subjects --</option>';
                            });
                        });
                } else {
                    // If no class is selected, reset all subject dropdowns
                    subjectDropdowns.forEach(subjectDropdown => {
                        subjectDropdown.innerHTML = '<option disabled selected>-- Select Class First --</option>';
                        subjectDropdown.disabled = true;
                    });
                }
            });
        });
    </script>

</body>
</html>
