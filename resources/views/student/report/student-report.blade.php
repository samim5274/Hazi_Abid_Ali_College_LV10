<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student - (SMS)</title>

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

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Student Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/student-list')}}">Student list</a></li>
                        <li class="breadcrumb-item" aria-current="page">Gender wise Student List</li>
                    </ul>
                </div>
            </div>

            <!-- search section -->
             <div class="card rounded-md border shadow-md">
                <div class="card-body">
                    @php
                        $today = date('Y-m-d');
                    @endphp

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
                        </div>   
                    </form>

                </div>
             </div>

            <!-- Card -->
            <div class="card rounded-lg border shadow-sm">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <tbody>
                                @foreach($findData as $val)
                                <tr class="unread">
                                    <td>{{$loop->iteration}}</td>
                                    <td>
                                        @if($val->photo)
                                            <a href="{{url('/edit-student-view/'.$val->id)}}"><img class="rounded-full max-w-10" style="width: 40px" src="{{ asset('img/student/' . $val->photo) }}" alt="activity-user" /></a>
                                        @else
                                            <a href="{{url('/edit-student-view/'.$val->id)}}"><span class="text-muted">No Image</span></a>
                                        @endif
                                    </td>
                                    <td>
                                        <h6 class="mb-1"><a href="{{url('/edit-student-view/'.$val->id)}}">{{$val->first_name}} {{$val->last_name}}</a></h6>
                                        <p class="m-0">{{$val->gender}}</p>
                                    </td>
                                    <td>
                                        <h6 class="mb-1">{{$val->email}}</h6>
                                        <p class="m-0">{{$val->contact_number}}</p>
                                    </td>
                                    <td>
                                        <h6 class="mb-1">{{$val->room->name}}</h6>
                                        <p class="m-0">{{$val->room->section}}</p>
                                    </td>
                                    <td>
                                        <h6 class="text-muted">
                                            <i class="fas fa-circle text-success text-[10px] ltr:mr-4 rtl:ml-4"></i>
                                            {{ \Carbon\Carbon::parse($val->dob)->format('d M, Y') }}
                                        </h6>
                                        <p class="m-0"><i class="fa fa-droplet text-red-500 text-[10px] ltr:mr-4 rtl:ml-4"></i>{{$val->blood_group}}</p>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>                            
                        </table>
                    </div>
                    <!-- paginatior -->
                    @if ($findData->hasPages())
                        <div class="flex flex-wrap items-center justify-between mt-4 w-full">

                            {{-- Page Info --}}
                            <div class="text-sm md:text-base text-gray-600">
                                Page {{ $findData->currentPage() }} of {{ $findData->lastPage() }} 
                                (Total Records: {{ $findData->total() }})
                            </div>

                            {{-- Pagination --}}
                            <div class="flex items-center space-x-2">

                                {{-- Previous Button --}}
                                @if ($findData->onFirstPage())
                                    <span class="px-2 py-1 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                        &laquo; 
                                    </span>
                                @else
                                    <a href="{{ $findData->appends(request()->query())->previousPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                        &laquo; 
                                    </a>
                                @endif

                                {{-- Page Numbers --}}
                                @php
                                    $start = max(1, $findData->currentPage() - 2);
                                    $end = min($findData->lastPage(), $findData->currentPage() + 2);
                                @endphp

                                @for ($i = $start; $i <= $end; $i++)
                                    @if ($i == $findData->currentPage())
                                        <span class="px-2 py-1 text-sm md:text-base bg-[#3F4D67] text-white rounded-lg">{{ $i }}</span>
                                    @else
                                        <a href="{{ $findData->appends(request()->query())->url($i) }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                                    @endif
                                @endfor

                                {{-- Next Button --}}
                                @if ($findData->hasMorePages())
                                    <a href="{{ $findData->appends(request()->query())->nextPageUrl() }}" class="px-2 py-1 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
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
