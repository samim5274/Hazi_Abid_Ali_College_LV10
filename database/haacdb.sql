-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 18, 2025 at 01:46 PM
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
(1, 2, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:09:51', '2025-11-18 10:09:51'),
(2, 24, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:10:03', '2025-11-18 10:10:03'),
(3, 3, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:10:04', '2025-11-18 10:10:04'),
(4, 5, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:10:10', '2025-11-18 10:10:10'),
(5, 7, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:10:12', '2025-11-18 10:10:12'),
(6, 8, 1, 1, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:10:15', '2025-11-18 10:10:15'),
(7, 10, 1, 1, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:10:16', '2025-11-18 10:10:16'),
(8, 15, 1, 1, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:10:17', '2025-11-18 10:10:17'),
(9, 25, 1, 1, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:10:19', '2025-11-18 10:10:19'),
(10, 42, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:10:23', '2025-11-18 10:10:23'),
(11, 37, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:10:44', '2025-11-18 10:10:44'),
(12, 38, 1, 1, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:11:06', '2025-11-18 10:11:06'),
(13, 2, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:22', '2025-11-18 10:12:22'),
(14, 3, 1, 2, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:12:28', '2025-11-18 10:12:28'),
(15, 5, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:30', '2025-11-18 10:12:30'),
(16, 7, 1, 2, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:12:32', '2025-11-18 10:12:32'),
(17, 8, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:33', '2025-11-18 10:12:33'),
(18, 10, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:34', '2025-11-18 10:12:34'),
(19, 15, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:35', '2025-11-18 10:12:35'),
(20, 24, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:36', '2025-11-18 10:12:36'),
(21, 25, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:37', '2025-11-18 10:12:37'),
(22, 37, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:39', '2025-11-18 10:12:39'),
(23, 38, 1, 2, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:12:41', '2025-11-18 10:12:41'),
(24, 42, 1, 2, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:12:43', '2025-11-18 10:12:43'),
(25, 2, 1, 3, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:31:25', '2025-11-18 10:31:25'),
(26, 3, 1, 3, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:31:26', '2025-11-18 10:31:26'),
(27, 5, 1, 3, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:31:28', '2025-11-18 10:31:28'),
(28, 7, 1, 3, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:31:29', '2025-11-18 10:31:29'),
(29, 8, 1, 3, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:31:31', '2025-11-18 10:31:31'),
(30, 10, 1, 3, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:31:32', '2025-11-18 10:31:32'),
(31, 15, 1, 3, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:31:33', '2025-11-18 10:31:33'),
(32, 24, 1, 3, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:31:34', '2025-11-18 10:31:34'),
(33, 25, 1, 3, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:31:35', '2025-11-18 10:31:35'),
(34, 37, 1, 3, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:31:36', '2025-11-18 10:31:36'),
(35, 38, 1, 3, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:31:42', '2025-11-18 10:31:42'),
(36, 42, 1, 3, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:31:44', '2025-11-18 10:31:44'),
(37, 2, 1, 4, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:43:16', '2025-11-18 10:43:16'),
(38, 3, 1, 4, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:43:17', '2025-11-18 10:43:17'),
(39, 5, 1, 4, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:43:18', '2025-11-18 10:43:18'),
(40, 7, 1, 4, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:43:19', '2025-11-18 10:43:19'),
(41, 8, 1, 4, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:43:20', '2025-11-18 10:43:20'),
(42, 10, 1, 4, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:43:21', '2025-11-18 10:43:21'),
(43, 15, 1, 4, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:43:24', '2025-11-18 10:43:24'),
(44, 24, 1, 4, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:43:27', '2025-11-18 10:43:27'),
(45, 37, 1, 4, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:43:29', '2025-11-18 10:43:29'),
(46, 38, 1, 4, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:43:30', '2025-11-18 10:43:30'),
(47, 42, 1, 4, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:43:32', '2025-11-18 10:43:32'),
(48, 25, 1, 4, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:43:33', '2025-11-18 10:43:33'),
(49, 2, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:45:47', '2025-11-18 10:45:47'),
(50, 3, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:45:48', '2025-11-18 10:45:48'),
(51, 5, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:45:49', '2025-11-18 10:45:49'),
(52, 7, 1, 5, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:45:50', '2025-11-18 10:45:50'),
(53, 8, 1, 5, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:46:02', '2025-11-18 10:46:02'),
(54, 10, 1, 5, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:46:03', '2025-11-18 10:46:03'),
(55, 15, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:46:04', '2025-11-18 10:46:04'),
(56, 24, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:46:05', '2025-11-18 10:46:05'),
(57, 25, 1, 5, '2025-11-18', 'Absent', 'N/A', '2025-11-18 10:46:06', '2025-11-18 10:46:06'),
(58, 37, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:46:07', '2025-11-18 10:46:07'),
(59, 38, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:46:09', '2025-11-18 10:46:09'),
(60, 42, 1, 5, '2025-11-18', 'Present', 'N/A', '2025-11-18 10:46:12', '2025-11-18 10:46:12'),
(61, 11, 2, 21, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:16:02', '2025-11-18 11:16:02'),
(62, 17, 2, 21, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:16:03', '2025-11-18 11:16:03'),
(63, 27, 2, 21, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:16:04', '2025-11-18 11:16:04'),
(64, 30, 2, 21, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:16:05', '2025-11-18 11:16:05'),
(65, 32, 2, 21, '2025-11-18', 'Absent', 'N/A', '2025-11-18 11:16:06', '2025-11-18 11:16:06'),
(66, 11, 2, 22, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:16:11', '2025-11-18 11:16:11'),
(67, 17, 2, 22, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:16:12', '2025-11-18 11:16:12'),
(68, 27, 2, 22, '2025-11-18', 'Absent', 'N/A', '2025-11-18 11:16:13', '2025-11-18 11:16:13'),
(69, 30, 2, 22, '2025-11-18', 'Absent', 'N/A', '2025-11-18 11:16:13', '2025-11-18 11:16:13'),
(70, 32, 2, 22, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:16:14', '2025-11-18 11:16:14'),
(71, 11, 2, 23, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:18:44', '2025-11-18 11:18:44'),
(72, 27, 2, 23, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:18:45', '2025-11-18 11:18:45'),
(73, 30, 2, 23, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:18:46', '2025-11-18 11:18:46'),
(74, 32, 2, 23, '2025-11-18', 'Absent', 'N/A', '2025-11-18 11:18:47', '2025-11-18 11:18:47'),
(75, 17, 2, 23, '2025-11-18', 'Present', 'N/A', '2025-11-18 11:19:22', '2025-11-18 11:19:22');

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
(1, 'Tuition Fee', 'Regular fee for academic instruction and classes', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(2, 'Admission Fee', 'One-time fee for student enrollment', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(3, 'Exam Fee', 'Fee for conducting examinations', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(4, 'Library Fee', 'Charge for library access and maintenance', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(5, 'Laboratory Fee', 'Fee for science/computer lab usage', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(6, 'Sports Fee', 'Charge for sports activities and events', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(7, 'Transport Fee', 'Fee for school bus/transport facilities', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(8, 'Hostel Fee', 'Accommodation and meal charges in hostel', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(9, 'Development Fee', 'Fee for infrastructure and school development', '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(10, 'Activity Fee', 'Fee for extracurricular activities and events', '2025-11-18 10:09:33', '2025-11-18 10:09:33');

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
(55, '2014_10_12_000000_create_users_table', 1),
(56, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(57, '2014_10_12_100000_create_password_resets_table', 1),
(58, '2019_08_19_000000_create_failed_jobs_table', 1),
(59, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(60, '2025_09_11_094326_create_teachers_table', 1),
(61, '2025_09_12_060130_create_rooms_table', 1),
(62, '2025_09_12_060131_create_students_table', 1),
(63, '2025_09_13_043441_create_subjects_table', 1),
(64, '2025_09_13_043442_create_attendances_table', 1),
(65, '2025_09_13_085234_create_exams_table', 1),
(66, '2025_09_13_085241_create_marks_table', 1),
(67, '2025_09_16_081917_create_student_subjects_table', 1),
(68, '2025_09_22_185426_create_fee_categories_table', 1),
(69, '2025_09_22_185444_create_fee_structures_table', 1),
(70, '2025_09_22_185453_create_fee_payments_table', 1),
(71, '2025_09_28_183808_create_exam_names_table', 1),
(72, '2025_10_03_153733_create_class_schedules_table', 1);

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
(1, 'Adriel', 'Howell', '1982-07-24', 'Male', 'AB-', 'Christian', 'Bangladeshi', '1', '219.894.6584', 'student2@example.com', '$2y$12$/rKNBDZFtYE.nedO5f5Eye5EevKoDqOQ/ZfYaV1vRtkvxkOm2dae2', '699 Connelly Heights Apt. 177\nWillowborough, WV 81136', 'Apt. 306', 'Sam D\'Amore', 'Businessman', '+18172999078', 'student2@example.com', '2', '3', 'Kali Jenkins', 'Teacher', '+1.859.736.5206', 'student4@example.com', '4', '5', 'Ebba Weissnat', '534-562-5235', 'student6@example.com', '6', 'Aunt', 1, 1, 3, '2025-11-18', 'N/A', 7, 9299047, NULL, NULL, NULL, NULL, '2025-11-18 10:09:25', '2025-11-18 10:09:25'),
(2, 'Emile', 'Blanda', '1993-05-10', 'Other', 'B-', 'Islam', 'Bangladeshi', '8', '+1-406-454-1119', 'student9@example.com', '$2y$12$stITyCUOPz.QSAlipd5CJOPyzBF62L/YMmThziwPIUhBmEp29.14u', '9173 Norma Isle\nGloverton, OH 22244-0617', 'Apt. 198', 'Prof. Federico Flatley', 'Businessman', '+1 (515) 979-7037', 'student9@example.com', '9', '10', 'Melisa Runolfsson', 'Doctor', '1-843-489-9357', 'student11@example.com', '11', '12', 'Mr. Jerrell Nienow', '574.991.2135', 'student13@example.com', '13', 'Brother', 1, 1, 1, '2025-11-18', 'N/A', 14, 92990414, NULL, NULL, NULL, NULL, '2025-11-18 10:09:25', '2025-11-18 10:09:25'),
(3, 'Porter', 'Herman', '2021-03-11', 'Other', 'AB-', 'Christian', 'Bangladeshi', '15', '+1 (534) 591-9514', 'student16@example.com', '$2y$12$9raA7v/Yx8xNIUiYqkpkBOAmKgF56Xp1CC34f5i0SKHsS.jPB8vy.', '81808 Wolff Keys\nBeattyville, IL 49662', 'Suite 548', 'Americo Purdy', 'Businessman', '423.558.9963', 'student16@example.com', '16', '17', 'Yolanda Huel', 'Teacher', '+1 (737) 329-3477', 'student18@example.com', '18', '19', 'Prof. Carroll Nolan', '1-904-679-8831', 'student20@example.com', '20', 'Uncle', 1, 2, 1, '2025-11-18', 'N/A', 21, 92990421, NULL, NULL, NULL, NULL, '2025-11-18 10:09:25', '2025-11-18 10:09:25'),
(4, 'Kristofer', 'Daugherty', '2003-05-15', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '22', '(612) 835-7366', 'student23@example.com', '$2y$12$ZTnLUt.S5I0xK6aJFob7a.4L/0zmOXGXR.kYNlPc.NWr4/T1eqIaW', '4821 Koepp Hill\nWest Cicerofurt, FL 46860', 'Suite 647', 'Dillon Stroman', 'Teacher', '(820) 412-6040', 'student23@example.com', '23', '24', 'Leta Little', 'Housewife', '+1.760.620.9276', 'student25@example.com', '25', '26', 'Dr. Merl Yost MD', '+1-412-768-6355', 'student27@example.com', '27', 'Brother', 1, 1, 4, '2025-11-18', 'N/A', 28, 92990428, NULL, NULL, NULL, NULL, '2025-11-18 10:09:25', '2025-11-18 10:09:25'),
(5, 'Clair', 'Ortiz', '2000-07-19', 'Male', 'AB-', 'Other', 'Bangladeshi', '29', '667-900-6489', 'student30@example.com', '$2y$12$RhcX.bndJ4Cb2iYteF1XBuKvCssb8QVCq2Rsk/YkPsAqBTRWqGfTi', '5034 Vandervort Bridge\nWest Laurelview, TN 01394', 'Suite 825', 'Gilbert Lehner PhD', 'Farmer', '+1 (504) 216-3677', 'student30@example.com', '30', '31', 'Dr. Mona Kreiger', 'Businesswoman', '+1.410.761.9060', 'student32@example.com', '32', '33', 'Mr. Bernardo Breitenberg DDS', '(609) 886-5345', 'student34@example.com', '34', 'Sister', 1, 3, 1, '2025-11-18', 'N/A', 35, 92990435, NULL, NULL, NULL, NULL, '2025-11-18 10:09:26', '2025-11-18 10:09:26'),
(6, 'Emerald', 'Thiel', '1992-12-22', 'Other', 'A+', 'Christian', 'Bangladeshi', '36', '+1-862-821-7331', 'student37@example.com', '$2y$12$PLmWlnSj.QlePQ4xsUKfceqH9dAn8Cr/AoZNxTOl9vovGRUh63Q4e', '399 Lacey Estates Apt. 670\nLake Malika, PA 10734-0798', 'Suite 718', 'Mason Harris', 'Farmer', '+1.863.484.3374', 'student37@example.com', '37', '38', 'Dr. Delpha Konopelski I', 'Nurse', '229.380.6181', 'student39@example.com', '39', '40', 'Alta Abernathy', '+1.906.931.7299', 'student41@example.com', '41', 'Brother', 1, 2, 3, '2025-11-18', 'N/A', 42, 92990442, NULL, NULL, NULL, NULL, '2025-11-18 10:09:26', '2025-11-18 10:09:26'),
(7, 'Alvah', 'O\'Conner', '1994-08-20', 'Female', 'AB+', 'Other', 'Bangladeshi', '43', '+1.737.492.0241', 'student44@example.com', '$2y$12$th7iP1A0elKcHxnlYY1h7Ov5ejXSBJyj/LstsN0wzLcOfoqR2h2e2', '474 Ivah Stream\nShadburgh, AZ 68651-6275', 'Suite 727', 'Bertrand Nader', 'Teacher', '814.641.8602', 'student44@example.com', '44', '45', 'Fannie Strosin MD', 'Doctor', '1-986-590-5731', 'student46@example.com', '46', '47', 'Prof. Keeley Hane Sr.', '1-424-409-7667', 'student48@example.com', '48', 'Grandparent', 1, 4, 1, '2025-11-18', 'N/A', 49, 92990449, NULL, NULL, NULL, NULL, '2025-11-18 10:09:26', '2025-11-18 10:09:26'),
(8, 'Isobel', 'Kuhic', '1976-09-26', 'Other', 'O+', 'Buddhist', 'Bangladeshi', '50', '+1-718-804-8071', 'student51@example.com', '$2y$12$cXh51cRtIB4UfpLfrP5Zee6oRCMSw2iNhXGk7wjKqxqmMf3bF7jLO', '53915 Dorthy Forks Apt. 783\nNorth Emilia, AK 37109', 'Apt. 110', 'Maverick King II', 'Doctor', '+1-614-889-0402', 'student51@example.com', '51', '52', 'Kelly DuBuque', 'Teacher', '1-820-562-1504', 'student53@example.com', '53', '54', 'River Zemlak', '1-626-210-1794', 'student55@example.com', '55', 'Brother', 1, 5, 1, '2025-11-18', 'N/A', 56, 92990456, NULL, NULL, NULL, NULL, '2025-11-18 10:09:26', '2025-11-18 10:09:26'),
(9, 'Zoie', 'Olson', '2013-11-28', 'Female', 'A-', 'Christian', 'Bangladeshi', '57', '1-832-799-9240', 'student58@example.com', '$2y$12$b8LIVDaXz45.8HewKvW30OfXX0H05WNO0cQHNbhm/UJYoNElSZY3q', '53374 Alva Wells\nYundtville, WA 60439', 'Suite 501', 'Vicente Conn', 'Doctor', '351.540.8353', 'student58@example.com', '58', '59', 'Linda Altenwerth', 'Housewife', '240-360-0089', 'student60@example.com', '60', '61', 'Mrs. Constance Lind', '1-484-365-5477', 'student62@example.com', '62', 'Sister', 1, 1, 5, '2025-11-18', 'N/A', 63, 92990463, NULL, NULL, NULL, NULL, '2025-11-18 10:09:26', '2025-11-18 10:09:26'),
(10, 'Estell', 'Stiedemann', '1979-02-22', 'Male', 'B-', 'Christian', 'Bangladeshi', '64', '(667) 855-5388', 'student65@example.com', '$2y$12$uV3.ni.0jIhB0p96U3PNnOWL6w1jEQhRjt3Lr.vCFJQqNoNwLFfpK', '2752 Gerlach Harbors Suite 235\nFeliciastad, CO 41143', 'Suite 356', 'Prof. Rosendo Effertz', 'Teacher', '+1 (458) 210-3367', 'student65@example.com', '65', '66', 'Leslie Block', 'Doctor', '+1-463-807-5848', 'student67@example.com', '67', '68', 'Dr. Aidan Stroman', '+1-321-206-1224', 'student69@example.com', '69', 'Sister', 1, 6, 1, '2025-11-18', 'N/A', 70, 92990470, NULL, NULL, NULL, NULL, '2025-11-18 10:09:26', '2025-11-18 10:09:26'),
(11, 'Herminia', 'Boyle', '2017-01-07', 'Other', 'O-', 'Islam', 'Bangladeshi', '71', '1-225-408-2560', 'student72@example.com', '$2y$12$81deN9MrZOumUOlR08dQiuejfUXh13fPFNxl/OKWyGXMZs4iAR5aO', '90623 Auer Junction Apt. 650\nMcCulloughfurt, OR 45857', 'Apt. 400', 'Nigel Boyle', 'Engineer', '928.601.5170', 'student72@example.com', '72', '73', 'Ciara Marks', 'Teacher', '1-218-240-3262', 'student74@example.com', '74', '75', 'Dianna Jaskolski', '534.893.1779', 'student76@example.com', '76', 'Aunt', 1, 1, 2, '2025-11-18', 'N/A', 77, 92990477, NULL, NULL, NULL, NULL, '2025-11-18 10:09:27', '2025-11-18 10:09:27'),
(12, 'Laurine', 'Bogisich', '1999-04-17', 'Female', 'A+', 'Christian', 'Bangladeshi', '78', '1-585-574-7285', 'student79@example.com', '$2y$12$RJjM4/vz8c7bJGJEHT7buu1wponip5rYTodRlC9DOMj98fmKaslRa', '200 Teresa Village\nSouth Maiyahaven, AL 25730', 'Suite 958', 'Prof. Patrick Ryan', 'Businessman', '(574) 241-4475', 'student79@example.com', '79', '80', 'Kaylah Huels', 'Housewife', '941.299.4974', 'student81@example.com', '81', '82', 'Lamar Harris', '1-458-241-1185', 'student83@example.com', '83', 'Brother', 1, 3, 3, '2025-11-18', 'N/A', 84, 92990484, NULL, NULL, NULL, NULL, '2025-11-18 10:09:27', '2025-11-18 10:09:27'),
(13, 'Mathilde', 'Shields', '2003-03-11', 'Other', 'B-', 'Other', 'Bangladeshi', '85', '+1-586-490-3219', 'student86@example.com', '$2y$12$Vsak0FjnNrv1hF/m3ZzPqeWBef/Xg966OlICiGB442b7A3JvfXdQa', '481 Sanford Plains\nWest Seamus, IN 66778-2116', 'Apt. 137', 'Dave Murray', 'Engineer', '1-805-879-6489', 'student86@example.com', '86', '87', 'Ebony Wilderman', 'Housewife', '+1 (380) 368-0950', 'student88@example.com', '88', '89', 'Mrs. Ebony Jacobs Jr.', '580-902-0883', 'student90@example.com', '90', 'Sister', 1, 2, 4, '2025-11-18', 'N/A', 91, 92990491, NULL, NULL, NULL, NULL, '2025-11-18 10:09:27', '2025-11-18 10:09:27'),
(14, 'Moses', 'Buckridge', '1988-04-06', 'Female', 'B-', 'Christian', 'Bangladeshi', '92', '+1-516-260-8952', 'student93@example.com', '$2y$12$vWG9Z0t/P3qVOtUuc/0YT.NV4zITkFoAFf5VIqw5W.rWRZ8bwasuu', '88173 Weber Walks Suite 591\nLake Lonnie, AZ 72937', 'Suite 921', 'Prof. Dee Kunde', 'Engineer', '+1.603.782.8173', 'student93@example.com', '93', '94', 'Ms. Naomie Howell Jr.', 'Nurse', '1-903-955-8141', 'student95@example.com', '95', '96', 'Izaiah Bechtelar', '+1-351-375-5732', 'student97@example.com', '97', 'Brother', 1, 4, 3, '2025-11-18', 'N/A', 98, 92990498, NULL, NULL, NULL, NULL, '2025-11-18 10:09:27', '2025-11-18 10:09:27'),
(15, 'Mertie', 'Cremin', '1989-05-21', 'Female', 'A-', 'Hindu', 'Bangladeshi', '99', '(272) 632-8016', 'student100@example.com', '$2y$12$ThCx.FEBOyGCWxyG2aqdWO8tfjFzZ0UiqczBbZAlWB63zYGr6yTz6', '246 Jast Circles Suite 583\nEast Rusty, ND 69048', 'Suite 585', 'Anibal Fadel', 'Teacher', '424-627-3443', 'student100@example.com', '100', '101', 'Dr. Marilou Hartmann I', 'Teacher', '(505) 538-3573', 'student102@example.com', '102', '103', 'Lamont Hansen IV', '+17438105416', 'student104@example.com', '104', 'Brother', 1, 7, 1, '2025-11-18', 'N/A', 105, 929904105, NULL, NULL, NULL, NULL, '2025-11-18 10:09:27', '2025-11-18 10:09:27'),
(16, 'Jules', 'Hand', '2012-06-11', 'Female', 'AB+', 'Islam', 'Bangladeshi', '106', '(928) 965-7955', 'student107@example.com', '$2y$12$Y2i85TjvKq6CGeZ5JvxxLuszT9TTQYQ0jtvCJp4olLwbDTpjP/8cm', '32512 Johns Parks\nAnkundingburgh, WV 63500-5347', 'Suite 417', 'Bartholome Jacobi Jr.', 'Teacher', '1-757-282-4992', 'student107@example.com', '107', '108', 'Cathryn Streich', 'Teacher', '+12482078309', 'student109@example.com', '109', '110', 'Boris Huel', '+1-662-442-0255', 'student111@example.com', '111', 'Aunt', 1, 5, 3, '2025-11-18', 'N/A', 112, 929904112, NULL, NULL, NULL, NULL, '2025-11-18 10:09:28', '2025-11-18 10:09:28'),
(17, 'Albina', 'Farrell', '2011-11-02', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '113', '+1.806.626.1379', 'student114@example.com', '$2y$12$yWv6R.378ZoYZwRtMG.28uqKuRckSkPxesK6Vb9.Fn/pwXiwEaISW', '8061 Fay Rapid Suite 735\nMyronhaven, ME 03992-4859', 'Suite 644', 'Drake Botsford V', 'Doctor', '414-453-5349', 'student114@example.com', '114', '115', 'Clarissa Kuvalis DDS', 'Teacher', '+1 (540) 650-0655', 'student116@example.com', '116', '117', 'Mr. Kameron Schaefer', '(743) 581-4278', 'student118@example.com', '118', 'Sister', 1, 2, 2, '2025-11-18', 'N/A', 119, 929904119, NULL, NULL, NULL, NULL, '2025-11-18 10:09:28', '2025-11-18 10:09:28'),
(18, 'David', 'McGlynn', '1979-10-10', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '120', '+1 (872) 476-5450', 'student121@example.com', '$2y$12$P29hT9NguBZ34zn3Ok/C3uScB94rEigl8atYQu5MzGMNrdwHvaFa2', '3855 Kuvalis Mews\nPort Jarodshire, SC 87674', 'Apt. 275', 'Hugh Dietrich Jr.', 'Farmer', '+1-229-289-8021', 'student121@example.com', '121', '122', 'Abigayle Hauck', 'Businesswoman', '+1 (727) 678-6306', 'student123@example.com', '123', '124', 'Sid Luettgen', '512.280.4117', 'student125@example.com', '125', 'Uncle', 1, 6, 3, '2025-11-18', 'N/A', 126, 929904126, NULL, NULL, NULL, NULL, '2025-11-18 10:09:28', '2025-11-18 10:09:28'),
(19, 'Garret', 'Smitham', '1979-02-25', 'Male', 'O-', 'Hindu', 'Bangladeshi', '127', '(740) 627-6691', 'student128@example.com', '$2y$12$chQcJpQXDXlxA0BF/k3eluozFTxUw8l/q/u66KIgqxbeaKG2QQlUK', '52601 Wuckert Branch\nLake Eltaview, IL 04878-2076', 'Apt. 771', 'Mortimer Balistreri', 'Farmer', '(520) 465-8171', 'student128@example.com', '128', '129', 'Josefina Bednar', 'Housewife', '+1.531.289.3967', 'student130@example.com', '130', '131', 'Prof. Dayton Hackett DDS', '1-689-273-6554', 'student132@example.com', '132', 'Brother', 1, 2, 5, '2025-11-18', 'N/A', 133, 929904133, NULL, NULL, NULL, NULL, '2025-11-18 10:09:28', '2025-11-18 10:09:28'),
(20, 'Bryce', 'Wuckert', '1991-09-04', 'Female', 'A+', 'Christian', 'Bangladeshi', '134', '878.424.6933', 'student135@example.com', '$2y$12$.hJMkQC6vVtzj8C1DnLsieeOc27qfayKeg0Y.h3PtI4JhKL5ZPY7O', '1647 Stracke Locks Apt. 183\nSouth Carissa, IA 27164-2297', 'Apt. 202', 'Lourdes Cremin II', 'Businessman', '424.607.4767', 'student135@example.com', '135', '136', 'Ms. Kara Zemlak II', 'Teacher', '938.872.0189', 'student137@example.com', '137', '138', 'Beaulah Wyman', '574-681-9397', 'student139@example.com', '139', 'Sister', 1, 3, 4, '2025-11-18', 'N/A', 140, 929904140, NULL, NULL, NULL, NULL, '2025-11-18 10:09:28', '2025-11-18 10:09:28'),
(21, 'Tavares', 'Hand', '1990-06-13', 'Other', 'AB-', 'Christian', 'Bangladeshi', '141', '364.728.5217', 'student142@example.com', '$2y$12$7d.lm/C0l9HnqTVrlQR6gOOkGJAXUm1qTaee5QAW1QHh7dpML8.B2', '6517 Nitzsche Forest Apt. 296\nNorth Jaylenshire, GA 25588-9833', 'Suite 202', 'Jovanny Kautzer II', 'Businessman', '+1-724-746-0042', 'student142@example.com', '142', '143', 'Bettie Dicki', 'Housewife', '906-651-3645', 'student144@example.com', '144', '145', 'Courtney Kassulke', '850.446.0913', 'student146@example.com', '146', 'Aunt', 1, 7, 3, '2025-11-18', 'N/A', 147, 929904147, NULL, NULL, NULL, NULL, '2025-11-18 10:09:28', '2025-11-18 10:09:28'),
(22, 'Alexa', 'Buckridge', '1981-12-15', 'Other', 'B-', 'Islam', 'Bangladeshi', '148', '478.344.7304', 'student149@example.com', '$2y$12$gqDuLYjjGg1qe13FLyKUEuopsF4I6JA2rAkWfTmLATGPFmrNysPAK', '7907 Hoppe Squares\nWittington, KY 77751', 'Apt. 968', 'Adrian Lesch', 'Engineer', '+15674362642', 'student149@example.com', '149', '150', 'Simone Auer DDS', 'Housewife', '1-737-634-4555', 'student151@example.com', '151', '152', 'Mr. Wilson Bechtelar', '434.345.1347', 'student153@example.com', '153', 'Uncle', 1, 8, 3, '2025-11-18', 'N/A', 154, 929904154, NULL, NULL, NULL, NULL, '2025-11-18 10:09:29', '2025-11-18 10:09:29'),
(23, 'Carolyn', 'Leannon', '2006-01-05', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '155', '+1-580-696-9972', 'student156@example.com', '$2y$12$IOqf2do.vcsl0NsXQqRTpe1smwjB3/tQioEN5vWp2rtoO90qwHkLW', '866 Bartoletti Mill\nGreenton, FL 07480', 'Suite 899', 'Kennith Cronin', 'Doctor', '(680) 387-7313', 'student156@example.com', '156', '157', 'Marianna Purdy', 'Doctor', '(240) 503-7858', 'student158@example.com', '158', '159', 'Khalil Mertz', '+1 (267) 204-7968', 'student160@example.com', '160', 'Brother', 1, 4, 4, '2025-11-18', 'N/A', 161, 929904161, NULL, NULL, NULL, NULL, '2025-11-18 10:09:29', '2025-11-18 10:09:29'),
(24, 'Mabel', 'Hagenes', '1982-01-05', 'Male', 'O-', 'Islam', 'Bangladeshi', '162', '901-661-0674', 'student163@example.com', '$2y$12$8KJ2ZbNf8ePFl7JGipq/I.nWrPbiNlUoPlHNTFFTeT6ThzB4tw1aq', '1945 Vance Wall Suite 518\nSouth Katlynn, AK 88139', 'Apt. 174', 'Mr. Ryan Nader DDS', 'Doctor', '+1-480-773-8615', 'student163@example.com', '163', '164', 'Emily Hegmann MD', 'Nurse', '762-622-0955', 'student165@example.com', '165', '166', 'Laurie Treutel IV', '+12244024827', 'student167@example.com', '167', 'Aunt', 1, 8, 1, '2025-11-18', 'N/A', 168, 929904168, NULL, NULL, NULL, NULL, '2025-11-18 10:09:29', '2025-11-18 10:09:29'),
(25, 'Jon', 'Turner', '1970-05-28', 'Male', 'A+', 'Other', 'Bangladeshi', '169', '+1.562.438.7586', 'student170@example.com', '$2y$12$SPvz2/GXpKqF7BVTRsDJGehRHBpZXW/NuNtHmVAoyAsumOk/HDo/2', '2067 Al Mills Apt. 943\nRashadview, OH 79060-5947', 'Apt. 440', 'Brando Huel', 'Farmer', '+1-281-330-1627', 'student170@example.com', '170', '171', 'Dominique Bradtke', 'Teacher', '775-957-7798', 'student172@example.com', '172', '173', 'Dr. Monroe Durgan', '(478) 445-7436', 'student174@example.com', '174', 'Sister', 1, 9, 1, '2025-11-18', 'N/A', 175, 929904175, NULL, NULL, NULL, NULL, '2025-11-18 10:09:29', '2025-11-18 10:09:29'),
(26, 'Lelah', 'Gottlieb', '1977-09-29', 'Other', 'AB-', 'Other', 'Bangladeshi', '176', '+1-503-400-5854', 'student177@example.com', '$2y$12$O.F.3QV7ER5JVIqpP8vpEOiK4eVnRQwUGNJMI6gbZrZ2HLRRLJfMO', '154 Maggio Road\nSimoniston, FL 48793', 'Suite 209', 'Columbus Schoen', 'Businessman', '281-542-6283', 'student177@example.com', '177', '178', 'Prof. Eva Schinner', 'Nurse', '351-496-1712', 'student179@example.com', '179', '180', 'Zora Huels', '+1-321-403-4716', 'student181@example.com', '181', 'Uncle', 1, 9, 3, '2025-11-18', 'N/A', 182, 929904182, NULL, NULL, NULL, NULL, '2025-11-18 10:09:29', '2025-11-18 10:09:29'),
(27, 'Corrine', 'Hegmann', '1981-07-26', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '183', '+1-909-269-9604', 'student184@example.com', '$2y$12$aGCstPtTKVNJSrjiGiwEoeMHvNjVtmqeWHnIsnHfdKHwargC1z.R2', '3154 Beahan Spur\nSouth Xavier, MS 52199-1645', 'Suite 237', 'Emmitt Weissnat', 'Doctor', '+12812537810', 'student184@example.com', '184', '185', 'Elva Emmerich', 'Housewife', '+1-341-560-0910', 'student186@example.com', '186', '187', 'Kristian Kub', '(551) 803-4336', 'student188@example.com', '188', 'Aunt', 1, 3, 2, '2025-11-18', 'N/A', 189, 929904189, NULL, NULL, NULL, NULL, '2025-11-18 10:09:30', '2025-11-18 10:09:30'),
(28, 'Audreanne', 'Stark', '1992-07-18', 'Male', 'B-', 'Christian', 'Bangladeshi', '190', '870-650-9949', 'student191@example.com', '$2y$12$WD.2icenH/o4YgXzNipvo.ssLGWMOqv8Asvhqm075JKr2SMyFrvrC', '1282 Welch Crescent Apt. 058\nWehnerville, IN 80041', 'Suite 516', 'Ceasar Wisozk', 'Engineer', '1-856-994-2091', 'student191@example.com', '191', '192', 'Ms. Celestine O\'Hara IV', 'Teacher', '+1-517-673-4422', 'student193@example.com', '193', '194', 'Jonathan Lebsack II', '1-586-885-8790', 'student195@example.com', '195', 'Uncle', 1, 5, 4, '2025-11-18', 'N/A', 196, 929904196, NULL, NULL, NULL, NULL, '2025-11-18 10:09:30', '2025-11-18 10:09:30'),
(29, 'Cleveland', 'Schowalter', '1992-11-28', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '197', '240.628.1325', 'student198@example.com', '$2y$12$HIk.jLIbQESGdLG72ro3Z.tM7.KjlYhiUOXe3iLuhjQW0.HcWJEU.', '4995 Ewald Summit Suite 151\nLangworthburgh, AZ 96485', 'Apt. 422', 'Theron Stamm PhD', 'Farmer', '+13216201863', 'student198@example.com', '198', '199', 'Sophia Ullrich', 'Businesswoman', '864.872.1992', 'student200@example.com', '200', '201', 'Mrs. Emmalee Botsford MD', '+1-725-534-6646', 'student202@example.com', '202', 'Sister', 1, 10, 3, '2025-11-18', 'N/A', 203, 929904203, NULL, NULL, NULL, NULL, '2025-11-18 10:09:30', '2025-11-18 10:09:30'),
(30, 'Kaia', 'Weimann', '1986-05-09', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '204', '+1 (940) 732-0789', 'student205@example.com', '$2y$12$y1wz2mBtwHK3kthAGJPu3uSEz.qyNrlaBFNd06tsz3guuYK9Rfvj.', '860 Jennyfer Springs\nLake Zoeystad, MI 88945-7318', 'Apt. 010', 'Kale Sanford', 'Engineer', '458-414-1891', 'student205@example.com', '205', '206', 'Tiffany Weimann', 'Businesswoman', '973.925.2887', 'student207@example.com', '207', '208', 'Adeline Bogisich', '320-645-2751', 'student209@example.com', '209', 'Grandparent', 1, 4, 2, '2025-11-18', 'N/A', 210, 929904210, NULL, NULL, NULL, NULL, '2025-11-18 10:09:30', '2025-11-18 10:09:30'),
(31, 'Jacynthe', 'Hartmann', '1975-12-20', 'Female', 'AB-', 'Christian', 'Bangladeshi', '211', '+17018850631', 'student212@example.com', '$2y$12$bzFv.wPQ3yInF6e9aM8P5unPVfu.yddq6n.WxcDWa3wkLfI2Wjp2m', '2080 Ally Summit\nKevonshire, NE 37463', 'Suite 605', 'Adonis Bradtke', 'Businessman', '+12179962344', 'student212@example.com', '212', '213', 'Mariana Nikolaus Sr.', 'Doctor', '(712) 264-9490', 'student214@example.com', '214', '215', 'Perry Ernser', '+1-979-319-8975', 'student216@example.com', '216', 'Uncle', 1, 11, 3, '2025-11-18', 'N/A', 217, 929904217, NULL, NULL, NULL, NULL, '2025-11-18 10:09:30', '2025-11-18 10:09:30'),
(32, 'Doug', 'Rowe', '1998-12-19', 'Female', 'A-', 'Christian', 'Bangladeshi', '218', '351.483.5327', 'student219@example.com', '$2y$12$v3rJhB6CqfaSgXNWKwWPuObn1ynTQYWymqIUuH46Xyas8bTmQyYhW', '693 Santos Spring\nNorth Danyka, AL 87693', 'Apt. 790', 'Uriah Runolfsson', 'Businessman', '954-331-7101', 'student219@example.com', '219', '220', 'Hope Mertz', 'Businesswoman', '1-520-895-8944', 'student221@example.com', '221', '222', 'Shanny Bradtke', '+19419538962', 'student223@example.com', '223', 'Grandparent', 1, 5, 2, '2025-11-18', 'N/A', 224, 929904224, NULL, NULL, NULL, NULL, '2025-11-18 10:09:30', '2025-11-18 10:09:30'),
(33, 'Brant', 'Johnson', '1991-01-31', 'Male', 'AB-', 'Islam', 'Bangladeshi', '225', '(213) 924-2527', 'student226@example.com', '$2y$12$y6EUx8Xw2VtF411zAcap2OaA1zXCNeQV5wTKjWBT3irw6/6afp1zW', '20566 Konopelski Park Suite 408\nJusticeton, WI 44331-4392', 'Suite 105', 'Tyrel Reinger PhD', 'Businessman', '848.283.0042', 'student226@example.com', '226', '227', 'Prof. Bianka Durgan', 'Nurse', '+1-740-587-1054', 'student228@example.com', '228', '229', 'Trycia Grant', '+1-713-215-1507', 'student230@example.com', '230', 'Grandparent', 1, 12, 3, '2025-11-18', 'N/A', 231, 929904231, NULL, NULL, NULL, NULL, '2025-11-18 10:09:31', '2025-11-18 10:09:31'),
(34, 'Lila', 'Emmerich', '2014-02-04', 'Other', 'B-', 'Hindu', 'Bangladeshi', '232', '+1 (225) 645-4988', 'student233@example.com', '$2y$12$t5xR9R71bKKDb5jLslNOSedWfO93PLwcBHdkbM66UJYF27BEEWVeu', '7713 Wiza Ville Apt. 449\nMayertbury, CT 87729', 'Suite 360', 'Prof. Lane Waters', 'Doctor', '1-650-649-6239', 'student233@example.com', '233', '234', 'Miss Destany Hill II', 'Doctor', '973.519.4446', 'student235@example.com', '235', '236', 'Sonya Hayes DVM', '1-252-652-4995', 'student237@example.com', '237', 'Grandparent', 1, 13, 3, '2025-11-18', 'N/A', 238, 929904238, NULL, NULL, NULL, NULL, '2025-11-18 10:09:31', '2025-11-18 10:09:31'),
(35, 'Vena', 'Shanahan', '1973-01-06', 'Other', 'A-', 'Hindu', 'Bangladeshi', '239', '(262) 805-6093', 'student240@example.com', '$2y$12$fqon1w7CkFyUewS4eyJMKe.auya0yBxot4Tov3ULiTwVLifFLM4fi', '5833 Terry Garden Suite 707\nNorth Rooseveltville, TN 77235-7056', 'Apt. 391', 'Dr. Adam Rodriguez PhD', 'Doctor', '+1-423-224-7276', 'student240@example.com', '240', '241', 'Sylvia Ullrich', 'Teacher', '760-465-3827', 'student242@example.com', '242', '243', 'Maximo Reichert', '435-880-1725', 'student244@example.com', '244', 'Brother', 1, 6, 4, '2025-11-18', 'N/A', 245, 929904245, NULL, NULL, NULL, NULL, '2025-11-18 10:09:31', '2025-11-18 10:09:31'),
(36, 'Tierra', 'Osinski', '2020-12-25', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '246', '(412) 336-0433', 'student247@example.com', '$2y$12$dgYS7LPLCnBHTZj73boxhefdy6zOwMD3JWOzsCR95P2dVXyAeH.CG', '524 Stiedemann Branch\nDanielleview, MS 05552-8384', 'Suite 114', 'Alan Kiehn', 'Teacher', '+1-347-270-3236', 'student247@example.com', '247', '248', 'Burdette Wuckert DVM', 'Teacher', '+13803691158', 'student249@example.com', '249', '250', 'Mohamed Mante II', '972.544.3991', 'student251@example.com', '251', 'Brother', 1, 7, 4, '2025-11-18', 'N/A', 252, 929904252, NULL, NULL, NULL, NULL, '2025-11-18 10:09:31', '2025-11-18 10:09:31'),
(37, 'Daren', 'Franecki', '2009-11-09', 'Other', 'B-', 'Islam', 'Bangladeshi', '253', '(608) 985-1365', 'student254@example.com', '$2y$12$uxnocvvLM/0sh9NXHurkHe1eTztUnOgnPsvtiW5KfyLnBfVu8OR6e', '196 Darlene Cliff Suite 218\nJaleelmouth, NY 45772', 'Apt. 742', 'Prof. Trever Heidenreich IV', 'Engineer', '+1-520-791-7818', 'student254@example.com', '254', '255', 'Miss Francisca Kautzer', 'Businesswoman', '+1.559.685.4635', 'student256@example.com', '256', '257', 'Kris Stroman Sr.', '+1-938-254-7333', 'student258@example.com', '258', 'Uncle', 1, 10, 1, '2025-11-18', 'N/A', 259, 929904259, NULL, NULL, NULL, NULL, '2025-11-18 10:09:31', '2025-11-18 10:09:31'),
(38, 'Frances', 'Corkery', '1986-08-03', 'Female', 'A-', 'Hindu', 'Bangladeshi', '260', '1-219-657-4159', 'student261@example.com', '$2y$12$WHwltwwFdtCFGlBFNGl59u./6ia2fAUlrMMSNwHdG5G3ezS2ieXty', '269 Herminia Meadows Suite 516\nWest Augustfurt, OK 25595', 'Suite 117', 'Charles Reilly', 'Engineer', '1-435-867-0156', 'student261@example.com', '261', '262', 'Alysson Carroll', 'Doctor', '+1-612-567-2157', 'student263@example.com', '263', '264', 'Ned Quigley', '1-320-547-5905', 'student265@example.com', '265', 'Aunt', 1, 11, 1, '2025-11-18', 'N/A', 266, 929904266, NULL, NULL, NULL, NULL, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(39, 'Marcia', 'Hamill', '2012-08-13', 'Male', 'B-', 'Buddhist', 'Bangladeshi', '267', '+18544187542', 'student268@example.com', '$2y$12$GLwpIh.jsk1mQByGBGPEBej0cnFYvVWl/v1yYXp4yI8bA7lKxw1HO', '1869 Kuhic Ports Suite 779\nGradyshire, OH 57928', 'Apt. 077', 'Jaylon Altenwerth', 'Engineer', '1-254-238-6890', 'student268@example.com', '268', '269', 'Tyra Bashirian', 'Housewife', '936.749.3432', 'student270@example.com', '270', '271', 'Kelley Zieme', '+1-954-757-7903', 'student272@example.com', '272', 'Brother', 1, 3, 5, '2025-11-18', 'N/A', 273, 929904273, NULL, NULL, NULL, NULL, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(40, 'Melany', 'Brekke', '2013-10-24', 'Male', 'A+', 'Islam', 'Bangladeshi', '274', '(562) 689-5855', 'student275@example.com', '$2y$12$0qN4f6SgmH9fIeHsXYxTJugovOUf3Bozwp4pwba/M8g1yREXfyYXe', '529 Mante Lake Apt. 648\nGusikowskifort, LA 00145-9120', 'Suite 517', 'Adan Mosciski V', 'Teacher', '+1.678.325.9843', 'student275@example.com', '275', '276', 'Jaclyn Pouros', 'Doctor', '1-346-309-4294', 'student277@example.com', '277', '278', 'Jonathan Grimes', '(862) 999-5697', 'student279@example.com', '279', 'Brother', 1, 8, 4, '2025-11-18', 'N/A', 280, 929904280, NULL, NULL, NULL, NULL, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(41, 'Fatima', 'Moore', '2008-10-06', 'Male', 'B+', 'Islam', 'Bangladeshi', '281', '+1-443-428-6819', 'student282@example.com', '$2y$12$cMG/d/36q3pCcYqG/crejOsE3ygV5gE3j3mit6FbivRhExL67sjBS', '94094 Zieme Mountains\nNorth Franzbury, IA 40776', 'Suite 384', 'Wilson Casper', 'Businessman', '+14426176623', 'student282@example.com', '282', '283', 'Ms. Sallie Lind Jr.', 'Doctor', '402-730-7627', 'student284@example.com', '284', '285', 'Loyce Hayes', '+12192981337', 'student286@example.com', '286', 'Aunt', 1, 9, 4, '2025-11-18', 'N/A', 287, 929904287, NULL, NULL, NULL, NULL, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(42, 'Myrtle', 'Kutch', '1986-04-14', 'Male', 'B-', 'Islam', 'Bangladeshi', '288', '585-477-9697', 'student289@example.com', '$2y$12$J.h8WiohrwOdv/05XQFfFO9hyss3QZEeRZ2y9kCM/yCSe9gDJ5ApK', '3621 Ward Rest Suite 210\nSouth Imanifort, GA 55819-6083', 'Apt. 142', 'Prof. Joesph Hansen', 'Farmer', '+1-669-799-9062', 'student289@example.com', '289', '290', 'Libby Moen', 'Doctor', '(323) 437-0543', 'student291@example.com', '291', '292', 'Tyson Corwin', '+1-804-816-8133', 'student293@example.com', '293', 'Sister', 1, 12, 1, '2025-11-18', 'N/A', 294, 929904294, NULL, NULL, NULL, NULL, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(43, 'Alayna', 'Hackett', '2004-06-26', 'Female', 'O-', 'Other', 'Bangladeshi', '295', '1-754-263-5006', 'student296@example.com', '$2y$12$KE6ruavNJGFaD/vnmTjMwO6G4hwcMWfjMkph2JUpzDuEFeSaGj4wu', '80723 Baumbach Landing\nWest Mack, GA 93611', 'Suite 823', 'Xavier Kunde', 'Businessman', '1-754-844-0537', 'student296@example.com', '296', '297', 'Francisca Hauck', 'Housewife', '+1-920-797-0629', 'student298@example.com', '298', '299', 'Britney Jacobs', '479-220-1521', 'student300@example.com', '300', 'Brother', 1, 14, 3, '2025-11-18', 'N/A', 301, 929904301, NULL, NULL, NULL, NULL, '2025-11-18 10:09:32', '2025-11-18 10:09:32');

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
(1, 'Bangla', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(2, 'English', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(3, 'ICT', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(4, 'Physical Education', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(5, 'Physics', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(6, 'Chemistry', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(7, 'Biology', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(8, 'Higher Mathematics', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(9, 'Accounting', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(10, 'Business Organization & Management', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(11, 'Finance, Banking & Insurance', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(12, 'Production Management & Marketing', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(13, 'Logic', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(14, 'History', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(15, 'Civics', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(16, 'Economics', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(17, 'Islamic Studies', 1, '2025-11-18 10:09:32', '2025-11-18 10:09:32'),
(18, 'Sociology', 1, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(19, 'Social Work', 1, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(20, 'Geography', 1, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(21, 'Bangla', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(22, 'English', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(23, 'ICT', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(24, 'Physical Education', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(25, 'Physics', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(26, 'Chemistry', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(27, 'Biology', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(28, 'Higher Mathematics', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(29, 'Accounting', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(30, 'Business Organization & Management', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(31, 'Finance, Banking & Insurance', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(32, 'Production Management & Marketing', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(33, 'Logic', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(34, 'History', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(35, 'Civics', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(36, 'Economics', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(37, 'Islamic Studies', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(38, 'Sociology', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(39, 'Social Work', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(40, 'Geography', 2, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(41, 'Bangla', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(42, 'English', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(43, 'ICT', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(44, 'Physical Education', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(45, 'Physics', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(46, 'Chemistry', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(47, 'Biology', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(48, 'Higher Mathematics', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(49, 'Accounting', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(50, 'Business Organization & Management', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(51, 'Finance, Banking & Insurance', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(52, 'Production Management & Marketing', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(53, 'Logic', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(54, 'History', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(55, 'Civics', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(56, 'Economics', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(57, 'Islamic Studies', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(58, 'Sociology', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(59, 'Social Work', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(60, 'Geography', 3, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(61, 'Bangla', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(62, 'English', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(63, 'ICT', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(64, 'Physical Education', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(65, 'Physics', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(66, 'Chemistry', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(67, 'Biology', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(68, 'Higher Mathematics', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(69, 'Accounting', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(70, 'Business Organization & Management', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(71, 'Finance, Banking & Insurance', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(72, 'Production Management & Marketing', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(73, 'Logic', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(74, 'History', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(75, 'Civics', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(76, 'Economics', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(77, 'Islamic Studies', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(78, 'Sociology', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(79, 'Social Work', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(80, 'Geography', 4, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(81, 'Bangla', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(82, 'English', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(83, 'ICT', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(84, 'Physical Education', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(85, 'Physics', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(86, 'Chemistry', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(87, 'Biology', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(88, 'Higher Mathematics', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(89, 'Accounting', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(90, 'Business Organization & Management', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(91, 'Finance, Banking & Insurance', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(92, 'Production Management & Marketing', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(93, 'Logic', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(94, 'History', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(95, 'Civics', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(96, 'Economics', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(97, 'Islamic Studies', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(98, 'Sociology', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(99, 'Social Work', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33'),
(100, 'Geography', 5, '2025-11-18 10:09:33', '2025-11-18 10:09:33');

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
  `remark` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `national_id`, `contact_number`, `email`, `password`, `designation`, `address`, `father_name`, `father_contact`, `mother_name`, `mother_contact`, `guardian_name`, `guardian_contact`, `guardian_relationship`, `photo`, `father_photo`, `mother_photo`, `joning_date`, `mop_date`, `traning`, `index_no`, `status`, `remark`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Genesis', 'Feeney', '1974-05-05', 'Other', 'AB-', '0', '(628) 212-0625', 'teacher1@example.com', '$2y$12$vhX1L3fK.KqV/a1sdcd7dep7Cx8o1L/A4CgRAs8sHl8xQc6ytKzFO', 'Assistant Professor', '79965 Tatyana Drive\nLelahburgh, NH 33827-4116', 'Santos Mertz', '585-231-8614', 'Kelly Kuvalis', '+1-651-466-8370', 'Emile Stehr', '+1.585.540.4495', 'Brother', NULL, NULL, NULL, '1999-12-30', '1973-02-03', 'N/A', 'D001', 1, 'N/A', NULL, '2025-11-18 10:09:22', '2025-11-18 10:09:22'),
(2, 'Judy', 'Rowe', '1981-09-21', 'Male', 'O+', '2', '+1-980-408-3413', 'teacher2@example.com', '$2y$12$7utLRR24Husv1YBpvB1ht.kQbzpm9345emYiT7S4hMGl1X.VMt3SO', 'Senior Teacher', '44635 Irma Summit\nBuckridgeside, SC 54322-3309', 'Mr. Thad Parisian', '1-520-581-3374', 'Kianna Bode', '458-694-0821', 'Dr. Sean Zboncak I', '(469) 772-7440', 'Uncle', NULL, NULL, NULL, '1993-07-30', '2004-12-29', 'N/A', 'D003', 1, 'N/A', NULL, '2025-11-18 10:09:22', '2025-11-18 10:09:22'),
(3, 'Nelda', 'Collier', '1984-04-09', 'Female', 'B-', '4', '+1 (657) 331-7133', 'teacher3@example.com', '$2y$12$wrus13paoX7gFHSEuQX38.5ZWxACIrFRTEONx0Gkg6rvLeB6ixb3K', 'Head of Department', '3252 Lemke Island Apt. 999\nRoweshire, MI 79563-8432', 'Jacques Auer', '(364) 359-8419', 'Amara Friesen', '1-763-772-4520', 'Herbert D\'Amore', '(906) 447-9242', 'Sister', NULL, NULL, NULL, '1980-04-21', '1985-09-01', 'N/A', 'D005', 1, 'N/A', NULL, '2025-11-18 10:09:22', '2025-11-18 10:09:22'),
(4, 'Amber', 'Borer', '1985-12-12', 'Other', 'B-', '6', '1-567-969-4007', 'teacher4@example.com', '$2y$12$T1yKcbjxo0wFOeq16SlGt.Ph66yqGtYwGdHAFoeWrH9jvK/Iqel/G', 'Senior Teacher', '4813 Zieme Cliffs\nEast Rafaelahaven, OR 96235', 'Mr. Logan Swaniawski MD', '1-678-829-3920', 'Andreane Altenwerth', '505.959.2790', 'Felicity Oberbrunner', '+1-463-700-8291', 'Uncle', NULL, NULL, NULL, '1987-10-18', '1993-05-19', 'N/A', 'D007', 1, 'N/A', NULL, '2025-11-18 10:09:23', '2025-11-18 10:09:23'),
(5, 'Alycia', 'Armstrong', '1972-08-07', 'Male', 'B+', '8', '+1-234-393-1919', 'teacher5@example.com', '$2y$12$zToW3lfmkHNUvmhfKIe7R.8w0WedLFOPVsu.kj9Dh5zBHWTlCyg8a', 'Lecturer', '270 Kohler Rue\nNorth Jenashire, OR 14434', 'Leonel Mueller II', '854.956.5477', 'Gudrun Cremin', '430.275.1144', 'Prof. Nora Nitzsche II', '+1.785.515.4656', 'Grandparent', NULL, NULL, NULL, '1977-06-18', '2016-10-11', 'N/A', 'D009', 1, 'N/A', NULL, '2025-11-18 10:09:23', '2025-11-18 10:09:23'),
(6, 'Leon', 'Stokes', '1982-07-12', 'Other', 'O-', '10', '+1.763.912.2148', 'teacher6@example.com', '$2y$12$QNRsM4vAYFE.jSSun13aweIbdj9zveHzXAXiPAZXR5ytU6j05VbNC', 'Lecturer', '12854 Pietro Dam\nWest Chaz, NH 32464', 'Prof. Dion Bayer Sr.', '760.359.2138', 'Pinkie Barrows', '1-830-261-7315', 'Natalie Pagac MD', '+1-463-408-5686', 'Uncle', NULL, NULL, NULL, '1984-12-03', '1997-01-30', 'N/A', 'D0011', 1, 'N/A', NULL, '2025-11-18 10:09:23', '2025-11-18 10:09:23'),
(7, 'Susana', 'Bernier', '1983-11-11', 'Male', 'AB+', '12', '(928) 305-3877', 'teacher7@example.com', '$2y$12$axv169ONRZPUf412AWDGau8e32ihFP.r4HsRWB5m9FWJC4tvqrllu', 'Head of Department', '88265 Lue Mountains Suite 187\nUptonchester, TN 15843-2378', 'Van Runolfsdottir', '1-479-286-3682', 'Ella Altenwerth', '+1-928-244-2495', 'Domenica Parker', '(667) 566-9503', 'Uncle', NULL, NULL, NULL, '1983-10-24', '2020-04-24', 'N/A', 'D0013', 1, 'N/A', NULL, '2025-11-18 10:09:23', '2025-11-18 10:09:23'),
(8, 'Clifford', 'Lynch', '1974-01-13', 'Female', 'A-', '14', '1-334-724-4165', 'teacher8@example.com', '$2y$12$ubSW25js5KV23Ht5fHCjPOAMt8AeUrpTGeJOIDWySyUU002nmTecG', 'Senior Teacher', '4577 Wyman Center Suite 770\nHomenickton, KS 63657', 'Dr. Layne Gislason I', '(949) 719-6370', 'Mrs. Brittany Pollich III', '+1-480-526-6896', 'Prof. Vernice Hoeger', '1-667-478-5416', 'Aunt', NULL, NULL, NULL, '2020-10-29', '2003-08-02', 'N/A', 'D0015', 1, 'N/A', NULL, '2025-11-18 10:09:23', '2025-11-18 10:09:23'),
(9, 'Kiley', 'Cremin', '1976-06-28', 'Male', 'AB+', '16', '435.526.6008', 'teacher9@example.com', '$2y$12$j4ZMLbu7l9xSQJz4EGbeiehaZrrny2WjDjs8Bx4GM6b9/H9VPjZhC', 'Assistant Professor', '817 Lind Village Suite 002\nLake Katrine, ND 00502', 'Willis McLaughlin', '+1-731-565-3801', 'Marilou Borer', '312.926.3975', 'Rosalinda Dooley', '+1 (228) 322-0317', 'Grandparent', NULL, NULL, NULL, '1996-09-16', '2019-09-22', 'N/A', 'D0017', 1, 'N/A', NULL, '2025-11-18 10:09:23', '2025-11-18 10:09:23'),
(10, 'Flo', 'Dooley', '1977-07-30', 'Other', 'B+', '18', '1-734-633-3773', 'teacher10@example.com', '$2y$12$8o.ZkOK/lFww78D1Rp8CReQRk.OAEJvRbDWyxd97yehaI6.Zo.4zW', 'Head of Department', '2265 Collins Valleys\nNew Eveline, MT 20286', 'Jaylan Langworth', '1-508-206-0148', 'Miss Amie Bins', '224.764.8655', 'Mortimer O\'Hara', '+14785083336', 'Uncle', NULL, NULL, NULL, '2008-12-18', '1993-02-19', 'N/A', 'D0019', 1, 'N/A', NULL, '2025-11-18 10:09:24', '2025-11-18 10:09:24'),
(11, 'Franco', 'Robel', '1971-09-29', 'Female', 'AB-', '20', '(234) 556-2253', 'teacher11@example.com', '$2y$12$7LV2ujBJWlNF3xiwOiHOG.CqexcZzJhszA/PUFNOto.Uvq4OUgSvG', 'Assistant Professor', '440 Thalia Prairie Suite 687\nWeberville, AK 11719-7743', 'Giovani Cronin', '339-585-2037', 'Mrs. Audra Witting', '+1 (617) 355-5497', 'Jerry Nader', '+15643415267', 'Aunt', NULL, NULL, NULL, '2007-05-30', '2003-02-14', 'N/A', 'D0021', 1, 'N/A', NULL, '2025-11-18 10:09:24', '2025-11-18 10:09:24'),
(12, 'Colt', 'Marvin', '1974-03-08', 'Other', 'A-', '22', '520.610.8114', 'teacher12@example.com', '$2y$12$u8SOnHcf7sxXcaUGm2tSLeqpnooHSHGFKXA8q1gp.NTCTKOTxS.X2', 'Assistant Professor', '16413 Kayla Point\nSouth Ivory, OR 61894-4777', 'Mr. Buford Schumm V', '1-341-924-0314', 'Lottie Yost', '734-553-6576', 'Sarah Mills', '567.861.4702', 'Sister', NULL, NULL, NULL, '1980-05-19', '1984-07-25', 'N/A', 'D0023', 1, 'N/A', NULL, '2025-11-18 10:09:24', '2025-11-18 10:09:24'),
(13, 'Aurelie', 'Bergstrom', '1986-04-02', 'Male', 'B-', '24', '1-754-843-4829', 'teacher13@example.com', '$2y$12$nkYGrcY80/qYv8QnC3hA5u6dpRXkfiIqn/dL9nhDnALa5nEQOH27G', 'Senior Teacher', '6059 Bayer Causeway\nRashawnhaven, WI 69196-9814', 'Fred Spencer', '+1-870-624-3805', 'Amie Bailey', '505.449.3147', 'Talia Vandervort', '929.654.0936', 'Grandparent', NULL, NULL, NULL, '1974-03-12', '2015-08-17', 'N/A', 'D0025', 1, 'N/A', NULL, '2025-11-18 10:09:24', '2025-11-18 10:09:24'),
(14, 'Randal', 'Bergnaum', '1976-11-27', 'Male', 'AB+', '26', '+1-785-697-6742', 'teacher14@example.com', '$2y$12$uZi2TXyMXgqYxaunngMr7eERfH8mtIs91RrqGtYr/FJ/O3Zl6ieAi', 'Head of Department', '8184 Ortiz Trail\nGusikowskiside, FL 59209', 'Dr. Granville Botsford Jr.', '+1-385-625-5813', 'Alayna Tillman', '+1 (863) 710-1550', 'Christopher Shanahan', '+1-626-713-9004', 'Brother', NULL, NULL, NULL, '2004-11-09', '1992-07-02', 'N/A', 'D0027', 1, 'N/A', NULL, '2025-11-18 10:09:24', '2025-11-18 10:09:24'),
(15, 'Dax', 'Stoltenberg', '1978-08-30', 'Male', 'O-', '28', '+1 (859) 749-0952', 'teacher15@example.com', '$2y$12$ISX4h./ZD7vNOSfRLBIN5etsaGVYsV9GHoz7DTu326CBJOyNwY7W2', 'Assistant Professor', '1019 Korbin Branch\nStacymouth, OK 77650-5503', 'Darryl Greenholt', '434.893.4293', 'Prof. Teagan Hintz V', '1-480-226-4152', 'Alejandrin Gleason', '1-603-840-7480', 'Uncle', NULL, NULL, NULL, '1970-05-06', '1982-10-28', 'N/A', 'D0029', 1, 'N/A', NULL, '2025-11-18 10:09:25', '2025-11-18 10:09:25');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
