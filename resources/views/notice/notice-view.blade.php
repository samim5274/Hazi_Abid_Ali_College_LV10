<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice - {{ $company->name }}</title>

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

    <!-- Flash Message -->
    @include('layouts.message')

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Notice Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/notice">Notice</a></li>
                        <li class="breadcrumb-item" aria-current="page">{{ $notice->title }}</li>
                    </ul>
                </div>
            </div>           

            <!-- Notice Board List -->            
            <div class="max-w-8xl mx-auto py-10 px-6">

                <!-- Breadcrumb -->
                <div class="text-sm mb-6 text-gray-500">
                    <a href="{{ url()->previous() }}" class="hover:text-[#1DE4BD]">← Back to Notices</a>
                </div>

                <!-- Notice Card -->
                <div class="bg-white rounded-2xl shadow-md border border-gray-100 p-8">

                    <!-- Title + Status -->
                    <div class="flex items-start justify-between gap-6">
                        <h1 class="text-3xl font-semibold text-gray-900 leading-tight flex-1">
                            {{ $notice->title }}
                        </h1>

                        <span class="text-xs font-semibold px-3 py-1 rounded-full shadow-sm
                            {{ $notice->is_active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                            {{ $notice->is_active ? 'Active' : 'Expired' }}
                        </span>

                    </div>

                    <!-- Publish Date -->
                    <div class="mt-4 text-sm text-gray-600 flex items-center gap-2">
                        <i class="fa-regular fa-calendar text-[#1DE4BD]"></i>
                        Published on: {{ \Carbon\Carbon::parse($notice->publish_date)->format('d M, Y') }} - {{ $notice->notice_type }}
                        <i class="fa-solid fa-shield text-[#1DE4BD]"></i>
                        {{ $notice->notice_type }}
                    </div>

                    <hr class="my-6 border-gray-200">

                    <!-- Description -->
                    <div class="prose max-w-none text-gray-700 leading-relaxed text-[15px] mb-5">
                        {!! nl2br(e($notice->description)) !!}
                    </div>

                    <span class="text-xs font-semibold px-3 py-1 rounded-full shadow-sm">
                            <a href="{{ url('/notice/view/'. $notice->attachment) }}" target="_blank" class="inline-block text-indigo-600 hover:text-indigo-800 text-sm font-medium mb-4">
                                📄 View Attachment
                            </a>
                        </span>

                    <!-- Inline Attachment Preview -->
                    @if($notice->attachment)
                        @php
                            $ext = pathinfo($notice->attachment, PATHINFO_EXTENSION);
                            $fileUrl = url('/notice/view/' . $notice->attachment);
                        @endphp

                        <div class="bg-gray-50 border border-gray-200 rounded-2xl p-6">
                            <h4 class="text-lg font-semibold text-gray-800 mb-5">Attachment Preview</h4>

                            @if(in_array(strtolower($ext), ['pdf']))
                                <!-- PDF Viewer -->
                                <iframe src="{{ $fileUrl }}" 
                                        class="w-full h-[800px] md:h-[90vh] border rounded-xl shadow-sm"
                                        style="min-height:900px;" 
                                        frameborder="0">
                                </iframe>

                            @elseif(in_array(strtolower($ext), ['jpg','jpeg','png','gif','webp']))
                                <!-- Image Viewer -->
                                <div class="w-full flex justify-center">
                                    <img src="{{ $fileUrl }}" 
                                        alt="Attachment" 
                                        class="max-h-[90vh] w-auto rounded-xl shadow-sm object-contain">
                                </div>

                            @else
                                <!-- Other files -->
                                <p class="text-sm text-gray-600">
                                    Cannot preview this file. 
                                    <a href="{{ $fileUrl }}" target="_blank" class="text-indigo-600 hover:text-indigo-800 font-medium">
                                        Click here to download
                                    </a>
                                </p>
                            @endif
                        </div>
                    @endif

                </div>
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
