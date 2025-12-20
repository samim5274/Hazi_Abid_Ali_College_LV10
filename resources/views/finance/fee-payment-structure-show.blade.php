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

            <div class="max-w-4xl mx-auto bg-white shadow-md rounded-2xl p-8 mt-10 border border-gray-100">

                <div class="flex items-center justify-between mb-8">
                    <h2 class="text-2xl font-bold text-gray-800 flex items-center">
                        <i class="fa-solid fa-money-check-dollar mr-3 text-green-600"></i>
                        <small>Record Fee Payment </small> ({{ $payment->student->first_name }} {{ $payment->student->last_name }})
                    </h2>

                    <span class="px-4 py-1 rounded-full text-sm font-semibold
                        {{ $payment->status === 'paid' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700' }}">
                        {{ ucfirst($payment->status) }}
                    </span>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <div class="border border-gray-200 rounded-xl p-5 bg-gray-50">
                        <h4 class="text-sm font-semibold text-gray-600 mb-4">Student Information</h4>

                        <div class="space-y-2 text-sm text-gray-700">
                            <p>
                                <span class="font-semibold w-24 inline-block">Name:</span>
                                {{ $payment->student->first_name ?? '' }}
                                {{ $payment->student->last_name ?? '' }}
                            </p>

                            <p>
                                <span class="font-semibold w-24 inline-block">Roll:</span>
                                {{ $payment->student->roll_number ?? 'N/A' }}
                            </p>

                            <p>
                                <span class="font-semibold w-24 inline-block">Class:</span>
                                {{ $payment->student->room->name ?? 'N/A' }}
                            </p>

                            <p>
                                <span class="font-semibold w-24 inline-block">Total:</span>
                                ৳{{ number_format($payment->total_amount ?? 'N/A') }}
                            </p>
                        </div>
                    </div>

                    <div class="border border-gray-200 rounded-xl p-5 bg-gray-50">
                        <h4 class="text-sm font-semibold text-gray-600 mb-4">Payment Information</h4>

                        <div class="space-y-2 text-sm text-gray-700">
                            <p>
                                <span class="font-semibold w-28 inline-block">Date:</span>
                                {{ optional($payment->payment_date)->format('d M Y') }}
                            </p>

                            <p>
                                <span class="font-semibold w-28 inline-block">Method:</span>
                                {{ strtoupper($payment->payment_method) }}
                            </p>

                            <p>
                                <span class="font-semibold w-28 inline-block">Invoice:</span>
                                {{ $payment->invoice_no }}
                            </p>

                            <p>
                                <span class="font-semibold w-28 inline-block">Receipt:</span>
                                {{ $payment->receipt_no }}
                            </p>
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
