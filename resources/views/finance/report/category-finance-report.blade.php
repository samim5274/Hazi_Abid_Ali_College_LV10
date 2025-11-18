<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance - (SMS)</title>

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

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Fee Payment</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page"><a href="{{url('/finance-fee-payment')}}">Finance Payment</a></li>
                        <li class="breadcrumb-item" aria-current="page"><a href="{{url('/student-finance-report')}}">Finance Student Report</a></li>
                        <li class="breadcrumb-item" aria-current="page">Fee Category Report</li>
                    </ul>
                </div>
            </div>

            <div class="card rounded-md border shadow-md">
                <div class="card-body">
                    @php
                        $today = date('Y-m-d');
                    @endphp

                    <form action="{{url('/find-category-payment-report')}}" method="GET" class="p-4">
                        @csrf
                        <div class="grid md:grid-cols-2 gap-6">

                            {{-- Start Date --}}
                            <div class="flex flex-col">
                                <label for="start_date" class="text-sm font-medium text-gray-700 mb-1">Start Date</label>
                                <input type="date" 
                                    name="start_date" 
                                    id="start_date"
                                    value="{{ $today }}"
                                    max="{{ $today }}"
                                    class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none">
                            </div>

                            {{-- End Date --}}
                            <div class="flex flex-col">
                                <label for="end_date" class="text-sm font-medium text-gray-700 mb-1">End Date</label>
                                <input type="date" 
                                    name="end_date" 
                                    id="end_date"
                                    value="{{ $today }}"
                                    max="{{ $today }}" 
                                    required
                                    class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none">
                            </div>

                        </div>   

                        <div class="flex flex-col mt-4">
                            <label for="Category_id" class="text-sm font-medium text-gray-700 mb-1">Category</label>
                            <select name="Category_id" id="Category_id" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                <option disabled selected>-- Select Category --</option>  
                                @foreach($category as $cat)                                  
                                <option value="{{$cat->id}}">{{$cat->name}}</option>
                                @endforeach
                            </select>
                        </div> 
                        
                        {{-- Submit Button --}}
                        <div class="flex items-end mt-6">
                            <button type="submit" 
                                class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg text-md font-medium shadow hover:bg-[#3F4D67] transition w-full">
                                Search
                            </button>
                        </div>

                    </form>

                </div>
             </div>

            <!-- Fee Payment List -->
            <div class="mt-6 bg-white p-6 rounded-lg shadow-md">
                <h6 class="text-lg font-semibold mb-4">Category Fee Payments</h6>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="text-center">#</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Student</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Fee Structure</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Payment Date</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Discount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Due</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Amount Paid</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach($feePayment as $val)
                            <tr>
                                <td class="text-center">{{ $loop->iteration }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                    {{ $val->student->first_name }} {{ $val->student->last_name }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    {{ $val->feeStructure->category->name }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    {{ \Carbon\Carbon::parse($val->payment_date)->format('d M Y') }}
                                </td>                                
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-blue-500 font-semibold">
                                    ৳{{ number_format($val->discount, 2) }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-red-500 font-semibold">
                                    ৳{{ number_format($val->due_amount, 2) }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-md text-gray-900">
                                    ৳{{ number_format($val->amount_paid, 2) }}
                                </td>
                            </tr>
                            @endforeach
                            <tr>
                                <td colspan="4">Total:</td>
                                <td>৳{{$discount}}/-</td>
                                <td>৳{{$due}}/-</td>
                                <td>৳{{$total}}/-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- paginatior -->
                @if ($feePayment->hasPages())
                    <div class="flex flex-wrap items-center justify-center mt-4 space-x-2">

                        {{-- Previous Button --}}
                        @if ($feePayment->onFirstPage())
                            <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                &laquo;
                            </span>
                        @else
                            <a href="{{ $feePayment->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                &laquo;
                            </a>
                        @endif

                        {{-- Page Numbers --}}
                        @php
                            $start = max(2, $feePayment->currentPage() - 2);
                            $end = min($feePayment->lastPage(), $feePayment->currentPage() + 2);
                        @endphp

                        @for ($i = $start; $i <= $end; $i++)
                            @if ($i == $feePayment->currentPage())
                                <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                            @else
                                <a href="{{ $feePayment->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                            @endif
                        @endfor

                        {{-- Next Button --}}
                        @if ($feePayment->hasMorePages())
                            <a href="{{ $feePayment->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
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
