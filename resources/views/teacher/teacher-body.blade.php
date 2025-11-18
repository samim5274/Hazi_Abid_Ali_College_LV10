<div class="pc-container">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="page-header-title">
                    <h5 class="mb-0 font-medium">Teacher Details</h5>
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="{{url('/teacher-list')}}">Teacher</a></li>
                    <li class="breadcrumb-item" aria-current="page">List</li>
                </ul>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->

    <!-- [ Main Content ] start -->
    <div class="grid grid-cols-12 gap-x-6">
        <div class="col-span-12">
            <div class="card table-card">
                <div class="card-header">
                    <h5>Add new Teacher</h5>
                </div>
                <div class="card">
                    <div class="bg-white rounded shadow-md p-4">
                        <form action="#" method="GET" class="w-full">
                            <div class="relative">
                                <input type="search" name="search" id="search" class="w-full rounded-xl border border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-200 py-2 px-4 outline-none transition duration-200" placeholder="Search by teacher name, email, father's name, mother's name, father's contact, mother's contact . . ." />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <tbody id="content">
                                @foreach($teacher as $val)
                                <tr class="unread allData">
                                    <td>
                                        @if($val->photo)
                                            <a href="{{url('/edit-teacher-view/'.$val->id)}}"><img class="rounded-full max-w-10" style="width: 40px" src="{{ asset('img/teacher/' . $val->photo) }}" alt="activity-user" /></a>
                                        @else
                                            <a href="{{url('/edit-teacher-view/'.$val->id)}}"><span class="text-muted">No Image</span></a>
                                        @endif
                                    </td>
                                    <td>
                                        <h6 class="mb-1"><a href="{{url('/edit-teacher-view/'.$val->id)}}">{{$val->first_name}} {{$val->last_name}}</a></h6>
                                        <p class="m-0">{{$val->designation}}</p>
                                    </td>
                                    <td>
                                        <h6 class="mb-1">{{$val->email}}</h6>
                                        <p class="m-0">{{$val->address}} || 0{{$val->contact_number}}</p>
                                    </td>
                                    <td>
                                        <h6 class="text-muted">
                                            <i class="fas fa-circle text-success text-[10px] ltr:mr-4 rtl:ml-4"></i>
                                            {{ \Carbon\Carbon::parse($val->dob)->format('d M, Y') }}
                                        </h6>
                                        <p class="m-0"><i class="fa fa-droplet text-red-500 text-[10px] ltr:mr-4 rtl:ml-4"></i>{{$val->blood_group}}</p>
                                    </td>
                                    <td>
                                        <a href="{{url('/edit-teacher-view/'.$val->id)}}" class="badge bg-theme-bg-1 text-white text-[12px]"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                                    </td>
                                </tr>
                                @endforeach
                                <tr class="row resultData"></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>  
    </div>
    <!-- [ Main Content ] end -->
    </div>
</div>