<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ Auth::guard('student')->user()->first_name }} {{ Auth::guard('student')->user()->last_name }} - {{ $company->name ?? "HAAC" }}</title>

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
             
        <!-- Flash Message -->
        @include('layouts.message')

            <div class="space-y-6">
                <!-- Student Daily Routine Form -->
                <div class="max-w-4xl mx-auto bg-white p-6 rounded-xl shadow-md border">

                    <h2 class="text-2xl font-bold text-gray-700 mb-6">Student Daily Routine</h2>

                    <form action="{{ route('student-daily-routine.store') }}" method="POST" class="grid gap-6 md:grid-cols-2">
                        @csrf

                        <!-- Time to Awake -->
                        <div class="flex flex-col">
                            <label for="time_to_awake" class="text-gray-700 font-medium mb-1">Time to Awake</label>
                            <input type="time" name="time_to_awake" id="time_to_awake" 
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Attendance in College -->
                        <div class="flex flex-col">
                            <label for="attendance_in_college" class="text-gray-700 font-medium mb-1">Attendance in College</label>
                            <select name="attendance_in_college" id="attendance_in_college"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                                <option value="1">Present</option>
                                <option value="0">Absent</option>
                            </select>
                        </div>

                        <!-- Arrival in Residence -->
                        <div class="flex flex-col">
                            <label for="arrival_in_residence" class="text-gray-700 font-medium mb-1">Arrival in Residence</label>
                            <input type="time" name="arrival_in_residence" id="arrival_in_residence"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Prayer -->
                        <div class="flex flex-col">
                            <label for="prayer" class="text-gray-700 font-medium mb-1">Prayer</label>
                            <input type="text" name="prayer" id="prayer" placeholder="e.g., Fajr, Dhuhr, Asr"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">                            
                        </div>

                        <!-- Morning Activity -->
                        <div class="flex flex-col">
                            <label for="morning_activity" class="text-gray-700 font-medium mb-1">Morning Activity</label>
                            <input type="text" name="morning_activity" id="morning_activity" placeholder="e.g., Reading, Exercise"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1"> 
                        </div>

                        <!-- Evening Activity -->
                        <div class="flex flex-col">
                            <label for="evening_activity" class="text-gray-700 font-medium mb-1">Evening Activity</label>
                            <input type="text" name="evening_activity" id="evening_activity" placeholder="e.g., Reading, Exercise"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Night Activity -->
                        <div class="flex flex-col">
                            <label for="night_activity" class="text-gray-700 font-medium mb-1">Night Activity</label>
                            <input type="text" name="night_activity" id="night_activity" placeholder="e.g., Reading, Exercise"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Time to Bed -->
                        <div class="flex flex-col">
                            <label for="time_to_bed" class="text-gray-700 font-medium mb-1">Time to Bed</label>
                            <input type="time" name="time_to_bed" id="time_to_bed"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Total Hours -->
                        <div class="flex flex-col">
                            <label for="total_hours" class="text-gray-700 font-medium mb-1">Total Hours</label>
                            <input type="number" name="total_hours" id="total_hours"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1"
                                placeholder="Total study/sleep hours" min="0">
                        </div>

                        <!-- Remark -->
                        <div class="flex flex-col md:col-span-2">
                            <label for="remark" class="text-gray-700 font-medium mb-1">Remark</label>
                            <textarea name="remark" id="remark" rows="3"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1"
                                placeholder="Any remark">N/A</textarea>
                        </div>

                        <!-- Submit Button -->
                        <div class="md:col-span-2">
                            <button type="submit" 
                                onclick="return confirm('Are you sure you want to submit this daily routine?');"
                                class="bg-theme-bg-1 text-[#3F4D67] px-4 py-2 rounded-lg shadow hover:bg-theme-bg-2 transition font-medium text-sm">
                                Save Daily Routine
                            </button>
                        </div>

                    </form>
                </div>
            </div>            
        </div>


        <div class="pc-content py-8 px-4 sm:px-6 lg:px-8 space-y-8">
            <!-- Table View -->
            <div class="bg-white rounded-xl shadow-md border overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Date</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Time to Awake</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Attendance</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Arrival</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Prayer</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Morning</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Evening</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Night</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Time to Bed</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Total Hours</th>
                            <th class="px-6 py-3 text-left text-sm font-medium text-gray-700" colspan="2">Remark</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200 text-sm">
                        @forelse($routine as $val)
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-6 py-3">{{ \Carbon\Carbon::parse($val->date)->format('F j, Y') }}</td>
                                <td class="px-6 py-3">{{ $val->time_to_awake }}</td>
                                <td class="px-6 py-3">{{ $val->attendance_in_college ? 'Present' : 'Absent' }}</td>
                                <td class="px-6 py-3">{{ $val->arrival_in_residence }}</td>
                                <td class="px-6 py-3">{{ $val->prayer ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->morning_activity ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->evening_activity ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->night_activity ?? '-' }}</td>
                                <td class="px-6 py-3">{{ $val->time_to_bed }}</td>
                                <td class="px-6 py-3">{{ $val->total_hours }} hrs</td>
                                <td class="px-6 py-3">{{ \Illuminate\Support\Str::limit($val->remark ?? '-', 15) }}</td>
                                <td class="px-6 py-3"><a href="{{ route('edit-student-daily-routine', $val->id) }}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="11" class="px-6 py-4 text-center text-gray-500">No daily reports found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
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
    
    <script>layout_change('light');</script>
    <script>layout_theme_sidebar_change('false');</script>
    <script>change_box_container('false');</script>
    <script>layout_caption_change('true');</script>
    <script>layout_rtl_change('false');</script>
    <script>preset_change('preset-1');</script>
    <script>main_layout_change('vertical');</script>
    

  </body>
  <!-- [Body] end -->
</html>