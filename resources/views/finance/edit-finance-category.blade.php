<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance - {{ $company->name ?? 'N/A'}}</title>

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
                        <li class="breadcrumb-item"><a href="{{ url('/finance-management') }}">Category</a></li>
                        <li class="breadcrumb-item" aria-current="page">Finance</li>
                    </ul>
                </div>
            </div>

            <!-- Fee Category Management -->
            <div class="grid grid-cols-1 gap-6">
                <!-- Fee Category List -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex justify-between items-center mb-4">
                        <h6 class="text-lg font-semibold">Edit Fee Categories</h6>
                    </div>
                    <div class="overflow-x-auto">
                        <form action="{{ url('/update-finance-category/'.$category->id) }}" method="POST">
                        @csrf
                        <div class="mb-4">
                            <label for="category_name" class="block text-sm font-medium text-gray-700">Category Name</label>
                            <input type="text" name="category_name" id="category_name" class="mt-1 block w-full rounded-md p-2 border border-gray-300 shadow-sm focus:border-[#3F4D67] focus:ring-[#3F4D67] sm:text-sm" placeholder="Enter category name" value="{{ $category->name }}" required>
                        </div>
                        <div class="mb-4">
                            <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                            <textarea name="description" id="description" rows="3" class="mt-1 block w-full p-2 rounded-md border border-gray-300 shadow-sm focus:border-[#3F4D67] focus:ring-[#3F4D67] sm:text-sm">{{ $category->description }}</textarea>
                        </div>
                        <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-[#3F4D67] hover:bg-[#3F4D67] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#3F4D67]" onclick="confirm('Are you sure? You want to edit this finance category?')">
                            Modify Category
                        </button>
                    </form>
                    </div>
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
