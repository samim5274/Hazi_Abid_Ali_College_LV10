<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T.T.S - {{ $company->name }}</title>

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
                        <h4 class="font-semibold text-lg mb-2">🎓 Transactions Summary</h4>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/finance-fee-payment') }}">Finance</a></li>
                        <li class="breadcrumb-item" aria-current="page">Total Transection Summary</li>
                    </ul>
                </div>
            </div>

            <!-- ================= FINANCIAL OVERVIEW ================= -->
            <div class="grid grid-cols-12 gap-6">

                <!-- ================= TOP SUMMARY ================= -->
                <div class="col-span-12">
                    <h3 class="text-xl font-semibold mb-4 flex items-center gap-2">
                        <i class="fa-solid fa-chart-line text-indigo-500"></i>
                        Financial Overview
                    </h3>
                </div>

                <!-- Total Transactions -->
                <div class="col-span-12 xl:col-span-3 md:col-span-6">
                    <div class="rounded-lg shadow-lg text-white p-6 bg-indigo-500">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-xs uppercase opacity-80">Total Transactions</p>
                                <h2 class="font-semibold mt-1 text-white">৳ {{ $total->sum('total_amount') }}/-</h2>
                                <p class="text-xs opacity-80 mt-1">All financial movements</p>
                            </div>
                            <i class="fa-solid fa-layer-group text-[42px] opacity-30"></i>
                        </div>
                    </div>
                </div>

                <!-- Total Income -->
                <div class="col-span-12 xl:col-span-3 md:col-span-6">
                    <div class="rounded-lg shadow-lg text-white p-6 bg-green-500">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-xs uppercase opacity-80">Total Income</p>
                                <h2 class="font-semibold mt-1 text-white">৳ {{ $total->sum('total_paid') }}/-</h2>
                                <p class="text-xs opacity-80 mt-1">Student & other income</p>
                            </div>
                            <i class="fa-solid fa-arrow-trend-up text-[42px] opacity-30"></i>
                        </div>
                    </div>
                </div>

                <!-- Total Expense -->
                <div class="col-span-12 xl:col-span-3 md:col-span-6">
                    <div class="rounded-lg shadow-lg text-white p-6 bg-red-500">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-xs uppercase opacity-80">Total Expense</p>
                                <h2 class="font-semibold mt-1 text-white">৳ {{ $expenses->sum('amount') }}/-</h2>
                                <p class="text-xs opacity-80 mt-1">Operational & salary</p>
                            </div>
                            <i class="fa-solid fa-arrow-trend-down text-[42px] opacity-30"></i>
                        </div>
                    </div>
                </div>

                <!-- Net Balance -->
                <div class="col-span-12 xl:col-span-3 md:col-span-6">
                    <div class="rounded-lg shadow-lg text-white p-6 bg-teal-500">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-xs uppercase opacity-80">Net Balance</p>
                                <h2 class="font-semibold mt-1 text-white">
                                    ৳ {{ $total->sum('total_paid') - $expenses->sum('amount') }}/-
                                </h2>
                                <p class="text-xs opacity-80 mt-1">Income − Expense</p>
                            </div>
                            <i class="fa-solid fa-wallet text-[42px] opacity-30"></i>
                        </div>
                    </div>
                </div>

                <!-- ================= STUDENT FINANCE ================= -->
                <div class="col-span-12 mt-6">
                    <h4 class="font-semibold text-lg flex items-center gap-2">
                        <i class="fa-solid fa-user-graduate text-blue-500"></i>
                        Student Finance
                    </h4>
                </div>

                <div class="col-span-12 md:col-span-4 xl:col-span-3">
                    <div class="rounded-lg shadow-sm p-4 bg-blue-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Fee Collection</p>
                                <h3 class="font-semibold mt-1 text-white">৳ {{ $total->sum('total_paid') }}/-</h3>
                            </div>
                            <i class="fa-solid fa-graduation-cap text-[30px] opacity-80"></i>
                        </div>
                    </div>
                </div>

                <div class="col-span-12 md:col-span-4 xl:col-span-3">
                    <div class="rounded-lg shadow-sm p-4 bg-cyan-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Due Collection</p>
                                <h3 class="font-semibold mt-1 text-white">৳ 00/-</h3>
                            </div>
                            <i class="fa-solid fa-hand-holding-dollar text-[30px] opacity-80"></i>
                        </div>
                    </div>
                </div>

                <div class="col-span-12 md:col-span-4 xl:col-span-3">
                    <div class="rounded-lg shadow-sm p-4 bg-yellow-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Discount</p>
                                <h3 class="font-semibold mt-1 text-white">৳ {{ $total->sum('total_discount') }}/-</h3>
                            </div>
                            <i class="fa-solid fa-tags text-[30px] opacity-80"></i>
                        </div>
                    </div>
                </div>

                <div class="col-span-12 md:col-span-4 xl:col-span-3">
                    <div class="rounded-lg shadow-sm p-4 bg-orange-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Refund</p>
                                <h3 class="font-semibold mt-1 text-white">৳ 00/-</h3>
                            </div>
                            <i class="fa-solid fa-rotate-left text-[30px] opacity-80"></i>
                        </div>
                    </div>
                </div>

                <!-- ================= BANK & CASH ================= -->
                <div class="col-span-12 mt-6">
                    <h4 class="font-semibold text-lg flex items-center gap-2">
                        <i class="fa-solid fa-building-columns text-indigo-500"></i>
                        Cash & Bank
                    </h4>
                </div>

                <div class="col-span-12 md:col-span-4 xl:col-span-3">
                    <div class="rounded-lg shadow-sm p-4 bg-indigo-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Bank Deposit</p>
                                <h3 class="font-semibold mt-1 text-white">৳ 00/-</h3>
                            </div>
                            <i class="fa-solid fa-building-columns text-[30px] opacity-80"></i>
                        </div>
                    </div>
                </div>

                <div class="col-span-12 md:col-span-4 xl:col-span-3">
                    <div class="rounded-lg shadow-sm p-4 bg-pink-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Bank Withdraw</p>
                                <h3 class="font-semibold mt-1 text-white">৳ 00/-</h3>
                            </div>
                            <i class="fa-solid fa-money-bill-transfer text-[30px] opacity-80"></i>
                        </div>
                    </div>
                </div>

                <!-- ================= BALANCE STATUS ================= -->
                <div class="col-span-12 mt-6">
                    <h4 class="font-semibold text-lg flex items-center gap-2">
                        <i class="fa-solid fa-scale-balanced text-green-600"></i>
                        Balance Status
                    </h4>
                </div>

                <div class="col-span-12 md:col-span-6 xl:col-span-4">
                    <div class="rounded-lg shadow-sm p-4 bg-green-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Cash Balance</p>
                                <h2 class="font-semibold text-white">৳ {{ $total->sum('total_paid') - $expenses->sum('amount') }}/-</h2>
                            </div>
                            <i class="fa-solid fa-wallet text-[36px] opacity-80"></i>
                        </div>
                    </div>
                </div>

                <div class="col-span-12 md:col-span-6 xl:col-span-4">
                    <div class="rounded-lg shadow-sm p-4 bg-red-500 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-sm">Total Due</p>
                                <h2 class="font-semibold text-white">৳ {{ $total->sum('total_due') }}/-</h2>
                            </div>
                            <i class="fa-solid fa-triangle-exclamation text-[36px] opacity-80"></i>
                        </div>
                    </div>
                </div>

            </div>
            <!-- ================= END OVERVIEW ================= -->

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
                setTimeout(() => {
                    popup.classList.remove('opacity-0', 'translate-y-10');
                }, 100); 
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
