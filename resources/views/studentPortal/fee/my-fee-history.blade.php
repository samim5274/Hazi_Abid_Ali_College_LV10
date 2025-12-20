<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ Auth::guard('student')->user()->first_name }} {{ Auth::guard('student')->user()->last_name }} - {{ $company->name ?? "HAAC" }}</title>

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

<body>
    
    <!-- [ Sidebar Menu ] start -->
    @include('studentPortal.layouts.navbar')
    <!-- [ Sidebar Menu ] end -->
     
    <!-- [ Header Topbar ] start -->
    @include('studentPortal.layouts.header')
    <!-- [ Header ] end -->

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            <!-- Fee Payment History -->
            <div class="bg-white shadow-lg rounded-2xl overflow-hidden transition-shadow duration-300 hover:shadow-xl mt-8">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-bold text-gray-800">Fee Payment History</h3>
                    </div>










                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200 rounded-lg shadow-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Invoice / Details</th>
                                    <th class="px-6 py-3 text-end text-xs font-bold text-gray-500 uppercase tracking-wider">Status</th>
                                </tr>
                            </thead>

                            <tbody class="bg-white divide-y divide-gray-200">
                                @forelse($payments as $fee)
                                    <tr class="hover:bg-gray-50 transition-colors duration-200">

                                        <!-- Invoice / Payment Details -->
                                        <td class="px-6 py-4 text-sm text-indigo-700">
                                            <a href="{{ url('/student/invoice/'.$fee->id) }}" 
                                            class="block hover:text-indigo-900 hover:underline transition">
                                                <span class="font-medium">Invoice:</span> {{ $fee->invoice_no }} <br>
                                                <span class="font-medium">Payment Date:</span> {{ \Carbon\Carbon::parse($fee->payment_date)->format('d M, Y') }} <br>
                                                <span class="font-medium">Method:</span> {{ $fee->payment_method }} <br>
                                                <span class="font-medium">Amount Paid:</span> ৳ {{ number_format($fee->total_paid,2) }}
                                            </a>
                                        </td>

                                        <!-- Status + Print -->
                                        <td class="px-6 py-4 text-end flex items-end justify-end gap-2">
                                            @php
                                                $statusClass = match(strtolower($fee->status)) {
                                                    'paid' => 'bg-green-100 text-green-700',
                                                    'partial' => 'bg-yellow-100 text-yellow-700',
                                                    'due' => 'bg-red-100 text-red-700',
                                                    default => 'bg-gray-100 text-gray-700',
                                                };
                                            @endphp
                                            <span class="px-3 py-1 rounded-full text-xs font-semibold {{ $statusClass }}">
                                                {{ ucfirst($fee->status) }}
                                            </span>

                                            <a href="{{ url('/print-pay-invoice/'. $fee->receipt_no) }}" target="_blank"
                                            class="inline-flex items-center justify-center px-2 py-1 bg-gray-100 rounded hover:bg-gray-200 text-blue-500 hover:text-blue-700 transition text-sm">
                                                <i class="fa-solid fa-print"></i>
                                            </a>
                                        </td>

                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="2" class="px-6 py-4 text-center text-gray-400 text-sm">
                                            No payment history available
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>









                    <!-- <div class="overflow-x-auto">
                        <table class="min-w-full border-collapse shadow-sm rounded-lg overflow-hidden">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Purpose</th>
                                    <th class="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Amount</th>
                                    <th class="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Discount</th>
                                    <th class="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Paid</th>
                                    <th class="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Due</th>
                                    <th class="px-6 py-3 text-center text-xs font-bold text-gray-500 uppercase tracking-wider">Status</th>
                                </tr>
                            </thead>

                            <tbody class="divide-y divide-gray-200">
                                @php
                                    $totalAmount = 0;
                                    $totalDiscount = 0;
                                    $totalPaid = 0;
                                    $totalDue = 0;
                                @endphp

                                @forelse($payments as $key => $fee)                                    
                                    @php
                                        $totalAmount += $fee->total_amount;
                                        $totalDiscount += $fee->total_discount;
                                        $totalPaid += $fee->total_paid;
                                        $totalDue += $fee->total_due;
                                    @endphp
                                @empty
                                    <tr>
                                        <td colspan="7" class="px-6 py-4 text-center text-gray-400 text-sm">
                                            No payment history available
                                        </td>
                                    </tr>
                                @endforelse

                                @if($payments->isNotEmpty())
                                    <tr class="bg-gray-100 font-bold text-gray-800 border-t">
                                        <td colspan="" class="px-6 py-4 text-right">Total:</td>

                                        <td class="px-6 py-4 text-right">
                                            ৳ {{ number_format($totalAmount, 2) }}
                                        </td>

                                        <td class="px-6 py-4 text-right">
                                            ৳ {{ number_format($totalDiscount, 2) }}
                                        </td>

                                        <td class="px-6 py-4 text-right">
                                            ৳ {{ number_format($totalPaid, 2) }}
                                        </td>

                                        <td class="px-6 py-4 text-right">
                                            ৳ {{ number_format($totalDue, 2) }}
                                        </td>
                                        <td></td>
                                    </tr>
                                @endif
                            </tbody>
                        </table>
                    </div> -->
                    <!-- paginatior -->















                    @if ($payments->hasPages())
                        <div class="flex flex-wrap items-center justify-center mt-4 space-x-2">

                            {{-- Previous Button --}}
                            @if ($payments->onFirstPage())
                                <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                    &laquo;
                                </span>
                            @else
                                <a href="{{ $payments->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                    &laquo;
                                </a>
                            @endif

                            {{-- Page Numbers --}}
                            @php
                                $start = max(2, $payments->currentPage() - 2);
                                $end = min($payments->lastPage(), $payments->currentPage() + 2);
                            @endphp

                            @for ($i = $start; $i <= $end; $i++)
                                @if ($i == $payments->currentPage())
                                    <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                                @else
                                    <a href="{{ $payments->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                                @endif
                            @endfor

                            {{-- Next Button --}}
                            @if ($payments->hasMorePages())
                                <a href="{{ $payments->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                    &raquo;
                                </a>
                            @else
                                <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                    &raquo;
                                </span>
                            @endif
                        </div>
                    @endif
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

    <script> layout_change('false'); </script>
    <script> layout_theme_sidebar_change('dark'); </script>
    <script> change_box_container('false'); </script>
    <script> layout_caption_change('true'); </script>
    <script> layout_rtl_change('false'); </script>
    <script> preset_change('preset-1'); </script>
    <script> main_layout_change('vertical'); </script>

</body>
</html>
