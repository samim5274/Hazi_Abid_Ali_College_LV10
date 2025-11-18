<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subject - (SMS)</title>

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

<body>
    
    <!-- [ Sidebar Menu ] start -->
    @include('layouts.navbar')
    <!-- [ Sidebar Menu ] end -->
    <!-- [ Header Topbar ] start -->
    @include('layouts.header')
    <!-- [ Header ] end -->
    @include('layouts.message')


      <!-- [ Main Content ] start -->
      <div class="pc-container">
            <div class="pc-content">
                <!-- [ breadcrumb ] start -->
                <div class="page-header">
                    <div class="page-block">
                        <div class="page-header-title">
                            <h5 class="mb-0 font-medium">Student Entrollment</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Class List</li>
                        </ul>
                    </div>
                </div>
                <!-- [ breadcrumb ] end -->

                <!-- Card -->
                <div class="card rounded-lg border shadow-sm">
                    <div class="card-header px-4 py-3 border-b bg-gray-100">
                        <h3 class="text-lg font-semibold text-gray-700">Classes List</h3>
                    </div>
                    <div class="card-body p-6">
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                            @foreach($classes as $val)
                            @if($val->id != 13)
                            <a href="{{url('/enrollment/class/student/'.$val->id)}}">
                                <div class="border p-5 rounded-md bg-white shadow-md transform transition duration-300 hover:-translate-y-2 hover:shadow-xl">
                                    <div class="flex items-center justify-between mb-3">
                                        <h3 class="text-lg font-semibold text-[#3F4D67]">
                                            {{ $val->name }} - {{ $val->section ?? 'N/A' }}
                                        </h3>
                                        <span class="px-2 py-1 text-xs rounded bg-green-100 text-green-700">
                                            {{ $val->section ?? 'N/A' }}
                                        </span>
                                    </div>
                                    <div class="space-y-2 text-sm text-gray-600">
                                        <p>
                                            <i class="fa-solid fa-user-tie mr-2 text-blue-500"></i>
                                            Teacher: {{ $val->teachers->first_name ?? 'Not Assigned' }} {{ $val->teachers->last_name ?? 'Not Assigned' }}
                                        </p>
                                        <p>
                                            <i class="fa-solid fa-users mr-2 text-purple-500"></i>
                                            Capacity: {{ $val->capacity }}
                                        </p>
                                    </div>
                                </div>
                            </a>
                            @endif
                            @endforeach
                        </div>
                    </div>
                </div>
                <!-- Card End -->
  
            </div>
        </div>
      <!-- [ Main Content ] end -->
      @include('layouts.footer')
        
      <!-- Required Js -->
      <script src="{{ asset('assets/js/plugins/simplebar.min.js') }}"></script>
      <script src="{{ asset('assets/js/plugins/popper.min.js') }}"></script>
      <script src="{{ asset('assets/js/icon/custom-icon.js') }}"></script>
      <script src="{{ asset('assets/js/plugins/feather.min.js') }}"></script>
      <script src="{{ asset('assets/js/component.js') }}"></script>
      <script src="{{ asset('assets/js/theme.js') }}"></script>
      <script src="{{ asset('assets/js/script.js') }}"></script>


      <script>
        layout_change('false');
      </script>


      <script>
        layout_theme_sidebar_change('dark');
      </script>


      <script>
        change_box_container('false');
      </script>

      <script>
        layout_caption_change('true');
      </script>

      <script>
        layout_rtl_change('false');
      </script>

      <script>
        preset_change('preset-1');
      </script>

      <script>
        main_layout_change('vertical');
      </script>


  </body>
  <!-- [Body] end -->
</html>