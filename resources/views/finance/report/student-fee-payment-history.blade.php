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
                        <h5 class="mb-1 font-semibold text-gray-800">Fee Payment History</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page"><a href="{{url('/finance-fee-payment')}}">Finance Payment</a></li>
                        <li class="breadcrumb-item" aria-current="page">Fee Payment Hisotry</li>
                    </ul>
                </div>
            </div>

            <!-- Fee Payment List -->
            <div class="max-w-5xl mx-auto mt-8">

                <!-- 🔍 Search Card -->
                <div class="bg-white p-6 rounded-xl shadow-md border border-gray-200">
                    <h2 class="text-lg font-semibold text-gray-800 mb-4">
                        Find Payment History
                    </h2>

                    <form action="{{ url('/find-payment-history') }}" method="GET">
                        @csrf
                        <div class="grid md:grid-cols-2 gap-4 items-end">
                            <div>
                                <label for="invoice_id" class="text-sm font-medium text-gray-600 mb-1 block">
                                    Invoice / Receipt No
                                </label>
                                <input type="text"
                                    name="txtSearch"
                                    id="invoice_id"
                                    required
                                    placeholder="Enter Invoice or Receipt Number"
                                    class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-[#3F4D67] focus:outline-none">
                            </div>

                            <div>
                                <button type="submit"
                                    class="w-full bg-[#3F4D67] text-white px-4 py-2 rounded-lg font-medium shadow hover:bg-[#2f3b50] transition">
                                    <i class="fa-solid fa-magnifying-glass mr-2"></i>
                                    Find Payment
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                @if(isset($data))
                <div class="bg-white shadow-xl rounded-xl border border-gray-200 p-6 mt-8">

                    <!-- Header -->
                    <div class="flex justify-between items-center border-b pb-4 mb-6">
                        <div>
                            <h2 class="text-xl font-bold text-gray-800">
                                Payment Invoice Summary
                            </h2>
                            <p class="text-sm text-gray-500 mt-1">
                                Invoice:
                                <span class="font-medium text-gray-700">{{ $data->invoice_no }}</span>
                                |
                                Receipt:
                                <span class="font-medium text-gray-700">{{ $data->receipt_no }}</span>
                            </p>
                        </div>

                        <span class="px-4 py-1 rounded-full text-sm font-medium
                            {{ $data->total_due > 0 ? 'bg-yellow-100 text-yellow-700' : 'bg-green-100 text-green-700' }}">
                            {{ $data->total_due > 0 ? 'Partially Paid' : 'Fully Paid' }}
                        </span>
                    </div>

                    <!-- Student & Payment Info -->
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                        <div>
                            <p class="text-xs text-gray-500 uppercase">Student</p>
                            <p class="font-semibold text-gray-800">
                                {{ $date->student->roll_number }} - {{ $data->student->first_name }} {{ $data->student->last_name }}
                            </p>
                        </div>

                        <div>
                            <p class="text-xs text-gray-500 uppercase">Payment Date</p>
                            <p class="font-semibold text-gray-800">
                                {{ \Carbon\Carbon::parse($data->payment_date)->format('d M Y') }}
                            </p>
                        </div>

                        <div>
                            <p class="text-xs text-gray-500 uppercase">Processed By</p>
                            <p class="font-semibold text-gray-800">
                                {{ $data->teacher->first_name ?? 'N/A' }}
                                {{ $data->teacher->last_name ?? '' }}
                            </p>
                        </div>
                    </div>

                    <!-- Amount Cards -->
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-5 text-center mb-8">

                        <div class="bg-blue-50 border border-blue-100 rounded-xl p-4">
                            <p class="text-xs text-gray-500">Total Amount</p>
                            <p class="text-xl font-bold text-blue-600">
                                ৳{{ number_format($data->total_amount,2) }}
                            </p>
                        </div>

                        <div class="bg-red-50 border border-red-100 rounded-xl p-4">
                            <p class="text-xs text-gray-500">Discount</p>
                            <p class="text-xl font-bold text-red-600">
                                ৳{{ number_format($data->total_discount,2) }}
                            </p>
                        </div>

                        <div class="bg-green-50 border border-green-200 rounded-xl p-4">
                            <p class="text-xs text-gray-500">Paid</p>
                            <p class="text-xl font-bold text-green-700">
                                ৳{{ number_format($data->total_paid,2) }}
                            </p>
                        </div>

                        <div class="bg-yellow-50 border border-yellow-200 rounded-xl p-4">
                            <p class="text-xs text-gray-500">Due</p>
                            <p class="text-xl font-bold text-yellow-700">
                                ৳{{ number_format($data->total_due,2) }}
                            </p>
                        </div>

                    </div>

                    <!-- Action Buttons -->
                    <div class="flex justify-end gap-3 border-t pt-4">
                        <a href="{{ url('/fee-payment-show/'.$data->id) }}"
                        class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition">
                            <i class="fa-solid fa-eye mr-1"></i> Details
                        </a>

                        <a href="{{ url('/print-pay-invoice/'.$data->receipt_no) }}"
                        target="_blank"
                        class="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition">
                            <i class="fa-solid fa-print mr-1"></i> Print
                        </a>
                    </div>

                </div>
                @endif

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
