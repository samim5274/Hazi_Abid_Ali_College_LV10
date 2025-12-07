<div class="pc-container">
      <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
          <div class="page-block">
            <div class="page-header-title">
              <h5 class="mb-0 font-medium">Dashboard</h5>
            </div>
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
              <li class="breadcrumb-item" aria-current="page">Dashboard</li>
            </ul>
          </div>
        </div>
        <!-- [ breadcrumb ] end -->

        <!-- [ Main Content ] start -->
        <div class="grid grid-cols-12 gap-x-6">

          <div class="col-span-12 xl:col-span-3 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Total Student</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-graduation-cap text-success-500 text-[30px] mr-1.5"></i>
                    {{ $totalStudent }}
                  </h3>
                  @php
                      $percentage = $totalStudent > 0 ? ($totalAttendance / $totalStudent) * 100 : 0;
                      $percentageA = $totalStudent > 0 ? ($totalAbsent / $totalStudent) * 100 : 0;
                      $totalPercentage = $percentage + $percentageA;
                  @endphp
                  <p class="mb-0">{{ number_format($totalPercentage, 2) }}%</p>
                </div>
              </div>
            </div>
          </div>




          <div class="col-span-12 xl:col-span-3 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Boys</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-mars text-success-500 text-[30px] mr-1.5"></i>
                    {{ $maleStudent }}
                  </h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 xl:col-span-3 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Girls</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-venus-mars text-success-500 text-[30px] mr-1.5"></i>
                    {{ $femaleStudent }}
                  </h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 xl:col-span-3 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Other's</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-non-binary text-success-500 text-[30px] mr-1.5"></i>
                    {{ $otherStudent }}
                  </h3>
                </div>
              </div>
            </div>
          </div>



          <div class="col-span-12 xl:col-span-6 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Today's Attendance</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-mitten text-purple-500 text-[30px] mr-1.5"></i>
                    {{ $totalAttendance }}
                  </h3>
                  <p class="mb-0">{{ number_format($percentage, 2) }}%</p>
                </div>
                <div class="w-full bg-theme-bodybg rounded-lg h-1.5 mt-6 dark:bg-themedark-bodybg">
                  <div class="bg-theme-bg-2 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar"
                    style="width: {{ number_format($percentage, 2) }}%"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 xl:col-span-6 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Today's Absent</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-mitten text-red-500 text-[30px] mr-1.5"></i>
                    {{ $totalAbsent }}
                  </h3>
                  <p class="mb-0">{{ number_format($percentageA, 2) }}%</p>
                </div>
                <div class="w-full bg-theme-bodybg rounded-lg h-1.5 mt-6 dark:bg-themedark-bodybg">
                  <div class="bg-red-500 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar"
                    style="width: {{ number_format($percentageA, 2) }}%"></div>
                </div>
              </div>
            </div>
          </div>
          




          <div class="col-span-12 xl:col-span-4 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Total Teacher</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-person-chalkboard text-purple-500 text-[30px] mr-1.5"></i>
                    {{ $totalTeacher }}
                  </h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 xl:col-span-4 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Male Teacher</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-mars text-purple-500 text-[30px] mr-1.5"></i>
                    {{ $maleTeacher }}
                  </h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 xl:col-span-4 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Female Teacher</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-venus-mars text-purple-500 text-[30px] mr-1.5"></i>
                    {{ $femaleTeacher }}
                  </h3>
                </div>
              </div>
            </div>
          </div>





          <div class="col-span-12 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Class Room</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-landmark text-green-500 text-[30px] mr-1.5"></i>
                    {{ $class }}
                  </h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 md:col-span-6">
            <div class="card">
              <div class="card-header !pb-0 !border-b-0">
                <h5>Class Room</h5>
              </div>
              <div class="card-body">
                <div class="flex items-center justify-between gap-3 flex-wrap">
                  <h3 class="font-light flex items-center mb-0">
                    <i class="fa-solid fa-landmark text-green-500 text-[30px] mr-1.5"></i>
                    {{ $class }}
                  </h3>
                </div>
              </div>
            </div>
          </div>





          <!-- notice section start -->
          @foreach($notices as $notice)
          <div class="col-span-12 xl:col-span-4 md:col-span-6">
            <div class="card border rounded-lg shadow hover:shadow-lg transition duration-300 overflow-hidden">
                
                <!-- Card Header -->
                <div class="card-body border-b border-theme-border dark:border-themedark-border p-4 flex items-center justify-between">
                    <div class="shrink-0">
                        <i class="fa-solid fa-bell text-yellow-500 text-[36px]"></i>
                    </div>
                    <div class="grow text-right">
                        <h3 class="mb-1 text-lg font-semibold text-gray-800">{{ $notice->title ?? 'Notice Title' }}</h3>
                        <h5 class="text-gray-500 text-sm">{{ \Carbon\Carbon::parse($notice->publish_date)->format('d M, Y') }}</h5>
                    </div>
                </div>

                <!-- Card Body -->
                <div class="card-body p-4">
                    <p class="text-sm text-gray-700 mb-4 line-clamp-4">{{ $notice->description ?? 'Notice description goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }}</p>
                    
                    <div class="grid grid-cols-2 gap-4">
                        <div class="text-center">
                            <h6 class="text-sm mb-1 text-gray-500">Priority</h6>
                            <span class="px-3 py-1 rounded-full text-white text-xs font-medium
                                {{ $notice->notice_type == 'Teacher' ? 'bg-red-500' : ($notice->notice_type == 'Student' ? 'bg-yellow-500' : 'bg-green-500') }}">
                                {{ $notice->notice_type ?? 'Normal' }}
                            </span>
                        </div>
                        <div class="text-center">
                            <h6 class="text-sm mb-1 text-gray-500">Created By</h6>
                            <span class="px-3 py-1 rounded-full text-white text-xs font-medium bg-blue-500">
                                {{ $notice->user->first_name ?? 'All Students' }} {{ $notice->user->last_name ?? 'All Students' }}
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Card Footer -->
                <div class="card-footer p-4 border-t border-theme-border dark:border-themedark-border text-right">
                    <a href="{{ url('/view/notice/'.$notice->id) }}"
                      class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium transition">
                        View Details <i class="fa-solid fa-arrow-right ml-2"></i>
                    </a>
                </div>

            </div>
          </div>
          @endforeach
          <!-- notice section End -->






          <div class="col-span-12 xl:col-span-4">
            <div class="card card-social">
              <div class="card-body border-b border-theme-border dark:border-themedark-border">
                <div class="flex items-center justify-center">
                  <div class="shrink-0">
                    <i class="fab fa-facebook-f text-primary-500 text-[36px]"></i>
                  </div>
                  <div class="grow ltr:text-right rtl:text-left">
                    <h3 class="mb-2">12,281</h3>
                    <h5 class="text-success-500 mb-0">+7.2% <span class="text-muted">Total Likes</span></h5>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="grid grid-cols-12 gap-x-6">
                  <div class="col-span-6">
                    <h6 class="text-center mb-2.5"><span class="text-muted m-r-5">Target:</span>35,098</h6>
                    <div class="w-full bg-theme-bodybg rounded-lg h-1.5 dark:bg-themedark-bodybg">
                      <div class="bg-theme-bg-1 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar" style="width: 60%"></div>
                    </div>
                  </div>
                  <div class="col-span-6">
                    <h6 class="text-center mb-2.5"><span class="text-muted m-r-5">Duration:</span>350</h6>
                    <div class="w-full bg-theme-bodybg rounded-lg h-1.5 dark:bg-themedark-bodybg">
                      <div class="bg-theme-bg-2 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar" style="width: 45%"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 xl:col-span-4 md:col-span-6">
            <div class="card card-social">
              <div class="card-body border-b border-theme-border dark:border-themedark-border">
                <div class="flex items-center justify-center">
                  <div class="shrink-0">
                    <i class="fab fa-twitter text-primary-500 text-[36px]"></i>
                  </div>
                  <div class="grow ltr:text-right rtl:text-left">
                    <h3 class="mb-2">11,200</h3>
                    <h5 class="text-purple-500 mb-0">+6.2% <span class="text-muted">Total Likes</span></h5>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="grid grid-cols-12 gap-x-6">
                  <div class="col-span-6">
                    <h6 class="text-center mb-2.5"><span class="text-muted m-r-5">Target:</span>34,185</h6>
                    <div class="w-full bg-theme-bodybg rounded-lg h-1.5 dark:bg-themedark-bodybg">
                      <div class="bg-success-500 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar" style="width: 40%"></div>
                    </div>
                  </div>
                  <div class="col-span-6">
                    <h6 class="text-center mb-2.5"><span class="text-muted m-r-5">Duration:</span>800</h6>
                    <div class="w-full bg-theme-bodybg rounded-lg h-1.5 dark:bg-themedark-bodybg">
                      <div class="bg-primary-500 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar" style="width: 70%"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-span-12 xl:col-span-4 md:col-span-6">
            <div class="card card-social">
              <div class="card-body border-b border-theme-border dark:border-themedark-border">
                <div class="flex items-center justify-center">
                  <div class="shrink-0">
                    <i class="fab fa-google-plus-g text-danger-500 text-[36px]"></i>
                  </div>
                  <div class="grow ltr:text-right rtl:text-left">
                    <h3 class="mb-2">10,500</h3>
                    <h5 class="text-purple-500 mb-0">+5.9% <span class="text-muted">Total Likes</span></h5>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="grid grid-cols-12 gap-x-6">
                  <div class="col-span-6">
                    <h6 class="text-center mb-2.5"><span class="text-muted m-r-5">Target:</span>25,998</h6>
                    <div class="w-full bg-theme-bodybg rounded-lg h-1.5 dark:bg-themedark-bodybg">
                      <div class="bg-theme-bg-1 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar" style="width: 80%"></div>
                    </div>
                  </div>
                  <div class="col-span-6">
                    <h6 class="text-center mb-2.5"><span class="text-muted m-r-5">Duration:</span>900</h6>
                    <div class="w-full bg-theme-bodybg rounded-lg h-1.5 dark:bg-themedark-bodybg">
                      <div class="bg-theme-bg-2 h-full rounded-lg shadow-[0_10px_20px_0_rgba(0,0,0,0.3)]" role="progressbar" style="width: 50%"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- [ Main Content ] end -->
      </div>
    </div>