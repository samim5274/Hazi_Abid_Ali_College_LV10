<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Dashboard\DashboardController;
use App\Http\Controllers\Student\StudentController;
use App\Http\Controllers\Student\PromoteController;
use App\Http\Controllers\Student\StudentReportController;
use App\Http\Controllers\Teacher\TeacherController;
use App\Http\Controllers\Teacher\AttendTeacherController;
use App\Http\Controllers\Teacher\TeacherReportController;
use App\Http\Controllers\Attendance\AttendanceController;
use App\Http\Controllers\Subject\SubjectController;
use App\Http\Controllers\Exam\ExamController;
use App\Http\Controllers\Enrollment\EntrollmentController;
use App\Http\Controllers\StudentPortal\StudentPortalController;
use App\Http\Controllers\Room\ClassController;
use App\Http\Controllers\Notice\NoticeController;
use App\Http\Controllers\Expenses\ExpensesController;
use App\Http\Controllers\Finance\FeePaymentController;
use App\Http\Controllers\Finance\FinanceReportController;
use App\Http\Controllers\Finance\TotalTransectionController;
use App\Http\Controllers\Setting\SettingController;
use App\Http\Controllers\Bank\BankController;
use App\Http\Controllers\Income\IncomeController;

Auth::routes();

Route::get('/login', [AdminController::class, 'loginView'])->name('login-view');
Route::post('/user-login', [AdminController::class, 'userLogin']);

// forget password route
Route::get('/forteget-password', [AdminController::class, 'forgetPass']);
Route::post('/find-account', [AdminController::class, 'findAccount']);
Route::get('/otp-confirm', [AdminController::class, 'otpConfirm'])->name('otp.form');
Route::post('/otp-verify', [AdminController::class, 'otpVarify']);
Route::get('/create-new-password', [AdminController::class, 'createNewPass'])->name('new.password.form');
Route::post('/create-password', [AdminController::class, 'createPassword']);

Route::get('/clear', function () {
        Artisan::call('config:clear');
        Artisan::call('cache:clear');
        Artisan::call('view:clear');
        Artisan::call('route:clear');
        Artisan::call('optimize:clear');
        Artisan::call('optimize');

        return redirect()->back()->with('success','Caches cleared successfully.');
    });

Route::group(['middleware' => ['admin']], function(){

    Route::get('/change-password', [AdminController::class, 'changePassView'])->name('change-password-view');
    Route::post('/update-password', [AdminController::class, 'updateUpdate']);
    Route::get('/profile', [SettingController::class, 'profile'])->name('user-profile-view');
    Route::get('/edit-teacher-profile', [SettingController::class, 'modifyProfile'])->name('edit-teacher-profile-view');
    Route::post('/modify-teacher-profile', [SettingController::class, 'modifyTeacherProfile']);
    Route::get('/setting', [SettingController::class, 'setting'])->name('setting-view');
    Route::get('/support', [SettingController::class, 'support'])->name('support-view');
    Route::post('/pofile-edit', [SettingController::class, 'editProfile']);
    Route::post('/groups/store', [SettingController::class, 'storeGroup'])->name('groups.store');
    Route::get('/edit-group/{id}', [SettingController::class, 'editGroup'])->name('edit-group');
    Route::post('/modify-group/{id}', [SettingController::class, 'modifyGroup'])->name('groups.update');
    Route::post('/delete-group/{id}', [SettingController::class, 'deleteGroup']);
    
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/database-backup', [DashboardController::class, 'dbBackup']);

    Route::get('/student-list', [StudentController::class, 'studentList'])->name('student-list');
    Route::get('/add-student-view', [StudentController::class, 'addStudentView'])->name('add-student-view');
    Route::post('/add-new-student', [StudentController::class, 'addStudent']);
    Route::get('/edit-student-view/{id}', [StudentController::class, 'editStudentView'])->name('student-edit-view');
    Route::post('/edit-student/{id}', [StudentController::class, 'editStudent']);
    Route::get('liveSearchStudent', [StudentController::class, 'liveSearch']);

    // Only Head of department access this links
    Route::group(['middleware' => ['hod']], function(){ 
        Route::get('/promote-class/{class_id}', [PromoteController::class, 'promoteClass']);
    });
    Route::get('/student/migration', [PromoteController::class, 'classList'])->name('migration-class-list');
    Route::get('/migration/class/{class}', [PromoteController::class, 'stdList'])->name('student-list-migration');
    Route::post('/update/student/class/{student}', [PromoteController::class, 'updateStudent']);    
    

    Route::get('/student-report', [StudentReportController::class, 'genderReport'])->name('gender-wise-student-report-view');
    Route::get('/find-gender-wise-student', [StudentReportController::class, 'findGenderReport']);
    Route::get('/student-daily-report-view', [StudentReportController::class, 'studentDailyReport'])->name('student-daily-report-view');
    Route::get('/get-students/{class_id}', [StudentReportController::class, 'getStudents'])->name('get.students');
    Route::get('/filter-student-daily-report', [StudentReportController::class, 'findStudentDailyReport'])->name('filter-student-daily-report');




    Route::get('/teacher-list', [TeacherController::class, 'teacherList'])->name('teacher-list');
    Route::get('/add-teacher-view', [TeacherController::class, 'addTeacherView'])->name('add-teacher-view');
    Route::post('/add-new-teacher', [TeacherController::class, 'addTeacher']);
    Route::get('/edit-teacher-view/{id}', [TeacherController::class, 'editTeacherView'])->name('teacher-edit-view');
    Route::post('/edit-teacher/{id}', [TeacherController::class, 'editTeacher']);
    Route::get('liveSearchTeacher', [TeacherController::class, 'liveSearchTeacher']);

    Route::get('/teacher-report', [TeacherReportController::class, 'teacherReport'])->name('teacher-report');

    Route::get('/teacher-attendance', [AttendTeacherController::class, 'index'])->name('teacher-attendance-view');
    Route::post('/teacher-attendance/store', [AttendTeacherController::class, 'store'])->name('teacher.attendance.store');
    Route::get('/teacher-attendance/report', [AttendTeacherController::class, 'attendanceReport'])->name('teacher-attendance-report');
    Route::get('/filter-teacher-attendace', [AttendTeacherController::class, 'filterTeacherAttendace'])->name('filter-teacher-attendace');  
    Route::get('/teacher/attend/edit/{id}', [AttendTeacherController::class, 'editTeacherAttend'])->name('edit-teacher-attendance');
    Route::post('/teacher/attend/update/{id}', [AttendTeacherController::class, 'updateTeacherAttend'])->name('edit-teacher-attendance-update');






    Route::get('/attendance', [AttendanceController::class, 'classList'])->name('class-list');
    Route::get('/class-subject/{class_id}', [AttendanceController::class, 'attendanceView'])->name('class-wise-attendance-view');
    Route::get('/class/subject/{class_id}/{subject_id}', [AttendanceController::class, 'studentList']);
    Route::get('/std-present/subject/{id}/{subjectId}', [AttendanceController::class, 'stdPresent']);
    Route::get('/std-absend/subject/{id}/{subjectId}', [AttendanceController::class, 'stdAbsend']);
    Route::get('/attendance-apply', [AttendanceController::class, 'attendApply']);
    Route::get('/total-present-student', [AttendanceController::class, 'dailyAttendet'])->name('today-present-stuent-list');
    Route::get('/date-wise-student', [AttendanceController::class, 'searchAttendView'])->name('search-view');
    Route::get('/search-date-wise-attend-student', [AttendanceController::class, 'searchAttendStudent']);
    Route::get('/class-wise-student', [AttendanceController::class, 'classListAttend'])->name('class-wise-attend-list');
    Route::get('/search-date-and-class-attend-student', [AttendanceController::class, 'findClassAttend']);
    Route::get('/student-wise-attendance', [AttendanceController::class, 'studentAttend'])->name('student-wise-attendance');
    Route::get('/find-student-attendace', [AttendanceController::class, 'findStudentAttend']);
    Route::get('/subject-wise-attendance', [AttendanceController::class, 'subjectAttend'])->name('subject-wise-attendance');
    Route::get('/subjects/{class_id}', [AttendanceController::class, 'getSubjectsByClass']);
    Route::get('/students-by-subject/{subject_id}', [AttendanceController::class, 'getStudentsBySubject']);
    Route::get('/find-subject-attendace', [AttendanceController::class, 'findSubjectAttent']);
    Route::post('/edit-attendance/{id}', [AttendanceController::class, 'editStudentAttendance']);






    Route::get('/subject-view', [SubjectController::class, 'subjectView'])->name('subject-vidw');
    Route::post('/add-new-subject', [SubjectController::class, 'addSubject']);
    Route::get('/get-subjects/{classId}', [SubjectController::class, 'getSubjectsByClass']);
    Route::post('/edit-subject/{id}', [SubjectController::class, 'modify']);





    Route::get('/enrollment/class', [EntrollmentController::class, 'enrollmentClass'])->name('enrollment-view');
    Route::get('/enrollment/class/student/{class}', [EntrollmentController::class, 'enrollmentClassStudent'])->name('enrollment-class-student');
    Route::get('/enrollment/class/student/subject/{class}/{student}', [EntrollmentController::class, 'enClaStdSubject'])->name('enrollment-class-student-subject');
    Route::post('/enrolment/class/student/subject/{class}/{student}/{subject}', [EntrollmentController::class, 'enrollment']);





    // Only Head of department access this links
    Route::group(['middleware' => ['hod']], function(){ 
        
    });
    Route::get('/create-exam', [ExamController::class, 'createExam'])->name('create-exam-view');
        Route::post('/create-new-exam', [ExamController::class, 'createNewExam']);
        Route::post('/update-exam/{id}', [ExamController::class, 'updateExam']);
        Route::post('/add-new-exam', [ExamController::class, 'addExam']);
        Route::post('/modify-exam/{exam_id}', [ExamController::class, 'modifyExam']);
        
    Route::get('/exam-management', [ExamController::class, 'viewExam'])->name('exam-details-view');
    
    Route::get('/exam-class-list', [ExamController::class, 'classList'])->name('result-entry-class-view');
    Route::get('/class/exam/{class}', [ExamController::class, 'examView'])->name('class-exam-select');
    Route::get('/class/subject/exam/{class}/{subject}/{exam}', [ExamController::class, 'classExam'])->name('class-exam-view');
    Route::post('/submit-mark/{id}', [ExamController::class, 'submitMark']);
    Route::get('/result-and-report-analytics', [ExamController::class, 'resultReport'])->name('result-report-view');
    Route::get('/result-report/class/{class}', [ExamController::class, 'resultReportClass'])->name('result-report-student-list');
    Route::get('/result-report/class/student/{class}/{student}', [ExamController::class, 'showResult'])->name('show-student-result');
    Route::get('/total-report-result', [ExamController::class, 'totalReport'])->name('total-report-class-list');
    Route::get('/total-result-report/class/{class}', [ExamController::class, 'totalResult'])->name('total-result-report');
    



    // Only Head of department access this links
    Route::group(['middleware' => ['hod']], function(){    });            
        Route::get('/add-class', [ClassController::class, 'addNew'])->name('add-new-class-view');
        Route::post('/insert-class', [ClassController::class, 'insertClass']);
        Route::get('/edit-class/{id}', [ClassController::class, 'editClass'])->name('edit-class-view');
        Route::post('/modify-class/{id}', [ClassController::class, 'modifyClass']);
        Route::post('/submit-class-schedule', [ClassController::class, 'store']);
        Route::get('/modify-class-schedule', [ClassController::class, 'modifySchedule'])->name('class-schedule-modify-view');
        Route::get('/search-modify-class-schedule', [ClassController::class, 'searchSchedule']);
        Route::get('/edit/class/schedule/{scheduleId}', [ClassController::class, 'editSchedule'])->name('edit-class-schedule');
        Route::post('/update-class-schedule/{id}', [ClassController::class, 'updateClassSchedule']);
        Route::get('/delete/class/schedule/{id}', [ClassController::class, 'deleteClassSchedule']);
        Route::get('/assign-teacher-list', [ClassController::class, 'assignTeacehr'])->name('assign-teacher-list-view');
        Route::post('/assigned-teacher-update', [ClassController::class, 'update']);
    
    Route::get('/class-details', [ClassController::class, 'index'])->name('class-room-list');    
    Route::get('/class-schedule', [ClassController::class, 'classSchedule'])->name('class-schedule-view');
    Route::get('/my-class-schedule', [ClassController::class, 'mySchedule'])->name('my-class-schedule');





    // ======================================================= Notice Board Route =======================================================
    Route::get('/notice', [NoticeController::class, 'index'])->name('notice-create-view');
    Route::post('/create-notice', [NoticeController::class, 'create'])->name('create-new-notice');
    Route::get('/notice/view/{file}', [NoticeController::class, 'attachView'])->name('view-attachment');
    Route::get('/delete/notice/{id}', [NoticeController::class, 'delete'])->name('delete-notice');
    Route::get('/view/notice/{id}', [NoticeController::class, 'viewNotice'])->name('view-notice');


    // Only Finance and account access this links
    Route::group(['middleware' => ['finance']], function(){  });

        Route::get('/fee-structure', [FeePaymentController::class, 'stuctureSetup'])->name('structure-management');
        Route::get('/fee-structure-edit/{id}', [FeePaymentController::class, 'updateStructre']);
        Route::post('/modify-fee-structure/{id}', [FeePaymentController::class, 'editStructre']);
        Route::get('/fee-collection', [FeePaymentController::class, 'FeeCollection'])->name('fee-collection-view');
        Route::get('/class-finance/{class_id}', [FeePaymentController::class, 'StudentList'])->name('class-and student-list');
        Route::get('/class/student/{class_id}/{student_id}', [FeePaymentController::class, 'feeView'])->name('student-class-fee-view');
        Route::get('/due-collection', [FeePaymentController::class, 'dueCollection'])->name('due-collection');
        Route::get('/student/payment-info/{student}', [FeePaymentController::class, 'paymentInfo']);
        Route::post('/due-collection-payment', [FeePaymentController::class, 'duePament']);

        Route::get('/finance-management', [FeePaymentController::class, 'financeManagement'])->name('finance-management');
        Route::post('/add-new-finance-category', [FeePaymentController::class, 'store']);
        Route::get('/edit-finance-category/{id}', [FeePaymentController::class, 'editCategory']);
        Route::post('/update-finance-category/{id}', [FeePaymentController::class, 'updateCategory']);
        Route::get('/finance-fee-structure', [FeePaymentController::class, 'financeFeeStructure'])->name('finance-fee-structure');
        Route::post('/insert-fee-structure', [FeePaymentController::class, 'insertFeeStructure']);
        Route::get('/finance-fee-payment', [FeePaymentController::class, 'financeFeePayment'])->name('finance-fee-payment');
        Route::post('/fee-payments-2', [FeePaymentController::class, 'feePayment']);
        Route::get('/fee-payment-show/{id}', [FeePaymentController::class, 'showPayment'])->name('show-specific-student-payment');
        Route::get('/print-pay-invoice/{receipt}', [FeePaymentController::class, 'feePayPrintReceipt']);

        Route::get('/total-transection-summary', [TotalTransectionController::class, 'totalTransectionSummary']);

        Route::get('/students/{class_id}', [FeePaymentController::class, 'getStudentsByClass']);
        Route::get('/fee-structures/{class_id}', [FeePaymentController::class, 'getFeeStructuresByClass']);
        
        Route::get('/student-finance-report', [FinanceReportController::class, 'studentFinanceReport'])->name('student-finance-report-view');
        Route::get('/find-payment-report', [FinanceReportController::class, 'findPaymentReport']);
        Route::get('/category-class-finance-report', [FinanceReportController::class, 'categroyReport'])->name('category-finance-report');
        Route::get('/find-category-payment-report', [FinanceReportController::class, 'findCategoryFeeReport']);
        Route::get('/student-wise-payment-report', [FinanceReportController::class, 'studentFeeReport'])->name('student-fee-report');
        Route::get('/find-student-fee-payment', [FinanceReportController::class, 'findStudentFeeReport']);
        Route::get('/fee-payment-hisoty', [FinanceReportController::class, 'paymentHistory']);
        Route::get('/find-payment-history', [FinanceReportController::class,'findPaymentHistory']);







        Route::get('/bank-setting', [BankController::class, 'setting'])->name('bank-setting-view');
        Route::post('/create-bank', [BankController::class, 'createBank']);
        Route::get('/edit-bank/{id}', [BankController::class, 'editView'])->name('bank-edit-view');
        Route::post('/modify-bank/{id}', [BankController::class, 'modifyBank']);
        Route::post('/delete-bank/{id}', [BankController::class, 'deleteBank']);
        Route::get('/bank-diposit-view', [BankController::class, 'bankDepositView'])->name('bank-diposit-view');
        Route::post('/bank-diposit-amount', [BankController::class, 'bankDepositAmount']);
        Route::get('/edit-bank-deposit/{id}', [BankController::class, 'dipositEdit'])->name('bank-diposit-edit-view');
        Route::post('/modify-bank-deposit/{id}', [BankController::class, 'dipositModify']);
        Route::post('/delete-bank-deposit/{id}', [BankController::class, 'deleteDiposit']);
        Route::get('/bank-withdraw-view', [BankController::class, 'bankWithdrawView'])->name('bank-withdraw-view');
        Route::post('/bank-withdraw-amount', [BankController::class, 'bankWithdrawAmount']);
        Route::get('/edit-bank-withdraw/{id}', [BankController::class, 'withdrawEdit'])->name('bank-withdraw-edit-view');
        Route::post('/modify-bank-withdraw/{id}', [BankController::class, 'withdrawModify']);
        Route::post('/delete-bank-withdraw/{id}', [BankController::class, 'withdrawDelete']);
        Route::get('/bank-to-transection-view', [BankController::class, 'bankToTransectionView'])->name('bank-to-transection-view');
        Route::post('/bank-to-bank-transection', [BankController::class, 'bankToBankTransection']);
        Route::get('/total-transection-report', [BankController::class, 'totalTransectionReport'])->name('total-transection');
        Route::get('/filter-transection-date', [BankController::class, 'filterTransectionDate'])->name('filter-transection-date');
        Route::get('/total-diposit', [BankController::class, 'totalDiposit'])->name('total-diposit');
        Route::get('/filter-total-diposit-date', [BankController::class, 'filterDipositDate'])->name('filter-total-diposit-date');
        Route::get('/total-withdraw', [BankController::class, 'totalWithdraw'])->name('total-withdraw');
        Route::get('/filter-total-Withdraw-date', [BankController::class, 'filterWithdrawDate'])->name('filter-total-Withdraw-date');





        // ======================================================= expense Board Route =======================================================
        Route::get('/expense', [ExpensesController::class, 'index'])->name('expenses-view');
        Route::get('/get-subcategories/{id}', [ExpensesController::class, 'getSubCategory']);
        Route::post('/create-expenses', [ExpensesController::class, 'store']);
        Route::get('/delete/Expense/{id}', [ExpensesController::class, 'delete']);
        Route::get('/expenses-view/{id}', [ExpensesController::class, 'expensesView']);
        Route::get('/expenses-edit/{id}', [ExpensesController::class, 'edit']);
        Route::post('/modify-expenses/{id}', [ExpensesController::class, 'update']);
        Route::get('/expenses-print/{id}', [ExpensesController::class, 'print']);
        // Expenses setting
        Route::get('/expense-setting', [ExpensesController::class, 'setting']);
        Route::post('/create-expenses-category', [ExpensesController::class, 'createCategory']);
        Route::get('/edit-expenses-category/{id}', [ExpensesController::class, 'editView']);
        Route::post('/modify-expenses-category/{id}', [ExpensesController::class, 'updateCategory']);
        Route::post('/delete-expenses-category/{id}', [ExpensesController::class, 'deleteCategory']);
        Route::post('/create-expenses-subcategory', [ExpensesController::class, 'createSubCategory']);
        Route::get('/edit-expenses-subcategory/{id}', [ExpensesController::class, 'editSubView']);
        Route::post('/modify-expenses-subcategory/{id}', [ExpensesController::class, 'updateSubCategory']);
        Route::post('/delete-expenses-subcategory/{id}', [ExpensesController::class, 'deleteSubCategory']);
        // Expenses report Route
        Route::get('/date-wise-expenses', [ExpensesController::class, 'dateExpenses']);
        Route::get('/expenses-data-filter', [ExpensesController::class, 'filterExpenses']);
        Route::get('/category-wise-expenses', [ExpensesController::class, 'categroyExpenses']);
        Route::get('/expenses-category-data-filter', [ExpensesController::class, 'filterCatExpen']);
        Route::get('/sub-category-wise-expenses', [ExpensesController::class, 'subCategoyExpenses']);
        Route::get('/expenses-sub-category-data-filter', [ExpensesController::class, 'filterSubCatExpen']);


        // ======================================================= income Board Route =======================================================
        Route::get('/income', [IncomeController::class, 'index'])->name('income-view');
        Route::get('/get-income-subcategories/{id}', [IncomeController::class, 'getIncomeSubCategory']);
        Route::post('/create-income', [IncomeController::class, 'store']);
        Route::get('/income-view/{id}', [IncomeController::class, 'incomeView']);
        Route::get('/income-delete/{id}', [IncomeController::class, 'delete']);
        Route::get('/income-print/{id}', [IncomeController::class, 'print']);
        Route::get('/income-edit/{id}', [IncomeController::class, 'edit']);
        Route::post('/modify-income/{id}', [IncomeController::class, 'update']);    

        // income setting routes
        Route::get('/income-setting', [IncomeController::class, 'incomeSetting'])->name('income-setting-view');
        //category routes
        Route::post('/create-income-category', [IncomeController::class, 'storeIncomeCategory'])->name('create-income-category');
        Route::get('/edit-income-category/{id}', [IncomeController::class, 'editIncomeCategory'])->name('income-category-edit-view');
        Route::post('/modify-income-category/{id}', [IncomeController::class, 'modifyIncomeCategory']);
        Route::post('/delete-income-category/{id}', [IncomeController::class, 'deleteIncomeCategory']);
        // subcategory routes
        Route::post('/create-income-subcategory', [IncomeController::class, 'storeIncomeSubCategory'])->name('create-income-subcategory');
        Route::get('/edit-income-subcategory/{id}', [IncomeController::class, 'editIncomeSubCategory'])->name('income-subcategory-edit-view');
        Route::post('/modify-income-subcategory/{id}', [IncomeController::class, 'modifyIncomeSubCategory']);
        Route::post('/delete-income-subcategory/{id}', [IncomeController::class, 'deleteIncomeSubCategory']);

        // Income report Route
        Route::get('/date-wise-income', [IncomeController::class, 'dateIncome']);
        Route::get('/income-data-filter', [IncomeController::class, 'filterIncome']);
        Route::get('/category-wise-income', [IncomeController::class, 'categroyIncome']);
        Route::get('/income-category-data-filter', [IncomeController::class, 'filterCatIncome']);
        Route::get('/sub-category-wise-income', [IncomeController::class, 'subCategoyIncome']);
        Route::get('/income-sub-category-data-filter', [IncomeController::class, 'filterSubCatIncome']);
    







    // ======================================================= student portal routes =======================================================
    Route::get('/student-dashboard', [StudentPortalController::class, 'stdDashboard'])->name('student-dashboard');
    Route::get('/student-profile', [StudentPortalController::class, 'profile'])->name('student-profile-view');
    Route::get('/my-class', [StudentPortalController::Class, 'myClass'])->name('student-class-view');
    Route::get('/student-attendance', [StudentPortalController::class, 'attendance'])->name('student-attendance-view');
    Route::get('/get-student-attendace', [StudentPortalController::class, 'getAttedance']);
    Route::get('/student-exam-list', [StudentPortalController::class, 'examList'])->name('student-exam-list');
    Route::get('/student-results', [StudentPortalController::class, 'results'])->name('student-result');
    Route::get('/student-fee-details', [StudentPortalController::class, 'feeDetails'])->name('student-fee-details');
    Route::get('/payment-history', [StudentPortalController::class, 'myPaymentHistory'])->name('my-payment-history');
    Route::get('/student/invoice/{id}', [StudentPortalController::class, 'paymentDetails'])->name('fee-payment-details');
    Route::get('/student-payment-history', [StudentPortalController::class, 'feeHistory'])->name('payment-history');
    Route::get('/my-daily-report', [StudentPortalController::class, 'dailyReport'])->name('my-daily-report');
    Route::post('/student-daily-report', [StudentPortalController::class, 'dailyReportStore'])->name('student-daily-routine.store');
    Route::get('/edit-student-daily-routine/{id}', [StudentPortalController::class, 'editStudentDailyRoutine'])->name('edit-student-daily-routine');
    Route::post('/edit-student-daily-report', [StudentPortalController::class, 'dailyReportEdit'])->name('student-daily-routine.edit');
    Route::get('/student-enrollment', [StudentPortalController::class, 'enrollment'])->name('student-enrollment');
    Route::post('/student-subject-enrollment', [StudentPortalController::class, 'enrollmentStore']);
    Route::get('/student-support', [StudentPortalController::class, 'stdSupport'])->name('student-support');
    Route::get('/edit-profile', [StudentPortalController::class, 'editProfile'])->name('student-edit-profile');
    Route::post('/modify-student-information', [StudentPortalController::class, 'modifyProfile']);
    Route::get('/student/change-password', [StudentPortalController::class, 'passChange'])->name('student-password-change-view');
    Route::post('/update-password', [StudentPortalController::class, 'updatePass']);
});