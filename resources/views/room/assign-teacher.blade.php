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
                        <h5 class="mb-1 font-semibold text-gray-800">Teacher Assigned</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/class-details')}}">Class list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Assigned Teacher</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm">
                <div class="card-header px-4 py-3 border-b bg-gray-100">
                    <h3 class="text-lg font-semibold text-gray-700">Classes List</h3>
                </div>
                <div class="card-body p-6">
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
                        @foreach($classes as $val)
                        @if($val->id != 13)
                                <a href="#" class="block group" onclick="openModal({{$val->id}})">
                                <div class="border border-gray-200 p-5 rounded-xl bg-white
                                            group-hover:-translate-y-2 group-hover:shadow-xl
                                            shadow-md transform transition duration-300 hover:-translate-y-2 hover:shadow-xl">
                                    
                                    <!-- Header -->
                                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 mb-3">
                                        
                                        <!-- Name -->
                                        <p class="text-base text-gray-800">
                                            # {{ $loop->iteration}}
                                        </p>
                                        
                                        <!-- Subject -->
                                        <h3 class="text-lg font-semibold text-gray-700 group-hover:text-blue-600 transition">
                                            {{ $val->name ?? 'N/A'}}
                                        </h3>

                                        <!-- Class Badge -->
                                        <span class="px-3 py-1 text-sm font-medium rounded-full bg-green-100 text-green-700 text-center">
                                            {{ $val->section ?? 'N/A' }}
                                        </span>
                                    </div>

                                    <!-- Optional Footer Info -->
                                    <div class="flex items-center justify-between text-sm text-gray-600 mt-2">
                                        <span class="flex items-center">
                                            <i class="fa-solid fa-user-tie mr-2 text-blue-500"></i>
                                            {{ $val->teachers->first_name }} {{ $val->teachers->last_name }}
                                        </span>
                                        <span class="flex items-center italic">
                                            <i class="fa-solid fa-users mr-2 text-purple-500"></i>
                                            Capacity: {{ $val->capacity }}
                                        </span>
                                    </div>
                                </div>
                            </a>
                        @endif
                        @endforeach
                    </div>
                </div>
            </div>
            <!-- Card End -->




            <!-- Modal Background -->
            @foreach($classes as $val)
            @if($val->id != 13)
                <div id="examModal{{$val->id}}" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
                    <div class="bg-white rounded-lg shadow-lg w-full max-w-2xl p-6 relative">

                        <div class="flex items-center justify-between border-b pb-3 mb-4">
                            <h5 class="text-lg font-semibold text-gray-700">{{ $val->name }} - Teacher Assigned</h5>
                            <button onclick="closeModal({{ $val->id }})" class="text-gray-500 hover:text-red-600 text-2xl">&times;</button>
                        </div>

                        

                        <form action="{{ url('/assigned-teacher-update') }}" method="POST" class="space-y-6 p-6" enctype="multipart/form-data">
                            @csrf

                            <input type="hidden" name="class_id" value="{{ $val->id }}">
                            <div class="grid grid-cols-1 gap-6">
                                <div class="flex flex-col">
                                    <label for="class_teacher_id" class="block text-sm font-medium text-gray-700 mb-2">Select Teacher</label>
                                    <select name="class_teacher_id" id="class_teacher_id" class="form-select w-full rounded-md border border-gray-300 focus:border-green-500 focus:ring focus:ring-green-200 focus:ring-opacity-50 px-3 py-2">
                                        <option disabled selected>-- Select Teacher --</option>
                                        @foreach($teachers as $tech)
                                            <option value="{{ $tech->id }}" {{ $val->class_teacher_id == $tech->id ? 'selected' : '' }}>
                                                {{ $tech->first_name }} {{ $tech->last_name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="text-center mt-4">
                                <button type="submit" class="w-full bg-green-500 hover:bg-green-600 text-white font-semibold py-2 px-6 rounded-md shadow-md transition duration-300" onclick="return confirmSubmit(event)">
                                    Assign Teacher
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            @endif
            @endforeach


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

        // modal
        function confirmSubmit(event) {
            if (!confirm("Are you sure you want to submit?")) {
                event.preventDefault();
                return false;
            }
            return true;
        }

        function openModal(id) {
            const modal = document.getElementById('examModal' + id);
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }

        function closeModal(id) {
            const modal = document.getElementById('examModal' + id);
            modal.classList.remove('flex');
            modal.classList.add('hidden');
        }

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
