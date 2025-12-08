<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expenses - {{ $company->name }}</title>

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

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Expense Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/expense') }}">Expense</a></li>
                        <li class="breadcrumb-item" aria-current="page">Expense-{{ $expense->title }}</li>
                    </ul>
                </div>
            </div>           

            <div class="max-w-3xl mx-auto my-8">
                <div class="bg-white shadow rounded-lg overflow-hidden">
                    <div class="flex justify-between items-center mb-6 px-6 pt-6">
                        <h2 class="text-2xl font-bold text-gray-800">Edit Expense</h2>
                        <a href="{{ url('/expense') }}"
                        class="bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-gray-700 transition">
                            <i class="fa-solid fa-arrow-left-long me-3"></i> Back
                        </a>
                    </div>

                    <form action="{{ url('/modify-expenses/'.$expense->id) }}" method="POST"
                        class="px-6 py-6 bg-white rounded-xl shadow-md space-y-5">

                        @csrf

                        <!-- Title -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                Title <span class="text-red-500">*</span>
                            </label>
                            <input name="title" type="text" required
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 text-md 
                                focus:outline-none focus:ring-2 focus:ring-indigo-300"
                                placeholder="Enter expense title"
                                value="{{ old('title', $expense->title) }}">
                        </div>

                        <!-- Category & Sub Category -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                            <!-- Category -->
                            <div>
                                <label class="text-sm font-medium text-gray-700 mb-1 block">Category</label>
                                <select name="catId" id="category_id"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                    focus:ring-2 focus:ring-indigo-300 focus:outline-none">

                                    <option value="">-- Select Category --</option>

                                    @foreach($categries as $val)
                                        <option value="{{ $val->id }}"
                                            {{ old('catId', $expense->catId) == $val->id ? 'selected' : '' }}>
                                            {{ $val->name }}
                                        </option>
                                    @endforeach
                                </select>

                            </div>

                            <!-- Sub Category -->
                            <div>
                                <label class="text-sm font-medium text-gray-700 mb-1 block">Sub Category</label>
                                <select name="subcategory_id" id="subcategory_id"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                        focus:ring-2 focus:ring-indigo-300 focus:outline-none">
                                    <option value="">-- Select Sub Category --</option>
                                    @foreach($subcategories as $val)
                                        <option value="{{ $val->id }}"
                                            {{ old('subcategory_id', $expense->subcatId) == $val->id ? 'selected' : '' }}>
                                            {{ $val->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                        </div>

                        <!-- Description -->
                        <div>
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Description (optional)</label>
                            <textarea name="description" rows="4"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                    focus:ring-2 focus:ring-indigo-300 focus:outline-none"
                                    placeholder="Enter expense details">{{ old('description', $expense->remark) }}</textarea>
                        </div>

                        <!-- Amount -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                Amount <span class="text-red-500">*</span>
                            </label>
                            <input name="amount" type="number" min="0" required
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                focus:outline-none focus:ring-2 focus:ring-indigo-300"
                                placeholder="Enter expense amount"
                                value="{{ old('amount', $expense->amount) }}">
                        </div>

                        <!-- Submit Button -->
                        <div>
                            <button type="submit"
                                    onclick="return confirm('Are you sure you want to update this expense?')"
                                    class="w-full bg-[#3F4D67] text-white py-2.5 rounded-lg text-sm font-semibold 
                                    hover:bg-[#6d85b1] transition duration-200 shadow">
                                Update Expense
                            </button>
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

        $(document).ready(function() {
            $('#category_id').on('change', function() {
                var categoryId = $(this).val();
                if(categoryId) {
                    $.ajax({
                        url: '/get-subcategories/' + categoryId,
                        type: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            $('#subcategory_id').empty();
                            $('#subcategory_id').append('<option value="">-- Select Sub Category --</option>');
                            $.each(data, function(key, value) {
                                $('#subcategory_id').append('<option value="'+ value.id +'">'+ value.name +'</option>');
                            });
                        }
                    });
                } else {
                    $('#subcategory_id').empty();
                    $('#subcategory_id').append('<option value="">-- Select Subcategory --</option>');
                }
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
