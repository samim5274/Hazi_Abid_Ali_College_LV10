<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance - (SMS)</title>

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

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Fee Payment</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">Finance</li>
                        <li class="breadcrumb-item" aria-current="page">Fee Payment</li>
                    </ul>
                </div>
            </div>

            <div class="max-w-4xl mx-auto bg-white shadow-lg rounded-xl p-8 mt-10">
                <!-- Header -->
                <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center">
                    <i class="fa-solid fa-money-check-dollar mr-3 text-green-600"></i>
                    Record Fee Payment
                </h2>

                <!-- Form -->
                <form action="{{ url('/fee-payments') }}" method="POST" class="space-y-6">
                    @csrf
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">                    
                        <!-- Class -->
                        <div class="mb-4">
                            <label for="class_id" class="block text-sm font-medium text-gray-700 mb-2">
                                Class <span class="text-red-500">*</span>
                            </label>
                            <select name="class_id" id="class_id"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:outline-none" required>
                                <option disabled selected>-- Select Class --</option>
                                <!-- Populate dynamically -->
                                @foreach($classes as $val)
                                @if($val->id != 13)
                                <option value="{{$val->id}}">{{$val->name}}</option>
                                @endif
                                @endforeach
                            </select>
                        </div>    

                        <!-- Student -->
                        <div class="mb-4">
                            <label for="student_id" class="block text-sm font-medium text-gray-700 mb-2">
                                Student <span class="text-red-500">*</span>
                            </label>
                            <select name="student_id" id="student_id"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:outline-none" required>
                                <option disabled selected>-- Select Student --</option>
                                <!-- Populate dynamically -->
                                 @foreach($student as $std)
                                 <option value="{{$std->id}}">{{$std->first_name}} {{$std->last_name}}</option>
                                 @endforeach
                            </select>
                        </div>
                        
                    </div>

                    <!-- Fee Structure -->
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Fee Structure <span class="text-red-500">*</span></label>
                        <div id="fee-structure-container" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                            @foreach($feeStructure as $fs)
                            <div class="fee-item bg-white p-4 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-all duration-200 ease-in-out flex items-center">
                                <input type="checkbox" name="fee_structure[]" value="{{ $fs->id }}" data-amount="{{ $fs->amount }}" class="h-5 w-5 text-green-600 border-gray-300 rounded focus:ring-green-500 fee-checkbox cursor-pointer">
                                <label for="fee_structure_{{ $fs->id }}" class="ml-3 block text-base font-medium text-gray-800 flex-grow cursor-pointer">
                                    <span class="text-green-700"> {{$fs->category->name}}</span> ({{$fs->room->name}}) - <span class="font-semibold">${{ number_format($fs->amount, 2) }}</span>
                                </label>
                            </div>
                            @endforeach
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <!-- Total Amount -->
                        <div class="mb-4">
                            <label for="total_amount" class="block text-sm font-medium text-gray-700 mb-2">Total Amount</label>
                            <input type="text" id="total_amount" name="total_amount" class="w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-lg" readonly>
                        </div>

                        <div class="mb-4">
                            <label for="payment_method" class="block text-sm font-medium text-gray-700 mb-2">Payment Method</label>
                            <select name="payment_method" id="payment_method" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:outline-none">
                                <option value="Cash" selected>Cash</option>
                                <option value="Card">Card</option>
                                <option value="Bank Transfer">Bank Transfer</option>
                                <option value="Mobile Banking">Mobile Banking</option>
                            </select>
                        </div>
                        

                        <!-- Due Amount -->
                        <div class="mb-4">
                            <label for="due_amount" class="block text-sm font-medium text-gray-700 mb-2">Due Amount</label>
                            <input type="text" id="due_amount" name="due_amount" class="w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-lg" readonly>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Amount Paid -->
                        <div class="mb-4">
                            <label for="amount_paid" class="block text-sm font-medium text-gray-700 mb-2">Amount Paid <span class="text-red-500">*</span></label>
                            <input type="number" name="amount_paid" id="amount_paid" min="0" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:outline-none" placeholder="Enter amount" min="1" required>
                        </div>
                        <!-- Discount -->
                        <div class="mb-4">
                            <label for="discount" class="block text-sm font-medium text-gray-700 mb-2">Discount</label>
                            <input type="number" name="discount" id="discount" min="0" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:outline-none" placeholder="Enter discount" value="0">
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="flex justify-end space-x-3">
                        <!-- <a href="{{ url('/fee-payments') }}" class="px-5 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition">Cancel</a> -->
                        <button type="submit" class="px-5 py-2 bg-green-600 text-black rounded-lg shadow hover:bg-green-700 transition">Save Payment</button>
                    </div>
                </form>
            </div>

            <!-- Fee Payment List -->
            <div class="mt-6 bg-white p-6 rounded-lg shadow-md">
                <h6 class="text-lg font-semibold mb-4">Recent Fee Payments</h6>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th>#</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Student</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Fee Structure</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Amount Paid</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Discount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Due</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Payment Date</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach($feePayment as $val)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                    {{ $val->student->first_name }} {{ $val->student->last_name }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    {{ $val->feeStructure->category->name }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    {{ number_format($val->amount_paid, 2) }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-blue-500 font-semibold">
                                    {{ number_format($val->discount, 2) }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-red-500 font-semibold">
                                    {{ number_format($val->due_amount, 2) }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    {{ \Carbon\Carbon::parse($val->payment_date)->format('d M Y') }}
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- paginatior -->
                @if ($feePayment->hasPages())
                    <div class="flex flex-wrap items-center justify-center mt-4 space-x-2">

                        {{-- Previous Button --}}
                        @if ($feePayment->onFirstPage())
                            <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                &laquo;
                            </span>
                        @else
                            <a href="{{ $feePayment->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                &laquo;
                            </a>
                        @endif

                        {{-- Page Numbers --}}
                        @php
                            $start = max(2, $feePayment->currentPage() - 2);
                            $end = min($feePayment->lastPage(), $feePayment->currentPage() + 2);
                        @endphp

                        @for ($i = $start; $i <= $end; $i++)
                            @if ($i == $feePayment->currentPage())
                                <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                            @else
                                <a href="{{ $feePayment->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                            @endif
                        @endfor

                        {{-- Next Button --}}
                        @if ($feePayment->hasMorePages())
                            <a href="{{ $feePayment->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                 &raquo;
                            </a>
                        @else
                            <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                 &raquo;
                            </span>
                        @endif
                    </div>
                @endif
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

        document.addEventListener('DOMContentLoaded', function () {
            const classIdDropdown = document.getElementById('class_id');
            const studentDropdown = document.getElementById('student_id');
            const feeStructureContainer = document.getElementById('fee-structure-container');

            classIdDropdown.addEventListener('change', function() {
                const classId = this.value;

                // Fetch students
                fetch(`/students/${classId}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        studentDropdown.innerHTML = '<option disabled selected>-- Select Student --</option>';
                        data.forEach(student => {
                            const option = document.createElement('option');
                            option.value = student.id;
                            option.textContent = `${student.first_name} ${student.last_name}`;
                            studentDropdown.appendChild(option);
                        });
                    })
                    .catch(error => {
                        console.error('Error fetching students:', error);
                    });

                // Fetch fee structures
                fetch(`/fee-structures/${classId}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        feeStructureContainer.innerHTML = '';
                        data.forEach(fs => {
                            const feeStructure = document.createElement('div');
                            feeStructure.className = 'fee-item bg-white p-4 rounded-lg shadow-sm border border-gray-200 hover:shadow-md transition-all duration-200 ease-in-out flex items-center';
                            feeStructure.innerHTML = `
                                <input type="checkbox" name="fee_structure[]" value="${fs.id}" data-amount="${fs.amount}" class="h-5 w-5 text-green-600 border-gray-300 rounded focus:ring-green-500 fee-checkbox cursor-pointer">
                                <label for="fee_structure_${fs.id}" class="ml-3 block text-base font-medium text-gray-800 flex-grow cursor-pointer">
                                    <span class="text-green-700">${fs.category.name}</span> (${fs.room.name}) - <span class="font-semibold">$${parseFloat(fs.amount).toFixed(2)}</span>
                                </label>
                            `;
                            feeStructureContainer.appendChild(feeStructure);
                        });
                        // Re-initialize checkbox event listeners
                        initializeFeeCheckboxEventListeners();
                    })
                    .catch(error => {
                        console.error('Error fetching fee structures:', error);
                    });
            });

            function initializeFeeCheckboxEventListeners() {
                const feeCheckboxes = document.querySelectorAll('.fee-checkbox');
                const totalAmountInput = document.getElementById('total_amount');
                const amountPaidInput = document.getElementById('amount_paid');
                const dueAmountInput = document.getElementById('due_amount');
                const discountInput = document.getElementById('discount');

                function calculateTotal() {
                    let total = 0;
                    feeCheckboxes.forEach(checkbox => {
                        if (checkbox.checked) {
                            total += parseFloat(checkbox.dataset.amount);
                        }
                    });
                    totalAmountInput.value = total.toFixed(2);
                    calculateDue();
                }

                function calculateDue() {
                    const total = parseFloat(totalAmountInput.value) || 0;
                    const paid = parseFloat(amountPaidInput.value) || 0;
                    const discount = parseFloat(discountInput.value) || 0;
                    const due = total - paid - discount;
                    dueAmountInput.value = due.toFixed(2);
                }

                feeStructureContainer.addEventListener('change', function(e) {
                    if (e.target.classList.contains('fee-checkbox')) {
                        const checkbox = e.target;
                        const feeItem = checkbox.closest('.fee-item');
                        if (checkbox.checked) {
                            feeItem.classList.add('selected-fee-item');
                        } else {
                            feeItem.classList.remove('selected-fee-item');
                        }
                        calculateTotal();
                    }
                });

                amountPaidInput.addEventListener('input', calculateDue);
                discountInput.addEventListener('input', calculateDue);

                calculateTotal(); // Initial calculation
            }

            initializeFeeCheckboxEventListeners();
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
