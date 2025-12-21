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
                        <li class="breadcrumb-item" aria-current="page">Banking</li>
                        <li class="breadcrumb-item" aria-current="page">Setting</li>
                    </ul>
                </div>
            </div>

            <!-- create bank start -->   
            <div class="max-w-full overflow-x-auto p-6 bg-white shadow-lg rounded-lg">
                <div class="flex items-center justify-between mb-4">
                    <!-- Left: Heading -->
                    <h2 class="text-2xl font-semibold text-gray-800 flex items-center gap-2">
                        <i class="fa-solid fa-university text-[#3F4D67]"></i>
                        Bank Details
                    </h2>

                    <!-- Right: Button -->
                    <button id="openBankModal" 
                        class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg font-medium hover:bg-[#2B3346] transition duration-300 flex items-center gap-2">
                        <i class="fa-solid fa-university"></i> Add New Bank
                    </button>
                </div>


                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-[#3F4D67] text-white">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">#</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">Bank Name</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">Branch Name</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">Account Name</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">Account Number</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">Routing Number</th>
                            <th class="px-6 py-3 text-center text-sm font-medium uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        @forelse($bankDetails as $bank)
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $loop->iteration }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $bank->bank_name }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $bank->branch_name ?? '-' }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $bank->account_name }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $bank->account_number }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $bank->routing_number ?? '-' }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-center flex justify-center gap-2">
                                <!-- Edit Button -->
                                <a href="{{ url('/edit-bank/'.$bank->id) }}"
                                    class="text-indigo-600 hover:text-indigo-800 font-medium flex items-center gap-1">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>

                                <!-- Delete Button -->
                                <form action="{{ url('/delete-bank/'.$bank->id) }}" method="POST" onsubmit="return confirm('Are you sure?')">
                                    @csrf
                                    <button type="submit" class="text-red-600 hover:text-red-800 font-medium flex items-center gap-1">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="7" class="px-6 py-4 text-center text-gray-500">No bank records found.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>












            <div id="bankModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
                <div class="bg-white rounded-lg shadow-lg w-full max-w-4xl p-6 relative">

                    <!-- Close Button -->
                    <button id="closeBankModal" class="absolute top-4 right-4 text-gray-500 hover:text-gray-800">
                        <i class="fa-solid fa-xmark text-2xl"></i>
                    </button>

                    <!-- Modal Title -->
                    <h2 class="text-2xl font-semibold text-gray-800 mb-6 flex items-center gap-2">
                        <i class="fa-solid fa-university text-[#3F4D67]"></i>
                        Add New Bank
                    </h2>

                    <!-- Form -->
                    <form action="{{ url('/create-bank') }}" method="POST">
                        @csrf
                        <div class="grid grid-cols-12 gap-6">

                            <!-- Bank Name -->
                            <div class="col-span-12 md:col-span-6">
                                <label class="block text-gray-700 font-medium mb-2" for="bank_name">Bank Name</label>
                                <div class="relative">
                                    <input type="text" name="bank_name" id="bank_name" 
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                        placeholder="Enter Bank Name" value="{{ old('bank_name') }}" required>
                                    <i class="fa-solid fa-university absolute right-3 top-3 text-gray-400"></i>
                                </div>
                            </div>

                            <!-- Branch Name -->
                            <div class="col-span-12 md:col-span-6">
                                <label class="block text-gray-700 font-medium mb-2" for="branch_name">Branch Name</label>
                                <div class="relative">
                                    <input type="text" name="branch_name" id="branch_name" 
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                        placeholder="Enter Branch Name" value="{{ old('branch_name') }}" required>
                                    <i class="fa-solid fa-code-branch absolute right-3 top-3 text-gray-400"></i>
                                </div>
                            </div>

                            <!-- Account Name -->
                            <div class="col-span-12 md:col-span-6">
                                <label class="block text-gray-700 font-medium mb-2" for="account_name">Account Name</label>
                                <div class="relative">
                                    <input type="text" name="account_name" id="account_name"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                        placeholder="Enter Account Name" value="{{ old('account_name') }}" required>
                                    <i class="fa-solid fa-user absolute right-3 top-3 text-gray-400"></i>
                                </div>
                            </div>

                            <!-- Account Number -->
                            <div class="col-span-12 md:col-span-6">
                                <label class="block text-gray-700 font-medium mb-2" for="account_number">Account Number</label>
                                <div class="relative">
                                    <input type="text" name="account_number" id="account_number"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                        placeholder="Enter Account Number" value="{{ old('account_number') }}" required>
                                    <i class="fa-solid fa-hashtag absolute right-3 top-3 text-gray-400"></i>
                                </div>
                            </div>

                            <!-- Routing Number -->
                            <div class="col-span-12 md:col-span-6">
                                <label class="block text-gray-700 font-medium mb-2" for="routing_number">Routing Number</label>
                                <div class="relative">
                                    <input type="text" name="routing_number" id="routing_number"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                        placeholder="Enter Routing Number" value="{{ old('routing_number') }}">
                                    <i class="fa-solid fa-network-wired absolute right-3 top-3 text-gray-400"></i>
                                </div>
                            </div>

                            <!-- Remarks -->
                            <div class="col-span-12">
                                <label class="block text-gray-700 font-medium mb-2" for="remarks">Remarks</label>
                                <textarea name="remarks" id="remarks" rows="3"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"
                                    placeholder="Additional notes">{{ old('remarks') }}</textarea>
                            </div>

                            <!-- Submit Button -->
                            <div class="col-span-12 mt-4">
                                <button type="submit"
                                    class="bg-[#3F4D67] text-white px-6 py-2 rounded-lg font-medium hover:bg-[#2B3346] transition duration-300 flex items-center gap-2">
                                    <i class="fa-solid fa-floppy-disk"></i>
                                    Save Bank
                                </button>
                            </div>

                        </div>
                    </form>
                </div>
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

        // create bank details
        const openBtn = document.getElementById('openBankModal');
        const closeBtn = document.getElementById('closeBankModal');
        const modal = document.getElementById('bankModal');

        openBtn.addEventListener('click', () => {
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        });

        closeBtn.addEventListener('click', () => {
            modal.classList.add('hidden');
            modal.classList.remove('flex');
        });

        // Close modal on outside click
        window.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.classList.add('hidden');
                modal.classList.remove('flex');
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
