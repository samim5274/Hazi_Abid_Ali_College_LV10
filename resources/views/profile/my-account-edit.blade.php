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
    @php
        $teacher = Auth::guard('teacher')->user();
    @endphp

    <div class="pc-container">
        <div class="pc-content">
            <!-- Flash Message -->
            @include('layouts.message')

            <div class="max-w-7xl mx-auto p-6">
                <form action="{{ url('/modify-teacher-profile') }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <!-- ================= Profile Header ================= -->
                    <div class="bg-gradient-to-r from-[#273b61] to-[#3F4D67] rounded-lg shadow-lg text-white p-6 flex flex-col md:flex-row items-center gap-6">

                        <div class="text-center">
                            <img id="staff_preview"
                                src="{{ $data->photo ? asset('img/teacher/'.$data->photo) : asset('assets/images/default-avatar.png') }}"
                                class="w-32 h-32 rounded-full object-cover mx-auto mb-2 border-2 border-white">
                            <input type="file" name="photo" id="photo" accept="image/*" class="text-sm">
                        </div>

                        <div class="flex-1 grid grid-cols-1 md:grid-cols-2 gap-4">
                            <input type="text" name="first_name" value="{{ old('first_name', $data->first_name) }}" placeholder="First Name" class="bg-transparent border-b border-white text-white text-2xl font-bold">
                            <input type="text" name="last_name" value="{{ old('last_name', $data->last_name) }}" placeholder="Last Name" class="bg-transparent border-b border-white text-white text-2xl font-bold">

                            <span  class="border-b border-white col-span-2">{{ $data->designation }}</span>
                            <span  class="border-b border-white col-span-2">{{ $data->role }}</span>
                        </div>
                    </div>

                    <!-- ================= Body ================= -->
                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mt-8">

                        <!-- LEFT COLUMN -->
                        <div class="space-y-6">

                            <!-- Contact -->
                            <div class="bg-white p-6 rounded shadow">
                                <h3 class="font-semibold mb-4 border-b pb-2">Contact Information</h3>
                                <input type="email" name="email" readonly value="{{ old('email', $data->email) }}" placeholder="Email" class="border rounded px-3 py-2 w-full mb-3">
                                <input type="text" name="contact_number" readonly value="{{ old('contact_number', $data->contact_number) }}" placeholder="Contact Number" class="border rounded px-3 py-2 w-full mb-3">
                                <textarea name="address" class="border rounded px-3 py-2 w-full" placeholder="Address">{{ old('address', $data->address) }}</textarea>
                            </div>

                            <!-- Guardian -->
                            <div class="bg-white p-6 rounded shadow">
                                <h3 class="font-semibold mb-4 border-b pb-2">Guardian Information</h3>
                                <input type="text" name="guardian_name" value="{{ old('guardian_name', $data->guardian_name) }}" placeholder="Guardian Name" class="border rounded px-3 py-2 w-full mb-3">
                                <input type="text" name="guardian_relationship" value="{{ old('guardian_relationship', $data->guardian_relationship) }}" placeholder="Relationship" class="border rounded px-3 py-2 w-full mb-3">
                                <input type="text" name="guardian_contact" value="{{ old('guardian_contact', $data->guardian_contact) }}" placeholder="Guardian Contact" class="border rounded px-3 py-2 w-full mb-3">
                            </div>

                            <!-- Parents Photos -->
                            <div class="bg-white p-6 rounded shadow">
                                <h3 class="font-semibold mb-4 border-b pb-2">Parents Photos</h3>
                                <div class="grid grid-cols-2 gap-4 text-center">
                                    <div>
                                        <img id="father_preview" src="{{ $data->father_photo ? asset('img/father/'.$data->father_photo) : asset('assets/images/default-avatar.png') }}" class="w-24 h-24 rounded-full mx-auto mb-2 border">
                                        <input type="file" name="father_photo" id="father_photo" accept="image/*">
                                    </div>
                                    <div>
                                        <img id="mother_preview" src="{{ $data->mother_photo ? asset('img/mother/'.$data->mother_photo) : asset('assets/images/default-avatar.png') }}" class="w-24 h-24 rounded-full mx-auto mb-2 border">
                                        <input type="file" name="mother_photo" id="mother_photo" accept="image/*">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- RIGHT COLUMN -->
                        <div class="lg:col-span-2 space-y-6">

                            <!-- Personal -->
                            <div class="bg-white p-6 rounded shadow">
                                <h3 class="font-semibold mb-4 border-b pb-2">Personal Details</h3>
                                <div class="grid grid-cols-2 gap-4">
                                    <select name="gender" class="border rounded px-3 py-2">
                                        <option value="Male" {{ $data->gender=='Male'?'selected':'' }}>Male</option>
                                        <option value="Female" {{ $data->gender=='Female'?'selected':'' }}>Female</option>
                                        <option value="Other" {{ $data->gender=='Other'?'selected':'' }}>Other</option>
                                    </select>

                                    <input type="date" name="dob" value="{{ old('dob', $data->dob ? $data->dob->format('Y-m-d') : '') }}" class="border rounded px-3 py-2">
                                    <input type="text" name="blood_group" value="{{ old('blood_group', $data->blood_group) }}" placeholder="Blood Group" class="border rounded px-3 py-2">
                                    <input type="text" name="national_id" readonly value="{{ old('national_id', $data->national_id) }}" placeholder="National ID" class="border rounded px-3 py-2">
                                </div>
                            </div>

                            <!-- Parent Info -->
                            <div class="bg-white p-6 rounded shadow">
                                <h3 class="font-semibold mb-4 border-b pb-2">Parent Details</h3>
                                <div class="grid grid-cols-2 gap-4">
                                    <input type="text" name="father_name" value="{{ old('father_name', $data->father_name) }}" placeholder="Father Name" class="border rounded px-3 py-2">
                                    <input type="text" name="father_contact" value="{{ old('father_contact', $data->father_contact) }}" placeholder="Father Contact" class="border rounded px-3 py-2">
                                    <input type="text" name="mother_name" value="{{ old('mother_name', $data->mother_name) }}" placeholder="Mother Name" class="border rounded px-3 py-2">
                                    <input type="text" name="mother_contact" value="{{ old('mother_contact', $data->mother_contact) }}" placeholder="Mother Contact" class="border rounded px-3 py-2">
                                </div>
                            </div>

                            <!-- Job Info -->
                            <div class="bg-white p-6 rounded shadow">
                                <h3 class="font-semibold mb-4 border-b pb-2">Job Information</h3>
                                <div class="grid grid-cols-2 gap-4">
                                    <input type="date" name="joining_date" value="{{ old('joning_date', $data->joning_date) }}" placeholder="Joining Date" class="border rounded px-3 py-2">
                                    <input type="date" name="mop_date" value="{{ old('mop_date', $data->mop_date) }}" placeholder="MOP Date" class="border rounded px-3 py-2">
                                    <input type="text" name="traning" value="{{ old('traning', $data->traning) }}" placeholder="Training" class="border rounded px-3 py-2">
                                    <input type="text" name="index_no" value="{{ old('index_no', $data->index_no) }}" placeholder="Index No" class="border rounded px-3 py-2">
                                    <select name="status" class="border rounded px-3 py-2">
                                        <option value="1" {{ $data->status=='active'?'selected':'' }}>Active</option>
                                        <option value="0" {{ $data->status=='inactive'?'selected':'' }}>Inactive</option>
                                    </select>
                                    <input type="text" name="role" value="{{ old('role', $data->role) }}" placeholder="Role" class="border rounded px-3 py-2">
                                </div>
                            </div>

                            <!-- Remark -->
                            <div class="bg-white p-6 rounded shadow">
                                <textarea name="remark" class="border rounded px-3 py-2 w-full" placeholder="Remark">{{ old('remark', $data->remark) }}</textarea>
                            </div>

                            <!-- Submit -->
                            <button type="submit" onclick="return confirm('Are you sure you want to update?')" class="w-full bg-green-600 hover:bg-green-700 text-white py-2 rounded">
                                Update Profile
                            </button>

                        </div>
                    </div>
                </form>
            </div>
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

        // image preview
        function imagePreview(inputId, previewId) {
        const input = document.getElementById(inputId);
        const preview = document.getElementById(previewId);

            if (!input) return;

            input.addEventListener('change', function () {
                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = () => preview.src = reader.result;
                    reader.readAsDataURL(file);
                }
            });
        }

        imagePreview('photo', 'staff_preview');
        imagePreview('father_photo', 'father_preview');
        imagePreview('mother_photo', 'mother_preview');
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