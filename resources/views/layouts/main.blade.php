<div class="pc-container">
  <div class="pc-content">

    @include('layouts.message')

    <div class="page-header">
      <div class="page-block">
        <div class="page-header-title">
          <h5 class="mb-0 font-medium">Dashboard</h5>
        </div>
        <ul class="breadcrumb">
          <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
          <li class="breadcrumb-item" aria-current="page">Dashboard</li>
        </ul>
      </div>
    </div>

    @php
      // ✅ Safe percentage calc
      $attendancePercent = $totalStudent > 0 ? ($totalAttendance / $totalStudent) * 100 : 0;
      $absentPercent     = $totalStudent > 0 ? ($totalAbsent / $totalStudent) * 100 : 0;
    @endphp

    <div class="grid grid-cols-12 gap-x-6 gap-y-6">

      <!-- Total Students -->
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

              {{-- ✅ Overall Attendance rate show (not 100%) --}}
              <p class="mb-0">{{ number_format($attendancePercent, 2) }}%</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Boys -->
      <div class="col-span-12 xl:col-span-3 md:col-span-6">
        <div class="card">
          <div class="card-header !pb-0 !border-b-0">
            <h5>Boys</h5>
          </div>
          <div class="card-body">
            <h3 class="font-light flex items-center mb-0">
              <i class="fa-solid fa-mars text-success-500 text-[30px] mr-1.5"></i>
              {{ $maleStudent }}
            </h3>
          </div>
        </div>
      </div>

      <!-- Girls -->
      <div class="col-span-12 xl:col-span-3 md:col-span-6">
        <div class="card">
          <div class="card-header !pb-0 !border-b-0">
            <h5>Girls</h5>
          </div>
          <div class="card-body">
            <h3 class="font-light flex items-center mb-0">
              <i class="fa-solid fa-venus-mars text-success-500 text-[30px] mr-1.5"></i>
              {{ $femaleStudent }}
            </h3>
          </div>
        </div>
      </div>

      <!-- Other -->
      <div class="col-span-12 xl:col-span-3 md:col-span-6">
        <div class="card">
          <div class="card-header !pb-0 !border-b-0">
            <h5>Other's</h5>
          </div>
          <div class="card-body">
            <h3 class="font-light flex items-center mb-0">
              <i class="fa-solid fa-non-binary text-success-500 text-[30px] mr-1.5"></i>
              {{ $otherStudent }}
            </h3>
          </div>
        </div>
      </div>

      <!-- Today's Attendance -->
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
              <p class="mb-0">{{ number_format($attendancePercent, 2) }}%</p>
            </div>

            <div class="w-full bg-theme-bodybg rounded-lg h-1.5 mt-6 dark:bg-themedark-bodybg">
              <div class="bg-theme-bg-2 h-full rounded-lg"
                   style="width: {{ number_format($attendancePercent, 2) }}%"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Today's Absent -->
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
              <p class="mb-0">{{ number_format($absentPercent, 2) }}%</p>
            </div>

            <div class="w-full bg-theme-bodybg rounded-lg h-1.5 mt-6 dark:bg-themedark-bodybg">
              <div class="bg-red-500 h-full rounded-lg"
                   style="width: {{ number_format($absentPercent, 2) }}%"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Teachers -->
      <div class="col-span-12 xl:col-span-4 md:col-span-6">
        <div class="card">
          <div class="card-header !pb-0 !border-b-0">
            <h5>Total Teacher</h5>
          </div>
          <div class="card-body">
            <h3 class="font-light flex items-center mb-0">
              <i class="fa-solid fa-person-chalkboard text-purple-500 text-[30px] mr-1.5"></i>
              {{ $totalTeacher }}
            </h3>
          </div>
        </div>
      </div>

      <div class="col-span-12 xl:col-span-4 md:col-span-6">
        <div class="card">
          <div class="card-header !pb-0 !border-b-0">
            <h5>Male Teacher</h5>
          </div>
          <div class="card-body">
            <h3 class="font-light flex items-center mb-0">
              <i class="fa-solid fa-mars text-purple-500 text-[30px] mr-1.5"></i>
              {{ $maleTeacher }}
            </h3>
          </div>
        </div>
      </div>

      <div class="col-span-12 xl:col-span-4 md:col-span-6">
        <div class="card">
          <div class="card-header !pb-0 !border-b-0">
            <h5>Female Teacher</h5>
          </div>
          <div class="card-body">
            <h3 class="font-light flex items-center mb-0">
              <i class="fa-solid fa-venus-mars text-purple-500 text-[30px] mr-1.5"></i>
              {{ $femaleTeacher }}
            </h3>
          </div>
        </div>
      </div>

      <!-- ✅ Class Room (only once) -->
      <div class="col-span-12 md:col-span-6">
        <div class="card">
          <div class="card-header !pb-0 !border-b-0">
            <h5>Class Room</h5>
          </div>
          <div class="card-body">
            <h3 class="font-light flex items-center mb-0">
              <i class="fa-solid fa-landmark text-green-500 text-[30px] mr-1.5"></i>
              {{ $class }}
            </h3>
          </div>
        </div>
      </div>

      <!-- ✅ Notice Board (full width grid) -->
      <div class="col-span-12">
        <div class="bg-white border border-gray-200 rounded-xl shadow-sm">
          <div class="flex items-center justify-between px-6 py-4">
            <div class="flex items-center gap-3">
              <span class="text-green-600 text-xl">
                <i class="fa-regular fa-file-lines"></i>
              </span>
              <h2 class="text-xl font-extrabold text-gray-900">Notice Board</h2>
            </div>

            <a href="{{ url('/show-all-notices') }}"
              class="inline-flex items-center gap-2 text-sm font-semibold text-green-700 hover:text-green-900 transition">
              See all <i class="fa-solid fa-arrow-right text-xs"></i>
            </a>
          </div>

          <div class="border-t border-gray-200"></div>

          <div class="divide-y divide-gray-200">
            @forelse($notices as $notice)
              <a href="{{ url('/view/notice/'.$notice->id) }}"
                class="group flex items-center justify-between gap-4 px-6 py-4 hover:bg-gray-50 transition">

                <div class="flex items-start gap-4 min-w-0">
                  <span class="mt-2 h-3 w-3 rounded-full bg-green-500 shrink-0"></span>

                  <div class="min-w-0">
                    <p class="text-gray-900 font-semibold leading-snug truncate max-w-[680px]">
                      {{ $notice->title ?? 'N/A' }}
                    </p>

                    <div class="mt-2 flex items-center gap-3 flex-wrap text-sm text-gray-600">
                      <span class="inline-flex items-center gap-2">
                        <i class="fa-regular fa-calendar text-gray-500"></i>
                        <span>
                          @if(!empty($notice->publish_date))
                            {{ \Carbon\Carbon::parse($notice->publish_date)->format('d-M-Y') }}
                          @else
                            {{ optional($notice->created_at)->format('d-M-Y') ?? '—' }}
                          @endif
                        </span>
                      </span>

                      @php
                        $isNew = false;
                        if (!empty($notice->publish_date)) {
                            $isNew = \Carbon\Carbon::parse($notice->publish_date)->diffInDays(now()) <= 2;
                        } elseif (!empty($notice->created_at)) {
                            $isNew = \Carbon\Carbon::parse($notice->created_at)->diffInDays(now()) <= 2;
                        }
                        $typeClass = match($notice->notice_type) {
                            'Student' => 'bg-amber-50 text-amber-800 border-amber-200',
                            'Teacher' => 'bg-blue-50 text-blue-800 border-blue-200',
                            'Public'  => 'bg-green-50 text-green-800 border-green-200',
                            default   => 'bg-gray-50 text-gray-700 border-gray-200',
                        };
                    @endphp

                    <div class="flex items-center gap-2 flex-wrap">
                        @if($isNew)
                            <span class="px-1.5 py-0.5 rounded-full bg-red-500 text-white text-[10px] font-bold uppercase">
                                New
                            </span>
                        @endif
                        <span class="px-2 py-0.5 rounded-full text-[10px] font-semibold border {{ $typeClass }}">
                            {{ $notice->notice_type ?? 'N/A' }}
                        </span>
                    </div>

                    </div>
                  </div>
                </div>

                <span class="text-gray-400 group-hover:text-gray-700 transition shrink-0">
                  <i class="fa-solid fa-chevron-right"></i>
                </span>
              </a>
            @empty
              <div class="px-6 py-8 text-center text-gray-500">
                No notice available at the moment. Thank You..!
              </div>
            @endforelse
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
