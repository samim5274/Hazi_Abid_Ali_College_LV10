<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher - (SMS)</title>

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
                            <h5 class="mb-0 font-medium">Teacher Details</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{url('/teacher-list')}}">Teacher List</a></li>
                            <li class="breadcrumb-item"><a href="{{url('/add-teacher-view')}}">Add Teacher</a></li>
                            <li class="breadcrumb-item" aria-current="page">List</li>
                        </ul>
                    </div>
                </div>
                <!-- [ breadcrumb ] end -->

                <div id="popup-overlay" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden items-center justify-center z-50">
                    <div id="popup-message" class="bg-white rounded-lg shadow-lg p-6 w-11/12 max-w-sm transform transition-all duration-300 scale-95 opacity-0">
                        <button id="close-popup" class="absolute top-2 right-2 text-gray-500 hover:text-gray-800">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                        </button>
                        <h2 id="popup-title" class="text-xl font-semibold mb-2"></h2>
                        <p id="popup-text" class="text-gray-700"></p>
                        <button id="ok-button" class="mt-4 w-full bg-green-500 text-white py-2 rounded-md hover:bg-green-600 focus:outline-none focus:ring-2 focus:ring-green-500">OK</button>
                    </div>
                </div>

                <!-- [ Main Content ] start -->
                <div class="gap-x-6">
                    <div class="col-span-12">
                        <div class="card rounded-lg border">
                            <div class="card-header">
                                <h5>Personal Information</h5>
                            </div>
                            <div class="card-body">
                                <form action="{{url('/add-new-teacher')}}" method="POST" class="space-y-6" enctype="multipart/form-data">
                                    @csrf
                                    <!-- Personal Information -->
                                    <div class="border-b border-gray-300 pb-4 mb-6">
                                        
                                        <div class="grid grid-cols-2 gap-4 mt-4">

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="first_name">First Name</label>
                                                <input type="text" id="first_name" name="first_name" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="Shamim">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="last_name">Last Name</label>
                                                <input type="text" id="last_name" name="last_name" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="Hossain">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="dob">Date of Birth</label>
                                                <input type="date" id="dob" name="dob" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="2001-12-31">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="gender">Gender</label>
                                                <select id="gender" name="gender" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                                                <option  disabled>--Select Gender--</option>
                                                <option selected value="Male">Male</option>
                                                <option value="Female">Female</option>
                                                <option value="Other">Other</option>
                                                </select>
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="blood_group">Blood Group</label>
                                                <input type="text" id="blood_group" name="blood_group" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="A+">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="national_id">National ID / Birth Certificate</label>
                                                <input type="text" id="national_id" name="national_id" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="123456789">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="contact_number">Contact Number</label>
                                                <input type="text" id="contact_number" name="contact_number" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="123456789">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="email">Email Address</label>
                                                <input type="email" id="email" name="email" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="info@shamim.com">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="designation">Designation</label>
                                                <textarea id="designation" name="designation" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500">BSc in Math</textarea>
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="address">Address (Present & Permanent)</label>
                                                <textarea id="address" name="address" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500">Dhaka</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Guardian Information -->
                                    <div class="border-b border-gray-300 pb-4 mb-6">
                                        <h3 class="text-xl font-semibold mb-4 text-gray-700">Guardian / Parent Information</h3>
                                        <div class="grid grid-cols-2 gap-4">

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="father_name">Father Name</label>
                                                <input type="text" id="father_name" name="father_name" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="Jamsher Ali">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="father_contact">Father Contact</label>
                                                <input type="text" id="father_contact" name="father_contact" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="123456789">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="mother_name">Mother Name</label>
                                                <input type="text" id="mother_name" name="mother_name" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="Let-Shofiya Begum">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="mother_contact">Mother Contact</label>
                                                <input type="text" id="mother_contact" name="mother_contact" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="123456789">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="guardian_name">Guardian Name (if any)</label>
                                                <input type="text" id="guardian_name" name="guardian_name" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="Jamsher Ali">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="guardian_contact">Guardian Contact</label>
                                                <input type="text" id="guardian_contact" name="guardian_contact" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="123456789">
                                            </div>

                                            <div>
                                                <label class="block text-gray-600 mb-1" for="guardian_relationship">Relationship with Student</label>
                                                <input type="text" id="guardian_relationship" name="guardian_relationship" class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-green-500" value="Father">
                                            </div>

                                        </div>
                                    </div>

                                    <div class="w-full px-3">
                                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6"> 

                                            <div class="border rounded-lg p-4 shadow-sm bg-white text-center">
                                                <label class="block text-gray-600 mb-1" for="photo">Teacher Photo</label>
                                                <div id="teacher_photo_upload" class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
                                                    <div class="space-y-1 text-center">
                                                        <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                                            <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                        </svg>
                                                        <div class="flex text-sm text-gray-600">
                                                            <label for="teacher_photo" class="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500">
                                                                <span>Upload a file</span>
                                                                <input id="teacher_photo" name="teacher_photo" type="file" class="sr-only" accept="image/*">
                                                            </label>
                                                            <p class="pl-1">or drag and drop</p>
                                                        </div>
                                                        <p class="text-xs text-gray-500">PNG, JPG, GIF up to 2MB</p>
                                                    </div>
                                                </div>
                                                <img id="student_preview" src="#" alt="your image" class="mt-3 w-60 h-60 object-cover mx-auto rounded-md" style="display:none;"/>
                                            </div>

                                            <div class="border rounded-lg p-4 shadow-sm bg-white text-center">
                                                <label class="block text-gray-600 mb-1" for="father_photo">Father Photo</label>
                                                <div id="father_photo_upload" class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
                                                    <div class="space-y-1 text-center">
                                                        <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                                            <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                        </svg>
                                                        <div class="flex text-sm text-gray-600">
                                                            <label for="father_photo" class="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500">
                                                                <span>Upload a file</span>
                                                                <input id="father_photo" name="father_photo" type="file" class="sr-only" accept="image/*">
                                                            </label>
                                                            <p class="pl-1">or drag and drop</p>
                                                        </div>
                                                        <p class="text-xs text-gray-500">PNG, JPG, GIF up to 2MB</p>
                                                    </div>
                                                </div>
                                                <img id="father_preview" src="#" alt="your image" class="mt-3 w-60 h-60 object-cover mx-auto rounded-md" style="display:none;"/>
                                            </div>

                                            <div class="border rounded-lg p-4 shadow-sm bg-white text-center">
                                                <label class="block text-gray-600 mb-1" for="mother_photo">Mother Photo</label>
                                                <div id="mother_photo_upload" class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
                                                    <div class="space-y-1 text-center">
                                                        <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                                            <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                        </svg>
                                                        <div class="flex text-sm text-gray-600">
                                                            <label for="mother_photo" class="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500">
                                                                <span>Upload a file</span>
                                                                <input id="mother_photo" name="mother_photo" type="file" class="sr-only" accept="image/*">
                                                            </label>
                                                            <p class="pl-1">or drag and drop</p>
                                                        </div>
                                                        <p class="text-xs text-gray-500">PNG, JPG, GIF up to 2MB</p>
                                                    </div>
                                                </div>
                                                <img id="mother_preview" src="#" alt="your image" class="mt-3 w-60 h-60 object-cover mx-auto rounded-md" style="display:none;"/>
                                            </div>

                                        </div>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="border rounded-lg p-4 shadow-sm bg-white text-center">
                                        <button type="submit" class="bg-green-500 hover:bg-green-600 text-white font-semibold py-2 px-6 w-full rounded-md shadow-md transition duration-300" onclick="return confirmSubmit(event)">
                                        Submit
                                        </button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>  
                </div>
                <!-- [ Main Content ] end -->   
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
            function setupImageUpload(inputId, previewId, uploadId) {
                document.getElementById(inputId).addEventListener("change", function(event) {
                    const preview = document.getElementById(previewId);
                    const upload = document.getElementById(uploadId);
                    const file = event.target.files[0];

                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            preview.src = e.target.result;
                            preview.style.display = "block";
                            upload.style.display = "none";
                        };
                        reader.readAsDataURL(file);
                    }
                });
            }

            setupImageUpload("teacher_photo", "student_preview", "teacher_photo_upload");
            setupImageUpload("father_photo", "father_preview", "father_photo_upload");
            setupImageUpload("mother_photo", "mother_preview", "mother_photo_upload");


            // pop up message
            const popup = document.getElementById('popup');
            // Show popup with slide-up
            popup.classList.remove('opacity-0', 'translate-y-10');

            // Hide after 3 seconds
            setTimeout(() => {
                popup.classList.add('opacity-0', 'translate-y-10');
            }, 3000);

            function confirmSubmit(event) {
                if(!confirm("Are you sure you want to submit?")) {
                    event.preventDefault(); // Cancel form submission
                    return false;
                }
                return true; // Proceed with form submission
            }
        </script>


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