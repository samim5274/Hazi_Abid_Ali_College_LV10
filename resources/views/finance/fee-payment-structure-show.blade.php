<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Payment History</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/finance-fee-payment">Finance</a></li>
                        <li class="breadcrumb-item" aria-current="page">Fee Payment History</li>
                    </ul>
                </div>
            </div>

            <div class="max-w-5xl mx-auto bg-white rounded-2xl border border-gray-200 shadow-sm mt-10">
                {{-- Header --}}
                <div class="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between px-8 py-6 border-b border-gray-200">
                    <div class="flex items-start gap-3">
                        <div class="h-10 w-10 rounded-xl bg-emerald-50 text-emerald-700 flex items-center justify-center">
                            <i class="fa-solid fa-money-check-dollar"></i>
                        </div>

                        <div>
                            <h2 class="text-xl sm:text-2xl font-bold text-gray-900 leading-tight">
                                Record Fee Payment
                            </h2>
                            <p class="text-sm text-gray-600 mt-1">
                                {{ $payment->student->first_name ?? '' }} {{ $payment->student->last_name ?? '' }}
                                @if(!empty($payment->student->roll_number))
                                    <span class="text-gray-400">•</span> Roll: {{ $payment->student->roll_number }}
                                @endif
                            </p>
                        </div>
                    </div>

                    {{-- Status --}}
                    @php
                        $paid = strtolower($payment->status ?? '') === 'paid';
                    @endphp
                    <span class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full text-sm font-semibold
                        {{ $paid ? 'bg-emerald-50 text-emerald-700 ring-1 ring-emerald-200' : 'bg-amber-50 text-amber-700 ring-1 ring-amber-200' }}">
                        <span class="h-2 w-2 rounded-full {{ $paid ? 'bg-emerald-600' : 'bg-amber-600' }}"></span>
                        {{ ucfirst($payment->status ?? 'N/A') }}
                    </span>
                </div>

                {{-- Body --}}
                <div class="p-8">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        {{-- Student Info --}}
                        <div class="bg-gray-50 rounded-2xl border border-gray-200">
                            <div class="px-6 py-4 border-b border-gray-200 flex items-center justify-between">
                                <h4 class="text-sm font-semibold text-gray-800">Student Information</h4>
                                <span class="text-xs px-2.5 py-1 rounded-full bg-white border border-gray-200 text-gray-600">
                                    Student
                                </span>
                            </div>

                            <div class="p-6">
                                <dl class="space-y-3 text-sm">
                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Invoice No</dt>
                                        <dd class="text-gray-900 font-semibold text-right break-all">
                                            {{ $payment->invoice_no ?? 'N/A' }}
                                        </dd>
                                    </div>

                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Name</dt>
                                        <dd class="text-gray-800 text-right break-words">
                                            {{ $payment->student->first_name ?? '' }} {{ $payment->student->last_name ?? '' }}
                                        </dd>
                                    </div>

                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Roll</dt>
                                        <dd class="text-gray-800 text-right">
                                            {{ $payment->student->roll_number ?? 'N/A' }}
                                        </dd>
                                    </div>

                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Class</dt>
                                        <dd class="text-gray-800 text-right">
                                            {{ $payment->student->room->name ?? 'N/A' }}
                                            @if(!empty($payment->student->room->section))
                                                <span class="text-gray-500">({{ $payment->student->room->section }})</span>
                                            @endif
                                        </dd>
                                    </div>

                                    <div class="pt-3 border-t border-gray-200 flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Total</dt>
                                        <dd class="text-gray-900 font-bold text-right">
                                            ৳{{ number_format($payment->total_amount ?? 0, 2) }}
                                        </dd>
                                    </div>
                                </dl>
                            </div>
                        </div>

                        {{-- Payment Info --}}
                        <div class="bg-gray-50 rounded-2xl border border-gray-200">
                            <div class="px-6 py-4 border-b border-gray-200 flex items-center justify-between">
                                <h4 class="text-sm font-semibold text-gray-800">Payment Information</h4>
                                <span class="text-xs px-2.5 py-1 rounded-full bg-emerald-50 text-emerald-700">
                                    {{ strtoupper($payment->payment_method ?? 'N/A') }}
                                </span>
                            </div>

                            <div class="p-6">
                                <dl class="space-y-3 text-sm">
                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Receipt No</dt>
                                        <dd class="text-gray-900 font-semibold text-right break-all">
                                            {{ $payment->receipt_no ?? 'N/A' }}
                                        </dd>
                                    </div>

                                    {{-- ✅ Fix: payment_date যদি string হয়, optional()->format কাজ করবে না --}}
                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Date</dt>
                                        <dd class="text-gray-800 text-right">
                                            {{ !empty($payment->payment_date) ? \Carbon\Carbon::parse($payment->payment_date)->format('d M Y') : 'N/A' }}
                                        </dd>
                                    </div>

                                    {{-- ✅ Month name --}}
                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Pay For</dt>
                                        <dd class="text-gray-800 text-right">
                                            {{ \Carbon\Carbon::createFromDate($payment->year, $payment->month, 1)->format('F Y') }}
                                        </dd>
                                    </div>

                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Method</dt>
                                        <dd class="text-gray-800 text-right">
                                            {{ strtoupper($payment->payment_method ?? 'N/A') }}
                                        </dd>
                                    </div>

                                    <div class="flex items-start justify-between gap-4">
                                        <dt class="text-gray-500 font-medium w-28 shrink-0">Handled By</dt>
                                        <dd class="text-gray-800 text-right">
                                            {{ $payment->teacher->first_name ?? 'N/A' }} {{ $payment->teacher->last_name ?? '' }}
                                        </dd>
                                    </div>
                                </dl>
                            </div>
                        </div>

                    </div>
                </div>
            </div>




            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 mt-8">

                <!-- Total Amount -->
                <div class="relative overflow-hidden rounded-2xl bg-white border shadow-sm p-5">
                    <p class="text-xs uppercase tracking-wide text-gray-500">Total Amount</p>
                    <p class="text-2xl font-bold text-gray-800 mt-2">
                        ৳{{ number_format($payment->total_amount, 2) }}
                    </p>
                </div>

                <!-- Total Paid -->
                <div class="relative overflow-hidden rounded-2xl bg-white border shadow-sm p-5">
                    <p class="text-xs uppercase tracking-wide text-green-600">Total Paid</p>
                    <p class="text-2xl font-bold text-green-700 mt-2">
                        ৳{{ number_format($payment->total_paid, 2) }}
                    </p>
                </div>

                <!-- Total Discount -->
                <div class="relative overflow-hidden rounded-2xl bg-white border shadow-sm p-5">
                    <p class="text-xs uppercase tracking-wide text-blue-600">Total Discount</p>
                    <p class="text-2xl font-bold text-blue-700 mt-2">
                        ৳{{ number_format($payment->total_discount, 2) }}
                    </p>
                </div>

                <!-- Total Due -->
                <div class="relative overflow-hidden rounded-2xl bg-white border shadow-sm p-5">
                    <p class="text-xs uppercase tracking-wide text-red-600">Total Due</p>
                    <p class="text-2xl font-bold text-red-700 mt-2">
                        ৳{{ number_format($payment->total_due, 2) }}
                    </p>
                </div>

            </div>



            

            <div class="overflow-x-auto mb-8 mt-8">
                <table class="min-w-full border rounded-lg overflow-hidden">

                    <thead class="bg-gray-100">
                        <tr>
                            <th class="px-4 py-2 text-left text-xs text-gray-600">#</th>
                            <th class="px-4 py-2 text-left text-xs text-gray-600">Category</th>
                            <th class="px-4 py-2 text-right text-xs text-gray-600">Amount</th>
                            <th class="px-4 py-2 text-right text-xs text-gray-600">Paid</th>
                            <th class="px-4 py-2 text-right text-xs text-gray-600">Discount</th>
                            <th class="px-4 py-2 text-right text-xs text-gray-600">Due</th>
                        </tr>
                    </thead>

                    <tbody class="bg-white divide-y">
                        @foreach($payment->items as $item)
                            <tr>
                                <td class="px-4 py-2 text-sm">{{ $loop->iteration }}</td>
                                <td class="px-4 py-2 text-sm">
                                    {{ $item->feeStructure->category->name ?? 'N/A' }}
                                </td>
                                <td class="px-4 py-2 text-sm text-right">
                                    ৳{{ number_format($item->amount, 2) }}
                                </td>
                                <td class="px-4 py-2 text-sm text-green-600 font-semibold text-right">
                                    ৳{{ number_format($item->paid, 2) }}
                                </td>
                                <td class="px-4 py-2 text-sm text-blue-600 font-semibold text-right">
                                    ৳{{ number_format($item->discount, 2) }}
                                </td>
                                <td class="px-4 py-2 text-sm text-red-600 font-semibold text-right">
                                    ৳{{ number_format($item->due, 2) }}
                                </td>
                            </tr>
                        @endforeach
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
