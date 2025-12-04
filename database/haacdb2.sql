-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 04, 2025 at 09:21 AM
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
(1, 'Tuition Fee', 'Regular fee for academic instruction and classes', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(2, 'Admission Fee', 'One-time fee for student enrollment', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(3, 'Exam Fee', 'Fee for conducting examinations', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(4, 'Library Fee', 'Charge for library access and maintenance', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(5, 'Laboratory Fee', 'Fee for science/computer lab usage', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(6, 'Sports Fee', 'Charge for sports activities and events', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(7, 'Transport Fee', 'Fee for school bus/transport facilities', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(8, 'Hostel Fee', 'Accommodation and meal charges in hostel', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(9, 'Development Fee', 'Fee for infrastructure and school development', '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(10, 'Activity Fee', 'Fee for extracurricular activities and events', '2025-12-04 07:30:52', '2025-12-04 07:30:52');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_09_11_094326_create_teachers_table', 1),
(7, '2025_09_12_060130_create_rooms_table', 1),
(8, '2025_09_12_060131_create_students_table', 1),
(9, '2025_09_13_043441_create_subjects_table', 1),
(10, '2025_09_13_043442_create_attendances_table', 1),
(11, '2025_09_13_085234_create_exams_table', 1),
(12, '2025_09_13_085241_create_marks_table', 1),
(13, '2025_09_16_081917_create_student_subjects_table', 1),
(14, '2025_09_22_185426_create_fee_categories_table', 1),
(15, '2025_09_22_185444_create_fee_structures_table', 1),
(16, '2025_09_22_185453_create_fee_payments_table', 1),
(17, '2025_09_28_183808_create_exam_names_table', 1),
(18, '2025_10_03_153733_create_class_schedules_table', 1),
(19, '2025_11_20_122825_create_notices_table', 1),
(20, '2025_11_22_173329_create_teacher_attendances_table', 1),
(21, '2025_11_23_131009_create_student_daily_routines_table', 1);

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
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'SAMIM', 'HosseN', '1995-11-02', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '1', '(706) 746-3533', 'student2@example.com', '$2y$12$7fQ6NExOnV57x2A7KUuvuO3VC3CyBC4wYi58d2KR4G0owVWybsNby', '5574 Waelchi Stream Suite 410\nMackenziechester, ND 07983-4563', 'Suite 767', 'Ross Conn IV', 'Farmer', '+19203219194', 'student2@example.com', '2', '3', 'Mrs. Aliza Ankunding DVM', 'Housewife', '1-380-347-5192', 'student4@example.com', '4', '5', 'Ahmad Bartell', '+1 (551) 790-3596', 'student6@example.com', '6', 'Brother', 1, 1, 4, '2025-11-18', 'N/A', 7, 9299047, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:43', '2025-12-04 07:30:43'),
(2, 'Kaylie', 'Swaniawski', '2022-08-07', 'Female', 'O-', 'Other', 'Bangladeshi', '8', '+1-484-833-4133', 'student9@example.com', '$2y$12$8MvkqIKVOfoWKMCeqHOjw.lVhFQjSYzz1djZs1ETRKSRVFKJmsI4u', '7842 Thad Corners Suite 337\nPort Tessie, MN 31891-0186', 'Suite 940', 'Mr. Dillan Paucek', 'Teacher', '724-200-8692', 'student9@example.com', '9', '10', 'Felicita Batz', 'Housewife', '580.658.5854', 'student11@example.com', '11', '12', 'Ms. Bonnie Huels', '980.734.1169', 'student13@example.com', '13', 'Aunt', 1, 1, 2, '2025-11-18', 'N/A', 14, 92990414, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:44', '2025-12-04 07:30:44'),
(3, 'Jevon', 'Buckridge', '1998-05-16', 'Female', 'AB+', 'Hindu', 'Bangladeshi', '15', '914-657-8014', 'student16@example.com', '$2y$12$zzvchkTPemWUSorOO8tyi.nu9DC2CXcvkMZZPIGHpGufDMdxJtCe2', '131 Corwin Fords Suite 825\nMcLaughlinton, SD 85598', 'Apt. 786', 'Jose Blick', 'Businessman', '(857) 891-3722', 'student16@example.com', '16', '17', 'Miss Santina Bogisich', 'Teacher', '412.466.1672', 'student18@example.com', '18', '19', 'Haylie Gutmann', '1-360-782-7088', 'student20@example.com', '20', 'Grandparent', 1, 1, 1, '2025-11-18', 'N/A', 21, 92990421, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:44', '2025-12-04 07:30:44'),
(4, 'Brionna', 'Schaefer', '2008-04-15', 'Female', 'B-', 'Buddhist', 'Bangladeshi', '22', '1-361-482-1122', 'student23@example.com', '$2y$12$Ef6POb4gqGRlgj6gan185eVutp/kG/ugcjIKlvtizYsbnw9pSo4gy', '843 Ruecker Road Apt. 866\nPort Rosendo, MD 53294', 'Suite 223', 'Antwon Dare', 'Farmer', '+1-412-521-9634', 'student23@example.com', '23', '24', 'Marcella Quigley', 'Businesswoman', '1-575-724-4579', 'student25@example.com', '25', '26', 'Dr. Cloyd Kilback II', '1-434-898-5474', 'student27@example.com', '27', 'Aunt', 1, 2, 2, '2025-11-18', 'N/A', 28, 92990428, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:44', '2025-12-04 07:30:44'),
(5, 'Heloise', 'Batz', '2017-01-04', 'Other', 'B-', 'Other', 'Bangladeshi', '29', '970-937-3454', 'student30@example.com', '$2y$12$aTjDtzXzwxFfHai5fvJaTu.g89y6iSZH6DTNo457uJHatuDz6F8PS', '74781 Stokes Bypass Apt. 543\nKochmouth, NV 03530', 'Apt. 460', 'Geovanni Jerde II', 'Businessman', '1-949-977-3910', 'student30@example.com', '30', '31', 'Miss Marcella O\'Reilly PhD', 'Doctor', '+1 (346) 999-7806', 'student32@example.com', '32', '33', 'Gail O\'Conner', '1-941-822-3559', 'student34@example.com', '34', 'Grandparent', 1, 3, 2, '2025-11-18', 'N/A', 35, 92990435, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:44', '2025-12-04 07:30:44'),
(6, 'Alana', 'Dach', '2004-07-31', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '36', '540-947-4880', 'student37@example.com', '$2y$12$fPxI7zQv1i6JwKnpYb347uqeDSUtXFyjG9px4KvjWT46qJQYgYG8m', '521 Cruickshank Grove Apt. 637\nBernierton, TX 24013-0704', 'Suite 233', 'Linwood Koss', 'Businessman', '341-752-5659', 'student37@example.com', '37', '38', 'Mrs. Haylie Daugherty', 'Housewife', '680.375.6189', 'student39@example.com', '39', '40', 'Coleman Wolff', '(949) 520-1819', 'student41@example.com', '41', 'Brother', 1, 4, 2, '2025-11-18', 'N/A', 42, 92990442, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:44', '2025-12-04 07:30:44'),
(7, 'Benjamin', 'Walter', '1976-09-17', 'Male', 'AB+', 'Islam', 'Bangladeshi', '43', '+14079898531', 'student44@example.com', '$2y$12$rS3i2ulUZbUeGKX009Jg1.i0/lzbynwQij0dmcMNtbGBd0Fu4PFT2', '8513 McLaughlin Motorway\nGaylordview, CA 74258', 'Apt. 739', 'Toby Kutch', 'Doctor', '+15342165023', 'student44@example.com', '44', '45', 'Reta Baumbach MD', 'Nurse', '(252) 564-4935', 'student46@example.com', '46', '47', 'Isadore Jerde', '785.842.0049', 'student48@example.com', '48', 'Brother', 1, 1, 3, '2025-11-18', 'N/A', 49, 92990449, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:45', '2025-12-04 07:30:45'),
(8, 'Kaitlyn', 'Sporer', '2018-02-23', 'Male', 'A-', 'Christian', 'Bangladeshi', '50', '+1-754-862-0388', 'student51@example.com', '$2y$12$5ca4U0cgtkKHSYVg0Og0/.ZZqNhztNS/ql1MIqeEqcMY5RWZCy4qS', '219 Vandervort Isle Apt. 013\nLake Felicitaville, CT 31168', 'Apt. 950', 'Cleo Morissette', 'Businessman', '+1-518-941-7427', 'student51@example.com', '51', '52', 'Mittie Ferry', 'Nurse', '(831) 997-4512', 'student53@example.com', '53', '54', 'Dr. Violet Gaylord', '(312) 614-3087', 'student55@example.com', '55', 'Aunt', 1, 2, 4, '2025-11-18', 'N/A', 56, 92990456, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:45', '2025-12-04 07:30:45'),
(9, 'Yesenia', 'Kautzer', '1974-12-16', 'Other', 'B+', 'Other', 'Bangladeshi', '57', '+1 (828) 861-4807', 'student58@example.com', '$2y$12$xuxpgUKyxbP2wiXv5qmzBuBXtc/pLzKklB.1DGJ2XNtiuPxPjr6/q', '958 Krajcik Landing\nNew Dorisport, SD 01631', 'Apt. 443', 'Prof. Brooks Douglas', 'Farmer', '+17819350370', 'student58@example.com', '58', '59', 'Julie Nicolas', 'Businesswoman', '+19896582758', 'student60@example.com', '60', '61', 'Samson Mante', '516-689-1088', 'student62@example.com', '62', 'Grandparent', 1, 5, 2, '2025-11-18', 'N/A', 63, 92990463, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:45', '2025-12-04 07:30:45'),
(10, 'Haven', 'Lubowitz', '2001-05-17', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '64', '1-281-358-6282', 'student65@example.com', '$2y$12$NZGQUELmO2oM8JMYbE120.98hYtT5wBDaCY4278vZEV3mXjffLLgy', '76880 Nickolas Wells Apt. 314\nKuhnchester, NJ 20225-8940', 'Suite 901', 'Victor Waelchi', 'Doctor', '240-439-6759', 'student65@example.com', '65', '66', 'Lily Ledner', 'Teacher', '+16082771873', 'student67@example.com', '67', '68', 'Brooks Macejkovic', '(843) 496-8853', 'student69@example.com', '69', 'Uncle', 1, 6, 2, '2025-11-18', 'N/A', 70, 92990470, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:45', '2025-12-04 07:30:45'),
(11, 'Carey', 'Lesch', '1981-04-12', 'Other', 'B-', 'Hindu', 'Bangladeshi', '71', '+18645559394', 'student72@example.com', '$2y$12$xE3ymXk22bmUofeuXu/BneTLezmA5tR7IVto7jIOl7brSOTgc5zfm', '53572 Russel Point Apt. 541\nWest Troy, NC 95165-3020', 'Apt. 359', 'Prof. Murray Altenwerth', 'Farmer', '847-765-4967', 'student72@example.com', '72', '73', 'Eileen Brakus', 'Nurse', '(802) 759-9423', 'student74@example.com', '74', '75', 'Abby Russel Sr.', '+1-934-504-8086', 'student76@example.com', '76', 'Brother', 1, 7, 2, '2025-11-18', 'N/A', 77, 92990477, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:45', '2025-12-04 07:30:45'),
(12, 'Geovany', 'Feest', '2008-09-21', 'Male', 'AB+', 'Buddhist', 'Bangladeshi', '78', '724-299-3861', 'student79@example.com', '$2y$12$Wlp70n2aL5W1k1sqSBLddOPVWgi4dbCKw74L37u0RraRXgZ/phXKC', '938 Haley Tunnel Suite 852\nNew Consuelobury, SD 76995-5414', 'Suite 986', 'Dr. Ahmad Shields', 'Businessman', '1-704-730-2265', 'student79@example.com', '79', '80', 'Jodie Hansen III', 'Teacher', '920.432.4238', 'student81@example.com', '81', '82', 'Mr. Dangelo Brakus IV', '+1-559-217-3854', 'student83@example.com', '83', 'Grandparent', 1, 2, 1, '2025-11-18', 'N/A', 84, 92990484, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:46', '2025-12-04 07:30:46'),
(13, 'Oren', 'Wiza', '1971-04-21', 'Female', 'B-', 'Christian', 'Bangladeshi', '85', '+1-650-966-7698', 'student86@example.com', '$2y$12$xeFNMu6kKeYrtsTfDdRK6.GXX2CYjRTgJYAp1WGUc5AC5aU4CEVLq', '335 Will Landing\nWest Marge, MA 45564', 'Apt. 960', 'Jovanny Schimmel', 'Engineer', '(201) 371-5684', 'student86@example.com', '86', '87', 'Raphaelle Reinger', 'Businesswoman', '+1-541-325-5556', 'student88@example.com', '88', '89', 'Edgardo Douglas', '954-841-2080', 'student90@example.com', '90', 'Grandparent', 1, 2, 3, '2025-11-18', 'N/A', 91, 92990491, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:46', '2025-12-04 07:30:46'),
(14, 'Moises', 'Schaden', '1974-03-01', 'Other', 'O-', 'Other', 'Bangladeshi', '92', '1-310-243-3097', 'student93@example.com', '$2y$12$wvOBPrtd8q0IkQXMlTP2dO8upvQV2f.FXRqhowWw7RUMkHiGvCh5O', '5115 Moore Expressway Suite 637\nPort Stefanieville, KY 23077', 'Apt. 049', 'Manley Kshlerin', 'Doctor', '907-392-0552', 'student93@example.com', '93', '94', 'Ms. Eudora Weber', 'Businesswoman', '+1-210-552-4280', 'student95@example.com', '95', '96', 'Lonzo Bergnaum MD', '602-432-2839', 'student97@example.com', '97', 'Uncle', 1, 3, 4, '2025-11-18', 'N/A', 98, 92990498, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:46', '2025-12-04 07:30:46'),
(15, 'Amir', 'Leannon', '2021-01-11', 'Other', 'A-', 'Other', 'Bangladeshi', '99', '+1.740.647.3110', 'student100@example.com', '$2y$12$RvkSxVnrvwDqb7YHMp8WVu7ZcI11.WpUF6luEJDBg6wRgBaX7P0y.', '72608 Hand Grove Suite 249\nNorth Joanny, DC 24725-8887', 'Apt. 435', 'Derick Wiza', 'Doctor', '754.941.1558', 'student100@example.com', '100', '101', 'Mrs. Lera Schneider', 'Doctor', '+1 (505) 326-7478', 'student102@example.com', '102', '103', 'Alejandrin Erdman', '1-689-479-2929', 'student104@example.com', '104', 'Grandparent', 1, 1, 5, '2025-11-18', 'N/A', 105, 929904105, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:46', '2025-12-04 07:30:46'),
(16, 'Kurtis', 'Carter', '1970-10-22', 'Female', 'A-', 'Islam', 'Bangladeshi', '106', '360-935-1988', 'student107@example.com', '$2y$12$PY7UAxRFsp/97dZabb3qeOmhVn1IL3y.yH.q.vf6fp6ZFxo9wFMcG', '66489 Turner Groves\nRowefort, IL 49438', 'Apt. 164', 'Brayan Bernhard PhD', 'Doctor', '+16787496680', 'student107@example.com', '107', '108', 'Candida Wiegand', 'Doctor', '+1-539-895-2777', 'student109@example.com', '109', '110', 'Ken Nienow', '231-222-7059', 'student111@example.com', '111', 'Aunt', 1, 8, 2, '2025-11-18', 'N/A', 112, 929904112, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:46', '2025-12-04 07:30:46'),
(17, 'Austyn', 'Koch', '1973-05-24', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '113', '(302) 714-9683', 'student114@example.com', '$2y$12$VsJNX32Hp3gFg5NP5bsuBOqY7ChvxxfT.u8P3ExDewcWs.X7ucWeC', '913 Godfrey Street\nEast Antonette, TX 86452-2409', 'Apt. 652', 'Dr. Blaise Wyman I', 'Engineer', '+1.406.679.3982', 'student114@example.com', '114', '115', 'Prof. Maggie Hintz', 'Housewife', '989-841-9291', 'student116@example.com', '116', '117', 'Prof. Penelope Kutch II', '779.923.0441', 'student118@example.com', '118', 'Uncle', 1, 3, 3, '2025-11-18', 'N/A', 119, 929904119, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:47', '2025-12-04 07:30:47'),
(18, 'Rosalyn', 'Fahey', '1990-03-11', 'Male', 'A-', 'Islam', 'Bangladeshi', '120', '+1-562-923-2463', 'student121@example.com', '$2y$12$AWijBpPfnjdiDIdg6EglP.tWA9aTN8fTK4pz9F7/YOO8zICM.OCUi', '717 Jacobson Turnpike\nPort Jordonberg, UT 17503', 'Apt. 600', 'Mr. Mustafa Gerlach', 'Businessman', '+18178590414', 'student121@example.com', '121', '122', 'Agustina Veum', 'Doctor', '+1.934.423.9123', 'student123@example.com', '123', '124', 'Prof. Ottis Wiegand DDS', '+1.820.582.4240', 'student125@example.com', '125', 'Uncle', 1, 3, 1, '2025-11-18', 'N/A', 126, 929904126, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:47', '2025-12-04 07:30:47'),
(19, 'Blair', 'Hagenes', '2022-04-02', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '127', '469-404-2023', 'student128@example.com', '$2y$12$pIyZ7Fu3fESa1urCtK6YYe4WxmDe5nYSsKTuIvjhycXeFgF2dYque', '8796 Oliver Island\nLake Sonny, OK 63746', 'Suite 964', 'Prof. Gay Cummerata', 'Teacher', '(269) 571-4762', 'student128@example.com', '128', '129', 'Melisa Stroman', 'Teacher', '601.853.9050', 'student130@example.com', '130', '131', 'Eden Nicolas', '+1-631-847-4851', 'student132@example.com', '132', 'Uncle', 1, 2, 5, '2025-11-18', 'N/A', 133, 929904133, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:47', '2025-12-04 07:30:47'),
(20, 'Tate', 'Schuster', '2003-03-15', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '134', '(980) 314-8833', 'student135@example.com', '$2y$12$AgVV8AGHKrPCACBraoJyR.YqY16WCXp5KbCvUU2z2NTrQJzM8JqF6', '6997 Jerde Street\nKuhnfurt, MA 60255', 'Suite 561', 'Dr. Otho McClure', 'Engineer', '757-571-5057', 'student135@example.com', '135', '136', 'Juliana Koss', 'Nurse', '986.470.5361', 'student137@example.com', '137', '138', 'Mozelle McGlynn', '+1-937-493-4505', 'student139@example.com', '139', 'Grandparent', 1, 4, 3, '2025-11-18', 'N/A', 140, 929904140, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:47', '2025-12-04 07:30:47'),
(21, 'Ayden', 'Murray', '1995-06-23', 'Other', 'A-', 'Islam', 'Bangladeshi', '141', '(480) 710-2060', 'student142@example.com', '$2y$12$xPPKMwSYS85XbXmnd9g7iedYicWyWudQ902I9shZ6niomVJ9JxSHu', '29302 Schaden Mall\nKingport, AR 26910', 'Suite 780', 'Mr. Hugh Hermiston V', 'Businessman', '256-851-2167', 'student142@example.com', '142', '143', 'Dr. Yasmine Feest', 'Nurse', '(956) 413-3115', 'student144@example.com', '144', '145', 'Rachael Kohler', '1-954-666-1291', 'student146@example.com', '146', 'Aunt', 1, 9, 2, '2025-11-18', 'N/A', 147, 929904147, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:47', '2025-12-04 07:30:47'),
(22, 'Marjorie', 'Bogan', '1995-10-06', 'Male', 'A+', 'Islam', 'Bangladeshi', '148', '941-449-3416', 'student149@example.com', '$2y$12$t9b3KdBqlyB5HQkAhmWi3.Y.yiWLYnuypJ/Brudzy2H2CUp0zy6yu', '31748 Schiller Route Suite 820\nEstevanside, WV 02914-1501', 'Suite 178', 'Theron Kuvalis', 'Engineer', '563.800.7565', 'student149@example.com', '149', '150', 'Ms. Chyna Mayer', 'Housewife', '+1 (518) 271-3112', 'student151@example.com', '151', '152', 'Elton Tillman', '507.904.4484', 'student153@example.com', '153', 'Sister', 1, 4, 1, '2025-11-18', 'N/A', 154, 929904154, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:47', '2025-12-04 07:30:47'),
(23, 'Felton', 'Moore', '2010-09-26', 'Female', 'AB+', 'Islam', 'Bangladeshi', '155', '+1 (815) 900-0008', 'student156@example.com', '$2y$12$7.nNzXJeW0pwTWO9pxdQ1umzzjHQDdhYSWL0OMK1bQwHpCc2sRUEa', '161 Schuster Loaf\nKonopelskiview, PA 90080-5067', 'Apt. 436', 'Cordell Rippin', 'Businessman', '(838) 872-1339', 'student156@example.com', '156', '157', 'Prof. Alexane Lakin V', 'Doctor', '484.813.5188', 'student158@example.com', '158', '159', 'Javonte Crooks', '+1-872-270-0978', 'student160@example.com', '160', 'Sister', 1, 3, 5, '2025-11-18', 'N/A', 161, 929904161, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:48', '2025-12-04 07:30:48'),
(24, 'Ayana', 'Okuneva', '1984-09-29', 'Other', 'O-', 'Islam', 'Bangladeshi', '162', '+1 (918) 203-1859', 'student163@example.com', '$2y$12$t66I8D1kzUcbVkPejR9sLuEM9bZF6Gq/TFpu3RTQOR5gdnRwj5f/G', '92076 Justina Course Suite 431\nCruzbury, NJ 09271-7132', 'Apt. 973', 'Mr. Ladarius Wilkinson', 'Businessman', '+1-559-825-1773', 'student163@example.com', '163', '164', 'Shanie Feeney', 'Doctor', '(503) 562-6077', 'student165@example.com', '165', '166', 'Gladyce Abernathy MD', '810.941.7089', 'student167@example.com', '167', 'Sister', 1, 10, 2, '2025-11-18', 'N/A', 168, 929904168, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:48', '2025-12-04 07:30:48'),
(25, 'Bernie', 'Renner', '2000-01-29', 'Male', 'O-', 'Islam', 'Bangladeshi', '169', '+15513004972', 'student170@example.com', '$2y$12$9KGiv8eVhwwdTRSEdh71OeUYbwaDJHMdmFd8Zr1uZe9HrmLfh9aTy', '38084 Daniella Via\nSouth Ali, DE 07293-2326', 'Suite 997', 'Dr. Jasen Pollich DVM', 'Businessman', '+1 (734) 703-9137', 'student170@example.com', '170', '171', 'Lavada Kshlerin', 'Doctor', '(714) 720-9871', 'student172@example.com', '172', '173', 'Maximilian Botsford II', '754.224.9703', 'student174@example.com', '174', 'Uncle', 1, 4, 4, '2025-11-18', 'N/A', 175, 929904175, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:48', '2025-12-04 07:30:48'),
(26, 'Raina', 'Haag', '2004-05-05', 'Male', 'O+', 'Christian', 'Bangladeshi', '176', '831-544-4180', 'student177@example.com', '$2y$12$uNoN8KhnIoS8b0o3KxD9Huzyc4DxQl2qV.GEM5dbadYSqX.gvYxum', '9827 Johnston Creek Suite 467\nErikaview, GA 73637', 'Suite 941', 'Kyleigh Dicki', 'Engineer', '+1-231-610-6657', 'student177@example.com', '177', '178', 'Hertha Weimann II', 'Housewife', '+1-781-376-8822', 'student179@example.com', '179', '180', 'Emelie Hickle', '+1 (870) 342-7315', 'student181@example.com', '181', 'Brother', 1, 5, 4, '2025-11-18', 'N/A', 182, 929904182, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:48', '2025-12-04 07:30:48'),
(27, 'Darion', 'Rolfson', '2023-10-19', 'Female', 'AB-', 'Christian', 'Bangladeshi', '183', '+1.501.623.1656', 'student184@example.com', '$2y$12$OjYUjh8s3C9DtbSnhc6vsurleVxjn9vWWxCETAm9M1G5BLonaO96K', '101 Lakin Ferry\nWest Aliciamouth, AK 29639-1667', 'Suite 999', 'Dr. Doris Lakin', 'Engineer', '220-691-0397', 'student184@example.com', '184', '185', 'Ava Wilderman', 'Nurse', '+1.714.597.1678', 'student186@example.com', '186', '187', 'Nat Thiel', '364-840-9041', 'student188@example.com', '188', 'Aunt', 1, 6, 4, '2025-11-18', 'N/A', 189, 929904189, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:48', '2025-12-04 07:30:48'),
(28, 'Rosalinda', 'Nolan', '2004-07-19', 'Other', 'O-', 'Hindu', 'Bangladeshi', '190', '(959) 234-1142', 'student191@example.com', '$2y$12$jGsjoaYQjPq7y8VW4IhfZuJA1JCdeanZybu31krsBkUGWAv2zXqEm', '73059 Streich Island Apt. 073\nCronaberg, AZ 83211-0385', 'Apt. 365', 'Jermain Gislason', 'Teacher', '+18052265508', 'student191@example.com', '191', '192', 'Prof. Arielle Hickle PhD', 'Businesswoman', '337-882-6967', 'student193@example.com', '193', '194', 'Breanne Hermiston', '458.573.7537', 'student195@example.com', '195', 'Brother', 1, 7, 4, '2025-11-18', 'N/A', 196, 929904196, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:49', '2025-12-04 07:30:49'),
(29, 'Clotilde', 'Berge', '1973-08-17', 'Male', 'A-', 'Buddhist', 'Bangladeshi', '197', '361-210-3118', 'student198@example.com', '$2y$12$fB0wnTL80akfTmMzF.mxGOFVRGrpZVlfrxH95PQ9CsSY3ZclrcXsq', '5576 Roberts Greens Suite 900\nJulienville, GA 30361-8800', 'Suite 301', 'Dr. Saul Jast IV', 'Businessman', '+19144724962', 'student198@example.com', '198', '199', 'Earline Purdy', 'Housewife', '828-742-1938', 'student200@example.com', '200', '201', 'Karelle Schmidt II', '+1.332.451.6392', 'student202@example.com', '202', 'Sister', 1, 4, 5, '2025-11-18', 'N/A', 203, 929904203, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:49', '2025-12-04 07:30:49'),
(30, 'Osbaldo', 'Dicki', '2016-01-17', 'Female', 'O+', 'Christian', 'Bangladeshi', '204', '(947) 742-7253', 'student205@example.com', '$2y$12$XlYP13Y6kr72BQHej0cWA.vUIWpgh5p2peqbzGmS./kxpLMSde7LW', '25629 Fletcher Island Apt. 879\nEast Orval, TX 07297', 'Apt. 050', 'Dr. Fredrick Sipes Sr.', 'Businessman', '(785) 860-3609', 'student205@example.com', '205', '206', 'Liliane Okuneva', 'Housewife', '+17859633923', 'student207@example.com', '207', '208', 'Dr. Clint O\'Reilly', '351.604.9689', 'student209@example.com', '209', 'Grandparent', 1, 5, 5, '2025-11-18', 'N/A', 210, 929904210, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:49', '2025-12-04 07:30:49'),
(31, 'Bret', 'Nitzsche', '2009-07-31', 'Female', 'AB-', 'Christian', 'Bangladeshi', '211', '930.833.1125', 'student212@example.com', '$2y$12$RATbyd3OJySP3EWordmXQ.9H0V445.BbKCEkUCWKsMNZCe4AIE01G', '427 Effertz Fort Suite 879\nBurdettetown, KS 29581-2733', 'Apt. 581', 'Giovanni Rau DVM', 'Businessman', '1-351-319-6464', 'student212@example.com', '212', '213', 'Elna Boyer', 'Nurse', '(530) 358-9613', 'student214@example.com', '214', '215', 'Dr. Lonny Moen', '+1 (941) 206-2485', 'student216@example.com', '216', 'Aunt', 1, 8, 4, '2025-11-18', 'N/A', 217, 929904217, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:49', '2025-12-04 07:30:49'),
(32, 'Shana', 'Hansen', '1991-01-12', 'Other', 'AB+', 'Christian', 'Bangladeshi', '218', '(650) 217-9722', 'student219@example.com', '$2y$12$4WGAkow7eniDOdsjVqY1OehDCSuRnIDRuIBHVuunAPJOOBRPhly/a', '75476 Kaycee Row Suite 067\nClevelandbury, KY 49121', 'Suite 555', 'Brad Waters', 'Doctor', '+1-763-677-7987', 'student219@example.com', '219', '220', 'Miss Bette Bogan III', 'Teacher', '(689) 759-6791', 'student221@example.com', '221', '222', 'Dr. Amira Morissette PhD', '316-813-6674', 'student223@example.com', '223', 'Sister', 1, 6, 5, '2025-11-18', 'N/A', 224, 929904224, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:49', '2025-12-04 07:30:49'),
(33, 'Dixie', 'McGlynn', '2023-05-20', 'Female', 'O+', 'Other', 'Bangladeshi', '225', '+1.765.255.7400', 'student226@example.com', '$2y$12$Tf11wIMC6qY6ho8jdcWFI.2UqCp6Tj0XyIKgfCBOMlrwYtlZ60e9O', '972 Lupe Loaf\nPort Katelyn, ME 59355-5196', 'Suite 331', 'Larry Wunsch', 'Engineer', '331-995-1897', 'student226@example.com', '226', '227', 'Miss Janiya Keeling III', 'Doctor', '(817) 999-4488', 'student228@example.com', '228', '229', 'Palma Simonis V', '1-704-377-6354', 'student230@example.com', '230', 'Aunt', 1, 5, 1, '2025-11-18', 'N/A', 231, 929904231, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:50', '2025-12-04 07:30:50'),
(34, 'Brielle', 'Kuhic', '2014-12-13', 'Other', 'A+', 'Hindu', 'Bangladeshi', '232', '1-980-831-6925', 'student233@example.com', '$2y$12$EcqoNHOaqC/ClBuSzpEXE.ldt3jmkc.ZH.PgvqCJXB70zatYK25.G', '55322 Jessyca Locks\nZariahaven, SD 96930-4507', 'Suite 590', 'Garfield Berge', 'Teacher', '820-640-0366', 'student233@example.com', '233', '234', 'Marjory Stracke PhD', 'Doctor', '+1-364-574-0173', 'student235@example.com', '235', '236', 'Jermain Kovacek', '+16105801761', 'student237@example.com', '237', 'Aunt', 1, 11, 2, '2025-11-18', 'N/A', 238, 929904238, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:50', '2025-12-04 07:30:50'),
(35, 'Ashlee', 'Crona', '1973-01-22', 'Other', 'AB-', 'Other', 'Bangladeshi', '239', '(469) 362-9058', 'student240@example.com', '$2y$12$RU0F.gYRgP83ICLkhLnQQe9dE26GBGAVr6g7.DtGAd6XggT/TMmFS', '69006 Joanie Plaza\nBillyberg, WA 99540-1294', 'Apt. 043', 'Dr. Marco Leffler PhD', 'Businessman', '1-747-637-6593', 'student240@example.com', '240', '241', 'Carole Stehr', 'Doctor', '479-262-3163', 'student242@example.com', '242', '243', 'Armani Nienow', '(484) 783-4172', 'student244@example.com', '244', 'Brother', 1, 9, 4, '2025-11-18', 'N/A', 245, 929904245, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:50', '2025-12-04 07:30:50'),
(36, 'Oma', 'Waters', '1985-04-12', 'Female', 'AB-', 'Christian', 'Bangladeshi', '246', '+1-917-943-6016', 'student247@example.com', '$2y$12$Ot1BirF3k04sS4SrPDjGR.SgGnyazDSpWBPj9ykZz4Iu09BYHSezS', '77956 Mohr Forges\nAmirafurt, IL 63385-6953', 'Suite 785', 'Jess Schaden', 'Doctor', '+1.510.701.2129', 'student247@example.com', '247', '248', 'Dr. Lucy Koss Sr.', 'Doctor', '831.364.2268', 'student249@example.com', '249', '250', 'Ms. Mariane Bode', '+18308040777', 'student251@example.com', '251', 'Sister', 1, 12, 2, '2025-11-18', 'N/A', 252, 929904252, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:50', '2025-12-04 07:30:50'),
(37, 'Claude', 'Bauch', '2000-04-21', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '253', '+1 (708) 713-8120', 'student254@example.com', '$2y$12$SINfWS8/vPvOmXWq2S8oJ.k9fLEGlKTnBNQIu2lL/zi7HN.GfQijC', '31623 Muller Junctions Suite 212\nBauchshire, WY 64884', 'Suite 836', 'Mr. Braden Kerluke IV', 'Doctor', '520.272.8816', 'student254@example.com', '254', '255', 'Amina Miller', 'Housewife', '1-479-928-8307', 'student256@example.com', '256', '257', 'Reginald Stoltenberg', '(820) 572-6250', 'student258@example.com', '258', 'Brother', 1, 6, 1, '2025-11-18', 'N/A', 259, 929904259, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:50', '2025-12-04 07:30:50'),
(38, 'Gerry', 'Barrows', '2025-05-03', 'Female', 'AB+', 'Christian', 'Bangladeshi', '260', '+1-308-542-2996', 'student261@example.com', '$2y$12$A/17mOsMkns7LwPDAmsCxeDVlHQosaARCafdT1jrYY9AwEWbfh/86', '71420 Lubowitz Forge\nRippintown, AZ 22221-1476', 'Suite 907', 'Dr. Ed Bechtelar III', 'Engineer', '715-624-8275', 'student261@example.com', '261', '262', 'Miss Katlyn Harber V', 'Teacher', '+1.951.685.4220', 'student263@example.com', '263', '264', 'Mr. Arely McDermott', '+1.972.320.3812', 'student265@example.com', '265', 'Sister', 1, 5, 3, '2025-11-18', 'N/A', 266, 929904266, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(39, 'Jordyn', 'O\'Keefe', '1985-06-26', 'Other', 'O-', 'Buddhist', 'Bangladeshi', '267', '+1-936-280-2459', 'student268@example.com', '$2y$12$Gmk7emBrValJ5FxZGK0BRuODw75X8aujMt8gfMH3GrkEUb6S22KgK', '622 Beryl Mountains Apt. 142\nCarlieside, KY 81201', 'Suite 217', 'Samir Fahey', 'Engineer', '+1 (269) 750-8957', 'student268@example.com', '268', '269', 'Alana Kilback', 'Teacher', '(678) 441-8517', 'student270@example.com', '270', '271', 'Joe Kub', '772-344-5834', 'student272@example.com', '272', 'Grandparent', 1, 10, 4, '2025-11-18', 'N/A', 273, 929904273, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(40, 'Jaycee', 'Leffler', '2010-10-03', 'Female', 'AB-', 'Islam', 'Bangladeshi', '274', '+1-858-384-6672', 'student275@example.com', '$2y$12$q85m4HrUu83CuT5fT7pImuHtj327yBJcZBsRwwsAvVEHpPj2ExwMC', '1553 Granville Club\nWest Jenastad, LA 33917-2591', 'Apt. 369', 'Steve Parisian', 'Engineer', '+1-727-319-0984', 'student275@example.com', '275', '276', 'Jaqueline Trantow', 'Doctor', '947-394-8433', 'student277@example.com', '277', '278', 'Dylan Lakin', '847.771.7906', 'student279@example.com', '279', 'Aunt', 1, 13, 2, '2025-11-18', 'N/A', 280, 929904280, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(41, 'Vern', 'Crooks', '2021-08-09', 'Male', 'O-', 'Hindu', 'Bangladeshi', '281', '(916) 374-2058', 'student282@example.com', '$2y$12$QLNolAxBabNkuLGa8JqOR.nBgqmH3tnjrrZI5DT0/78AHbJWCrF2u', '3787 Dasia Plains\nWest Raymundo, WY 18633', 'Suite 775', 'Oliver Orn', 'Farmer', '+1-936-540-0210', 'student282@example.com', '282', '283', 'Clarabelle Hudson', 'Teacher', '(949) 746-7793', 'student284@example.com', '284', '285', 'Clementine Jacobson', '520-396-0188', 'student286@example.com', '286', 'Grandparent', 1, 6, 3, '2025-11-18', 'N/A', 287, 929904287, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(42, 'Iliana', 'Shields', '2009-12-22', 'Male', 'O+', 'Islam', 'Bangladeshi', '288', '+1-913-661-8835', 'student289@example.com', '$2y$12$n.evF2CEnaDWGQlTrMsEvOxJ3k/Bz8NhFhkZLmBsT76s0hOjj1Upm', '85375 Haylie Causeway\nBobbybury, OR 98191-2825', 'Suite 696', 'Louie Heller IV', 'Doctor', '(262) 709-3714', 'student289@example.com', '289', '290', 'Prof. Emily Cronin', 'Housewife', '857.760.5801', 'student291@example.com', '291', '292', 'Dr. Rene Rippin PhD', '260-563-6444', 'student293@example.com', '293', 'Brother', 1, 7, 3, '2025-11-18', 'N/A', 294, 929904294, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(43, 'Norbert', 'Gusikowski', '2019-02-13', 'Other', 'B+', 'Hindu', 'Bangladeshi', '295', '715.276.4645', 'student296@example.com', '$2y$12$ddRVzL297545ulBkK5t.j.osPK/hru06UaRfOfD9NMeYNCCRJBXQm', '51491 Alba Circle\nHillstad, FL 65384', 'Apt. 081', 'Adam Kerluke', 'Businessman', '+1 (843) 942-9114', 'student296@example.com', '296', '297', 'Amiya Denesik', 'Businesswoman', '(304) 478-5260', 'student298@example.com', '298', '299', 'Vilma Lueilwitz', '931.356.6677', 'student300@example.com', '300', 'Uncle', 1, 7, 5, '2025-11-18', 'N/A', 301, 929904301, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-04 07:30:51', '2025-12-04 07:30:51');

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
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `class_id`, `created_at`, `updated_at`) VALUES
(1, 'Bangla', 1, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(2, 'English', 1, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(3, 'ICT', 1, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(4, 'Physical Education', 1, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(5, 'Physics', 1, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(6, 'Chemistry', 1, '2025-12-04 07:30:51', '2025-12-04 07:30:51'),
(7, 'Biology', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(8, 'Higher Mathematics', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(9, 'Accounting', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(10, 'Business Organization & Management', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(11, 'Finance, Banking & Insurance', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(12, 'Production Management & Marketing', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(13, 'Logic', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(14, 'History', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(15, 'Civics', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(16, 'Economics', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(17, 'Islamic Studies', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(18, 'Sociology', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(19, 'Social Work', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(20, 'Geography', 1, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(21, 'Bangla', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(22, 'English', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(23, 'ICT', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(24, 'Physical Education', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(25, 'Physics', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(26, 'Chemistry', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(27, 'Biology', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(28, 'Higher Mathematics', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(29, 'Accounting', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(30, 'Business Organization & Management', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(31, 'Finance, Banking & Insurance', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(32, 'Production Management & Marketing', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(33, 'Logic', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(34, 'History', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(35, 'Civics', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(36, 'Economics', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(37, 'Islamic Studies', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(38, 'Sociology', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(39, 'Social Work', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(40, 'Geography', 2, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(41, 'Bangla', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(42, 'English', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(43, 'ICT', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(44, 'Physical Education', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(45, 'Physics', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(46, 'Chemistry', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(47, 'Biology', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(48, 'Higher Mathematics', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(49, 'Accounting', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(50, 'Business Organization & Management', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(51, 'Finance, Banking & Insurance', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(52, 'Production Management & Marketing', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(53, 'Logic', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(54, 'History', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(55, 'Civics', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(56, 'Economics', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(57, 'Islamic Studies', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(58, 'Sociology', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(59, 'Social Work', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(60, 'Geography', 3, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(61, 'Bangla', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(62, 'English', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(63, 'ICT', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(64, 'Physical Education', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(65, 'Physics', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(66, 'Chemistry', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(67, 'Biology', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(68, 'Higher Mathematics', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(69, 'Accounting', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(70, 'Business Organization & Management', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(71, 'Finance, Banking & Insurance', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(72, 'Production Management & Marketing', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(73, 'Logic', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(74, 'History', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(75, 'Civics', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(76, 'Economics', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(77, 'Islamic Studies', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(78, 'Sociology', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(79, 'Social Work', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(80, 'Geography', 4, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(81, 'Bangla', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(82, 'English', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(83, 'ICT', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(84, 'Physical Education', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(85, 'Physics', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(86, 'Chemistry', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(87, 'Biology', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(88, 'Higher Mathematics', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(89, 'Accounting', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(90, 'Business Organization & Management', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(91, 'Finance, Banking & Insurance', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(92, 'Production Management & Marketing', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(93, 'Logic', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(94, 'History', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(95, 'Civics', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(96, 'Economics', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(97, 'Islamic Studies', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(98, 'Sociology', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(99, 'Social Work', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52'),
(100, 'Geography', 5, '2025-12-04 07:30:52', '2025-12-04 07:30:52');

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
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `national_id`, `contact_number`, `email`, `password`, `designation`, `address`, `father_name`, `father_contact`, `mother_name`, `mother_contact`, `guardian_name`, `guardian_contact`, `guardian_relationship`, `photo`, `father_photo`, `mother_photo`, `joning_date`, `mop_date`, `traning`, `index_no`, `status`, `role`, `remark`, `otp`, `otp_expires_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohammad', 'Rice', '1973-10-11', 'Female', 'B+', '0', '423.893.5284', 'cse.shamim.cub@gmail.com', '$2y$12$Is7Nw8i0iIR7CLVB1JB.0ODzvQmSsknyNAyxpswifXOhhAy8IUTHm', 'Assistant Professor', '4608 Marquis Keys Apt. 369\nPort Oswald, AL 68207', 'Colt Rutherford', '+15209813166', 'Prof. Deborah Stamm II', '+1-364-368-4192', 'Emiliano Borer', '+1 (667) 907-1605', 'Uncle', NULL, NULL, NULL, '2003-06-29', '1979-10-06', 'N/A', 'D001', 1, 'Admin', 'N/A', NULL, NULL, 'L7fo6JNgBgv2xcqTFi8LUpyqGDFG7arBcRpHkEfSrRLmiFgjL6ARQgesTf1G', '2025-12-04 07:30:40', '2025-12-04 08:20:56'),
(2, 'Eldred', 'Ryan', '1977-11-11', 'Female', 'AB-', '2', '+1-678-443-4666', 'teacher2@example.com', '$2y$12$.rRaWoA9kVMX9Y467b5Ua.XjGO979NyfRKRUkmHDqR5P82E0V7lF.', 'Assistant Professor', '7980 Mante Neck\nRobertaview, AL 69237', 'Hunter Wehner', '1-856-435-6473', 'Sophie Ritchie', '(731) 906-7649', 'Hortense Ward', '+16897138692', 'Brother', NULL, NULL, NULL, '1997-02-14', '1972-03-04', 'N/A', 'D003', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:41', '2025-12-04 07:30:41'),
(3, 'Annetta', 'Rogahn', '1977-12-03', 'Other', 'A-', '4', '215-625-3239', 'teacher3@example.com', '$2y$12$IXhl3uoII8mjViv0QMhzpOeicGlGHRY88TGj5uFUH.ozuFoRAsBRW', 'Assistant Professor', '84487 Lynch Camp Apt. 291\nGarrychester, NC 54227', 'Adrain Powlowski', '+1-252-942-1526', 'Miss Shaina Walsh I', '747-357-2195', 'Marcelino Hettinger', '847.946.2695', 'Grandparent', NULL, NULL, NULL, '1982-09-14', '1989-12-25', 'N/A', 'D005', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:41', '2025-12-04 07:30:41'),
(4, 'Hailee', 'Becker', '1988-06-15', 'Other', 'O-', '6', '+1-743-539-9526', 'teacher4@example.com', '$2y$12$KCrd80dBs0LCyih7.DvZ3uzP5qt4OSCdrVLfkyF9WiilaN7A96Lu2', 'Lecturer', '75524 Bruen Turnpike\nGrimesmouth, CO 40694', 'Mr. Deshawn Toy V', '+1-331-665-4668', 'Retha Macejkovic', '+1 (281) 212-7892', 'Dr. Janis Herman', '+12489292831', 'Uncle', NULL, NULL, NULL, '1981-11-17', '1972-12-28', 'N/A', 'D007', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:41', '2025-12-04 07:30:41'),
(5, 'Lafayette', 'Quitzon', '1976-03-07', 'Male', 'AB+', '8', '+1-717-794-4822', 'teacher5@example.com', '$2y$12$5jmIbfYnLCXZNemtT9FQuu4aBIPfOTIjOMBA3EnUV5QRtRP78Qr.O', 'Lecturer', '36644 Bogan Brooks Suite 166\nHartmannview, NC 45904-3620', 'Mekhi Nitzsche', '847-814-3555', 'Mrs. Frederique Kohler', '+1.516.509.0173', 'Fannie Cole Jr.', '563.547.7690', 'Uncle', NULL, NULL, NULL, '2010-10-17', '1978-03-16', 'N/A', 'D009', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:41', '2025-12-04 07:30:41'),
(6, 'Mariah', 'Kshlerin', '1981-02-26', 'Other', 'A+', '10', '732-626-5774', 'teacher6@example.com', '$2y$12$8GAhxb5fCj2Ma7TsjPk2oe427hHwRvyf1BojcA.AbEKcod8T1rja2', 'Senior Teacher', '72080 Malvina Station Apt. 639\nSanfordview, TN 46994-3297', 'Roman Reichel', '(469) 625-0335', 'Bianka Mohr', '1-217-641-6142', 'Ara Flatley', '916.888.0593', 'Brother', NULL, NULL, NULL, '1977-03-24', '2022-05-15', 'N/A', 'D0011', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:41', '2025-12-04 07:30:41'),
(7, 'Korbin', 'Wyman', '1979-09-10', 'Other', 'A+', '12', '+19415669098', 'teacher7@example.com', '$2y$12$8KyolNT2Mgnx..p5F8w9sOFk9hN1.Tv6kVRcr32Qb1VDk19NYqxLm', 'Senior Teacher', '3696 Ernestina Fall\nYoshikostad, SC 20257', 'Enid Batz', '361-724-8854', 'Vesta Schimmel', '234-599-7359', 'Prof. Waino Rau', '1-475-310-5378', 'Brother', NULL, NULL, NULL, '1971-10-25', '1975-04-05', 'N/A', 'D0013', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:42', '2025-12-04 07:30:42'),
(8, 'Germaine', 'Gibson', '1983-07-05', 'Female', 'O+', '14', '1-386-916-4527', 'teacher8@example.com', '$2y$12$Ryheyz58q3884wQ/DkLcWO8wIimY/JkPvdsZIsRExrR6gFgOPPrsq', 'Head of Department', '95033 Walsh Ford Apt. 702\nFriesenland, AR 10441-8353', 'Prof. Mckenzie Luettgen DVM', '(540) 325-7846', 'Loma Hane MD', '(731) 302-7204', 'Miss Eunice Murray DDS', '(925) 802-8903', 'Sister', NULL, NULL, NULL, '2006-11-11', '2000-04-17', 'N/A', 'D0015', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:42', '2025-12-04 07:30:42'),
(9, 'Edythe', 'Heaney', '1970-03-09', 'Other', 'O-', '16', '(713) 706-0443', 'teacher9@example.com', '$2y$12$ifRNHEmwYx87ZI81wZVYk.297oJMMuSmCDcf/VAsm8Pont9t9VcxS', 'Lecturer', '92279 Jones Fork\nAltenwerthberg, ME 17990', 'Mr. Kennedi Goodwin Sr.', '+1-402-818-5003', 'Taryn Rodriguez', '267-694-4916', 'Mrs. Mossie Hartmann Sr.', '479.483.6288', 'Brother', NULL, NULL, NULL, '2007-07-07', '1982-03-29', 'N/A', 'D0017', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:42', '2025-12-04 07:30:42'),
(10, 'Giovanna', 'Klein', '1987-10-13', 'Other', 'O-', '18', '+1-870-561-6311', 'teacher10@example.com', '$2y$12$jHiCbw6bfDmbZg65U3oAxewGx3wyQtvcBIAGg6cM/YaioJ6tDYWzS', 'Assistant Professor', '84986 Lang Row\nNehaland, CA 22136', 'Mr. Arch Hansen DVM', '+1-218-878-4542', 'Anya Eichmann', '1-351-397-1626', 'Patsy Blanda', '1-651-720-3150', 'Aunt', NULL, NULL, NULL, '2020-01-08', '1987-09-24', 'N/A', 'D0019', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:42', '2025-12-04 07:30:42'),
(11, 'Benjamin', 'Marks', '1977-08-16', 'Other', 'O-', '20', '+1 (614) 716-8794', 'teacher11@example.com', '$2y$12$AArleQVaGCKyTIjDXpvFa.yX5Qa9m1Gz5tMVTOTqdnjOxn5PLPb.y', 'Lecturer', '2503 Urban Walk\nAuerside, RI 47728-9115', 'Junior Doyle', '419.337.7650', 'Prof. Alexandrea Williamson', '+1 (562) 843-9917', 'Coralie McGlynn', '+16504459775', 'Sister', NULL, NULL, NULL, '1991-01-17', '1979-11-15', 'N/A', 'D0021', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:42', '2025-12-04 07:30:42'),
(12, 'Darius', 'Beer', '1986-11-15', 'Male', 'O-', '22', '+1.205.829.1258', 'teacher12@example.com', '$2y$12$A3mps46QdBakGQe33bocMuIbvAGpd3oq9WfKjGi1uMxg85m7za3Cm', 'Assistant Professor', '88270 Eichmann Grove\nLesleychester, WA 56829-9365', 'Mike Roberts V', '+1.540.494.2132', 'Marcia Kris', '+1 (309) 889-6673', 'Mr. Jayson Fahey', '1-407-414-6072', 'Sister', NULL, NULL, NULL, '2006-04-16', '1987-03-18', 'N/A', 'D0023', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:43', '2025-12-04 07:30:43'),
(13, 'Vanessa', 'Morissette', '1989-12-06', 'Male', 'O-', '24', '(636) 847-8872', 'teacher13@example.com', '$2y$12$EViNwNIVzdaeqKFgU25Pu.egGaJq2keVFjJN6MLjSrEXnqsE1BGRG', 'Head of Department', '4736 Ross Port\nLindchester, MA 79234-7539', 'Miguel Stanton', '1-606-781-1608', 'Rossie Gerlach DVM', '270.682.5245', 'Andre Pouros', '332.521.4214', 'Sister', NULL, NULL, NULL, '1993-10-21', '2021-04-15', 'N/A', 'D0025', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:43', '2025-12-04 07:30:43'),
(14, 'Keanu', 'Marquardt', '1975-10-24', 'Female', 'AB-', '26', '+16283782709', 'teacher14@example.com', '$2y$12$BevqZLal8OBlPPCVmIoaS.0sUYdmbNhm5CxckMsBdAK42xP/1bU5O', 'Assistant Professor', '9771 Dicki Plaza\nNew Savion, MO 38568', 'Prof. Manuela Hermiston V', '209-295-4758', 'Daniela Kautzer', '217.284.9017', 'Marie Daniel', '847.922.9944', 'Aunt', NULL, NULL, NULL, '2020-07-05', '2006-10-27', 'N/A', 'D0027', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:43', '2025-12-04 07:30:43'),
(15, 'Amaya', 'O\'Kon', '1972-06-28', 'Male', 'B+', '28', '256.662.8017', 'teacher15@example.com', '$2y$12$P6BpuHh0EBWiKaShAuDb2u1J79BR4.AqpPgCu4zuUC8.7ZDW8eCp2', 'Senior Teacher', '4769 Mollie Divide\nRosinastad, VA 99422', 'Austen Kertzmann', '1-323-537-6455', 'Laurianne Breitenberg', '310-415-4067', 'Shania Altenwerth', '1-308-489-8371', 'Sister', NULL, NULL, NULL, '2009-02-18', '1979-12-03', 'N/A', 'D0029', 1, 'Admin', 'N/A', NULL, NULL, NULL, '2025-12-04 07:30:43', '2025-12-04 07:30:43');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
