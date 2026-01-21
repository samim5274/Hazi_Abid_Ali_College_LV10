<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student - {{ $company->name }}</title>

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
                        <h5 class="mb-1 font-semibold text-gray-800">Student Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/student-list')}}">Student list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Student Filter</li>
                    </ul>
                </div>
            </div>

            <!-- search section -->
            <div class="card rounded-md border shadow-md">
                <div class="card-body">
                    <form action="{{url('/find-gender-wise-student')}}" method="GET" class="p-4" id="filter-form">
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-5 gap-6">                           

                            <div class="flex flex-col">
                                <label for="gender_id" class="text-sm font-medium text-gray-700 mb-1">Gender</label>
                                <select name="gender_id" id="gender_id" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                    <option value="">-- Select Gender --</option>                                    
                                    <option value="Male" {{ request('gender_id') == 'Male' ? 'selected' : '' }}>Male</option>
                                    <option value="Female" {{ request('gender_id') == 'Female' ? 'selected' : '' }}>Female</option>
                                    <option value="Other" {{ request('gender_id') == 'Other' ? 'selected' : '' }}>Other</option>
                                </select>
                            </div>   

                            <div class="flex flex-col">
                                <label for="class" class="text-sm font-medium text-gray-700 mb-1">Class</label>
                                <select name="class_id" id="class_id" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                    <option value="">-- Select class --</option>
                                    @foreach($classes as $val)
                                    @if($val->id != 13)
                                    <option value="{{$val->id}}" {{ request('class_id') == $val->id ? 'selected' : '' }}>{{$val->name}} - ( {{$val->section}} )</option>
                                    @endif
                                    @endforeach
                                </select>
                            </div>

                            <div class="flex flex-col">
                                <label for="status" class="text-sm font-medium text-gray-700 mb-1">Status</label>
                                <select name="status" id="status" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                    <option value="">-- Select Status --</option>
                                    <option value="1" {{ request('status') == 1 ? 'selected' : '' }}>Active</option>
                                    <option value="2" {{ request('status') == 2 ? 'selected' : '' }}>De-Active</option>
                                </select>
                            </div>

                            <div class="flex flex-col">
                                <label for="religion" class="text-sm font-medium text-gray-700 mb-1">Religion</label>
                                <select name="religion" id="religion" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                    <option value="">-- Select Religion --</option>
                                    <option value="Islam" {{ request('religion') == 'Islam' ? 'selected' : '' }}>Islam</option>
                                    <option value="Hindu" {{ request('religion') == 'Hindu' ? 'selected' : '' }}>Hindu</option>
                                    <option value="Christian" {{ request('religion') == 'Christian' ? 'selected' : '' }}>Christian</option>
                                    <option value="Buddhist" {{ request('religion') == 'Buddhist' ? 'selected' : '' }}>Buddhist</option>
                                    <option value="Other's" {{ request('religion') == "Other's" ? 'selected' : '' }}>Other's</option>
                                </select>
                            </div>

                            <div class="flex flex-col">
                                <label for="blood_group" class="text-sm font-medium text-gray-700 mb-1">Blood Group</label>
                                <select name="blood_group" id="blood_group" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                    <option value="">-- Select Blood Group --</option>
                                    <option value="A+" {{ request('blood_group') == 'A+' ? 'selected' : '' }}>A+</option>
                                    <option value="A-" {{ request('blood_group') == 'A-' ? 'selected' : '' }}>A-</option>
                                    <option value="B+" {{ request('blood_group') == 'B+' ? 'selected' : '' }}>B+</option>
                                    <option value="B-" {{ request('blood_group') == 'B-' ? 'selected' : '' }}>B-</option>
                                    <option value="AB+" {{ request('blood_group') == 'AB+' ? 'selected' : '' }}>AB+</option>
                                    <option value="AB-" {{ request('blood_group') == 'AB-' ? 'selected' : '' }}>AB-</option>
                                    <option value="O+" {{ request('blood_group') == 'O+' ? 'selected' : '' }}>O+</option>
                                    <option value="O-" {{ request('blood_group') == 'O-' ? 'selected' : '' }}>O-</option>
                                </select>
                            </div>
                            <div class="flex flex-col">
                                <label for="Father_profession" class="text-sm font-medium text-gray-700 mb-1">Father Profession</label>
                                <select name="Father_profession" id="Father_profession" class="border border-gray-300 rounded-lg px-3 py-2 text-md focus:ring-2 focus:ring-theme-bg-1 focus:outline-none filter-input">
                                    <option value="">-- Select Profession --</option>                                    
                                    @foreach($allProfessions as $profession)
                                        <option value="{{ $profession->father_profession }}" 
                                            {{ request('Father_profession') == $profession->father_profession ? 'selected' : '' }}>
                                            {{ $profession->father_profession }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                        </div>   
                    </form>

                </div>
             </div>

            <!-- Card -->
            <div class="card rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
                <!-- Header -->
                <div class="bg-gray-50 border-b px-5 py-4 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Students List</h3>
                        <p class="text-sm text-gray-500">View student information and details</p>
                    </div>
                    <div class="text-sm text-gray-500">
                        Total: <span class="font-semibold text-gray-800">{{ $students->total() }}</span>
                    </div>
                </div>

                <div class="card-body p-0">
                    <div class="overflow-x-auto">
                        <table class="min-w-full text-sm">
                            <thead class="bg-white sticky top-0 z-10 border-b">
                                <tr class="text-left text-gray-600">
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">#</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">Photo</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">Student</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">Contact</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">Class</th>
                                    <th class="px-5 py-3 font-semibold whitespace-nowrap">DOB & Blood</th>
                                </tr>
                            </thead>

                            <tbody class="divide-y divide-gray-100">
                                @forelse($students as $val)
                                    @php
                                        $initial = strtoupper(substr($val->first_name ?? 'S', 0, 1));
                                        $dob = $val->dob ? \Carbon\Carbon::parse($val->dob)->format('d M, Y') : 'N/A';
                                    @endphp

                                    <tr class="hover:bg-gray-50/70 transition">
                                        <!-- SL -->
                                        <td class="px-5 py-4 whitespace-nowrap text-gray-500">
                                            {{ $loop->iteration + (($students->currentPage() - 1) * $students->perPage()) }}
                                        </td>

                                        <!-- Photo -->
                                        <td class="px-5 py-4 whitespace-nowrap">
                                            <a href="{{ url('/edit-student-view/'.$val->id) }}" class="inline-flex items-center">
                                                @if($val->photo)
                                                    <img
                                                        class="w-10 h-10 rounded-full border border-gray-200 object-cover"
                                                        src="{{ asset('img/student/' . $val->photo) }}"
                                                        alt="Student photo"
                                                    />
                                                @else
                                                    <div class="w-10 h-10 rounded-full bg-gray-100 border border-gray-200 flex items-center justify-center font-bold text-gray-700">
                                                        {{ $initial }}
                                                    </div>
                                                @endif
                                            </a>
                                        </td>

                                        <!-- Student -->
                                        <td class="px-5 py-4 min-w-[220px]">
                                            <a href="{{ url('/edit-student-view/'.$val->id) }}"
                                            class="block font-semibold text-gray-900 hover:text-[#19b6b6] transition">
                                                {{ $val->first_name }} {{ $val->last_name }}
                                            </a>
                                            <div class="mt-1 text-xs text-gray-500 inline-flex items-center gap-2">
                                                <i class="fa-solid fa-user text-gray-400"></i>
                                                <span>{{ $val->gender ?? 'N/A' }}</span>
                                                <i class="fa-solid fa-book text-gray-400"></i>
                                                <span>{{ $val->roll_number ?? 'N/A' }}</span>
                                            </div>
                                        </td>

                                        <!-- Contact -->
                                        <td class="px-5 py-4 whitespace-nowrap">
                                            <div class="font-medium text-gray-800">{{ $val->email ?? 'N/A' }}</div>
                                            <div class="mt-1 text-xs text-gray-500 inline-flex items-center gap-2">
                                                <i class="fa-solid fa-phone text-gray-400"></i>
                                                <span>{{ $val->contact_number ?? 'N/A' }}</span>
                                            </div>
                                        </td>

                                        <!-- Class -->
                                        <td class="px-5 py-4 whitespace-nowrap">
                                            <div class="font-semibold text-gray-800">{{ $val->room->name ?? 'N/A' }}</div>
                                            <div class="mt-1 text-xs text-gray-500">Section: {{ $val->room->section ?? 'N/A' }}</div>
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
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6" class="px-5 py-12 text-center text-gray-500">
                                            <i class="fa-regular fa-folder-open text-2xl mb-2"></i>
                                            <div class="font-semibold text-gray-700">No students found</div>
                                            <div class="text-sm text-gray-500">Try adjusting your filters.</div>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    @if ($students->hasPages())
                        <div class="px-5 py-4 border-t bg-gray-50 flex flex-col md:flex-row md:items-center md:justify-between gap-3">

                            {{-- Page Info --}}
                            <div class="text-sm text-gray-600">
                                Page <span class="font-semibold">{{ $students->currentPage() }}</span> of
                                <span class="font-semibold">{{ $students->lastPage() }}</span>
                                • Total <span class="font-semibold">{{ $students->total() }}</span>
                            </div>

                            {{-- Pagination Buttons --}}
                            <div class="flex items-center gap-2 flex-wrap">

                                {{-- Previous --}}
                                @if ($students->onFirstPage())
                                    <span class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-400 rounded-lg cursor-not-allowed">
                                        &laquo;
                                    </span>
                                @else
                                    <a href="{{ $students->appends(request()->query())->previousPageUrl() }}"
                                    class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-100 transition">
                                        &laquo;
                                    </a>
                                @endif

                                {{-- Page Numbers --}}
                                @php
                                    $start = max(1, $students->currentPage() - 2);
                                    $end = min($students->lastPage(), $students->currentPage() + 2);
                                @endphp

                                @for ($i = $start; $i <= $end; $i++)
                                    @if ($i == $students->currentPage())
                                        <span class="px-3 py-2 text-sm bg-[#3F4D67] text-white rounded-lg font-semibold">
                                            {{ $i }}
                                        </span>
                                    @else
                                        <a href="{{ $students->appends(request()->query())->url($i) }}"
                                        class="px-3 py-2 text-sm bg-white border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-100 transition">
                                            {{ $i }}
                                        </a>
                                    @endif
                                @endfor

                                {{-- Next --}}
                                @if ($students->hasMorePages())
                                    <a href="{{ $students->appends(request()->query())->nextPageUrl() }}"
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


            <!-- Card End -->
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

    <script>
        document.querySelectorAll('.filter-input').forEach(function(element) {
            element.addEventListener('change', function() {
                document.getElementById('filter-form').submit();
            });
        });
    </script>

</body>
</html>
