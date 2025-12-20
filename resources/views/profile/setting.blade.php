<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $company->name }}</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600&display=swap" rel="stylesheet" />

    <!-- Icon Fonts -->
    <link rel="stylesheet" href="{{ asset('assets/fonts/phosphor/duotone/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/tabler-icons.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/feather.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/fonts/material.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Toastr CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>

    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}" id="main-style-link" />

    <!-- Vite (Tailwind last to avoid override) -->
    @vite('resources/css/app.css')
    @vite('resources/js/app.js')
</head>

<!-- [Body] Start -->

<body>
    
    <!-- [ Sidebar Menu ] start -->
    @include('layouts.navbar')
    <!-- [ Sidebar Menu ] end -->
    <!-- [ Header Topbar ] start -->
    @include('layouts.header')
    <!-- [ Header ] end -->
    
    


    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content py-10 px-4 md:px-8 lg:px-16">
            <!-- Flash Message -->
            @include('layouts.message')
            <div class="flex flex-col lg:flex-row gap-6 p-4">
                
                <!-- Content -->
                <main class="lg:w-3/4 bg-white shadow-md rounded-lg p-6">
                    <!-- Personal Tab -->
                    <div id="personal" class="tab-content">
                        <h2 class="text-2xl font-bold mb-6">Personal Details</h2>
                        @php
                            $teacher = Auth::guard('teacher')->user();
                        @endphp

                        <form action="{{ url('/pofile-edit') }}" method="POST" enctype="multipart/form-data" class="space-y-4">
                            @csrf

                            <!-- Name -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">First Name</label>
                                    <input type="text" name="first_name"
                                        value="{{ old('first_name', $teacher->first_name ?? '') }}"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                </div>

                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">Last Name</label>
                                    <input type="text" name="last_name"
                                        value="{{ old('last_name', $teacher->last_name ?? '') }}"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                </div>
                            </div>

                            <!-- Contact & Email -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">Contact Number</label>
                                    <input type="text" name="contact_number"
                                        value="{{ old('contact_number', $teacher->contact_number ?? '') }}"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                </div>

                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">Email</label>
                                    <input type="email" readonly name="email"
                                        value="{{ $teacher->email ?? '' }}"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-100">
                                </div>
                            </div>

                            <!-- DOB & Gender -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">Date of Birth</label>
                                    <input type="date" name="dob"
                                        value="{{ old('dob', optional($teacher)->dob ? \Carbon\Carbon::parse($teacher->dob)->format('Y-m-d') : '') }}"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                </div>

                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">Gender</label>
                                    <select name="gender"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                        <option value="">Select</option>
                                        <option value="Male" {{ old('gender', $teacher->gender ?? '') == 'Male' ? 'selected' : '' }}>Male</option>
                                        <option value="Female" {{ old('gender', $teacher->gender ?? '') == 'Female' ? 'selected' : '' }}>Female</option>
                                        <option value="Other" {{ old('gender', $teacher->gender ?? '') == 'Other' ? 'selected' : '' }}>Other</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Blood Group & National ID -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">Blood Group</label>
                                    <input type="text" name="blood_group"
                                        value="{{ old('blood_group', $teacher->blood_group ?? '') }}"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                                </div>

                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">National ID</label>
                                    <input type="text" readonly
                                        value="{{ $teacher->national_id ?? '' }}"
                                        class="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-100">
                                </div>
                            </div>

                            <!-- Address -->
                            <div>
                                <label class="block text-gray-700 font-medium mb-1">Address</label>
                                <input type="text" name="address"
                                    value="{{ old('address', $teacher->address ?? '') }}"
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                            </div>

                            <!-- Submit -->
                            <button type="submit"
                                onclick="return confirm('Are you sure you want to edit your profile?')"
                                class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition">
                                Save Changes
                            </button>
                        </form>

                    </div>

                    <!-- Other Tabs -->
                    <div id="privacy" class="tab-content hidden">
                        <h2 class="text-xl font-semibold mb-4">Privacy</h2>
                        <p>Control your privacy settings and manage who can see your information.</p>
                    </div>

                    <div id="verification" class="tab-content hidden">
                        <h2 class="text-xl font-semibold mb-4">Verification</h2>
                        <p>Verify your email, phone number, and identity documents.</p>
                    </div>

                    <div id="account-checkup" class="tab-content hidden">
                        <h2 class="text-xl font-semibold mb-4">Account Checkup</h2>
                        <p>Review your account activity, security checks, and connected devices.</p>
                    </div>

                    <div id="terms" class="tab-content hidden">
                        <h2 class="text-xl font-semibold mb-4">Terms of Service</h2>
                        <p>Read the Terms of Service agreement.</p>
                    </div>

                    <div id="privacy-policy" class="tab-content hidden">
                        <h2 class="text-xl font-semibold mb-4">Privacy Policy</h2>
                        <p>Review the Privacy Policy of our platform.</p>
                    </div>

                    <div id="group-setting" class="tab-content hidden">
                        <h2 class="text-xl font-semibold mb-4">Group Setting</h2>
                        <form action="{{ route('groups.store') }}" method="POST" class="space-y-4">
                            @csrf

                            <div>
                                <label for="name" class="block text-gray-700 font-medium mb-1">Group Name</label>
                                <input type="text" name="name" id="name" value="{{ old('name') }}" required
                                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring focus:ring-blue-200">
                            </div>

                            <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition"
                            onclick="return confirm('Are you sure you want to create new group?')">
                                Create Group
                            </button>
                        </form>
                        <div class="overflow-x-auto">
                            <div class="overflow-y-auto max-h-96 rounded-lg">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead class="bg-gray-50 sticky top-0">
                                        <tr>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">#</th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Group Name</th>
                                            <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                        @forelse($groups as $group)
                                            <tr>
                                                <td class="px-6 py-4 whitespace-nowrap">{{ $loop->iteration }}</td>
                                                <td class="px-6 py-4 whitespace-nowrap">{{ $group->name }}</td>
                                                <td class="px-6 py-4 whitespace-nowrap text-right">
                                                    <a href="{{ url('/edit-group/'. $group->id) }}" class="text-blue-600 hover:text-blue-800 mr-4"><i class="fa-solid fa-pen-to-square"></i></a>
                                                    <form action="{{ url('/delete-group/'.$group->id) }}" method="POST" class="inline-block" onsubmit="return confirm('Are you sure to delete this group?');">
                                                        @csrf
                                                        <button type="submit" class="text-red-600 hover:text-red-800"><i class="fa-solid fa-trash"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="3" class="px-6 py-4 text-center text-gray-500">No groups found.</td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div id="backup" class="tab-content hidden">
                        <h2 class="text-xl font-semibold mb-4">Backup</h2>
                        <a href="{{ url('/database-backup') }}" class="flex items-center text-blue-600 hover:text-blue-800 transition">
                            <i class="fa-solid fa-download me-3"></i> Download your database for security.
                        </a>
                    </div>
                </main>

                <!-- Sidebar -->
                <aside class="lg:w-1/4 bg-white shadow-md rounded-lg p-4">
                    <h2 class="text-xl font-semibold mb-4">Settings</h2>
                    <ul class="space-y-2">
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none active-tab" data-tab="personal">Personal Details</button>
                        </li>
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="privacy">Privacy</button>
                        </li>
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="verification">Verification</button>
                        </li>
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="account-checkup">Account Checkup</button>
                        </li>
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="terms">Terms of Service</button>
                        </li>
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="privacy-policy">Privacy Policy</button>
                        </li>
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="group-setting">Group</button>
                        </li>
                        <li>
                            <button class="w-full text-left px-4 py-2 rounded hover:bg-blue-100 focus:bg-blue-200 focus:outline-none" data-tab="backup">Backup</button>
                        </li>
                    </ul>
                </aside>
            </div>

        </div>
    </div>
    <!-- [ Main Content ] end -->
    @include('layouts.footer')
 
    <script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.4/socket.io.min.js"></script>
    <script src="//js.pusher.com/7.2/pusher.min.js"></script>
    <script src="{{ asset('js/app.js') }}"></script>

    <!-- Required Js -->
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

        // setting content show
        const tabs = document.querySelectorAll('[data-tab]');
        const contents = document.querySelectorAll('.tab-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                // Remove active classes
                tabs.forEach(t => t.classList.remove('bg-blue-100', 'active-tab'));
                contents.forEach(c => c.classList.add('hidden'));

                // Add active class to clicked tab
                tab.classList.add('bg-blue-100', 'active-tab');
                const contentId = tab.getAttribute('data-tab');
                document.getElementById(contentId).classList.remove('hidden');
            });
        });

        // notification
        window.Echo.private('App.Models.User.{{ auth()->id() }}')
        .listen('BackupCompleted', (e) => {
            alert(e.message + ' File: ' + e.file);
        });
    </script>
    
    <script>
      layout_change('light');
    </script>
     
    
    <script>
      layout_theme_sidebar_change('false');
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