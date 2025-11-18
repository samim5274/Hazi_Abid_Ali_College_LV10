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


    <!-- [ Main Content ] start -->
    @include('teacher.teacher-body')
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
    
    <!-- for live search -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <script>
        $('#search').on('keyup', function() {
            let value = $(this).val();

            if(value) {
                $('.allData').hide();
            } else {
                $('.allData').show();
            }

            $.ajax({
                type: 'GET',
                url: '{{ URL::to("liveSearchTeacher") }}',
                data: {'liveSearchTeacher': value},
                success: function(data) {
                    $('#content').html(data);
                }
            });
        });
    </script>


  </body>
  <!-- [Body] end -->
</html>