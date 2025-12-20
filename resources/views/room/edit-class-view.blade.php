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

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Classes Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/class-details')}}">Class list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Add new</li>
                    </ul>
                </div>
            </div>

            <!-- Card -->
            <div class="max-w-3xl mx-auto bg-white shadow-lg rounded-xl p-8 mt-10">
                <!-- Header -->
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 mb-8">
                    <div class="px-6 py-4 flex items-center justify-between">
                        <div class="flex items-center gap-4">
                            <div class="h-12 w-12 flex items-center justify-center rounded-full bg-blue-100 text-blue-600">
                                <i class="fa-solid fa-school text-xl"></i>
                            </div>

                            <div>
                                <h2 class="text-xl font-semibold text-gray-800">
                                    Modify Class
                                </h2>
                                <p class="text-sm text-gray-500">
                                    Update information for <span class="font-medium text-gray-700">{{ $classes->name }}</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Form -->
                <form action="{{ url('/modify-class/' . $classes->id) }}" method="POST"
                    class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 space-y-6">
                    @csrf

                    <!-- Class Name -->
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 mb-1">
                            Class Name <span class="text-red-500">*</span>
                        </label>
                        <input type="text"
                            name="name"
                            id="name"
                            value="{{ old('name', $classes->name) }}"
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none
                                    @error('name') border-red-500 @enderror"
                            placeholder="Enter class name"
                            required>
                    </div>

                    <!-- Section -->
                    <div>
                        <label for="section" class="block text-sm font-medium text-gray-700 mb-1">
                            Section <span class="text-red-500">*</span>
                        </label>
                        <input type="text"
                            name="section"
                            id="section"
                            value="{{ old('section', $classes->section) }}"
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none
                                    @error('section') border-red-500 @enderror"
                            placeholder="e.g. A, B, C"
                            required>
                    </div>

                    <!-- Teacher -->
                    <div>
                        <label for="teacher_id" class="block text-sm font-medium text-gray-700 mb-1">
                            Class Teacher <span class="text-red-500">*</span>
                        </label>
                        <select name="teacher_id"
                                id="teacher_id"
                                class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none
                                    @error('teacher_id') border-red-500 @enderror"
                                required>
                            <option disabled>-- Select Teacher --</option>
                            @foreach($teachers as $teacher)
                                <option value="{{ $teacher->id }}"
                                    {{ old('teacher_id', $classes->class_teacher_id) == $teacher->id ? 'selected' : '' }}>
                                    {{ $teacher->first_name }} {{ $teacher->last_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Capacity -->
                    <div>
                        <label for="capacity" class="block text-sm font-medium text-gray-700 mb-1">
                            Capacity <span class="text-red-500">*</span>
                        </label>
                        <input type="number"
                            name="capacity"
                            id="capacity"
                            min="1"
                            value="{{ old('capacity', $classes->capacity) }}"
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none
                                    @error('capacity') border-red-500 @enderror"
                            placeholder="Enter number of students"
                            required>
                    </div>

                    <!-- Buttons -->
                    <div class="flex justify-between items-center pt-4 border-t">
                        <a href="{{url('/class-details')}}" class="px-5 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition"><i class="fa-solid fa-arrow-left-long me-3"></i> Cancel </a>

                        <button type="submit"
                                class="inline-flex items-center gap-2 px-6 py-2 bg-[#3F4D67] text-white rounded-lg shadow hover:bg-blue-700 transition"
                                onclick="return confirm('Are you sure you want to update this class?')">
                            <i class="fa-solid fa-floppy-disk"></i>
                            Update Class
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

</body>
</html>
