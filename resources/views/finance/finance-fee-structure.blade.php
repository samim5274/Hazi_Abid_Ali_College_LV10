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
                        <h5 class="mb-1 font-semibold text-gray-800">Fee Structure</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">Finance</li>
                        <li class="breadcrumb-item" aria-current="page">Fee Structure</li>
                    </ul>
                </div>
            </div>

            <!-- Fee Structure Management -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Add Fee Structure Form -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h6 class="text-lg font-semibold mb-4">Add New Fee Structure</h6>
                    <form action="{{url('/insert-fee-structure')}}" method="POST">
                        @csrf
                        <div class="mb-4">
                            <label for="fee_category_id" class="block text-sm font-medium text-gray-700">Fee Category</label>
                            <select name="fee_category_id" id="fee_category_id" class="mt-1 p-2 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" required>
                                <option disabled selected>-- Select Category --</option>
                                @foreach($category as $val)
                                    <option value="{{$val->id}}">{{$val->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="class" class="block text-sm font-medium text-gray-700">Class</label>
                            <select name="class" id="class" class="mt-1 p-2 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" required>
                                <option disabled selected>-- Select Class --</option>
                                @foreach($classes as $val)
                                    <option value="{{$val->id}}">{{$val->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="amount" class="block text-sm font-medium text-gray-700">Amount</label>
                            <input type="number" name="amount" id="amount" class="mt-1 p-2 block w-full rounded-md border border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" required min="1" placeholder="Enter amount">
                        </div>
                        <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Add Structure
                        </button>
                    </form>
                </div>

                <!-- Fee Structure List -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h6 class="text-lg font-semibold mb-4">Fee Structures</h6>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Class</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                                    <th scope="col" class="relative px-6 py-3"> Action </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach($feeStructure as $val)
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{$val->room->name}}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{$val->category->name}}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{$val->amount}}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <a href="#" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                                        <a href="#" class="text-red-600 hover:text-red-900 ml-4">Delete</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <!-- paginatior -->
                    @if ($feeStructure->hasPages())
                        <div class="flex flex-wrap items-center justify-center mt-4 space-x-2">

                            {{-- Previous Button --}}
                            @if ($feeStructure->onFirstPage())
                                <span class="px-4 py-2 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                    &laquo; Previous
                                </span>
                            @else
                                <a href="{{ $feeStructure->previousPageUrl() }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                    &laquo; Previous
                                </a>
                            @endif

                            {{-- Page Numbers --}}
                            @php
                                $start = max(2, $feeStructure->currentPage() - 2);
                                $end = min($feeStructure->lastPage(), $feeStructure->currentPage() + 2);
                            @endphp

                            @for ($i = $start; $i <= $end; $i++)
                                @if ($i == $feeStructure->currentPage())
                                    <span class="px-4 py-2 text-sm md:text-base bg-theme-bg-1 text-white rounded-lg">{{ $i }}</span>
                                @else
                                    <a href="{{ $feeStructure->url($i) }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                                @endif
                            @endfor

                            {{-- Next Button --}}
                            @if ($feeStructure->hasMorePages())
                                <a href="{{ $feeStructure->nextPageUrl() }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                    Next &raquo;
                                </a>
                            @else
                                <span class="px-4 py-2 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                    Next &raquo;
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
