<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Income - {{ $company->name }}</title>

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
    <link rel="stylesheet" href="{{ asset('plugins/simplebar.min.css') }}">

    <!-- Vite (Tailwind last to avoid override) -->
    @vite('resources/css/app.css')
    @vite('resources/js/app.js')

    <meta name="csrf-token" content="{{ csrf_token() }}">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <h5 class="mb-1 font-semibold text-gray-800">Income Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/income') }}">Income</a></li>
                        <li class="breadcrumb-item" aria-current="page">Setting</li>
                    </ul>
                </div>
            </div>
            <!-- Income Board List --> 
            <div class="max-w-4xl mx-auto py-10">

                <!-- Card Container -->
                <div class="bg-white shadow-xl rounded-2xl overflow-hidden">

                    <!-- Page Title -->
                    <div class="flex justify-between items-center border-b px-6 py-4">
                        <h2 class="text-2xl font-bold text-gray-800">Income Details</h2>
                        <a href="{{ url()->previous() }}"
                        class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg hover:bg-gray-700 transition flex items-center gap-2">
                            <i class="fa-solid fa-arrow-left-long"></i> Back
                        </a>
                    </div>

                    <!-- Header -->
                    <div class="p-6">
                        <h3 class="text-2xl font-semibold">{{ $income->title }}</h3>
                        <p class="text-sm opacity-90 mt-1">
                            Added on {{ \Carbon\Carbon::parse($income->income_date)->format('d M, Y') }} 
                            by <span class="font-semibold">{{ $income->user->first_name ?? 'System' }} {{ $income->user->last_name ?? '' }}</span>
                        </p>
                    </div>

                    <!-- Body -->
                    <div class="p-6 grid grid-cols-1 md:grid-cols-2 gap-6">

                        <!-- Category -->
                        <div class="bg-gray-50 rounded-lg p-4 border">
                            <p class="text-xs text-gray-500 uppercase">Category</p>
                            <p class="text-lg font-semibold text-gray-800 mt-1">{{ $income->category->name ?? 'N/A' }}</p>
                        </div>

                        <!-- Sub Category -->
                        <div class="bg-gray-50 rounded-lg p-4 border">
                            <p class="text-xs text-gray-500 uppercase">Sub Category</p>
                            <p class="text-lg font-semibold text-gray-800 mt-1">{{ $income->subcategory->name ?? 'N/A' }}</p>
                        </div>

                        <!-- Amount -->
                        <div class="bg-gray-50 rounded-lg p-4 border">
                            <p class="text-xs text-gray-500 uppercase">Amount</p>
                            <p class="text-2xl font-bold text-green-600 mt-1">৳ {{ number_format($income->amount, 2) }}</p>
                        </div>

                        <!-- Income Date -->
                        <div class="bg-gray-50 rounded-lg p-4 border">
                            <p class="text-xs text-gray-500 uppercase">Income Date</p>
                            <p class="text-lg font-semibold text-gray-800 mt-1">{{ \Carbon\Carbon::parse($income->income_date)->format('d M, Y') }}</p>
                        </div>

                        <!-- Description / Remarks -->
                        <div class="md:col-span-2 bg-gray-50 rounded-lg p-4 border">
                            <p class="text-xs text-gray-500 uppercase">Note / Description</p>
                            <p class="mt-2 text-gray-700">{{ $income->description ?? 'No description provided.' }}</p>
                        </div>
                    </div>

                    <!-- Footer -->
                    <div class="bg-gray-100 px-6 py-4 flex justify-end gap-3">
                        <a href="{{ url('/income-edit/'.$income->id) }}"
                        class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition flex items-center gap-2">
                        <i class="fa-solid fa-pen-to-square"></i> Edit
                        </a>
                        <a href="{{ url('/income-print/'.$income->id) }}" target="_blank"
                        class="bg-gray-800 text-white px-4 py-2 rounded-lg hover:bg-gray-700 transition flex items-center gap-2">
                        <i class="fa-solid fa-print"></i> Print
                        </a>
                        <a href="{{ url('/income-delete/'.$income->id) }}"
                        class="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition flex items-center gap-2"
                        onclick="confirm('Are you sure to delete this income?');">
                        <i class="fa-solid fa-trash"></i> Delete
                        </a>
                    </div>

                </div>

            </div>


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
