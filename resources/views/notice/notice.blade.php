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

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            <!-- Flash Message -->
            @include('layouts.message')
            <!-- Breadcrumb -->
            <div class="page-header mb-6">
                <div class="page-block">
                    <div class="page-header-title">
                        <h5 class="mb-1 font-semibold text-gray-800">Notice Details</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">Notice</li>
                    </ul>
                </div>
            </div>           

            <div class="max-w-3xl mx-auto my-8">
                <div class="bg-white shadow rounded-lg overflow-hidden">
                    <div class="px-6 py-4 border-b">
                        <h3 class="text-lg font-semibold text-gray-800">Publish Notice</h3>
                    </div>

                    <form action="{{ url('/create-notice') }}" method="POST" enctype="multipart/form-data" class="px-6 py-6">
                        @csrf
                       
                        <div class="mb-4">
                            <label for="title" class="block text-sm font-medium text-gray-700 mb-1">Title <span class="text-red-500">*</span></label>
                            <input id="title" name="title" type="text" value="{{ old('title') }}" required class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-200" placeholder="Enter notice title">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-600 mb-1" for="Type">Type</label>
                            <select id="Type" name="txtNoticeType" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                                <option  disabled>--Select Type--</option>
                                <option selected value="Public">Public</option>
                                <option value="Student">Student</option>
                                <option value="Teacher">Teacher</option>
                            </select>
                        </div>

                        
                        <div class="mb-4">
                            <label for="description" class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                            <textarea
                                id="description"
                                name="description"
                                rows="5"
                                class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-200"
                                placeholder="Write notice details (optional)">{{ old('description') }}</textarea>
                        </div>

                        <div class="mb-4">
                            <label for="attachment" class="block text-sm font-medium text-gray-700 mb-1">
                                Attachment (PDF, JPG, PNG) & Max 2MB
                            </label>
                            <input id="attachment" name="attachment" type="file"
                                class="w-full text-sm text-gray-600 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-200"
                                accept=".pdf,.jpg,.jpeg,.png">
                        </div>

                        <div class="items-center gap-3">
                            <button type="submit" 
                                class="w-full px-4 py-2 bg-[#3F4D67] text-white rounded-lg text-sm font-medium hover:bg-[#6d85b1] focus:outline-none focus:ring-2 focus:ring-indigo-200">
                                Publish Notice
                            </button>
                        </div>

                    </form>
                </div>
            </div>

            <!-- Notice Board List -->            
            <div class="mt-6">
                <h6 class="text-xl font-semibold mb-4 text-gray-800">Notice Boards</h6>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    @foreach($notice as $val)
                    <div class="relative bg-white p-5 rounded-xl shadow hover:shadow-lg transition duration-200 flex flex-col justify-between">
                        
                        <!-- Status Badge -->
                        <span class="absolute top-3 right-3 text-xs font-semibold px-2 py-1 rounded-full
                            {{ $val->is_active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                            {{ $val->is_active ? 'Active' : 'Expired' }}
                        </span>

                        <!-- Title -->
                        <h3 class="text-lg font-bold text-gray-900 mb-2 line-clamp-2">
                            <a href="{{ route('view-notice', $val->id) }}" class="text-[#1DE4BD] hover:text-[#0f0b31]">{{ $val->title }}</a>
                        </h3>

                        <!-- Publish Date -->
                        <span class="text-sm text-gray-500 mb-3 flex items-center gap-1">
                            <i class="fa fa-calendar-alt"></i>
                            {{ \Carbon\Carbon::parse($val->publish_date)->format('d M, Y') }} 
                            <i class="fa-solid fa-shield"></i>
                            {{ $val->notice_type }}
                        </span>

                        <!-- Description -->
                        @if($val->description)
                            <p class="text-gray-700 text-sm mb-4 line-clamp-5">
                                {{ \Illuminate\Support\Str::limit($val->description, 200, '...') }}
                            </p>
                        @endif

                        <!-- Attachment -->
                        @if($val->attachment)
                            <a href="{{ url('/notice/view/'. $val->attachment) }}" target="_blank" class="inline-block text-indigo-600 hover:text-indigo-800 text-sm font-medium mb-4">
                                📄 View Attachment
                            </a>
                        @endif

                        <span class="absolute bottom-3 right-3 text-xs font-semibold px-2 py-1 bg-red-100 rounded-full">
                            <a href="{{ url('/delete/notice/'.$val->id) }}" class="text-red-700" onclick="return confirm('Are you sure you want to delete this notice?')"><i class="fa-solid fa-trash"></i></a>
                        </span>

                    </div>
                    @endforeach
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
