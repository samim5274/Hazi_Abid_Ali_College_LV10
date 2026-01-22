<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice - {{ $company->name ?? "SMS" }}</title>

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
            <!-- [ Header ] end -->
            @include('layouts.message')
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Notice Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('/notice') }}">Notice</a></li>
                        <li class="breadcrumb-item" aria-current="page">All Notice</li>
                    </ul>
                </div>
            </div>           

            <!-- Notice Board List -->            
            <div class="mt-6">
                <!-- Notice section start -->
                <div class="bg-white border border-gray-200 rounded-xl shadow-sm">
                <!-- Header -->
                <div class="flex items-center justify-between px-6 py-4">
                    <div class="flex items-center gap-3">
                        <span class="text-green-600 text-xl">
                            <i class="fa-regular fa-file-lines"></i>
                        </span>
                        <h2 class="text-xl font-extrabold text-gray-900">Notice Board</h2>
                    </div>
                </div>


                <div class="border-t border-gray-200"></div>

                <!-- List -->
                <div class="divide-y divide-gray-200">
                    @forelse($notices as $notice)
                        <a href="{{ url('/view/notice/'.$notice->id) }}"
                            class="group flex items-center justify-between gap-4 px-6 py-4 hover:bg-gray-50 transition">

                            <!-- Left content -->
                            <div class="flex items-start gap-4 min-w-0">
                                <!-- Green dot -->
                                <span class="mt-2 h-3 w-3 rounded-full bg-green-500 shrink-0"></span>

                                <div class="min-w-0">
                                    <!-- Title -->
                                    <p class="text-gray-900 font-semibold leading-snug truncate max-w-[680px]">
                                        {{ $notice->title ?? 'N/A' }}
                                    </p>

                                    <!-- Meta row -->
                                    <div class="mt-2 flex items-center gap-3 flex-wrap text-sm text-gray-600">
                                        <span class="inline-flex items-center gap-2">
                                            <i class="fa-regular fa-calendar text-gray-500"></i>
                                            <span>
                                                @if(!empty($notice->publish_date))
                                                    {{ \Carbon\Carbon::parse($notice->publish_date)->format('d-F-Y') }}
                                                @else
                                                    {{ optional($notice->created_at)->format('d-m-Y') ?? '—' }}
                                                @endif
                                            </span>
                                        </span>

                                        {{-- NEW badge (example: last 2 days is showing new notice) --}}
                                        @php
                                            $isNew = false;
                                            if(!empty($notice->publish_date)){
                                                $isNew = \Carbon\Carbon::parse($notice->publish_date)->diffInDays(now()) <= 2;
                                            } elseif(!empty($notice->created_at)){
                                                $isNew = \Carbon\Carbon::parse($notice->created_at)->diffInDays(now()) <= 2;
                                            }
                                            $typeClass = match($notice->notice_type) {
                                                'Student' => 'bg-amber-50 text-amber-800 border-amber-200',
                                                'Teacher' => 'bg-blue-50 text-blue-800 border-blue-200',
                                                'Public'  => 'bg-green-50 text-green-800 border-green-200',
                                                default   => 'bg-gray-50 text-gray-700 border-gray-200',
                                            };
                                        @endphp

                                        @if($isNew)
                                            <span class="px-3 py-1 rounded-full bg-red-500 text-white text-xs font-bold">
                                                New
                                            </span>
                                        @endif

                                        {{-- Type badge --}}
                                        <span class="px-2 py-0.5 rounded-full text-[10px] font-semibold border {{ $typeClass }}">
                                            {{ $notice->notice_type ?? 'N/A' }}
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Right arrow -->
                            <span class="text-gray-400 group-hover:text-gray-700 transition shrink-0">
                                <i class="fa-solid fa-chevron-right"></i>
                            </span>
                        </a>                  
                    @empty
                        <div class="px-6 py-8 text-center text-gray-500">
                            No notice availe at a moment. Thank You..!
                        </div>
                    @endforelse
                </div>
                </div>
                <!-- Notice section End -->
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

</body>
</html>
