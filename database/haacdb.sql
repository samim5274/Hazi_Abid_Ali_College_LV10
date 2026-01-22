-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 22, 2026 at 01:13 PM
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
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `routing_number` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transection_details`
--

CREATE TABLE `bank_transection_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarks` text NOT NULL DEFAULT 'N/A',
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
(1, 'Hazi Abed Ali College', 'East Brahmondi, Narsingdi. || Code - 3010 || Degree - 5424 || EIIN - 112717', 'info@haac.edu.bd', '01700000000', 'www.haac.edu.bd', '2026-01-22 06:00:22', '2026-01-22 06:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `due_collections`
--

CREATE TABLE `due_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receipt_no` varchar(255) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `previous_due` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `remaining_due` decimal(10,2) NOT NULL,
  `collection_date` date NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `due_collections`
--

INSERT INTO `due_collections` (`id`, `receipt_no`, `invoice_no`, `student_id`, `user_id`, `previous_due`, `paid_amount`, `remaining_due`, `collection_date`, `payment_method`, `remarks`, `created_at`, `updated_at`) VALUES
(1, '1AP4XUEV4F', 'INV-10039', 8, 11, 100.00, 50.00, 50.00, '2026-01-22', 'Cash', 'N/A', '2026-01-22 11:32:15', '2026-01-22 11:32:15'),
(2, 'IAM81DAR5V', 'INV-84842', 10, 11, 500.00, 100.00, 400.00, '2026-01-22', 'Cash', 'N/A', '2026-01-22 11:32:20', '2026-01-22 11:32:20'),
(3, 'HM9J9JGD21', 'INV-86435', 12, 11, 500.00, 250.00, 250.00, '2026-01-22', 'Cash', 'N/A', '2026-01-22 11:32:26', '2026-01-22 11:32:26'),
(4, 'CPUUZUNQO0', 'INV-39020', 10, 11, 400.00, 100.00, 300.00, '2026-01-22', 'Cash', 'N/A', '2026-01-22 11:34:07', '2026-01-22 11:34:07');

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
(1, 'Class Test', '2026-01-22', 1, 1, 20, '2026-01-22 06:18:47', '2026-01-22 06:18:47'),
(2, 'Month Test', '2026-01-22', 1, 1, 30, '2026-01-22 06:18:47', '2026-01-22 06:18:47'),
(3, 'Midterm', '2026-01-22', 1, 1, 50, '2026-01-22 06:18:47', '2026-01-22 06:18:47'),
(4, 'Final', '2026-01-22', 1, 1, 100, '2026-01-22 06:18:47', '2026-01-22 06:18:47'),
(5, 'Class Test', '2026-01-23', 1, 2, 10, '2026-01-22 06:42:26', '2026-01-22 06:42:26'),
(6, 'Month Test', '2026-01-24', 1, 2, 30, '2026-01-22 06:42:57', '2026-01-22 06:42:57'),
(7, 'Midterm', '2026-01-25', 1, 2, 100, '2026-01-22 06:43:09', '2026-01-22 06:43:09'),
(8, 'Final', '2026-01-26', 1, 2, 100, '2026-01-22 06:43:18', '2026-01-22 06:43:18'),
(9, 'Class Test', '2026-01-22', 1, 3, 10, '2026-01-22 07:18:39', '2026-01-22 07:18:39'),
(10, 'Class Test', '2026-01-23', 1, 4, 10, '2026-01-22 07:18:51', '2026-01-22 07:18:51'),
(11, 'Class Test', '2026-01-24', 1, 5, 10, '2026-01-22 07:19:09', '2026-01-22 07:19:09'),
(12, 'Class Test', '2026-01-25', 1, 6, 10, '2026-01-22 07:19:26', '2026-01-22 07:19:26'),
(13, 'Class Test', '2026-01-26', 1, 7, 10, '2026-01-22 07:19:39', '2026-01-22 07:19:39');

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
(1, 'Class Test', '2026-01-22 06:18:47', '2026-01-22 06:18:47'),
(2, 'Month Test', '2026-01-22 06:18:47', '2026-01-22 06:18:47'),
(3, 'Midterm', '2026-01-22 06:18:47', '2026-01-22 06:18:47'),
(4, 'Final', '2026-01-22 06:18:47', '2026-01-22 06:18:47');

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
(1, 'Salary', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(2, 'Utility', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(3, 'Maintenance', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(4, 'Academic', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(5, 'Transport', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(6, 'Event', '2026-01-22 06:00:22', '2026-01-22 06:00:22');

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
(1, 1, 'Teacher Salary', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(2, 1, 'Staff Salary', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(3, 1, 'Guest Teacher Salary', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(4, 2, 'Electricity Bill', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(5, 2, 'Water Bill', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(6, 2, 'Internet Bill', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(7, 3, 'Furniture Repair', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(8, 3, 'Building Repair', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(9, 3, 'Painting', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(10, 4, 'Books Purchase', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(11, 4, 'Lab Equipment', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(12, 4, 'Classroom Materials', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(13, 5, 'Bus Fuel', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(14, 5, 'Driver Salary', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(15, 5, 'Vehicle Repair', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(16, 6, 'Annual Program', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(17, 6, 'Sports Day', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(18, 6, 'Prize Giving Ceremony', '2026-01-22 06:00:22', '2026-01-22 06:00:22');

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
(1, 'Tuition Fee', 'Regular fee for academic instruction and classes', '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(2, 'Admission Fee', 'One-time fee for student enrollment', '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(3, 'Exam Fee', 'Fee for conducting examinations', '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(4, 'Library Fee', 'Charge for library access and maintenance', '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(5, 'Laboratory Fee', 'Fee for science/computer lab usage', '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(6, 'Sports Fee', 'Charge for sports activities and events', '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(7, 'Transport Fee', 'Fee for school bus/transport facilities', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(8, 'Hostel Fee', 'Accommodation and meal charges in hostel', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(9, 'Development Fee', 'Fee for infrastructure and school development', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(10, 'Activity Fee', 'Fee for extracurricular activities and events', '2026-01-22 06:00:22', '2026-01-22 06:00:22');

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
(1, 8, 11, 1000.00, 800.00, 100.00, 100.00, '2026-01-22', '12', '2031', 'Cash', 'Partial', 'GHPKRS6YVR', 'INV-67648', '2026-01-22 07:35:18', '2026-01-22 07:35:18'),
(2, 10, 11, 1000.00, 500.00, 0.00, 500.00, '2026-01-22', '01', '2027', 'Cash', 'Partial', '218LGIZLBT', 'INV-30436', '2026-01-22 10:01:36', '2026-01-22 10:01:36'),
(3, 12, 11, 1000.00, 500.00, 0.00, 500.00, '2026-01-22', '03', '2027', 'Cash', 'Partial', 'KTBX6GJB65', 'INV-77297', '2026-01-22 10:01:52', '2026-01-22 10:01:52');

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
(1, 1, 8, 1, 1000.00, 800.00, 100.00, 100.00, '2026-01-22', '2026-01-22 07:35:18', '2026-01-22 07:35:18'),
(2, 2, 10, 1, 1000.00, 500.00, 0.00, 500.00, '2026-01-22', '2026-01-22 10:01:36', '2026-01-22 10:01:36'),
(3, 3, 12, 1, 1000.00, 500.00, 0.00, 500.00, '2026-01-22', '2026-01-22 10:01:52', '2026-01-22 10:01:52');

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
(1, 1, 1, 1000.00, '2026-02-22', '2026-01-22 07:35:00', '2026-01-22 07:35:00');

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
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `income_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_categories`
--

CREATE TABLE `income_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `income_categories`
--

INSERT INTO `income_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tuition Fee', 'Income from tuition', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(2, 'Donation', 'Income from donations', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(3, 'Library Fee', 'Income from library', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(4, 'Transport Fee', 'Income from transport', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(5, 'Examination Fee', 'Income from exams', '2026-01-22 06:00:22', '2026-01-22 06:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `income_sub_categories`
--

CREATE TABLE `income_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `income_sub_categories`
--

INSERT INTO `income_sub_categories` (`id`, `category_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Grade 1-5', 'Subcategory of Tuition Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(2, 1, 'Grade 6-10', 'Subcategory of Tuition Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(3, 1, 'Grade 11-12', 'Subcategory of Tuition Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(4, 2, 'Alumni Donation', 'Subcategory of Donation', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(5, 2, 'Sponsor Donation', 'Subcategory of Donation', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(6, 3, 'Book Fee', 'Subcategory of Library Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(7, 3, 'Late Fee', 'Subcategory of Library Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(8, 4, 'Bus Fee', 'Subcategory of Transport Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(9, 4, 'Van Fee', 'Subcategory of Transport Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(10, 5, 'Monthly Test', 'Subcategory of Examination Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22'),
(11, 5, 'Final Exam', 'Subcategory of Examination Fee', '2026-01-22 06:00:22', '2026-01-22 06:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `marks_objective` decimal(5,0) NOT NULL DEFAULT 0,
  `marks_theury` decimal(5,0) NOT NULL DEFAULT 0,
  `marks_obtained` decimal(5,0) NOT NULL DEFAULT 0,
  `grade` varchar(255) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `student_id`, `subject_id`, `exam_id`, `marks_objective`, `marks_theury`, `marks_obtained`, `grade`, `gpa`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 1, 7, 8, 15, 'A', 4, 'Updated by Adalberto Rohan', '2026-01-22 06:20:35', '2026-01-22 06:21:08'),
(2, 10, 1, 1, 7, 6, 13, 'A-', 4, 'N/A', '2026-01-22 06:20:48', '2026-01-22 06:20:48'),
(3, 12, 1, 1, 5, 7, 12, 'A-', 4, 'N/A', '2026-01-22 06:20:57', '2026-01-22 06:20:57'),
(4, 15, 1, 1, 5, 5, 10, 'B', 3, 'N/A', '2026-01-22 06:21:20', '2026-01-22 06:21:20'),
(5, 22, 1, 1, 3, 7, 10, 'B', 3, 'N/A', '2026-01-22 06:21:29', '2026-01-22 06:21:29'),
(6, 23, 1, 1, 5, 5, 10, 'B', 3, 'N/A', '2026-01-22 06:21:40', '2026-01-22 06:21:40'),
(7, 29, 1, 1, 5, 5, 10, 'B', 3, 'N/A', '2026-01-22 06:21:45', '2026-01-22 06:21:45'),
(8, 41, 1, 1, 5, 5, 10, 'B', 3, 'N/A', '2026-01-22 06:21:50', '2026-01-22 06:21:50'),
(9, 43, 1, 1, 5, 8, 13, 'A-', 4, 'N/A', '2026-01-22 06:21:56', '2026-01-22 06:21:56'),
(10, 46, 1, 1, 3, 5, 8, 'C', 2, 'N/A', '2026-01-22 06:22:03', '2026-01-22 06:22:03'),
(11, 8, 1, 2, 12, 13, 25, 'A+', 5, 'N/A', '2026-01-22 06:22:42', '2026-01-22 06:22:42'),
(12, 10, 1, 2, 12, 13, 25, 'A+', 5, 'N/A', '2026-01-22 06:22:47', '2026-01-22 06:22:47'),
(13, 12, 1, 2, 12, 15, 27, 'A+', 5, 'N/A', '2026-01-22 06:22:52', '2026-01-22 06:22:52'),
(14, 15, 1, 2, 10, 15, 25, 'A+', 5, 'N/A', '2026-01-22 06:22:59', '2026-01-22 06:22:59'),
(15, 22, 1, 2, 8, 14, 22, 'A', 4, 'N/A', '2026-01-22 06:23:03', '2026-01-22 06:23:03'),
(16, 23, 1, 2, 7, 13, 20, 'A-', 4, 'N/A', '2026-01-22 06:23:11', '2026-01-22 06:23:11'),
(17, 29, 1, 2, 6, 18, 24, 'A+', 5, 'N/A', '2026-01-22 06:23:18', '2026-01-22 06:23:18'),
(18, 41, 1, 2, 10, 10, 20, 'A-', 4, 'N/A', '2026-01-22 06:23:23', '2026-01-22 06:23:23'),
(19, 43, 1, 2, 10, 15, 25, 'A+', 5, 'N/A', '2026-01-22 06:23:28', '2026-01-22 06:23:28'),
(20, 46, 1, 2, 4, 12, 16, 'B', 3, 'N/A', '2026-01-22 06:23:36', '2026-01-22 06:23:36'),
(21, 8, 1, 3, 15, 15, 30, 'A-', 4, 'N/A', '2026-01-22 06:24:02', '2026-01-22 06:24:02'),
(22, 10, 1, 3, 25, 20, 45, 'A+', 5, 'N/A', '2026-01-22 06:24:10', '2026-01-22 06:24:10'),
(23, 12, 1, 3, 12, 22, 34, 'A-', 4, 'N/A', '2026-01-22 06:24:16', '2026-01-22 06:24:16'),
(24, 15, 1, 3, 14, 20, 34, 'A-', 4, 'N/A', '2026-01-22 06:24:22', '2026-01-22 06:24:22'),
(25, 22, 1, 3, 12, 27, 39, 'A', 4, 'N/A', '2026-01-22 06:24:49', '2026-01-22 06:24:49'),
(26, 23, 1, 3, 10, 15, 25, 'B', 3, 'N/A', '2026-01-22 06:24:56', '2026-01-22 06:24:56'),
(27, 29, 1, 3, 14, 25, 39, 'A', 4, 'N/A', '2026-01-22 06:25:01', '2026-01-22 06:25:01'),
(28, 41, 1, 3, 11, 29, 40, 'A+', 5, 'N/A', '2026-01-22 06:25:10', '2026-01-22 06:25:10'),
(29, 43, 1, 3, 15, 35, 50, 'A+', 5, 'N/A', '2026-01-22 06:25:15', '2026-01-22 06:25:15'),
(30, 46, 1, 3, 15, 33, 48, 'A+', 5, 'N/A', '2026-01-22 06:25:22', '2026-01-22 06:25:22'),
(31, 8, 1, 4, 30, 55, 85, 'A+', 5, 'N/A', '2026-01-22 06:25:43', '2026-01-22 06:25:43'),
(32, 10, 1, 4, 32, 54, 86, 'A+', 5, 'N/A', '2026-01-22 06:25:55', '2026-01-22 06:25:55'),
(33, 12, 1, 4, 25, 55, 80, 'A+', 5, 'N/A', '2026-01-22 06:26:01', '2026-01-22 06:26:01'),
(34, 15, 1, 4, 24, 52, 76, 'A', 4, 'N/A', '2026-01-22 06:26:06', '2026-01-22 06:26:06'),
(35, 22, 1, 4, 22, 56, 78, 'A', 4, 'N/A', '2026-01-22 06:26:11', '2026-01-22 06:26:11'),
(36, 23, 1, 4, 20, 45, 65, 'A-', 4, 'N/A', '2026-01-22 06:26:16', '2026-01-22 06:26:16'),
(37, 29, 1, 4, 15, 52, 67, 'A-', 4, 'N/A', '2026-01-22 06:26:25', '2026-01-22 06:26:25'),
(38, 41, 1, 4, 18, 20, 38, 'D', 1, 'N/A', '2026-01-22 06:26:30', '2026-01-22 06:26:30'),
(39, 43, 1, 4, 18, 30, 48, 'C', 2, 'N/A', '2026-01-22 06:26:44', '2026-01-22 06:26:44'),
(40, 46, 1, 4, 13, 25, 38, 'D', 1, 'N/A', '2026-01-22 06:26:51', '2026-01-22 06:26:51'),
(41, 8, 2, 5, 5, 4, 9, 'A+', 5, 'N/A', '2026-01-22 06:46:48', '2026-01-22 06:46:48'),
(42, 10, 2, 5, 4, 4, 8, 'A+', 5, 'N/A', '2026-01-22 06:47:15', '2026-01-22 06:47:15'),
(43, 12, 2, 5, 5, 4, 9, 'A+', 5, 'N/A', '2026-01-22 06:47:23', '2026-01-22 06:47:23'),
(44, 15, 2, 5, 4, 4, 8, 'A+', 5, 'N/A', '2026-01-22 06:47:28', '2026-01-22 06:47:28'),
(45, 22, 2, 5, 3, 4, 7, 'A', 4, 'N/A', '2026-01-22 06:47:34', '2026-01-22 06:47:34'),
(46, 23, 2, 5, 3, 3, 6, 'A-', 4, 'N/A', '2026-01-22 06:47:41', '2026-01-22 06:47:41'),
(47, 29, 2, 5, 4, 3, 7, 'A', 4, 'N/A', '2026-01-22 06:48:28', '2026-01-22 06:48:28'),
(48, 41, 2, 5, 3, 4, 7, 'A', 4, 'Updated by Adalberto Rohan', '2026-01-22 06:48:45', '2026-01-22 06:49:02'),
(49, 43, 2, 5, 3, 4, 7, 'A', 4, 'N/A', '2026-01-22 06:49:20', '2026-01-22 06:49:20'),
(50, 46, 2, 5, 4, 3, 7, 'A', 4, 'N/A', '2026-01-22 06:49:26', '2026-01-22 06:49:26'),
(51, 8, 2, 6, 8, 15, 23, 'A', 4, 'N/A', '2026-01-22 06:49:45', '2026-01-22 06:49:45'),
(52, 10, 2, 6, 10, 13, 23, 'A', 4, 'N/A', '2026-01-22 06:50:21', '2026-01-22 06:50:21'),
(53, 12, 2, 6, 7, 13, 20, 'A-', 4, 'N/A', '2026-01-22 06:50:29', '2026-01-22 06:50:29'),
(54, 15, 2, 6, 5, 10, 15, 'B', 3, 'N/A', '2026-01-22 06:50:50', '2026-01-22 06:50:50'),
(55, 22, 2, 6, 4, 10, 14, 'C', 2, 'N/A', '2026-01-22 06:50:56', '2026-01-22 06:50:56'),
(56, 23, 2, 6, 7, 14, 21, 'A', 4, 'N/A', '2026-01-22 06:51:03', '2026-01-22 06:51:03'),
(57, 29, 2, 6, 10, 17, 27, 'A+', 5, 'N/A', '2026-01-22 06:51:20', '2026-01-22 06:51:20'),
(58, 41, 2, 6, 9, 18, 27, 'A+', 5, 'N/A', '2026-01-22 06:51:26', '2026-01-22 06:51:26'),
(59, 43, 2, 6, 7, 17, 24, 'A+', 5, 'N/A', '2026-01-22 06:51:34', '2026-01-22 06:51:34'),
(60, 46, 2, 6, 5, 15, 20, 'A-', 4, 'N/A', '2026-01-22 06:51:41', '2026-01-22 06:51:41'),
(61, 8, 2, 7, 20, 40, 60, 'A-', 4, 'N/A', '2026-01-22 06:53:04', '2026-01-22 06:53:04'),
(62, 10, 2, 7, 20, 40, 60, 'A-', 4, 'N/A', '2026-01-22 06:53:45', '2026-01-22 06:53:45'),
(63, 12, 2, 7, 22, 55, 77, 'A', 4, 'N/A', '2026-01-22 06:53:53', '2026-01-22 06:53:53'),
(64, 15, 2, 7, 27, 49, 76, 'A', 4, 'N/A', '2026-01-22 06:54:00', '2026-01-22 06:54:00'),
(65, 22, 2, 7, 23, 51, 74, 'A', 4, 'N/A', '2026-01-22 06:54:09', '2026-01-22 06:54:09'),
(66, 23, 2, 7, 22, 52, 74, 'A', 4, 'N/A', '2026-01-22 06:54:15', '2026-01-22 06:54:15'),
(67, 29, 2, 7, 15, 30, 45, 'C', 2, 'N/A', '2026-01-22 06:54:21', '2026-01-22 06:54:21'),
(68, 41, 2, 7, 19, 31, 50, 'B', 3, 'N/A', '2026-01-22 06:54:31', '2026-01-22 06:54:31'),
(69, 43, 2, 7, 22, 56, 78, 'A', 4, 'N/A', '2026-01-22 06:54:38', '2026-01-22 06:54:38'),
(70, 46, 2, 7, 28, 30, 58, 'B', 3, 'N/A', '2026-01-22 06:54:45', '2026-01-22 06:54:45'),
(71, 8, 2, 8, 20, 50, 70, 'A', 4, 'N/A', '2026-01-22 06:55:46', '2026-01-22 06:55:46'),
(72, 10, 2, 8, 20, 55, 75, 'A', 4, 'N/A', '2026-01-22 06:55:53', '2026-01-22 06:55:53'),
(73, 12, 2, 8, 25, 55, 80, 'A+', 5, 'N/A', '2026-01-22 06:56:04', '2026-01-22 06:56:04'),
(74, 15, 2, 8, 28, 58, 86, 'A+', 5, 'N/A', '2026-01-22 06:56:22', '2026-01-22 06:56:22'),
(75, 22, 2, 8, 33, 55, 88, 'A+', 5, 'N/A', '2026-01-22 06:56:30', '2026-01-22 06:56:30'),
(76, 23, 2, 8, 35, 55, 90, 'A+', 5, 'N/A', '2026-01-22 06:56:36', '2026-01-22 06:56:36'),
(77, 29, 2, 8, 34, 50, 84, 'A+', 5, 'N/A', '2026-01-22 06:56:42', '2026-01-22 06:56:42'),
(78, 41, 2, 8, 38, 58, 96, 'A+', 5, 'N/A', '2026-01-22 06:56:50', '2026-01-22 06:56:50'),
(79, 43, 2, 8, 36, 54, 90, 'A+', 5, 'N/A', '2026-01-22 06:56:57', '2026-01-22 06:56:57'),
(80, 46, 2, 8, 21, 55, 76, 'A', 4, 'N/A', '2026-01-22 06:57:03', '2026-01-22 06:57:03'),
(81, 8, 3, 9, 0, 8, 8, 'A+', 5, 'N/A', '2026-01-22 07:20:48', '2026-01-22 07:20:48'),
(82, 10, 3, 9, 0, 7, 7, 'A', 4, 'N/A', '2026-01-22 07:20:50', '2026-01-22 07:20:50'),
(83, 12, 3, 9, 0, 6, 6, 'A-', 4, 'N/A', '2026-01-22 07:20:53', '2026-01-22 07:20:53'),
(84, 15, 3, 9, 0, 5, 5, 'B', 3, 'N/A', '2026-01-22 07:20:55', '2026-01-22 07:20:55'),
(85, 22, 3, 9, 0, 8, 8, 'A+', 5, 'N/A', '2026-01-22 07:20:59', '2026-01-22 07:20:59'),
(86, 8, 4, 10, 0, 10, 10, 'A+', 5, 'N/A', '2026-01-22 07:21:07', '2026-01-22 07:21:07'),
(87, 10, 4, 10, 0, 10, 10, 'A+', 5, 'N/A', '2026-01-22 07:21:09', '2026-01-22 07:21:09'),
(88, 12, 4, 10, 0, 10, 10, 'A+', 5, 'N/A', '2026-01-22 07:21:11', '2026-01-22 07:21:11'),
(89, 15, 4, 10, 0, 10, 10, 'A+', 5, 'N/A', '2026-01-22 07:21:13', '2026-01-22 07:21:13'),
(90, 22, 4, 10, 0, 10, 10, 'A+', 5, 'N/A', '2026-01-22 07:21:16', '2026-01-22 07:21:16'),
(91, 8, 5, 11, 0, 9, 9, 'A+', 5, 'N/A', '2026-01-22 07:21:22', '2026-01-22 07:21:22'),
(92, 10, 5, 11, 0, 8, 8, 'A+', 5, 'N/A', '2026-01-22 07:21:32', '2026-01-22 07:21:32'),
(93, 12, 5, 11, 0, 7, 7, 'A', 4, 'N/A', '2026-01-22 07:21:35', '2026-01-22 07:21:35'),
(94, 15, 5, 11, 0, 6, 6, 'A-', 4, 'N/A', '2026-01-22 07:21:37', '2026-01-22 07:21:37'),
(95, 22, 5, 11, 0, 5, 5, 'B', 3, 'N/A', '2026-01-22 07:21:39', '2026-01-22 07:21:39'),
(96, 8, 6, 12, 0, 8, 8, 'A+', 5, 'N/A', '2026-01-22 07:21:44', '2026-01-22 07:21:44'),
(97, 10, 6, 12, 0, 9, 9, 'A+', 5, 'N/A', '2026-01-22 07:21:47', '2026-01-22 07:21:47'),
(98, 12, 6, 12, 0, 7, 7, 'A', 4, 'N/A', '2026-01-22 07:21:49', '2026-01-22 07:21:49'),
(99, 15, 6, 12, 0, 6, 6, 'A-', 4, 'N/A', '2026-01-22 07:21:52', '2026-01-22 07:21:52'),
(100, 22, 6, 12, 0, 6, 6, 'A-', 4, 'N/A', '2026-01-22 07:21:54', '2026-01-22 07:21:54'),
(101, 8, 7, 13, 0, 10, 10, 'A+', 5, 'N/A', '2026-01-22 07:22:00', '2026-01-22 07:22:00'),
(102, 10, 7, 13, 0, 10, 10, 'A+', 5, 'N/A', '2026-01-22 07:22:02', '2026-01-22 07:22:02'),
(103, 12, 7, 13, 0, 9, 9, 'A+', 5, 'N/A', '2026-01-22 07:22:04', '2026-01-22 07:22:04'),
(104, 15, 7, 13, 0, 8, 8, 'A+', 5, 'N/A', '2026-01-22 07:22:07', '2026-01-22 07:22:07'),
(105, 22, 7, 13, 0, 8, 8, 'A+', 5, 'N/A', '2026-01-22 07:22:09', '2026-01-22 07:22:09');

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
(398, '2014_10_12_000000_create_users_table', 2),
(399, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(400, '2014_10_12_100000_create_password_resets_table', 2),
(401, '2019_08_19_000000_create_failed_jobs_table', 2),
(402, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(403, '2025_09_11_094326_create_teachers_table', 2),
(404, '2025_09_12_060130_create_rooms_table', 2),
(405, '2025_09_12_060131_create_students_table', 2),
(406, '2025_09_13_043440_create_groups_table', 2),
(407, '2025_09_13_043441_create_subjects_table', 2),
(408, '2025_09_13_043442_create_attendances_table', 2),
(409, '2025_09_13_085234_create_exams_table', 2),
(410, '2025_09_13_085241_create_marks_table', 2),
(411, '2025_09_16_081917_create_student_subjects_table', 2),
(412, '2025_09_22_185426_create_fee_categories_table', 2),
(413, '2025_09_22_185444_create_fee_structures_table', 2),
(414, '2025_09_22_185453_create_fee_payments_table', 2),
(415, '2025_09_28_183808_create_exam_names_table', 2),
(416, '2025_10_03_153733_create_class_schedules_table', 2),
(417, '2025_11_20_122825_create_notices_table', 2),
(418, '2025_11_22_173329_create_teacher_attendances_table', 2),
(419, '2025_11_23_131009_create_student_daily_routines_table', 2),
(420, '2025_12_07_102826_create_excategories_table', 2),
(421, '2025_12_07_102839_create_exsubcategories_table', 2),
(422, '2025_12_07_102853_create_expenses_table', 2),
(423, '2025_12_08_104245_create_companies_table', 2),
(424, '2025_12_09_125819_create_fee_payment_details_table', 2),
(425, '2025_12_09_125837_create_fee_payment_items_table', 2),
(426, '2025_12_21_130614_create_bank_details_table', 2),
(427, '2025_12_21_130634_create_bank_transection_details_table', 2),
(428, '2025_12_23_104250_create_income_categories_table', 2),
(429, '2025_12_23_104304_create_income_sub_categories_table', 2),
(430, '2025_12_23_104324_create_incomes_table', 2),
(431, '2026_01_18_165356_create_due_collections_table', 2);

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

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `description`, `publish_date`, `user_id`, `attachment`, `notice_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sports Competition Notice', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2026-01-22', 11, '2026-01-22_1769071028_17.pdf', 'Public', 1, '2026-01-22 08:37:08', '2026-01-22 08:37:08'),
(2, 'Midterm Exam Schedule', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2026-01-22', 11, '2026-01-22_1769071036_17.pdf', 'Student', 1, '2026-01-22 08:37:16', '2026-01-22 08:37:16'),
(3, 'Office Electrick Bill', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2026-01-22', 11, '2026-01-22_1769071045_17.pdf', 'Teacher', 1, '2026-01-22 08:37:25', '2026-01-22 08:37:25');

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
(1, 'Sandra', 'Sipes', '1994-06-09', 'Other', 'AB-', 'Christian', 'Bangladeshi', '6950575693148', '01839016620', 'student1@example.com', '$2y$12$Ncyoht1oShqbQuoVy68e0.WZjF02otN4fXStptToWS.ZJc.91yhR6', '26243 Fern Knolls Apt. 657\nMurraychester, AZ 47913', '638 Wyman Trafficway\nPort Kole, NC 07668', 'ADM-00001', '1982-10-30', 'A', 'Commerce', '2025-2026', 'Kerluke, Reilly and Runolfsson School', 'Junius Reynolds', 'Businessman', '01690867292', 'father1@example.com', '2925933028888', NULL, 'Jeanie Hirthe', 'Doctor', '01602579533', 'mother1@example.com', '7693074039719', NULL, 'Verdie Balistreri', '01966161758', 'guardian1@example.com', '4124635643340', 'Grandparent', 1, 1, 2, '2026-01-22', NULL, 2025000001, 900001, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:02', '2026-01-22 09:10:48', '127.0.0.1', 1, 'PSoseJk1fr5XyuVU5mHmb6ByWbvwtAKjjUqhcsWhF6GUUWHPMw6SPQQNxWCK', '2026-01-22 06:00:02', '2026-01-22 09:10:48'),
(2, 'Frank', 'Lesch', '2007-03-24', 'Other', 'A+', 'Islam', 'Bangladeshi', '5387213135348', '01759342517', 'student2@example.com', '$2y$12$N/78fU5a9To3LF7OXBN0Qu41Z8UIz4snHIIPhi5vh7OdJCw6uvcDa', '7205 West Mountain\nPort Christy, OK 80987', '773 Parisian Fords Suite 538\nHansenfort, ND 20539-5940', 'ADM-00002', '2011-04-27', 'B', 'Commerce', '2025-2026', 'Gibson Ltd School', 'Darwin Kilback', 'Teacher', '01833033773', 'father2@example.com', '3607124810986', NULL, 'Mrs. Alaina Legros Jr.', 'Businesswoman', '01423526269', 'mother2@example.com', '0364127710940', NULL, 'Christopher Koepp', '01782965872', 'guardian2@example.com', '5327768882930', 'Sister', 1, 2, 2, '2026-01-22', NULL, 2025000002, 900002, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03', '127.0.0.1', 1, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03'),
(3, 'Vickie', 'Koch', '1976-04-03', 'Male', 'O-', 'Buddhist', 'Bangladeshi', '9741766353586', '01546392864', 'student3@example.com', '$2y$12$VB2fRrNJLAfjLVYFFFfsKe6OiKyjxQEixqdQdYqhts2Mj2J4/kvWO', '25732 King Extensions\nBillieside, WA 85695-2020', '75970 Alexandria Stravenue\nSouth Dovie, GA 58130', 'ADM-00003', '2016-09-02', 'A', 'Science', '2025-2026', 'O\'Conner-Gerhold School', 'Dr. Emilio Kulas DVM', 'Businessman', '01954444564', 'father3@example.com', '5779914279547', NULL, 'Ms. Alia Huels DDS', 'Doctor', '01872044335', 'mother3@example.com', '9073962036413', NULL, 'Mrs. Verla Heidenreich I', '01326353300', 'guardian3@example.com', '8089611956399', 'Brother', 1, 3, 2, '2026-01-22', NULL, 2025000003, 900003, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03', '127.0.0.1', 1, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03'),
(4, 'Darby', 'Rutherford', '1998-11-27', 'Other', 'A-', 'Islam', 'Bangladeshi', '6197384776648', '01614427478', 'student4@example.com', '$2y$12$HmTmo0aCz/UzQpzN7jDy0uPp5vfkoOswAQ4pLzUuyTbqWC7scYWQ.', '30029 Wisozk Ferry\nPort Kianaville, MI 25709-5105', '5751 Jaida Turnpike\nWest Jedediahbury, KY 41241-9009', 'ADM-00004', '1992-03-28', 'A', 'Commerce', '2025-2026', 'O\'Conner, Cremin and Satterfield School', 'Prof. Russell Balistreri', 'Doctor', '01883815327', 'father4@example.com', '2918197054455', NULL, 'Theresa Sauer', 'Nurse', '01763820221', 'mother4@example.com', '4677785985428', NULL, 'Ollie Lakin', '01346884450', 'guardian4@example.com', '5158674738119', 'Uncle', 1, 1, 3, '2026-01-22', NULL, 2025000004, 900004, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03', '127.0.0.1', 1, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03'),
(5, 'Keith', 'Hill', '2004-09-13', 'Other', 'O+', 'Islam', 'Bangladeshi', '5266579252423', '01496758918', 'student5@example.com', '$2y$12$jMtG0X1dl1nRkyzV6PoAv.bCZ06q9Tm7E6od8.HG84KiWEnKSNoQK', '5921 Rolando Summit Suite 483\nEast Emilymouth, ND 74755', '139 Osinski Overpass Suite 034\nRitchiefurt, TN 04540-0787', 'ADM-00005', '2020-10-04', 'B', 'Science', '2025-2026', 'Green and Sons School', 'Roman Barton', 'Farmer', '01715929730', 'father5@example.com', '7015451962661', NULL, 'Leanna Schowalter', 'Teacher', '01419501840', 'mother5@example.com', '5068023034792', NULL, 'Stanton Swaniawski', '01790513998', 'guardian5@example.com', '4569847094450', 'Uncle', 1, 4, 2, '2026-01-22', NULL, 2025000005, 900005, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03', '127.0.0.1', 1, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03'),
(6, 'Geo', 'McLaughlin', '2003-09-01', 'Female', 'A-', 'Buddhist', 'Bangladeshi', '4462137132161', '01703287994', 'student6@example.com', '$2y$12$8fRveREq4yn6cUUscNLFe.vnvBy5boR6iLI3aLiaCIRs/.lXi1UqC', '736 Okuneva Motorway\nGregoriomouth, NM 59319', '5860 Kulas Plaza\nWest Demetris, NV 38088-4772', 'ADM-00006', '1988-04-02', 'A', 'Arts', '2025-2026', 'Hegmann, Grimes and Bosco School', 'Mr. Willy Gusikowski IV', 'Doctor', '01361706175', 'father6@example.com', '8736522078890', NULL, 'Della Lakin', 'Housewife', '01385108345', 'mother6@example.com', '6362489090879', NULL, 'Dr. Percival McKenzie', '01403430534', 'guardian6@example.com', '7071566454288', 'Sister', 1, 1, 5, '2026-01-22', NULL, 2025000006, 900006, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03', '127.0.0.1', 1, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03'),
(7, 'Roma', 'Medhurst', '1970-10-10', 'Male', 'O-', 'Hindu', 'Bangladeshi', '2464762301725', '01345248619', 'student7@example.com', '$2y$12$wLi/w/fEo924kDFSQpmFVOVskKQotSIETCoaU5PNOmAeggT9VGoUG', '77573 West Valleys\nJarodhaven, WA 67478-1759', '16749 Bret Lakes\nPort Carlietown, DE 03431', 'ADM-00007', '2008-09-03', 'C', 'Commerce', '2025-2026', 'Watsica, Johns and Lakin School', 'Dr. Brad Renner IV', 'Engineer', '01553852914', 'father7@example.com', '8515936882288', NULL, 'Jaclyn Roberts', 'Nurse', '01654379634', 'mother7@example.com', '6055345478919', NULL, 'Mireille Murray', '01444442404', 'guardian7@example.com', '0401334308205', 'Brother', 1, 5, 2, '2026-01-22', NULL, 2025000007, 900007, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03', '127.0.0.1', 1, NULL, '2026-01-22 06:00:03', '2026-01-22 06:00:03'),
(8, 'Marty', 'Barton', '1980-02-11', 'Male', 'A-', 'Islam', 'Bangladeshi', '1335877693968', '01391997813', 'student8@example.com', '$2y$12$b65lpoFLqXpugzrC6yKRk.RJ5yQBfX9016.G5liJU3CIMEiF0Ojcy', '638 Jess Gardens\nLakinport, WA 84360-1016', '242 Hansen Extension\nElliottfort, ME 48650', 'ADM-00008', '2025-03-18', 'A', 'Arts', '2025-2026', 'Breitenberg-Zulauf School', 'Percy Brakus', 'Doctor', '01418191084', 'father8@example.com', '3275704702123', NULL, 'Iliana Jacobi', 'Businesswoman', '01564213572', 'mother8@example.com', '8351105919638', NULL, 'Dr. Fermin Shanahan', '01339708523', 'guardian8@example.com', '0576987258076', 'Uncle', 1, 1, 1, '2026-01-22', NULL, 2025000008, 900008, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04', '127.0.0.1', 1, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04'),
(9, 'Assunta', 'Bashirian', '1979-03-04', 'Other', 'AB-', 'Islam', 'Bangladeshi', '3741936787774', '01828978155', 'student9@example.com', '$2y$12$Qivu.kQRNRHHqFWULonIjuQ5Um4Vx/grqoqPe/hBQKcauZCjByGza', '37587 Jacquelyn Shore\nSouth Mohammad, WV 65512-4848', '19669 Bednar Lake\nDarrelland, IN 65984', 'ADM-00009', '2016-08-16', 'A', 'Arts', '2025-2026', 'Nitzsche-Heathcote School', 'Dr. Delaney Powlowski DDS', 'Doctor', '01351391283', 'father9@example.com', '4305036195142', NULL, 'Miss Lina Treutel MD', 'Housewife', '01792439731', 'mother9@example.com', '1065986769727', NULL, 'Mrs. Janae Hickle PhD', '01750651710', 'guardian9@example.com', '8470591084384', 'Grandparent', 1, 2, 5, '2026-01-22', NULL, 2025000009, 900009, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04', '127.0.0.1', 1, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04'),
(10, 'Duane', 'Dooley', '1977-06-26', 'Female', 'O+', 'Hindu', 'Bangladeshi', '6997477538721', '01561116626', 'student10@example.com', '$2y$12$O.pgAYb/fiiuSB9RHgmI3OSCH4iYr2TZMblN7tfJLATnN5U/A./p2', '930 Joaquin Spurs\nDibbertberg, GA 84787', '18880 Jenkins Heights Apt. 796\nWest Miles, IA 85937', 'ADM-00010', '1977-12-06', 'B', 'Science', '2025-2026', 'Pfannerstill, Jaskolski and Berge School', 'Dr. Blaze Vandervort III', 'Teacher', '01933174637', 'father10@example.com', '2779690497349', NULL, 'Therese Barton', 'Teacher', '01413341800', 'mother10@example.com', '4382050410300', NULL, 'Laurianne Roob', '01335398021', 'guardian10@example.com', '9965671989300', 'Brother', 1, 2, 1, '2026-01-22', NULL, 2025000010, 900010, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04', '127.0.0.1', 1, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04'),
(11, 'June', 'Prosacco', '1971-06-20', 'Other', 'AB+', 'Islam', 'Bangladeshi', '5411848321383', '01591295064', 'student11@example.com', '$2y$12$o02MG8EbUQpSg2EjxdoWQO4xsJcjBhfywTbW0T7Dma.t57cfDmvD.', '551 Schuppe Mall Apt. 781\nLorenzomouth, NV 92495', '72770 Tyson Ports Suite 830\nNorth Hayley, MD 03809-0231', 'ADM-00011', '2004-12-25', 'C', 'Commerce', '2025-2026', 'Bailey PLC School', 'Mr. Darion Jacobi DVM', 'Farmer', '01364625279', 'father11@example.com', '8211405886142', NULL, 'Magnolia Reichel III', 'Housewife', '01448706583', 'mother11@example.com', '7851349939023', NULL, 'Mrs. Anya Hayes PhD', '01304237821', 'guardian11@example.com', '7570511378136', 'Sister', 1, 6, 2, '2026-01-22', NULL, 2025000011, 900011, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04', '127.0.0.1', 1, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04'),
(12, 'Virginia', 'Will', '1996-02-15', 'Other', 'B-', 'Christian', 'Bangladeshi', '1536378958275', '01512534253', 'student12@example.com', '$2y$12$1BFUpWLYFC2ZHmYw5zEHFOAV32iWG0aq6cvpel0eSsXXaIFrn26Mm', '418 Lincoln Lodge\nSouth Domenicoland, MA 60789-1148', '865 Roob Cliff Suite 127\nMerrittside, WV 44250-2767', 'ADM-00012', '1999-07-10', 'B', 'Science', '2025-2026', 'Christiansen PLC School', 'Mr. Shane Zboncak DDS', 'Doctor', '01383037730', 'father12@example.com', '3701602365093', NULL, 'Aileen Quigley', 'Housewife', '01581082395', 'mother12@example.com', '8953118064848', NULL, 'Alvera Spinka', '01601841189', 'guardian12@example.com', '5649138560950', 'Brother', 1, 3, 1, '2026-01-22', NULL, 2025000012, 900012, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04', '127.0.0.1', 1, NULL, '2026-01-22 06:00:04', '2026-01-22 06:00:04'),
(13, 'Rey', 'Baumbach', '2002-11-16', 'Other', 'AB+', 'Other', 'Bangladeshi', '4763209141437', '01485519523', 'student13@example.com', '$2y$12$7c57104fBMdJnymIKampv./wEaqx1g31L1yIXxpuYcnVPWNZ7VoEy', '519 Bailee Rapid Suite 268\nWest Orpha, OH 58406', '31874 Nicole Dale\nKrajcikstad, IN 84176-8485', 'ADM-00013', '1998-05-25', 'A', 'Commerce', '2025-2026', 'Schneider PLC School', 'Dr. Isaac Bashirian I', 'Doctor', '01971708051', 'father13@example.com', '9876278117611', NULL, 'Elissa Huel', 'Businesswoman', '01348332565', 'mother13@example.com', '6160273080558', NULL, 'Mr. Braeden Deckow DDS', '01888680975', 'guardian13@example.com', '7118825054787', 'Sister', 1, 7, 2, '2026-01-22', NULL, 2025000013, 900013, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05', '127.0.0.1', 1, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05'),
(14, 'Imani', 'Pouros', '2019-08-03', 'Other', 'O+', 'Christian', 'Bangladeshi', '6505780854949', '01507119574', 'student14@example.com', '$2y$12$q1HWaD5TS7mkffgLQ4JMTO5Q0.iN9fChAN0AwG.HWIYnacR/MI606', '67284 Elouise Inlet Apt. 830\nKelsieland, LA 83782', '5627 Moen Ferry Suite 188\nLake Carleyburgh, TX 06680', 'ADM-00014', '2012-02-15', 'B', 'Commerce', '2025-2026', 'King-Botsford School', 'Gordon Parker', 'Farmer', '01616567381', 'father14@example.com', '8257486418426', NULL, 'Jacklyn Brakus', 'Doctor', '01671190388', 'mother14@example.com', '3734530205408', NULL, 'Kareem Stanton III', '01525250024', 'guardian14@example.com', '5146711964779', 'Grandparent', 1, 2, 3, '2026-01-22', NULL, 2025000014, 900014, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05', '127.0.0.1', 1, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05'),
(15, 'Dortha', 'Oberbrunner', '2014-09-13', 'Other', 'B+', 'Islam', 'Bangladeshi', '0904862159049', '01655482036', 'student15@example.com', '$2y$12$LJB8ONSuyH2C0XoV7o1Yn.heT0r4rX217DyKeJo5zmuOjtVxIiRfG', '254 Haley Crossing Suite 816\nUllrichtown, TX 20017-2785', '188 Westley Groves\nCruickshankview, GA 30971', 'ADM-00015', '2000-03-15', 'B', 'Arts', '2025-2026', 'Boehm LLC School', 'Frank Boyer', 'Teacher', '01377440559', 'father15@example.com', '3614638976144', NULL, 'Shana Kessler', 'Businesswoman', '01885004700', 'mother15@example.com', '1771975329466', NULL, 'Ms. Gladyce Hyatt', '01334381016', 'guardian15@example.com', '1456756717083', 'Brother', 1, 4, 1, '2026-01-22', NULL, 2025000015, 900015, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05', '127.0.0.1', 1, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05'),
(16, 'Albin', 'Ziemann', '2020-04-25', 'Male', 'A-', 'Hindu', 'Bangladeshi', '0129275048880', '01451723038', 'student16@example.com', '$2y$12$hR9owmgYcq.Jp7P5XWH/2e31XXMC0r78UHYYYZ8GRii5VSrUlxQpm', '2008 Obie Station Apt. 141\nNew Rafaelachester, TN 06959', '668 Tiara Stream\nEast Nikolas, ME 73497-0016', 'ADM-00016', '1988-11-17', 'A', 'Science', '2025-2026', 'Larson-Klocko School', 'Jaylin Denesik', 'Doctor', '01865868789', 'father16@example.com', '6732198338784', NULL, 'Prof. Everette Bahringer IV', 'Nurse', '01794568786', 'mother16@example.com', '0407540741255', NULL, 'Gisselle Windler', '01333687851', 'guardian16@example.com', '5150499337106', 'Aunt', 1, 3, 5, '2026-01-22', NULL, 2025000016, 900016, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05', '127.0.0.1', 1, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05'),
(17, 'Javon', 'Runolfsdottir', '1989-07-30', 'Male', 'B-', 'Christian', 'Bangladeshi', '8929811852151', '01730235116', 'student17@example.com', '$2y$12$yWUALAPA5J3NfBD/bz6K6OQwrdYFeXrMuuK3JFObjc/OXtPjcPnVG', '46456 Daryl Ford\nNorth Susana, AL 23258-7161', '30982 Curt Estates\nNew Lolita, CA 72304', 'ADM-00017', '2014-11-11', 'A', 'Arts', '2025-2026', 'Durgan, Hodkiewicz and Abbott School', 'Enoch Johns', 'Teacher', '01875825003', 'father17@example.com', '5985012930680', NULL, 'Cassandra Feest', 'Businesswoman', '01644610421', 'mother17@example.com', '9092981054913', NULL, 'Rozella Wehner MD', '01429899642', 'guardian17@example.com', '5105991333986', 'Sister', 1, 1, 4, '2026-01-22', NULL, 2025000017, 900017, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05', '127.0.0.1', 1, NULL, '2026-01-22 06:00:05', '2026-01-22 06:00:05'),
(18, 'Fleta', 'Schimmel', '2024-10-09', 'Male', 'B-', 'Hindu', 'Bangladeshi', '6400944922807', '01912728690', 'student18@example.com', '$2y$12$YbGY1kzpyYG.LLTx42fDEOMT30yFT7KVW0aGLF0lwgvDWOUTyzj.W', '461 Elody Lights Suite 971\nJoannyville, WV 64488', '67591 Emmerich Pine Apt. 345\nNew Laylaville, RI 99404-2153', 'ADM-00018', '2020-05-08', 'A', 'Commerce', '2025-2026', 'Zboncak-McClure School', 'Bradly Ferry', 'Farmer', '01782119066', 'father18@example.com', '4162886250234', NULL, 'Vincenza Mitchell', 'Teacher', '01454596388', 'mother18@example.com', '1486099464463', NULL, 'Jovani Shields', '01836379616', 'guardian18@example.com', '5571202066424', 'Grandparent', 1, 4, 5, '2026-01-22', NULL, 2025000018, 900018, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06', '127.0.0.1', 1, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06'),
(19, 'Royal', 'Hackett', '1990-07-11', 'Female', 'B-', 'Islam', 'Bangladeshi', '5616949109794', '01692724153', 'student19@example.com', '$2y$12$YuLI4XI/V55TV.Wcpw8DGuLnPQHab.cMdQsMgRndH/pWhiFYZI4u2', '747 Rylee Meadows\nLake Daphneestad, WY 47992', '401 Robel Trace Suite 047\nPort Micah, DE 04490-3830', 'ADM-00019', '2022-12-14', 'A', 'Arts', '2025-2026', 'Crist, Robel and Rowe School', 'Nicholas Schuster', 'Businessman', '01907478898', 'father19@example.com', '5929874351365', NULL, 'Sunny Runte', 'Businesswoman', '01438995825', 'mother19@example.com', '5326292937303', NULL, 'Miss Virginia Treutel', '01832473026', 'guardian19@example.com', '8576066191790', 'Brother', 1, 8, 2, '2026-01-22', NULL, 2025000019, 900019, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06', '127.0.0.1', 1, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06'),
(20, 'Valerie', 'Weissnat', '2017-05-14', 'Male', 'A-', 'Islam', 'Bangladeshi', '1968702917319', '01745047754', 'student20@example.com', '$2y$12$kS.Z9pP7DiUxU3qXM81.pOjSunj8MGiHopSuN5YoSo8KEjujJU6ty', '79219 Elisa Gardens Apt. 654\nEast Wayne, WI 69195', '26144 Robel Stravenue Suite 307\nLake Shanonfort, MD 78232', 'ADM-00020', '1979-07-22', 'B', 'Commerce', '2025-2026', 'Flatley Ltd School', 'Furman Rice', 'Doctor', '01585963107', 'father20@example.com', '1966431089890', NULL, 'Willow Stanton', 'Businesswoman', '01793360900', 'mother20@example.com', '9879057594877', NULL, 'Mr. Casimir Schneider', '01772954037', 'guardian20@example.com', '6834193178386', 'Sister', 1, 9, 2, '2026-01-22', NULL, 2025000020, 900020, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06', '127.0.0.1', 1, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06'),
(21, 'Lessie', 'Gleason', '2008-08-01', 'Male', 'A+', 'Hindu', 'Bangladeshi', '9554746462888', '01581578120', 'student21@example.com', '$2y$12$bXup7D9NPIB1cSbh3uDmJOWoDHlnj3yGuGYNVx2kqHALcb5wqktGy', '6075 Aric Unions\nRonview, SC 91275', '8588 Bahringer Row Suite 330\nO\'Connertown, NC 30083-6532', 'ADM-00021', '2009-05-03', 'A', 'Commerce', '2025-2026', 'Boehm, Heidenreich and Hagenes School', 'Dr. Adam Kuphal MD', 'Farmer', '01755440720', 'father21@example.com', '9757884090630', NULL, 'Kayla Halvorson', 'Nurse', '01375298148', 'mother21@example.com', '1988074049649', NULL, 'Dr. Murphy Volkman PhD', '01590046732', 'guardian21@example.com', '2263938733296', 'Grandparent', 1, 10, 2, '2026-01-22', NULL, 2025000021, 900021, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06', '127.0.0.1', 1, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06'),
(22, 'Garland', 'Mayer', '1981-12-13', 'Male', 'AB-', 'Buddhist', 'Bangladeshi', '2807593495283', '01911100101', 'student22@example.com', '$2y$12$0pSK0Zjr41sWqjzOW9vTx.DtzkwPJFaA3bSZhbK06VEmCCY0U78Pq', '726 Dock Crest\nHodkiewiczshire, OK 15678', '88542 Desmond Burg Suite 515\nHopefurt, CO 83179', 'ADM-00022', '2017-02-26', 'B', 'Commerce', '2025-2026', 'Stroman, Willms and Beatty School', 'Cleve Gutkowski', 'Farmer', '01543291130', 'father22@example.com', '6648313020722', NULL, 'Miss Roxane Mante III', 'Teacher', '01559693779', 'mother22@example.com', '2752286734536', NULL, 'Anya Hyatt', '01678038070', 'guardian22@example.com', '8457565126372', 'Brother', 1, 5, 1, '2026-01-22', NULL, 2025000022, 900022, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06', '127.0.0.1', 1, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06'),
(23, 'Obie', 'Flatley', '1992-12-06', 'Male', 'B-', 'Buddhist', 'Bangladeshi', '3071074081398', '01969498105', 'student23@example.com', '$2y$12$4FIBQVTAymkPWg7NBxrWvOBAy5JxKTZLu2AUGVOixdK5md9PhX3LK', '331 Viviane Centers Apt. 732\nDenisstad, WI 98470', '19944 Anais Roads\nBeatriceville, SD 50270-6868', 'ADM-00023', '1975-03-07', 'A', 'Commerce', '2025-2026', 'Wilkinson Group School', 'Lavon Lueilwitz', 'Businessman', '01895707402', 'father23@example.com', '2477148871082', NULL, 'Lelah Lind', 'Housewife', '01574409149', 'mother23@example.com', '2030298651832', NULL, 'Heath Erdman', '01726549238', 'guardian23@example.com', '3116866481291', 'Grandparent', 1, 6, 1, '2026-01-22', NULL, 2025000023, 900023, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06', '127.0.0.1', 1, NULL, '2026-01-22 06:00:06', '2026-01-22 06:00:06'),
(24, 'Abigale', 'Littel', '1973-03-13', 'Other', 'B-', 'Islam', 'Bangladeshi', '2648845871450', '01471202028', 'student24@example.com', '$2y$12$.25X8jqQ7DhHH1EVCTWaSONWMz5Z2BoL4ECHRnpXxMVVJh31C9dpS', '289 Kelton Corners\nWilbertburgh, KY 39158', '31143 Kathryn Overpass\nBinsport, IL 80820-9532', 'ADM-00024', '2011-01-01', 'A', 'Arts', '2025-2026', 'Boehm Ltd School', 'Cole Hintz', 'Businessman', '01780860557', 'father24@example.com', '8268216793558', NULL, 'Noemi Zboncak', 'Housewife', '01643933022', 'mother24@example.com', '5217759741278', NULL, 'Jerald Bergnaum', '01548615346', 'guardian24@example.com', '9336124976208', 'Brother', 1, 3, 3, '2026-01-22', NULL, 2025000024, 900024, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07', '127.0.0.1', 1, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07'),
(25, 'Lew', 'Collins', '2018-11-26', 'Other', 'AB+', 'Christian', 'Bangladeshi', '9218158361387', '01801516428', 'student25@example.com', '$2y$12$WmIPQGrLfhgMc1gHk/X6RuXUd85OoG7WtnNxKZfIWcxxylV6FZily', '14644 Hudson Coves Suite 270\nNorth Janelle, KS 31926-7321', '379 Ziemann Prairie\nWest Alyson, ME 78372', 'ADM-00025', '2017-04-09', 'C', 'Science', '2025-2026', 'Roob LLC School', 'Cullen O\'Reilly', 'Teacher', '01368146200', 'father25@example.com', '6686614779375', NULL, 'Prof. Karli Olson DDS', 'Doctor', '01967090966', 'mother25@example.com', '3336194313855', NULL, 'Shanon Walsh', '01946958396', 'guardian25@example.com', '1974512103114', 'Aunt', 1, 2, 4, '2026-01-22', NULL, 2025000025, 900025, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07', '127.0.0.1', 1, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07'),
(26, 'Karli', 'Goyette', '2006-01-29', 'Female', 'B-', 'Christian', 'Bangladeshi', '4433477326435', '01646677059', 'student26@example.com', '$2y$12$pDLey1LVbXUR5p426Ak75.JsEa3pOgQSRmUOm3Jfd.1roestNqM5.', '6268 Jessyca Glen\nZemlakville, HI 27846', '789 Shields Isle\nNew Chandlermouth, KY 96916-2844', 'ADM-00026', '2005-08-03', 'B', 'Commerce', '2025-2026', 'Schultz, Nader and Flatley School', 'Jon Kunde', 'Teacher', '01389358628', 'father26@example.com', '9448467059651', NULL, 'Prof. Norene Torphy', 'Businesswoman', '01824639200', 'mother26@example.com', '4058129967467', NULL, 'Santino Kihn', '01877499375', 'guardian26@example.com', '4564462972798', 'Sister', 1, 3, 4, '2026-01-22', NULL, 2025000026, 900026, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07', '127.0.0.1', 1, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07'),
(27, 'Kayden', 'Pacocha', '1985-10-19', 'Female', 'B+', 'Islam', 'Bangladeshi', '3357023444183', '01614425382', 'student27@example.com', '$2y$12$3HFyM0CF2ToJVRX8lSaXp.lyQbOaAPBASkP5OwKf2zKY9WF3GIFhm', '476 Rutherford Camp\nEast Fidel, MN 59608', '56155 Stokes Route Suite 860\nEverardohaven, NV 68843', 'ADM-00027', '1986-09-26', 'B', 'Arts', '2025-2026', 'Zboncak Ltd School', 'Mervin Hirthe', 'Businessman', '01482564189', 'father27@example.com', '7254603790873', NULL, 'Dr. Leila Hermiston', 'Housewife', '01735365908', 'mother27@example.com', '1580727706924', NULL, 'Flossie Moen', '01870089349', 'guardian27@example.com', '4481295654823', 'Uncle', 1, 4, 4, '2026-01-22', NULL, 2025000027, 900027, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07', '127.0.0.1', 1, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07'),
(28, 'Morgan', 'Shanahan', '1983-04-14', 'Male', 'O+', 'Islam', 'Bangladeshi', '8878968502727', '01615910730', 'student28@example.com', '$2y$12$jezl.zYeIHDldFkYMXPd9.1nTjcmEiwanOD6RaCg8mGX8YsyPYCs6', '9473 Kris Villages\nThadchester, WI 17817', '6990 Schiller Greens\nHeidenreichhaven, VT 57402', 'ADM-00028', '1998-08-18', 'B', 'Commerce', '2025-2026', 'Dickinson, Runte and Ritchie School', 'Bennie Harber', 'Businessman', '01932742865', 'father28@example.com', '0117292836708', NULL, 'Cecile Green', 'Nurse', '01565798254', 'mother28@example.com', '9258697990876', NULL, 'Prof. Oda Crooks PhD', '01407155312', 'guardian28@example.com', '1309942064011', 'Brother', 1, 5, 5, '2026-01-22', NULL, 2025000028, 900028, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07', '127.0.0.1', 1, NULL, '2026-01-22 06:00:07', '2026-01-22 06:00:07'),
(29, 'Wendell', 'Aufderhar', '1989-06-19', 'Other', 'B+', 'Hindu', 'Bangladeshi', '2361700789831', '01623481228', 'student29@example.com', '$2y$12$615zV8mqPon1LQ9biohVX.dKAsFsCXQ2eKm.8KUt0AMSGWJgYC3gy', '324 Jevon Isle\nEast Rosalee, CO 26022-5295', '9604 Harvey Tunnel Apt. 301\nSouth Karsonhaven, NV 59418-1620', 'ADM-00029', '1996-06-16', 'C', 'Arts', '2025-2026', 'Huel-Dooley School', 'Tyrell Kassulke Jr.', 'Businessman', '01952396287', 'father29@example.com', '6787801227581', NULL, 'Yolanda Tromp', 'Doctor', '01697740312', 'mother29@example.com', '8270758489663', NULL, 'Malvina Gleason', '01929670818', 'guardian29@example.com', '8385160268322', 'Uncle', 1, 7, 1, '2026-01-22', NULL, 2025000029, 900029, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08', '127.0.0.1', 1, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08'),
(30, 'Willow', 'Upton', '2008-12-07', 'Other', 'O-', 'Christian', 'Bangladeshi', '9032326471388', '01338102270', 'student30@example.com', '$2y$12$.NYJGrGOKO5T7/KYLubIfOUnSyQaHPvUltsqS/qRMoRQyN0uGcWUO', '697 Maymie Plaza\nHermanland, KY 39345-5768', '68057 Durgan Vista Apt. 432\nSouth Myrl, MS 08011', 'ADM-00030', '1986-11-14', 'A', 'Commerce', '2025-2026', 'Gulgowski and Sons School', 'Bernhard Howe MD', 'Teacher', '01811832153', 'father30@example.com', '7363091092933', NULL, 'Odie McDermott', 'Doctor', '01834417560', 'mother30@example.com', '0891031123102', NULL, 'Branson Upton I', '01380771615', 'guardian30@example.com', '2962036307916', 'Sister', 1, 5, 4, '2026-01-22', NULL, 2025000030, 900030, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08', '127.0.0.1', 1, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08'),
(31, 'Aurelie', 'Cruickshank', '2009-10-07', 'Other', 'B+', 'Buddhist', 'Bangladeshi', '6231567672716', '01720266366', 'student31@example.com', '$2y$12$WghuM78c5EmN/HO2Hrjnvu0VmnS4LQF8lRpLU9mpD0wD4lNgTezFa', '276 Rozella Lake\nMacejkovicbury, MT 18466-4943', '103 Zula Knolls\nWalshfort, DE 10558', 'ADM-00031', '1996-01-31', 'B', 'Commerce', '2025-2026', 'Lubowitz-Wintheiser School', 'Estevan Olson', 'Businessman', '01897446455', 'father31@example.com', '2617233595081', NULL, 'Prof. Golda Little IV', 'Nurse', '01732535934', 'mother31@example.com', '6908929094580', NULL, 'Edna Roob', '01989526550', 'guardian31@example.com', '2671746298415', 'Sister', 1, 6, 5, '2026-01-22', NULL, 2025000031, 900031, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08', '127.0.0.1', 1, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08'),
(32, 'Lenny', 'Moen', '1971-09-18', 'Other', 'A-', 'Other', 'Bangladeshi', '5221298314028', '01887027774', 'student32@example.com', '$2y$12$zntvbq7yKWb6PkgynzmRkuHrTuzsHNs9frMnUxk9Zfp8lcm8S0pLa', '572 Langosh Hollow Apt. 439\nNew Sibylmouth, ME 22579', '5633 Alison Fork Suite 551\nNorth Hallie, VA 87893-4736', 'ADM-00032', '1989-07-14', 'A', 'Arts', '2025-2026', 'Spencer Ltd School', 'Crawford Mills', 'Doctor', '01551240910', 'father32@example.com', '7746569428919', NULL, 'Christelle Reynolds', 'Teacher', '01382552599', 'mother32@example.com', '3733454960405', NULL, 'Kyla Price', '01851352843', 'guardian32@example.com', '6665247061338', 'Sister', 1, 7, 5, '2026-01-22', NULL, 2025000032, 900032, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08', '127.0.0.1', 1, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08'),
(33, 'Heloise', 'Eichmann', '1989-08-19', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '1164614977011', '01489646176', 'student33@example.com', '$2y$12$KUgOK9xvfvF5yk9j.jYxrenx9VJ.aLQ6XxT18F5UFzGEuEDmYjdWq', '493 Eladio Glen\nRiverfurt, KY 03880', '45507 Nicolas Drives Suite 962\nLake Kamron, NJ 06133', 'ADM-00033', '1977-01-22', 'C', 'Commerce', '2025-2026', 'Effertz-Willms School', 'Prof. Tremaine Berge V', 'Teacher', '01496240721', 'father33@example.com', '8974186662363', NULL, 'Dolly Bartoletti', 'Businesswoman', '01629299642', 'mother33@example.com', '2884973394930', NULL, 'Ms. Alaina O\'Connell PhD', '01654947039', 'guardian33@example.com', '3458859470669', 'Brother', 1, 8, 5, '2026-01-22', NULL, 2025000033, 900033, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08', '127.0.0.1', 1, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08'),
(34, 'Danyka', 'Schmitt', '2000-11-19', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '9231305647112', '01641624554', 'student34@example.com', '$2y$12$6dzIS8dd/7tddtKNUu4gNeigqz/7Q0UUSmspf2VWOdxn3qXmAK99O', '612 Clemens Heights Suite 647\nWolfshire, OH 51761-5891', '467 Teagan Coves Suite 982\nNew Vernie, CA 82871-0706', 'ADM-00034', '2006-07-18', 'C', 'Arts', '2025-2026', 'Baumbach-Franecki School', 'Deion Gusikowski Jr.', 'Engineer', '01956961625', 'father34@example.com', '8318057895315', NULL, 'Dena Grant', 'Nurse', '01351814955', 'mother34@example.com', '8540031845359', NULL, 'Reyna Crist', '01859600547', 'guardian34@example.com', '7813087381394', 'Uncle', 1, 6, 4, '2026-01-22', NULL, 2025000034, 900034, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08', '127.0.0.1', 1, NULL, '2026-01-22 06:00:08', '2026-01-22 06:00:08'),
(35, 'Alisha', 'Jacobson', '2015-04-13', 'Other', 'A-', 'Christian', 'Bangladeshi', '4373620295824', '01415153440', 'student35@example.com', '$2y$12$7vvMooSh476ZJF3OF5tgVelhwsMn7mI4.aPlkFmUCW54sLQykpvxm', '69774 Ruben Island Suite 923\nOrinchester, ID 86415-8608', '59616 Louie Lights\nSouth Cierra, WY 86063', 'ADM-00035', '1979-04-09', 'C', 'Commerce', '2025-2026', 'McDermott, Bechtelar and Braun School', 'Trent Smith V', 'Farmer', '01877999588', 'father35@example.com', '3266718796115', NULL, 'Kayla Maggio', 'Housewife', '01882988263', 'mother35@example.com', '4906262256368', NULL, 'Annetta Beahan', '01333297256', 'guardian35@example.com', '1198331075261', 'Grandparent', 1, 4, 3, '2026-01-22', NULL, 2025000035, 900035, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09', '127.0.0.1', 1, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09'),
(36, 'Camylle', 'Becker', '1971-12-07', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '3965201671610', '01324193904', 'student36@example.com', '$2y$12$LLlwkmq5O1Tm0nUUtcQs/u0kY8Kxl2N57LDglcjTDqOJOEPceBT6K', '21983 Bogisich Plaza\nEast Jayborough, OH 26428-8830', '9409 Otto Estates\nVirgiemouth, MA 46910', 'ADM-00036', '2020-11-02', 'B', 'Commerce', '2025-2026', 'Robel PLC School', 'Milo Hansen Sr.', 'Teacher', '01952642972', 'father36@example.com', '3017028654039', NULL, 'Bettye Padberg', 'Doctor', '01629715554', 'mother36@example.com', '9064584583234', NULL, 'Evie Kuhn', '01613528998', 'guardian36@example.com', '9421850221837', 'Sister', 1, 11, 2, '2026-01-22', NULL, 2025000036, 900036, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09', '127.0.0.1', 1, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09'),
(37, 'Alvina', 'Spencer', '2010-11-11', 'Male', 'B-', 'Other', 'Bangladeshi', '9965105242518', '01743916285', 'student37@example.com', '$2y$12$ytRqyAfq5MNE1lWoWLXdg.jG2zTqtJfgQGb8xfR74PpNPW4lY2Lfa', '9144 Zieme Common Suite 274\nSauertown, AR 97408', '477 Tracey Hollow\nEnaburgh, MI 26670-6689', 'ADM-00037', '1988-04-07', 'C', 'Science', '2025-2026', 'Lebsack PLC School', 'Benny Lueilwitz', 'Engineer', '01935664798', 'father37@example.com', '3463596332754', NULL, 'Mellie Williamson', 'Businesswoman', '01802650470', 'mother37@example.com', '9610083396677', NULL, 'Sarai Donnelly', '01619071677', 'guardian37@example.com', '8016477690798', 'Sister', 1, 5, 3, '2026-01-22', NULL, 2025000037, 900037, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09', '127.0.0.1', 1, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09'),
(38, 'Hubert', 'Larkin', '1977-11-20', 'Female', 'O+', 'Islam', 'Bangladeshi', '3393570319823', '01422857279', 'student38@example.com', '$2y$12$0l6X0L6nDaIySaPYyPyFaeHHCmipdJsvX5hlSAP2omYHoFer96YL.', '24840 Garth Motorway\nPort Samantha, MA 50268-2353', '39727 Kade Street Apt. 603\nCaspermouth, NE 70612', 'ADM-00038', '2016-01-03', 'B', 'Commerce', '2025-2026', 'Klein, Murray and Cormier School', 'Fritz Wunsch', 'Doctor', '01641892814', 'father38@example.com', '5896883113640', NULL, 'Ms. Anabel Orn', 'Doctor', '01552776542', 'mother38@example.com', '5391850233844', NULL, 'Isac Graham', '01563748255', 'guardian38@example.com', '6274080879256', 'Sister', 1, 7, 4, '2026-01-22', NULL, 2025000038, 900038, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09', '127.0.0.1', 1, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09'),
(39, 'Kaia', 'Hackett', '2009-01-29', 'Other', 'A+', 'Buddhist', 'Bangladeshi', '6464606104701', '01361393979', 'student39@example.com', '$2y$12$hKwlEjy1A2Skbp17hMm8yOBzKeV5g5DgHF5.c80JeC0/aEqEtwsr.', '34875 Gleason Squares\nNew Eldon, SD 93904-9292', '455 Reanna Ville\nNew Ernie, NE 15982', 'ADM-00039', '2018-08-27', 'A', 'Commerce', '2025-2026', 'Marquardt, Hamill and Dooley School', 'Will Hansen', 'Doctor', '01422807412', 'father39@example.com', '3710305412194', NULL, 'Emmy Grimes', 'Nurse', '01300197830', 'mother39@example.com', '7914849699647', NULL, 'Elfrieda Bergnaum', '01971032722', 'guardian39@example.com', '3652699814064', 'Sister', 1, 8, 4, '2026-01-22', NULL, 2025000039, 900039, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09', '127.0.0.1', 1, NULL, '2026-01-22 06:00:09', '2026-01-22 06:00:09'),
(40, 'Hailie', 'Murazik', '1978-04-15', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '8885441377157', '01420311564', 'student40@example.com', '$2y$12$/2fiHIVu5wQpub6r3BVTju7u7G/6RbHo8BWSMttZJH9SBVtwVL.bu', '3703 Hermann Unions Suite 661\nPort Jaydaborough, NM 88422', '2203 Strosin Mews\nGusikowskiport, OK 47905', 'ADM-00040', '1993-03-22', 'C', 'Arts', '2025-2026', 'Cartwright, Paucek and Emmerich School', 'Horacio Kunde', 'Farmer', '01876417498', 'father40@example.com', '7205229151303', NULL, 'Maddison Bechtelar II', 'Businesswoman', '01643998505', 'mother40@example.com', '6211896072753', NULL, 'Susie Emard', '01385223876', 'guardian40@example.com', '4022463174048', 'Aunt', 1, 12, 2, '2026-01-22', NULL, 2025000040, 900040, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10', '127.0.0.1', 1, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10'),
(41, 'Stacy', 'Rice', '2015-11-21', 'Other', 'B+', 'Islam', 'Bangladeshi', '1096555787654', '01435097342', 'student41@example.com', '$2y$12$2HcafBaSonvft9CFp6dbN.1d0HIQBB6lRl3/CnlQeeAfhuh0rEv2W', '98104 Leonard Greens\nPort Emmy, WI 18827', '64716 Suzanne Roads\nGroverstad, TN 99819', 'ADM-00041', '1997-07-30', 'A', 'Commerce', '2025-2026', 'Cummings, Koelpin and Konopelski School', 'Emmitt Hartmann', 'Engineer', '01490249293', 'father41@example.com', '9660665897995', NULL, 'Geraldine Herzog', 'Businesswoman', '01473345808', 'mother41@example.com', '2468872086147', NULL, 'Miss Vicenta Ledner', '01794384633', 'guardian41@example.com', '6078346462568', 'Sister', 1, 8, 1, '2026-01-22', NULL, 2025000041, 900041, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10', '127.0.0.1', 1, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10'),
(42, 'Natalie', 'Bernier', '1970-06-08', 'Female', 'B+', 'Hindu', 'Bangladeshi', '6478215469641', '01671202666', 'student42@example.com', '$2y$12$E13B0dGQlumS7ROiIqoD6uxek9JjAsjRcqQleMTraBl0y37nwM2fO', '1473 Schaefer Wells\nEast Jeraldshire, MS 50422-9236', '4388 O\'Conner Fall\nNorth Emeliaview, UT 49179', 'ADM-00042', '2004-05-23', 'A', 'Science', '2025-2026', 'Jones-Schroeder School', 'Prof. Sedrick Beier', 'Engineer', '01655641677', 'father42@example.com', '6716831093030', NULL, 'Lucie Nicolas', 'Housewife', '01456594586', 'mother42@example.com', '5319616680091', NULL, 'Miss Alivia Marvin PhD', '01567456706', 'guardian42@example.com', '8884555830538', 'Uncle', 1, 13, 2, '2026-01-22', NULL, 2025000042, 900042, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10', '127.0.0.1', 1, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10'),
(43, 'Jaclyn', 'Torphy', '1981-09-07', 'Male', 'O-', 'Hindu', 'Bangladeshi', '4572575748463', '01344987041', 'student43@example.com', '$2y$12$c2ZNoJJ8nboBDSBbRITWN.karsS4rKmeX4hePOzdqNdAR8JIr34wm', '381 Roberts Stream Suite 637\nMiltonport, NE 30962-8804', '7277 Shemar Garden\nTownehaven, MS 53575', 'ADM-00043', '1995-01-21', 'B', 'Commerce', '2025-2026', 'Zulauf LLC School', 'Ludwig Champlin', 'Farmer', '01988655299', 'father43@example.com', '5314846453610', NULL, 'Jazmyne Braun Sr.', 'Businesswoman', '01579813637', 'mother43@example.com', '6675993224110', NULL, 'Elliott Herman', '01731191361', 'guardian43@example.com', '7358202296522', 'Grandparent', 1, 9, 1, '2026-01-22', NULL, 2025000043, 900043, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10', '127.0.0.1', 1, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10'),
(44, 'Ryley', 'Ernser', '1984-04-15', 'Male', 'A-', 'Buddhist', 'Bangladeshi', '4093442867957', '01923965211', 'student44@example.com', '$2y$12$FLdp3vMkSyODxKde5munzegkLOtz6.KTMvB5f3ms8wEv4RNPSb.c.', '46176 Kaya Grove Apt. 681\nCathrinehaven, AR 87107', '79162 Glover Glens Apt. 333\nWest Twila, NM 90391', 'ADM-00044', '2002-12-31', 'C', 'Commerce', '2025-2026', 'Kuhic-Johnson School', 'Modesto Muller', 'Doctor', '01867050365', 'father44@example.com', '5283775307880', NULL, 'Dr. Kimberly Terry', 'Doctor', '01412782270', 'mother44@example.com', '7653357866123', NULL, 'Peyton Paucek', '01665554775', 'guardian44@example.com', '8986660717663', 'Aunt', 1, 6, 3, '2026-01-22', NULL, 2025000044, 900044, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10', '127.0.0.1', 1, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10'),
(45, 'Fredy', 'Lemke', '1978-10-22', 'Other', 'B+', 'Buddhist', 'Bangladeshi', '4434193343520', '01473243222', 'student45@example.com', '$2y$12$/LTzZvfKTSWuhnMMRgqw9OBEP4oCzhT8u5H/mQ0WYfw61O12AObfe', '33051 Klein Corners\nLake Teresachester, DC 70635-3836', '83927 Jamal Trail\nLake Florida, AR 46231-7077', 'ADM-00045', '2018-05-21', 'B', 'Arts', '2025-2026', 'Bernier-Hamill School', 'Lourdes Trantow', 'Doctor', '01459999098', 'father45@example.com', '2864537601711', NULL, 'Marian Kunze IV', 'Teacher', '01730388913', 'mother45@example.com', '2170357409235', NULL, 'Polly Klocko Jr.', '01374915581', 'guardian45@example.com', '2302698858481', 'Grandparent', 1, 14, 2, '2026-01-22', NULL, 2025000045, 900045, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10', '127.0.0.1', 1, NULL, '2026-01-22 06:00:10', '2026-01-22 06:00:10'),
(46, 'Teagan', 'Wintheiser', '1988-05-23', 'Male', 'B+', 'Islam', 'Bangladeshi', '4635309060160', '01930935753', 'student46@example.com', '$2y$12$MvGpWYG3bzV25UYra7Se8eKgD1iMk2zTTi7CGsXSKM.lLaG1OS4ea', '437 Bergstrom Burgs Apt. 791\nEast Gracie, MO 88348-0009', '60023 Price Mount\nFaytown, WV 56093-5062', 'ADM-00046', '1978-11-03', 'C', 'Arts', '2025-2026', 'Harvey, Hamill and Reilly School', 'Larue Hartmann', 'Businessman', '01841464253', 'father46@example.com', '6939372594592', NULL, 'Fleta Bosco', 'Doctor', '01494785633', 'mother46@example.com', '8607478232235', NULL, 'Mr. Oswald Baumbach', '01303638396', 'guardian46@example.com', '2617587962807', 'Sister', 1, 10, 1, '2026-01-22', NULL, 2025000046, 900046, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11', '127.0.0.1', 1, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11'),
(47, 'Taryn', 'Ortiz', '1980-10-27', 'Other', 'O+', 'Christian', 'Bangladeshi', '4552870584192', '01669499634', 'student47@example.com', '$2y$12$nSnukCvFn2hJBHdlNtBawuU.igKk1Gv0l40.7UyGC70SSmrOlRQYO', '24937 Julian Brook Suite 858\nFriesenshire, KY 21435-8423', '26250 Hilton Heights Suite 805\nEast Georgianaview, MT 43710', 'ADM-00047', '1973-09-25', 'C', 'Commerce', '2025-2026', 'Schmeler, Trantow and Hegmann School', 'Amparo Huels Jr.', 'Farmer', '01645703140', 'father47@example.com', '9736726121295', NULL, 'Mrs. Sydnie Bode Sr.', 'Doctor', '01951021010', 'mother47@example.com', '8332476907890', NULL, 'Courtney Lynch', '01805601505', 'guardian47@example.com', '7610413605133', 'Grandparent', 1, 11, 1, '2026-01-22', NULL, 2025000047, 900047, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11', '127.0.0.1', 1, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11'),
(48, 'Josue', 'Bayer', '1983-11-27', 'Female', 'A+', 'Buddhist', 'Bangladeshi', '9182732240341', '01658890305', 'student48@example.com', '$2y$12$LrJasJ2/w3tfYcRvQKJaXOlTRzmsHXQOxCQwW/gJ6op3l8ZA9VXla', '104 Alex Extensions\nEast Gonzalo, RI 59996', '451 Jones Circle Suite 692\nNew Damien, NH 23567', 'ADM-00048', '1994-10-28', 'B', 'Commerce', '2025-2026', 'Leannon-West School', 'Jaylin Effertz', 'Doctor', '01388377604', 'father48@example.com', '4605356166797', NULL, 'Dominique Miller II', 'Doctor', '01885592473', 'mother48@example.com', '8204437726085', NULL, 'Naomi Stanton III', '01938885898', 'guardian48@example.com', '2096895858173', 'Brother', 1, 12, 1, '2026-01-22', NULL, 2025000048, 900048, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11', '127.0.0.1', 1, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11'),
(49, 'Dedric', 'Feeney', '1973-05-28', 'Female', 'B+', 'Other', 'Bangladeshi', '9158881568027', '01951533980', 'student49@example.com', '$2y$12$6JmoiHdXL1EORR9inaodi.WiXueM9UlyyPaoofeK4w.8blKxX47hW', '571 Maxwell Bypass\nSouth Laurianehaven, TX 49062-0698', '922 Padberg Villages Suite 462\nPort Dewayne, WY 18885-8716', 'ADM-00049', '2018-08-09', 'A', 'Science', '2025-2026', 'Kozey, Kassulke and Fay School', 'Mr. Terrence Senger III', 'Businessman', '01744827052', 'father49@example.com', '0150239912190', NULL, 'Myrna O\'Reilly II', 'Doctor', '01591790553', 'mother49@example.com', '0910551123667', NULL, 'Dr. Tamara Shanahan', '01400866113', 'guardian49@example.com', '4477438936375', 'Grandparent', 1, 13, 1, '2026-01-22', NULL, 2025000049, 900049, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11', '127.0.0.1', 1, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11'),
(50, 'Gustave', 'Bashirian', '1983-04-03', 'Male', 'AB-', 'Christian', 'Bangladeshi', '8097902861186', '01559727931', 'student50@example.com', '$2y$12$AQOV061oHgi7ShM4CcXZbONf05TPE80hXhGUf.HsJ3HDHHCHSin46', '1651 Wolf Fork\nGreenfelderborough, KY 89608', '549 Mina Road Suite 478\nMarlinhaven, VT 38933-7121', 'ADM-00050', '2005-02-24', 'B', 'Commerce', '2025-2026', 'Batz, Armstrong and O\'Conner School', 'Mr. Colby Heathcote', 'Businessman', '01701593740', 'father50@example.com', '3946665334179', NULL, 'Patience Hill', 'Teacher', '01921735531', 'mother50@example.com', '0226480669368', NULL, 'Kassandra Mertz V', '01580603433', 'guardian50@example.com', '0994781327260', 'Grandparent', 1, 9, 5, '2026-01-22', NULL, 2025000050, 900050, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11', '127.0.0.1', 1, NULL, '2026-01-22 06:00:11', '2026-01-22 06:00:11'),
(51, 'Mossie', 'Bergnaum', '1975-11-03', 'Female', 'A+', 'Hindu', 'Bangladeshi', '4269016299051', '01350346368', 'student51@example.com', '$2y$12$h7hmIc0bz2Ryr49HrSv3Mu3hSXDyEEv83J.vYwvj.ba8c2qPp9ZfS', '412 Ryan Skyway\nNorth Sibylview, MD 69690-9757', '73687 Jaquan Hills Suite 250\nMervinfurt, TX 90378', 'ADM-00051', '2003-03-02', 'C', 'Science', '2025-2026', 'Littel, Luettgen and Powlowski School', 'Mr. Titus O\'Hara MD', 'Businessman', '01446331436', 'father51@example.com', '6867437378305', NULL, 'Sydnie Schultz', 'Businesswoman', '01667273999', 'mother51@example.com', '6285737062742', NULL, 'Elijah Abernathy IV', '01343978288', 'guardian51@example.com', '3015913465810', 'Uncle', 1, 15, 2, '2026-01-22', NULL, 2025000051, 900051, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12', '127.0.0.1', 1, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12'),
(52, 'Mackenzie', 'Kautzer', '1980-09-08', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '1865726915784', '01507651219', 'student52@example.com', '$2y$12$v60FnDCvYT6rjg7hCkVCpe6.rG9nHSlGwOzlGJYh7gF0L83y48QO.', '3747 Turcotte Camp Suite 713\nWest Doyle, GA 09026-8425', '6448 Cassin Ports Apt. 709\nRennerville, AZ 69625', 'ADM-00052', '2003-06-09', 'B', 'Arts', '2025-2026', 'Spinka-Daugherty School', 'Fritz Tromp', 'Farmer', '01811400191', 'father52@example.com', '5120351681820', NULL, 'Cathryn Wolf', 'Businesswoman', '01595391054', 'mother52@example.com', '2436924371481', NULL, 'Prof. Raina Kuphal', '01363373511', 'guardian52@example.com', '1503941866945', 'Sister', 1, 7, 3, '2026-01-22', NULL, 2025000052, 900052, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12', '127.0.0.1', 1, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12'),
(53, 'Dena', 'Rempel', '1981-04-04', 'Female', 'O-', 'Islam', 'Bangladeshi', '6865720982780', '01543482558', 'student53@example.com', '$2y$12$5AbBYyNaVwb./dv993nWLu7BH9AXnisWUroTNXtSfPy6BniaTanNe', '69733 Bode Pike\nNew Daija, UT 67887', '72068 Ryleigh Alley Suite 708\nChadfurt, AZ 33376-6858', 'ADM-00053', '2015-10-21', 'B', 'Science', '2025-2026', 'Stark, Davis and Rice School', 'Bobby Von', 'Businessman', '01553288292', 'father53@example.com', '2355663184811', NULL, 'Jany Leuschke DVM', 'Businesswoman', '01683078723', 'mother53@example.com', '6955384720360', NULL, 'Prof. Joshua Schimmel DVM', '01536605210', 'guardian53@example.com', '3380521075262', 'Grandparent', 1, 10, 5, '2026-01-22', NULL, 2025000053, 900053, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12', '127.0.0.1', 1, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12'),
(54, 'Benedict', 'Windler', '2021-07-23', 'Male', 'A+', 'Other', 'Bangladeshi', '9903656742676', '01790626353', 'student54@example.com', '$2y$12$I.hYey4dTLeEBjQ43HrWRemLbXefP7OKPCRAGnv888OW6B1tMoEbC', '7096 Grimes Roads\nNew Sasha, NJ 65886', '4310 Goldner Ford\nSouth Mayaside, SD 36787-3863', 'ADM-00054', '1983-04-14', 'B', 'Commerce', '2025-2026', 'Herzog, Breitenberg and Dietrich School', 'Prof. Willard Bernier IV', 'Teacher', '01813219590', 'father54@example.com', '0230891437192', NULL, 'Audreanne Rath', 'Nurse', '01954176365', 'mother54@example.com', '2604702023326', NULL, 'Destini Hirthe', '01700890075', 'guardian54@example.com', '3794585611162', 'Aunt', 1, 16, 2, '2026-01-22', NULL, 2025000054, 900054, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12', '127.0.0.1', 1, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12'),
(55, 'Althea', 'Prohaska', '1971-03-09', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '5726925904446', '01510059037', 'student55@example.com', '$2y$12$.KogXTDEBFWypzZXeCLyw.89iZKjleFYQShimYDdkoV8YSsOq2P0.', '407 Walker Shores\nBettyebury, KS 12580', '565 Jacobson Drives\nEast Tracemouth, IA 49133', 'ADM-00055', '2019-07-27', 'A', 'Commerce', '2025-2026', 'Price, Aufderhar and Bernier School', 'Gino Gutmann', 'Teacher', '01650079618', 'father55@example.com', '3108868243043', NULL, 'Mrs. Alysha Kunde V', 'Nurse', '01982747117', 'mother55@example.com', '2334743418525', NULL, 'Dr. Lea Pagac Sr.', '01591882981', 'guardian55@example.com', '7347080368902', 'Grandparent', 1, 8, 3, '2026-01-22', NULL, 2025000055, 900055, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12', '127.0.0.1', 1, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12'),
(56, 'Eliza', 'Adams', '2011-03-01', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '2928420114522', '01392133163', 'student56@example.com', '$2y$12$t0ne06qeZa80ackm5SlEGeJfI1cAGuYIhXNAYTX3iJp0AVPhoZUDq', '7286 Kerluke Ridge Apt. 324\nPorterville, OH 72112-3341', '85752 Quinn Causeway\nBridgetberg, CA 75319', 'ADM-00056', '1984-09-18', 'B', 'Science', '2025-2026', 'Boyer PLC School', 'Mr. Evan Keebler', 'Farmer', '01762868614', 'father56@example.com', '7409149471180', NULL, 'Nelle Pfeffer', 'Housewife', '01489991969', 'mother56@example.com', '4444120345894', NULL, 'Ms. Gretchen Sawayn', '01306278075', 'guardian56@example.com', '4036104503763', 'Brother', 1, 14, 1, '2026-01-22', NULL, 2025000056, 900056, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12', '127.0.0.1', 1, NULL, '2026-01-22 06:00:12', '2026-01-22 06:00:12'),
(57, 'Jada', 'Harvey', '2006-09-26', 'Other', 'B-', 'Hindu', 'Bangladeshi', '0071391939625', '01356965895', 'student57@example.com', '$2y$12$72qdTQG3oEIvOVQPlGUOJ.mAJo1kxOYlmWplHZohrmaP8BbmQAaJe', '77052 Weimann Common\nEast Arturo, UT 15448-3545', '4109 Orval Walks Suite 422\nWest Georgianna, OK 74405', 'ADM-00057', '2009-09-13', 'A', 'Arts', '2025-2026', 'Abernathy Group School', 'Ward Koepp II', 'Engineer', '01847747152', 'father57@example.com', '5813836704429', NULL, 'Sabrina Daniel', 'Doctor', '01507361506', 'mother57@example.com', '6980620909894', NULL, 'Prof. Velda Hansen DDS', '01319877359', 'guardian57@example.com', '7087767569526', 'Brother', 1, 9, 3, '2026-01-22', NULL, 2025000057, 900057, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13', '127.0.0.1', 1, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `email`, `password`, `address1`, `address2`, `admission_no`, `admission_date`, `section`, `group`, `session_year`, `previous_school`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `father_monthly_income`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `mother_monthly_income`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `status`, `roll_number`, `class_id`, `attend_date`, `remark`, `b_reg_no`, `b_roll_no`, `photo`, `father_photo`, `mother_photo`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `is_profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(58, 'Amiya', 'Halvorson', '2001-06-13', 'Male', 'O+', 'Hindu', 'Bangladeshi', '9455162748775', '01603995186', 'student58@example.com', '$2y$12$pRiYX4nffOHO4VWd1XFK7.hpL9RR/6kaR3LlFCDxhY.4S6I0ymkXy', '881 Flatley Street\nWest Franzport, WV 90793', '804 Edna Corner Apt. 243\nWizachester, ME 68911', 'ADM-00058', '2012-11-21', 'C', 'Commerce', '2025-2026', 'Murphy Group School', 'Rodolfo Wehner', 'Engineer', '01801565329', 'father58@example.com', '7982634584519', NULL, 'Meredith Veum', 'Nurse', '01927210669', 'mother58@example.com', '9401457638079', NULL, 'Dr. Odessa Rowe MD', '01880192225', 'guardian58@example.com', '9416000594403', 'Sister', 1, 15, 1, '2026-01-22', NULL, 2025000058, 900058, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13', '127.0.0.1', 1, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13'),
(59, 'Cedrick', 'Crona', '1991-06-08', 'Male', 'B+', 'Islam', 'Bangladeshi', '8692977209681', '01752356517', 'student59@example.com', '$2y$12$1pz7sNIttAKZ73Z5DygFyeTv4SnlhSXE4c9IyzQsf5jQ7Jb4U/JdW', '53959 Nadia Springs Suite 070\nPort Bobbie, NH 42065-1918', '7765 Senger Mills Apt. 635\nMurazikfurt, WI 05174-8323', 'ADM-00059', '1998-07-05', 'B', 'Science', '2025-2026', 'Weissnat PLC School', 'Mr. Emory Jakubowski', 'Farmer', '01353264205', 'father59@example.com', '9084195461462', NULL, 'Kaylah Cremin', 'Businesswoman', '01615687553', 'mother59@example.com', '0006908572618', NULL, 'Mr. Dion Kessler', '01480735211', 'guardian59@example.com', '5035655605136', 'Brother', 1, 9, 4, '2026-01-22', NULL, 2025000059, 900059, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13', '127.0.0.1', 1, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13'),
(60, 'Berry', 'Grimes', '2022-01-20', 'Female', 'O-', 'Other', 'Bangladeshi', '3426598885176', '01630927575', 'student60@example.com', '$2y$12$ZKoxKf6SeQWVtvL8Shd0d.pqCc8ZUy4zuD9/oomWWX7BsLcaIlq4O', '377 Jerad Hills\nWest Geovanny, MT 70485-6347', '3138 Bernier Place Suite 218\nSouth Salvadorbury, GA 94265', 'ADM-00060', '2022-05-20', 'C', 'Science', '2025-2026', 'Keebler Inc School', 'Carson Smitham', 'Businessman', '01331472664', 'father60@example.com', '0642090582216', NULL, 'Sandra McKenzie', 'Teacher', '01399484954', 'mother60@example.com', '9098749502623', NULL, 'Mavis VonRueden Sr.', '01866250582', 'guardian60@example.com', '4535107914239', 'Aunt', 1, 16, 1, '2026-01-22', NULL, 2025000060, 900060, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13', '127.0.0.1', 1, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13'),
(61, 'Dessie', 'Runolfsson', '2011-07-22', 'Male', 'A+', 'Buddhist', 'Bangladeshi', '6259254525215', '01503183109', 'student61@example.com', '$2y$12$Koze3EJxGgf2uGE2/uRDOOixu3okf2HYrcVN7s3.qxMIGm9go3S/S', '6206 Keeling Parks Apt. 708\nRusselbury, NE 70050-9950', '524 Giovanny Prairie\nNew Shannamouth, DC 22283', 'ADM-00061', '1984-08-08', 'C', 'Science', '2025-2026', 'Wehner PLC School', 'Sam Pouros', 'Businessman', '01727567747', 'father61@example.com', '6514965240150', NULL, 'Belle Heaney', 'Businesswoman', '01782347625', 'mother61@example.com', '8542820232293', NULL, 'Prof. Katrine Macejkovic', '01909958619', 'guardian61@example.com', '4351108640724', 'Aunt', 1, 11, 5, '2026-01-22', NULL, 2025000061, 900061, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13', '127.0.0.1', 1, NULL, '2026-01-22 06:00:13', '2026-01-22 06:00:13'),
(62, 'Lawson', 'Wintheiser', '2020-02-05', 'Female', 'O+', 'Christian', 'Bangladeshi', '6960026793202', '01463943366', 'student62@example.com', '$2y$12$6Gu6M5e9JGT/eMuwsgZRpekU5XBR3R4e8ug29Gk5KWOoRAEvfMrIG', '6470 Dickens Brook\nPort Jerrell, KS 85325-2188', '93073 Dudley Island\nIrvingburgh, KS 17633', 'ADM-00062', '1982-07-30', 'A', 'Arts', '2025-2026', 'Reichel, Kerluke and Dietrich School', 'Dr. Robb Gorczany', 'Businessman', '01735778595', 'father62@example.com', '4944142565557', NULL, 'Ms. Lila Cremin II', 'Housewife', '01869901176', 'mother62@example.com', '0049943575590', NULL, 'Kendra Botsford', '01686849441', 'guardian62@example.com', '2706549898802', 'Uncle', 1, 10, 4, '2026-01-22', NULL, 2025000062, 900062, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14', '127.0.0.1', 1, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14'),
(63, 'Lilyan', 'Sawayn', '2001-02-22', 'Female', 'B-', 'Other', 'Bangladeshi', '4166735184109', '01685705632', 'student63@example.com', '$2y$12$0.VK8ftffM4R3m.P5c8czOGMOmrfa9aT0qjnkF/HbyzwiW9A2neYW', '66960 Florence Motorway\nLake Evangeline, MT 76313', '393 Vanessa Bypass Apt. 592\nSouth Ed, OH 02242', 'ADM-00063', '1975-10-18', 'C', 'Science', '2025-2026', 'Emard, Ruecker and Pfannerstill School', 'Samir Connelly', 'Farmer', '01493756385', 'father63@example.com', '1268598865289', NULL, 'Mrs. Gracie Von', 'Housewife', '01718815675', 'mother63@example.com', '0761370008765', NULL, 'Melvina Mann', '01516102849', 'guardian63@example.com', '8925004721452', 'Aunt', 1, 11, 4, '2026-01-22', NULL, 2025000063, 900063, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14', '127.0.0.1', 1, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14'),
(64, 'Kaelyn', 'Dicki', '1974-07-14', 'Male', 'AB-', 'Christian', 'Bangladeshi', '9232447085570', '01533461377', 'student64@example.com', '$2y$12$Qtbc7D62elKVlzRrtsebl.GfOq22swY.Dgb28JDA1tGf/mFKiZQgK', '4153 Metz Union Apt. 703\nKelsiebury, DC 94548-7514', '21806 Mann Mountain Suite 773\nLake Ceasar, CT 08221-4098', 'ADM-00064', '2011-12-30', 'A', 'Commerce', '2025-2026', 'Kilback Inc School', 'Mr. Jaycee Deckow II', 'Engineer', '01586633805', 'father64@example.com', '4108823513727', NULL, 'Piper Tromp', 'Doctor', '01700947962', 'mother64@example.com', '8442904824447', NULL, 'Mr. Dedrick Connelly V', '01883334539', 'guardian64@example.com', '3558711142695', 'Brother', 1, 12, 4, '2026-01-22', NULL, 2025000064, 900064, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14', '127.0.0.1', 1, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14'),
(65, 'Anahi', 'Feil', '2007-09-10', 'Other', 'AB-', 'Christian', 'Bangladeshi', '4351318195481', '01611706657', 'student65@example.com', '$2y$12$/RwVaVXfApaEQJhnlXY7WO9HRv65s.4oma8IwH4zmty3aOeFvzmk6', '128 Horace Dale\nJarenstad, RI 12709-5042', '50740 Blick Locks Apt. 467\nNorth Reaganmouth, DC 58181-5180', 'ADM-00065', '1986-04-19', 'C', 'Commerce', '2025-2026', 'Abbott PLC School', 'Liam Koepp', 'Engineer', '01387072898', 'father65@example.com', '6136215025548', NULL, 'Prof. Jana King I', 'Doctor', '01835036041', 'mother65@example.com', '0984276999505', NULL, 'Mr. Devyn West', '01850002168', 'guardian65@example.com', '1059236255934', 'Sister', 1, 13, 4, '2026-01-22', NULL, 2025000065, 900065, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14', '127.0.0.1', 1, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14'),
(66, 'Gerry', 'Hammes', '1998-01-03', 'Male', 'B+', 'Other', 'Bangladeshi', '6769238107995', '01629753901', 'student66@example.com', '$2y$12$jeOcDHRjo8toFbQrqBVFTO.gzQepvDwLQ423Xo3r2KJhUSkKrX0pa', '68074 Ceasar Ports Suite 539\nPort Marcelle, VA 93125', '31622 Mona Loaf\nPort Jaydon, AK 50297-7038', 'ADM-00066', '2024-12-09', 'A', 'Commerce', '2025-2026', 'Tillman-Morissette School', 'Freddy Robel', 'Engineer', '01691947959', 'father66@example.com', '8535881946423', NULL, 'Madie Hansen', 'Teacher', '01817612332', 'mother66@example.com', '1329115711169', NULL, 'Darien Morissette', '01343367735', 'guardian66@example.com', '5056259684166', 'Sister', 1, 17, 2, '2026-01-22', NULL, 2025000066, 900066, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14', '127.0.0.1', 1, NULL, '2026-01-22 06:00:14', '2026-01-22 06:00:14'),
(67, 'Marjory', 'Bartoletti', '2005-11-17', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '8836305122517', '01811801186', 'student67@example.com', '$2y$12$6Ov6TC6zwbVrumZUlxDNn.gDlLB9pfXRSvxCob6m8ugpd4JBcF48C', '7533 Hudson Light\nNorth Alejandramouth, GA 09308-7384', '116 Connor Camp Suite 626\nWest Kamillemouth, UT 16793', 'ADM-00067', '1989-08-02', 'A', 'Science', '2025-2026', 'Zulauf Ltd School', 'Kenyon Metz', 'Doctor', '01533722433', 'father67@example.com', '2296500449505', NULL, 'Kirsten Rodriguez', 'Housewife', '01464268639', 'mother67@example.com', '5150359971841', NULL, 'Davonte Kutch', '01500252144', 'guardian67@example.com', '6858471258976', 'Brother', 1, 17, 1, '2026-01-22', NULL, 2025000067, 900067, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15', '127.0.0.1', 1, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15'),
(68, 'Waylon', 'Streich', '1990-07-27', 'Male', 'O+', 'Other', 'Bangladeshi', '6794494026967', '01543040560', 'student68@example.com', '$2y$12$vERI1vwNXNkyYN1h4aU3s.4Rdi015sJz/t3EpL/Ro5qJ7ELdjZbvS', '86136 Tabitha Harbor Suite 961\nHansenborough, OK 09734', '40636 London Plaza Apt. 959\nEast Antoniettamouth, AL 47241', 'ADM-00068', '2019-02-26', 'B', 'Arts', '2025-2026', 'Weber, Romaguera and Kuphal School', 'Hilton McCullough', 'Teacher', '01341135926', 'father68@example.com', '6996670251093', NULL, 'Carolanne Trantow', 'Businesswoman', '01536258463', 'mother68@example.com', '4581777405915', NULL, 'Prof. Lenna Franecki II', '01810297155', 'guardian68@example.com', '0578370980467', 'Aunt', 1, 12, 5, '2026-01-22', NULL, 2025000068, 900068, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15', '127.0.0.1', 1, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15'),
(69, 'Breana', 'Sporer', '1978-07-27', 'Other', 'B+', 'Islam', 'Bangladeshi', '1168083841409', '01603835549', 'student69@example.com', '$2y$12$2IvnjSsHX2viZ21w6hzW.uBdV9UQlg5NyjnUvhu7Dk5z4Z7fOMtv6', '1679 Gerardo Walk Suite 354\nLake Vernaland, KS 76075', '578 General Spurs\nGradyshire, ND 75967-0295', 'ADM-00069', '2022-11-12', 'C', 'Science', '2025-2026', 'Auer LLC School', 'Mr. Chandler Becker MD', 'Businessman', '01442615174', 'father69@example.com', '3951237456989', NULL, 'Michaela Nienow', 'Doctor', '01318939320', 'mother69@example.com', '4529451968421', NULL, 'Ferne Erdman', '01839296630', 'guardian69@example.com', '9049549064519', 'Sister', 1, 18, 1, '2026-01-22', NULL, 2025000069, 900069, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15', '127.0.0.1', 1, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15'),
(70, 'Janelle', 'Huel', '2015-09-18', 'Male', 'A+', 'Hindu', 'Bangladeshi', '6006707114261', '01921198712', 'student70@example.com', '$2y$12$RFj2vBL8u3YQuHrOo5JyJ.eJbhTBiP7oRqJDprDKSeMJgexxNpW2K', '9504 Upton Fields Apt. 931\nNew Rosiefort, WI 33635-2405', '410 Percy Brook\nJanieside, FL 69342', 'ADM-00070', '1995-09-22', 'B', 'Science', '2025-2026', 'Bernier, Ortiz and Yundt School', 'Geovanny Stiedemann', 'Engineer', '01828742365', 'father70@example.com', '2346715641864', NULL, 'Ivah Feil Sr.', 'Housewife', '01420407381', 'mother70@example.com', '1855315743773', NULL, 'Prof. Damon Schuppe', '01564514174', 'guardian70@example.com', '3382551282324', 'Sister', 1, 19, 1, '2026-01-22', NULL, 2025000070, 900070, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15', '127.0.0.1', 1, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15'),
(71, 'Stacy', 'Bernier', '2001-11-25', 'Male', 'A-', 'Christian', 'Bangladeshi', '9078335490965', '01667773258', 'student71@example.com', '$2y$12$g.widqd7uqtcwnXVwSmrFef6oFkfwe9hPJzjHminXZ3e2d3ubL6Ny', '63207 Larkin Branch\nNorth Ricardomouth, OR 93395', '8256 Larkin Pass Apt. 581\nSwifthaven, DE 25878', 'ADM-00071', '1975-11-24', 'B', 'Science', '2025-2026', 'Mayert-Bayer School', 'Augustus Wiza', 'Doctor', '01470134221', 'father71@example.com', '3780704162397', NULL, 'Emilia Bartell DVM', 'Businesswoman', '01475155076', 'mother71@example.com', '0166242315715', NULL, 'Prof. Dereck Legros', '01822418845', 'guardian71@example.com', '0752978325321', 'Aunt', 1, 18, 2, '2026-01-22', NULL, 2025000071, 900071, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15', '127.0.0.1', 1, NULL, '2026-01-22 06:00:15', '2026-01-22 06:00:15'),
(72, 'Greta', 'Grant', '2005-08-01', 'Male', 'AB+', 'Buddhist', 'Bangladeshi', '1659195081445', '01979405648', 'student72@example.com', '$2y$12$TCaB1dL3buquzza1KVb3..LHKs.nOFFc0qWmIp9WSz0WRzHhTS..y', '85395 Jermey Freeway\nNew Adrielhaven, AL 54122-3018', '812 Kris Stream Apt. 831\nRoobview, SC 64252-9050', 'ADM-00072', '1979-04-26', 'A', 'Arts', '2025-2026', 'Hoppe-Sanford School', 'Dr. Jordi Schuster DVM', 'Engineer', '01753709847', 'father72@example.com', '7213005233296', NULL, 'Mrs. Amira Klocko', 'Businesswoman', '01638008976', 'mother72@example.com', '4741853272315', NULL, 'Dr. Jake Sipes', '01576166875', 'guardian72@example.com', '8723238832160', 'Uncle', 1, 13, 5, '2026-01-22', NULL, 2025000072, 900072, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16', '127.0.0.1', 1, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16'),
(73, 'Gabriella', 'Kihn', '2005-12-22', 'Male', 'O-', 'Other', 'Bangladeshi', '7300538481445', '01460604732', 'student73@example.com', '$2y$12$hghsIoxLcn6k70XOAKmeTOPWTiVA80bKSBPtMnAU3kwt3BFVjfdjm', '96494 Bednar Alley\nGregville, ID 12086', '441 Caesar Road Suite 552\nLake Domenick, AR 46511', 'ADM-00073', '1974-03-12', 'A', 'Commerce', '2025-2026', 'Becker Ltd School', 'Andy Kshlerin MD', 'Businessman', '01308418375', 'father73@example.com', '6220891752777', NULL, 'Shana Feeney', 'Nurse', '01880832436', 'mother73@example.com', '7657642620302', NULL, 'Prof. Ryley Schimmel PhD', '01826721805', 'guardian73@example.com', '8811546865437', 'Sister', 1, 14, 5, '2026-01-22', NULL, 2025000073, 900073, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16', '127.0.0.1', 1, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16'),
(74, 'Jesus', 'Morissette', '2004-09-26', 'Female', 'A-', 'Hindu', 'Bangladeshi', '7124309149839', '01485603121', 'student74@example.com', '$2y$12$oU5IltDmnI.fcUrWS2m7q.ZlWBM4aUzKdnTfJhc/.Wqo/lR4J7G.u', '52042 Gusikowski Terrace\nNew Philipton, KY 88142-2140', '9054 Auer Causeway Apt. 311\nNew Henriport, CT 99114', 'ADM-00074', '2018-05-13', 'B', 'Arts', '2025-2026', 'Osinski Inc School', 'Prof. Mathias Feil', 'Doctor', '01408698638', 'father74@example.com', '4869535283616', NULL, 'Mrs. Euna Senger', 'Nurse', '01976759311', 'mother74@example.com', '2581569588820', NULL, 'Dr. Arvilla Lang MD', '01608231161', 'guardian74@example.com', '3348336644363', 'Sister', 1, 14, 4, '2026-01-22', NULL, 2025000074, 900074, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16', '127.0.0.1', 1, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16'),
(75, 'Preston', 'Wolff', '2019-07-23', 'Female', 'B-', 'Islam', 'Bangladeshi', '4908645513560', '01599055307', 'student75@example.com', '$2y$12$sb6RlouhnKZvbaxH1rRGOOCVet5b2BLv0XRRa6Sb6QE/yDRd1LYTC', '847 Christina Road\nHudsonbury, VT 40627', '617 King Cliff Suite 822\nWest Orinfort, IA 42310', 'ADM-00075', '2001-02-25', 'B', 'Commerce', '2025-2026', 'Daniel and Sons School', 'Caesar Kozey', 'Teacher', '01438206767', 'father75@example.com', '2207318330590', NULL, 'Ms. Bria Jakubowski', 'Businesswoman', '01522612424', 'mother75@example.com', '2968434094830', NULL, 'Mr. Stephon Kshlerin', '01829567797', 'guardian75@example.com', '9129858782654', 'Aunt', 1, 15, 4, '2026-01-22', NULL, 2025000075, 900075, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16', '127.0.0.1', 1, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16'),
(76, 'Antonina', 'Koelpin', '1995-02-24', 'Female', 'AB-', 'Other', 'Bangladeshi', '1125330894554', '01466243701', 'student76@example.com', '$2y$12$ivjI3aNXUudfmzJV65q3K.Va0.lbemMTFnNDJQeryCrRyVLqq6YhW', '849 Weissnat Way Suite 053\nRyanfurt, AZ 83382', '50694 Von Lane Apt. 160\nNew Zora, ND 96880-7350', 'ADM-00076', '2003-01-12', 'B', 'Science', '2025-2026', 'Ullrich PLC School', 'Prof. Carter Klein Sr.', 'Businessman', '01385857645', 'father76@example.com', '6265639740094', NULL, 'Prof. Palma Collins Sr.', 'Teacher', '01360149276', 'mother76@example.com', '9685421055762', NULL, 'Michael Jast', '01494753173', 'guardian76@example.com', '6110428417884', 'Brother', 1, 10, 3, '2026-01-22', NULL, 2025000076, 900076, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16', '127.0.0.1', 1, NULL, '2026-01-22 06:00:16', '2026-01-22 06:00:16'),
(77, 'Eden', 'Padberg', '2020-10-22', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '7921538006155', '01651946834', 'student77@example.com', '$2y$12$APVLj7YAkQCExTfEV8uzJ.KbxLVsm50674TNe5TfrZZaWMofHU5rG', '855 Lizzie Pine Apt. 872\nWest Vella, NE 55255', '16028 America Squares\nNorth June, ME 25988', 'ADM-00077', '2008-10-15', 'C', 'Commerce', '2025-2026', 'Deckow Inc School', 'Adrian Kulas', 'Engineer', '01500641337', 'father77@example.com', '0232324713326', NULL, 'Prof. Natalie Green I', 'Nurse', '01849461183', 'mother77@example.com', '5724563383425', NULL, 'Colton Hermann', '01382963475', 'guardian77@example.com', '1421864734246', 'Aunt', 1, 15, 5, '2026-01-22', NULL, 2025000077, 900077, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17', '127.0.0.1', 1, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17'),
(78, 'Lea', 'Howell', '1987-09-06', 'Other', 'A-', 'Buddhist', 'Bangladeshi', '8387896612100', '01835761110', 'student78@example.com', '$2y$12$UOg7qrFBNtfnhaKwmi0U3.RVTdTXvC0DAmTXQjNJkeap5rcYCY5M.', '665 Deshaun Burg\nLake Florencio, OK 78740-8158', '511 Hirthe Cape Apt. 697\nEast Dante, SD 82012', 'ADM-00078', '1984-12-02', 'A', 'Commerce', '2025-2026', 'Turner-Gutmann School', 'Mr. Marques Streich III', 'Teacher', '01989293926', 'father78@example.com', '0282335743196', NULL, 'Dr. Tomasa Walker PhD', 'Businesswoman', '01838839347', 'mother78@example.com', '8172033883740', NULL, 'Ofelia Walter', '01526915375', 'guardian78@example.com', '4307377044828', 'Grandparent', 1, 16, 5, '2026-01-22', NULL, 2025000078, 900078, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17', '127.0.0.1', 1, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17'),
(79, 'Carlos', 'Lueilwitz', '2023-02-05', 'Male', 'B+', 'Other', 'Bangladeshi', '5290246643496', '01594843886', 'student79@example.com', '$2y$12$XNGssw9oRW7jb9.1a9pbEeAECCddy5f1P9ZEEhgBfkiKKha1SZS4W', '4061 Considine Village Apt. 025\nRunteshire, NJ 11715', '7486 Conroy Inlet\nLake Enidport, KS 56336-9217', 'ADM-00079', '2002-04-21', 'B', 'Science', '2025-2026', 'Doyle Inc School', 'Wyman Hyatt', 'Engineer', '01323920656', 'father79@example.com', '0129963438135', NULL, 'Earlene Turner', 'Teacher', '01896332115', 'mother79@example.com', '4752261253017', NULL, 'Rudy Klocko', '01584804490', 'guardian79@example.com', '1531259440528', 'Sister', 1, 20, 1, '2026-01-22', NULL, 2025000079, 900079, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17', '127.0.0.1', 1, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17'),
(80, 'Marlon', 'Hackett', '1996-07-20', 'Female', 'A+', 'Islam', 'Bangladeshi', '3427292617436', '01641904339', 'student80@example.com', '$2y$12$rG40N.tzJNkxNefoJp0a9.XAo5VKjMmB8jusVZZiZeXVYcikJOvGW', '46000 Kub Spurs Apt. 206\nNorth Kamillestad, OK 60057-6717', '108 Ivah Cliffs\nEasterton, OR 32625-5710', 'ADM-00080', '2017-12-29', 'C', 'Commerce', '2025-2026', 'Gorczany, Lehner and Hermann School', 'Golden Wolff', 'Teacher', '01607448176', 'father80@example.com', '9182905157360', NULL, 'Miss America Smitham', 'Doctor', '01427313152', 'mother80@example.com', '9741506826633', NULL, 'Ms. Aimee Jaskolski', '01868243785', 'guardian80@example.com', '1688418594847', 'Uncle', 1, 19, 2, '2026-01-22', NULL, 2025000080, 900080, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17', '127.0.0.1', 1, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17'),
(81, 'Timmothy', 'Larson', '1970-11-11', 'Female', 'B+', 'Christian', 'Bangladeshi', '4111222317453', '01548199015', 'student81@example.com', '$2y$12$PId7fnp0QLJYGcmAF/OqdOjG9NOhwt.MROn5qpe3rIrOzcIUCMPry', '5113 Carter Brook Apt. 474\nWest Robbieland, WI 40589', '9000 Jedediah Drives Apt. 976\nJoannyberg, KS 16987', 'ADM-00081', '2019-10-10', 'B', 'Arts', '2025-2026', 'Wolff Inc School', 'Dr. Casimir Wisoky II', 'Teacher', '01671954412', 'father81@example.com', '0804586936195', NULL, 'Meaghan Crooks', 'Teacher', '01485460058', 'mother81@example.com', '2960288426805', NULL, 'Adrain Skiles', '01304038204', 'guardian81@example.com', '1639915688480', 'Aunt', 1, 11, 3, '2026-01-22', NULL, 2025000081, 900081, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17', '127.0.0.1', 1, NULL, '2026-01-22 06:00:17', '2026-01-22 06:00:17'),
(82, 'Oma', 'Spinka', '2021-12-21', 'Male', 'B-', 'Christian', 'Bangladeshi', '7161504113701', '01594787196', 'student82@example.com', '$2y$12$fgQdSW8VZMrbjSQathUV3uaMXsvshSlm.MSo.0B85u9FLQBtxQQq6', '8039 Isac Lane\nLake Willisborough, IA 15009-5381', '60305 Christiansen Crest Apt. 697\nLanechester, MT 56827-7703', 'ADM-00082', '2023-08-19', 'C', 'Arts', '2025-2026', 'Pouros, Waters and Ziemann School', 'Barton Davis', 'Engineer', '01481460391', 'father82@example.com', '0985489622726', NULL, 'Dr. Angelina Dibbert V', 'Teacher', '01711560437', 'mother82@example.com', '1793182601000', NULL, 'Dr. Giuseppe Kihn', '01671861651', 'guardian82@example.com', '4404247877975', 'Brother', 1, 17, 5, '2026-01-22', NULL, 2025000082, 900082, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18', '127.0.0.1', 1, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18'),
(83, 'Arlene', 'Kihn', '2014-02-16', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '7632619981602', '01893052156', 'student83@example.com', '$2y$12$/Y6/Aj773DZUW1C2Hrk3X.jVTcm7tMA0UlIz9WXnU5eohuZzld1jS', '54999 Lesch Trail\nLake Darleneville, NJ 02255-6173', '369 Quinn Summit Suite 666\nPort Janiston, NV 99943', 'ADM-00083', '2020-10-12', 'B', 'Commerce', '2025-2026', 'Moen-Ratke School', 'Prof. Giuseppe Hessel MD', 'Doctor', '01912050958', 'father83@example.com', '2640776180185', NULL, 'Crystel Kirlin IV', 'Businesswoman', '01736587508', 'mother83@example.com', '3378345063335', NULL, 'Vernice Heathcote', '01911906500', 'guardian83@example.com', '6785115711332', 'Sister', 1, 18, 5, '2026-01-22', NULL, 2025000083, 900083, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18', '127.0.0.1', 1, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18'),
(84, 'Kelsie', 'Oberbrunner', '1975-04-30', 'Female', 'B+', 'Islam', 'Bangladeshi', '1165590278445', '01352439907', 'student84@example.com', '$2y$12$EEF5hyVgQqAqVhJjeIm0jeWalBSI1HNa.XNJPhjmt6.EHepBWRmHS', '792 Marianne Prairie Suite 524\nWindlerton, SD 79173', '334 Jenkins Radial\nSouth Virginia, GA 90201-1384', 'ADM-00084', '1991-07-10', 'C', 'Arts', '2025-2026', 'Lemke-Gottlieb School', 'Alec Rohan Jr.', 'Businessman', '01905005437', 'father84@example.com', '4580309142849', NULL, 'Dannie Skiles I', 'Doctor', '01389622663', 'mother84@example.com', '5076057327141', NULL, 'Delphia Skiles', '01721826439', 'guardian84@example.com', '2186544483146', 'Aunt', 1, 21, 1, '2026-01-22', NULL, 2025000084, 900084, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18', '127.0.0.1', 1, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18'),
(85, 'Aurelie', 'Fritsch', '2016-12-08', 'Other', 'AB+', 'Christian', 'Bangladeshi', '3477318141371', '01736781864', 'student85@example.com', '$2y$12$WrZNMOj524HEswBP0AEZauFy4cAgWaGlQhe/PbPWP60ZSTQcMQZ5G', '11977 Jacobi Burg Apt. 639\nNorth Gunner, NJ 22289-0575', '74935 Anita Valleys\nHermannchester, NE 50579', 'ADM-00085', '2007-05-29', 'A', 'Science', '2025-2026', 'Doyle, Connelly and Gottlieb School', 'Gideon Jerde', 'Businessman', '01487598842', 'father85@example.com', '9165564630112', NULL, 'Jalyn Johnston', 'Nurse', '01781148222', 'mother85@example.com', '7940428009256', NULL, 'Wilburn Abbott', '01593416241', 'guardian85@example.com', '1943939658422', 'Uncle', 1, 19, 5, '2026-01-22', NULL, 2025000085, 900085, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18', '127.0.0.1', 1, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18'),
(86, 'Julie', 'Blick', '2005-08-27', 'Female', 'AB-', 'Buddhist', 'Bangladeshi', '2072876802810', '01661838908', 'student86@example.com', '$2y$12$XUYXf8oCr/aSQRLbpfW5O.7AvkN7j6qCUEB.ECLN8747DXYxH62tG', '946 Era Track Apt. 812\nNew Urbantown, MA 64873-0436', '74215 Alexander Loop\nMekhiport, SC 65364-8501', 'ADM-00086', '1986-10-17', 'B', 'Science', '2025-2026', 'Jaskolski PLC School', 'Prof. Troy Medhurst Jr.', 'Engineer', '01832327039', 'father86@example.com', '9708408321684', NULL, 'Annamarie Ruecker', 'Businesswoman', '01568975688', 'mother86@example.com', '8610940982459', NULL, 'Sarai Greenfelder', '01390829740', 'guardian86@example.com', '7991012458516', 'Grandparent', 1, 20, 2, '2026-01-22', NULL, 2025000086, 900086, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18', '127.0.0.1', 1, NULL, '2026-01-22 06:00:18', '2026-01-22 06:00:18'),
(87, 'Sienna', 'Bradtke', '2015-06-27', 'Other', 'AB-', 'Other', 'Bangladeshi', '7231778446934', '01959335758', 'student87@example.com', '$2y$12$H2FNi8jbecTNp45EPTWa6epIJu7OPlZBuyxjGaeqkEpk.F/4kxp1G', '6297 VonRueden Forge Apt. 340\nMyleschester, OR 14807', '69327 McKenzie Flat Suite 942\nBoganport, NV 06829', 'ADM-00087', '1994-05-07', 'C', 'Commerce', '2025-2026', 'Effertz-Corwin School', 'Akeem Senger DDS', 'Doctor', '01774160189', 'father87@example.com', '0924201922674', NULL, 'Miss Hertha Torphy DVM', 'Housewife', '01397558912', 'mother87@example.com', '5697281190947', NULL, 'Rashawn Casper', '01697806498', 'guardian87@example.com', '6351068830947', 'Sister', 1, 21, 2, '2026-01-22', NULL, 2025000087, 900087, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19', '127.0.0.1', 1, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19'),
(88, 'Brayan', 'Schiller', '2012-08-07', 'Other', 'O-', 'Other', 'Bangladeshi', '8802490978919', '01412764907', 'student88@example.com', '$2y$12$WelwPnR46N3.O2FSLGLsEu5OOnKNJZvDsHlkGggwTw4trURJ/MJka', '41390 Zemlak Mission\nWest Caleigh, NJ 59729-8951', '8708 Billie Mountain Apt. 293\nDamianbury, TN 65383-5576', 'ADM-00088', '2012-10-04', 'A', 'Arts', '2025-2026', 'Greenfelder-Feest School', 'Dr. Otho Breitenberg', 'Doctor', '01377863702', 'father88@example.com', '9159872911367', NULL, 'Cydney Schimmel', 'Nurse', '01738213034', 'mother88@example.com', '8746572849173', NULL, 'Mr. Johnathan Medhurst V', '01556832381', 'guardian88@example.com', '1662455515784', 'Brother', 1, 12, 3, '2026-01-22', NULL, 2025000088, 900088, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19', '127.0.0.1', 1, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19'),
(89, 'Judah', 'Adams', '1985-05-29', 'Other', 'A+', 'Islam', 'Bangladeshi', '7392405554523', '01760733281', 'student89@example.com', '$2y$12$/0yxIyWx4lL9irZG/r5y9.3ff6h0oydOz5jmkCIT/gDPV/MPuG5RK', '99744 Kunze Forge\nLake Saulside, VA 75375', '60241 Wolf Lock\nPort Andy, IN 05518', 'ADM-00089', '2024-07-21', 'B', 'Science', '2025-2026', 'Hoeger PLC School', 'Mr. Abraham Jerde MD', 'Doctor', '01719459623', 'father89@example.com', '5594141037152', NULL, 'Prof. Bettye Waelchi II', 'Doctor', '01352942814', 'mother89@example.com', '1881750877391', NULL, 'Gregg Dare', '01618119301', 'guardian89@example.com', '1247652196563', 'Brother', 1, 16, 4, '2026-01-22', NULL, 2025000089, 900089, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19', '127.0.0.1', 1, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19'),
(90, 'Jeramie', 'Wisoky', '1971-07-31', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '0364338032494', '01691630517', 'student90@example.com', '$2y$12$RBZ8gGJcEM/ano.vsr4TnOnPYXsQ55zLwEDm5JauW7jy6m2wPrCzi', '19982 Dickinson Throughway Apt. 438\nNorth Juliechester, IL 86507-5730', '152 Margarette Trafficway Suite 133\nTrompberg, UT 71507', 'ADM-00090', '1993-01-29', 'B', 'Science', '2025-2026', 'Wyman Group School', 'Geoffrey Hickle', 'Doctor', '01663678607', 'father90@example.com', '3342273829585', NULL, 'Jessyca Pagac PhD', 'Teacher', '01586298209', 'mother90@example.com', '4232625701759', NULL, 'Miss Lyla Mohr DDS', '01554179776', 'guardian90@example.com', '2733711851006', 'Brother', 1, 22, 1, '2026-01-22', NULL, 2025000090, 900090, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19', '127.0.0.1', 1, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19'),
(91, 'Monroe', 'Sawayn', '2002-09-02', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '7759198386620', '01894728746', 'student91@example.com', '$2y$12$TS25/Y0a34ImNcOGxTyan.ZCUa3qO0BAaXaW8lKm0H69a2jNDtjma', '740 Eichmann Parkway Apt. 725\nDonavonton, FL 64283-0958', '95187 Scottie Lock Apt. 499\nPort Keara, DC 70730-8732', 'ADM-00091', '1982-03-18', 'B', 'Commerce', '2025-2026', 'Veum Ltd School', 'Orlo Huels', 'Farmer', '01968847169', 'father91@example.com', '1592906856159', NULL, 'Earlene Schroeder', 'Nurse', '01888968805', 'mother91@example.com', '4599886119893', NULL, 'Dr. Ramon Herman Sr.', '01752779035', 'guardian91@example.com', '8037574098613', 'Sister', 1, 20, 5, '2026-01-22', NULL, 2025000091, 900091, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19', '127.0.0.1', 1, NULL, '2026-01-22 06:00:19', '2026-01-22 06:00:19'),
(92, 'Trevion', 'Kemmer', '1981-01-02', 'Male', 'AB-', 'Other', 'Bangladeshi', '4824253343876', '01733822235', 'student92@example.com', '$2y$12$G42kfL4IDoFZocuYQ9/gpOyvndKvJiP3vSTU1CFZz4jOqIK0bdnOC', '6470 Oberbrunner Mountain Suite 414\nCraigton, AL 33363-0427', '8472 Shanny Vista Suite 541\nRobelland, AK 70885', 'ADM-00092', '1977-10-22', 'A', 'Arts', '2025-2026', 'Schaefer, Hills and Abernathy School', 'Fabian Sanford IV', 'Engineer', '01619330754', 'father92@example.com', '0757931897327', NULL, 'Selina Kub', 'Nurse', '01495494879', 'mother92@example.com', '7830745009348', NULL, 'Dr. Robb Larson Sr.', '01472521683', 'guardian92@example.com', '3958482567808', 'Sister', 1, 22, 2, '2026-01-22', NULL, 2025000092, 900092, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20', '127.0.0.1', 1, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20'),
(93, 'Nico', 'Torp', '2010-01-06', 'Male', 'O+', 'Buddhist', 'Bangladeshi', '5277977529948', '01542157104', 'student93@example.com', '$2y$12$InFW3IVuBolhjbQiT.xeBunBwYxPs33aCZzuJ7fSoEs472eVG7xdq', '179 Bradley Squares Suite 550\nIrvingville, MA 99355-3683', '8667 Wisoky Lake Apt. 263\nChamplinberg, TX 02898', 'ADM-00093', '1982-01-24', 'B', 'Commerce', '2025-2026', 'Moen-Spencer School', 'Prof. Gus Morissette', 'Farmer', '01535388159', 'father93@example.com', '6128480840615', NULL, 'Angelica Schaefer I', 'Doctor', '01495114736', 'mother93@example.com', '3466917633845', NULL, 'Christian Schowalter', '01577633187', 'guardian93@example.com', '1786756965026', 'Sister', 1, 17, 4, '2026-01-22', NULL, 2025000093, 900093, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20', '127.0.0.1', 1, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20'),
(94, 'Hayley', 'Bradtke', '1976-12-28', 'Female', 'O-', 'Other', 'Bangladeshi', '5947029758108', '01408102767', 'student94@example.com', '$2y$12$a.UQSsy7HyRV9sBPOm4qpuxxuUxYeCqgzwowsmkX/JH6n/WqIrkHO', '65631 Delphia Estate\nEast Maurine, DE 73022-8267', '4536 Maggio Canyon Apt. 147\nPort Katelinberg, MA 85570', 'ADM-00094', '1997-08-05', 'B', 'Arts', '2025-2026', 'Bashirian PLC School', 'Hugh Wisoky', 'Farmer', '01491668357', 'father94@example.com', '0797806433867', NULL, 'Judy Bradtke', 'Nurse', '01407145622', 'mother94@example.com', '9342830939474', NULL, 'Donna Gaylord', '01537761784', 'guardian94@example.com', '8005910664400', 'Grandparent', 1, 23, 1, '2026-01-22', NULL, 2025000094, 900094, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20', '127.0.0.1', 1, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20'),
(95, 'Charlene', 'Wisozk', '1996-06-14', 'Other', 'A-', 'Christian', 'Bangladeshi', '1209979366324', '01500289779', 'student95@example.com', '$2y$12$ajHpV6PP1LutyctqkGRase5G4QOx85POKLYijOzSaTHzPL.6r5tqO', '8242 Unique Pines Suite 758\nNew Aryannatown, AR 19509', '7441 Pablo Keys\nEratown, UT 02950', 'ADM-00095', '1984-05-09', 'B', 'Commerce', '2025-2026', 'Weber Ltd School', 'Hector Feil', 'Farmer', '01639398006', 'father95@example.com', '3414587379226', NULL, 'Dr. Margarett Bode', 'Housewife', '01667079056', 'mother95@example.com', '8117383329923', NULL, 'Mrs. Agnes Bailey', '01975085713', 'guardian95@example.com', '4373164738207', 'Brother', 1, 18, 4, '2026-01-22', NULL, 2025000095, 900095, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20', '127.0.0.1', 1, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20'),
(96, 'Lenna', 'Willms', '1975-11-23', 'Other', 'O+', 'Christian', 'Bangladeshi', '5940519296975', '01689567507', 'student96@example.com', '$2y$12$oyqlNqKE.uhtx71dNnypBu/AgxkBq4dYW9Qz9AFFYPxORCJz8QibO', '93014 Yost Streets Apt. 812\nKiarraside, SD 93010', '3315 Shanahan Garden Suite 627\nConradside, VA 99465-4467', 'ADM-00096', '1986-04-11', 'A', 'Arts', '2025-2026', 'Lind, Heidenreich and Heaney School', 'Mohamed Bashirian', 'Farmer', '01651911119', 'father96@example.com', '4442678065627', NULL, 'Araceli Larson DDS', 'Doctor', '01827919392', 'mother96@example.com', '1129265513290', NULL, 'Hank Harris', '01911969071', 'guardian96@example.com', '9161952064092', 'Grandparent', 1, 24, 1, '2026-01-22', NULL, 2025000096, 900096, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20', '127.0.0.1', 1, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20'),
(97, 'Helmer', 'Stroman', '2004-04-25', 'Female', 'O+', 'Christian', 'Bangladeshi', '3723762508580', '01715808567', 'student97@example.com', '$2y$12$/GrXa7vR9yFZ/VRa/dgOheRuUlj0R1.nWhIMpAar0Uu/9bpUoUwJq', '3882 Madison Forges\nNorth Corrine, MN 42886-6423', '6134 Kuhic Union\nSouth Sidneyside, IN 86859-8099', 'ADM-00097', '1987-08-14', 'B', 'Science', '2025-2026', 'Bashirian, Jaskolski and Bins School', 'Prof. Bernie Langworth DDS', 'Teacher', '01627288281', 'father97@example.com', '6575957139494', NULL, 'Alexandrine Dicki MD', 'Housewife', '01757174586', 'mother97@example.com', '6711840589464', NULL, 'Fae Swaniawski PhD', '01720807007', 'guardian97@example.com', '8092584724648', 'Uncle', 1, 13, 3, '2026-01-22', NULL, 2025000097, 900097, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20', '127.0.0.1', 1, NULL, '2026-01-22 06:00:20', '2026-01-22 06:00:20'),
(98, 'Vince', 'Wisoky', '2012-05-09', 'Female', 'AB+', 'Other', 'Bangladeshi', '3192531215107', '01376311936', 'student98@example.com', '$2y$12$2J/iweQFchT6qyzaAaXIGOE0tDQ4NV0EUDDQOy915lBR99qiqTQnC', '5656 Karli Greens Suite 670\nNorbertstad, IN 23950-7287', '1860 Franecki Parkway Apt. 570\nBretburgh, MN 34164', 'ADM-00098', '2008-08-04', 'A', 'Commerce', '2025-2026', 'Maggio, Haley and Walsh School', 'Keshawn Larkin II', 'Doctor', '01496190967', 'father98@example.com', '4225638420734', NULL, 'Minerva Klocko', 'Nurse', '01410606436', 'mother98@example.com', '3289959505170', NULL, 'Mrs. Aurelie Maggio Sr.', '01815083754', 'guardian98@example.com', '6229069888644', 'Uncle', 1, 14, 3, '2026-01-22', NULL, 2025000098, 900098, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:21', '2026-01-22 06:00:21', '127.0.0.1', 1, NULL, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(99, 'Shyanne', 'Hayes', '2007-06-29', 'Other', 'B-', 'Hindu', 'Bangladeshi', '2803584158800', '01943834076', 'student99@example.com', '$2y$12$SY8C3AC3pEZfScD8JeyzaeGTb5gG6LKUquOK17g2NZrhhJTcWz6Qi', '7900 Kelly Vista\nBaumbachtown, WV 72383-9427', '41938 Emmet Plains Suite 829\nNorth Mellie, OK 90309-6633', 'ADM-00099', '1997-04-24', 'C', 'Commerce', '2025-2026', 'Bruen, Schulist and Greenholt School', 'Ola Senger', 'Businessman', '01343980610', 'father99@example.com', '0234787824300', NULL, 'Dr. Reba Hessel', 'Nurse', '01879686893', 'mother99@example.com', '6895226148245', NULL, 'Tia Yundt', '01618569882', 'guardian99@example.com', '8591385530079', 'Brother', 1, 25, 1, '2026-01-22', NULL, 2025000099, 900099, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:21', '2026-01-22 06:00:21', '127.0.0.1', 1, NULL, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(100, 'Oren', 'Koelpin', '2012-07-28', 'Male', 'O+', 'Christian', 'Bangladeshi', '0883891371566', '01671385950', 'student100@example.com', '$2y$12$9zwlryGzj.VTV6fdf6PyxuhHItR1vXWlq5gOoYucc6Gf5qwgOBySO', '97250 Gilbert Dam\nKarlland, OK 64203-5558', '14202 Powlowski Ranch Suite 616\nOnaport, CO 26408', 'ADM-00100', '2019-05-08', 'B', 'Commerce', '2025-2026', 'Streich-Baumbach School', 'Dr. Camryn Murphy', 'Doctor', '01615098419', 'father100@example.com', '0283153882782', NULL, 'Mrs. Greta Rogahn', 'Doctor', '01971617014', 'mother100@example.com', '3105282008258', NULL, 'Mr. Wilson Corkery', '01924246073', 'guardian100@example.com', '4585119010733', 'Brother', 1, 26, 1, '2026-01-22', NULL, 2025000100, 900100, NULL, NULL, NULL, NULL, NULL, '2026-01-22 06:00:21', '2026-01-22 06:00:21', '127.0.0.1', 1, NULL, '2026-01-22 06:00:21', '2026-01-22 06:00:21');

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
(1, '2026-01-22', 1, '06:30:00', 1, '10:00', 'Fajar, Johar, Asor, Magrim & Asha', '2 hrs', '1 hrs', '4 hrs', '00:30:00', 6, 'N/A', '2026-01-22 07:28:54', '2026-01-22 07:28:54');

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
(1, 8, 1, '2026-01-22 06:19:28', '2026-01-22 06:19:28'),
(2, 10, 1, '2026-01-22 06:19:30', '2026-01-22 06:19:30'),
(3, 12, 1, '2026-01-22 06:19:33', '2026-01-22 06:19:33'),
(4, 15, 1, '2026-01-22 06:19:37', '2026-01-22 06:19:37'),
(5, 22, 1, '2026-01-22 06:19:41', '2026-01-22 06:19:41'),
(6, 23, 1, '2026-01-22 06:19:44', '2026-01-22 06:19:44'),
(7, 29, 1, '2026-01-22 06:19:48', '2026-01-22 06:19:48'),
(8, 41, 1, '2026-01-22 06:19:52', '2026-01-22 06:19:52'),
(9, 43, 1, '2026-01-22 06:19:55', '2026-01-22 06:19:55'),
(10, 46, 1, '2026-01-22 06:19:58', '2026-01-22 06:19:58'),
(11, 8, 2, '2026-01-22 06:43:24', '2026-01-22 06:43:24'),
(12, 10, 2, '2026-01-22 06:43:27', '2026-01-22 06:43:27'),
(13, 12, 2, '2026-01-22 06:43:30', '2026-01-22 06:43:30'),
(14, 15, 2, '2026-01-22 06:43:33', '2026-01-22 06:43:33'),
(15, 22, 2, '2026-01-22 06:43:36', '2026-01-22 06:43:36'),
(16, 23, 2, '2026-01-22 06:46:05', '2026-01-22 06:46:05'),
(17, 29, 2, '2026-01-22 06:46:09', '2026-01-22 06:46:09'),
(18, 41, 2, '2026-01-22 06:46:14', '2026-01-22 06:46:14'),
(19, 43, 2, '2026-01-22 06:46:17', '2026-01-22 06:46:17'),
(20, 46, 2, '2026-01-22 06:46:21', '2026-01-22 06:46:21'),
(21, 8, 3, '2026-01-22 07:20:01', '2026-01-22 07:20:01'),
(22, 8, 4, '2026-01-22 07:20:03', '2026-01-22 07:20:03'),
(23, 8, 5, '2026-01-22 07:20:04', '2026-01-22 07:20:04'),
(24, 8, 6, '2026-01-22 07:20:05', '2026-01-22 07:20:05'),
(25, 8, 7, '2026-01-22 07:20:06', '2026-01-22 07:20:06'),
(26, 10, 3, '2026-01-22 07:20:09', '2026-01-22 07:20:09'),
(27, 10, 5, '2026-01-22 07:20:10', '2026-01-22 07:20:10'),
(28, 10, 7, '2026-01-22 07:20:11', '2026-01-22 07:20:11'),
(29, 10, 4, '2026-01-22 07:20:13', '2026-01-22 07:20:13'),
(30, 10, 6, '2026-01-22 07:20:14', '2026-01-22 07:20:14'),
(31, 12, 3, '2026-01-22 07:20:17', '2026-01-22 07:20:17'),
(32, 12, 5, '2026-01-22 07:20:17', '2026-01-22 07:20:17'),
(33, 12, 7, '2026-01-22 07:20:18', '2026-01-22 07:20:18'),
(34, 12, 4, '2026-01-22 07:20:20', '2026-01-22 07:20:20'),
(35, 12, 6, '2026-01-22 07:20:21', '2026-01-22 07:20:21'),
(36, 15, 3, '2026-01-22 07:20:23', '2026-01-22 07:20:23'),
(37, 15, 5, '2026-01-22 07:20:24', '2026-01-22 07:20:24'),
(38, 15, 7, '2026-01-22 07:20:25', '2026-01-22 07:20:25'),
(39, 15, 4, '2026-01-22 07:20:26', '2026-01-22 07:20:26'),
(40, 15, 6, '2026-01-22 07:20:27', '2026-01-22 07:20:27'),
(41, 22, 3, '2026-01-22 07:20:32', '2026-01-22 07:20:32'),
(42, 22, 5, '2026-01-22 07:20:33', '2026-01-22 07:20:33'),
(43, 22, 7, '2026-01-22 07:20:34', '2026-01-22 07:20:34'),
(44, 22, 4, '2026-01-22 07:20:35', '2026-01-22 07:20:35'),
(45, 22, 6, '2026-01-22 07:20:37', '2026-01-22 07:20:37');

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
(1, 'Bangla', 1, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(2, 'English', 1, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(3, 'ICT', 1, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(4, 'Physical Education', 1, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(5, 'Physics', 2, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(6, 'Chemistry', 2, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(7, 'Biology', 2, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(8, 'Higher Mathematics', 2, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(9, 'Accounting', 3, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(10, 'Business Organization & Management', 3, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(11, 'Finance, Banking & Insurance', 3, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(12, 'Production Management & Marketing', 3, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(13, 'Logic', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(14, 'History', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(15, 'Civics', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(16, 'Economics', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(17, 'Islamic Studies', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(18, 'Sociology', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(19, 'Social Work', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(20, 'Geography', 4, 1, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(21, 'Bangla', 1, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(22, 'English', 1, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(23, 'ICT', 1, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(24, 'Physical Education', 1, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(25, 'Physics', 2, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(26, 'Chemistry', 2, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(27, 'Biology', 2, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(28, 'Higher Mathematics', 2, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(29, 'Accounting', 3, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(30, 'Business Organization & Management', 3, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(31, 'Finance, Banking & Insurance', 3, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(32, 'Production Management & Marketing', 3, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(33, 'Logic', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(34, 'History', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(35, 'Civics', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(36, 'Economics', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(37, 'Islamic Studies', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(38, 'Sociology', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(39, 'Social Work', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(40, 'Geography', 4, 2, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(41, 'Bangla', 1, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(42, 'English', 1, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(43, 'ICT', 1, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(44, 'Physical Education', 1, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(45, 'Physics', 2, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(46, 'Chemistry', 2, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(47, 'Biology', 2, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(48, 'Higher Mathematics', 2, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(49, 'Accounting', 3, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(50, 'Business Organization & Management', 3, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(51, 'Finance, Banking & Insurance', 3, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(52, 'Production Management & Marketing', 3, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(53, 'Logic', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(54, 'History', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(55, 'Civics', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(56, 'Economics', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(57, 'Islamic Studies', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(58, 'Sociology', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(59, 'Social Work', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(60, 'Geography', 4, 3, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(61, 'Bangla', 1, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(62, 'English', 1, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(63, 'ICT', 1, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(64, 'Physical Education', 1, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(65, 'Physics', 2, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(66, 'Chemistry', 2, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(67, 'Biology', 2, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(68, 'Higher Mathematics', 2, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(69, 'Accounting', 3, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(70, 'Business Organization & Management', 3, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(71, 'Finance, Banking & Insurance', 3, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(72, 'Production Management & Marketing', 3, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(73, 'Logic', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(74, 'History', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(75, 'Civics', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(76, 'Economics', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(77, 'Islamic Studies', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(78, 'Sociology', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(79, 'Social Work', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(80, 'Geography', 4, 4, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(81, 'Bangla', 1, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(82, 'English', 1, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(83, 'ICT', 1, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(84, 'Physical Education', 1, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(85, 'Physics', 2, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(86, 'Chemistry', 2, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(87, 'Biology', 2, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(88, 'Higher Mathematics', 2, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(89, 'Accounting', 3, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(90, 'Business Organization & Management', 3, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(91, 'Finance, Banking & Insurance', 3, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(92, 'Production Management & Marketing', 3, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(93, 'Logic', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(94, 'History', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(95, 'Civics', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(96, 'Economics', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(97, 'Islamic Studies', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(98, 'Sociology', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(99, 'Social Work', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21'),
(100, 'Geography', 4, 5, '2026-01-22 06:00:21', '2026-01-22 06:00:21');

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
(1, 'Loraine', 'O\'Connell', '1999-01-31', 'Male', 'B+', '5597330063542', '01529952094', 'teacher0@example.com', '$2y$12$EzIcW6H9g36UMsmo33YUVOVZoZgLIH3Uq7s0t69HDaCwvubm.qWB.', 'Senior Teacher', '72062 Hilpert Turnpike Suite 335\nIsomfort, ME 04115', 'Leon Batz V', '01428945205', 'Verla McKenzie', '01483558077', 'Mr. Austyn Rodriguez', '01605983358', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:57', '2026-01-22 05:59:57', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:57', '2026-01-22 05:59:57'),
(2, 'Daisy', 'Bauch', '1976-07-04', 'Male', 'AB+', '7560627904696', '01582232177', 'teacher1@example.com', '$2y$12$qar.Vrdxuvl1ml6z8Dh2wO.zYkU119VrpKXqfy6rAYH7ZKKAHIokW', 'Head of Department', '66542 West Cliff\nMorarfort, AK 40989-4713', 'Prof. Nels Hauck III', '01859383270', 'Ms. Jazmyn Sawayn', '01331227496', 'Cara Rutherford', '01429461047', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:57', '2026-01-22 05:59:57', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:57', '2026-01-22 05:59:57'),
(3, 'Rollin', 'Graham', '1990-04-20', 'Male', 'B-', '2908897135232', '01706034130', 'teacher2@example.com', '$2y$12$vNpGAE6peq5z/mJilD93oeETVtTF5rrfElxUTzNYcf9ioJKHmym3O', 'Lecturer', '352 Bette Course\nDarionbury, HI 22804-2240', 'Lenny Bradtke', '01783688561', 'Adrianna Rutherford', '01715720546', 'Amara Jaskolski', '01595501259', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:57', '2026-01-22 05:59:57', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:57', '2026-01-22 05:59:57'),
(4, 'Roderick', 'Armstrong', '1987-07-30', 'Female', 'AB+', '4482578774119', '01318709386', 'teacher3@example.com', '$2y$12$Ro3EomVz6NZaBq9gH.mBxOeznzvM7OqDySOfmfQ4A4s6rtJZJ1YKy', 'Lecturer', '5832 Prudence Centers\nEast Quentin, NE 24414', 'Franco Bartoletti', '01842931603', 'Prof. Haylee Weimann III', '01891365027', 'Connor Hamill', '01949701701', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:57', '2026-01-22 05:59:57', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:57', '2026-01-22 05:59:57'),
(5, 'Kathryn', 'Purdy', '1997-11-27', 'Female', 'B+', '0193213478126', '01676352844', 'teacher4@example.com', '$2y$12$ZjMjT3ONCQGH6d7BaPmX7.xjAtn0Ri6rXic26Z7PPZrpj/CTa7Nhm', 'Head of Department', '887 Matilde Grove\nAnnamarieberg, NE 33667', 'Mr. Jermain Dicki V', '01667055557', 'Tatyana Von', '01675286747', 'Coleman Cassin', '01332676864', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:58', '2026-01-22 05:59:58', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:58', '2026-01-22 05:59:58'),
(6, 'Lurline', 'Crist', '1981-05-11', 'Male', 'B-', '0075474640926', '01405832553', 'teacher5@example.com', '$2y$12$ThJVuPXtgPNC70uUOkR4Z.0sWGHq/dE150.yaFmOqko4rcBo8HvoK', 'Head of Department', '50532 Doyle Lodge Suite 198\nPort Otto, PA 20193', 'Nicola Hilpert IV', '01617946980', 'Ms. Selena Simonis Jr.', '01762016514', 'Sister Mosciski', '01592418350', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:58', '2026-01-22 05:59:58', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:58', '2026-01-22 05:59:58'),
(7, 'Iliana', 'Grant', '1984-08-08', 'Female', 'AB-', '1973098989351', '01507620553', 'teacher6@example.com', '$2y$12$4D6uBamrUZd1JyM0H2QApuQz/eO5qJTkbmCAeaDlTDjClzOCKvLE6', 'Head of Department', '353 Ernser Plain\nWest Jordanstad, NJ 58255', 'Dr. Carmine Kessler', '01910055365', 'Dasia Mosciski', '01712309717', 'Ellis Herzog', '01881856612', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:58', '2026-01-22 05:59:58', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:58', '2026-01-22 05:59:58'),
(8, 'Antwon', 'Lindgren', '1997-04-06', 'Male', 'O+', '9759560610876', '01949716168', 'teacher7@example.com', '$2y$12$R.dSCCbihnimy7B.wsQwUu7IYkAYmhYdiY0I/dCzDxqUVs1oyjBWC', 'Lecturer', '55751 Merl Burgs\nNew Kearabury, CO 71005', 'Kaden McClure', '01789977069', 'Avis Gutmann', '01854067115', 'Ida Roob', '01967800774', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:58', '2026-01-22 05:59:58', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:58', '2026-01-22 05:59:58'),
(9, 'Aubrey', 'Bartoletti', '1992-06-19', 'Male', 'O-', '8353001596911', '01641842703', 'teacher8@example.com', '$2y$12$Kjze9QsJWFU2C1CZ20tiHO0jdKDmuBON3OVFd/xg4yomBpi.t9Om6', 'Head of Department', '60061 Zboncak Rapids Apt. 177\nPort Merlinville, WV 82582-1338', 'Reggie Bradtke', '01614408150', 'Trudie Carroll', '01865082113', 'Angelita Walsh', '01782832955', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:58', '2026-01-22 05:59:58', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:58', '2026-01-22 05:59:58'),
(10, 'Nickolas', 'Abernathy', '1994-12-04', 'Male', 'O-', '6333371150377', '01872311651', 'teacher9@example.com', '$2y$12$lCDyFNUo8U1jViKFWCaFuepFYMWuFnmpFHfsPLCQPtakyp1TJsjbO', 'Assistant Professor', '68169 Ike Gardens Suite 373\nQueenieview, OR 75876-0845', 'Liam Langosh', '01632003404', 'Madelynn Crist', '01805233592', 'Marcelina Fisher', '01754525274', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:59', '2026-01-22 05:59:59', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:59', '2026-01-22 05:59:59'),
(11, 'Adalberto', 'Rohan', '1994-11-29', 'Male', 'B-', '3469414418413', '01704934909', 'teacher10@example.com', '$2y$12$WEMIieEhI2EArgetSw7CfO9/6WsJ63Lvm7bncV8P/dKZrAC.GaYT2', 'Assistant Professor', '704 Gerard Divide Suite 264\nNorth Charlie, AR 78662-7366', 'Dayton Jast', '01938370811', 'Romaine Little PhD', '01306387792', 'Prof. Seth Parisian', '01507414588', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:59', '2026-01-22 09:32:29', '127.0.0.1', 1, NULL, NULL, 'sQ6vpoSnI33rujbyDbsUYD8z0inYqTcHbOTtlEEaqnCzaBEtiVhUs9DNZfyC', '2026-01-22 05:59:59', '2026-01-22 09:32:29'),
(12, 'Delbert', 'Romaguera', '1994-07-07', 'Male', 'A+', '9115965678078', '01553393977', 'teacher11@example.com', '$2y$12$haFgiu3WNy46oittGHQVyuY9isDO08ugToXOdw5hqmE3d8x9RZJMq', 'Assistant Professor', '1466 Murphy Loop Apt. 514\nFreemanside, ND 08683', 'Noe White', '01615838311', 'Ms. Christelle Morissette', '01397908102', 'Ila Orn', '01614544550', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:59', '2026-01-22 05:59:59', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:59', '2026-01-22 05:59:59'),
(13, 'William', 'Welch', '2000-05-25', 'Male', 'AB+', '9511992078470', '01999261398', 'teacher12@example.com', '$2y$12$YbkcGXmWxQVsNbjwQVN1keuJo92I3644AXZGMDjy4MEandxRrOMx2', 'Lecturer', '6124 VonRueden Junctions\nMaureenbury, MA 89784-6638', 'Davin Parisian DDS', '01385770738', 'Mattie Prohaska IV', '01999540366', 'Concepcion Hill', '01554157228', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:59', '2026-01-22 05:59:59', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:59', '2026-01-22 05:59:59'),
(14, 'Ivah', 'Stehr', '1986-12-21', 'Female', 'B+', '1415878382008', '01498546187', 'teacher13@example.com', '$2y$12$h0OBe1i.v7.g4kjBLwP.UOJMqfamCfPdhM4ZNfFkJBor0eTQimSTW', 'Assistant Professor', '1579 Runolfsson Corners Apt. 407\nWest Jaydenmouth, AZ 91364-2904', 'Gust Kuhlman', '01856873247', 'Yvonne Kunde', '01458129771', 'Aleen Keebler', '01920416729', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:59', '2026-01-22 05:59:59', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:59', '2026-01-22 05:59:59'),
(15, 'Dennis', 'Erdman', '1972-03-29', 'Male', 'AB+', '9522040014886', '01413074608', 'teacher14@example.com', '$2y$12$jp/jHytOGu2hkIJ5eW/Jmu639KUCNmCNoTJklO4SrXMhAouF.FF/G', 'Assistant Professor', '523 Smitham Rest\nDenesikstad, WV 39374', 'Devonte Wolff', '01319480923', 'Helen Ondricka', '01410433472', 'Barbara Runolfsdottir', '01745901828', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 05:59:59', '2026-01-22 05:59:59', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 05:59:59', '2026-01-22 05:59:59'),
(16, 'Enoch', 'Lebsack', '1968-01-11', 'Female', 'A-', '4377795019365', '01699667519', 'teacher15@example.com', '$2y$12$LgQPbWZBvMhv9T.4eVnjheJ7sPFNinuB8gPytkAT9Qib46pAsSVqC', 'Lecturer', '197 Swaniawski Springs Apt. 107\nLake Dashawn, GA 83756-9584', 'Filiberto O\'Conner', '01782476311', 'Dr. Adrienne Effertz', '01975335416', 'Dr. Martin Metz', '01504901405', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:00', '2026-01-22 06:00:00', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:00', '2026-01-22 06:00:00'),
(17, 'Erik', 'Price', '1997-09-09', 'Female', 'AB+', '6962281428902', '01553069995', 'teacher16@example.com', '$2y$12$Sl.jjmQMLkrVcI24AE8O5..tvMnWj87eHiw8X72zET69ihCuOMLay', 'Senior Teacher', '96626 Torphy Crossing Suite 468\nPort Carolinabury, CT 15572-6699', 'Dr. Jeremy Ferry', '01773359030', 'Dr. Kayli Steuber', '01320940010', 'Hal Hodkiewicz', '01312625038', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:00', '2026-01-22 06:00:00', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:00', '2026-01-22 06:00:00'),
(18, 'Anderson', 'Barton', '1999-05-31', 'Female', 'A+', '2627347803632', '01768041592', 'teacher17@example.com', '$2y$12$CBj2p2xw4ov3WrQiYLZ9duba5ktq6JhzG/28j0gmjAC2UB2LdyHXm', 'Head of Department', '108 Darron Field Apt. 120\nEast Chelseychester, NJ 99736', 'Gaylord Morissette', '01510670924', 'Nikita Labadie', '01466145276', 'Prof. Jamar Quigley', '01828334901', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:00', '2026-01-22 06:00:00', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:00', '2026-01-22 06:00:00'),
(19, 'Rubie', 'Ziemann', '1970-11-11', 'Male', 'AB-', '8838755244929', '01738128197', 'teacher18@example.com', '$2y$12$OwRJIa/KD/LN5lsCySvVyu19Y0CgERaCOtE8rvqFQKACVlVGDmDCq', 'Head of Department', '3489 Goldner Landing\nLake Ilianahaven, MO 01322', 'Raleigh Kuvalis II', '01975207401', 'Mabelle VonRueden', '01521269187', 'Roberta Schaden', '01583180832', 'Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:00', '2026-01-22 06:00:00', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:00', '2026-01-22 06:00:00'),
(20, 'Hester', 'Bashirian', '1975-06-04', 'Male', 'AB-', '3913614568625', '01820984426', 'teacher19@example.com', '$2y$12$cULFGUz8CPXGeRnKw/u3b.rMcYwqXa/.CMGjePDq1eCKR9iOD7/Oe', 'Assistant Professor', '787 Shania Crossroad\nMakaylafort, OH 47862', 'Mr. Wyman Buckridge DDS', '01985262015', 'Violet Gleason Jr.', '01958594830', 'Darrin Heller', '01348296753', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:00', '2026-01-22 06:00:00', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:00', '2026-01-22 06:00:00'),
(21, 'Amie', 'Hermiston', '1967-03-22', 'Female', 'B+', '8307431544173', '01433488327', 'teacher20@example.com', '$2y$12$RPTS/68O/SBQU7V76r.S9eu0.a3j9gPsAtrTtKrICW.rdEA80bHmC', 'Assistant Professor', '7793 Brandon Manor\nPort Jalyntown, SD 41939-3784', 'Mr. Brian Runolfsdottir DDS', '01350585840', 'Miss Antonetta Wiza MD', '01700608261', 'Dr. Frances Beer', '01786760689', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:01', '2026-01-22 06:00:01', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:01', '2026-01-22 06:00:01'),
(22, 'Gayle', 'O\'Conner', '1987-02-13', 'Male', 'A+', '6671847942917', '01808316462', 'teacher21@example.com', '$2y$12$BUBg23aqldwWaWx3wY/ZVeSKkNGR5.YLu1TauaqoeQFB84vKS1Vae', 'Head of Department', '1379 Thaddeus Isle Apt. 464\nLueilwitzmouth, MT 74713', 'Brendon Heaney', '01989427567', 'Faye King', '01594414977', 'Gia Collier', '01811338599', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:01', '2026-01-22 06:00:01', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:01', '2026-01-22 06:00:01'),
(23, 'Odie', 'Jenkins', '1985-12-27', 'Female', 'O+', '8222540614945', '01944002499', 'teacher22@example.com', '$2y$12$AwINxUp/oEWUYV1DawaKR.PlvKJD5RrGRAnM7Tgesodd8/fyLsEU.', 'Head of Department', '5131 Annie Light Suite 254\nKrisberg, ME 52530', 'Alford Considine I', '01694361322', 'Alexandrea Dach', '01612961565', 'Christa Gleason I', '01597638439', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:01', '2026-01-22 06:00:01', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:01', '2026-01-22 06:00:01'),
(24, 'Citlalli', 'Mills', '1988-12-21', 'Female', 'B+', '6005857555322', '01536616107', 'teacher23@example.com', '$2y$12$rfz9cSyAId633P2hLnBqMemwSLkhFxxrCQlVNdsYuspUos98Fg90K', 'Head of Department', '1952 Monahan Prairie Suite 350\nNew Darrionshire, KY 40876', 'Mr. Moses Bruen II', '01300694357', 'Prof. Mossie Douglas', '01546460889', 'Alene Upton III', '01622002169', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:01', '2026-01-22 06:00:01', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:01', '2026-01-22 06:00:01'),
(25, 'Selmer', 'Hackett', '1977-03-21', 'Female', 'A-', '4369242165036', '01573610816', 'teacher24@example.com', '$2y$12$EwfeZaxBPfYAaDkgNZ53POSL6bWNVzUQrqCI.33eWfRO/Xm2ulwi2', 'Lecturer', '18413 Kendrick Inlet Suite 626\nEast Jacynthe, NC 53734', 'Mr. Thaddeus Deckow DDS', '01515569545', 'Marge Botsford', '01957468049', 'Berry O\'Conner', '01844937207', 'Aunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:01', '2026-01-22 06:00:01', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:01', '2026-01-22 06:00:01'),
(26, 'Jovany', 'Aufderhar', '1988-10-29', 'Female', 'AB+', '7979894221901', '01303097509', 'teacher25@example.com', '$2y$12$PLzB7TvFiH6Jf6XaUVsOae81cff//Em/3bJLrwLRVY0EsUGsWhD3y', 'Head of Department', '486 Sammy Forest Suite 123\nWest Elizabeth, ID 78578', 'Corbin Raynor', '01731285307', 'Christa Schiller I', '01971162181', 'Prof. Joanie Mosciski MD', '01305882350', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:01', '2026-01-22 06:00:01', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:01', '2026-01-22 06:00:01'),
(27, 'Brandt', 'Casper', '1979-03-10', 'Male', 'A+', '3942639738757', '01983829189', 'teacher26@example.com', '$2y$12$sMZWTpVuVpCLxElugyn6vu2Aa2c1d9P0LYbmua8uPTZAyAVlTHuC2', 'Lecturer', '3120 Friesen Manors Suite 634\nEllsworthville, WA 42593-6523', 'Mr. Emmett Durgan', '01605567058', 'Prof. Claudine Rohan', '01491359652', 'Nick Collins', '01503719128', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:02', '2026-01-22 06:00:02', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:02', '2026-01-22 06:00:02'),
(28, 'Teagan', 'Wunsch', '1984-07-17', 'Male', 'B+', '1923248087273', '01827120347', 'teacher27@example.com', '$2y$12$yyoFDVRx6QjbSG2RFudBh.K6yuCUDqply8PiW3s7F01oGtUpGUyxi', 'Assistant Professor', '242 Orin Throughway\nWest Josuehaven, VA 17271', 'Stevie Beier', '01535465820', 'Nikita Fadel', '01585013344', 'Celestino Shields', '01566776746', 'Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:02', '2026-01-22 06:00:02', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:02', '2026-01-22 06:00:02'),
(29, 'Sigmund', 'O\'Hara', '1968-09-01', 'Male', 'A-', '2889121949095', '01801475843', 'teacher28@example.com', '$2y$12$LKp7xck2FXTUTAMrFU32d.OcKv731KwqYH0nEWxWEtRNJGwfTdGyO', 'Lecturer', '35860 Lindgren Ranch\nVernicechester, ME 95406-0626', 'Monserrat Langworth', '01387028246', 'Mrs. Cecile Wilderman DVM', '01408522352', 'Jacky Schimmel', '01407400210', 'Grandparent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:02', '2026-01-22 06:00:02', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:02', '2026-01-22 06:00:02'),
(30, 'Jeff', 'Spencer', '1974-01-31', 'Female', 'AB+', '6208303496557', '01579129165', 'teacher29@example.com', '$2y$12$J9TvwvHMXnwxWCwnsYKlHuNsGy2iz9tG9wu5TryIAGBXaUTyUg7da', 'Lecturer', '3172 Nina Street Suite 277\nPort Ardenhaven, NC 59983', 'Mr. Terry Langworth', '01588685852', 'Alexandrea Wintheiser', '01514118309', 'Sadye Dibbert MD', '01503797962', 'Uncle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', 1, 'N/A', '2026-01-22 06:00:02', '2026-01-22 06:00:02', '127.0.0.1', 1, NULL, NULL, NULL, '2026-01-22 06:00:02', '2026-01-22 06:00:02');

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
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bank_details_account_number_unique` (`account_number`);

--
-- Indexes for table `bank_transection_details`
--
ALTER TABLE `bank_transection_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_transection_details_bank_id_foreign` (`bank_id`),
  ADD KEY `bank_transection_details_user_id_foreign` (`user_id`);

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
-- Indexes for table `due_collections`
--
ALTER TABLE `due_collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `due_collections_receipt_no_unique` (`receipt_no`),
  ADD UNIQUE KEY `due_collections_invoice_no_unique` (`invoice_no`),
  ADD KEY `due_collections_student_id_foreign` (`student_id`),
  ADD KEY `due_collections_user_id_foreign` (`user_id`);

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
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_category_id_foreign` (`category_id`),
  ADD KEY `incomes_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `incomes_user_id_foreign` (`user_id`);

--
-- Indexes for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `income_categories_name_unique` (`name`);

--
-- Indexes for table `income_sub_categories`
--
ALTER TABLE `income_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_sub_categories_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transection_details`
--
ALTER TABLE `bank_transection_details`
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
-- AUTO_INCREMENT for table `due_collections`
--
ALTER TABLE `due_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exam_names`
--
ALTER TABLE `exam_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fee_payment_items`
--
ALTER TABLE `fee_payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fee_structures`
--
ALTER TABLE `fee_structures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `income_sub_categories`
--
ALTER TABLE `income_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=432;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `student_daily_routines`
--
ALTER TABLE `student_daily_routines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
-- Constraints for table `bank_transection_details`
--
ALTER TABLE `bank_transection_details`
  ADD CONSTRAINT `bank_transection_details_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `bank_details` (`id`),
  ADD CONSTRAINT `bank_transection_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `class_schedules_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `class_schedules_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `class_schedules_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `due_collections`
--
ALTER TABLE `due_collections`
  ADD CONSTRAINT `due_collections_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `due_collections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `teachers` (`id`);

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
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `income_categories` (`id`),
  ADD CONSTRAINT `incomes_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `income_sub_categories` (`id`),
  ADD CONSTRAINT `incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `income_sub_categories`
--
ALTER TABLE `income_sub_categories`
  ADD CONSTRAINT `income_sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `income_categories` (`id`);

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
