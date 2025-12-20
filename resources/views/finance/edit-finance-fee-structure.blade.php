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
                        <h5 class="mb-1 font-semibold text-gray-800">Fee Structure</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/finance-management') }}">Category</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/finance-fee-structure') }}">Structure</a></li>
                        <li class="breadcrumb-item" aria-current="page">Edit Structure</li>
                    </ul>
                </div>
            </div>

            <!-- Fee Structure Management -->
            <div class="max-w-3xl mx-auto">
                <div class="bg-white rounded-xl shadow-lg border border-gray-100">
                    <!-- Header -->
                    <div class="px-6 py-4 border-b">
                        <h6 class="text-xl font-semibold text-gray-800">
                            Edit Fee Structure
                        </h6>
                        <p class="text-sm text-gray-500">
                            Update fee category, class and amount
                        </p>
                    </div>

                    <!-- Form -->
                    <form action="{{ url('/modify-fee-structure/' . $feeStructure->id) }}" method="POST" class="p-6 space-y-5">
                        @csrf

                        <!-- Fee Category -->
                        <div>
                            <label for="fee_category_id" class="block text-sm font-medium text-gray-700 mb-1">
                                Fee Category
                            </label>
                            <select name="fee_category_id" id="fee_category_id" class="mt-1 p-2 block w-full rounded-md border-gray-300" required>
                                <option disabled>-- Select Category --</option>
                                @foreach($category as $val)
                                    <option value="{{ $val->id }}"
                                        {{ old('fee_category_id', $feeStructure->fee_category_id) == $val->id ? 'selected' : '' }}>
                                        {{ $val->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Class -->
                        <div>
                            <label for="class" class="block text-sm font-medium text-gray-700 mb-1">
                                Class
                            </label>
                            <select name="class_id" id="class" class="mt-1 p-2 block w-full rounded-md border-gray-300" required>
                                <option disabled>-- Select Class --</option>
                                @foreach($classes as $val)
                                    <option value="{{ $val->id }}"
                                        {{ old('class_id', $feeStructure->class_id) == $val->id ? 'selected' : '' }}>
                                        {{ $val->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Amount -->
                        <div>
                            <label for="amount" class="block text-sm font-medium text-gray-700 mb-1">
                                Amount (৳)
                            </label>
                            <input type="number"
                                name="amount"
                                id="amount"
                                value="{{ old('amount', $feeStructure->amount) }}"
                                class="mt-1 p-2 block w-full rounded-md border border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                                min="1"
                                required
                                placeholder="Enter amount">
                        </div>

                        <!-- Actions -->
                        <div class="flex justify-end gap-3 pt-4 border-t">
                            <a href="{{ url()->previous() }}"
                            class="px-4 py-2 rounded-lg border text-gray-700 hover:bg-gray-100">
                                Cancel
                            </a>

                            <button type="submit"
                                class="px-5 py-2 rounded-lg bg-[#3F4D67] text-white font-medium hover:bg-[#516385] focus:ring-2 focus:ring-indigo-400">
                                Update Fee Structure
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
