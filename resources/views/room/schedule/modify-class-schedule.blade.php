<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classes/Room - (SMS)</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Classes Schedule Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/class-details')}}">Class list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Schedule</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            



            <div class="w-full mx-auto px-4 py-8">
                <h1 class="text-2xl font-bold text-gray-800 mb-6">📅 Class Modify Schedule</h1>

                <!-- filter section start -->
                <form action="{{ url('/search-modify-class-schedule') }}" method="GET" class="mb-6 bg-white shadow-md rounded-lg p-6">
                    <div class="grid grid-cols-12 gap-6 items-end">
                        
                        <!-- Class + Day Fields (8 columns) -->
                        <div class="col-span-12 md:col-span-8 grid grid-cols-2 gap-6">
                            <!-- Class Select -->
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Class</label>
                                <select name="class_id" class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
                                    <option disabled selected>-- select class --</option>
                                    @foreach($classes as $class)
                                        @if($class->id != 13)
                                            <option value="{{ $class->id }}" {{ request('class_id') == $class->id ? 'selected' : '' }}>
                                                {{ $class->name }}
                                            </option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>

                            <!-- Day Select -->
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Day</label>
                                <select name="day" class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
                                    <option disabled selected>-- select day --</option>    
                                    @foreach($days as $day)
                                        <option value="{{ $day }}" {{ request('day') == $day ? 'selected' : '' }}>
                                            {{ $day }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <!-- Filter Button (4 columns) -->
                        <div class="col-span-12 md:col-span-4 flex">
                            <button type="submit" class="w-full px-6 py-2 bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-lg shadow hover:from-blue-700 hover:to-indigo-700 transition">
                                Filter
                            </button>
                        </div>

                    </div>
                </form>
                <!-- filter section end -->


                <div class="overflow-x-auto bg-white shadow-md rounded-lg">
                    <table class="min-w-full text-sm text-center border-collapse">
                        <thead>
                            <tr class="bg-gradient-to-r from-blue-600 to-indigo-600 text-white">
                                <th class="px-6 py-3">Class</th>
                                <th class="px-6 py-3">Day</th>
                                <th class="px-6 py-3">Period</th>
                                <th class="px-6 py-3">Teacher</th>
                                <th class="px-6 py-3">Subject</th>
                                <th class="px-6 py-3">Time</th>
                                <th class="px-6 py-3">Action</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                            @forelse($schedules as $schedule)
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="px-6 py-4 font-medium text-gray-800">
                                        {{ $schedule->classRoom->name ?? 'N/A' }}
                                    </td>
                                    <td class="px-6 py-4 text-gray-600">
                                        {{ $schedule->day }}
                                    </td>
                                    <td class="px-6 py-4 text-gray-600">
                                        Period {{ $schedule->period }}
                                    </td>
                                    <td class="px-6 py-4 text-gray-600">
                                        {{ $schedule->teacher->first_name ?? 'N/A' }} {{ $schedule->teacher->last_name ?? 'N/A' }}
                                    </td>
                                    <td class="px-6 py-4 text-gray-600">
                                        {{ $schedule->subject->name ?? 'N/A' }}
                                    </td>
                                    <td class="px-6 py-4 text-gray-600">
                                        {{ \Carbon\Carbon::parse($schedule->start_time)->format('h:i A') }}
                                        –
                                        {{ \Carbon\Carbon::parse($schedule->end_time)->format('h:i A') }}
                                    </td>
                                    <td class="px-6 py-4 text-gray-600">
                                        <a href="{{url('/edit/class/schedule/'.$schedule->id)}}"> <i class="fa-solid fa-pen-to-square"></i> Edit</a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="px-6 py-4 text-center text-gray-500">
                                        No schedule found.
                                    </td>
                                </tr>
                            @endforelse
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
