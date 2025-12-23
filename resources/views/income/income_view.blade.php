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
                        <li class="breadcrumb-item" aria-current="page">Income</li>
                        <li class="breadcrumb-item" aria-current="page">Setting</li>
                    </ul>
                </div>
            </div>           

            <div class="max-w-3xl mx-auto my-8">
                <div class="bg-white shadow rounded-lg overflow-hidden">
                    <div class="px-6 py-4 border-b">
                        <h3 class="text-lg font-semibold text-gray-800">Incomes Detials</h3>
                    </div>

                    <form action="{{ url('/create-income') }}" method="POST" enctype="multipart/form-data"
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
                                placeholder="Enter income title">
                        </div>

                        <!-- Category & Sub Category (Grid) -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                            <!-- Category -->
                            <div>
                                <label class="text-sm font-medium text-gray-700 mb-1 block">Category</label>
                                <select name="category_id" id="category_id"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                        focus:ring-2 focus:ring-indigo-300 focus:outline-none" required>
                                    <option value="">-- Select Category --</option>
                                    @foreach($categories as $val)
                                        <option value="{{ $val->id }}">{{ $val->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Sub Category -->
                            <div>
                                <label class="text-sm font-medium text-gray-700 mb-1 block">Sub Category</label>
                                <select name="subcategory_id" id="subcategory_id"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                        focus:ring-2 focus:ring-indigo-300 focus:outline-none" required>
                                    <option value="">-- Select Sub Category --</option>
                                </select>
                            </div>

                        </div>
                        


                        <!-- Description -->
                        <div>
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Description (optional)</label>
                            <textarea name="description" rows="4"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                    focus:ring-2 focus:ring-indigo-300 focus:outline-none"
                                    placeholder="Enter Income details">N/A</textarea>
                        </div>

                        <!-- Amount -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                Amount <span class="text-red-500">*</span>
                            </label>
                            <input name="amount" type="number" min="0" required
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 
                                focus:outline-none focus:ring-2 focus:ring-indigo-300"
                                placeholder="Enter Income amount">
                        </div>

                        <!-- Submit Button -->
                        <div>
                            <button type="submit"
                                    onclick="return confirm('Are you sure you want to save this Income?')"
                                    class="w-full bg-[#3F4D67] text-white py-2.5 rounded-lg text-sm font-semibold 
                                    hover:bg-[#6d85b1] transition duration-200 shadow">
                                Save Income
                            </button>
                        </div>

                    </form>

                </div>
            </div>

            <!-- Income Board List --> 
            <div class="bg-white rounded-xl shadow overflow-x-auto">

                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-100">
                        <tr>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">#</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Title</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Category</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Sub Category</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Amount</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase">Date</th>
                            <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase">Action</th>
                        </tr>
                    </thead>

                    <tbody class="divide-y divide-gray-100">

                        @forelse($Incomes as $key => $val)
                        <tr class="hover:bg-gray-50 transition">
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $loop->iteration }}</td>
                            <td class="px-4 py-3 text-sm font-medium text-blue-900 hover:underline">
                                <a href="{{ url('/income-view/'. $val->id) }}">{{ $val->title }}</a>
                            </td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $val->category->name ?? 'N/A' }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $val->subcategory->name ?? 'N/A' }}</td>
                            <td class="px-4 py-3 text-sm font-semibold text-gray-900">৳ {{ number_format($val->amount, 2) }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ \Carbon\Carbon::parse($val->date)->format('d M, Y') }}</td>

                            <!-- Action -->
                            <td class="px-4 py-3 text-center flex justify-center gap-3">
                                <a href="{{ url('/income-view/'. $val->id) }}"  class="text-blue-600 hover:text-blue-800">
                                    <i class="fa-solid fa-eye"></i>
                                </a>
                                 <a href="{{ url('/income-print/'.$val->id) }}" target="_blank" class="text-blue-600 hover:text-blue-800">
                                    <i class="fa-solid fa-print"></i>
                                </a>
                                <a href="{{ url('/income-delete/'.$val->id) }}"
                                class="text-red-600 hover:text-red-800"
                                onclick="return confirm('Are you sure you want to delete this income?')">
                                    <i class="fa-solid fa-trash"></i>
                                </a>

                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="9" class="text-center py-6 text-gray-500">
                                No Income found.
                            </td>
                        </tr>
                        @endforelse
                        <tr>
                            <td colspan="4" class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase">Total:</td>
                            <td class="px-4 py-3 text-xs font-semibold text-gray-600 uppercase">৳{{ $Incomes->sum('amount') }}/-</td>
                            <td colspan="2"></td>
                        </tr>

                    </tbody>
                </table>

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
            $('#subcategory_id').empty().append('<option value="">-- Select Sub Category --</option>');
            if(categoryId) {
                $.ajax({
                    url: '/get-income-subcategories/' + categoryId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(subcategories) {
                        $.each(subcategories, function(index, subcat) {
                            $('#subcategory_id').append(
                                '<option value="'+ subcat.id +'">'+ subcat.name +'</option>'
                            );
                        });
                    },
                    error: function() {
                        alert('Unable to fetch subcategories.');
                    }
                });
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
