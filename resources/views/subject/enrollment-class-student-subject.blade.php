<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subject - (SMS)</title>

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
                            <h5 class="mb-0 font-medium">Student Entrollment</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{url('/enrollment/class')}}">Class</a></li>
                            <li class="breadcrumb-item"><a href="{{url('/enrollment/class/student/'.$class)}}">Student</a></li>
                            <li class="breadcrumb-item" aria-current="page">Subject</li>
                        </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm ">
                <div class="bg-gray-100 border-b px-4 py-4 sm:py-6 rounded-t-lg">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                        <!-- Student Info -->
                        <h2 class="text-lg sm:text-xl  text-gray-800 flex items-center gap-2">
                            <span class="text-blue-500 text-xl">📌</span>
                            Student: <span class="text-gray-700 font-bold">{{$students->first_name}} {{$students->last_name}}</span>
                        </h2>

                        <h3 class="text-lg sm:text-xl font-bold text-gray-800 flex items-center gap-2">
                            <span class="text-green-500 text-xl">📌</span>
                            <span class="text-gray-700">{{$students->room->name}} - ( {{$students->room->section}} )</span>
                        </h3>
                    </div>
                </div>
                <div class="space-y-6 p-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        @foreach($subjects as $val)   
                        <form action="{{url('/enrolment/class/student/subject/'.$class.'/'.$student.'/'.$val->id)}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="border border-gray-200 p-5 rounded-xl bg-white
                                        group-hover:-translate-y-2 group-hover:shadow-xl
                                        shadow-md transform transition duration-300 hover:-translate-y-2 hover:shadow-xl">
                                
                                <div class="flex items-start justify-between">                                
                                    <div>
                                        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-start gap-3 mb-3">
                                            <p class="text-base text-gray-800">#{{$val->id}}.</p>

                                            <input type="hidden" name="studentId" value="{{$student}}">
                                            <input type="hidden" name="subjectId" value="{{$val->id}}">
                                            
                                            <h3 class="text-lg font-semibold text-gray-700 group-hover:text-blue-600 transition">
                                                {{ $val->name }}
                                            </h3>
                                            @if($enrollmented->contains('subject_id', $val->id))
                                                <span class="px-3 py-1 text-xs font-medium rounded-full bg-green-100 text-green-700">
                                                    Enrolled
                                                </span>
                                            @endif
                                        </div>

                                        <div class="flex items-center gap-4 text-sm text-gray-500">
                                            <span><i class="fa-regular fa-calendar mr-1"></i>{{ \Carbon\Carbon::parse($val->date)->format('d M, Y') }}</span>
                                            <span class="italic">Click for details →</span>
                                        </div>
                                    </div>

                                    <div class="flex-shrink-0 ml-4 self-center ">
                                        <button type="submit"><i class="fas fa-plus-circle text-gray-400 text-2xl group-hover:text-blue-600 transition duration-300"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        @endforeach
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
