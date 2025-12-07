<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expenses - (SMS)</title>

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

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Expense Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/expense">Expense</a></li>
                        <li class="breadcrumb-item" aria-current="page">Expense-{{ $expense->title }}</li>
                    </ul>
                </div>
            </div>           

            <!-- Expense Board List --> 
            <div class="max-w-4xl mx-auto py-10">

                <!-- Page Title -->
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">Expense Details</h2>
                    <a href="{{ url()->previous() }}"
                        class="bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-gray-700 transition">
                        <i class="fa-solid fa-arrow-left-long me-3"></i> Back
                    </a>
                </div>

                <!-- Card -->
                <div class="bg-white shadow-xl rounded-2xl overflow-hidden">

                    <!-- Header -->
                    <div class="bg-gradient-to-r from-blue-600 to-indigo-600 p-6 text-white">
                        <h3 class="text-xl font-semibold text-white">{{ $expense->title }}</h3>
                        <p class="text-sm opacity-90">
                            Added on {{ \Carbon\Carbon::parse($expense->date)->format('d M, Y') }}
                            and Created by 
                            <span class="font-semibold">
                                {{ $expense->user->first_name ?? 'System' }}
                                {{ $expense->user->last_name ?? '' }}
                            </span>
                        </p>

                    </div>

                    <!-- Body -->
                    <div class="p-6 grid grid-cols-1 md:grid-cols-2 gap-6">

                        <!-- Category -->
                        <div>
                            <p class="text-xs text-gray-500 uppercase">Category</p>
                            <p class="text-lg font-semibold text-gray-800">
                                {{ $expense->category->name ?? 'N/A' }}
                            </p>
                        </div>

                        <!-- Sub Category -->
                        <div>
                            <p class="text-xs text-gray-500 uppercase">Sub Category</p>
                            <p class="text-lg font-semibold text-gray-800">
                                {{ $expense->subcategory->name ?? 'N/A' }}
                            </p>
                        </div>

                        <!-- Amount -->
                        <div>
                            <p class="text-xs text-gray-500 uppercase">Amount</p>
                            <p class="text-2xl font-bold text-green-600">
                                ৳ {{ number_format($expense->amount, 2) }}
                            </p>
                        </div>

                        <!-- Date -->
                        <div>
                            <p class="text-xs text-gray-500 uppercase">Expense Date</p>
                            <p class="text-lg font-semibold text-gray-800">
                                {{ \Carbon\Carbon::parse($expense->date)->format('d M, Y') }}
                            </p>
                        </div>

                        <!-- Note -->
                        <div class="md:col-span-2">
                            <p class="text-xs text-gray-500 uppercase">Note / Description</p>
                            <div class="mt-2 p-4 bg-gray-50 rounded-lg border text-gray-700">
                                {{ $expense->remark ?? 'No description provided.' }}
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <div class="bg-gray-100 px-6 py-4 flex justify-end gap-3">
                        <a href="{{ url('/expenses-edit/'.$expense->id) }}"
                            class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">
                            <i class="fa-solid fa-pen-to-square"></i> Edit
                        </a>
                        <a href="{{ url('/expenses-print/'.$expense->id) }}" target="_blank"
                            class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">
                            <i class="fa-solid fa-print"></i> Print
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
