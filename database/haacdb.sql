-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 15, 2025 at 12:37 PM
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
(1, 2, 5, 82, '2025-12-14', 'Present', 'N/A', '2025-12-14 06:10:37', '2025-12-14 06:10:37'),
(2, 12, 5, 82, '2025-12-14', 'Present', 'N/A', '2025-12-14 06:10:38', '2025-12-14 06:10:38'),
(3, 14, 5, 82, '2025-12-14', 'Present', 'N/A', '2025-12-14 06:10:39', '2025-12-14 06:10:39'),
(4, 19, 5, 82, '2025-12-14', 'Present', 'N/A', '2025-12-14 06:10:40', '2025-12-14 06:10:40'),
(5, 20, 5, 82, '2025-12-14', 'Present', 'N/A', '2025-12-14 06:10:40', '2025-12-14 06:10:40'),
(6, 24, 5, 82, '2025-12-14', 'Absent', 'N/A', '2025-12-14 06:10:42', '2025-12-14 06:10:42'),
(7, 3, 1, 1, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:32', '2025-12-15 06:20:32'),
(8, 11, 1, 1, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:33', '2025-12-15 06:20:33'),
(9, 15, 1, 1, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:34', '2025-12-15 06:20:34'),
(10, 22, 1, 1, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:35', '2025-12-15 06:20:35'),
(11, 23, 1, 1, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:37', '2025-12-15 06:20:37'),
(12, 27, 1, 1, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:38', '2025-12-15 06:20:38'),
(13, 3, 1, 2, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:42', '2025-12-15 06:20:42'),
(14, 11, 1, 2, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:43', '2025-12-15 06:20:43'),
(15, 15, 1, 2, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:44', '2025-12-15 06:20:44'),
(16, 22, 1, 2, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:45', '2025-12-15 06:20:45'),
(17, 23, 1, 2, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:47', '2025-12-15 06:20:47'),
(18, 3, 1, 3, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:50', '2025-12-15 06:20:50'),
(19, 11, 1, 3, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:51', '2025-12-15 06:20:51'),
(20, 15, 1, 3, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:52', '2025-12-15 06:20:52'),
(21, 22, 1, 3, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:53', '2025-12-15 06:20:53'),
(22, 3, 1, 4, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:56', '2025-12-15 06:20:56'),
(23, 11, 1, 4, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:57', '2025-12-15 06:20:57'),
(24, 15, 1, 4, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:20:59', '2025-12-15 06:20:59'),
(25, 22, 1, 4, '2025-12-15', 'Present', 'N/A', '2025-12-15 06:21:00', '2025-12-15 06:21:00'),
(26, 2, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:25:22', '2025-12-15 08:25:22'),
(27, 12, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:27:56', '2025-12-15 08:27:56'),
(28, 14, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:27:58', '2025-12-15 08:27:58'),
(29, 19, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:27:59', '2025-12-15 08:27:59'),
(30, 20, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:28:01', '2025-12-15 08:28:01'),
(31, 24, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:28:02', '2025-12-15 08:28:02'),
(32, 29, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:29:48', '2025-12-15 08:29:48'),
(33, 37, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:29:49', '2025-12-15 08:29:49'),
(34, 66, 5, 81, '2025-12-15', 'Present', 'N/A', '2025-12-15 08:29:50', '2025-12-15 08:29:50');

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

--
-- Dumping data for table `class_schedules`
--

INSERT INTO `class_schedules` (`id`, `class_id`, `period`, `start_time`, `end_time`, `teacher_id`, `subject_id`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '10:00:00', '11:00:00', 1, 1, 'Saturday', '2025-12-14 06:13:33', '2025-12-14 06:13:33'),
(2, 1, 2, '11:00:00', '12:00:00', 2, 2, 'Saturday', '2025-12-14 06:13:33', '2025-12-14 06:13:33'),
(3, 1, 3, '12:00:00', '13:00:00', 22, 4, 'Saturday', '2025-12-14 06:13:33', '2025-12-14 06:13:33'),
(4, 1, 4, '14:00:00', '15:00:00', 27, 7, 'Saturday', '2025-12-14 06:13:33', '2025-12-14 06:13:33'),
(5, 1, 5, '15:00:00', '16:00:00', 20, 18, 'Saturday', '2025-12-14 06:13:33', '2025-12-14 06:13:33'),
(6, 1, 6, '16:00:00', '17:00:00', 14, 20, 'Saturday', '2025-12-14 06:13:33', '2025-12-14 06:13:33');

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
(1, 'Hazi Abed Ali College', '213/1, East Brahmondi, Narsingdi. || Code - 3010 || Degree - 5424 || EIIN - 112717', 'info@haac.edu.bd', '01700000000', 'www.haac.edu.bd', '2025-12-14 06:06:59', '2025-12-14 06:06:59');

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

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `name`, `date`, `class_id`, `subject_id`, `max_marks`, `created_at`, `updated_at`) VALUES
(1, 'Midterm', '2025-12-15', 1, 19, 100, '2025-12-14 06:14:27', '2025-12-14 06:14:27'),
(2, 'Class Test', '2025-12-15', 1, 1, 10, '2025-12-14 06:14:39', '2025-12-14 06:14:39'),
(3, 'Class Test', '2025-12-16', 1, 1, 10, '2025-12-14 06:14:51', '2025-12-14 06:14:51');

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

--
-- Dumping data for table `exam_names`
--

INSERT INTO `exam_names` (`id`, `exam_name`, `created_at`, `updated_at`) VALUES
(1, 'Midterm', '2025-12-14 06:14:07', '2025-12-14 06:14:07'),
(2, 'Final', '2025-12-14 06:14:11', '2025-12-14 06:14:11'),
(3, 'Class Test', '2025-12-14 06:14:16', '2025-12-14 06:14:16');

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
(1, 'Salary', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(2, 'Utility', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(3, 'Maintenance', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(4, 'Academic', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(5, 'Transport', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(6, 'Event', '2025-12-14 06:06:01', '2025-12-14 06:06:01');

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

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `catId`, `subcatId`, `userId`, `title`, `date`, `amount`, `remark`, `created_at`, `updated_at`) VALUES
(1, 3, 9, 2, 'Bazar', '2025-12-15', 1000.00, 'N/A', '2025-12-15 07:00:11', '2025-12-15 07:00:11');

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
(1, 1, 'Teacher Salary', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(2, 1, 'Staff Salary', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(3, 1, 'Guest Teacher Salary', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(4, 2, 'Electricity Bill', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(5, 2, 'Water Bill', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(6, 2, 'Internet Bill', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(7, 3, 'Furniture Repair', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(8, 3, 'Building Repair', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(9, 3, 'Painting', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(10, 4, 'Books Purchase', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(11, 4, 'Lab Equipment', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(12, 4, 'Classroom Materials', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(13, 5, 'Bus Fuel', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(14, 5, 'Driver Salary', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(15, 5, 'Vehicle Repair', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(16, 6, 'Annual Program', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(17, 6, 'Sports Day', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(18, 6, 'Prize Giving Ceremony', '2025-12-14 06:06:01', '2025-12-14 06:06:01');

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
(1, 'Tuition Fee', 'Regular fee for academic instruction and classes', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(2, 'Admission Fee', 'One-time fee for student enrollment', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(3, 'Exam Fee', 'Fee for conducting examinations', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(4, 'Library Fee', 'Charge for library access and maintenance', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(5, 'Laboratory Fee', 'Fee for science/computer lab usage', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(6, 'Sports Fee', 'Charge for sports activities and events', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(7, 'Transport Fee', 'Fee for school bus/transport facilities', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(8, 'Hostel Fee', 'Accommodation and meal charges in hostel', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(9, 'Development Fee', 'Fee for infrastructure and school development', '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(10, 'Activity Fee', 'Fee for extracurricular activities and events', '2025-12-14 06:06:01', '2025-12-14 06:06:01');

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

--
-- Dumping data for table `fee_payment_details`
--

INSERT INTO `fee_payment_details` (`id`, `student_id`, `user_id`, `total_amount`, `total_paid`, `total_discount`, `total_due`, `payment_date`, `month`, `year`, `payment_method`, `status`, `receipt_no`, `invoice_no`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 650.00, 650.00, 0.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'AF5YEOAJ25', 'INV-81586', '2025-12-15 06:59:11', '2025-12-15 06:59:11'),
(2, 3, 2, 3200.00, 3000.00, 200.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'RMBFWLRWNY', 'INV-43184', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(3, 11, 2, 3850.00, 3500.00, 300.00, 50.00, '2025-12-15', '12', '2025', 'Cash', 'Partial', 'LNZ2FFGWHW', 'INV-44373', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(4, 15, 2, 3850.00, 3800.00, 50.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', '2U0C562NWO', 'INV-10444', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(5, 23, 2, 1150.00, 1100.00, 50.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'SA7TZETO0M', 'INV-14569', '2025-12-15 09:33:49', '2025-12-15 09:33:49'),
(6, 23, 2, 400.00, 400.00, 0.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'S2FS7JUJ6P', 'INV-84657', '2025-12-15 09:38:50', '2025-12-15 09:38:50'),
(7, 23, 2, 2300.00, 2300.00, 0.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'KMASCTML53', 'INV-41205', '2025-12-15 09:43:57', '2025-12-15 09:43:57'),
(8, 28, 2, 1150.00, 1150.00, 0.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'IF0WLYDL9X', 'INV-77796', '2025-12-15 09:45:59', '2025-12-15 09:45:59'),
(9, 28, 2, 400.00, 400.00, 0.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'PHCAMAJZSE', 'INV-30632', '2025-12-15 09:46:24', '2025-12-15 09:46:24'),
(10, 28, 2, 2300.00, 2300.00, 0.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', 'SSK9BWXFDI', 'INV-34498', '2025-12-15 09:47:31', '2025-12-15 09:47:31'),
(11, 27, 2, 3850.00, 3800.00, 50.00, 0.00, '2025-12-15', '12', '2025', 'Cash', 'Paid', '0MTR1FWQ6F', 'INV-43501', '2025-12-15 09:50:54', '2025-12-15 09:50:54');

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

--
-- Dumping data for table `fee_payment_items`
--

INSERT INTO `fee_payment_items` (`id`, `fee_payment_id`, `student_id`, `fee_structure_id`, `amount`, `paid`, `discount`, `due`, `payment_date`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 650.00, 650.00, 0.00, 0.00, '2025-12-15', '2025-12-15 06:59:11', '2025-12-15 06:59:11'),
(2, 2, 3, 2, 100.00, 93.75, 6.25, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(3, 2, 3, 3, 400.00, 375.00, 25.00, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(4, 2, 3, 4, 200.00, 187.50, 12.50, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(5, 2, 3, 5, 100.00, 93.75, 6.25, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(6, 2, 3, 6, 100.00, 93.75, 6.25, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(7, 2, 3, 7, 100.00, 93.75, 6.25, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(8, 2, 3, 8, 2000.00, 1875.00, 125.00, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(9, 2, 3, 9, 100.00, 93.75, 6.25, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(10, 2, 3, 10, 100.00, 93.75, 6.25, 0.00, '2025-12-15', '2025-12-15 08:41:46', '2025-12-15 08:41:46'),
(11, 3, 11, 1, 650.00, 590.91, 50.65, 8.44, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(12, 3, 11, 2, 100.00, 90.91, 7.79, 1.30, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(13, 3, 11, 3, 400.00, 363.64, 31.17, 5.19, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(14, 3, 11, 4, 200.00, 181.82, 15.58, 2.60, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(15, 3, 11, 5, 100.00, 90.91, 7.79, 1.30, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(16, 3, 11, 6, 100.00, 90.91, 7.79, 1.30, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(17, 3, 11, 7, 100.00, 90.91, 7.79, 1.30, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(18, 3, 11, 8, 2000.00, 1818.18, 155.84, 25.98, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(19, 3, 11, 9, 100.00, 90.91, 7.79, 1.30, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(20, 3, 11, 10, 100.00, 90.90, 7.81, 1.29, '2025-12-15', '2025-12-15 09:29:05', '2025-12-15 09:29:05'),
(21, 4, 15, 1, 650.00, 641.56, 8.44, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(22, 4, 15, 2, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(23, 4, 15, 3, 400.00, 394.81, 5.19, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(24, 4, 15, 4, 200.00, 197.40, 2.60, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(25, 4, 15, 5, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(26, 4, 15, 6, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(27, 4, 15, 7, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(28, 4, 15, 8, 2000.00, 1974.03, 25.97, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(29, 4, 15, 9, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(30, 4, 15, 10, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:32:10', '2025-12-15 09:32:10'),
(31, 5, 23, 1, 650.00, 621.74, 28.26, 0.00, '2025-12-15', '2025-12-15 09:33:49', '2025-12-15 09:33:49'),
(32, 5, 23, 2, 100.00, 95.65, 4.35, 0.00, '2025-12-15', '2025-12-15 09:33:49', '2025-12-15 09:33:49'),
(33, 5, 23, 3, 400.00, 382.61, 17.39, 0.00, '2025-12-15', '2025-12-15 09:33:49', '2025-12-15 09:33:49'),
(34, 6, 23, 4, 200.00, 200.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:38:50', '2025-12-15 09:38:50'),
(35, 6, 23, 5, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:38:50', '2025-12-15 09:38:50'),
(36, 6, 23, 6, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:38:50', '2025-12-15 09:38:50'),
(37, 7, 23, 7, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:43:57', '2025-12-15 09:43:57'),
(38, 7, 23, 8, 2000.00, 2000.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:43:57', '2025-12-15 09:43:57'),
(39, 7, 23, 9, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:43:57', '2025-12-15 09:43:57'),
(40, 7, 23, 10, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:43:57', '2025-12-15 09:43:57'),
(41, 8, 28, 1, 650.00, 650.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:45:59', '2025-12-15 09:45:59'),
(42, 8, 28, 2, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:45:59', '2025-12-15 09:45:59'),
(43, 8, 28, 3, 400.00, 400.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:45:59', '2025-12-15 09:45:59'),
(44, 9, 28, 4, 200.00, 200.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:46:24', '2025-12-15 09:46:24'),
(45, 9, 28, 5, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:46:24', '2025-12-15 09:46:24'),
(46, 9, 28, 6, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:46:24', '2025-12-15 09:46:24'),
(47, 10, 28, 7, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:47:31', '2025-12-15 09:47:31'),
(48, 10, 28, 8, 2000.00, 2000.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:47:31', '2025-12-15 09:47:31'),
(49, 10, 28, 9, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:47:31', '2025-12-15 09:47:31'),
(50, 10, 28, 10, 100.00, 100.00, 0.00, 0.00, '2025-12-15', '2025-12-15 09:47:31', '2025-12-15 09:47:31'),
(51, 11, 27, 1, 650.00, 641.56, 8.44, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(52, 11, 27, 2, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(53, 11, 27, 3, 400.00, 394.81, 5.19, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(54, 11, 27, 4, 200.00, 197.40, 2.60, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(55, 11, 27, 5, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(56, 11, 27, 6, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(57, 11, 27, 7, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(58, 11, 27, 8, 2000.00, 1974.03, 25.97, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(59, 11, 27, 9, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54'),
(60, 11, 27, 10, 100.00, 98.70, 1.30, 0.00, '2025-12-15', '2025-12-15 09:50:54', '2025-12-15 09:50:54');

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

--
-- Dumping data for table `fee_structures`
--

INSERT INTO `fee_structures` (`id`, `class_id`, `fee_cat_id`, `amount`, `due_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 650.00, '2026-01-15', '2025-12-15 06:58:56', '2025-12-15 06:58:56'),
(2, 1, 1, 100.00, '2026-01-15', '2025-12-15 08:40:27', '2025-12-15 08:40:27'),
(3, 1, 3, 400.00, '2026-01-15', '2025-12-15 08:40:33', '2025-12-15 08:40:33'),
(4, 1, 4, 200.00, '2026-01-15', '2025-12-15 08:40:38', '2025-12-15 08:40:38'),
(5, 1, 5, 100.00, '2026-01-15', '2025-12-15 08:40:45', '2025-12-15 08:40:45'),
(6, 1, 6, 100.00, '2026-01-15', '2025-12-15 08:40:49', '2025-12-15 08:40:49'),
(7, 1, 7, 100.00, '2026-01-15', '2025-12-15 08:40:54', '2025-12-15 08:40:54'),
(8, 1, 8, 2000.00, '2026-01-15', '2025-12-15 08:40:59', '2025-12-15 08:40:59'),
(9, 1, 9, 100.00, '2026-01-15', '2025-12-15 08:41:06', '2025-12-15 08:41:06'),
(10, 1, 10, 100.00, '2026-01-15', '2025-12-15 08:41:10', '2025-12-15 08:41:10'),
(11, 2, 1, 120.00, '2026-01-15', '2025-12-15 10:00:45', '2025-12-15 10:00:45');

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

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `student_id`, `subject_id`, `exam_id`, `marks_obtained`, `grade`, `gpa`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 3, 19, 1, 50, 'B', 3, 'N/A', '2025-12-15 06:37:16', '2025-12-15 06:37:16');

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
(99, '2014_10_12_000000_create_users_table', 1),
(100, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(101, '2014_10_12_100000_create_password_resets_table', 1),
(102, '2019_08_19_000000_create_failed_jobs_table', 1),
(103, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(104, '2025_09_11_094326_create_teachers_table', 1),
(105, '2025_09_12_060130_create_rooms_table', 1),
(106, '2025_09_12_060131_create_students_table', 1),
(107, '2025_09_13_043441_create_subjects_table', 1),
(108, '2025_09_13_043442_create_attendances_table', 1),
(109, '2025_09_13_085234_create_exams_table', 1),
(110, '2025_09_13_085241_create_marks_table', 1),
(111, '2025_09_16_081917_create_student_subjects_table', 1),
(112, '2025_09_22_185426_create_fee_categories_table', 1),
(113, '2025_09_22_185444_create_fee_structures_table', 1),
(114, '2025_09_22_185453_create_fee_payments_table', 1),
(115, '2025_09_28_183808_create_exam_names_table', 1),
(116, '2025_10_03_153733_create_class_schedules_table', 1),
(117, '2025_11_20_122825_create_notices_table', 1),
(118, '2025_11_22_173329_create_teacher_attendances_table', 1),
(119, '2025_11_23_131009_create_student_daily_routines_table', 1),
(120, '2025_12_07_102826_create_excategories_table', 1),
(121, '2025_12_07_102839_create_exsubcategories_table', 1),
(122, '2025_12_07_102853_create_expenses_table', 1),
(123, '2025_12_08_104245_create_companies_table', 1),
(124, '2025_12_09_125819_create_fee_payment_details_table', 1),
(125, '2025_12_09_125837_create_fee_payment_items_table', 1),
(126, '2025_12_13_144631_create_groups_table', 1);

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
(1, 'Darlene', 'Mayert', '1973-12-28', 'Female', 'B-', 'Christian', 'Bangladeshi', '3440324158960', '01505063154', 'student1@example.com', '$2y$12$gJH2tfKKlvYctqZUXw0/3erTs07wsixj1E8ye.7sEDMGam93KYY1O', '51737 Mayert Coves\r\nNorth Emory, LA 09745-0768', '38131 Schiller Trace Suite 311\r\nEast Reubenburgh, PA 03715', 'ADM-00001', '2004-06-04', 'A', 'Science (Biology / Pre-Medical)', '2025-2026', 'Hintz-Hickle School', 'Joe Gleason', 'Teacher', '01738453894', 'father1@example.com', '6635179983516', '0', 'Krystina Zemlak', 'Housewife', '01645207132', 'mother1@example.com', '8055299691418', '0', 'Mrs. Julie Medhurst', '01495752888', 'guardian1@example.com', '6617563099261', 'Grandparent', 1, 1, 4, '2025-12-14', NULL, 2025000001, 900001, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:04', '2025-12-14 06:05:04', '127.0.0.1', 1, NULL, '2025-12-14 06:05:04', '2025-12-14 06:28:55'),
(2, 'SAMIM', 'Hossain', '1990-11-27', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '8257182050813', '01437300689', 'student2@example.com', '$2y$12$mNzjO0y3Vmba6eDCRTG4P.iZIv1U0rey87kWw14xhPxuQjeM66Swq', '8616 Bechtelar Spur Suite 810\r\nBauchshire, WV 32687-0349', '76378 Howell Port\r\nZenamouth, LA 56754', 'ADM-00002', '2012-02-25', 'C', 'Science', '2025-2026', 'Gaylord-Green School', 'Devonte Gulgowski DDS', 'Businessman', '01684335493', 'father2@example.com', '8980176714822', NULL, 'Gail Ratke', 'Housewife', '01893143359', 'mother2@example.com', '6812434237946', NULL, 'Dr. Maverick Weber', '01710159461', 'guardian2@example.com', '2568982996397', 'Uncle', 1, 1, 5, '2025-12-14', NULL, 2025000002, 900002, 'std-SAMIM-1765694193.jpg', 'std-SAMIM-Devonte Gulgowski DDS-1765694193.jpg', 'std-SAMIM-Gail Ratke-1765694193.jpg', NULL, NULL, '2025-12-14 06:05:04', '2025-12-15 07:23:50', '127.0.0.1', 1, 'gHdvmyPoYS0sDkF2EMGSFtB7F5W4zeqqakbSVfbnRBgO5xlED1rS0fRztfbr', '2025-12-14 06:05:04', '2025-12-15 07:23:50'),
(3, 'Lenore', 'Fadel', '2018-08-15', 'Other', 'AB-', 'Christian', 'Bangladeshi', '2424069605900', '01548251567', 'student3@example.com', '$2y$12$1nva6cKptyhaCqkWWtzJxOESUCHDv/a5/JKlfgLRIfDfzo23e1cVm', '186 Ashley Glens\nKohlershire, AZ 23685-5500', '7535 Keenan Park Suite 882\nPort Danniestad, DE 55180-0099', 'ADM-00003', '1971-11-16', 'C', 'Science', '2025-2026', 'Price, Cruickshank and Kozey School', 'Prof. Abel Wiza', 'Farmer', '01321306396', 'father3@example.com', '7952225983907', NULL, 'Eve Brown', 'Businesswoman', '01607045914', 'mother3@example.com', '9626751383526', NULL, 'Prof. Kayla Mayer', '01935930972', 'guardian3@example.com', '1197890437790', 'Aunt', 1, 1, 1, '2025-12-14', NULL, 2025000003, 900003, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05', '127.0.0.1', 1, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05'),
(4, 'Morris', 'Johnston', '1984-06-01', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '1449095516367', '01555544698', 'student4@example.com', '$2y$12$l4Bx2o3E3lWjn82Wny8fluO9ZZC//JiJGF9nWLpKQ1Y5XMBLgY1YW', '32391 Gislason Squares Apt. 886\nNew Annabellborough, DE 47759-7527', '15005 Ullrich Plains\nTavaresside, NE 86258', 'ADM-00004', '2006-03-30', 'B', 'Arts', '2025-2026', 'Frami-DuBuque School', 'Jameson Dare', 'Farmer', '01858266652', 'father4@example.com', '9638839706969', NULL, 'Prof. Abby Langosh', 'Housewife', '01313062957', 'mother4@example.com', '4488650063190', NULL, 'Trace Runolfsdottir', '01991342717', 'guardian4@example.com', '5807543125606', 'Aunt', 1, 2, 4, '2025-12-14', NULL, 2025000004, 900004, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05', '127.0.0.1', 1, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05'),
(5, 'Hailie', 'Hodkiewicz', '1993-10-30', 'Male', 'O+', 'Hindu', 'Bangladeshi', '4079915639016', '01331306348', 'student5@example.com', '$2y$12$ak5gkQaE7mLGkhJIL2/Iu.1p79Y./0vDm4EJzp227vCoswF0Oeqtq', '11501 Crawford Port\nWest Justus, NY 76036', '6076 Murazik Drives Suite 385\nLake Vickie, KS 77180-0605', 'ADM-00005', '2015-02-21', 'B', 'Commerce', '2025-2026', 'Pacocha-Abbott School', 'Kim DuBuque', 'Doctor', '01362828863', 'father5@example.com', '6927312437085', NULL, 'Hortense Heidenreich', 'Housewife', '01507352976', 'mother5@example.com', '4421778234381', NULL, 'Lulu Bergnaum', '01777411787', 'guardian5@example.com', '4338946499889', 'Grandparent', 1, 1, 2, '2025-12-14', NULL, 2025000005, 900005, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05', '127.0.0.1', 1, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05'),
(6, 'Ron', 'Dibbert', '2011-06-28', 'Male', 'AB-', 'Christian', 'Bangladeshi', '2825796188162', '01476601128', 'student6@example.com', '$2y$12$JnonMGAdG9NwQ3q4wHv6kupoYuHK.oYiqGoaWzOp/OZcdK1P6IZl6', '33000 Kennedi Parks\nSouth Boris, SC 74765', '7522 Ellie Crossroad Suite 085\nHeidimouth, MN 55276', 'ADM-00006', '2000-01-09', 'C', 'Science', '2025-2026', 'Dicki-Satterfield School', 'Richard Littel', 'Teacher', '01394816502', 'father6@example.com', '5946943633663', NULL, 'Annie Muller', 'Nurse', '01904438947', 'mother6@example.com', '7923387295782', NULL, 'Tillman Buckridge', '01723953297', 'guardian6@example.com', '0739787144918', 'Uncle', 1, 1, 3, '2025-12-14', NULL, 2025000006, 900006, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05', '127.0.0.1', 1, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05'),
(7, 'Monserrate', 'Douglas', '2010-07-08', 'Other', 'O+', 'Hindu', 'Bangladeshi', '0709634604007', '01735603787', 'student7@example.com', '$2y$12$6Zc78pqkzyXOy/GQCD.y0ObmF7cVDe/RHNYHz/cLdY4/54S7h2fvy', '785 Kohler Row\nEast Josianne, MD 82964', '504 Maxie Loop\nAdrainville, GA 52480-9930', 'ADM-00007', '1970-10-06', 'C', 'Arts', '2025-2026', 'Green-Carter School', 'Marlon Predovic', 'Engineer', '01560659209', 'father7@example.com', '2559046268991', NULL, 'Rebekah Konopelski', 'Teacher', '01526447094', 'mother7@example.com', '3598276662142', NULL, 'Prof. Rick Dicki', '01309796646', 'guardian7@example.com', '5898723998230', 'Aunt', 1, 2, 2, '2025-12-14', NULL, 2025000007, 900007, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05', '127.0.0.1', 1, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05'),
(8, 'Tommie', 'Koelpin', '1978-10-01', 'Male', 'AB-', 'Other', 'Bangladeshi', '6383785804648', '01696288148', 'student8@example.com', '$2y$12$N.go1vkWHMALVCAcBHEQPuE57CsGP.6HHGt77NtK8TwmRK8qcnhNe', '53954 Michelle Club Apt. 189\nLake Deniston, AL 87771-9571', '49923 Hintz Prairie\nLake Lane, NE 76850', 'ADM-00008', '1986-04-22', 'B', 'Arts', '2025-2026', 'Bailey-Shanahan School', 'Dr. Deshaun Reilly', 'Businessman', '01492071327', 'father8@example.com', '0761500583365', NULL, 'Adrianna Smitham', 'Doctor', '01479210434', 'mother8@example.com', '2474491787187', NULL, 'Jarrett Gleichner', '01818707687', 'guardian8@example.com', '4971501716747', 'Aunt', 1, 3, 2, '2025-12-14', NULL, 2025000008, 900008, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05', '127.0.0.1', 1, NULL, '2025-12-14 06:05:05', '2025-12-14 06:05:05'),
(9, 'Sabryna', 'Berge', '1972-01-13', 'Other', 'AB+', 'Other', 'Bangladeshi', '5189487342914', '01591459878', 'student9@example.com', '$2y$12$PTA/57Tv5YDZ6m460G1E2e1FaKLVCRteTHitNAVE6MhyKtmqroWyq', '75508 Hosea Flat\nHalvorsonmouth, AZ 41973-9135', '5958 Toy Views\nSouth Rowanburgh, MO 46008-1967', 'ADM-00009', '1986-08-31', 'A', 'Arts', '2025-2026', 'Dibbert-Conn School', 'Wilfred Bosco Sr.', 'Teacher', '01407093809', 'father9@example.com', '0983020970894', NULL, 'Marcia Jaskolski', 'Nurse', '01911328114', 'mother9@example.com', '4185609837459', NULL, 'Ethyl Cremin', '01810299582', 'guardian9@example.com', '7325094080188', 'Brother', 1, 3, 4, '2025-12-14', NULL, 2025000009, 900009, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06', '127.0.0.1', 1, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06'),
(10, 'Nyasia', 'Gutkowski', '2018-05-04', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '4948490935180', '01512490858', 'student10@example.com', '$2y$12$aD2fnJFVeXe7CuZF/eiDQuNDTKa0cuXerbYwihxqjRMtzKa0dMrpq', '5372 Carter Cliffs\nPort Lester, TN 93805', '61427 Lehner Brook Suite 055\nDouglasside, WY 08570', 'ADM-00010', '2016-08-17', 'A', 'Arts', '2025-2026', 'Nolan, Bins and Walter School', 'Philip Hagenes', 'Doctor', '01595754423', 'father10@example.com', '5115532049065', NULL, 'Kaylin Mayert', 'Nurse', '01538483636', 'mother10@example.com', '9049764534480', NULL, 'Frederique Mayert', '01888086647', 'guardian10@example.com', '8989716500388', 'Aunt', 1, 2, 3, '2025-12-14', NULL, 2025000010, 900010, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06', '127.0.0.1', 1, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06'),
(11, 'Arielle', 'Gerlach', '2012-04-02', 'Male', 'O+', 'Christian', 'Bangladeshi', '1815860929122', '01618719298', 'student11@example.com', '$2y$12$FN1pWtmcrXrlnepQ3i32Z.9o.jy3C5jzYbzhRVr5l/oJfuGHnyAZa', '21106 Sigmund Drive\nNew Alisaburgh, MI 26651', '8957 Schamberger Courts\nLittelbury, UT 43967-0656', 'ADM-00011', '1988-06-19', 'C', 'Commerce', '2025-2026', 'Collier, Renner and Medhurst School', 'Drake Nikolaus', 'Doctor', '01819925639', 'father11@example.com', '7147008922570', NULL, 'Josianne Prohaska', 'Nurse', '01860240059', 'mother11@example.com', '5247387587139', NULL, 'Prof. Geo Goodwin Jr.', '01712926218', 'guardian11@example.com', '8556133294254', 'Brother', 1, 2, 1, '2025-12-14', NULL, 2025000011, 900011, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06', '127.0.0.1', 1, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06'),
(12, 'Susana', 'Abshire', '1985-05-09', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '2576723419513', '01539881017', 'student12@example.com', '$2y$12$2R69QsY1.GiN1p2bR6sNhekITn8EPr0/7Hh.PJL1NCTERleZFbfIW', '25152 Bahringer Locks Apt. 490\nHagenesbury, TX 39530', '1799 Barton Camp\nWest Sethfort, SC 72630-5606', 'ADM-00012', '2024-12-04', 'B', 'Arts', '2025-2026', 'Balistreri Ltd School', 'Gillian Marvin V', 'Farmer', '01841521769', 'father12@example.com', '1531118337128', NULL, 'Florine Ward', 'Businesswoman', '01358009197', 'mother12@example.com', '6500425585389', NULL, 'Giovanni Will', '01815227356', 'guardian12@example.com', '4348298277059', 'Brother', 1, 2, 5, '2025-12-14', NULL, 2025000012, 900012, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06', '127.0.0.1', 1, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06'),
(13, 'Aubrey', 'Swaniawski', '2009-12-26', 'Female', 'B+', 'Islam', 'Bangladeshi', '6528745209186', '01697328467', 'student13@example.com', '$2y$12$HtWtBBgg17qmTQB6155jE.mrxog4rqFAIOsz3ppZx2jYV1P1bSUIq', '25302 Allie Cape\nEast Toney, AK 77579-0854', '755 Brown Rue\nLake Marcelle, TN 63136', 'ADM-00013', '1996-11-29', 'A', 'Science', '2025-2026', 'Boyer Ltd School', 'Efrain Ankunding', 'Businessman', '01969968212', 'father13@example.com', '2621264359717', NULL, 'Prof. Alejandra Wuckert', 'Businesswoman', '01450434396', 'mother13@example.com', '9812061761359', NULL, 'Brooke McGlynn', '01392868072', 'guardian13@example.com', '0688197622860', 'Sister', 1, 4, 4, '2025-12-14', NULL, 2025000013, 900013, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06', '127.0.0.1', 1, NULL, '2025-12-14 06:05:06', '2025-12-14 06:05:06'),
(14, 'Mario', 'Howe', '2004-06-07', 'Other', 'O+', 'Other', 'Bangladeshi', '5337712038247', '01875798204', 'student14@example.com', '$2y$12$cn2cWucb2Cr1WhNAMAtOeOQIaFQDIMojILTFG11UZ7GAxtdx3jGM.', '7673 Joelle Parkway Apt. 070\nBeaulahtown, NY 22455', '42126 Icie Ferry\nCaterinaside, SD 84945-1227', 'ADM-00014', '1985-01-26', 'A', 'Arts', '2025-2026', 'Cremin, Monahan and Effertz School', 'Prof. Marvin Wolf', 'Farmer', '01659583154', 'father14@example.com', '3877176698035', NULL, 'Layla Hill', 'Businesswoman', '01737469712', 'mother14@example.com', '6165007874471', NULL, 'Cornell Armstrong', '01863786989', 'guardian14@example.com', '3840617779343', 'Grandparent', 1, 3, 5, '2025-12-14', NULL, 2025000014, 900014, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07', '127.0.0.1', 1, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07'),
(15, 'Thad', 'Keeling', '1980-04-17', 'Other', 'O+', 'Christian', 'Bangladeshi', '7355727704123', '01642863388', 'student15@example.com', '$2y$12$hfug80s1LzQwVGqyNJ50mOFxZZSvpAYsTdAZk1csmeGA47422FyHa', '464 Gibson Ramp\nPort Jerrodport, AK 27104', '4696 Makenzie Estate\nSchillerbury, ME 51248', 'ADM-00015', '2000-02-13', 'A', 'Science', '2025-2026', 'Lang Ltd School', 'London Gerhold', 'Engineer', '01984999781', 'father15@example.com', '0477604699001', NULL, 'Gabriella Altenwerth', 'Businesswoman', '01891310072', 'mother15@example.com', '4765649628855', NULL, 'Jadyn Hermann', '01341925275', 'guardian15@example.com', '6822289179957', 'Grandparent', 1, 3, 1, '2025-12-14', NULL, 2025000015, 900015, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07', '127.0.0.1', 1, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07'),
(16, 'Cristal', 'Mosciski', '2025-10-27', 'Male', 'A+', 'Hindu', 'Bangladeshi', '9701560773626', '01439332124', 'student16@example.com', '$2y$12$syEu7/jSHFMUxBiWvJpZR.Bi8lV8.OsOA0w2Qy7F2AthaRrEieG0a', '491 Durgan Avenue\nRomaburgh, LA 33123', '34894 Koelpin Unions\nEast Donniefurt, PA 53568', 'ADM-00016', '2025-03-03', 'B', 'Arts', '2025-2026', 'Murphy Group School', 'Prof. Jameson Lowe', 'Doctor', '01333574164', 'father16@example.com', '7618907050319', NULL, 'Roxanne Daniel', 'Businesswoman', '01501863726', 'mother16@example.com', '5327462795140', NULL, 'Prof. Zackery Koss', '01655957216', 'guardian16@example.com', '5965378092792', 'Grandparent', 1, 4, 2, '2025-12-14', NULL, 2025000016, 900016, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07', '127.0.0.1', 1, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07'),
(17, 'Aliya', 'Block', '1994-05-18', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '4841079408277', '01744158419', 'student17@example.com', '$2y$12$ulmQYa87KDb3BYWux5LSXOgAm1ZL0QUZOEq2DpEzwgFca4dn1CE.y', '355 Gulgowski Stravenue Suite 584\nFlatleyfort, KY 87405-8776', '8455 Brandt Walks Apt. 508\nParkerborough, CA 98843', 'ADM-00017', '1996-07-28', 'A', 'Arts', '2025-2026', 'Bartell-Gutkowski School', 'Parker Volkman IV', 'Farmer', '01427912088', 'father17@example.com', '6162030867877', NULL, 'Claudine Lowe', 'Housewife', '01651515114', 'mother17@example.com', '2132248956423', NULL, 'Nelda Will', '01829865571', 'guardian17@example.com', '9953528947559', 'Aunt', 1, 5, 4, '2025-12-14', NULL, 2025000017, 900017, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07', '127.0.0.1', 1, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07'),
(18, 'Jaclyn', 'Durgan', '1974-10-23', 'Female', 'O-', 'Buddhist', 'Bangladeshi', '8126539313979', '01777374409', 'student18@example.com', '$2y$12$9fX0Xx1PSyuy3UNeEfoJF.IcuPgEAqyGaqp203VXZZ3PSHWATAtuG', '53171 Christina Lakes Apt. 336\nErdmanstad, RI 00596-0691', '2242 Vance Drive\nEast Kellie, ND 25397', 'ADM-00018', '1994-03-15', 'C', 'Arts', '2025-2026', 'Reinger-Hyatt School', 'Thaddeus Eichmann', 'Doctor', '01576578202', 'father18@example.com', '3966159961283', NULL, 'Chanel Jast', 'Businesswoman', '01334921808', 'mother18@example.com', '3754253616064', NULL, 'Dr. Alvis Gaylord', '01990739953', 'guardian18@example.com', '8752730133386', 'Aunt', 1, 6, 4, '2025-12-14', NULL, 2025000018, 900018, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07', '127.0.0.1', 1, NULL, '2025-12-14 06:05:07', '2025-12-14 06:05:07'),
(19, 'Gerda', 'Luettgen', '1988-01-04', 'Female', 'O+', 'Other', 'Bangladeshi', '4004525402647', '01385959069', 'student19@example.com', '$2y$12$sw29J8cCa69s6pBwKdmNRe8fkvN8jXAs9pMu/dlmapdA3zIktNjyG', '59768 Velda Village Apt. 508\nMargotton, NM 86226-9347', '688 Augustine Route Suite 603\nNorth Keelyburgh, DE 53922-2434', 'ADM-00019', '1989-12-25', 'C', 'Commerce', '2025-2026', 'Skiles-Gutkowski School', 'Mr. Daron Bergstrom DDS', 'Teacher', '01988727756', 'father19@example.com', '0656356983360', NULL, 'Katlyn Becker', 'Teacher', '01566386490', 'mother19@example.com', '0661719868399', NULL, 'Savion Parisian', '01696024540', 'guardian19@example.com', '1646847958242', 'Grandparent', 1, 4, 5, '2025-12-14', NULL, 2025000019, 900019, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08', '127.0.0.1', 1, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08'),
(20, 'Nash', 'Rowe', '1982-01-11', 'Male', 'B-', 'Hindu', 'Bangladeshi', '6394513417495', '01347896205', 'student20@example.com', '$2y$12$PikfYeAvUQuAz1DbXLOXJOjZJMSYIlTf7laU./ytqWUZiCmFv19di', '854 Gracie Extensions Apt. 390\nTeaganfort, CT 47600-3985', '62944 Ollie Loop\nWestfort, LA 75165-1417', 'ADM-00020', '2011-07-01', 'B', 'Commerce', '2025-2026', 'Stanton PLC School', 'Dr. Coleman Jast', 'Doctor', '01630107393', 'father20@example.com', '8041310520633', NULL, 'Eve Wehner', 'Nurse', '01572217375', 'mother20@example.com', '3484996075675', NULL, 'Isadore Grimes', '01646969697', 'guardian20@example.com', '6068546223457', 'Brother', 1, 5, 5, '2025-12-14', NULL, 2025000020, 900020, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08', '127.0.0.1', 1, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08'),
(21, 'Jarvis', 'Watsica', '1973-07-22', 'Male', 'O-', 'Other', 'Bangladeshi', '2148157091909', '01792740437', 'student21@example.com', '$2y$12$s.GN./XG2ihzgh.s069PaOs0ZQ1da2lOHMVW/WY7p7ox31HtlhIe.', '3809 Runolfsdottir Isle Apt. 178\nWest Brycefort, IL 08759-6996', '5670 Bosco Walk\nKeeblerland, IN 55968-8890', 'ADM-00021', '2001-05-26', 'A', 'Arts', '2025-2026', 'Walsh-Smith School', 'Zachariah Ferry', 'Doctor', '01593051825', 'father21@example.com', '3507974769132', NULL, 'Bridgette Hand', 'Nurse', '01837584603', 'mother21@example.com', '2864975890684', NULL, 'Ms. Brigitte Lueilwitz I', '01379188841', 'guardian21@example.com', '0165343684526', 'Aunt', 1, 5, 2, '2025-12-14', NULL, 2025000021, 900021, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08', '127.0.0.1', 1, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08'),
(22, 'Velda', 'Keebler', '2000-12-21', 'Other', 'A+', 'Islam', 'Bangladeshi', '2969110989857', '01761907195', 'student22@example.com', '$2y$12$5jKQvuZCKG7l04C/seYiBOZ76EN5KCeLE7OG8HYVU.9lizSFwj/A2', '97076 Theresia Mission Apt. 970\nPort Waino, OK 26694-9739', '424 Terry Shores\nRockymouth, LA 01847', 'ADM-00022', '2024-07-14', 'A', 'Arts', '2025-2026', 'Grant-Schroeder School', 'Brennon Ziemann', 'Teacher', '01943758737', 'father22@example.com', '9341665307190', NULL, 'Estelle Hermann', 'Teacher', '01528471102', 'mother22@example.com', '3408311933283', NULL, 'Louie Jacobi', '01775307377', 'guardian22@example.com', '6585760927470', 'Uncle', 1, 4, 1, '2025-12-14', NULL, 2025000022, 900022, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08', '127.0.0.1', 1, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08'),
(23, 'Adaline', 'Greenholt', '1985-05-22', 'Other', 'B+', 'Hindu', 'Bangladeshi', '5859286710629', '01708322138', 'student23@example.com', '$2y$12$0QfF2wFkx8FxEyAMGpGi2errcIlEJT68J1dVwxJm5SWfSxhM//Am6', '7257 Meggie Lakes\nLake Adella, NH 17733', '568 Hannah Turnpike Suite 440\nLaurettaside, NV 77428-9671', 'ADM-00023', '1988-08-04', 'B', 'Commerce', '2025-2026', 'Hudson PLC School', 'Alphonso Veum', 'Farmer', '01430142706', 'father23@example.com', '4147751682645', NULL, 'Ms. Elda Tremblay II', 'Teacher', '01588560468', 'mother23@example.com', '2245056610996', NULL, 'Rocio Bartell', '01548715928', 'guardian23@example.com', '7571603542828', 'Grandparent', 1, 5, 1, '2025-12-14', NULL, 2025000023, 900023, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08', '127.0.0.1', 1, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08'),
(24, 'Salvador', 'Padberg', '1985-11-28', 'Male', 'AB+', 'Other', 'Bangladeshi', '8899119279658', '01719030759', 'student24@example.com', '$2y$12$VTQWceRUG//FZ0ndEdr.O.SycHgLpwJjhtJD8ol4cBYwdaOBeDUoW', '4856 Richard Course Apt. 423\nTracefurt, PA 75082-9206', '93565 Therese Turnpike\nPort Delphia, WV 30926-6324', 'ADM-00024', '1970-06-10', 'C', 'Arts', '2025-2026', 'Zulauf-Conroy School', 'Cedrick Turcotte II', 'Teacher', '01400708712', 'father24@example.com', '4990302373325', NULL, 'Prof. Sophie Rippin DVM', 'Housewife', '01857025164', 'mother24@example.com', '1515695313860', NULL, 'Janick Schmeler', '01714122971', 'guardian24@example.com', '2230364629083', 'Grandparent', 1, 6, 5, '2025-12-14', NULL, 2025000024, 900024, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08', '127.0.0.1', 1, NULL, '2025-12-14 06:05:08', '2025-12-14 06:05:08'),
(25, 'Mabelle', 'Runte', '1975-02-19', 'Male', 'B-', 'Christian', 'Bangladeshi', '2899570422614', '01533138030', 'student25@example.com', '$2y$12$E.saw3TuAuwLKXzhMaFR4egC84e8Lt5Nkx3pprvd5vQJWfBM2aavW', '31645 Kyle Alley Suite 988\nNew Sigurd, NY 52001-9567', '9633 Kuhic Lights Suite 072\nEast Jonas, AR 87427-6129', 'ADM-00025', '2011-02-15', 'B', 'Arts', '2025-2026', 'Klein LLC School', 'Mr. Carmelo Bernhard', 'Farmer', '01655445229', 'father25@example.com', '3423116671891', NULL, 'Lavinia Littel', 'Teacher', '01470620610', 'mother25@example.com', '0544518219240', NULL, 'Pete Von', '01876814477', 'guardian25@example.com', '9647703385522', 'Sister', 1, 6, 2, '2025-12-14', NULL, 2025000025, 900025, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09', '127.0.0.1', 1, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09'),
(26, 'Jada', 'Osinski', '1985-02-03', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '9578575887434', '01565695043', 'student26@example.com', '$2y$12$/fIpjTUXF0YTBGuyByUkKuKTphAuQb1A3/wBxDyuBUmZJClFSTx4C', '4417 Murray Road Suite 201\nOrtizland, AR 07226', '994 Marcus Dale\nWest Ebbahaven, OH 87427-7893', 'ADM-00026', '1996-10-26', 'A', 'Science', '2025-2026', 'O\'Conner, Huels and Quigley School', 'Kody Zulauf', 'Businessman', '01874367030', 'father26@example.com', '4053780643334', NULL, 'Juanita Wehner', 'Housewife', '01782535284', 'mother26@example.com', '5806167143576', NULL, 'Golden Mraz', '01484299333', 'guardian26@example.com', '6870389287034', 'Aunt', 1, 3, 3, '2025-12-14', NULL, 2025000026, 900026, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09', '127.0.0.1', 1, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09'),
(27, 'Libbie', 'Bergstrom', '2014-11-15', 'Other', 'O-', 'Islam', 'Bangladeshi', '5485103630917', '01718691468', 'student27@example.com', '$2y$12$hK2aC2Zh6uFP0yoccVA37unRqlnbbiXfrRGLZMAOQ1N4O52AwDwsK', '8406 Effertz Throughway\nEast Ottostad, HI 54964-5895', '4503 Hegmann Curve Apt. 517\nGorczanyfurt, DC 21498-0240', 'ADM-00027', '1984-09-27', 'A', 'Commerce', '2025-2026', 'Kemmer Ltd School', 'Dr. Donavon Dietrich PhD', 'Businessman', '01350958435', 'father27@example.com', '5498756604120', NULL, 'Tia Ledner', 'Housewife', '01364089425', 'mother27@example.com', '1100408360946', NULL, 'Mose Towne', '01574889997', 'guardian27@example.com', '0502841367562', 'Grandparent', 1, 6, 1, '2025-12-14', NULL, 2025000027, 900027, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09', '127.0.0.1', 1, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09'),
(28, 'Kathleen', 'Lakin', '1987-05-14', 'Female', 'AB+', 'Buddhist', 'Bangladeshi', '2293713818049', '01806498029', 'student28@example.com', '$2y$12$gxu.cwRQqMO8iRT7/KsN2OxsgZXsbUYCSGCHO.zOEeJ3GmW09rsby', '3118 Jeramie Square Suite 048\nVickieville, DE 77079-5293', '7154 Douglas Land\nSouth Clemens, WI 19543-1106', 'ADM-00028', '1990-08-01', 'C', 'Arts', '2025-2026', 'Ritchie-Breitenberg School', 'Dudley Rutherford', 'Doctor', '01660411351', 'father28@example.com', '9687361415002', NULL, 'Miss Rosalind Gerhold MD', 'Businesswoman', '01754107027', 'mother28@example.com', '1347943501343', NULL, 'Rickie Sauer', '01799194446', 'guardian28@example.com', '2094922308783', 'Brother', 1, 7, 1, '2025-12-14', NULL, 2025000028, 900028, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09', '127.0.0.1', 1, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09'),
(29, 'Waino', 'Murazik', '1981-02-14', 'Other', 'B-', 'Islam', 'Bangladeshi', '1893640401393', '01519978947', 'student29@example.com', '$2y$12$vGf5L9tG5R3f/q2KfXRmL.Y4o.3eBHBIfPEV.2w6FuT8jv4.EZkki', '673 Rosina Mills Suite 735\nIsaihaven, CO 50538-5169', '179 Lowe Place Suite 704\nMeghanside, AZ 64538', 'ADM-00029', '1998-04-04', 'C', 'Science', '2025-2026', 'Rogahn Inc School', 'Marcelo Eichmann', 'Engineer', '01799693118', 'father29@example.com', '4426132743752', NULL, 'Ebba Schaefer MD', 'Nurse', '01848967535', 'mother29@example.com', '9588087470474', NULL, 'Dayne Hauck', '01960042561', 'guardian29@example.com', '6225611621024', 'Brother', 1, 7, 5, '2025-12-14', NULL, 2025000029, 900029, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09', '127.0.0.1', 1, NULL, '2025-12-14 06:05:09', '2025-12-14 06:05:09'),
(30, 'Lila', 'Ullrich', '2009-05-16', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '5097201794072', '01836498760', 'student30@example.com', '$2y$12$X13Eyg8YUNDZu0TnxR27jewFnUOildZbG3vL2k/aVDStgUyrQIXv2', '248 Shields Court Suite 145\nNorth Gudrun, DE 48342-5264', '519 Waelchi Via Suite 890\nHerzogburgh, DC 47692', 'ADM-00030', '2017-06-01', 'B', 'Commerce', '2025-2026', 'Weimann-Huel School', 'Roman Quigley', 'Businessman', '01605713083', 'father30@example.com', '7926239690191', NULL, 'Miss Marquise Bauch IV', 'Nurse', '01589720653', 'mother30@example.com', '9065498914361', NULL, 'Eleanore Yost', '01774326583', 'guardian30@example.com', '0197425703124', 'Aunt', 1, 7, 4, '2025-12-14', NULL, 2025000030, 900030, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10', '127.0.0.1', 1, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10'),
(31, 'Mable', 'Schiller', '1976-03-24', 'Female', 'B-', 'Islam', 'Bangladeshi', '6212628886285', '01614934300', 'student31@example.com', '$2y$12$Tpo8iStUnsYW6K0Z/fQ/NuxJmMNA9sc7nfPwC21wM2O1zRvmIE99m', '24904 Rowe Throughway Suite 412\nNew Marjorieland, LA 65464-3804', '685 Aletha Forge Apt. 298\nNew Moriahstad, MI 41347-3172', 'ADM-00031', '1989-03-26', 'B', 'Science', '2025-2026', 'Hand Group School', 'Dr. Cielo Reichert PhD', 'Doctor', '01849206029', 'father31@example.com', '4062842890565', NULL, 'Prudence Johnson DDS', 'Teacher', '01894770794', 'mother31@example.com', '5000191287873', NULL, 'Miss Dariana McLaughlin Jr.', '01383912427', 'guardian31@example.com', '3084843814694', 'Brother', 1, 8, 4, '2025-12-14', NULL, 2025000031, 900031, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10', '127.0.0.1', 1, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10'),
(32, 'Albin', 'Fritsch', '1999-12-05', 'Male', 'B+', 'Christian', 'Bangladeshi', '3275199088406', '01405595792', 'student32@example.com', '$2y$12$3q9rj5Q8Wm8Ra45690YtSOj0fIguwXTcEc5Zmi3iuc6CcBcxmMGK6', '69313 Conrad Valley Suite 249\nPort Zackery, VT 67187-1137', '73285 Metz Inlet Apt. 649\nGloverstad, NH 62945-2747', 'ADM-00032', '1971-02-25', 'C', 'Arts', '2025-2026', 'Cummerata-VonRueden School', 'Verner Cormier I', 'Businessman', '01523574982', 'father32@example.com', '1364922480542', NULL, 'Dr. Letitia Cummings', 'Nurse', '01822332542', 'mother32@example.com', '6657480156070', NULL, 'Dr. Jude Harvey Sr.', '01820004697', 'guardian32@example.com', '9519046498617', 'Uncle', 1, 8, 1, '2025-12-14', NULL, 2025000032, 900032, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10', '127.0.0.1', 1, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10'),
(33, 'Corene', 'Bayer', '1970-01-29', 'Male', 'AB-', 'Christian', 'Bangladeshi', '2834884522241', '01941632519', 'student33@example.com', '$2y$12$GrXlUheA5DsTRNdhiIHX7eCdD42a0AT4ok.a1EAQDCP81JajuXv7i', '2460 Predovic Street Apt. 391\nPort Luz, IA 74153-5523', '7064 Alta Plains Suite 069\nHoppeside, OH 53000', 'ADM-00033', '2006-09-15', 'C', 'Commerce', '2025-2026', 'Fay-Rippin School', 'Dr. Jamarcus Klein', 'Teacher', '01992644469', 'father33@example.com', '1786722358143', NULL, 'Berniece Mueller', 'Nurse', '01443935224', 'mother33@example.com', '2339708930627', NULL, 'Mr. Brady Barrows I', '01954918674', 'guardian33@example.com', '7692421021315', 'Grandparent', 1, 4, 3, '2025-12-14', NULL, 2025000033, 900033, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10', '127.0.0.1', 1, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10'),
(34, 'Marlee', 'Wilderman', '2013-09-10', 'Female', 'B-', 'Islam', 'Bangladeshi', '5675250139913', '01344904671', 'student34@example.com', '$2y$12$auNFi56AMBe5UW3Hih8sKOCFd5gHyK9cDTRG2/CyYDuu5LRx.beT6', '8266 Maggio Bypass Apt. 826\nNorth Amy, AR 14215', '94123 Stroman Junction Apt. 956\nFraneckiborough, NJ 98718-3443', 'ADM-00034', '1979-07-21', 'B', 'Commerce', '2025-2026', 'Witting, Breitenberg and Towne School', 'Walton Monahan', 'Doctor', '01656584957', 'father34@example.com', '5640226283336', NULL, 'Gladys Murray', 'Doctor', '01381245040', 'mother34@example.com', '4310375073033', NULL, 'Weston Reichert PhD', '01403092692', 'guardian34@example.com', '4328567026609', 'Grandparent', 1, 9, 1, '2025-12-14', NULL, 2025000034, 900034, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10', '127.0.0.1', 1, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10'),
(35, 'Imani', 'Hyatt', '1991-03-07', 'Male', 'A-', 'Hindu', 'Bangladeshi', '8406222509711', '01463231751', 'student35@example.com', '$2y$12$Z2p6hwEo3UwlWxwf1wvz3Opxr7XEpotSZv7alkoonG7nIhrTHgxkW', '2646 Claudie Groves\nGladyschester, FL 54324', '98074 Stephan Flat\nSchambergerview, NY 74199-5724', 'ADM-00035', '2025-03-17', 'C', 'Arts', '2025-2026', 'Torp, Cormier and Grady School', 'Jamarcus Becker', 'Engineer', '01532171554', 'father35@example.com', '2662928338529', NULL, 'Heaven McLaughlin', 'Doctor', '01827975551', 'mother35@example.com', '4801080519682', NULL, 'Luna Murray', '01834996451', 'guardian35@example.com', '9706521944570', 'Uncle', 1, 5, 3, '2025-12-14', NULL, 2025000035, 900035, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10', '127.0.0.1', 1, NULL, '2025-12-14 06:05:10', '2025-12-14 06:05:10'),
(36, 'Keshaun', 'Kirlin', '2024-10-29', 'Other', 'A-', 'Christian', 'Bangladeshi', '8104444704242', '01610329098', 'student36@example.com', '$2y$12$VLDkJe6f.TR4Q3kX7q9uredse655ef4SERlbH7degG6HqtV7QmWe6', '60035 Ziemann Tunnel Suite 023\nMcGlynntown, MA 48370-8452', '6331 Huel Mission Apt. 928\nEast Colinfort, MI 06714-9930', 'ADM-00036', '1977-01-30', 'B', 'Science', '2025-2026', 'Steuber-Armstrong School', 'Ambrose Rippin', 'Farmer', '01549957825', 'father36@example.com', '7843328152023', NULL, 'Veda Huel', 'Teacher', '01451460557', 'mother36@example.com', '7825868923900', NULL, 'Morris Padberg', '01781791920', 'guardian36@example.com', '7682616278990', 'Uncle', 1, 6, 3, '2025-12-14', NULL, 2025000036, 900036, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11', '127.0.0.1', 1, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11'),
(37, 'Keyshawn', 'Rutherford', '1983-07-02', 'Male', 'O-', 'Hindu', 'Bangladeshi', '9758515530304', '01323458634', 'student37@example.com', '$2y$12$op4crcEGeSzkUNejh/8.hOkld.3GW573AncdnPTr/YJJFI2RTHBa.', '3106 Buckridge Passage\nPort Rhianna, MT 00610', '38805 Tillman Oval Apt. 584\nSchaeferside, VA 81042', 'ADM-00037', '2006-10-30', 'A', 'Commerce', '2025-2026', 'Harber-Weber School', 'Maximillian Klein', 'Doctor', '01510865161', 'father37@example.com', '7173605866337', NULL, 'Mrs. Maximillia Watsica', 'Housewife', '01354597208', 'mother37@example.com', '8715798820668', NULL, 'Prof. Demetrius Keebler V', '01579160998', 'guardian37@example.com', '0419676826163', 'Uncle', 1, 8, 5, '2025-12-14', NULL, 2025000037, 900037, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11', '127.0.0.1', 1, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11'),
(38, 'Christine', 'Lebsack', '1980-09-12', 'Other', 'B-', 'Other', 'Bangladeshi', '0518176807766', '01327425089', 'student38@example.com', '$2y$12$bMvnl8PY/T6.WBYMcIIdw.PXg6itqMjg5t5mLmijBa0ghj/wxgTfq', '31484 Adriel Island\nMedhurstmouth, VA 02112', '486 Abigayle Walks\nPort Coy, VT 60560-2990', 'ADM-00038', '2005-05-27', 'A', 'Science', '2025-2026', 'Koelpin, Stracke and Simonis School', 'Dimitri Rowe', 'Teacher', '01422584992', 'father38@example.com', '1218428246289', NULL, 'Dr. Susan Beahan', 'Nurse', '01684897321', 'mother38@example.com', '6803528160103', NULL, 'Everardo Swift', '01603508453', 'guardian38@example.com', '5606179180158', 'Grandparent', 1, 9, 4, '2025-12-14', NULL, 2025000038, 900038, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11', '127.0.0.1', 1, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11'),
(39, 'Jamison', 'Gulgowski', '2010-07-20', 'Other', 'A-', 'Other', 'Bangladeshi', '3951078488523', '01351120417', 'student39@example.com', '$2y$12$TZWoSuGHbGa7IIz8wjs/geBc6MyvSfaw9k0PTRccI5pg5BheJtVnC', '913 Veum Tunnel\nHermanside, MI 69467-7462', '2148 Farrell Hollow Suite 828\nAlexandreachester, MO 07779-4640', 'ADM-00039', '2011-09-05', 'C', 'Arts', '2025-2026', 'Skiles, Wehner and Koelpin School', 'Mr. Makenna Price Jr.', 'Teacher', '01407796205', 'father39@example.com', '2916776840134', NULL, 'Sydnie Marks Sr.', 'Nurse', '01876251451', 'mother39@example.com', '9465488304432', NULL, 'Julius Gusikowski', '01902889001', 'guardian39@example.com', '3674247413999', 'Aunt', 1, 7, 2, '2025-12-14', NULL, 2025000039, 900039, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11', '127.0.0.1', 1, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11'),
(40, 'Toney', 'Senger', '1999-06-06', 'Male', 'A-', 'Christian', 'Bangladeshi', '1157472617029', '01478844536', 'student40@example.com', '$2y$12$vYpAz4b9n2W3df/ukZeImuMzdxXCkLLgKPmB72/C2MOufksNjTQvC', '37728 Spencer Rest\nEmeliafurt, ME 83658', '54334 Dooley Mountains\nWest Benstad, TN 22963', 'ADM-00040', '2021-01-08', 'B', 'Commerce', '2025-2026', 'Kuhic PLC School', 'Charley Abbott IV', 'Teacher', '01980083938', 'father40@example.com', '8258489082329', NULL, 'Audrey Volkman', 'Teacher', '01352066149', 'mother40@example.com', '2556619391603', NULL, 'Ona Zieme', '01312481909', 'guardian40@example.com', '3871392357120', 'Uncle', 1, 10, 1, '2025-12-14', NULL, 2025000040, 900040, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11', '127.0.0.1', 1, NULL, '2025-12-14 06:05:11', '2025-12-14 06:05:11'),
(41, 'Sierra', 'Will', '1990-03-29', 'Female', 'AB+', 'Other', 'Bangladeshi', '7262485454360', '01864793580', 'student41@example.com', '$2y$12$J4hCH0p5sjKU68vOY7/ElOjgf3Yn5WryeBp1dHM1HmQh07dZMK6Bu', '5408 Runolfsson Road Apt. 780\nGreenview, MS 33081-1542', '2769 Jerde Junctions\nPort Katherinechester, AR 98177', 'ADM-00041', '2006-12-10', 'B', 'Science', '2025-2026', 'Emmerich LLC School', 'Gianni Waters', 'Farmer', '01424864954', 'father41@example.com', '2484223701459', NULL, 'Britney Goyette', 'Teacher', '01958348856', 'mother41@example.com', '7593084640378', NULL, 'Kathryn Carroll', '01889512497', 'guardian41@example.com', '0826056983406', 'Aunt', 1, 7, 3, '2025-12-14', NULL, 2025000041, 900041, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12', '127.0.0.1', 1, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12'),
(42, 'Roman', 'Adams', '1976-12-17', 'Other', 'A-', 'Hindu', 'Bangladeshi', '7206167154695', '01717228349', 'student42@example.com', '$2y$12$UIyQuSI22WOskdRuqrQgBuMehL5KnJhmZkcjwCT8FVegoRHl1qWoe', '5617 Zboncak Lakes\nFilomenafurt, WV 22874', '51924 Crooks Light\nLake Samaraside, TN 88914-8474', 'ADM-00042', '1990-06-03', 'C', 'Science', '2025-2026', 'Lebsack, Bahringer and Lind School', 'Denis Durgan', 'Businessman', '01787141473', 'father42@example.com', '0270006566092', NULL, 'Susanna Hirthe', 'Doctor', '01472532121', 'mother42@example.com', '4201661078648', NULL, 'Dr. Leopoldo Runolfsdottir', '01395855415', 'guardian42@example.com', '7122976309982', 'Uncle', 1, 10, 4, '2025-12-14', NULL, 2025000042, 900042, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12', '127.0.0.1', 1, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12'),
(43, 'Aglae', 'Lowe', '1987-09-02', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '4400709347813', '01388876281', 'student43@example.com', '$2y$12$vgp3KgE2wMxf9nFzopErqeKiGw/Gor8mVMfRYqfS2Ugz06qO84m2G', '994 Wuckert Tunnel\nO\'Konberg, FL 64612', '15687 Schoen Station\nMontychester, MO 97079-5154', 'ADM-00043', '2017-03-09', 'A', 'Science', '2025-2026', 'Keeling and Sons School', 'Sydney Welch Sr.', 'Businessman', '01427188209', 'father43@example.com', '8664730450423', NULL, 'Princess Smitham II', 'Doctor', '01995760991', 'mother43@example.com', '9577132415686', NULL, 'Noe Parisian', '01597866293', 'guardian43@example.com', '5177545339246', 'Brother', 1, 11, 1, '2025-12-14', NULL, 2025000043, 900043, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12', '127.0.0.1', 1, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12'),
(44, 'Darion', 'Greenfelder', '2023-08-28', 'Other', 'AB+', 'Other', 'Bangladeshi', '9190852935004', '01819415759', 'student44@example.com', '$2y$12$90ysKwgapU10.f17AcYlleErKnl.zRrmYQVhdxWC.dB8WNJG2afBG', '6600 Gloria Corners Suite 999\nBeattyton, TN 55213-6207', '71062 Rudy Light\nBergeview, TX 78446', 'ADM-00044', '1972-06-04', 'B', 'Science', '2025-2026', 'Lueilwitz-Wilkinson School', 'Orion Armstrong', 'Farmer', '01848195410', 'father44@example.com', '0143431584507', NULL, 'Carrie Towne', 'Nurse', '01513269650', 'mother44@example.com', '8917383637491', NULL, 'Alvah Conn', '01651885496', 'guardian44@example.com', '8251451720646', 'Brother', 1, 12, 1, '2025-12-14', NULL, 2025000044, 900044, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12', '127.0.0.1', 1, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12'),
(45, 'Corbin', 'Hackett', '1972-04-14', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '7080628354168', '01585594603', 'student45@example.com', '$2y$12$ehrOs5Zv6fxUdKlP18UHdu6fF6d3SStIIuxm4aktsbrqh/Zasaymi', '258 Kasey Meadow Suite 454\nHegmannchester, WA 29848', '309 Gail Dam Suite 331\nJayceberg, SC 55742-9970', 'ADM-00045', '1985-10-21', 'C', 'Science', '2025-2026', 'Daugherty Inc School', 'Bennie Legros III', 'Doctor', '01979765575', 'father45@example.com', '4159170286982', NULL, 'Amber Marks DVM', 'Teacher', '01347856134', 'mother45@example.com', '0807326629054', NULL, 'Ms. Vivienne Ondricka', '01906062578', 'guardian45@example.com', '8482975716522', 'Aunt', 1, 13, 1, '2025-12-14', NULL, 2025000045, 900045, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12', '127.0.0.1', 1, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12'),
(46, 'Jessyca', 'Hagenes', '1977-03-26', 'Male', 'B+', 'Other', 'Bangladeshi', '8646035032142', '01975328972', 'student46@example.com', '$2y$12$soq4dD92lGZL4Xo56/43I.XMOpE9Gv6jAZ2ikC9nc5gvqtMycQgPu', '775 Meghan Corners\nEast Carolanneborough, ND 70977-6066', '9918 Gage Rest\nWest Kevintown, NJ 33673', 'ADM-00046', '1985-12-19', 'C', 'Commerce', '2025-2026', 'Labadie and Sons School', 'Prof. Reinhold Jacobson', 'Engineer', '01396091330', 'father46@example.com', '7032569689134', NULL, 'Danika Bahringer', 'Nurse', '01718726225', 'mother46@example.com', '4822940000614', NULL, 'Katlyn Lehner', '01572709223', 'guardian46@example.com', '1578902164175', 'Grandparent', 1, 14, 1, '2025-12-14', NULL, 2025000046, 900046, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12', '127.0.0.1', 1, NULL, '2025-12-14 06:05:12', '2025-12-14 06:05:12'),
(47, 'Janiya', 'Jones', '2023-01-15', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '8496362056873', '01919076230', 'student47@example.com', '$2y$12$2Vn5B3ZM2wA9flsQRDDsg.QY6KH263YPE4BXf4LQ56KtZhWfiojWS', '393 Marquardt Stravenue\nEast Shaina, WI 13455', '5205 Wintheiser Valleys Suite 741\nWest Eulaliafort, TN 56601', 'ADM-00047', '2012-03-28', 'B', 'Science', '2025-2026', 'Lockman, Stroman and Keeling School', 'Dave Considine', 'Engineer', '01965522217', 'father47@example.com', '7008295468436', NULL, 'Prof. Hellen Johnston', 'Doctor', '01938294682', 'mother47@example.com', '2368206753954', NULL, 'Madyson Lubowitz', '01472061026', 'guardian47@example.com', '6952266357251', 'Uncle', 1, 8, 3, '2025-12-14', NULL, 2025000047, 900047, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13', '127.0.0.1', 1, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13'),
(48, 'Beulah', 'Collins', '2004-07-18', 'Other', 'B-', 'Hindu', 'Bangladeshi', '3906505951935', '01993506142', 'student48@example.com', '$2y$12$dZFVu37xwITLhz8xvG.kGOY1wSvlwinNGmYRC.dGIpiZ746GyKV.O', '9386 Max Trail Apt. 408\nEast Osbaldoside, WA 41770-5604', '4340 Pagac Via Suite 797\nBeierborough, PA 32834', 'ADM-00048', '1989-04-21', 'B', 'Science', '2025-2026', 'Hansen, Daugherty and Ziemann School', 'Erick Ruecker', 'Teacher', '01817658977', 'father48@example.com', '4223636056659', NULL, 'Pascale Moore DDS', 'Businesswoman', '01923813864', 'mother48@example.com', '3429850069893', NULL, 'Marcus Lehner III', '01718725117', 'guardian48@example.com', '3484443521001', 'Aunt', 1, 11, 4, '2025-12-14', NULL, 2025000048, 900048, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13', '127.0.0.1', 1, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13'),
(49, 'Alexa', 'Brown', '2019-05-25', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '2318751047844', '01569612433', 'student49@example.com', '$2y$12$ER2A16vcuO5dRA0oiY5HKOpn12DqwvD/evwWVpLtE1u6OfNDdy3Da', '3638 Mraz Cliff Suite 161\nSouth Leann, AZ 92003-9964', '911 Oswald Streets Apt. 273\nCollinsville, KS 61801-5218', 'ADM-00049', '1996-05-09', 'B', 'Science', '2025-2026', 'Lehner, Beahan and Sauer School', 'Maximillian Weber', 'Farmer', '01374601508', 'father49@example.com', '7243126842740', NULL, 'Anna Lowe', 'Businesswoman', '01752028130', 'mother49@example.com', '1355011097245', NULL, 'Ms. Madge Rosenbaum', '01309933165', 'guardian49@example.com', '4256174456490', 'Uncle', 1, 9, 3, '2025-12-14', NULL, 2025000049, 900049, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13', '127.0.0.1', 1, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13'),
(50, 'Leonard', 'Kling', '1977-08-22', 'Male', 'A+', 'Hindu', 'Bangladeshi', '8223277764266', '01362049799', 'student50@example.com', '$2y$12$x76i64YDVYQvDJQdi/j.xO5vayb2/iamTN7Ad12OC75k9hjaPRMkK', '81299 Breana Knolls Suite 794\nGorczanyshire, CA 17040', '872 Wisozk Cliffs Apt. 574\nNorth Robynberg, OK 63799', 'ADM-00050', '2018-07-28', 'B', 'Science', '2025-2026', 'Gorczany Ltd School', 'Erin Howe', 'Doctor', '01329181114', 'father50@example.com', '2884359883967', NULL, 'Ms. Natasha Dicki', 'Teacher', '01396705101', 'mother50@example.com', '2729719781630', NULL, 'Dr. Horace Prosacco III', '01827763492', 'guardian50@example.com', '9037612599195', 'Sister', 1, 15, 1, '2025-12-14', NULL, 2025000050, 900050, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13', '127.0.0.1', 1, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13'),
(51, 'Jaleel', 'Bartoletti', '1970-02-28', 'Other', 'A-', 'Hindu', 'Bangladeshi', '2734354765450', '01822755995', 'student51@example.com', '$2y$12$l9pPHxTLWRnr.4xSdm6pyu8tDJJVhJLw1/hdFn20a6vTAjmQOnf2O', '68144 Braun Corner Apt. 245\nIsaiahtown, MN 32184-8956', '988 Herman Center Suite 558\nLaurynberg, ME 72931-5633', 'ADM-00051', '2003-06-20', 'A', 'Arts', '2025-2026', 'Walter Inc School', 'Dr. Lamar Zboncak I', 'Teacher', '01687333659', 'father51@example.com', '2522338077167', NULL, 'Prof. Aimee Toy Sr.', 'Teacher', '01351398430', 'mother51@example.com', '0054117674073', NULL, 'Luisa Feil PhD', '01306951198', 'guardian51@example.com', '9515693760483', 'Sister', 1, 8, 2, '2025-12-14', NULL, 2025000051, 900051, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13', '127.0.0.1', 1, NULL, '2025-12-14 06:05:13', '2025-12-14 06:05:13'),
(52, 'Ernestina', 'Krajcik', '2012-11-22', 'Female', 'A+', 'Christian', 'Bangladeshi', '9493885183937', '01724144601', 'student52@example.com', '$2y$12$mlUYcaepUkmHYAAsyW9JuO4Mix2Bf/iEamn72cVYiYXgqs7AfDDfy', '3087 Smith Lane\nSabinachester, MS 85153', '1552 Walsh Way Apt. 849\nMullerhaven, IN 27579', 'ADM-00052', '1983-01-06', 'B', 'Commerce', '2025-2026', 'Erdman, Shanahan and Homenick School', 'Walker Mills', 'Doctor', '01369117150', 'father52@example.com', '3811996836705', NULL, 'Mrs. Christa Wisoky', 'Doctor', '01995988309', 'mother52@example.com', '7079839258272', NULL, 'Jett Bernhard', '01946100913', 'guardian52@example.com', '6837015017445', 'Aunt', 1, 9, 2, '2025-12-14', NULL, 2025000052, 900052, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14', '127.0.0.1', 1, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14'),
(53, 'Natalia', 'Pfeffer', '2008-03-11', 'Other', 'A-', 'Hindu', 'Bangladeshi', '4453083436200', '01569337611', 'student53@example.com', '$2y$12$aPtZbTbuab4jv9VTipsxA.ytZ41j/p0gT0/6V16AeNAKHD2Me058y', '856 Smith Underpass Apt. 101\nJakubowskiland, KY 27452-4019', '108 Isaias Vista Apt. 033\nNorth Liliana, CO 60420-8114', 'ADM-00053', '1975-11-06', 'C', 'Science', '2025-2026', 'Kerluke, Hudson and Larson School', 'Salvador Haley', 'Teacher', '01367238493', 'father53@example.com', '9453746934728', NULL, 'Jannie Padberg', 'Nurse', '01937816167', 'mother53@example.com', '3819195246791', NULL, 'Dr. Jeffery Wolf Jr.', '01813740172', 'guardian53@example.com', '0974177369635', 'Uncle', 1, 9, 5, '2025-12-14', NULL, 2025000053, 900053, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14', '127.0.0.1', 1, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14'),
(54, 'Lucie', 'Kuhic', '2020-09-25', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '3276490533497', '01993178564', 'student54@example.com', '$2y$12$I1aaPhngfKLphwkfq9O4UOPxUUJ/7E6qvoy5yDs/LfeVEAvTs1k7u', '26939 O\'Keefe Path\nLake Toyfurt, WI 52634', '11564 Fisher Forks Apt. 449\nNew Luisafort, WA 33608-6618', 'ADM-00054', '1996-11-01', 'C', 'Science', '2025-2026', 'Leuschke, Weissnat and Lebsack School', 'Mateo Marquardt', 'Engineer', '01513505027', 'father54@example.com', '6513197489976', NULL, 'Sincere Littel', 'Teacher', '01880316650', 'mother54@example.com', '4553788138808', NULL, 'Margret Cummerata Sr.', '01968904967', 'guardian54@example.com', '2158800601126', 'Sister', 1, 10, 3, '2025-12-14', NULL, 2025000054, 900054, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14', '127.0.0.1', 1, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14'),
(55, 'Christopher', 'Bradtke', '1996-10-14', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '4000804700161', '01443864666', 'student55@example.com', '$2y$12$CmbVNozB.dTdZgeyYD6CsuUkjnvawe2FmDyjUqDT2o0QAXwMGYYPC', '1181 Sammie Lodge Apt. 051\nLake Jada, UT 33411-8987', '45052 Carolyn Heights Suite 255\nLake Chanel, MI 30979', 'ADM-00055', '1980-10-30', 'C', 'Science', '2025-2026', 'Casper Inc School', 'Noah Beatty', 'Businessman', '01369711322', 'father55@example.com', '0474723690963', NULL, 'Ora Davis', 'Teacher', '01461810091', 'mother55@example.com', '4865726597204', NULL, 'Mr. Sage Waters', '01365453070', 'guardian55@example.com', '3502091804280', 'Uncle', 1, 10, 2, '2025-12-14', NULL, 2025000055, 900055, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14', '127.0.0.1', 1, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14'),
(56, 'Orval', 'Bosco', '1990-04-18', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '3254869335322', '01454857261', 'student56@example.com', '$2y$12$FyIb09DdYcYHGMQvsVgeauEHgOZIAkHRknptFIoguzpIo/EtkfA0G', '897 Zechariah Ridges\nMooreburgh, GA 74221-8040', '763 Kavon Harbor Apt. 589\nVonRuedenborough, RI 09206', 'ADM-00056', '2008-07-18', 'A', 'Arts', '2025-2026', 'Johnson, D\'Amore and Haley School', 'Marlin Bernier Sr.', 'Engineer', '01400434453', 'father56@example.com', '3485625289189', NULL, 'Nora Bradtke', 'Businesswoman', '01805296867', 'mother56@example.com', '3474476857309', NULL, 'Francesca Green', '01761392297', 'guardian56@example.com', '5567942964695', 'Aunt', 1, 11, 3, '2025-12-14', NULL, 2025000056, 900056, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14', '127.0.0.1', 1, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(57, 'Celia', 'Kautzer', '1974-11-24', 'Female', 'AB+', 'Other', 'Bangladeshi', '8221368394904', '01926084385', 'student57@example.com', '$2y$12$zhtzGMkmDygdJoT9qc6PO.vkt.z8LHx5KzRzFXfYtuBZUFAcHWbFq', '830 Grace Field\nPort Burleyfort, VT 95163-3339', '8799 Reed Squares Apt. 678\nEast Dillanstad, OK 65832-5235', 'ADM-00057', '1984-12-03', 'C', 'Commerce', '2025-2026', 'Schoen, Mraz and Quitzon School', 'Brent Waters II', 'Teacher', '01669806023', 'father57@example.com', '2657981613787', NULL, 'Miss Heaven Sipes V', 'Teacher', '01880410486', 'mother57@example.com', '4382143729884', NULL, 'Prof. Maddison Strosin', '01830694561', 'guardian57@example.com', '7467071014367', 'Aunt', 1, 12, 4, '2025-12-14', NULL, 2025000057, 900057, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14', '127.0.0.1', 1, NULL, '2025-12-14 06:05:14', '2025-12-14 06:05:14'),
(58, 'Eldora', 'Morar', '2020-01-09', 'Male', 'A-', 'Islam', 'Bangladeshi', '9600308517167', '01787652098', 'student58@example.com', '$2y$12$QpqcCQzgbELXyt9zkI7S/uWCgmbsGFlkFI.sMNTTi4tx.hmsl.fwi', '215 West Fields\nLucastown, HI 76352', '8526 Leannon Forks Apt. 360\nWest Katharinashire, NJ 32681-9593', 'ADM-00058', '1973-03-06', 'A', 'Commerce', '2025-2026', 'Stark Ltd School', 'Eugene Lubowitz', 'Engineer', '01974150048', 'father58@example.com', '1039449100053', NULL, 'Colleen Skiles', 'Teacher', '01313524121', 'mother58@example.com', '9717458285731', NULL, 'Lafayette Little', '01384482801', 'guardian58@example.com', '6919923301261', 'Grandparent', 1, 11, 2, '2025-12-14', NULL, 2025000058, 900058, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15', '127.0.0.1', 1, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15'),
(59, 'Rubye', 'Krajcik', '1977-08-11', 'Other', 'B+', 'Christian', 'Bangladeshi', '8868340662379', '01809229485', 'student59@example.com', '$2y$12$qXpa8lYiHvsbSfjXqmHSsOV9pFr71x12OYum9TswEVST7BuyBviyK', '588 Jovan Lights Apt. 290\nWest Albert, AK 50714', '980 Prohaska Freeway Apt. 092\nJuvenalbury, OK 85841', 'ADM-00059', '1985-09-21', 'B', 'Commerce', '2025-2026', 'Mayert-Weissnat School', 'Mr. Shawn Hauck', 'Doctor', '01972089432', 'father59@example.com', '0023059620568', NULL, 'Esmeralda Orn Sr.', 'Businesswoman', '01553347182', 'mother59@example.com', '6689393021858', NULL, 'Ford Parisian', '01316847422', 'guardian59@example.com', '1235262096820', 'Grandparent', 1, 16, 1, '2025-12-14', NULL, 2025000059, 900059, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15', '127.0.0.1', 1, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15'),
(60, 'Ernesto', 'Mante', '2010-05-07', 'Male', 'A-', 'Hindu', 'Bangladeshi', '9320163966171', '01800897869', 'student60@example.com', '$2y$12$9khi6FMwR/WECl7m0hyogu6leGoMNpOjMhZqD6.bIUnt9C2l31tPq', '2671 Mertz Spur\nFletafurt, NH 87689', '129 Donnelly Spring\nLake Brianneville, MA 30116', 'ADM-00060', '2004-02-25', 'B', 'Science', '2025-2026', 'Smitham and Sons School', 'Garrick Rohan', 'Businessman', '01351644212', 'father60@example.com', '1390263547198', NULL, 'Kassandra Buckridge', 'Doctor', '01856441358', 'mother60@example.com', '3096769642814', NULL, 'Miss Ophelia Blick', '01983971854', 'guardian60@example.com', '6430513990500', 'Sister', 1, 12, 3, '2025-12-14', NULL, 2025000060, 900060, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15', '127.0.0.1', 1, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15'),
(61, 'Rhea', 'Kuvalis', '2002-04-17', 'Female', 'AB+', 'Christian', 'Bangladeshi', '8095280515352', '01569373421', 'student61@example.com', '$2y$12$CrczZ6TKD28Eb4zesEV1S.OIkPyNE90USNNVv2amGOOkRgkiNhc8u', '13911 Raoul Route\nNorth Clint, GA 38810-1573', '32352 O\'Kon Causeway\nLululand, LA 55707', 'ADM-00061', '1984-04-15', 'C', 'Science', '2025-2026', 'Mertz-Schiller School', 'Connor Dickens', 'Teacher', '01373149064', 'father61@example.com', '3477241670068', NULL, 'Mrs. Pasquale Steuber', 'Teacher', '01962373235', 'mother61@example.com', '1990036185157', NULL, 'Lula Veum', '01467290339', 'guardian61@example.com', '8768516955983', 'Brother', 1, 17, 1, '2025-12-14', NULL, 2025000061, 900061, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15', '127.0.0.1', 1, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15'),
(62, 'Kendra', 'Leffler', '1972-05-03', 'Female', 'AB-', 'Other', 'Bangladeshi', '4341365124367', '01923004734', 'student62@example.com', '$2y$12$ndCQKAc5GIgTwjIk23pUveZMf3BkfB3FkPg3hKDOaH6EjCqeLPiAq', '573 Wuckert Cliff Suite 172\nNorth Juvenalfort, DE 90232', '9036 Hoeger Expressway Apt. 668\nEvelineside, AZ 96006', 'ADM-00062', '1985-06-27', 'C', 'Arts', '2025-2026', 'O\'Conner, Bode and Rempel School', 'Jasper Senger', 'Businessman', '01721741907', 'father62@example.com', '2357274062728', NULL, 'Nadia Gulgowski', 'Housewife', '01949727582', 'mother62@example.com', '1497878976184', NULL, 'Prof. Veda Barton', '01745848839', 'guardian62@example.com', '2125730551458', 'Uncle', 1, 13, 4, '2025-12-14', NULL, 2025000062, 900062, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15', '127.0.0.1', 1, NULL, '2025-12-14 06:05:15', '2025-12-14 06:05:15'),
(63, 'Judy', 'Boehm', '1979-08-22', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '5203568895605', '01598366190', 'student63@example.com', '$2y$12$eec70gs8vHmRQSqt4rtBpehwIL0nMfBnDjq4P2EhvgdtK4YntR8PO', '444 Dickinson Throughway Apt. 399\nArdithport, UT 88910', '123 Selina Station Suite 629\nEmardport, GA 93752-5590', 'ADM-00063', '2012-01-28', 'B', 'Science', '2025-2026', 'Herzog-Kreiger School', 'Mr. Dax Kuhn', 'Businessman', '01638910961', 'father63@example.com', '2630914834419', NULL, 'Prof. Melba Harris PhD', 'Doctor', '01659183524', 'mother63@example.com', '6360274901165', NULL, 'Ocie Koch', '01762847324', 'guardian63@example.com', '5843354988733', 'Brother', 1, 18, 1, '2025-12-14', NULL, 2025000063, 900063, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16', '127.0.0.1', 1, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16'),
(64, 'Guillermo', 'Feeney', '1979-11-06', 'Female', 'O-', 'Islam', 'Bangladeshi', '7645850190644', '01878787389', 'student64@example.com', '$2y$12$bhfFAHZNHAneozC1HPzKt.da0k2OvTWw5vPvGPjaREPkp1wFzFotm', '318 Spencer Rapid Apt. 174\nMosheport, RI 56461', '609 Assunta Neck\nGarrisonport, ME 26787', 'ADM-00064', '2001-09-05', 'B', 'Science', '2025-2026', 'Kreiger-O\'Keefe School', 'Francesco Champlin IV', 'Businessman', '01714730055', 'father64@example.com', '0147457125883', NULL, 'Dr. Maribel Fadel', 'Teacher', '01612054361', 'mother64@example.com', '3608370943987', NULL, 'Libbie Robel', '01555327935', 'guardian64@example.com', '4845841276870', 'Brother', 1, 14, 4, '2025-12-14', NULL, 2025000064, 900064, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16', '127.0.0.1', 1, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16'),
(65, 'Filiberto', 'Harris', '2020-09-20', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '2697725117313', '01864082344', 'student65@example.com', '$2y$12$jDUBtlIJnG4elYinShRfiOyJmWNq00KCGiPbkCCixh2VLQtz1ZCje', '46538 Krajcik Wells\nTaliaview, WI 79128-3696', '279 Gutmann Drives\nNew Germaineport, KS 90782', 'ADM-00065', '2019-10-03', 'A', 'Commerce', '2025-2026', 'Quitzon, Murazik and Wiegand School', 'Mr. Ethan Lakin', 'Teacher', '01374727829', 'father65@example.com', '8185189737032', NULL, 'Mireya Abbott', 'Doctor', '01448784446', 'mother65@example.com', '7203549895029', NULL, 'Otho Sanford', '01341258342', 'guardian65@example.com', '0797417045632', 'Sister', 1, 12, 2, '2025-12-14', NULL, 2025000065, 900065, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16', '127.0.0.1', 1, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16'),
(66, 'Colin', 'Turner', '2023-05-06', 'Male', 'AB-', 'Other', 'Bangladeshi', '4278091241029', '01394201791', 'student66@example.com', '$2y$12$sNhiFulNE8jsI.8OhENeIecVhVUPUYS7nEPjAhuH2SogvacuutljW', '97590 Langosh Highway\nEast Robynborough, AZ 12814', '7410 Violet Rue Suite 285\nLake Serenityfort, NE 98038-8996', 'ADM-00066', '2015-04-03', 'C', 'Science', '2025-2026', 'Leffler, VonRueden and Block School', 'Mitchel McKenzie', 'Farmer', '01935412921', 'father66@example.com', '2526679070539', NULL, 'Sheila McDermott PhD', 'Housewife', '01893462028', 'mother66@example.com', '2218588783284', NULL, 'Maximilian Greenholt', '01972407938', 'guardian66@example.com', '8547721912706', 'Sister', 1, 10, 5, '2025-12-14', NULL, 2025000066, 900066, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16', '127.0.0.1', 1, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16'),
(67, 'Marley', 'Schmeler', '2011-04-06', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '6001296861062', '01384261598', 'student67@example.com', '$2y$12$n3jMg/xcQ05R/tqS2PUKUeViSNgpBqmQzOBxhx1RpA3q/vJf2bmi2', '276 Tromp Falls Apt. 141\nPort Kristin, WY 98626', '6909 Senger Skyway Suite 574\nMaciside, DE 84972', 'ADM-00067', '1971-02-22', 'B', 'Commerce', '2025-2026', 'Herzog-Schmidt School', 'Stanton Miller', 'Teacher', '01688154889', 'father67@example.com', '4734521060455', NULL, 'Janelle Koelpin', 'Doctor', '01541473320', 'mother67@example.com', '9964807997949', NULL, 'Mr. Tremaine Watsica MD', '01521059571', 'guardian67@example.com', '2886601103923', 'Brother', 1, 11, 5, '2025-12-14', NULL, 2025000067, 900067, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16', '127.0.0.1', 1, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16'),
(68, 'Weston', 'Kovacek', '1982-02-26', 'Male', 'O-', 'Hindu', 'Bangladeshi', '1162526557413', '01445917847', 'student68@example.com', '$2y$12$cHU7N85zoB7cmxVUNTrgA.MQ0qF20Z.9ebv3ne.dbhbky/RdJ0LXG', '45226 Roosevelt Well Suite 131\nLake Patiencetown, ME 22714', '24528 Verda Street Suite 453\nSouth Aronstad, IN 55585', 'ADM-00068', '1978-12-16', 'C', 'Science', '2025-2026', 'Parisian, Daniel and Bruen School', 'Mr. Chester Runolfsson', 'Doctor', '01334617346', 'father68@example.com', '2268164561303', NULL, 'Prof. Mazie Huel Sr.', 'Housewife', '01745153995', 'mother68@example.com', '6742407728958', NULL, 'Zella Botsford', '01547993082', 'guardian68@example.com', '7785080530361', 'Aunt', 1, 13, 2, '2025-12-14', NULL, 2025000068, 900068, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16', '127.0.0.1', 1, NULL, '2025-12-14 06:05:16', '2025-12-14 06:05:16'),
(69, 'Florine', 'Klocko', '2018-10-24', 'Other', 'A+', 'Hindu', 'Bangladeshi', '0849819465806', '01329937302', 'student69@example.com', '$2y$12$wQZ1kZQqLQNMB3RWb5CItOaI78msyNqfzPSCI60fVFNsrka9c5E0K', '4590 Schaden Stream\nHuelstown, PA 31354', '793 Constance Loaf Apt. 505\nSchoenbury, AL 28409', 'ADM-00069', '1999-11-21', 'A', 'Science', '2025-2026', 'Rippin, Hudson and Greenfelder School', 'Leopoldo Breitenberg', 'Doctor', '01329033604', 'father69@example.com', '7544497417123', NULL, 'Elinor Sawayn Jr.', 'Housewife', '01827222423', 'mother69@example.com', '2940077479556', NULL, 'Dr. Raphaelle O\'Connell III', '01508548862', 'guardian69@example.com', '8484850290550', 'Brother', 1, 15, 4, '2025-12-14', NULL, 2025000069, 900069, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17', '127.0.0.1', 1, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17'),
(70, 'Scot', 'Davis', '1980-05-15', 'Male', 'O-', 'Buddhist', 'Bangladeshi', '9493472913784', '01403079338', 'student70@example.com', '$2y$12$wALyMbqPUx6c/NjhMgGXaefZRdYTcmbimAWGXJUHgHsoEvvgoqV66', '525 Tyree Path Suite 198\nMcLaughlintown, OK 95067', '70703 Magali Forge Suite 103\nKunzemouth, AK 38651-0849', 'ADM-00070', '2005-02-06', 'B', 'Arts', '2025-2026', 'Mohr, Turner and Howell School', 'Lucas Hintz DDS', 'Farmer', '01932418097', 'father70@example.com', '3310808732608', NULL, 'Dr. Maribel Schoen', 'Doctor', '01628494664', 'mother70@example.com', '5942927631733', NULL, 'Lilla Fritsch', '01621664970', 'guardian70@example.com', '7429371569782', 'Grandparent', 1, 14, 2, '2025-12-14', NULL, 2025000070, 900070, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17', '127.0.0.1', 1, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17'),
(71, 'Jordon', 'Sporer', '1991-11-06', 'Male', 'A+', 'Islam', 'Bangladeshi', '9531033260393', '01393390053', 'student71@example.com', '$2y$12$1faYJgWqBUwpkeV7qMgMfuVP2cA3Qt08O/Yz1O7C7QlnZ.UFkFlF.', '10121 Kihn Plain Apt. 216\nEast Kaylin, UT 49466-0573', '18034 Claudine Causeway\nCartermouth, NY 52336', 'ADM-00071', '1997-04-01', 'B', 'Arts', '2025-2026', 'Lemke-Kirlin School', 'Cyrus Nader', 'Farmer', '01640049095', 'father71@example.com', '1453643997576', NULL, 'Miss Guadalupe Bosco IV', 'Businesswoman', '01549310511', 'mother71@example.com', '6266702058961', NULL, 'Oswald Rolfson', '01429494743', 'guardian71@example.com', '3589549684855', 'Grandparent', 1, 13, 3, '2025-12-14', NULL, 2025000071, 900071, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17', '127.0.0.1', 1, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17'),
(72, 'Jennyfer', 'Koss', '1987-11-04', 'Other', 'O-', 'Islam', 'Bangladeshi', '5517669905226', '01694024432', 'student72@example.com', '$2y$12$3wLHxgjN6eyLwv6zA6WCruzoEc06hkOLyxXWyfYFEphCZoCNXMaw.', '9676 Danial Hollow Suite 971\nEldorafort, NC 49672', '862 Idell Lodge\nPort Hilda, FL 30478-7951', 'ADM-00072', '2025-12-12', 'C', 'Arts', '2025-2026', 'Stark, Mann and Schmidt School', 'Mr. Marques Von MD', 'Doctor', '01649811914', 'father72@example.com', '0618475242253', NULL, 'Michelle Swift', 'Teacher', '01955847238', 'mother72@example.com', '6979354217555', NULL, 'Hugh Denesik', '01490881745', 'guardian72@example.com', '6845683189097', 'Uncle', 1, 16, 4, '2025-12-14', NULL, 2025000072, 900072, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17', '127.0.0.1', 1, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17'),
(73, 'Thaddeus', 'Ebert', '1982-09-20', 'Female', 'A+', 'Other', 'Bangladeshi', '2061150612222', '01557495213', 'student73@example.com', '$2y$12$I.VAYOq35br1pxN50AIPyuNm5vLtFtkoHS4bnwc.KiC3oTByvm8ee', '876 Reba Fords Apt. 796\nLake Winifred, ME 68590', '84036 Wava Meadows Suite 434\nShanahanstad, MS 68645-7758', 'ADM-00073', '1972-02-10', 'C', 'Commerce', '2025-2026', 'Medhurst, Collier and Wyman School', 'Sylvester Lubowitz', 'Businessman', '01463388315', 'father73@example.com', '4042295055812', NULL, 'Mrs. Baby Ward PhD', 'Doctor', '01479235684', 'mother73@example.com', '6634059320143', NULL, 'Holly Robel', '01605521229', 'guardian73@example.com', '0527369006942', 'Sister', 1, 15, 2, '2025-12-14', NULL, 2025000073, 900073, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17', '127.0.0.1', 1, NULL, '2025-12-14 06:05:17', '2025-12-14 06:05:17'),
(74, 'Alek', 'Reichel', '1999-10-22', 'Female', 'B-', 'Buddhist', 'Bangladeshi', '3292980112936', '01348086215', 'student74@example.com', '$2y$12$jW/sw58RSSHHEiDr63f7MeyAg5ROaE09rcq/P9vOGV72Djz9QIa0q', '955 White Run\nNew Anabel, OK 72002', '434 Harry Cliffs\nMyastad, SD 28888', 'ADM-00074', '1991-10-11', 'C', 'Arts', '2025-2026', 'McKenzie LLC School', 'Jarrett Crooks', 'Teacher', '01427499745', 'father74@example.com', '9130286203848', NULL, 'Elsa Willms', 'Doctor', '01560476933', 'mother74@example.com', '1867723324744', NULL, 'Lorenz Schoen', '01892959045', 'guardian74@example.com', '8366715909466', 'Brother', 1, 19, 1, '2025-12-14', NULL, 2025000074, 900074, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18', '127.0.0.1', 1, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18'),
(75, 'Clemens', 'Ruecker', '1996-02-13', 'Female', 'B+', 'Islam', 'Bangladeshi', '9736956864187', '01614312860', 'student75@example.com', '$2y$12$sMwwj3HTCzCQ2reO2J67D.a1ikDnqIlYrD/bhqOUWMIb3a1tAj.FO', '36373 Hodkiewicz Point Apt. 819\nWest Amani, IL 21648', '627 Maribel Mountain Suite 926\nLake Blakemouth, NE 35885-6523', 'ADM-00075', '1984-03-30', 'C', 'Arts', '2025-2026', 'Schmidt, Jenkins and Feil School', 'Juwan Boyle', 'Engineer', '01431122593', 'father75@example.com', '6746587708826', NULL, 'Cathrine Spinka', 'Doctor', '01373217201', 'mother75@example.com', '6176729644260', NULL, 'Ms. Flo Frami', '01924391096', 'guardian75@example.com', '5862248675545', 'Uncle', 1, 12, 5, '2025-12-14', NULL, 2025000075, 900075, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18', '127.0.0.1', 1, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18'),
(76, 'Florence', 'Bahringer', '1974-01-18', 'Female', 'O+', 'Other', 'Bangladeshi', '2921404963774', '01962361231', 'student76@example.com', '$2y$12$FgA/KMpGmURKtPBQzNRJG.qAJv9TCQ46o2HsdUort1e9Rkiev0oTm', '69107 Stehr Court\nHaagshire, AZ 44723-8666', '1969 Treutel Alley Suite 577\nSouth Kitty, WY 41936', 'ADM-00076', '2017-11-14', 'C', 'Science', '2025-2026', 'Daugherty, Langosh and Luettgen School', 'Murray Conn', 'Doctor', '01925352339', 'father76@example.com', '2631689100180', NULL, 'Rowena Toy', 'Teacher', '01824933901', 'mother76@example.com', '4533051337546', NULL, 'Florence Bailey', '01373013710', 'guardian76@example.com', '5130373404831', 'Aunt', 1, 13, 5, '2025-12-14', NULL, 2025000076, 900076, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18', '127.0.0.1', 1, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18'),
(77, 'Karli', 'Prohaska', '2004-02-26', 'Female', 'O+', 'Christian', 'Bangladeshi', '2144523988295', '01900469694', 'student77@example.com', '$2y$12$U8M24suqZG/liZtBN/M70OVd22RKIc9WGFO5gJLHkiy.dP7YL3TOK', '113 Miller Squares\nDelfinamouth, HI 88065', '885 Charles Causeway\nLake Brooklynmouth, WA 03686-6873', 'ADM-00077', '1985-04-25', 'B', 'Commerce', '2025-2026', 'Gibson, DuBuque and Lesch School', 'Prof. Olin Gottlieb', 'Engineer', '01483091759', 'father77@example.com', '7094018865612', NULL, 'Ms. Asa Waelchi', 'Teacher', '01994440851', 'mother77@example.com', '1404204550780', NULL, 'Adrian Mayer', '01331883046', 'guardian77@example.com', '0487522272507', 'Brother', 1, 16, 2, '2025-12-14', NULL, 2025000077, 900077, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18', '127.0.0.1', 1, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18'),
(78, 'Kaden', 'Gerhold', '2000-01-13', 'Male', 'O+', 'Buddhist', 'Bangladeshi', '5533256579868', '01426363747', 'student78@example.com', '$2y$12$sotDu2M1vyESqRB5jwwAN.wEeI6ymlZlF1nc1OrelkoYx1nP4YAcO', '99841 Lawson Pines\nWest Idastad, TX 92856', '816 Kathleen Pass\nSouth Alexandreabury, TX 19284', 'ADM-00078', '1980-05-23', 'A', 'Science', '2025-2026', 'Konopelski-Luettgen School', 'Terrill Littel', 'Teacher', '01373900710', 'father78@example.com', '9187433743143', NULL, 'Citlalli Erdman', 'Businesswoman', '01410701142', 'mother78@example.com', '8484078263010', NULL, 'Icie Williamson IV', '01751741573', 'guardian78@example.com', '1217916252186', 'Brother', 1, 14, 3, '2025-12-14', NULL, 2025000078, 900078, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18', '127.0.0.1', 1, NULL, '2025-12-14 06:05:18', '2025-12-14 06:05:18'),
(79, 'Tatum', 'Hane', '1993-04-04', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '1081954355181', '01695629190', 'student79@example.com', '$2y$12$2ETTNAFNC6dWJugS5GRzJuV7FvLcEHcGMfj8S7V1gjXyg3NQhvCQq', '76600 Jeremy Isle\nNorth Odie, OH 19115-9117', '940 Cummings Grove\nNew Jeromy, HI 65754', 'ADM-00079', '2022-12-07', 'C', 'Commerce', '2025-2026', 'Feil, Kuhic and Bartell School', 'Dr. Jarvis Cronin', 'Farmer', '01851499348', 'father79@example.com', '5208993614133', NULL, 'Micaela Sauer', 'Doctor', '01850361581', 'mother79@example.com', '7020884741329', NULL, 'Connie Lang', '01760083209', 'guardian79@example.com', '0253076307830', 'Grandparent', 1, 20, 1, '2025-12-14', NULL, 2025000079, 900079, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19', '127.0.0.1', 1, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19'),
(80, 'Josephine', 'Prosacco', '2018-06-05', 'Female', 'B+', 'Islam', 'Bangladeshi', '5739368697708', '01486984044', 'student80@example.com', '$2y$12$Pl/fZ6tjAs0hzk2sn9k1wuo9XFu06tDsbvMs6A9XsT5gZx7eHn.Te', '523 Frami Hill Apt. 590\nWest Leonel, AZ 67853-1534', '2790 Okuneva Views\nWest Elijah, DC 99443', 'ADM-00080', '2021-07-18', 'A', 'Arts', '2025-2026', 'Mosciski PLC School', 'Zion O\'Keefe', 'Doctor', '01570185026', 'father80@example.com', '7909518245309', NULL, 'Dr. Jermaine Deckow V', 'Doctor', '01981758316', 'mother80@example.com', '0969863820023', NULL, 'Mr. Florian Carroll', '01596990298', 'guardian80@example.com', '8175273910808', 'Brother', 1, 17, 4, '2025-12-14', NULL, 2025000080, 900080, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19', '127.0.0.1', 1, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19'),
(81, 'Willard', 'Kilback', '2006-08-04', 'Male', 'A-', 'Islam', 'Bangladeshi', '9476029983590', '01359899668', 'student81@example.com', '$2y$12$BGD2nXhEdB1Mhgym.ELCteLLFuo4kO/DeFVNg5uU17lcxyOh5sTJS', '5045 Kirlin Crossroad\nPurdybury, HI 86294-3523', '54645 Pollich Summit Suite 836\nMannville, KY 12210-8186', 'ADM-00081', '1993-11-11', 'B', 'Science', '2025-2026', 'King-Shields School', 'Gideon Corwin', 'Teacher', '01961738566', 'father81@example.com', '2063937028138', NULL, 'Aniyah Haley', 'Doctor', '01521213665', 'mother81@example.com', '0914074025355', NULL, 'Sophia Abernathy', '01569321010', 'guardian81@example.com', '4767170237448', 'Uncle', 1, 18, 4, '2025-12-14', NULL, 2025000081, 900081, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19', '127.0.0.1', 1, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19'),
(82, 'Bria', 'Harris', '2001-04-23', 'Male', 'AB+', 'Islam', 'Bangladeshi', '4532830942155', '01349721254', 'student82@example.com', '$2y$12$JIrvKc43cxG7xqIwuG1vpuRqabFHYWOpFfA2/Uhq.Kh/Sw.En/pe2', '76037 Welch Creek\nKrajcikstad, CT 69858', '4613 Zita Extension\nNorth Fletamouth, NH 95807', 'ADM-00082', '1984-12-10', 'A', 'Arts', '2025-2026', 'McClure-Friesen School', 'Prof. Bart McClure', 'Teacher', '01952010854', 'father82@example.com', '6853776430910', NULL, 'Prof. Yesenia Streich', 'Teacher', '01916423243', 'mother82@example.com', '2967576646701', NULL, 'Herminio Altenwerth DVM', '01476207872', 'guardian82@example.com', '1233235472430', 'Sister', 1, 15, 3, '2025-12-14', NULL, 2025000082, 900082, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19', '127.0.0.1', 1, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19'),
(83, 'Daija', 'Stehr', '2002-07-22', 'Other', 'O+', 'Hindu', 'Bangladeshi', '5632127148804', '01835994771', 'student83@example.com', '$2y$12$Bhcnqtw5tlyA4v/EdOx6FeSXyyuqxFeM2.OnAwToVyIVxKhgKWISu', '519 Murazik Inlet Suite 147\nLake Leopold, AR 67429', '64484 Sylvester Road Suite 970\nSouth Regan, WI 13427-1785', 'ADM-00083', '2001-09-28', 'B', 'Arts', '2025-2026', 'Dach, Swift and Ratke School', 'Marquis Runolfsdottir V', 'Engineer', '01558201652', 'father83@example.com', '1915568780768', NULL, 'Lou Hills Jr.', 'Doctor', '01806880929', 'mother83@example.com', '5148844399744', NULL, 'Mr. Holden Baumbach PhD', '01485498910', 'guardian83@example.com', '9356736442824', 'Sister', 1, 19, 4, '2025-12-14', NULL, 2025000083, 900083, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19', '127.0.0.1', 1, NULL, '2025-12-14 06:05:19', '2025-12-14 06:05:19'),
(84, 'Velma', 'VonRueden', '1983-07-03', 'Male', 'B-', 'Other', 'Bangladeshi', '6976242562614', '01777085965', 'student84@example.com', '$2y$12$EuXxIn4uJS5.SlCE5KpX1.4tz/ImqK5NWBmCw.fV88TjE0sYIPfu6', '5206 Norris Gateway Apt. 670\nBreanaborough, ND 97068-9350', '21699 Zelda Mews Suite 455\nWest Dandreview, GA 93754-2489', 'ADM-00084', '2009-12-16', 'B', 'Arts', '2025-2026', 'Brown-Douglas School', 'Floy Hansen', 'Doctor', '01744237798', 'father84@example.com', '2675871579722', NULL, 'Electa Volkman', 'Housewife', '01643287084', 'mother84@example.com', '1168563363136', NULL, 'Prof. Eloisa Brown', '01687145859', 'guardian84@example.com', '0865413607183', 'Grandparent', 1, 17, 2, '2025-12-14', NULL, 2025000084, 900084, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20', '127.0.0.1', 1, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20'),
(85, 'Lorna', 'Olson', '2020-09-11', 'Female', 'B-', 'Buddhist', 'Bangladeshi', '0122664032088', '01647371099', 'student85@example.com', '$2y$12$Lcrx0yxc29nVV3FQT7w1xOEsMnEFxe4jCBMSVRSumYvP.c4SWmoNu', '97528 Reichel Light Apt. 078\nLake Jena, DC 76467', '56231 Melvin Greens\nEast Boyd, NV 89278', 'ADM-00085', '2008-07-03', 'B', 'Arts', '2025-2026', 'Hamill-Streich School', 'Furman Gerhold', 'Doctor', '01739456240', 'father85@example.com', '5718579713722', NULL, 'Destiny Heller', 'Doctor', '01324210108', 'mother85@example.com', '5301814959189', NULL, 'Aliyah Bartell', '01302421773', 'guardian85@example.com', '9960553105956', 'Uncle', 1, 18, 2, '2025-12-14', NULL, 2025000085, 900085, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20', '127.0.0.1', 1, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20'),
(86, 'Kurt', 'Hettinger', '1970-01-10', 'Other', 'A-', 'Hindu', 'Bangladeshi', '1343901631299', '01362879672', 'student86@example.com', '$2y$12$fBbAnzvrIlZdjNMbpTvo0O7VUUPjm8oGf1E8/8JXzh5Yy5kuRaF9O', '4098 Bechtelar Mountains Apt. 659\nPort Johnathanside, NV 81741-7109', '7195 Simonis Trail\nStephenmouth, DC 73568', 'ADM-00086', '2015-11-26', 'A', 'Science', '2025-2026', 'Renner Group School', 'Santos Beatty', 'Teacher', '01323719282', 'father86@example.com', '6277375831818', NULL, 'Ms. Gia Yost', 'Teacher', '01759192115', 'mother86@example.com', '9710196175709', NULL, 'Luna Schaefer DVM', '01408680557', 'guardian86@example.com', '5502894698466', 'Uncle', 1, 16, 3, '2025-12-14', NULL, 2025000086, 900086, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20', '127.0.0.1', 1, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20'),
(87, 'Pearline', 'Feeney', '2008-07-10', 'Female', 'A+', 'Christian', 'Bangladeshi', '9272149114499', '01653762946', 'student87@example.com', '$2y$12$NZ7rzPDeq0sjrIPYxd5CXuLoBB.AC6Dx1nnZAzv8ga3MFj8o4k.km', '8709 Wuckert Path Suite 010\nWatersbury, MN 01904-6398', '576 Effertz Harbors\nNorth Corrine, MT 31870', 'ADM-00087', '2001-03-19', 'C', 'Arts', '2025-2026', 'Brown-Collins School', 'Donnell Kerluke Sr.', 'Doctor', '01746456836', 'father87@example.com', '5241177768386', NULL, 'Ms. Corene Okuneva', 'Businesswoman', '01342794414', 'mother87@example.com', '4173170759282', NULL, 'Gunnar Johnson', '01424352396', 'guardian87@example.com', '0546343798990', 'Brother', 1, 21, 1, '2025-12-14', NULL, 2025000087, 900087, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20', '127.0.0.1', 1, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20'),
(88, 'Laury', 'Champlin', '1982-08-28', 'Male', 'B+', 'Other', 'Bangladeshi', '6430065595428', '01564956383', 'student88@example.com', '$2y$12$YcbnOXsgtjQvlNsrFJO.v.XIAssqVSmoxKtThXtjiWADizRtowLfm', '813 Ruth Causeway\nKundemouth, WV 03183', '5517 Serena Flats Apt. 067\nNew Jett, WA 84390-4179', 'ADM-00088', '2000-12-13', 'C', 'Commerce', '2025-2026', 'Rice PLC School', 'Tremaine Orn', 'Doctor', '01663785745', 'father88@example.com', '8675026997892', NULL, 'Cindy Metz', 'Businesswoman', '01485116308', 'mother88@example.com', '4689603742881', NULL, 'Annamae Wolff', '01513000672', 'guardian88@example.com', '7600106103609', 'Uncle', 1, 14, 5, '2025-12-14', NULL, 2025000088, 900088, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20', '127.0.0.1', 1, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20'),
(89, 'Alverta', 'Fahey', '1983-01-01', 'Female', 'B+', 'Islam', 'Bangladeshi', '0166845304810', '01875177866', 'student89@example.com', '$2y$12$7y0X9cTxDJ1ppctEs1Z/LexilPPsMccqFh/LB9o8pbrL.A6GHVNUy', '741 Leannon Grove\nCristport, IL 32791', '7366 Nayeli Corner\nRosemaryport, AZ 28250', 'ADM-00089', '1977-08-12', 'C', 'Commerce', '2025-2026', 'Frami and Sons School', 'Mr. Jamil Dietrich', 'Doctor', '01624308619', 'father89@example.com', '4000235985217', NULL, 'Nelda Lebsack', 'Housewife', '01695830186', 'mother89@example.com', '1712087565186', NULL, 'Ms. Joanie Howe', '01828236465', 'guardian89@example.com', '5270373580036', 'Aunt', 1, 19, 2, '2025-12-14', NULL, 2025000089, 900089, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20', '127.0.0.1', 1, NULL, '2025-12-14 06:05:20', '2025-12-14 06:05:20'),
(90, 'Janis', 'Emard', '1975-07-14', 'Other', 'A-', 'Christian', 'Bangladeshi', '5904801922839', '01653658777', 'student90@example.com', '$2y$12$0ojsRsfZoI0me69vPfs/bOErbXpJC0mc0c6AufCSY.Z992KETvGYu', '4116 Emmerich Crest Apt. 719\nLake Aimee, MO 99669', '36334 Alison Trace\nFriesenstad, PA 54269', 'ADM-00090', '1981-09-10', 'C', 'Arts', '2025-2026', 'Lowe and Sons School', 'Roosevelt Stark Sr.', 'Engineer', '01958502732', 'father90@example.com', '7521497521423', NULL, 'Roma Bradtke', 'Doctor', '01995505938', 'mother90@example.com', '4099478897516', NULL, 'Mr. Xander Wehner Jr.', '01564700948', 'guardian90@example.com', '9249498766769', 'Sister', 1, 20, 2, '2025-12-14', NULL, 2025000090, 900090, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21', '127.0.0.1', 1, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21'),
(91, 'Tevin', 'Ebert', '1980-06-21', 'Male', 'A-', 'Buddhist', 'Bangladeshi', '8117002097090', '01752148433', 'student91@example.com', '$2y$12$d5U72wwOa74AJFFgEUWmfu/M6ImujeiWsXugzdB3OAjZJUZOVZRCa', '35892 Mavis Forest\nHowelltown, UT 63022', '718 Little Crest Suite 831\nNew Florianmouth, MS 26040-5396', 'ADM-00091', '2019-08-08', 'C', 'Science', '2025-2026', 'Runte Group School', 'Mr. Kenton Fisher Jr.', 'Doctor', '01447064349', 'father91@example.com', '9010295305456', NULL, 'Marina Jenkins', 'Nurse', '01502626860', 'mother91@example.com', '1554314180637', NULL, 'Gilberto Hickle', '01540819716', 'guardian91@example.com', '9346329512324', 'Uncle', 1, 17, 3, '2025-12-14', NULL, 2025000091, 900091, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21', '127.0.0.1', 1, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21'),
(92, 'Abdul', 'Langosh', '1995-03-21', 'Other', 'AB+', 'Islam', 'Bangladeshi', '5214165766199', '01425981482', 'student92@example.com', '$2y$12$wPaNb3oXGhk7T6tnGxf8ROUSOQ.0L/fjCHbfwemvBOOTcnPH3Zf3m', '74251 Paxton Knolls\nPaucekside, NM 47598-5742', '69281 Vladimir Valley\nDeckowfurt, WY 49414-8066', 'ADM-00092', '1986-08-30', 'C', 'Arts', '2025-2026', 'Littel, Moen and Satterfield School', 'Dr. Kendall Spencer V', 'Farmer', '01517990523', 'father92@example.com', '1299278249608', NULL, 'Rosamond Feest', 'Teacher', '01739672090', 'mother92@example.com', '9874338300925', NULL, 'Adalberto King', '01670512785', 'guardian92@example.com', '0958214820301', 'Sister', 1, 22, 1, '2025-12-14', NULL, 2025000092, 900092, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21', '127.0.0.1', 1, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21'),
(93, 'Kianna', 'Jakubowski', '2000-12-03', 'Other', 'AB+', 'Islam', 'Bangladeshi', '6225196436477', '01514820573', 'student93@example.com', '$2y$12$wzi3Eo5rNtF2tXQiOin.2e550Ajeb2W66gb8KuVKL2qseQIPx.1Vm', '5555 Haylee Overpass Suite 738\nLangtown, MA 73634', '76603 Amara Centers\nSouth Beverlytown, MO 71411-8797', 'ADM-00093', '2003-08-09', 'C', 'Commerce', '2025-2026', 'Lynch LLC School', 'Marc Ward', 'Engineer', '01590482109', 'father93@example.com', '0152679141181', NULL, 'Wilhelmine Zemlak', 'Teacher', '01925669857', 'mother93@example.com', '0994820600548', NULL, 'Clara Fay', '01859863395', 'guardian93@example.com', '2713698315108', 'Sister', 1, 15, 5, '2025-12-14', NULL, 2025000093, 900093, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21', '127.0.0.1', 1, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21'),
(94, 'Ocie', 'Rosenbaum', '2020-11-11', 'Male', 'O+', 'Christian', 'Bangladeshi', '3821781050085', '01689500454', 'student94@example.com', '$2y$12$wOLdpcxSToMBLUnUWljpy.87bOsA9s47X99Okh3IVJDSunCKBm/k6', '89182 Maiya Heights\nLillamouth, AL 54786', '818 Feeney Avenue\nMortonton, MT 79080', 'ADM-00094', '2002-06-28', 'A', 'Arts', '2025-2026', 'Bayer, Larkin and Hyatt School', 'Bennie Labadie', 'Farmer', '01869471486', 'father94@example.com', '0202123787218', NULL, 'Matilda Greenfelder', 'Teacher', '01890385362', 'mother94@example.com', '8641423664706', NULL, 'Prof. Theo Schoen V', '01422194328', 'guardian94@example.com', '2128455810736', 'Brother', 1, 20, 4, '2025-12-14', NULL, 2025000094, 900094, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21', '127.0.0.1', 1, NULL, '2025-12-14 06:05:21', '2025-12-14 06:05:21'),
(95, 'Reta', 'Pfeffer', '1988-03-28', 'Other', 'A-', 'Other', 'Bangladeshi', '8560134052079', '01780403248', 'student95@example.com', '$2y$12$decEjqJSgBs9275qfibFveOn4Imlfw5ivjBdm/raHs88bUn/8IhMe', '6977 Osborne Way Suite 427\nDomingofurt, FL 64111', '326 Larson Walks\nKovacekport, OK 05830-9310', 'ADM-00095', '2001-02-27', 'A', 'Arts', '2025-2026', 'Wiegand-Volkman School', 'Mr. Abraham Mueller', 'Doctor', '01872909097', 'father95@example.com', '5110997827872', NULL, 'Miss Cayla Heidenreich', 'Nurse', '01641465920', 'mother95@example.com', '0893580597278', NULL, 'Minnie Kuhlman', '01887277807', 'guardian95@example.com', '0212176547837', 'Aunt', 1, 21, 2, '2025-12-14', NULL, 2025000095, 900095, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22', '127.0.0.1', 1, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22'),
(96, 'Kurtis', 'Koch', '1970-12-21', 'Male', 'B-', 'Islam', 'Bangladeshi', '3069523668433', '01646773576', 'student96@example.com', '$2y$12$77NO5Mi9vSsTaivUHVZEweQc9j5NQMBHTkC96041ODCgyx2e.1DUO', '7089 Skiles Hollow\nEbonyberg, VT 74619-2134', '75270 Runolfsson Plains\nAlfberg, OH 53198-7818', 'ADM-00096', '1996-07-24', 'B', 'Arts', '2025-2026', 'Kutch, Cartwright and Corkery School', 'Watson Grant', 'Engineer', '01420692123', 'father96@example.com', '2171486197215', NULL, 'Susan Jacobi', 'Teacher', '01348837093', 'mother96@example.com', '6590454349592', NULL, 'Maci Russel', '01751978257', 'guardian96@example.com', '4818671682243', 'Aunt', 1, 23, 1, '2025-12-14', NULL, 2025000096, 900096, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22', '127.0.0.1', 1, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22'),
(97, 'Shanel', 'Lind', '1977-02-03', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '6827079507756', '01465565880', 'student97@example.com', '$2y$12$un64/l3y.tLh2lT5VIHuZuFDycmyQO6lM1ltIjusaBNtx5ePzxHg6', '36676 Konopelski Crossing Suite 872\nMacejkovicshire, SD 09415', '815 Denesik Land Apt. 642\nSouth Sincereview, MO 32337', 'ADM-00097', '1989-02-17', 'B', 'Science', '2025-2026', 'Kuhn LLC School', 'Mr. Danial Russel', 'Businessman', '01480529347', 'father97@example.com', '3280593336743', NULL, 'Ms. Prudence Jacobs', 'Housewife', '01831415621', 'mother97@example.com', '9741808867356', NULL, 'Mr. Russel Welch', '01833870923', 'guardian97@example.com', '0317913570208', 'Aunt', 1, 16, 5, '2025-12-14', NULL, 2025000097, 900097, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22', '127.0.0.1', 1, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22'),
(98, 'Paris', 'White', '2000-11-21', 'Male', 'O-', 'Islam', 'Bangladeshi', '2955998081836', '01366367053', 'student98@example.com', '$2y$12$fQsOFhbyTO16m7Q2/y4BK.5TQj1YWvrFoqrvpFdsBny426rNuqb3a', '970 Johnson Mountains\nAmieland, AR 55922-1092', '73260 Elton Well Suite 259\nMorissetteton, SC 19643', 'ADM-00098', '1988-05-10', 'B', 'Arts', '2025-2026', 'Pacocha PLC School', 'Justice Hahn', 'Businessman', '01673946460', 'father98@example.com', '0806984054435', NULL, 'Emelie Marquardt', 'Nurse', '01785444475', 'mother98@example.com', '0048192607914', NULL, 'Dr. Kory Williamson V', '01349017239', 'guardian98@example.com', '8653679775038', 'Brother', 1, 21, 4, '2025-12-14', NULL, 2025000098, 900098, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22', '127.0.0.1', 1, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22'),
(99, 'Janessa', 'Kemmer', '2025-03-09', 'Male', 'A+', 'Hindu', 'Bangladeshi', '1566844998668', '01926134968', 'student99@example.com', '$2y$12$V5brGsz6fd0PCQJ9Nmr0fejc0/wtv1enHawSKeP86eR1I0DySfkdu', '95508 Wisoky Branch\nEast Freedaland, UT 19075', '193 Wolff Prairie\nElmorebury, WV 81487-2402', 'ADM-00099', '2018-06-15', 'A', 'Commerce', '2025-2026', 'Cummerata-Bartell School', 'Dusty Swaniawski', 'Engineer', '01768258178', 'father99@example.com', '2263362515240', NULL, 'Mrs. Anabelle Prosacco II', 'Businesswoman', '01695284681', 'mother99@example.com', '3881693144262', NULL, 'Ms. Shemar Lueilwitz PhD', '01449527249', 'guardian99@example.com', '5697692565544', 'Brother', 1, 24, 1, '2025-12-14', NULL, 2025000099, 900099, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22', '127.0.0.1', 1, NULL, '2025-12-14 06:05:22', '2025-12-14 06:05:22'),
(100, 'Adelle', 'Gorczany', '2021-02-27', 'Other', 'A+', 'Hindu', 'Bangladeshi', '9621533540473', '01588402544', 'student100@example.com', '$2y$12$pjkP3Z0RKg6BYFhWsxW3KOcwwMqYCzSCbfAY508fiNxDHHWarOT/u', '42049 Shaylee Hills Suite 108\nUllrichberg, WY 00283-8195', '9804 Jerrod Pines\nNorth Bennett, ID 69261', 'ADM-00100', '2013-10-17', 'A', 'Science', '2025-2026', 'Goldner, Hegmann and Marquardt School', 'Vern Conroy', 'Businessman', '01442870192', 'father100@example.com', '5417703624572', NULL, 'Magali Lebsack', 'Businesswoman', '01963030135', 'mother100@example.com', '3821421952242', NULL, 'Miss Hellen Ankunding', '01447385469', 'guardian100@example.com', '1631214700772', 'Aunt', 1, 25, 1, '2025-12-14', NULL, 2025000100, 900100, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23', '127.0.0.1', 1, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23'),
(101, 'Uriah', 'Zieme', '2005-06-24', 'Female', 'O-', 'Islam', 'Bangladeshi', '3135931075792', '01688720442', 'student101@example.com', '$2y$12$ImNqlVCMtIms0shFu3xzNu5OdyJa4qPe.IuKXzhHmhXYS.2n4Z97K', '145 Leuschke Alley\nPort Harold, GA 47234-3919', '1717 Romaguera Haven\nLake Stuartside, MD 20518', 'ADM-00101', '1977-02-26', 'B', 'Science', '2025-2026', 'Hauck, Homenick and Gulgowski School', 'Chaz Corkery IV', 'Farmer', '01383835255', 'father101@example.com', '2126743588143', NULL, 'Karina Schmitt', 'Doctor', '01682867233', 'mother101@example.com', '8434091089511', NULL, 'Ms. Susie Gottlieb', '01966255415', 'guardian101@example.com', '2647790083617', 'Aunt', 1, 26, 1, '2025-12-14', NULL, 2025000101, 900101, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23', '127.0.0.1', 1, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23'),
(102, 'Hugh', 'Waelchi', '2011-05-28', 'Male', 'B+', 'Christian', 'Bangladeshi', '8903944549033', '01499987697', 'student102@example.com', '$2y$12$DOIzk/p278H/Bj./xVKUGOxZZwRWeXBUOHrSzpJ5Z07BbEiHA9LUa', '9306 Ruecker Well Suite 737\nNew Isabell, AZ 16640', '21210 Bergstrom Plains\nWest Mafaldafurt, KY 86608-9595', 'ADM-00102', '2008-02-02', 'A', 'Arts', '2025-2026', 'Vandervort PLC School', 'Aaron Bechtelar', 'Doctor', '01716192390', 'father102@example.com', '4290161624673', NULL, 'Yvonne Cassin', 'Teacher', '01572994319', 'mother102@example.com', '8319627230061', NULL, 'Clementina Bergstrom', '01498248491', 'guardian102@example.com', '6607992618067', 'Brother', 1, 18, 3, '2025-12-14', NULL, 2025000102, 900102, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23', '127.0.0.1', 1, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23'),
(103, 'Jonatan', 'Brown', '1984-04-15', 'Female', 'O+', 'Other', 'Bangladeshi', '1359119335730', '01540812907', 'student103@example.com', '$2y$12$80OfUYI2ztMYxUZJd5.43eF7DZa4fqCGXcTpA6SCRnpT22T879XQ2', '313 Nolan Haven\nMariliefort, VT 46739', '292 Brekke Keys Apt. 337\nOctaviafort, TX 09592-7656', 'ADM-00103', '2004-12-26', 'A', 'Science', '2025-2026', 'Hudson, Kuhn and Stamm School', 'Mr. Halle Murazik', 'Doctor', '01993800608', 'father103@example.com', '0092741171984', NULL, 'Sydnie Marvin', 'Housewife', '01377544452', 'mother103@example.com', '2047276588740', NULL, 'Talia Harvey V', '01465907512', 'guardian103@example.com', '8444661328709', 'Grandparent', 1, 22, 4, '2025-12-14', NULL, 2025000103, 900103, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23', '127.0.0.1', 1, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23'),
(104, 'Hellen', 'Schaden', '2004-05-27', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '0673432804242', '01903180608', 'student104@example.com', '$2y$12$MaQFv4Nzq85bEAgCVdJaK.TgxuhrmJucH0Xpf7sjw6wQc0vAOYs/m', '769 Loren Ville Suite 322\nRodriguezborough, TN 80143-5519', '82799 Parisian Highway Suite 933\nLake Clair, UT 00852', 'ADM-00104', '1978-09-17', 'B', 'Science', '2025-2026', 'Pollich, Hintz and Morissette School', 'Terence Kirlin', 'Businessman', '01656457468', 'father104@example.com', '5875052832956', NULL, 'Vicenta Gerhold', 'Teacher', '01581759445', 'mother104@example.com', '2447636817443', NULL, 'Mrs. Matilde Zulauf DVM', '01492458208', 'guardian104@example.com', '4734343963023', 'Grandparent', 1, 23, 4, '2025-12-14', NULL, 2025000104, 900104, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23', '127.0.0.1', 1, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23'),
(105, 'Lawrence', 'Nader', '1979-09-22', 'Male', 'A-', 'Christian', 'Bangladeshi', '1938399381192', '01815523403', 'student105@example.com', '$2y$12$yGLPA1d2mHV31uMQ9NAYOOGkTGDO9KHTG4OdOcuK7Ey/4Th6OF0Li', '46794 Schultz Fort\nDaniellaberg, NM 29568-8530', '90767 Garnett Summit\nEast Luciousmouth, LA 89430', 'ADM-00105', '1978-11-08', 'B', 'Commerce', '2025-2026', 'McDermott Group School', 'Mr. Jermain Orn', 'Teacher', '01768314627', 'father105@example.com', '8255141879494', NULL, 'Emie Schaden', 'Doctor', '01948068487', 'mother105@example.com', '4040043819542', NULL, 'Mr. Jaylin Miller Jr.', '01939842717', 'guardian105@example.com', '4190980081796', 'Grandparent', 1, 19, 3, '2025-12-14', NULL, 2025000105, 900105, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23', '127.0.0.1', 1, NULL, '2025-12-14 06:05:23', '2025-12-14 06:05:23'),
(106, 'Kaylee', 'Feeney', '1971-06-13', 'Other', 'A-', 'Christian', 'Bangladeshi', '9790310736248', '01372887110', 'student106@example.com', '$2y$12$tGmt3VgMceDOOamr9H7TTOTRhCjRtXTzpOGhBpELvqUXuKIUoAMcW', '97835 Effertz Passage Apt. 776\nElmerstad, TX 50286', '131 Ankunding River Suite 232\nHavenport, DC 50914-2414', 'ADM-00106', '1988-09-04', 'A', 'Commerce', '2025-2026', 'Okuneva, Gerlach and Dach School', 'Russell Orn Sr.', 'Doctor', '01438342751', 'father106@example.com', '0450174985954', NULL, 'Prof. Elsie O\'Keefe', 'Nurse', '01906183914', 'mother106@example.com', '3030674242107', NULL, 'Mr. Charlie Becker V', '01429352027', 'guardian106@example.com', '3034996516095', 'Sister', 1, 24, 4, '2025-12-14', NULL, 2025000106, 900106, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24', '127.0.0.1', 1, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24'),
(107, 'Amely', 'Adams', '2024-01-07', 'Male', 'A+', 'Hindu', 'Bangladeshi', '9908019830807', '01931468063', 'student107@example.com', '$2y$12$vI.BjFSWaprYcebMdnO39uLJnYLK3fyPWJAIjB5xwR9Q2GRfUo5lK', '92908 Bergstrom Hollow\nSouth Tysonberg, NM 18375-8531', '395 Kerluke Mews Suite 061\nNorvalhaven, FL 18337', 'ADM-00107', '2023-02-18', 'A', 'Commerce', '2025-2026', 'Mitchell, Jakubowski and Harvey School', 'Mr. Brennon Simonis PhD', 'Businessman', '01859519599', 'father107@example.com', '5335429314502', NULL, 'Miss Katlyn Little II', 'Nurse', '01532777148', 'mother107@example.com', '4374700475904', NULL, 'Zachary Jast', '01438752014', 'guardian107@example.com', '5491400815762', 'Sister', 1, 27, 1, '2025-12-14', NULL, 2025000107, 900107, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24', '127.0.0.1', 1, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24'),
(108, 'Ashleigh', 'Pfannerstill', '2023-02-13', 'Other', 'A+', 'Hindu', 'Bangladeshi', '3573143648393', '01518245953', 'student108@example.com', '$2y$12$o7uVRisqjobjz8DVYPlVLO/PraGnpvzoc/JND74KRoX/6tWAAlkd6', '72450 Sporer Groves Suite 569\nEast Daniellaside, KS 26997', '8963 Roberts Flats\nKarellebury, MI 76900', 'ADM-00108', '2019-10-24', 'A', 'Science', '2025-2026', 'Hodkiewicz-Schamberger School', 'Moises Bahringer', 'Businessman', '01361066599', 'father108@example.com', '2892056326953', NULL, 'Celine Connelly', 'Doctor', '01571287923', 'mother108@example.com', '1003542527567', NULL, 'Adalberto Mayer', '01790809904', 'guardian108@example.com', '8653002878233', 'Grandparent', 1, 20, 3, '2025-12-14', NULL, 2025000108, 900108, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24', '127.0.0.1', 1, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24'),
(109, 'Kris', 'Kuphal', '1994-12-14', 'Female', 'B+', 'Buddhist', 'Bangladeshi', '9362844123858', '01516640398', 'student109@example.com', '$2y$12$FktM9dcpQrfPi/la21BfC.MzxKQ9IphHMtTfW9WY/IYwJvEecaFvy', '1225 Josh Points Apt. 746\nNew Cassandreside, MN 80808-2234', '248 Alec Knolls Apt. 113\nWest Myrtice, MT 02336', 'ADM-00109', '2019-08-23', 'A', 'Science', '2025-2026', 'Donnelly Inc School', 'Dave Wintheiser DDS', 'Teacher', '01860067500', 'father109@example.com', '3013290233878', NULL, 'Prof. Delia Gerlach', 'Teacher', '01995589899', 'mother109@example.com', '4282110535915', NULL, 'Jason Murray', '01986688638', 'guardian109@example.com', '5602247699508', 'Uncle', 1, 21, 3, '2025-12-14', NULL, 2025000109, 900109, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24', '127.0.0.1', 1, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24'),
(110, 'Ashlee', 'Dickens', '1976-10-06', 'Other', 'O+', 'Hindu', 'Bangladeshi', '0242656591980', '01851208478', 'student110@example.com', '$2y$12$kR5LHBlvXJCQ9/WtFU3EZeNlDnzPNRz7KMprziPiSA28BLEPH0M36', '3856 Funk Ramp Suite 535\nAddisonbury, KS 94118', '511 Vincenza Mountain Apt. 928\nAlbinaview, RI 35175', 'ADM-00110', '1995-04-02', 'A', 'Commerce', '2025-2026', 'Schneider-Deckow School', 'Prof. Tyrique Schaden IV', 'Farmer', '01479101240', 'father110@example.com', '3126049521363', NULL, 'Gerry Kertzmann PhD', 'Housewife', '01333547913', 'mother110@example.com', '1419399463509', NULL, 'Beverly Sawayn IV', '01555268039', 'guardian110@example.com', '0123794610836', 'Grandparent', 1, 28, 1, '2025-12-14', NULL, 2025000110, 900110, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24', '127.0.0.1', 1, NULL, '2025-12-14 06:05:24', '2025-12-14 06:05:24'),
(111, 'Imani', 'Runte', '2013-12-18', 'Male', 'O+', 'Hindu', 'Bangladeshi', '2246496748193', '01576162361', 'student111@example.com', '$2y$12$xvHcJFT.uvaOqDs6iy.hN.x48y2GgT75V8S6bTPMFXsAJvsZ72q06', '6966 Treutel Burgs\nRueckerborough, OK 25626', '76844 Adaline Street Suite 969\nGradyland, AZ 91592', 'ADM-00111', '1973-05-27', 'A', 'Arts', '2025-2026', 'Barrows-Corkery School', 'Mr. Zechariah Bailey DDS', 'Engineer', '01350881946', 'father111@example.com', '0456671682755', NULL, 'Ms. Lindsay Glover PhD', 'Doctor', '01388903205', 'mother111@example.com', '1709097261152', NULL, 'Sam McCullough II', '01886888882', 'guardian111@example.com', '3482991751771', 'Grandparent', 1, 25, 4, '2025-12-14', NULL, 2025000111, 900111, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25', '127.0.0.1', 1, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25'),
(112, 'Miles', 'Rath', '1987-01-14', 'Other', 'A+', 'Islam', 'Bangladeshi', '9049482198387', '01320237149', 'student112@example.com', '$2y$12$O.pL4PhKqTuiadPHl2.r3.tGNjEvf70kaANHhQnA8lFpIhfYlO.Pi', '45266 Gorczany Crescent Apt. 148\nEast Maia, AR 08837-4559', '39375 Raynor Bridge Suite 178\nBrayanside, IA 06633-3771', 'ADM-00112', '1972-09-20', 'C', 'Arts', '2025-2026', 'Schamberger, Lubowitz and Trantow School', 'Hardy Dare', 'Engineer', '01757832454', 'father112@example.com', '6292177810828', NULL, 'Barbara Kerluke', 'Teacher', '01958186186', 'mother112@example.com', '9331419427438', NULL, 'Waldo Huel V', '01860389862', 'guardian112@example.com', '6459926843659', 'Brother', 1, 29, 1, '2025-12-14', NULL, 2025000112, 900112, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25', '127.0.0.1', 1, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(113, 'Cydney', 'Spencer', '2023-08-30', 'Female', 'AB+', 'Hindu', 'Bangladeshi', '8687871859352', '01600177758', 'student113@example.com', '$2y$12$kkQFoXccxhK5aeYstnOaOuJaIo48LzU1d1jSjb2dzSClBvti7frZK', '4131 Hegmann Station Suite 099\nNew Briana, ME 37090', '749 Dickens Knoll\nPort Duaneland, MI 02218-3295', 'ADM-00113', '2015-01-08', 'B', 'Arts', '2025-2026', 'Macejkovic-Beer School', 'Milan Wiegand', 'Engineer', '01913476215', 'father113@example.com', '5874325253830', NULL, 'Cathrine Hagenes MD', 'Doctor', '01512149744', 'mother113@example.com', '0878434208524', NULL, 'Hershel Bartoletti', '01522290378', 'guardian113@example.com', '5282966324751', 'Uncle', 1, 30, 1, '2025-12-14', NULL, 2025000113, 900113, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25', '127.0.0.1', 1, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25'),
(114, 'Amelia', 'Morissette', '1998-04-30', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '0160249706205', '01679403753', 'student114@example.com', '$2y$12$2OQuWCbmnGlQNC8rLmuVAe7NV2K5gN0ZP1OrTpk6B/KRBiDAjHsgW', '86186 Nicola Circles\nNorth Price, AR 07560', '9167 Sauer Inlet\nJanessahaven, IA 00349', 'ADM-00114', '1990-04-20', 'B', 'Arts', '2025-2026', 'Boyle-Wolff School', 'Dr. Ron Collier', 'Doctor', '01308641468', 'father114@example.com', '7981391276119', NULL, 'Jackeline Sanford', 'Businesswoman', '01551819231', 'mother114@example.com', '6477131403232', NULL, 'Ms. Ophelia Witting MD', '01885067988', 'guardian114@example.com', '8234737445342', 'Aunt', 1, 26, 4, '2025-12-14', NULL, 2025000114, 900114, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25', '127.0.0.1', 1, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25'),
(115, 'Leonardo', 'Weber', '1994-08-18', 'Other', 'AB+', 'Islam', 'Bangladeshi', '5266021263306', '01675237299', 'student115@example.com', '$2y$12$mpP9O9AQWwtEYPCSsPaAjetsUnrBylHZdC9JeWZJ97d0nrBSqzHrW', '243 Ansel Manors Suite 826\nKesslerland, WA 68795', '31091 Kody Gardens\nNorth Alysha, IL 35408', 'ADM-00115', '2014-02-12', 'B', 'Science', '2025-2026', 'Rogahn, Bergnaum and Schimmel School', 'Jarrell Jacobs', 'Farmer', '01548052882', 'father115@example.com', '0678061704475', NULL, 'Adriana Will PhD', 'Housewife', '01515065028', 'mother115@example.com', '4908091407811', NULL, 'Miss Fannie Gislason', '01371530015', 'guardian115@example.com', '0308379167756', 'Sister', 1, 17, 5, '2025-12-14', NULL, 2025000115, 900115, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25', '127.0.0.1', 1, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25'),
(116, 'Lacey', 'Parisian', '2000-07-14', 'Other', 'AB-', 'Christian', 'Bangladeshi', '3029222727216', '01843579119', 'student116@example.com', '$2y$12$yI3hWNk/Z9HtxlkVslYX3uwaosDE6xe18Q/FhTuT8zn1lmqmB4Dwa', '74466 Pfannerstill Burg Suite 837\nSouth Christina, MA 55635-4514', '61048 Korey Mountains Suite 713\nShayleeview, MO 75961-9348', 'ADM-00116', '2007-12-29', 'C', 'Science', '2025-2026', 'Batz, Langosh and Raynor School', 'Marlin Hand', 'Farmer', '01353171328', 'father116@example.com', '1323429033584', NULL, 'Addison Weber', 'Housewife', '01935351085', 'mother116@example.com', '1391842348539', NULL, 'Kiley Strosin', '01380403432', 'guardian116@example.com', '8848721733653', 'Aunt', 1, 22, 3, '2025-12-14', NULL, 2025000116, 900116, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25', '127.0.0.1', 1, NULL, '2025-12-14 06:05:25', '2025-12-14 06:05:25'),
(117, 'Lewis', 'Cummerata', '1987-06-28', 'Female', 'A-', 'Hindu', 'Bangladeshi', '3058559031793', '01488877402', 'student117@example.com', '$2y$12$lneMetEr//yDz6GDKKZxWuM3mN84vt/EI7QBNnBzG7l9Ew4yuRDtm', '52995 Prohaska Course Apt. 090\nLauraton, MD 30982', '5338 Tia Vista Apt. 069\nNew Jackson, MD 47128-5290', 'ADM-00117', '1976-12-26', 'B', 'Commerce', '2025-2026', 'Spencer, Spencer and Bartell School', 'Nat Klein', 'Doctor', '01738141063', 'father117@example.com', '3521357352097', NULL, 'Gail Balistreri', 'Businesswoman', '01565424344', 'mother117@example.com', '3068235522970', NULL, 'Faye Witting', '01513888660', 'guardian117@example.com', '7645232708924', 'Sister', 1, 22, 2, '2025-12-14', NULL, 2025000117, 900117, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26', '127.0.0.1', 1, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26'),
(118, 'June', 'Gottlieb', '1976-04-09', 'Male', 'B+', 'Christian', 'Bangladeshi', '5783768515456', '01322800677', 'student118@example.com', '$2y$12$cEV.fZKvf21L0Xxb7A..pebcaD0bGDLM89sG.2G638PvemJLPlt0a', '30248 Robb Shoals Apt. 470\nLake Annabelleton, WI 34819', '896 Ruby Mountain Apt. 133\nPort Johnnieburgh, AZ 08891', 'ADM-00118', '2001-03-11', 'B', 'Arts', '2025-2026', 'Ryan, Welch and Lockman School', 'Jalon Terry', 'Farmer', '01723620664', 'father118@example.com', '0016139014043', NULL, 'Ms. Nedra Volkman MD', 'Doctor', '01321024014', 'mother118@example.com', '1254560959321', NULL, 'Mrs. Millie Hackett Jr.', '01891285970', 'guardian118@example.com', '1433469325248', 'Grandparent', 1, 23, 3, '2025-12-14', NULL, 2025000118, 900118, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26', '127.0.0.1', 1, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26'),
(119, 'Karine', 'Wiza', '1971-05-06', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '8242257854378', '01757527220', 'student119@example.com', '$2y$12$J0UGFQidco6/GcakfGftneSrI30VXfhZO2CpDt0US9eQes4i5qDTu', '48538 Christiansen Village\nSouth Margaret, KS 77582', '77916 Jenkins Valley Suite 472\nHermanbury, FL 46087', 'ADM-00119', '2014-08-12', 'A', 'Science', '2025-2026', 'Parisian and Sons School', 'Doyle Swift', 'Engineer', '01598991408', 'father119@example.com', '2146343068676', NULL, 'Nettie Thiel', 'Businesswoman', '01690414641', 'mother119@example.com', '6638508278718', NULL, 'Carlo Reichel', '01671960148', 'guardian119@example.com', '7986478908949', 'Uncle', 1, 27, 4, '2025-12-14', NULL, 2025000119, 900119, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26', '127.0.0.1', 1, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26'),
(120, 'Fatima', 'Schmidt', '2002-03-10', 'Other', 'A+', 'Other', 'Bangladeshi', '9625562337927', '01688154436', 'student120@example.com', '$2y$12$ryzTiL7nGQP0k5/3Ucve3.IL1q1N0dxnomULOfIIpBx33TK6VUVIm', '7229 Brekke Rue\nPort Rainaville, NC 39008-1669', '26827 Batz Mews\nConnmouth, CA 97921-3597', 'ADM-00120', '1997-04-24', 'B', 'Arts', '2025-2026', 'Torp-Windler School', 'Edward Lebsack', 'Engineer', '01626396461', 'father120@example.com', '5741291087528', NULL, 'Leonora Dooley', 'Businesswoman', '01477465173', 'mother120@example.com', '6776899535300', NULL, 'Jodie Mitchell', '01845686051', 'guardian120@example.com', '7143323529338', 'Brother', 1, 28, 4, '2025-12-14', NULL, 2025000120, 900120, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26', '127.0.0.1', 1, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26'),
(121, 'Margot', 'Nader', '1993-11-05', 'Male', 'O-', 'Other', 'Bangladeshi', '6205563300847', '01508726234', 'student121@example.com', '$2y$12$uqmXbR5Ect7Y/yA02bgASeJebSKe6FKhIAtouopW2NT9uht8KJjI.', '3739 Jaylin Hollow Apt. 482\nSouth Vivianmouth, TN 66050', '64890 Konopelski Ranch Apt. 225\nOlinfort, VA 35091-8312', 'ADM-00121', '2013-12-05', 'A', 'Commerce', '2025-2026', 'Turcotte-Harris School', 'Dr. Seamus Abernathy', 'Farmer', '01929514779', 'father121@example.com', '4679996051557', NULL, 'Mrs. Ila Conn', 'Doctor', '01573248854', 'mother121@example.com', '6717679904030', NULL, 'Rico Kozey III', '01593645331', 'guardian121@example.com', '4859947902278', 'Aunt', 1, 24, 3, '2025-12-14', NULL, 2025000121, 900121, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26', '127.0.0.1', 1, NULL, '2025-12-14 06:05:26', '2025-12-14 06:05:26'),
(122, 'Sarai', 'Champlin', '1984-06-26', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '2099368187118', '01709010336', 'student122@example.com', '$2y$12$UjAKppEEmNN6AJd4xU2ss.PZKhDiD59gg7F8Mxh/T7iqh94eSkoqG', '5674 Cristobal Dale\nNew Blairhaven, WI 07315', '136 Kutch Parkways\nErdmanbury, VA 36143', 'ADM-00122', '1988-06-09', 'A', 'Arts', '2025-2026', 'Jenkins, Stracke and Hermann School', 'Mr. Miles Pacocha Jr.', 'Farmer', '01977216404', 'father122@example.com', '9421899043273', NULL, 'Johanna Runte DDS', 'Housewife', '01525458802', 'mother122@example.com', '8988188544870', NULL, 'Jaquelin Stokes', '01704110341', 'guardian122@example.com', '8924893152262', 'Sister', 1, 25, 3, '2025-12-14', NULL, 2025000122, 900122, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27', '127.0.0.1', 1, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27'),
(123, 'Claudia', 'Waters', '1983-02-21', 'Other', 'O+', 'Other', 'Bangladeshi', '2250761497451', '01407129580', 'student123@example.com', '$2y$12$Xz0sB6OLMNjDKfOH77pOCONM1SElSU3uK0WYJniUYHLWwbqq38dXe', '791 Vidal Valleys\nShannyview, WY 22199', '96979 Frankie Circle\nKertzmannview, MI 61200-5111', 'ADM-00123', '2004-06-25', 'C', 'Arts', '2025-2026', 'Paucek PLC School', 'Casper Eichmann Jr.', 'Farmer', '01712799446', 'father123@example.com', '0920252156321', NULL, 'Estel Romaguera II', 'Teacher', '01944286881', 'mother123@example.com', '5340138382856', NULL, 'Mr. Bertha Lehner PhD', '01587545724', 'guardian123@example.com', '6360086592772', 'Sister', 1, 18, 5, '2025-12-14', NULL, 2025000123, 900123, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27', '127.0.0.1', 1, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27'),
(124, 'Jeremy', 'Jaskolski', '2000-05-08', 'Male', 'A+', 'Other', 'Bangladeshi', '5445843011326', '01341642800', 'student124@example.com', '$2y$12$UyHRNq8IXYwtRpNoJtbDkOvwwRyrcWsWOBxKbfwy/bCmHR6smMRBO', '877 Alisha Trail\nRatkeville, AK 21938-5947', '94834 Pete Vista\nNew Lamarmouth, MT 23861', 'ADM-00124', '2001-10-26', 'B', 'Arts', '2025-2026', 'Kub-Schiller School', 'Cornell Jones III', 'Businessman', '01388724090', 'father124@example.com', '8634529193922', NULL, 'Ms. Adele Carroll', 'Nurse', '01952229413', 'mother124@example.com', '0948925407716', NULL, 'Ron Murray', '01756738640', 'guardian124@example.com', '5636237836492', 'Brother', 1, 19, 5, '2025-12-14', NULL, 2025000124, 900124, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27', '127.0.0.1', 1, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27'),
(125, 'Brittany', 'VonRueden', '2002-03-28', 'Other', 'A-', 'Islam', 'Bangladeshi', '1893448044216', '01389217837', 'student125@example.com', '$2y$12$QDHVje6dwTBeCeQqHEViSO4Y7RroCeVsoPe1XingbZIojjBi5fzJe', '50385 Walsh Loop\nPort Aric, MI 86073-6286', '813 Senger Freeway Suite 369\nSouth Maurinehaven, MA 24111', 'ADM-00125', '2021-10-12', 'A', 'Science', '2025-2026', 'Lakin Inc School', 'Prof. Coleman Ferry IV', 'Businessman', '01523576995', 'father125@example.com', '2814191704682', NULL, 'Nettie Stamm', 'Teacher', '01459053769', 'mother125@example.com', '8553535718713', NULL, 'Dr. Luigi Effertz', '01813141603', 'guardian125@example.com', '3353178841738', 'Grandparent', 1, 23, 2, '2025-12-14', NULL, 2025000125, 900125, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27', '127.0.0.1', 1, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27'),
(126, 'Susan', 'Schinner', '2024-04-23', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '8065785806641', '01609010102', 'student126@example.com', '$2y$12$EqKkM7j4NN.87h6a1YKtdObYxhJSwlfmDsiB7IByjc0bLfuTbuewW', '348 Bergstrom Junction\nPort Raheemmouth, NY 57876-6809', '49494 Brayan Manor\nJacintheshire, LA 63874', 'ADM-00126', '1982-11-18', 'B', 'Science', '2025-2026', 'Lindgren, Mohr and Nicolas School', 'Dr. Valentin Daugherty PhD', 'Businessman', '01551990811', 'father126@example.com', '7900862401856', NULL, 'Miss Florine Gottlieb', 'Housewife', '01709651399', 'mother126@example.com', '4301656972578', NULL, 'Michael Berge', '01547426129', 'guardian126@example.com', '3069237181903', 'Uncle', 1, 20, 5, '2025-12-14', NULL, 2025000126, 900126, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27', '127.0.0.1', 1, NULL, '2025-12-14 06:05:27', '2025-12-14 06:05:27'),
(127, 'Bernard', 'Kub', '1987-07-29', 'Female', 'O+', 'Other', 'Bangladeshi', '8297513044624', '01641383331', 'student127@example.com', '$2y$12$VJak8X7YDrNr2qzy/jzXoOft7hU302W8z1qRDNR1cUvw8YiCYmeZi', '981 Art Mountains\nSebastianport, HI 68049-8269', '53450 Mitchell Highway Apt. 508\nManuelamouth, WA 83454', 'ADM-00127', '1994-10-28', 'C', 'Commerce', '2025-2026', 'Ziemann LLC School', 'Alexandre Schimmel', 'Businessman', '01941818131', 'father127@example.com', '8424976331008', NULL, 'Ms. Lora Reinger', 'Doctor', '01639055737', 'mother127@example.com', '3400923453513', NULL, 'Arnulfo Schuster', '01624820892', 'guardian127@example.com', '5380541898772', 'Brother', 1, 31, 1, '2025-12-14', NULL, 2025000127, 900127, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28', '127.0.0.1', 1, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28'),
(128, 'Alberta', 'Nolan', '1973-07-01', 'Female', 'A-', 'Buddhist', 'Bangladeshi', '0880341677497', '01898050296', 'student128@example.com', '$2y$12$mNmKdj8F5hZLzGatO/UNI.iFduEyfGdMIv.O/aUqNmrAWZb/0qDb.', '325 Kulas Skyway\nElishire, AR 03654-1155', '327 Heather Spurs Suite 452\nHartmannchester, NE 01272', 'ADM-00128', '1993-11-17', 'C', 'Science', '2025-2026', 'Glover-Gottlieb School', 'Christophe Beahan', 'Businessman', '01530428191', 'father128@example.com', '8349399388988', NULL, 'Janiya Kessler', 'Doctor', '01362544522', 'mother128@example.com', '9632999295875', NULL, 'Fern Muller', '01816425385', 'guardian128@example.com', '7360387748152', 'Sister', 1, 32, 1, '2025-12-14', NULL, 2025000128, 900128, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28', '127.0.0.1', 1, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28'),
(129, 'Meta', 'Waelchi', '1986-07-02', 'Other', 'AB+', 'Islam', 'Bangladeshi', '6394137509915', '01813924020', 'student129@example.com', '$2y$12$5sMcim/YccDCyAkRq4V/UuMATHIcb0.EyzF66Oia16JzhwXnlJzUG', '861 Schultz Rue Apt. 450\nNew Sabinahaven, WY 15264-7391', '540 Jordyn Ports Suite 055\nRusselton, LA 54587', 'ADM-00129', '2016-02-11', 'C', 'Arts', '2025-2026', 'Quitzon LLC School', 'Ross Senger', 'Engineer', '01821170828', 'father129@example.com', '2090297085160', NULL, 'Kenna Rosenbaum', 'Doctor', '01387844100', 'mother129@example.com', '7609913932635', NULL, 'Nikolas Haag', '01955301705', 'guardian129@example.com', '1089188169060', 'Sister', 1, 26, 3, '2025-12-14', NULL, 2025000129, 900129, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28', '127.0.0.1', 1, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28'),
(130, 'Connor', 'Zboncak', '1997-11-16', 'Female', 'AB-', 'Christian', 'Bangladeshi', '3032638417782', '01811346324', 'student130@example.com', '$2y$12$g1AQ4Uetmeo8gXB5GtyOTePFJsTMKOvQPxBAV8x9eNPi75t6jE/vy', '14603 Faye Via\nPort Giuseppe, MD 45337-5154', '8686 Daphne Harbors Apt. 114\nLake Oswaldo, CO 45183-4489', 'ADM-00130', '1985-11-24', 'A', 'Arts', '2025-2026', 'Williamson, Shields and Halvorson School', 'Faustino Hauck', 'Engineer', '01993011466', 'father130@example.com', '7431415037161', NULL, 'Candace Hauck', 'Nurse', '01567195495', 'mother130@example.com', '8818693782632', NULL, 'Dillon Bailey', '01863957439', 'guardian130@example.com', '1234623248608', 'Uncle', 1, 33, 1, '2025-12-14', NULL, 2025000130, 900130, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28', '127.0.0.1', 1, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28'),
(131, 'Marielle', 'Lubowitz', '2017-01-20', 'Male', 'AB-', 'Islam', 'Bangladeshi', '6129675541581', '01610170794', 'student131@example.com', '$2y$12$fbPPks/fMOmCWC3P9lYy9uHxuuWOyVaYYFg649R/7N9D3aorx3/Za', '10460 Mraz Heights Suite 605\nSouth Brisa, IA 08598', '586 Schamberger Curve Apt. 328\nNew Lexus, IN 21328-8337', 'ADM-00131', '1999-12-06', 'C', 'Science', '2025-2026', 'Schimmel PLC School', 'Gavin Huel MD', 'Businessman', '01646017365', 'father131@example.com', '2533904454382', NULL, 'Kiara Hagenes', 'Businesswoman', '01908238864', 'mother131@example.com', '6357271785089', NULL, 'Hosea Kunze', '01673301831', 'guardian131@example.com', '1998216923744', 'Uncle', 1, 24, 2, '2025-12-14', NULL, 2025000131, 900131, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28', '127.0.0.1', 1, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28'),
(132, 'Clement', 'Stroman', '2019-05-03', 'Female', 'A-', 'Christian', 'Bangladeshi', '2428721433181', '01903143691', 'student132@example.com', '$2y$12$WP5UM0K.s/kzdkv7EM273etQ8XqD.L0xLivU.vE7vvseJexkZzlXO', '66648 Everette Street Apt. 227\nMarcellusview, NJ 75283', '3565 Tatyana Walk\nPort Alessiaborough, NC 83916', 'ADM-00132', '1972-08-20', 'C', 'Commerce', '2025-2026', 'Tremblay Inc School', 'Prof. Milton Toy Jr.', 'Doctor', '01566767415', 'father132@example.com', '6607466172660', NULL, 'Jaquelin Connelly', 'Nurse', '01668611650', 'mother132@example.com', '2995714342593', NULL, 'Antonette Jast', '01798879482', 'guardian132@example.com', '2367591536375', 'Sister', 1, 25, 2, '2025-12-14', NULL, 2025000132, 900132, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28', '127.0.0.1', 1, NULL, '2025-12-14 06:05:28', '2025-12-14 06:05:28'),
(133, 'Garth', 'Skiles', '2022-08-18', 'Male', 'B+', 'Christian', 'Bangladeshi', '7888664524800', '01662785824', 'student133@example.com', '$2y$12$bvRez3DevYo/pfyQ.vUXLORho8i9Kt5Jthhw82Cj63Y06behLS3jK', '295 VonRueden Vista Apt. 773\nNew Raul, MT 45167-9522', '50934 King River\nJohnstonhaven, OR 06276-2281', 'ADM-00133', '1975-11-04', 'C', 'Science', '2025-2026', 'Harvey-Bayer School', 'Erick Bradtke', 'Farmer', '01502729465', 'father133@example.com', '7496136307385', NULL, 'Ms. Emmalee Ondricka IV', 'Nurse', '01314041753', 'mother133@example.com', '2666503657271', NULL, 'Serenity Boehm II', '01622591961', 'guardian133@example.com', '0264091968835', 'Sister', 1, 34, 1, '2025-12-14', NULL, 2025000133, 900133, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29', '127.0.0.1', 1, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29'),
(134, 'Cheyenne', 'Dickinson', '2025-08-29', 'Female', 'A-', 'Hindu', 'Bangladeshi', '6353130620167', '01355507138', 'student134@example.com', '$2y$12$CHUnBgACbxvBdCGy9gMDde3IWpbhSL1grYWY0A1dnQv9.AgWJ9wE.', '1550 Fern Locks Suite 771\nLeschfort, MI 09281', '8457 Yessenia Grove Apt. 351\nGilbertoton, IA 64705-2124', 'ADM-00134', '2025-06-30', 'B', 'Science', '2025-2026', 'Jenkins PLC School', 'Dr. Jalon Jerde III', 'Doctor', '01806664306', 'father134@example.com', '8096856753229', NULL, 'Maida Dooley II', 'Housewife', '01674379651', 'mother134@example.com', '2617302873468', NULL, 'Barney Abbott IV', '01629966511', 'guardian134@example.com', '4791739617893', 'Sister', 1, 27, 3, '2025-12-14', NULL, 2025000134, 900134, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29', '127.0.0.1', 1, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29'),
(135, 'Durward', 'Kassulke', '2012-09-23', 'Other', 'O+', 'Christian', 'Bangladeshi', '9584341553538', '01396904519', 'student135@example.com', '$2y$12$irP9HiuaKGiQr4yaVdK6Ye0uIJ17SziHWyRB/jk4HPi3gjQihiJ5y', '3592 Boehm Causeway Suite 189\nRosaliafurt, OH 09994', '527 Ben Spring Apt. 276\nSkylarton, WI 53778-2273', 'ADM-00135', '2013-06-25', 'A', 'Commerce', '2025-2026', 'Kunze PLC School', 'Oren Zulauf', 'Engineer', '01520789020', 'father135@example.com', '9078714077895', NULL, 'Prof. Burdette Heaney V', 'Businesswoman', '01665718078', 'mother135@example.com', '0540863019907', NULL, 'Curt Langosh', '01498734366', 'guardian135@example.com', '0519108895151', 'Brother', 1, 29, 4, '2025-12-14', NULL, 2025000135, 900135, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29', '127.0.0.1', 1, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29'),
(136, 'Alyce', 'Heaney', '2007-01-08', 'Female', 'O-', 'Christian', 'Bangladeshi', '6482663140515', '01839925778', 'student136@example.com', '$2y$12$L.KhxSAX.hXGG8slRIIkjeBNJp8g.aAA2KTHDEmpBWSDEMyY2ekui', '59481 Hansen Trail Suite 084\nSouth Janicemouth, VA 06911-7050', '158 Swift Well Apt. 685\nReinastad, AZ 01799', 'ADM-00136', '1986-05-21', 'B', 'Arts', '2025-2026', 'Hammes-Christiansen School', 'Casimir Smith', 'Farmer', '01505648786', 'father136@example.com', '2383390674487', NULL, 'Providenci Cruickshank', 'Businesswoman', '01996476063', 'mother136@example.com', '8607199472406', NULL, 'Domenick Ondricka III', '01466635200', 'guardian136@example.com', '4846526886632', 'Brother', 1, 26, 2, '2025-12-14', NULL, 2025000136, 900136, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29', '127.0.0.1', 1, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29'),
(137, 'Jarvis', 'Beahan', '2020-03-07', 'Other', 'B+', 'Other', 'Bangladeshi', '1069662669558', '01632277729', 'student137@example.com', '$2y$12$F5pbExDe0b4ibzNommi49.VOQw7w/3CLSLpmchyFUxVLwu30TOLCi', '59952 Lehner Meadows\nWest Charley, NV 30676-4932', '899 Bella Forge Suite 142\nNorth Pierremouth, SD 82318', 'ADM-00137', '2009-06-14', 'C', 'Arts', '2025-2026', 'Wolff LLC School', 'Vince Boehm', 'Businessman', '01644461715', 'father137@example.com', '2035116984666', NULL, 'Mrs. Edythe Koelpin DDS', 'Housewife', '01804619966', 'mother137@example.com', '4699954695579', NULL, 'Jaylan Oberbrunner', '01584593628', 'guardian137@example.com', '3757427907515', 'Grandparent', 1, 35, 1, '2025-12-14', NULL, 2025000137, 900137, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29', '127.0.0.1', 1, NULL, '2025-12-14 06:05:29', '2025-12-14 06:05:29'),
(138, 'Odie', 'Towne', '1994-05-27', 'Other', 'B+', 'Buddhist', 'Bangladeshi', '2173939204486', '01435786996', 'student138@example.com', '$2y$12$L3BaQdUYz4VEyg9HLfyc1.aLJ52cbFTyP3K.pWyVTTZtqGnS/.o0K', '78455 Rolando Via Apt. 299\nMarcelport, AK 54483', '18665 Lynch Oval\nColechester, MS 71935-0460', 'ADM-00138', '2016-08-24', 'A', 'Commerce', '2025-2026', 'Okuneva, Walker and Nolan School', 'Dr. Hollis Dare', 'Teacher', '01305588539', 'father138@example.com', '4539983332724', NULL, 'Wilma Hessel', 'Businesswoman', '01350959711', 'mother138@example.com', '0489040779302', NULL, 'Mercedes Romaguera', '01721434086', 'guardian138@example.com', '4575568623711', 'Brother', 1, 28, 3, '2025-12-14', NULL, 2025000138, 900138, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30', '127.0.0.1', 1, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30'),
(139, 'Green', 'Mertz', '1994-11-13', 'Other', 'AB-', 'Other', 'Bangladeshi', '1159083765023', '01485888784', 'student139@example.com', '$2y$12$YhTsChTNGseNZBraeIOorui4uurEkix.n/oB4obs8ch148Q58EjwS', '178 Jon Square\nWest Paulfurt, NM 48648-6335', '19870 Tremblay Island Suite 608\nWest Kaley, WY 14466-9132', 'ADM-00139', '1995-03-20', 'A', 'Science', '2025-2026', 'Okuneva-Gerlach School', 'Sofia Spencer', 'Farmer', '01500990178', 'father139@example.com', '7425554576659', NULL, 'Prof. Arvilla Hauck', 'Housewife', '01968347250', 'mother139@example.com', '0985800832919', NULL, 'Felix West', '01450573315', 'guardian139@example.com', '0905703969094', 'Uncle', 1, 21, 5, '2025-12-14', NULL, 2025000139, 900139, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30', '127.0.0.1', 1, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30'),
(140, 'Donavon', 'Conn', '1988-12-07', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '2793360816164', '01833327101', 'student140@example.com', '$2y$12$Bgykmo8uMA1/Y5mN1xP5a.frN6sNsY8g5BBIC0LEAN7QtnU5FbZw6', '7887 Danny Via Suite 503\nRatkeport, FL 27463', '608 Haag Station Suite 166\nJonesborough, UT 94938', 'ADM-00140', '2018-11-08', 'B', 'Science', '2025-2026', 'Green, Williamson and Rohan School', 'Keaton Koch MD', 'Doctor', '01355904197', 'father140@example.com', '9623800120585', NULL, 'Laurie Bode', 'Housewife', '01686698603', 'mother140@example.com', '4636321143341', NULL, 'Brendan Morissette', '01419960965', 'guardian140@example.com', '6221420202301', 'Sister', 1, 29, 3, '2025-12-14', NULL, 2025000140, 900140, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30', '127.0.0.1', 1, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30'),
(141, 'Dayton', 'Schumm', '2018-09-15', 'Female', 'B-', 'Other', 'Bangladeshi', '0703337758316', '01320694841', 'student141@example.com', '$2y$12$UnQ08uLkj7nM9yQkTdhraOrsA6gtjXlS.U9wKH6o1MYvUdvYKK34m', '2349 Jakubowski Key\nPort Ethaland, NE 74855', '9610 Jodie Lakes Suite 326\nKeeleyside, MI 75497', 'ADM-00141', '2017-05-24', 'C', 'Arts', '2025-2026', 'Muller PLC School', 'Mr. Robert Fritsch', 'Teacher', '01582814810', 'father141@example.com', '8227529072457', NULL, 'April Champlin', 'Housewife', '01802776833', 'mother141@example.com', '8799104810724', NULL, 'Dr. Reid Bosco', '01480612580', 'guardian141@example.com', '1773446354916', 'Brother', 1, 30, 3, '2025-12-14', NULL, 2025000141, 900141, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30', '127.0.0.1', 1, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30'),
(142, 'Lonnie', 'Leannon', '2006-08-28', 'Male', 'B+', 'Christian', 'Bangladeshi', '2014873820871', '01344143062', 'student142@example.com', '$2y$12$EasGX/dzY.TDIsawbDNAg.frs34.cpIWRXPdEm6MMYswiJG0VUefi', '184 Luettgen Ranch\nSouth Amina, UT 95150-7342', '6154 Tromp Court Apt. 278\nChanceport, MA 79905', 'ADM-00142', '1998-12-05', 'C', 'Commerce', '2025-2026', 'Veum Group School', 'Ryan Maggio', 'Doctor', '01496618204', 'father142@example.com', '0638024619552', NULL, 'Dr. Valerie Kutch MD', 'Doctor', '01740383814', 'mother142@example.com', '5630405318548', NULL, 'Mr. Quinn Reichert', '01645757782', 'guardian142@example.com', '7476259033916', 'Aunt', 1, 31, 3, '2025-12-14', NULL, 2025000142, 900142, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30', '127.0.0.1', 1, NULL, '2025-12-14 06:05:30', '2025-12-14 06:05:30'),
(143, 'Brenna', 'Schaden', '2002-01-17', 'Male', 'O-', 'Islam', 'Bangladeshi', '0684917387446', '01624024463', 'student143@example.com', '$2y$12$ZtlAM/lH9FW40Bve73CGGOl4SeZd58myO2mXOiqul1aXIpprMVwzC', '16710 Kerluke Corner\nLake Turner, NE 88562', '3022 Hagenes Falls\nJustonfort, KS 16743-2127', 'ADM-00143', '2021-06-19', 'A', 'Commerce', '2025-2026', 'Treutel, Homenick and Lynch School', 'Felix Reilly', 'Doctor', '01749119746', 'father143@example.com', '1303531361139', NULL, 'Prof. Prudence Leuschke', 'Housewife', '01835753682', 'mother143@example.com', '1316342823104', NULL, 'Cordia Pollich Sr.', '01309227066', 'guardian143@example.com', '4716386605964', 'Sister', 1, 30, 4, '2025-12-14', NULL, 2025000143, 900143, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31', '127.0.0.1', 1, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31'),
(144, 'Audreanne', 'Weimann', '2022-07-09', 'Male', 'AB+', 'Buddhist', 'Bangladeshi', '0501145615262', '01414151732', 'student144@example.com', '$2y$12$gvpgvHd9ly5OhPeFhpeTeO8lWFjpewVvfxsjx4T1UPe4wPEGzDGXK', '278 Pouros Lodge\nPort Sierraside, HI 45032-4107', '86058 VonRueden Gardens Apt. 080\nPort Jazmyne, CA 34851', 'ADM-00144', '2024-01-21', 'A', 'Commerce', '2025-2026', 'Lueilwitz-Von School', 'John Dibbert', 'Engineer', '01792872664', 'father144@example.com', '7193607426914', NULL, 'Miss Audreanne Lakin', 'Businesswoman', '01380954204', 'mother144@example.com', '0546472237602', NULL, 'Cleve Zboncak', '01441993032', 'guardian144@example.com', '6781642087655', 'Sister', 1, 27, 2, '2025-12-14', NULL, 2025000144, 900144, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31', '127.0.0.1', 1, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31'),
(145, 'Henriette', 'Murphy', '1980-10-10', 'Other', 'A-', 'Christian', 'Bangladeshi', '0660901604765', '01883443778', 'student145@example.com', '$2y$12$F5GNdWZSri230pQLLMqkd.4Ve2DDmvIaVly8tuHwzyh2NEnBA864y', '12561 Felix Walk Suite 428\nEast Presley, OH 06753-1579', '501 Felipa Inlet Apt. 013\nNorth Pansy, TX 24770-4328', 'ADM-00145', '1978-07-11', 'B', 'Arts', '2025-2026', 'Graham LLC School', 'Alexie Corkery', 'Farmer', '01660723074', 'father145@example.com', '2556524292106', NULL, 'Lorena Hamill', 'Housewife', '01694563309', 'mother145@example.com', '4140394178545', NULL, 'Tianna Leannon', '01394661638', 'guardian145@example.com', '5851925109249', 'Grandparent', 1, 32, 3, '2025-12-14', NULL, 2025000145, 900145, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31', '127.0.0.1', 1, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31'),
(146, 'Ulices', 'Gleichner', '2003-10-05', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '9959426318988', '01798001020', 'student146@example.com', '$2y$12$ycR/JtGI.iYBlRw4voD1jORLuw.jdDvUvWQRfR/PAunoKiKSUJ1ue', '7002 Zoie Courts Apt. 865\nWest Everetttown, PA 16673-9053', '8398 Laurie Creek\nJayton, GA 30555', 'ADM-00146', '1987-05-31', 'B', 'Arts', '2025-2026', 'VonRueden Inc School', 'Prof. Lester Hessel', 'Doctor', '01912724275', 'father146@example.com', '4993988919422', NULL, 'Dr. Karianne Ratke', 'Businesswoman', '01927259555', 'mother146@example.com', '4812498915253', NULL, 'Miss Catalina Kuhlman', '01417627048', 'guardian146@example.com', '0868730674758', 'Grandparent', 1, 31, 4, '2025-12-14', NULL, 2025000146, 900146, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31', '127.0.0.1', 1, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31'),
(147, 'Efren', 'Miller', '1982-06-04', 'Female', 'A-', 'Hindu', 'Bangladeshi', '1243337328512', '01674897596', 'student147@example.com', '$2y$12$a8GS1LYwcOOZkaGjSGdL3u98hG2saUjpl75O7vrx3DKRThs2pFrB2', '2057 Goldner Ferry Apt. 455\nEast Brionna, VA 73683-3799', '622 Ruby Park Suite 696\nMillston, NJ 52543-6894', 'ADM-00147', '2003-05-07', 'A', 'Arts', '2025-2026', 'Wisoky, Considine and Deckow School', 'Cristopher Effertz', 'Businessman', '01751484274', 'father147@example.com', '2903040961683', NULL, 'Tess Durgan I', 'Doctor', '01675614840', 'mother147@example.com', '6012721579169', NULL, 'Jace Brakus III', '01936194066', 'guardian147@example.com', '8385153272424', 'Aunt', 1, 33, 3, '2025-12-14', NULL, 2025000147, 900147, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31', '127.0.0.1', 1, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31'),
(148, 'Sonny', 'Tromp', '1981-06-21', 'Male', 'A-', 'Christian', 'Bangladeshi', '1685270982468', '01731831563', 'student148@example.com', '$2y$12$gLfnGg0iwk1JG/k/7gZUsukG4zdCfkunvKK/D15buBkSpXud/22iq', '5059 Noemy Summit Suite 306\nSouth Danika, ND 17530-5245', '920 Irving Green Apt. 303\nSouth Antwon, MS 27769-1117', 'ADM-00148', '1979-09-16', 'C', 'Commerce', '2025-2026', 'Klocko and Sons School', 'Raul Hirthe', 'Engineer', '01613390738', 'father148@example.com', '3491015880385', NULL, 'Alexandra Jacobs', 'Housewife', '01918748081', 'mother148@example.com', '7558028140302', NULL, 'Raymundo Hills', '01867638036', 'guardian148@example.com', '7942894116275', 'Uncle', 1, 28, 2, '2025-12-14', NULL, 2025000148, 900148, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31', '127.0.0.1', 1, NULL, '2025-12-14 06:05:31', '2025-12-14 06:05:31'),
(149, 'Eino', 'Von', '2015-02-15', 'Female', 'O-', 'Islam', 'Bangladeshi', '3621945885405', '01657872911', 'student149@example.com', '$2y$12$v7E.dkL5.6wS2vsdGt0T3.GCqSUNbkrjelsxiO7gKLlMRfFtFvoqq', '907 Murazik Villages\nLauriefurt, CO 80710', '73824 Orn River Apt. 523\nEast Imogene, AZ 60768-2101', 'ADM-00149', '2015-08-19', 'A', 'Science', '2025-2026', 'Homenick-Pacocha School', 'Mr. Horace Lemke', 'Doctor', '01359367367', 'father149@example.com', '7776692250446', NULL, 'Mariela Donnelly', 'Businesswoman', '01658368045', 'mother149@example.com', '3699240392049', NULL, 'Mrs. Katarina Shanahan I', '01861088632', 'guardian149@example.com', '4112167934442', 'Sister', 1, 36, 1, '2025-12-14', NULL, 2025000149, 900149, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32', '127.0.0.1', 1, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32'),
(150, 'Eduardo', 'Aufderhar', '1983-11-02', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '7688743974775', '01818875985', 'student150@example.com', '$2y$12$ODEsaCUqFF8wjZq4Z28FT.olSrn6i14Kg5ewOyhTYonkaTWjepVtG', '43466 Wiegand Tunnel Suite 416\nPedroberg, SC 47441-0119', '572 Peggie Shore\nNew Lukasfurt, MO 72542', 'ADM-00150', '2015-05-07', 'C', 'Arts', '2025-2026', 'Heidenreich Group School', 'Mr. Kristian Doyle', 'Engineer', '01965189816', 'father150@example.com', '8261720809970', NULL, 'Sibyl Wunsch', 'Nurse', '01709996280', 'mother150@example.com', '7137984574397', NULL, 'Prof. Felipe Tromp', '01566504254', 'guardian150@example.com', '2994439015820', 'Sister', 1, 37, 1, '2025-12-14', NULL, 2025000150, 900150, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32', '127.0.0.1', 1, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32'),
(151, 'Magdalen', 'Hahn', '2004-07-09', 'Male', 'A-', 'Islam', 'Bangladeshi', '8132905165297', '01382261192', 'student151@example.com', '$2y$12$YXAoH/xqscFETBOF2R8MRuSPF.Lz0GXRvKgD2yLp/c5L7XQ.Z2nZu', '14534 Diego Hollow Apt. 768\nEast Adityaview, WV 82312-5298', '23963 Wendy Wall Suite 017\nNew Jettie, TN 01832', 'ADM-00151', '2013-07-09', 'C', 'Arts', '2025-2026', 'Champlin, Casper and Stiedemann School', 'Ahmed Sanford', 'Engineer', '01420935969', 'father151@example.com', '7536679143867', NULL, 'Ethyl Eichmann', 'Teacher', '01853687852', 'mother151@example.com', '1876504399060', NULL, 'Dr. Cyrus Heller', '01443006568', 'guardian151@example.com', '4161271282262', 'Brother', 1, 22, 5, '2025-12-14', NULL, 2025000151, 900151, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32', '127.0.0.1', 1, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32'),
(152, 'Margarete', 'Brekke', '1982-10-22', 'Male', 'B-', 'Buddhist', 'Bangladeshi', '1312663613577', '01506676513', 'student152@example.com', '$2y$12$r1wEQUWuyWwwu9hhmVxgIeDxVomZ8CY19AUYR.D7TtEIoKu.9Y1n2', '4603 Hegmann Rapids\nMosciskiton, VT 17417', '9048 Marta Mills\nAnselport, MO 35710-5279', 'ADM-00152', '1979-05-06', 'B', 'Arts', '2025-2026', 'Rodriguez, Bogisich and Walsh School', 'Dewayne Ortiz', 'Farmer', '01323898775', 'father152@example.com', '2252648751360', NULL, 'Lillie Runolfsdottir Sr.', 'Businesswoman', '01676039526', 'mother152@example.com', '9214948980650', NULL, 'Hailee Koss', '01638771327', 'guardian152@example.com', '7650043069674', 'Sister', 1, 38, 1, '2025-12-14', NULL, 2025000152, 900152, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32', '127.0.0.1', 1, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32'),
(153, 'Mortimer', 'Nitzsche', '2005-03-15', 'Other', 'O+', 'Buddhist', 'Bangladeshi', '6860142417845', '01995070882', 'student153@example.com', '$2y$12$OLAHOPFOeW6jrTIgpw/3MuFs4ar7CzwyQF/bF5j3RFEMHXrKqOpj.', '55192 Steuber Throughway Suite 049\nColestad, ND 51009-7075', '29031 Zack Cliffs\nShanonburgh, IN 49812', 'ADM-00153', '1978-08-23', 'C', 'Commerce', '2025-2026', 'Sipes, Adams and Haag School', 'Dr. Boyd Krajcik III', 'Teacher', '01683890619', 'father153@example.com', '2221075722167', NULL, 'Addison Swaniawski', 'Nurse', '01752852197', 'mother153@example.com', '6719727141909', NULL, 'Aliza Johns', '01478710014', 'guardian153@example.com', '6376569998738', 'Uncle', 1, 23, 5, '2025-12-14', NULL, 2025000153, 900153, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32', '127.0.0.1', 1, NULL, '2025-12-14 06:05:32', '2025-12-14 06:05:32'),
(154, 'Domingo', 'Runolfsson', '2023-01-10', 'Other', 'O+', 'Hindu', 'Bangladeshi', '6108982777726', '01647000152', 'student154@example.com', '$2y$12$Ca9YRRDO94l3rkRuQelNz.4OQ86EyAwYYTiD86Mz5/3teO1Fl6kom', '69686 Jaskolski Trace\nSouth Valentinaview, VT 09165-7944', '381 Spencer Mountain Apt. 757\nWadechester, CT 19083-6671', 'ADM-00154', '1998-07-04', 'A', 'Arts', '2025-2026', 'Harris-Sipes School', 'Ned Halvorson', 'Teacher', '01423167633', 'father154@example.com', '3443935202922', NULL, 'Prof. Sandra Boyer', 'Doctor', '01786015489', 'mother154@example.com', '8156176077615', NULL, 'Charlene Keeling', '01482439618', 'guardian154@example.com', '8812137952527', 'Grandparent', 1, 32, 4, '2025-12-14', NULL, 2025000154, 900154, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33', '127.0.0.1', 1, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33'),
(155, 'Eino', 'Barrows', '2002-06-26', 'Male', 'B-', 'Other', 'Bangladeshi', '7611932866755', '01728021299', 'student155@example.com', '$2y$12$5wpyIQDP.I2oilJuuzTb3OTXGE8YQ/JzpszTMgWeoW.DtduEdIX4S', '93044 Pfannerstill Harbor Suite 649\nBahringerland, ID 02412', '7568 Ritchie Keys\nHintzton, NE 52679-6688', 'ADM-00155', '1981-09-02', 'A', 'Commerce', '2025-2026', 'Nitzsche, Reichel and Beatty School', 'Sherwood West', 'Farmer', '01897555054', 'father155@example.com', '7933912246273', NULL, 'Zella Stamm', 'Housewife', '01680252169', 'mother155@example.com', '8022471786238', NULL, 'Bridget Torphy PhD', '01472309468', 'guardian155@example.com', '7985260830452', 'Uncle', 1, 39, 1, '2025-12-14', NULL, 2025000155, 900155, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33', '127.0.0.1', 1, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33'),
(156, 'Johathan', 'Hand', '1994-11-17', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '8177459516084', '01971694622', 'student156@example.com', '$2y$12$YQm4E7suxVrCcClBvksICOdKE3ekk2wEOFsYKqyD7UIMwaABnDnDa', '65231 Madeline Highway\nNorth Raymondville, HI 60978', '4944 Ratke Village\nKylieport, TX 83596-6648', 'ADM-00156', '2017-01-09', 'A', 'Commerce', '2025-2026', 'Daniel, Ryan and Fisher School', 'Dr. Abner Monahan', 'Teacher', '01994219359', 'father156@example.com', '7345266666420', NULL, 'Yasmine Watsica', 'Doctor', '01363263046', 'mother156@example.com', '3619584634106', NULL, 'Mrs. Kailey Romaguera', '01828131477', 'guardian156@example.com', '2845506171890', 'Aunt', 1, 29, 2, '2025-12-14', NULL, 2025000156, 900156, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33', '127.0.0.1', 1, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33'),
(157, 'Maximilian', 'Flatley', '1975-10-21', 'Male', 'A+', 'Hindu', 'Bangladeshi', '7730638671345', '01873769369', 'student157@example.com', '$2y$12$zLffcAzUOgf4bdhGZb4jiOpKL5oUAyzPZ.WLEdrYzuJeUeKjjmfC.', '85188 Janiya Valley Suite 745\nHowellland, MN 97986-0074', '6531 Armstrong Terrace Suite 097\nVinceburgh, IA 82416', 'ADM-00157', '1997-08-28', 'A', 'Commerce', '2025-2026', 'Erdman Group School', 'Roy Mraz', 'Businessman', '01306763677', 'father157@example.com', '2214346131071', NULL, 'Ms. Heath Corkery', 'Housewife', '01312370006', 'mother157@example.com', '1196039287497', NULL, 'Giovanna Sporer', '01450189070', 'guardian157@example.com', '2315783331166', 'Uncle', 1, 34, 3, '2025-12-14', NULL, 2025000157, 900157, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33', '127.0.0.1', 1, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33'),
(158, 'Steve', 'Dicki', '1993-03-23', 'Male', 'O-', 'Other', 'Bangladeshi', '8018567756771', '01807410892', 'student158@example.com', '$2y$12$FiizgPeAL8y4fnQroBx5eOXYAXyeO9AiG2dMn.Ihjqb/rsjfNs99a', '7845 Danielle Ramp Apt. 589\nNew Donniemouth, OK 23598-9057', '982 Lakin Walks\nTodborough, MI 90644', 'ADM-00158', '2010-08-11', 'A', 'Commerce', '2025-2026', 'Witting-Donnelly School', 'Richard Sauer DDS', 'Engineer', '01811984523', 'father158@example.com', '7096120648731', NULL, 'Carolyne Roob', 'Housewife', '01945957009', 'mother158@example.com', '4988132422468', NULL, 'Lucious Olson', '01691787643', 'guardian158@example.com', '4839582139611', 'Brother', 1, 30, 2, '2025-12-14', NULL, 2025000158, 900158, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33', '127.0.0.1', 1, NULL, '2025-12-14 06:05:33', '2025-12-14 06:05:33'),
(159, 'Alfreda', 'Waters', '1971-12-14', 'Male', 'O+', 'Other', 'Bangladeshi', '0274086854512', '01606896423', 'student159@example.com', '$2y$12$UiTbimYPd.EjiBV04zK53Om1Vdt8sX6tN2nNPUnxRNcrvg6XCvvYO', '542 Pietro Well\nCummingsmouth, NH 13483-4329', '53342 Ebert Inlet Apt. 231\nKuphalmouth, KS 63851', 'ADM-00159', '2009-03-29', 'B', 'Commerce', '2025-2026', 'Schaden-Gulgowski School', 'Jameson Bauch', 'Teacher', '01998976190', 'father159@example.com', '5454493877499', NULL, 'Eryn Hackett', 'Nurse', '01844799008', 'mother159@example.com', '8079296597618', NULL, 'Mr. Enos Lebsack', '01626774519', 'guardian159@example.com', '4495328899899', 'Sister', 1, 33, 4, '2025-12-14', NULL, 2025000159, 900159, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34', '127.0.0.1', 1, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34'),
(160, 'Lionel', 'Okuneva', '1970-03-25', 'Other', 'B-', 'Buddhist', 'Bangladeshi', '5086164299150', '01579965706', 'student160@example.com', '$2y$12$4Y3BAmbXGqdudZeu.vjOe.XZBV/DB2YNbVYbcc/DL1KKUONE5oSk2', '622 Leffler Tunnel\nSchusterburgh, OH 01824-8001', '20098 Ferry Circles\nLake Thad, WY 96670-9124', 'ADM-00160', '1998-09-13', 'A', 'Science', '2025-2026', 'Ward PLC School', 'Floyd Pacocha PhD', 'Teacher', '01903918231', 'father160@example.com', '0800880579166', NULL, 'Emie Spencer', 'Teacher', '01733610194', 'mother160@example.com', '0079113080379', NULL, 'Myrtis Stracke', '01478838182', 'guardian160@example.com', '3382767654371', 'Sister', 1, 34, 4, '2025-12-14', NULL, 2025000160, 900160, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34', '127.0.0.1', 1, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34'),
(161, 'Hermina', 'Gusikowski', '1997-06-04', 'Other', 'B-', 'Islam', 'Bangladeshi', '9092073331973', '01707453393', 'student161@example.com', '$2y$12$klZULxWmqcYuuhFLtpDWZOp7AV6EeofqnItILgdSTcQDzI3aE/I5C', '766 Kristin Locks\nSouth Elenorafurt, WY 87877-2726', '66112 Dino Place\nEast Deltaview, KS 16248', 'ADM-00161', '2020-12-11', 'C', 'Arts', '2025-2026', 'Hintz LLC School', 'Doris Barrows', 'Doctor', '01424992169', 'father161@example.com', '8418987246509', NULL, 'Dr. Lura Greenholt Jr.', 'Businesswoman', '01812986207', 'mother161@example.com', '9294792682413', NULL, 'Fredy Turner', '01750004563', 'guardian161@example.com', '5172280148298', 'Sister', 1, 40, 1, '2025-12-14', NULL, 2025000161, 900161, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34', '127.0.0.1', 1, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34'),
(162, 'Jannie', 'Reichert', '2025-05-21', 'Male', 'O-', 'Hindu', 'Bangladeshi', '4054310352707', '01417579495', 'student162@example.com', '$2y$12$Ge3TdeR.G1glOee/7nttdOO9MV2eIzZHhy55ZKGbV26Gt2gkNmQ9m', '65673 Towne Trafficway Suite 579\nSouth Rosannaland, SD 40078-8397', '558 Lemke Dam\nEast Tyree, ID 01101', 'ADM-00162', '1995-01-13', 'B', 'Arts', '2025-2026', 'Baumbach-Schroeder School', 'Scottie McKenzie', 'Engineer', '01451378061', 'father162@example.com', '3914777523843', NULL, 'Summer Gulgowski', 'Businesswoman', '01335277697', 'mother162@example.com', '3252046686594', NULL, 'Kennedi Ruecker', '01591361881', 'guardian162@example.com', '5982092647366', 'Aunt', 1, 35, 3, '2025-12-14', NULL, 2025000162, 900162, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34', '127.0.0.1', 1, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34'),
(163, 'Juana', 'O\'Keefe', '2024-06-09', 'Other', 'O+', 'Islam', 'Bangladeshi', '1906082322808', '01973998815', 'student163@example.com', '$2y$12$wj931IVctEjCTQnJ1QZq4eR9x3QEDNve..bQLASaJJncljUmIqf36', '37603 Schuster Lock\nLavonborough, WI 28774-4580', '612 Stokes Hills\nJayceville, OK 43913', 'ADM-00163', '2007-03-13', 'B', 'Commerce', '2025-2026', 'Dooley-Cummings School', 'Tristian Schowalter', 'Businessman', '01351031424', 'father163@example.com', '9261534284888', NULL, 'Hope Mosciski', 'Doctor', '01777783256', 'mother163@example.com', '7104856105500', NULL, 'Shayna O\'Reilly', '01954911010', 'guardian163@example.com', '3111978574167', 'Grandparent', 1, 24, 5, '2025-12-14', NULL, 2025000163, 900163, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34', '127.0.0.1', 1, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34'),
(164, 'Seamus', 'Grimes', '1977-11-26', 'Other', 'AB-', 'Hindu', 'Bangladeshi', '8866205558681', '01480033431', 'student164@example.com', '$2y$12$d70x.8QOQQW/oSCOP0UAWuvVHJxh53xGyUZfvzBwAZQrAfgU1rkS.', '29436 Elena Shoals\nKirlinbury, ID 87756-3947', '760 Williamson Expressway\nNew Anissa, PA 48478-0825', 'ADM-00164', '1970-02-20', 'C', 'Science', '2025-2026', 'Swift-Casper School', 'Dr. Art Hickle III', 'Engineer', '01422418954', 'father164@example.com', '4521734806403', NULL, 'Ms. Isabell Zboncak Jr.', 'Teacher', '01864969537', 'mother164@example.com', '5650853149717', NULL, 'Prof. Sofia Nikolaus II', '01606714367', 'guardian164@example.com', '9910103189649', 'Sister', 1, 25, 5, '2025-12-14', NULL, 2025000164, 900164, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34', '127.0.0.1', 1, NULL, '2025-12-14 06:05:34', '2025-12-14 06:05:34'),
(165, 'Sadye', 'Gutmann', '2016-08-26', 'Female', 'B+', 'Other', 'Bangladeshi', '7386707275105', '01435127020', 'student165@example.com', '$2y$12$OXIRU25eFyMNF7.wNZVUKet49L8NFONb.9GLQbCyRZCm7Cd2h8Peq', '498 Octavia Pike Apt. 546\nPort Everardofort, RI 14818', '29939 Ernesto Rue Apt. 248\nPort Daijachester, NV 47595-0244', 'ADM-00165', '1998-07-02', 'A', 'Arts', '2025-2026', 'Boyle, Haag and Cruickshank School', 'Dr. Gonzalo Simonis V', 'Doctor', '01628223911', 'father165@example.com', '3233288342721', NULL, 'Carlee O\'Reilly', 'Businesswoman', '01858344387', 'mother165@example.com', '6900260949137', NULL, 'Marquis Parker', '01741286119', 'guardian165@example.com', '7030433381398', 'Grandparent', 1, 36, 3, '2025-12-14', NULL, 2025000165, 900165, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35', '127.0.0.1', 1, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35'),
(166, 'Terrance', 'Torp', '1990-07-29', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '8371313169731', '01461869612', 'student166@example.com', '$2y$12$NrW8WAmMCzBPYFF2EdAln.Ecqc4KnTfhaJU5WWmFBM6ieJld2krnO', '1719 Graham Cove\nJerrodland, VT 13727-1724', '45330 Moore Light Apt. 983\nSouth Rosie, TN 80767', 'ADM-00166', '1996-01-12', 'B', 'Commerce', '2025-2026', 'Pfannerstill Group School', 'Mr. Zackary McGlynn III', 'Teacher', '01679508626', 'father166@example.com', '3972113235677', NULL, 'Johanna Swaniawski', 'Housewife', '01882143505', 'mother166@example.com', '7947313206779', NULL, 'Sonny Cole', '01319620058', 'guardian166@example.com', '6315145084474', 'Sister', 1, 31, 2, '2025-12-14', NULL, 2025000166, 900166, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35', '127.0.0.1', 1, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35'),
(167, 'Shania', 'Morissette', '2025-04-17', 'Male', 'B+', 'Buddhist', 'Bangladeshi', '9854170767588', '01754088581', 'student167@example.com', '$2y$12$OGmBo6q31hvZV1PV.JVG.O9Q1JAZUmIIVCYNcJVbCzrGv2IFCIR7a', '5718 Baby Lodge\nVandervortborough, CT 95087', '8121 Aufderhar Unions\nLake Jarrettshire, MO 91773', 'ADM-00167', '1975-04-27', 'A', 'Science', '2025-2026', 'Fahey Group School', 'Kamron Pagac', 'Doctor', '01599687055', 'father167@example.com', '7832377560851', NULL, 'Marquise Shanahan', 'Teacher', '01862135561', 'mother167@example.com', '5639290550319', NULL, 'Dr. Stewart Smitham', '01738366755', 'guardian167@example.com', '1292023731096', 'Aunt', 1, 32, 2, '2025-12-14', NULL, 2025000167, 900167, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35', '127.0.0.1', 1, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35'),
(168, 'Gabe', 'Rau', '1972-09-07', 'Other', 'O-', 'Hindu', 'Bangladeshi', '1039581171317', '01759423746', 'student168@example.com', '$2y$12$8kLbXcdsAJ199Qg5NBlgaubKtu1ExuM86yZHe5asPAaFJ3GB0c.lS', '700 Eugene Mountain\nSouth Dannie, AZ 40164-6027', '545 Kuvalis Prairie\nSouth Mitchelmouth, MT 44650-0246', 'ADM-00168', '1991-07-13', 'A', 'Arts', '2025-2026', 'Wolf, Howell and Baumbach School', 'Sanford Walter', 'Engineer', '01501445985', 'father168@example.com', '9063559267382', NULL, 'Lacey Cartwright', 'Teacher', '01488614165', 'mother168@example.com', '1012805808116', NULL, 'Godfrey Abbott', '01704213371', 'guardian168@example.com', '7923157685718', 'Uncle', 1, 41, 1, '2025-12-14', NULL, 2025000168, 900168, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35', '127.0.0.1', 1, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(169, 'Fredy', 'Grant', '2014-01-01', 'Other', 'B-', 'Islam', 'Bangladeshi', '0841113636830', '01903427783', 'student169@example.com', '$2y$12$LIsWO5anhHs0VYhb.Fq0eOCzo5IHLhGYSQufTkXBv6asNkdfrHte.', '5472 Demario Coves Apt. 612\nRunolfssonfurt, GA 55347-3417', '55869 Nasir Isle\nMadgeland, AK 67044', 'ADM-00169', '2012-03-27', 'C', 'Arts', '2025-2026', 'Kshlerin-Mraz School', 'Jerrold Johnson', 'Engineer', '01802114888', 'father169@example.com', '8082854545191', NULL, 'Ms. Cristal Reichert', 'Businesswoman', '01918902750', 'mother169@example.com', '2983032562687', NULL, 'Shaylee Bednar', '01795476347', 'guardian169@example.com', '8020520031686', 'Sister', 1, 26, 5, '2025-12-14', NULL, 2025000169, 900169, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35', '127.0.0.1', 1, NULL, '2025-12-14 06:05:35', '2025-12-14 06:05:35'),
(170, 'Charlotte', 'Rice', '1980-11-16', 'Male', 'AB+', 'Christian', 'Bangladeshi', '7957181290032', '01491919510', 'student170@example.com', '$2y$12$LOCq2UB3dybBtnDw/ZO0v.C2arTIAQojXMryCnxjdHGHl77W9..O.', '7509 Taylor Views\nAnissamouth, WV 69310', '59373 Maida Avenue Suite 491\nLake Shanashire, NH 55851-7535', 'ADM-00170', '2013-06-28', 'B', 'Commerce', '2025-2026', 'Crona-Rutherford School', 'Kamron Daugherty', 'Teacher', '01511426255', 'father170@example.com', '8411244354079', NULL, 'Zula Fadel', 'Nurse', '01766236806', 'mother170@example.com', '8865770228534', NULL, 'Guy Bernhard', '01687771902', 'guardian170@example.com', '4578364690910', 'Sister', 1, 33, 2, '2025-12-14', NULL, 2025000170, 900170, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36', '127.0.0.1', 1, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36'),
(171, 'Patrick', 'Hessel', '2019-10-16', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '9486284662760', '01421916542', 'student171@example.com', '$2y$12$cejK/Zh43ggksOYrFD7M4uKWwafqF5x6h4utyTscMWxL5Vv7uFw4i', '6652 Kerluke Cliffs Apt. 754\nStoltenbergchester, NE 66001-1713', '16081 Golda Rapid\nHintzside, GA 63510', 'ADM-00171', '1989-09-05', 'C', 'Science', '2025-2026', 'Fisher-Rodriguez School', 'Dr. Guillermo Anderson', 'Businessman', '01719141679', 'father171@example.com', '7999762681135', NULL, 'Calista Waelchi', 'Doctor', '01509329575', 'mother171@example.com', '3329874167814', NULL, 'Miss Maybelle Abbott I', '01954302931', 'guardian171@example.com', '0055477419212', 'Aunt', 1, 42, 1, '2025-12-14', NULL, 2025000171, 900171, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36', '127.0.0.1', 1, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36'),
(172, 'Jody', 'Dooley', '1970-11-21', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '4226652621094', '01799879511', 'student172@example.com', '$2y$12$a/ipmaYMDrN8a1oXvfC50uf8VMf6CGMAO0IiE7sOnBxt59goTASz2', '821 Armand Springs Apt. 947\nNew Gina, UT 58195', '979 Bailey Land Suite 920\nWest Elmore, VT 17355-0289', 'ADM-00172', '1975-08-03', 'A', 'Arts', '2025-2026', 'Kreiger LLC School', 'Johan Stanton', 'Engineer', '01589790969', 'father172@example.com', '1583993947078', NULL, 'Maureen Bailey DDS', 'Businesswoman', '01562802335', 'mother172@example.com', '8659734271931', NULL, 'Ms. Berneice Haag', '01685820880', 'guardian172@example.com', '5135518212115', 'Uncle', 1, 35, 4, '2025-12-14', NULL, 2025000172, 900172, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36', '127.0.0.1', 1, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36'),
(173, 'Jaeden', 'Wehner', '1986-04-19', 'Male', 'AB+', 'Islam', 'Bangladeshi', '4736246869979', '01490872967', 'student173@example.com', '$2y$12$ZvQ.Rs1MUclWcPSVkpCJfuDpY9nbGPol0oQivezm3AnYIx5Oh6Hc2', '15282 Vandervort Pines Apt. 007\nGrantbury, ND 53448', '6086 Quigley Flat Apt. 101\nWest Trishaland, NE 22314-0733', 'ADM-00173', '2019-01-28', 'C', 'Arts', '2025-2026', 'Waters and Sons School', 'Misael Zemlak', 'Teacher', '01946321268', 'father173@example.com', '4060969676786', NULL, 'Miracle Wilderman', 'Nurse', '01925728391', 'mother173@example.com', '8541811372571', NULL, 'Samanta Abernathy', '01356244430', 'guardian173@example.com', '1848704910203', 'Grandparent', 1, 37, 3, '2025-12-14', NULL, 2025000173, 900173, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36', '127.0.0.1', 1, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36'),
(174, 'Wellington', 'Zboncak', '2013-06-05', 'Other', 'B-', 'Other', 'Bangladeshi', '6569716853109', '01462414905', 'student174@example.com', '$2y$12$1cENaaEISw2AMGSaOQ9s9.Y643hm1kxsdrUcGxigWQgWETuADK4ee', '4750 Dillon Mall\nMcGlynnview, MN 60178', '895 Fred Groves Apt. 464\nLiafurt, WI 60261', 'ADM-00174', '1992-10-12', 'C', 'Science', '2025-2026', 'Hand, Trantow and Ebert School', 'Cale DuBuque', 'Doctor', '01966862769', 'father174@example.com', '3912096220151', NULL, 'Margaretta Johns', 'Doctor', '01817266631', 'mother174@example.com', '2803622580796', NULL, 'Dr. Phoebe Brekke', '01629203832', 'guardian174@example.com', '9692560848557', 'Uncle', 1, 34, 2, '2025-12-14', NULL, 2025000174, 900174, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36', '127.0.0.1', 1, NULL, '2025-12-14 06:05:36', '2025-12-14 06:05:36'),
(175, 'Jarvis', 'Smith', '1995-04-13', 'Male', 'AB-', 'Hindu', 'Bangladeshi', '3954216753921', '01604511946', 'student175@example.com', '$2y$12$xBbfgmpsE.RoIR9k69tFQuvyjA4/ugmPN7UJOw8nIu2Aoje5zM2ke', '1686 Alessandro Skyway Suite 618\nMillerton, AK 33690', '46454 Waelchi Mill\nGoyettebury, MN 17526', 'ADM-00175', '2002-04-23', 'C', 'Science', '2025-2026', 'Marvin and Sons School', 'Denis Price', 'Teacher', '01400092836', 'father175@example.com', '0808209959597', NULL, 'Cydney Dach I', 'Housewife', '01643958048', 'mother175@example.com', '6851979690019', NULL, 'Randi Heller', '01923890377', 'guardian175@example.com', '1182955464322', 'Brother', 1, 27, 5, '2025-12-14', NULL, 2025000175, 900175, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37', '127.0.0.1', 1, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37'),
(176, 'Lottie', 'Bechtelar', '1983-09-06', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '4934952311016', '01583611517', 'student176@example.com', '$2y$12$upcUo5w3bwOqawQPVbPrB.3o6qDOH56N3ckiTE3zCKVNA93opapqq', '17437 Cassin Center Suite 009\nNew Randishire, WV 07489', '121 Albin Place\nPort Davidtown, ND 32774', 'ADM-00176', '1973-02-16', 'B', 'Commerce', '2025-2026', 'Kuhn, Denesik and Emmerich School', 'Gregg Leuschke IV', 'Engineer', '01746262780', 'father176@example.com', '2658244269627', NULL, 'Abby Cruickshank', 'Nurse', '01872945107', 'mother176@example.com', '4534928402389', NULL, 'Ms. Estelle Graham', '01375631706', 'guardian176@example.com', '6701075900989', 'Uncle', 1, 28, 5, '2025-12-14', NULL, 2025000176, 900176, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37', '127.0.0.1', 1, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37'),
(177, 'Marlin', 'Harvey', '1997-09-27', 'Male', 'B+', 'Islam', 'Bangladeshi', '3176326130298', '01930099214', 'student177@example.com', '$2y$12$3jyXf65s8Ad11ixXGFd0R.ZsP2eHoVCtXcBTnbwvDdOP/mSj3nhOm', '45694 Reina Vista Suite 529\nKaciberg, GA 98382-7415', '239 Colten Isle Suite 025\nNorth Arch, SC 12020', 'ADM-00177', '1978-09-30', 'A', 'Commerce', '2025-2026', 'Bergnaum Inc School', 'Giovanny Friesen', 'Doctor', '01967849047', 'father177@example.com', '1251232161531', NULL, 'Antonietta Treutel', 'Housewife', '01501946343', 'mother177@example.com', '8964345490685', NULL, 'Rosalee Ziemann', '01497140189', 'guardian177@example.com', '0086396698385', 'Sister', 1, 43, 1, '2025-12-14', NULL, 2025000177, 900177, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37', '127.0.0.1', 1, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37'),
(178, 'Riley', 'Torp', '1992-11-11', 'Female', 'B-', 'Islam', 'Bangladeshi', '1563113748234', '01553226997', 'student178@example.com', '$2y$12$C/Y6lLrw67L4QGepmEYVseUZ6n5lygSp16V9EMeqSs04mgFkWtrX.', '2302 Eryn Mission\nHermistonville, LA 53394-6907', '9767 Yost Flat\nLake Marcelina, MD 72376', 'ADM-00178', '2001-11-04', 'B', 'Science', '2025-2026', 'Schmeler, Runolfsdottir and Terry School', 'Mr. Shayne Luettgen', 'Teacher', '01535613908', 'father178@example.com', '3240314446813', NULL, 'Maryam Torp', 'Businesswoman', '01582370988', 'mother178@example.com', '4870498490864', NULL, 'Isabel Jenkins', '01343732522', 'guardian178@example.com', '4257216933268', 'Aunt', 1, 29, 5, '2025-12-14', NULL, 2025000178, 900178, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37', '127.0.0.1', 1, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37'),
(179, 'Billy', 'Little', '1991-08-18', 'Female', 'A+', 'Islam', 'Bangladeshi', '7559576705155', '01483988126', 'student179@example.com', '$2y$12$XOPqV5IzF59QnUHw0WbDDOC6/HSF9quMyF8opXaJCoUyhrYuxr4vK', '7336 Jacobson Island\nBentonstad, MS 16373-7456', '109 Jast Path Apt. 472\nBoyertown, NC 88871-3393', 'ADM-00179', '1995-11-12', 'A', 'Commerce', '2025-2026', 'Roberts, Hermiston and Dicki School', 'Ellis Thiel III', 'Businessman', '01739905974', 'father179@example.com', '0147679592952', NULL, 'Ms. Madilyn Cole DDS', 'Nurse', '01792719239', 'mother179@example.com', '9368008452428', NULL, 'Mr. Wilburn Hauck MD', '01577575430', 'guardian179@example.com', '9127664754972', 'Uncle', 1, 44, 1, '2025-12-14', NULL, 2025000179, 900179, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37', '127.0.0.1', 1, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37'),
(180, 'Arielle', 'Baumbach', '1993-07-09', 'Male', 'O+', 'Christian', 'Bangladeshi', '0341554462735', '01763914157', 'student180@example.com', '$2y$12$SlGIoRwvlv2bNNShX7fbLuLzSPa2ghaUPkNrb36vvEvwdsv1yDZqe', '135 Windler Ranch Apt. 979\nWest Colleenfort, WI 32208-3190', '810 Juwan Fields\nSouth Max, MI 93004-5427', 'ADM-00180', '1978-01-29', 'C', 'Commerce', '2025-2026', 'Bashirian and Sons School', 'Lourdes Kertzmann', 'Engineer', '01377464640', 'father180@example.com', '6220007814720', NULL, 'Rhea Gleason III', 'Nurse', '01322990429', 'mother180@example.com', '7807716884610', NULL, 'Jaycee Rempel MD', '01810760824', 'guardian180@example.com', '1258948932383', 'Uncle', 1, 30, 5, '2025-12-14', NULL, 2025000180, 900180, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37', '127.0.0.1', 1, NULL, '2025-12-14 06:05:37', '2025-12-14 06:05:37'),
(181, 'Jordy', 'Turcotte', '1990-01-17', 'Other', 'B-', 'Other', 'Bangladeshi', '4735056458642', '01308325554', 'student181@example.com', '$2y$12$nvO3ZyToDIolxghmo8g5iO1iHWyfeXSdSpt8ADG8V7PViCwUfZlQe', '4631 Wilkinson Motorway\nNew Amosmouth, FL 35384', '68217 Wolf Crescent\nOdessafurt, UT 65531-9661', 'ADM-00181', '1974-07-13', 'C', 'Commerce', '2025-2026', 'Vandervort, Kunde and Oberbrunner School', 'Dr. Elmore Cronin', 'Farmer', '01315508020', 'father181@example.com', '8033851008404', NULL, 'Dr. Callie Paucek DVM', 'Housewife', '01320476089', 'mother181@example.com', '7146552899380', NULL, 'Aileen Cremin DDS', '01820207875', 'guardian181@example.com', '4065185434370', 'Brother', 1, 31, 5, '2025-12-14', NULL, 2025000181, 900181, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38', '127.0.0.1', 1, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38'),
(182, 'Brianne', 'Dickinson', '1980-01-27', 'Female', 'AB+', 'Christian', 'Bangladeshi', '2185235747480', '01966281569', 'student182@example.com', '$2y$12$7W3waN9Tq.GG80/gA0T7EODwwXJrR9xCk3bnLs1Ht6mmoEARLfx..', '472 Raquel Neck Suite 137\nEast Jamison, MA 19797', '9831 Susie Mission Apt. 008\nDellaburgh, WA 13001', 'ADM-00182', '1992-08-10', 'A', 'Science', '2025-2026', 'Dooley PLC School', 'Junius Lemke', 'Doctor', '01434081860', 'father182@example.com', '5579039543564', NULL, 'Ms. Estell Leannon V', 'Businesswoman', '01922837599', 'mother182@example.com', '6153677083313', NULL, 'Dr. Torrance Conroy DVM', '01926795997', 'guardian182@example.com', '0257120140430', 'Aunt', 1, 36, 4, '2025-12-14', NULL, 2025000182, 900182, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38', '127.0.0.1', 1, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38'),
(183, 'Misael', 'Zulauf', '1974-05-16', 'Female', 'A-', 'Islam', 'Bangladeshi', '3661910132748', '01684026675', 'student183@example.com', '$2y$12$m6iIkusQzYstbqEBsllP2.8wUV/4J6Myc5NiwVoQlK.ZyqGnVh4yi', '3381 Breitenberg Unions\nLake Myrtis, WV 66363', '5952 Lon Extensions Apt. 933\nPort Kelly, KS 41340-1279', 'ADM-00183', '2010-04-06', 'C', 'Commerce', '2025-2026', 'Champlin, Lemke and Jaskolski School', 'Earl Runolfsdottir', 'Engineer', '01791363488', 'father183@example.com', '0611625442638', NULL, 'Nyasia Hoppe I', 'Housewife', '01468572457', 'mother183@example.com', '6327139802133', NULL, 'Leonie Goldner', '01329660410', 'guardian183@example.com', '0945874294522', 'Sister', 1, 35, 2, '2025-12-14', NULL, 2025000183, 900183, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38', '127.0.0.1', 1, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38'),
(184, 'Ben', 'Predovic', '1973-08-03', 'Female', 'AB-', 'Christian', 'Bangladeshi', '9005931187088', '01644408361', 'student184@example.com', '$2y$12$OA8gCTqY5pON3Eqgz6CZuOXSLO9.4mZD5IRAZmha0K00sD3.tMNT.', '915 Greenfelder Turnpike\nSouth Olahaven, UT 11200', '46044 Walker Terrace\nWest Victorport, FL 05807', 'ADM-00184', '1982-02-14', 'A', 'Commerce', '2025-2026', 'Ward Inc School', 'Prof. Celestino Huels II', 'Doctor', '01479735188', 'father184@example.com', '1762578755799', NULL, 'Rebekah Nader', 'Doctor', '01843199763', 'mother184@example.com', '5801769373365', NULL, 'Wilber Moore', '01356859535', 'guardian184@example.com', '0457058879699', 'Uncle', 1, 37, 4, '2025-12-14', NULL, 2025000184, 900184, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38', '127.0.0.1', 1, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38'),
(185, 'Reba', 'Monahan', '2024-08-31', 'Other', 'O+', 'Islam', 'Bangladeshi', '8427610958036', '01952074525', 'student185@example.com', '$2y$12$gsmRyZ7ryKBzG//R5whkw.MX6eHrgYzUqBsYM0Zu6b4wyP7O68wVe', '88791 Sabina Stream\nStokesberg, OR 11283', '8563 Alisa Hollow\nWest Rosalia, MA 47563', 'ADM-00185', '2002-07-27', 'B', 'Commerce', '2025-2026', 'Thompson PLC School', 'Mr. Tyson Predovic DDS', 'Doctor', '01944332860', 'father185@example.com', '1507333353501', NULL, 'Piper Hessel', 'Businesswoman', '01772557944', 'mother185@example.com', '5082812784925', NULL, 'Kaelyn Labadie', '01730692001', 'guardian185@example.com', '1334804358939', 'Brother', 1, 38, 4, '2025-12-14', NULL, 2025000185, 900185, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38', '127.0.0.1', 1, NULL, '2025-12-14 06:05:38', '2025-12-14 06:05:38'),
(186, 'Verda', 'Waelchi', '1996-11-18', 'Female', 'B-', 'Other', 'Bangladeshi', '4352233385213', '01674139041', 'student186@example.com', '$2y$12$0Xy67uk4eOwr9swWdnt6reE889FBZGKYv6l4pLFYyOqcYzLiGrMBK', '83711 Gabe Rue Suite 315\nNew Kavon, RI 46007-4123', '3820 Linnie Lake\nNew Astridshire, DC 28419-0978', 'ADM-00186', '1982-11-09', 'C', 'Arts', '2025-2026', 'Pacocha, Douglas and Gibson School', 'Mr. Colten Ruecker', 'Businessman', '01885638855', 'father186@example.com', '8767025835101', NULL, 'Kaylah Lowe I', 'Nurse', '01912070959', 'mother186@example.com', '8730455487315', NULL, 'Ms. Raegan Rodriguez', '01534303652', 'guardian186@example.com', '2146965864075', 'Brother', 1, 36, 2, '2025-12-14', NULL, 2025000186, 900186, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39', '127.0.0.1', 1, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39'),
(187, 'Rhea', 'Tremblay', '2016-06-25', 'Male', 'O-', 'Christian', 'Bangladeshi', '9775500735678', '01745569354', 'student187@example.com', '$2y$12$hLep8aQDlCvf69wY4X8sK.cqS9IrytKl/V5zetci6B8ak79fq9Jg2', '893 Upton Burg\nWolffshire, IA 50062-0268', '7552 Monahan Mountains\nRettabury, SC 22664-8549', 'ADM-00187', '2003-11-01', 'C', 'Science', '2025-2026', 'Harber-Funk School', 'Dr. Kayden Zboncak DVM', 'Businessman', '01452814435', 'father187@example.com', '9603726573689', NULL, 'Rhoda Sipes', 'Doctor', '01863494934', 'mother187@example.com', '4310648888181', NULL, 'Ewell Hermiston', '01400251579', 'guardian187@example.com', '2989414884439', 'Aunt', 1, 38, 3, '2025-12-14', NULL, 2025000187, 900187, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39', '127.0.0.1', 1, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39'),
(188, 'Hollis', 'Nienow', '2006-01-26', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '9432355647809', '01738067899', 'student188@example.com', '$2y$12$0XyFITBKXy4qzle12fWzu.1vq9lRQAW8VD9luHoQveIZ/7AJIodcq', '59074 Juston Radial\nWest Cletusside, AK 13134', '24086 Antone Lock\nNorth Sarina, NM 70153-8052', 'ADM-00188', '2015-09-15', 'B', 'Commerce', '2025-2026', 'Rau, West and Skiles School', 'Jarvis Jaskolski DDS', 'Farmer', '01419052689', 'father188@example.com', '1263943975001', NULL, 'Dr. Michelle Ebert III', 'Nurse', '01704363094', 'mother188@example.com', '7094101877868', NULL, 'Bernice Wyman PhD', '01694238335', 'guardian188@example.com', '1401290953871', 'Sister', 1, 37, 2, '2025-12-14', NULL, 2025000188, 900188, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39', '127.0.0.1', 1, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39'),
(189, 'Glenda', 'Grant', '1976-10-01', 'Other', 'O-', 'Other', 'Bangladeshi', '1344894687455', '01994070777', 'student189@example.com', '$2y$12$kIiccSiF1TsitNYT7cEs.O32NvvfxT7BrkYjPwqwpTwZT0lX3H0F.', '1911 Margaret Forge\nBarrowsmouth, TN 02157', '110 Katherine Meadows\nCronastad, NH 80109-8282', 'ADM-00189', '2015-09-01', 'C', 'Science', '2025-2026', 'Crooks, Balistreri and Rosenbaum School', 'Imani Bogan', 'Businessman', '01935176570', 'father189@example.com', '5587287027292', NULL, 'Nyah Cummerata', 'Housewife', '01537449333', 'mother189@example.com', '4093469593886', NULL, 'Miss Helene Olson', '01552994836', 'guardian189@example.com', '8314381257174', 'Sister', 1, 38, 2, '2025-12-14', NULL, 2025000189, 900189, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39', '127.0.0.1', 1, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39'),
(190, 'Ebba', 'Kuphal', '2022-05-13', 'Other', 'O+', 'Islam', 'Bangladeshi', '7295951640107', '01544997350', 'student190@example.com', '$2y$12$jVrMdlpD2rr7uJ44FeqUQeroc8yX7oTQTSqAx8EdAu51q/kVZvIpu', '5331 Green Prairie Suite 176\nEast Liliantown, AZ 06699-2007', '98116 Arnoldo Corner\nLake Westonview, NJ 28408', 'ADM-00190', '2021-02-24', 'A', 'Commerce', '2025-2026', 'Rosenbaum and Sons School', 'Mr. Delmer Hermiston', 'Doctor', '01583864906', 'father190@example.com', '8528114577878', NULL, 'Diana O\'Keefe', 'Housewife', '01553380635', 'mother190@example.com', '6536071750681', NULL, 'Jazmin Stiedemann', '01365011446', 'guardian190@example.com', '5980943896510', 'Aunt', 1, 39, 2, '2025-12-14', NULL, 2025000190, 900190, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39', '127.0.0.1', 1, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39'),
(191, 'Timmy', 'Morissette', '2015-11-13', 'Other', 'A-', 'Other', 'Bangladeshi', '8893518889582', '01949325324', 'student191@example.com', '$2y$12$47W93axtX.VNWhBYYEBy4.w4X.Fuv0.WB95b9qnnxNpAoHRZzl2Lu', '492 Johnson Mews Suite 166\nLisaville, MN 40373', '90407 Jany Trace\nEbertton, WV 19978-6112', 'ADM-00191', '2022-12-25', 'B', 'Commerce', '2025-2026', 'Streich-Dibbert School', 'Kacey Daugherty Jr.', 'Teacher', '01810390812', 'father191@example.com', '4656386522624', NULL, 'Prof. Vanessa Rosenbaum', 'Doctor', '01368266760', 'mother191@example.com', '3607733409821', NULL, 'Prof. Kamren Greenfelder', '01791884856', 'guardian191@example.com', '4685299128762', 'Sister', 1, 39, 4, '2025-12-14', NULL, 2025000191, 900191, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39', '127.0.0.1', 1, NULL, '2025-12-14 06:05:39', '2025-12-14 06:05:39'),
(192, 'Stephon', 'Dooley', '2005-01-29', 'Other', 'B+', 'Other', 'Bangladeshi', '1672026459216', '01781740733', 'student192@example.com', '$2y$12$g3J21eT9RSaakPlXhYkQ/uvrZ.A.rxRAPjijClVU/gy8bg/cM7Nuq', '13994 Henriette Junction\nDeonton, DE 36186-6533', '2125 Julio Circle\nHintzborough, LA 88573', 'ADM-00192', '1995-05-13', 'B', 'Science', '2025-2026', 'Pagac PLC School', 'Mr. Anthony Hettinger', 'Engineer', '01567806521', 'father192@example.com', '4069131818389', NULL, 'Elza Krajcik', 'Housewife', '01734349142', 'mother192@example.com', '1975071740067', NULL, 'Demond Aufderhar', '01948962150', 'guardian192@example.com', '1466490714998', 'Grandparent', 1, 32, 5, '2025-12-14', NULL, 2025000192, 900192, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40', '127.0.0.1', 1, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40'),
(193, 'Desmond', 'Wisozk', '2008-07-19', 'Male', 'A+', 'Other', 'Bangladeshi', '4638535148172', '01836063409', 'student193@example.com', '$2y$12$cf9b8.ZjWzUrMcyKX5oXU.J9.vyWT6zPpy26xe.Tu6FvKBwoMXvEa', '3032 Tromp Ways\nPort Marianneport, UT 18124', '87718 Dooley Light\nVincefort, FL 17193-2989', 'ADM-00193', '2003-09-04', 'B', 'Commerce', '2025-2026', 'Cormier Ltd School', 'Lionel Gaylord', 'Teacher', '01515787186', 'father193@example.com', '2719107597206', NULL, 'Molly Franecki', 'Teacher', '01395013360', 'mother193@example.com', '2808419534342', NULL, 'Mr. Elwin Reinger', '01887719654', 'guardian193@example.com', '0162144949636', 'Uncle', 1, 39, 3, '2025-12-14', NULL, 2025000193, 900193, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40', '127.0.0.1', 1, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40'),
(194, 'Vincenza', 'Herzog', '1996-08-25', 'Male', 'O-', 'Christian', 'Bangladeshi', '6155344609186', '01895868714', 'student194@example.com', '$2y$12$d4hT2ownH4JGGKAKCPVZDut8i9Wo7CVdcFLa00VnYN7yYs5TgnS4m', '1935 Spinka Radial\nLake Ralphtown, VT 65444', '1823 Witting Vista Apt. 443\nYundtport, VA 22305', 'ADM-00194', '2000-09-17', 'A', 'Commerce', '2025-2026', 'Runolfsson-Simonis School', 'Mr. Abraham Gusikowski', 'Engineer', '01997107914', 'father194@example.com', '0054128956502', NULL, 'Helene Krajcik', 'Housewife', '01462679064', 'mother194@example.com', '0337828110676', NULL, 'Golda Robel IV', '01540413084', 'guardian194@example.com', '7509954731658', 'Grandparent', 1, 40, 2, '2025-12-14', NULL, 2025000194, 900194, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40', '127.0.0.1', 1, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40'),
(195, 'Frank', 'Johnson', '2013-05-25', 'Male', 'B-', 'Islam', 'Bangladeshi', '6747933144324', '01449893655', 'student195@example.com', '$2y$12$p.62WC1PXvhw5v9tuN3TlOlhVBDTMbwez0neK0CSyBViuWexpNzTy', '3937 O\'Reilly Springs\nPort Earlene, GA 33714-9245', '342 Rempel Plains\nVellaburgh, NY 32617-6695', 'ADM-00195', '2006-06-30', 'B', 'Commerce', '2025-2026', 'Jast, Ortiz and Gutmann School', 'Alford Kertzmann', 'Farmer', '01830099431', 'father195@example.com', '8748621451164', NULL, 'Heath Rohan', 'Housewife', '01683745581', 'mother195@example.com', '4909089049993', NULL, 'Roger Kulas', '01751982891', 'guardian195@example.com', '7063334506371', 'Uncle', 1, 33, 5, '2025-12-14', NULL, 2025000195, 900195, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40', '127.0.0.1', 1, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40'),
(196, 'Vincenza', 'Lockman', '1993-02-21', 'Female', 'AB+', 'Other', 'Bangladeshi', '2052172410464', '01729389664', 'student196@example.com', '$2y$12$PVfosbHpYyxNXricFteVC.MRijuX1yst8JHVCayE/gsmDHAcllaHy', '1823 Kilback Fort Suite 483\nPort Melissaburgh, VT 08423', '5861 May Springs\nNew Garrick, RI 60591-1587', 'ADM-00196', '2021-04-21', 'B', 'Commerce', '2025-2026', 'Boyle, Kutch and Beier School', 'Randal Brekke', 'Doctor', '01994796479', 'father196@example.com', '7568057766491', NULL, 'Thelma Bechtelar', 'Businesswoman', '01743255289', 'mother196@example.com', '5622109345764', NULL, 'Delfina Wilderman', '01837261455', 'guardian196@example.com', '9888106188837', 'Aunt', 1, 40, 4, '2025-12-14', NULL, 2025000196, 900196, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40', '127.0.0.1', 1, NULL, '2025-12-14 06:05:40', '2025-12-14 06:05:40'),
(197, 'Vernon', 'Padberg', '1989-10-07', 'Female', 'B-', 'Islam', 'Bangladeshi', '9360792648888', '01638421309', 'student197@example.com', '$2y$12$gFBR82MbDbKdSwds70PtUOR7rnOPHiMoaSVsvZO.Vhu01dPqKu.iu', '83323 Larson Mews\nNew Josianne, AZ 27172', '44329 Nitzsche Summit\nNew Vanessa, NJ 29437-6424', 'ADM-00197', '2001-07-11', 'C', 'Commerce', '2025-2026', 'Tromp LLC School', 'Mr. Chadd Steuber Jr.', 'Engineer', '01515484374', 'father197@example.com', '7074960690381', NULL, 'Miracle Wuckert', 'Teacher', '01877660335', 'mother197@example.com', '0612444516152', NULL, 'Jammie Kovacek', '01588395432', 'guardian197@example.com', '8801624397357', 'Uncle', 1, 40, 3, '2025-12-14', NULL, 2025000197, 900197, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41', '127.0.0.1', 1, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41'),
(198, 'Anna', 'Nienow', '2022-11-12', 'Male', 'B-', 'Islam', 'Bangladeshi', '2373392588068', '01992281596', 'student198@example.com', '$2y$12$.NXgYiayNCbL7h7QXFrMRe4I99aSSZjHwrnXe06iX8lxywS5OKgGO', '5265 Bins Trail\nNew Luciefurt, ME 96711-7208', '655 Henri Row Apt. 415\nPort Maudeburgh, OH 71637', 'ADM-00198', '1993-08-09', 'B', 'Arts', '2025-2026', 'Huel, Harris and Windler School', 'Roel Funk', 'Farmer', '01478712592', 'father198@example.com', '4914249258629', NULL, 'Abigayle Morar', 'Housewife', '01547456573', 'mother198@example.com', '4335938550260', NULL, 'Brent Boyer', '01712553495', 'guardian198@example.com', '2464733698374', 'Aunt', 1, 41, 3, '2025-12-14', NULL, 2025000198, 900198, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41', '127.0.0.1', 1, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41'),
(199, 'Herbert', 'Marquardt', '1980-06-19', 'Male', 'O-', 'Other', 'Bangladeshi', '7386212609375', '01911146935', 'student199@example.com', '$2y$12$hA4lrqg1uyZf6GchUglRkOnL6P6UZ/Hz9YN7YF9nxAZIhTXCDcbIy', '5583 Fadel Vista Apt. 428\nWest Cordiafort, SC 87398-3521', '3057 Waelchi Parkway Apt. 726\nRuntehaven, GA 66265', 'ADM-00199', '2011-05-25', 'B', 'Commerce', '2025-2026', 'Cassin Ltd School', 'Rick Rogahn DVM', 'Businessman', '01680109806', 'father199@example.com', '7750103579653', NULL, 'Ida Leannon', 'Businesswoman', '01400813166', 'mother199@example.com', '3062414810276', NULL, 'Kim Dickinson', '01367555195', 'guardian199@example.com', '2770461561831', 'Sister', 1, 41, 2, '2025-12-14', NULL, 2025000199, 900199, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41', '127.0.0.1', 1, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41'),
(200, 'Devyn', 'Sipes', '2004-10-17', 'Female', 'B-', 'Islam', 'Bangladeshi', '3730991096394', '01713280659', 'student200@example.com', '$2y$12$06VxR64gYC6JC/W.tBnp7e5p4xJK/hSwc5Y.5Mnfwgi5NYGgfbsre', '39795 Breitenberg Viaduct\nReneton, NJ 85072', '7791 Rolfson Extension Suite 917\nGaylordport, NC 19792-8764', 'ADM-00200', '1970-07-07', 'C', 'Commerce', '2025-2026', 'Dietrich Inc School', 'Dr. Marvin Harber', 'Engineer', '01422058257', 'father200@example.com', '8743470733998', NULL, 'Dr. Dariana Marvin', 'Businesswoman', '01363489392', 'mother200@example.com', '7702447585266', NULL, 'Cara Muller', '01861892909', 'guardian200@example.com', '9918457362139', 'Grandparent', 1, 42, 2, '2025-12-14', NULL, 2025000200, 900200, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41', '127.0.0.1', 1, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41'),
(201, 'Jordan', 'Carter', '1994-04-04', 'Male', 'A+', 'Hindu', 'Bangladeshi', '1795919664657', '01359809815', 'student201@example.com', '$2y$12$6uxRdT/GmdxLi4YTto.Taeq9DA.f0iEvuEvCIjlVf4iTPhbnFOdVG', '785 Retha Bridge\nGrahamstad, NM 90645', '4403 Tavares Drive Apt. 144\nMathildechester, WA 80026-5191', 'ADM-00201', '1972-01-20', 'C', 'Commerce', '2025-2026', 'Cruickshank LLC School', 'Emmitt Mosciski Jr.', 'Engineer', '01997325091', 'father201@example.com', '4281490394112', NULL, 'Dr. Glenna Grady DVM', 'Teacher', '01449636608', 'mother201@example.com', '4837329348786', NULL, 'Dr. Leland Bauch', '01917200138', 'guardian201@example.com', '5690148837417', 'Grandparent', 1, 45, 1, '2025-12-14', NULL, 2025000201, 900201, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41', '127.0.0.1', 1, NULL, '2025-12-14 06:05:41', '2025-12-14 06:05:41'),
(202, 'Neha', 'Hoeger', '1980-11-27', 'Other', 'A-', 'Other', 'Bangladeshi', '3513033522318', '01825799929', 'student202@example.com', '$2y$12$QzgGqN75TDRwu6iFAy.Ji.SwUuG9gEiaHq46jN9Y.DCbIYs25qLUW', '837 Raleigh Crossroad Suite 422\nNorth Marleestad, WV 09090', '4212 Myrtie Meadow Apt. 840\nNorth Tyresechester, OH 06700-6564', 'ADM-00202', '2002-04-20', 'C', 'Arts', '2025-2026', 'Blick-Cole School', 'Erik McGlynn', 'Businessman', '01883620809', 'father202@example.com', '1727864517540', NULL, 'Miss Eunice Bosco IV', 'Nurse', '01713200085', 'mother202@example.com', '1454017882304', NULL, 'Pearline Lockman III', '01740314779', 'guardian202@example.com', '8805963906459', 'Grandparent', 1, 41, 4, '2025-12-14', NULL, 2025000202, 900202, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42', '127.0.0.1', 1, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42'),
(203, 'Kade', 'Little', '2007-10-02', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '6543414809772', '01977696406', 'student203@example.com', '$2y$12$6AxYSgoRMgcb3.TOD3Byy.xggxcoeXVOngXpvYQGRwrykp68sdQoa', '558 Polly Ridges Suite 154\nGwendolynberg, IA 86341', '6934 Theresa Springs Apt. 798\nPenelopeville, OH 87347-0295', 'ADM-00203', '1970-08-25', 'C', 'Commerce', '2025-2026', 'Kirlin Ltd School', 'Jamaal Anderson', 'Teacher', '01456944603', 'father203@example.com', '7654004483391', NULL, 'Camille Jaskolski', 'Nurse', '01608368349', 'mother203@example.com', '4192998280254', NULL, 'Rickie Luettgen', '01382174393', 'guardian203@example.com', '1593521033204', 'Aunt', 1, 42, 3, '2025-12-14', NULL, 2025000203, 900203, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42', '127.0.0.1', 1, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42'),
(204, 'Sarah', 'Klocko', '2022-03-01', 'Other', 'A+', 'Buddhist', 'Bangladeshi', '0657485780248', '01458384255', 'student204@example.com', '$2y$12$xcQ5cI1OWz/w847n.rFG0O1g5xjz1lBNXmOg7P3JTe7w3qOLozq.m', '8027 Ebert River Suite 150\nTatumtown, AR 72645-7136', '27681 Yadira Crossroad Suite 001\nLehnerside, ND 25853-0301', 'ADM-00204', '2020-07-30', 'B', 'Arts', '2025-2026', 'Zulauf and Sons School', 'Dr. Milo Turcotte', 'Farmer', '01977976302', 'father204@example.com', '3079519287787', NULL, 'Lonie Langosh', 'Businesswoman', '01478391754', 'mother204@example.com', '5203401864877', NULL, 'Chadrick Douglas', '01337876290', 'guardian204@example.com', '2752789368103', 'Aunt', 1, 42, 4, '2025-12-14', NULL, 2025000204, 900204, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42', '127.0.0.1', 1, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42'),
(205, 'Chester', 'Miller', '1985-09-23', 'Female', 'AB+', 'Buddhist', 'Bangladeshi', '4635246709870', '01422591295', 'student205@example.com', '$2y$12$NFLEXw2QGoJSiDRNsWq.fuObdjYkrVmUMWo2hnyKXqFqwgcZ80NBi', '10483 Caleb Summit Apt. 038\nDonnymouth, WV 48372', '91832 Luciano Plaza Apt. 992\nYundtfort, NH 07198-9126', 'ADM-00205', '1982-04-01', 'A', 'Arts', '2025-2026', 'Sawayn, Goodwin and Kerluke School', 'Mathew Metz', 'Teacher', '01695624820', 'father205@example.com', '3580126974784', NULL, 'Zena Conroy', 'Nurse', '01806694310', 'mother205@example.com', '7654315092653', NULL, 'Dr. Geraldine Beer MD', '01621006263', 'guardian205@example.com', '3433477026448', 'Uncle', 1, 43, 4, '2025-12-14', NULL, 2025000205, 900205, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42', '127.0.0.1', 1, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42'),
(206, 'Lolita', 'Connelly', '2014-01-13', 'Female', 'O+', 'Islam', 'Bangladeshi', '5310332515647', '01886278550', 'student206@example.com', '$2y$12$T9OZ8QTsRoeTi.t683GFROGpEjo1t.p4scv6eW4a/.5kERWG/.E4.', '8725 Tess Shore\nDahliafurt, RI 48509', '38975 Camylle Green\nJetthaven, TN 43037-1035', 'ADM-00206', '1986-08-25', 'A', 'Commerce', '2025-2026', 'Emmerich, Bergnaum and Tromp School', 'Roel Satterfield', 'Doctor', '01426202652', 'father206@example.com', '7813136665725', NULL, 'Miss Kasey Collins', 'Nurse', '01888170825', 'mother206@example.com', '1635706424393', NULL, 'Enrique Rohan', '01779187846', 'guardian206@example.com', '2128875715443', 'Uncle', 1, 34, 5, '2025-12-14', NULL, 2025000206, 900206, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42', '127.0.0.1', 1, NULL, '2025-12-14 06:05:42', '2025-12-14 06:05:42'),
(207, 'Americo', 'Hartmann', '1975-01-17', 'Male', 'B+', 'Hindu', 'Bangladeshi', '7502685010105', '01558656609', 'student207@example.com', '$2y$12$sDhp.Ry0LC.UhqNpGFafFus8T5nMiusirBNgjKkRaNJnkmSC4wzMW', '4793 Brook Corners\nBodemouth, CA 68374-4480', '6230 Kilback Summit Apt. 222\nSouth Tomasa, DC 99789-7643', 'ADM-00207', '2008-03-07', 'C', 'Commerce', '2025-2026', 'Lubowitz Group School', 'Kirk Gorczany', 'Farmer', '01392267555', 'father207@example.com', '2770698968827', NULL, 'Annabell Homenick', 'Nurse', '01391155213', 'mother207@example.com', '1713923743580', NULL, 'Belle Gottlieb III', '01734001637', 'guardian207@example.com', '1412097556813', 'Sister', 1, 35, 5, '2025-12-14', NULL, 2025000207, 900207, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43', '127.0.0.1', 1, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43'),
(208, 'Carolina', 'Nolan', '1970-01-06', 'Other', 'O-', 'Islam', 'Bangladeshi', '0196018991490', '01442512446', 'student208@example.com', '$2y$12$lfQKkbtRJ2cGtvLqlUIjPOORZVhLmSzidcD0kHjy9Mr5Ll1UhBTZq', '26021 Kurtis Oval\nCorkeryborough, NJ 83080', '24285 Ankunding Spring\nDestinyberg, UT 57796', 'ADM-00208', '1981-02-16', 'B', 'Arts', '2025-2026', 'Heidenreich-Swift School', 'Wade Borer', 'Teacher', '01838723010', 'father208@example.com', '3565033852890', NULL, 'Miss Ebony Cronin', 'Doctor', '01885790455', 'mother208@example.com', '5113264305890', NULL, 'Prof. Dora Mosciski', '01326299875', 'guardian208@example.com', '3099116684696', 'Sister', 1, 46, 1, '2025-12-14', NULL, 2025000208, 900208, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43', '127.0.0.1', 1, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43'),
(209, 'Madilyn', 'McClure', '1999-10-27', 'Male', 'B+', 'Islam', 'Bangladeshi', '2822943002425', '01780899070', 'student209@example.com', '$2y$12$XZO0oUt33RNNYHhjObZRjuKXnLrbtpQLajpmJykxun8qvOkHEjKam', '808 Davis Row Suite 538\nWest Adriana, IA 88772', '285 Balistreri Groves\nFeilfurt, OR 75758', 'ADM-00209', '2021-01-29', 'A', 'Science', '2025-2026', 'Waelchi-Hansen School', 'Werner Hickle III', 'Teacher', '01556172436', 'father209@example.com', '1518086330654', NULL, 'Mrs. Deborah Hessel', 'Teacher', '01536004939', 'mother209@example.com', '8935719063954', NULL, 'Ayla Gaylord', '01485949408', 'guardian209@example.com', '6856644420977', 'Uncle', 1, 43, 2, '2025-12-14', NULL, 2025000209, 900209, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43', '127.0.0.1', 1, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43'),
(210, 'Harvey', 'Veum', '1984-01-26', 'Other', 'B+', 'Hindu', 'Bangladeshi', '4432838044123', '01422062579', 'student210@example.com', '$2y$12$Si/AfP26UfVlio8yapei2.XyyRj7Gk1VvvXjCyvqBN5C2wtRLXLVK', '511 Baumbach Mall Apt. 935\nLavernshire, NC 22893', '58642 Schroeder Pine Apt. 748\nSchusterburgh, NH 14913', 'ADM-00210', '1982-01-09', 'C', 'Arts', '2025-2026', 'Ankunding-Cormier School', 'Dr. Trent Muller', 'Doctor', '01979512806', 'father210@example.com', '5815818168545', NULL, 'Julia Sanford', 'Doctor', '01435625791', 'mother210@example.com', '4758483763671', NULL, 'King Hodkiewicz', '01688963204', 'guardian210@example.com', '2595965808343', 'Sister', 1, 47, 1, '2025-12-14', NULL, 2025000210, 900210, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43', '127.0.0.1', 1, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43'),
(211, 'Giuseppe', 'Hansen', '2017-11-13', 'Male', 'B+', 'Hindu', 'Bangladeshi', '2419311328371', '01915126787', 'student211@example.com', '$2y$12$IhCJ3fcHSBuCBNNMoBxiF.7yuw7C0KZx1tGBoVyFtWFkG9um4hBYO', '14621 Loyal Court\nOndrickaborough, ND 05153-5426', '99737 Eldridge Walk\nSpinkafurt, RI 80283', 'ADM-00211', '1985-10-08', 'C', 'Science', '2025-2026', 'Daniel-Lehner School', 'Dr. Evans Quitzon MD', 'Teacher', '01633141509', 'father211@example.com', '9095097794535', NULL, 'Mrs. Leta Rogahn II', 'Businesswoman', '01420795643', 'mother211@example.com', '4246370624813', NULL, 'Prof. Florence Sanford I', '01680118649', 'guardian211@example.com', '2123578548123', 'Sister', 1, 36, 5, '2025-12-14', NULL, 2025000211, 900211, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43', '127.0.0.1', 1, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43'),
(212, 'Ulices', 'Douglas', '1997-10-21', 'Female', 'B-', 'Hindu', 'Bangladeshi', '6748510733023', '01784852139', 'student212@example.com', '$2y$12$5DuwbLGzlyNswRKgOJB34erwQtw6q13XTIo5MzA8fyPpyWcC.Wddq', '45801 Wunsch Forge Apt. 942\nDaughertytown, OR 07562', '74303 Kautzer Gateway Apt. 854\nBartonhaven, CO 24691-2127', 'ADM-00212', '2019-03-31', 'C', 'Science', '2025-2026', 'Kessler, Schimmel and McDermott School', 'Keyon Rice', 'Doctor', '01491176976', 'father212@example.com', '8185154697078', NULL, 'Prof. Elizabeth Bednar', 'Teacher', '01488793815', 'mother212@example.com', '0184883352978', NULL, 'Nigel Flatley III', '01812039227', 'guardian212@example.com', '2950890956430', 'Sister', 1, 37, 5, '2025-12-14', NULL, 2025000212, 900212, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43', '127.0.0.1', 1, NULL, '2025-12-14 06:05:43', '2025-12-14 06:05:43'),
(213, 'Raegan', 'Lakin', '2021-10-17', 'Other', 'O+', 'Other', 'Bangladeshi', '0407289570086', '01405888443', 'student213@example.com', '$2y$12$wmith5RK4ONUGradhRxzFOlh5tIfJZiULgL5afgPMegoViSJ/ObR.', '4836 Hammes Plains\nMadelynnchester, SD 49616', '845 Orin Centers\nLake Ron, DC 49696-5172', 'ADM-00213', '1984-09-05', 'B', 'Arts', '2025-2026', 'Hartmann-Hackett School', 'Mr. Tevin Sipes', 'Teacher', '01925705926', 'father213@example.com', '4113089781198', NULL, 'Dolores Stoltenberg', 'Housewife', '01844837665', 'mother213@example.com', '4934179839057', NULL, 'Leila Wiegand', '01902871038', 'guardian213@example.com', '0819832931475', 'Grandparent', 1, 48, 1, '2025-12-14', NULL, 2025000213, 900213, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44', '127.0.0.1', 1, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44'),
(214, 'Magali', 'Wiza', '2009-10-30', 'Female', 'O+', 'Other', 'Bangladeshi', '3034504711554', '01794769089', 'student214@example.com', '$2y$12$PMOPUHvog8r73ZFeL3qR1OLWufgsA7J5nFnxFr.fmjmJDsLJGn6iu', '645 Zulauf Mount\nLake Jeramie, KY 67109-8659', '70444 Dock Shore\nHalieborough, CA 99311-4215', 'ADM-00214', '1992-04-07', 'B', 'Arts', '2025-2026', 'Brakus, Kunze and Greenholt School', 'Mackenzie Glover', 'Teacher', '01320251731', 'father214@example.com', '9144825724984', NULL, 'Lolita Cole', 'Nurse', '01555670793', 'mother214@example.com', '0934970162182', NULL, 'Mr. Milford Harber', '01345649710', 'guardian214@example.com', '8098957631220', 'Brother', 1, 38, 5, '2025-12-14', NULL, 2025000214, 900214, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44', '127.0.0.1', 1, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44'),
(215, 'Francesco', 'Hilpert', '2023-01-16', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '0865541922647', '01905932399', 'student215@example.com', '$2y$12$NarMW9P/MVG1UI6ToafAhullamDmrnIDQjsWrRxBTv1ChYmenjZJK', '350 Barrows Ranch\nMelbamouth, ID 55063', '8601 Stephania Tunnel\nCorkeryton, GA 90340-6910', 'ADM-00215', '2018-03-31', 'C', 'Science', '2025-2026', 'White-Marquardt School', 'Lisandro Pagac III', 'Teacher', '01771448789', 'father215@example.com', '8235215816770', NULL, 'Mrs. Madisyn McDermott', 'Teacher', '01867200644', 'mother215@example.com', '7143488625681', NULL, 'Jessy Kulas', '01898129642', 'guardian215@example.com', '3423070746627', 'Brother', 1, 44, 2, '2025-12-14', NULL, 2025000215, 900215, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44', '127.0.0.1', 1, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44'),
(216, 'Kaelyn', 'Pouros', '1974-09-08', 'Other', 'O+', 'Islam', 'Bangladeshi', '9570661622868', '01866588547', 'student216@example.com', '$2y$12$2DH7WMQFJ6qdk24gOu0GcuY7hm2Hnl7EemgAPBwF2vMszU0PChd8e', '82068 Greenfelder Dam Apt. 281\nColbyland, WV 92380', '475 Mona Course Suite 159\nGranvillemouth, WY 93642-5147', 'ADM-00216', '1976-12-15', 'B', 'Arts', '2025-2026', 'Bednar, Kozey and Crooks School', 'Monserrat Yundt I', 'Businessman', '01814358869', 'father216@example.com', '1925491008167', NULL, 'Joelle Schuppe', 'Teacher', '01976873370', 'mother216@example.com', '9097945968745', NULL, 'Bobbie Mohr', '01717425424', 'guardian216@example.com', '4848599683327', 'Uncle', 1, 45, 2, '2025-12-14', NULL, 2025000216, 900216, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44', '127.0.0.1', 1, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44'),
(217, 'Idella', 'Harvey', '2023-09-16', 'Female', 'B-', 'Hindu', 'Bangladeshi', '3015995601835', '01663794363', 'student217@example.com', '$2y$12$d7DckeyYLewen0xtDPsp7uRZSi.cavJlzgiKqNDCRmwUd7T/4/0ca', '1584 Stehr Forge\nEast Guido, MI 84208-1986', '429 Upton Ranch Suite 964\nBoscoborough, AZ 51276-0226', 'ADM-00217', '2013-01-08', 'B', 'Commerce', '2025-2026', 'Rempel Inc School', 'Dr. Arthur Schultz', 'Businessman', '01871838504', 'father217@example.com', '3677578582587', NULL, 'Sadye Koch', 'Businesswoman', '01733236021', 'mother217@example.com', '5895696296999', NULL, 'Prof. Jaclyn Grady', '01466794098', 'guardian217@example.com', '7159712317006', 'Sister', 1, 49, 1, '2025-12-14', NULL, 2025000217, 900217, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44', '127.0.0.1', 1, NULL, '2025-12-14 06:05:44', '2025-12-14 06:05:44'),
(218, 'Joana', 'Ferry', '2007-02-03', 'Female', 'O-', 'Christian', 'Bangladeshi', '8081376770120', '01652576458', 'student218@example.com', '$2y$12$SIssiZESmYKGNlHuZxl5FubuU1EOdzc80BrPY4uNKFdGHbgOBHG3y', '2952 Aliyah Way\nLednerburgh, VT 83551-7977', '2909 Rey Village Suite 433\nHymanbury, LA 37939', 'ADM-00218', '2011-05-03', 'A', 'Science', '2025-2026', 'Stokes, Eichmann and Hartmann School', 'Dr. Leopoldo Rosenbaum PhD', 'Businessman', '01893883688', 'father218@example.com', '1613831275271', NULL, 'Dr. Pink Sauer I', 'Teacher', '01980787761', 'mother218@example.com', '3295299902472', NULL, 'Emmie Lesch', '01886921168', 'guardian218@example.com', '4974265453880', 'Sister', 1, 44, 4, '2025-12-14', NULL, 2025000218, 900218, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45', '127.0.0.1', 1, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45'),
(219, 'Oswaldo', 'Turcotte', '1994-03-18', 'Other', 'B+', 'Christian', 'Bangladeshi', '8431401060187', '01568370373', 'student219@example.com', '$2y$12$rAYW54Lsl85dsL.h4PPgjOVpqTs.3TddTQ49NIOlg4j7/zNQ7vE9.', '3364 Arne Lane Suite 384\nWest Katarinaborough, WY 52511-6558', '237 Ransom Lodge Apt. 300\nEffertztown, NH 67349', 'ADM-00219', '2005-12-17', 'C', 'Arts', '2025-2026', 'Pouros LLC School', 'Enrico Toy', 'Businessman', '01875637342', 'father219@example.com', '6472104918884', NULL, 'Madge Gusikowski DVM', 'Doctor', '01587389490', 'mother219@example.com', '5771730373252', NULL, 'Elza Kunze', '01896706692', 'guardian219@example.com', '7792998386825', 'Brother', 1, 50, 1, '2025-12-14', NULL, 2025000219, 900219, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45', '127.0.0.1', 1, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45'),
(220, 'Alanis', 'Cummings', '1990-04-29', 'Other', 'O-', 'Other', 'Bangladeshi', '1403823813740', '01766686424', 'student220@example.com', '$2y$12$1/z/M2E9HIJWbdmZJIbpMuRrDMsNY3Zdag.hsqWda8.vL4w8tBXm6', '99430 Eldred Hills\nNolanmouth, CO 78225-3520', '98196 Brekke Stream\nWest Ciara, IA 28616', 'ADM-00220', '1995-10-29', 'C', 'Commerce', '2025-2026', 'Botsford PLC School', 'Cruz Rodriguez', 'Doctor', '01867832843', 'father220@example.com', '9825467304532', NULL, 'Margret Kuvalis II', 'Businesswoman', '01554181874', 'mother220@example.com', '6662047553836', NULL, 'Ila Dickens Sr.', '01632886393', 'guardian220@example.com', '8337960575386', 'Brother', 1, 45, 4, '2025-12-14', NULL, 2025000220, 900220, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45', '127.0.0.1', 1, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45'),
(221, 'Meghan', 'McGlynn', '1984-10-04', 'Female', 'A-', 'Other', 'Bangladeshi', '4230125065000', '01629270074', 'student221@example.com', '$2y$12$vHBN0TqOGtJPhrlJS1n5meU.GMhgMAJHhgMGQJN2MFWkN9W3sGyWO', '37794 Zboncak Oval\nLake Feliciaville, RI 80566-8807', '346 Bergstrom Squares\nLake Jarred, WV 04093-6742', 'ADM-00221', '2025-10-12', 'B', 'Science', '2025-2026', 'Mayer-Bednar School', 'Earl Bernhard', 'Engineer', '01837758616', 'father221@example.com', '5378355483145', NULL, 'Prof. Mary Windler PhD', 'Doctor', '01503859256', 'mother221@example.com', '6071732856781', NULL, 'Mrs. Carli Bogan MD', '01470200299', 'guardian221@example.com', '0934919150548', 'Sister', 1, 46, 4, '2025-12-14', NULL, 2025000221, 900221, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45', '127.0.0.1', 1, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45'),
(222, 'Amparo', 'Altenwerth', '1974-03-19', 'Female', 'AB+', 'Buddhist', 'Bangladeshi', '4304964462606', '01322476498', 'student222@example.com', '$2y$12$ETD.FxV/60jOlXESKy0.u.pCp.BHVZGGvRbGonoPw7sC.eN5yWbZi', '75536 Cummerata Shores Suite 234\nEdenport, VA 91482', '85606 Russel Harbors\nWest Maximillia, OR 05923-9658', 'ADM-00222', '1990-01-11', 'B', 'Arts', '2025-2026', 'Ondricka-Hessel School', 'Hazle Blanda II', 'Teacher', '01540745851', 'father222@example.com', '6171235359359', NULL, 'Alejandra Cronin Jr.', 'Housewife', '01679595614', 'mother222@example.com', '9223102969125', NULL, 'Arnoldo Funk', '01302259811', 'guardian222@example.com', '0127347103458', 'Brother', 1, 43, 3, '2025-12-14', NULL, 2025000222, 900222, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45', '127.0.0.1', 1, NULL, '2025-12-14 06:05:45', '2025-12-14 06:05:45'),
(223, 'Misael', 'Runolfsson', '2023-10-09', 'Female', 'B-', 'Hindu', 'Bangladeshi', '4345534088197', '01571679535', 'student223@example.com', '$2y$12$T4QB8oPk18KAL3JjcR.pM.Ikn5AVKHddiQcK8.2G793.rQoshgR7a', '6784 Hilpert Stravenue\nPort Angela, AZ 58913-4162', '38999 Vida Orchard\nWest Cyrusville, CT 31817', 'ADM-00223', '2003-01-25', 'A', 'Arts', '2025-2026', 'Leannon, Pfannerstill and Stamm School', 'Kaden Nikolaus', 'Farmer', '01940013849', 'father223@example.com', '0614577585477', NULL, 'Miss Neva Reynolds', 'Nurse', '01346016249', 'mother223@example.com', '0415697798116', NULL, 'Prof. Rebekah Schowalter Sr.', '01944798872', 'guardian223@example.com', '8359827589960', 'Grandparent', 1, 47, 4, '2025-12-14', NULL, 2025000223, 900223, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46', '127.0.0.1', 1, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46'),
(224, 'Geraldine', 'Schowalter', '2010-01-06', 'Other', 'O-', 'Islam', 'Bangladeshi', '0871778140159', '01429742322', 'student224@example.com', '$2y$12$9nyCMooTE3Kdpk5Y8nXyce98T2s9/rp.dsgF7PH67D.gSu685Q31C', '696 Wayne Ranch Apt. 734\nLake Flossieport, GA 20782', '29095 Witting Inlet\nNorth Gustave, VT 65540-8713', 'ADM-00224', '1989-11-12', 'A', 'Commerce', '2025-2026', 'Ritchie-Jerde School', 'Ottis Gibson', 'Farmer', '01905518399', 'father224@example.com', '4336665111043', NULL, 'Christine Robel IV', 'Teacher', '01379564590', 'mother224@example.com', '3395270352223', NULL, 'Blaise Hagenes III', '01817454613', 'guardian224@example.com', '0615240264044', 'Grandparent', 1, 44, 3, '2025-12-14', NULL, 2025000224, 900224, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46', '127.0.0.1', 1, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(225, 'Abel', 'Senger', '1984-01-24', 'Male', 'A-', 'Other', 'Bangladeshi', '8097690868302', '01542781681', 'student225@example.com', '$2y$12$IL5LmqIbVK..emtygRMAaORk72wLJyjWo5NTD7NdgN9Jji0okNI3.', '5471 Padberg Shoals Suite 539\nOrnville, NV 25960-3524', '4032 Kemmer Pass Apt. 424\nEast Travon, OH 00276', 'ADM-00225', '2016-11-03', 'B', 'Commerce', '2025-2026', 'Pacocha-Mohr School', 'Donato Hartmann', 'Teacher', '01449622824', 'father225@example.com', '6674738763761', NULL, 'Dr. Elenor Price IV', 'Teacher', '01556692926', 'mother225@example.com', '2743709706992', NULL, 'Krystina Sauer', '01680312343', 'guardian225@example.com', '4930067769481', 'Sister', 1, 46, 2, '2025-12-14', NULL, 2025000225, 900225, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46', '127.0.0.1', 1, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46'),
(226, 'Leonie', 'Glover', '2011-09-17', 'Male', 'O-', 'Hindu', 'Bangladeshi', '5520382579584', '01305798343', 'student226@example.com', '$2y$12$IShR0YhfqUI9MlpBoZ2JJemiOmyivQHow61rVZ0crLimzrleTUdn6', '95278 Alvis Avenue\nLoniefort, NM 82711', '641 Jakubowski Junction Apt. 710\nCummingsborough, KS 41941', 'ADM-00226', '2023-06-11', 'B', 'Science', '2025-2026', 'Emard PLC School', 'Trevion Wilderman', 'Engineer', '01500143143', 'father226@example.com', '2577671050789', NULL, 'Ettie Homenick', 'Doctor', '01504556977', 'mother226@example.com', '6531847761342', NULL, 'Rosalinda Nitzsche', '01688818491', 'guardian226@example.com', '8911459678046', 'Grandparent', 1, 51, 1, '2025-12-14', NULL, 2025000226, 900226, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46', '127.0.0.1', 1, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46'),
(227, 'Lizzie', 'Bechtelar', '1974-06-28', 'Female', 'AB+', 'Hindu', 'Bangladeshi', '5628074631239', '01695529641', 'student227@example.com', '$2y$12$k8.R/tynPXoufQ1I/GHmleuhInvJ.Wwp257jc8VMnlhWwbvlV2DUu', '97414 Tania Crest\nWest Alexandreatown, AL 15232', '70774 Leannon Creek\nGradystad, NH 14453', 'ADM-00227', '1994-11-26', 'C', 'Arts', '2025-2026', 'Osinski, Romaguera and Becker School', 'Makenna Sanford', 'Doctor', '01540185942', 'father227@example.com', '5942743217368', NULL, 'Katelynn Hills', 'Nurse', '01334689961', 'mother227@example.com', '2424035534617', NULL, 'Mr. Sanford Swaniawski DVM', '01642028290', 'guardian227@example.com', '6780753441324', 'Grandparent', 1, 52, 1, '2025-12-14', NULL, 2025000227, 900227, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46', '127.0.0.1', 1, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46'),
(228, 'Clovis', 'Schamberger', '1988-03-10', 'Male', 'O-', 'Buddhist', 'Bangladeshi', '5552943834303', '01835949992', 'student228@example.com', '$2y$12$d4VZXBwj57k3qFxfGobLDelY9oHlUhFUH.r8svQdqvsFk12s9Rnla', '65310 Jerde Lock\nCorkerybury, NH 31354-7693', '996 Karl Mews Apt. 733\nGusikowskibury, GA 98399-5649', 'ADM-00228', '1977-12-14', 'A', 'Science', '2025-2026', 'Mraz Group School', 'Nickolas Cummings', 'Teacher', '01393237689', 'father228@example.com', '3982816757010', NULL, 'Dr. Madge Jerde I', 'Housewife', '01992610013', 'mother228@example.com', '9564433240099', NULL, 'Minnie Green', '01805118888', 'guardian228@example.com', '0490411731875', 'Sister', 1, 48, 4, '2025-12-14', NULL, 2025000228, 900228, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46', '127.0.0.1', 1, NULL, '2025-12-14 06:05:46', '2025-12-14 06:05:46'),
(229, 'Melody', 'Bergnaum', '1980-06-07', 'Male', 'O-', 'Islam', 'Bangladeshi', '7349541418329', '01382288686', 'student229@example.com', '$2y$12$6RJWabP42acB4WQ6amMczetAeaLeKLLaq53eKn68KKESxdNvm5Mnu', '289 Becker Field Apt. 502\nLeliafurt, AR 25584', '51762 Fritsch Ridges Suite 763\nNorth Osbaldoside, TX 96189', 'ADM-00229', '2023-02-01', 'B', 'Arts', '2025-2026', 'Dare-Kessler School', 'Braulio Kuhic', 'Businessman', '01742383766', 'father229@example.com', '3961618941773', NULL, 'Piper Klocko', 'Businesswoman', '01495590020', 'mother229@example.com', '6442081048146', NULL, 'Mr. Carson Beer Jr.', '01308679107', 'guardian229@example.com', '0660685247219', 'Uncle', 1, 53, 1, '2025-12-14', NULL, 2025000229, 900229, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47', '127.0.0.1', 1, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47'),
(230, 'Oma', 'Nitzsche', '2002-04-17', 'Female', 'B-', 'Christian', 'Bangladeshi', '9955602958349', '01317696953', 'student230@example.com', '$2y$12$hFU1AhEC.GZ6YOO/4.WHk.m0NB9RKll0RUozkabPxBd.FX53Bh7vq', '6782 Lazaro Keys\nAndreland, AR 80955-4863', '309 Sallie Mountain Apt. 935\nMargarethaven, CT 01957', 'ADM-00230', '2010-10-28', 'A', 'Science', '2025-2026', 'Pagac, Bernier and Welch School', 'Prof. Sylvan Strosin', 'Engineer', '01904127300', 'father230@example.com', '4524407459824', NULL, 'Delilah Funk', 'Businesswoman', '01995974520', 'mother230@example.com', '7415655614071', NULL, 'Dylan Rogahn', '01689377227', 'guardian230@example.com', '1249075262686', 'Aunt', 1, 39, 5, '2025-12-14', NULL, 2025000230, 900230, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47', '127.0.0.1', 1, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47'),
(231, 'Tomas', 'Bednar', '1996-07-08', 'Other', 'B-', 'Hindu', 'Bangladeshi', '4622247776267', '01869889662', 'student231@example.com', '$2y$12$PuNDz4iMrca.vzeLP5eKMei52GTFY6bW7yJdx6sdt5zvZIC9aN6k2', '14742 Fay Rapids Suite 453\nHanemouth, VT 43601-8025', '54673 Hollie Mall Suite 938\nSouth Susietown, NM 90649', 'ADM-00231', '1997-01-20', 'C', 'Commerce', '2025-2026', 'Huel, Thompson and Okuneva School', 'Darwin Murphy Jr.', 'Teacher', '01609553510', 'father231@example.com', '5235011410779', NULL, 'Dr. Vicky Satterfield', 'Teacher', '01603420321', 'mother231@example.com', '5729065784088', NULL, 'Dr. Abigail Bogisich V', '01697492909', 'guardian231@example.com', '5548638727538', 'Brother', 1, 47, 2, '2025-12-14', NULL, 2025000231, 900231, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47', '127.0.0.1', 1, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47'),
(232, 'Wyman', 'Morissette', '2000-11-01', 'Male', 'O-', 'Hindu', 'Bangladeshi', '4621212895994', '01754052413', 'student232@example.com', '$2y$12$UwV34EoHMtqEpm32leEqceUItj3oMTRk13TrNybtyVE7djaCuqh2K', '48667 Maggio Mission\nMadonnaport, MA 78783', '3421 Mertz Shoals Apt. 350\nSouth Bryanamouth, ME 90926-2346', 'ADM-00232', '2015-03-03', 'C', 'Arts', '2025-2026', 'McKenzie-Pfannerstill School', 'Dr. Jed Wilderman I', 'Doctor', '01395181571', 'father232@example.com', '4846770936947', NULL, 'Graciela Predovic', 'Housewife', '01834888128', 'mother232@example.com', '4586896665463', NULL, 'Dr. Shannon Harber Jr.', '01540359907', 'guardian232@example.com', '0077517776712', 'Uncle', 1, 45, 3, '2025-12-14', NULL, 2025000232, 900232, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47', '127.0.0.1', 1, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47'),
(233, 'Felix', 'Schamberger', '1971-03-23', 'Female', 'AB+', 'Other', 'Bangladeshi', '7971622337609', '01460122590', 'student233@example.com', '$2y$12$7p4Ux3sStDwIKQfHy3i7g.A7j2mblam63jhc01CosiYXfJ/nfkZ/W', '7677 Cummerata Extensions\nNew Leannafort, TN 55657', '23125 Delta Key Apt. 613\nPadbergport, MA 90263-9319', 'ADM-00233', '1970-04-03', 'A', 'Arts', '2025-2026', 'O\'Hara-Hettinger School', 'Colton Maggio', 'Farmer', '01916048149', 'father233@example.com', '4592564425270', NULL, 'Kitty Goodwin', 'Businesswoman', '01964492003', 'mother233@example.com', '4890967205838', NULL, 'Keenan Crooks', '01853629927', 'guardian233@example.com', '3087549007504', 'Aunt', 1, 48, 2, '2025-12-14', NULL, 2025000233, 900233, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47', '127.0.0.1', 1, NULL, '2025-12-14 06:05:47', '2025-12-14 06:05:47'),
(234, 'Aurelia', 'Weimann', '1984-08-02', 'Female', 'B-', 'Islam', 'Bangladeshi', '1459466492674', '01888975223', 'student234@example.com', '$2y$12$lUZNSkKtXCPqeNo9KLQsIugIP8fyPdp07Y8TO8KfFjl2aZgnC1Rjm', '88566 Dina Pike Suite 614\nPort Hilario, ND 27013', '989 Joy Lights Apt. 624\nSouth Elbert, NE 86448', 'ADM-00234', '1987-09-17', 'A', 'Science', '2025-2026', 'Bogan-Dibbert School', 'Dr. Melany Haley DDS', 'Doctor', '01475873271', 'father234@example.com', '2243866169344', NULL, 'Mylene McGlynn DDS', 'Doctor', '01719298755', 'mother234@example.com', '2731839462358', NULL, 'Ms. Laura Parisian', '01683065517', 'guardian234@example.com', '6306364275105', 'Uncle', 1, 46, 3, '2025-12-14', NULL, 2025000234, 900234, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48', '127.0.0.1', 1, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48'),
(235, 'Wendy', 'D\'Amore', '2023-11-18', 'Other', 'B-', 'Islam', 'Bangladeshi', '3913262478820', '01607816673', 'student235@example.com', '$2y$12$TJIcfRwDgVyskS3sBG/1N.FBL8wru9TGfLJXaET/Jwr5v2e40z2Ge', '64893 Kerluke Mount Apt. 248\nGenevievechester, NM 99841-1581', '23595 Zboncak Wall Suite 357\nSouth Kaitlinberg, AZ 12095', 'ADM-00235', '1995-04-13', 'A', 'Science', '2025-2026', 'Wintheiser Ltd School', 'Demond Gusikowski DDS', 'Doctor', '01369398818', 'father235@example.com', '9885012390822', NULL, 'Susana Kris', 'Teacher', '01514879688', 'mother235@example.com', '2993162298987', NULL, 'Kara Nikolaus', '01936509804', 'guardian235@example.com', '5281923007181', 'Sister', 1, 54, 1, '2025-12-14', NULL, 2025000235, 900235, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48', '127.0.0.1', 1, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48'),
(236, 'Rusty', 'Bruen', '2018-07-15', 'Female', 'B-', 'Christian', 'Bangladeshi', '2741047266129', '01763255075', 'student236@example.com', '$2y$12$1daFwvQUhV7IFgMKJ152eurSgZ2rU7NeNHmxhWL52OAT2Wu3Ys/ri', '29533 Shawn Highway Apt. 408\nNorth Marshall, HI 38574', '37795 Lehner Brook\nFlatleychester, HI 67638', 'ADM-00236', '2009-02-20', 'C', 'Commerce', '2025-2026', 'Schimmel Inc School', 'Scottie Frami', 'Engineer', '01948041164', 'father236@example.com', '7033167722732', NULL, 'Maurine Little I', 'Teacher', '01717920099', 'mother236@example.com', '2761098867829', NULL, 'Isaiah Donnelly', '01600906419', 'guardian236@example.com', '0676691824697', 'Brother', 1, 55, 1, '2025-12-14', NULL, 2025000236, 900236, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48', '127.0.0.1', 1, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48'),
(237, 'Aliya', 'Schumm', '1997-03-31', 'Female', 'B-', 'Other', 'Bangladeshi', '4556802667830', '01444621710', 'student237@example.com', '$2y$12$dIdXh0OzJy3O7wMhRS1.U.xjC4v14JbtujIFG/gGaszAE7mVBJI.e', '86298 Ron Trail\nZoieburgh, ME 75356', '80429 Devante Curve\nNorth Ellsworthbury, MO 14168', 'ADM-00237', '1991-03-26', 'B', 'Commerce', '2025-2026', 'Grant, Moen and Thompson School', 'Max Abbott', 'Engineer', '01330985605', 'father237@example.com', '4399958206112', NULL, 'Zetta Bergstrom DVM', 'Teacher', '01800986672', 'mother237@example.com', '2930346801086', NULL, 'Noah Hammes II', '01790048767', 'guardian237@example.com', '3241963626576', 'Sister', 1, 40, 5, '2025-12-14', NULL, 2025000237, 900237, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48', '127.0.0.1', 1, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48'),
(238, 'Amya', 'Schuppe', '2019-08-09', 'Other', 'O+', 'Christian', 'Bangladeshi', '1185818842005', '01720793168', 'student238@example.com', '$2y$12$TDLjTqPX5iPpg3wMW48mReP0GG5BX4snjO/uWGz5tlLP/pPfIhfoa', '84987 Jolie Key Apt. 193\nWallaceton, NC 21918-4402', '6214 Kris Course\nSouth Cassandrechester, HI 96862', 'ADM-00238', '2020-06-13', 'A', 'Science', '2025-2026', 'Brakus PLC School', 'Kris Rutherford', 'Doctor', '01761286933', 'father238@example.com', '2785045211166', NULL, 'Ms. Noelia Fahey', 'Housewife', '01484538737', 'mother238@example.com', '9019122897371', NULL, 'Harold Goyette', '01524044355', 'guardian238@example.com', '1857235956838', 'Grandparent', 1, 47, 3, '2025-12-14', NULL, 2025000238, 900238, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48', '127.0.0.1', 1, NULL, '2025-12-14 06:05:48', '2025-12-14 06:05:48'),
(239, 'Maximillian', 'Corwin', '1981-06-05', 'Other', 'O-', 'Buddhist', 'Bangladeshi', '0954386282961', '01853583055', 'student239@example.com', '$2y$12$hnp7q0uiQ3WzCTXPWqbp.eR8BmwNvoYQWTdu82i0VYZgPMQGetcHS', '77449 Savannah Ville\nPort Larueberg, MI 72427', '1669 Mackenzie Gardens Suite 099\nEast Marlen, LA 81881', 'ADM-00239', '2024-01-05', 'B', 'Science', '2025-2026', 'Wehner-Jakubowski School', 'Lonnie Glover', 'Engineer', '01379140118', 'father239@example.com', '2059812555334', NULL, 'Prof. Kacie Nikolaus Sr.', 'Teacher', '01361261649', 'mother239@example.com', '1213002724079', NULL, 'Mrs. Dawn Kunze I', '01675541729', 'guardian239@example.com', '0854374858770', 'Aunt', 1, 41, 5, '2025-12-14', NULL, 2025000239, 900239, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49', '127.0.0.1', 1, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49'),
(240, 'Reymundo', 'Wintheiser', '1974-12-19', 'Male', 'AB+', 'Other', 'Bangladeshi', '3520172257127', '01333293744', 'student240@example.com', '$2y$12$4WBEHmsW40k4oel00PypTOwL9o8ZGiFM1R5mft/G8U.ETj9ienIWu', '83496 Pagac Vista\nSouth Dasia, MD 87543', '370 Izabella Shore\nNew Briaville, WY 33218', 'ADM-00240', '1985-05-21', 'A', 'Commerce', '2025-2026', 'Raynor, Lind and Bartell School', 'Jeremie Grimes', 'Businessman', '01810982876', 'father240@example.com', '2812494394082', NULL, 'Katelin Funk', 'Housewife', '01517009932', 'mother240@example.com', '4235579562787', NULL, 'Miss Marquise Prosacco Sr.', '01352549715', 'guardian240@example.com', '9617090947669', 'Grandparent', 1, 48, 3, '2025-12-14', NULL, 2025000240, 900240, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49', '127.0.0.1', 1, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49'),
(241, 'Eino', 'Hane', '1985-08-11', 'Male', 'AB-', 'Other', 'Bangladeshi', '0391854249220', '01907471951', 'student241@example.com', '$2y$12$zCSFxwsujqJcP8HicM37n.uE0qAmc9isicfboUqRCUjkUQuvo4tgm', '518 Pagac Spurs Apt. 976\nRusselland, NV 26415', '6669 Joshuah Green Suite 397\nKohlerchester, NC 42099-1650', 'ADM-00241', '1988-08-10', 'A', 'Science', '2025-2026', 'Beahan-Schaefer School', 'Dr. Marcus Moore II', 'Teacher', '01424099707', 'father241@example.com', '2705021110421', NULL, 'Lilian Kerluke DVM', 'Businesswoman', '01590730688', 'mother241@example.com', '0311375601445', NULL, 'Prof. Bria Bartell I', '01336098366', 'guardian241@example.com', '7033076212564', 'Uncle', 1, 49, 3, '2025-12-14', NULL, 2025000241, 900241, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49', '127.0.0.1', 1, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49'),
(242, 'Kaylin', 'Kozey', '1986-08-12', 'Male', 'O+', 'Islam', 'Bangladeshi', '3489061024580', '01606616195', 'student242@example.com', '$2y$12$DkFI3IT4J9S4YxpriFRfwu2VrUtoLoThz7xtP7U6fiPvbtUgr0Lpu', '53736 Krystina Square Suite 512\nEast Mattieburgh, OH 05654-1981', '50075 Blick Mountain\nParkermouth, IA 15847-5697', 'ADM-00242', '2000-10-19', 'B', 'Arts', '2025-2026', 'Denesik Group School', 'Mr. Ike Luettgen I', 'Doctor', '01441850841', 'father242@example.com', '5285176699265', NULL, 'Florida Cremin', 'Businesswoman', '01460339840', 'mother242@example.com', '2092074893500', NULL, 'Mr. Nicholaus Larson', '01996854385', 'guardian242@example.com', '1264211506797', 'Brother', 1, 49, 4, '2025-12-14', NULL, 2025000242, 900242, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49', '127.0.0.1', 1, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49'),
(243, 'Lavon', 'Cummerata', '2009-01-26', 'Female', 'O+', 'Other', 'Bangladeshi', '9156082930791', '01437825015', 'student243@example.com', '$2y$12$DRiOFZeuWUP7EphiBLnD..5uF.czhbWG3YOOqxt3tdFrm.HCgvv.e', '48011 O\'Kon Stream\nEast Rosalindafort, ME 80184', '909 Onie Crescent Apt. 936\nHollieland, TN 35460-1219', 'ADM-00243', '1979-08-29', 'B', 'Commerce', '2025-2026', 'Larkin-Botsford School', 'Hudson Toy', 'Engineer', '01316799923', 'father243@example.com', '5040826689840', NULL, 'Mrs. Maryam Kulas I', 'Nurse', '01432215344', 'mother243@example.com', '6611440784444', NULL, 'Jasper Hauck', '01939611670', 'guardian243@example.com', '3507054967753', 'Uncle', 1, 49, 2, '2025-12-14', NULL, 2025000243, 900243, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49', '127.0.0.1', 1, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49'),
(244, 'Dayton', 'Wilderman', '1987-02-12', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '9907616325283', '01900433501', 'student244@example.com', '$2y$12$u3Sme2sNalxgwV6Z6QqcU.8WJyIScYP6JA9tZZWSs8Qhso9wwoEXO', '40105 Schultz Lock\nRubenton, CA 70727-7715', '791 Torrey Islands\nNew Neva, MN 16372', 'ADM-00244', '2002-04-09', 'C', 'Science', '2025-2026', 'Grady-Barton School', 'Prof. Gerhard Jerde', 'Businessman', '01578821773', 'father244@example.com', '5133474938075', NULL, 'Dr. Joanne O\'Connell', 'Doctor', '01866754757', 'mother244@example.com', '2625978071068', NULL, 'Geovanni Donnelly', '01474827176', 'guardian244@example.com', '3946917370631', 'Uncle', 1, 50, 4, '2025-12-14', NULL, 2025000244, 900244, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49', '127.0.0.1', 1, NULL, '2025-12-14 06:05:49', '2025-12-14 06:05:49'),
(245, 'Cordie', 'Torphy', '1989-12-02', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '6373424334721', '01456507476', 'student245@example.com', '$2y$12$ILP52Oga/hRAbJro3z6ji.IACycwj6FVtWdT/pw6Dzujyu.GpVzE.', '568 Amara Street\nNorth Frederickchester, ND 01721', '215 Tyrese Fort Suite 532\nPort Maxwell, WV 86261-5827', 'ADM-00245', '1997-05-02', 'B', 'Science', '2025-2026', 'Pfeffer-Pollich School', 'Vince Mohr', 'Businessman', '01472093854', 'father245@example.com', '3433681199599', NULL, 'Mrs. Nona Herzog', 'Doctor', '01877367080', 'mother245@example.com', '8297907673957', NULL, 'Alden Braun', '01858845722', 'guardian245@example.com', '4828431527241', 'Brother', 1, 50, 2, '2025-12-14', NULL, 2025000245, 900245, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50', '127.0.0.1', 1, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50'),
(246, 'Arne', 'Steuber', '1981-02-18', 'Male', 'O+', 'Buddhist', 'Bangladeshi', '5223995811797', '01723326151', 'student246@example.com', '$2y$12$Zeavjfuez0IMBf.Ce5l9Ku.hhY9.kdOF5Z49gLmZZZ/qDbbo4rBdG', '1231 Wiza Knoll\nMohamedstad, GA 73488', '45460 Vita Estates\nSouth Americo, KY 59087', 'ADM-00246', '2007-10-15', 'B', 'Science', '2025-2026', 'Davis-Bartell School', 'Amos Feil Sr.', 'Teacher', '01937534314', 'father246@example.com', '6565629541082', NULL, 'Queenie Christiansen', 'Teacher', '01627355956', 'mother246@example.com', '5503943685106', NULL, 'Laurine Lesch', '01570381407', 'guardian246@example.com', '6655336262172', 'Uncle', 1, 51, 2, '2025-12-14', NULL, 2025000246, 900246, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50', '127.0.0.1', 1, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50'),
(247, 'Jan', 'Gerlach', '2018-01-06', 'Male', 'A+', 'Islam', 'Bangladeshi', '8807331580793', '01500432252', 'student247@example.com', '$2y$12$gFPlIbkdgXkCnBozZk1tPuIrxemEWGE.R3Z/6jZ7nw5mk.2mX4sXu', '67253 Crooks Meadows\nGislasonfort, HI 90140', '67396 Kylee Mills Apt. 827\nSouth Odie, SD 53330-1179', 'ADM-00247', '2009-07-23', 'B', 'Science', '2025-2026', 'Eichmann, Waelchi and Bashirian School', 'Dr. Elroy White I', 'Teacher', '01815500838', 'father247@example.com', '0376828144527', NULL, 'Eula Greenfelder', 'Doctor', '01506993415', 'mother247@example.com', '3577094367046', NULL, 'Prof. Elwyn Rippin', '01772085647', 'guardian247@example.com', '1286087052236', 'Uncle', 1, 50, 3, '2025-12-14', NULL, 2025000247, 900247, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50', '127.0.0.1', 1, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50'),
(248, 'Ford', 'Welch', '1989-08-22', 'Other', 'O+', 'Christian', 'Bangladeshi', '0589868818218', '01586961574', 'student248@example.com', '$2y$12$h5aCZ/zcxvQjQJb1.LVV1uY6xSzAosGX2F0cUd9QDQH7aBTDiIyqu', '66645 Witting Knolls Suite 407\nEffertzfort, KS 44652', '546 Ziemann Village Apt. 771\nLake Isabella, OK 50755-6118', 'ADM-00248', '1995-03-30', 'A', 'Arts', '2025-2026', 'Dickens Group School', 'Mr. Lisandro Cormier DDS', 'Engineer', '01858267760', 'father248@example.com', '5930928966322', NULL, 'Daphne Beatty III', 'Housewife', '01415370817', 'mother248@example.com', '1455854496203', NULL, 'August Rempel DDS', '01776936528', 'guardian248@example.com', '8552736825234', 'Aunt', 1, 52, 2, '2025-12-14', NULL, 2025000248, 900248, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50', '127.0.0.1', 1, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50'),
(249, 'Herminio', 'Wehner', '1988-05-31', 'Male', 'B+', 'Christian', 'Bangladeshi', '1237393172115', '01990015230', 'student249@example.com', '$2y$12$COMjkJuqEjKMCL8s2OkJ.O1PBcgd.HcJlo5d8tLEVOF5ZPm95HtPC', '748 Towne Isle Suite 678\nLake Patience, IN 50079', '4104 Fletcher Crossing Apt. 654\nSamirstad, NE 53018-7608', 'ADM-00249', '1997-04-16', 'C', 'Science', '2025-2026', 'Robel-Turcotte School', 'Adrien Smitham', 'Doctor', '01636469533', 'father249@example.com', '7313998189019', NULL, 'Ms. Winona Dooley Jr.', 'Doctor', '01679634654', 'mother249@example.com', '2790161126135', NULL, 'Cody Durgan', '01944662521', 'guardian249@example.com', '4805159896418', 'Brother', 1, 42, 5, '2025-12-14', NULL, 2025000249, 900249, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50', '127.0.0.1', 1, NULL, '2025-12-14 06:05:50', '2025-12-14 06:05:50'),
(250, 'Corbin', 'McKenzie', '1993-07-21', 'Male', 'O-', 'Islam', 'Bangladeshi', '9930305614228', '01867168092', 'student250@example.com', '$2y$12$mRyvSmPB4Ol9lk07roeU6.LD0sc4bq1pCjBnkwNp4w2lW/PgqEM6i', '790 Satterfield Burgs Apt. 328\nKeyonfort, AR 94860-5862', '4111 Yvonne Curve Apt. 434\nNorth Brice, CO 18356-2837', 'ADM-00250', '1996-03-22', 'A', 'Science', '2025-2026', 'Rodriguez Group School', 'Brain Kuphal', 'Doctor', '01388819179', 'father250@example.com', '1563178490075', NULL, 'Kimberly Leuschke IV', 'Housewife', '01979620428', 'mother250@example.com', '2622110326406', NULL, 'Prof. Veda Mitchell DVM', '01497084028', 'guardian250@example.com', '7050753575101', 'Aunt', 1, 51, 3, '2025-12-14', NULL, 2025000250, 900250, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51', '127.0.0.1', 1, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51'),
(251, 'Wyatt', 'Hilpert', '1971-07-19', 'Female', 'B-', 'Buddhist', 'Bangladeshi', '7971911032687', '01799359634', 'student251@example.com', '$2y$12$zHDAz0gbRn2vD3VPf0lam.VGa4nQfzplND9IvaPLwF7LNJIBVpc5C', '417 Abshire Stream\nRogahnborough, NC 61175-0728', '179 Wilhelmine Junctions Apt. 336\nSouth Penelopetown, NC 25517', 'ADM-00251', '1981-03-25', 'A', 'Arts', '2025-2026', 'Hessel, Herzog and Dickens School', 'Mr. Demario Rippin PhD', 'Teacher', '01656474413', 'father251@example.com', '9956177230106', NULL, 'Jeanne Willms', 'Nurse', '01757810592', 'mother251@example.com', '7910259221425', NULL, 'Cindy Haag III', '01450273726', 'guardian251@example.com', '3540521478169', 'Uncle', 1, 43, 5, '2025-12-14', NULL, 2025000251, 900251, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51', '127.0.0.1', 1, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51'),
(252, 'Tierra', 'Walsh', '1995-04-23', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '4403946349582', '01687544781', 'student252@example.com', '$2y$12$aESQdsNok6oLk8Nj3hZ3l.bT39Hxm58OftPLM4iYgxhQ4apro7iWq', '1364 Balistreri Expressway\nSouth Oswaldo, ND 57750', '15856 Luna Villages Suite 254\nSalvatoreside, NV 11347', 'ADM-00252', '1996-07-08', 'C', 'Arts', '2025-2026', 'Klein, Lebsack and Schulist School', 'Mr. Claude Connelly', 'Doctor', '01350395068', 'father252@example.com', '6100844139287', NULL, 'Miss Aditya O\'Connell', 'Teacher', '01735245672', 'mother252@example.com', '1488978990706', NULL, 'Filiberto Hettinger', '01693203077', 'guardian252@example.com', '4448451660241', 'Brother', 1, 53, 2, '2025-12-14', NULL, 2025000252, 900252, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51', '127.0.0.1', 1, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51'),
(253, 'Rupert', 'Grady', '2010-12-05', 'Male', 'B-', 'Hindu', 'Bangladeshi', '4099926373085', '01676185395', 'student253@example.com', '$2y$12$v99PG513LPoPULZ8a5xed.YeTnl07cjzt.csS/HBXFCAHz9cWOe5y', '536 Heller Coves\nNathenside, LA 47892-3939', '6074 Casper Crest Apt. 294\nWest Valentine, VT 99736', 'ADM-00253', '1972-08-18', 'A', 'Science', '2025-2026', 'Lakin Ltd School', 'Hardy Quigley', 'Teacher', '01691532560', 'father253@example.com', '0142330193575', NULL, 'Prof. Emmanuelle Denesik DDS', 'Housewife', '01592709894', 'mother253@example.com', '9186880453014', NULL, 'Prof. Dorthy Kutch', '01473090906', 'guardian253@example.com', '1793576010005', 'Grandparent', 1, 51, 4, '2025-12-14', NULL, 2025000253, 900253, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51', '127.0.0.1', 1, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51'),
(254, 'Daphne', 'Hintz', '1994-05-26', 'Male', 'A-', 'Islam', 'Bangladeshi', '6300985014722', '01644199038', 'student254@example.com', '$2y$12$gJgO8/emR2Iu/cRE33LUL.0ZjgFo77Hk3l27sMSS54wSMivyLdK7e', '9367 Anastasia Lodge Suite 504\nMaevefort, NV 94085', '726 Buckridge Rapids\nNew Mustafachester, WI 27863-8398', 'ADM-00254', '1978-05-17', 'B', 'Commerce', '2025-2026', 'Stiedemann-Koelpin School', 'Remington Huels', 'Doctor', '01640499953', 'father254@example.com', '5990915557204', NULL, 'Oleta Conn', 'Businesswoman', '01365898241', 'mother254@example.com', '4786456281032', NULL, 'Miss Araceli Mitchell', '01354730934', 'guardian254@example.com', '7834040443490', 'Brother', 1, 52, 3, '2025-12-14', NULL, 2025000254, 900254, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51', '127.0.0.1', 1, NULL, '2025-12-14 06:05:51', '2025-12-14 06:05:51'),
(255, 'Blaze', 'Bechtelar', '1983-12-17', 'Male', 'A-', 'Christian', 'Bangladeshi', '5023362891195', '01684150592', 'student255@example.com', '$2y$12$/wkkiKcBVTRaYkyzxWum1On1TYFhoyjPLkMdUZhRykdmAGggZr5k2', '401 McDermott Knoll\nLake Venatown, MN 98816', '8382 Huels Glen Apt. 389\nCaylaborough, NV 79420', 'ADM-00255', '1983-09-04', 'C', 'Arts', '2025-2026', 'Nader, Grimes and Wolf School', 'Isai Brakus', 'Farmer', '01504280808', 'father255@example.com', '3774229014571', NULL, 'Alessandra Boehm', 'Nurse', '01860025408', 'mother255@example.com', '9181346906529', NULL, 'Adriana Hammes', '01810186828', 'guardian255@example.com', '3908514225275', 'Brother', 1, 44, 5, '2025-12-14', NULL, 2025000255, 900255, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52', '127.0.0.1', 1, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52'),
(256, 'Amya', 'Rogahn', '2010-08-19', 'Female', 'O+', 'Islam', 'Bangladeshi', '0327445421034', '01888240082', 'student256@example.com', '$2y$12$njJMhVJuKpEHv8PYKfIbZuw1ZLcGYsMbzs6ADYDstvo/YnX7Cv71u', '74054 Gerlach Well Suite 372\nGabeland, AK 18047', '91752 Abel Loop Apt. 252\nNew Jaceymouth, IA 65366', 'ADM-00256', '2006-04-06', 'C', 'Commerce', '2025-2026', 'Hills, Emard and Renner School', 'Johann Feest', 'Engineer', '01437841126', 'father256@example.com', '0159731950330', NULL, 'Prof. Mellie Sipes MD', 'Nurse', '01782705255', 'mother256@example.com', '7041888723244', NULL, 'Ulises Sipes I', '01669423142', 'guardian256@example.com', '6274269291561', 'Brother', 1, 54, 2, '2025-12-14', NULL, 2025000256, 900256, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52', '127.0.0.1', 1, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52'),
(257, 'Darren', 'Carter', '2011-09-09', 'Other', 'O-', 'Christian', 'Bangladeshi', '0724574758545', '01963098463', 'student257@example.com', '$2y$12$jqpefCYpAcwBzpBMbBJGa.lfdUmJzqmV5CQndFy9sNHw32utiwYBS', '717 Hintz Burgs\nSouth Holdenmouth, CO 95624', '684 Jayden Terrace Apt. 116\nLake Zena, OK 32741', 'ADM-00257', '1995-01-08', 'B', 'Arts', '2025-2026', 'Gorczany PLC School', 'Prof. Rory Roob V', 'Businessman', '01468259226', 'father257@example.com', '3904388519117', NULL, 'Mrs. Alberta Hamill', 'Businesswoman', '01832786498', 'mother257@example.com', '8689879903585', NULL, 'Prof. Reed Eichmann Sr.', '01432086881', 'guardian257@example.com', '9035132388576', 'Brother', 1, 55, 2, '2025-12-14', NULL, 2025000257, 900257, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52', '127.0.0.1', 1, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52'),
(258, 'Rahul', 'Kunze', '1975-01-15', 'Female', 'A+', 'Other', 'Bangladeshi', '8141357418904', '01658013696', 'student258@example.com', '$2y$12$xTZTdfJSRFY6s1.pVq8f0eREnnMdNKSq0WV7cR0bzKtCx5QPLA.T2', '1020 Ullrich Meadows Apt. 164\nPort Emilianoport, WV 10926-5097', '25712 Schamberger Harbor\nCreminport, KS 56700', 'ADM-00258', '2024-10-30', 'C', 'Science', '2025-2026', 'Legros Ltd School', 'Mr. Lane Schaefer PhD', 'Engineer', '01600068479', 'father258@example.com', '2042146188280', NULL, 'Audie Crooks', 'Doctor', '01611586127', 'mother258@example.com', '8329012659388', NULL, 'Odessa Cremin', '01628582872', 'guardian258@example.com', '6614943082840', 'Uncle', 1, 52, 4, '2025-12-14', NULL, 2025000258, 900258, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52', '127.0.0.1', 1, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52'),
(259, 'Mariela', 'Parisian', '1987-05-20', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '7748051178544', '01919128130', 'student259@example.com', '$2y$12$rQ.9AT8RqN/SmaTSNqYCV.Tq6ubxuxwERNVzsYVISt29z17dTHBKK', '53461 Cormier Plain Suite 490\nEunabury, IL 99036', '10164 Huel Stream Suite 787\nJaststad, DE 21876', 'ADM-00259', '1978-05-22', 'A', 'Commerce', '2025-2026', 'Steuber PLC School', 'Prof. Samir Kerluke Sr.', 'Businessman', '01786817042', 'father259@example.com', '9159164187107', NULL, 'Delphine Trantow V', 'Teacher', '01971061546', 'mother259@example.com', '5549590749953', NULL, 'Mr. Micah Rosenbaum', '01508826595', 'guardian259@example.com', '7299391530283', 'Aunt', 1, 56, 2, '2025-12-14', NULL, 2025000259, 900259, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52', '127.0.0.1', 1, NULL, '2025-12-14 06:05:52', '2025-12-14 06:05:52'),
(260, 'Eugenia', 'Jones', '1973-12-10', 'Male', 'A-', 'Buddhist', 'Bangladeshi', '7513178354598', '01459933887', 'student260@example.com', '$2y$12$87t.U.e9lgsyv9L3/UBIVuoTZuM4JQ74PIRiFjZFVC0NNMQxS1JK2', '98682 Armando Meadow Apt. 698\nWest Anabelborough, NV 01208', '31994 Phyllis Circle\nMontanaberg, OH 16880-4227', 'ADM-00260', '2018-07-22', 'B', 'Commerce', '2025-2026', 'McGlynn Group School', 'Arturo Deckow IV', 'Engineer', '01545689876', 'father260@example.com', '8335757692526', NULL, 'Eve Turner II', 'Doctor', '01820861457', 'mother260@example.com', '7878080450346', NULL, 'Rhett Hermann', '01420140152', 'guardian260@example.com', '5792102249589', 'Brother', 1, 53, 3, '2025-12-14', NULL, 2025000260, 900260, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53', '127.0.0.1', 1, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53'),
(261, 'Candido', 'Bins', '2012-07-10', 'Male', 'A+', 'Christian', 'Bangladeshi', '5702563780107', '01740205119', 'student261@example.com', '$2y$12$itPL1tnGMQgehCy6FOGoa.YppGOavwDAWEmzBw3tcgPoUuFZEBj96', '4194 Hilpert Meadows Apt. 965\nWest Velda, MO 20366-0553', '39073 Heidenreich Motorway\nLake Geoffreyport, AL 51129', 'ADM-00261', '2022-07-30', 'C', 'Commerce', '2025-2026', 'Waters, Mohr and Daugherty School', 'Giovanny Hane', 'Businessman', '01996236318', 'father261@example.com', '4585163825920', NULL, 'Elsie Graham', 'Nurse', '01520963124', 'mother261@example.com', '1468574917330', NULL, 'Rosalia Labadie V', '01818364321', 'guardian261@example.com', '1012532657192', 'Brother', 1, 53, 4, '2025-12-14', NULL, 2025000261, 900261, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53', '127.0.0.1', 1, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53'),
(262, 'Enola', 'Nicolas', '2016-06-02', 'Other', 'B-', 'Hindu', 'Bangladeshi', '3804517944481', '01659429547', 'student262@example.com', '$2y$12$Zff5ou6VxyNDrwPlBhio/OWTCo7e81Z2AhMn.UfmeKb0eW/yeYZie', '57193 Orval Forges Apt. 937\nPort Margret, PA 06264', '96762 Schiller Highway\nJedidiahview, CA 68652', 'ADM-00262', '2011-10-05', 'B', 'Science', '2025-2026', 'Yundt, Braun and Carter School', 'Green Leannon', 'Doctor', '01967260784', 'father262@example.com', '9689815945686', NULL, 'Andreanne Mante', 'Businesswoman', '01415792139', 'mother262@example.com', '6298575856600', NULL, 'Dr. Josh Leuschke MD', '01555348136', 'guardian262@example.com', '4211344149187', 'Uncle', 1, 57, 2, '2025-12-14', NULL, 2025000262, 900262, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53', '127.0.0.1', 1, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53'),
(263, 'Bailey', 'Shanahan', '2019-08-04', 'Other', 'B+', 'Other', 'Bangladeshi', '9519848107783', '01639929359', 'student263@example.com', '$2y$12$i8tc7UEsXPGcQvBo6efQB.lqmmxYzPDDlb7MC/OxHvWz8OCMfae62', '7465 Earnest Light\nEast Vada, OK 29709-3632', '431 Ian Cliff Apt. 262\nNew Brannonside, CT 42346', 'ADM-00263', '1984-12-25', 'B', 'Arts', '2025-2026', 'Collier, Nitzsche and Blick School', 'Dr. Darion Abbott', 'Engineer', '01457487068', 'father263@example.com', '0342261656498', NULL, 'Charlotte Kunze', 'Nurse', '01660261887', 'mother263@example.com', '7490413720869', NULL, 'Jaeden Gislason', '01766002883', 'guardian263@example.com', '0527555402839', 'Sister', 1, 54, 3, '2025-12-14', NULL, 2025000263, 900263, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53', '127.0.0.1', 1, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53'),
(264, 'Eldred', 'Windler', '1973-05-01', 'Other', 'A-', 'Islam', 'Bangladeshi', '2303385729752', '01441511502', 'student264@example.com', '$2y$12$XHXVwd4ZsKDATKpm3/A3Tu1XvtlZPMcVGJRERPgGpmxQILqv3HYOq', '87665 Daugherty Extensions Apt. 010\nWest Romainemouth, DE 43733', '4631 Hamill Ports Apt. 916\nSouth Domenicton, WV 59619-9844', 'ADM-00264', '1973-01-09', 'B', 'Science', '2025-2026', 'Halvorson-Maggio School', 'Darrick Upton', 'Doctor', '01826236505', 'father264@example.com', '9110776020228', NULL, 'Beulah Schoen', 'Teacher', '01826548120', 'mother264@example.com', '2285895618420', NULL, 'Carissa Skiles', '01503020976', 'guardian264@example.com', '8132113979746', 'Aunt', 1, 54, 4, '2025-12-14', NULL, 2025000264, 900264, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53', '127.0.0.1', 1, NULL, '2025-12-14 06:05:53', '2025-12-14 06:05:53'),
(265, 'Elbert', 'Kerluke', '1979-03-07', 'Other', 'AB+', 'Buddhist', 'Bangladeshi', '8889230032615', '01677814073', 'student265@example.com', '$2y$12$sjEe.3r8RPjDVa4ePOreduOqQchb3PTFrtL7b4PLe4PMFLCmGmcD6', '5698 Denesik Square Suite 915\nRoobberg, OR 33016-4814', '16207 Fisher Route Suite 095\nKshlerinfort, IL 41179', 'ADM-00265', '1985-10-04', 'C', 'Commerce', '2025-2026', 'Smitham-Wisoky School', 'Dr. Jamie Watsica', 'Engineer', '01461625565', 'father265@example.com', '7171906226120', NULL, 'Bethany Schmeler', 'Nurse', '01854160995', 'mother265@example.com', '1002438061614', NULL, 'Dr. Benton Trantow Sr.', '01321442456', 'guardian265@example.com', '3116593736360', 'Uncle', 1, 45, 5, '2025-12-14', NULL, 2025000265, 900265, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54', '127.0.0.1', 1, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54'),
(266, 'Owen', 'Ryan', '1986-04-15', 'Other', 'B-', 'Other', 'Bangladeshi', '0077042804608', '01764184795', 'student266@example.com', '$2y$12$cngppkGl9Wm7eanIuPdgNe/q/Gi0nMRMgKMNnm8W7EmPpDk7I4U8S', '26214 Kellie Coves\nShanachester, PA 61419', '2359 Valerie Summit\nAlbertshire, NH 69094-7566', 'ADM-00266', '2008-05-14', 'A', 'Commerce', '2025-2026', 'Wolff-Kuhic School', 'Mr. Marques Gutmann DVM', 'Doctor', '01892183171', 'father266@example.com', '5491087770351', NULL, 'Myrtle Ratke', 'Nurse', '01324242047', 'mother266@example.com', '9814663906706', NULL, 'Sabina Olson', '01840513483', 'guardian266@example.com', '5773084602390', 'Aunt', 1, 46, 5, '2025-12-14', NULL, 2025000266, 900266, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54', '127.0.0.1', 1, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54'),
(267, 'Marilyne', 'Walsh', '1992-07-20', 'Other', 'A-', 'Christian', 'Bangladeshi', '9600933115086', '01517000869', 'student267@example.com', '$2y$12$O/oToLDxAs2GHP.4wHSLxO1.RVgcw/hQgRBI0JTXhJTEJLCLUn0Xi', '31947 Bosco Street Apt. 212\nWest Alda, ID 27557-3360', '1330 Connor Unions\nSengerburgh, VT 57438-4348', 'ADM-00267', '1983-04-17', 'A', 'Arts', '2025-2026', 'Batz Inc School', 'Blaze Bashirian', 'Businessman', '01423203688', 'father267@example.com', '4717306888519', NULL, 'Loyce Stiedemann', 'Doctor', '01888858195', 'mother267@example.com', '5089667123672', NULL, 'Ms. Kailee Howell', '01413484052', 'guardian267@example.com', '6433191516075', 'Brother', 1, 55, 4, '2025-12-14', NULL, 2025000267, 900267, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54', '127.0.0.1', 1, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54'),
(268, 'Mollie', 'Schaden', '2016-09-23', 'Female', 'A+', 'Other', 'Bangladeshi', '3764999667421', '01838671390', 'student268@example.com', '$2y$12$OlsQF1Pc15VVQ231WURum.XwjRqBopZvxH9gwkOEtuNS9NAMGe/cy', '61273 Dach Common\nWest Norbertoberg, GA 16139-5375', '74184 Harmon Trafficway Suite 058\nFadelshire, IN 32632-9282', 'ADM-00268', '2010-04-09', 'B', 'Arts', '2025-2026', 'Torphy, Lockman and Gislason School', 'Dr. Percival Hackett', 'Farmer', '01709368135', 'father268@example.com', '5322659184189', NULL, 'Darby Kuhn III', 'Housewife', '01404299839', 'mother268@example.com', '4644569295393', NULL, 'Mr. Augustus Wyman DDS', '01875995166', 'guardian268@example.com', '8513448357103', 'Sister', 1, 55, 3, '2025-12-14', NULL, 2025000268, 900268, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54', '127.0.0.1', 1, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54'),
(269, 'Aliyah', 'Herman', '1985-02-06', 'Female', 'A-', 'Other', 'Bangladeshi', '1166550917320', '01316206232', 'student269@example.com', '$2y$12$XRBdzvEvvNcl0UaWc3ADxeoiLNBqFXVjvdZfNfuGcgvdePd6awyRK', '70876 Juwan Centers\nWest Grayson, ME 56312', '37676 Gregorio Mall\nBarrowsland, FL 21642', 'ADM-00269', '1974-12-09', 'C', 'Science', '2025-2026', 'Kirlin, Medhurst and Mitchell School', 'Prof. Maximus Dooley MD', 'Doctor', '01908774467', 'father269@example.com', '3634572771807', NULL, 'Larissa Raynor PhD', 'Housewife', '01410166675', 'mother269@example.com', '1650063065778', NULL, 'Miss Kiana Veum', '01513775153', 'guardian269@example.com', '7048344413973', 'Brother', 1, 56, 1, '2025-12-14', NULL, 2025000269, 900269, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54', '127.0.0.1', 1, NULL, '2025-12-14 06:05:54', '2025-12-14 06:05:54'),
(270, 'Carmela', 'Abernathy', '1983-07-29', 'Male', 'AB+', 'Other', 'Bangladeshi', '8447103304641', '01965699145', 'student270@example.com', '$2y$12$YXTTEf2mXZeRdk9YBocfI.mPqnjoCNeDAdw8ajjeIxyGC6z.1JJ2y', '4533 Nickolas Courts\nSouth Name, NJ 64301', '5127 Wolff Ridges Suite 255\nWizafort, NH 65810', 'ADM-00270', '1989-01-14', 'C', 'Commerce', '2025-2026', 'Rempel-Ferry School', 'John Padberg', 'Doctor', '01668201125', 'father270@example.com', '0421592787077', NULL, 'Magdalena Kuhlman', 'Teacher', '01690058600', 'mother270@example.com', '1942038340879', NULL, 'Nora Beahan IV', '01607702209', 'guardian270@example.com', '4480548311157', 'Uncle', 1, 57, 1, '2025-12-14', NULL, 2025000270, 900270, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55', '127.0.0.1', 1, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55'),
(271, 'Elena', 'King', '1983-11-11', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '8514153542725', '01864346196', 'student271@example.com', '$2y$12$Uovd8HIS4dpNgfGdIF5xJuHmJGhYxNDg2mBmb8klwKXjbln80ZW8m', '11789 Cartwright Shores Apt. 110\nMayertton, WA 86092', '4715 King Roads Suite 182\nEast Ewell, CO 28179', 'ADM-00271', '2020-09-19', 'C', 'Arts', '2025-2026', 'Ritchie, Quigley and Bashirian School', 'Mr. Reinhold Ratke', 'Engineer', '01943739091', 'father271@example.com', '3706750760222', NULL, 'Leonie Wyman', 'Teacher', '01603402316', 'mother271@example.com', '6108336425428', NULL, 'Dr. Marcos Lowe', '01862276256', 'guardian271@example.com', '9806491253668', 'Brother', 1, 58, 2, '2025-12-14', NULL, 2025000271, 900271, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55', '127.0.0.1', 1, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55'),
(272, 'Jaren', 'Bernier', '1995-01-10', 'Other', 'AB-', 'Other', 'Bangladeshi', '5625547990915', '01866968188', 'student272@example.com', '$2y$12$emR5cfO3vfR97jgqW/jV5ews2Fs28xLwm5C2HAuOeqgsPvY1gVTPa', '754 Milford Pines Apt. 704\nBeattyfort, IN 22904', '6961 Hudson Isle Apt. 720\nWest Reyes, ID 69497-9623', 'ADM-00272', '2001-08-06', 'B', 'Commerce', '2025-2026', 'Reilly, O\'Reilly and Erdman School', 'Kobe McLaughlin', 'Engineer', '01573128292', 'father272@example.com', '7179776741192', NULL, 'Mia Howe', 'Nurse', '01333984250', 'mother272@example.com', '9069793522491', NULL, 'Adrianna Bechtelar Jr.', '01999135250', 'guardian272@example.com', '0567300639712', 'Grandparent', 1, 56, 4, '2025-12-14', NULL, 2025000272, 900272, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55', '127.0.0.1', 1, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55'),
(273, 'Thad', 'Rath', '2003-09-18', 'Female', 'O+', 'Other', 'Bangladeshi', '2769558557630', '01679893568', 'student273@example.com', '$2y$12$.riXbqvN0NTFty7mM7CoxuRaJV88SIgbXfCybMdKgSEKN7YcbWx6a', '6822 Frami Springs\nTressashire, IN 66437-8334', '2920 Lance Station Apt. 721\nRomaland, NJ 81896-4518', 'ADM-00273', '2020-09-30', 'B', 'Arts', '2025-2026', 'Jaskolski-Batz School', 'Noe Schmidt', 'Farmer', '01404258705', 'father273@example.com', '9586319651056', NULL, 'Yessenia Hand', 'Doctor', '01515581304', 'mother273@example.com', '7748190371975', NULL, 'Alverta Reilly', '01638029352', 'guardian273@example.com', '2383561297966', 'Grandparent', 1, 59, 2, '2025-12-14', NULL, 2025000273, 900273, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55', '127.0.0.1', 1, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55'),
(274, 'Sarina', 'Welch', '1973-10-11', 'Female', 'A-', 'Other', 'Bangladeshi', '4046529938043', '01323078800', 'student274@example.com', '$2y$12$boJ/QND8Zfp8BlloagSLuefezC0D1C8nih7DMG1Jziysju4TGGgOi', '23827 Tomasa Oval\nLake Elvera, KS 80616', '491 Wyman Wells Suite 053\nWavatown, OR 75812', 'ADM-00274', '2012-07-25', 'B', 'Science', '2025-2026', 'Dietrich, McClure and Eichmann School', 'Dr. Sedrick McDermott Sr.', 'Engineer', '01845984022', 'father274@example.com', '7588501262316', NULL, 'Rosina Kuphal', 'Nurse', '01866429244', 'mother274@example.com', '8247199143292', NULL, 'Willow Bogisich', '01438372177', 'guardian274@example.com', '2078987944445', 'Brother', 1, 57, 4, '2025-12-14', NULL, 2025000274, 900274, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55', '127.0.0.1', 1, NULL, '2025-12-14 06:05:55', '2025-12-14 06:05:55'),
(275, 'Macey', 'Swaniawski', '1992-08-26', 'Male', 'AB+', 'Buddhist', 'Bangladeshi', '8216793953945', '01785210922', 'student275@example.com', '$2y$12$.2GsksG9V0Lk8MrGzZAFSudMFQGqiOOF3daWQSqLNKVH4pZh5HmlW', '8733 Jaylan Corners Apt. 383\nBradtkeshire, WA 08854-1690', '5333 Vesta Fields\nSouth Cristopher, SD 30081-3510', 'ADM-00275', '2012-07-23', 'A', 'Commerce', '2025-2026', 'Grant, Daugherty and Hermiston School', 'Stephen Rodriguez PhD', 'Doctor', '01769484396', 'father275@example.com', '0165825941709', NULL, 'Gwen Schmitt', 'Businesswoman', '01470909492', 'mother275@example.com', '8750139042718', NULL, 'Gillian Renner', '01450913234', 'guardian275@example.com', '5765791343147', 'Brother', 1, 60, 2, '2025-12-14', NULL, 2025000275, 900275, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56', '127.0.0.1', 1, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56'),
(276, 'Chyna', 'Gleichner', '2022-01-10', 'Other', 'A+', 'Other', 'Bangladeshi', '0530205207012', '01695418531', 'student276@example.com', '$2y$12$S8yWCJpNU6jo9Kh6.HkSReaaYppPGZSPjtI.ZozsFQw7uIQ.2zMse', '4971 Green Summit\nPort Mckayla, AL 57052-8680', '6822 Murphy Fort\nPort Karolannfurt, PA 05761-7623', 'ADM-00276', '1972-09-06', 'B', 'Arts', '2025-2026', 'Deckow, D\'Amore and Rau School', 'Karley Turcotte', 'Businessman', '01425751168', 'father276@example.com', '8229697436144', NULL, 'Joanne Klocko', 'Nurse', '01662484646', 'mother276@example.com', '8857996615261', NULL, 'Ms. Willa Ullrich', '01505850406', 'guardian276@example.com', '1683390644553', 'Uncle', 1, 47, 5, '2025-12-14', NULL, 2025000276, 900276, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56', '127.0.0.1', 1, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56'),
(277, 'Bethany', 'Fay', '1972-10-16', 'Other', 'O-', 'Hindu', 'Bangladeshi', '3698151555076', '01359620565', 'student277@example.com', '$2y$12$BmNGuuDFrmLdYc.I9uHPO.jJXIww9dc.UzNZXgt1mWI6JBgUf1dYe', '6478 Maximo Point Apt. 925\nPort Lorena, MD 71333-1760', '7787 Shields Curve\nEast Cindy, CT 72228-6250', 'ADM-00277', '1977-11-12', 'B', 'Arts', '2025-2026', 'Emard, Johns and Eichmann School', 'Brice Beatty MD', 'Engineer', '01767902274', 'father277@example.com', '7656471489584', NULL, 'Mrs. Vena Tillman', 'Businesswoman', '01721002905', 'mother277@example.com', '3358567471850', NULL, 'Mr. Moriah Nicolas', '01682271627', 'guardian277@example.com', '9780045389712', 'Sister', 1, 56, 3, '2025-12-14', NULL, 2025000277, 900277, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56', '127.0.0.1', 1, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56'),
(278, 'Felix', 'Mertz', '2001-12-03', 'Other', 'O+', 'Islam', 'Bangladeshi', '4640907411776', '01408510595', 'student278@example.com', '$2y$12$Q404TOthUczBU1FH5ROnh.0zMeLMb6qfg53sVTdUT44K0vmMrpxxW', '37431 Else Parkways\nLexushaven, NY 61869-7944', '98717 Fahey Trace Apt. 145\nNorth Lloydbury, WI 17123-8050', 'ADM-00278', '1976-10-16', 'B', 'Commerce', '2025-2026', 'Simonis, Beahan and Wiegand School', 'Prof. Elliot Lynch', 'Engineer', '01792741771', 'father278@example.com', '5260492008450', NULL, 'Thelma Rohan', 'Businesswoman', '01478645495', 'mother278@example.com', '3669679432280', NULL, 'Joshua Rohan', '01622689139', 'guardian278@example.com', '8384829853153', 'Aunt', 1, 48, 5, '2025-12-14', NULL, 2025000278, 900278, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56', '127.0.0.1', 1, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56'),
(279, 'Abigayle', 'Gleason', '2008-09-28', 'Male', 'A+', 'Christian', 'Bangladeshi', '2047476996201', '01328348896', 'student279@example.com', '$2y$12$JATI3MOnZhwcQ/z0UzF0wOcAfpseLlKkSkeQhjVSFsPpFRThBA6iG', '7708 Kub Springs Apt. 988\nBaumbachhaven, TN 54280', '6310 Malika Cape\nRolfsonview, OR 72839', 'ADM-00279', '2021-04-18', 'A', 'Commerce', '2025-2026', 'Runolfsdottir LLC School', 'Kirk Beer', 'Businessman', '01354859948', 'father279@example.com', '4459874866572', NULL, 'Mrs. Hildegard Yost', 'Teacher', '01653469120', 'mother279@example.com', '6146575853357', NULL, 'Ara Jenkins', '01934489989', 'guardian279@example.com', '4481969044245', 'Sister', 1, 58, 1, '2025-12-14', NULL, 2025000279, 900279, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56', '127.0.0.1', 1, NULL, '2025-12-14 06:05:56', '2025-12-14 06:05:56'),
(280, 'Nia', 'Lubowitz', '1984-07-29', 'Male', 'O-', 'Christian', 'Bangladeshi', '4779737496229', '01616384248', 'student280@example.com', '$2y$12$eZQemg1j02g2NZnAeze.JerX/Zo57KcwpkfeiFhK61dyrhhY2P6he', '3751 Hirthe Field Apt. 985\nWest Reidbury, TX 96606-3717', '58268 Russel Islands Apt. 107\nJanbury, KS 66247-9667', 'ADM-00280', '2018-05-31', 'C', 'Commerce', '2025-2026', 'Gerhold LLC School', 'Julio Torphy II', 'Farmer', '01550473006', 'father280@example.com', '6935686448712', NULL, 'Rosalyn Weimann', 'Teacher', '01397523811', 'mother280@example.com', '2778650461428', NULL, 'Mrs. Veda Little', '01404358120', 'guardian280@example.com', '3667136622803', 'Aunt', 1, 57, 3, '2025-12-14', NULL, 2025000280, 900280, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57', '127.0.0.1', 1, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(281, 'Whitney', 'Blick', '2024-03-15', 'Other', 'A+', 'Buddhist', 'Bangladeshi', '8658166306791', '01853065765', 'student281@example.com', '$2y$12$j.jpL1tpGYWHadZwNxi59.x3bcbwejXOeQjhPvULsXYjbB/B2a.q6', '22747 Huels Ridge Suite 231\nKoeppmouth, IA 60965', '186 Elissa Corner\nSouth Maureen, SC 66145', 'ADM-00281', '2007-07-13', 'A', 'Science', '2025-2026', 'Ratke-Konopelski School', 'Kadin Mann DDS', 'Businessman', '01303359567', 'father281@example.com', '9932527618712', NULL, 'Ms. Elizabeth Feil', 'Nurse', '01343451463', 'mother281@example.com', '3148697917291', NULL, 'Jerrod Sporer', '01359468328', 'guardian281@example.com', '9641618066352', 'Uncle', 1, 61, 2, '2025-12-14', NULL, 2025000281, 900281, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57', '127.0.0.1', 1, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57'),
(282, 'Thaddeus', 'Bernier', '2021-07-21', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '8563425586602', '01993800191', 'student282@example.com', '$2y$12$kSS1/WaItbUkQNRH32rL4u7alNC.6h92SpyLOuFelCd3hT5HHIHPm', '65275 Audie Prairie\nWest Noemyburgh, MA 52720', '792 Torey Lake Suite 134\nWilberland, MI 04564-6141', 'ADM-00282', '1990-12-27', 'C', 'Science', '2025-2026', 'Huels, Anderson and Medhurst School', 'Jamie Roob', 'Teacher', '01781642188', 'father282@example.com', '7481454857687', NULL, 'Antonette Walter', 'Businesswoman', '01685860933', 'mother282@example.com', '9882240850360', NULL, 'Kamille Heller', '01458693371', 'guardian282@example.com', '2577515482895', 'Brother', 1, 58, 3, '2025-12-14', NULL, 2025000282, 900282, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57', '127.0.0.1', 1, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57'),
(283, 'Elda', 'Trantow', '2015-04-30', 'Female', 'A-', 'Other', 'Bangladeshi', '4356390521834', '01918161655', 'student283@example.com', '$2y$12$YKf1ya/3Recn25qbk1Zz8.erLb6..bTmVHZmuxUD5i7QpddjDqhGi', '57332 Nienow Estates\nEmanuelmouth, NJ 24016-2294', '754 Raynor Causeway Apt. 264\nJaidahaven, CT 07105-7394', 'ADM-00283', '1997-09-25', 'B', 'Commerce', '2025-2026', 'Luettgen-Anderson School', 'Barney Stark', 'Farmer', '01915375015', 'father283@example.com', '7103705646183', NULL, 'Zetta Ruecker', 'Housewife', '01797847544', 'mother283@example.com', '9603984768810', NULL, 'Donnell Donnelly', '01458410488', 'guardian283@example.com', '9676871800473', 'Uncle', 1, 59, 1, '2025-12-14', NULL, 2025000283, 900283, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57', '127.0.0.1', 1, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57'),
(284, 'Gwen', 'Hudson', '2007-04-17', 'Other', 'A-', 'Christian', 'Bangladeshi', '8442414163450', '01863514754', 'student284@example.com', '$2y$12$b56wzPHJCb3/03RtlN8Jt.7662i1X692w8Rk7CPNhmaYV.ayaOROW', '84366 Buckridge Mount Apt. 845\nWilberborough, WA 48640-4289', '72381 Kiehn Plaza\nHendersonhaven, NH 10473', 'ADM-00284', '1985-08-16', 'B', 'Science', '2025-2026', 'DuBuque and Sons School', 'Brant Gibson', 'Farmer', '01971828438', 'father284@example.com', '3229032226442', NULL, 'Mabelle Champlin MD', 'Housewife', '01840406804', 'mother284@example.com', '1898694766820', NULL, 'Melvin Marquardt', '01631230991', 'guardian284@example.com', '6471767693934', 'Grandparent', 1, 59, 3, '2025-12-14', NULL, 2025000284, 900284, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57', '127.0.0.1', 1, NULL, '2025-12-14 06:05:57', '2025-12-14 06:05:57'),
(285, 'Madie', 'D\'Amore', '1981-10-11', 'Other', 'AB+', 'Other', 'Bangladeshi', '8598568853722', '01439149905', 'student285@example.com', '$2y$12$BhnpoOHRRNE.sri1xb1BjOv2VbVQXGs/Qks9xKqCdAPJnRdbLDXEm', '3366 Marquardt Forges\nNorth Norris, IA 96843-2453', '610 Lang Pines Suite 247\nNorth Petermouth, WV 49138', 'ADM-00285', '2013-04-15', 'A', 'Arts', '2025-2026', 'Jast, Heller and Daugherty School', 'Thad Douglas', 'Businessman', '01511279969', 'father285@example.com', '6318656517072', NULL, 'Yolanda Kub', 'Teacher', '01858894981', 'mother285@example.com', '4377545332315', NULL, 'Leonie Wisoky', '01599871618', 'guardian285@example.com', '1434984601688', 'Grandparent', 1, 60, 3, '2025-12-14', NULL, 2025000285, 900285, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58', '127.0.0.1', 1, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58'),
(286, 'Finn', 'Crooks', '1971-04-04', 'Other', 'A-', 'Other', 'Bangladeshi', '4525370004394', '01873960229', 'student286@example.com', '$2y$12$9R67A9g718npYAl2E7fSd.cJl5VhVvA75f0cduDgy97zuxSTDFysS', '100 Rohan Trail Apt. 413\nMrazton, WV 99962-8636', '84019 Lowe Mountain Apt. 404\nNorth Berneice, MA 93979-9381', 'ADM-00286', '2024-10-16', 'A', 'Science', '2025-2026', 'Grady Ltd School', 'Monserrat Bernhard', 'Engineer', '01890396976', 'father286@example.com', '8547026768198', NULL, 'Prof. Rhianna Aufderhar MD', 'Teacher', '01946731167', 'mother286@example.com', '0143679630418', NULL, 'Anjali Mayer', '01958550218', 'guardian286@example.com', '9486162179977', 'Aunt', 1, 58, 4, '2025-12-14', NULL, 2025000286, 900286, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58', '127.0.0.1', 1, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58'),
(287, 'Justina', 'Feil', '1978-06-13', 'Other', 'A+', 'Buddhist', 'Bangladeshi', '1849595082929', '01626315481', 'student287@example.com', '$2y$12$ur1IYNkx/1QhSpzFD/rwGOmpNggig2un/y5S1.XpwniydAjz2gxqi', '975 Konopelski Spring Suite 705\nSmithammouth, ID 29262-0310', '11035 Hintz Loaf Apt. 470\nSouth Dena, SC 35591-3807', 'ADM-00287', '1988-07-02', 'B', 'Arts', '2025-2026', 'Little-Graham School', 'Janick Hermiston', 'Farmer', '01726195665', 'father287@example.com', '5857219508177', NULL, 'Hillary Heathcote II', 'Housewife', '01840806020', 'mother287@example.com', '1311307352598', NULL, 'Vella Gorczany', '01325645603', 'guardian287@example.com', '8936274271784', 'Grandparent', 1, 62, 2, '2025-12-14', NULL, 2025000287, 900287, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58', '127.0.0.1', 1, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58'),
(288, 'Richard', 'Mills', '1992-01-12', 'Female', 'O-', 'Christian', 'Bangladeshi', '5078766673186', '01983908195', 'student288@example.com', '$2y$12$GeKTZmOOHbUjZHZEVJSmdeJJgN3SlZ0MHp0zEDZ18FzZgy6K.oyEC', '75755 Nikolaus Lakes Apt. 232\nSimonishaven, TX 39477', '8017 Reinger Extensions Suite 390\nRunolfsdottirtown, OH 66667-4379', 'ADM-00288', '1977-10-10', 'C', 'Commerce', '2025-2026', 'Russel LLC School', 'Jaylan Murazik', 'Businessman', '01675429526', 'father288@example.com', '7376707934782', NULL, 'Therese Nikolaus', 'Nurse', '01315949819', 'mother288@example.com', '4505693839305', NULL, 'Ms. Sabryna Weimann', '01392181436', 'guardian288@example.com', '7565432834758', 'Sister', 1, 60, 1, '2025-12-14', NULL, 2025000288, 900288, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58', '127.0.0.1', 1, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58'),
(289, 'Drake', 'Cassin', '2008-08-07', 'Male', 'O+', 'Other', 'Bangladeshi', '7602774374408', '01912778381', 'student289@example.com', '$2y$12$a04YHZaDA7pqXtOPYzrym./kSyTdswhCyOAZG6oOhCtgs0RFcUYPC', '6591 Padberg Ridge\nEast Jordyview, WA 52865', '834 Rath Greens\nPowlowskiville, MN 74282', 'ADM-00289', '1992-07-26', 'C', 'Commerce', '2025-2026', 'Braun-Davis School', 'Myron Kris', 'Farmer', '01631842900', 'father289@example.com', '5752953554040', NULL, 'Mrs. Norma Collins DVM', 'Nurse', '01691763303', 'mother289@example.com', '1675536687029', NULL, 'Cindy Zieme I', '01710715396', 'guardian289@example.com', '6431281028017', 'Brother', 1, 49, 5, '2025-12-14', NULL, 2025000289, 900289, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58', '127.0.0.1', 1, NULL, '2025-12-14 06:05:58', '2025-12-14 06:05:58'),
(290, 'Priscilla', 'Gutmann', '1984-10-03', 'Female', 'A-', 'Islam', 'Bangladeshi', '0848692104071', '01312549654', 'student290@example.com', '$2y$12$W9QExzLU6giIoIC4TMXMrOENoimf1o5LDCtchwUmA.1dI/XVVYnh6', '6106 Shanny Land\nLunaport, AR 99964', '8513 Abner Wall\nEast Dixie, NJ 76603-0005', 'ADM-00290', '2025-03-22', 'A', 'Science', '2025-2026', 'Schuster Inc School', 'Jaquan Hauck', 'Engineer', '01742712648', 'father290@example.com', '7949525605609', NULL, 'Brandy Smitham PhD', 'Doctor', '01741414866', 'mother290@example.com', '7372402683669', NULL, 'Damien Robel', '01611843663', 'guardian290@example.com', '0133864026036', 'Brother', 1, 63, 2, '2025-12-14', NULL, 2025000290, 900290, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59', '127.0.0.1', 1, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59'),
(291, 'Herbert', 'Oberbrunner', '2024-08-21', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '1301362535494', '01407365270', 'student291@example.com', '$2y$12$vJRzZ7koeDvGJteVF428E.znLDoAYCW1soGAG3YaA7ORyzz74cM6.', '39907 Aniyah Glens\nSouth Oran, OK 03565', '883 Shayna Skyway Suite 247\nMarcusville, MS 03232', 'ADM-00291', '2006-06-18', 'B', 'Commerce', '2025-2026', 'Kiehn-Bartell School', 'Martin Marvin', 'Doctor', '01758396996', 'father291@example.com', '3828490338939', NULL, 'Isobel Welch', 'Businesswoman', '01479779943', 'mother291@example.com', '6200166819988', NULL, 'Leatha Jacobi', '01611445899', 'guardian291@example.com', '9421722097169', 'Grandparent', 1, 64, 2, '2025-12-14', NULL, 2025000291, 900291, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59', '127.0.0.1', 1, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59'),
(292, 'Raymundo', 'McGlynn', '2007-09-07', 'Other', 'A-', 'Hindu', 'Bangladeshi', '0700110798954', '01485576454', 'student292@example.com', '$2y$12$pqDaCAHkS8qEWMleIGWbv.uJJdtcD6ZUt.Lter0/hjO3zNkj3CZSy', '7401 Mollie Light Suite 594\nNew Matildeport, HI 39274-9092', '6985 Reggie Underpass Apt. 130\nNew Dawn, MT 86122-9475', 'ADM-00292', '1975-06-11', 'B', 'Commerce', '2025-2026', 'Conn-Maggio School', 'Dr. Anibal Lehner', 'Doctor', '01756220054', 'father292@example.com', '8351574162990', NULL, 'Anahi Morissette', 'Housewife', '01346652719', 'mother292@example.com', '3687566141107', NULL, 'Garry Connelly', '01729192766', 'guardian292@example.com', '3149111847468', 'Brother', 1, 50, 5, '2025-12-14', NULL, 2025000292, 900292, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59', '127.0.0.1', 1, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59'),
(293, 'Dortha', 'O\'Conner', '2008-01-24', 'Other', 'A+', 'Other', 'Bangladeshi', '0647072826682', '01613264719', 'student293@example.com', '$2y$12$A5txLicfjxp.QlPWA/DcauuwemazZmTfmqJxuU3ZZN3/epT6P8yf2', '1822 Tremayne Pass Suite 776\nNicolaberg, SC 36645-9959', '483 Berenice Fields Apt. 309\nLake Emil, NE 82617', 'ADM-00293', '1993-02-24', 'B', 'Commerce', '2025-2026', 'Kulas, Doyle and McGlynn School', 'Mr. Keyshawn Schmitt', 'Teacher', '01368610121', 'father293@example.com', '6830129308497', NULL, 'Teresa Marks', 'Businesswoman', '01384448588', 'mother293@example.com', '5086739357910', NULL, 'Angie Schinner', '01304035983', 'guardian293@example.com', '0419051354749', 'Brother', 1, 61, 1, '2025-12-14', NULL, 2025000293, 900293, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59', '127.0.0.1', 1, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59'),
(294, 'Cary', 'Yundt', '1975-01-30', 'Male', 'AB-', 'Christian', 'Bangladeshi', '1271793317787', '01874143778', 'student294@example.com', '$2y$12$ygMXRKXk847pFHHkyY.vF.el2wdpXiIFM90gaaor9U5pNypc6DIa6', '77829 Aryanna Square Suite 031\nSwiftborough, NH 63514', '50781 Catherine Mission\nBahringerside, MI 15530', 'ADM-00294', '1975-09-04', 'C', 'Arts', '2025-2026', 'Harber and Sons School', 'Adalberto Heller', 'Businessman', '01740520960', 'father294@example.com', '9002929056263', NULL, 'Mireya Larson', 'Nurse', '01676358995', 'mother294@example.com', '9241204488057', NULL, 'Laurence Schamberger', '01563406513', 'guardian294@example.com', '3658908985604', 'Brother', 1, 51, 5, '2025-12-14', NULL, 2025000294, 900294, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59', '127.0.0.1', 1, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59'),
(295, 'Aglae', 'Batz', '1997-10-30', 'Female', 'B-', 'Islam', 'Bangladeshi', '4673214925121', '01967327098', 'student295@example.com', '$2y$12$ZgFU8Q0dMmkjJy696QkmZOg0RldLS0UKRlLTKgSLP82DwMi55SBUS', '59742 Audrey Route\nEast Tyreek, MA 30431-4154', '2451 Alverta Prairie Apt. 195\nKovacekfurt, ME 58733-7170', 'ADM-00295', '1977-05-03', 'A', 'Arts', '2025-2026', 'Fritsch LLC School', 'Theo Shanahan', 'Doctor', '01396273720', 'father295@example.com', '8937218891629', NULL, 'Ivy Harvey', 'Nurse', '01327878728', 'mother295@example.com', '6470326792828', NULL, 'Mrs. Savannah Gulgowski IV', '01363820896', 'guardian295@example.com', '1937861897871', 'Uncle', 1, 52, 5, '2025-12-14', NULL, 2025000295, 900295, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59', '127.0.0.1', 1, NULL, '2025-12-14 06:05:59', '2025-12-14 06:05:59'),
(296, 'Briana', 'Corwin', '1970-06-29', 'Male', 'B+', 'Other', 'Bangladeshi', '6165069383644', '01469608818', 'student296@example.com', '$2y$12$J9v5OAAZPI3N.JQtdmM.9uYJ94Im9KG84D90nNLEQnOOKPwFXM24.', '67521 Quigley Wall\nNorth Reece, ME 95324-1967', '19826 Mia Spur Suite 392\nCortezfurt, HI 30178-8264', 'ADM-00296', '2018-06-07', 'B', 'Science', '2025-2026', 'Lebsack Inc School', 'Mr. Timothy Heaney', 'Engineer', '01664698965', 'father296@example.com', '6593817276087', NULL, 'Kamille Corwin', 'Doctor', '01350162107', 'mother296@example.com', '8415032929025', NULL, 'Sabryna Wyman PhD', '01730070790', 'guardian296@example.com', '5740219697856', 'Brother', 1, 53, 5, '2025-12-14', NULL, 2025000296, 900296, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00', '127.0.0.1', 1, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(297, 'Mariela', 'Rodriguez', '1988-02-19', 'Female', 'B-', 'Buddhist', 'Bangladeshi', '7914497106545', '01871334518', 'student297@example.com', '$2y$12$Lgi4yl2CzRWnzmv6.Dakxep13kuJ7AaTIV1V7riXJ3VWCpkmuF9pm', '4566 Alexandre Spur Apt. 335\nSouth Karl, LA 68534-3506', '5256 Grimes Skyway Apt. 182\nHermannburgh, AK 06555-6887', 'ADM-00297', '2019-10-15', 'A', 'Arts', '2025-2026', 'Johns-Wiza School', 'Dr. Camren Tillman', 'Businessman', '01668668209', 'father297@example.com', '7657577681998', NULL, 'Mrs. Isobel Kunde', 'Businesswoman', '01828659686', 'mother297@example.com', '6438264208396', NULL, 'Giovanny Leannon', '01886984896', 'guardian297@example.com', '5557628343824', 'Uncle', 1, 65, 2, '2025-12-14', NULL, 2025000297, 900297, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00', '127.0.0.1', 1, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(298, 'Della', 'Reichel', '1983-05-28', 'Other', 'A+', 'Other', 'Bangladeshi', '5568126510606', '01382047200', 'student298@example.com', '$2y$12$Yl4Kg3VBW8oKHrOzP04RXOmRMgd7MqnxLv.tWsphKN30AK.n2zTG.', '59881 Jayde Springs Apt. 065\nKuhicburgh, DE 17035-5363', '7054 Anastacio Center Apt. 230\nAbbotttown, KS 65087', 'ADM-00298', '2020-07-17', 'A', 'Commerce', '2025-2026', 'Gerhold, Aufderhar and Murphy School', 'Wilton Weimann', 'Doctor', '01660770284', 'father298@example.com', '5387809497621', NULL, 'Anna Morissette', 'Businesswoman', '01328767674', 'mother298@example.com', '9064325438280', NULL, 'Dr. Louie Halvorson', '01825001076', 'guardian298@example.com', '7029969127195', 'Grandparent', 1, 54, 5, '2025-12-14', NULL, 2025000298, 900298, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00', '127.0.0.1', 1, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(299, 'Doug', 'Casper', '2011-01-23', 'Female', 'O-', 'Hindu', 'Bangladeshi', '5240216698402', '01931433175', 'student299@example.com', '$2y$12$Pip5E8xqysTi0WgXQNeBbucuK.WpI5kD6sJtpk/F.Y.PdzgWdf4tK', '27924 Klocko Ramp\nLake Micheal, AR 42734-9175', '5033 Judson Inlet Apt. 248\nMetzhaven, RI 85114-2914', 'ADM-00299', '2024-04-22', 'A', 'Commerce', '2025-2026', 'Goyette, Ritchie and Beatty School', 'Tyshawn Torphy', 'Teacher', '01621985829', 'father299@example.com', '0832078021728', NULL, 'Freda Ratke', 'Businesswoman', '01866961252', 'mother299@example.com', '8551820578328', NULL, 'Prof. Vernon Kilback PhD', '01481584389', 'guardian299@example.com', '7149699393794', 'Aunt', 1, 59, 4, '2025-12-14', NULL, 2025000299, 900299, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00', '127.0.0.1', 1, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(300, 'Vincenzo', 'Doyle', '2013-08-22', 'Female', 'A+', 'Other', 'Bangladeshi', '8760414187533', '01362631373', 'student300@example.com', '$2y$12$0YMDn.HxIOfWKKUfl2m24.2zUQVCq2fpQX0NDIXN.m0CW2Jwum94u', '6588 Bartell Fords\nCarrollfort, WY 16954-3827', '1040 Pouros Walks\nSchinnerchester, NJ 46380', 'ADM-00300', '2024-10-30', 'C', 'Commerce', '2025-2026', 'Turcotte, Upton and Bogan School', 'Kevin Volkman', 'Engineer', '01681487963', 'father300@example.com', '8612303813519', NULL, 'Dr. Zita Bartell', 'Businesswoman', '01700567364', 'mother300@example.com', '7505785381415', NULL, 'Javonte Wintheiser', '01337807511', 'guardian300@example.com', '2941110094882', 'Grandparent', 1, 60, 4, '2025-12-14', NULL, 2025000300, 900300, NULL, NULL, NULL, NULL, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00', '127.0.0.1', 1, NULL, '2025-12-14 06:06:00', '2025-12-14 06:06:00');

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
(1, '2025-12-15', 2, '06:00:00', 1, '10:00', 'Fajar, Johar, Asor, Magrim & Asha', '2 hrs', '1 hrs', '4 hrs', '00:00:00', 6, 'N/A', '2025-12-15 07:24:15', '2025-12-15 07:24:15');

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

--
-- Dumping data for table `student_subjects`
--

INSERT INTO `student_subjects` (`id`, `student_id`, `subject_id`, `created_at`, `updated_at`) VALUES
(1, 3, 19, '2025-12-15 06:37:06', '2025-12-15 06:37:06'),
(2, 2, 81, '2025-12-15 06:44:55', '2025-12-15 06:44:55'),
(3, 2, 83, '2025-12-15 06:44:56', '2025-12-15 06:44:56'),
(4, 12, 81, '2025-12-15 08:27:25', '2025-12-15 08:27:25'),
(5, 14, 81, '2025-12-15 08:27:29', '2025-12-15 08:27:29'),
(6, 19, 81, '2025-12-15 08:27:34', '2025-12-15 08:27:34'),
(7, 20, 81, '2025-12-15 08:27:37', '2025-12-15 08:27:37'),
(8, 24, 81, '2025-12-15 08:27:40', '2025-12-15 08:27:40'),
(9, 29, 81, '2025-12-15 08:27:44', '2025-12-15 08:27:44'),
(10, 37, 81, '2025-12-15 08:27:47', '2025-12-15 08:27:47'),
(11, 66, 81, '2025-12-15 08:27:50', '2025-12-15 08:27:50');

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
(1, 'Bangla', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(2, 'English', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(3, 'ICT', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(4, 'Physical Education', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(5, 'Physics', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(6, 'Chemistry', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(7, 'Biology', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(8, 'Higher Mathematics', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(9, 'Accounting', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(10, 'Business Organization & Management', 1, '2025-12-14 06:06:00', '2025-12-14 06:06:00'),
(11, 'Finance, Banking & Insurance', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(12, 'Production Management & Marketing', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(13, 'Logic', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(14, 'History', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(15, 'Civics', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(16, 'Economics', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(17, 'Islamic Studies', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(18, 'Sociology', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(19, 'Social Work', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(20, 'Geography', 1, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(21, 'Bangla', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(22, 'English', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(23, 'ICT', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(24, 'Physical Education', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(25, 'Physics', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(26, 'Chemistry', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(27, 'Biology', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(28, 'Higher Mathematics', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(29, 'Accounting', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(30, 'Business Organization & Management', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(31, 'Finance, Banking & Insurance', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(32, 'Production Management & Marketing', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(33, 'Logic', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(34, 'History', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(35, 'Civics', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(36, 'Economics', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(37, 'Islamic Studies', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(38, 'Sociology', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(39, 'Social Work', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(40, 'Geography', 2, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(41, 'Bangla', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(42, 'English', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(43, 'ICT', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(44, 'Physical Education', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(45, 'Physics', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(46, 'Chemistry', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(47, 'Biology', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(48, 'Higher Mathematics', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(49, 'Accounting', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(50, 'Business Organization & Management', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(51, 'Finance, Banking & Insurance', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(52, 'Production Management & Marketing', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(53, 'Logic', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(54, 'History', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(55, 'Civics', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(56, 'Economics', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(57, 'Islamic Studies', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(58, 'Sociology', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(59, 'Social Work', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(60, 'Geography', 3, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(61, 'Bangla', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(62, 'English', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(63, 'ICT', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(64, 'Physical Education', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(65, 'Physics', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(66, 'Chemistry', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(67, 'Biology', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(68, 'Higher Mathematics', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(69, 'Accounting', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(70, 'Business Organization & Management', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(71, 'Finance, Banking & Insurance', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(72, 'Production Management & Marketing', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(73, 'Logic', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(74, 'History', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(75, 'Civics', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(76, 'Economics', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(77, 'Islamic Studies', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(78, 'Sociology', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(79, 'Social Work', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(80, 'Geography', 4, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(81, 'Bangla', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(82, 'English', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(83, 'ICT', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(84, 'Physical Education', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(85, 'Physics', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(86, 'Chemistry', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(87, 'Biology', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(88, 'Higher Mathematics', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(89, 'Accounting', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(90, 'Business Organization & Management', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(91, 'Finance, Banking & Insurance', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(92, 'Production Management & Marketing', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(93, 'Logic', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(94, 'History', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(95, 'Civics', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(96, 'Economics', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(97, 'Islamic Studies', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(98, 'Sociology', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(99, 'Social Work', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01'),
(100, 'Geography', 5, '2025-12-14 06:06:01', '2025-12-14 06:06:01');

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
(1, 'Maiya', 'Beier', '1983-12-18', 'Male', 'O-', '4850325502830', '01852507078', 'teacher0@example.com', '$2y$12$x5X1Nc9B5n3JgdmHlSOOLOtCVN5DNu7ctEPgEL/UscJOJkgvZfXVG', 'Head of Department', '16227 Gregg Forge\nLillianaborough, IL 54062', 'Reilly Heaney', '01573882543', 'Mrs. Sister Waters', '01740524509', 'Ms. Nikita Smith', '01636891452', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:04:59', '2025-12-14 06:04:59', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:04:59', '2025-12-14 06:04:59'),
(2, 'Aftab', 'Ali', '1987-08-31', 'Male', 'O+', '8847006830132', '01615900230', 'teacher1@example.com', '$2y$12$hT2Wfj/1hNTv2dN36ugaP.goHpUlNuChAf/uvHAQXQD4GoP1gx/aq', 'Senior Teacher', '198 Vivianne Cliffs\r\nWest Haleyhaven, OH 46329-8827', 'Shad Paucek DVM', '01441539372', 'Katelin Oberbrunner I', '01600635842', 'Dr. Jorge Murray', '01565240306', 'Brother', 'tch-Ayla-1765709438.png', NULL, NULL, '2025-12-14', '2025-12-15', 'N/A', 'N/A', 'Admin', 1, 'N/A', '2025-12-14 06:04:59', '2025-12-15 07:24:22', '127.0.0.1', 1, NULL, NULL, 'o0vlhKsrcCKW3gpU6GQHdzJJnSLfCAP8MDr26Kw1GGcov5kTkB6ldDJyBL47', '2025-12-14 06:04:59', '2025-12-15 09:01:52'),
(3, 'Melisa', 'Cruickshank', '1966-08-31', 'Female', 'O-', '8274426527562', '01945429078', 'teacher2@example.com', '$2y$12$ydcspjG93MiyLRlxrtd7YO3NZxMNy7UZcgE2/yT1mweNdgwYKrRoK', 'Senior Teacher', '34844 Filiberto Rest\nLemkeside, CT 44898', 'Prof. Lorenz Wilkinson', '01950819817', 'Dr. Ena Rau', '01669350309', 'Omer Weimann', '01550143492', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:04:59', '2025-12-14 06:04:59', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:04:59', '2025-12-14 06:04:59'),
(4, 'Susie', 'Kunze', '1979-12-19', 'Male', 'O+', '7151998362751', '01381339847', 'teacher3@example.com', '$2y$12$d0Dtu5zMNQC3uQtVO/koBeYCAeqDjmVRwBq5k2TgV2QQeMUSLct4G', 'Head of Department', '5138 Roscoe Brooks\nGailfurt, MI 97989', 'Jarod Cruickshank', '01319657599', 'Dandre Klocko', '01628032971', 'Billie Hoppe', '01406324941', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:04:59', '2025-12-14 06:04:59', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:04:59', '2025-12-14 06:04:59'),
(5, 'Andy', 'Heidenreich', '1971-06-01', 'Male', 'A+', '5500251304756', '01461370409', 'teacher4@example.com', '$2y$12$JAPKnQ3PRWPheVcgrsAy0u701LbBlyy4YIGMxRENyoCGSlPjbreTW', 'Lecturer', '5981 Erwin Burgs Suite 932\nNorth Blair, DC 10144', 'Verner Reynolds', '01400802147', 'Mrs. Christelle Konopelski', '01527078302', 'Dr. Cydney Walter', '01500158776', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:04:59', '2025-12-14 06:04:59', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:04:59', '2025-12-14 06:04:59'),
(6, 'Vinnie', 'Moore', '1980-02-11', 'Male', 'A-', '2895708336525', '01781326542', 'teacher5@example.com', '$2y$12$GDtFeXja6e9WNVrNb3ByPeYHBZAOdArpI95oo3c0LiqYE3rlzQhFK', 'Lecturer', '26899 Okuneva Bridge Suite 852\nLake Blaise, MT 99812', 'Art Schoen', '01989539978', 'Amelie Champlin', '01907702427', 'Dr. Luther Murray III', '01557833263', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:04:59', '2025-12-14 06:04:59', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:04:59', '2025-12-14 06:04:59'),
(7, 'Maia', 'Anderson', '1995-09-22', 'Female', 'B-', '0995222922662', '01610393430', 'teacher6@example.com', '$2y$12$V7jYLGBjdQ01/GaQcnGyuu9lTj538Q/RCVhGWSY.UKavCpX/gRbBm', 'Lecturer', '9592 Tad Trail Suite 046\nGottliebmouth, NV 75377-6629', 'Mr. Tobin Bogan', '01765481692', 'Thelma Harber', '01728151262', 'Nannie Upton', '01682555575', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:00', '2025-12-14 06:05:00', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:00', '2025-12-14 06:05:00'),
(8, 'Bradley', 'Stiedemann', '1990-10-24', 'Female', 'A-', '6822173468650', '01549742142', 'teacher7@example.com', '$2y$12$QT95XPzse.MRiSlvjgdNDOx2UuA650Mid3WseB5Djx6mNahQHhtd2', 'Lecturer', '106 Bradtke Harbors Suite 801\nRobelchester, NM 27761-1361', 'Reuben Prohaska', '01572059615', 'Connie Purdy V', '01651207049', 'Heber Ullrich', '01784481125', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:00', '2025-12-14 06:05:00', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:00', '2025-12-14 06:05:00'),
(9, 'Meggie', 'Roberts', '1968-02-08', 'Male', 'B+', '0521265626435', '01984585981', 'teacher8@example.com', '$2y$12$qSa0x4fMA8E2Rm4mbS/R3eNkz51qMT1agaeLEmKT6CiVBD6PHImTu', 'Head of Department', '1465 Tabitha Glens\nNorth Lesliefurt, WY 07070-3781', 'Kayley Auer', '01380141646', 'Cordia Nader', '01350813556', 'Miss Virgie Lemke DDS', '01622281600', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:00', '2025-12-14 06:05:00', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:00', '2025-12-14 06:05:00'),
(10, 'Frieda', 'Gulgowski', '1986-02-18', 'Female', 'A-', '1996311680940', '01586275632', 'teacher9@example.com', '$2y$12$Q0OTB8lto0DYxUGdOPSo8.uWBRGq9wHvM5qyQ9rK77jPlQXhSvt12', 'Head of Department', '5633 Littel Mill\nAddisonton, LA 18045-5463', 'Mr. Nestor Abshire Sr.', '01941009327', 'Jacky Wehner Sr.', '01351240517', 'Krystina Langosh PhD', '01685129954', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:00', '2025-12-14 06:05:00', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:00', '2025-12-14 06:05:00'),
(11, 'Santino', 'Stiedemann', '1985-09-01', 'Male', 'O+', '2583630370884', '01904149710', 'teacher10@example.com', '$2y$12$tR7hayyjuYhY4uQPP87.TOmc.Zw6evveFQ1rMQb5y2rd6l7pMpggy', 'Lecturer', '86355 Hane Ville Apt. 475\nFreedashire, RI 24238', 'Isai Kris', '01464471757', 'Harmony Johns V', '01480312861', 'Leo Heidenreich', '01922969962', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:00', '2025-12-14 06:05:00', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:00', '2025-12-14 06:05:00'),
(12, 'Antonia', 'Stiedemann', '1987-11-08', 'Female', 'B-', '8658170111635', '01606512435', 'teacher11@example.com', '$2y$12$pls/8RTdGqHrcSxNbaIN/ek.UZfOyFd0FN4s4d4cIQCd1yh/BGcs6', 'Senior Teacher', '31694 Chadrick Alley\nKovacektown, MN 97289-7252', 'Darrell Von PhD', '01801678946', 'Dr. Kelly Stanton', '01764494942', 'Bertrand Prohaska', '01803866037', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:01', '2025-12-14 06:05:01', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:01', '2025-12-14 06:05:01'),
(13, 'Desmond', 'Armstrong', '1979-11-14', 'Female', 'AB-', '8183903810806', '01808952993', 'teacher12@example.com', '$2y$12$tu5nz7kSXesW45ben5BJx.uBsdW2W4s.1UDLmIjdvPLEerj8MJodC', 'Assistant Professor', '8329 Cooper Manors Apt. 363\nKatrinetown, VA 90189', 'Walton Hermann', '01765949432', 'Dr. Karen Feil II', '01724420020', 'Edmund Kerluke I', '01540322254', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:01', '2025-12-14 06:05:01', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:01', '2025-12-14 06:05:01'),
(14, 'Chris', 'Marquardt', '1989-01-01', 'Female', 'B-', '6879710831625', '01777797563', 'teacher13@example.com', '$2y$12$z7vVu8kct/3yd1TXUYBFCuQk5fKK3OYSsQm8cG4ajdhXZrhDBn5p6', 'Head of Department', '59294 Conroy Crossing\nAmostown, WI 97954', 'Glen Schroeder', '01939945240', 'Ms. Savanna Thompson', '01945418772', 'Emily Grimes', '01357034443', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:01', '2025-12-14 06:05:01', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:01', '2025-12-14 06:05:01'),
(15, 'Elisha', 'Stoltenberg', '1991-10-16', 'Female', 'A+', '1087501859772', '01384182377', 'teacher14@example.com', '$2y$12$eKmJdqen9zEVTPcTqeRLa.2lqbeTI8dQz/5BxK5qWXCLo9LzDMaB6', 'Head of Department', '111 Upton Dale Suite 549\nThompsonmouth, KS 46360-0336', 'Nickolas Dickinson Sr.', '01442576501', 'Shirley Christiansen', '01543626051', 'Abraham Kulas', '01821291042', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:01', '2025-12-14 06:05:01', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:01', '2025-12-14 06:05:01'),
(16, 'Birdie', 'Hermann', '1975-10-20', 'Female', 'A+', '6332731485262', '01786521617', 'teacher15@example.com', '$2y$12$hASQnhPjqibL/MYCHSGbsu1WxEJ6qZwr/oRfqtgYLSfG20eU1VjoK', 'Assistant Professor', '499 Bogisich Squares\nKyleighville, MN 19520-7168', 'Brown Kozey', '01816520624', 'Emma Oberbrunner', '01658525424', 'Ashton Trantow', '01574354821', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:01', '2025-12-14 06:05:01', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:01', '2025-12-14 06:05:01'),
(17, 'Filomena', 'Batz', '1971-03-27', 'Female', 'B+', '9405239108513', '01751818741', 'teacher16@example.com', '$2y$12$Pxt4IZW/6Wd8qGfUiQqUuu.5zAPVjMfH4XcY.43/kQZeEYhWRqNQi', 'Lecturer', '968 Feest Corners Suite 105\nLake Sharonland, AZ 68819', 'Dr. Arthur Reynolds V', '01814983630', 'Katherine Miller', '01584720129', 'Prof. Roger Littel PhD', '01997281774', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:01', '2025-12-14 06:05:01', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:01', '2025-12-14 06:05:01'),
(18, 'Houston', 'Weissnat', '1988-07-31', 'Female', 'A+', '9684595233675', '01310989559', 'teacher17@example.com', '$2y$12$QNczpTkmM7TCR4tV93CtGehDizCsax7e9ckUUpdd9A2oAAQ.iTaLi', 'Assistant Professor', '3345 Corwin Coves\nLauriefort, OH 80789-1764', 'Erwin Weber', '01819684605', 'Mikayla Beer', '01875143843', 'Kaela Wuckert', '01456090450', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:02', '2025-12-14 06:05:02', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:02', '2025-12-14 06:05:02'),
(19, 'Monroe', 'Lesch', '1971-04-26', 'Male', 'O-', '2834284190601', '01408401966', 'teacher18@example.com', '$2y$12$zUOSENn4ZuTNYT1STlAi1eNDSBGDNZ9it1PMeQHIg0I.20pzIBkfC', 'Senior Teacher', '6353 Polly Walk Apt. 984\nWest Cleoratown, ND 67026-4337', 'Everardo Abshire', '01651577726', 'Dr. Bette Lind I', '01909945758', 'Irma Upton', '01596028917', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:02', '2025-12-14 06:05:02', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:02', '2025-12-14 06:05:02'),
(20, 'Jadon', 'O\'Keefe', '1991-05-26', 'Female', 'O-', '1271077370368', '01619391605', 'teacher19@example.com', '$2y$12$gDZV1hFzZEuTQbh6alB0Ju52RRNtWa/0ZHiplYRKknzJ37OVtcoqm', 'Head of Department', '19382 Flo Fields\nSouth Loraineside, WV 07990', 'Prof. King Mante PhD', '01517947891', 'Kassandra Jaskolski', '01360044652', 'Pierre Ward IV', '01643868200', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:02', '2025-12-14 06:05:02', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:02', '2025-12-14 06:05:02'),
(21, 'Newell', 'Zulauf', '1979-04-28', 'Male', 'B-', '7523646706196', '01872487280', 'teacher20@example.com', '$2y$12$OgF3pnUR7AXcO8oJJhOmXetFMB2p1nIaFAySyLIIISihpV15Zj54C', 'Lecturer', '5609 Kunde Pike\nNew Othoshire, NE 03418-1927', 'Zack Sanford', '01851824808', 'Mrs. Macie Macejkovic Sr.', '01780149068', 'Amelie Rodriguez', '01624078387', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:02', '2025-12-14 06:05:02', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:02', '2025-12-14 06:05:02'),
(22, 'Dovie', 'Hill', '1967-11-16', 'Male', 'A+', '5085485959966', '01912819592', 'teacher21@example.com', '$2y$12$r8Q3prU9fXXPblQ5vkzdzu4sS8z4WEiTqPwadVS/wBcwZDrXapnM.', 'Head of Department', '99936 Rosenbaum Cape Suite 750\nWest Lorenzmouth, AK 13148-2837', 'Bernie Hintz I', '01722678603', 'Berenice Kreiger Sr.', '01982394521', 'Prof. Candido Bosco DDS', '01775945723', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:02', '2025-12-14 06:05:02', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:02', '2025-12-14 06:05:02'),
(23, 'Garnett', 'Corwin', '1992-08-23', 'Male', 'O-', '0488243175032', '01613599568', 'teacher22@example.com', '$2y$12$LVENeWmR.3aSS0VP2N6JnOKs7tcLieN03hAc42HsHtl3xNgkmIr2q', 'Assistant Professor', '73493 Prince Lock\nEusebioburgh, MD 07533', 'Jerrell Abshire', '01549341013', 'Alena Davis', '01300692841', 'Kristy Ankunding III', '01753570129', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:03', '2025-12-14 06:05:03', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:03', '2025-12-14 06:05:03'),
(24, 'Melba', 'Rath', '1995-02-03', 'Male', 'A+', '9938475190956', '01864455301', 'teacher23@example.com', '$2y$12$6JoJYi5a/qyiKUxdu0VJJuTmhi4MwEGDxJH5dOC.DVhchWIWvUyAG', 'Lecturer', '701 Melba Land\nWebershire, CO 77810-0052', 'Mr. Hank Torphy', '01513658844', 'Wanda Muller', '01934073964', 'Odie Kertzmann', '01847838726', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:03', '2025-12-14 06:05:03', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:03', '2025-12-14 06:05:03'),
(25, 'Arvilla', 'McDermott', '1991-03-02', 'Male', 'B-', '2743312691847', '01722725628', 'teacher24@example.com', '$2y$12$YnhcuktJKOX.DXwHEk6rUOcR7Bf5PtoBaOR.212WNtYpK.175BJ7.', 'Head of Department', '80134 Larson Landing Suite 994\nGreenfelderborough, AR 65612-1953', 'Tillman Bosco', '01356607088', 'Fae Feest', '01643467826', 'Elmer Prohaska', '01660461153', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:03', '2025-12-14 06:05:03', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:03', '2025-12-14 06:05:03'),
(26, 'Nettie', 'Wehner', '1974-01-01', 'Male', 'AB+', '6528028083607', '01370791354', 'teacher25@example.com', '$2y$12$toAqlsbqtp4gWCejwqMnNem5P.THk9.Pen2tASXkZauBBDsjI6PNS', 'Senior Teacher', '43848 Kerluke Island\nWehnerview, NY 17653', 'Mr. Bradford Monahan', '01781178765', 'Katarina Stanton', '01964453552', 'Miss Karina Farrell', '01934212119', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:03', '2025-12-14 06:05:03', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:03', '2025-12-14 06:05:03'),
(27, 'Elisa', 'Wolff', '1997-06-13', 'Female', 'B-', '4297886370648', '01474613001', 'teacher26@example.com', '$2y$12$zpjidfK7bm99Cjxb2VqjHuu/mUJXMES7KcxXqk0XtIaAgYyXYHBza', 'Senior Teacher', '83126 Alivia Shoal Suite 153\nLegrosville, MO 45451-8592', 'Roosevelt Crooks II', '01823301915', 'Elfrieda Lowe', '01635302944', 'Javonte Sporer', '01778392630', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:03', '2025-12-14 06:05:03', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:03', '2025-12-14 06:05:03'),
(28, 'Ardella', 'Becker', '1994-06-17', 'Female', 'AB+', '8293209739877', '01898300101', 'teacher27@example.com', '$2y$12$DXxjKrdpVlu4fx9./aGL8.OCM2CGA8FDR5FnpMkGf89eH.fvP/kSu', 'Lecturer', '3579 Stokes Roads Suite 812\nTitofurt, MO 99964', 'Jaycee Ratke', '01747099330', 'Miss Lucinda Prosacco I', '01349920533', 'Mr. Monte Dooley DVM', '01419211878', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:04', '2025-12-14 06:05:04', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:04', '2025-12-14 06:05:04'),
(29, 'Asa', 'Friesen', '1976-01-02', 'Female', 'AB+', '2315046744025', '01817510860', 'teacher28@example.com', '$2y$12$8egiP6J3UI.Q1rbABD7q2OTELEEWFp0SnQgkpvsr0lmspYu2e6sM6', 'Head of Department', '169 Andreane Knolls\nSouth Duncantown, KY 35976', 'Austyn Ruecker', '01802321544', 'Mrs. Rosetta Gibson III', '01815351878', 'Dr. Eleazar Kozey', '01855507922', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:04', '2025-12-14 06:05:04', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:04', '2025-12-14 06:05:04'),
(30, 'Toney', 'Schmidt', '1990-12-11', 'Male', 'O-', '7593403387814', '01615288029', 'teacher29@example.com', '$2y$12$N7he2sl1gUHe7OFUBwrr6OKMHjBj4fAbuAVNSNMuswGIOWFoUK2bG', 'Assistant Professor', '145 Ethan Shore Apt. 810\nKoeppmouth, MT 71110-8841', 'Dean Schuppe', '01783333242', 'Gabriella Schowalter MD', '01671687968', 'Marlen Abshire PhD', '01765292669', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2025-12-14 06:05:04', '2025-12-14 06:05:04', '127.0.0.1', 1, NULL, NULL, NULL, '2025-12-14 06:05:04', '2025-12-14 06:05:04');

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
(1, 2, '2025-12-15', '13:24:53', 'present', '127.0.0.1', 'Firefox', 'Desktop', 'Unknown', '2025-12-15 07:24:54', '2025-12-15 07:24:54');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_names`
--
ALTER TABLE `exam_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `excategories`
--
ALTER TABLE `excategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fee_payment_items`
--
ALTER TABLE `fee_payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `fee_structures`
--
ALTER TABLE `fee_structures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
