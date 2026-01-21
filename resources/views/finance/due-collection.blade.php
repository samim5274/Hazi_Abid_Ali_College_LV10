<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Fee Payment</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/finance-fee-payment') }}">Finance</a></li>
                        <li class="breadcrumb-item" aria-current="page">Due Collection</li>
                    </ul>
                </div>
            </div>

            <div class="max-w-4xl mx-auto bg-white shadow-xl rounded-2xl p-8 mt-10">

                <!-- Header -->
                <div class="flex items-center justify-between mb-8">
                    <h2 class="text-2xl font-bold text-gray-800 flex items-center gap-3">
                        <i class="fa-solid fa-money-check-dollar text-[#3F4D67] text-3xl"></i>
                        Due Collection
                    </h2>

                    <a href="{{ url()->previous() }}" class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium rounded-lg bg-[#3F4D67] text-white
                            hover:bg-[#596d92] hover:text-white transition duration-200 shadow-sm">
                        <i class="fa-solid fa-arrow-left"></i>
                        Back
                    </a>

                </div>

                <!-- Form -->
                <form action="{{ url('/due-collection-payment') }}" method="POST" class="space-y-8">
                    @csrf

                    <!-- Class & Student -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <!-- Class -->
                        <div>
                            <label for="class_id" class="block text-sm font-semibold text-gray-600 mb-1">
                                Class <span class="text-red-500">*</span>
                            </label>
                            <select id="class_id" name="class_id"
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-xl
                                focus:ring-2 focus:ring-[#3F4D67] focus:outline-none">
                                <option disabled selected>-- Select Class --</option>
                                @foreach($classes as $val)
                                    <option value="{{ $val->id }}">{{ $val->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Student -->
                        <div>
                            <label for="student_id" class="block text-sm font-semibold text-gray-600 mb-1">
                                Student <span class="text-red-500">*</span>
                            </label>
                            <select id="student_id" name="student_id"
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-xl
                                focus:ring-2 focus:ring-[#3F4D67] focus:outline-none">
                                <option disabled selected>-- Select Student --</option>
                                @foreach($students as $std)
                                    <option value="{{ $std->id }}">
                                        {{ $std->roll_number }} - {{ $std->first_name }} {{ $std->last_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Student Due Info -->
                        <div id="studentDueBox" class="hidden">
                            <div class="flex items-center justify-between p-5 rounded-xl
                                bg-red-50 border-l-4 border-red-500 shadow-sm">
                                <div>
                                    <p class="text-sm text-gray-500">Outstanding Due</p>
                                    <h3 id="studentDueAmount" class="text-2xl font-bold text-red-600 mt-1">
                                        ৳ 0/-
                                    </h3>
                                </div>
                                <i class="fa-solid fa-triangle-exclamation text-3xl text-red-400"></i>
                            </div>
                        </div>

                        <!-- Remaining Due Info -->
                        <div id="remainingDueBox" class="hidden mt-3">
                            <div class="flex items-center justify-between p-4 rounded-xl
                                bg-green-50 border-l-4 border-green-500 shadow-sm">
                                <div>
                                    <p class="text-sm text-gray-500">Remaining Due</p>
                                    <h3 id="remainingDueAmount" class="text-2xl font-bold text-green-600 mt-1">
                                        ৳ 0/-
                                    </h3>
                                    <input type="hidden" name="previous_due" id="previous_due" value="0">
                                    <input type="hidden" name="calculated_remaining_due" id="calculated_remaining_due" value="0">
                                </div>
                                <i class="fa-solid fa-circle-check text-3xl text-green-400"></i>
                            </div>
                        </div>

                    </div>


                    <!-- Payment Info -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <!-- Payment Method -->
                        <div>
                            <label for="payment_method" class="block text-sm font-semibold text-gray-600 mb-1">
                                Payment Method
                            </label>
                            <select id="payment_method" name="payment_method"
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-xl
                                focus:ring-2 focus:ring-[#3F4D67] focus:outline-none">
                                <option value="Cash">Cash</option>
                                <option value="Card">Card</option>
                                <option value="Bank Transfer">Bank Transfer</option>
                                <option value="Mobile Banking">Mobile Banking</option>
                            </select>
                        </div>

                        <!-- Payment Amount -->
                        <div>
                            <label for="txtPaymentAmount" class="block text-sm font-semibold text-gray-600 mb-1">
                                Payment Amount
                            </label>
                            <input type="number" id="txtPaymentAmount" name="txtPaymentAmount"
                                placeholder="Enter amount"
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-xl
                                focus:ring-2 focus:ring-[#3F4D67] focus:outline-none">
                        </div>
                    </div>

                    <!-- Actions -->
                    <div class="flex justify-end gap-3 pt-4">
                        <button type="reset"
                            class="px-6 py-2.5 rounded-xl border border-gray-300 text-gray-600
                            hover:bg-gray-100 transition">
                            Reset
                        </button>

                        <button type="submit"
                            class="px-6 py-2.5 rounded-xl bg-[#3F4D67] text-white
                            shadow-md hover:bg-[#526486] transition">
                            <i class="fa-solid fa-floppy-disk mr-1"></i>
                            Save Payment
                        </button>
                    </div>

                </form>
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
        document.addEventListener("DOMContentLoaded", () => {

            // ================= POPUP =================
            const popup = document.getElementById('popup');
            if (popup) {
                setTimeout(() => {
                    popup.classList.remove('opacity-0', 'translate-y-10');
                }, 100);
                setTimeout(() => {
                    popup.classList.add('opacity-0', 'translate-y-10');
                }, 3000);
            }

            // ================= ELEMENTS =================
            const classIdDropdown = document.getElementById('class_id');
            const studentDropdown = document.getElementById('student_id');

            const dueBox = document.getElementById('studentDueBox');
            const dueAmountText = document.getElementById('studentDueAmount');

            const paymentInput = document.getElementById('txtPaymentAmount');
            const remainingBox = document.getElementById('remainingDueBox');
            const remainingText = document.getElementById('remainingDueAmount');

            const submitBtn = document.querySelector('button[type="submit"]');

            // hidden inputs (optional but useful)
            const previousDueInput = document.getElementById('previous_due');
            const calcRemainingInput = document.getElementById('calculated_remaining_due');

            let studentDue = 0;

            // initial reset
            resetPaymentUI();

            // ================= LOAD STUDENTS =================
            classIdDropdown.addEventListener('change', function () {
                const classId = this.value;

                // reset UI + reset student dropdown
                studentDropdown.innerHTML = '<option disabled selected>-- Select Student --</option>';
                resetPaymentUI();

                fetch(`/students/${classId}`)
                    .then(res => res.ok ? res.json() : Promise.reject(res))
                    .then(data => {
                        data.forEach(student => {
                            const option = document.createElement('option');
                            option.value = student.id;
                            option.textContent = `${student.roll_number} - ${student.first_name} ${student.last_name}`;
                            studentDropdown.appendChild(option);
                        });
                    })
                    .catch(err => console.error('students fetch error:', err));
            });

            // ================= LOAD STUDENT DUE =================
            studentDropdown.addEventListener('change', function () {
                const studentId = this.value;

                fetch(`/student/payment-info/${studentId}`)
                    .then(res => res.ok ? res.json() : Promise.reject(res))
                    .then(data => {
                        studentDue = parseFloat(data.final_total_due) || 0;

                        // show due box
                        dueBox.classList.remove('hidden');
                        dueAmountText.innerText = `৳ ${studentDue}/-`;

                        // set hidden previous due
                        if (previousDueInput) previousDueInput.value = studentDue;

                        // reset payment input + remaining
                        paymentInput.value = '';
                        updateRemaining(studentDue);
                        if (calcRemainingInput) calcRemainingInput.value = studentDue;

                        // enable submit by default
                        enableSubmit();

                        // due color
                        dueAmountText.classList.toggle('text-red-600', studentDue > 0);
                        dueAmountText.classList.toggle('text-[#3F4D67]', studentDue === 0);
                    })
                    .catch(err => console.error('payment-info fetch error:', err));
            });

            // ================= AUTO CALCULATE =================
            paymentInput.addEventListener('input', function () {
                const payment = parseFloat(this.value) || 0;

                // if no student selected, do nothing
                if (!studentDropdown.value) return;

                const remaining = studentDue - payment;
                remainingBox.classList.remove('hidden');

                if (payment > studentDue) {
                    remainingText.innerText = 'Over Payment!';
                    remainingText.className = 'text-2xl font-bold text-red-600';

                    disableSubmit();

                    // keep safe value
                    if (calcRemainingInput) calcRemainingInput.value = studentDue;
                } else {
                    const fixedRemaining = Math.max(0, remaining);

                    updateRemaining(fixedRemaining);
                    if (calcRemainingInput) calcRemainingInput.value = fixedRemaining;

                    enableSubmit();
                }
            });

            // ================= HELPERS =================
            function updateRemaining(amount) {
                remainingBox.classList.remove('hidden');
                remainingText.innerText = `৳ ${amount}/-`;
                remainingText.className = 'text-2xl font-bold text-[#3F4D67]';
            }

            function resetPaymentUI() {
                studentDue = 0;
                paymentInput.value = '';

                dueBox.classList.add('hidden');
                remainingBox.classList.add('hidden');

                dueAmountText.innerText = `৳ 0/-`;
                remainingText.innerText = `৳ 0/-`;

                if (previousDueInput) previousDueInput.value = 0;
                if (calcRemainingInput) calcRemainingInput.value = 0;

                enableSubmit();
            }

            function disableSubmit() {
                submitBtn.disabled = true;
                submitBtn.classList.add('opacity-50', 'cursor-not-allowed');
            }

            function enableSubmit() {
                submitBtn.disabled = false;
                submitBtn.classList.remove('opacity-50', 'cursor-not-allowed');
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
