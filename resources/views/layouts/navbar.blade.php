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
            <a href="{{url('/')}}" class="b-brand flex items-center gap-3">
                <!-- ========   Change your logo from here   ============ -->
                <img src="{{asset('assets/images/logo-white.svg')}}" class="img-fluid logo logo-lg" alt="logo" />
                <img src="{{asset('assets/images/favicon.svg')}}" class="img-fluid logo logo-sm" alt="logo" />
            </a>
        </div>
        <div class="navbar-content h-[calc(100vh_-_74px)] py-2.5 overflow-y-auto">
            <ul class="pc-navbar">
                <li class="pc-item pc-caption">
                    <label>Navigation</label>
                </li>
                <li class="pc-item">
                    <a href="{{url('/')}}" class="pc-link">
                        <span class="pc-micon">
                        <i data-feather="home"></i>
                        </span>
                        <span class="pc-mtext">Dashboard</span>
                    </a>
                </li>












                <!-- Student section start -->
                <li class="pc-item pc-caption">
                    <label>Students</label>
                    <i data-feather="feather"></i>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i class="fa-solid fa-graduation-cap"></i> </span><span
                    class="pc-mtext">Student Details</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="{{url('/student-list')}}"> <span class="pc-micon"> <i class="fa-solid fa-user-tie"></i></span><span class="pc-mtext">Student List</span></a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/add-student-view')}}"> <span class="pc-micon"> <i data-feather="edit"></i></span><span class="pc-mtext">Admission Student</span></a></li>
                    </ul>
                </li>                
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i data-feather="align-right"></i> </span><span
                    class="pc-mtext">Report's</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="{{ url('/student-report') }}">Student Report's</a></li>
                        <!-- <li class="pc-item"><a class="pc-link" href="#!">Class Report's</a></li>
                        <li class="pc-item"><a class="pc-link" href="#!">Section Report's</a></li>
                        <li class="pc-item"><a class="pc-link" href="#!">Status</a></li> -->
                    </ul>
                </li>
                <!-- Student section End -->








                <!-- Teachers section start -->
                <li class="pc-item pc-caption">
                    <label>Teachers</label>
                    <i data-feather="feather"></i>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i class="fa-solid fa-user-tie"></i> </span><span
                    class="pc-mtext">Teacher Details</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="{{url('/teacher-list')}}"> <span class="pc-micon"> <i class="fa-solid fa-user-tie"></i></span><span class="pc-mtext">Teacher List</span></a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('add-teacher-view')}}"> <span class="pc-micon"> <i data-feather="edit"></i>  </span><span class="pc-mtext">New Teacher</span></a></li>
                    </ul>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i data-feather="align-right"></i> </span><span
                    class="pc-mtext">Report's</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="{{url('/teacher-report')}}">Teacher Report's</a></li>
                    </ul>
                </li>
                <!-- Teachers section End -->












                <!-- Classes & Sections start  -->
                <li class="pc-item pc-caption">
                    <label>Classes & Sections</label>
                    <i data-feather="feather"></i>
                </li>

                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i class="fa-solid fa-list-check"></i> </span><span
                    class="pc-mtext">Classes Details</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item">
                            <a class="pc-link" href="{{url('/add-class')}}"> 
                                <span class="pc-micon"> <i data-feather="edit"></i></span>
                                <span class="pc-mtext">Add New Class</span>
                            </a>
                        </li>
                        <li class="pc-item">
                            <a class="pc-link" href="{{url('/class-details')}}"> 
                                <span class="pc-micon"> <i class="fa-solid fa-address-card"></i> </span>
                                <span class="pc-mtext">Class List</span>
                            </a>
                        </li>
                        <li class="pc-item">
                            <a class="pc-link" href="{{url('/class-schedule')}}"> 
                                <span class="pc-micon"> <i class="fa-solid fa-business-time"></i>  </span>
                                <span class="pc-mtext">Class Schedule</span>
                            </a>
                        </li>  
                        <li class="pc-item">
                            <a class="pc-link" href="{{url('/modify-class-schedule')}}"> 
                                <span class="pc-micon"> <i class="fa-solid fa-calendar-days"></i>  </span>
                                <span class="pc-mtext">Modify Schedule</span>
                            </a>
                        </li>                      
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/assign-teacher-list')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-user-plus"></i></span>
                                <span class="pc-mtext">Assign Teachers</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i data-feather="align-right"></i> </span><span
                    class="pc-mtext">Report's</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="#!">Daily</a></li>
                        <li class="pc-item"><a class="pc-link" href="#!">Monthly</a></li>
                        <li class="pc-item"><a class="pc-link" href="#!">Yearly</a></li>
                    </ul>
                </li> -->
                <!-- Classes & Sections start  -->
















                <!-- Attendance start -->
                <li class="pc-item pc-caption">
                    <label>Attendance</label>
                    <i data-feather="feather"></i>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i class="fa-solid fa-business-time"></i> </span><span
                    class="pc-mtext">Attendance</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/class-list')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-clipboard-user"></i></span>
                                <span class="pc-mtext">Attendance Records</span>
                            </a>
                        </li>
                        <!-- <li class="pc-item pc-hasmenu">
                            <a href="#" class="pc-link">
                                <span class="pc-micon"> <i data-feather="edit"></i></span>
                                <span class="pc-mtext">Attendance Reports</span>
                            </a>
                        </li> -->
                    </ul>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i data-feather="align-right"></i> </span><span
                    class="pc-mtext">Report's</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="{{url('/total-present-student')}}">Daily</a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/date-wise-student')}}">Date wise Report's</a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/class-wise-student')}}">Class Wise Report's</a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/student-wise-attendance')}}">Student Wise Report's</a></li>
                    </ul>
                </li>
                <!-- Attendance end -->















                <!-- Exam & Result start -->
                <li class="pc-item pc-caption">
                    <label>Exam & Result</label>
                    <i data-feather="feather"></i>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i class="fa-solid fa-address-book"></i> </span><span
                    class="pc-mtext">Exam's & Result's</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/create-exam')}}" class="pc-link">
                                <span class="pc-micon"> <i data-feather="edit"></i></span>
                                <span class="pc-mtext">Create Exams</span>
                            </a>
                        </li>
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/exam-management')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-vial-virus"></i></span>
                                <span class="pc-mtext">Exam Management</span>
                            </a>
                        </li>
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/exam-class-list')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-bookmark"></i></span>
                                <span class="pc-mtext">Result Entry</span>
                            </a>
                        </li>
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/enrollment/class')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-door-open"></i></span>
                                <span class="pc-mtext">Enrollment</span>
                            </a>
                        </li>                        
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/result-and-report-analytics')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-chart-simple"></i></span>
                                <span class="pc-mtext">Result Analytics</span>
                            </a>
                        </li>                
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/total-report-result')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-chart-gantt"></i></span>
                                <span class="pc-mtext">Total Result</span>
                            </a>
                        </li>   
                        <li class="pc-item pc-hasmenu">
                            <a href="{{url('/student/migration')}}" class="pc-link">
                                <span class="pc-micon"> <i class="fa-solid fa-up-down"></i></span>
                                <span class="pc-mtext">Migration</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i data-feather="align-right"></i> </span><span
                    class="pc-mtext">Report's</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="#!">Daily</a></li>
                        <li class="pc-item"><a class="pc-link" href="#!">Monthly</a></li>
                        <li class="pc-item"><a class="pc-link" href="#!">Yearly</a></li>
                    </ul>
                </li> -->
                
                <!-- Exam & Result end -->


















                <!-- Account Start -->
                <li class="pc-item pc-caption">
                    <label>Fees & Finance Account</label>
                    <i data-feather="feather"></i>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i class="fa-solid fa-money-bill"></i> </span><span
                    class="pc-mtext">Finance Management</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="{{url('/finance-management')}}">Fee Category</a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/finance-fee-structure')}}">Fee Structure</a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/finance-fee-payment')}}">Fee Payment</a></li>
                    </ul>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"> <i data-feather="align-right"></i> </span><span
                    class="pc-mtext">Finance Report</span><span class="pc-arrow"><i class="ti ti-chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="{{url('/student-finance-report')}}">Student Report's</a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/category-class-finance-report')}}">Category Report's</a></li>
                        <li class="pc-item"><a class="pc-link" href="{{url('/student-wise-payment-report')}}">Student Wise Report's</a></li>
                    </ul>
                </li>
                <!-- Account End -->



















                <!-- Authentication star -->
                <li class="pc-item pc-caption">
                    <label>Authentication</label>
                    <i data-feather="monitor"></i>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="{{url('/login')}}" class="pc-link">
                        <span class="pc-micon"> <i data-feather="lock"></i></span>
                        <span class="pc-mtext">Logout</span>
                    </a>
                </li>
                <!-- <li class="pc-item pc-hasmenu">
                    <a href="#" class="pc-link">
                        <span class="pc-micon"> <i data-feather="user-plus"></i></span>
                        <span class="pc-mtext">Register</span>
                    </a>
                </li> -->
                <!-- Authentication end -->







            </ul>
        </div>
    </div>
</nav>