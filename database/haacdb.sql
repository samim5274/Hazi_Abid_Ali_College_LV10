-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2025 at 09:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `haacdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Present',
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_schedules`
--

CREATE TABLE `class_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `period` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `email`, `phone`, `website`, `created_at`, `updated_at`) VALUES
(1, 'Hazi Abed Ali College', 'East Brahmondi, Narsingdi. || Code - 3010 || Degree - 5424 || EIIN - 112717', 'info@haac.edu.bd', '01700000000', 'www.haac.edu.bd', '2025-12-14 06:06:59', '2025-12-14 06:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `max_marks` int(11) NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_names`
--

CREATE TABLE `exam_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `excategories`
--

CREATE TABLE `excategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `excategories`
--

INSERT INTO `excategories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Salary', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(2, 'Utility', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(3, 'Maintenance', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(4, 'Academic', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(5, 'Transport', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(6, 'Event', '2025-12-20 08:35:15', '2025-12-20 08:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `catId` bigint(20) UNSIGNED NOT NULL,
  `subcatId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `remark` text NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exsubcategories`
--

CREATE TABLE `exsubcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exsubcategories`
--

INSERT INTO `exsubcategories` (`id`, `cat_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Teacher Salary', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(2, 1, 'Staff Salary', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(3, 1, 'Guest Teacher Salary', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(4, 2, 'Electricity Bill', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(5, 2, 'Water Bill', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(6, 2, 'Internet Bill', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(7, 3, 'Furniture Repair', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(8, 3, 'Building Repair', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(9, 3, 'Painting', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(10, 4, 'Books Purchase', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(11, 4, 'Lab Equipment', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(12, 4, 'Classroom Materials', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(13, 5, 'Bus Fuel', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(14, 5, 'Driver Salary', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(15, 5, 'Vehicle Repair', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(16, 6, 'Annual Program', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(17, 6, 'Sports Day', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(18, 6, 'Prize Giving Ceremony', '2025-12-20 08:35:15', '2025-12-20 08:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_categories`
--

CREATE TABLE `fee_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_categories`
--

INSERT INTO `fee_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tuition Fee', 'Regular fee for academic instruction and classes', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(2, 'Admission Fee', 'One-time fee for student enrollment', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(3, 'Exam Fee', 'Fee for conducting examinations', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(4, 'Library Fee', 'Charge for library access and maintenance', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(5, 'Laboratory Fee', 'Fee for science/computer lab usage', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(6, 'Sports Fee', 'Charge for sports activities and events', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(7, 'Transport Fee', 'Fee for school bus/transport facilities', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(8, 'Hostel Fee', 'Accommodation and meal charges in hostel', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(9, 'Development Fee', 'Fee for infrastructure and school development', '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(10, 'Activity Fee', 'Fee for extracurricular activities and events', '2025-12-20 08:35:15', '2025-12-20 08:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `fee_payments`
--

CREATE TABLE `fee_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `fee_structure_id` bigint(20) UNSIGNED NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_date` date NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL DEFAULT 'Cash',
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `receipt_no` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_payment_details`
--

CREATE TABLE `fee_payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `total_paid` decimal(10,2) NOT NULL,
  `total_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_due` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `month` varchar(2) NOT NULL,
  `year` varchar(4) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `receipt_no` varchar(255) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_payment_items`
--

CREATE TABLE `fee_payment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fee_payment_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `fee_structure_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structures`
--

CREATE TABLE `fee_structures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `fee_cat_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Science (General Science)', NULL, NULL),
(2, 'Science (Biology / Pre-Medical)', NULL, NULL),
(3, 'Science (Physical Science / Pre-Engineering)', NULL, NULL),
(4, 'Science (Computer Science / ICT Focus)', NULL, NULL),
(5, 'Arts (Humanities / General Arts)', NULL, NULL),
(6, 'Arts (Social Science)', NULL, NULL),
(7, 'Arts (Fine Arts / Performing Arts)', NULL, NULL),
(8, 'Arts (Language & Literature Focus)', NULL, NULL),
(9, 'Commerce (Business Studies)', NULL, NULL),
(10, 'Commerce (Accounting / Finance Focus)', NULL, NULL),
(11, 'Commerce (Management / Marketing Focus)', NULL, NULL),
(12, 'Commerce (Economics Focus)', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `marks_obtained` int(11) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(126, '2025_12_13_144631_create_groups_table', 1),
(191, '2014_10_12_000000_create_users_table', 2),
(192, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(193, '2014_10_12_100000_create_password_resets_table', 2),
(194, '2019_08_19_000000_create_failed_jobs_table', 2),
(195, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(196, '2025_09_11_094326_create_teachers_table', 2),
(197, '2025_09_12_060130_create_rooms_table', 2),
(198, '2025_09_12_060131_create_students_table', 2),
(199, '2025_09_13_043440_create_groups_table', 2),
(200, '2025_09_13_043441_create_subjects_table', 2),
(201, '2025_09_13_043442_create_attendances_table', 2),
(202, '2025_09_13_085234_create_exams_table', 2),
(203, '2025_09_13_085241_create_marks_table', 2),
(204, '2025_09_16_081917_create_student_subjects_table', 2),
(205, '2025_09_22_185426_create_fee_categories_table', 2),
(206, '2025_09_22_185444_create_fee_structures_table', 2),
(207, '2025_09_22_185453_create_fee_payments_table', 2),
(208, '2025_09_28_183808_create_exam_names_table', 2),
(209, '2025_10_03_153733_create_class_schedules_table', 2),
(210, '2025_11_20_122825_create_notices_table', 2),
(211, '2025_11_22_173329_create_teacher_attendances_table', 2),
(212, '2025_11_23_131009_create_student_daily_routines_table', 2),
(213, '2025_12_07_102826_create_excategories_table', 2),
(214, '2025_12_07_102839_create_exsubcategories_table', 2),
(215, '2025_12_07_102853_create_expenses_table', 2),
(216, '2025_12_08_104245_create_companies_table', 2),
(217, '2025_12_09_125819_create_fee_payment_details_table', 2),
(218, '2025_12_09_125837_create_fee_payment_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `publish_date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `notice_type` varchar(255) NOT NULL DEFAULT 'public',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `class_teacher_id` bigint(20) UNSIGNED NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT 50,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `section`, `class_teacher_id`, `capacity`, `created_at`, `updated_at`) VALUES
(1, 'Class 11', 'A', 11, 60, NULL, NULL),
(2, 'Class 12', 'A', 12, 62, NULL, NULL),
(3, 'Class 13', 'A', 12, 62, NULL, NULL),
(4, 'Class 14', 'A', 12, 62, NULL, NULL),
(5, 'Class 15', 'A', 12, 62, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `national_id` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `admission_no` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `session_year` varchar(255) DEFAULT NULL,
  `previous_school` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_profession` varchar(255) DEFAULT NULL,
  `father_contact` varchar(255) DEFAULT NULL,
  `father_email` varchar(255) DEFAULT NULL,
  `father_nid` varchar(255) DEFAULT NULL,
  `father_monthly_income` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_profession` varchar(255) DEFAULT NULL,
  `mother_contact` varchar(255) DEFAULT NULL,
  `mother_email` varchar(255) DEFAULT NULL,
  `mother_nid` varchar(255) DEFAULT NULL,
  `mother_monthly_income` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_contact` varchar(255) DEFAULT NULL,
  `guardian_email` varchar(255) DEFAULT NULL,
  `guardian_nid` varchar(255) DEFAULT NULL,
  `guardian_relationship` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `roll_number` int(11) NOT NULL DEFAULT 0,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `attend_date` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `b_reg_no` bigint(20) DEFAULT NULL,
  `b_roll_no` bigint(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `father_photo` varchar(255) DEFAULT NULL,
  `mother_photo` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `is_profile_completed` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Elmira', 'Yost', '1980-06-28', 'Male', 'AB-', 'Islam', 'Bangladeshi', '9427891742565', '01385945949', 'student1@example.com', '$2y$12$87OafmOeoOHx6MoXNKYlQu6zIwZwFk7iE554CxsvW/YDonKf01riC', '2377 Collier Skyway Apt. 763\nNew Antonetta, WV 27696-0098', '52963 Hazel Groves\nEffertzshire, VA 24159', 'ADM-00001', '1970-09-26', 'A', 'Commerce', '2025-2026', 'Daugherty PLC School', 'Henderson Strosin', 'Teacher', '01700444725', 'father1@example.com', '4207100160478', NULL, 'Thelma Grimes', 'Housewife', '01342330735', 'mother1@example.com', '5361857194270', NULL, 'Dr. Mertie Daugherty MD', '01746589404', 'guardian1@example.com', '3100310984778', 'Brother', 1, 1, 2, '2025-12-20', NULL, 2025000001, 900001, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:15', '2025-12-20 08:34:15', '127.0.0.1', 1, NULL, '2025-12-20 08:34:15', '2025-12-20 08:34:15'),
(2, 'Antonetta', 'Herzog', '2015-12-02', 'Other', 'O+', 'Buddhist', 'Bangladeshi', '8888895611617', '01965502730', 'student2@example.com', '$2y$12$HsZb4fgO1.Twn08dKXquDuA/PhoYyHlvQRkvOWJ5wXMBugy0tyjiu', '6090 Neha Hollow\nNew Mateoland, SD 46904-0347', '167 Darwin Cliff Suite 227\nLake Effieburgh, RI 70507-4106', 'ADM-00002', '2008-02-27', 'C', 'Commerce', '2025-2026', 'Hessel, Hoeger and Kub School', 'Dr. Silas Greenfelder', 'Businessman', '01808161771', 'father2@example.com', '4495243771660', NULL, 'Miss Adrienne Steuber DDS', 'Housewife', '01958039731', 'mother2@example.com', '1359670217689', NULL, 'Ramona Conn', '01482187807', 'guardian2@example.com', '1626088375187', 'Grandparent', 1, 1, 1, '2025-12-20', NULL, 2025000002, 900002, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:15', '2025-12-20 08:34:15', '127.0.0.1', 1, NULL, '2025-12-20 08:34:15', '2025-12-20 08:34:15'),
(3, 'Patrick', 'Stark', '1988-07-22', 'Other', 'A-', 'Islam', 'Bangladeshi', '4687830190617', '01761148827', 'student3@example.com', '$2y$12$jPDy1/Lj6dt8ZmyEj4pvE.W4O/0v6NilwnhfbAciRNJyzWLHkNEp2', '53089 Matilde Lock Suite 561\nPort Ernestinaland, CO 62305-7107', '753 Leopold Viaduct Apt. 728\nLake Jackieberg, WI 71592', 'ADM-00003', '1981-01-18', 'C', 'Arts', '2025-2026', 'Miller-Keeling School', 'Mr. Buddy Klein', 'Teacher', '01590447732', 'father3@example.com', '7984972577642', NULL, 'Bridgette Larson', 'Businesswoman', '01574877479', 'mother3@example.com', '4385644484942', NULL, 'Prof. Boris Bogisich', '01600348194', 'guardian3@example.com', '8818518235128', 'Grandparent', 1, 2, 1, '2025-12-20', NULL, 2025000003, 900003, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16', '127.0.0.1', 1, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16'),
(4, 'Marcia', 'Carroll', '1990-03-31', 'Male', 'A+', 'Other', 'Bangladeshi', '6467423759222', '01735202051', 'student4@example.com', '$2y$12$zqLdUR43xKd..YuSKJuKnuWGUB1gzX/oMc0MYcTzvpMXVju4mS5n.', '30425 Bradtke Springs Suite 691\nZemlaktown, KY 58907', '5165 Cummerata Drive Suite 024\nStammmouth, ME 01915', 'ADM-00004', '2001-04-26', 'C', 'Science', '2025-2026', 'Macejkovic, McGlynn and Kling School', 'Madison Schroeder', 'Farmer', '01758248008', 'father4@example.com', '8895286361560', NULL, 'Dahlia Schmitt', 'Housewife', '01501014928', 'mother4@example.com', '6152771094553', NULL, 'Kris Gutmann', '01865480190', 'guardian4@example.com', '8419000177017', 'Uncle', 1, 1, 3, '2025-12-20', NULL, 2025000004, 900004, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16', '127.0.0.1', 1, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16'),
(5, 'Esmeralda', 'Christiansen', '1992-10-23', 'Other', 'O+', 'Hindu', 'Bangladeshi', '4220354776676', '01350392329', 'student5@example.com', '$2y$12$6BvZo8.3l5khXqYulZIXtuXHfe5TC.2n0F4VNFHdVxKizFfaSqqCC', '22267 Hazle Branch\nNew Verda, RI 04817-7589', '8427 Kulas Mount\nNew Rosalindaburgh, MD 23829-9052', 'ADM-00005', '2015-07-14', 'C', 'Science', '2025-2026', 'Bradtke-Schoen School', 'Dr. Jermey Bartell', 'Businessman', '01747982952', 'father5@example.com', '3766398053239', NULL, 'Dina Rutherford', 'Businesswoman', '01815167899', 'mother5@example.com', '5868756883960', NULL, 'Adele Roob Jr.', '01429186935', 'guardian5@example.com', '7133143905515', 'Sister', 1, 3, 1, '2025-12-20', NULL, 2025000005, 900005, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16', '127.0.0.1', 1, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16'),
(6, 'Juliana', 'Oberbrunner', '2022-01-20', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '5002919697995', '01451353984', 'student6@example.com', '$2y$12$nXHyWjXP7iM9hsli0Z0/d.k91uCB/w1PVDZ2NcXOkB.QkZnDyIKqq', '66296 Fannie Row Suite 631\nAvisbury, OK 84820', '38940 Larkin Village Apt. 414\nFeeneyburgh, AK 19554', 'ADM-00006', '1977-10-23', 'C', 'Commerce', '2025-2026', 'Gerlach LLC School', 'Mark Conroy', 'Farmer', '01935779444', 'father6@example.com', '0766578322850', NULL, 'Kiera Klocko', 'Nurse', '01504502496', 'mother6@example.com', '2887335226407', NULL, 'Abbigail Altenwerth', '01583908196', 'guardian6@example.com', '4882819363024', 'Grandparent', 1, 2, 2, '2025-12-20', NULL, 2025000006, 900006, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16', '127.0.0.1', 1, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16'),
(7, 'Carissa', 'Corwin', '2010-10-28', 'Male', 'O+', 'Hindu', 'Bangladeshi', '2229462769445', '01760839316', 'student7@example.com', '$2y$12$.1.ztEjx0MxgeuiTeFkiMOI8SE3gZB7MkSgcbh1/oplY9uPWp1WSW', '9240 Weimann Greens Suite 909\nPort Eldridge, MA 78915', '322 Tracey Springs Suite 296\nDemariobury, MI 14409-2262', 'ADM-00007', '2024-04-22', 'A', 'Arts', '2025-2026', 'Smitham, Kertzmann and Bergstrom School', 'Monty Maggio', 'Farmer', '01833975177', 'father7@example.com', '7294169374697', NULL, 'Ms. Johanna Swift', 'Nurse', '01457965055', 'mother7@example.com', '6294718213927', NULL, 'Prof. Janick Rogahn V', '01819091145', 'guardian7@example.com', '8635896742647', 'Sister', 1, 2, 3, '2025-12-20', NULL, 2025000007, 900007, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16', '127.0.0.1', 1, NULL, '2025-12-20 08:34:16', '2025-12-20 08:34:16'),
(8, 'Adrien', 'Frami', '2012-12-11', 'Female', 'B+', 'Other', 'Bangladeshi', '5821836813239', '01308048514', 'student8@example.com', '$2y$12$xIesofvZsAAfDOWJ2bBeD.DqZ6qpbZFk9F6w/mXO3WkCuBlIWVA4O', '5307 Kilback Coves Apt. 645\nSouth Mistystad, KY 02192-0224', '2137 Green Drive Apt. 093\nAnnettestad, AZ 25431-7397', 'ADM-00008', '1998-11-28', 'A', 'Arts', '2025-2026', 'Bins and Sons School', 'Mr. Caesar Wehner', 'Teacher', '01908433447', 'father8@example.com', '7241141964270', NULL, 'Bulah Howe', 'Doctor', '01983878546', 'mother8@example.com', '2352418492581', NULL, 'Hailey Veum II', '01810934588', 'guardian8@example.com', '2903889278331', 'Grandparent', 1, 1, 4, '2025-12-20', NULL, 2025000008, 900008, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17', '127.0.0.1', 1, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17'),
(9, 'Daphne', 'Howe', '1999-10-15', 'Male', 'A-', 'Other', 'Bangladeshi', '6057023684805', '01772022761', 'student9@example.com', '$2y$12$ZvlU22B8WdZNcTz0odvweeyHgUkHCOrho/lWSpejxTO70eSQe7hp2', '483 O\'Conner Mill Apt. 888\nNorth Ila, CO 94271', '39523 Eloisa Lodge Apt. 994\nNorth Larryton, MO 82230-0046', 'ADM-00009', '1978-03-08', 'B', 'Arts', '2025-2026', 'Kihn-McCullough School', 'Dr. Amari Swift Sr.', 'Farmer', '01684924976', 'father9@example.com', '2994830618077', NULL, 'Shannon Kirlin', 'Doctor', '01360505846', 'mother9@example.com', '9078403397551', NULL, 'Dr. Edison Champlin IV', '01637807999', 'guardian9@example.com', '6410468842980', 'Sister', 1, 1, 5, '2025-12-20', NULL, 2025000009, 900009, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17', '127.0.0.1', 1, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17'),
(10, 'Anita', 'Padberg', '1991-07-14', 'Male', 'O+', 'Other', 'Bangladeshi', '0526116976016', '01916226045', 'student10@example.com', '$2y$12$YjTT1adJasJJqs1ijSNj2.iYXZvbo1S28AnCFxTjOTWhc1MFInpJW', '22065 Katelin View Apt. 935\nWuckertmouth, PA 94898-5277', '5311 Christophe Crest Apt. 516\nTiaview, NC 01890-1938', 'ADM-00010', '2004-01-01', 'C', 'Science', '2025-2026', 'Walker-Gulgowski School', 'Osborne Stracke', 'Farmer', '01996995776', 'father10@example.com', '4090494616343', NULL, 'Miss Bessie Mraz', 'Businesswoman', '01828524344', 'mother10@example.com', '3230271130262', NULL, 'Prof. Newell Lehner Jr.', '01412816144', 'guardian10@example.com', '0360292600321', 'Aunt', 1, 2, 4, '2025-12-20', NULL, 2025000010, 900010, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17', '127.0.0.1', 1, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17'),
(11, 'Elvie', 'Dietrich', '1996-10-28', 'Male', 'O+', 'Hindu', 'Bangladeshi', '9231586402707', '01539411282', 'student11@example.com', '$2y$12$piouu.vCUtZ2w5uGytbEoeVuUpBfQo1EEyUecLWgxKTsXhrEpUeJq', '12564 Reichert Isle\nNew Oleburgh, KS 50026', '18287 Hartmann Well Suite 548\nMichaelberg, AZ 38624-6857', 'ADM-00011', '2010-07-17', 'B', 'Arts', '2025-2026', 'Wilkinson Group School', 'Gordon Ledner III', 'Businessman', '01499620434', 'father11@example.com', '2234971096526', NULL, 'Loma Welch', 'Teacher', '01521012817', 'mother11@example.com', '6643254397828', NULL, 'Dr. Maurice Becker Jr.', '01618888705', 'guardian11@example.com', '8512224564231', 'Brother', 1, 3, 3, '2025-12-20', NULL, 2025000011, 900011, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17', '127.0.0.1', 1, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17'),
(12, 'Anita', 'Dibbert', '1981-06-10', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '7943622022121', '01951051479', 'student12@example.com', '$2y$12$ohpzFeyQ34gTjtti.Yjn1.PSkAqNIXkmeSWqllNv2ADqLY0/34XwW', '6429 Jackie Village Apt. 529\nFerryshire, VT 34569-1158', '6636 Candido Coves\nCleoview, CA 39290', 'ADM-00012', '2016-03-11', 'B', 'Commerce', '2025-2026', 'Dach, Mills and Labadie School', 'Reed Cartwright', 'Farmer', '01396959446', 'father12@example.com', '3958911854869', NULL, 'Miss Adela Corwin', 'Businesswoman', '01315216196', 'mother12@example.com', '6986982549679', NULL, 'Magnus Schaefer', '01994224991', 'guardian12@example.com', '9079974118529', 'Sister', 1, 4, 1, '2025-12-20', NULL, 2025000012, 900012, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17', '127.0.0.1', 1, NULL, '2025-12-20 08:34:17', '2025-12-20 08:34:17'),
(13, 'Graham', 'Goyette', '2010-10-09', 'Female', 'A+', 'Islam', 'Bangladeshi', '5441424022794', '01521909370', 'student13@example.com', '$2y$12$zPqy52qKUjKNLeHDxttXOOs03C0QZd5VarM5LCV0mjz.smvDWW166', '56519 Huel Walks\nLake Kellieburgh, MI 41480', '978 Grimes Curve Apt. 975\nRessieton, PA 09121-1484', 'ADM-00013', '1996-02-03', 'A', 'Arts', '2025-2026', 'Swaniawski-Towne School', 'Arch Rutherford', 'Doctor', '01615899551', 'father13@example.com', '8307417720730', NULL, 'Prof. Winnifred Schoen DVM', 'Doctor', '01984129213', 'mother13@example.com', '4186608963943', NULL, 'Miss Shemar Schamberger PhD', '01358597387', 'guardian13@example.com', '9627037970905', 'Aunt', 1, 4, 3, '2025-12-20', NULL, 2025000013, 900013, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18', '127.0.0.1', 1, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18'),
(14, 'Garrick', 'Langworth', '2014-08-22', 'Male', 'A-', 'Other', 'Bangladeshi', '6653105974633', '01391985202', 'student14@example.com', '$2y$12$k9AwY5gF3oyF7fyQDhRawu7eXJU.EWZywbCRWcA0tUj0O/dzPLk1y', '60159 Evie Burg\nKenyontown, GA 73084', '84632 Morar Keys\nPort Enid, IA 04011-9143', 'ADM-00014', '1980-03-06', 'B', 'Arts', '2025-2026', 'Kozey, Konopelski and O\'Keefe School', 'Bertrand Lebsack Jr.', 'Doctor', '01411119934', 'father14@example.com', '5778327621485', NULL, 'Shanny Hermann', 'Nurse', '01895322972', 'mother14@example.com', '3421500817494', NULL, 'Caterina Schuppe V', '01966408815', 'guardian14@example.com', '1191142909201', 'Uncle', 1, 3, 2, '2025-12-20', NULL, 2025000014, 900014, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18', '127.0.0.1', 1, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18'),
(15, 'Ahmed', 'Kerluke', '1985-08-13', 'Male', 'O+', 'Hindu', 'Bangladeshi', '4934421820457', '01476407204', 'student15@example.com', '$2y$12$q7J7uffMQ1buWuNgtS3r9.ohTTNBSJI1OJm2H4rTrVCeKna/b6jtS', '344 Walker View Suite 286\nEast Madonna, DC 45565-6905', '774 Olson Pass\nBreannefurt, TN 83474', 'ADM-00015', '2011-04-12', 'A', 'Commerce', '2025-2026', 'Collins-Kuhic School', 'Lorenzo Stamm II', 'Doctor', '01928540744', 'father15@example.com', '4604806336945', NULL, 'Ms. Geraldine Stoltenberg', 'Businesswoman', '01893280522', 'mother15@example.com', '2439394278993', NULL, 'Nova Breitenberg', '01821144711', 'guardian15@example.com', '5007916077435', 'Grandparent', 1, 5, 1, '2025-12-20', NULL, 2025000015, 900015, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18', '127.0.0.1', 1, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18'),
(16, 'Everardo', 'Marvin', '2002-04-09', 'Male', 'A+', 'Islam', 'Bangladeshi', '7476647288652', '01332036536', 'student16@example.com', '$2y$12$w72HBIwGKiks6jftPEvw8.81UuPgP9DwI7HWcXEc4GzXZmjtACU76', '2690 Ron Light Apt. 316\nWest Carmella, NM 13395', '2436 Meredith Islands Suite 949\nNorth Rosamond, OH 61465-5944', 'ADM-00016', '1980-09-30', 'B', 'Science', '2025-2026', 'Hamill, Goldner and Upton School', 'Dr. Orville Hartmann', 'Teacher', '01949152743', 'father16@example.com', '5332286437316', NULL, 'Itzel Stanton', 'Doctor', '01976235099', 'mother16@example.com', '2229582671446', NULL, 'Stephania Hettinger', '01427374434', 'guardian16@example.com', '0454019544880', 'Aunt', 1, 4, 2, '2025-12-20', NULL, 2025000016, 900016, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18', '127.0.0.1', 1, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18'),
(17, 'Paul', 'Fritsch', '1977-11-12', 'Female', 'O-', 'Buddhist', 'Bangladeshi', '8828999555163', '01542855866', 'student17@example.com', '$2y$12$PdeUjb0ZdETg3Ociyc.ageNG/iBbISj6/WW1UkGUsdPjHdNBPmW5K', '66099 Rowe Way\nNorth Drake, VA 15686', '4841 Larkin Stream Suite 607\nEast Israel, TN 61942', 'ADM-00017', '2022-05-21', 'B', 'Commerce', '2025-2026', 'Rutherford, Ziemann and Wuckert School', 'Dr. Grover Frami III', 'Doctor', '01447629873', 'father17@example.com', '6047961680574', NULL, 'Julia Schinner III', 'Businesswoman', '01940805556', 'mother17@example.com', '2932015091983', NULL, 'Raleigh Langworth', '01445249938', 'guardian17@example.com', '7944738045793', 'Sister', 1, 3, 4, '2025-12-20', NULL, 2025000017, 900017, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18', '127.0.0.1', 1, NULL, '2025-12-20 08:34:18', '2025-12-20 08:34:18'),
(18, 'Trycia', 'Macejkovic', '2023-12-03', 'Male', 'A+', 'Islam', 'Bangladeshi', '7532616994922', '01558836290', 'student18@example.com', '$2y$12$9ls8NesxBvY/DpVz926mR.ex8mseNAKNnO2UME0jYaQ5RPtvYUPMu', '5789 Mariah Viaduct\nLake Elsie, PA 68789-4399', '96048 Javon Club\nNorth Soniatown, AR 32823', 'ADM-00018', '2003-10-07', 'B', 'Arts', '2025-2026', 'Dare-Hoppe School', 'Dr. Jay Brakus MD', 'Businessman', '01940252181', 'father18@example.com', '1879339633473', NULL, 'Tressa Blanda', 'Businesswoman', '01986094376', 'mother18@example.com', '4343850982096', NULL, 'Mrs. Dakota Hahn', '01378257959', 'guardian18@example.com', '7895837041922', 'Uncle', 1, 5, 2, '2025-12-20', NULL, 2025000018, 900018, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19', '127.0.0.1', 1, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19'),
(19, 'Marco', 'Armstrong', '1973-07-29', 'Female', 'A-', 'Islam', 'Bangladeshi', '6059514322316', '01649059527', 'student19@example.com', '$2y$12$BD1faR.rwjEjSSlED6GaXOsSi0SydhHD0zBa64vEJIp7fQ3EEC6Sa', '7328 Pouros Walk Suite 242\nNorth Violette, WY 82072', '46508 Reina Pines Apt. 934\nEvanborough, VA 52676-5712', 'ADM-00019', '1981-07-06', 'A', 'Science', '2025-2026', 'Lockman, Metz and McKenzie School', 'Zane Davis', 'Engineer', '01602122924', 'father19@example.com', '2024016809163', NULL, 'Mrs. Clarissa Green IV', 'Businesswoman', '01309638059', 'mother19@example.com', '1331873648560', NULL, 'Prof. Orion Toy III', '01784091757', 'guardian19@example.com', '1885047106958', 'Sister', 1, 4, 4, '2025-12-20', NULL, 2025000019, 900019, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19', '127.0.0.1', 1, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19'),
(20, 'Violette', 'Nienow', '2001-03-29', 'Female', 'A+', 'Christian', 'Bangladeshi', '3685843216420', '01966241370', 'student20@example.com', '$2y$12$UKs9w5mBVW/tcANFD5/4QOJAKOc1iQNXzPJi.mQ0Xd4PbiVCgPi4u', '21501 Okuneva Summit\nVincenzafurt, OK 95185', '542 Murazik Corner\nFarrellstad, NE 75118', 'ADM-00020', '2025-03-05', 'C', 'Science', '2025-2026', 'Dare, Watsica and Muller School', 'Baron Friesen', 'Businessman', '01399331621', 'father20@example.com', '0628811040870', NULL, 'Leanne Little I', 'Teacher', '01952059507', 'mother20@example.com', '8120634064246', NULL, 'Abner Jaskolski', '01997030874', 'guardian20@example.com', '0870328680855', 'Grandparent', 1, 2, 5, '2025-12-20', NULL, 2025000020, 900020, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19', '127.0.0.1', 1, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19'),
(21, 'Linda', 'Emmerich', '1972-04-08', 'Female', 'AB+', 'Other', 'Bangladeshi', '7942849061992', '01415693031', 'student21@example.com', '$2y$12$AxnujnbW27iIzMC5nrBFS.GqiXpKEUmNo/DKBcpiQgOZc6TORfg0a', '19785 Huels Turnpike Apt. 581\nGiuseppeville, FL 94462', '162 Heller Square\nNew Marvinside, AK 16358', 'ADM-00021', '2009-07-31', 'A', 'Science', '2025-2026', 'Herman LLC School', 'Deonte Beer', 'Farmer', '01919289818', 'father21@example.com', '9016668196684', NULL, 'Daphnee Jast', 'Businesswoman', '01813632538', 'mother21@example.com', '1691449053001', NULL, 'Bernadette Bahringer Sr.', '01445327742', 'guardian21@example.com', '8191425041601', 'Grandparent', 1, 3, 5, '2025-12-20', NULL, 2025000021, 900021, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19', '127.0.0.1', 1, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19'),
(22, 'Eric', 'Cremin', '1971-11-15', 'Female', 'O+', 'Other', 'Bangladeshi', '1284174709488', '01776814373', 'student22@example.com', '$2y$12$OrBlwpPVJadA.4wtiDrM6OujI//oTkEqx0qtcsAMrckxXmsTEHuA6', '3926 Goodwin Stravenue Suite 491\nWest Emmy, NJ 25358', '9708 Collins Highway Apt. 526\nWest Electaberg, NV 88900', 'ADM-00022', '1981-07-30', 'C', 'Science', '2025-2026', 'Pouros Group School', 'Prof. Nicola Lakin Jr.', 'Engineer', '01452891992', 'father22@example.com', '5205967264002', NULL, 'Prof. Jaunita Wilkinson I', 'Businesswoman', '01881200084', 'mother22@example.com', '4744635689116', NULL, 'Ewald Grady DVM', '01726259950', 'guardian22@example.com', '6324329920727', 'Sister', 1, 6, 1, '2025-12-20', NULL, 2025000022, 900022, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19', '127.0.0.1', 1, NULL, '2025-12-20 08:34:19', '2025-12-20 08:34:19'),
(23, 'Ozella', 'Mitchell', '1992-03-14', 'Other', 'A+', 'Hindu', 'Bangladeshi', '7716924263828', '01314960803', 'student23@example.com', '$2y$12$vyCI41yLFW11zTFQ5yPZLOgWPIp/1EMlswdZoqwOT3c/HVZvIFFxi', '24232 Samir Circles\nEmmerichville, NY 89418', '88350 Breitenberg Ramp Suite 651\nSimeonport, WY 07638', 'ADM-00023', '1976-06-07', 'C', 'Science', '2025-2026', 'Dietrich Inc School', 'Mohammed Bogan', 'Farmer', '01946167374', 'father23@example.com', '4418678756541', NULL, 'Dr. Lisa Hackett V', 'Teacher', '01467078496', 'mother23@example.com', '5621445592456', NULL, 'River Donnelly', '01477061019', 'guardian23@example.com', '7862176045742', 'Sister', 1, 6, 2, '2025-12-20', NULL, 2025000023, 900023, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20', '127.0.0.1', 1, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20'),
(24, 'Adrienne', 'Prohaska', '2016-06-17', 'Male', 'A+', 'Other', 'Bangladeshi', '9055898789538', '01913567678', 'student24@example.com', '$2y$12$UQAfQvrahEaPlpCimgV5SO9PPHXPpFhB1Y4v0DClV/ye6Mcuo0YGi', '4911 Dejah Village Suite 540\nGregoryton, CO 06043', '48755 Lonzo Forest\nLake Jefferyfort, MT 55524', 'ADM-00024', '1990-09-23', 'A', 'Arts', '2025-2026', 'Reilly PLC School', 'Nathen Schulist Jr.', 'Farmer', '01649194644', 'father24@example.com', '0753506937269', NULL, 'Baby O\'Connell', 'Businesswoman', '01630938655', 'mother24@example.com', '1311729982599', NULL, 'Angeline Lindgren', '01570767038', 'guardian24@example.com', '9957639755299', 'Brother', 1, 5, 4, '2025-12-20', NULL, 2025000024, 900024, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20', '127.0.0.1', 1, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20'),
(25, 'Florencio', 'DuBuque', '1989-08-19', 'Other', 'A-', 'Other', 'Bangladeshi', '2127687719429', '01364357592', 'student25@example.com', '$2y$12$MQtRidMmzeO3xhDv747.ledOzsV.djPL4d5lXfII3f/4t271do8Nu', '2297 Demond Via\nTessieland, IL 69947-4644', '228 Tania Path Apt. 654\nPort Letitiaton, GA 41164', 'ADM-00025', '2002-07-05', 'C', 'Science', '2025-2026', 'O\'Conner, Smith and Runolfsdottir School', 'Laron Johnson MD', 'Teacher', '01464526478', 'father25@example.com', '5396880966880', NULL, 'Lue Keeling', 'Doctor', '01355335340', 'mother25@example.com', '8419750152451', NULL, 'Kenneth Veum', '01599562881', 'guardian25@example.com', '6204413650258', 'Sister', 1, 6, 4, '2025-12-20', NULL, 2025000025, 900025, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20', '127.0.0.1', 1, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20'),
(26, 'Melody', 'Bruen', '1994-06-30', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '0824609514154', '01927217605', 'student26@example.com', '$2y$12$yWAAA8TLeBw9KNUqoTqc4.BY.HvlE.FHBf1SeRm9kpUsZqdv8/ATe', '20241 Camren Mountains\nLake May, KY 38759-0295', '8013 Flatley Gardens\nZettaland, NE 12416', 'ADM-00026', '1996-02-03', 'B', 'Arts', '2025-2026', 'Cummerata, Batz and Senger School', 'Dr. Everardo Daugherty', 'Engineer', '01458230872', 'father26@example.com', '2163406533560', NULL, 'Graciela Kub', 'Businesswoman', '01412001129', 'mother26@example.com', '4041604762663', NULL, 'Ms. Mollie Runte', '01839101063', 'guardian26@example.com', '1957556490622', 'Brother', 1, 7, 1, '2025-12-20', NULL, 2025000026, 900026, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20', '127.0.0.1', 1, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20'),
(27, 'Arvel', 'Strosin', '1982-02-17', 'Female', 'B-', 'Hindu', 'Bangladeshi', '9987402914113', '01544739725', 'student27@example.com', '$2y$12$7hV5LzyZr/sM6wD.bQ991uWFII9qYlK9lM6veX7YAyWHi/EFs3t7a', '55747 Casper Corner Apt. 961\nGillianchester, AK 26849', '23845 Carmelo Tunnel Suite 978\nDallashaven, OK 50054-7168', 'ADM-00027', '2011-04-07', 'A', 'Arts', '2025-2026', 'Berge-Kub School', 'Colt Metz', 'Teacher', '01465980952', 'father27@example.com', '4252177559417', NULL, 'Jaclyn Wolff', 'Housewife', '01941995229', 'mother27@example.com', '9763758524015', NULL, 'Vincenzo Steuber', '01724111687', 'guardian27@example.com', '5964281528050', 'Brother', 1, 7, 4, '2025-12-20', NULL, 2025000027, 900027, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20', '127.0.0.1', 1, NULL, '2025-12-20 08:34:20', '2025-12-20 08:34:20'),
(28, 'Cecilia', 'Wisoky', '1980-05-12', 'Other', 'AB+', 'Other', 'Bangladeshi', '7419594560781', '01944651673', 'student28@example.com', '$2y$12$wQY4k9nRkgeDnRQRjCDPjOqU.MofgKsu2A5AlrVw8781IpTUNyFTm', '84730 Denesik Ports Apt. 835\nGerholdtown, NC 66120', '68902 Lauretta Valleys Suite 174\nSouth Deanna, CA 96898-4148', 'ADM-00028', '1974-02-27', 'C', 'Commerce', '2025-2026', 'Rogahn-Schroeder School', 'Dr. Kacey Kiehn IV', 'Businessman', '01617428708', 'father28@example.com', '9565149203607', NULL, 'Willie Larson', 'Housewife', '01314920699', 'mother28@example.com', '3087954294552', NULL, 'Emmie Williamson', '01597448399', 'guardian28@example.com', '9896166509010', 'Grandparent', 1, 7, 2, '2025-12-20', NULL, 2025000028, 900028, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21', '127.0.0.1', 1, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21'),
(29, 'Wayne', 'Cummerata', '1979-03-24', 'Other', 'B-', 'Islam', 'Bangladeshi', '5754150862284', '01870735220', 'student29@example.com', '$2y$12$7QrH48QssMcFtyBnb.l8ye8PJ.QsFZWB7BJYDZS2tarYLQqK.qaeK', '453 Aurore Park\nLake Hertha, RI 74902-4628', '291 Dare Wells Suite 164\nSouth Raulshire, PA 93403-6728', 'ADM-00029', '1988-03-25', 'C', 'Commerce', '2025-2026', 'Mills-Boyle School', 'Merl Senger', 'Teacher', '01761842008', 'father29@example.com', '1065130094775', NULL, 'Jeanne Harber', 'Doctor', '01980418688', 'mother29@example.com', '7789169832795', NULL, 'Sid Reilly', '01675478965', 'guardian29@example.com', '6154295448103', 'Sister', 1, 8, 4, '2025-12-20', NULL, 2025000029, 900029, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21', '127.0.0.1', 1, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21'),
(30, 'Nicola', 'Huel', '1978-03-16', 'Male', 'B-', 'Other', 'Bangladeshi', '9015422036611', '01561054884', 'student30@example.com', '$2y$12$eVFDqfKoL4URXycO0qIC/OVrDX3v36AiCcbBQM8sOt6mc8eFGbvAW', '459 Cloyd Fork Apt. 338\nBodeville, FL 31922-2662', '58954 Hudson Turnpike\nSanfordberg, IL 02123', 'ADM-00030', '1973-12-10', 'C', 'Science', '2025-2026', 'Breitenberg-Lockman School', 'Prof. Nicholaus Kunde', 'Farmer', '01994512086', 'father30@example.com', '1087189538196', NULL, 'Dr. Providenci Bernhard', 'Teacher', '01894334390', 'mother30@example.com', '9495962101244', NULL, 'Miss Kristin Gleichner', '01584918732', 'guardian30@example.com', '5382149561011', 'Brother', 1, 8, 1, '2025-12-20', NULL, 2025000030, 900030, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21', '127.0.0.1', 1, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21'),
(31, 'Gordon', 'Jacobs', '1981-09-05', 'Male', 'A-', 'Christian', 'Bangladeshi', '7081931728875', '01330258211', 'student31@example.com', '$2y$12$h1bIZ2g7ZPKhVqLkj.Mv2uNHASY/We9wOcZsNPajt1sA0n7dyz5q2', '51880 Lyla Rue Suite 176\nBeattyshire, NV 44025', '77683 Domenica Valleys\nWest Fabiolaport, ME 93574-6981', 'ADM-00031', '2025-11-15', 'C', 'Commerce', '2025-2026', 'Stokes-Mitchell School', 'Emory Krajcik', 'Farmer', '01486269003', 'father31@example.com', '9558835163985', NULL, 'Elyssa Ernser', 'Nurse', '01465311457', 'mother31@example.com', '8408312267034', NULL, 'Viola Gibson III', '01790441998', 'guardian31@example.com', '9990263496042', 'Aunt', 1, 8, 2, '2025-12-20', NULL, 2025000031, 900031, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21', '127.0.0.1', 1, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21'),
(32, 'Frederique', 'Abshire', '1986-02-06', 'Male', 'O+', 'Buddhist', 'Bangladeshi', '2936969788627', '01360044758', 'student32@example.com', '$2y$12$c9b3jsJuM2tJ2893aD5ohuWsY32lwVw56TDGAIvd9rs4JiAAllCym', '94784 Parker Summit Suite 085\nNorth Betsymouth, KY 85383', '7722 Jerad Crossing\nNorth Clemens, WY 74526-5594', 'ADM-00032', '1989-03-15', 'C', 'Arts', '2025-2026', 'Stroman Ltd School', 'Braxton Bartoletti', 'Teacher', '01747114819', 'father32@example.com', '5959414610132', NULL, 'Helene Emard', 'Businesswoman', '01802139128', 'mother32@example.com', '7565589969235', NULL, 'Ms. Madie Collier I', '01676047151', 'guardian32@example.com', '6708215285911', 'Sister', 1, 9, 4, '2025-12-20', NULL, 2025000032, 900032, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21', '127.0.0.1', 1, NULL, '2025-12-20 08:34:21', '2025-12-20 08:34:21'),
(33, 'Creola', 'Keeling', '2001-11-19', 'Female', 'A+', 'Islam', 'Bangladeshi', '3625723203866', '01325125127', 'student33@example.com', '$2y$12$Vk1qxTYwWWv0yUx3f69e3eEyBFcH2iyCq2zsqTZqYhhHSyFyH0jrW', '465 Katlyn Hill Apt. 614\nEast Alexie, AL 38982-9127', '508 Jones Pike Suite 015\nArianeshire, MS 75629', 'ADM-00033', '2003-03-14', 'A', 'Commerce', '2025-2026', 'Barrows-Lesch School', 'Mr. Buddy Kilback DVM', 'Teacher', '01351124870', 'father33@example.com', '2777139472802', NULL, 'Monique Frami', 'Businesswoman', '01897287640', 'mother33@example.com', '9857395106933', NULL, 'Fletcher Hermann', '01304995484', 'guardian33@example.com', '1269418739942', 'Sister', 1, 4, 5, '2025-12-20', NULL, 2025000033, 900033, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22', '127.0.0.1', 1, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22'),
(34, 'Ethyl', 'Ryan', '1991-04-22', 'Other', 'A-', 'Islam', 'Bangladeshi', '9535944587665', '01927605664', 'student34@example.com', '$2y$12$LOSGmOXmv/fiSOKtE6F3z.zCeXAapXO0tUrQg8uE7lp6j3qifGj7C', '28784 Geovany Mountains\nLake Kody, KY 38771', '5483 Ophelia Mission\nAlannaview, CA 15522', 'ADM-00034', '1984-12-16', 'A', 'Commerce', '2025-2026', 'Mraz-Tremblay School', 'Kraig Jones', 'Doctor', '01464673189', 'father34@example.com', '1284300346937', NULL, 'Adelia Gusikowski', 'Housewife', '01505643078', 'mother34@example.com', '2742036081490', NULL, 'Prof. Jaydon Schuppe', '01554851426', 'guardian34@example.com', '8111774528032', 'Uncle', 1, 5, 3, '2025-12-20', NULL, 2025000034, 900034, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22', '127.0.0.1', 1, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22'),
(35, 'Liza', 'Kemmer', '2006-10-11', 'Male', 'O-', 'Islam', 'Bangladeshi', '2489292624179', '01745256463', 'student35@example.com', '$2y$12$b7pq0srzYalevEsshGuaDOqXmgzFWQQ7VsQVbYO93UxM2ERawS4.S', '428 Mante Summit\nSouth Rustyfurt, NE 38341', '132 Cathy Bypass\nFatimahaven, IL 22463-2461', 'ADM-00035', '2007-05-15', 'B', 'Arts', '2025-2026', 'Witting, Gerlach and Weimann School', 'Reynold Olson', 'Farmer', '01862504959', 'father35@example.com', '1002667458418', NULL, 'Kyra Smitham', 'Housewife', '01790200855', 'mother35@example.com', '6715542094994', NULL, 'Fred Murphy', '01598748236', 'guardian35@example.com', '4496463096683', 'Grandparent', 1, 9, 2, '2025-12-20', NULL, 2025000035, 900035, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22', '127.0.0.1', 1, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22'),
(36, 'Frederic', 'Wilderman', '2009-12-01', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '3002751380366', '01846395263', 'student36@example.com', '$2y$12$RksLdNMuP3ivKkQvQcpZFuXAJLdQlEgMnryYlY23GoDgO/8G4tE1K', '315 Hudson Common Apt. 893\nLake Glendaview, TX 55379', '6614 Claud Stravenue\nWest Nya, WY 16256-9580', 'ADM-00036', '2017-10-18', 'C', 'Arts', '2025-2026', 'Bradtke-Kuhlman School', 'Dr. Lucious Marvin I', 'Teacher', '01616646067', 'father36@example.com', '5934819216053', NULL, 'Assunta Lakin', 'Doctor', '01960481017', 'mother36@example.com', '4941959228656', NULL, 'Horace Stroman V', '01661759988', 'guardian36@example.com', '7948539597704', 'Brother', 1, 5, 5, '2025-12-20', NULL, 2025000036, 900036, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22', '127.0.0.1', 1, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22'),
(37, 'Arnulfo', 'Gutmann', '2023-09-30', 'Male', 'A-', 'Hindu', 'Bangladeshi', '0721490575274', '01300552537', 'student37@example.com', '$2y$12$8Pvilyz3eP.yX/czliHNqOwSimAeb07PXm5uwPG3c/8WSkbxu.LO2', '504 Abshire Fall Apt. 021\nRathhaven, TX 68329-5048', '466 Crooks Centers\nRockymouth, MI 46501', 'ADM-00037', '1979-07-27', 'A', 'Arts', '2025-2026', 'Stracke, Nitzsche and Lebsack School', 'Stanton Lueilwitz Jr.', 'Teacher', '01675228913', 'father37@example.com', '4623253944047', NULL, 'Daphney Treutel IV', 'Doctor', '01881670787', 'mother37@example.com', '2819598800616', NULL, 'Ms. Rylee Lindgren', '01439132242', 'guardian37@example.com', '1940490161363', 'Sister', 1, 9, 1, '2025-12-20', NULL, 2025000037, 900037, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22', '127.0.0.1', 1, NULL, '2025-12-20 08:34:22', '2025-12-20 08:34:22'),
(38, 'Mekhi', 'Casper', '2003-03-20', 'Other', 'O+', 'Christian', 'Bangladeshi', '3499070302512', '01517785861', 'student38@example.com', '$2y$12$1WRvwuNpi.5WwJMmnlVXTegBAFAxa8wANhAZFQCGt8j6t1t0cTql6', '3765 Bode Rapid\nVancetown, MA 83067-4558', '12615 Harris Divide\nLynchton, MA 49050-3222', 'ADM-00038', '2018-01-15', 'C', 'Science', '2025-2026', 'Huels, Dickens and Lubowitz School', 'Leland Mante', 'Teacher', '01610457117', 'father38@example.com', '8964755085806', NULL, 'Oleta Runolfsson', 'Nurse', '01688062740', 'mother38@example.com', '7114004777795', NULL, 'Lafayette Kiehn', '01368064097', 'guardian38@example.com', '2235211680911', 'Aunt', 1, 6, 3, '2025-12-20', NULL, 2025000038, 900038, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23', '127.0.0.1', 1, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23'),
(39, 'Luna', 'Kuvalis', '1974-11-02', 'Other', 'A+', 'Christian', 'Bangladeshi', '0560255573215', '01573065672', 'student39@example.com', '$2y$12$s3Ru2gJw5mZNCkbTvlyhoe2.PCXkRRYklpBfBIqabe7iq0SFz8nEu', '67425 Quigley Ferry Apt. 985\nAnachester, MA 31128', '4639 Swift Grove\nAsatown, CO 83994', 'ADM-00039', '2025-10-05', 'C', 'Science', '2025-2026', 'Steuber and Sons School', 'Dr. Mohammad Pollich Sr.', 'Businessman', '01942684790', 'father39@example.com', '0369876296760', NULL, 'Mertie Waelchi', 'Housewife', '01848306411', 'mother39@example.com', '2879089126518', NULL, 'Mr. Harvey Green', '01432331282', 'guardian39@example.com', '2324487107180', 'Uncle', 1, 10, 4, '2025-12-20', NULL, 2025000039, 900039, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23', '127.0.0.1', 1, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23'),
(40, 'Lysanne', 'Stoltenberg', '1987-06-23', 'Other', 'B-', 'Islam', 'Bangladeshi', '1963903744292', '01684703973', 'student40@example.com', '$2y$12$N9JEqIG4BLC6imKM1cy81OcanIOol.DJmrFrUVB0cZ.CVf583NKfC', '83075 Kelley Streets\nDamonbury, AL 52539', '5528 Paucek Trafficway Apt. 371\nLeuschketown, MT 61490', 'ADM-00040', '2019-05-10', 'B', 'Commerce', '2025-2026', 'Ruecker Group School', 'Shane Hermann', 'Engineer', '01974890451', 'father40@example.com', '3654350779402', NULL, 'Priscilla Hauck II', 'Doctor', '01583484987', 'mother40@example.com', '0425802430928', NULL, 'Lauretta Johns', '01514429885', 'guardian40@example.com', '8996642602935', 'Sister', 1, 7, 3, '2025-12-20', NULL, 2025000040, 900040, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23', '127.0.0.1', 1, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23'),
(41, 'Elsie', 'Mayer', '2006-12-15', 'Other', 'A+', 'Christian', 'Bangladeshi', '2135805469546', '01641177416', 'student41@example.com', '$2y$12$3XtMO6Bv6LQMsVyiX9ZJbeQ4rL74IRKpr5/UBNzt857TmiN7Iqki.', '28066 Fahey Glen Apt. 735\nMariettafort, NJ 65721', '139 Cole Ridge\nYasmeenville, DE 50753-2833', 'ADM-00041', '1983-05-06', 'A', 'Arts', '2025-2026', 'Gaylord, Hilpert and Brekke School', 'Isom Raynor MD', 'Engineer', '01323118035', 'father41@example.com', '4428519962166', NULL, 'Cheyanne Ratke', 'Doctor', '01364347429', 'mother41@example.com', '2712455434254', NULL, 'Morris Spinka', '01852243139', 'guardian41@example.com', '0275278045816', 'Brother', 1, 10, 1, '2025-12-20', NULL, 2025000041, 900041, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23', '127.0.0.1', 1, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23'),
(42, 'Chelsie', 'Russel', '1983-02-05', 'Male', 'AB+', 'Other', 'Bangladeshi', '3280435173194', '01986495378', 'student42@example.com', '$2y$12$JnY/VU3wRaoBIk6XZHpvEOxE2eJFv7/kaBk6CoemyoHI8hvyQACSG', '6207 Wyatt Meadow\nEbonyhaven, WA 36068-9059', '9019 Retha Trace\nStiedemannfort, VA 63155-3396', 'ADM-00042', '2022-10-07', 'A', 'Commerce', '2025-2026', 'Halvorson, Considine and Lockman School', 'Prof. Roderick Hansen IV', 'Businessman', '01853495755', 'father42@example.com', '6607871763415', NULL, 'Alvera Bins', 'Housewife', '01628377019', 'mother42@example.com', '7452453471771', NULL, 'Eulalia Bergnaum', '01435741021', 'guardian42@example.com', '3467168414980', 'Aunt', 1, 11, 1, '2025-12-20', NULL, 2025000042, 900042, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23', '127.0.0.1', 1, NULL, '2025-12-20 08:34:23', '2025-12-20 08:34:23'),
(43, 'Marjory', 'Crist', '1979-12-01', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '2705832318458', '01338118928', 'student43@example.com', '$2y$12$UrC4HpIU0OB5jXP39lXXROlfka2vlS.7.zxtnI1f7lpRois38FEE.', '30697 Lesch Station\nGradyland, DE 39440', '6970 Kertzmann Gardens\nWest Ahmadshire, KS 32118-8462', 'ADM-00043', '2007-07-05', 'B', 'Science', '2025-2026', 'Larkin, Boehm and Muller School', 'Americo Lind', 'Businessman', '01814996564', 'father43@example.com', '6471024041840', NULL, 'Fae Stanton', 'Housewife', '01455679577', 'mother43@example.com', '1737419326260', NULL, 'Nola Brakus II', '01596570924', 'guardian43@example.com', '7973997452975', 'Brother', 1, 8, 3, '2025-12-20', NULL, 2025000043, 900043, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24', '127.0.0.1', 1, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24'),
(44, 'Haven', 'Hettinger', '1981-06-17', 'Other', 'AB+', 'Other', 'Bangladeshi', '4942501977253', '01806336623', 'student44@example.com', '$2y$12$gMPd3oifAmixEcLAHwrDG.xQf4Ggl5C9NL5KWtTLAKHlElwrXiB1i', '5644 Zoe Forks Apt. 446\nEast Georgiana, CO 16473', '4275 Kailee Highway Suite 573\nNorth Ericshire, NE 95457-8073', 'ADM-00044', '2019-08-29', 'C', 'Commerce', '2025-2026', 'Kshlerin-Kertzmann School', 'Dr. Trey Gislason', 'Engineer', '01436701452', 'father44@example.com', '4385579437673', NULL, 'Marjorie Walker', 'Doctor', '01519998993', 'mother44@example.com', '3691691854164', NULL, 'Elyssa Schroeder', '01306122420', 'guardian44@example.com', '7909948128269', 'Grandparent', 1, 9, 3, '2025-12-20', NULL, 2025000044, 900044, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24', '127.0.0.1', 1, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24'),
(45, 'Unique', 'Ward', '2013-05-29', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '4222575004340', '01437436967', 'student45@example.com', '$2y$12$xHcrKFYgN20alcrQ9AXsEO/sf3JbRRO01.isSklwcbAUET3YBnu2G', '657 Alison Circles\nWest Nonabury, NV 54730', '23327 Monroe Isle\nJamelton, DE 74209-9625', 'ADM-00045', '1975-02-16', 'C', 'Arts', '2025-2026', 'Klocko, Brekke and Streich School', 'Caleb Bechtelar', 'Teacher', '01783771792', 'father45@example.com', '3392455457588', NULL, 'Prof. Caitlyn Boehm', 'Nurse', '01509154008', 'mother45@example.com', '3411276871869', NULL, 'Prof. Marc Kohler', '01992890498', 'guardian45@example.com', '4080937582016', 'Brother', 1, 11, 4, '2025-12-20', NULL, 2025000045, 900045, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24', '127.0.0.1', 1, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24'),
(46, 'Mauricio', 'Kulas', '2006-03-01', 'Female', 'B+', 'Christian', 'Bangladeshi', '8428100575806', '01596901660', 'student46@example.com', '$2y$12$RdoixPTugE.vcOlBLqOSA.sBLbLKAXynUyjdveJ5aUzSIy2hqCMOC', '84280 Brakus Cliffs Apt. 989\nYvetteville, KS 77707-5994', '2904 Rau Pine Suite 573\nWymanport, ME 79917-6168', 'ADM-00046', '1972-03-03', 'C', 'Science', '2025-2026', 'Wehner, Harber and Shields School', 'Brandon Skiles', 'Engineer', '01634079941', 'father46@example.com', '1058180665275', NULL, 'Eve Kassulke Sr.', 'Housewife', '01326393299', 'mother46@example.com', '1593020895784', NULL, 'Prof. Laurence Greenfelder MD', '01316518850', 'guardian46@example.com', '5126323034203', 'Grandparent', 1, 10, 2, '2025-12-20', NULL, 2025000046, 900046, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24', '127.0.0.1', 1, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24'),
(47, 'Leonel', 'Grady', '1983-03-19', 'Other', 'B+', 'Hindu', 'Bangladeshi', '4417661315118', '01747853031', 'student47@example.com', '$2y$12$GcaKshLEGSCo0qJoR610N.d7DoBoZc5rch4Plrpa10f8OHSacuMB2', '8389 Lesch Centers\nNew Carrollside, MD 75764-7839', '17921 West Divide Suite 941\nNorth Alexandria, FL 06254-0100', 'ADM-00047', '1986-11-28', 'A', 'Science', '2025-2026', 'Maggio and Sons School', 'Perry Russel', 'Farmer', '01446913613', 'father47@example.com', '2744985802421', NULL, 'Georgette Kuvalis', 'Nurse', '01607646777', 'mother47@example.com', '9587645078260', NULL, 'Katherine Kunze', '01437551598', 'guardian47@example.com', '8601083231948', 'Grandparent', 1, 11, 2, '2025-12-20', NULL, 2025000047, 900047, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24', '127.0.0.1', 1, NULL, '2025-12-20 08:34:24', '2025-12-20 08:34:24'),
(48, 'Buddy', 'Parker', '2024-09-29', 'Male', 'B-', 'Hindu', 'Bangladeshi', '4285746549773', '01902926507', 'student48@example.com', '$2y$12$da7IHGCbk4iND6BQ0vTyduWkA1DY4eUtekN.GSCkGmReQCyELqVqC', '30838 Zetta Locks\nEast Walterborough, GA 82423-7582', '6705 Jalon Union\nSouth Amparo, HI 85558', 'ADM-00048', '1995-04-07', 'B', 'Arts', '2025-2026', 'Dickinson and Sons School', 'Nathanial Sawayn', 'Farmer', '01637724095', 'father48@example.com', '7323919298526', NULL, 'Dr. Pink Collier Sr.', 'Teacher', '01624393139', 'mother48@example.com', '2092980454165', NULL, 'Kiara Jenkins DVM', '01595187531', 'guardian48@example.com', '4821154169752', 'Uncle', 1, 6, 5, '2025-12-20', NULL, 2025000048, 900048, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25', '127.0.0.1', 1, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25'),
(49, 'Clare', 'Schumm', '1971-09-29', 'Male', 'B+', 'Buddhist', 'Bangladeshi', '0415286603438', '01775372137', 'student49@example.com', '$2y$12$NFnw71sQA2mienMZlDzHuuQND/y/YRmNQdxIM6aQrZ83b22mJ0QQm', '166 Reta Stravenue\nEast Vivaberg, MD 50390-1205', '74136 Jessyca Forest Suite 815\nRutherfordport, MA 71132', 'ADM-00049', '1982-11-19', 'A', 'Science', '2025-2026', 'Marquardt, Cummings and Torphy School', 'Odell Lehner', 'Businessman', '01703099593', 'father49@example.com', '3529309679843', NULL, 'Ms. Amara Kiehn', 'Businesswoman', '01459759858', 'mother49@example.com', '0911881104315', NULL, 'Athena Pollich', '01819177213', 'guardian49@example.com', '0028795394209', 'Uncle', 1, 12, 2, '2025-12-20', NULL, 2025000049, 900049, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25', '127.0.0.1', 1, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25'),
(50, 'Amira', 'Wuckert', '2018-12-26', 'Other', 'A+', 'Other', 'Bangladeshi', '2112526389418', '01407841364', 'student50@example.com', '$2y$12$EYKdf59rMFkLVTolXuqhKO.wnN327bZMNpH2tapA8TUDZi.9JJBBC', '9401 Reid Ranch\nWest Matildatown, NV 43043', '85821 Douglas Port Apt. 402\nSouth Deondre, PA 59130', 'ADM-00050', '1975-05-31', 'C', 'Commerce', '2025-2026', 'Turcotte, Koepp and Anderson School', 'Louvenia Kassulke', 'Teacher', '01519308413', 'father50@example.com', '1857709487999', NULL, 'Mrs. Tanya King', 'Housewife', '01338072516', 'mother50@example.com', '9003228427680', NULL, 'Prof. Destin Lemke', '01885731444', 'guardian50@example.com', '3685939898164', 'Brother', 1, 12, 4, '2025-12-20', NULL, 2025000050, 900050, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25', '127.0.0.1', 1, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25'),
(51, 'Demarco', 'Hoppe', '1986-07-05', 'Other', 'A+', 'Other', 'Bangladeshi', '6468555714181', '01413759710', 'student51@example.com', '$2y$12$2pO4JoDUkeIdc2uvMSXl2u0Wh316fVu7dg8BloBV9xU1IWgXeupfu', '50480 Hulda Station Suite 351\nLake Neldaberg, NH 39905', '9522 Bechtelar Plains Suite 421\nNorth Claudia, MI 58536-4464', 'ADM-00051', '1985-12-22', 'A', 'Science', '2025-2026', 'Bruen-Auer School', 'Mr. Junior Weissnat', 'Teacher', '01567141474', 'father51@example.com', '6198423926493', NULL, 'Dr. Abbigail Hoeger V', 'Doctor', '01505830023', 'mother51@example.com', '7058768691150', NULL, 'Mrs. Katarina Emmerich V', '01740823983', 'guardian51@example.com', '0553262486623', 'Aunt', 1, 7, 5, '2025-12-20', NULL, 2025000051, 900051, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25', '127.0.0.1', 1, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25'),
(52, 'Roy', 'Gleichner', '1994-09-18', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '9397064127651', '01985976464', 'student52@example.com', '$2y$12$Nfc.fyp9gr87u6uoo4qvtOiknOsM4aqC6UH8iKtvl7/T2c6GWdtPK', '9842 Raheem Cove\nSouth Devenburgh, MT 71344-7816', '825 Jarrett Vista\nVonhaven, UT 75548', 'ADM-00052', '1970-02-13', 'B', 'Commerce', '2025-2026', 'O\'Connell, Barton and McGlynn School', 'Rasheed Corkery IV', 'Doctor', '01425473882', 'father52@example.com', '4172564855247', NULL, 'Kallie Jacobson', 'Businesswoman', '01632865662', 'mother52@example.com', '7048194685066', NULL, 'Tre Lynch', '01762211793', 'guardian52@example.com', '4793662467807', 'Sister', 1, 8, 5, '2025-12-20', NULL, 2025000052, 900052, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25', '127.0.0.1', 1, NULL, '2025-12-20 08:34:25', '2025-12-20 08:34:25'),
(53, 'Stewart', 'Blanda', '2017-12-15', 'Male', 'O+', 'Islam', 'Bangladeshi', '3253953337687', '01979172224', 'student53@example.com', '$2y$12$zi8uFCTUCI7v20fGgtK18e31crPTm.1chhSKGwaW88eLOu/RhZAei', '5368 Emilio Bridge\nElmofort, UT 34467-8325', '51241 Davin Ferry Suite 865\nKianachester, AL 50352-0918', 'ADM-00053', '1983-08-13', 'A', 'Science', '2025-2026', 'Jast-Lang School', 'Keshaun Ondricka', 'Teacher', '01495997846', 'father53@example.com', '4641315004406', NULL, 'Meda Pacocha', 'Doctor', '01912899756', 'mother53@example.com', '5800985291368', NULL, 'Kody Aufderhar', '01692942010', 'guardian53@example.com', '5073528656124', 'Brother', 1, 9, 5, '2025-12-20', NULL, 2025000053, 900053, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26', '127.0.0.1', 1, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26'),
(54, 'Reina', 'Pacocha', '2003-11-24', 'Other', 'B-', 'Islam', 'Bangladeshi', '1406651924817', '01767532872', 'student54@example.com', '$2y$12$IRsQvrJ8oeI/8BBmhjLeYOsCzhGnwJOKjU88O973MgRaOP/SL6nIe', '9281 Arden Stravenue Apt. 772\nDariusland, NC 81392', '3174 Augustine Manor\nNorth Loma, WI 73133', 'ADM-00054', '1975-06-15', 'C', 'Science', '2025-2026', 'Rowe LLC School', 'Sheldon Smitham', 'Farmer', '01384265740', 'father54@example.com', '1335092491424', NULL, 'Ursula Rutherford', 'Nurse', '01931577580', 'mother54@example.com', '7979668474907', NULL, 'Dr. Jordyn Wunsch', '01343528759', 'guardian54@example.com', '1191938428146', 'Aunt', 1, 13, 2, '2025-12-20', NULL, 2025000054, 900054, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26', '127.0.0.1', 1, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26'),
(55, 'Hayley', 'Dietrich', '2000-10-12', 'Female', 'O-', 'Islam', 'Bangladeshi', '6233915725585', '01658617446', 'student55@example.com', '$2y$12$.fsExV3Gaj43jZXUp9CAIONjHl1leNjuD/0kPifO1VQ8kKy39SzDe', '21084 Pouros Gardens Suite 134\nPort Darrenview, LA 99749-5372', '20907 Reuben Station\nLake Rebamouth, MI 27094', 'ADM-00055', '2025-06-11', 'A', 'Commerce', '2025-2026', 'Conn, Boyle and Harvey School', 'Mr. Danny Towne DDS', 'Doctor', '01635579841', 'father55@example.com', '3959923288342', NULL, 'Mrs. Beatrice Douglas', 'Businesswoman', '01585912768', 'mother55@example.com', '0120023496558', NULL, 'Rafael Mosciski I', '01322364597', 'guardian55@example.com', '3689070529666', 'Aunt', 1, 12, 1, '2025-12-20', NULL, 2025000055, 900055, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26', '127.0.0.1', 1, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26'),
(56, 'Maiya', 'Anderson', '1977-07-12', 'Male', 'B+', 'Buddhist', 'Bangladeshi', '2017878252951', '01864648724', 'student56@example.com', '$2y$12$4vFvz/TB0LoGpKPNVKoOcOxlBFYe4nbBivXtMdXtWDbAylDOFbn56', '3934 Greta Radial\nSimonisfort, TN 55011-0736', '10702 Tomasa Loop\nStarkview, AZ 51318-8094', 'ADM-00056', '1999-12-29', 'C', 'Arts', '2025-2026', 'Vandervort, Lueilwitz and Connelly School', 'Mr. Kameron Herman Jr.', 'Businessman', '01781076284', 'father56@example.com', '6449190601501', NULL, 'Alia Reichel', 'Businesswoman', '01659656255', 'mother56@example.com', '7514810755738', NULL, 'Dr. Addie Lehner MD', '01574919497', 'guardian56@example.com', '0816603540311', 'Uncle', 1, 14, 2, '2025-12-20', NULL, 2025000056, 900056, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26', '127.0.0.1', 1, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(57, 'Belle', 'O\'Hara', '2021-03-24', 'Male', 'O+', 'Islam', 'Bangladeshi', '6730380623021', '01555313877', 'student57@example.com', '$2y$12$gl0ZFS8g4c0pOadH5/ix5uwYEEUT/mkE9YTQ.NwhnI02hmxuvdH/K', '6985 Lou Rest Apt. 474\nPort Devonte, NH 71568', '97429 Roberts Summit Apt. 396\nNorth Allison, CA 51820', 'ADM-00057', '1992-06-19', 'C', 'Commerce', '2025-2026', 'Gutkowski-Leuschke School', 'Dr. Russell Swift', 'Teacher', '01521702516', 'father57@example.com', '7133032656389', NULL, 'Ms. Mercedes Larkin II', 'Businesswoman', '01728064062', 'mother57@example.com', '8494236241651', NULL, 'Katlyn McClure', '01647961603', 'guardian57@example.com', '6214277808917', 'Sister', 1, 15, 2, '2025-12-20', NULL, 2025000057, 900057, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26', '127.0.0.1', 1, NULL, '2025-12-20 08:34:26', '2025-12-20 08:34:26'),
(58, 'Salvador', 'O\'Reilly', '2025-03-28', 'Male', 'O-', 'Christian', 'Bangladeshi', '8339261357796', '01663567637', 'student58@example.com', '$2y$12$IWs/NOP9agIrS.DktdEwCOPJPMYa2wGHzWAemsMjBWsaPltvn97Cy', '135 Balistreri Isle Suite 016\nWest Lysanne, NM 98366', '93547 Jayme Spring Apt. 156\nHaltown, CA 79934', 'ADM-00058', '2022-01-20', 'C', 'Commerce', '2025-2026', 'Barton, Hodkiewicz and Ferry School', 'Alexys Rice IV', 'Teacher', '01866862986', 'father58@example.com', '3167959471947', NULL, 'Anya Weimann DDS', 'Housewife', '01440020258', 'mother58@example.com', '8490015513697', NULL, 'Suzanne Breitenberg', '01894346299', 'guardian58@example.com', '5089872513093', 'Grandparent', 1, 13, 1, '2025-12-20', NULL, 2025000058, 900058, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27', '127.0.0.1', 1, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27'),
(59, 'Henderson', 'Pollich', '1984-02-12', 'Other', 'B+', 'Other', 'Bangladeshi', '3890630994898', '01943791107', 'student59@example.com', '$2y$12$OHsRP/4l6d7Fu2nAlLuRs.SE34HhkWLbXxgpCxgX1NEB7gQep0cYa', '4572 Luettgen Mountain\nSchroederview, CO 13828-6506', '492 Lesch Hollow Apt. 021\nEast Sigmund, NM 11329', 'ADM-00059', '1990-09-20', 'B', 'Arts', '2025-2026', 'Schimmel Ltd School', 'Dudley Pouros', 'Farmer', '01393462249', 'father59@example.com', '8829768589727', NULL, 'Karli Bartell PhD', 'Businesswoman', '01612872600', 'mother59@example.com', '7627092322506', NULL, 'Erich Quitzon', '01839483734', 'guardian59@example.com', '8889180588384', 'Sister', 1, 14, 1, '2025-12-20', NULL, 2025000059, 900059, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27', '127.0.0.1', 1, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27'),
(60, 'Rhianna', 'Kerluke', '2004-12-18', 'Other', 'B+', 'Hindu', 'Bangladeshi', '9259865862527', '01333910044', 'student60@example.com', '$2y$12$uMfzPv7WTC/zGOutw2PibuPgr88EBYCVmHcl9NNqEaImbUWmhdJQS', '825 Izaiah Rest\nWehnerborough, ME 01203-8019', '6774 Hilpert Plaza Suite 986\nCreminton, VT 96478', 'ADM-00060', '2025-05-17', 'B', 'Science', '2025-2026', 'Adams-Jenkins School', 'Dayton Corkery II', 'Teacher', '01588917564', 'father60@example.com', '4735255731580', NULL, 'Maryam Wolff', 'Doctor', '01897105850', 'mother60@example.com', '4625714001387', NULL, 'Sister Connelly', '01601183940', 'guardian60@example.com', '3345676821570', 'Grandparent', 1, 16, 2, '2025-12-20', NULL, 2025000060, 900060, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27', '127.0.0.1', 1, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27'),
(61, 'Mariah', 'Littel', '2021-03-11', 'Female', 'O-', 'Islam', 'Bangladeshi', '2012641196954', '01776658779', 'student61@example.com', '$2y$12$bZ7afcibvo4bMQFZktA4k.MrVVvBKJB.q8ispNvQOZUhnt3R.NuPe', '21086 Lueilwitz Island Apt. 322\nEduardostad, SD 32098', '2994 Crona Station Suite 471\nWest Casandrashire, WA 49631-6181', 'ADM-00061', '1983-08-20', 'C', 'Commerce', '2025-2026', 'Mitchell, Sipes and Borer School', 'Ignatius Tillman', 'Farmer', '01351902570', 'father61@example.com', '5495063970866', NULL, 'Olga Bogisich', 'Businesswoman', '01536836761', 'mother61@example.com', '9689965269453', NULL, 'Abbigail Crist', '01731378051', 'guardian61@example.com', '5715222572727', 'Sister', 1, 10, 5, '2025-12-20', NULL, 2025000061, 900061, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27', '127.0.0.1', 1, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27'),
(62, 'Estel', 'Skiles', '2016-02-16', 'Female', 'O-', 'Other', 'Bangladeshi', '7325063309316', '01314927797', 'student62@example.com', '$2y$12$0U2ajMVnK1Hze2ipe61eqeDwxwBWvT5JN1gUtfKkTLM8IhkdnFfCe', '526 Schmitt Mills Suite 027\nSouth Maciview, MT 77981-8474', '83247 Cecelia Knoll Suite 103\nGleasonside, AZ 61931-5136', 'ADM-00062', '1986-12-02', 'B', 'Commerce', '2025-2026', 'Schroeder-Emard School', 'Isadore Heller', 'Teacher', '01594431360', 'father62@example.com', '6950323532209', NULL, 'Kacie Tromp', 'Doctor', '01909988008', 'mother62@example.com', '9109472936138', NULL, 'Frieda Jacobs', '01926714694', 'guardian62@example.com', '0574161517046', 'Brother', 1, 15, 1, '2025-12-20', NULL, 2025000062, 900062, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27', '127.0.0.1', 1, NULL, '2025-12-20 08:34:27', '2025-12-20 08:34:27'),
(63, 'Bryana', 'Roberts', '2012-09-23', 'Male', 'O+', 'Islam', 'Bangladeshi', '0848020811668', '01714648353', 'student63@example.com', '$2y$12$sXllKCVrAeo7X55djShzA.a2cvvG.hpt1dJsEuhg8YoPkhVSbUgpW', '948 Metz Trail\nBotsfordchester, KY 50220', '934 Ebony Falls\nEast Felicia, VT 22797-9353', 'ADM-00063', '2018-01-18', 'B', 'Arts', '2025-2026', 'Schoen, Nader and Durgan School', 'Augustus Lynch II', 'Businessman', '01351247885', 'father63@example.com', '1862080310464', NULL, 'Lou Towne', 'Teacher', '01884895234', 'mother63@example.com', '0713583227654', NULL, 'Neha Gerhold', '01438844207', 'guardian63@example.com', '5037168990065', 'Uncle', 1, 10, 3, '2025-12-20', NULL, 2025000063, 900063, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28', '127.0.0.1', 1, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28'),
(64, 'Taylor', 'Fisher', '2002-04-12', 'Male', 'AB+', 'Other', 'Bangladeshi', '0581304051578', '01711121964', 'student64@example.com', '$2y$12$0c.wv67j5E0XJLLZAkbSC.kBjswqQOYa1jo12o3hMgoJ51YoDvUsy', '12583 Pfeffer Hills\nGranttown, SC 46142', '4836 Hahn Walk\nWest Einar, UT 53852-1177', 'ADM-00064', '1991-04-19', 'B', 'Arts', '2025-2026', 'Stamm and Sons School', 'Prof. Ibrahim Glover I', 'Teacher', '01929928857', 'father64@example.com', '6077881487007', NULL, 'Eliza Hauck', 'Nurse', '01655070614', 'mother64@example.com', '1863325588193', NULL, 'Candelario Schmeler', '01472204973', 'guardian64@example.com', '5652023539697', 'Grandparent', 1, 16, 1, '2025-12-20', NULL, 2025000064, 900064, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28', '127.0.0.1', 1, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28'),
(65, 'Destini', 'Ritchie', '2012-09-21', 'Male', 'AB-', 'Other', 'Bangladeshi', '3357969388254', '01339751832', 'student65@example.com', '$2y$12$lAeyLJ52kxHV0VkPpXeVNuDFuOD2yPfspBRKlI9KkKBpREhedyZWq', '4630 Pouros Coves Apt. 133\nRahsaanton, NY 47164', '45886 Arden Village Suite 405\nLornashire, IN 25137-9332', 'ADM-00065', '1993-11-04', 'A', 'Science', '2025-2026', 'Walsh-Osinski School', 'Isaac Hegmann PhD', 'Teacher', '01921892316', 'father65@example.com', '3953992460221', NULL, 'Lottie Jaskolski', 'Nurse', '01433189528', 'mother65@example.com', '3852635091373', NULL, 'Elva Grady', '01780119782', 'guardian65@example.com', '4447205770766', 'Uncle', 1, 17, 2, '2025-12-20', NULL, 2025000065, 900065, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28', '127.0.0.1', 1, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28'),
(66, 'Dayna', 'Balistreri', '1990-08-25', 'Female', 'B+', 'Islam', 'Bangladeshi', '8828176271600', '01630843610', 'student66@example.com', '$2y$12$zgTo6ai8OXweTCeOcHTW2e1Tjj2FVv9l2iJoEnAmob5MX8Q2AdS0q', '99816 Zelma Drive\nLowetown, RI 16426-6628', '296 Birdie Corners\nMilanhaven, OH 38320', 'ADM-00066', '1986-09-27', 'C', 'Commerce', '2025-2026', 'Senger-O\'Conner School', 'Emil Thompson', 'Engineer', '01657205058', 'father66@example.com', '5349915243703', NULL, 'Dr. Adeline Langworth II', 'Doctor', '01638302518', 'mother66@example.com', '1346020851153', NULL, 'Hunter Mueller', '01569960492', 'guardian66@example.com', '4013698816615', 'Aunt', 1, 17, 1, '2025-12-20', NULL, 2025000066, 900066, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28', '127.0.0.1', 1, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28'),
(67, 'Margarita', 'Daniel', '2024-08-15', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '1143024836036', '01446052703', 'student67@example.com', '$2y$12$VyusWmK2fCxRSkPpXGyqxOM420gbToMnH.2rVZ1ZaoDC3HqgSM/1W', '6737 Koelpin Manors\nNorth Kyler, NE 39572-9138', '8835 Romaguera Hill Apt. 406\nNew Kelsie, WV 22996-3264', 'ADM-00067', '1974-04-15', 'C', 'Science', '2025-2026', 'Dickinson, Littel and Anderson School', 'Toney Ferry', 'Businessman', '01718047602', 'father67@example.com', '7892737316216', NULL, 'Roslyn Hermiston', 'Doctor', '01920355011', 'mother67@example.com', '2682044837164', NULL, 'Dariana Rau', '01468955522', 'guardian67@example.com', '8829420240379', 'Brother', 1, 11, 3, '2025-12-20', NULL, 2025000067, 900067, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28', '127.0.0.1', 1, NULL, '2025-12-20 08:34:28', '2025-12-20 08:34:28'),
(68, 'Trevor', 'Larkin', '2024-11-01', 'Male', 'B+', 'Other', 'Bangladeshi', '7459803563310', '01655804584', 'student68@example.com', '$2y$12$9t8WbTWGdMBUmp3rS8hM3ue.isteAf8mvrLVcxz4APKX4IHw/.Ae6', '9809 Noe Coves\nFilomenachester, WV 53428-8520', '128 Schuppe Estate\nGlenniehaven, WV 30430', 'ADM-00068', '1998-10-05', 'B', 'Arts', '2025-2026', 'Corkery Group School', 'Kraig Treutel', 'Engineer', '01739699317', 'father68@example.com', '8575766821442', NULL, 'Miss Wilma Dickens', 'Businesswoman', '01797965715', 'mother68@example.com', '6047807643479', NULL, 'Prof. Shanelle Hodkiewicz', '01905208656', 'guardian68@example.com', '3321046344015', 'Aunt', 1, 18, 1, '2025-12-20', NULL, 2025000068, 900068, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29', '127.0.0.1', 1, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29'),
(69, 'Antonietta', 'Beatty', '1985-02-15', 'Female', 'O-', 'Islam', 'Bangladeshi', '1138278015912', '01541760935', 'student69@example.com', '$2y$12$Ci7RMfX1VKp5kpRV1b0w7Olebyz4bxlut.neuKqz4JLM0zvKj5W7O', '87428 Davon Hollow Apt. 307\nBruenhaven, WI 10636', '93443 Yost Glen\nNorth Enriqueberg, MS 12828-2675', 'ADM-00069', '2011-02-27', 'C', 'Arts', '2025-2026', 'Bode, Gleichner and Abshire School', 'Lourdes Lebsack', 'Engineer', '01985026760', 'father69@example.com', '9102850902431', NULL, 'Reyna Goyette', 'Nurse', '01510577885', 'mother69@example.com', '4902764774061', NULL, 'Twila Wiza', '01766494692', 'guardian69@example.com', '1453323875087', 'Brother', 1, 11, 5, '2025-12-20', NULL, 2025000069, 900069, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29', '127.0.0.1', 1, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29'),
(70, 'Laisha', 'Padberg', '2020-06-30', 'Male', 'AB-', 'Other', 'Bangladeshi', '4565947654522', '01901272232', 'student70@example.com', '$2y$12$9q9JWQUp8gJAn8qSB69yJOD0cMh6w6BBd4AGzuKVXmI29lFfqcaAq', '8537 Schiller Stream Suite 275\nDomenicofurt, AZ 95108-3262', '25265 Monserrate Knoll Apt. 759\nJordaneshire, IN 40187', 'ADM-00070', '1996-09-21', 'C', 'Commerce', '2025-2026', 'Nitzsche Ltd School', 'Prof. Cruz Howell', 'Engineer', '01723282653', 'father70@example.com', '6296164787604', NULL, 'Adaline Franecki', 'Teacher', '01735145945', 'mother70@example.com', '5460895285163', NULL, 'Rashawn Pacocha', '01338782065', 'guardian70@example.com', '8756993437824', 'Uncle', 1, 12, 3, '2025-12-20', NULL, 2025000070, 900070, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29', '127.0.0.1', 1, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29'),
(71, 'Glenda', 'Harris', '2005-02-05', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '1334615122902', '01966124226', 'student71@example.com', '$2y$12$u8aDyd/gkB3adeNqFLGdPOWYM5egjXmwEOYrEBI4GDLFX4WIQ/9AO', '84779 Cartwright Ramp Apt. 534\nPort Matildeshire, OH 87338', '4972 Mable View Apt. 508\nJerroldport, MD 06480-7898', 'ADM-00071', '1984-02-01', 'B', 'Commerce', '2025-2026', 'Hudson LLC School', 'Torey Kuphal', 'Farmer', '01795159838', 'father71@example.com', '5582125764489', NULL, 'Delta Robel', 'Businesswoman', '01753315838', 'mother71@example.com', '0524148116535', NULL, 'Prof. Lexie Maggio DVM', '01639920327', 'guardian71@example.com', '0301620353353', 'Brother', 1, 18, 2, '2025-12-20', NULL, 2025000071, 900071, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29', '127.0.0.1', 1, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29'),
(72, 'Lysanne', 'Johnson', '1999-07-27', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '6296027159948', '01558844791', 'student72@example.com', '$2y$12$3mljBhieSfxJjFkDachh0uxixwtR5xnV6hk.XqOq0mOZApjxz7knK', '933 Yost Rest\nBernhardshire, ME 64058-3193', '684 Gerhold Cliffs Apt. 084\nGoldaport, MD 42965-0759', 'ADM-00072', '1983-08-13', 'A', 'Science', '2025-2026', 'Carroll-Bosco School', 'Sanford Conroy', 'Engineer', '01628201560', 'father72@example.com', '6174652232996', NULL, 'Hildegard Fay', 'Businesswoman', '01589619204', 'mother72@example.com', '2646461822793', NULL, 'Betty Renner', '01589410756', 'guardian72@example.com', '1405942166097', 'Grandparent', 1, 12, 5, '2025-12-20', NULL, 2025000072, 900072, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29', '127.0.0.1', 1, NULL, '2025-12-20 08:34:29', '2025-12-20 08:34:29'),
(73, 'Trycia', 'Kemmer', '2009-10-30', 'Other', 'A+', 'Christian', 'Bangladeshi', '0735691432224', '01820144883', 'student73@example.com', '$2y$12$1W4REB8tZaQhmjHd8c40Xu4Xl.srwvPVA49vBjrlbiqXJjm1nKup2', '1364 Hickle Valley\nGusikowskiport, AZ 47803', '168 Ophelia Brooks Apt. 661\nNew Marianaton, TN 03700', 'ADM-00073', '2017-04-23', 'C', 'Commerce', '2025-2026', 'McGlynn Ltd School', 'Prof. Adolphus Denesik', 'Businessman', '01398709785', 'father73@example.com', '3067860528253', NULL, 'Miss Elta Blanda DDS', 'Teacher', '01706967472', 'mother73@example.com', '3229799089034', NULL, 'Lavinia Romaguera', '01689452775', 'guardian73@example.com', '5195926900213', 'Brother', 1, 13, 5, '2025-12-20', NULL, 2025000073, 900073, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30', '127.0.0.1', 1, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30'),
(74, 'Kayleigh', 'Runte', '2020-10-01', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '5166481252441', '01776589100', 'student74@example.com', '$2y$12$yfOqFUTu8HjTZSsfDD6zce/.8qh6na/bmKweLHYbFcZPEMnbIjFi6', '616 Gleichner Shoals\nBernhardburgh, OH 28082', '9788 Berenice Freeway\nTyreebury, ID 64952-5794', 'ADM-00074', '1984-02-12', 'A', 'Arts', '2025-2026', 'Greenfelder Inc School', 'Dr. Carmel Adams PhD', 'Engineer', '01372342708', 'father74@example.com', '3416651023324', NULL, 'Maryse Koch', 'Housewife', '01462155260', 'mother74@example.com', '7115303300095', NULL, 'Ms. Arianna Trantow', '01674323942', 'guardian74@example.com', '4601583031361', 'Brother', 1, 14, 5, '2025-12-20', NULL, 2025000074, 900074, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30', '127.0.0.1', 1, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30'),
(75, 'Kailey', 'Parker', '1981-08-09', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '0842644513405', '01874442728', 'student75@example.com', '$2y$12$dkWIq4SakZWvQQ1LYMyogeYJBdsLYmitxKu8ByVXD7jz5CC4B.O9m', '371 Hodkiewicz Tunnel Apt. 943\nMurrayview, OH 99295', '4989 Darwin Square Suite 521\nPort Jamarcus, FL 32127', 'ADM-00075', '2010-01-14', 'C', 'Science', '2025-2026', 'Reichel-Mosciski School', 'Mr. General Torphy Sr.', 'Teacher', '01439385709', 'father75@example.com', '7627015681637', NULL, 'Kimberly Eichmann IV', 'Businesswoman', '01979022283', 'mother75@example.com', '9532767437928', NULL, 'Bernardo Gottlieb', '01881296122', 'guardian75@example.com', '8680450409671', 'Sister', 1, 19, 2, '2025-12-20', NULL, 2025000075, 900075, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30', '127.0.0.1', 1, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30'),
(76, 'Allen', 'Kautzer', '1975-07-01', 'Male', 'AB+', 'Christian', 'Bangladeshi', '0413330166895', '01877442575', 'student76@example.com', '$2y$12$dpqrb6hYk6iyv43E9uKJ3uJd7Uv8SJfYN.d4aqnHi3yLc.GgAKWVi', '1379 Huel Roads\nGodfreyshire, NJ 70403', '408 Smith Summit\nNorth Kasey, WA 08730', 'ADM-00076', '1974-10-10', 'C', 'Arts', '2025-2026', 'Wyman, Stoltenberg and Graham School', 'Christophe Heller Jr.', 'Doctor', '01515809709', 'father76@example.com', '0906310958462', NULL, 'Kailey Mueller', 'Businesswoman', '01609958173', 'mother76@example.com', '5392011071496', NULL, 'Renee Waters', '01967540835', 'guardian76@example.com', '6209945745709', 'Uncle', 1, 19, 1, '2025-12-20', NULL, 2025000076, 900076, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30', '127.0.0.1', 1, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30'),
(77, 'Jamie', 'Goyette', '1983-12-23', 'Other', 'A-', 'Christian', 'Bangladeshi', '7740400543008', '01735795600', 'student77@example.com', '$2y$12$FpfDYjqWCWglRjRuqWF7jO/ohrTh5yQxa2VKtTyW51UtrzpRfPJyC', '538 Deborah Fords\nWest Tommiechester, IN 76630', '967 Anahi Square\nTinaville, NE 09707-1104', 'ADM-00077', '2004-04-28', 'B', 'Commerce', '2025-2026', 'Krajcik, Zemlak and Murazik School', 'Joany Leffler', 'Businessman', '01518282232', 'father77@example.com', '3310139679437', NULL, 'Layla Padberg', 'Doctor', '01797831495', 'mother77@example.com', '2058893995958', NULL, 'Prof. Percival Hamill', '01465374537', 'guardian77@example.com', '7656357884462', 'Uncle', 1, 13, 4, '2025-12-20', NULL, 2025000077, 900077, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30', '127.0.0.1', 1, NULL, '2025-12-20 08:34:30', '2025-12-20 08:34:30'),
(78, 'Jannie', 'Kuhn', '1972-07-02', 'Other', 'O-', 'Islam', 'Bangladeshi', '4926619131534', '01393174717', 'student78@example.com', '$2y$12$mK72EC3VPYTj/zomQ.ZqtOj5tOi.iboZhDMaUHWOX6wFq92NxIF1m', '487 Hand Park Apt. 272\nSouth Vidalton, MS 72818', '49041 Vivienne Village\nLake Ardella, MN 22552-3071', 'ADM-00078', '2014-12-23', 'B', 'Commerce', '2025-2026', 'Leffler Ltd School', 'William Larkin', 'Teacher', '01405511813', 'father78@example.com', '8859615180104', NULL, 'Miss Pamela Smitham', 'Teacher', '01454306556', 'mother78@example.com', '7562006037116', NULL, 'Jedediah McClure', '01967736916', 'guardian78@example.com', '6827737876698', 'Aunt', 1, 20, 1, '2025-12-20', NULL, 2025000078, 900078, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31', '127.0.0.1', 1, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31'),
(79, 'Willy', 'Prohaska', '1976-06-10', 'Male', 'B-', 'Other', 'Bangladeshi', '6684186877080', '01398715775', 'student79@example.com', '$2y$12$S7.MCC3QrveosmZfPL5fm.SVbu0OLOIO3M0zYlB7APKK3Dx6nob7O', '57653 Fritsch Cove Suite 780\nNew Lawrence, RI 82789-4080', '55845 Mertie Mountains Suite 042\nDarrickview, OK 94048-4929', 'ADM-00079', '2013-08-01', 'B', 'Commerce', '2025-2026', 'Gerlach-Hamill School', 'Jordon Hintz', 'Businessman', '01992322369', 'father79@example.com', '6252571158757', NULL, 'Prof. Aleen Kuhlman', 'Housewife', '01560405767', 'mother79@example.com', '9907211830867', NULL, 'Jeffry Kiehn', '01434935381', 'guardian79@example.com', '3617659776464', 'Grandparent', 1, 14, 4, '2025-12-20', NULL, 2025000079, 900079, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31', '127.0.0.1', 1, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31'),
(80, 'Orlo', 'Bogisich', '2012-02-01', 'Female', 'AB+', 'Hindu', 'Bangladeshi', '9101638201834', '01412296167', 'student80@example.com', '$2y$12$hNcZ26MF0y/sBR0vEFyJLOzpq9NMhVgao/20yDpf9elmvZ9x.WCtC', '896 Lowe Freeway Suite 571\nAnnemouth, MI 77162', '71782 Agnes Manors Apt. 757\nLake Enricoland, IA 78712-1167', 'ADM-00080', '1984-02-03', 'B', 'Arts', '2025-2026', 'Beahan-Jast School', 'Alexandro Schowalter', 'Farmer', '01378210062', 'father80@example.com', '3830216756081', NULL, 'Haylee Lowe', 'Doctor', '01779913271', 'mother80@example.com', '8806266638004', NULL, 'Mr. Jarret Little DDS', '01902564975', 'guardian80@example.com', '7903476509638', 'Aunt', 1, 13, 3, '2025-12-20', NULL, 2025000080, 900080, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31', '127.0.0.1', 1, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31'),
(81, 'Beau', 'Mueller', '1982-06-07', 'Male', 'A+', 'Other', 'Bangladeshi', '9298621261928', '01891458201', 'student81@example.com', '$2y$12$5inXV5aA1VS9orUFGL0JzeloQZ9Jsex4YgnM5A5NeVm6IgA./nrUW', '18197 Josue Harbor\nNorth Horacioton, AL 83246', '917 Erwin Trace Apt. 409\nDomenicoside, AZ 09302', 'ADM-00081', '1997-09-09', 'C', 'Arts', '2025-2026', 'Becker LLC School', 'Curt Wehner', 'Doctor', '01409747420', 'father81@example.com', '5182796492615', NULL, 'Lucie Boehm Sr.', 'Teacher', '01712194338', 'mother81@example.com', '9923644124636', NULL, 'Miss Dolores Kohler II', '01523618681', 'guardian81@example.com', '6045236764271', 'Aunt', 1, 15, 4, '2025-12-20', NULL, 2025000081, 900081, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31', '127.0.0.1', 1, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31'),
(82, 'Dallin', 'West', '1973-03-24', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '1760349883802', '01861488565', 'student82@example.com', '$2y$12$Gtd27Al7B1HLIWMJNW7/1eVUEXdWx.sCncr.vfjyJAfI0xjJw1SAK', '13504 Labadie Mill\nNorth Liliana, CA 22692-9238', '3925 Lincoln Lane Apt. 163\nWest Allisonland, RI 17045-0227', 'ADM-00082', '2023-09-09', 'C', 'Arts', '2025-2026', 'Dietrich-Ullrich School', 'Orval Bailey', 'Businessman', '01343643966', 'father82@example.com', '3900830304414', NULL, 'Lucienne Boyle', 'Businesswoman', '01449284418', 'mother82@example.com', '6665104344709', NULL, 'Myrl Daugherty', '01847554297', 'guardian82@example.com', '9357450650247', 'Grandparent', 1, 21, 1, '2025-12-20', NULL, 2025000082, 900082, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31', '127.0.0.1', 1, NULL, '2025-12-20 08:34:31', '2025-12-20 08:34:31'),
(83, 'Grady', 'Dare', '2015-07-22', 'Female', 'B-', 'Islam', 'Bangladeshi', '4249202285677', '01648394820', 'student83@example.com', '$2y$12$dwDO3aSzLMfzCpPDCmJjXeMxiECi7POgp1O5iqhCrYh.r/F5GECb6', '77541 Merle Parkways Suite 098\nWest Diannachester, AR 39937', '8514 Tomas Orchard\nLake Dejon, IL 08761-5986', 'ADM-00083', '1998-01-21', 'C', 'Arts', '2025-2026', 'Quitzon-Johns School', 'Theodore Shanahan', 'Teacher', '01978705034', 'father83@example.com', '2839519836542', NULL, 'Summer Smith', 'Doctor', '01743989091', 'mother83@example.com', '8904417754180', NULL, 'Oliver Waters', '01739446956', 'guardian83@example.com', '6619831498453', 'Uncle', 1, 16, 4, '2025-12-20', NULL, 2025000083, 900083, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32', '127.0.0.1', 1, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32'),
(84, 'Eve', 'Rohan', '2015-10-03', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '6888677315304', '01308888372', 'student84@example.com', '$2y$12$jTpk9yaHkXc8Aweut1Y2MuO7QXDg4FiEzJd30oQPGv0oFuM0vmsUK', '16985 Lucienne Forge Apt. 210\nKeeblerton, MI 23072-2827', '291 Wiza Forges Apt. 938\nArlenefort, CO 83526', 'ADM-00084', '1992-10-06', 'C', 'Arts', '2025-2026', 'Steuber-Boyle School', 'Felix Ernser', 'Farmer', '01372387370', 'father84@example.com', '5773596376012', NULL, 'Vernie Batz', 'Doctor', '01716467590', 'mother84@example.com', '4126223739129', NULL, 'Prof. Jaren Green II', '01307040620', 'guardian84@example.com', '2970334870159', 'Aunt', 1, 17, 4, '2025-12-20', NULL, 2025000084, 900084, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32', '127.0.0.1', 1, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32'),
(85, 'Seth', 'Strosin', '1971-08-26', 'Male', 'AB-', 'Christian', 'Bangladeshi', '6757690162343', '01769945714', 'student85@example.com', '$2y$12$LfH0xEZ18/Eas1i8jJStdukMMlXQKyr4quEzosN6U1tTxcCwfp9a2', '2645 Fahey Extensions\nPort Bell, KS 28476', '9212 Romaguera Unions Suite 036\nEast Ken, KS 66572-1780', 'ADM-00085', '2007-11-09', 'B', 'Commerce', '2025-2026', 'Krajcik Group School', 'Waldo Nikolaus', 'Teacher', '01607550851', 'father85@example.com', '6364951012705', NULL, 'Drew Bergstrom', 'Housewife', '01590626942', 'mother85@example.com', '7073035517753', NULL, 'Christiana Schowalter MD', '01946123175', 'guardian85@example.com', '7336998089143', 'Sister', 1, 15, 5, '2025-12-20', NULL, 2025000085, 900085, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32', '127.0.0.1', 1, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32'),
(86, 'Alec', 'Bogan', '1997-06-23', 'Female', 'O+', 'Christian', 'Bangladeshi', '0461784733391', '01753072849', 'student86@example.com', '$2y$12$MgTg4zHGorVFOHJQC1lcx.BMV5sok7ZvKzqUA9uwj5L7D6WUmJE.a', '37323 Flatley Mission Suite 387\nWest Constance, KS 17684-9896', '5584 Furman Fords Suite 572\nMcDermottmouth, CA 42678-5827', 'ADM-00086', '1996-09-22', 'C', 'Science', '2025-2026', 'Price PLC School', 'Dr. Houston Grant DVM', 'Teacher', '01331362207', 'father86@example.com', '0340678902775', NULL, 'Zoe Veum', 'Nurse', '01473769548', 'mother86@example.com', '4276441639032', NULL, 'Melany Harris', '01882637755', 'guardian86@example.com', '0960141930503', 'Grandparent', 1, 20, 2, '2025-12-20', NULL, 2025000086, 900086, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32', '127.0.0.1', 1, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32'),
(87, 'Antone', 'Monahan', '1987-10-20', 'Female', 'AB+', 'Other', 'Bangladeshi', '3141975347915', '01501742900', 'student87@example.com', '$2y$12$MPcF1msUm3nLnRK8YkL.m.70xvOdJIzN87AlGWoFVeJc5z13Fz/By', '5132 Nicolas Creek Suite 037\nMurraybury, FL 86426-0381', '488 Price Mountains\nLazaroton, TX 48474', 'ADM-00087', '2012-01-12', 'B', 'Arts', '2025-2026', 'Pfannerstill-Dach School', 'Mr. Wilbert Durgan', 'Farmer', '01977788034', 'father87@example.com', '0071055353308', NULL, 'Crystal Herman', 'Doctor', '01553504458', 'mother87@example.com', '4693566624511', NULL, 'Mohamed Ruecker', '01915990588', 'guardian87@example.com', '8180841379392', 'Uncle', 1, 14, 3, '2025-12-20', NULL, 2025000087, 900087, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32', '127.0.0.1', 1, NULL, '2025-12-20 08:34:32', '2025-12-20 08:34:32'),
(88, 'Jasen', 'Reichert', '1988-05-08', 'Other', 'AB-', 'Other', 'Bangladeshi', '7962770111452', '01804471233', 'student88@example.com', '$2y$12$fHsMw2ZLgaaMc3s5X9KzT.x6Q5rcvxjN1mWmE0TyEX6BZFhjnOnly', '32308 Koss Land\nHeathland, OH 44486', '41696 Abernathy Gardens\nNew Sonyachester, NJ 29185', 'ADM-00088', '1987-08-04', 'A', 'Arts', '2025-2026', 'Schroeder, Hane and Dicki School', 'Bertha Hagenes MD', 'Businessman', '01886375527', 'father88@example.com', '2282633486932', NULL, 'Helga Wiza', 'Teacher', '01621834826', 'mother88@example.com', '8942297437405', NULL, 'Allene Schinner DDS', '01337207327', 'guardian88@example.com', '7959909308240', 'Sister', 1, 22, 1, '2025-12-20', NULL, 2025000088, 900088, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33', '127.0.0.1', 1, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33'),
(89, 'Lawson', 'Kiehn', '2007-05-15', 'Female', 'O-', 'Buddhist', 'Bangladeshi', '4070215223513', '01516155976', 'student89@example.com', '$2y$12$dTH3Ah0fBsv1uGw3dcPCyuRVOd6jb9KsBqYirPqGRe9WBYrOzw7AG', '3643 Felipa Port\nMadysonberg, CA 85190-7677', '1258 Jaskolski Junction Apt. 566\nNorth Alvena, AR 42781', 'ADM-00089', '1999-10-21', 'B', 'Commerce', '2025-2026', 'Bins-Waelchi School', 'Dr. Austen Reinger', 'Engineer', '01802776739', 'father89@example.com', '5864050561978', NULL, 'Dr. Emma Grant', 'Housewife', '01652154786', 'mother89@example.com', '2707513471097', NULL, 'Quinton Zieme', '01824411411', 'guardian89@example.com', '7026261484120', 'Grandparent', 1, 16, 5, '2025-12-20', NULL, 2025000089, 900089, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33', '127.0.0.1', 1, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33'),
(90, 'Quinn', 'Crist', '2025-02-07', 'Male', 'A-', 'Christian', 'Bangladeshi', '6719956129898', '01721051867', 'student90@example.com', '$2y$12$AkBxLqCKzrqWdujgAbKyEeT/Qh9eHj1cu5ruHoEUFaOGy.zz6UaDq', '11335 Kasandra Crest Apt. 679\nNew Destineyfurt, AL 71651', '312 Hudson Orchard\nEulaliaport, NJ 87235', 'ADM-00090', '1970-09-19', 'A', 'Arts', '2025-2026', 'Bahringer, Hyatt and Murray School', 'Frank Schultz', 'Engineer', '01750741544', 'father90@example.com', '6114212098676', NULL, 'Hailee Fadel DDS', 'Businesswoman', '01931864912', 'mother90@example.com', '9935277561434', NULL, 'Kali Corwin DVM', '01312918865', 'guardian90@example.com', '7825188428139', 'Brother', 1, 18, 4, '2025-12-20', NULL, 2025000090, 900090, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33', '127.0.0.1', 1, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33'),
(91, 'Cruz', 'Kris', '2015-10-25', 'Male', 'O-', 'Hindu', 'Bangladeshi', '8523098513832', '01553802442', 'student91@example.com', '$2y$12$b3ucYLz3G5URN/XMORZRQukHree9rtlUDpKGAcWKpNjD7qQnH0nge', '60394 Nicole Passage Suite 070\nNew Leonora, DC 74048', '829 Mary Cliff\nGileston, WI 82116-5686', 'ADM-00091', '1988-11-10', 'A', 'Arts', '2025-2026', 'Shields Ltd School', 'Lennie Haag MD', 'Businessman', '01927463081', 'father91@example.com', '7518821685989', NULL, 'Dr. Maye Paucek', 'Doctor', '01911456905', 'mother91@example.com', '9464818900237', NULL, 'Gladys Kshlerin', '01313555867', 'guardian91@example.com', '5106520381557', 'Uncle', 1, 15, 3, '2025-12-20', NULL, 2025000091, 900091, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33', '127.0.0.1', 1, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33'),
(92, 'Cordia', 'Mann', '1993-05-04', 'Male', 'A+', 'Other', 'Bangladeshi', '6943102577149', '01431584353', 'student92@example.com', '$2y$12$B3SLnltsaBBiMsQ42NxUc.0h1spzbqa6fv2hLrbR93WBkmx48fTGK', '6043 Blanca Mall Suite 792\nNew Nikita, NE 12334', '29871 Henriette Village\nEast Bradytown, AK 31617-1203', 'ADM-00092', '1976-11-06', 'A', 'Arts', '2025-2026', 'Homenick, Kerluke and Medhurst School', 'Prof. Baron Kling MD', 'Teacher', '01714076627', 'father92@example.com', '5835557812550', NULL, 'Twila Barrows', 'Teacher', '01499638362', 'mother92@example.com', '1805046726202', NULL, 'Cyril Ratke', '01301150646', 'guardian92@example.com', '9327077425784', 'Grandparent', 1, 17, 5, '2025-12-20', NULL, 2025000092, 900092, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33', '127.0.0.1', 1, NULL, '2025-12-20 08:34:33', '2025-12-20 08:34:33'),
(93, 'Buster', 'Skiles', '1973-07-17', 'Other', 'B+', 'Christian', 'Bangladeshi', '5374335479747', '01675175334', 'student93@example.com', '$2y$12$CUS0rcBKOpnXuKaToS0LbOSW/uddG5hG.FHpG8bf60HlXIx.lgxCS', '56599 Gerhold Turnpike\nNew Barney, KS 09179', '431 Satterfield Square Suite 354\nPort Asa, MS 65978', 'ADM-00093', '1989-12-12', 'B', 'Commerce', '2025-2026', 'Reichel-Doyle School', 'Neil Kreiger', 'Farmer', '01764474217', 'father93@example.com', '2302503237111', NULL, 'Erika Hammes', 'Housewife', '01407556099', 'mother93@example.com', '0461661742526', NULL, 'Cicero Bashirian V', '01801366361', 'guardian93@example.com', '5820748417998', 'Brother', 1, 18, 5, '2025-12-20', NULL, 2025000093, 900093, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34', '127.0.0.1', 1, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34'),
(94, 'August', 'Spinka', '1995-06-07', 'Female', 'B-', 'Islam', 'Bangladeshi', '5354209848885', '01305258785', 'student94@example.com', '$2y$12$57.G3/2qfFEOlM3XOkjsf.7CnA4EwYvyB2sFcTASFtY2V2RB0V/bi', '997 Felipe Square Apt. 441\nCorkeryhaven, CA 34759-0252', '5542 Heller Fords Apt. 343\nHowellland, TN 67738-1675', 'ADM-00094', '1970-06-21', 'C', 'Science', '2025-2026', 'Mann-Mayer School', 'Brayan Walker', 'Doctor', '01936714024', 'father94@example.com', '0969164793457', NULL, 'Nelle Wolff', 'Nurse', '01691825338', 'mother94@example.com', '7956537844608', NULL, 'Elda Anderson', '01784590473', 'guardian94@example.com', '7425709003023', 'Grandparent', 1, 19, 4, '2025-12-20', NULL, 2025000094, 900094, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34', '127.0.0.1', 1, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34'),
(95, 'Addie', 'Wiegand', '1975-08-31', 'Other', 'AB-', 'Other', 'Bangladeshi', '5377901927629', '01909497174', 'student95@example.com', '$2y$12$7uE2zN0H1LYqLypefn3mMuDwtT1T8HMNoFFrbEsi6rw3pU8CKnTI2', '3067 Tavares Fort\nLianamouth, OH 62228-3288', '4404 Skiles Ville Apt. 276\nNew Ceasarmouth, IN 27824-2803', 'ADM-00095', '2014-08-09', 'C', 'Arts', '2025-2026', 'Sanford, Swift and Thompson School', 'Barry Cartwright', 'Teacher', '01639220811', 'father95@example.com', '6539512252730', NULL, 'Greta Veum', 'Nurse', '01849568853', 'mother95@example.com', '7745472662471', NULL, 'Prof. Violet Kuvalis PhD', '01382247767', 'guardian95@example.com', '8205490141975', 'Grandparent', 1, 19, 5, '2025-12-20', NULL, 2025000095, 900095, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34', '127.0.0.1', 1, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34'),
(96, 'Kaylah', 'Bartell', '1976-01-02', 'Other', 'A+', 'Other', 'Bangladeshi', '7761441841865', '01431459060', 'student96@example.com', '$2y$12$uWb7slvuRtJIhnDzmQ7A9eLt5VQDfIbFd5eu4y87e0wAhm3iedE0S', '879 Concepcion Greens Suite 082\nDoyleshire, CA 87171-2790', '1928 Tremblay Place Suite 189\nWest Matteoland, UT 43299', 'ADM-00096', '1992-11-10', 'C', 'Science', '2025-2026', 'Beahan-Kohler School', 'Rashad Tromp', 'Doctor', '01998486304', 'father96@example.com', '5199280162277', NULL, 'Juana O\'Reilly II', 'Businesswoman', '01448161094', 'mother96@example.com', '2988582549259', NULL, 'Freeda Stiedemann I', '01589515710', 'guardian96@example.com', '6571173373854', 'Brother', 1, 20, 4, '2025-12-20', NULL, 2025000096, 900096, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34', '127.0.0.1', 1, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34'),
(97, 'Matt', 'Renner', '1981-10-22', 'Female', 'A-', 'Buddhist', 'Bangladeshi', '3123849223787', '01713461772', 'student97@example.com', '$2y$12$6.aUfzzDaRMSF4JepLPQxu2MljS1/iwWvyp1CGnrQpRHEzJexa6HK', '574 Wiegand Loaf\nPort Randalville, AK 37535', '789 Gibson Cape\nLeschberg, MA 67280', 'ADM-00097', '2007-02-13', 'B', 'Arts', '2025-2026', 'Bauch-Abshire School', 'Prof. Casimir Renner', 'Doctor', '01864957770', 'father97@example.com', '4301265818565', NULL, 'Linda Christiansen', 'Nurse', '01655933284', 'mother97@example.com', '2416736144481', NULL, 'Joanny Schowalter', '01488666246', 'guardian97@example.com', '6491603416431', 'Aunt', 1, 16, 3, '2025-12-20', NULL, 2025000097, 900097, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34', '127.0.0.1', 1, NULL, '2025-12-20 08:34:34', '2025-12-20 08:34:34'),
(98, 'Devyn', 'Beatty', '1975-08-07', 'Other', 'O+', 'Islam', 'Bangladeshi', '5688687311109', '01561294091', 'student98@example.com', '$2y$12$2ivBxcjHNtkiTPGSMO0wV.mZmP4aL8LjvBOxOGf2x0OsVY9mzckny', '172 Imani Vista Suite 440\nEast Adelahaven, FL 47687-5580', '5294 Kale Parkway Suite 335\nKelliborough, IN 82360-0109', 'ADM-00098', '2003-08-11', 'A', 'Science', '2025-2026', 'Becker-Towne School', 'Dax Hermann DDS', 'Teacher', '01458439339', 'father98@example.com', '1642693430547', NULL, 'Roslyn Reichel III', 'Housewife', '01609059368', 'mother98@example.com', '9349368107340', NULL, 'Miss Jena Bergnaum', '01915450588', 'guardian98@example.com', '4661756311812', 'Grandparent', 1, 20, 5, '2025-12-20', NULL, 2025000098, 900098, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35', '127.0.0.1', 1, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35'),
(99, 'Elwyn', 'Quigley', '1971-05-12', 'Male', 'B-', 'Hindu', 'Bangladeshi', '3138031399677', '01321106604', 'student99@example.com', '$2y$12$Hmc0O8UPbVcTScacVr5D9.aXgKqp5YRgQEREao3rt5ZYuh2a9M34i', '554 Sarai Circle Apt. 542\nPort Johannaside, RI 75138', '8564 Brown Hollow Apt. 608\nNorth Omershire, IN 41023-7907', 'ADM-00099', '1976-01-13', 'C', 'Commerce', '2025-2026', 'Bechtelar, Welch and Lind School', 'Emmanuel Parisian', 'Teacher', '01700061026', 'father99@example.com', '4123273678139', NULL, 'Prof. Carolina McClure', 'Housewife', '01521059079', 'mother99@example.com', '5423098867833', NULL, 'Kris Becker IV', '01335136520', 'guardian99@example.com', '8800468475660', 'Sister', 1, 21, 2, '2025-12-20', NULL, 2025000099, 900099, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35', '127.0.0.1', 1, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35'),
(100, 'Shannon', 'Carter', '2018-02-27', 'Male', 'AB-', 'Islam', 'Bangladeshi', '7531392466974', '01954247788', 'student100@example.com', '$2y$12$ic5MlyKyEFGCbeUx5bIoDeHofSwiUHD4LCU6EvrG.XuGyf/6OuTVi', '779 Wilkinson Courts\nHillstad, IN 25588', '762 Evans Lane\nNorth Imogeneburgh, NJ 63832-7017', 'ADM-00100', '2015-01-16', 'C', 'Commerce', '2025-2026', 'Schneider-Brakus School', 'Laverna Boyer', 'Businessman', '01325548627', 'father100@example.com', '7591095853771', NULL, 'Miss Clementine Krajcik PhD', 'Doctor', '01682033340', 'mother100@example.com', '1818561491153', NULL, 'Enid Klocko', '01635842080', 'guardian100@example.com', '5518089006170', 'Brother', 1, 17, 3, '2025-12-20', NULL, 2025000100, 900100, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35', '127.0.0.1', 1, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35'),
(101, 'Tia', 'Weissnat', '1973-03-31', 'Other', 'B-', 'Other', 'Bangladeshi', '6454425231063', '01660984486', 'student101@example.com', '$2y$12$5N5SlDBxbZBZoE9A7lIXTehZ.6jzrEZFpYWug.xtXDlP.XcwT3EoS', '1753 Immanuel Plains\nPurdyfort, AZ 11569-6386', '67737 Brad Harbor\nLake Paolo, RI 81915-0563', 'ADM-00101', '1981-04-13', 'A', 'Arts', '2025-2026', 'Kunze-Baumbach School', 'Mr. Ignatius Wilderman', 'Engineer', '01882362082', 'father101@example.com', '4703193551544', NULL, 'Angelita Stamm', 'Teacher', '01758174289', 'mother101@example.com', '7252209408448', NULL, 'Eulah Schumm', '01648330416', 'guardian101@example.com', '1577593043623', 'Grandparent', 1, 21, 5, '2025-12-20', NULL, 2025000101, 900101, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35', '127.0.0.1', 1, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35'),
(102, 'Shannon', 'Sipes', '2003-03-25', 'Other', 'O-', 'Other', 'Bangladeshi', '8248405965937', '01920445266', 'student102@example.com', '$2y$12$nKpALVV7lLsSmzDYgT4eA.taGQO3qNYVoo4wVWH51yv8q68R0cy.K', '94880 Mayer Ways\nZiemannshire, ID 78719-6200', '964 Lisa Lane Apt. 553\nSouth Minnieport, ID 04437', 'ADM-00102', '2020-11-02', 'A', 'Science', '2025-2026', 'Baumbach-Jacobson School', 'Dr. Arely Dickinson', 'Doctor', '01565279174', 'father102@example.com', '0608979986345', NULL, 'Alicia Anderson', 'Nurse', '01979581866', 'mother102@example.com', '1188035502792', NULL, 'Maybell Schumm', '01789629517', 'guardian102@example.com', '7514941449008', 'Sister', 1, 21, 4, '2025-12-20', NULL, 2025000102, 900102, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35', '127.0.0.1', 1, NULL, '2025-12-20 08:34:35', '2025-12-20 08:34:35'),
(103, 'Dock', 'Osinski', '2005-08-31', 'Male', 'O-', 'Hindu', 'Bangladeshi', '5446692367301', '01686707003', 'student103@example.com', '$2y$12$JSIeWrDRJPSPnbr2zjJrnuAAoIKFwjqbnAedoeGghFHn7eYyavXPi', '2454 Pagac Summit Suite 999\nDeontaeton, SD 79779-8951', '3529 Zelda Shoals Suite 559\nGermainechester, ID 96241', 'ADM-00103', '1978-01-11', 'A', 'Science', '2025-2026', 'Hand-Hagenes School', 'Dr. Ernest Schaden II', 'Teacher', '01321344360', 'father103@example.com', '1664525775680', NULL, 'Abagail Crona', 'Doctor', '01978218060', 'mother103@example.com', '8297084416440', NULL, 'Loy Kessler DDS', '01764249733', 'guardian103@example.com', '0826253055715', 'Uncle', 1, 18, 3, '2025-12-20', NULL, 2025000103, 900103, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36', '127.0.0.1', 1, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36'),
(104, 'Humberto', 'Heller', '1990-01-04', 'Male', 'O-', 'Islam', 'Bangladeshi', '0689943653934', '01819736162', 'student104@example.com', '$2y$12$tV4jsPFCfldCRdUXXw4f5.Ti3DJg.T4lrQTJzC.0lFaXOsXGImPPa', '56844 Emmerich Glens Apt. 897\nMillermouth, MS 79216-5229', '2352 Coy Cliff\nPort Rylan, AL 35794-4271', 'ADM-00104', '2022-10-15', 'B', 'Commerce', '2025-2026', 'Crist-Hammes School', 'Toby Prohaska', 'Engineer', '01704972918', 'father104@example.com', '1896748697476', NULL, 'Dr. Lonie Murazik', 'Doctor', '01552610791', 'mother104@example.com', '9067214350380', NULL, 'Rosalee Schroeder', '01741423581', 'guardian104@example.com', '2312984925855', 'Grandparent', 1, 22, 4, '2025-12-20', NULL, 2025000104, 900104, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36', '127.0.0.1', 1, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36'),
(105, 'Glennie', 'Lubowitz', '2013-12-26', 'Other', 'O-', 'Hindu', 'Bangladeshi', '2037851747661', '01982969201', 'student105@example.com', '$2y$12$/wOOlOJrPlQCRU6q/2xlkOdGu.TB9b/FpsJB8yRJqAuJtw6hH0jc2', '966 Kevon Neck Suite 574\nMitchellside, WI 71537', '31393 Auer Locks\nWest Holdenhaven, DC 61983-5304', 'ADM-00105', '1976-03-19', 'A', 'Commerce', '2025-2026', 'Hartmann-Metz School', 'Tavares Macejkovic V', 'Teacher', '01473436048', 'father105@example.com', '2101741079673', NULL, 'Maud Maggio', 'Businesswoman', '01432702022', 'mother105@example.com', '9542189317803', NULL, 'Alivia Weissnat', '01321939380', 'guardian105@example.com', '7748526911314', 'Brother', 1, 23, 4, '2025-12-20', NULL, 2025000105, 900105, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36', '127.0.0.1', 1, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36'),
(106, 'Moses', 'Goldner', '2021-11-05', 'Other', 'B+', 'Buddhist', 'Bangladeshi', '0163704040566', '01568460123', 'student106@example.com', '$2y$12$Em6b84RAETc8bdNJWljnsOsnYY/zRjOevCbhkSK6W9SR9MXaDJ3Au', '43196 Rippin Mews\nEast Carlotta, WI 24318-8110', '7500 Thompson Row\nNorth Loyce, CO 62949', 'ADM-00106', '2022-02-22', 'A', 'Arts', '2025-2026', 'Kuhlman and Sons School', 'Darien Ferry', 'Farmer', '01573473904', 'father106@example.com', '2725159227601', NULL, 'Prof. Bridget O\'Connell MD', 'Doctor', '01709359036', 'mother106@example.com', '3418379846274', NULL, 'Rubie Dare', '01395759261', 'guardian106@example.com', '7763051913499', 'Sister', 1, 23, 1, '2025-12-20', NULL, 2025000106, 900106, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36', '127.0.0.1', 1, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36'),
(107, 'Winona', 'Jacobson', '2022-08-05', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '4829677299605', '01692525581', 'student107@example.com', '$2y$12$j/QLsEFsBq02IgAU1IxCfOd6AKCQ9rbfJs4FpNnh4IKq14wAkQ39a', '2016 Stiedemann Ville\nEast Antwanborough, MS 99850-6813', '43897 Bella Cape\nGeovanyberg, HI 76869', 'ADM-00107', '1980-06-02', 'A', 'Science', '2025-2026', 'Wiegand-Klocko School', 'Prof. Hank Gaylord', 'Farmer', '01511702987', 'father107@example.com', '2378403612580', NULL, 'Mrs. Savanna White PhD', 'Businesswoman', '01846164434', 'mother107@example.com', '2781766477331', NULL, 'Carrie Welch', '01547972115', 'guardian107@example.com', '7387482912749', 'Grandparent', 1, 22, 2, '2025-12-20', NULL, 2025000107, 900107, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36', '127.0.0.1', 1, NULL, '2025-12-20 08:34:36', '2025-12-20 08:34:36'),
(108, 'Ottilie', 'Heaney', '2024-01-03', 'Female', 'O-', 'Buddhist', 'Bangladeshi', '7295240398766', '01625681829', 'student108@example.com', '$2y$12$GwCHtWkxoFpkvlqnJDDX1OVL9OyAaZE/JjBfvQqi3TGn/8jNZNY.O', '4889 Cruickshank Mountains\nClarissaborough, MT 17399-7667', '3363 Melyna Keys Suite 043\nCheyenneville, MI 29808-2302', 'ADM-00108', '1971-07-18', 'B', 'Science', '2025-2026', 'Bauch-Kozey School', 'Norberto Kshlerin DVM', 'Engineer', '01753443130', 'father108@example.com', '9213850555803', NULL, 'Marta Rogahn Sr.', 'Housewife', '01780774304', 'mother108@example.com', '1257843728882', NULL, 'Bret Roob', '01731215204', 'guardian108@example.com', '8198992336654', 'Brother', 1, 19, 3, '2025-12-20', NULL, 2025000108, 900108, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37', '127.0.0.1', 1, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37'),
(109, 'Brody', 'Dare', '1996-03-12', 'Female', 'A-', 'Other', 'Bangladeshi', '7034442763785', '01761666657', 'student109@example.com', '$2y$12$JIP/xcMtWMGFPtsxiMpZ0unIuZyVd3aORCw4D9fUaTsMw8585dDpW', '685 Maia Lakes Suite 508\nNorth Angelamouth, MI 33564', '7145 Myah Lock Suite 847\nNorth Ibrahimchester, MA 90184-0292', 'ADM-00109', '1990-06-19', 'A', 'Science', '2025-2026', 'Gottlieb-Yost School', 'Newell Kling', 'Engineer', '01957998864', 'father109@example.com', '5825477481956', NULL, 'Miss Maeve Stanton II', 'Businesswoman', '01982747989', 'mother109@example.com', '8699363836588', NULL, 'Nelle Watsica', '01302615627', 'guardian109@example.com', '4460349601501', 'Sister', 1, 20, 3, '2025-12-20', NULL, 2025000109, 900109, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37', '127.0.0.1', 1, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37'),
(110, 'Fabian', 'Greenfelder', '1993-04-30', 'Other', 'A-', 'Hindu', 'Bangladeshi', '2873586989211', '01399706439', 'student110@example.com', '$2y$12$fLM5JSr3Z8yAoR5zbCsaTuDyIfP5sRp8V6zsDDZ5zQ1ZBRwk3O22O', '2116 Nicole Row Apt. 918\nCroninchester, FL 39031', '61049 Abdiel Shoals Apt. 276\nMuhammadhaven, DC 14373-7392', 'ADM-00110', '2008-04-09', 'C', 'Science', '2025-2026', 'Zulauf, Graham and Mayer School', 'Willis Krajcik', 'Farmer', '01700449287', 'father110@example.com', '8906876772180', NULL, 'Dasia Fahey', 'Doctor', '01827955135', 'mother110@example.com', '1707596018817', NULL, 'Mr. Walker Leffler Sr.', '01694920753', 'guardian110@example.com', '4165191002474', 'Grandparent', 1, 24, 1, '2025-12-20', NULL, 2025000110, 900110, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37', '127.0.0.1', 1, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37'),
(111, 'Isai', 'Leannon', '1970-03-29', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '6501371971229', '01834211676', 'student111@example.com', '$2y$12$/VAhf3tKngH6iTrWeSdszuwFIpwjj58xbqVLKVxZ4vmjU6O9uKD92', '67666 Brent Brook Apt. 481\nNedramouth, PA 29143', '7432 Ward Estates Suite 894\nJaynetown, MN 60260-2129', 'ADM-00111', '1996-05-11', 'C', 'Science', '2025-2026', 'Dietrich PLC School', 'Dr. Miller Schinner III', 'Teacher', '01873917360', 'father111@example.com', '4302549662968', NULL, 'Augustine Nienow', 'Doctor', '01546193024', 'mother111@example.com', '5205033189329', NULL, 'Cristian Barrows Sr.', '01569561049', 'guardian111@example.com', '2614228754766', 'Sister', 1, 23, 2, '2025-12-20', NULL, 2025000111, 900111, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37', '127.0.0.1', 1, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37'),
(112, 'Raoul', 'Kozey', '1998-01-07', 'Female', 'A+', 'Other', 'Bangladeshi', '5669091790482', '01787489168', 'student112@example.com', '$2y$12$VGFV8ia3zOWZaTNynPtO.O6j69yBo3rN1ldYByv9D7QRxSpWuBeki', '59339 Frami Neck Apt. 864\nWest Jedidiahmouth, NH 63995-7404', '678 Richmond Cliffs Apt. 270\nPort Dessiemouth, UT 37545-0061', 'ADM-00112', '2023-05-27', 'A', 'Science', '2025-2026', 'Hessel, Hermann and Rodriguez School', 'Dominic Schumm', 'Businessman', '01486454233', 'father112@example.com', '5609910324962', NULL, 'Ines Gaylord', 'Housewife', '01611547136', 'mother112@example.com', '2117932801955', NULL, 'Adrianna Ondricka Sr.', '01935907937', 'guardian112@example.com', '6181195962101', 'Grandparent', 1, 24, 2, '2025-12-20', NULL, 2025000112, 900112, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37', '127.0.0.1', 1, NULL, '2025-12-20 08:34:37', '2025-12-20 08:34:37');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(113, 'Austin', 'Abernathy', '2005-01-10', 'Male', 'AB-', 'Christian', 'Bangladeshi', '5903403444650', '01737680091', 'student113@example.com', '$2y$12$P83ekruP97Ld9lYoD0h2A.D2elo92KIi6gP3/Hd8bQ4GT6QT131aq', '4013 Labadie Terrace Suite 919\nHansenchester, VA 29223-6547', '64696 Peter Green\nPenelopeborough, TX 56652-5620', 'ADM-00113', '2012-07-23', 'C', 'Commerce', '2025-2026', 'Denesik-Boehm School', 'Mario Grant', 'Businessman', '01757951648', 'father113@example.com', '3293330280134', NULL, 'Reina Bergstrom', 'Businesswoman', '01864986627', 'mother113@example.com', '9849228619153', NULL, 'Betsy Shanahan', '01765391187', 'guardian113@example.com', '0252776742334', 'Aunt', 1, 21, 3, '2025-12-20', NULL, 2025000113, 900113, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38', '127.0.0.1', 1, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38'),
(114, 'Leta', 'Walter', '1987-03-23', 'Other', 'AB-', 'Islam', 'Bangladeshi', '3829292437374', '01535398910', 'student114@example.com', '$2y$12$gWhkPAu2/fv9nmgZqU4Y9OS/Dz6Qkk1teagxusqYrzcik.pCPB3MG', '4626 Jerrod Hill\nKonopelskimouth, MA 97370', '62183 Volkman Orchard\nVirgieside, RI 81579-6093', 'ADM-00114', '2001-11-19', 'C', 'Commerce', '2025-2026', 'Leannon, Breitenberg and Wolf School', 'Furman Barton', 'Farmer', '01981238585', 'father114@example.com', '7215124157733', NULL, 'Wanda Schuppe', 'Teacher', '01896626856', 'mother114@example.com', '2946531163326', NULL, 'Alvera Nicolas', '01715160496', 'guardian114@example.com', '2951105079513', 'Aunt', 1, 25, 1, '2025-12-20', NULL, 2025000114, 900114, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38', '127.0.0.1', 1, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38'),
(115, 'Nora', 'Bashirian', '2017-12-04', 'Female', 'O-', 'Other', 'Bangladeshi', '1428012404115', '01612869742', 'student115@example.com', '$2y$12$3qDTf56rjFvWL09Od7vKf.dByjH7jjQsu8jZzss8NIn5L5U6VPYau', '12929 Carter Terrace Apt. 263\nNorth Alvinachester, PA 81457-2340', '97782 Waters Knoll Apt. 332\nLangburgh, DE 73955', 'ADM-00115', '1993-03-30', 'A', 'Arts', '2025-2026', 'Hansen-Prohaska School', 'Dr. Garnet Marks', 'Engineer', '01521102104', 'father115@example.com', '4225949338920', NULL, 'Alysson Schuppe MD', 'Housewife', '01898603710', 'mother115@example.com', '1906397683665', NULL, 'Marques Larson', '01699630712', 'guardian115@example.com', '1654388605841', 'Grandparent', 1, 24, 4, '2025-12-20', NULL, 2025000115, 900115, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38', '127.0.0.1', 1, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38'),
(116, 'Edd', 'Kihn', '2009-06-26', 'Female', 'O-', 'Hindu', 'Bangladeshi', '9680513435596', '01646756110', 'student116@example.com', '$2y$12$NVRjLs7Jh2WgZvzvTEkd3uWI30sQI6UUk1a3a/qXSPX6scYzRcr2a', '9319 Blick Rue\nPort Roel, UT 38648', '57021 Prohaska Motorway\nEast Evans, WY 16772', 'ADM-00116', '1998-10-19', 'C', 'Commerce', '2025-2026', 'Prosacco-Wolf School', 'Tillman Mann', 'Businessman', '01478013938', 'father116@example.com', '8026667097188', NULL, 'Lora Glover', 'Doctor', '01741084605', 'mother116@example.com', '6433544592805', NULL, 'Nayeli Flatley Sr.', '01701321737', 'guardian116@example.com', '0996163019763', 'Brother', 1, 26, 1, '2025-12-20', NULL, 2025000116, 900116, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38', '127.0.0.1', 1, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38'),
(117, 'Rosemary', 'Rice', '2013-10-30', 'Other', 'A-', 'Islam', 'Bangladeshi', '9802845248407', '01970682073', 'student117@example.com', '$2y$12$uJ9nmGkUzxZk5SJW0a4RB.kzBcEDWQx0/gKiEnJV.dpClwlaZuX8u', '44697 Lyric Corners Suite 119\nWiltonfurt, OR 20541', '204 Hartmann Loop Suite 135\nSouth Jordon, CO 40016-2230', 'ADM-00117', '2008-11-15', 'B', 'Commerce', '2025-2026', 'Wuckert, Schamberger and Schulist School', 'Vladimir Hirthe V', 'Businessman', '01587813671', 'father117@example.com', '8045553764094', NULL, 'Jackie Schneider', 'Businesswoman', '01424181125', 'mother117@example.com', '1108010908424', NULL, 'Ms. Destiney Johnston DVM', '01620566797', 'guardian117@example.com', '6206992059128', 'Grandparent', 1, 25, 2, '2025-12-20', NULL, 2025000117, 900117, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38', '127.0.0.1', 1, NULL, '2025-12-20 08:34:38', '2025-12-20 08:34:38'),
(118, 'Margie', 'McGlynn', '1986-05-19', 'Other', 'B+', 'Other', 'Bangladeshi', '1965365408037', '01340536940', 'student118@example.com', '$2y$12$nUNDyBncVh9Bg5rlDf.dg.vnp75yUrXzqFXymuhS53MiI7MKSO45a', '22885 Alexanne Mountain\nStokesville, GA 04163-6967', '566 Wolf Lodge\nNew Chanelle, CA 47840-0258', 'ADM-00118', '2022-07-21', 'A', 'Arts', '2025-2026', 'Hagenes-Hettinger School', 'Prof. Sheldon Kunde DVM', 'Engineer', '01723628667', 'father118@example.com', '1844923523218', NULL, 'Ms. Dulce Kuvalis', 'Businesswoman', '01736600295', 'mother118@example.com', '2916185453775', NULL, 'Earnestine Lakin', '01982068924', 'guardian118@example.com', '2767113704523', 'Grandparent', 1, 27, 1, '2025-12-20', NULL, 2025000118, 900118, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39', '127.0.0.1', 1, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39'),
(119, 'Leland', 'Prosacco', '1995-02-28', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '9864252555329', '01681335765', 'student119@example.com', '$2y$12$YmMLH4jm6JB.46JIGIJjC.3ykwx/1zNEkCFlbRkM4hLWOEsNy43tS', '441 Hahn Mission\nPort Aiyanahaven, VT 51420-2054', '321 Keebler Island Apt. 604\nPort Audreanne, TX 80094-9237', 'ADM-00119', '2011-08-08', 'B', 'Arts', '2025-2026', 'Stanton PLC School', 'Mr. Bobbie Koelpin DVM', 'Farmer', '01479094826', 'father119@example.com', '8653352512346', NULL, 'Prof. Guadalupe Schneider', 'Teacher', '01306251530', 'mother119@example.com', '2485407930697', NULL, 'Valentin Schumm DVM', '01539441773', 'guardian119@example.com', '3062238176005', 'Sister', 1, 25, 4, '2025-12-20', NULL, 2025000119, 900119, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39', '127.0.0.1', 1, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39'),
(120, 'Lavinia', 'Greenfelder', '2012-02-29', 'Male', 'A-', 'Hindu', 'Bangladeshi', '3006938965745', '01915493305', 'student120@example.com', '$2y$12$pnPMXdmJZAJEVO8RYBSSleATr8myHdQ10sYj4kQViSb6SpnBZmL/W', '8955 Stanton Course Suite 803\nSouth Viviannebury, RI 27397-4129', '5221 Tessie Row\nLake Shemar, RI 09916-5991', 'ADM-00120', '2017-04-01', 'A', 'Commerce', '2025-2026', 'Bins and Sons School', 'Dr. Jarret Kunze IV', 'Teacher', '01981141356', 'father120@example.com', '9557443140437', NULL, 'Noemy Armstrong', 'Housewife', '01671088636', 'mother120@example.com', '5957555393035', NULL, 'Graciela Streich', '01687737523', 'guardian120@example.com', '2655672391699', 'Sister', 1, 22, 3, '2025-12-20', NULL, 2025000120, 900120, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39', '127.0.0.1', 1, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39'),
(121, 'Mathew', 'Monahan', '1982-02-21', 'Female', 'B-', 'Hindu', 'Bangladeshi', '6696274875880', '01854789610', 'student121@example.com', '$2y$12$eiHyG9H7jOKV37ZmDuHrbucetf.6Y4sj.1gZJ/XoNn8nDWPNyk61W', '21909 Elva Mount\nMckennaton, MS 43099-9746', '9023 Armani Villages\nLake Zettaborough, NJ 34941-3581', 'ADM-00121', '1987-08-08', 'A', 'Science', '2025-2026', 'Runolfsson-Mayer School', 'Prof. Ben Block DVM', 'Engineer', '01648398610', 'father121@example.com', '4377781802394', NULL, 'Prof. Aditya Johns Jr.', 'Doctor', '01631771175', 'mother121@example.com', '0220296678223', NULL, 'Dr. Betsy Schneider IV', '01976677258', 'guardian121@example.com', '1193558279319', 'Brother', 1, 26, 2, '2025-12-20', NULL, 2025000121, 900121, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39', '127.0.0.1', 1, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39'),
(122, 'Felicia', 'Roob', '2004-06-24', 'Female', 'A-', 'Christian', 'Bangladeshi', '8989169795830', '01719918554', 'student122@example.com', '$2y$12$4jbFpuZyK.eFcb6nrqt4r.7dbt7x2LOQIaOmZuN8gTtqPnyaci0Ym', '19037 Destini Plains Suite 700\nEast Ludwig, MT 16748-6638', '829 Freeman Hollow\nNorth Augustus, AK 52495', 'ADM-00122', '1998-06-02', 'C', 'Commerce', '2025-2026', 'Langosh-Stoltenberg School', 'Josiah Schumm', 'Engineer', '01796332140', 'father122@example.com', '0441166808848', NULL, 'Cassie Ortiz', 'Nurse', '01977431467', 'mother122@example.com', '1234659495298', NULL, 'Mervin Brakus', '01546224097', 'guardian122@example.com', '3609184160236', 'Uncle', 1, 26, 4, '2025-12-20', NULL, 2025000122, 900122, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39', '127.0.0.1', 1, NULL, '2025-12-20 08:34:39', '2025-12-20 08:34:39'),
(123, 'Brooklyn', 'Bogisich', '1987-08-08', 'Female', 'A-', 'Hindu', 'Bangladeshi', '5078804667851', '01566141300', 'student123@example.com', '$2y$12$PJNY29MCdrvwPT8FT5PgduBnyVEBWNtDi9w9NeRaLpDtOFz/HsIru', '12447 Jefferey Light\nDietrichfurt, MO 58381', '8894 Prosacco Summit\nLake Arden, MO 27488', 'ADM-00123', '1974-11-04', 'C', 'Commerce', '2025-2026', 'Bashirian, Jacobi and Leuschke School', 'Dr. Glennie Grady', 'Businessman', '01451063202', 'father123@example.com', '7462774053095', NULL, 'Jayne Dickens', 'Housewife', '01856346360', 'mother123@example.com', '3065403034336', NULL, 'Stephan Blick', '01853142348', 'guardian123@example.com', '9768355192202', 'Sister', 1, 22, 5, '2025-12-20', NULL, 2025000123, 900123, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40', '127.0.0.1', 1, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40'),
(124, 'Selena', 'Kuphal', '1982-09-17', 'Other', 'AB-', 'Christian', 'Bangladeshi', '7538055227636', '01700398463', 'student124@example.com', '$2y$12$go7HPCVXfCqIFfjr4/i5sOOpghoF0xVWQoXy.qrU6EQP8R2yAriqW', '5263 Reuben Mills Apt. 570\nPadbergberg, OK 44670', '8194 Doyle Way\nEbertbury, AL 20309', 'ADM-00124', '1977-12-05', 'A', 'Arts', '2025-2026', 'Jaskolski PLC School', 'Dr. Juwan Heidenreich', 'Engineer', '01336381141', 'father124@example.com', '7665193296603', NULL, 'Amelie Hayes DDS', 'Housewife', '01321776119', 'mother124@example.com', '0094618139124', NULL, 'Dean Abbott', '01348009340', 'guardian124@example.com', '2043201616742', 'Grandparent', 1, 23, 5, '2025-12-20', NULL, 2025000124, 900124, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40', '127.0.0.1', 1, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40'),
(125, 'Eloisa', 'Bauch', '1994-07-09', 'Male', 'B-', 'Christian', 'Bangladeshi', '7830111685774', '01390904485', 'student125@example.com', '$2y$12$GbeRQWxad/wadlwuWZXpxeSx0TXIcFxy0h6xZ9zvLJNUecDDq7nJi', '3758 Fisher Squares\nZechariahburgh, HI 28157', '999 Simonis Garden\nNew Peter, MT 88054-0141', 'ADM-00125', '1986-01-27', 'C', 'Science', '2025-2026', 'Murphy-Thompson School', 'Prof. Lenny Thiel PhD', 'Teacher', '01595145499', 'father125@example.com', '6373283887961', NULL, 'Nya West', 'Doctor', '01691090520', 'mother125@example.com', '9191047741051', NULL, 'Janis Gleichner', '01929822958', 'guardian125@example.com', '2566157920081', 'Grandparent', 1, 24, 5, '2025-12-20', NULL, 2025000125, 900125, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40', '127.0.0.1', 1, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40'),
(126, 'Russ', 'Kuvalis', '2007-03-21', 'Female', 'AB+', 'Islam', 'Bangladeshi', '7228801173466', '01830756271', 'student126@example.com', '$2y$12$vpvTzlK.tml6KOLFHToD4.Iow.q10kyuXV7sDi5MzU57s8/stt9Aq', '948 Douglas Fords\nStrosinchester, NE 92580', '5974 Gleichner Villages Suite 028\nLake Tyshawn, KS 68607', 'ADM-00126', '2015-03-12', 'B', 'Arts', '2025-2026', 'Strosin Group School', 'Dr. Sage Moen III', 'Engineer', '01872206604', 'father126@example.com', '4300131764687', NULL, 'Mrs. Blanca Huels', 'Teacher', '01470247834', 'mother126@example.com', '2710909617216', NULL, 'Lauren Padberg', '01836919336', 'guardian126@example.com', '2353403895156', 'Uncle', 1, 27, 2, '2025-12-20', NULL, 2025000126, 900126, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40', '127.0.0.1', 1, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40'),
(127, 'Muhammad', 'Waters', '1982-05-29', 'Female', 'A-', 'Christian', 'Bangladeshi', '1601568236114', '01385630626', 'student127@example.com', '$2y$12$jtfcJ.QdU6METvkq9/qSd.zchl7R2VapYqhe.VT8NOcfkS8Dnn6rW', '5566 Gusikowski Causeway\nMargretland, CT 90300-6271', '98787 Orland Mountains Apt. 669\nWinnifredville, MI 83290', 'ADM-00127', '1978-03-17', 'B', 'Science', '2025-2026', 'Torphy Inc School', 'Prof. Alexandro O\'Hara', 'Farmer', '01669574979', 'father127@example.com', '8907684439283', NULL, 'Mrs. Candice Spinka', 'Doctor', '01805907829', 'mother127@example.com', '9256636812467', NULL, 'Skylar Daugherty', '01405285388', 'guardian127@example.com', '3269037118157', 'Uncle', 1, 25, 5, '2025-12-20', NULL, 2025000127, 900127, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40', '127.0.0.1', 1, NULL, '2025-12-20 08:34:40', '2025-12-20 08:34:40'),
(128, 'Kiley', 'Emmerich', '2008-03-14', 'Other', 'B+', 'Christian', 'Bangladeshi', '7152867056552', '01676390488', 'student128@example.com', '$2y$12$GtwPHtmbqFnZi0QI1WJOvu0mLHP9WCbZb1DvhvTvg01f.i4mPzMnK', '96071 Theodora Creek Apt. 220\nGutmannville, KY 28643-5884', '84234 Everett Camp Apt. 505\nLake Evangeline, WA 17936', 'ADM-00128', '2011-12-07', 'C', 'Science', '2025-2026', 'Gibson-Swift School', 'Prof. Enid Schuster DDS', 'Businessman', '01725906518', 'father128@example.com', '4358275361101', NULL, 'Prof. Anabelle Kutch', 'Doctor', '01823417280', 'mother128@example.com', '4268764839171', NULL, 'Tre Kunde', '01666819178', 'guardian128@example.com', '3386515603153', 'Aunt', 1, 23, 3, '2025-12-20', NULL, 2025000128, 900128, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41', '127.0.0.1', 1, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41'),
(129, 'Isabella', 'Kilback', '2024-06-22', 'Female', 'B+', 'Other', 'Bangladeshi', '1792302497618', '01998798988', 'student129@example.com', '$2y$12$gqG7i44R1Yhxw/lGj/s3KOR0OOV3UWwany3WMKyZmv3aB.SuK3eUO', '3921 Greenholt Cape Suite 012\nMyrtisshire, NY 39707', '505 Aiden Wells Suite 867\nLake Josephinehaven, RI 87890', 'ADM-00129', '1991-03-02', 'A', 'Arts', '2025-2026', 'Davis PLC School', 'Prof. Joel West I', 'Doctor', '01487360432', 'father129@example.com', '1134975067251', NULL, 'Vivian Beer', 'Businesswoman', '01696213417', 'mother129@example.com', '6359179550382', NULL, 'Ms. Bernadine Shields I', '01656737529', 'guardian129@example.com', '2745428783686', 'Grandparent', 1, 28, 1, '2025-12-20', NULL, 2025000129, 900129, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41', '127.0.0.1', 1, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41'),
(130, 'Delpha', 'Gusikowski', '1971-01-01', 'Male', 'O-', 'Hindu', 'Bangladeshi', '0397840120008', '01948554866', 'student130@example.com', '$2y$12$UR62j7fVnNTde0og5LtiB.47Q9yowxeMlXiNeZ9NTsk5MPjvqHXTO', '122 Kris Skyway Suite 803\nSchneiderport, PA 58372', '39629 Zemlak Cliff\nHoegerberg, NE 37897-3283', 'ADM-00130', '2019-05-06', 'A', 'Science', '2025-2026', 'Mueller-Altenwerth School', 'Francisco Mante', 'Engineer', '01555682098', 'father130@example.com', '4024311435038', NULL, 'Prof. Kristin Hirthe DVM', 'Housewife', '01950815351', 'mother130@example.com', '4954857373765', NULL, 'Prof. Lloyd Buckridge DDS', '01404792270', 'guardian130@example.com', '8382834892019', 'Uncle', 1, 28, 2, '2025-12-20', NULL, 2025000130, 900130, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41', '127.0.0.1', 1, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41'),
(131, 'Araceli', 'Schimmel', '2025-09-02', 'Male', 'O+', 'Christian', 'Bangladeshi', '8440294022232', '01601455003', 'student131@example.com', '$2y$12$TwIqT5hTlggH.ABT6gNU3uVX54xkcUGc6z1Yw/iOLNdvyptq4BWcu', '574 Obie Spring Suite 231\nDouglasburgh, ID 24108-3251', '8708 Linnea Green\nSchaefermouth, MS 19923-7230', 'ADM-00131', '2024-07-19', 'B', 'Science', '2025-2026', 'Bins, Hegmann and Wehner School', 'Dr. Orval Smitham', 'Engineer', '01452870355', 'father131@example.com', '2605423026216', NULL, 'Kiara Ebert', 'Housewife', '01686492823', 'mother131@example.com', '5630316471410', NULL, 'Kyler Blick DDS', '01479466282', 'guardian131@example.com', '9825307233873', 'Brother', 1, 26, 5, '2025-12-20', NULL, 2025000131, 900131, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41', '127.0.0.1', 1, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41'),
(132, 'Aliza', 'Klocko', '2014-07-11', 'Male', 'O+', 'Other', 'Bangladeshi', '2095675649943', '01367794365', 'student132@example.com', '$2y$12$q9OL1tPALFs8R8t8Lur9M.PWushkpcVXY5GmPxFozljNAI/0lSX/6', '112 Kenyatta Locks Suite 675\nSouth Dagmar, LA 27584-3315', '2964 Brandy Fall Apt. 816\nFishermouth, ID 54201', 'ADM-00132', '1984-12-14', 'A', 'Arts', '2025-2026', 'Runolfsdottir-Boehm School', 'Cyril Bruen', 'Doctor', '01593028822', 'father132@example.com', '9970684703074', NULL, 'Josianne Funk', 'Nurse', '01894658431', 'mother132@example.com', '0377717062238', NULL, 'Prof. Armani Runte II', '01719012290', 'guardian132@example.com', '1600387158589', 'Grandparent', 1, 27, 4, '2025-12-20', NULL, 2025000132, 900132, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41', '127.0.0.1', 1, NULL, '2025-12-20 08:34:41', '2025-12-20 08:34:41'),
(133, 'Jason', 'Braun', '2016-08-12', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '4958160536884', '01915733421', 'student133@example.com', '$2y$12$hxY/zg4puGfxOIH6H3BMAOKJ1vHq5VKHr8LVHe1GB/LRIyk8oRBte', '3517 Lonie Oval\nMacejkovichaven, NJ 07103', '219 Macejkovic Grove\nWaelchiburgh, HI 97170', 'ADM-00133', '2012-04-28', 'C', 'Commerce', '2025-2026', 'Sauer, Blick and Kub School', 'Camren Osinski', 'Businessman', '01642241281', 'father133@example.com', '2413553690377', NULL, 'Chelsie Ullrich', 'Doctor', '01914339333', 'mother133@example.com', '6914479854867', NULL, 'Yvette Moen', '01975742344', 'guardian133@example.com', '8097833351194', 'Brother', 1, 28, 4, '2025-12-20', NULL, 2025000133, 900133, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42', '127.0.0.1', 1, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42'),
(134, 'Sally', 'Maggio', '1977-03-15', 'Other', 'A-', 'Islam', 'Bangladeshi', '8621238143031', '01551003150', 'student134@example.com', '$2y$12$YRslYh.UgDP4avvf4HrB7OEeSRrp/JOHDFtk0VrkPR32LxA2WhgrW', '566 Mary Oval Apt. 227\nSouth Elenorview, VT 15936-1873', '731 Kelvin Villages\nLake Zachary, MS 99775', 'ADM-00134', '2021-07-25', 'C', 'Science', '2025-2026', 'Schaefer and Sons School', 'Peyton Morissette', 'Engineer', '01327634480', 'father134@example.com', '2274439610952', NULL, 'Aliza Romaguera', 'Housewife', '01568545668', 'mother134@example.com', '3081316565364', NULL, 'Ofelia Runolfsdottir', '01893039189', 'guardian134@example.com', '1644911356022', 'Sister', 1, 27, 5, '2025-12-20', NULL, 2025000134, 900134, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42', '127.0.0.1', 1, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42'),
(135, 'Mikayla', 'Turcotte', '1993-03-17', 'Female', 'AB+', 'Buddhist', 'Bangladeshi', '6207526505966', '01895111246', 'student135@example.com', '$2y$12$Ea6.fm6XUMPEIa2hoQMgb.QWw3iJSTassY2jsO2tKan/M/GOqPEES', '53181 Schmidt Drive Suite 019\nSouth Whitney, KS 41894', '476 Sawayn Summit\nSouth Coralie, NJ 77489-7414', 'ADM-00135', '1976-05-31', 'A', 'Arts', '2025-2026', 'Hills, Stoltenberg and Koepp School', 'Prof. Issac Konopelski', 'Farmer', '01326094046', 'father135@example.com', '3199694557123', NULL, 'Alivia Towne', 'Doctor', '01617091902', 'mother135@example.com', '2097158233506', NULL, 'Jessie Hermiston', '01535146837', 'guardian135@example.com', '1208774280759', 'Uncle', 1, 24, 3, '2025-12-20', NULL, 2025000135, 900135, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42', '127.0.0.1', 1, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42'),
(136, 'Celine', 'Olson', '2019-12-18', 'Other', 'A-', 'Christian', 'Bangladeshi', '3893558828112', '01808673409', 'student136@example.com', '$2y$12$KStZQBhrEMKrQqph99lLve08PQS6deE5uuQgieoZBTtKzgZmB2PbK', '407 Alexanne Mountains\nDuBuqueland, UT 39110-7730', '350 Grayce Isle Apt. 695\nWest Rubenport, DC 74975-5262', 'ADM-00136', '1978-06-17', 'B', 'Science', '2025-2026', 'Barton, Rippin and Romaguera School', 'Noble Hackett', 'Farmer', '01463278143', 'father136@example.com', '4217168367294', NULL, 'Marcelina Block', 'Doctor', '01367634531', 'mother136@example.com', '2316045641572', NULL, 'Joanne Ziemann', '01478422829', 'guardian136@example.com', '0170560336205', 'Sister', 1, 29, 1, '2025-12-20', NULL, 2025000136, 900136, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42', '127.0.0.1', 1, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42'),
(137, 'Sigurd', 'Orn', '1989-09-11', 'Other', 'B+', 'Islam', 'Bangladeshi', '0318348485454', '01715904321', 'student137@example.com', '$2y$12$v23LB5rWpZyO8udq.zD0AOSfwN6V3esx8tggGDE5YvVYKk6h58meO', '198 Breitenberg Crossroad\nMozellemouth, VA 20499', '2325 Ethan Cape\nPort Reyna, MS 12901', 'ADM-00137', '1998-07-04', 'A', 'Science', '2025-2026', 'Mueller-Welch School', 'Mr. Jerel Barrows Sr.', 'Farmer', '01896729684', 'father137@example.com', '4647170825804', NULL, 'Ivy Skiles DVM', 'Housewife', '01508716734', 'mother137@example.com', '7216167662808', NULL, 'Mr. Myles Ullrich', '01836826842', 'guardian137@example.com', '8688459184468', 'Sister', 1, 29, 2, '2025-12-20', NULL, 2025000137, 900137, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42', '127.0.0.1', 1, NULL, '2025-12-20 08:34:42', '2025-12-20 08:34:42'),
(138, 'Lennie', 'Purdy', '2020-10-12', 'Male', 'A-', 'Islam', 'Bangladeshi', '3008528022796', '01505611795', 'student138@example.com', '$2y$12$9VAYNLkc5lDbkctOH2FT9.E3oc/HvZWW63sfXmhFir7IubbwcYtWO', '83210 Rutherford Ridges\nWunschfurt, CA 41195-4280', '8241 Trenton Estate\nBalistrerishire, TN 21884-3303', 'ADM-00138', '1971-11-26', 'C', 'Science', '2025-2026', 'Feest, Hermiston and Bailey School', 'Archibald Rowe', 'Businessman', '01843088004', 'father138@example.com', '7070771380944', NULL, 'Janae Funk', 'Businesswoman', '01841913624', 'mother138@example.com', '5749381243493', NULL, 'Piper Metz', '01831306338', 'guardian138@example.com', '7257704261737', 'Grandparent', 1, 25, 3, '2025-12-20', NULL, 2025000138, 900138, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43', '127.0.0.1', 1, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43'),
(139, 'Godfrey', 'Hodkiewicz', '1971-06-28', 'Male', 'O-', 'Islam', 'Bangladeshi', '7346906609144', '01550746873', 'student139@example.com', '$2y$12$Wv6ELXPAd/1U/12ODbKHMeI1nR98KwcxJZbfDL1I6J86eGVWMbmO6', '181 Goyette Ferry\nAlysatown, IL 49946-2125', '2482 Carleton Manor Suite 087\nKuvalisburgh, WY 74909-1305', 'ADM-00139', '2018-09-01', 'C', 'Commerce', '2025-2026', 'Jaskolski LLC School', 'Dr. Mohammed Ritchie', 'Engineer', '01608152986', 'father139@example.com', '5552449853692', NULL, 'Dr. Aryanna Marquardt I', 'Teacher', '01861985935', 'mother139@example.com', '9275401057801', NULL, 'Jerrod Lemke', '01606143717', 'guardian139@example.com', '9242710916058', 'Uncle', 1, 26, 3, '2025-12-20', NULL, 2025000139, 900139, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43', '127.0.0.1', 1, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43'),
(140, 'Margarete', 'Bayer', '2021-05-25', 'Male', 'O+', 'Islam', 'Bangladeshi', '1132929033278', '01391779884', 'student140@example.com', '$2y$12$mWvsasIIri3RlCe8SuGQUuZFaPIYL0sLj8oBwyiNc2OVJzv.aITvG', '5086 Prohaska Canyon\nNorth Laisha, MI 08174-0760', '38818 Alycia Squares Suite 059\nTurnerfort, RI 22955-8596', 'ADM-00140', '1977-07-11', 'B', 'Commerce', '2025-2026', 'Murray LLC School', 'Jake Howell Sr.', 'Engineer', '01405489506', 'father140@example.com', '5441141579064', NULL, 'Anabelle Miller', 'Nurse', '01346915232', 'mother140@example.com', '7205170971972', NULL, 'Prof. Ron Johns', '01644044919', 'guardian140@example.com', '8562163786314', 'Grandparent', 1, 30, 1, '2025-12-20', NULL, 2025000140, 900140, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43', '127.0.0.1', 1, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43'),
(141, 'Reanna', 'DuBuque', '1979-12-04', 'Female', 'O+', 'Islam', 'Bangladeshi', '5656472517358', '01698369918', 'student141@example.com', '$2y$12$L3abvss3CtvtfrPo1jC3V./TnmtaypYSiY6V02OcRIT6xOZFsprWK', '9750 Jevon Fall Suite 014\nJettieland, PA 07632-6111', '4821 German Radial\nEast Jerel, GA 54467-8135', 'ADM-00141', '2007-01-15', 'A', 'Commerce', '2025-2026', 'Berge Ltd School', 'Prof. Nikolas Schaefer', 'Teacher', '01689368413', 'father141@example.com', '2570641998076', NULL, 'Miss Emmanuelle Dach', 'Doctor', '01337549730', 'mother141@example.com', '1688116120041', NULL, 'Edgardo Homenick', '01394486376', 'guardian141@example.com', '3160387562263', 'Brother', 1, 27, 3, '2025-12-20', NULL, 2025000141, 900141, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43', '127.0.0.1', 1, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43'),
(142, 'Walter', 'Rodriguez', '1972-08-05', 'Other', 'A+', 'Islam', 'Bangladeshi', '3929690366092', '01656226944', 'student142@example.com', '$2y$12$sLI34miQML2ctyYdOEk.POc.tSkoKoxBU42J12W8Dik3HMqQcmebi', '558 Hayes Fords Apt. 293\nRowehaven, NJ 38248', '4301 Liam Shoal Suite 222\nNorth Svenhaven, NM 39762', 'ADM-00142', '1985-03-16', 'C', 'Commerce', '2025-2026', 'Collins and Sons School', 'Demario Dare', 'Teacher', '01742444162', 'father142@example.com', '1005923937566', NULL, 'Dr. Kimberly Franecki IV', 'Nurse', '01651676178', 'mother142@example.com', '8833797122910', NULL, 'Mrs. Leta Abernathy II', '01458379138', 'guardian142@example.com', '7548326047801', 'Brother', 1, 30, 2, '2025-12-20', NULL, 2025000142, 900142, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43', '127.0.0.1', 1, NULL, '2025-12-20 08:34:43', '2025-12-20 08:34:43'),
(143, 'Mariam', 'Koepp', '2008-04-20', 'Other', 'O-', 'Christian', 'Bangladeshi', '8157946532429', '01654556296', 'student143@example.com', '$2y$12$5AaJgoNCMtaBLwKdHQ2Pq.kvC2Mx4LbjGp7mjCHBDldz8zk6AXide', '90031 Hegmann Turnpike\nEast Estefaniaborough, OR 28746-7114', '631 Watsica Haven Suite 515\nKenberg, NY 99972-3124', 'ADM-00143', '1980-07-14', 'B', 'Arts', '2025-2026', 'Hartmann, Pfeffer and Runolfsson School', 'Prof. Wellington Prohaska', 'Engineer', '01394022022', 'father143@example.com', '2357751411226', NULL, 'Ava Gulgowski Jr.', 'Doctor', '01992827366', 'mother143@example.com', '2706433361283', NULL, 'Prof. Felton Frami', '01743616467', 'guardian143@example.com', '4495097600010', 'Aunt', 1, 29, 4, '2025-12-20', NULL, 2025000143, 900143, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44', '127.0.0.1', 1, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44'),
(144, 'Maritza', 'Berge', '1986-10-30', 'Other', 'A-', 'Christian', 'Bangladeshi', '8597202130979', '01629226989', 'student144@example.com', '$2y$12$pRaTilsOrLwZFAhTJLqx1eFLvDOXKrgiZUPNs75ipx0K2vZRcoQhq', '64567 Naomi Terrace\nMissouriside, VT 38728-6884', '126 Bins Meadow Apt. 699\nBilliefurt, KS 42429', 'ADM-00144', '1977-04-03', 'C', 'Science', '2025-2026', 'Fisher Group School', 'Enrique Abernathy III', 'Businessman', '01393854439', 'father144@example.com', '1924678141618', NULL, 'Laura Spinka III', 'Housewife', '01564004927', 'mother144@example.com', '6038843611475', NULL, 'May Larson MD', '01444388817', 'guardian144@example.com', '7453008668185', 'Uncle', 1, 31, 1, '2025-12-20', NULL, 2025000144, 900144, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44', '127.0.0.1', 1, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44'),
(145, 'Zion', 'Treutel', '1986-06-17', 'Female', 'A+', 'Hindu', 'Bangladeshi', '6067309647641', '01841580150', 'student145@example.com', '$2y$12$KGWR4Xad9ZWdQ9iPGR0NqO9GELG21SG0i5ZevG5NLziBVXjigSnKG', '135 Stokes Locks Suite 401\nGreenholtmouth, ME 98442-7976', '21087 Kautzer Prairie\nLake Keatonchester, NE 23494', 'ADM-00145', '2015-07-23', 'A', 'Arts', '2025-2026', 'McClure, Koelpin and Goyette School', 'Reggie Hilpert MD', 'Engineer', '01795178514', 'father145@example.com', '1944395941276', NULL, 'Ms. Carole Ratke', 'Businesswoman', '01717904546', 'mother145@example.com', '2424207229484', NULL, 'Yasmeen McDermott', '01491820449', 'guardian145@example.com', '1888800774478', 'Uncle', 1, 31, 2, '2025-12-20', NULL, 2025000145, 900145, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44', '127.0.0.1', 1, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44'),
(146, 'Cecelia', 'Effertz', '2002-12-29', 'Male', 'B+', 'Buddhist', 'Bangladeshi', '7928531436272', '01927457808', 'student146@example.com', '$2y$12$jwTV9OzihYP0/wZ.Uzgs/efmJ.Vex6EvczB.hI1cJPjXD.UhgA5ia', '15143 Goodwin Prairie Apt. 623\nHilpertfurt, OR 26563-7465', '311 Harris Radial Suite 646\nLonshire, CT 46420', 'ADM-00146', '1970-05-29', 'B', 'Arts', '2025-2026', 'Miller, Kilback and Cummings School', 'Deion DuBuque', 'Farmer', '01741801836', 'father146@example.com', '8860917995821', NULL, 'Maia Moore MD', 'Nurse', '01724729505', 'mother146@example.com', '6282478771813', NULL, 'Dr. Nestor Renner DVM', '01595349191', 'guardian146@example.com', '2384560050969', 'Grandparent', 1, 28, 3, '2025-12-20', NULL, 2025000146, 900146, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44', '127.0.0.1', 1, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44'),
(147, 'William', 'O\'Hara', '1999-07-14', 'Male', 'B-', 'Hindu', 'Bangladeshi', '5443634953342', '01936204449', 'student147@example.com', '$2y$12$Y/JEVYnZM2iup5mR.kqhY.yF40BsrCmRH/G0kFHd3COzkX74G/KY6', '844 Sebastian Forges\nKenyonport, FL 08297-5994', '70198 Orn Place Apt. 309\nEffertzside, ME 20280', 'ADM-00147', '1981-12-10', 'B', 'Commerce', '2025-2026', 'Predovic-O\'Kon School', 'Mr. Bo Williamson DVM', 'Doctor', '01886684370', 'father147@example.com', '1985457190272', NULL, 'Prof. Karli Kris', 'Businesswoman', '01764941753', 'mother147@example.com', '9055261166130', NULL, 'Prof. Bette Rohan I', '01423094875', 'guardian147@example.com', '0064126464812', 'Grandparent', 1, 28, 5, '2025-12-20', NULL, 2025000147, 900147, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44', '127.0.0.1', 1, NULL, '2025-12-20 08:34:44', '2025-12-20 08:34:44'),
(148, 'Rosalee', 'Erdman', '1982-08-06', 'Female', 'AB+', 'Hindu', 'Bangladeshi', '3374553467644', '01598996256', 'student148@example.com', '$2y$12$KFemFXrtrni.8h.7lzd41eHxnvaJPUBAAXBSgA4Aqn3AhQSqa.A7C', '426 Josiah Port Apt. 058\nSouth Eulalia, WV 22689-8369', '71107 Justus Square\nBartholomeland, WV 20888', 'ADM-00148', '1974-08-09', 'A', 'Arts', '2025-2026', 'Brown PLC School', 'Cortez Rice', 'Businessman', '01374379835', 'father148@example.com', '0440836620239', NULL, 'Frederique Sawayn Jr.', 'Teacher', '01515965079', 'mother148@example.com', '9160079214368', NULL, 'Gertrude McKenzie', '01504788919', 'guardian148@example.com', '7032282413139', 'Sister', 1, 29, 3, '2025-12-20', NULL, 2025000148, 900148, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45', '127.0.0.1', 1, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45'),
(149, 'Joseph', 'Trantow', '1997-10-20', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '9659661262967', '01315029477', 'student149@example.com', '$2y$12$V4I8k1WxVUl/dPFK5EUa5.LZCI82sZAMXFontF8wqVrUa1JhrX4..', '423 Nya Forest Apt. 103\nPort Esta, DC 83739', '9342 Abshire Fords Suite 926\nWest Guido, CA 66071-6010', 'ADM-00149', '2001-04-28', 'B', 'Commerce', '2025-2026', 'Kub-Maggio School', 'Jesse Kirlin', 'Teacher', '01759934415', 'father149@example.com', '6233242261685', NULL, 'Miss Kacie Satterfield', 'Doctor', '01437182844', 'mother149@example.com', '6065893412031', NULL, 'Prof. Stephany Murazik', '01596037979', 'guardian149@example.com', '4129908401154', 'Brother', 1, 30, 4, '2025-12-20', NULL, 2025000149, 900149, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45', '127.0.0.1', 1, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45'),
(150, 'Mercedes', 'Heaney', '2022-06-15', 'Female', 'AB-', 'Christian', 'Bangladeshi', '5196684776955', '01871727751', 'student150@example.com', '$2y$12$4Pen34/wFTGJIJgVSHr60OSyhMXSbo31IBKi3QSQQiV8gYXCWgAwS', '465 Bruen Well Apt. 243\nWest Bertrandville, MT 29487-8003', '851 Murray Roads\nBergeside, TX 75222-1204', 'ADM-00150', '2005-03-04', 'C', 'Arts', '2025-2026', 'Beatty, Thiel and Morar School', 'Leonard Johnston', 'Doctor', '01790646176', 'father150@example.com', '5453580107204', NULL, 'Dr. Kavon Blick MD', 'Teacher', '01437993848', 'mother150@example.com', '1146077481750', NULL, 'Shaina Ferry', '01730843282', 'guardian150@example.com', '4832838085002', 'Grandparent', 1, 29, 5, '2025-12-20', NULL, 2025000150, 900150, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45', '127.0.0.1', 1, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45'),
(151, 'Carlee', 'Konopelski', '1988-06-01', 'Other', 'O-', 'Other', 'Bangladeshi', '4948641588181', '01857321445', 'student151@example.com', '$2y$12$BnvEYm1nZLX1ouf/MM/4N.uPNYR0VV.FqzkHfx6a5zsaKzzCzsYJy', '243 Jacobson Greens Apt. 796\nMurphyberg, AK 68180-9392', '50360 Tromp Radial\nNew Melba, WA 92746', 'ADM-00151', '2012-08-21', 'A', 'Science', '2025-2026', 'Huel-Hoppe School', 'Prof. Dusty Wiza', 'Doctor', '01765580152', 'father151@example.com', '8996453810038', NULL, 'Mariela Gislason', 'Teacher', '01990099600', 'mother151@example.com', '2288343570373', NULL, 'Miss Leslie Rempel', '01555880682', 'guardian151@example.com', '1756652291545', 'Grandparent', 1, 31, 4, '2025-12-20', NULL, 2025000151, 900151, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45', '127.0.0.1', 1, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45'),
(152, 'Makenzie', 'Welch', '1982-02-06', 'Female', 'O-', 'Christian', 'Bangladeshi', '3127323268028', '01317222738', 'student152@example.com', '$2y$12$AcptcT6Ml6gV1RF4xrt0x.JoIMmr3xFF3NCt8NfTMfUrv34g3OY06', '672 Paul Walks\nEricland, OH 76125-8040', '272 Berniece Haven Suite 824\nNorth Americamouth, VT 51052-3557', 'ADM-00152', '1977-01-23', 'A', 'Arts', '2025-2026', 'Cole, Schuster and Wiegand School', 'Marcellus Fahey', 'Businessman', '01885242812', 'father152@example.com', '2963302220073', NULL, 'Mayra Lebsack', 'Teacher', '01831622458', 'mother152@example.com', '9688403726906', NULL, 'Mr. Maximillian Upton V', '01533282352', 'guardian152@example.com', '3424350948169', 'Sister', 1, 30, 5, '2025-12-20', NULL, 2025000152, 900152, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45', '127.0.0.1', 1, NULL, '2025-12-20 08:34:45', '2025-12-20 08:34:45'),
(153, 'Annamae', 'Wilderman', '1978-12-01', 'Other', 'O-', 'Buddhist', 'Bangladeshi', '6892639586569', '01387782357', 'student153@example.com', '$2y$12$P3tXwXzkZr.uhcXW68A0aOfGGUmhfXV7iTECH6FQMM3k0E6Jr1/ji', '40113 Hildegard Prairie Suite 040\nSteubershire, SC 02587-7062', '157 McClure Street Apt. 740\nWest Kodyland, MN 21355-1874', 'ADM-00153', '1993-10-05', 'C', 'Arts', '2025-2026', 'Pollich PLC School', 'Mr. Juvenal Kris IV', 'Businessman', '01918984516', 'father153@example.com', '1190195833560', NULL, 'Shaniya Berge', 'Housewife', '01379040836', 'mother153@example.com', '2314551426762', NULL, 'Miss Alexandrine Wisoky', '01893520500', 'guardian153@example.com', '2947516746681', 'Uncle', 1, 32, 1, '2025-12-20', NULL, 2025000153, 900153, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46', '127.0.0.1', 1, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46'),
(154, 'Vicente', 'Trantow', '1988-01-26', 'Other', 'O-', 'Islam', 'Bangladeshi', '0299419844530', '01928238028', 'student154@example.com', '$2y$12$flivD/zuV3TTEYbStwzXq.AqUaXH0Dh9G56wHMVWizPfpUDbwXu1O', '361 Kessler Plaza\nSouth Alexzanderfort, ME 78787', '306 Weimann View\nWest Michele, AR 10183', 'ADM-00154', '1977-08-15', 'B', 'Commerce', '2025-2026', 'Johnson, Cormier and Morissette School', 'Ryder Homenick', 'Doctor', '01854558212', 'father154@example.com', '5689232520601', NULL, 'Dr. Bailee Gibson', 'Businesswoman', '01863814179', 'mother154@example.com', '8753834924274', NULL, 'Mr. Leopoldo Paucek IV', '01954856597', 'guardian154@example.com', '0355464898211', 'Grandparent', 1, 32, 2, '2025-12-20', NULL, 2025000154, 900154, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46', '127.0.0.1', 1, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46'),
(155, 'Carmelo', 'Runte', '1987-11-08', 'Female', 'A+', 'Other', 'Bangladeshi', '5405706053366', '01833166262', 'student155@example.com', '$2y$12$FRMeVvarXqPT05He5XFUbu4KoFo5/2P0RsRVi2oWdU7fGtuJTAl9u', '90847 Winfield Throughway Apt. 980\nSouth Ulices, HI 24919-1874', '7322 Elva Pass Suite 039\nWest Issacport, VT 84454-5588', 'ADM-00155', '1980-05-06', 'A', 'Arts', '2025-2026', 'Schmitt Group School', 'Colten Schuppe', 'Teacher', '01957535698', 'father155@example.com', '0887461496687', NULL, 'Ms. Rossie Wiza', 'Teacher', '01742302027', 'mother155@example.com', '7004509345553', NULL, 'Josie Kiehn', '01949146722', 'guardian155@example.com', '2288532998601', 'Brother', 1, 33, 1, '2025-12-20', NULL, 2025000155, 900155, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46', '127.0.0.1', 1, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46'),
(156, 'Jordyn', 'Lindgren', '2019-02-08', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '0396439007361', '01671000064', 'student156@example.com', '$2y$12$o.Cu69dX4EuJJULBj7E4Z./IgPkq55NNDayTp5wRP5xdieCqMkCYa', '4220 Reba Rue Suite 364\nWeissnatshire, IL 32808-6398', '4771 Shea Viaduct Apt. 436\nProhaskaview, MO 05314-8664', 'ADM-00156', '1998-12-16', 'B', 'Commerce', '2025-2026', 'Ullrich, Will and Buckridge School', 'Gregorio Jaskolski DVM', 'Engineer', '01890578069', 'father156@example.com', '5928738702881', NULL, 'Marge Deckow', 'Nurse', '01650313296', 'mother156@example.com', '5765986190285', NULL, 'Mya Lebsack', '01781943661', 'guardian156@example.com', '1668692276516', 'Brother', 1, 31, 5, '2025-12-20', NULL, 2025000156, 900156, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46', '127.0.0.1', 1, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46'),
(157, 'Herminia', 'Schroeder', '1994-03-14', 'Female', 'B+', 'Other', 'Bangladeshi', '1008864183498', '01723107396', 'student157@example.com', '$2y$12$EeZ3Xj5JJOe768b.LLkrKek61A/S4HKvOLF7Dm1syNssrJoQQiiK.', '26409 Ernie Street\nLindmouth, CO 88554-5768', '34510 Kris Rest\nAmbrosefurt, WA 86863', 'ADM-00157', '1993-08-17', 'A', 'Science', '2025-2026', 'O\'Conner Inc School', 'Elwin Hahn', 'Teacher', '01316419175', 'father157@example.com', '8642254636382', NULL, 'Elyssa Ruecker', 'Nurse', '01466589685', 'mother157@example.com', '9033126024949', NULL, 'Dr. Sedrick Green', '01555194282', 'guardian157@example.com', '5047803414726', 'Uncle', 1, 32, 4, '2025-12-20', NULL, 2025000157, 900157, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46', '127.0.0.1', 1, NULL, '2025-12-20 08:34:46', '2025-12-20 08:34:46'),
(158, 'Wendell', 'Schamberger', '2017-01-01', 'Female', 'O-', 'Other', 'Bangladeshi', '4476785079871', '01326704555', 'student158@example.com', '$2y$12$lTRUrL3nnFoLkm8xBCKkrOOAamAY2Xl7lPszXMtb7I9uLYAh8Gw5i', '55020 Schiller Burg Apt. 387\nRustystad, KS 71555-6658', '38401 Weimann Wells\nNew Tomasa, DC 25619', 'ADM-00158', '1979-07-31', 'A', 'Arts', '2025-2026', 'Block-Nikolaus School', 'Hyman Wintheiser', 'Doctor', '01833752775', 'father158@example.com', '9726287441997', NULL, 'Amiya Erdman DVM', 'Businesswoman', '01622453177', 'mother158@example.com', '9480466644655', NULL, 'Randall Roob', '01651050580', 'guardian158@example.com', '5500722521755', 'Grandparent', 1, 33, 2, '2025-12-20', NULL, 2025000158, 900158, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47', '127.0.0.1', 1, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47'),
(159, 'Jaclyn', 'Balistreri', '2010-08-01', 'Male', 'B+', 'Christian', 'Bangladeshi', '2289194547038', '01758589750', 'student159@example.com', '$2y$12$ldxoSPfrmMTKvcwlDu5FFefVVrIM.UnMrameiscdDQzAyxX2jw5Ni', '129 Christop Fields Suite 990\nSouth Lupe, IL 84250-2757', '27665 Will Islands Suite 821\nDaynamouth, DE 33013-8904', 'ADM-00159', '2004-04-22', 'A', 'Commerce', '2025-2026', 'Prohaska PLC School', 'Peyton Grady', 'Businessman', '01622877158', 'father159@example.com', '6916854702442', NULL, 'Otilia Keebler IV', 'Nurse', '01467529374', 'mother159@example.com', '0492196909306', NULL, 'Jordan Mante', '01513663642', 'guardian159@example.com', '0280208640283', 'Aunt', 1, 34, 2, '2025-12-20', NULL, 2025000159, 900159, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47', '127.0.0.1', 1, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47'),
(160, 'Elisha', 'O\'Reilly', '1985-06-26', 'Other', 'AB+', 'Other', 'Bangladeshi', '2400362700031', '01656511284', 'student160@example.com', '$2y$12$6hCzm/NeyNS4mHMb6Mccq.3GMAf4iDj1W/iSZ6wjLspERIgqTYfLK', '290 Dean Lane\nLueshire, VT 89901-8546', '7085 Carmine Corner\nNorth Roxanne, NE 42888', 'ADM-00160', '2010-02-08', 'A', 'Commerce', '2025-2026', 'Nader, Cremin and Stiedemann School', 'Dr. Doyle Carroll', 'Teacher', '01443343058', 'father160@example.com', '5953464426200', NULL, 'Mrs. Kaitlyn DuBuque', 'Businesswoman', '01549698120', 'mother160@example.com', '9222725360441', NULL, 'Vincenza Funk', '01564702778', 'guardian160@example.com', '8328754128791', 'Aunt', 1, 32, 5, '2025-12-20', NULL, 2025000160, 900160, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47', '127.0.0.1', 1, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47'),
(161, 'Lola', 'Marvin', '1989-11-18', 'Other', 'AB-', 'Other', 'Bangladeshi', '0756473528607', '01483207565', 'student161@example.com', '$2y$12$tEbhdfb4v4/4gCIK/Nbwdu.IfWpxs/3s822zt0f5cqGLrnDVzg.pq', '516 Darien Mount Suite 016\nBergstromberg, NH 55750-4188', '1827 Vito Street\nSouth Isadore, NY 42358', 'ADM-00161', '2005-05-18', 'B', 'Science', '2025-2026', 'Terry, Champlin and Rath School', 'Austyn Harber', 'Farmer', '01351464423', 'father161@example.com', '6071805947663', NULL, 'Mrs. Audreanne King I', 'Housewife', '01521251698', 'mother161@example.com', '2974402063464', NULL, 'Twila Torp', '01919189969', 'guardian161@example.com', '8753048560015', 'Brother', 1, 33, 5, '2025-12-20', NULL, 2025000161, 900161, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47', '127.0.0.1', 1, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47'),
(162, 'Clyde', 'Klocko', '2021-09-18', 'Male', 'AB+', 'Christian', 'Bangladeshi', '7505226774827', '01796378849', 'student162@example.com', '$2y$12$Ie0BmUtvlyL88QRLAZxqbeg76UpMENJR9XPgszQUPXOzuR2T19zRO', '2740 Darlene Causeway\nNicomouth, MI 71347-9757', '12848 Cole Walks Apt. 727\nWest Leonetown, ND 94897-5609', 'ADM-00162', '2018-10-24', 'C', 'Commerce', '2025-2026', 'Blick Group School', 'Ryder Crist', 'Teacher', '01833679685', 'father162@example.com', '1179844651574', NULL, 'Ellie Hintz', 'Nurse', '01355518121', 'mother162@example.com', '6130148331615', NULL, 'Agnes Jacobs', '01519751914', 'guardian162@example.com', '4584674443343', 'Grandparent', 1, 30, 3, '2025-12-20', NULL, 2025000162, 900162, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47', '127.0.0.1', 1, NULL, '2025-12-20 08:34:47', '2025-12-20 08:34:47'),
(163, 'Halle', 'Kovacek', '1978-02-17', 'Other', 'O+', 'Other', 'Bangladeshi', '1229968462464', '01807436113', 'student163@example.com', '$2y$12$GZh.y4I9dBLhbsVWL2JJkuMByvuZRIziQFASpogeQ5vQMajmlhnYS', '65590 Hulda Islands\nFilibertostad, MS 61537', '239 Daugherty Hill Apt. 444\nPort Cecelia, ME 25182', 'ADM-00163', '2015-03-23', 'C', 'Arts', '2025-2026', 'Carter LLC School', 'Justyn Jones', 'Businessman', '01428701882', 'father163@example.com', '8650926298101', NULL, 'Ashley Zemlak', 'Nurse', '01664187160', 'mother163@example.com', '1347166398711', NULL, 'Miss Lily Rodriguez DVM', '01421201032', 'guardian163@example.com', '5961090853948', 'Brother', 1, 34, 5, '2025-12-20', NULL, 2025000163, 900163, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48', '127.0.0.1', 1, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48'),
(164, 'Krystal', 'Leannon', '2019-12-28', 'Male', 'B-', 'Buddhist', 'Bangladeshi', '0555488284344', '01380424045', 'student164@example.com', '$2y$12$sQzTldjUhEUNP1/CE6yejO/zQIDz4UJ//Q6OE/NRp7Me6DJd6Qeuy', '510 Heidi Mills Apt. 883\nSouth Fredericview, AL 77806-5708', '246 Hank Knolls Suite 232\nLake Jimmie, ME 03857-8816', 'ADM-00164', '2024-10-19', 'B', 'Arts', '2025-2026', 'Dach Ltd School', 'Curtis Renner III', 'Engineer', '01921753303', 'father164@example.com', '2039567531275', NULL, 'Ciara Gottlieb', 'Businesswoman', '01434817839', 'mother164@example.com', '9042135920356', NULL, 'Prof. Doris Stracke', '01887664182', 'guardian164@example.com', '5498197199674', 'Uncle', 1, 33, 4, '2025-12-20', NULL, 2025000164, 900164, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48', '127.0.0.1', 1, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48'),
(165, 'Peyton', 'Flatley', '1990-01-13', 'Other', 'O-', 'Hindu', 'Bangladeshi', '0501640935800', '01881672650', 'student165@example.com', '$2y$12$3ANN8RrlKWYa9XqnGyXqIucMha/LS0oeHofAnIdUQAlBbwc6iDzyu', '830 Anabel Cove Apt. 344\nNew Joaquin, MN 94931', '99260 Obie Circle\nO\'Reillyberg, MS 71942', 'ADM-00165', '1989-06-07', 'C', 'Arts', '2025-2026', 'Wilkinson, Gibson and Bode School', 'Claud Rempel III', 'Businessman', '01344614106', 'father165@example.com', '8728525232801', NULL, 'Miss Dolores Towne DDS', 'Businesswoman', '01306731247', 'mother165@example.com', '5401608681574', NULL, 'Mr. Damien Russel I', '01451873849', 'guardian165@example.com', '4136620543689', 'Grandparent', 1, 35, 2, '2025-12-20', NULL, 2025000165, 900165, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48', '127.0.0.1', 1, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48'),
(166, 'Colby', 'Green', '2015-02-25', 'Male', 'O-', 'Islam', 'Bangladeshi', '2427043386913', '01403764316', 'student166@example.com', '$2y$12$sUpNx6AJZ57Ur5IZIAH47.BtWfpTxBShuAMMmnymQfZioBaQUiRY6', '82509 Grant Estates\nSouth Janiyaberg, MI 45908', '46545 Liliane Union Suite 540\nJaskolskiview, WY 51096-3598', 'ADM-00166', '2025-02-04', 'B', 'Arts', '2025-2026', 'Toy, Dicki and Veum School', 'Garth Schinner', 'Farmer', '01743686569', 'father166@example.com', '2562645577538', NULL, 'Amara Marvin', 'Teacher', '01637456589', 'mother166@example.com', '3571044827780', NULL, 'Casimir Olson', '01524741460', 'guardian166@example.com', '6313146534981', 'Aunt', 1, 31, 3, '2025-12-20', NULL, 2025000166, 900166, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48', '127.0.0.1', 1, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48'),
(167, 'Otilia', 'Pouros', '1997-03-08', 'Other', 'AB+', 'Islam', 'Bangladeshi', '3654473518228', '01566148448', 'student167@example.com', '$2y$12$TU4/3iOO.S3zyxpb72bcjOtO7um0nUArbAFzSRIYazuQrxm536qji', '559 Alfonso Meadows Suite 191\nSouth Keaganmouth, MI 57193-9987', '92807 Van Pass\nSkyeberg, SC 95647', 'ADM-00167', '1997-02-20', 'A', 'Arts', '2025-2026', 'Johnston-Kulas School', 'Keyshawn Kozey Jr.', 'Farmer', '01683818460', 'father167@example.com', '9824451154309', NULL, 'Mrs. Elena Boyer III', 'Doctor', '01630785873', 'mother167@example.com', '9404046324162', NULL, 'Cristobal Abshire', '01323742483', 'guardian167@example.com', '1542808043534', 'Aunt', 1, 34, 1, '2025-12-20', NULL, 2025000167, 900167, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48', '127.0.0.1', 1, NULL, '2025-12-20 08:34:48', '2025-12-20 08:34:48'),
(168, 'Bernhard', 'Greenfelder', '2017-04-12', 'Male', 'B-', 'Islam', 'Bangladeshi', '4089651002709', '01865041348', 'student168@example.com', '$2y$12$bB2yiy1Qf.3A5Z6/2HPyx.5lwW3fMsdh77U58aDm8sZHi2JN55xOm', '800 Jovan Bridge Suite 520\nDewittberg, CA 44110-2398', '75397 Birdie Ranch\nJarredbury, SC 78064-8467', 'ADM-00168', '1996-03-09', 'C', 'Science', '2025-2026', 'O\'Kon and Sons School', 'Mr. Clair Cruickshank', 'Farmer', '01568988922', 'father168@example.com', '5309766568864', NULL, 'Lera Oberbrunner', 'Nurse', '01787147848', 'mother168@example.com', '8990715651579', NULL, 'Colten Schaefer', '01506025280', 'guardian168@example.com', '9323655337183', 'Brother', 1, 32, 3, '2025-12-20', NULL, 2025000168, 900168, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49', '127.0.0.1', 1, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(169, 'Elwyn', 'Hoppe', '2012-05-31', 'Other', 'A-', 'Hindu', 'Bangladeshi', '7386219459065', '01377258691', 'student169@example.com', '$2y$12$rp/wc7E46dKTKr6EeV7w2OQB17smKKRfwhi0VdELHLupF6BxnueMK', '384 Janessa River Suite 971\nPort Genevieve, WI 41977-4864', '6607 Teresa Glen\nNew Miller, WV 90243', 'ADM-00169', '2000-11-17', 'A', 'Arts', '2025-2026', 'Trantow Inc School', 'Carmelo Walsh', 'Farmer', '01387496263', 'father169@example.com', '1820820848166', NULL, 'Destini Hodkiewicz DDS', 'Housewife', '01379903340', 'mother169@example.com', '0324825766551', NULL, 'Judson Johns', '01653361882', 'guardian169@example.com', '0354124808150', 'Brother', 1, 35, 1, '2025-12-20', NULL, 2025000169, 900169, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49', '127.0.0.1', 1, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49'),
(170, 'Markus', 'Smitham', '1972-08-30', 'Female', 'O-', 'Other', 'Bangladeshi', '2831563369953', '01987132039', 'student170@example.com', '$2y$12$wYirJMUFqOiZQTNyVWUuNOMgkKRipx.EM2AZGC1yZGfG1CC.H78DK', '32807 Nestor Summit\nEast Anabel, CO 74140', '84063 Otho Lights\nBrycefort, IA 37145', 'ADM-00170', '1997-03-09', 'A', 'Arts', '2025-2026', 'Cruickshank and Sons School', 'Prof. Arne Hegmann V', 'Businessman', '01970096673', 'father170@example.com', '5997303968237', NULL, 'Aglae VonRueden PhD', 'Doctor', '01877133077', 'mother170@example.com', '9069212700793', NULL, 'Ms. Alysa Rempel', '01526062923', 'guardian170@example.com', '3576999262045', 'Aunt', 1, 35, 5, '2025-12-20', NULL, 2025000170, 900170, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49', '127.0.0.1', 1, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49'),
(171, 'Estella', 'Sauer', '2023-02-11', 'Male', 'AB-', 'Other', 'Bangladeshi', '6543365099747', '01732150299', 'student171@example.com', '$2y$12$I1tcE2qb5BCV4/o1IqP1m.050h1XtG2Ba9a1gUwHTc3fFnnxZ2DEu', '8555 Summer Island Suite 080\nZacharyville, WY 40910-4650', '856 Block Grove Apt. 447\nMillerville, SC 19648', 'ADM-00171', '1979-09-21', 'A', 'Science', '2025-2026', 'Carroll-Marks School', 'Alessandro Gusikowski', 'Teacher', '01659596289', 'father171@example.com', '0787471048669', NULL, 'Ms. Ethyl Turcotte III', 'Businesswoman', '01624157863', 'mother171@example.com', '5604021852110', NULL, 'Ewell Gulgowski', '01944899444', 'guardian171@example.com', '4346793354239', 'Uncle', 1, 36, 1, '2025-12-20', NULL, 2025000171, 900171, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49', '127.0.0.1', 1, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49'),
(172, 'Wilmer', 'Fisher', '1988-11-27', 'Female', 'B-', 'Other', 'Bangladeshi', '2304202814082', '01610231397', 'student172@example.com', '$2y$12$Hw/7Kqp2wWjZMHxB965sIec4g3CSZPGTQRfjU8Dx510qhpYrvmr/6', '485 Huel Mountain Apt. 415\nSouth Ceceliafurt, UT 69238-2438', '263 Isobel Plains\nSouth Marcos, FL 04209-4877', 'ADM-00172', '2011-03-14', 'A', 'Science', '2025-2026', 'Mohr, Glover and Jacobson School', 'Doug Carter', 'Doctor', '01822071515', 'father172@example.com', '5367684619727', NULL, 'Alfreda Bins', 'Housewife', '01890026458', 'mother172@example.com', '5725329339792', NULL, 'Mr. Hayden Erdman', '01488486887', 'guardian172@example.com', '9476200918337', 'Aunt', 1, 36, 5, '2025-12-20', NULL, 2025000172, 900172, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49', '127.0.0.1', 1, NULL, '2025-12-20 08:34:49', '2025-12-20 08:34:49'),
(173, 'Mathew', 'Fadel', '1999-01-25', 'Male', 'B+', 'Other', 'Bangladeshi', '2286803178309', '01845419319', 'student173@example.com', '$2y$12$.8LkA.AfeQsBai2FRxe3/OtGybI7zftwRnJflRpfUTy59gbzPnGYW', '85960 Micaela Burg Apt. 591\nSouth Marcmouth, CO 14091-3893', '5133 Eugene Field\nAyanatown, AZ 14751', 'ADM-00173', '1983-10-08', 'B', 'Science', '2025-2026', 'Treutel Inc School', 'Jessy Zulauf', 'Farmer', '01580372701', 'father173@example.com', '4847203879683', NULL, 'Dr. Noemi Conn', 'Doctor', '01782592327', 'mother173@example.com', '6968107161464', NULL, 'Raegan Hahn', '01432093266', 'guardian173@example.com', '0195115754548', 'Grandparent', 1, 34, 4, '2025-12-20', NULL, 2025000173, 900173, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50', '127.0.0.1', 1, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50'),
(174, 'Morton', 'Hamill', '2018-12-25', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '8632451806396', '01792874216', 'student174@example.com', '$2y$12$N0wviSPA43AAIxWGTwX4x.mel3in5B2elZOHW9KiG7LWIeiMc1ZCW', '636 Jamal Tunnel Apt. 625\nLake Kareemborough, DE 56141', '8185 Maxie Gardens\nNew Anabelleton, AK 97508-7825', 'ADM-00174', '2017-01-20', 'C', 'Arts', '2025-2026', 'Bradtke, McCullough and Rempel School', 'Dr. Brant Hauck III', 'Teacher', '01355770290', 'father174@example.com', '2094069599852', NULL, 'Lorine Hahn', 'Businesswoman', '01916710381', 'mother174@example.com', '5290671164576', NULL, 'Duncan Harvey', '01402015025', 'guardian174@example.com', '6493254255869', 'Sister', 1, 37, 1, '2025-12-20', NULL, 2025000174, 900174, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50', '127.0.0.1', 1, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50'),
(175, 'Marjolaine', 'Price', '2023-11-01', 'Other', 'AB+', 'Christian', 'Bangladeshi', '7931084789124', '01949028365', 'student175@example.com', '$2y$12$Mga1x7Rwg4tJ5jRosDOBEu3oKYYlZibMlERdPJYuae1M9mUW2tFj.', '284 Jast Point Apt. 270\nGersonland, GA 39812', '6214 Morar Island Apt. 168\nPeterchester, RI 07007', 'ADM-00175', '2023-04-15', 'C', 'Arts', '2025-2026', 'Casper-Vandervort School', 'Mr. Alvis Price PhD', 'Doctor', '01674386670', 'father175@example.com', '9217924214038', NULL, 'Juana Cronin MD', 'Housewife', '01842882612', 'mother175@example.com', '0222165324759', NULL, 'Morris Torphy', '01483553707', 'guardian175@example.com', '2543014766545', 'Sister', 1, 36, 2, '2025-12-20', NULL, 2025000175, 900175, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50', '127.0.0.1', 1, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50'),
(176, 'Maeve', 'Heller', '1984-07-12', 'Female', 'AB+', 'Hindu', 'Bangladeshi', '1245840478788', '01624090094', 'student176@example.com', '$2y$12$KwM89nerHp.zrrjgOXRAlO5baRDgj1T9fPiG1d.Uj0qsEU6Jzi.wK', '93509 Glover Squares Suite 147\nWebermouth, NJ 16649-5096', '527 Dickinson Mount\nWest Candidashire, NM 81491-3209', 'ADM-00176', '2008-12-16', 'B', 'Arts', '2025-2026', 'Purdy PLC School', 'Lavon Mueller', 'Farmer', '01840002564', 'father176@example.com', '3220790994306', NULL, 'Alisha Brown', 'Nurse', '01652214174', 'mother176@example.com', '7535518441634', NULL, 'Amiya Cormier', '01941719010', 'guardian176@example.com', '3066926235767', 'Grandparent', 1, 33, 3, '2025-12-20', NULL, 2025000176, 900176, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50', '127.0.0.1', 1, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50'),
(177, 'Ignacio', 'Mitchell', '1988-02-01', 'Other', 'B+', 'Islam', 'Bangladeshi', '3019527225144', '01962207622', 'student177@example.com', '$2y$12$ITblGWUpuL/aE78NqGhL1u9E23RInw0eZjIjOloWSyZdz7h.F7rJi', '88712 Thalia Well Suite 577\nDaxborough, PA 88542', '8240 Greg Heights Suite 460\nChristyfurt, DC 90563-4032', 'ADM-00177', '2005-07-16', 'A', 'Commerce', '2025-2026', 'Wolf LLC School', 'Mr. Deshawn Green', 'Teacher', '01506661238', 'father177@example.com', '9571671036652', NULL, 'Astrid Breitenberg', 'Businesswoman', '01785903478', 'mother177@example.com', '6765571545289', NULL, 'Leanne Armstrong', '01745369790', 'guardian177@example.com', '2244477518239', 'Aunt', 1, 34, 3, '2025-12-20', NULL, 2025000177, 900177, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50', '127.0.0.1', 1, NULL, '2025-12-20 08:34:50', '2025-12-20 08:34:50'),
(178, 'Gladys', 'Kirlin', '1984-04-21', 'Male', 'B+', 'Other', 'Bangladeshi', '6038839974351', '01626240946', 'student178@example.com', '$2y$12$6hesMvjdkxh72X7ySQHMfu6Hl5V/RR16Y7g5eDxXZ/ko9CFq7/jwG', '30516 Piper Trail Apt. 335\nWest Leonel, NE 80022', '30501 Sibyl Track\nPort Devon, MO 79928-2772', 'ADM-00178', '1996-07-13', 'C', 'Science', '2025-2026', 'Kassulke PLC School', 'Stefan Brown', 'Farmer', '01516096091', 'father178@example.com', '8309825508578', NULL, 'Stephania Kunze', 'Businesswoman', '01905647349', 'mother178@example.com', '5936278582547', NULL, 'Rolando King', '01532800106', 'guardian178@example.com', '0381134653328', 'Grandparent', 1, 37, 5, '2025-12-20', NULL, 2025000178, 900178, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51', '127.0.0.1', 1, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51'),
(179, 'Henderson', 'Durgan', '1995-05-05', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '3225639740682', '01412427415', 'student179@example.com', '$2y$12$mDqKZKRMZYBQzQfDiMyI6eyw4D9p4HjU4zXjHSAxuiGRq1cls2iD.', '93460 Cortez Pike Apt. 492\nCecelialand, SC 06017-1647', '186 Lori Greens Suite 249\nMayertside, AR 75730', 'ADM-00179', '2014-09-21', 'B', 'Commerce', '2025-2026', 'Ryan, McGlynn and Jacobson School', 'Arch Hermiston', 'Engineer', '01513264586', 'father179@example.com', '0939502829336', NULL, 'Henriette Gerhold', 'Doctor', '01604777796', 'mother179@example.com', '8903246557932', NULL, 'Dr. Benton Sporer II', '01821102709', 'guardian179@example.com', '5790663068631', 'Aunt', 1, 38, 5, '2025-12-20', NULL, 2025000179, 900179, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51', '127.0.0.1', 1, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51'),
(180, 'Erna', 'Schaefer', '2000-08-08', 'Male', 'B-', 'Other', 'Bangladeshi', '0936802076836', '01474733919', 'student180@example.com', '$2y$12$syNnWnBO2O4YT7vBPmefquiipJRjLImOmJmv7rzdYNJHpDC.WMXRm', '82481 Braun Harbor\nHuelsbury, TN 75618', '6263 Albertha Wells Apt. 361\nSouth Reina, AZ 48163', 'ADM-00180', '2023-09-01', 'A', 'Arts', '2025-2026', 'Harber-Ryan School', 'Dr. Jaron Cremin', 'Doctor', '01743043622', 'father180@example.com', '9993092406326', NULL, 'Gudrun Daugherty', 'Doctor', '01818372775', 'mother180@example.com', '0028525424138', NULL, 'Lela King', '01435476669', 'guardian180@example.com', '2229432911934', 'Sister', 1, 35, 3, '2025-12-20', NULL, 2025000180, 900180, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51', '127.0.0.1', 1, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51'),
(181, 'Noelia', 'Emmerich', '2005-11-06', 'Female', 'B+', 'Hindu', 'Bangladeshi', '5420362203288', '01947543798', 'student181@example.com', '$2y$12$Pth12sMj2W3tK5mlf56Anu5AU68lSH4x9SnPsut6vWP3QGFI95aN.', '521 Corine Ramp Suite 194\nJohnniemouth, CA 30818', '7487 Murazik Fork Apt. 667\nNorth Rosettaland, NM 50147-2022', 'ADM-00181', '2001-07-31', 'C', 'Science', '2025-2026', 'Kerluke-Torphy School', 'Gerardo Hegmann', 'Doctor', '01354171881', 'father181@example.com', '7276722151864', NULL, 'Arlene Nicolas', 'Businesswoman', '01306406134', 'mother181@example.com', '5205148691905', NULL, 'Tania Pouros', '01960277871', 'guardian181@example.com', '8109095120877', 'Brother', 1, 35, 4, '2025-12-20', NULL, 2025000181, 900181, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51', '127.0.0.1', 1, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51'),
(182, 'Aniyah', 'Goyette', '2014-05-28', 'Female', 'AB+', 'Buddhist', 'Bangladeshi', '3397462605480', '01739638097', 'student182@example.com', '$2y$12$gNUP41G/vlVpak85NVgIseRlvGG8zifq3qmm2pZP/Z7fT7wFYLlaG', '66319 Welch Mews\nLefflerton, SC 61310-9785', '2706 Reichel Underpass\nFerneshire, WY 91046-5682', 'ADM-00182', '2001-05-19', 'B', 'Science', '2025-2026', 'VonRueden Group School', 'Thad Lemke', 'Doctor', '01463218687', 'father182@example.com', '1572749670031', NULL, 'Ernestine Schaden Jr.', 'Teacher', '01345546509', 'mother182@example.com', '2643674873697', NULL, 'Prof. Sienna Kiehn', '01936055257', 'guardian182@example.com', '7198445108428', 'Aunt', 1, 39, 5, '2025-12-20', NULL, 2025000182, 900182, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51', '127.0.0.1', 1, NULL, '2025-12-20 08:34:51', '2025-12-20 08:34:51'),
(183, 'Lily', 'Gorczany', '2025-03-20', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '2875702762235', '01326241063', 'student183@example.com', '$2y$12$0iPuqECXY8zDn7OzJyBge.J2iKBoIpvRHZ38XEuNwiUH3Q1h718te', '7319 Dach Place\nSouth Shawnahaven, VT 63913-9633', '5928 Blaise Drive\nSouth Manuelafurt, NC 81921', 'ADM-00183', '2020-10-02', 'A', 'Commerce', '2025-2026', 'Christiansen Inc School', 'Brycen Ernser', 'Farmer', '01537115481', 'father183@example.com', '6789416121611', NULL, 'Antoinette Willms', 'Teacher', '01783359523', 'mother183@example.com', '9841812497573', NULL, 'Harmony Spinka', '01627084312', 'guardian183@example.com', '4460313163359', 'Grandparent', 1, 37, 2, '2025-12-20', NULL, 2025000183, 900183, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52', '127.0.0.1', 1, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52'),
(184, 'Danyka', 'Schaefer', '1980-10-09', 'Other', 'B+', 'Christian', 'Bangladeshi', '6451120410061', '01530697869', 'student184@example.com', '$2y$12$QxhK3.9eenNcILwmf9dWj.2YzkBfuCKdmVJjJWA.Zz6.N93Fi13Gq', '7308 Reinger Spurs Suite 052\nJamilberg, CT 57651', '85142 Isabella Green Apt. 024\nWest Francescoport, OH 11509-1366', 'ADM-00184', '1976-07-07', 'C', 'Science', '2025-2026', 'Zieme-McClure School', 'Easter Fisher', 'Engineer', '01743453232', 'father184@example.com', '2986071246171', NULL, 'Miss Sincere Goodwin', 'Doctor', '01640672706', 'mother184@example.com', '1960007383728', NULL, 'Alden Muller', '01439396262', 'guardian184@example.com', '2801485311246', 'Brother', 1, 38, 2, '2025-12-20', NULL, 2025000184, 900184, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52', '127.0.0.1', 1, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52'),
(185, 'Lora', 'Roob', '1972-11-13', 'Male', 'O+', 'Hindu', 'Bangladeshi', '2128439912839', '01940746034', 'student185@example.com', '$2y$12$05mHXofSwRuj5yfAeBUALOknUYE8wVd2ObieipJj4F8c4xLyVK42i', '85176 Crona Skyway Apt. 167\nJeannehaven, VA 48388-1503', '544 Ankunding Mountain\nEast Abbiemouth, OH 74165-2723', 'ADM-00185', '2013-08-31', 'C', 'Science', '2025-2026', 'Durgan, Corkery and Legros School', 'Kevon Baumbach', 'Teacher', '01407629643', 'father185@example.com', '9924069201654', NULL, 'Cayla Harber', 'Businesswoman', '01785327445', 'mother185@example.com', '2344680261425', NULL, 'Kendra Gutkowski', '01657938913', 'guardian185@example.com', '1783511648552', 'Brother', 1, 36, 4, '2025-12-20', NULL, 2025000185, 900185, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52', '127.0.0.1', 1, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52'),
(186, 'Bridgette', 'Murray', '1994-05-07', 'Male', 'O+', 'Christian', 'Bangladeshi', '3642820995323', '01775442290', 'student186@example.com', '$2y$12$s6Q5xtGe966wDQ8xAswe8eq6dM7POcecxL6OhYKixYkK.QXorsO/.', '573 Effertz Shores\nBaileeborough, IL 58245-1238', '162 Alden Terrace\nNewtontown, CO 38043', 'ADM-00186', '2022-03-15', 'B', 'Arts', '2025-2026', 'Reinger, Hegmann and Kovacek School', 'Berry Orn', 'Businessman', '01666220604', 'father186@example.com', '0935762933979', NULL, 'Kristy Zemlak', 'Businesswoman', '01912149157', 'mother186@example.com', '6044220773347', NULL, 'Lindsay Satterfield', '01970362062', 'guardian186@example.com', '2930304810862', 'Sister', 1, 38, 1, '2025-12-20', NULL, 2025000186, 900186, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52', '127.0.0.1', 1, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52'),
(187, 'Letha', 'Yundt', '1995-07-22', 'Female', 'A-', 'Buddhist', 'Bangladeshi', '1985357140989', '01585553256', 'student187@example.com', '$2y$12$CPPtoNQGrZVaPY2gqlw.4.zNLjikt5RBQOhcVqReLraneqTfVScTC', '3219 Reva Circle\nReynoldsfort, PA 59836-5275', '2123 Brisa Gateway\nHeaneyport, AK 03765-4370', 'ADM-00187', '1983-10-21', 'A', 'Arts', '2025-2026', 'Brakus Ltd School', 'Dr. Angel Lesch PhD', 'Doctor', '01798271221', 'father187@example.com', '1194006845579', NULL, 'Joanie Kuphal', 'Businesswoman', '01324877289', 'mother187@example.com', '5621912443680', NULL, 'Neoma Wehner', '01616319916', 'guardian187@example.com', '7648352320934', 'Brother', 1, 39, 2, '2025-12-20', NULL, 2025000187, 900187, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52', '127.0.0.1', 1, NULL, '2025-12-20 08:34:52', '2025-12-20 08:34:52'),
(188, 'Raul', 'Champlin', '2017-10-22', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '9952458605745', '01615971940', 'student188@example.com', '$2y$12$wUaFgMuJ7ROnTX7MXjyUZughE6zqQ7JCu.xRtVYtLO7AhNZRZS5tC', '97946 Tremblay Road Suite 668\nPort Lucieshire, UT 24725', '2185 Milford Squares Suite 744\nNorth Dustin, CO 76556', 'ADM-00188', '2004-02-15', 'B', 'Science', '2025-2026', 'Krajcik-Oberbrunner School', 'Mr. Arlo Davis', 'Doctor', '01682430912', 'father188@example.com', '4300416642541', NULL, 'Crystal Mayer', 'Housewife', '01712105390', 'mother188@example.com', '2700066953959', NULL, 'Dr. Pamela Stamm V', '01665067608', 'guardian188@example.com', '0445220116346', 'Brother', 1, 36, 3, '2025-12-20', NULL, 2025000188, 900188, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53', '127.0.0.1', 1, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53'),
(189, 'Kathlyn', 'Stroman', '2003-07-21', 'Female', 'B-', 'Islam', 'Bangladeshi', '2415499764784', '01451446349', 'student189@example.com', '$2y$12$mZ.PmWxFzA5bVyoc/yb6Se0hLeumXm2jn5slknNY8iETPsjlQP9Zq', '18845 Balistreri Isle Apt. 188\nWest Sandy, ID 80262', '538 Klocko Knoll Suite 146\nSouth Haskellmouth, RI 53192-9004', 'ADM-00189', '2014-07-02', 'A', 'Arts', '2025-2026', 'Cassin Ltd School', 'Jocelyn Kunze', 'Engineer', '01425496402', 'father189@example.com', '1814943890352', NULL, 'Clarissa Kohler', 'Doctor', '01873322050', 'mother189@example.com', '9556132115559', NULL, 'Alec Krajcik', '01775528403', 'guardian189@example.com', '0351372935778', 'Uncle', 1, 37, 4, '2025-12-20', NULL, 2025000189, 900189, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53', '127.0.0.1', 1, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53'),
(190, 'Sally', 'Treutel', '1981-12-03', 'Other', 'O-', 'Other', 'Bangladeshi', '3532932785769', '01602575637', 'student190@example.com', '$2y$12$nkAgJiaWYRa8zXvZBOuxY.z.NRWjMJWxC8EuKy1NcNBAUrLlmUMnC', '1934 Ally Underpass\nLake Arielfort, VA 59965-6803', '466 Marcelo Views\nLolitachester, KY 95730-0808', 'ADM-00190', '1986-02-27', 'B', 'Commerce', '2025-2026', 'Herman, Wehner and Robel School', 'Clifton Murray', 'Businessman', '01419121029', 'father190@example.com', '5745472218699', NULL, 'Ana Nolan', 'Businesswoman', '01388384445', 'mother190@example.com', '8835852847902', NULL, 'Torrey Luettgen Jr.', '01789971688', 'guardian190@example.com', '9761732589263', 'Brother', 1, 38, 4, '2025-12-20', NULL, 2025000190, 900190, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53', '127.0.0.1', 1, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53'),
(191, 'Trinity', 'Bode', '2017-09-19', 'Female', 'AB-', 'Christian', 'Bangladeshi', '7184950571770', '01345661880', 'student191@example.com', '$2y$12$/2.BL6mEVEzaVBKLLvphneEewKw6WhVi7lS64y/XxL637W2vbDFhW', '90741 Ari Viaduct Apt. 365\nNorth Gunner, NM 62994', '16322 Fadel Landing\nWest Emmanuelle, VT 92150', 'ADM-00191', '2019-03-17', 'B', 'Arts', '2025-2026', 'Kshlerin LLC School', 'Noble Blick V', 'Farmer', '01770323234', 'father191@example.com', '6464850132703', NULL, 'Dr. Emelia Abernathy III', 'Housewife', '01719627811', 'mother191@example.com', '9985935550059', NULL, 'Verna Treutel', '01902372216', 'guardian191@example.com', '6349113185793', 'Aunt', 1, 37, 3, '2025-12-20', NULL, 2025000191, 900191, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53', '127.0.0.1', 1, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53'),
(192, 'Fannie', 'Weber', '1987-10-10', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '4816380290447', '01928608387', 'student192@example.com', '$2y$12$UG7echXhs.XMHgdO0ToQ8ODVbvGSEQZh4cD2j/b5EExT84YiQZd4i', '684 Terry Tunnel Apt. 387\nJovannymouth, ID 72758', '65713 Niko Locks Apt. 089\nWelchburgh, LA 24452-1614', 'ADM-00192', '1972-12-31', 'A', 'Arts', '2025-2026', 'Kovacek, Romaguera and Schuster School', 'Matteo Luettgen', 'Doctor', '01336667203', 'father192@example.com', '8867803937489', NULL, 'Patricia Walker', 'Teacher', '01694898707', 'mother192@example.com', '6565360493723', NULL, 'Dayana Bergstrom', '01957279027', 'guardian192@example.com', '0308666508681', 'Aunt', 1, 40, 5, '2025-12-20', NULL, 2025000192, 900192, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53', '127.0.0.1', 1, NULL, '2025-12-20 08:34:53', '2025-12-20 08:34:53'),
(193, 'Dagmar', 'Heaney', '1987-01-21', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '8919638500259', '01394431823', 'student193@example.com', '$2y$12$h.cl7km9fO4GH1O4Sflyyu0tghS3/nM6Htrv3/fAclQ7R2K4LRAtC', '3593 Dino Brook\nStiedemannville, MS 74263', '61964 Connelly Port\nNorth Rupertstad, PA 81398-2172', 'ADM-00193', '2024-08-20', 'A', 'Science', '2025-2026', 'Littel Group School', 'Wellington Cruickshank', 'Businessman', '01985918258', 'father193@example.com', '8249600032152', NULL, 'Gregoria Ziemann', 'Teacher', '01640620408', 'mother193@example.com', '9804943235341', NULL, 'Shawna Howell', '01609356542', 'guardian193@example.com', '5107467189000', 'Brother', 1, 39, 1, '2025-12-20', NULL, 2025000193, 900193, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54', '127.0.0.1', 1, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54'),
(194, 'Darius', 'Labadie', '1974-04-30', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '7744764546820', '01767118280', 'student194@example.com', '$2y$12$0Gsc2bWgZDm28IpnHYdpQ.8apsfBEh7J3T7kcSR1foArhbC0lmRF6', '34254 Daugherty Ports\nPort Eloystad, HI 74106-3695', '5790 Stehr Extensions Suite 981\nFredamouth, ID 79456-9897', 'ADM-00194', '2007-04-06', 'C', 'Arts', '2025-2026', 'Kshlerin-Veum School', 'Candido Kiehn', 'Engineer', '01577014341', 'father194@example.com', '8976581782589', NULL, 'Aisha Mohr', 'Nurse', '01532520891', 'mother194@example.com', '5848837436462', NULL, 'Rodrigo Rutherford IV', '01524635487', 'guardian194@example.com', '4805018405554', 'Grandparent', 1, 38, 3, '2025-12-20', NULL, 2025000194, 900194, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54', '127.0.0.1', 1, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54'),
(195, 'Rowland', 'Durgan', '1984-04-11', 'Other', 'O+', 'Christian', 'Bangladeshi', '9465313409390', '01358383797', 'student195@example.com', '$2y$12$/bSTAIO5KsnCmJgsXciuqufCDqBb886U4mfsFsSJKVQuOYRj7hiNe', '8611 Alyson Burgs Apt. 548\nKaritown, KS 49296-0189', '24511 Romaguera Causeway\nAnnamaechester, AR 35468-6947', 'ADM-00195', '2003-06-23', 'B', 'Science', '2025-2026', 'Strosin-Stamm School', 'Nigel Cassin', 'Farmer', '01922803419', 'father195@example.com', '4129628480505', NULL, 'Salma Hessel', 'Businesswoman', '01976471969', 'mother195@example.com', '9919418768999', NULL, 'Tillman Monahan', '01998157565', 'guardian195@example.com', '0243917560211', 'Aunt', 1, 40, 1, '2025-12-20', NULL, 2025000195, 900195, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54', '127.0.0.1', 1, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54'),
(196, 'Darian', 'Wehner', '1989-02-23', 'Male', 'AB-', 'Islam', 'Bangladeshi', '9540677318745', '01623249395', 'student196@example.com', '$2y$12$GYMPGGG9lLAk5Zung5Fra.ILC9xp/vKzTL0lvG30G.Tlqrp/iPAsG', '110 Pauline Shore\nLake Marcel, IN 13112-6049', '77373 Haven Manor\nHeidenreichmouth, WI 43011', 'ADM-00196', '2020-10-12', 'C', 'Arts', '2025-2026', 'Pollich-Senger School', 'Osbaldo Prosacco', 'Businessman', '01762687543', 'father196@example.com', '5327897739151', NULL, 'Juana Torphy', 'Businesswoman', '01825709136', 'mother196@example.com', '7969822206989', NULL, 'Ashley Walter', '01820687147', 'guardian196@example.com', '7577330651415', 'Brother', 1, 41, 1, '2025-12-20', NULL, 2025000196, 900196, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54', '127.0.0.1', 1, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54'),
(197, 'Natalie', 'Homenick', '1994-10-26', 'Male', 'A+', 'Hindu', 'Bangladeshi', '5876455594320', '01870703565', 'student197@example.com', '$2y$12$pbJP65C/fbnn7rE242Q6Q.RrEcS2r410yg0/ZcC4GzYj2X2lQrHdK', '924 Douglas Plains\nAdammouth, PA 53875-3094', '5012 Ashlee Rapids Apt. 885\nWest Marchaven, WV 15248-2803', 'ADM-00197', '2023-01-13', 'B', 'Science', '2025-2026', 'Huel Ltd School', 'Dario Paucek', 'Engineer', '01727725772', 'father197@example.com', '6551458531997', NULL, 'Dr. Shayna Herman', 'Nurse', '01614940516', 'mother197@example.com', '1870917756397', NULL, 'Mrs. Mertie White', '01432414179', 'guardian197@example.com', '9763190392214', 'Sister', 1, 40, 2, '2025-12-20', NULL, 2025000197, 900197, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54', '127.0.0.1', 1, NULL, '2025-12-20 08:34:54', '2025-12-20 08:34:54'),
(198, 'Paula', 'Grant', '2002-07-27', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '5495531381187', '01873100640', 'student198@example.com', '$2y$12$6TzOVYM8fhuYwRjsCn30tuH2YXgZT6Z.oluj9GMRmOFN7/VzK9xry', '5292 Bode Skyway\nReichelside, KY 09233', '255 Muriel Points Suite 039\nKerlukestad, OR 46958', 'ADM-00198', '1994-02-14', 'C', 'Arts', '2025-2026', 'Waelchi Ltd School', 'Alex Satterfield', 'Businessman', '01855486949', 'father198@example.com', '8512644062131', NULL, 'Jacquelyn Kuhlman', 'Businesswoman', '01449397939', 'mother198@example.com', '3397603006302', NULL, 'Loyal Dare', '01692285984', 'guardian198@example.com', '6633049775672', 'Sister', 1, 42, 1, '2025-12-20', NULL, 2025000198, 900198, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55', '127.0.0.1', 1, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55'),
(199, 'Dianna', 'Bernier', '1996-12-22', 'Other', 'A-', 'Islam', 'Bangladeshi', '7580372022618', '01336750236', 'student199@example.com', '$2y$12$hr2Mxu6XQT9ywPWhhCG7K.v1bqebzNSl/adsyNogz3zLwGT/Whr5u', '802 Lizeth Row Suite 253\nHaleyborough, OK 29380', '5343 Effertz Plains Suite 153\nEast Donton, CT 30106', 'ADM-00199', '2019-08-20', 'C', 'Commerce', '2025-2026', 'Spinka Inc School', 'Clinton Berge IV', 'Farmer', '01971703909', 'father199@example.com', '0761690164379', NULL, 'Jolie Douglas I', 'Doctor', '01602554449', 'mother199@example.com', '2628798435246', NULL, 'Isaias Dickens', '01467503861', 'guardian199@example.com', '9305047822819', 'Grandparent', 1, 43, 1, '2025-12-20', NULL, 2025000199, 900199, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55', '127.0.0.1', 1, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55'),
(200, 'Jewell', 'Leuschke', '1999-09-06', 'Male', 'O+', 'Other', 'Bangladeshi', '5605683254560', '01302188404', 'student200@example.com', '$2y$12$fMGudj/YLJl6QGBR85uf7.1xx3KKyUFP40Vvdlogp4hdHvHq4NN4a', '9107 Jakubowski Inlet Suite 600\nLake Royceberg, ND 12588', '334 Clarabelle Freeway\nWest Nayeli, MS 38677', 'ADM-00200', '1990-12-06', 'B', 'Science', '2025-2026', 'Torphy-Hilpert School', 'Mr. Cody Fay DDS', 'Engineer', '01679914290', 'father200@example.com', '3613702495257', NULL, 'Lillie Farrell', 'Teacher', '01305099686', 'mother200@example.com', '9631959347619', NULL, 'Claude Stiedemann DDS', '01844534753', 'guardian200@example.com', '9420594497315', 'Brother', 1, 41, 5, '2025-12-20', NULL, 2025000200, 900200, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55', '127.0.0.1', 1, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55'),
(201, 'Florian', 'King', '1990-10-11', 'Other', 'O-', 'Christian', 'Bangladeshi', '0423286094930', '01493087279', 'student201@example.com', '$2y$12$qa1CglL..Jk6Qms2PbbPhuscp9tnze2IzimxRuruAfBIo3sJG9GT6', '96499 Gunnar Pass\nDeltaburgh, KY 15213-9124', '8660 Kris Viaduct\nNorth Josh, MN 41088', 'ADM-00201', '2005-12-25', 'C', 'Commerce', '2025-2026', 'Waelchi Inc School', 'Roman Witting', 'Doctor', '01476197556', 'father201@example.com', '5163174125140', NULL, 'Maya Quigley', 'Teacher', '01424918022', 'mother201@example.com', '4242775106489', NULL, 'Drake Gerhold', '01970607444', 'guardian201@example.com', '7804049365429', 'Brother', 1, 41, 2, '2025-12-20', NULL, 2025000201, 900201, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55', '127.0.0.1', 1, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55'),
(202, 'Johnny', 'Gusikowski', '2009-01-22', 'Female', 'B-', 'Hindu', 'Bangladeshi', '5949838746897', '01729922452', 'student202@example.com', '$2y$12$aa4DzfSAJKPABR10jpNnoOmSWdxka5crw1z89eCH86KAjKDkaCSdi', '8982 Austin Pine\nNicolasview, CA 17142-6182', '3726 Ivory Camp\nNew Nicolette, WI 56693-7368', 'ADM-00202', '1999-04-01', 'C', 'Arts', '2025-2026', 'Hand Group School', 'Neil Bailey', 'Teacher', '01976189072', 'father202@example.com', '2121811413506', NULL, 'Dessie Schinner Sr.', 'Doctor', '01945576124', 'mother202@example.com', '8906142627462', NULL, 'Georgianna Miller', '01687788604', 'guardian202@example.com', '0861507295718', 'Uncle', 1, 42, 5, '2025-12-20', NULL, 2025000202, 900202, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55', '127.0.0.1', 1, NULL, '2025-12-20 08:34:55', '2025-12-20 08:34:55'),
(203, 'Randi', 'Cremin', '2016-03-26', 'Male', 'O-', 'Christian', 'Bangladeshi', '9175489051814', '01696752454', 'student203@example.com', '$2y$12$I.2SlVY79BXFN6LnjV9HVeEVnXiwoWx0Y2cgvbag.4MJr9YEln13K', '3395 Kenna Square Apt. 470\nFloydstad, IA 19588', '61522 Monahan Cliffs Apt. 029\nRosenbaumshire, NJ 67520-7165', 'ADM-00203', '2020-04-02', 'A', 'Arts', '2025-2026', 'Aufderhar, Walker and Kulas School', 'Elian Breitenberg', 'Teacher', '01870726913', 'father203@example.com', '1727478737626', NULL, 'Mrs. Santina Schamberger DVM', 'Housewife', '01441135327', 'mother203@example.com', '3546632029738', NULL, 'Miss Eunice Herman DVM', '01378559433', 'guardian203@example.com', '1978909187134', 'Uncle', 1, 39, 4, '2025-12-20', NULL, 2025000203, 900203, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56', '127.0.0.1', 1, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56'),
(204, 'Agustin', 'Bogan', '2011-07-28', 'Other', 'O+', 'Other', 'Bangladeshi', '1208425158570', '01858100064', 'student204@example.com', '$2y$12$FXPgWS1oOD4uZDvoI63yR.CIOXNb/3dbvBV8wT65P0KaY5elbL6Pi', '54676 Coy Ranch Suite 838\nMaybellfurt, MN 83544', '73221 Zemlak Gardens\nBeckerfort, GA 44197-7385', 'ADM-00204', '2003-11-25', 'C', 'Commerce', '2025-2026', 'Feeney-Stanton School', 'Andrew Lowe', 'Engineer', '01895351983', 'father204@example.com', '1248896720024', NULL, 'Paula Daniel', 'Doctor', '01448744591', 'mother204@example.com', '7435692020155', NULL, 'Mrs. Ashtyn Wisoky', '01883726677', 'guardian204@example.com', '4811162882560', 'Brother', 1, 44, 1, '2025-12-20', NULL, 2025000204, 900204, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56', '127.0.0.1', 1, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56'),
(205, 'Heber', 'Koss', '1983-06-29', 'Female', 'B-', 'Christian', 'Bangladeshi', '1535726169206', '01509434619', 'student205@example.com', '$2y$12$lM9Ddbp/Kh1tQsFE8BUR9uRvwnrbpc6mw2X.mFt980ACrzF0w3Q3y', '9987 Mante Mews\nWeimannshire, AZ 69408', '991 McLaughlin Harbor Apt. 735\nConroyhaven, KS 52610-4481', 'ADM-00205', '2006-06-25', 'C', 'Science', '2025-2026', 'Emmerich-Schuppe School', 'Abdullah Spinka V', 'Farmer', '01509020831', 'father205@example.com', '3270851543421', NULL, 'Esther Bradtke', 'Nurse', '01508985201', 'mother205@example.com', '7295633656808', NULL, 'Arlo Wolff', '01831855964', 'guardian205@example.com', '7133493568034', 'Sister', 1, 45, 1, '2025-12-20', NULL, 2025000205, 900205, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56', '127.0.0.1', 1, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56'),
(206, 'Adelbert', 'Johnston', '1991-06-14', 'Male', 'O-', 'Other', 'Bangladeshi', '9170467592552', '01715138973', 'student206@example.com', '$2y$12$N37pzEXFdClzniZ7gcFOU.Y8NFX4j4CgMoGSsv585oSl40UJnfv3S', '2377 Parker Locks\nWest Florian, FL 40593-5764', '8059 Kylee Inlet Suite 965\nUlicesburgh, ME 82526', 'ADM-00206', '2025-07-12', 'C', 'Commerce', '2025-2026', 'Schimmel-Bauch School', 'Dr. Rickie O\'Conner', 'Engineer', '01365095172', 'father206@example.com', '7278670539591', NULL, 'Alvena Goyette V', 'Teacher', '01457851661', 'mother206@example.com', '5546293409634', NULL, 'Wilma McGlynn', '01630385023', 'guardian206@example.com', '6988973106051', 'Brother', 1, 42, 2, '2025-12-20', NULL, 2025000206, 900206, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56', '127.0.0.1', 1, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56'),
(207, 'Madaline', 'Zulauf', '2017-06-29', 'Other', 'O-', 'Hindu', 'Bangladeshi', '9189276183514', '01935637577', 'student207@example.com', '$2y$12$b3CmSck2GLdZn.XRtC1SrOsIDRZq94OrHQWAvrnvpsrmy9hGUIMhW', '53229 Gilbert Ways Apt. 273\nNorth Maximusview, OK 15942', '5952 Virgie Ranch Suite 229\nWest Alfborough, DE 37405-2652', 'ADM-00207', '2007-01-26', 'B', 'Science', '2025-2026', 'Waelchi-Hilpert School', 'Delbert Senger Sr.', 'Teacher', '01493430949', 'father207@example.com', '7247872356696', NULL, 'Josie Kuphal', 'Teacher', '01873258471', 'mother207@example.com', '8349376841588', NULL, 'Mortimer Huel', '01716717663', 'guardian207@example.com', '1949486922376', 'Grandparent', 1, 43, 2, '2025-12-20', NULL, 2025000207, 900207, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56', '127.0.0.1', 1, NULL, '2025-12-20 08:34:56', '2025-12-20 08:34:56'),
(208, 'Garett', 'Kuhlman', '1981-02-01', 'Other', 'O+', 'Islam', 'Bangladeshi', '1897577344446', '01552152855', 'student208@example.com', '$2y$12$O96uOdby2BtG0o261aGg8eOZ.Eb0aJspJByc7QacZh3eTd6oJMWkm', '73969 Amely Land Suite 138\nPort Coltonborough, OK 79676-1074', '885 Burdette Bridge\nWest Hesterton, MI 94175-5034', 'ADM-00208', '1995-06-14', 'A', 'Science', '2025-2026', 'Nicolas, Flatley and Witting School', 'David Volkman V', 'Engineer', '01435332297', 'father208@example.com', '5867489723633', NULL, 'Beryl Bergnaum', 'Housewife', '01718663901', 'mother208@example.com', '4195330573360', NULL, 'Bella Dietrich', '01790673201', 'guardian208@example.com', '3075263235786', 'Sister', 1, 46, 1, '2025-12-20', NULL, 2025000208, 900208, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57', '127.0.0.1', 1, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57'),
(209, 'Lulu', 'Bogan', '1974-06-08', 'Other', 'B+', 'Islam', 'Bangladeshi', '8647689909981', '01380690367', 'student209@example.com', '$2y$12$MNW2B3AMp/tyvBBGO/D46.Ob.jXeWa8wdKQRQ7xKKtck00anSGgrK', '3628 Sarah Knoll\nEast Everardo, IL 24606', '4817 Jeffry Cape\nNorth Dulce, HI 38805', 'ADM-00209', '2023-10-19', 'A', 'Commerce', '2025-2026', 'Bruen-Mueller School', 'Gregorio Kreiger DDS', 'Farmer', '01921860916', 'father209@example.com', '6876203080558', NULL, 'Miss Leta Hegmann', 'Doctor', '01924554110', 'mother209@example.com', '1812737888284', NULL, 'Cortez Skiles IV', '01596649322', 'guardian209@example.com', '4876463519122', 'Uncle', 1, 43, 5, '2025-12-20', NULL, 2025000209, 900209, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57', '127.0.0.1', 1, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57'),
(210, 'Genevieve', 'Roberts', '1974-08-15', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '4450722358847', '01888091575', 'student210@example.com', '$2y$12$TBBXDIsUbZcTA5amsK9D3.qOItXsK4frCcQ8R4iMKjnc2z6oKedm.', '98470 Kautzer Landing Apt. 929\nSouth Ellsworth, AR 57407', '381 Marie Camp\nPort Dorian, WV 30929-2821', 'ADM-00210', '2009-03-25', 'C', 'Arts', '2025-2026', 'Gleichner, Schmeler and Ritchie School', 'Demetrius Schinner', 'Farmer', '01835054411', 'father210@example.com', '9164662408704', NULL, 'Kyra Schultz DVM', 'Housewife', '01791819253', 'mother210@example.com', '6062103462270', NULL, 'Mr. Wendell Cremin', '01446706182', 'guardian210@example.com', '2456642404502', 'Uncle', 1, 44, 5, '2025-12-20', NULL, 2025000210, 900210, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57', '127.0.0.1', 1, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57'),
(211, 'Leila', 'Weimann', '2009-01-14', 'Female', 'AB-', 'Islam', 'Bangladeshi', '5214386215620', '01857905584', 'student211@example.com', '$2y$12$mIGHuf2vdChO2zJK8O/zxOCqHULVDp5DQrIp3qIt6QTFVZXjDMCn2', '759 Alessandro Rapids\nNew Kirstin, NH 03451', '2214 Steuber Junction\nIleneside, HI 58844', 'ADM-00211', '2005-03-10', 'C', 'Arts', '2025-2026', 'Heaney-Weissnat School', 'Nicholaus Thiel DVM', 'Engineer', '01878314533', 'father211@example.com', '5056613566409', NULL, 'Summer Brekke', 'Doctor', '01964495008', 'mother211@example.com', '0577078123252', NULL, 'Adelia Rogahn', '01825227057', 'guardian211@example.com', '0376179366567', 'Uncle', 1, 45, 5, '2025-12-20', NULL, 2025000211, 900211, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57', '127.0.0.1', 1, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57'),
(212, 'Nannie', 'Ernser', '1975-12-10', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '7415444167525', '01575588951', 'student212@example.com', '$2y$12$L4gw3Dt.MQjw2AbKvpOnweCiZwFANA3Dls1zVqHiT..zwuSgNT3r.', '57012 Osinski Stravenue\nNorth Odellport, MN 38053', '153 Howard Square Apt. 321\nNorth Ona, UT 62307', 'ADM-00212', '1980-12-17', 'C', 'Arts', '2025-2026', 'Carter, Keeling and Collins School', 'Dr. Bernardo Bahringer', 'Farmer', '01857463058', 'father212@example.com', '7099707784976', NULL, 'Mafalda Denesik', 'Businesswoman', '01598484851', 'mother212@example.com', '2975086824632', NULL, 'Gaylord Mraz', '01965762009', 'guardian212@example.com', '6713773287487', 'Sister', 1, 47, 1, '2025-12-20', NULL, 2025000212, 900212, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57', '127.0.0.1', 1, NULL, '2025-12-20 08:34:57', '2025-12-20 08:34:57'),
(213, 'Savion', 'Cormier', '2002-10-04', 'Male', 'B-', 'Hindu', 'Bangladeshi', '1597396475643', '01540551689', 'student213@example.com', '$2y$12$DA.4bmJtayfJTgUNvLKabuKeiqdWFSBDZu/0FIEnjq71f8fIUvkTy', '8191 Krajcik Village\nNew Tillmanshire, DE 43349-8677', '524 Osborne Ports Suite 596\nPredovicshire, TN 02112-9221', 'ADM-00213', '2002-08-14', 'C', 'Commerce', '2025-2026', 'Lubowitz, Howe and Cummings School', 'Johann Witting', 'Farmer', '01988299886', 'father213@example.com', '5935183622853', NULL, 'Zula Breitenberg', 'Doctor', '01958740211', 'mother213@example.com', '8410154719833', NULL, 'Oscar Abernathy', '01615051893', 'guardian213@example.com', '9081365278281', 'Sister', 1, 39, 3, '2025-12-20', NULL, 2025000213, 900213, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58', '127.0.0.1', 1, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58'),
(214, 'Clementina', 'Morar', '1971-03-10', 'Female', 'O-', 'Christian', 'Bangladeshi', '8567527470453', '01581884145', 'student214@example.com', '$2y$12$faPEqd34Po/AU3GHl9KluelLDGQIC/TFgKdUqInroqzRC9vJPswZC', '8939 Carroll Trafficway Suite 592\nJeffreyburgh, NY 27035-3121', '2090 Koby Key Apt. 507\nNew Charles, PA 85623', 'ADM-00214', '1999-10-15', 'B', 'Commerce', '2025-2026', 'Schroeder, Blanda and Spencer School', 'Janick Grimes', 'Engineer', '01347760604', 'father214@example.com', '8652493122176', NULL, 'Ida Langworth DVM', 'Teacher', '01990845884', 'mother214@example.com', '3113695857727', NULL, 'Tyrel Schmitt', '01433823869', 'guardian214@example.com', '3507450993041', 'Uncle', 1, 40, 4, '2025-12-20', NULL, 2025000214, 900214, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58', '127.0.0.1', 1, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58'),
(215, 'Nyasia', 'Cremin', '1989-10-17', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '3167745123415', '01483352843', 'student215@example.com', '$2y$12$OjpuVz2IQ9j0otr/vgYW6.lkNrXPNK/u0ds9KWaxMMub6m21hVyjq', '89633 Amir Summit\nHoseahaven, WV 77937', '99778 Toby Valley Suite 673\nDarbychester, SD 06389-5686', 'ADM-00215', '2016-03-30', 'B', 'Science', '2025-2026', 'Weissnat-Willms School', 'Jimmie Mayert Jr.', 'Doctor', '01349544353', 'father215@example.com', '7041905842450', NULL, 'Prof. Elinore Collins IV', 'Businesswoman', '01798412392', 'mother215@example.com', '8510283867610', NULL, 'Ms. Ludie Daugherty', '01530770083', 'guardian215@example.com', '4552150020216', 'Brother', 1, 44, 2, '2025-12-20', NULL, 2025000215, 900215, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58', '127.0.0.1', 1, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58'),
(216, 'Gayle', 'Larkin', '2016-01-17', 'Other', 'O+', 'Buddhist', 'Bangladeshi', '7928446034232', '01820097251', 'student216@example.com', '$2y$12$D2Lu9YrexlHJQogST9.fue6ylAJxekQMZuKiNlyMvAbRaDUEh7gIe', '70291 Meredith Stream\nEast Silastown, OR 33031', '39863 Harold Extension Suite 234\nLake Rosalindburgh, ME 94370', 'ADM-00216', '1993-03-16', 'C', 'Commerce', '2025-2026', 'Muller, Bogisich and Vandervort School', 'Micheal Crooks', 'Engineer', '01646301517', 'father216@example.com', '8075883622846', NULL, 'Leora Ward', 'Nurse', '01382398512', 'mother216@example.com', '4380482172174', NULL, 'Miss Pearlie Rutherford PhD', '01637600874', 'guardian216@example.com', '8383951287965', 'Uncle', 1, 46, 5, '2025-12-20', NULL, 2025000216, 900216, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58', '127.0.0.1', 1, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58'),
(217, 'Bradford', 'Muller', '2021-04-05', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '9307946524810', '01623552646', 'student217@example.com', '$2y$12$WzRyVyR83kyTf2F5SaopY.H0oAEOQx0VMkLvPBoHF00q70e8EYd2G', '7511 Jakubowski Greens Suite 188\nLake Mauriciochester, SC 07371', '96660 Rath Camp\nSouth Hardy, WA 61830-3671', 'ADM-00217', '1985-02-24', 'B', 'Arts', '2025-2026', 'Parker PLC School', 'Trent Hagenes', 'Teacher', '01505239537', 'father217@example.com', '6274601688115', NULL, 'Berenice Klein', 'Doctor', '01773159638', 'mother217@example.com', '9374877186280', NULL, 'Chyna Stehr', '01404733515', 'guardian217@example.com', '6994656772160', 'Grandparent', 1, 45, 2, '2025-12-20', NULL, 2025000217, 900217, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58', '127.0.0.1', 1, NULL, '2025-12-20 08:34:58', '2025-12-20 08:34:58'),
(218, 'Jarred', 'Hamill', '2000-11-03', 'Other', 'A+', 'Buddhist', 'Bangladeshi', '6948681801994', '01684268652', 'student218@example.com', '$2y$12$V0tfouWGqbTYMWAPo5xUKuV67uthU0Q1W0994CvBiLBm1XRpET8eC', '5986 Jasper Canyon\nWilkinsonburgh, OK 93339', '472 Ruthie Row\nEast Princeville, ID 08846', 'ADM-00218', '1973-06-09', 'C', 'Arts', '2025-2026', 'Labadie, Fritsch and Schumm School', 'Celestino Mueller', 'Teacher', '01659174991', 'father218@example.com', '9796824186495', NULL, 'Helga Green MD', 'Doctor', '01915922823', 'mother218@example.com', '9336062210753', NULL, 'Rory Beahan', '01617017450', 'guardian218@example.com', '6571025907733', 'Aunt', 1, 40, 3, '2025-12-20', NULL, 2025000218, 900218, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59', '127.0.0.1', 1, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59'),
(219, 'Winnifred', 'Hettinger', '2002-12-24', 'Other', 'O+', 'Islam', 'Bangladeshi', '5026581753713', '01643684961', 'student219@example.com', '$2y$12$yAZhLMiwbEr64OesQptPRucK4akaMwmgFkWfDnHjEmebtQW3IP2H2', '9295 Thaddeus Rapids Suite 371\nGislasonberg, WI 61840-3302', '9279 Fatima Skyway\nAminaburgh, AZ 60206-0567', 'ADM-00219', '2012-04-21', 'B', 'Science', '2025-2026', 'Spinka, Torphy and Erdman School', 'Prof. Joel Olson IV', 'Businessman', '01746614806', 'father219@example.com', '7459997368628', NULL, 'Eldridge Rath', 'Doctor', '01735355460', 'mother219@example.com', '4207649763522', NULL, 'Davin Pacocha', '01767970986', 'guardian219@example.com', '5673655570731', 'Sister', 1, 47, 5, '2025-12-20', NULL, 2025000219, 900219, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59', '127.0.0.1', 1, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59'),
(220, 'Jarod', 'Hintz', '2004-06-23', 'Other', 'A+', 'Islam', 'Bangladeshi', '0524106495925', '01812899540', 'student220@example.com', '$2y$12$Zj4DVtOnO.1DA.HxDEjQmOg7CFcAAWhs9n7OddqhRCOJdaO2C/jIS', '975 Block Shores\nNew Renefurt, VA 26974-9829', '983 Marisol Trace\nWest Aniya, TX 83184-3715', 'ADM-00220', '2010-01-06', 'B', 'Science', '2025-2026', 'Hansen PLC School', 'Hunter O\'Kon', 'Teacher', '01342394021', 'father220@example.com', '4446183607075', NULL, 'Cali McKenzie', 'Businesswoman', '01933858014', 'mother220@example.com', '5449037587919', NULL, 'Ms. Zaria Stiedemann DVM', '01481240726', 'guardian220@example.com', '8477677343123', 'Aunt', 1, 41, 3, '2025-12-20', NULL, 2025000220, 900220, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59', '127.0.0.1', 1, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59'),
(221, 'Chaya', 'Welch', '1997-02-18', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '0884393461254', '01522942432', 'student221@example.com', '$2y$12$7IgJt1lxZEQRj5.e64lM8uap35WsFYZvkkC.VKE9nabJxl67fhhgW', '36725 Abigale Dam\nMargretshire, NY 92703', '68544 Erik Lane\nDonnellyview, NM 56344-8820', 'ADM-00221', '1997-04-29', 'C', 'Commerce', '2025-2026', 'Zieme-Rowe School', 'Quinn Schimmel', 'Teacher', '01490603357', 'father221@example.com', '7520271281353', NULL, 'Sydnee Pagac Jr.', 'Housewife', '01910913339', 'mother221@example.com', '3155165013780', NULL, 'Mrs. Iva Beier', '01335173062', 'guardian221@example.com', '1957667831470', 'Sister', 1, 46, 2, '2025-12-20', NULL, 2025000221, 900221, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59', '127.0.0.1', 1, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59'),
(222, 'Jana', 'Kohler', '1975-05-04', 'Male', 'B-', 'Hindu', 'Bangladeshi', '8209935241202', '01382010129', 'student222@example.com', '$2y$12$RV9w4wZsf5Uqidql44YcE.aWHsNC6BR8vOB2brVcXpJGPhOQUAubu', '5485 Waelchi Rue\nBeahanport, SC 53976-6804', '8708 Mante Plains Suite 008\nNorth Elsieland, ND 20170-9897', 'ADM-00222', '1991-10-21', 'A', 'Arts', '2025-2026', 'Mayer-Quigley School', 'Nikolas Fritsch', 'Doctor', '01377088144', 'father222@example.com', '2258688705197', NULL, 'Mrs. Abbie Tillman', 'Nurse', '01651687398', 'mother222@example.com', '9555378311812', NULL, 'Dr. Bryana Langworth', '01449778395', 'guardian222@example.com', '4697137486434', 'Grandparent', 1, 42, 3, '2025-12-20', NULL, 2025000222, 900222, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59', '127.0.0.1', 1, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59'),
(223, 'Cory', 'Gerhold', '1994-01-05', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '8161244531504', '01578944906', 'student223@example.com', '$2y$12$NJlAul0AnCUndFcaqJDL2.rDbijGZLkpff7rs8mMXDEGeoIqZQ11.', '811 Brady Island\nRempelfurt, FL 92619-5252', '74154 Goldner Corner Suite 047\nNorth Herminaport, SC 34616', 'ADM-00223', '2002-04-02', 'A', 'Arts', '2025-2026', 'Farrell-Hartmann School', 'Jordyn Botsford', 'Teacher', '01901500545', 'father223@example.com', '6283347079686', NULL, 'Margie Kemmer', 'Businesswoman', '01824325573', 'mother223@example.com', '3656763692243', NULL, 'Coleman Russel', '01825346707', 'guardian223@example.com', '0369121021244', 'Aunt', 1, 48, 1, '2025-12-20', NULL, 2025000223, 900223, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59', '127.0.0.1', 1, NULL, '2025-12-20 08:34:59', '2025-12-20 08:34:59'),
(224, 'Ansley', 'Halvorson', '1973-08-27', 'Other', 'O-', 'Buddhist', 'Bangladeshi', '1480725368212', '01833542947', 'student224@example.com', '$2y$12$NFwEwHlbVEkptTUFP.YYYO07MFA2MVJjJEnuuXd6oD40ytaEzSja6', '37748 Kane Mountains Apt. 388\nWest Jacksonbury, VT 54977-2290', '5958 Walton Causeway Suite 813\nKleinmouth, ND 14121-3487', 'ADM-00224', '1976-02-01', 'B', 'Science', '2025-2026', 'Champlin Inc School', 'Presley Kovacek', 'Teacher', '01934487719', 'father224@example.com', '1048603296784', NULL, 'Mallie Feil PhD', 'Housewife', '01349664582', 'mother224@example.com', '8129246252397', NULL, 'Dr. Lola Parker', '01605731629', 'guardian224@example.com', '1046889055249', 'Brother', 1, 43, 3, '2025-12-20', NULL, 2025000224, 900224, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00', '127.0.0.1', 1, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(225, 'Marquise', 'Hackett', '1989-12-31', 'Other', 'AB+', 'Islam', 'Bangladeshi', '4436400968810', '01717579440', 'student225@example.com', '$2y$12$fBAVqTw3P800WIKpQvUktOr5zzIeJ6.SOkQQ.VTB8GeG9WaY8ksZ.', '335 Ursula Union Suite 100\nJordanefort, NC 10592-3991', '1935 Swaniawski Freeway\nNorth Claudineburgh, CA 69231', 'ADM-00225', '1983-06-15', 'C', 'Commerce', '2025-2026', 'Vandervort, Denesik and Gulgowski School', 'Blaise Romaguera', 'Doctor', '01325465575', 'father225@example.com', '6520610338536', NULL, 'Casandra Tillman', 'Nurse', '01648469885', 'mother225@example.com', '5571067977821', NULL, 'Mrs. Maiya Bogisich', '01601088716', 'guardian225@example.com', '2018112584325', 'Brother', 1, 44, 3, '2025-12-20', NULL, 2025000225, 900225, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00', '127.0.0.1', 1, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00'),
(226, 'Connie', 'Howe', '1987-08-30', 'Other', 'O-', 'Buddhist', 'Bangladeshi', '2656785251992', '01996299581', 'student226@example.com', '$2y$12$wIoGKvavQTK4OqBTk62HeuGfqbiyqGXLwJwA4YVVxd.zn3sRLLC4S', '54031 Hartmann Stravenue Apt. 810\nSouth Michael, ID 89812-0611', '6843 Walter Drive\nTiffanychester, OR 89455', 'ADM-00226', '1983-09-06', 'B', 'Arts', '2025-2026', 'Williamson, Huels and Sipes School', 'Everett Schoen', 'Businessman', '01889550971', 'father226@example.com', '9550103428746', NULL, 'Janet Runte', 'Nurse', '01892579981', 'mother226@example.com', '4087674474288', NULL, 'Mr. Kale McGlynn', '01609565262', 'guardian226@example.com', '8358278527497', 'Grandparent', 1, 41, 4, '2025-12-20', NULL, 2025000226, 900226, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00', '127.0.0.1', 1, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00'),
(227, 'Guy', 'Schumm', '1977-09-05', 'Other', 'A-', 'Hindu', 'Bangladeshi', '5893945952441', '01496628185', 'student227@example.com', '$2y$12$flr8SQq5Tgm94qjMEa/EROkrr6Ik9jmiIkG24C.V9mF/MXudUfRVe', '152 Beatty Valley Suite 883\nSouth Alia, VA 73105-7496', '88989 Ward Parks\nWest Alfordmouth, DE 75455-8089', 'ADM-00227', '1983-08-15', 'A', 'Arts', '2025-2026', 'Rath-Beier School', 'Mr. Dell Orn', 'Doctor', '01560869194', 'father227@example.com', '1684145227118', NULL, 'Fleta Keebler Jr.', 'Doctor', '01840791207', 'mother227@example.com', '3950813516680', NULL, 'Adaline Kirlin II', '01897543405', 'guardian227@example.com', '4226557799263', 'Grandparent', 1, 48, 5, '2025-12-20', NULL, 2025000227, 900227, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00', '127.0.0.1', 1, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00'),
(228, 'Francisco', 'Rippin', '1992-06-05', 'Female', 'AB+', 'Islam', 'Bangladeshi', '6188856388514', '01599147462', 'student228@example.com', '$2y$12$iK17S8evypMSW8ZAXe.uLe4YqpEdim7gPDV.IjJQfhpCGdvsBG9o2', '660 Pat Street Suite 235\nAnnabelleshire, ME 18980-7821', '94604 Hamill Via\nGreenholtburgh, IN 03073-7936', 'ADM-00228', '1984-08-26', 'C', 'Science', '2025-2026', 'Trantow Group School', 'Prof. Aiden Considine', 'Engineer', '01403761852', 'father228@example.com', '0012533608286', NULL, 'Hannah Von', 'Teacher', '01382373245', 'mother228@example.com', '0418909750405', NULL, 'Moriah Parker', '01471150379', 'guardian228@example.com', '1573617264744', 'Brother', 1, 42, 4, '2025-12-20', NULL, 2025000228, 900228, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00', '127.0.0.1', 1, NULL, '2025-12-20 08:35:00', '2025-12-20 08:35:00'),
(229, 'Isac', 'Tillman', '2024-01-01', 'Other', 'O+', 'Christian', 'Bangladeshi', '5574248002606', '01616633280', 'student229@example.com', '$2y$12$nRv624Q7v54tWB.sSf7qCejPw9QMv0AH9vnPcuXO2rjWDaksuvmgS', '4868 Padberg Way Suite 861\nPort Marlen, DE 88753-8552', '2150 Chanel Islands\nBergstromside, ID 38364', 'ADM-00229', '2009-02-22', 'B', 'Commerce', '2025-2026', 'Price-DuBuque School', 'Dedric Nienow', 'Farmer', '01762246059', 'father229@example.com', '1856674801281', NULL, 'Elna Batz IV', 'Housewife', '01303570569', 'mother229@example.com', '1957998374729', NULL, 'Ed Stamm', '01629456452', 'guardian229@example.com', '1664698638901', 'Aunt', 1, 49, 1, '2025-12-20', NULL, 2025000229, 900229, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01', '127.0.0.1', 1, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01'),
(230, 'Daniela', 'Hartmann', '1997-07-23', 'Other', 'B+', 'Other', 'Bangladeshi', '0090393675620', '01486567266', 'student230@example.com', '$2y$12$0M8Ee4URQFjb.SDymlsGbeOzMtPSj3/fz8Q/Qkqgg7rM34EKtHrBK', '81431 Predovic Avenue Suite 679\nBrycenstad, MT 45829', '289 Zander Hill Apt. 115\nPort Winifredside, SC 58033-7153', 'ADM-00230', '1975-08-15', 'A', 'Science', '2025-2026', 'Schaden, Pouros and Schimmel School', 'Arnaldo Wehner DDS', 'Farmer', '01907446382', 'father230@example.com', '2810817372611', NULL, 'Prof. Sydni Lebsack', 'Businesswoman', '01535203879', 'mother230@example.com', '5816437443099', NULL, 'Kaylie Dibbert', '01550695289', 'guardian230@example.com', '3818459353153', 'Grandparent', 1, 45, 3, '2025-12-20', NULL, 2025000230, 900230, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01', '127.0.0.1', 1, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01'),
(231, 'Rodrick', 'Bashirian', '2022-09-21', 'Male', 'O+', 'Hindu', 'Bangladeshi', '4717470224900', '01968746361', 'student231@example.com', '$2y$12$BfmM.KgFzYbvT9ENI1wHCuV4Ev7X5FX0uH6PN/DkWTbNYnn6G.1q2', '70068 Ernser Course Suite 986\nWest Rosalynhaven, SD 93190-0592', '5007 Feest Heights\nWilberview, NJ 54893-2612', 'ADM-00231', '1983-04-28', 'B', 'Commerce', '2025-2026', 'Heller-Jacobson School', 'Kade Marks', 'Teacher', '01541557894', 'father231@example.com', '8973574092219', NULL, 'Allie Hansen', 'Doctor', '01561089625', 'mother231@example.com', '9722731561269', NULL, 'Mrs. Kirsten Weimann', '01322428427', 'guardian231@example.com', '6083297006337', 'Grandparent', 1, 50, 1, '2025-12-20', NULL, 2025000231, 900231, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01', '127.0.0.1', 1, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01'),
(232, 'Tobin', 'Huel', '1973-12-14', 'Male', 'B-', 'Buddhist', 'Bangladeshi', '6427270735373', '01448469347', 'student232@example.com', '$2y$12$zq0u1sTAWbO/XB4crBTPN.ujtC2twZ0aAa2VcolhPiN9zI2.CO8Qm', '548 Nicole Pines Suite 107\nKrajcikberg, OH 37754', '79178 Murray Mill Apt. 825\nPort Mckaylaland, AZ 81313', 'ADM-00232', '1995-08-11', 'B', 'Science', '2025-2026', 'Roberts-Armstrong School', 'Braeden Koss', 'Farmer', '01537070494', 'father232@example.com', '4220717504086', NULL, 'Cayla Jenkins', 'Doctor', '01427315616', 'mother232@example.com', '7143477164120', NULL, 'Lottie Eichmann', '01455726051', 'guardian232@example.com', '5927756771189', 'Aunt', 1, 46, 3, '2025-12-20', NULL, 2025000232, 900232, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01', '127.0.0.1', 1, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01'),
(233, 'Simeon', 'Rutherford', '1974-06-22', 'Other', 'A-', 'Islam', 'Bangladeshi', '3350314656801', '01575424172', 'student233@example.com', '$2y$12$987OqFEqg27pQuhJrHH3z.qzkHR3WFXs6.AdRjY9ak60S5/rI6SNG', '5611 Leif Garden\nVidaport, NC 05880', '48841 Elisabeth Wells\nNorth Woodrow, OR 47252', 'ADM-00233', '2008-05-15', 'B', 'Commerce', '2025-2026', 'Leffler Inc School', 'Raymond Casper', 'Teacher', '01606348337', 'father233@example.com', '3191555723065', NULL, 'Mrs. Pamela Hessel I', 'Nurse', '01636279491', 'mother233@example.com', '6992317767732', NULL, 'Dr. Milford Franecki', '01967890581', 'guardian233@example.com', '6277090612063', 'Brother', 1, 49, 5, '2025-12-20', NULL, 2025000233, 900233, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01', '127.0.0.1', 1, NULL, '2025-12-20 08:35:01', '2025-12-20 08:35:01'),
(234, 'Landen', 'O\'Keefe', '2016-05-03', 'Male', 'A+', 'Christian', 'Bangladeshi', '5962332170808', '01480046447', 'student234@example.com', '$2y$12$kB5knHVZeS7wWK80rq2JVetPeVNyNMJp7P3MkxVkYNdEIDhHGj746', '8028 Yasmin Causeway\nPort Juanitaburgh, MO 32473', '339 Willy Throughway\nTarynfurt, LA 11555', 'ADM-00234', '1993-11-16', 'A', 'Commerce', '2025-2026', 'Corkery Ltd School', 'Kamron DuBuque', 'Engineer', '01543590871', 'father234@example.com', '2262954361417', NULL, 'Mrs. Thora Schroeder', 'Housewife', '01531549644', 'mother234@example.com', '4894710798660', NULL, 'Marques Stanton', '01661689401', 'guardian234@example.com', '5123467910756', 'Brother', 1, 50, 5, '2025-12-20', NULL, 2025000234, 900234, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02', '127.0.0.1', 1, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02'),
(235, 'Ivah', 'Streich', '1987-08-25', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '9563892900539', '01910962047', 'student235@example.com', '$2y$12$5SP/ff57d5WZGd4GI0liwuekQT6xkBU0zsAcEMlkpQWIojHAF.SW2', '688 Ledner View\nEast Dillan, ND 65492-3619', '6458 Bahringer Stravenue Suite 519\nSouth Annettaville, RI 73661-4842', 'ADM-00235', '2016-12-06', 'C', 'Science', '2025-2026', 'Cruickshank, Collier and Tremblay School', 'Mr. Narciso Brakus PhD', 'Engineer', '01468650842', 'father235@example.com', '3619374574427', NULL, 'Prof. Jammie Wilderman', 'Housewife', '01532681404', 'mother235@example.com', '4826667639516', NULL, 'Callie Brekke', '01437708217', 'guardian235@example.com', '2755563490094', 'Grandparent', 1, 43, 4, '2025-12-20', NULL, 2025000235, 900235, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02', '127.0.0.1', 1, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02'),
(236, 'Leon', 'Towne', '1998-05-29', 'Female', 'AB-', 'Other', 'Bangladeshi', '4875769599329', '01676264143', 'student236@example.com', '$2y$12$2boo.PgeXU78cKNgrfst4.9loFZl14UiJv2XydDNIS3Dq4uAeaytO', '227 Bradtke Land Suite 077\nRoelville, MD 04530', '2254 Nathan Extension\nPort Jordanstad, WY 49075', 'ADM-00236', '2005-06-21', 'C', 'Commerce', '2025-2026', 'Streich, Cruickshank and Mueller School', 'Stephan Tremblay', 'Businessman', '01486117169', 'father236@example.com', '5172426402039', NULL, 'Ms. Thalia Koch Sr.', 'Housewife', '01867486890', 'mother236@example.com', '6667882325499', NULL, 'Lela Carroll', '01525797173', 'guardian236@example.com', '4543811481148', 'Grandparent', 1, 47, 3, '2025-12-20', NULL, 2025000236, 900236, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02', '127.0.0.1', 1, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02'),
(237, 'Lolita', 'Botsford', '1984-08-23', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '4348549856708', '01880103758', 'student237@example.com', '$2y$12$tkO/RxSsEQyPjToClSSyqOzhZxjouvfhru2.oyM4z/wqVl6xAm80i', '61081 Leannon Village Suite 237\nSouth Bridgette, KY 30609-3884', '334 Kub Shores Apt. 198\nJessycastad, PA 98959', 'ADM-00237', '1997-01-17', 'B', 'Arts', '2025-2026', 'Veum PLC School', 'Ubaldo Wehner', 'Businessman', '01392784419', 'father237@example.com', '8809523907619', NULL, 'Dr. Lucie Altenwerth PhD', 'Nurse', '01373687379', 'mother237@example.com', '4745643002141', NULL, 'Ilene Bergnaum', '01437182468', 'guardian237@example.com', '0313504669253', 'Brother', 1, 51, 1, '2025-12-20', NULL, 2025000237, 900237, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02', '127.0.0.1', 1, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02'),
(238, 'Eulalia', 'Rau', '1988-12-14', 'Male', 'B-', 'Other', 'Bangladeshi', '1844946772772', '01774753102', 'student238@example.com', '$2y$12$eH0HF8TBbtCCJHye.MIpTuDKtOBzVXrLBboeHH0Mz/57ubXitLtUW', '69218 Adriel Knolls Suite 735\nBoehmbury, CO 60484', '13056 Ernesto Forge\nNew Meaghanmouth, MA 52670-2486', 'ADM-00238', '2014-02-23', 'A', 'Commerce', '2025-2026', 'Schneider Ltd School', 'Cale Tromp IV', 'Engineer', '01667273007', 'father238@example.com', '1528332633821', NULL, 'Zelda Heaney MD', 'Businesswoman', '01645068302', 'mother238@example.com', '7732220661416', NULL, 'Candida Mohr', '01660822779', 'guardian238@example.com', '9898735041435', 'Uncle', 1, 44, 4, '2025-12-20', NULL, 2025000238, 900238, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02', '127.0.0.1', 1, NULL, '2025-12-20 08:35:02', '2025-12-20 08:35:02'),
(239, 'Salma', 'Mosciski', '1983-08-13', 'Female', 'B+', 'Islam', 'Bangladeshi', '8067161217163', '01787718638', 'student239@example.com', '$2y$12$sZDvQjTdTf.mSdxoczf7PuR/tBQXPnMBptEw0RziZa7IlqBcD6wcW', '1482 Wiegand Green Suite 596\nCorkeryland, MD 38184', '9956 Aglae Fork Suite 872\nGulgowskiland, IN 30313-6515', 'ADM-00239', '2008-05-16', 'A', 'Arts', '2025-2026', 'Kiehn, Pfeffer and Haag School', 'Gregorio Block', 'Teacher', '01677904331', 'father239@example.com', '5667154377150', NULL, 'Dr. Gertrude Bernhard', 'Businesswoman', '01524741104', 'mother239@example.com', '3238283749096', NULL, 'Ludie Denesik II', '01988703042', 'guardian239@example.com', '1673319475726', 'Brother', 1, 48, 3, '2025-12-20', NULL, 2025000239, 900239, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03', '127.0.0.1', 1, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03'),
(240, 'Emilia', 'Denesik', '1998-02-23', 'Male', 'AB+', 'Other', 'Bangladeshi', '3588140407682', '01505788694', 'student240@example.com', '$2y$12$DzRQg73PT.gVFYK3UKhZNe3L5omwbuhZJQYQye5xyb5s3pQEfmZaK', '249 Torphy Orchard Apt. 397\nOriefurt, IL 01956', '3621 Sawayn Haven Apt. 511\nEast Destin, NM 20108', 'ADM-00240', '1989-05-12', 'C', 'Commerce', '2025-2026', 'Hamill-Boehm School', 'Ezekiel Kris', 'Businessman', '01796280952', 'father240@example.com', '9053825343039', NULL, 'Polly Olson', 'Doctor', '01478674749', 'mother240@example.com', '0947557219354', NULL, 'Melba Feil V', '01543699370', 'guardian240@example.com', '8385561790106', 'Uncle', 1, 45, 4, '2025-12-20', NULL, 2025000240, 900240, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03', '127.0.0.1', 1, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03'),
(241, 'Jabari', 'Ziemann', '1984-08-19', 'Male', 'AB-', 'Other', 'Bangladeshi', '8389384500744', '01321622590', 'student241@example.com', '$2y$12$J1MWP/YdzicjGUbuK225EOUIZciGgQJRd3on1oeBnJgknnKNcxFEK', '2804 Maye Ford\nPort Maximillia, MO 99353', '341 Dessie Route\nMerlefurt, VT 39998-4915', 'ADM-00241', '1983-12-06', 'B', 'Arts', '2025-2026', 'Shields, Kub and Beier School', 'Dr. Kolby Schuster', 'Engineer', '01538498712', 'father241@example.com', '9601831644591', NULL, 'Prof. Skyla Spinka', 'Nurse', '01567625623', 'mother241@example.com', '8580210101003', NULL, 'Maudie Sawayn DDS', '01392201557', 'guardian241@example.com', '9420133327881', 'Sister', 1, 49, 3, '2025-12-20', NULL, 2025000241, 900241, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03', '127.0.0.1', 1, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03'),
(242, 'Muriel', 'Gusikowski', '2017-08-02', 'Female', 'AB+', 'Buddhist', 'Bangladeshi', '3107685233070', '01429262028', 'student242@example.com', '$2y$12$MR/uxidguhyPEN7C1p38p.Wnw7dgLTg8bDNqMgcSCjxX9fMbhgzEe', '143 O\'Kon Island\nKochfort, WY 47725-6866', '4243 Pagac Fields Suite 490\nKoelpinton, IA 00551', 'ADM-00242', '2018-01-04', 'B', 'Arts', '2025-2026', 'Champlin-Hammes School', 'Llewellyn Wunsch I', 'Teacher', '01673208401', 'father242@example.com', '3959622453037', NULL, 'Miss Luna Bradtke', 'Doctor', '01432540648', 'mother242@example.com', '6059265611851', NULL, 'Maxie Kovacek', '01840556193', 'guardian242@example.com', '4721156740446', 'Brother', 1, 51, 5, '2025-12-20', NULL, 2025000242, 900242, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03', '127.0.0.1', 1, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03'),
(243, 'Marlen', 'Quitzon', '2003-03-28', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '9769382141871', '01524144392', 'student243@example.com', '$2y$12$L8U0KyqoDhjvA9BsLnYB9OxJJIckA6nJK9FiHpr34j0zecYdRY7IO', '531 Stanton Camp Apt. 231\nKubfurt, WI 98848', '6420 Alison Port Apt. 515\nWest Addie, WI 44603-0540', 'ADM-00243', '1999-02-17', 'A', 'Arts', '2025-2026', 'Aufderhar-Doyle School', 'Mr. Moshe Kling PhD', 'Teacher', '01898980208', 'father243@example.com', '7009798735460', NULL, 'Trisha Jast', 'Nurse', '01659688054', 'mother243@example.com', '8085805280661', NULL, 'Alexander Blick', '01865789285', 'guardian243@example.com', '2176347202847', 'Brother', 1, 52, 5, '2025-12-20', NULL, 2025000243, 900243, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03', '127.0.0.1', 1, NULL, '2025-12-20 08:35:03', '2025-12-20 08:35:03'),
(244, 'Vito', 'Kling', '1979-05-30', 'Other', 'AB+', 'Christian', 'Bangladeshi', '8076340814040', '01409145736', 'student244@example.com', '$2y$12$n/McPetZh2C1PaKdUbLeaOsIbm8nI1dZrZG7Kfa19aYUBEbzej6Lu', '7679 Adonis Brooks\nSouth Hankborough, MT 49744-4255', '960 Koelpin Ridges\nEthylmouth, MS 35151-8796', 'ADM-00244', '1977-07-04', 'B', 'Commerce', '2025-2026', 'Jenkins LLC School', 'Nels Harvey', 'Engineer', '01935323871', 'father244@example.com', '9100874106668', NULL, 'Loyce Lubowitz', 'Teacher', '01405796219', 'mother244@example.com', '0439484321993', NULL, 'Marcus Gusikowski IV', '01351706709', 'guardian244@example.com', '5640025447514', 'Aunt', 1, 52, 1, '2025-12-20', NULL, 2025000244, 900244, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04', '127.0.0.1', 1, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04'),
(245, 'Audreanne', 'Johns', '1989-09-13', 'Female', 'A-', 'Buddhist', 'Bangladeshi', '7383832668174', '01694829124', 'student245@example.com', '$2y$12$KBXC99L77KjjOtfzGMdZ4uefhl/.HiGuYOxnp1orcJi7A8e0/Gg.2', '6526 Nigel Vista\nLake Terencefurt, OR 40272', '59659 Mortimer Isle Apt. 904\nNorth Linwood, OR 82483-8879', 'ADM-00245', '2016-04-02', 'B', 'Science', '2025-2026', 'Jenkins-Rippin School', 'Gerson Larson', 'Doctor', '01623976747', 'father245@example.com', '2169659733977', NULL, 'Sandra Kessler', 'Businesswoman', '01301265721', 'mother245@example.com', '1801581299247', NULL, 'Vena Davis II', '01754704437', 'guardian245@example.com', '3035476862763', 'Grandparent', 1, 53, 5, '2025-12-20', NULL, 2025000245, 900245, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04', '127.0.0.1', 1, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04'),
(246, 'Phyllis', 'Feest', '2021-12-10', 'Other', 'B-', 'Hindu', 'Bangladeshi', '9057516370133', '01305392414', 'student246@example.com', '$2y$12$jSCIiCqlhcK6xHQIAdHfPeX5ZvY8I/X0kYO6Oi7jKSNWPs6u3jFUa', '786 Volkman Prairie Suite 527\nHeathermouth, KY 20899-7722', '192 Schneider Bypass\nPort Blazeshire, VT 19588-9755', 'ADM-00246', '1976-05-19', 'C', 'Science', '2025-2026', 'Kuhlman-Gottlieb School', 'Damien O\'Kon IV', 'Teacher', '01543730687', 'father246@example.com', '3047355551176', NULL, 'Ethyl Gulgowski II', 'Housewife', '01560830702', 'mother246@example.com', '6879397640928', NULL, 'Cierra Powlowski', '01378115672', 'guardian246@example.com', '5686139238195', 'Sister', 1, 53, 1, '2025-12-20', NULL, 2025000246, 900246, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04', '127.0.0.1', 1, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04'),
(247, 'Rodolfo', 'Gerhold', '1979-08-15', 'Female', 'B+', 'Other', 'Bangladeshi', '5422524700602', '01553422435', 'student247@example.com', '$2y$12$Gh72nHImOWZl8UZcqNFJuOHmefyIU0bNm.3qnCPWwlfgsPAD18vza', '157 Hackett Unions Suite 506\nUrielmouth, LA 00653-2710', '31033 Schimmel Rue Apt. 934\nWest Lowell, TN 55597', 'ADM-00247', '1983-07-18', 'B', 'Science', '2025-2026', 'Kunze LLC School', 'Mr. Elvis Wilderman', 'Teacher', '01464712316', 'father247@example.com', '9353295785664', NULL, 'Miss Clarabelle Beatty II', 'Teacher', '01549558357', 'mother247@example.com', '7307864334904', NULL, 'Miss Reanna Hamill', '01517231525', 'guardian247@example.com', '3419025657498', 'Grandparent', 1, 50, 3, '2025-12-20', NULL, 2025000247, 900247, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04', '127.0.0.1', 1, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04'),
(248, 'Erwin', 'Lehner', '1986-04-02', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '7125927348895', '01336924694', 'student248@example.com', '$2y$12$XSH0bM8Q9Oxgv7JXw6JPaePEDcjD5aHnCYrS3lvL8HA2gA3JMfkLK', '70140 Kling Burgs\nLake Patricia, IL 62291-6910', '943 Zoe Club\nEast Broderickborough, TN 74302', 'ADM-00248', '1986-02-04', 'C', 'Science', '2025-2026', 'Schumm, Yost and Nolan School', 'Sigrid Kulas', 'Farmer', '01445501911', 'father248@example.com', '2324639757035', NULL, 'Caitlyn Hahn', 'Nurse', '01705953131', 'mother248@example.com', '0037849286993', NULL, 'Dr. Dorris Armstrong', '01785882050', 'guardian248@example.com', '3385572133985', 'Sister', 1, 54, 1, '2025-12-20', NULL, 2025000248, 900248, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04', '127.0.0.1', 1, NULL, '2025-12-20 08:35:04', '2025-12-20 08:35:04'),
(249, 'Ignatius', 'Buckridge', '2010-06-10', 'Female', 'AB-', 'Other', 'Bangladeshi', '8444476415852', '01962198978', 'student249@example.com', '$2y$12$o7y.l1nGu/qj9vDOeappKOlbeUcBdNg/Ya6aG5v0d37nsY8tDnUh6', '851 Mariano Plains\nWardchester, MI 82137-6720', '2680 Frances Tunnel\nRosieport, OH 89656', 'ADM-00249', '1981-04-21', 'C', 'Science', '2025-2026', 'Jacobson, Boehm and Sauer School', 'Ariel Mayert', 'Doctor', '01896711448', 'father249@example.com', '7750112060330', NULL, 'Elnora Okuneva', 'Housewife', '01484631434', 'mother249@example.com', '2793198606527', NULL, 'Liliana Mosciski', '01880743539', 'guardian249@example.com', '5318354000364', 'Grandparent', 1, 47, 2, '2025-12-20', NULL, 2025000249, 900249, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05', '127.0.0.1', 1, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05'),
(250, 'Mafalda', 'Fisher', '1998-06-10', 'Male', 'O+', 'Buddhist', 'Bangladeshi', '0119051265600', '01813982363', 'student250@example.com', '$2y$12$sZjsD8BoUgPf1K0Y/co83OTbUN/Bp7ZrJ33.M7xyccMu7XmHRaTKC', '1859 Lehner Views Suite 180\nNew Maximilliaburgh, ND 60913-2450', '2003 Abbott Cliff Apt. 746\nHoytshire, PA 82700-8396', 'ADM-00250', '1977-02-21', 'C', 'Science', '2025-2026', 'O\'Hara-Kuhic School', 'Dr. Fausto Reichert I', 'Farmer', '01506720157', 'father250@example.com', '9972710318957', NULL, 'Emmalee Purdy', 'Teacher', '01595407343', 'mother250@example.com', '0488976328654', NULL, 'Mallory Cremin', '01903183015', 'guardian250@example.com', '5006003218002', 'Grandparent', 1, 51, 3, '2025-12-20', NULL, 2025000250, 900250, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05', '127.0.0.1', 1, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05'),
(251, 'Noah', 'Crist', '1981-02-12', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '9924012281021', '01579716932', 'student251@example.com', '$2y$12$m.UdsRT7Q2Ru8Nb49X9XKeO.4XizN.9TtarSCoU8nV/V4mkiUfEoW', '236 Nikolas Course\nPort Esmeralda, VT 27063-8875', '509 Rodriguez Island\nAdamsborough, IA 77878', 'ADM-00251', '2023-03-26', 'C', 'Commerce', '2025-2026', 'Oberbrunner, Zboncak and Schamberger School', 'Prof. Arnaldo Gleason', 'Teacher', '01779617138', 'father251@example.com', '1996160884606', NULL, 'Brittany Marks DDS', 'Businesswoman', '01874605717', 'mother251@example.com', '7146026016845', NULL, 'Dr. Maryse Mitchell', '01829561038', 'guardian251@example.com', '9923161335977', 'Aunt', 1, 48, 2, '2025-12-20', NULL, 2025000251, 900251, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05', '127.0.0.1', 1, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05'),
(252, 'Terrance', 'Stanton', '1994-09-27', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '1485670789963', '01443960526', 'student252@example.com', '$2y$12$PCw39Es7qqQ5HHOeFsvKkOqvjLOXA0laYQZkA7l5c0S3gbTsreC0m', '316 Elias Ferry\nCorkeryhaven, FL 35836-2357', '2522 Quitzon Place Apt. 622\nPort Ignatius, AR 96942-2249', 'ADM-00252', '1995-11-30', 'C', 'Science', '2025-2026', 'Strosin, Stiedemann and Graham School', 'Kennedy Kautzer', 'Farmer', '01859243766', 'father252@example.com', '7392169923131', NULL, 'Mrs. Libbie Balistreri DDS', 'Housewife', '01907916247', 'mother252@example.com', '5949280619232', NULL, 'Marjolaine Mitchell', '01838241652', 'guardian252@example.com', '6710708595303', 'Aunt', 1, 52, 3, '2025-12-20', NULL, 2025000252, 900252, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05', '127.0.0.1', 1, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05'),
(253, 'Willow', 'Shanahan', '2020-12-25', 'Male', 'AB-', 'Islam', 'Bangladeshi', '8163149443534', '01458477306', 'student253@example.com', '$2y$12$af7WxX2cFp8zuDRVeEXdAema2cH98APdlUaMcU4vmLLuCLa2pAjJm', '5779 Moore Field\nPort Jasmin, TN 50559', '1337 Pearl Expressway Apt. 571\nFeltonfort, TX 69710-2096', 'ADM-00253', '1990-03-15', 'A', 'Commerce', '2025-2026', 'Schroeder-Greenfelder School', 'Adam Ward', 'Farmer', '01869338280', 'father253@example.com', '6917479420664', NULL, 'Dr. Daphne Kuphal II', 'Doctor', '01312803312', 'mother253@example.com', '0140698576952', NULL, 'Dr. Colten Nicolas Sr.', '01468361374', 'guardian253@example.com', '1413105024257', 'Sister', 1, 49, 2, '2025-12-20', NULL, 2025000253, 900253, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05', '127.0.0.1', 1, NULL, '2025-12-20 08:35:05', '2025-12-20 08:35:05'),
(254, 'Edythe', 'Satterfield', '1992-07-11', 'Female', 'B+', 'Hindu', 'Bangladeshi', '6580553899809', '01731935816', 'student254@example.com', '$2y$12$dS5JSXvPJVshh5jULXN5OOWZALBffl19pAYXTZl4W4idooP8QF7r.', '93282 Dolores Land Suite 419\nSouth Alvah, MD 43316-4879', '19168 Loren Expressway\nWest Ashleyport, DE 05459', 'ADM-00254', '2008-03-28', 'B', 'Arts', '2025-2026', 'Schinner-Emmerich School', 'Stanton Ortiz IV', 'Doctor', '01451093256', 'father254@example.com', '8464099867877', NULL, 'Lavina Yost', 'Doctor', '01895853697', 'mother254@example.com', '6873573346851', NULL, 'Prof. Dale Bernier PhD', '01699211628', 'guardian254@example.com', '8377477414931', 'Grandparent', 1, 50, 2, '2025-12-20', NULL, 2025000254, 900254, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06', '127.0.0.1', 1, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06'),
(255, 'Judson', 'Kessler', '2015-10-11', 'Female', 'AB-', 'Christian', 'Bangladeshi', '4766192057017', '01498746215', 'student255@example.com', '$2y$12$n2NTl4p0H5aX4QqACSh.1euBvRbTzyhce6Sgw.SuPImKn1EykZkBW', '95459 Fatima Radial Apt. 686\nLake Natasha, MI 00564-1261', '1965 Johnston Radial\nGrahammouth, IN 58468-5970', 'ADM-00255', '1988-11-09', 'B', 'Arts', '2025-2026', 'McKenzie-Zemlak School', 'Kennedi Kris', 'Businessman', '01341555461', 'father255@example.com', '9269173186918', NULL, 'Clemmie Konopelski', 'Doctor', '01527520456', 'mother255@example.com', '8565359242199', NULL, 'Mr. Angel Balistreri DDS', '01773349289', 'guardian255@example.com', '8827682160958', 'Grandparent', 1, 54, 5, '2025-12-20', NULL, 2025000255, 900255, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06', '127.0.0.1', 1, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06'),
(256, 'Marty', 'Boyer', '2021-01-29', 'Other', 'AB+', 'Christian', 'Bangladeshi', '5669306820037', '01465052836', 'student256@example.com', '$2y$12$z2.mdLZNcLSDVYyX0fZmjuqDTVpKrofYO61.9h8sZ5RLPG14h.gWu', '75112 Runte Cliffs Suite 556\nSchowalterbury, CT 77328-6496', '2765 Gerlach Valleys\nSouth Casimir, VT 75902-3662', 'ADM-00256', '2011-07-13', 'A', 'Commerce', '2025-2026', 'Stamm, Hill and Hoeger School', 'Prof. Braeden Lubowitz', 'Engineer', '01540992505', 'father256@example.com', '5461951127875', NULL, 'Aurelie Kutch', 'Doctor', '01584502482', 'mother256@example.com', '8495533334976', NULL, 'Lennie Jenkins', '01749385803', 'guardian256@example.com', '9994353250444', 'Sister', 1, 55, 5, '2025-12-20', NULL, 2025000256, 900256, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06', '127.0.0.1', 1, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06'),
(257, 'Ayana', 'Kshlerin', '2025-05-17', 'Male', 'O-', 'Buddhist', 'Bangladeshi', '0683330124163', '01329583440', 'student257@example.com', '$2y$12$JUz8cSdCWq5Fl6tkglxWaO5U9S8YYo69Zcx42IQl5txHck4dwc09W', '619 Eulalia Heights Suite 664\nNew Bridieton, NC 72715', '5652 Leffler Lane\nTaniashire, MN 52693-4468', 'ADM-00257', '2001-05-30', 'B', 'Arts', '2025-2026', 'Bode Group School', 'Jess Borer', 'Farmer', '01825535764', 'father257@example.com', '7809431081431', NULL, 'Madonna Barrows', 'Doctor', '01750056080', 'mother257@example.com', '9500783601720', NULL, 'Haylee Lang', '01785887178', 'guardian257@example.com', '2686174412050', 'Grandparent', 1, 53, 3, '2025-12-20', NULL, 2025000257, 900257, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06', '127.0.0.1', 1, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06'),
(258, 'Dulce', 'Koch', '1979-07-17', 'Other', 'O+', 'Buddhist', 'Bangladeshi', '8493114895721', '01544258023', 'student258@example.com', '$2y$12$3/jTyluHjbUxu3Yk0hVsvucmJ6ZZGS9B8juXaIqolAuERgTXwXP8G', '26298 Destini Greens Suite 577\nLuettgenchester, MO 73725-9798', '36911 Julio Parkways\nEast Christopher, OR 58123-7194', 'ADM-00258', '2002-01-23', 'A', 'Commerce', '2025-2026', 'Langworth, Glover and Dicki School', 'Mitchel Parker', 'Businessman', '01966203446', 'father258@example.com', '7786046012556', NULL, 'Shyanne Gutkowski', 'Housewife', '01863938056', 'mother258@example.com', '0494798456035', NULL, 'Daisha Rice', '01860132078', 'guardian258@example.com', '2581299680200', 'Uncle', 1, 55, 1, '2025-12-20', NULL, 2025000258, 900258, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06', '127.0.0.1', 1, NULL, '2025-12-20 08:35:06', '2025-12-20 08:35:06'),
(259, 'Vicente', 'Glover', '1999-01-10', 'Female', 'O-', 'Buddhist', 'Bangladeshi', '7335116738662', '01628912052', 'student259@example.com', '$2y$12$GmpR9O9gA409iqetnayRV.PO945Y2n0.UCdiw2j1HdEyZm/8XfP2u', '778 Michael Square Suite 287\nNorth Akeem, LA 08862', '11445 Predovic Station Apt. 178\nHellershire, AR 66971', 'ADM-00259', '2002-10-25', 'A', 'Commerce', '2025-2026', 'Swift Group School', 'Marques White', 'Teacher', '01985472432', 'father259@example.com', '1901141257014', NULL, 'Kathryn Lueilwitz', 'Nurse', '01774919341', 'mother259@example.com', '3795034013704', NULL, 'Dr. Jayme Kub MD', '01734961584', 'guardian259@example.com', '8315361305203', 'Sister', 1, 56, 1, '2025-12-20', NULL, 2025000259, 900259, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07', '127.0.0.1', 1, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07'),
(260, 'Meaghan', 'Lang', '1978-03-29', 'Other', 'AB+', 'Christian', 'Bangladeshi', '0563002363764', '01964970032', 'student260@example.com', '$2y$12$3KHb/vpl9XtsdzxwymBoI.uqpiyTkFLPuR9Xlc82QloBmbfemRNgi', '28781 Kris Parks Apt. 627\nLangworthview, NH 52413', '723 Walsh Turnpike\nJudyton, TN 50110', 'ADM-00260', '2009-05-19', 'C', 'Science', '2025-2026', 'Kirlin, McCullough and Wintheiser School', 'Dr. Charlie Hermiston', 'Farmer', '01632989284', 'father260@example.com', '0730045439106', NULL, 'Peggie Brekke', 'Nurse', '01678265585', 'mother260@example.com', '3541692355684', NULL, 'Leonardo Stracke', '01603719152', 'guardian260@example.com', '7257213816823', 'Brother', 1, 57, 1, '2025-12-20', NULL, 2025000260, 900260, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07', '127.0.0.1', 1, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07'),
(261, 'Tina', 'Wisoky', '1973-12-09', 'Male', 'AB+', 'Islam', 'Bangladeshi', '1144216251919', '01988370432', 'student261@example.com', '$2y$12$1VNsgXtRPpcupPiDD1t9Pe5D4Lg/6e7f0NF56p4tQnbgE6MsgeV62', '8326 Grant Lodge\nSteuberberg, TX 14226-3789', '7913 Howe Loaf\nEichmannstad, AR 39589-1950', 'ADM-00261', '1993-01-15', 'C', 'Arts', '2025-2026', 'Williamson-Aufderhar School', 'Estevan Koch', 'Businessman', '01908174896', 'father261@example.com', '8212081913818', NULL, 'Melyssa Walker', 'Nurse', '01717988704', 'mother261@example.com', '6632694905365', NULL, 'Otha Douglas', '01423822647', 'guardian261@example.com', '1418519613527', 'Grandparent', 1, 51, 2, '2025-12-20', NULL, 2025000261, 900261, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07', '127.0.0.1', 1, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07'),
(262, 'Donna', 'Kunde', '2003-06-19', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '0744852104245', '01667237529', 'student262@example.com', '$2y$12$fZfuSMNkgD9.HTiMKdOsvO2TWSR.jvaLENXsOspua0p/fpPTTycuS', '6332 Schulist Stravenue Suite 165\nNew Damien, IA 45018-1540', '35224 Bernardo Dam\nBaumbachville, NY 41212-8847', 'ADM-00262', '1994-11-20', 'C', 'Arts', '2025-2026', 'Mosciski-Collins School', 'Edgar O\'Reilly', 'Businessman', '01719619952', 'father262@example.com', '3422133920994', NULL, 'Shannon Feest', 'Doctor', '01755112250', 'mother262@example.com', '5964813187578', NULL, 'Destin Cruickshank', '01933824564', 'guardian262@example.com', '6973588010211', 'Uncle', 1, 46, 4, '2025-12-20', NULL, 2025000262, 900262, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07', '127.0.0.1', 1, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07'),
(263, 'Hillary', 'Nicolas', '2011-06-10', 'Female', 'A+', 'Hindu', 'Bangladeshi', '2749216436601', '01621188134', 'student263@example.com', '$2y$12$wcATrQdGd.3NuV3/Y/1q5eRujlVgpkVhKd6K1R9gItF6DPgQLFOVy', '8044 Terrell Neck Apt. 336\nWest Gerhardfurt, TX 65834-8015', '2046 Ebba Canyon\nLake Jesus, MO 00265-1520', 'ADM-00263', '2019-03-07', 'C', 'Commerce', '2025-2026', 'Lueilwitz-Sipes School', 'Prof. Tyrell Schumm MD', 'Teacher', '01792800840', 'father263@example.com', '0689704606894', NULL, 'Bonita Weimann', 'Nurse', '01812628182', 'mother263@example.com', '5472241181758', NULL, 'Juanita Kertzmann', '01884402084', 'guardian263@example.com', '9190407231402', 'Brother', 1, 47, 4, '2025-12-20', NULL, 2025000263, 900263, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07', '127.0.0.1', 1, NULL, '2025-12-20 08:35:07', '2025-12-20 08:35:07'),
(264, 'Mandy', 'Lind', '2005-09-02', 'Female', 'B+', 'Hindu', 'Bangladeshi', '6030474761571', '01593372154', 'student264@example.com', '$2y$12$I.hfY/mNdAcHhefaKSqkGOFyVWVnCYWfeZjUDxfUi1plsjScbeLcC', '25248 Hoeger Circles\nLeannonfurt, AR 92522-8696', '4583 Winona Ports Apt. 717\nWest Dejah, CO 61533-4114', 'ADM-00264', '1998-07-01', 'C', 'Commerce', '2025-2026', 'Ondricka LLC School', 'Prof. Kaden Kulas', 'Farmer', '01919283796', 'father264@example.com', '7943946185615', NULL, 'Dr. Stefanie Ondricka DDS', 'Housewife', '01638806190', 'mother264@example.com', '3210002711313', NULL, 'Maverick Nitzsche MD', '01505036291', 'guardian264@example.com', '0954359451380', 'Uncle', 1, 54, 3, '2025-12-20', NULL, 2025000264, 900264, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08', '127.0.0.1', 1, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08'),
(265, 'Prudence', 'Gislason', '1995-04-13', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '7642499360523', '01790140412', 'student265@example.com', '$2y$12$hD6fz/Sf/s2otm1IK3vKP.3OswWqKgt57sJ1zk4E387AvsqoF.Wle', '427 Reichel View\nCollierport, ID 99514', '3103 Prosacco Highway Suite 027\nNorth Edison, OH 69140-8847', 'ADM-00265', '2025-10-28', 'C', 'Science', '2025-2026', 'Frami-Kshlerin School', 'Gunner Kuvalis', 'Teacher', '01571150656', 'father265@example.com', '1933149448163', NULL, 'Sylvia Bailey', 'Businesswoman', '01384459135', 'mother265@example.com', '9921525736240', NULL, 'Nelda Rempel I', '01957966192', 'guardian265@example.com', '7354170670109', 'Sister', 1, 52, 2, '2025-12-20', NULL, 2025000265, 900265, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08', '127.0.0.1', 1, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08'),
(266, 'Demario', 'VonRueden', '2019-12-03', 'Female', 'B-', 'Christian', 'Bangladeshi', '6469687145094', '01934404935', 'student266@example.com', '$2y$12$57dqLrwcv6JxHNMHYZF47.U/Ln6HslVQSdLr7RYSr7Mv5tJbE.1QW', '910 Rosemary Expressway Apt. 628\nRosendobury, MT 14662', '332 Schowalter Circle Apt. 543\nKarelleland, MN 11145-5120', 'ADM-00266', '1989-08-21', 'A', 'Commerce', '2025-2026', 'Lowe, Wolff and Bernhard School', 'John Kovacek', 'Engineer', '01657915243', 'father266@example.com', '0863219912816', NULL, 'Zella Toy', 'Housewife', '01620118932', 'mother266@example.com', '3586018160109', NULL, 'Bart Rice', '01613888273', 'guardian266@example.com', '8774641955610', 'Aunt', 1, 48, 4, '2025-12-20', NULL, 2025000266, 900266, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08', '127.0.0.1', 1, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08'),
(267, 'Thad', 'Bosco', '1970-06-07', 'Male', 'O+', 'Buddhist', 'Bangladeshi', '5267170429564', '01463248561', 'student267@example.com', '$2y$12$svF27.1ZORYZt3ipdyWr/eTb78gesUST/oOFxpJMC5WeYUnK5YNvm', '3936 Roslyn Springs Suite 962\nAmarabury, VT 56885-5570', '7063 River Junction Suite 254\nJohnnyfort, AR 13711-2458', 'ADM-00267', '2005-06-15', 'B', 'Arts', '2025-2026', 'Tremblay Inc School', 'Taurean Bergstrom', 'Doctor', '01431004850', 'father267@example.com', '1109764704715', NULL, 'Miss Ernestine Bernier IV', 'Teacher', '01704242220', 'mother267@example.com', '2536291713316', NULL, 'Darius Hoeger', '01547699112', 'guardian267@example.com', '5113259010863', 'Grandparent', 1, 55, 3, '2025-12-20', NULL, 2025000267, 900267, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08', '127.0.0.1', 1, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08'),
(268, 'Buster', 'Green', '2019-11-09', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '2152349878782', '01336381304', 'student268@example.com', '$2y$12$p/MHKDGC/vZT9qzlAk5gv.i45/J3Z2Ppr9X0Az8Bz5EXH6qaCO7A6', '51857 Andy Shore\nAglaeport, MI 26590-5818', '862 Haylie Trace Apt. 464\nLancehaven, GA 12481', 'ADM-00268', '1984-08-02', 'C', 'Commerce', '2025-2026', 'Konopelski-Ritchie School', 'Prof. Lew Zboncak', 'Engineer', '01655583971', 'father268@example.com', '8182122781986', NULL, 'Mae Schmeler', 'Nurse', '01583292634', 'mother268@example.com', '5910599653850', NULL, 'Laney O\'Reilly', '01613093575', 'guardian268@example.com', '5066703458101', 'Uncle', 1, 56, 5, '2025-12-20', NULL, 2025000268, 900268, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08', '127.0.0.1', 1, NULL, '2025-12-20 08:35:08', '2025-12-20 08:35:08'),
(269, 'Amanda', 'Franecki', '2013-03-03', 'Other', 'AB-', 'Other', 'Bangladeshi', '2753023491415', '01589434806', 'student269@example.com', '$2y$12$DOPwYttIORjAfDZba726cuOKCAhavLJsxRfSExd6e8sDeSJzU/Wf2', '3884 McCullough Place Suite 985\nAhmadmouth, NE 10002-2954', '94157 Brennan Islands Apt. 781\nNew Pearlie, AL 12991-6862', 'ADM-00269', '1980-05-10', 'B', 'Arts', '2025-2026', 'Swaniawski-Conn School', 'Torey Swift', 'Teacher', '01674640973', 'father269@example.com', '4251495266425', NULL, 'Bridgette Raynor', 'Teacher', '01933755874', 'mother269@example.com', '4217195418305', NULL, 'Joana Wisoky', '01705193021', 'guardian269@example.com', '6720580353510', 'Brother', 1, 57, 5, '2025-12-20', NULL, 2025000269, 900269, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09', '127.0.0.1', 1, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09'),
(270, 'Danny', 'Schaefer', '2019-06-20', 'Female', 'AB-', 'Christian', 'Bangladeshi', '7909812795586', '01447941496', 'student270@example.com', '$2y$12$0NstieX7cU7YE1ff9dvwYujXNXVLD89sWvO1Bmgnm4kvGS.L5i/qq', '70982 Kulas Mall\nEldridgehaven, IA 52232-2423', '90021 Vernon View\nKamilleborough, NH 73880-0355', 'ADM-00270', '2002-09-17', 'C', 'Science', '2025-2026', 'Purdy, Pagac and Deckow School', 'Mr. Marquis Stamm', 'Businessman', '01539562350', 'father270@example.com', '4743825737513', NULL, 'Marisa Konopelski', 'Housewife', '01934298564', 'mother270@example.com', '8181020136362', NULL, 'Antonietta Becker', '01751799382', 'guardian270@example.com', '5483947769175', 'Brother', 1, 53, 2, '2025-12-20', NULL, 2025000270, 900270, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09', '127.0.0.1', 1, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09'),
(271, 'Micah', 'Larson', '2015-04-15', 'Male', 'B+', 'Christian', 'Bangladeshi', '4513508433632', '01380159123', 'student271@example.com', '$2y$12$XAVYFYe.ZXZcBJKcUfxuAuf2otIaHUXhoZivvc8XENh8Zuwc50Ejy', '3829 Quigley Wall Apt. 024\nAlbinshire, LA 39500', '83943 Jackie Square\nLake Maximusbury, OK 31175-5685', 'ADM-00271', '1994-07-15', 'B', 'Science', '2025-2026', 'Auer, Hermiston and Hegmann School', 'Spencer McDermott', 'Businessman', '01974884669', 'father271@example.com', '7003624044302', NULL, 'Rubye Wolf', 'Businesswoman', '01320185437', 'mother271@example.com', '1932939973348', NULL, 'Spencer Kub PhD', '01761090753', 'guardian271@example.com', '4088369329957', 'Aunt', 1, 58, 1, '2025-12-20', NULL, 2025000271, 900271, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09', '127.0.0.1', 1, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09'),
(272, 'Keyon', 'Veum', '1980-10-26', 'Female', 'A+', 'Hindu', 'Bangladeshi', '0906893741157', '01483050019', 'student272@example.com', '$2y$12$EMbIO8hrC4OZsRhNI8doCuKTl6q4EavArfOYBs5R85X.umXQfkDJG', '94923 Haag Ports Apt. 060\nDoylefort, KY 78072', '14152 Lehner Islands Apt. 517\nNorth Turner, HI 07370-2459', 'ADM-00272', '1987-02-02', 'A', 'Science', '2025-2026', 'Runolfsson and Sons School', 'Mr. Jamel Doyle', 'Teacher', '01824757382', 'father272@example.com', '5823580248619', NULL, 'Cleta Rosenbaum', 'Businesswoman', '01871582816', 'mother272@example.com', '9905196882851', NULL, 'Verona Goodwin IV', '01369633990', 'guardian272@example.com', '5611272028400', 'Sister', 1, 58, 5, '2025-12-20', NULL, 2025000272, 900272, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09', '127.0.0.1', 1, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09'),
(273, 'Keshaun', 'Jacobs', '2007-07-07', 'Female', 'B+', 'Hindu', 'Bangladeshi', '7598368077665', '01312126102', 'student273@example.com', '$2y$12$VGEBIestfRCg9U8l.xK6lOiKJ.zOQlk0LKuRVoaU1lGVbgC4zeJDu', '22857 Pfeffer Dale\nNorth Beauborough, HI 04163-4984', '45564 Dorothy Estate Apt. 832\nNorth Carole, OR 11944', 'ADM-00273', '1988-10-07', 'A', 'Arts', '2025-2026', 'Purdy LLC School', 'Granville Walter', 'Doctor', '01404527513', 'father273@example.com', '6378949219286', NULL, 'Hortense Kuvalis', 'Housewife', '01479530880', 'mother273@example.com', '3097272800441', NULL, 'Dorcas Romaguera', '01364604116', 'guardian273@example.com', '0876789205802', 'Brother', 1, 59, 1, '2025-12-20', NULL, 2025000273, 900273, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09', '127.0.0.1', 1, NULL, '2025-12-20 08:35:09', '2025-12-20 08:35:09'),
(274, 'Katelynn', 'Witting', '2002-11-07', 'Male', 'O-', 'Christian', 'Bangladeshi', '8279260710034', '01446674121', 'student274@example.com', '$2y$12$EtvmuhcSB293EJiUE29ccOicsxtAEORsQlUv6ozIhnEBe5jWbEbka', '73059 Bridget Springs Suite 315\nNorth Claudeburgh, WV 22760', '530 Gorczany Falls Suite 309\nTreutelberg, ME 86822', 'ADM-00274', '1998-05-10', 'C', 'Science', '2025-2026', 'Farrell-Wunsch School', 'Isaiah Aufderhar', 'Farmer', '01907515873', 'father274@example.com', '0238923624067', NULL, 'Annamae Leffler V', 'Teacher', '01853790503', 'mother274@example.com', '4520935344799', NULL, 'Alfonzo Nicolas', '01391755657', 'guardian274@example.com', '0895987754246', 'Aunt', 1, 54, 2, '2025-12-20', NULL, 2025000274, 900274, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10', '127.0.0.1', 1, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10'),
(275, 'Zella', 'Boehm', '1975-05-04', 'Male', 'B+', 'Christian', 'Bangladeshi', '2223431473845', '01935310077', 'student275@example.com', '$2y$12$puDrC/LHAc8WG0SHanutPOFFfNesxXuNkYJaF04l5PaXX7sVgKaC.', '140 Dalton Manors Suite 673\nJovaniport, TX 29750', '50771 Misty Orchard Suite 037\nAltenwerthstad, UT 33875', 'ADM-00275', '1981-04-07', 'B', 'Science', '2025-2026', 'Shields Group School', 'Arvid Reynolds', 'Doctor', '01316588537', 'father275@example.com', '3156590767196', NULL, 'Jacynthe Botsford', 'Businesswoman', '01937131299', 'mother275@example.com', '6300178432036', NULL, 'Teresa Willms', '01796218765', 'guardian275@example.com', '8962604960471', 'Grandparent', 1, 55, 2, '2025-12-20', NULL, 2025000275, 900275, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10', '127.0.0.1', 1, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10'),
(276, 'Greta', 'Nikolaus', '1987-03-22', 'Female', 'B+', 'Buddhist', 'Bangladeshi', '1718582927081', '01810844970', 'student276@example.com', '$2y$12$FYDgC6BW7VsT/juF/gy/0e0HRqNARg.fND/A8A/y1dQEE8cwU5/g6', '749 Corkery Ferry\nMitchellbury, NC 77980-8693', '9186 Kayley Mountain Apt. 751\nShawnafort, MN 45214-6995', 'ADM-00276', '1982-02-16', 'B', 'Arts', '2025-2026', 'Adams PLC School', 'Vernon Schneider', 'Engineer', '01920937027', 'father276@example.com', '0607130353213', NULL, 'Yvette Bruen', 'Nurse', '01975219314', 'mother276@example.com', '0771569841033', NULL, 'Taya Hane', '01541478246', 'guardian276@example.com', '1414158702960', 'Uncle', 1, 56, 3, '2025-12-20', NULL, 2025000276, 900276, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10', '127.0.0.1', 1, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10'),
(277, 'Bertha', 'Bartoletti', '1977-11-13', 'Male', 'O-', 'Christian', 'Bangladeshi', '5624002966818', '01480191692', 'student277@example.com', '$2y$12$0H75tQL/TCieMaEL3vmHEOyVQXqO/YySMAAIj8tpUHWK6aX6Eva36', '6470 Oscar Streets Apt. 136\nMyleschester, KS 44125-1816', '58878 Russel Key\nEast Dinabury, NV 67916-3326', 'ADM-00277', '2024-07-12', 'B', 'Arts', '2025-2026', 'Stoltenberg, Tillman and Ondricka School', 'Adrian Bruen', 'Teacher', '01760504853', 'father277@example.com', '1803551732294', NULL, 'Heaven Connelly IV', 'Nurse', '01402872143', 'mother277@example.com', '1124129204758', NULL, 'Lisandro Gottlieb', '01878081925', 'guardian277@example.com', '9914977013498', 'Uncle', 1, 57, 3, '2025-12-20', NULL, 2025000277, 900277, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10', '127.0.0.1', 1, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10'),
(278, 'Damion', 'Howe', '1993-01-23', 'Male', 'O-', 'Buddhist', 'Bangladeshi', '1651471743211', '01719523208', 'student278@example.com', '$2y$12$4fbETGuEQeM2J0g8Ch3NL.vJ.JgLXHtRs/rrZn6m9uLs2Y7irzHKO', '7142 Jerod Club\nHilbertton, SC 26470-7802', '84152 Mayer Burgs Apt. 161\nSouth Fanny, VT 08371', 'ADM-00278', '1998-04-16', 'C', 'Science', '2025-2026', 'Rodriguez Ltd School', 'Milo Witting', 'Doctor', '01657292208', 'father278@example.com', '0193698345077', NULL, 'Miss Jaida Ortiz', 'Teacher', '01812953581', 'mother278@example.com', '5855750532127', NULL, 'Jamir Herman', '01782476665', 'guardian278@example.com', '0753625446417', 'Brother', 1, 59, 5, '2025-12-20', NULL, 2025000278, 900278, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10', '127.0.0.1', 1, NULL, '2025-12-20 08:35:10', '2025-12-20 08:35:10'),
(279, 'Virgie', 'Hegmann', '1996-03-27', 'Other', 'O+', 'Other', 'Bangladeshi', '4334295028333', '01688295252', 'student279@example.com', '$2y$12$6pxwKYUGe1YHyNkMcyn4eepNtXNV6lFHnNb/y5xTVSzhxOhZqDa0m', '7869 Tressie Orchard\nSouth Lorainebury, PA 35400-7681', '1170 Norbert Valleys\nStarkville, GA 36463', 'ADM-00279', '1971-11-17', 'B', 'Science', '2025-2026', 'Maggio-Huels School', 'Keenan Ortiz', 'Farmer', '01680028348', 'father279@example.com', '6890727544442', NULL, 'Nyah Flatley', 'Businesswoman', '01833435149', 'mother279@example.com', '0986842805032', NULL, 'Haven Mraz', '01864482888', 'guardian279@example.com', '6084157983457', 'Brother', 1, 49, 4, '2025-12-20', NULL, 2025000279, 900279, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11', '127.0.0.1', 1, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11'),
(280, 'Danielle', 'Eichmann', '2005-08-15', 'Female', 'A-', 'Islam', 'Bangladeshi', '7010643720351', '01830911193', 'student280@example.com', '$2y$12$rTgGK6UZpxxBQ3jSBveuCeuyH1Pi32AUkcxiEOxNfS4vnwX5S71Cu', '684 Nat Plain Apt. 192\nFramifurt, WV 23622-4076', '56982 Aracely Union Suite 749\nNew Issacmouth, WY 64792', 'ADM-00280', '2017-05-01', 'A', 'Science', '2025-2026', 'Keebler Inc School', 'Dejuan Gerlach', 'Teacher', '01335653288', 'father280@example.com', '5788672580025', NULL, 'Magnolia Prosacco Jr.', 'Businesswoman', '01600640722', 'mother280@example.com', '3386910876748', NULL, 'Grayce Nienow', '01877167184', 'guardian280@example.com', '9119551393939', 'Brother', 1, 58, 3, '2025-12-20', NULL, 2025000280, 900280, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11', '127.0.0.1', 1, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(281, 'Isac', 'Barrows', '2021-07-02', 'Male', 'AB+', 'Other', 'Bangladeshi', '3303970530233', '01324243823', 'student281@example.com', '$2y$12$RMX2wZhNoKaYhUFcSRSDJeT1rnERAyX1OcSSyW1bmrcC4ReJmUCEe', '1280 Schmitt Path Apt. 776\nPort Jolie, AZ 17818-9284', '838 Rosenbaum Well\nNorth Willtown, ND 71052', 'ADM-00281', '2010-06-17', 'C', 'Commerce', '2025-2026', 'Roberts, Baumbach and Kozey School', 'Scottie Graham', 'Teacher', '01494107633', 'father281@example.com', '9036187569196', NULL, 'Cordie Berge V', 'Teacher', '01331893205', 'mother281@example.com', '7892219840332', NULL, 'Dorothea Hirthe', '01736769564', 'guardian281@example.com', '0288659897234', 'Aunt', 1, 60, 1, '2025-12-20', NULL, 2025000281, 900281, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11', '127.0.0.1', 1, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11'),
(282, 'Luisa', 'Auer', '1973-10-06', 'Other', 'O+', 'Islam', 'Bangladeshi', '5451238979766', '01503446481', 'student282@example.com', '$2y$12$AaIbS8Wo2btRfPfpA.H.Iuyhp9nf0wJCfb8s4HyJyGa.xJzxmO4.a', '34545 Schultz Fall Suite 632\nEast Era, MO 22323', '64699 Ullrich Lane\nWest Mittie, OK 76525-4787', 'ADM-00282', '1994-07-08', 'C', 'Commerce', '2025-2026', 'Dooley, Dibbert and Schulist School', 'Prof. Erik Stoltenberg III', 'Teacher', '01990879873', 'father282@example.com', '2348278693253', NULL, 'Melyssa Stroman', 'Teacher', '01939895421', 'mother282@example.com', '3554216529817', NULL, 'Prof. Alycia McDermott', '01495883628', 'guardian282@example.com', '7134873022404', 'Brother', 1, 61, 1, '2025-12-20', NULL, 2025000282, 900282, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11', '127.0.0.1', 1, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11'),
(283, 'Newell', 'O\'Reilly', '1997-06-23', 'Male', 'O-', 'Other', 'Bangladeshi', '4874732504955', '01319548438', 'student283@example.com', '$2y$12$bfdKX6C5QiXq/qjpC3dStuygN.hnFPlYy94OeW4./tHwS42JUEw6a', '82460 Ferry Way\nPort Robbie, DC 35953', '39960 Rosenbaum Harbors\nLinaborough, MT 63929-0668', 'ADM-00283', '1979-08-30', 'B', 'Arts', '2025-2026', 'Hayes PLC School', 'Dr. Christ Homenick Jr.', 'Farmer', '01834931762', 'father283@example.com', '0646250742971', NULL, 'Mrs. Lisette Bogan', 'Businesswoman', '01917900155', 'mother283@example.com', '7186576244354', NULL, 'Kelsi Tromp', '01444432307', 'guardian283@example.com', '7076083723382', 'Aunt', 1, 62, 1, '2025-12-20', NULL, 2025000283, 900283, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11', '127.0.0.1', 1, NULL, '2025-12-20 08:35:11', '2025-12-20 08:35:11'),
(284, 'Serena', 'Krajcik', '1991-05-08', 'Female', 'O-', 'Christian', 'Bangladeshi', '8353317985502', '01985459333', 'student284@example.com', '$2y$12$qJHLpCgKdSHPZWu4Ww7c.OnrJK5GQKMvRIpwGgiCZHH8BDr2P4Hka', '62845 Kariane Junction Apt. 885\nWest Elsiebury, SC 01124', '75240 Kemmer Locks Suite 217\nPouroston, NM 61377-2319', 'ADM-00284', '2023-06-20', 'C', 'Arts', '2025-2026', 'Kautzer, Bahringer and Glover School', 'Randy Wolff Sr.', 'Doctor', '01308870809', 'father284@example.com', '9711815480296', NULL, 'Oleta Bode', 'Teacher', '01655347291', 'mother284@example.com', '8415299798713', NULL, 'Prof. Bennie Johnston III', '01592043525', 'guardian284@example.com', '0628317090586', 'Aunt', 1, 60, 5, '2025-12-20', NULL, 2025000284, 900284, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12', '127.0.0.1', 1, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12'),
(285, 'Antwan', 'Rath', '1984-03-18', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '6791127321919', '01492103038', 'student285@example.com', '$2y$12$8Hd202SbLBuPGk3hRUoYfeuZ1rbrHMJptzfT7E/PXUQukND/pNtSm', '62243 Kutch Port Suite 797\nBarrowshaven, WV 34977-0969', '967 Crooks Plains\nLake Icie, TX 17830', 'ADM-00285', '2025-09-05', 'A', 'Arts', '2025-2026', 'Hoeger-Lockman School', 'Chris Collins', 'Engineer', '01999507882', 'father285@example.com', '6827309082738', NULL, 'Corene Wyman Sr.', 'Businesswoman', '01654532301', 'mother285@example.com', '5318779206155', NULL, 'Riley Glover', '01924555910', 'guardian285@example.com', '9785229690747', 'Aunt', 1, 61, 5, '2025-12-20', NULL, 2025000285, 900285, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12', '127.0.0.1', 1, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12'),
(286, 'Ellsworth', 'Sporer', '2025-07-04', 'Female', 'B+', 'Other', 'Bangladeshi', '4455095608676', '01650360606', 'student286@example.com', '$2y$12$/.Det6fykbEUr3Dy0NN8Oer2x2v8ZPAVH3AbiuIpHmmjDRY10pGH2', '2091 Wyman Gateway\nShieldstown, MO 27763-0462', '172 Waelchi Station Suite 616\nSouth Chanelleside, MT 31598', 'ADM-00286', '1997-11-16', 'C', 'Arts', '2025-2026', 'Mann, Metz and Fritsch School', 'Mavis Willms', 'Farmer', '01895853555', 'father286@example.com', '8907591949087', NULL, 'Libby Harvey II', 'Teacher', '01817922300', 'mother286@example.com', '6258269971014', NULL, 'Porter Kessler', '01958315968', 'guardian286@example.com', '1927480817517', 'Uncle', 1, 62, 5, '2025-12-20', NULL, 2025000286, 900286, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12', '127.0.0.1', 1, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12'),
(287, 'Pattie', 'Klocko', '2006-01-07', 'Other', 'O+', 'Islam', 'Bangladeshi', '9602293801760', '01691696661', 'student287@example.com', '$2y$12$fSiH2yCMNSE4gvnZ4Ve3d.VpSkBjqfYUDIW7yiJaD/7uJSbAIPLjm', '6553 Domingo Courts\nAdolphusborough, MN 57692-0651', '7024 Archibald Spurs Apt. 780\nNorth Jailynmouth, AL 93171', 'ADM-00287', '1993-01-24', 'B', 'Science', '2025-2026', 'Spinka Ltd School', 'Dr. Boris Murazik Sr.', 'Businessman', '01633672562', 'father287@example.com', '8959174624015', NULL, 'Allene Prosacco', 'Nurse', '01628909082', 'mother287@example.com', '6410060147494', NULL, 'Estel Nader MD', '01574708885', 'guardian287@example.com', '8234407175173', 'Grandparent', 1, 56, 2, '2025-12-20', NULL, 2025000287, 900287, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12', '127.0.0.1', 1, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12'),
(288, 'Adella', 'Fritsch', '1971-10-21', 'Other', 'A-', 'Hindu', 'Bangladeshi', '5967600404229', '01770203791', 'student288@example.com', '$2y$12$0giCADMs5HtdLOPjZLS20OweECX08tgsDGQdX61V.RmGEezFv1ic2', '39555 Kaela Manor\nNorth Tarynfurt, AZ 05237', '854 Ike Loop\nPort Erniestad, CO 44420-6030', 'ADM-00288', '1971-10-05', 'A', 'Arts', '2025-2026', 'Spencer LLC School', 'Ottis Becker', 'Farmer', '01473919770', 'father288@example.com', '2876026443286', NULL, 'Roslyn Parisian', 'Housewife', '01783702948', 'mother288@example.com', '5782058445108', NULL, 'Mr. Nat Carter Sr.', '01673257490', 'guardian288@example.com', '3537877262739', 'Uncle', 1, 50, 4, '2025-12-20', NULL, 2025000288, 900288, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12', '127.0.0.1', 1, NULL, '2025-12-20 08:35:12', '2025-12-20 08:35:12'),
(289, 'Miracle', 'McLaughlin', '1971-02-14', 'Other', 'O+', 'Other', 'Bangladeshi', '1325886899246', '01898730881', 'student289@example.com', '$2y$12$.qVYH4Oc2nMrtqrKuEUohOFdnZGoQs6SWbcz0bcOxhkJr4M6xKQsS', '998 Gerard Orchard\nEddieborough, FL 78285', '18966 Kenya Glens Suite 390\nTomasberg, MN 29792', 'ADM-00289', '1977-07-21', 'B', 'Science', '2025-2026', 'Runolfsdottir Inc School', 'Rudy Von', 'Farmer', '01585054237', 'father289@example.com', '5082647950662', NULL, 'Mrs. Josianne Haag', 'Doctor', '01332124185', 'mother289@example.com', '4134899568781', NULL, 'Marianne Gislason', '01386351551', 'guardian289@example.com', '4910761017603', 'Aunt', 1, 63, 5, '2025-12-20', NULL, 2025000289, 900289, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13', '127.0.0.1', 1, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13'),
(290, 'Verna', 'Hoppe', '2024-06-05', 'Female', 'A-', 'Christian', 'Bangladeshi', '9617486183105', '01594807350', 'student290@example.com', '$2y$12$I9MRA6ZGYcNA85TPDbJvZevXbDCR2cyaB6CWTxO.9t/B7CVDNhMOC', '9352 Adelle Crescent Suite 693\nBertland, NV 00124-7384', '6449 Legros Locks Suite 514\nHodkiewiczport, MI 58625-2319', 'ADM-00290', '2009-10-26', 'A', 'Arts', '2025-2026', 'Moen LLC School', 'Mr. Giovani Kunde II', 'Farmer', '01357749409', 'father290@example.com', '8112164935406', NULL, 'Dr. Rachelle Hermann', 'Nurse', '01879173831', 'mother290@example.com', '2265404310358', NULL, 'Gordon Hettinger', '01484962510', 'guardian290@example.com', '4235977106334', 'Grandparent', 1, 57, 2, '2025-12-20', NULL, 2025000290, 900290, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13', '127.0.0.1', 1, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13'),
(291, 'Enid', 'Willms', '1973-08-15', 'Male', 'A-', 'Islam', 'Bangladeshi', '0128256856752', '01399292750', 'student291@example.com', '$2y$12$QFdblNHotU8Z/4LN.kR5r.xUEC4/eVhVSSUvx4PjSFN9S6GVE4Diu', '239 Gleason Drives\nBartolettichester, NE 52972-8448', '85422 Pagac Parks Apt. 216\nBudside, IA 41166-1450', 'ADM-00291', '1976-10-27', 'A', 'Commerce', '2025-2026', 'Rippin, Deckow and Reilly School', 'Jaylan Boehm', 'Doctor', '01324295639', 'father291@example.com', '7825804557431', NULL, 'Maymie Gleichner V', 'Doctor', '01942251732', 'mother291@example.com', '2455463467971', NULL, 'Dr. Charles Wunsch', '01864108276', 'guardian291@example.com', '8046462196645', 'Grandparent', 1, 63, 1, '2025-12-20', NULL, 2025000291, 900291, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13', '127.0.0.1', 1, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13'),
(292, 'Trey', 'Wintheiser', '1989-12-28', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '5794848226889', '01722382221', 'student292@example.com', '$2y$12$9GvaBegtM4csBw7/xvf8GuiiBGLBji0X76Yiuifi1kNCQyXTrb0Jm', '137 Wintheiser Points\nEast Hollieberg, AK 21710-0806', '15374 Zula Circles\nTreutelburgh, KS 02862', 'ADM-00292', '2014-03-12', 'B', 'Commerce', '2025-2026', 'Raynor and Sons School', 'Ben Ryan', 'Engineer', '01682145974', 'father292@example.com', '7075800156266', NULL, 'Prof. Aniya Baumbach', 'Housewife', '01818676124', 'mother292@example.com', '1295842913615', NULL, 'Aric Mayert V', '01394988876', 'guardian292@example.com', '8108803913461', 'Aunt', 1, 64, 5, '2025-12-20', NULL, 2025000292, 900292, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13', '127.0.0.1', 1, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13'),
(293, 'Maia', 'King', '1970-04-20', 'Male', 'O+', 'Buddhist', 'Bangladeshi', '7195443100936', '01334183397', 'student293@example.com', '$2y$12$f2ruX.63oBZDRCV9Vp0CyOCHizpVMLt010OkXvrphUNhWdWAjJdWq', '903 O\'Hara Road\nLake Alvischester, WA 49132', '2858 Ted Loop Suite 781\nNew Ronny, ND 38931', 'ADM-00293', '1983-08-29', 'C', 'Arts', '2025-2026', 'Graham-Armstrong School', 'Muhammad Rice', 'Doctor', '01793977380', 'father293@example.com', '0501685705107', NULL, 'Mrs. Kimberly Mueller PhD', 'Teacher', '01828028864', 'mother293@example.com', '3053713351735', NULL, 'Prof. Susanna Wehner IV', '01571080924', 'guardian293@example.com', '1912883062430', 'Uncle', 1, 59, 3, '2025-12-20', NULL, 2025000293, 900293, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13', '127.0.0.1', 1, NULL, '2025-12-20 08:35:13', '2025-12-20 08:35:13'),
(294, 'Roxane', 'Ziemann', '2011-07-27', 'Male', 'B-', 'Buddhist', 'Bangladeshi', '3252461020581', '01997936590', 'student294@example.com', '$2y$12$HPcOcdmmXNZQ4bM5CqjguOY2GnllmXTnCE5LAo./BTI4hkcq2M2e2', '49294 Ansley River Apt. 878\nKemmermouth, ME 77254', '9909 Koby Mission Apt. 475\nWildermanville, SC 40075', 'ADM-00294', '1970-08-05', 'C', 'Commerce', '2025-2026', 'Bogan, Hane and Bernier School', 'Alvis Schiller', 'Engineer', '01591816905', 'father294@example.com', '4452754396609', NULL, 'Addison Conn III', 'Nurse', '01439257828', 'mother294@example.com', '2449382038940', NULL, 'Amy Borer', '01985414671', 'guardian294@example.com', '2729833028340', 'Aunt', 1, 64, 1, '2025-12-20', NULL, 2025000294, 900294, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14', '127.0.0.1', 1, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14'),
(295, 'Edd', 'Altenwerth', '2003-11-15', 'Other', 'O-', 'Islam', 'Bangladeshi', '9586015130545', '01784097119', 'student295@example.com', '$2y$12$c0LZ3qEMSCy6Jz3kcRBogeXtIT0rEJC2v.7YldJmJJHebaQBfmzwa', '7794 Lynch Mews\nNorth Wandaburgh, RI 53770', '8182 Marlene Row Apt. 666\nEast Juddshire, AK 62560', 'ADM-00295', '2002-07-04', 'A', 'Arts', '2025-2026', 'Jacobson-Labadie School', 'Sterling Balistreri', 'Doctor', '01617812726', 'father295@example.com', '7272168564582', NULL, 'Miss Desiree Pfannerstill DVM', 'Nurse', '01315970510', 'mother295@example.com', '5161627705952', NULL, 'Madeline Rogahn', '01886884518', 'guardian295@example.com', '5981474294404', 'Sister', 1, 65, 1, '2025-12-20', NULL, 2025000295, 900295, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14', '127.0.0.1', 1, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14'),
(296, 'Adalberto', 'Lindgren', '2013-12-15', 'Male', 'AB-', 'Other', 'Bangladeshi', '0506763050480', '01966712723', 'student296@example.com', '$2y$12$VvgYvj/bYuTxczkVoh7IEOOJ8GTGuMxRfPHuNNrVhi8F.rSxzBuKe', '28220 Bednar Keys Apt. 847\nFrederikmouth, UT 77467', '86988 Kelsie Prairie\nNew Milliebury, NJ 29982-3916', 'ADM-00296', '2024-10-03', 'B', 'Science', '2025-2026', 'Kozey PLC School', 'Amparo Thiel', 'Teacher', '01648812163', 'father296@example.com', '3874878225180', NULL, 'Magnolia Mann', 'Nurse', '01472708865', 'mother296@example.com', '0823282063725', NULL, 'Samson Rowe', '01708819266', 'guardian296@example.com', '2598598227644', 'Aunt', 1, 65, 5, '2025-12-20', NULL, 2025000296, 900296, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14', '127.0.0.1', 1, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14'),
(297, 'Fermin', 'Altenwerth', '2012-07-15', 'Other', 'AB-', 'Other', 'Bangladeshi', '3820609716061', '01698262766', 'student297@example.com', '$2y$12$R.ESD.4.3mgj1Hj0niwE/ey1TUKkIh1jaBQRMfvuU9bv3vvwggGNG', '75763 Elijah Lights Suite 732\nEast Mia, AR 38933-7763', '360 Fisher Shoals\nNew Raina, GA 52649', 'ADM-00297', '1984-09-25', 'A', 'Commerce', '2025-2026', 'Little-Dietrich School', 'Grayson Gleason', 'Businessman', '01443335802', 'father297@example.com', '8826068527466', NULL, 'Dr. Hulda Strosin', 'Teacher', '01482375916', 'mother297@example.com', '8099168008825', NULL, 'Darion Goldner', '01396240614', 'guardian297@example.com', '9771053782511', 'Uncle', 1, 58, 2, '2025-12-20', NULL, 2025000297, 900297, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14', '127.0.0.1', 1, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14'),
(298, 'Jude', 'Watsica', '2003-03-26', 'Female', 'O+', 'Other', 'Bangladeshi', '2768204620998', '01776592359', 'student298@example.com', '$2y$12$IGoVu3exqam0d47wASEEAe65VpXAK92ZEC8UWDk3MuSi4idd5JLq6', '779 Kolby Pike\nOdietown, ND 33238-7789', '87663 Breitenberg Shoal\nMelissaborough, TX 16512-9212', 'ADM-00298', '2022-05-14', 'B', 'Science', '2025-2026', 'Quitzon-Bosco School', 'Demarcus Weissnat', 'Farmer', '01801001367', 'father298@example.com', '4377012010555', NULL, 'Ms. Emilie McKenzie', 'Businesswoman', '01640905974', 'mother298@example.com', '7772923268752', NULL, 'Quinten Ernser', '01659508500', 'guardian298@example.com', '3696552633523', 'Aunt', 1, 59, 2, '2025-12-20', NULL, 2025000298, 900298, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14', '127.0.0.1', 1, NULL, '2025-12-20 08:35:14', '2025-12-20 08:35:14'),
(299, 'Aimee', 'O\'Connell', '1974-09-12', 'Male', 'O-', 'Islam', 'Bangladeshi', '5769318915119', '01534176729', 'student299@example.com', '$2y$12$e2REB4If4ixUzvBT6ba7jOVOzjY9zmxI3AtZzAaOympd65BaZXDS2', '80139 Stoltenberg Hills Suite 228\nNew Eugeniaburgh, CT 82460-9606', '16880 Fahey Springs Apt. 619\nNorth Turnerland, FL 41849-2280', 'ADM-00299', '1987-06-29', 'A', 'Commerce', '2025-2026', 'Grant-Runolfsson School', 'Jeffery Jones', 'Farmer', '01731883759', 'father299@example.com', '8586668384547', NULL, 'Emelie Torphy V', 'Teacher', '01487518884', 'mother299@example.com', '3534648133549', NULL, 'Miss Carlie Goyette', '01374381455', 'guardian299@example.com', '3870920637813', 'Aunt', 1, 51, 4, '2025-12-20', NULL, 2025000299, 900299, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:15', '2025-12-20 08:35:15', '127.0.0.1', 1, NULL, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(300, 'Mauricio', 'Kerluke', '1999-10-25', 'Other', 'AB-', 'Islam', 'Bangladeshi', '0504126597267', '01588312762', 'student300@example.com', '$2y$12$BsmM6y/mXJ5Yb3k4EUTL5uhtkMNzfxrDgx65KI0bV3SKCcOtR8V/S', '681 Walker Ferry\nSauerton, ID 45774-2000', '5370 Hartmann Underpass\nWest Jamelland, OH 17028', 'ADM-00300', '1990-12-10', 'A', 'Commerce', '2025-2026', 'Kreiger and Sons School', 'Caden Balistreri', 'Businessman', '01966577016', 'father300@example.com', '2201226370501', NULL, 'Liana DuBuque', 'Businesswoman', '01712071456', 'mother300@example.com', '2596033716105', NULL, 'Orville Shanahan', '01669058127', 'guardian300@example.com', '4426000359988', 'Grandparent', 1, 66, 1, '2025-12-20', NULL, 2025000300, 900300, NULL, NULL, NULL, NULL, NULL, '2025-12-20 08:35:15', '2025-12-20 08:35:15', '127.0.0.1', 1, NULL, '2025-12-20 08:35:15', '2025-12-20 08:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `student_daily_routines`
--

CREATE TABLE `student_daily_routines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `time_to_awake` time DEFAULT NULL,
  `attendance_in_college` tinyint(1) DEFAULT NULL,
  `arrival_in_residence` varchar(255) DEFAULT NULL,
  `prayer` varchar(255) DEFAULT NULL,
  `morning_activity` varchar(255) DEFAULT NULL,
  `evening_activity` varchar(255) DEFAULT NULL,
  `night_activity` varchar(255) DEFAULT NULL,
  `time_to_bed` time DEFAULT NULL,
  `total_hours` int(11) DEFAULT NULL,
  `remark` varchar(255) NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

CREATE TABLE `student_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `group_id`, `class_id`, `created_at`, `updated_at`) VALUES
(1, 'Bangla', 1, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(2, 'English', 1, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(3, 'ICT', 1, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(4, 'Physical Education', 1, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(5, 'Physics', 2, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(6, 'Chemistry', 2, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(7, 'Biology', 2, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(8, 'Higher Mathematics', 2, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(9, 'Accounting', 3, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(10, 'Business Organization & Management', 3, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(11, 'Finance, Banking & Insurance', 3, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(12, 'Production Management & Marketing', 3, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(13, 'Logic', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(14, 'History', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(15, 'Civics', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(16, 'Economics', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(17, 'Islamic Studies', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(18, 'Sociology', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(19, 'Social Work', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(20, 'Geography', 4, 1, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(21, 'Bangla', 1, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(22, 'English', 1, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(23, 'ICT', 1, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(24, 'Physical Education', 1, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(25, 'Physics', 2, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(26, 'Chemistry', 2, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(27, 'Biology', 2, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(28, 'Higher Mathematics', 2, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(29, 'Accounting', 3, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(30, 'Business Organization & Management', 3, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(31, 'Finance, Banking & Insurance', 3, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(32, 'Production Management & Marketing', 3, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(33, 'Logic', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(34, 'History', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(35, 'Civics', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(36, 'Economics', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(37, 'Islamic Studies', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(38, 'Sociology', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(39, 'Social Work', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(40, 'Geography', 4, 2, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(41, 'Bangla', 1, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(42, 'English', 1, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(43, 'ICT', 1, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(44, 'Physical Education', 1, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(45, 'Physics', 2, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(46, 'Chemistry', 2, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(47, 'Biology', 2, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(48, 'Higher Mathematics', 2, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(49, 'Accounting', 3, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(50, 'Business Organization & Management', 3, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(51, 'Finance, Banking & Insurance', 3, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(52, 'Production Management & Marketing', 3, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(53, 'Logic', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(54, 'History', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(55, 'Civics', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(56, 'Economics', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(57, 'Islamic Studies', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(58, 'Sociology', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(59, 'Social Work', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(60, 'Geography', 4, 3, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(61, 'Bangla', 1, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(62, 'English', 1, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(63, 'ICT', 1, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(64, 'Physical Education', 1, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(65, 'Physics', 2, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(66, 'Chemistry', 2, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(67, 'Biology', 2, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(68, 'Higher Mathematics', 2, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(69, 'Accounting', 3, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(70, 'Business Organization & Management', 3, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(71, 'Finance, Banking & Insurance', 3, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(72, 'Production Management & Marketing', 3, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(73, 'Logic', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(74, 'History', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(75, 'Civics', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(76, 'Economics', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(77, 'Islamic Studies', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(78, 'Sociology', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(79, 'Social Work', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(80, 'Geography', 4, 4, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(81, 'Bangla', 1, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(82, 'English', 1, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(83, 'ICT', 1, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(84, 'Physical Education', 1, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(85, 'Physics', 2, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(86, 'Chemistry', 2, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(87, 'Biology', 2, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(88, 'Higher Mathematics', 2, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(89, 'Accounting', 3, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(90, 'Business Organization & Management', 3, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(91, 'Finance, Banking & Insurance', 3, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(92, 'Production Management & Marketing', 3, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(93, 'Logic', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(94, 'History', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(95, 'Civics', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(96, 'Economics', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(97, 'Islamic Studies', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(98, 'Sociology', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(99, 'Social Work', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(100, 'Geography', 4, 5, '2025-12-20 08:35:15', '2025-12-20 08:35:15'),
(101, 'Data Structure & Algorim', 1, 5, '2025-12-20 08:39:37', '2025-12-20 08:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `national_id` varchar(255) NOT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_contact` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_contact` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_contact` varchar(255) DEFAULT NULL,
  `guardian_relationship` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `father_photo` varchar(255) DEFAULT NULL,
  `mother_photo` varchar(255) DEFAULT NULL,
  `joning_date` date DEFAULT NULL,
  `mop_date` date DEFAULT NULL,
  `traning` varchar(255) DEFAULT NULL,
  `index_no` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'Admin',
  `status` int(11) NOT NULL DEFAULT 1,
  `remark` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `is_profile_completed` tinyint(1) NOT NULL DEFAULT 0,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `national_id`, `contact_number`, `email`, `password`, `designation`, `address`, `father_name`, `father_contact`, `mother_name`, `mother_contact`, `guardian_name`, `guardian_contact`, `guardian_relationship`, `photo`, `father_photo`, `mother_photo`, `joning_date`, `mop_date`, `traning`, `index_no`, `role`, `status`, `remark`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `otp`, `otp_expires_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Brody', 'Mante', '1970-04-13', 'Male', 'B-', '1281548849053', '01948595395', 'teacher0@example.com', '$2y$12$1BU4HyCREhX2ROz4hAUuZehvwzPW3uclF751hzUQf5jIxUHgniqJS', 'Assistant Professor', '70488 Ricardo Vista\nLake Etha, NH 51291', 'Prof. Grayce Will Jr.', '01571390431', 'Mariah Rodriguez', '01479228891', 'Priscilla Grady', '01743329307', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:09', '2025-12-20 08:34:09', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:09', '2025-12-20 08:34:09'),
(2, 'Nedra', 'Huel', '1972-01-04', 'Male', 'B-', '7353794099621', '01467489355', 'teacher1@example.com', '$2y$12$dv0dKjyif73QOKW15ukmeeDkQrB1/WPz7CnziQlMI5/EiFXJgWSyG', 'Head of Department', '186 Johns Landing Suite 225\nRueckerbury, IA 21997', 'Johann Wuckert', '01484301368', 'Dr. Abagail Huel', '01368475533', 'Tyra Price', '01618968875', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:09', '2025-12-20 08:34:09', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:09', '2025-12-20 08:34:09'),
(3, 'Wilfred', 'Jacobs', '1966-03-02', 'Male', 'B-', '5202854964587', '01862625458', 'teacher2@example.com', '$2y$12$dvPJFHp5sLaZg2Uo325Rx.luu35zEc94fsjk/xrv1pvtzLdVD9lt6', 'Assistant Professor', '24167 Asha Rapids Suite 237\nLuettgenberg, NC 76682-1892', 'Leopoldo Kerluke', '01839044685', 'Mrs. Deborah Langworth I', '01452764205', 'Leslie Murray', '01576761483', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:10', '2025-12-20 08:34:10', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:10', '2025-12-20 08:34:10'),
(4, 'Dereck', 'Rippin', '1984-09-22', 'Male', 'B-', '6466560158043', '01744907653', 'teacher3@example.com', '$2y$12$gT3ZzziI3MY0z8xqf8ZDl.LlX5mPpjMss9CCQ8d6mfKGNb6a4Ar.K', 'Senior Teacher', '175 Jacobi Gateway Apt. 415\nMertzfurt, DC 60883-8244', 'Willard Shanahan', '01736210438', 'Carley Turner', '01836908722', 'Napoleon VonRueden I', '01585770671', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:10', '2025-12-20 08:34:10', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:10', '2025-12-20 08:34:10'),
(5, 'Kyra', 'Hudson', '1979-05-27', 'Female', 'AB-', '5737347818543', '01400298078', 'teacher4@example.com', '$2y$12$w9iNPJ4GIIpS1yiKfZgY2eTRIMqWV3w9ECJtu7LTu1..6qUZ6OT82', 'Senior Teacher', '2410 Rhett Circles\nRaleighshire, CO 74203', 'Prof. Arely McLaughlin III', '01902895170', 'Dorris Ortiz', '01345924855', 'Benny Oberbrunner Jr.', '01809446690', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:10', '2025-12-20 08:34:10', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:10', '2025-12-20 08:34:10'),
(6, 'Alvena', 'Hoppe', '1989-02-10', 'Female', 'B+', '1034240194839', '01752996782', 'teacher5@example.com', '$2y$12$Xxij8Xqi.CuF10gbruc8qexl3KzqmwEJDHokVSnlCrsfQu3RbmuTm', 'Head of Department', '8222 Stamm Springs\nRaulport, IN 77726', 'Olen Medhurst', '01762046330', 'Leanne Schamberger I', '01492768351', 'Dr. Kip Gerlach', '01874070596', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:10', '2025-12-20 08:34:10', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:10', '2025-12-20 08:34:10'),
(7, 'Elody', 'Cormier', '1985-06-21', 'Male', 'O+', '0603356703900', '01841125238', 'teacher6@example.com', '$2y$12$q7x40SLwn3fqNsjNtI3EJ.TRtxGywVmbksN4BCp5lA4xwSPdEBelu', 'Assistant Professor', '93421 Gislason Trail Apt. 979\nSouth Florinetown, LA 87978-4722', 'Kareem Bogan', '01358217253', 'Layla Johnson', '01691385267', 'Mrs. Nakia Dickinson', '01306000757', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:10', '2025-12-20 08:34:10', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:10', '2025-12-20 08:34:10'),
(8, 'Reginald', 'Gibson', '1984-05-28', 'Female', 'A-', '9081147265708', '01799717607', 'teacher7@example.com', '$2y$12$7hbmWod/lxUps/kJvKEn7u9/qdOHe13tmOOFloQpUSYEOYfpn9RJK', 'Head of Department', '24550 Reichert Stream Apt. 134\nNew Aurorefort, WY 89943', 'Mr. Valentin Cummerata V', '01442924374', 'Dana Rempel', '01545117781', 'Prof. Adelia Senger MD', '01567759069', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:11', '2025-12-20 08:34:11', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:11', '2025-12-20 08:34:11'),
(9, 'Sonny', 'Fritsch', '1996-04-11', 'Male', 'O+', '5612315109038', '01409807872', 'teacher8@example.com', '$2y$12$4ON1W4SzOuprmfIMR0sKOeZoZmZEOfoFOFozftO5wTHk4AfKiUjCu', 'Head of Department', '2325 Nienow Curve Apt. 961\nEleanoratown, MA 28700-5753', 'Adalberto Erdman', '01680637720', 'Mrs. Eleanora Ward II', '01307293499', 'Theodora Bechtelar', '01307369200', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:11', '2025-12-20 08:34:11', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:11', '2025-12-20 08:34:11'),
(10, 'Kenneth', 'Walter', '1999-08-07', 'Male', 'AB+', '5034749023267', '01987517519', 'teacher9@example.com', '$2y$12$.sFJiPRHAFHgZovbuRcwmObnYAGdoQmVdPOuCJ/sSTF9ibQtwBL9i', 'Head of Department', '275 Kuhic Rapid\nLednerton, MS 13372-1591', 'Mr. Merl Gottlieb', '01641054414', 'Cara Kub', '01327136689', 'Branson Durgan', '01905737108', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:11', '2025-12-20 08:34:11', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:11', '2025-12-20 08:34:11'),
(11, 'Freddy', 'Kutch', '1987-10-31', 'Male', 'AB+', '8184926377939', '01517508124', 'teacher10@example.com', '$2y$12$dZ.I25hdZbiYBCMUBEWR/OfesWYeNPmckt2nNRgzXpekU3vz3OyC6', 'Assistant Professor', '87454 Skiles Forks\nSouth Adellburgh, MI 90376', 'Randal Willms Sr.', '01308532819', 'Alexane Hansen', '01950025509', 'Randall Hilpert', '01993067151', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:11', '2025-12-20 08:34:11', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:11', '2025-12-20 08:34:11'),
(12, 'Emelia', 'Jast', '1982-04-20', 'Female', 'AB+', '8965283517630', '01770514981', 'teacher11@example.com', '$2y$12$MOzdfDw4Z0HIjilyiXrBUuVlje/5SqmA4geXtgmTdIng2HGKu2oPO', 'Head of Department', '3379 Gerhold Cliffs Apt. 246\nRolfsonside, TN 20123', 'Prof. Isom Steuber', '01769000804', 'Myrtis Larkin', '01438618566', 'Evangeline Nitzsche', '01604858022', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:11', '2025-12-20 08:34:11', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:11', '2025-12-20 08:34:11'),
(13, 'Zachary', 'Haag', '1980-06-12', 'Female', 'A-', '5423777503011', '01369306743', 'teacher12@example.com', '$2y$12$41bGYiaYPZBXj4zFP/YGd.vWchJuc/EYjjGKazNFMuiH.chICgiGW', 'Senior Teacher', '431 Schoen Cliff Suite 895\nNew Nico, NM 94649', 'Prof. Bo Kulas', '01900112343', 'Violet Pagac IV', '01680526880', 'Gerhard Ferry', '01721290352', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:11', '2025-12-20 08:34:11', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:11', '2025-12-20 08:34:11'),
(14, 'Janessa', 'Nolan', '1988-02-12', 'Female', 'A+', '5069802703315', '01512351675', 'teacher13@example.com', '$2y$12$SjP/smsBibmmz26MBewyuOwbGuEAidqmxpDF88wKFtomouLi.xD5e', 'Head of Department', '4525 Emmet Hill Suite 316\nSouth Christiana, DE 73148-7926', 'Mr. Clovis Weissnat Sr.', '01411783545', 'Sylvia Abernathy DDS', '01681489784', 'Ceasar Howe', '01956142545', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:12', '2025-12-20 08:34:12', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:12', '2025-12-20 08:34:12'),
(15, 'Josianne', 'Goodwin', '1971-08-08', 'Male', 'AB-', '8765611908115', '01893811382', 'teacher14@example.com', '$2y$12$6/oq3wqv7pfilH8BNjn67Okno.vOuqWuypXKZNBdKBBr/jadcMBDK', 'Head of Department', '333 Heaney Fort\nCollierside, WA 43035', 'Tito Waelchi DVM', '01531600035', 'Yvonne Dickinson', '01609257075', 'Lucy Kuphal', '01993195484', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:12', '2025-12-20 08:34:12', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:12', '2025-12-20 08:34:12'),
(16, 'Ernestine', 'Stehr', '1986-03-24', 'Male', 'B+', '5665903148580', '01762002169', 'teacher15@example.com', '$2y$12$9blRbxyaGLRnFVT3jcBKP.xF/0sKQ.Sc3XhJtr5UKIWe34/k35WLi', 'Head of Department', '8092 Ledner Pines Apt. 906\nHermistonborough, NE 43800', 'Kadin Wiegand DVM', '01778691057', 'Mabel Windler', '01543008244', 'Dr. Ken Rolfson PhD', '01743268497', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:12', '2025-12-20 08:34:12', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:12', '2025-12-20 08:34:12'),
(17, 'Jessika', 'Pacocha', '1972-09-19', 'Female', 'O-', '4098915768998', '01850391803', 'teacher16@example.com', '$2y$12$gflOPVdp1fW8RLYzkqpHqObly2rZGaAYUsan6htKRmP/YWmJquAa2', 'Assistant Professor', '6579 Prudence Corner Apt. 333\nJavierberg, ND 64340', 'Coty Turner', '01844929662', 'Beulah Swift', '01944501876', 'Macie Anderson', '01889249152', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:12', '2025-12-20 08:34:12', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:12', '2025-12-20 08:34:12'),
(18, 'Amanda', 'Runolfsdottir', '1997-05-16', 'Female', 'A-', '6523474338850', '01396130258', 'teacher17@example.com', '$2y$12$8V1Y1GBfvs304KXiKtaEW.OA8QLEYG82tIUvlrhER6zo1GrRTXKyy', 'Assistant Professor', '2679 Vandervort Loop Suite 115\nCristport, NC 47318-5804', 'Raheem Pacocha', '01520675612', 'Dr. Shemar Batz', '01881495306', 'Jeremy Sipes', '01871979678', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:13', '2025-12-20 08:34:13', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:13', '2025-12-20 08:34:13'),
(19, 'Evelyn', 'Hodkiewicz', '1991-01-29', 'Female', 'O+', '0076496558183', '01367672726', 'teacher18@example.com', '$2y$12$c0HrDtyM3uaq.iXWuIFajOKPSCCOydjVITuTazYoIxuoDA9lJBNWe', 'Senior Teacher', '700 Frank Ports Suite 961\nCorkerymouth, AR 95449', 'Brendon Beer', '01615105359', 'Janessa Schaden', '01782494692', 'Modesto Fisher', '01734968010', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:13', '2025-12-20 08:34:13', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:13', '2025-12-20 08:34:13'),
(20, 'Odie', 'Grant', '1998-09-10', 'Female', 'B+', '0318002157657', '01724383276', 'teacher19@example.com', '$2y$12$iSCmCQC0AUItj0ou3m9L/OnFKICnbeMOVm5MSGmjxL5UuSgCQjwwO', 'Assistant Professor', '1569 Fisher Orchard\nWest Madaline, DE 22778', 'Mr. Nasir Thiel', '01441332899', 'Cassidy Romaguera', '01703702719', 'Mrs. Aryanna Abshire PhD', '01783517380', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:13', '2025-12-20 08:34:13', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:13', '2025-12-20 08:34:13'),
(21, 'Cecile', 'Connelly', '1973-11-19', 'Female', 'AB+', '7268939447024', '01538468104', 'teacher20@example.com', '$2y$12$oTORntYbPUltJXEpbJKOQeLAhzG9b7dVC4IfDROx.MNLkGqGSUce6', 'Head of Department', '38624 Adrien Meadows\nEmmanuellehaven, IA 21893', 'Willis Lynch', '01331418023', 'Ms. Ocie Hodkiewicz', '01527824391', 'Claudine Graham', '01393328841', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:13', '2025-12-20 08:34:13', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:13', '2025-12-20 08:34:13'),
(22, 'Amalia', 'Kshlerin', '1969-10-16', 'Female', 'A+', '0058422187713', '01432606501', 'teacher21@example.com', '$2y$12$/aKSVSnd3Yl/o/2yoquJYuA28OwpsN8Qh4at0wFOQ7UGt0HmpG9Ya', 'Lecturer', '350 Francisco Mountains\nNew Sammie, OH 66414-5715', 'Dr. Robbie Abernathy', '01900768903', 'Selena Berge', '01402611359', 'Peter Simonis I', '01859911340', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:13', '2025-12-20 08:34:13', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:13', '2025-12-20 08:34:13'),
(23, 'Dalton', 'Rutherford', '1974-11-25', 'Female', 'O+', '6944093827894', '01937147706', 'teacher22@example.com', '$2y$12$qnbJsOPFXORTns1Pxdl7e.Mu/Ed7hNb4N7xsrLcNvAhMobZ3INSwu', 'Assistant Professor', '755 Konopelski Crescent\nNew Wilsonchester, KY 66736-7721', 'Jesus Schimmel', '01574235606', 'Olga Hermann', '01376714609', 'Orpha Schoen', '01643931252', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:14', '2025-12-20 08:34:14', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:14', '2025-12-20 08:34:14'),
(24, 'Rachelle', 'Cronin', '1989-05-21', 'Female', 'B+', '8140447896934', '01441192042', 'teacher23@example.com', '$2y$12$c.TWuNglwAZRLrxGm/wIj.x1iwLQ4N0zg.a4C/iYVtqLyGfZ9pES.', 'Assistant Professor', '4222 Erdman Trail Suite 825\nWatersfurt, SC 81232-0180', 'Ike Wiegand Sr.', '01863532752', 'Mrs. Verla Hudson', '01689971520', 'Kitty Schroeder', '01560046026', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:14', '2025-12-20 08:34:14', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:14', '2025-12-20 08:34:14'),
(25, 'Charlotte', 'Schaefer', '1975-04-26', 'Male', 'A-', '0925626996889', '01779752222', 'teacher24@example.com', '$2y$12$Zs77zpea/fJ2LvZSI.yKE.lPnoAc0wpndryafRUMyz2MjHk5m9lVG', 'Senior Teacher', '77491 Beer Springs\nNew Keshaun, NC 85293-6304', 'Raphael Bartoletti', '01452945274', 'Anahi Larkin Jr.', '01862026229', 'Prof. Mallie Dibbert DVM', '01518892869', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:14', '2025-12-20 08:34:14', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:14', '2025-12-20 08:34:14'),
(26, 'Nikko', 'Herman', '2000-11-22', 'Male', 'AB+', '5341788899278', '01975049171', 'teacher25@example.com', '$2y$12$x1DXe9owz9JbF7NP6AuiEOHv2Gw4Ui/.DEDLlOKzPLppgUqkUPXra', 'Senior Teacher', '185 Waters Ports Apt. 858\nWest Modesto, SD 28850', 'Jimmy Berge', '01723763100', 'Vita Larkin', '01580321310', 'Rolando Mann', '01520817962', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:14', '2025-12-20 08:34:14', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:14', '2025-12-20 08:34:14'),
(27, 'Forrest', 'Pfannerstill', '1969-04-27', 'Male', 'A-', '7353190026892', '01897179131', 'teacher26@example.com', '$2y$12$sHY9o11qDUCjaQg9eGohK.s6nJtFt0oeXDTo3HvI5SSmfGY43xAs.', 'Assistant Professor', '15048 Bauch Tunnel\nSpencerborough, AL 33801', 'Murphy Schaden', '01949415420', 'Samanta Marquardt', '01873351440', 'Ruby Pfannerstill II', '01300941108', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:14', '2025-12-20 08:34:14', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:14', '2025-12-20 08:34:14'),
(28, 'Annabell', 'Heller', '1966-07-06', 'Male', 'A-', '5645349476816', '01812275725', 'teacher27@example.com', '$2y$12$qFBjolZbeUDGiO6OCoIRbuzlSwaxrQsK51QfvWRLvPt89Guv15Zh2', 'Lecturer', '7464 Will Corners Suite 674\nMurazikfort, SD 30662', 'Armando Luettgen', '01599759614', 'Miss Ivah Ratke DDS', '01877468389', 'Sadye Blick', '01416392041', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:15', '2025-12-20 08:34:15', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:15', '2025-12-20 08:34:15'),
(29, 'Herminia', 'Padberg', '1977-10-20', 'Male', 'A+', '6741333897570', '01952154303', 'teacher28@example.com', '$2y$12$6jp5pLAwip.1eHhEV0.pqOemblWesJ3h7ij4nRd5diFI5MaMcrHJS', 'Senior Teacher', '8085 Israel Pine\nKassulkechester, OK 38411', 'Mr. Samson Schultz Sr.', '01649627747', 'Kiana McDermott', '01838068464', 'Tianna Hermiston', '01325203292', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:15', '2025-12-20 08:34:15', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:15', '2025-12-20 08:34:15'),
(30, 'Ebba', 'Kirlin', '1994-05-16', 'Female', 'A+', '9908274697480', '01957946937', 'teacher29@example.com', '$2y$12$4GKdIFPS3wWrBk.W3P097OxYqDKItNapZdiUGDvFx8qACQnlicJ3.', 'Lecturer', '862 Holden Fields\nWest Michaleborough, DC 54751-7715', 'Tyreek Bode', '01710982641', 'Alison Blick', '01518019366', 'Dr. Camron Heathcote DDS', '01460363386', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-20 08:34:15', '2025-12-20 08:34:15', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-20 08:34:15', '2025-12-20 08:34:15');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendances`
--

CREATE TABLE `teacher_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_time` time NOT NULL,
  `status` enum('present','absent') NOT NULL DEFAULT 'present',
  `ip_address` varchar(45) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_student_id_foreign` (`student_id`),
  ADD KEY `attendances_class_id_foreign` (`class_id`),
  ADD KEY `attendances_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_period_unique` (`class_id`,`day`,`period`),
  ADD UNIQUE KEY `teacher_period_unique` (`teacher_id`,`day`,`period`),
  ADD KEY `class_schedules_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_class_id_foreign` (`class_id`),
  ADD KEY `exams_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `exam_names`
--
ALTER TABLE `exam_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `excategories`
--
ALTER TABLE `excategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_catid_foreign` (`catId`),
  ADD KEY `expenses_subcatid_foreign` (`subcatId`),
  ADD KEY `expenses_userid_foreign` (`userId`);

--
-- Indexes for table `exsubcategories`
--
ALTER TABLE `exsubcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exsubcategories_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fee_categories`
--
ALTER TABLE `fee_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_payments_student_id_foreign` (`student_id`),
  ADD KEY `fee_payments_fee_structure_id_foreign` (`fee_structure_id`);

--
-- Indexes for table `fee_payment_details`
--
ALTER TABLE `fee_payment_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_payment_details_receipt_no_unique` (`receipt_no`),
  ADD UNIQUE KEY `fee_payment_details_invoice_no_unique` (`invoice_no`),
  ADD KEY `fee_payment_details_student_id_foreign` (`student_id`),
  ADD KEY `fee_payment_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `fee_payment_items`
--
ALTER TABLE `fee_payment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_payment_items_fee_payment_id_foreign` (`fee_payment_id`),
  ADD KEY `fee_payment_items_student_id_foreign` (`student_id`),
  ADD KEY `fee_payment_items_fee_structure_id_foreign` (`fee_structure_id`);

--
-- Indexes for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_structures_class_id_fee_cat_id_unique` (`class_id`,`fee_cat_id`),
  ADD KEY `fee_structures_fee_cat_id_foreign` (`fee_cat_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marks_student_id_foreign` (`student_id`),
  ADD KEY `marks_subject_id_foreign` (`subject_id`),
  ADD KEY `marks_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_class_teacher_id_foreign` (`class_teacher_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD UNIQUE KEY `students_admission_no_unique` (`admission_no`),
  ADD UNIQUE KEY `students_b_reg_no_unique` (`b_reg_no`),
  ADD UNIQUE KEY `students_b_roll_no_unique` (`b_roll_no`),
  ADD KEY `students_class_id_foreign` (`class_id`);

--
-- Indexes for table `student_daily_routines`
--
ALTER TABLE `student_daily_routines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_daily_routines_student_id_foreign` (`student_id`);

--
-- Indexes for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_subjects_student_id_subject_id_unique` (`student_id`,`subject_id`),
  ADD KEY `student_subjects_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_group_id_foreign` (`group_id`),
  ADD KEY `subjects_class_id_foreign` (`class_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_national_id_unique` (`national_id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`);

--
-- Indexes for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teacher_attendances_teacher_id_attendance_date_unique` (`teacher_id`,`attendance_date`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_names`
--
ALTER TABLE `exam_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `excategories`
--
ALTER TABLE `excategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exsubcategories`
--
ALTER TABLE `exsubcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_categories`
--
ALTER TABLE `fee_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fee_payments`
--
ALTER TABLE `fee_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_payment_details`
--
ALTER TABLE `fee_payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_payment_items`
--
ALTER TABLE `fee_payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_structures`
--
ALTER TABLE `fee_structures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `student_daily_routines`
--
ALTER TABLE `student_daily_routines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `attendances_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `class_schedules_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `class_schedules_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `class_schedules_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `exams_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_catid_foreign` FOREIGN KEY (`catId`) REFERENCES `excategories` (`id`),
  ADD CONSTRAINT `expenses_subcatid_foreign` FOREIGN KEY (`subcatId`) REFERENCES `exsubcategories` (`id`),
  ADD CONSTRAINT `expenses_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `exsubcategories`
--
ALTER TABLE `exsubcategories`
  ADD CONSTRAINT `exsubcategories_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `excategories` (`id`);

--
-- Constraints for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD CONSTRAINT `fee_payments_fee_structure_id_foreign` FOREIGN KEY (`fee_structure_id`) REFERENCES `fee_structures` (`id`),
  ADD CONSTRAINT `fee_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `fee_payment_details`
--
ALTER TABLE `fee_payment_details`
  ADD CONSTRAINT `fee_payment_details_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `fee_payment_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `fee_payment_items`
--
ALTER TABLE `fee_payment_items`
  ADD CONSTRAINT `fee_payment_items_fee_payment_id_foreign` FOREIGN KEY (`fee_payment_id`) REFERENCES `fee_payment_details` (`id`),
  ADD CONSTRAINT `fee_payment_items_fee_structure_id_foreign` FOREIGN KEY (`fee_structure_id`) REFERENCES `fee_structures` (`id`),
  ADD CONSTRAINT `fee_payment_items_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD CONSTRAINT `fee_structures_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `fee_structures_fee_cat_id_foreign` FOREIGN KEY (`fee_cat_id`) REFERENCES `fee_categories` (`id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `marks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `marks_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_class_teacher_id_foreign` FOREIGN KEY (`class_teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `student_daily_routines`
--
ALTER TABLE `student_daily_routines`
  ADD CONSTRAINT `student_daily_routines_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD CONSTRAINT `student_subjects_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_subjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `subjects_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Constraints for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  ADD CONSTRAINT `teacher_attendances_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
