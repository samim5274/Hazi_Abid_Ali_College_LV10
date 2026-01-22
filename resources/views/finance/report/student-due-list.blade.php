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
                        <li class="breadcrumb-item" aria-current="page"><a href="{{url('/finance-fee-payment')}}">Finance Payment</a></li>
                        <li class="breadcrumb-item" aria-current="page"><a href="{{url('/due-collection')}}">Due Collection</a></li>
                        <li class="breadcrumb-item" aria-current="page">Due List</li>
                    </ul>
                </div>
            </div>

            <!-- Fee Payment List -->
            <div class="mt-6 bg-white p-6 rounded-lg shadow-md">
                <div class="flex items-center justify-between mb-4">
                    <h6 class="text-lg font-semibold">
                        Students With Due
                    </h6>

                    <div class="flex items-center gap-3 mb-3">
                        <input id="studentSearch" type="search" placeholder="Search by name / roll / class..." class="w-full sm:w-80 px-3 py-2 border rounded-lg focus:outline-none focus:ring">
                    </div>

                    <div class="flex items-center gap-3">
                        <a href="{{ url('/print-due-list') }}" class="px-3 py-1.5 text-sm font-medium bg-gray-100 text-gray-700 rounded hover:bg-gray-200 transition" target="_blank">
                            <i class="fa-solid fa-print me-2"></i>Print
                        </a>

                        <a href="{{ url('/send-mail-due-student') }}" class="px-3 py-1.5 text-sm font-medium bg-blue-100 text-blue-700 rounded hover:bg-blue-200 transition">
                            <i class="fa-solid fa-envelopes-bulk me-2"></i> Send Mail
                        </a>
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table id="dueTable" class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-3 py-3 text-center text-xs font-medium text-gray-500 uppercase">#</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Student</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Roll</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Class</th>
                                <th class="px-6 py-3 text-end text-xs font-medium text-gray-500 uppercase">Final Due</th>
                            </tr>
                        </thead>

                        <tbody id="dueTbody" class="bg-white divide-y divide-gray-200">
                            @forelse($studentsWithDue as $val)
                                <tr class="due-row">
                                    <td class="px-3 py-4 text-center text-sm text-gray-700 serial-col">
                                        {{ $loop->iteration + ($studentsWithDue->currentPage()-1) * $studentsWithDue->perPage() }}
                                    </td>

                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-700">
                                        {{ $val->first_name }} {{ $val->last_name }}
                                    </td>

                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-700">
                                        {{ $val->roll_number ?? '-' }}
                                    </td>

                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-700">
                                        {{ $val->class_name ?? '-' }}
                                    </td>

                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-red-600 text-end font-bold due-amount"
                                        data-due="{{ (float)$val->final_due }}">
                                        ৳{{ number_format($val->final_due, 2) }}
                                    </td>
                                </tr>
                            @empty
                                <tr id="emptyRow">
                                    <td colspan="5" class="px-6 py-6 text-center text-sm text-gray-500">
                                        No due students found.
                                    </td>
                                </tr>
                            @endforelse

                            {{-- Page Total row --}}
                            @if($studentsWithDue->count() > 0)
                                <tr id="pageTotalRow" class="bg-gray-50 font-semibold">
                                    <td colspan="4" class="px-6 py-4 text-right text-sm text-gray-700">Page Total:</td>
                                    <td id="pageTotalCell" class="px-6 py-4 text-sm text-end text-red-600">
                                        ৳{{ number_format($studentsWithDue->sum('final_due'), 2) }}
                                    </td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>

                {{-- Pagination --}}
                @if ($studentsWithDue->hasPages())
                        <div class="flex flex-wrap items-center justify-between mt-4 w-full">

                            {{-- Page Info --}}
                            <div class="text-sm md:text-base text-gray-600">
                                Page {{ $studentsWithDue->currentPage() }} of {{ $studentsWithDue->lastPage() }}
                                (Total Records: {{ $studentsWithDue->total() }})
                            </div>

                            {{-- Pagination --}}
                            <div class="flex items-center space-x-2">

                                {{-- Previous Button --}}
                                @if ($studentsWithDue->onFirstPage())
                                    <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                        &laquo;
                                    </span>
                                @else
                                    <a href="{{ $studentsWithDue->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                        &laquo;
                                    </a>
                                @endif

                                {{-- Page Numbers --}}
                                @php
                                    $start = max(1, $studentsWithDue->currentPage() - 2);
                                    $end = min($studentsWithDue->lastPage(), $studentsWithDue->currentPage() + 2);
                                @endphp

                                @for ($i = $start; $i <= $end; $i++)
                                    @if ($i == $studentsWithDue->currentPage())
                                        <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                                    @else
                                        <a href="{{ $studentsWithDue->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                                    @endif
                                @endfor

                                {{-- Next Button --}}
                                @if ($studentsWithDue->hasMorePages())
                                    <a href="{{ $studentsWithDue->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                        &raquo;
                                    </a>
                                @else
                                    <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                        &raquo;
                                    </span>
                                @endif

                            </div>
                        </div>
                    @endif
            </div>


        </div>
    </div>
    <!-- [ Main Content ] end -->

    @include('layouts.footer')

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

        
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
    
    
        (function () {
            const input = document.getElementById('studentSearch');
            const tbody = document.getElementById('dueTbody');
            const rows = Array.from(tbody.querySelectorAll('tr.due-row'));
            const pageTotalRow = document.getElementById('pageTotalRow');
            const pageTotalCell = document.getElementById('pageTotalCell');
            const emptyRow = document.getElementById('emptyRow');

            // Base serial start (so pagination serial stays correct)
            const baseSerialStart = rows.length
                ? parseInt(rows[0].querySelector('.serial-col')?.textContent.trim(), 10) || 1
                : 1;

            function formatBDT(num) {
                // simple format: 12345.67 -> 12,345.67
                return '৳' + Number(num || 0).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            }

            function updateTable() {
                const q = (input.value || '').trim().toLowerCase();
                let visibleCount = 0;
                let visibleDueSum = 0;

                rows.forEach((tr) => {
                    // match on all text in row (name/roll/class/due)
                    const text = tr.textContent.toLowerCase();
                    const matched = text.includes(q);

                    tr.style.display = matched ? '' : 'none';

                    if (matched) {
                        visibleCount++;
                        // update serial number for visible rows
                        const serialTd = tr.querySelector('.serial-col');
                        if (serialTd) serialTd.textContent = baseSerialStart + (visibleCount - 1);

                        // sum due (use data attribute)
                        const dueTd = tr.querySelector('.due-amount');
                        const dueVal = parseFloat(dueTd?.dataset?.due || '0') || 0;
                        visibleDueSum += dueVal;
                    }
                });

                // empty message handling (only when there were rows originally)
                if (rows.length > 0 && emptyRow) {
                    emptyRow.style.display = visibleCount === 0 ? '' : 'none';
                }

                // update total row based on filtered visible rows
                if (pageTotalRow && pageTotalCell) {
                    pageTotalRow.style.display = visibleCount === 0 ? 'none' : '';
                    pageTotalCell.textContent = formatBDT(visibleDueSum);
                }
            }

            // live search
            if (input) {
                input.addEventListener('input', updateTable);
            }
        })();
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
