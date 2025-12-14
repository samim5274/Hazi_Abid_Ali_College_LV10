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

                <div class="text-sm mb-6 text-gray-500">
                    <a href="{{ url()->previous() }}" class="hover:text-[#1DE4BD]">← Back to Notices</a>
                </div>

                    <h2 class="text-2xl font-bold text-gray-700 mb-6">Student Daily Routine</h2>

                    <form action="{{ route('student-daily-routine.edit') }}" method="POST" class="grid gap-6 md:grid-cols-2">
                        @csrf
                        <input type="hidden" name="id" value="{{ $routine->id }}">
                        <!-- Time to Awake -->
                        <div class="flex flex-col">
                            <label for="time_to_awake" class="text-gray-700 font-medium mb-1">Time to Awake</label>
                            <input type="time" name="time_to_awake" id="time_to_awake" value="{{ old('time_to_awake', $routine->time_to_awake ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Attendance in College -->
                        <div class="flex flex-col">
                            <label for="attendance_in_college" class="text-gray-700 font-medium mb-1">Attendance in College</label>
                            <select name="attendance_in_college" id="attendance_in_college" 
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                                <option value="1" {{ (old('attendance_in_college', $routine->attendance_in_college ?? '') == 1) ? 'selected' : '' }}>Present</option>
                                <option value="0" {{ (old('attendance_in_college', $routine->attendance_in_college ?? '') == 0) ? 'selected' : '' }}>Absent</option>
                            </select>
                        </div>

                        <!-- Arrival in Residence -->
                        <div class="flex flex-col">
                            <label for="arrival_in_residence" class="text-gray-700 font-medium mb-1">Arrival in Residence</label>
                            <input type="time" name="arrival_in_residence" id="arrival_in_residence" value="{{ old('arrival_in_residence', $routine->arrival_in_residence ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Prayer -->
                        <div class="flex flex-col">
                            <label for="prayer" class="text-gray-700 font-medium mb-1">Prayer</label>
                            <input type="text" name="prayer" id="prayer" placeholder="e.g., Fajr, Dhuhr, Asr" value="{{ old('prayer', $routine->prayer ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">                            
                        </div>

                        <!-- Morning Activity -->
                        <div class="flex flex-col">
                            <label for="morning_activity" class="text-gray-700 font-medium mb-1">Morning Activity</label>
                            <input type="text" name="morning_activity" id="morning_activity" placeholder="e.g., Reading, Exercise" value="{{ old('morning_activity', $routine->morning_activity ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1"> 
                        </div>

                        <!-- Evening Activity -->
                        <div class="flex flex-col">
                            <label for="evening_activity" class="text-gray-700 font-medium mb-1">Evening Activity</label>
                            <input type="text" name="evening_activity" id="evening_activity" placeholder="e.g., Reading, Exercise" value="{{ old('evening_activity', $routine->evening_activity ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Night Activity -->
                        <div class="flex flex-col">
                            <label for="night_activity" class="text-gray-700 font-medium mb-1">Night Activity</label>
                            <input type="text" name="night_activity" id="night_activity" placeholder="e.g., Reading, Exercise" value="{{ old('night_activity', $routine->night_activity ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Time to Bed -->
                        <div class="flex flex-col">
                            <label for="time_to_bed" class="text-gray-700 font-medium mb-1">Time to Bed</label>
                            <input type="time" name="time_to_bed" id="time_to_bed" value="{{ old('time_to_bed', $routine->time_to_bed ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1">
                        </div>

                        <!-- Total Hours -->
                        <div class="flex flex-col">
                            <label for="total_hours" class="text-gray-700 font-medium mb-1">Total Hours</label>
                            <input type="number" name="total_hours" id="total_hours" value="{{ old('total_hours', $routine->total_hours ?? '') }}"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1"
                                placeholder="Total study/sleep hours" min="0">
                        </div>

                        <!-- Remark -->
                        <div class="flex flex-col md:col-span-2">
                            <label for="remark" class="text-gray-700 font-medium mb-1">Remark</label>
                            <textarea name="remark" id="remark" rows="3"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-theme-bg-1"
                                placeholder="Any remark">{{ old('remark', $routine->remark ?? '') }}</textarea>
                        </div>

                        <!-- Submit Button -->
                        <div class="md:col-span-2">
                            <button type="submit" onclick="return confirm('Are you sure you want to save the changes to your daily routine?');"
                                class="bg-theme-bg-1 text-[#3F4D67] px-4 py-2 rounded-lg shadow hover:bg-theme-bg-2 transition font-medium text-sm">
                                Update Daily Routine
                            </button>
                        </div>

                    </form>
                </div>
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