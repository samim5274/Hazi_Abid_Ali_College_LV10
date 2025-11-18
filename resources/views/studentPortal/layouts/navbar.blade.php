<!-- [ Pre-loader ] start -->
<div class="loader-bg fixed inset-0 bg-white dark:bg-themedark-cardbg z-[1034]">
    <div class="loader-track h-[5px] w-full inline-block absolute overflow-hidden top-0">
        <div class="loader-fill w-[300px] h-[5px] bg-primary-500 absolute top-0 left-0 animate-[hitZak_0.6s_ease-in-out_infinite_alternate]"></div>
    </div>
</div>
<!-- [ Pre-loader ] End -->

<nav class="pc-sidebar">
    <div class="navbar-wrapper">
        <div class="m-header flex items-center py-4 px-6 h-header-height">
            <a href="{{url('/student-dashboard')}}" class="b-brand flex items-center gap-3">
                <img src="{{asset('assets/images/logo-white.svg')}}" class="img-fluid logo logo-lg" alt="logo" />
                <img src="{{asset('assets/images/favicon.svg')}}" class="img-fluid logo logo-sm" alt="logo" />
            </a>
        </div>
        <div class="navbar-content h-[calc(100vh_-_74px)] py-2.5 overflow-y-auto">
            <ul class="pc-navbar">

                <!-- Dashboard -->
                <li class="pc-item pc-caption">
                    <label>Navigation</label>
                </li>
                <li class="pc-item">
                    <a href="{{url('/student-dashboard')}}" class="pc-link">
                        <span class="pc-micon"><i data-feather="home"></i></span>
                        <span class="pc-mtext">Dashboard</span>
                    </a>
                </li>

                <!-- Profile -->
                <li class="pc-item pc-caption">
                    <label>Profile</label>
                </li>
                <li class="pc-item">
                    <a href="{{url('/student-profile')}}" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-user"></i></span>
                        <span class="pc-mtext">My Profile</span>
                    </a>
                </li>

                <!-- Classes & Schedule -->
                <li class="pc-item pc-caption">
                    <label>Classes & Schedule</label>
                </li>
                <!-- <li class="pc-item">
                    <a href="#" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-list-check"></i></span>
                        <span class="pc-mtext">My Class</span>
                    </a>
                </li> -->
                <li class="pc-item">
                    <a href="{{url('/my-class')}}" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-business-time"></i></span>
                        <span class="pc-mtext">Class Schedule</span>
                    </a>
                </li>

                <!-- Attendance -->
                <li class="pc-item pc-caption">
                    <label>Attendance</label>
                </li>
                <li class="pc-item">
                    <a href="{{url('/student-attendance')}}" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-clipboard-user"></i></span>
                        <span class="pc-mtext">My Attendance</span>
                    </a>
                </li>

                <!-- Exam & Result -->
                <li class="pc-item pc-caption">
                    <label>Exam & Results</label>
                </li>
                <li class="pc-item">
                    <a href="{{url('/student-exam-list')}}" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-book-open"></i></span>
                        <span class="pc-mtext">Exam List</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{url('/student-results')}}" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-chart-line"></i></span>
                        <span class="pc-mtext">My Results</span>
                    </a>
                </li>

                <!-- Fees & Payments -->
                <li class="pc-item pc-caption">
                    <label>Fees & Finance</label>
                </li>
                <li class="pc-item">
                    <a href="{{url('/student-fee-details')}}" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-money-bill"></i></span>
                        <span class="pc-mtext">My Fees</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{url('/student-payment-history')}}" class="pc-link">
                        <span class="pc-micon"><i class="fa-solid fa-file-invoice-dollar"></i></span>
                        <span class="pc-mtext">Payment History</span>
                    </a>
                </li>

                <!-- Authentication -->
                <li class="pc-item pc-caption">
                    <label>Authentication</label>
                </li>
                <li class="pc-item">
                    <a href="{{url('/login')}}" class="pc-link">
                        <span class="pc-micon"><i data-feather="log-out"></i></span>
                        <span class="pc-mtext">Logout</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>
