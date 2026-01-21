<div class="pc-container">
    <div class="pc-content">
        <!-- Flash Message -->
        @include('layouts.message')
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="page-header-title">
                    <h5 class="mb-0 font-medium">Student Details</h5>
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="{{url('/student-list')}}">Student</a></li>
                    <li class="breadcrumb-item" aria-current="page">List</li>
                </ul>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->

    <!-- [ Main Content ] start -->
    <div class="grid grid-cols-12 gap-x-6">
        <div class="col-span-12">
            <div class="w-full mt-4">
                <div class="card">
                    <div class="bg-white rounded shadow-md p-4">
                        <form action="{{ url('/add-to-cart-2') }}" method="GET" class="w-full">
                            <div class="relative">
                                <input type="search" name="search" id="search" class="w-full rounded-xl border border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-200 py-2 px-4 outline-none transition duration-200" placeholder="Search by student name, email, father's name, mother's name, father's contact, mother's contact . . ." />

                                <!-- <button type="submit" class="absolute right-2 top-1/2 -translate-y-1/2 bg-blue-500 hover:bg-blue-600 text-white px-4 py-1.5 rounded-lg text-sm transition duration-200">Search</button> -->
                            </div>
                        </form>
                    </div>
                </div>
            <div class="card table-card">                
                <div class="card-body">
                    <div class="bg-white border border-gray-200 rounded-2xl shadow-sm overflow-hidden">

                        <!-- Header / Toolbar -->
                        <div class="px-5 py-4 border-b border-gray-200 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                            <div>
                                <h3 class="text-lg font-bold text-gray-800">Students</h3>
                                <p class="text-sm text-gray-500">Manage student profiles and information</p>
                            </div>

                            <div class="text-sm text-gray-500">
                                Total: <span class="font-semibold text-gray-800">{{ $student->total() ?? count($student) }}</span>
                            </div>
                        </div>

                        <!-- Table -->
                        <div class="overflow-x-auto">
                            <table class="min-w-full text-sm">
                                <thead class="bg-gray-50 sticky top-0 z-10">
                                    <tr class="text-left text-gray-600">
                                        <th class="px-5 py-3 font-semibold whitespace-nowrap">#</th>
                                        <th class="px-5 py-3 font-semibold whitespace-nowrap">Photo</th>
                                        <th class="px-5 py-3 font-semibold whitespace-nowrap">Student</th>
                                        <th class="px-5 py-3 font-semibold whitespace-nowrap">Contact</th>
                                        <th class="px-5 py-3 font-semibold whitespace-nowrap">Class</th>
                                        <th class="px-5 py-3 font-semibold whitespace-nowrap">DOB & Blood</th>
                                        <th class="px-5 py-3 font-semibold whitespace-nowrap text-right">Action</th>
                                    </tr>
                                </thead>

                                <tbody id="content" class="divide-y divide-gray-100">
                                    @forelse($student as $val)
                                        @php
                                            $initial = strtoupper(substr($val->first_name ?? 'S', 0, 1));
                                            $dob = $val->dob ? \Carbon\Carbon::parse($val->dob)->format('d M, Y') : 'N/A';
                                            $phone = $val->contact_number ? (str_starts_with($val->contact_number, '0') ? $val->contact_number : '0'.$val->contact_number) : 'N/A';
                                        @endphp

                                        <tr class="allData hover:bg-gray-50/70">
                                            <!-- SL -->
                                            <td class="px-5 py-4 whitespace-nowrap text-gray-500">
                                                {{ $loop->iteration + (($student->currentPage() - 1) * $student->perPage()) }}
                                            </td>

                                            <!-- Photo -->
                                            <td class="px-5 py-4 whitespace-nowrap">
                                                <a href="{{ url('/edit-student-view/'.$val->id) }}" class="inline-flex items-center">
                                                    @if($val->photo)
                                                        <img
                                                            class="w-10 h-10 rounded-full border border-gray-200 object-cover"
                                                            src="{{ asset('img/student/' . $val->photo) }}"
                                                            alt="{{ $initial }}"
                                                        />
                                                    @else
                                                        <div class="w-10 h-10 rounded-full bg-gray-100 border border-gray-200 flex items-center justify-center font-bold text-gray-700">
                                                            {{ $initial }}
                                                        </div>
                                                    @endif
                                                </a>
                                            </td>

                                            <!-- Student -->
                                            <td class="px-5 py-4 min-w-[260px]">
                                                <a href="{{ url('/edit-student-view/'.$val->id) }}" class="block font-semibold text-gray-900 hover:text-[#19b6b6] transition">
                                                    {{ $val->roll_number }} — {{ $val->first_name }} {{ $val->last_name }}
                                                </a>
                                                <div class="mt-1 text-xs text-gray-500 flex items-center gap-2">
                                                    <i class="fa-solid fa-location-dot text-gray-400"></i>
                                                    <span class="truncate max-w-[360px]">{{ $val->address1 ?? 'N/A' }}</span>
                                                </div>
                                            </td>

                                            <!-- Contact -->
                                            <td class="px-5 py-4 whitespace-nowrap">
                                                <div class="font-medium text-gray-800">{{ $val->email ?? 'N/A' }}</div>
                                                <div class="text-xs text-gray-500 mt-1 flex items-center gap-2">
                                                    <i class="fa-solid fa-phone text-gray-400"></i>
                                                    <span>{{ $phone }}</span>
                                                </div>
                                            </td>

                                            <!-- Class -->
                                            <td class="px-5 py-4 whitespace-nowrap">
                                                <div class="font-semibold text-gray-800">{{ $val->room->name ?? 'N/A' }}</div>
                                                <div class="text-xs text-gray-500 mt-1">Section: {{ $val->room->section ?? 'N/A' }}</div>
                                            </td>

                                            <!-- DOB & Blood -->
                                            <td class="px-5 py-4 whitespace-nowrap">
                                                <div class="inline-flex items-center gap-2 text-gray-700">
                                                    <i class="fa-solid fa-calendar-days text-gray-400"></i>
                                                    <span class="font-medium">{{ $dob }}</span>
                                                </div>
                                                <div class="mt-2">
                                                    <span class="inline-flex items-center gap-2 px-2.5 py-1 rounded-full bg-red-50 text-red-700 text-xs font-semibold ring-1 ring-red-200">
                                                        <i class="fa-solid fa-droplet"></i>
                                                        {{ $val->blood_group ?? 'N/A' }}
                                                    </span>
                                                </div>
                                            </td>

                                            <!-- Action -->
                                            <td class="px-5 py-4 whitespace-nowrap text-right">
                                                <a href="{{ url('/edit-student-view/'.$val->id) }}"
                                                class="inline-flex items-center gap-2 px-4 py-2 rounded-xl bg-[#19b6b6] text-white text-xs font-semibold
                                                        hover:opacity-90 transition shadow-sm">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                    Edit
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="7" class="px-5 py-12 text-center text-gray-500">
                                                <i class="fa-regular fa-folder-open text-2xl mb-2"></i>
                                                <div class="font-semibold text-gray-700">No students found</div>
                                                <div class="text-sm text-gray-500">Try adjusting your filters or add a new student.</div>
                                            </td>
                                        </tr>
                                    @endforelse

                                    <tr class="row resultData"></tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        @if ($student->hasPages())
                            <div class="px-5 py-4 border-t border-gray-200 bg-gray-50 flex flex-col sm:flex-row items-center justify-between gap-3">
                                <div class="text-sm text-gray-600">
                                    Showing
                                    <span class="font-semibold">{{ $student->firstItem() ?? 0 }}</span>
                                    to
                                    <span class="font-semibold">{{ $student->lastItem() ?? 0 }}</span>
                                    of
                                    <span class="font-semibold">{{ $student->total() ?? 0 }}</span>
                                    results
                                </div>

                                <div class="flex flex-wrap items-center justify-center gap-2">
                                    {{-- Previous --}}
                                    @if ($student->onFirstPage())
                                        <span class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-400 rounded-lg cursor-not-allowed">
                                            &laquo;
                                        </span>
                                    @else
                                        <a href="{{ $student->previousPageUrl() }}"
                                        class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-100 transition">
                                            &laquo;
                                        </a>
                                    @endif

                                    {{-- Page Numbers --}}
                                    @php
                                        $start = max(1, $student->currentPage() - 2);
                                        $end   = min($student->lastPage(), $student->currentPage() + 2);
                                    @endphp

                                    @for ($i = $start; $i <= $end; $i++)
                                        @if ($i == $student->currentPage())
                                            <span class="px-3 py-2 text-sm bg-[#19b6b6] text-white rounded-lg font-semibold">
                                                {{ $i }}
                                            </span>
                                        @else
                                            <a href="{{ $student->url($i) }}"
                                            class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-100 transition">
                                                {{ $i }}
                                            </a>
                                        @endif
                                    @endfor

                                    {{-- Next --}}
                                    @if ($student->hasMorePages())
                                        <a href="{{ $student->nextPageUrl() }}"
                                        class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-100 transition">
                                            &raquo;
                                        </a>
                                    @else
                                        <span class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-400 rounded-lg cursor-not-allowed">
                                            &raquo;
                                        </span>
                                    @endif
                                </div>
                            </div>
                        @endif

                    </div>

                </div>
            </div>
        </div>  
    </div>
    <!-- [ Main Content ] end -->
    </div>
</div>