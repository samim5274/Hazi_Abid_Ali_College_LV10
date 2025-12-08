<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expenses Report - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Expense Report</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/expense') }}">Expense</a></li>
                        <li class="breadcrumb-item" aria-current="page">Date wise Expense Report</li>
                    </ul>
                </div>
            </div>     
            

            <!-- Expense Board List --> 
            <div class="bg-white rounded-xl shadow overflow-x-auto">
                <form method="GET" action="{{ url('/expenses-data-filter') }}" class="w-full bg-gray-50 p-6 rounded-lg shadow-md" target="_blank">
                    <div class="flex flex-col md:flex-row md:items-end md:justify-between w-full gap-4">

                        @php
                            $today = date('Y-m-d'); // Current date in YYYY-MM-DD format
                        @endphp

                        <!-- From Date -->
                        <div class="flex flex-col flex-1">
                            <input type="date" id="from_date" name="from_date" max="{{ $today }}" value="{{ request('from_date') ?? $today }}" 
                                class="w-full border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-400 focus:outline-none shadow-sm">
                        </div>

                        <!-- To Date -->
                        <div class="flex flex-col flex-1">
                            <input type="date" id="to_date" name="to_date" max="{{ $today }}" value="{{ request('from_date') ?? $today }}" 
                                class="w-full border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-400 focus:outline-none shadow-sm">
                        </div>

                        <!-- Buttons -->
                        <div class="flex flex-col md:flex-row gap-2 mt-4 md:mt-0">
                            <!-- Filter Button -->
                            <button type="submit" 
                                    class="flex items-center gap-2 bg-blue-600 text-white px-3 py-1.5 rounded-lg hover:bg-blue-700 transition text-sm font-medium shadow-sm">
                                <i class="fa-solid fa-filter"></i>
                                Filter
                            </button>

                            <!-- Print Button -->
                            <button type="submit" name="print" value="1"
                                    class="flex items-center gap-2 bg-green-600 text-white px-3 py-1.5 rounded-lg hover:bg-green-700 transition text-sm font-medium shadow-sm">
                                <i class="fa-solid fa-print"></i>
                                Print
                            </button>
                        </div>


                    </div>
                </form>
                <table class="min-w-full divide-y divide-gray-200">
                    <!-- Table Headers -->
                    <thead class="bg-gray-100">
                        <tr>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase border-b">#</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase border-b">Title</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase border-b">Category</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase border-b">Sub Category</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase border-b">Amount</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase border-b">Date</th>
                            <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase border-b">Action</th>
                        </tr>
                    </thead>


                    <tbody class="divide-y divide-gray-100">

                        @forelse($expenses as $key => $val)
                        <tr class="hover:bg-gray-50 transition">

                            <!-- SL -->
                            <td class="px-4 py-3 text-sm text-gray-700">
                                {{ $key + 1 }}
                            </td>

                            <!-- Title -->
                            <td class="px-4 py-3 text-sm font-medium text-gray-900">
                                {{ $val->title }}
                            </td>

                            <!-- Category -->
                            <td class="px-4 py-3 text-sm text-gray-700">
                                {{ $val->category->name ?? 'N/A' }}
                            </td>

                            <!-- Sub Category -->
                            <td class="px-4 py-3 text-sm text-gray-700">
                                {{ $val->subcategory->name ?? 'N/A' }}
                            </td>

                            <!-- Amount -->
                            <td class="px-4 py-3 text-sm font-semibold text-gray-900">
                                ৳ {{ number_format($val->amount, 2) }}
                            </td>

                            <!-- Date -->
                            <td class="px-4 py-3 text-sm text-gray-700">
                                {{ \Carbon\Carbon::parse($val->date)->format('d M, Y') }}
                            </td>

                            <!-- Action -->
                            <td class="px-4 py-3 text-center flex justify-center gap-3">

                                <!-- View -->
                                <a href="{{ url('/expenses-view/'. $val->id) }}"  class="text-blue-600 hover:text-blue-800">
                                    <i class="fa-solid fa-eye"></i>
                                </a>


                                <!-- print -->
                                 <a href="{{ url('/expenses-print/'.$val->id) }}" target="_blank" class="text-blue-600 hover:text-blue-800">
                                    <i class="fa-solid fa-print"></i>
                                </a>

                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="9" class="text-center py-6 text-gray-500">
                                No expenses found.
                            </td>
                        </tr>
                        @endforelse
                        <tr>
                            <td colspan="4" class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase">Total:</td>
                            <td class="px-4 py-3 text-xs font-semibold text-gray-600 uppercase">৳{{ $expenses->sum('amount') }}/-</td>
                            <td colspan="2"></td>
                        </tr>

                    </tbody>
                </table>

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
