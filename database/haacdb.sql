-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2025 at 10:10 AM
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

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `student_id`, `class_id`, `subject_id`, `attendance_date`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 11, 5, 81, '2025-11-23', 'Present', 'N/A', '2025-11-23 06:31:01', '2025-11-23 06:31:01'),
(2, 13, 5, 81, '2025-11-23', 'Present', 'N/A', '2025-11-23 06:31:02', '2025-11-23 06:31:02'),
(3, 32, 5, 81, '2025-11-23', 'Absent', 'N/A', '2025-11-23 06:31:03', '2025-11-23 06:31:03'),
(4, 11, 5, 82, '2025-11-23', 'Present', 'N/A', '2025-11-23 06:31:09', '2025-11-23 06:31:09'),
(5, 13, 5, 82, '2025-11-23', 'Present', 'N/A', '2025-11-23 06:31:11', '2025-11-23 06:31:11'),
(6, 32, 5, 82, '2025-11-23', 'Absent', 'N/A', '2025-11-23 06:31:11', '2025-11-23 06:31:11');

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
(1, 'Tuition Fee', 'Regular fee for academic instruction and classes', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(2, 'Admission Fee', 'One-time fee for student enrollment', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(3, 'Exam Fee', 'Fee for conducting examinations', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(4, 'Library Fee', 'Charge for library access and maintenance', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(5, 'Laboratory Fee', 'Fee for science/computer lab usage', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(6, 'Sports Fee', 'Charge for sports activities and events', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(7, 'Transport Fee', 'Fee for school bus/transport facilities', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(8, 'Hostel Fee', 'Accommodation and meal charges in hostel', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(9, 'Development Fee', 'Fee for infrastructure and school development', '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(10, 'Activity Fee', 'Fee for extracurricular activities and events', '2025-11-23 06:14:40', '2025-11-23 06:14:40');

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
(80, '2014_10_12_000000_create_users_table', 1),
(81, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(82, '2014_10_12_100000_create_password_resets_table', 1),
(83, '2019_08_19_000000_create_failed_jobs_table', 1),
(84, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(85, '2025_09_11_094326_create_teachers_table', 1),
(86, '2025_09_12_060130_create_rooms_table', 1),
(87, '2025_09_12_060131_create_students_table', 1),
(88, '2025_09_13_043441_create_subjects_table', 1),
(89, '2025_09_13_043442_create_attendances_table', 1),
(90, '2025_09_13_085234_create_exams_table', 1),
(91, '2025_09_13_085241_create_marks_table', 1),
(92, '2025_09_16_081917_create_student_subjects_table', 1),
(93, '2025_09_22_185426_create_fee_categories_table', 1),
(94, '2025_09_22_185444_create_fee_structures_table', 1),
(95, '2025_09_22_185453_create_fee_payments_table', 1),
(96, '2025_09_28_183808_create_exam_names_table', 1),
(97, '2025_10_03_153733_create_class_schedules_table', 1),
(98, '2025_11_20_122825_create_notices_table', 1),
(99, '2025_11_22_173329_create_teacher_attendances_table', 1),
(100, '2025_11_23_131009_create_student_daily_routines_table', 2);

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Reanna', 'Spinka', '2009-08-08', 'Female', 'B-', 'Islam', 'Bangladeshi', '1', '346-890-6828', 'student2@example.com', '$2y$12$O7JXv1RST5sQSoyCQAnh8uJ0Hb3XVhSH8DccorC/x4XG/lb2/vTIK', '10271 Amely Ridges Suite 087\nNew Mikelton, AZ 69247', 'Apt. 750', 'Randal McDermott', 'Engineer', '+16206505833', 'student2@example.com', '2', '3', 'Miss Burnice Haley', 'Businesswoman', '989.344.8664', 'student4@example.com', '4', '5', 'Ashley Murazik', '347.682.9615', 'student6@example.com', '6', 'Uncle', 1, 1, 4, '2025-11-18', 'N/A', 7, 9299047, NULL, NULL, NULL, 'VJ2F0OmfWsR8syaxZoWjPRJVP26TzYMvlNqVJF3ryT0ZWePo7Ke1D0MmPzbU', '2025-11-23 06:14:32', '2025-11-23 06:14:32'),
(2, 'Gideon', 'Streich', '1970-02-05', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '8', '838-672-4768', 'student9@example.com', '$2y$12$3NiUejL/kUByGP3AbzQeveAjo6KK3CRQ/fNgBq2ON1Tyv62.RP/MG', '431 Giovani Heights Apt. 436\nSouth Laurianne, TX 89534', 'Apt. 761', 'Kendrick Abshire', 'Farmer', '412-982-7503', 'student9@example.com', '9', '10', 'Dr. Tierra Cormier Sr.', 'Businesswoman', '781-860-4451', 'student11@example.com', '11', '12', 'Martina Rohan', '+16803109295', 'student13@example.com', '13', 'Grandparent', 1, 1, 3, '2025-11-18', 'N/A', 14, 92990414, NULL, NULL, NULL, NULL, '2025-11-23 06:14:32', '2025-11-23 06:14:32'),
(3, 'Pamela', 'Crona', '1980-07-19', 'Other', 'A-', 'Christian', 'Bangladeshi', '15', '(346) 899-7973', 'student16@example.com', '$2y$12$5T8jEXFH3qLo99ODQSdvbeI2AwXItDgY5JEPYWVohOOe/B2PBGTb2', '681 Miller Canyon\nLake Micheal, NM 19131', 'Suite 555', 'Cristopher Larson', 'Doctor', '234-943-7305', 'student16@example.com', '16', '17', 'Keara Reynolds DDS', 'Teacher', '+1-678-757-6936', 'student18@example.com', '18', '19', 'Alexys Ziemann', '+1 (718) 282-8018', 'student20@example.com', '20', 'Brother', 1, 2, 3, '2025-11-18', 'N/A', 21, 92990421, NULL, NULL, NULL, NULL, '2025-11-23 06:14:32', '2025-11-23 06:14:32'),
(4, 'Javier', 'Yost', '1982-02-03', 'Female', 'A+', 'Other', 'Bangladeshi', '22', '+1 (951) 813-4939', 'student23@example.com', '$2y$12$M4TAhjdQb30KTsDm7Hk4AOc1LH7JQjvEgil8h88mwoXgbFd9oV2ZS', '58180 Stephania Rest Suite 827\nErdmanfort, KS 89287-2142', 'Suite 297', 'Freeman Wyman', 'Farmer', '1-934-392-1474', 'student23@example.com', '23', '24', 'Jaquelin Jaskolski', 'Businesswoman', '+1 (330) 854-7101', 'student25@example.com', '25', '26', 'Johnathon Dickens', '769-682-5048', 'student27@example.com', '27', 'Uncle', 1, 2, 4, '2025-11-18', 'N/A', 28, 92990428, NULL, NULL, NULL, NULL, '2025-11-23 06:14:32', '2025-11-23 06:14:32'),
(5, 'Marta', 'Hoeger', '2020-07-03', 'Male', 'B-', 'Other', 'Bangladeshi', '29', '+18433739453', 'student30@example.com', '$2y$12$bZioOnsmUElZo6pzMC1zA.RN5oJjK3MSMMs7mJcDXg9PkqjzSP2qe', '7442 Heathcote Freeway Suite 879\nGoyettemouth, IL 33574-5175', 'Suite 764', 'Webster King', 'Businessman', '+13043408963', 'student30@example.com', '30', '31', 'Skyla Greenfelder', 'Nurse', '754-609-8840', 'student32@example.com', '32', '33', 'Mr. Marques Baumbach', '458-996-7813', 'student34@example.com', '34', 'Aunt', 1, 3, 3, '2025-11-18', 'N/A', 35, 92990435, NULL, NULL, NULL, NULL, '2025-11-23 06:14:32', '2025-11-23 06:14:32'),
(6, 'SAMIM', 'HossaiN', '1976-04-21', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '36', '+1-747-887-6690', 'student37@example.com', '$2y$12$valhuDI2cbYI1OoiBmkB/uq5WzlLIuBIRUMA9eJ67NxCNZGAOkHx.', '989 Jackie Valley\nNorth Savionchester, NM 06980-5417', 'Suite 517', 'Edgardo Von', 'Engineer', '217.415.9224', 'student37@example.com', '37', '38', 'Sydni Blanda', 'Teacher', '+1.312.998.4712', 'student39@example.com', '39', '40', 'Brant Mueller', '361.255.2232', 'student41@example.com', '41', 'Uncle', 1, 1, 1, '2025-11-18', 'N/A', 42, 92990442, NULL, NULL, NULL, 'qKfM2GosFLZbf4rN4n5bbyBBpWIgzLQGNOinDJIdwVhoMVbek5wz0ktatRnq', '2025-11-23 06:14:32', '2025-11-23 06:14:32'),
(7, 'Keegan', 'Kunze', '2008-04-03', 'Other', 'B-', 'Christian', 'Bangladeshi', '43', '1-207-717-0075', 'student44@example.com', '$2y$12$hfQVwEzdlKjw2Bf19UmMDueZTvdovT564XaCq97K9VD7nlf.4gOve', '671 Emard Mill\nSouth Jamelborough, GA 46580', 'Apt. 223', 'Jace Wolf', 'Businessman', '681.764.7964', 'student44@example.com', '44', '45', 'Elsa Ondricka V', 'Doctor', '1-830-841-0021', 'student46@example.com', '46', '47', 'Prof. Zetta Wolff', '+1-516-499-5477', 'student48@example.com', '48', 'Uncle', 1, 1, 2, '2025-11-18', 'N/A', 49, 92990449, NULL, NULL, NULL, NULL, '2025-11-23 06:14:33', '2025-11-23 06:14:33'),
(8, 'Matilda', 'Mann', '1979-12-15', 'Female', 'B-', 'Christian', 'Bangladeshi', '50', '216.388.4348', 'student51@example.com', '$2y$12$GFVwfyYVywMVLjyIQtLBduC77KA6cEXQY3X/Zh2qxt3g1dpAysFWC', '305 Smith Run Suite 621\nCorwinborough, UT 13858-7703', 'Suite 994', 'Peter Morissette', 'Engineer', '(239) 310-0386', 'student51@example.com', '51', '52', 'Dr. Shania Grant', 'Nurse', '+1-360-908-7997', 'student53@example.com', '53', '54', 'Jeffry Okuneva', '+1.561.892.9761', 'student55@example.com', '55', 'Grandparent', 1, 2, 2, '2025-11-18', 'N/A', 56, 92990456, NULL, NULL, NULL, NULL, '2025-11-23 06:14:33', '2025-11-23 06:14:33'),
(9, 'Jazmyn', 'Mosciski', '2010-03-13', 'Female', 'A+', 'Christian', 'Bangladeshi', '57', '417.884.7004', 'student58@example.com', '$2y$12$VWBkUQMwwlqeSwug15VXzOCILjbsDAoxii/d.K8tGJHbpyI5URJy6', '792 Aliya Shoals\nNorth Pablo, ND 16656-4457', 'Suite 127', 'Mr. Carlo Koelpin', 'Businessman', '(253) 310-6780', 'student58@example.com', '58', '59', 'Prof. Dahlia Kreiger', 'Businesswoman', '1-850-538-1072', 'student60@example.com', '60', '61', 'Prof. Blanca Champlin', '225-715-0641', 'student62@example.com', '62', 'Sister', 1, 4, 3, '2025-11-18', 'N/A', 63, 92990463, NULL, NULL, NULL, NULL, '2025-11-23 06:14:33', '2025-11-23 06:14:33'),
(10, 'Willis', 'Bernhard', '2013-11-15', 'Female', 'AB+', 'Christian', 'Bangladeshi', '64', '+1-530-550-5812', 'student65@example.com', '$2y$12$R15o6KTMVxV.MzUUZQyTruOQAhSVAuezd/7eoeTIrO/80/NqxBZI2', '616 Karlie Estate\nNew Edythburgh, DC 17591-9711', 'Suite 244', 'Rylan Kuhlman', 'Doctor', '1-870-837-6602', 'student65@example.com', '65', '66', 'Rosalyn Nolan', 'Doctor', '1-636-493-7411', 'student67@example.com', '67', '68', 'Ariel Fadel', '1-458-328-5275', 'student69@example.com', '69', 'Grandparent', 1, 3, 2, '2025-11-18', 'N/A', 70, 92990470, NULL, NULL, NULL, NULL, '2025-11-23 06:14:33', '2025-11-23 06:14:33'),
(11, 'Hermann', 'Parisian', '2005-10-25', 'Female', 'AB+', 'Other', 'Bangladeshi', '71', '+1-501-669-3075', 'student72@example.com', '$2y$12$ov8qNOO5jAdeAQpQHwGWHOZ26SO9bZSQNoMZd3rlcmCvE44islA4C', '73887 Howard Lane\nJalenbury, NH 82379', 'Suite 289', 'Dr. Garret Runolfsson I', 'Teacher', '(520) 973-0353', 'student72@example.com', '72', '73', 'Dr. Catharine Brakus MD', 'Teacher', '432-276-6794', 'student74@example.com', '74', '75', 'Ms. Marina Lemke', '1-341-997-6103', 'student76@example.com', '76', 'Sister', 1, 1, 5, '2025-11-18', 'N/A', 77, 92990477, NULL, NULL, NULL, NULL, '2025-11-23 06:14:33', '2025-11-23 06:14:33'),
(12, 'Caleb', 'Kessler', '1998-01-30', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '78', '+1-820-530-9305', 'student79@example.com', '$2y$12$Iz0peBnB47HBBhSfkcC/NumxH1zcSJ.6/uvbqsY/L6J.6c85HDnSu', '923 Hettinger Vista Suite 958\nNorth Robertmouth, WA 55791', 'Apt. 485', 'Mr. Keith Schulist', 'Businessman', '(732) 962-9929', 'student79@example.com', '79', '80', 'Pearlie Roberts', 'Housewife', '308.375.6153', 'student81@example.com', '81', '82', 'Heloise Hintz', '872-428-0009', 'student83@example.com', '83', 'Aunt', 1, 5, 3, '2025-11-18', 'N/A', 84, 92990484, NULL, NULL, NULL, NULL, '2025-11-23 06:14:34', '2025-11-23 06:14:34'),
(13, 'Abagail', 'Skiles', '2000-09-20', 'Male', 'B-', 'Buddhist', 'Bangladeshi', '85', '+1-714-832-1847', 'student86@example.com', '$2y$12$Usjqkm3YcneYx1QcL9dDu.QBtMShdTQ7gkQKClIcpLmkbTOh8976q', '150 Mann Lights Apt. 843\nWest Mayabury, IN 90298-0586', 'Apt. 548', 'Mr. Tyrel White IV', 'Doctor', '(469) 875-6884', 'student86@example.com', '86', '87', 'Ms. Rosina Will', 'Businesswoman', '540-961-4477', 'student88@example.com', '88', '89', 'Deron Jakubowski', '+1-563-616-2819', 'student90@example.com', '90', 'Aunt', 1, 2, 5, '2025-11-18', 'N/A', 91, 92990491, NULL, NULL, NULL, NULL, '2025-11-23 06:14:34', '2025-11-23 06:14:34'),
(14, 'Santino', 'Bruen', '1977-01-26', 'Other', 'AB-', 'Christian', 'Bangladeshi', '92', '(681) 820-7476', 'student93@example.com', '$2y$12$cXhmw5ikcbdzqiiuGyF4sOWueG9Yt3R05fu1Q.NmOzqoSemx9cF8C', '42106 Hill Avenue\nPort Justinaside, IN 74075', 'Suite 334', 'Lane Bauch', 'Doctor', '1-215-985-6625', 'student93@example.com', '93', '94', 'Maida Monahan IV', 'Teacher', '+1-559-327-3578', 'student95@example.com', '95', '96', 'Alvina Becker', '+1.606.969.2929', 'student97@example.com', '97', 'Brother', 1, 4, 2, '2025-11-18', 'N/A', 98, 92990498, NULL, NULL, NULL, NULL, '2025-11-23 06:14:34', '2025-11-23 06:14:34'),
(15, 'Laurel', 'Little', '2006-11-15', 'Male', 'B-', 'Christian', 'Bangladeshi', '99', '1-202-395-0327', 'student100@example.com', '$2y$12$BhEQLUt81sgrjv7oYE6J9.A9JIh11slrgaGDVUAyO06lg1Xka/V5a', '8438 Karen Estate\nArmstronghaven, AZ 87523-4166', 'Apt. 409', 'Dr. Jared Mohr', 'Businessman', '1-862-701-5996', 'student100@example.com', '100', '101', 'Addie Douglas', 'Housewife', '240.283.2955', 'student102@example.com', '102', '103', 'Owen Nitzsche', '1-205-636-9088', 'student104@example.com', '104', 'Aunt', 1, 2, 1, '2025-11-18', 'N/A', 105, 929904105, NULL, NULL, NULL, NULL, '2025-11-23 06:14:34', '2025-11-23 06:14:34'),
(16, 'Shaylee', 'Heathcote', '1982-08-24', 'Other', 'AB+', 'Christian', 'Bangladeshi', '106', '+1 (907) 521-3833', 'student107@example.com', '$2y$12$Zqa4uMTpkhluUMyxKEh0kOpGl4kWakn4zoYCXBfUzLWAaLUe504Ti', '9310 Kozey Avenue Apt. 951\nSouth Grayson, NM 94544', 'Apt. 560', 'Amir McDermott', 'Doctor', '443-348-1941', 'student107@example.com', '107', '108', 'Iliana Rath', 'Housewife', '256-620-2254', 'student109@example.com', '109', '110', 'Mr. Kenny Schowalter', '+1-316-306-4936', 'student111@example.com', '111', 'Brother', 1, 5, 2, '2025-11-18', 'N/A', 112, 929904112, NULL, NULL, NULL, NULL, '2025-11-23 06:14:34', '2025-11-23 06:14:34'),
(17, 'Lynn', 'Ebert', '2021-07-04', 'Male', 'O-', 'Buddhist', 'Bangladeshi', '113', '260-643-3335', 'student114@example.com', '$2y$12$fkOn/ltfqNIbqqOVYtOLb.A./PAimWQikW.K7./kJ6Mkm1W2OkDGW', '74209 Mathias Way Suite 723\nBoehmborough, CA 78594-3378', 'Suite 935', 'Brody Wunsch', 'Doctor', '1-231-734-9048', 'student114@example.com', '114', '115', 'Elouise Schroeder', 'Teacher', '+1-539-831-8096', 'student116@example.com', '116', '117', 'Ernestina Paucek', '(930) 451-1313', 'student118@example.com', '118', 'Aunt', 1, 3, 4, '2025-11-18', 'N/A', 119, 929904119, NULL, NULL, NULL, NULL, '2025-11-23 06:14:34', '2025-11-23 06:14:34'),
(18, 'Matteo', 'Baumbach', '1985-03-23', 'Male', 'A-', 'Christian', 'Bangladeshi', '120', '608.978.8855', 'student121@example.com', '$2y$12$ciqAzYzYvsixvNidGUhDVONL5pxBCBBX9Xcl5BMYmCi5/G5818ooq', '903 Laisha Square\nPort Whitney, DC 09444-2331', 'Suite 804', 'Mr. Arlo Kilback III', 'Businessman', '(520) 534-9194', 'student121@example.com', '121', '122', 'Olga Beier', 'Nurse', '1-631-952-7730', 'student123@example.com', '123', '124', 'Trever Stracke', '(719) 487-5896', 'student125@example.com', '125', 'Brother', 1, 6, 2, '2025-11-18', 'N/A', 126, 929904126, NULL, NULL, NULL, NULL, '2025-11-23 06:14:35', '2025-11-23 06:14:35'),
(19, 'Lonzo', 'Shanahan', '2012-05-16', 'Female', 'AB+', 'Christian', 'Bangladeshi', '127', '(252) 871-3139', 'student128@example.com', '$2y$12$DNdMqtIFS.7Li/X2F1Sr6O6d.rhzDg0RYjQEBMUTsDMvgt27ECWna', '739 Lindgren Prairie\nBinstown, MN 01871-0928', 'Apt. 679', 'Prof. Malcolm Sporer', 'Businessman', '+1-309-864-3622', 'student128@example.com', '128', '129', 'Adaline Bernier', 'Nurse', '+1-331-549-9181', 'student130@example.com', '130', '131', 'Rosanna Pollich', '1-234-419-1771', 'student132@example.com', '132', 'Grandparent', 1, 4, 4, '2025-11-18', 'N/A', 133, 929904133, NULL, NULL, NULL, NULL, '2025-11-23 06:14:35', '2025-11-23 06:14:35'),
(20, 'Jacinthe', 'Collins', '1985-11-12', 'Female', 'AB+', 'Christian', 'Bangladeshi', '134', '(757) 513-4126', 'student135@example.com', '$2y$12$nXbfaaqDc78UVTds28HCr.yYShmMQiV7kLSqWwK9ZCnHQG6Tu6udu', '3041 Amira Estates\nEast Emmieburgh, OR 06936-0280', 'Suite 975', 'Marcos Hintz', 'Farmer', '707-666-8311', 'student135@example.com', '135', '136', 'Dr. Alvina Becker', 'Teacher', '+1 (559) 328-8018', 'student137@example.com', '137', '138', 'Joan Harris', '954.937.9870', 'student139@example.com', '139', 'Grandparent', 1, 3, 1, '2025-11-18', 'N/A', 140, 929904140, NULL, NULL, NULL, NULL, '2025-11-23 06:14:35', '2025-11-23 06:14:35'),
(21, 'Rahsaan', 'Spinka', '1999-09-22', 'Female', 'O-', 'Buddhist', 'Bangladeshi', '141', '520-849-7532', 'student142@example.com', '$2y$12$R37Dh7HR4vwgUD9DHNagkO0cm9ZjWsspMUKcTsFEtuk7zoCnu0mPW', '6017 Barrows Field Apt. 368\nGulgowskiville, HI 25774-9731', 'Suite 760', 'Don Ziemann', 'Businessman', '(567) 638-1010', 'student142@example.com', '142', '143', 'Linda Oberbrunner', 'Housewife', '+1-224-472-6492', 'student144@example.com', '144', '145', 'Aditya Hauck', '1-720-912-0552', 'student146@example.com', '146', 'Aunt', 1, 4, 1, '2025-11-18', 'N/A', 147, 929904147, NULL, NULL, NULL, NULL, '2025-11-23 06:14:35', '2025-11-23 06:14:35'),
(22, 'Alba', 'Satterfield', '1972-05-15', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '148', '+1-949-922-2395', 'student149@example.com', '$2y$12$0Hw4O3jvY7N8OGF487U.z.BWLHJIEqU/W3GEkg54xjUvNJGhDKpKG', '1167 Della Terrace\nBernadineville, NC 28709', 'Apt. 326', 'Deshaun Vandervort', 'Engineer', '+1 (223) 209-8349', 'student149@example.com', '149', '150', 'Zoila Schiller PhD', 'Nurse', '+1.859.568.6119', 'student151@example.com', '151', '152', 'Lexus Ankunding', '863-909-1884', 'student153@example.com', '153', 'Brother', 1, 5, 4, '2025-11-18', 'N/A', 154, 929904154, NULL, NULL, NULL, NULL, '2025-11-23 06:14:35', '2025-11-23 06:14:35'),
(23, 'Gregorio', 'Zemlak', '2008-12-21', 'Other', 'A+', 'Hindu', 'Bangladeshi', '155', '1-952-231-2347', 'student156@example.com', '$2y$12$Ks58nr4rGhHe1SOpVH4Feev6BZPs9/DoA2iUNqVbsv7LHOlS35JFe', '641 Soledad Crest Apt. 190\nBlickhaven, CT 55275', 'Suite 668', 'Prof. Cordelia Lowe III', 'Farmer', '1-631-783-9991', 'student156@example.com', '156', '157', 'Myrtle Fahey IV', 'Nurse', '678-563-2521', 'student158@example.com', '158', '159', 'Mr. Mavis Wolff', '430-454-1921', 'student160@example.com', '160', 'Brother', 1, 6, 4, '2025-11-18', 'N/A', 161, 929904161, NULL, NULL, NULL, NULL, '2025-11-23 06:14:36', '2025-11-23 06:14:36'),
(24, 'Tess', 'Weber', '1996-09-12', 'Female', 'B+', 'Other', 'Bangladeshi', '162', '(779) 806-7454', 'student163@example.com', '$2y$12$c2rn2QHRegjXwjcDwdcLsO7P2LvBUfRGY48P94wiPL.GZC9q6A/Ea', '66744 Olson Ways Apt. 544\nDeontown, MI 81491-2197', 'Suite 372', 'Mr. Verner Considine DDS', 'Engineer', '+1.979.924.2411', 'student163@example.com', '163', '164', 'Mrs. Hailee Wiegand', 'Businesswoman', '+1 (747) 387-8277', 'student165@example.com', '165', '166', 'Carmella McLaughlin', '612.678.9039', 'student167@example.com', '167', 'Aunt', 1, 5, 1, '2025-11-18', 'N/A', 168, 929904168, NULL, NULL, NULL, NULL, '2025-11-23 06:14:36', '2025-11-23 06:14:36'),
(25, 'Corrine', 'Thompson', '2003-03-15', 'Male', 'A+', 'Islam', 'Bangladeshi', '169', '847.644.6507', 'student170@example.com', '$2y$12$UWoPH.EyILLIwjuIwV1tI.FsmGgcNj8Wpdo0ty3olja.pfaDad3Cy', '1755 Brittany Branch\nAshleymouth, DE 86869-4493', 'Suite 534', 'Rick Williamson', 'Teacher', '+14253279268', 'student170@example.com', '170', '171', 'Jana Thiel', 'Businesswoman', '737.331.4334', 'student172@example.com', '172', '173', 'Maci Klocko', '+1 (561) 655-5407', 'student174@example.com', '174', 'Aunt', 1, 6, 1, '2025-11-18', 'N/A', 175, 929904175, NULL, NULL, NULL, NULL, '2025-11-23 06:14:36', '2025-11-23 06:14:36'),
(26, 'Elmore', 'Bartoletti', '2020-10-29', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '176', '1-951-381-0039', 'student177@example.com', '$2y$12$6I.HeKl2ksR1jIrirGFW0.YIevEDyOEbX9Yg483kRD7jZH9zxCsCG', '383 Cassidy Place Suite 646\nO\'Konberg, SD 53089', 'Suite 599', 'Tremaine Osinski', 'Teacher', '863.716.5783', 'student177@example.com', '177', '178', 'Eunice Toy', 'Teacher', '+15614442581', 'student179@example.com', '179', '180', 'Anabel Stark', '+1 (732) 982-8591', 'student181@example.com', '181', 'Sister', 1, 7, 2, '2025-11-18', 'N/A', 182, 929904182, NULL, NULL, NULL, NULL, '2025-11-23 06:14:36', '2025-11-23 06:14:36'),
(27, 'Louisa', 'Emmerich', '2002-12-08', 'Female', 'B-', 'Other', 'Bangladeshi', '183', '1-812-512-0673', 'student184@example.com', '$2y$12$mmMIetFRailBeOkYfQ.IDeeAic7gI7MZAR72OSQocWzN8JGNgKYyK', '3621 Manley Roads\nJaytown, MD 59971', 'Apt. 186', 'Barry Runte', 'Teacher', '+1 (606) 215-9991', 'student184@example.com', '184', '185', 'Elfrieda Rowe', 'Teacher', '+1-413-357-9198', 'student186@example.com', '186', '187', 'Ms. Reanna Anderson', '+1 (820) 254-6917', 'student188@example.com', '188', 'Grandparent', 1, 7, 4, '2025-11-18', 'N/A', 189, 929904189, NULL, NULL, NULL, NULL, '2025-11-23 06:14:36', '2025-11-23 06:14:36'),
(28, 'Zechariah', 'Cremin', '2022-03-10', 'Male', 'O-', 'Other', 'Bangladeshi', '190', '+1-559-683-4484', 'student191@example.com', '$2y$12$xFd3RqgiBCKv6KtbMifvB.xi9vl339D/FYBoavW9.Pw8RQLF4b7eW', '456 Karl Trace Suite 987\nClaraside, HI 19447-3676', 'Apt. 708', 'Tremaine Green', 'Engineer', '409.757.7198', 'student191@example.com', '191', '192', 'Magali Pfannerstill', 'Businesswoman', '+1 (458) 843-1855', 'student193@example.com', '193', '194', 'Murray Metz', '847-752-2032', 'student195@example.com', '195', 'Sister', 1, 8, 4, '2025-11-18', 'N/A', 196, 929904196, NULL, NULL, NULL, NULL, '2025-11-23 06:14:36', '2025-11-23 06:14:36'),
(29, 'Howard', 'Keebler', '2017-12-03', 'Male', 'A+', 'Islam', 'Bangladeshi', '197', '+12486705309', 'student198@example.com', '$2y$12$0Yqk8bXFtXXaCakDJg./juTqIXJuZSB6rPp.RLPz1UffdZ.bKJjva', '9779 Kovacek Groves\nWest Richard, VT 01918', 'Apt. 154', 'Sheridan Weimann DDS', 'Doctor', '+1.415.720.2903', 'student198@example.com', '198', '199', 'Mrs. Noemie Cummings', 'Housewife', '972-389-0462', 'student200@example.com', '200', '201', 'Percival Smith', '1-302-265-2299', 'student202@example.com', '202', 'Grandparent', 1, 9, 4, '2025-11-18', 'N/A', 203, 929904203, NULL, NULL, NULL, NULL, '2025-11-23 06:14:37', '2025-11-23 06:14:37'),
(30, 'Murray', 'Oberbrunner', '2006-09-17', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '204', '913.406.5173', 'student205@example.com', '$2y$12$AYinvB6g9YHunc71LsYvOOwVR6qfukAbpKly9/4cIYZ.kuHHnLJ5i', '968 Tillman Pass\nWest Myleneland, WV 44172', 'Suite 500', 'Roman Berge', 'Teacher', '+1-854-827-5452', 'student205@example.com', '205', '206', 'Ms. Dawn O\'Keefe', 'Nurse', '(978) 673-2280', 'student207@example.com', '207', '208', 'Keanu Marquardt', '+1-862-551-2318', 'student209@example.com', '209', 'Grandparent', 1, 10, 4, '2025-11-18', 'N/A', 210, 929904210, NULL, NULL, NULL, NULL, '2025-11-23 06:14:37', '2025-11-23 06:14:37'),
(31, 'Brown', 'Wolf', '2010-10-18', 'Male', 'B-', 'Other', 'Bangladeshi', '211', '(925) 849-7428', 'student212@example.com', '$2y$12$KQimdVSKwOV9C/c8Spy.V.WAdN.JEvcHW9qnh3xni/UE67yRURtXS', '654 Pacocha Drives Apt. 808\nFriesenville, AK 54312-3169', 'Suite 212', 'Dr. Federico Russel Sr.', 'Doctor', '1-510-532-0290', 'student212@example.com', '212', '213', 'Katheryn Dietrich', 'Housewife', '+1-580-313-8767', 'student214@example.com', '214', '215', 'Prof. Jesus Lueilwitz', '986.901.3269', 'student216@example.com', '216', 'Aunt', 1, 11, 4, '2025-11-18', 'N/A', 217, 929904217, NULL, NULL, NULL, NULL, '2025-11-23 06:14:37', '2025-11-23 06:14:37'),
(32, 'Tod', 'Mosciski', '1973-02-19', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '218', '(262) 746-0264', 'student219@example.com', '$2y$12$c8aq5TICYR6G0laTEMgshuh2kU7wlCfqhoO9gcsY7pKBbZXUNSJ3O', '15596 Casimir Mountains\nAnnestad, MA 89737-1497', 'Apt. 454', 'London Doyle', 'Engineer', '763.991.2774', 'student219@example.com', '219', '220', 'Lilian Bergstrom', 'Housewife', '941.558.5829', 'student221@example.com', '221', '222', 'Dylan Block Sr.', '1-785-789-3451', 'student223@example.com', '223', 'Grandparent', 1, 3, 5, '2025-11-18', 'N/A', 224, 929904224, NULL, NULL, NULL, NULL, '2025-11-23 06:14:37', '2025-11-23 06:14:37'),
(33, 'Bonnie', 'Nader', '1978-03-11', 'Male', 'B+', 'Other', 'Bangladeshi', '225', '(540) 500-8998', 'student226@example.com', '$2y$12$kHVz8bdkQVKqqumMUa7T4.KALG5JvccbZD4.J8dVOyZT.DU08baIa', '58747 Cummerata Courts\nEast Thad, CO 20164-2636', 'Suite 467', 'Prof. Kendall Auer IV', 'Engineer', '1-575-621-5697', 'student226@example.com', '226', '227', 'Magnolia Daugherty', 'Businesswoman', '+18483148257', 'student228@example.com', '228', '229', 'Jed Kling', '(463) 761-7874', 'student230@example.com', '230', 'Uncle', 1, 7, 1, '2025-11-18', 'N/A', 231, 929904231, NULL, NULL, NULL, NULL, '2025-11-23 06:14:37', '2025-11-23 06:14:37'),
(34, 'Bella', 'Gusikowski', '2006-12-16', 'Other', 'A+', 'Christian', 'Bangladeshi', '232', '623-297-0214', 'student233@example.com', '$2y$12$n8nRHXA1rlIj4sZWJwbzDeCi2fgBMVz7gCe6GJinVjD.O0Ixe/nVO', '4297 Von Trail Suite 987\nFramiland, WA 87404', 'Apt. 144', 'Dr. Jabari Nienow', 'Farmer', '(479) 659-8315', 'student233@example.com', '233', '234', 'Myrtice Parisian', 'Doctor', '786.649.0329', 'student235@example.com', '235', '236', 'Marianne Green I', '+1.740.521.0585', 'student237@example.com', '237', 'Aunt', 1, 8, 1, '2025-11-18', 'N/A', 238, 929904238, NULL, NULL, NULL, NULL, '2025-11-23 06:14:38', '2025-11-23 06:14:38'),
(35, 'Amos', 'Swift', '1986-06-11', 'Female', 'O-', 'Islam', 'Bangladeshi', '239', '+1 (743) 652-4858', 'student240@example.com', '$2y$12$nFxP0h9D0GKKcXiyDHY5m.pGAFR.JnFaG7ZjPlYAQUQv29Mz39aLK', '861 Parker Island Apt. 012\nSouth Zackary, MT 31811-1440', 'Suite 097', 'Korey O\'Reilly', 'Teacher', '1-347-375-5659', 'student240@example.com', '240', '241', 'Dr. Abigale Terry III', 'Teacher', '+1-610-394-3088', 'student242@example.com', '242', '243', 'Easter Kozey', '+1.667.307.7065', 'student244@example.com', '244', 'Aunt', 1, 9, 1, '2025-11-18', 'N/A', 245, 929904245, NULL, NULL, NULL, NULL, '2025-11-23 06:14:38', '2025-11-23 06:14:38'),
(36, 'Madie', 'Weimann', '2004-06-26', 'Female', 'A+', 'Christian', 'Bangladeshi', '246', '+1-234-658-3194', 'student247@example.com', '$2y$12$bzzxCmSmRD13fX41qqvbJuzHMvJ6UxgynLV4RdB4lvKhIFU0mhPVO', '82359 Silas Port Suite 418\nPort Twila, IN 10250', 'Apt. 775', 'Gabe Stanton Sr.', 'Farmer', '386.757.7785', 'student247@example.com', '247', '248', 'Dominique Harris', 'Teacher', '+16613105289', 'student249@example.com', '249', '250', 'Prof. Natalie Kemmer', '+1-320-546-0823', 'student251@example.com', '251', 'Brother', 1, 10, 1, '2025-11-18', 'N/A', 252, 929904252, NULL, NULL, NULL, NULL, '2025-11-23 06:14:38', '2025-11-23 06:14:38'),
(37, 'Landen', 'Williamson', '2010-05-29', 'Male', 'AB-', 'Christian', 'Bangladeshi', '253', '(754) 291-8284', 'student254@example.com', '$2y$12$tHfKjiwIsS.Noks9LuVgfOX3ihoFZJMWUcSi/8uoLUOV6p.rcjjEq', '2326 Ward Wall\nMarleyville, NY 39156-3244', 'Suite 274', 'Mr. Franco Simonis', 'Engineer', '484-677-6495', 'student254@example.com', '254', '255', 'Rosella Bernier', 'Teacher', '562.437.9642', 'student256@example.com', '256', '257', 'Cathryn Ferry', '+1 (302) 621-0921', 'student258@example.com', '258', 'Sister', 1, 6, 3, '2025-11-18', 'N/A', 259, 929904259, NULL, NULL, NULL, NULL, '2025-11-23 06:14:38', '2025-11-23 06:14:38'),
(38, 'Elisabeth', 'Gleichner', '2000-07-08', 'Other', 'O-', 'Islam', 'Bangladeshi', '260', '+1-980-679-9376', 'student261@example.com', '$2y$12$W1gba1PEL/BVRnbxF4M3xOhpzohz79.pdoAB9.px./e1LNp/Nn.rW', '40934 Dayana Radial\nLake Chayabury, CT 88779-6166', 'Apt. 582', 'Prof. Matt Swift V', 'Businessman', '1-618-888-0806', 'student261@example.com', '261', '262', 'Miss Missouri Carroll Jr.', 'Teacher', '(857) 508-5461', 'student263@example.com', '263', '264', 'Darlene Jenkins DVM', '1-828-232-8718', 'student265@example.com', '265', 'Grandparent', 1, 8, 2, '2025-11-18', 'N/A', 266, 929904266, NULL, NULL, NULL, NULL, '2025-11-23 06:14:38', '2025-11-23 06:14:38'),
(39, 'Chaz', 'Tromp', '2000-06-19', 'Male', 'B+', 'Christian', 'Bangladeshi', '267', '+17322514359', 'student268@example.com', '$2y$12$0G9dusOjJk7l/UA4yFIJ5OzCt9dz5q5AMb9Xd5qBYkuhg94qUD2z.', '2270 Elias Lights Apt. 863\nWest Eleanora, AK 29695-8186', 'Apt. 261', 'Santa Robel', 'Farmer', '+1.765.914.3791', 'student268@example.com', '268', '269', 'Shanelle Schmitt', 'Nurse', '+1.913.903.6008', 'student270@example.com', '270', '271', 'Miss Bridie Reilly I', '+1.321.529.4058', 'student272@example.com', '272', 'Aunt', 1, 7, 3, '2025-11-18', 'N/A', 273, 929904273, NULL, NULL, NULL, NULL, '2025-11-23 06:14:38', '2025-11-23 06:14:38'),
(40, 'Abdullah', 'Nicolas', '1998-09-11', 'Other', 'AB+', 'Other', 'Bangladeshi', '274', '+1 (223) 937-8101', 'student275@example.com', '$2y$12$DjOSndzYCD.SF1znclzNuuw2oRpb/qDbvbGsgyplQNWV5ikchs.QK', '2242 Ora Court Suite 074\nNew Simeon, MA 89320-4464', 'Suite 916', 'Jermain Veum', 'Doctor', '(901) 967-2354', 'student275@example.com', '275', '276', 'Jayda VonRueden', 'Businesswoman', '+1 (870) 259-6858', 'student277@example.com', '277', '278', 'Ignacio Kris', '+1-667-406-5704', 'student279@example.com', '279', 'Grandparent', 1, 11, 1, '2025-11-18', 'N/A', 280, 929904280, NULL, NULL, NULL, NULL, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(41, 'Owen', 'Yost', '1982-06-08', 'Female', 'B+', 'Islam', 'Bangladeshi', '281', '(747) 224-8018', 'student282@example.com', '$2y$12$jnxyhI8lz89yIoBJ.g5/PeMAbf6Oi5rhonML/zayie7uIm6Z5TcAS', '12330 Kovacek Shoals\nPort Jadynside, IL 72448', 'Apt. 536', 'Gaylord Beahan', 'Businessman', '(279) 627-7194', 'student282@example.com', '282', '283', 'Aileen Spencer', 'Businesswoman', '+1 (931) 384-9765', 'student284@example.com', '284', '285', 'Omari Beatty', '539.636.3809', 'student286@example.com', '286', 'Brother', 1, 8, 3, '2025-11-18', 'N/A', 287, 929904287, NULL, NULL, NULL, NULL, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(42, 'Branson', 'Oberbrunner', '2013-02-02', 'Male', 'O-', 'Hindu', 'Bangladeshi', '288', '1-479-458-7290', 'student289@example.com', '$2y$12$xsNKq8DU51vkHRK7Wj0oQONrv7SyzbNskhP1yZekMIVeCeVXsh.lm', '9083 Elda Shoal\nLarkinmouth, KS 37068-9720', 'Apt. 994', 'Lawson Friesen', 'Farmer', '1-267-837-6873', 'student289@example.com', '289', '290', 'Cleora Rempel', 'Teacher', '1-317-389-7216', 'student291@example.com', '291', '292', 'Salvatore Stroman', '+16264546257', 'student293@example.com', '293', 'Sister', 1, 9, 3, '2025-11-18', 'N/A', 294, 929904294, NULL, NULL, NULL, NULL, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(43, 'Eliseo', 'Simonis', '1984-08-21', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '295', '+1.562.888.3104', 'student296@example.com', '$2y$12$.21FIW.M2/IfMl8ZPPmxmO8zbCloSNqLqQJKfBfNrtffG0aaNfiJC', '17338 Stefanie Wall\nRoobside, NJ 76871', 'Apt. 763', 'Lyric Streich', 'Teacher', '737.381.9550', 'student296@example.com', '296', '297', 'Jaida Stark', 'Businesswoman', '1-310-803-5437', 'student298@example.com', '298', '299', 'Larissa Greenholt', '+1-585-210-1943', 'student300@example.com', '300', 'Uncle', 1, 12, 4, '2025-11-18', 'N/A', 301, 929904301, NULL, NULL, NULL, NULL, '2025-11-23 06:14:39', '2025-11-23 06:14:39');

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

--
-- Dumping data for table `student_daily_routines`
--

INSERT INTO `student_daily_routines` (`id`, `date`, `student_id`, `time_to_awake`, `attendance_in_college`, `arrival_in_residence`, `prayer`, `morning_activity`, `evening_activity`, `night_activity`, `time_to_bed`, `total_hours`, `remark`, `created_at`, `updated_at`) VALUES
(1, '2025-11-22', 6, '06:00:00', 1, '10:00', 'Fajar, Johar, Asor, Magrim & Asha', '2 hrs', '1 hrs', '4 hrs', '12:00:00', 7, 'N/A', '2025-11-23 07:50:24', '2025-11-23 07:50:24'),
(2, '2025-11-21', 6, '06:00:00', 1, '10:00', 'Fajar, Johar, Asor, Magrim & Asha', '1 hrs', '1 hrs', '4 hrs', '00:00:00', 6, 'N/A', '2025-11-23 08:01:31', '2025-11-23 08:01:31'),
(3, '2025-11-23', 6, '06:15:00', 0, '10:00', 'Fajar, Johar, Asor, Magrim & Asha', '2 hrs', '1 hrs', '4 hrs', '00:15:00', 7, 'Today i was sick. that\'s why i cannot attend the class.', '2025-11-23 08:03:42', '2025-11-23 09:05:19');

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
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `class_id`, `created_at`, `updated_at`) VALUES
(1, 'Bangla', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(2, 'English', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(3, 'ICT', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(4, 'Physical Education', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(5, 'Physics', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(6, 'Chemistry', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(7, 'Biology', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(8, 'Higher Mathematics', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(9, 'Accounting', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(10, 'Business Organization & Management', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(11, 'Finance, Banking & Insurance', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(12, 'Production Management & Marketing', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(13, 'Logic', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(14, 'History', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(15, 'Civics', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(16, 'Economics', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(17, 'Islamic Studies', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(18, 'Sociology', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(19, 'Social Work', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(20, 'Geography', 1, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(21, 'Bangla', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(22, 'English', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(23, 'ICT', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(24, 'Physical Education', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(25, 'Physics', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(26, 'Chemistry', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(27, 'Biology', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(28, 'Higher Mathematics', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(29, 'Accounting', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(30, 'Business Organization & Management', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(31, 'Finance, Banking & Insurance', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(32, 'Production Management & Marketing', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(33, 'Logic', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(34, 'History', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(35, 'Civics', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(36, 'Economics', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(37, 'Islamic Studies', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(38, 'Sociology', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(39, 'Social Work', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(40, 'Geography', 2, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(41, 'Bangla', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(42, 'English', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(43, 'ICT', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(44, 'Physical Education', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(45, 'Physics', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(46, 'Chemistry', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(47, 'Biology', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(48, 'Higher Mathematics', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(49, 'Accounting', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(50, 'Business Organization & Management', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(51, 'Finance, Banking & Insurance', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(52, 'Production Management & Marketing', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(53, 'Logic', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(54, 'History', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(55, 'Civics', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(56, 'Economics', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(57, 'Islamic Studies', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(58, 'Sociology', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(59, 'Social Work', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(60, 'Geography', 3, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(61, 'Bangla', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(62, 'English', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(63, 'ICT', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(64, 'Physical Education', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(65, 'Physics', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(66, 'Chemistry', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(67, 'Biology', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(68, 'Higher Mathematics', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(69, 'Accounting', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(70, 'Business Organization & Management', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(71, 'Finance, Banking & Insurance', 4, '2025-11-23 06:14:39', '2025-11-23 06:14:39'),
(72, 'Production Management & Marketing', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(73, 'Logic', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(74, 'History', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(75, 'Civics', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(76, 'Economics', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(77, 'Islamic Studies', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(78, 'Sociology', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(79, 'Social Work', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(80, 'Geography', 4, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(81, 'Bangla', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(82, 'English', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(83, 'ICT', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(84, 'Physical Education', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(85, 'Physics', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(86, 'Chemistry', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(87, 'Biology', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(88, 'Higher Mathematics', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(89, 'Accounting', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(90, 'Business Organization & Management', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(91, 'Finance, Banking & Insurance', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(92, 'Production Management & Marketing', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(93, 'Logic', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(94, 'History', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(95, 'Civics', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(96, 'Economics', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(97, 'Islamic Studies', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(98, 'Sociology', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(99, 'Social Work', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40'),
(100, 'Geography', 5, '2025-11-23 06:14:40', '2025-11-23 06:14:40');

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
  `status` int(11) NOT NULL DEFAULT 1,
  `role` varchar(255) NOT NULL DEFAULT 'Admin',
  `remark` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `national_id`, `contact_number`, `email`, `password`, `designation`, `address`, `father_name`, `father_contact`, `mother_name`, `mother_contact`, `guardian_name`, `guardian_contact`, `guardian_relationship`, `photo`, `father_photo`, `mother_photo`, `joning_date`, `mop_date`, `traning`, `index_no`, `status`, `role`, `remark`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Autumn', 'Wunsch', '1972-04-23', 'Male', 'AB-', '0', '1-626-517-8478', 'teacher1@example.com', '$2y$12$xtRvMg0k3wvaqQIyzepb.e2K8Jiq4PWXRfpchJP3EHxX.U4u30Gnm', 'Lecturer', '979 Garrett Springs Suite 061\r\nJovanyhaven, NE 31534-7354', 'Dr. Rico Rosenbaum', '857-337-7574', 'Emmanuelle McKenzie', '1-810-777-7498', 'Maegan Shanahan', '803.943.2420', 'Grandparent', 'tch-Autumn-1763878537.jpg', NULL, NULL, '2004-08-28', '2025-11-23', 'N/A', 'D001', 1, 'Admin', 'N/A', 'qeBA7Q7weBeSonpxMY5SqHHO2xCz5fjco2KY6486S6QuAxZ0xis3derTWGuv', '2025-11-23 06:14:29', '2025-11-23 06:15:37'),
(2, 'Jazmyn', 'Mante', '1971-03-19', 'Female', 'O-', '2', '575.736.4303', 'teacher2@example.com', '$2y$12$eOJ0r1Nm1UWtfmW1X8xxhOetp4hUONXCGNuZkqaULLXp4M7QeJ/BS', 'Assistant Professor', '2534 Connelly Flat\nLake Joyside, WV 58681-9324', 'Diego Robel', '971-398-6446', 'Dr. Karina Padberg II', '1-364-888-5267', 'Pasquale McGlynn', '1-786-748-7532', 'Brother', NULL, NULL, NULL, '1987-11-03', '2011-08-06', 'N/A', 'D003', 1, 'Admin', 'N/A', 'gjK1uHfJiTgYmdxkHyFjGUJGstFs52R6fIyusbnoOZADZSnNYxBJmTjscalg', '2025-11-23 06:14:29', '2025-11-23 06:14:29'),
(3, 'Talia', 'Johnson', '1980-10-06', 'Male', 'A+', '4', '+1-240-207-3534', 'teacher3@example.com', '$2y$12$bFilxwM6cG2x2r5dc/5axuXNw1/lwgz2tezswEwLCG1lW.IOzOSGi', 'Assistant Professor', '76068 Douglas Lodge Suite 520\nEast Anabelhaven, MN 06157', 'Dr. Ward Fisher MD', '+1 (704) 633-5253', 'Ms. Desiree Morar', '+1.631.310.5791', 'Otilia Leffler', '1-364-434-0157', 'Brother', NULL, NULL, NULL, '2012-11-29', '2014-03-30', 'N/A', 'D005', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:29', '2025-11-23 06:14:29'),
(4, 'Arno', 'Zulauf', '1976-09-01', 'Other', 'A+', '6', '1-904-864-7493', 'teacher4@example.com', '$2y$12$OVN6xm4kOwlkE866.ODyjuXaxxuEEYjYXQ.seSq.R/TTbUgqZpyAe', 'Head of Department', '559 Brown Skyway\nNorth Vedaville, OK 37614', 'Jaquan Ortiz III', '(434) 987-6798', 'Ms. Palma Greenfelder IV', '+1-914-223-8835', 'Mr. Colten Murray', '650.676.5881', 'Aunt', NULL, NULL, NULL, '1993-08-20', '1993-01-11', 'N/A', 'D007', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:29', '2025-11-23 06:14:29'),
(5, 'Lacy', 'Waelchi', '1986-08-13', 'Other', 'B-', '8', '+1 (667) 396-0965', 'teacher5@example.com', '$2y$12$DlzVnK/GVT9g34zaSL3QiuJY8nfwt4pYuSkzB2P0svtNa5CiMNOBS', 'Head of Department', '339 Cathy Causeway\nElinoreshire, LA 94868', 'Gillian Hand PhD', '843-908-3442', 'Anais Stanton', '+1.614.686.5877', 'Maximillian Lynch', '+1 (248) 295-7303', 'Brother', NULL, NULL, NULL, '1987-07-17', '2020-11-10', 'N/A', 'D009', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:29', '2025-11-23 06:14:29'),
(6, 'Cloyd', 'Haag', '1982-12-11', 'Male', 'B+', '10', '+1-781-844-6237', 'teacher6@example.com', '$2y$12$evZHL0DtpJptr8ufIzxRA.gH4wT/3utK/Oe/MtOoEycRt4acErafy', 'Lecturer', '778 Roberts Curve Suite 736\nNorth Odessa, KS 39114', 'Fletcher Huel', '1-805-437-1122', 'Lilliana Bernhard', '763.363.8657', 'Dayana Tillman', '231-596-9529', 'Aunt', NULL, NULL, NULL, '2007-12-11', '1979-06-01', 'N/A', 'D0011', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:30', '2025-11-23 06:14:30'),
(7, 'Hulda', 'Crona', '1985-11-11', 'Other', 'O-', '12', '(954) 540-3668', 'teacher7@example.com', '$2y$12$W6DbCSzsaiVqj5y.Ha8ysO8DPb73ghsnwz/8goe6Z1HfVMfuNlvky', 'Senior Teacher', '57781 Eliseo Greens Suite 157\nNorth Katelinside, KY 86622', 'Mr. Rylan Kub MD', '(225) 360-6987', 'Julia Collins', '1-520-351-6075', 'Prof. Alexandre Johnston', '1-765-219-4429', 'Uncle', NULL, NULL, NULL, '1983-09-03', '2013-12-15', 'N/A', 'D0013', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:30', '2025-11-23 06:14:30'),
(8, 'Lane', 'Simonis', '1978-11-16', 'Other', 'A+', '14', '1-775-607-2144', 'teacher8@example.com', '$2y$12$786k4J7rg3uDukB7FyUTdOCYqPOoZ3bWIVJXCkDGIBj5L.lcuGR4S', 'Lecturer', '13963 Paxton Road Suite 991\nNew Mariamstad, WY 94601-7243', 'Laurel Waelchi I', '(364) 847-4146', 'Tania Brakus', '+1.228.914.8106', 'Emmett Kozey', '(774) 350-5593', 'Uncle', NULL, NULL, NULL, '1972-11-08', '2016-03-27', 'N/A', 'D0015', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:30', '2025-11-23 06:14:30'),
(9, 'Isaac', 'Bailey', '1983-08-13', 'Male', 'AB-', '16', '1-619-421-4293', 'teacher9@example.com', '$2y$12$U2mWacyKorH5O9VSfPJGK.y3e7QfF3p4Yz4kIAO8QSIOKtRBHOfcW', 'Lecturer', '131 Ritchie Ford Suite 945\nNew Carolanneside, OR 69746', 'Prince Homenick', '650-292-5625', 'Marian Kilback', '+1-847-932-3726', 'Nikko Hessel MD', '985-817-7439', 'Uncle', NULL, NULL, NULL, '1973-01-21', '1987-01-18', 'N/A', 'D0017', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:30', '2025-11-23 06:14:30'),
(10, 'Kitty', 'Flatley', '1974-12-03', 'Female', 'AB+', '18', '+1.657.555.3407', 'teacher10@example.com', '$2y$12$czQgFLO/N.7aGjtMPhvmCOixh0MF71kJwFX.suJhVaXcPLITPes9u', 'Head of Department', '9153 Ward Inlet Suite 181\nEast Heath, NJ 86606-6515', 'Seamus Turcotte', '+1-657-514-4146', 'Jennyfer Windler IV', '+1-470-905-5444', 'Orlo O\'Reilly', '669.627.8360', 'Uncle', NULL, NULL, NULL, '1986-03-22', '1995-04-21', 'N/A', 'D0019', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:30', '2025-11-23 06:14:30'),
(11, 'Hosea', 'Dibbert', '1970-01-11', 'Male', 'O+', '20', '+1.303.233.9284', 'teacher11@example.com', '$2y$12$FrAgyMMZiqKSRj.M7LjbJelpDAi7jnzcHuRy/22/u1s/KfGgLfdp.', 'Head of Department', '3248 Francesca Viaduct\nNew Larue, WY 34341-1727', 'Lucas Oberbrunner II', '+1-669-746-5449', 'Ms. Cheyenne Swaniawski', '865-623-6268', 'Miss Penelope Eichmann', '+1.307.793.4528', 'Brother', NULL, NULL, NULL, '1997-02-21', '1986-03-14', 'N/A', 'D0021', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:31', '2025-11-23 06:14:31'),
(12, 'Rosalyn', 'Veum', '1974-08-11', 'Female', 'O+', '22', '458.474.2959', 'teacher12@example.com', '$2y$12$oH2SYrwI52xaH8W24zLLc.gftO.PvBK0s6rWWXS/AYQsJUrJTGhAa', 'Lecturer', '38642 Herman Forest Apt. 279\nWest Marisolshire, AZ 81779-0716', 'Mr. Stefan Collins', '(904) 861-4529', 'Kendra Williamson PhD', '+14357338949', 'Monte Deckow', '+1.253.986.0077', 'Sister', NULL, NULL, NULL, '1980-05-25', '1973-05-27', 'N/A', 'D0023', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:31', '2025-11-23 06:14:31'),
(13, 'Freda', 'Wilderman', '1983-04-06', 'Female', 'B+', '24', '731-505-2757', 'teacher13@example.com', '$2y$12$jOzXlGTjmR0cEXpokqDtROVcW/6pMxzGLScboEA30dKh6m8gMXNLa', 'Senior Teacher', '381 Harvey Burg Suite 237\nDickimouth, WI 82124-2609', 'Favian Koelpin', '435.613.6585', 'Ernestine Johnston V', '(337) 537-3135', 'Emerson Hodkiewicz', '651.858.4277', 'Sister', NULL, NULL, NULL, '1971-12-27', '1996-07-16', 'N/A', 'D0025', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:31', '2025-11-23 06:14:31'),
(14, 'Maximilian', 'McKenzie', '1980-06-26', 'Male', 'O-', '26', '934.568.5756', 'teacher14@example.com', '$2y$12$R7zsN/IAKbNdjCfv.EAxKuMv.43akBfe4KntjbBbJ/w1KecB.gsNa', 'Assistant Professor', '68542 Mante Flat\nAlvenaton, NJ 50255-1486', 'Carroll Bogisich', '1-979-243-8854', 'Dasia Schaden', '+1-978-492-2863', 'Conner Dooley V', '(323) 918-5694', 'Aunt', NULL, NULL, NULL, '2012-06-08', '1978-06-28', 'N/A', 'D0027', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:31', '2025-11-23 06:14:31'),
(15, 'Torrance', 'Gusikowski', '1981-03-09', 'Other', 'B+', '28', '+17345541286', 'teacher15@example.com', '$2y$12$Ly2tI4lnNXS5NOu2NzUPkuGR6xMCAyYbRHxNWW7jQ54CCNVmt1wga', 'Head of Department', '4625 Heath Shore Suite 575\nBuckridgemouth, DC 24392-2362', 'Elmo Orn', '(469) 574-9274', 'Ms. Alice Mueller IV', '872.995.1701', 'Eloise Weber I', '316.369.0043', 'Uncle', NULL, NULL, NULL, '1970-06-07', '2008-11-02', 'N/A', 'D0029', 1, 'Admin', 'N/A', NULL, '2025-11-23 06:14:31', '2025-11-23 06:14:31');

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

--
-- Dumping data for table `teacher_attendances`
--

INSERT INTO `teacher_attendances` (`id`, `teacher_id`, `attendance_date`, `attendance_time`, `status`, `ip_address`, `browser`, `device`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-11-22', '12:14:50', 'present', '127.0.0.1', 'Firefox', 'Desktop', 'Unknown', '2025-11-23 06:14:51', '2025-11-23 06:15:01'),
(2, 1, '2025-11-21', '12:15:05', 'present', '127.0.0.1', 'Firefox', 'Desktop', 'Unknown', '2025-11-23 06:15:05', '2025-11-23 06:15:14'),
(3, 1, '2025-11-23', '12:15:20', 'absent', '127.0.0.1', 'Firefox', 'Desktop', 'Unknown', '2025-11-23 06:15:20', '2025-11-23 06:15:20'),
(4, 2, '2025-11-22', '12:16:57', 'present', '127.0.0.1', 'Firefox', 'Desktop', 'Unknown', '2025-11-23 06:16:57', '2025-11-23 06:17:05'),
(5, 2, '2025-11-21', '12:17:08', 'present', '127.0.0.1', 'Firefox', 'Desktop', 'Unknown', '2025-11-23 06:17:09', '2025-11-23 06:17:20'),
(6, 2, '2025-11-23', '12:17:24', 'absent', '127.0.0.1', 'Firefox', 'Desktop', 'Unknown', '2025-11-23 06:17:24', '2025-11-23 06:17:24');

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
-- Indexes for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_structures_class_id_fee_cat_id_unique` (`class_id`,`fee_cat_id`),
  ADD KEY `fee_structures_fee_cat_id_foreign` (`fee_cat_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `fee_structures`
--
ALTER TABLE `fee_structures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `student_daily_routines`
--
ALTER TABLE `student_daily_routines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Constraints for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD CONSTRAINT `fee_payments_fee_structure_id_foreign` FOREIGN KEY (`fee_structure_id`) REFERENCES `fee_structures` (`id`),
  ADD CONSTRAINT `fee_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

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
  ADD CONSTRAINT `subjects_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  ADD CONSTRAINT `teacher_attendances_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
