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

    <style>
        .modal-backdrop {
            z-index: 9990;
        }
        .modal {
            z-index: 9999;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes slideOut {
            from { transform: translateY(0); opacity: 1; }
            to { transform: translateY(-50px); opacity: 0; }
        }
        .fade-in {
            animation: fadeIn 0.3s ease-out forwards;
        }
        .fade-out {
            animation: fadeOut 0.3s ease-in forwards;
        }
        .slide-in {
            animation: slideIn 0.3s ease-out forwards;
        }
        .slide-out {
            animation: slideOut 0.3s ease-in forwards;
        }
    </style>
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
                        <h5 class="mb-1 font-semibold text-gray-800">Finance Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">Finance</li>
                    </ul>
                </div>
            </div>

            <!-- Fee Category Management -->
            <div class="grid grid-cols-1 gap-6">
                <!-- Fee Category List -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex justify-between items-center mb-4">
                        <h6 class="text-lg font-semibold">Fee Categories</h6>
                        <button id="open-modal" class="inline-flex items-center px-3 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-[#3F4D67] hover:bg-[#3F4D67] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#3F4D67]">
                            <i class="fa-solid fa-plus"></i>
                        </button>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category Name</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Description</th>
                                    <th scope="col" class="relative px-6 py-3 text-end"> Action </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <!-- Sample Row 1 -->
                                @foreach($category as $val)
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{$val->name}}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{$val->description}}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                                        <a href="#" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                                        <a href="#" class="text-red-600 hover:text-red-900 ml-4">Delete</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <!-- paginatior -->
                    @if ($category->hasPages())
                        <div class="flex flex-wrap items-center justify-center mt-4 space-x-2">

                            {{-- Previous Button --}}
                            @if ($category->onFirstPage())
                                <span class="px-4 py-2 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                    &laquo; Previous
                                </span>
                            @else
                                <a href="{{ $category->previousPageUrl() }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                    &laquo; Previous
                                </a>
                            @endif

                            {{-- Page Numbers --}}
                            @php
                                $start = max(2, $category->currentPage() - 2);
                                $end = min($category->lastPage(), $category->currentPage() + 2);
                            @endphp

                            @for ($i = $start; $i <= $end; $i++)
                                @if ($i == $category->currentPage())
                                    <span class="px-4 py-2 text-sm md:text-base bg-theme-bg-1 text-white rounded-lg">{{ $i }}</span>
                                @else
                                    <a href="{{ $category->url($i) }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                                @endif
                            @endfor

                            {{-- Next Button --}}
                            @if ($category->hasMorePages())
                                <a href="{{ $category->nextPageUrl() }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
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

            <!-- Add Fee Category Modal -->
            <div id="fee-category-modal" class="fixed inset-0 flex items-center justify-center hidden">
                <div class="modal-backdrop fixed inset-0 bg-gray-800 bg-opacity-50"></div>
                <div class="modal bg-white p-6 rounded-lg shadow-md w-full max-w-md">
                    <div class="flex justify-between items-center mb-4">
                        <h6 class="text-lg font-semibold">Add New Fee Category</h6>
                        <button id="close-modal" class="text-gray-500 hover:text-gray-700">
                            <i class="fa-solid fa-times"></i>
                        </button>
                    </div>
                    <form action="{{ url('/add-new-finance-category') }}" method="POST">
                        @csrf
                        <div class="mb-4">
                            <label for="category_name" class="block text-sm font-medium text-gray-700">Category Name</label>
                            <input type="text" name="category_name" id="category_name" class="mt-1 block w-full rounded-md p-2 border border-gray-300 shadow-sm focus:border-[#3F4D67] focus:ring-[#3F4D67] sm:text-sm" placeholder="Enter category name" required>
                        </div>
                        <div class="mb-4">
                            <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                            <textarea name="description" id="description" rows="3" class="mt-1 block w-full p-2 rounded-md border border-gray-300 shadow-sm focus:border-[#3F4D67] focus:ring-[#3F4D67] sm:text-sm"></textarea>
                        </div>
                        <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-[#3F4D67] hover:bg-[#3F4D67] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#3F4D67]">
                            Add Category
                        </button>
                    </form>
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

        // Modal handling
        const openModalBtn = document.getElementById('open-modal');
        const closeModalBtn = document.getElementById('close-modal');
        const modal = document.getElementById('fee-category-modal');
        const modalBackdrop = modal.querySelector('.modal-backdrop');
        const modalContent = modal.querySelector('.modal');

        openModalBtn.addEventListener('click', () => {
            modal.classList.remove('hidden');
            modalBackdrop.classList.add('fade-in');
            modalContent.classList.add('slide-in');
        });

        const closeModal = () => {
            modalBackdrop.classList.remove('fade-in');
            modalBackdrop.classList.add('fade-out');
            modalContent.classList.remove('slide-in');
            modalContent.classList.add('slide-out');
            setTimeout(() => {
                modal.classList.add('hidden');
                modalBackdrop.classList.remove('fade-out');
                modalContent.classList.remove('slide-out');
            }, 300);
        }

        closeModalBtn.addEventListener('click', closeModal);
        modalBackdrop.addEventListener('click', closeModal);

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
