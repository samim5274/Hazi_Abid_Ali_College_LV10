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
                        <h5 class="mb-1 font-semibold text-gray-800">Fee Payment</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page"><a href="{{url('/finance-fee-payment')}}">Finance Payment</a></li>
                        <li class="breadcrumb-item" aria-current="page"><a href="{{url('/student-finance-report')}}">Finance Student Report</a></li>
                        <li class="breadcrumb-item" aria-current="page">Due Collection</li>
                    </ul>
                </div>
            </div>

            <div class="card rounded-md border shadow-md">
                <div class="card-body">
                    @php
                        $today = date('Y-m-d');
                    @endphp

                    <form action="{{url('/filter-due-collection')}}" method="GET" class="p-4">
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
                        
                        {{-- Submit Button --}}
                        <div class="flex items-end mt-6">
                            <button type="submit" 
                                class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg text-md font-medium shadow hover:bg-[#3F4D67] transition w-full me-2">
                                Search
                            </button>
                            <button type="submit" value="1" name="print" formtarget="_blank"
                                class="w-full px-4 py-2 rounded-lg text-md font-medium
                                    border border-[#3F4D67] text-[#3F4D67]
                                    hover:bg-[#3F4D67] hover:text-white
                                    shadow-sm transition">
                                Print
                            </button>

                        </div>

                    </form>

                </div>
             </div>

            <!-- Fee Payment List -->
            <div class="mt-6 bg-white p-6 rounded-lg shadow-md">
                <h6 class="text-lg font-semibold mb-4">Due Collection</h6>
                <div class="overflow-x-auto rounded-xl border border-gray-200 shadow-sm">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50 sticky top-0 z-10">
                            <tr>
                                <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase">#</th>

                                <th class="px-6 py-3 text-left text-xs font-semibold text-gray-600 uppercase">
                                    Receipt / Invoice
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-gray-600 uppercase">
                                    Student
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-gray-600 uppercase">
                                    Collection Date
                                </th>
                                <th class="px-6 py-3 text-end text-xs font-semibold text-gray-600 uppercase">
                                    Previous Due
                                </th>
                                <th class="px-6 py-3 text-end text-xs font-semibold text-gray-600 uppercase">
                                    Paid Amount
                                </th>
                                <th class="px-6 py-3 text-end text-xs font-semibold text-gray-600 uppercase">
                                    Remaining Due
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-gray-600 uppercase">
                                    Method
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-gray-600 uppercase">
                                    Collected By
                                </th>
                            </tr>
                        </thead>

                        <tbody class="bg-white divide-y divide-gray-100">
                            @php
                                $totalPrev = 0;
                                $totalPaid = 0;
                                $totalRemain = 0;
                            @endphp

                            @forelse($dueCollections as $val)
                                @php
                                    $totalPrev += (float) $val->previous_due;
                                    $totalPaid += (float) $val->paid_amount;
                                    $totalRemain += (float) $val->remaining_due;
                                @endphp

                                <tr class="hover:bg-gray-50 transition {{ $loop->even ? 'bg-white' : 'bg-gray-50/40' }}">
                                    {{-- Serial --}}
                                    <td class="px-4 py-4 text-center text-sm text-gray-600">
                                        {{ $loop->iteration + ($dueCollections->currentPage()-1) * $dueCollections->perPage() }}
                                    </td>

                                    {{-- Receipt/Invoice --}}
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex flex-col gap-1">
                                            <span class="inline-flex items-center w-fit px-2 py-0.5 rounded-full text-xs font-semibold bg-indigo-50 text-indigo-700 border border-indigo-100">
                                                R: {{ $val->receipt_no ?? '-' }}
                                            </span>
                                            <span class="inline-flex items-center w-fit px-2 py-0.5 rounded-full text-xs font-semibold bg-gray-50 text-gray-700 border border-gray-200">
                                                I: {{ $val->invoice_no ?? '-' }}
                                            </span>
                                        </div>
                                    </td>

                                    {{-- Student --}}
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="font-semibold text-gray-800 text-sm">
                                            {{ $val->student->first_name ?? '' }} {{ $val->student->last_name ?? '' }}
                                        </div>
                                        <div class="text-xs text-gray-500 mt-0.5">
                                            Roll: <span class="font-medium text-gray-700">{{ $val->student->roll_number ?? '-' }}</span>
                                        </div>
                                    </td>

                                    {{-- Date --}}
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                        {{ $val->collection_date ? \Carbon\Carbon::parse($val->collection_date)->format('d M Y') : '-' }}
                                    </td>

                                    {{-- Previous Due --}}
                                    <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-semibold text-red-600">
                                        ৳{{ number_format($val->previous_due ?? 0, 2) }}
                                    </td>

                                    {{-- Paid --}}
                                    <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-semibold text-green-700">
                                        ৳{{ number_format($val->paid_amount ?? 0, 2) }}
                                    </td>

                                    {{-- Remaining --}}
                                    <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-semibold text-orange-600">
                                        ৳{{ number_format($val->remaining_due ?? 0, 2) }}
                                    </td>

                                    {{-- Method --}}
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="inline-flex items-center px-2 py-1 rounded-lg text-xs font-semibold bg-blue-50 text-blue-700 border border-blue-100">
                                            {{ $val->payment_method ?? '-' }}
                                        </span>
                                    </td>

                                    {{-- Collected By --}}
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                        {{ $val->user->first_name ?? '' }} {{ $val->user->last_name ?? '' }}
                                    </td>
                                </tr>

                            @empty
                                <tr>
                                    <td colspan="9" class="px-6 py-10 text-center text-sm text-gray-500">
                                        No due collections found.
                                    </td>
                                </tr>
                            @endforelse

                            {{-- Total row --}}
                            @if($dueCollections->count() > 0)
                                <tr class="bg-gray-900 text-white">
                                    <td colspan="4" class="px-6 py-4 text-right text-sm font-semibold">
                                        Total:
                                    </td>
                                    <td class="px-6 py-4 text-end text-sm font-bold">
                                        ৳{{ number_format($totalPrev, 2) }}
                                    </td>
                                    <td class="px-6 py-4 text-end text-sm font-bold">
                                        ৳{{ number_format($totalPaid, 2) }}
                                    </td>
                                    <td class="px-6 py-4 text-end text-sm font-bold">
                                        ৳{{ number_format($totalRemain, 2) }}
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>

                <!-- paginatior -->
                @if ($dueCollections->hasPages())
                    <div class="flex flex-wrap items-center justify-center mt-4 space-x-2">

                        {{-- Previous Button --}}
                        @if ($dueCollections->onFirstPage())
                            <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                &laquo;
                            </span>
                        @else
                            <a href="{{ $dueCollections->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                &laquo;
                            </a>
                        @endif

                        {{-- Page Numbers --}}
                        @php
                            $start = max(2, $dueCollections->currentPage() - 2);
                            $end = min($dueCollections->lastPage(), $dueCollections->currentPage() + 2);
                        @endphp

                        @for ($i = $start; $i <= $end; $i++)
                            @if ($i == $dueCollections->currentPage())
                                <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                            @else
                                <a href="{{ $dueCollections->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                            @endif
                        @endfor

                        {{-- Next Button --}}
                        @if ($dueCollections->hasMorePages())
                            <a href="{{ $dueCollections->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
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
