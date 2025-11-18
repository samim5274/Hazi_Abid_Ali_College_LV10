<div class="pc-container">
    <div class="pc-content">
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
                <div class="card-header">
                    <h5>Add new Student</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <tbody id="content">
                                @foreach($student as $val)
                                <tr class="unread allData">
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
                                        <p class="m-0">{{$val->address}}</p>
                                    </td>
                                    <td>
                                        <h6 class="mb-1">{{$val->email}}</h6>
                                        <p class="m-0">0{{$val->contact_number}}</p>
                                    </td>
                                    <td>
                                        <h6 class="mb-1">{{$val->room->section}}</h6>
                                        <p class="m-0">{{$val->room->name}}</p>
                                    </td>
                                    <td>
                                        <h6 class="text-muted">
                                            <i class="fas fa-circle text-success text-[10px] ltr:mr-4 rtl:ml-4"></i>
                                            {{ \Carbon\Carbon::parse($val->dob)->format('d M, Y') }}
                                        </h6>
                                        <p class="m-0"><i class="fa fa-droplet text-red-500 text-[10px] ltr:mr-4 rtl:ml-4"></i>{{$val->blood_group}}</p>
                                    </td>
                                    <td>
                                        <a href="{{url('/edit-student-view/'.$val->id)}}" class="badge bg-theme-bg-1 text-white text-[12px]"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                                    </td>
                                </tr>
                                @endforeach
                                <tr class="row resultData"></tr>
                            </tbody>                            
                        </table>

                        <!-- paginatior -->
                        @if ($student->hasPages())
                            <div class="flex flex-wrap items-center justify-center mt-4 space-x-2">

                                {{-- Previous Button --}}
                                @if ($student->onFirstPage())
                                    <span class="px-4 py-2 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                        &laquo; Previous
                                    </span>
                                @else
                                    <a href="{{ $student->previousPageUrl() }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                        &laquo; Previous
                                    </a>
                                @endif

                                {{-- Page Numbers --}}
                                @php
                                    $start = max(2, $student->currentPage() - 2);
                                    $end = min($student->lastPage(), $student->currentPage() + 2);
                                @endphp

                                @for ($i = $start; $i <= $end; $i++)
                                    @if ($i == $student->currentPage())
                                        <span class="px-4 py-2 text-sm md:text-base bg-theme-bg-1 text-white rounded-lg">{{ $i }}</span>
                                    @else
                                        <a href="{{ $student->url($i) }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">{{ $i }}</a>
                                    @endif
                                @endfor

                                {{-- Next Button --}}
                                @if ($student->hasMorePages())
                                    <a href="{{ $student->nextPageUrl() }}" class="px-4 py-2 text-sm md:text-base bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors">
                                        Next &raquo;
                                    </a>
                                @else
                                    <span class="px-4 py-2 text-sm md:text-base bg-gray-200 text-gray-500 rounded-lg cursor-not-allowed">
                                        Next &raquo;
                                    </span>
                                @endif
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