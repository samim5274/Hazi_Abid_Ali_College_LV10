<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Diposit - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Bank Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/bank-diposit-view') }}">Doposit</a></li>
                        <li class="breadcrumb-item" aria-current="page">Diposit</li>
                    </ul>
                </div>
            </div>

            <!-- Deposit Modal -->
            <div class="max-w-3xl mx-auto p-6 bg-white shadow-lg rounded-lg mt-6">

                <!-- Page Title -->
                <h2 class="text-2xl font-semibold text-gray-800 mb-6 flex items-center gap-2">
                    <i class="fa-solid fa-money-bill-wave text-[#3F4D67]"></i>
                    Edit Bank Deposit
                </h2>

                <!-- Edit Form -->
                <form action="{{ url('/modify-bank-deposit/'.$dipositDetails->first()->id) }}" method="POST">
                    @csrf
                    <div class="grid grid-cols-12 gap-6">

                        <!-- Bank Name -->
                        <div class="col-span-12 md:col-span-6">
                            <label class="block text-gray-700 font-medium mb-2" for="bank_name">Bank Name</label>
                            <select name="bank_name" id="bank_name" required
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]">
                                <option value="">-- Select Bank --</option>
                                @foreach($bankDetails as $bank)
                                    <option value="{{ $bank->id }}" 
                                        {{ $dipositDetails->first()->bank_id == $bank->id ? 'selected' : '' }}>
                                        {{ $bank->bank_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Amount -->
                        <div class="col-span-12 md:col-span-6">
                            <label class="block text-gray-700 font-medium mb-2" for="amount">Amount</label>
                            <input type="number" name="amount" id="amount" min="0" placeholder="Enter Amount" required
                                value="{{ $dipositDetails->first()->amount }}"
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]">
                        </div>

                        <!-- Remarks -->
                        <div class="col-span-12">
                            <label class="block text-gray-700 font-medium mb-2" for="remarks">Remarks (optional)</label>
                            <textarea name="remarks" id="remarks" rows="3" placeholder="Additional notes"
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]">{{ $dipositDetails->first()->remarks }}</textarea>
                        </div>

                        <!-- Submit Button -->
                        <div class="col-span-12 mt-4">
                            <button type="submit"
                                class="bg-[#3F4D67] text-white px-6 py-2 rounded-lg font-medium hover:bg-[#2B3346] transition duration-300 flex items-center gap-2"
                                onclick="return confirm('Are you sure you want to modify this deposit?')">
                                <i class="fa-solid fa-floppy-disk"></i>
                                Update Deposit
                            </button>
                        </div>

                    </div>
                </form>
            </div>

            <!-- create bank end -->

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
