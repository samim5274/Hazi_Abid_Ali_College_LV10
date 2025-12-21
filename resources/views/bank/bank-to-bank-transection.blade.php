<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Withdraw - {{ $company->name }}</title>

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
                        <li class="breadcrumb-item" aria-current="page">Withdraw</li>
                    </ul>
                </div>
            </div>

            <div class="max-w-full overflow-x-auto p-6 bg-white shadow-lg rounded-lg">

                <div class="flex items-center justify-between mb-4">
                    <h2 class="text-2xl font-semibold text-gray-800 flex items-center gap-2">
                        <i class="fa-solid fa-money-bill-transfer text-[#3F4D67]"></i>
                        Bank-to-Bank Transection
                    </h2>

                    <button id="openTransferModal" 
                        class="bg-[#3F4D67] text-white px-4 py-2 rounded-lg font-medium hover:bg-[#2B3346] transition duration-300 flex items-center gap-2">
                        <i class="fa-solid fa-plus-circle"></i> Transfer
                    </button>
                </div>

                <!-- Transection Table -->
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-[#3F4D67] text-white">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">#</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">Date</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">From Bank</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">To Bank</th>
                            <th class="px-6 py-3 text-left text-sm font-medium uppercase tracking-wider">Amount</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        @forelse($transectionDetails as $tran)
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $loop->iteration }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ \Carbon\Carbon::parse($tran->date)->format('d M, Y') }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                @if($tran->status == 'Withdraw')
                                    {{ $tran->bank->bank_name }}
                                @endif
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                @if($tran->status == 'Deposit')
                                    {{ $tran->bank->bank_name }}
                                @endif
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">৳ {{ $tran->amount }}</td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="px-6 py-4 text-center text-gray-500">No transections found for today.</td>
                        </tr>
                        @endforelse
                        <tr class="bg-gray-100 font-semibold">
                            <td colspan="3" class="px-6 py-4 text-right">Balance:</td>
                            <td class="px-6 py-4 text-center">
                                Deposit: <span class="text-green-600">৳ {{ number_format($depositSum, 2) }}</span> 
                                - Withdraw: <span class="text-red-600">৳ {{ number_format($withdrawSum, 2) }}</span>
                            </td>
                            <td class="px-6 py-4 text-center text-blue-700">
                                Total: ৳ {{ number_format($balance, 2) }}/-
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>

            <!-- Transfer Modal -->
            <div id="transferModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
                <div class="bg-white rounded-lg shadow-lg w-full max-w-3xl p-6 relative">

                    <button id="closeTransferModal" class="absolute top-4 right-4 text-gray-500 hover:text-gray-800">
                        <i class="fa-solid fa-xmark text-2xl"></i>
                    </button>

                    <h2 class="text-2xl font-semibold text-gray-800 mb-6 flex items-center gap-2">
                        <i class="fa-solid fa-money-bill-transfer text-[#3F4D67]"></i>
                        Transfer Money
                    </h2>

                    <form action="{{ url('/bank-to-bank-transection') }}" method="POST">
                        @csrf
                        <div class="grid grid-cols-12 gap-6">

                            <!-- From Bank -->
                            <div class="col-span-12 md:col-span-6">
                                <label class="block text-gray-700 font-medium mb-2">From Bank</label>
                                <select name="from_bank" required
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]">
                                    <option value="">-- Select Bank --</option>
                                    @foreach($bankDetails as $bank)
                                    <option value="{{ $bank->id }}">{{ $bank->bank_name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- To Bank -->
                            <div class="col-span-12 md:col-span-6">
                                <label class="block text-gray-700 font-medium mb-2">To Bank</label>
                                <select name="to_bank" required
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]">
                                    <option value="">-- Select Bank --</option>
                                    @foreach($bankDetails as $bank)
                                    <option value="{{ $bank->id }}">{{ $bank->bank_name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Amount -->
                            <div class="col-span-12">
                                <label class="block text-gray-700 font-medium mb-2">Amount</label>
                                <input type="number" name="amount" min="0" placeholder="Enter Amount" required
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]">
                            </div>

                            <!-- Remarks -->
                            <div class="col-span-12">
                                <label class="block text-gray-700 font-medium mb-2">Remarks (optional)</label>
                                <textarea name="remarks" rows="3" placeholder="Additional notes"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#3F4D67]"></textarea>
                            </div>

                            <!-- Submit -->
                            <div class="col-span-12 mt-4">
                                <button type="submit"
                                    class="bg-[#3F4D67] text-white px-6 py-2 rounded-lg font-medium hover:bg-[#2B3346] transition duration-300 flex items-center gap-2"
                                    onclick="return confirm('Are you sure you want to transfer this amount?')">
                                    <i class="fa-solid fa-arrow-right-arrow-left"></i>
                                    Transfer
                                </button>
                            </div>
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

        // create bank details
        const openTransferModal = document.getElementById('openTransferModal');
        const closeTransferModal = document.getElementById('closeTransferModal');
        const transferModal = document.getElementById('transferModal');

        openTransferModal.addEventListener('click', () => {
            transferModal.classList.remove('hidden');
            transferModal.classList.add('flex');
        });

        closeTransferModal.addEventListener('click', () => {
            transferModal.classList.add('hidden');
            transferModal.classList.remove('flex');
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
