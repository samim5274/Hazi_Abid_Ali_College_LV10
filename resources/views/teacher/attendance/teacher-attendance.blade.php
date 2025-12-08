<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Attendance - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Teacher Attendance <i class="fa-solid fa-arrow-right"></i> {{ Auth::guard('teacher')->user()->first_name }} {{ Auth::guard('teacher')->user()->last_name }} </h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">Teacher</li>
                    </ul>
                </div>
            </div>
            <form action="{{ url('/teacher-attendance/store') }}" method="POST" class="max-w-md mx-auto bg-white shadow-xl rounded-2xl p-8 space-y-6">
                @csrf
                <!-- Profile Section -->
                <div class="flex flex-col items-center">
                    <img src="{{ asset('img/teacher/'. Auth::guard('teacher')->user()->photo ) }}" 
                        alt="Profile Picture" 
                        class="w-32 h-32 object-cover rounded-full border-4 border-indigo-500 shadow-md mb-4">
                    <h2 class="text-2xl font-bold text-gray-800 mb-1 text-center">{{ Auth::guard('teacher')->user()->name }}</h2>
                    <h3 class="text-gray-500 text-md mb-4 text-center">{{ Auth::guard('teacher')->user()->designation ?? 'Teacher' }}</h3>
                </div>
                <hr>
                <h3 class="text-xl font-semibold text-gray-700 text-center mb-4">Mark Attendance</h3>

                <!-- Status -->
                <div>
                    <label class="block text-gray-700 font-medium mb-2">Status</label>
                    <div class="flex gap-4">
                        <label class="flex-1 flex items-center justify-center bg-green-100 rounded-xl py-2 cursor-pointer hover:bg-green-200 transition">
                            <input type="radio" name="status" value="Present" class="mr-2" checked> Present
                        </label>
                        <label class="flex-1 flex items-center justify-center bg-red-100 rounded-xl py-2 cursor-pointer hover:bg-red-200 transition">
                            <input type="radio" name="status" value="Absent" class="mr-2"> Absent
                        </label>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="bg-[#3F4D67] text-white font-semibold px-8 p-3 rounded-2xl shadow-lg transition">
                        Submit Attendance
                    </button>
                </div>

            </form>

        </div>

        <br><br>
        <!-- Card -->
        <div class="card rounded-lg border shadow-sm">
            
            <div class="card-body p-6 bg-gray-50 rounded-b-lg">
                <div class="overflow-x-auto">
                    <div class="flex flex-wrap items-center justify-between mb-4 gap-3">    
                        <h2 class="text-xl font-bold text-gray-700 flex items-center gap-2">
                            📌 {{ Auth::guard('teacher')->user()->first_name }} {{ Auth::guard('teacher')->user()->last_name }} - Attendance
                        </h2>
                        <div class="flex flex-wrap gap-3">
                            <span class="text-black bg-green-200 px-4 py-2 rounded-full font-medium shadow hover:bg-green-300 transition">
                                Total: {{ $total }}
                            </span>
                            <span class="text-black bg-blue-200 px-4 py-2 rounded-full font-medium shadow hover:bg-blue-300 transition">
                                Present: {{ $present }}
                            </span>
                            <span class="text-black bg-yellow-200 px-4 py-2 rounded-full font-medium shadow hover:bg-yellow-300 transition">
                                Absent: {{ $absent }}
                            </span>
                        </div>
                    </div>


                    <table class="min-w-full table-auto border-collapse">
                        <tbody class="bg-white divide-y divide-gray-200">
                            @forelse($data as $val)
                            <tr class="hover:bg-gray-50">
                                <td class="px-4 py-2">{{ $loop->iteration }}</td>
                                <td class="px-4 py-2">{{ $val->teacher->name }}</td>
                                <td class="px-4 py-2">{{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}</td>
                                <td class="px-4 py-2">{{ \Carbon\Carbon::parse($val->attendance_time)->format('h:i A') }}</td>
                                <td class="px-4 py-2 capitalize">{{ $val->status }}</td>
                                <td class="px-4 py-2">{{ $val->ip_address }}</td>
                                <td class="px-4 py-2">{{ $val->browser ?? 'Unknown' }}</td>
                                <td class="px-4 py-2">{{ $val->device ?? 'Unknown' }}</td>
                                <td class="px-4 py-2">{{ $val->location ?? 'Unknown' }}</td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="9" class="px-4 py-2 text-center text-gray-500">No attendance records found.</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
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
