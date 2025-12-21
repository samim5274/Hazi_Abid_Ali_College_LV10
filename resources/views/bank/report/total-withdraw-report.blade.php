<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Diposit - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Bank Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/bank-diposit-view') }}">Diposit</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/bank-withdraw-view') }}">Withdraw</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/bank-setting') }}">Setting</a></li>
                        <li class="breadcrumb-item" aria-current="page">Date Report</li>
                    </ul>
                </div>
            </div>

            <!-- create bank start -->   
            <div class="max-w-full overflow-x-auto p-6 bg-white shadow-lg rounded-lg">
                <div class="flex items-center justify-between mb-4">
                    <!-- Left: Heading -->
                    <h2 class="text-2xl font-semibold text-gray-800 flex items-center gap-2">
                        <i class="fa-solid fa-money-bill-wave text-[#3F4D67]"></i>
                        Transection Report
                    </h2>
                </div>

                <!-- Deposit Table -->
                <div class="overflow-x-auto bg-white rounded-lg shadow-md">

                    <table class="min-w-full divide-y divide-gray-200 text-sm">

                        <!-- FILTER ROW -->
                        <thead class="bg-gray-50">
                            <tr>
                                <th colspan="5" class="p-5">
                                    <form action="{{ url('/filter-total-Withdraw-date') }}" method="GET" target="_blank"
                                        class="w-full flex flex-col md:flex-row items-end gap-4">

                                        <!-- Start Date -->
                                        <div class="w-full md:w-1/3">
                                            <label class="block text-xs font-semibold text-gray-600 mb-1">
                                                Start Date
                                            </label>
                                            <input type="date" name="start_date" id="start_date"
                                                value="{{ request('start_date') }}"
                                                class="w-full border border-gray-300 rounded-md px-3 py-2 focus:ring focus:ring-blue-200">
                                        </div>

                                        <!-- End Date -->
                                        <div class="w-full md:w-1/3">
                                            <label class="block text-xs font-semibold text-gray-600 mb-1">
                                                End Date
                                            </label>
                                            <input type="date" name="end_date" id="end_date"
                                                value="{{ request('end_date') }}"
                                                class="w-full border border-gray-300 rounded-md px-3 py-2 focus:ring focus:ring-blue-200">
                                        </div>

                                        <!-- bank details -->
                                        <div class="w-full md:w-1/3">
                                            <label class="block text-xs font-semibold text-gray-600 mb-1">
                                                Bank
                                            </label>
                                            <select name="cbxBankid" id="" class="w-full border border-gray-300 rounded-md px-3 py-2 focus:ring focus:ring-blue-200">
                                                <option selected disable>-- Select Bank Account --</option>
                                                @foreach($bankDetails as $val)
                                                <option value="{{ $val->id }}">{{ $val->bank_name }} - {{ $val->account_number }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Buttons -->
                                        <div class="w-full md:w-1/3 flex gap-3">
                                            <button type="submit"
                                                class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition">
                                                Filter
                                            </button>

                                            <button name="print" value="1"
                                            target="_blank"
                                            class="w-full text-center bg-green-600 text-white py-2 rounded-md hover:bg-green-700 transition">
                                                Print
                                            </button>
                                        </div>

                                    </form>
                                </th>
                            </tr>
                        </thead>

                        <!-- TABLE HEADER -->
                        <thead class="bg-[#3F4D67] text-white">
                            <tr>
                                <th class="px-6 py-3 text-left uppercase tracking-wider">#</th>
                                <th class="px-6 py-3 text-left uppercase tracking-wider">Date</th>
                                <th class="px-6 py-3 text-left uppercase tracking-wider">Bank</th>
                                <th class="px-6 py-3 text-left uppercase tracking-wider">Status</th>
                                <th class="px-6 py-3 text-right uppercase tracking-wider">Amount</th>
                            </tr>
                        </thead>

                        <!-- TABLE BODY -->
                        <tbody class="divide-y divide-gray-100">
                            @forelse($withdrawDetails as $deposit)
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="px-6 py-3">{{ $loop->iteration }}</td>

                                    <td class="px-6 py-3">
                                        {{ \Carbon\Carbon::parse($deposit->date)->format('d M, Y') }}
                                    </td>

                                    <td class="px-6 py-3">
                                        <span class="px-2 py-1 rounded-full text-xs font-semibold
                                            {{ $deposit->status == 'Deposit'
                                                ? 'text-green-700'
                                                : 'text-red-700' }}">
                                            {{ $deposit->bank->bank_name }}
                                        </span>
                                    </td>


                                    <td class="px-6 py-3">
                                        <span class="px-2 py-1 rounded-full text-xs font-semibold
                                            {{ $deposit->status == 'Deposit'
                                                ? 'bg-green-100 text-green-700'
                                                : 'bg-red-100 text-red-700' }}">
                                            {{ $deposit->status }}
                                        </span>
                                    </td>

                                    <td class="px-6 py-3 text-right">
                                        <span class="inline-flex items-center gap-1 px-2 py-1 rounded-full text-xs font-semibold
                                            {{ $deposit->status == 'Deposit'
                                                ? 'bg-green-100 text-green-700'
                                                : 'bg-red-100 text-red-700' }}">
                                            
                                            {{ $deposit->status == 'Deposit' ? '+' : '-' }}
                                            ৳ {{ number_format($deposit->amount, 2) }}
                                        </span>
                                    </td>

                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="px-6 py-6 text-center text-gray-400">
                                        No transactions found
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>

                        <!-- FOOTER -->
                        <tfoot class="bg-gray-100 font-semibold">
                            <tr>
                                <td colspan="4" class="px-6 py-4 text-right">
                                    Total
                                </td>
                                <td class="px-6 py-4 text-right text-green-700">
                                    ৳ {{ number_format($total, 2) }}/-
                                </td>
                            </tr>
                        </tfoot>

                    </table>
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

        const startDate = document.getElementById('start_date');
        const endDate   = document.getElementById('end_date');

        const today = new Date().toISOString().split('T')[0];

        // Set max today
        startDate.max = today;
        endDate.max   = today;

        // Auto select today if empty
        if (!startDate.value) startDate.value = today;
        if (!endDate.value) endDate.value = today;

        // Prevent end date before start date
        startDate.addEventListener('change', () => {
            endDate.min = startDate.value;
            if (endDate.value < startDate.value) {
                endDate.value = startDate.value;
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
