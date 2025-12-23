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

    <meta name="csrf-token" content="{{ csrf_token() }}">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <li class="breadcrumb-item"><a href="{{ url('/income') }}">Income</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/income-view/'.$income->id) }}">Details</a></li>
                        <li class="breadcrumb-item" aria-current="page">Edit</li>
                    </ul>
                </div>
            </div>           

            <div class="max-w-3xl mx-auto my-8">
                <div class="bg-white shadow rounded-lg overflow-hidden">
                    <div class="px-6 py-4 border-b">
                        <h3 class="text-lg font-semibold text-gray-800">Edit Income</h3>
                    </div>

                    <form action="{{ url('/modify-income/'.$income->id) }}" method="POST" class="px-6 py-6 bg-white space-y-5">
                        @csrf

                        <!-- Title -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                Title <span class="text-red-500">*</span>
                            </label>
                            <input name="title" type="text" required
                                value="{{ old('title', $income->title) }}"
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-300"
                                placeholder="Enter income title">
                        </div>

                        <!-- Category & Sub Category -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <!-- Category -->
                            <div>
                                <label class="text-sm font-medium text-gray-700 mb-1 block">Category</label>
                                <select name="category_id" id="category_id"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-300 focus:outline-none" required>
                                    <option value="">-- Select Category --</option>
                                    @foreach($categories as $val)
                                        <option value="{{ $val->id }}" {{ $income->category_id == $val->id ? 'selected' : '' }}>
                                            {{ $val->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Sub Category -->
                            <div>
                                <label class="text-sm font-medium text-gray-700 mb-1 block">Sub Category</label>
                                <select name="subcategory_id" id="subcategory_id"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-300 focus:outline-none" required>
                                    <option value="">-- Select Sub Category --</option>
                                    @foreach($subcategories as $sub)
                                        <option value="{{ $sub->id }}" {{ $income->subcategory_id == $sub->id ? 'selected' : '' }}>
                                            {{ $sub->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <!-- Description -->
                        <div>
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Description (optional)</label>
                            <textarea name="description" rows="4"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-indigo-300 focus:outline-none"
                                    placeholder="Enter Income details">{{ old('description', $income->description) }}</textarea>
                        </div>

                        <!-- Amount -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                Amount <span class="text-red-500">*</span>
                            </label>
                            <input name="amount" type="number" min="0" required
                                value="{{ old('amount', $income->amount) }}"
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-300"
                                placeholder="Enter Income amount">
                        </div>

                        <!-- Submit & Cancel -->
                        <div class="flex gap-3">
                            <button type="submit"
                                    onclick="return confirm('Are you sure you want to update this Income?')"
                                    class="flex-1 bg-[#3F4D67] text-white py-2.5 rounded-lg font-semibold hover:bg-[#6d85b1] transition duration-200">
                                Update Income
                            </button>
                            <a href="{{ url()->previous() }}"
                                class="flex-1 border border-[#3F4D67] text-[#3F4D67] py-2.5 rounded-lg text-center hover:bg-[#3F4D67] hover:text-white transition">
                                Cancel
                            </a>
                        </div>
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

        document.addEventListener('DOMContentLoaded', function() {
            const categorySelect = document.getElementById('category_id');
            const subcategorySelect = document.getElementById('subcategory_id');

            categorySelect.addEventListener('change', function() {
                const categoryId = this.value;
                if (!categoryId) {
                    subcategorySelect.innerHTML = '<option value="">-- Select Sub Category --</option>';
                    return;
                }

                fetch(`/get-income-subcategories/${categoryId}`)
                    .then(res => res.json())
                    .then(data => {
                        subcategorySelect.innerHTML = '<option value="">-- Select Sub Category --</option>';
                        data.forEach(sub => {
                            const selected = sub.id == {{ $income->subcategory_id }} ? 'selected' : '';
                            subcategorySelect.innerHTML += `<option value="${sub.id}" ${selected}>${sub.name}</option>`;
                        });
                    });
            });
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
