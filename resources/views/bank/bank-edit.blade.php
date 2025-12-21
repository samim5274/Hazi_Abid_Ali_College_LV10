<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking - {{ $company->name }}</title>

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
                        <li class="breadcrumb-item"><a href="{{ url('/bank-setting') }}">Setting</a></li>
                        <li class="breadcrumb-item" aria-current="page">Edit</li>
                    </ul>
                </div>
            </div>
            <div class="max-w-4xl mx-auto p-6 bg-white shadow-lg rounded-lg">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6 flex items-center gap-2">
                    <i class="fa-solid fa-university text-[#3F4D67]"></i>
                    Modify Bank
                </h2>

                <form action="{{ url('/modify-bank/'. $bankDetails->id) }}" method="POST">
                    @csrf
                    <div class="grid grid-cols-12 gap-6">

                        <!-- Bank Name -->
                        <div class="col-span-12 md:col-span-6">
                            <label class="block text-gray-700 font-medium mb-2" for="bank_name">Bank Name</label>
                            <div class="relative">
                                <input type="text" name="bank_name" id="bank_name" 
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                    placeholder="Enter Bank Name" value="{{ $bankDetails->bank_name }}" required>
                                <i class="fa-solid fa-university absolute right-3 top-3 text-gray-400"></i>
                            </div>
                        </div>

                        <!-- Branch Name -->
                        <div class="col-span-12 md:col-span-6">
                            <label class="block text-gray-700 font-medium mb-2" for="branch_name">Branch Name</label>
                            <div class="relative">
                                <input type="text" name="branch_name" id="branch_name" 
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                    placeholder="Enter Branch Name" value="{{ $bankDetails->branch_name }}" required>
                                <i class="fa-solid fa-code-branch absolute right-3 top-3 text-gray-400"></i>
                            </div>
                        </div>

                        <!-- Account Name -->
                        <div class="col-span-12 md:col-span-6">
                            <label class="block text-gray-700 font-medium mb-2" for="account_name">Account Name</label>
                            <div class="relative">
                                <input type="text" name="account_name" id="account_name"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                    placeholder="Enter Account Name" value="{{ $bankDetails->account_name }}" required>
                                <i class="fa-solid fa-user absolute right-3 top-3 text-gray-400"></i>
                            </div>
                        </div>

                        <!-- Account Number -->
                        <div class="col-span-12 md:col-span-6">
                            <label class="block text-gray-700 font-medium mb-2" for="account_number">Account Number</label>
                            <div class="relative">
                                <input type="text" name="account_number" id="account_number"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                    placeholder="Enter Account Number" value="{{ $bankDetails->account_number }}" required>
                                <i class="fa-solid fa-hashtag absolute right-3 top-3 text-gray-400"></i>
                            </div>
                        </div>

                        <!-- Routing Number -->
                        <div class="col-span-12 md:col-span-6">
                            <label class="block text-gray-700 font-medium mb-2" for="routing_number">Routing Number</label>
                            <div class="relative">
                                <input type="text" name="routing_number" id="routing_number"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                    placeholder="Enter Routing Number" value="{{ $bankDetails->routing_number }}">
                                <i class="fa-solid fa-network-wired absolute right-3 top-3 text-gray-400"></i>
                            </div>
                        </div>

                        <!-- Remarks -->
                        <div class="col-span-12">
                            <label class="block text-gray-700 font-medium mb-2" for="remarks">Remarks</label>
                            <textarea name="remarks" id="remarks" rows="3"
                                class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                placeholder="Additional notes">{{ $bankDetails->remarks }}</textarea>
                        </div>

                        <!-- Submit Button -->
                        <div class="col-span-12 mt-4">
                            <button type="submit"
                                class="bg-[#3F4D67] text-white px-6 py-2 rounded-lg font-medium hover:bg-[#3F4D67] transition duration-300 flex items-center gap-2" onclick="confirm('Are you sure you want to Modify bank details?')">
                                <i class="fa-solid fa-floppy-disk"></i>
                                Modify Bank
                            </button>
                        </div>

                    </div>
                </form>
            </div>
            <!-- edit bank end -->
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
