<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Income - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Income Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">Income</li>
                        <li class="breadcrumb-item" aria-current="page">Setting</li>
                    </ul>
                </div>
            </div>

            <!-- create Category start -->   
            <!-- CATEGORY LIST -->
            <div class="max-w-full overflow-x-auto p-6 bg-white shadow-lg rounded-lg">
                <div class="flex items-center justify-between mb-4">
                    <h2 class="text-2xl font-semibold flex items-center gap-2">
                        <i class="fa-solid fa-money-bill-1 text-[#3F4D67]"></i>
                        Category Details
                    </h2>

                    <button id="openCategoryModal"
                        class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg flex gap-2">
                        <i class="fa-solid fa-plus"></i> Add Category
                    </button>
                </div>

                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-[#3F4D67] text-white">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($categories as $val)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $val->name }}</td>
                            <td class="text-center flex justify-center gap-2">
                                <a href="{{ url('/edit-income-category/'.$val->id) }}" class="text-indigo-600">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>

                                <form action="{{ url('/delete-income-category/'.$val->id) }}" method="POST"
                                    onsubmit="return confirm('Are you sure?')">
                                    @csrf
                                    <button class="text-red-600">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="3" class="text-center text-gray-500">No records found</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>




  
            <div id="CategoryModal" class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">
                <div class="bg-white rounded-lg shadow-lg w-full max-w-3xl p-6 relative">

                    <button id="closeCategoryModal" class="absolute top-4 right-4">
                        <i class="fa-solid fa-xmark text-xl"></i>
                    </button>

                    <h2 class="text-xl font-semibold mb-6">Add Category</h2>

                    <form action="{{ url('/create-income-category') }}" method="POST">
                        @csrf
                        <input type="text" name="txtCategoryName"
                            class="w-full border rounded px-4 py-2 mb-3"
                            placeholder="Category Name" required>

                        <textarea name="remarks"
                            class="w-full border rounded px-4 py-2 mb-4">N/A</textarea>

                        <button class="bg-[#3F4D67] text-white px-6 py-2 rounded">
                            Save
                        </button>
                    </form>
                </div>
            </div>
            <!-- create Category end -->











            <!-- create sub-Category start -->   
            <!-- SUBCATEGORY LIST -->
            <div class="max-w-full overflow-x-auto p-6 bg-white shadow-lg rounded-lg mt-10">
                <div class="flex items-center justify-between mb-4">
                    <h2 class="text-2xl font-semibold flex items-center gap-2">
                        <i class="fa-solid fa-layer-group text-[#3F4D67]"></i>
                        Subcategory Details
                    </h2>

                    <button id="openSubCategoryModal"
                        class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg flex gap-2">
                        <i class="fa-solid fa-plus"></i> Add Subcategory
                    </button>
                </div>

                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-[#3F4D67] text-white">
                        <tr>
                            <th>#</th>
                            <th>Category</th>
                            <th>Subcategory</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($subcategories as $val)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $val->category->name ?? '-' }}</td>
                            <td>{{ $val->name }}</td>
                            <td class="text-center flex justify-center gap-2">
                                <a href="{{ url('/edit-income-subcategory/'.$val->id) }}" class="text-indigo-600">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>

                                <form action="{{ url('/delete-income-subcategory/'.$val->id) }}" method="POST"
                                    onsubmit="return confirm('Are you sure?')">
                                    @csrf
                                    <button class="text-red-600">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="4" class="text-center text-gray-500">No records found</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>




            
            <div id="SubCategoryModal" class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">
                <div class="bg-white rounded-lg shadow-lg w-full max-w-3xl p-6 relative">

                    <button id="closeSubCategoryModal" class="absolute top-4 right-4">
                        <i class="fa-solid fa-xmark text-xl"></i>
                    </button>

                    <h2 class="text-xl font-semibold mb-6">Add Subcategory</h2>

                    <form action="{{ url('/create-income-subcategory') }}" method="POST">
                        @csrf

                        <select name="category_id" class="w-full border px-4 py-2 mb-3" required>
                            <option value="">Select Category</option>
                            @foreach($categories as $cat)
                                <option value="{{ $cat->id }}">{{ $cat->name }}</option>
                            @endforeach
                        </select>

                        <input type="text" name="txtSubCategoryName"
                            class="w-full border px-4 py-2 mb-3"
                            placeholder="Subcategory Name" required>

                        <textarea name="remarks"
                            class="w-full border px-4 py-2 mb-4">N/A</textarea>

                        <button class="bg-[#3F4D67] text-white px-6 py-2 rounded">
                            Save
                        </button>
                    </form>
                </div>
            </div>
            <!-- create category end -->
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

        /* CATEGORY MODAL */
        const catModal = document.getElementById('CategoryModal');
        document.getElementById('openCategoryModal').onclick = () => catModal.classList.replace('hidden','flex');
        document.getElementById('closeCategoryModal').onclick = () => catModal.classList.replace('flex','hidden');

        /* SUBCATEGORY MODAL */
        const subModal = document.getElementById('SubCategoryModal');
        document.getElementById('openSubCategoryModal').onclick = () => subModal.classList.replace('hidden','flex');
        document.getElementById('closeSubCategoryModal').onclick = () => subModal.classList.replace('flex','hidden');

        /* OUTSIDE CLICK */
        window.onclick = e => {
            if(e.target === catModal) catModal.classList.replace('flex','hidden');
            if(e.target === subModal) subModal.classList.replace('flex','hidden');
        }
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
