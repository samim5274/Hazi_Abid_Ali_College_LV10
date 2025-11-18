-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 18, 2025 at 07:27 AM
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
(1, 'Tuition Fee', 'Regular fee for academic instruction and classes', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(2, 'Admission Fee', 'One-time fee for student enrollment', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(3, 'Exam Fee', 'Fee for conducting examinations', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(4, 'Library Fee', 'Charge for library access and maintenance', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(5, 'Laboratory Fee', 'Fee for science/computer lab usage', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(6, 'Sports Fee', 'Charge for sports activities and events', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(7, 'Transport Fee', 'Fee for school bus/transport facilities', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(8, 'Hostel Fee', 'Accommodation and meal charges in hostel', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(9, 'Development Fee', 'Fee for infrastructure and school development', '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(10, 'Activity Fee', 'Fee for extracurricular activities and events', '2025-11-18 05:35:13', '2025-11-18 05:35:13');

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
(37, '2014_10_12_000000_create_users_table', 1),
(38, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(39, '2014_10_12_100000_create_password_resets_table', 1),
(40, '2019_08_19_000000_create_failed_jobs_table', 1),
(41, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(42, '2025_09_11_094326_create_teachers_table', 1),
(43, '2025_09_12_060130_create_rooms_table', 1),
(44, '2025_09_12_060131_create_students_table', 1),
(45, '2025_09_13_043441_create_subjects_table', 1),
(46, '2025_09_13_043442_create_attendances_table', 1),
(47, '2025_09_13_085234_create_exams_table', 1),
(48, '2025_09_13_085241_create_marks_table', 1),
(49, '2025_09_16_081917_create_student_subjects_table', 1),
(50, '2025_09_22_185426_create_fee_categories_table', 1),
(51, '2025_09_22_185444_create_fee_structures_table', 1),
(52, '2025_09_22_185453_create_fee_payments_table', 1),
(53, '2025_09_28_183808_create_exam_names_table', 1),
(54, '2025_10_03_153733_create_class_schedules_table', 1);

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
(1, 'Catherine', 'Aufderhar', '2022-05-06', 'Male', 'A-', 'Other', 'Bangladeshi', '1', '442-682-1521', 'student2@example.com', '$2y$12$SqNaHXsGV7ABvWyww5bGTe9ujdv3lF/vZmBn3/Se2z59qDY2nGArW', '4537 Eliane Streets\nNorth Jensenfurt, VA 36227', 'Apt. 169', 'Prof. Gregorio Mueller', 'Farmer', '+1 (484) 517-5302', 'student2@example.com', '2', '3', 'Alvena VonRueden', 'Housewife', '1-332-512-8525', 'student4@example.com', '4', '5', 'Mr. Ronaldo Towne', '228-382-9196', 'student6@example.com', '6', 'Brother', 1, 1, 2, '2025-11-18', 'N/A', 7, 9299047, NULL, NULL, NULL, NULL, '2025-11-18 05:35:05', '2025-11-18 05:35:05'),
(2, 'Francesca', 'Blick', '2009-08-26', 'Other', 'A-', 'Christian', 'Bangladeshi', '8', '678-260-4571', 'student9@example.com', '$2y$12$Wz8QpFv1QJt1ojG9RzboTeQAbs08r2/v1Fh1FALusupcUqgJSKQKq', '96662 Dibbert Village Apt. 293\nKirlinberg, UT 94059', 'Apt. 662', 'Dr. Gabe Dare Sr.', 'Farmer', '1-571-259-9601', 'student9@example.com', '9', '10', 'Creola Stanton', 'Nurse', '530-314-2699', 'student11@example.com', '11', '12', 'Therese Hudson', '+1-223-348-3970', 'student13@example.com', '13', 'Sister', 1, 1, 1, '2025-11-18', 'N/A', 14, 92990414, NULL, NULL, NULL, NULL, '2025-11-18 05:35:05', '2025-11-18 05:35:05'),
(3, 'Jan', 'Kris', '2020-02-24', 'Female', 'O-', 'Christian', 'Bangladeshi', '15', '279-829-0749', 'student16@example.com', '$2y$12$JcsOFRhhNJ28rX57gcZ7j.tjCL1n3sU9JAwtQD27DK3tHy6CMBGnG', '9866 Jerome Alley\nKerlukeshire, SC 18474', 'Suite 483', 'Damon Hahn PhD', 'Teacher', '(972) 336-2938', 'student16@example.com', '16', '17', 'Emie Kuhn', 'Doctor', '682.863.6920', 'student18@example.com', '18', '19', 'Mrs. Lurline Bechtelar V', '229-746-8479', 'student20@example.com', '20', 'Grandparent', 1, 1, 4, '2025-11-18', 'N/A', 21, 92990421, NULL, NULL, NULL, NULL, '2025-11-18 05:35:05', '2025-11-18 05:35:05'),
(4, 'Audie', 'Bailey', '2017-11-08', 'Other', 'AB-', 'Islam', 'Bangladeshi', '22', '+1.706.821.8410', 'student23@example.com', '$2y$12$rfWYL.UtgSmUcIH/qaZeJOqM0QmoQSMjd6PsiWGmxiEMTL2mp9tpC', '25779 Tremblay Stravenue\nNew Sienna, MA 69383', 'Apt. 680', 'Mr. Tod Murazik', 'Farmer', '360-250-1622', 'student23@example.com', '23', '24', 'Mrs. Gloria Bogan DDS', 'Housewife', '+1-315-936-6847', 'student25@example.com', '25', '26', 'Joshua Huels', '+1.320.204.8731', 'student27@example.com', '27', 'Uncle', 1, 2, 4, '2025-11-18', 'N/A', 28, 92990428, NULL, NULL, NULL, NULL, '2025-11-18 05:35:05', '2025-11-18 05:35:05'),
(5, 'Davon', 'Crooks', '1971-09-17', 'Female', 'AB+', 'Other', 'Bangladeshi', '29', '1-858-719-6553', 'student30@example.com', '$2y$12$5V.MJN9sUbDK.cbmJPDVZ.28lX1awaLyj9m0nGh1bL.RcB1iDT3Z2', '20297 Barton Mount\nNew Chelseaport, AR 98002-3616', 'Suite 102', 'Dedric Towne', 'Businessman', '+1.878.512.0218', 'student30@example.com', '30', '31', 'Celine Medhurst', 'Nurse', '(863) 656-7666', 'student32@example.com', '32', '33', 'Prof. Ezekiel Rutherford', '+1 (726) 305-8042', 'student34@example.com', '34', 'Brother', 1, 1, 5, '2025-11-18', 'N/A', 35, 92990435, NULL, NULL, NULL, NULL, '2025-11-18 05:35:05', '2025-11-18 05:35:05'),
(6, 'Nicole', 'Brekke', '1986-10-27', 'Male', 'B+', 'Islam', 'Bangladeshi', '36', '940-594-1092', 'student37@example.com', '$2y$12$bRR0H5hWLUMbFzntJ7gaSuyxRyoQXE0FNYWhQHFCTYpYOmIBbz/uu', '39529 Nelle Branch Apt. 034\nPort Mitchellberg, MA 69175', 'Apt. 410', 'Prof. Kieran Prohaska', 'Teacher', '(907) 604-7466', 'student37@example.com', '37', '38', 'Adaline Christiansen', 'Housewife', '+1.763.774.9499', 'student39@example.com', '39', '40', 'Ressie O\'Kon', '(732) 489-7113', 'student41@example.com', '41', 'Uncle', 1, 1, 3, '2025-11-18', 'N/A', 42, 92990442, NULL, NULL, NULL, NULL, '2025-11-18 05:35:06', '2025-11-18 05:35:06'),
(7, 'Gerda', 'Stark', '2004-09-20', 'Other', 'AB+', 'Islam', 'Bangladeshi', '43', '+1-754-888-7659', 'student44@example.com', '$2y$12$LVpCoa34Neoxi4rmUH8EZ.gVKiaYa/lTjfq9MCjBoela2.rgub9by', '16870 Bernhard Heights Suite 285\nRennerberg, AL 95716-4281', 'Suite 849', 'Irwin Macejkovic', 'Doctor', '+1 (947) 863-2007', 'student44@example.com', '44', '45', 'Patience Collins II', 'Doctor', '(248) 826-2839', 'student46@example.com', '46', '47', 'Leland Sawayn', '(504) 633-5348', 'student48@example.com', '48', 'Uncle', 1, 3, 4, '2025-11-18', 'N/A', 49, 92990449, NULL, NULL, NULL, NULL, '2025-11-18 05:35:06', '2025-11-18 05:35:06'),
(8, 'Katlynn', 'Kutch', '1977-07-07', 'Female', 'AB-', 'Hindu', 'Bangladeshi', '50', '404-562-6403', 'student51@example.com', '$2y$12$5mNQxzMb5obeH4v3FqE7Wea.3bZoPReiSKCHHSm9DuQEhngm05InO', '401 Wunsch Hill\nLake Guiseppeburgh, KS 91286-1359', 'Apt. 509', 'Tyson Langosh', 'Engineer', '334.607.0687', 'student51@example.com', '51', '52', 'Sarina Herzog', 'Housewife', '+1-760-516-3407', 'student53@example.com', '53', '54', 'Kellie Kshlerin II', '+1 (801) 958-2119', 'student55@example.com', '55', 'Brother', 1, 2, 5, '2025-11-18', 'N/A', 56, 92990456, NULL, NULL, NULL, NULL, '2025-11-18 05:35:06', '2025-11-18 05:35:06'),
(9, 'Torey', 'Kuhlman', '1974-01-13', 'Female', 'O-', 'Islam', 'Bangladeshi', '57', '+1.862.893.6834', 'student58@example.com', '$2y$12$6mfqbt/xncO50N9/W5kLE.3JsgfoBePfjbksLKUUV/J7zYx/ypmvq', '441 Lesly Mount Suite 657\nGorczanybury, VA 37155', 'Apt. 949', 'Mr. Eddie Hodkiewicz DVM', 'Businessman', '+18308629533', 'student58@example.com', '58', '59', 'Alessia Rolfson III', 'Businesswoman', '769.237.7526', 'student60@example.com', '60', '61', 'Haleigh Hilpert', '432.389.0195', 'student62@example.com', '62', 'Uncle', 1, 3, 5, '2025-11-18', 'N/A', 63, 92990463, NULL, NULL, NULL, NULL, '2025-11-18 05:35:06', '2025-11-18 05:35:06'),
(10, 'Reba', 'Mraz', '2000-01-16', 'Female', 'AB-', 'Christian', 'Bangladeshi', '64', '(262) 513-0868', 'student65@example.com', '$2y$12$aT/bxMFUpBkG.EEvgbSDqu./eSPa3GE6KfOY//hMhBnN0PVSWILoi', '7916 Parker Locks\nWest Michel, MI 87919', 'Suite 209', 'Rudolph Herman', 'Businessman', '+1 (248) 509-8371', 'student65@example.com', '65', '66', 'Dr. Marcella Bernhard', 'Housewife', '+1-559-886-6349', 'student67@example.com', '67', '68', 'Mustafa Fay', '+1 (989) 403-2405', 'student69@example.com', '69', 'Grandparent', 1, 2, 1, '2025-11-18', 'N/A', 70, 92990470, NULL, NULL, NULL, NULL, '2025-11-18 05:35:06', '2025-11-18 05:35:06'),
(11, 'Nathen', 'Ernser', '1992-01-21', 'Female', 'B+', 'Hindu', 'Bangladeshi', '71', '(863) 719-7583', 'student72@example.com', '$2y$12$DaaXbRyDkFVjxxdnlh0yeexmUq.p9H8X1ENPxWr3lpDVDsnwFLrlm', '782 Cruickshank Row\nBalistreriburgh, NE 95231', 'Suite 966', 'Al Lakin DVM', 'Farmer', '754.278.3849', 'student72@example.com', '72', '73', 'Alexane Weber', 'Housewife', '928.318.3230', 'student74@example.com', '74', '75', 'Miss Nia Beatty', '(225) 808-3575', 'student76@example.com', '76', 'Grandparent', 1, 2, 3, '2025-11-18', 'N/A', 77, 92990477, NULL, NULL, NULL, NULL, '2025-11-18 05:35:07', '2025-11-18 05:35:07'),
(12, 'Joany', 'Schneider', '2006-06-27', 'Other', 'AB-', 'Buddhist', 'Bangladeshi', '78', '(425) 381-5021', 'student79@example.com', '$2y$12$I7CJV6.D7JYSvG7SjCttGOFmg8nTNAfEhf2Q2CjSSvp1l/mXJMKqW', '9468 Brandi Plains Apt. 106\nSouth Silasfort, GA 01101', 'Suite 393', 'Jermey Mosciski', 'Farmer', '(646) 947-3084', 'student79@example.com', '79', '80', 'Miss Aniya Bruen', 'Doctor', '(763) 617-5324', 'student81@example.com', '81', '82', 'Ayden Schaden', '240-263-2323', 'student83@example.com', '83', 'Aunt', 1, 2, 2, '2025-11-18', 'N/A', 84, 92990484, NULL, NULL, NULL, NULL, '2025-11-18 05:35:07', '2025-11-18 05:35:07'),
(13, 'Kiley', 'Sanford', '2019-10-20', 'Female', 'A-', 'Hindu', 'Bangladeshi', '85', '724.819.7614', 'student86@example.com', '$2y$12$xAmgxJc9/WZZ5ew8OpqJ1uMoNBG16.kHkNXXtRtWKJeucR98kJmlK', '73192 Parker Harbors Suite 104\nVidaborough, NH 50553', 'Apt. 858', 'Hoyt Stracke', 'Teacher', '+1-626-912-1965', 'student86@example.com', '86', '87', 'Genoveva Mitchell', 'Teacher', '1-207-519-8389', 'student88@example.com', '88', '89', 'Oleta Spencer', '(351) 335-8904', 'student90@example.com', '90', 'Aunt', 1, 4, 5, '2025-11-18', 'N/A', 91, 92990491, NULL, NULL, NULL, NULL, '2025-11-18 05:35:07', '2025-11-18 05:35:07'),
(14, 'Avis', 'Predovic', '1984-02-12', 'Male', 'A-', 'Christian', 'Bangladeshi', '92', '223.567.7142', 'student93@example.com', '$2y$12$zIvFES71/UMY3nBIbFbs0eINJdSc5xeMVFcUMwvB5/8LUmu8PgRKq', '291 Elena Fords Suite 361\nPort Vickymouth, AK 15281', 'Apt. 250', 'Mr. Kurtis Harvey', 'Teacher', '+13865287908', 'student93@example.com', '93', '94', 'Ms. Mittie McClure DVM', 'Businesswoman', '(231) 543-3978', 'student95@example.com', '95', '96', 'Bruce Gibson', '310.213.1378', 'student97@example.com', '97', 'Aunt', 1, 4, 4, '2025-11-18', 'N/A', 98, 92990498, NULL, NULL, NULL, NULL, '2025-11-18 05:35:07', '2025-11-18 05:35:07'),
(15, 'Raleigh', 'Robel', '1977-12-17', 'Male', 'O-', 'Christian', 'Bangladeshi', '99', '+1-341-533-6434', 'student100@example.com', '$2y$12$Pl1gWbcBKNTq27O294ana.dM1OMLzNnXbuVLobit1N8Xk7rvZIc7u', '62088 Ondricka Station Suite 599\nSouth Janessafurt, LA 57225', 'Suite 552', 'Allan Kertzmann', 'Businessman', '1-283-933-0165', 'student100@example.com', '100', '101', 'Colleen O\'Connell PhD', 'Teacher', '331-488-9786', 'student102@example.com', '102', '103', 'Marcelle Osinski', '(531) 917-1669', 'student104@example.com', '104', 'Brother', 1, 5, 5, '2025-11-18', 'N/A', 105, 929904105, NULL, NULL, NULL, NULL, '2025-11-18 05:35:07', '2025-11-18 05:35:07'),
(16, 'Alyson', 'Klein', '1974-01-21', 'Female', 'B-', 'Buddhist', 'Bangladeshi', '106', '+1-281-398-6878', 'student107@example.com', '$2y$12$33EV98dREzkeKWnYC5WiIudn5y0Wi0GiYwxDn2hDlm3Ge2uICQkWm', '591 Weldon Groves\nNorth Joanfurt, LA 46990', 'Suite 011', 'Haley Stanton Sr.', 'Teacher', '689-879-8296', 'student107@example.com', '107', '108', 'Miss Pattie Bode Sr.', 'Teacher', '607.410.9183', 'student109@example.com', '109', '110', 'Bette Simonis', '1-314-839-7179', 'student111@example.com', '111', 'Uncle', 1, 3, 1, '2025-11-18', 'N/A', 112, 929904112, NULL, NULL, NULL, NULL, '2025-11-18 05:35:08', '2025-11-18 05:35:08'),
(17, 'Minnie', 'Windler', '1991-11-03', 'Other', 'AB+', 'Islam', 'Bangladeshi', '113', '+1-218-218-5535', 'student114@example.com', '$2y$12$lhSMDkKcEqyYRoVTA72/K.1FA/UKYgxaM/gVCnQ1ZSMtOYYPVcOne', '857 Bartell Estate\nBradtkeview, NC 18342', 'Apt. 319', 'Jettie Smith', 'Businessman', '1-786-672-1561', 'student114@example.com', '114', '115', 'Ms. Shannon Johns PhD', 'Businesswoman', '(406) 395-0331', 'student116@example.com', '116', '117', 'Dr. Jabari Lockman', '364.263.5405', 'student118@example.com', '118', 'Grandparent', 1, 3, 3, '2025-11-18', 'N/A', 119, 929904119, NULL, NULL, NULL, NULL, '2025-11-18 05:35:08', '2025-11-18 05:35:08'),
(18, 'Guadalupe', 'Veum', '1977-12-02', 'Other', 'A+', 'Other', 'Bangladeshi', '120', '(678) 470-7267', 'student121@example.com', '$2y$12$mz.gD2hQUXu3qgcbWy9SreH20Owncr1Dl8ieIyBAMyGWPnSxzSvlC', '3625 Sporer Fort Apt. 653\nOberbrunnerland, MS 80835', 'Apt. 468', 'Murray Sauer', 'Farmer', '+1-610-879-1951', 'student121@example.com', '121', '122', 'Magali Larkin DDS', 'Nurse', '+1 (619) 600-5205', 'student123@example.com', '123', '124', 'Janis Skiles', '+1 (417) 266-9280', 'student125@example.com', '125', 'Brother', 1, 4, 3, '2025-11-18', 'N/A', 126, 929904126, NULL, NULL, NULL, NULL, '2025-11-18 05:35:08', '2025-11-18 05:35:08'),
(19, 'Trenton', 'Walter', '2005-08-26', 'Female', 'O-', 'Christian', 'Bangladeshi', '127', '+13644137538', 'student128@example.com', '$2y$12$RLSe3jmkp5GksZQSGogM6O6rAOpf4BDi2BrPocgmxKDshfCqSlfAy', '1123 Ryan Lodge\nMcKenziefort, CT 07250-0857', 'Suite 537', 'Mr. Russ Bosco', 'Businessman', '1-682-530-4198', 'student128@example.com', '128', '129', 'Aurelia Reynolds', 'Housewife', '(773) 801-1504', 'student130@example.com', '130', '131', 'Anastasia Marvin', '872.566.9762', 'student132@example.com', '132', 'Aunt', 1, 4, 1, '2025-11-18', 'N/A', 133, 929904133, NULL, NULL, NULL, NULL, '2025-11-18 05:35:08', '2025-11-18 05:35:08'),
(20, 'Idell', 'Gerhold', '1992-12-13', 'Male', 'AB-', 'Islam', 'Bangladeshi', '134', '1-870-265-6008', 'student135@example.com', '$2y$12$5ck.wd/NttwJiMpYQkrSOeo6er54cJNPIPTQOAZw.uunMPLnZV92S', '736 Littel Spurs Suite 421\nNew Marcel, CA 69590-1745', 'Apt. 671', 'David Stracke', 'Doctor', '1-305-460-8661', 'student135@example.com', '135', '136', 'Marilou Kulas V', 'Teacher', '+1.220.673.1318', 'student137@example.com', '137', '138', 'Percy Pfannerstill III', '534.483.3527', 'student139@example.com', '139', 'Brother', 1, 6, 5, '2025-11-18', 'N/A', 140, 929904140, NULL, NULL, NULL, NULL, '2025-11-18 05:35:08', '2025-11-18 05:35:08'),
(21, 'Lonnie', 'Champlin', '1974-08-24', 'Other', 'B+', 'Islam', 'Bangladeshi', '141', '+1 (430) 550-2221', 'student142@example.com', '$2y$12$3Rwflj9SLskIwBXU3p1i/eDH5CX8X0opE6HuTqw4ZMWDVD/XxSYKO', '289 Wisozk Junction\nSouth Nigelburgh, FL 16418-3294', 'Suite 891', 'Ryley Watsica', 'Farmer', '1-512-543-9518', 'student142@example.com', '142', '143', 'Bette Emard I', 'Businesswoman', '+1.570.725.5573', 'student144@example.com', '144', '145', 'Kimberly Armstrong', '(580) 890-8707', 'student146@example.com', '146', 'Aunt', 1, 5, 3, '2025-11-18', 'N/A', 147, 929904147, NULL, NULL, NULL, NULL, '2025-11-18 05:35:09', '2025-11-18 05:35:09'),
(22, 'Stephen', 'Swift', '1977-11-04', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '148', '+1-586-941-7911', 'student149@example.com', '$2y$12$q7cZsVGnKrJ.ojWX1NLCueJNr0GDkT912SnoHmDTyYETqFFui9/O2', '49523 Karl Shoals\nDemetriusfort, CO 82466-6407', 'Apt. 360', 'Agustin Larson', 'Engineer', '+1-743-613-5808', 'student149@example.com', '149', '150', 'Ms. Sonia Gottlieb DVM', 'Doctor', '820-720-5653', 'student151@example.com', '151', '152', 'Esther Morissette', '+1.234.989.5007', 'student153@example.com', '153', 'Sister', 1, 5, 1, '2025-11-18', 'N/A', 154, 929904154, NULL, NULL, NULL, NULL, '2025-11-18 05:35:09', '2025-11-18 05:35:09'),
(23, 'Gail', 'Johnson', '2006-11-28', 'Other', 'O+', 'Christian', 'Bangladeshi', '155', '+1.361.897.4950', 'student156@example.com', '$2y$12$/rlrP7BrnKP9rI8n3SPHe.qtSSmprXIJAO3092bvMF9egRqNwA0Jy', '293 Padberg Mission Apt. 346\nLizziefurt, OK 60267-2168', 'Apt. 248', 'Irwin Jacobson', 'Doctor', '(240) 868-7767', 'student156@example.com', '156', '157', 'Evie Gorczany', 'Doctor', '240-828-1292', 'student158@example.com', '158', '159', 'Lucie Hegmann', '+1 (689) 725-3299', 'student160@example.com', '160', 'Brother', 1, 3, 2, '2025-11-18', 'N/A', 161, 929904161, NULL, NULL, NULL, NULL, '2025-11-18 05:35:09', '2025-11-18 05:35:09'),
(24, 'Flossie', 'Rice', '2025-11-06', 'Female', 'O+', 'Buddhist', 'Bangladeshi', '162', '1-252-601-0645', 'student163@example.com', '$2y$12$Oej0HUqbydFd/6tvJB1nwuTSafJbDcbRyKiRBwxi85yktcKBBo3Xm', '19644 Martin Park Suite 443\nLake Katrinetown, UT 33427-3595', 'Suite 217', 'Furman Bahringer', 'Engineer', '248.344.9082', 'student163@example.com', '163', '164', 'Madisyn Wolff Sr.', 'Doctor', '1-772-468-9460', 'student165@example.com', '165', '166', 'Carissa Moen', '1-979-696-1700', 'student167@example.com', '167', 'Grandparent', 1, 6, 3, '2025-11-18', 'N/A', 168, 929904168, NULL, NULL, NULL, NULL, '2025-11-18 05:35:09', '2025-11-18 05:35:09'),
(25, 'Zetta', 'Block', '2005-06-20', 'Other', 'O-', 'Christian', 'Bangladeshi', '169', '1-831-615-7483', 'student170@example.com', '$2y$12$Tet9a7F4n1pBv5XfR6ICmOpGX.YbtRd1WXu1jgSyb8hI2KczOm.c6', '82568 Nadia Oval\nBeermouth, IL 67548-8679', 'Apt. 207', 'Malachi Deckow Sr.', 'Farmer', '860.430.9607', 'student170@example.com', '170', '171', 'Lynn Cruickshank', 'Teacher', '+14308538307', 'student172@example.com', '172', '173', 'Oliver Bogan', '610.626.0614', 'student174@example.com', '174', 'Grandparent', 1, 7, 3, '2025-11-18', 'N/A', 175, 929904175, NULL, NULL, NULL, NULL, '2025-11-18 05:35:09', '2025-11-18 05:35:09'),
(26, 'Abby', 'Kilback', '2000-06-15', 'Other', 'AB+', 'Islam', 'Bangladeshi', '176', '1-763-816-9511', 'student177@example.com', '$2y$12$kCNeSQVAIj88mJmvqPRnzO.H7aVJ78cRsrzj93As.ziLYYW9PrfLm', '58542 Retta Square\nWilkinsonton, FL 31553-2517', 'Apt. 585', 'Hollis Lehner Sr.', 'Businessman', '1-857-526-3376', 'student177@example.com', '177', '178', 'Ms. Aileen Okuneva', 'Businesswoman', '+1-669-400-2839', 'student179@example.com', '179', '180', 'Rickey Leffler', '(346) 517-8691', 'student181@example.com', '181', 'Aunt', 1, 7, 5, '2025-11-18', 'N/A', 182, 929904182, NULL, NULL, NULL, NULL, '2025-11-18 05:35:10', '2025-11-18 05:35:10'),
(27, 'Willis', 'Boyer', '1999-11-12', 'Other', 'AB+', 'Hindu', 'Bangladeshi', '183', '+1-319-589-7574', 'student184@example.com', '$2y$12$f9ZSyT.sVPqq2843Jux6w.Fp8ovyVJhKwS3qgX7yY2MM1Yi1Msu0.', '7586 VonRueden Station\nEast Maurinemouth, NM 43532', 'Apt. 017', 'Adrian Bergstrom', 'Teacher', '(724) 912-3864', 'student184@example.com', '184', '185', 'Angelita Schaefer MD', 'Teacher', '520-502-3560', 'student186@example.com', '186', '187', 'Prof. Naomi Parisian', '623.490.5974', 'student188@example.com', '188', 'Grandparent', 1, 8, 3, '2025-11-18', 'N/A', 189, 929904189, NULL, NULL, NULL, NULL, '2025-11-18 05:35:10', '2025-11-18 05:35:10'),
(28, 'Mariam', 'O\'Keefe', '1977-08-01', 'Other', 'O+', 'Buddhist', 'Bangladeshi', '190', '706.938.8566', 'student191@example.com', '$2y$12$/7agg8aGfsMNqvZudfxnleRyMvqAN7xv3CRahghGSahT66fjpyO8u', '692 Lesch Trafficway\nCummerataville, NY 94309-9118', 'Apt. 582', 'Prof. Colt Mueller', 'Teacher', '+1-843-320-5360', 'student191@example.com', '191', '192', 'Mrs. Dorothy Mueller Jr.', 'Doctor', '+1 (279) 322-8795', 'student193@example.com', '193', '194', 'Vernice Barton', '1-682-625-7095', 'student195@example.com', '195', 'Sister', 1, 5, 4, '2025-11-18', 'N/A', 196, 929904196, NULL, NULL, NULL, NULL, '2025-11-18 05:35:10', '2025-11-18 05:35:10'),
(29, 'Frederick', 'Windler', '2008-12-02', 'Female', 'B-', 'Other', 'Bangladeshi', '197', '1-986-814-7376', 'student198@example.com', '$2y$12$.sO4aXPPi66GiHaucM4O9uzl/2Ql/k.56SO7QzY0OtYXtRYEqgmsu', '524 Kristofer Turnpike Apt. 921\nWest Katlyn, NE 62506-6163', 'Apt. 029', 'Erich Bechtelar', 'Teacher', '657.659.4675', 'student198@example.com', '198', '199', 'Dr. Meghan Lindgren', 'Teacher', '+1.520.602.9317', 'student200@example.com', '200', '201', 'Krystina Batz IV', '678-614-2017', 'student202@example.com', '202', 'Brother', 1, 6, 4, '2025-11-18', 'N/A', 203, 929904203, NULL, NULL, NULL, NULL, '2025-11-18 05:35:10', '2025-11-18 05:35:10'),
(30, 'Evans', 'Buckridge', '1972-11-02', 'Male', 'O-', 'Hindu', 'Bangladeshi', '204', '(316) 744-9109', 'student205@example.com', '$2y$12$G1GT8EkLKiZwSyAp6K0CS.fRkbf75P5EwJd.TOH2FO1ry5UGk.f7C', '389 Mckenzie Mission\nNorth Janachester, NV 18945', 'Apt. 062', 'Dr. Mateo Willms', 'Engineer', '(423) 625-5033', 'student205@example.com', '205', '206', 'Helen Torphy', 'Teacher', '216.244.5365', 'student207@example.com', '207', '208', 'Gia DuBuque', '1-458-354-7238', 'student209@example.com', '209', 'Aunt', 1, 4, 2, '2025-11-18', 'N/A', 210, 929904210, NULL, NULL, NULL, NULL, '2025-11-18 05:35:10', '2025-11-18 05:35:10'),
(31, 'Eunice', 'Lind', '1990-06-19', 'Other', 'A-', 'Christian', 'Bangladeshi', '211', '540-435-9904', 'student212@example.com', '$2y$12$tEEH4OEU9QTu4Lz2w0OTlucNIvQpAiZws9ocMXZPBr7Fu56fujkum', '8780 Davis Prairie Apt. 878\nSouth Kristoffershire, ME 65265-7827', 'Suite 266', 'Dr. Wallace Walker MD', 'Farmer', '1-650-338-7988', 'student212@example.com', '212', '213', 'Ashlee Lemke MD', 'Housewife', '424-993-8550', 'student214@example.com', '214', '215', 'Dr. Adrian Kirlin DVM', '+1 (667) 447-2266', 'student216@example.com', '216', 'Sister', 1, 5, 2, '2025-11-18', 'N/A', 217, 929904217, NULL, NULL, NULL, NULL, '2025-11-18 05:35:11', '2025-11-18 05:35:11'),
(32, 'Valentina', 'Wisoky', '2007-01-24', 'Male', 'O-', 'Hindu', 'Bangladeshi', '218', '(520) 766-2796', 'student219@example.com', '$2y$12$jaizILmPwjB6IvcJexmVSeGZDyILkOPp7efGnd8v6qqArWS3umBpi', '1063 Devyn Port Apt. 311\nEast Xanderborough, CO 14628-4758', 'Apt. 280', 'Mallory Cremin II', 'Engineer', '+1.480.258.1972', 'student219@example.com', '219', '220', 'Prof. Octavia Vandervort DVM', 'Nurse', '+1.346.823.2518', 'student221@example.com', '221', '222', 'Devan Daugherty', '1-312-340-5739', 'student223@example.com', '223', 'Brother', 1, 7, 4, '2025-11-18', 'N/A', 224, 929904224, NULL, NULL, NULL, NULL, '2025-11-18 05:35:11', '2025-11-18 05:35:11'),
(33, 'Deion', 'Tromp', '1974-04-21', 'Male', 'AB+', 'Hindu', 'Bangladeshi', '225', '603.382.1238', 'student226@example.com', '$2y$12$oRRYEFKbMS1dO64sB9zfM.NTQws0qo3SLPifohlH4lLqI3qkkfeMa', '45357 Welch Creek Suite 247\nCletusshire, MO 36231', 'Apt. 277', 'Delbert Dickens', 'Farmer', '+1.445.365.1173', 'student226@example.com', '226', '227', 'Dr. Vilma Ward V', 'Doctor', '+1.662.548.4012', 'student228@example.com', '228', '229', 'Jaclyn Beahan', '770-305-8021', 'student230@example.com', '230', 'Brother', 1, 6, 1, '2025-11-18', 'N/A', 231, 929904231, NULL, NULL, NULL, NULL, '2025-11-18 05:35:11', '2025-11-18 05:35:11'),
(34, 'Andy', 'Howell', '1977-11-22', 'Female', 'A+', 'Islam', 'Bangladeshi', '232', '(626) 425-7077', 'student233@example.com', '$2y$12$pfkB/0YXGjnWC6Rb6RihCOXogn5DnJ.DDPll7JJ8/rpGNZI2/XOFi', '3805 Myrtle Walks Suite 294\nFredberg, MS 81984-3421', 'Apt. 865', 'Prof. Andrew Macejkovic DVM', 'Teacher', '623.299.5759', 'student233@example.com', '233', '234', 'Mrs. Patsy Hessel', 'Housewife', '+1.321.699.2220', 'student235@example.com', '235', '236', 'Dr. Alfredo Champlin', '+1.913.822.9639', 'student237@example.com', '237', 'Grandparent', 1, 6, 2, '2025-11-18', 'N/A', 238, 929904238, NULL, NULL, NULL, NULL, '2025-11-18 05:35:11', '2025-11-18 05:35:11'),
(35, 'Marlene', 'Schultz', '2022-07-07', 'Female', 'A+', 'Other', 'Bangladeshi', '239', '+1.423.402.4755', 'student240@example.com', '$2y$12$ObjfLeHhgW2gUdt5hVirKuw1SehdKUZHG9j8a0dsd.zNkrvZLKyVe', '64164 Gorczany Lane Apt. 771\nEast Erika, FL 67294', 'Suite 172', 'John Homenick I', 'Doctor', '+1-623-727-5234', 'student240@example.com', '240', '241', 'Rachael Stokes', 'Doctor', '+1-614-829-7776', 'student242@example.com', '242', '243', 'Darren Gulgowski', '530-669-8755', 'student244@example.com', '244', 'Brother', 1, 8, 4, '2025-11-18', 'N/A', 245, 929904245, NULL, NULL, NULL, NULL, '2025-11-18 05:35:11', '2025-11-18 05:35:11'),
(36, 'Tianna', 'Bednar', '1998-03-23', 'Male', 'B+', 'Buddhist', 'Bangladeshi', '246', '872-497-6908', 'student247@example.com', '$2y$12$KKHy2QyRfytloVWzfsYCaejCoi8rS3A7tn7VRE4fjVuKuQulu2gJ6', '827 Christiansen Hills\nCindytown, OK 93837', 'Suite 066', 'Pierre Daniel', 'Farmer', '(703) 332-2023', 'student247@example.com', '247', '248', 'Makenzie Farrell II', 'Nurse', '+1-984-583-3650', 'student249@example.com', '249', '250', 'Maxime Hackett', '234.651.4534', 'student251@example.com', '251', 'Sister', 1, 9, 3, '2025-11-18', 'N/A', 252, 929904252, NULL, NULL, NULL, NULL, '2025-11-18 05:35:12', '2025-11-18 05:35:12'),
(37, 'Dean', 'Jast', '2017-03-01', 'Female', 'O+', 'Hindu', 'Bangladeshi', '253', '325.799.0972', 'student254@example.com', '$2y$12$sacyhZ7h6v8laIovQ3Mt/enm5KfRTcb4b4MPUfhXs3Vkex.lqrx.e', '239 Schaden Plains Suite 971\nOrvillebury, MA 15049', 'Suite 663', 'Ray Greenholt', 'Engineer', '+1 (551) 360-6858', 'student254@example.com', '254', '255', 'Dr. Veronica Volkman', 'Teacher', '(857) 810-1752', 'student256@example.com', '256', '257', 'Prof. Geovanny Beier II', '435-668-5986', 'student258@example.com', '258', 'Aunt', 1, 7, 2, '2025-11-18', 'N/A', 259, 929904259, NULL, NULL, NULL, NULL, '2025-11-18 05:35:12', '2025-11-18 05:35:12'),
(38, 'Mellie', 'Kassulke', '1986-05-10', 'Female', 'AB+', 'Islam', 'Bangladeshi', '260', '341-787-4936', 'student261@example.com', '$2y$12$AVKk8rhrU2QbQfGISev9nufbHXnWB5YRhvdEr.LjI/Gix2eJVkfRC', '16379 Lesch Freeway\nDareland, CO 30020', 'Apt. 386', 'Ford Hessel', 'Farmer', '(440) 554-0201', 'student261@example.com', '261', '262', 'Dahlia Frami', 'Doctor', '+1 (435) 708-7189', 'student263@example.com', '263', '264', 'Myrl Hirthe', '220-567-0817', 'student265@example.com', '265', 'Grandparent', 1, 7, 1, '2025-11-18', 'N/A', 266, 929904266, NULL, NULL, NULL, NULL, '2025-11-18 05:35:12', '2025-11-18 05:35:12'),
(39, 'Verdie', 'Lowe', '1994-12-06', 'Other', 'AB-', 'Christian', 'Bangladeshi', '267', '1-332-646-4771', 'student268@example.com', '$2y$12$JLKl9059cYrxZAs5zhje2.TfiN5LP03qkVQCStPp4TXpjL9YgDbZq', '524 Reinger Lights Suite 546\nPort Ashley, UT 48109-1555', 'Apt. 629', 'Mr. Joan Kutch', 'Engineer', '(267) 307-7469', 'student268@example.com', '268', '269', 'Dolly Ruecker', 'Housewife', '680-769-9552', 'student270@example.com', '270', '271', 'Tomas Buckridge', '1-747-761-5528', 'student272@example.com', '272', 'Brother', 1, 10, 3, '2025-11-18', 'N/A', 273, 929904273, NULL, NULL, NULL, NULL, '2025-11-18 05:35:12', '2025-11-18 05:35:12'),
(40, 'Christopher', 'Shields', '1992-02-09', 'Male', 'O-', 'Christian', 'Bangladeshi', '274', '734-845-1184', 'student275@example.com', '$2y$12$m/a08V.HjBc80dm/vBJsTO/nmLjhsXBPakCMcEaI0NFM6jX9MAuoW', '6727 Schuppe Club Apt. 444\nSouth Myrlbury, LA 05649', 'Suite 039', 'Mikel Strosin', 'Farmer', '(575) 204-3986', 'student275@example.com', '275', '276', 'Prof. Leatha Fahey V', 'Teacher', '203.279.6718', 'student277@example.com', '277', '278', 'Prof. Lilian Thompson', '(540) 596-3824', 'student279@example.com', '279', 'Sister', 1, 8, 5, '2025-11-18', 'N/A', 280, 929904280, NULL, NULL, NULL, NULL, '2025-11-18 05:35:12', '2025-11-18 05:35:12'),
(41, 'Augustus', 'Walsh', '2000-12-15', 'Other', 'A-', 'Islam', 'Bangladeshi', '281', '+14804990733', 'student282@example.com', '$2y$12$LOC3JSyfiOvWAorDUspTBOfGNzywKe8QY6j0crJ1YkeCG20qZrJXu', '45666 Quigley Street\nMarvinport, MT 16983-0467', 'Apt. 572', 'Blake Sanford', 'Engineer', '681.621.9540', 'student282@example.com', '282', '283', 'Serena Toy', 'Businesswoman', '+1 (713) 379-6764', 'student284@example.com', '284', '285', 'Dr. Jaleel Herman PhD', '828.838.6970', 'student286@example.com', '286', 'Uncle', 1, 9, 5, '2025-11-18', 'N/A', 287, 929904287, NULL, NULL, NULL, NULL, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(42, 'Chasity', 'Ankunding', '1987-10-06', 'Male', 'O-', 'Islam', 'Bangladeshi', '288', '551-828-4664', 'student289@example.com', '$2y$12$iONJim2TiZQmw5sRY.HBUeIxDgKf/RuacycpVbFw.cq.EOwlYBIca', '5291 Lennie Knoll Apt. 703\nLake Gabriellaburgh, NH 04318', 'Suite 229', 'Solon Luettgen', 'Farmer', '+1-505-727-4480', 'student289@example.com', '289', '290', 'Autumn Baumbach', 'Businesswoman', '+1.689.396.1355', 'student291@example.com', '291', '292', 'Prof. Pascale Heidenreich', '+1-903-424-3742', 'student293@example.com', '293', 'Brother', 1, 11, 3, '2025-11-18', 'N/A', 294, 929904294, NULL, NULL, NULL, NULL, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(43, 'Dino', 'Fritsch', '2006-04-01', 'Male', 'O+', 'Islam', 'Bangladeshi', '295', '725.884.6702', 'student296@example.com', '$2y$12$0fi3zoQImsBTpSJI5ls2..tjjNe4BQdninjF.HkaI7j0T3KJPgsKW', '99777 Melba Shores\nRathview, MS 80252-4557', 'Suite 010', 'Prof. Darrell Bechtelar', 'Doctor', '+1-712-662-6326', 'student296@example.com', '296', '297', 'Carlee Turcotte MD', 'Teacher', '808-214-7760', 'student298@example.com', '298', '299', 'Monserrat Stoltenberg', '1-563-306-7704', 'student300@example.com', '300', 'Aunt', 1, 10, 5, '2025-11-18', 'N/A', 301, 929904301, NULL, NULL, NULL, NULL, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(46, 'Shamim', 'Hossain', '2001-12-31', 'Male', 'A+', 'Islam', 'Bangladeshi', '123456789', '123456789', 'info@shamim.com', '$2y$12$Ezqy3YzEECBLJx91JIhd6uqhCi2EkQiRE/Y8bLn68KtlpYQ403dlK', 'Dhaka', 'Sirajganj', 'Jamsher Ali', 'Farmer', '123456789', 'father@gmail.com', '123456789', NULL, 'Let-Shofiya Begum', 'Housewife', '123456789', 'mother@gmail.com', '123456789', NULL, 'Jamsher Ali', '123456789', 'guardian@gmail.com', '123456789', 'Father', 1, 0, 2, NULL, NULL, NULL, NULL, 'std-Shamim-1763446150.jpg', 'std-Shamim-Jamsher Ali-1763446150.jpg', 'std-Shamim-Let-Shofiya Begum-1763446150.jpg', NULL, '2025-11-18 06:09:10', '2025-11-18 06:09:10');

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
(1, 'Bangla', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(2, 'English', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(3, 'ICT', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(4, 'Physical Education', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(5, 'Physics', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(6, 'Chemistry', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(7, 'Biology', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(8, 'Higher Mathematics', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(9, 'Accounting', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(10, 'Business Organization & Management', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(11, 'Finance, Banking & Insurance', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(12, 'Production Management & Marketing', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(13, 'Logic', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(14, 'History', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(15, 'Civics', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(16, 'Economics', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(17, 'Islamic Studies', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(18, 'Sociology', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(19, 'Social Work', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(20, 'Geography', 1, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(21, 'Bangla', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(22, 'English', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(23, 'ICT', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(24, 'Physical Education', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(25, 'Physics', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(26, 'Chemistry', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(27, 'Biology', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(28, 'Higher Mathematics', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(29, 'Accounting', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(30, 'Business Organization & Management', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(31, 'Finance, Banking & Insurance', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(32, 'Production Management & Marketing', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(33, 'Logic', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(34, 'History', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(35, 'Civics', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(36, 'Economics', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(37, 'Islamic Studies', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(38, 'Sociology', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(39, 'Social Work', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(40, 'Geography', 2, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(41, 'Bangla', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(42, 'English', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(43, 'ICT', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(44, 'Physical Education', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(45, 'Physics', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(46, 'Chemistry', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(47, 'Biology', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(48, 'Higher Mathematics', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(49, 'Accounting', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(50, 'Business Organization & Management', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(51, 'Finance, Banking & Insurance', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(52, 'Production Management & Marketing', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(53, 'Logic', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(54, 'History', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(55, 'Civics', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(56, 'Economics', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(57, 'Islamic Studies', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(58, 'Sociology', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(59, 'Social Work', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(60, 'Geography', 3, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(61, 'Bangla', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(62, 'English', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(63, 'ICT', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(64, 'Physical Education', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(65, 'Physics', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(66, 'Chemistry', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(67, 'Biology', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(68, 'Higher Mathematics', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(69, 'Accounting', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(70, 'Business Organization & Management', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(71, 'Finance, Banking & Insurance', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(72, 'Production Management & Marketing', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(73, 'Logic', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(74, 'History', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(75, 'Civics', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(76, 'Economics', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(77, 'Islamic Studies', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(78, 'Sociology', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(79, 'Social Work', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(80, 'Geography', 4, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(81, 'Bangla', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(82, 'English', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(83, 'ICT', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(84, 'Physical Education', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(85, 'Physics', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(86, 'Chemistry', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(87, 'Biology', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(88, 'Higher Mathematics', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(89, 'Accounting', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(90, 'Business Organization & Management', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(91, 'Finance, Banking & Insurance', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(92, 'Production Management & Marketing', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(93, 'Logic', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(94, 'History', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(95, 'Civics', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(96, 'Economics', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(97, 'Islamic Studies', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(98, 'Sociology', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(99, 'Social Work', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13'),
(100, 'Geography', 5, '2025-11-18 05:35:13', '2025-11-18 05:35:13');

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
(1, 'Claud', 'Hartmann', '1975-02-16', 'Male', 'B+', '0', '(412) 714-7687', 'teacher1@example.com', '$2y$12$hMc5.dqZcsL/VXaUNJNHEOWh4PDLw88F10rLwMmYiN4BNrPEZAQOK', 'Lecturer', '7518 Augustus Field\nRodgerstad, CO 39781', 'Aurelio Thiel', '+1.760.314.7533', 'Christelle Monahan', '+1-346-463-4900', 'Eliseo Ebert', '1-757-349-4857', 'Grandparent', NULL, NULL, NULL, '1978-03-19', '1979-10-11', 'N/A', 'D001', 1, 'N/A', 'EQFApv8fMnLRRUaTc15wqvDIrJOqjnrsjQzWaJahMiN0yyHHsLGw2pBBgmjp', '2025-11-18 05:35:02', '2025-11-18 05:35:02'),
(2, 'Kory', 'Beahan', '1975-06-04', 'Other', 'B-', '2', '+1-239-637-2888', 'teacher2@example.com', '$2y$12$RHsw/oxIFzJCc2LDLdsHi./RcM9QXF0CWgUrdtitZXIz5RHnZ6uxC', 'Head of Department', '341 Bode Street Suite 365\nNew Frankiechester, MS 66425-1791', 'Gonzalo Schulist', '+1-559-665-0443', 'Dr. Esperanza Sanford', '+1.276.285.8627', 'Kaela Robel', '712.712.4057', 'Brother', NULL, NULL, NULL, '2018-03-13', '1972-09-10', 'N/A', 'D003', 1, 'N/A', NULL, '2025-11-18 05:35:02', '2025-11-18 05:35:02'),
(3, 'Adelle', 'Rutherford', '1983-01-11', 'Other', 'A+', '4', '+1-772-780-3045', 'teacher3@example.com', '$2y$12$yGehHoQyfJZqx1VPkb.bbuYA6Wqp5y1NgiMJwd2XQz9GK880nPqay', 'Head of Department', '414 Beau Spring\nSouth Floyberg, NE 15411-8623', 'Mr. Howell Stiedemann III', '+1 (878) 234-6191', 'Clementine White I', '(520) 491-7224', 'Neal Kunze', '602-371-8626', 'Aunt', NULL, NULL, NULL, '2009-09-01', '2012-08-16', 'N/A', 'D005', 1, 'N/A', NULL, '2025-11-18 05:35:02', '2025-11-18 05:35:02'),
(4, 'Amya', 'Hickle', '1972-09-30', 'Male', 'A+', '6', '720.683.2719', 'teacher4@example.com', '$2y$12$PaOjtW7EDIKgm6RJ6ocri.MK5v/vkxse109fkX1SLpvxgczBN51ia', 'Lecturer', '288 Harvey Coves\nJusticemouth, MT 49397', 'Jeffry Walter III', '+1 (361) 876-8686', 'Ashleigh Rohan', '+1.781.503.3076', 'Turner Schmeler', '(443) 879-5792', 'Grandparent', NULL, NULL, NULL, '1978-07-14', '2021-12-28', 'N/A', 'D007', 1, 'N/A', NULL, '2025-11-18 05:35:02', '2025-11-18 05:35:02'),
(5, 'Martine', 'Reichel', '1976-04-07', 'Female', 'AB+', '8', '858-388-0191', 'teacher5@example.com', '$2y$12$/r1F3/aA9RWQk/.AD34AZ.7Tq3KgNx7LWX7WKdDRZ2RveYe2h6ex.', 'Assistant Professor', '9693 Kira Estates\nPort Horacio, SD 33776-5787', 'Otto Treutel', '+1 (623) 799-2467', 'Mrs. Betty Gottlieb', '562.521.9044', 'Willy Nader Sr.', '(341) 787-9865', 'Uncle', NULL, NULL, NULL, '1992-07-06', '2018-12-26', 'N/A', 'D009', 1, 'N/A', NULL, '2025-11-18 05:35:03', '2025-11-18 05:35:03'),
(6, 'Carlee', 'Strosin', '1985-10-06', 'Female', 'A-', '10', '+1.915.310.3192', 'teacher6@example.com', '$2y$12$Ef5YR6hYlhSCeNv6vOjpqOCVrWelbgvsN4np90Nas9ZDsMniJm9.a', 'Lecturer', '7095 Nader Overpass Suite 501\nNorth Nelsontown, CO 30725', 'Mr. Fredy Murphy', '+1-862-735-8848', 'Gilda Pfeffer', '1-281-601-4613', 'Judd Feil', '952.808.2151', 'Aunt', NULL, NULL, NULL, '1981-09-02', '2022-06-29', 'N/A', 'D0011', 1, 'N/A', NULL, '2025-11-18 05:35:03', '2025-11-18 05:35:03'),
(7, 'Billy', 'Batz', '1977-08-30', 'Female', 'A-', '12', '+1-956-614-4600', 'teacher7@example.com', '$2y$12$PM7D6wUW7fbgCisPOrJbaubiJGndZRsBrQ6G0t4ICyi.AiPWZM3Qe', 'Assistant Professor', '2106 Nikolaus Ways Apt. 239\nEmmaborough, MA 62729', 'Bertha Zulauf', '1-240-982-1986', 'Breanna Frami', '718-822-7592', 'Silas Harber MD', '920-853-6818', 'Brother', NULL, NULL, NULL, '1976-01-10', '1993-03-02', 'N/A', 'D0013', 1, 'N/A', NULL, '2025-11-18 05:35:03', '2025-11-18 05:35:03'),
(8, 'Kareem', 'Wehner', '1975-06-04', 'Other', 'B-', '14', '1-272-407-9117', 'teacher8@example.com', '$2y$12$zG6tTympXET971AMuDpeZO47H8TNO2ckuwnz7oHkBHdKSHo/DpUL.', 'Assistant Professor', '9394 Keenan Lodge Suite 169\nMarleetown, MD 32376-0523', 'Mr. Baron Schinner V', '+1 (534) 297-0342', 'Miss Ocie Effertz', '(432) 865-9217', 'Chelsey Hane', '571.465.6713', 'Grandparent', NULL, NULL, NULL, '2001-06-08', '1978-07-01', 'N/A', 'D0015', 1, 'N/A', NULL, '2025-11-18 05:35:03', '2025-11-18 05:35:03'),
(9, 'Cornelius', 'Lynch', '1984-12-01', 'Male', 'AB+', '16', '1-279-799-4865', 'teacher9@example.com', '$2y$12$rGxZurFoCF7yMr9XdCudiuvWv1kNULCg9cJk7J6MVq6LVFCaEimFi', 'Senior Teacher', '6909 Oberbrunner Mews Apt. 538\nNorth Rollinborough, NV 49387', 'Scot Halvorson DVM', '+1-413-691-3541', 'Miss Aryanna Thompson', '+16604907709', 'Sunny Kuphal IV', '+1 (364) 547-1773', 'Grandparent', NULL, NULL, NULL, '1970-11-08', '1984-12-31', 'N/A', 'D0017', 1, 'N/A', NULL, '2025-11-18 05:35:03', '2025-11-18 05:35:03'),
(10, 'Ray', 'Erdman', '1982-11-01', 'Male', 'O+', '18', '+1 (352) 860-2225', 'teacher10@example.com', '$2y$12$epUA5hGgyGd.iR1fYSfUpelVWixerMyBHLt0tLqN8VfVQPRDKUXNi', 'Head of Department', '687 Ronaldo Green\nCrawfordton, SD 04902', 'Prof. Haskell Jaskolski DVM', '+1.310.512.1797', 'Faye Reichel', '917.212.1163', 'Miss Noemy Macejkovic MD', '(862) 473-1898', 'Uncle', NULL, NULL, NULL, '1982-10-08', '2020-09-19', 'N/A', 'D0019', 1, 'N/A', NULL, '2025-11-18 05:35:04', '2025-11-18 05:35:04'),
(11, 'Makayla', 'Krajcik', '1985-01-18', 'Male', 'A-', '20', '361.852.9645', 'teacher11@example.com', '$2y$12$0xRfA1K8gVPLVT6GjdEh4.hnML.0x7I7aOYDVsfaqQWreALbetFk2', 'Head of Department', '167 Godfrey Forges Suite 807\nDonnyport, WA 56973-2338', 'Florencio Lakin V', '+1-678-214-8353', 'Jessica Bradtke', '+1.508.378.2899', 'Adela Johns', '432.885.8159', 'Brother', NULL, NULL, NULL, '1989-12-10', '2008-03-07', 'N/A', 'D0021', 1, 'N/A', NULL, '2025-11-18 05:35:04', '2025-11-18 05:35:04'),
(12, 'Hipolito', 'Tillman', '1987-06-29', 'Other', 'A-', '22', '+1 (520) 700-5823', 'teacher12@example.com', '$2y$12$YU1PRt7CUtQhFrQb9CQLGePefWvPbqc.YhvJ8JYXLzIZKVO4S98wi', 'Head of Department', '2700 Larson Flat Suite 306\nSouth Margarettfurt, IN 64912-0568', 'Prof. Gonzalo Kassulke I', '502-306-4485', 'Erika Runolfsson', '857-657-9122', 'Aimee Block III', '762.904.2585', 'Aunt', NULL, NULL, NULL, '2001-12-11', '2019-04-08', 'N/A', 'D0023', 1, 'N/A', NULL, '2025-11-18 05:35:04', '2025-11-18 05:35:04'),
(13, 'Angelina', 'Kling', '1975-06-23', 'Other', 'AB-', '24', '+1.854.858.5346', 'teacher13@example.com', '$2y$12$3QiOOulvtudDeWPjbu9xcugfmwwgbidAhknhwNpSWuOmSZRVmpFFC', 'Lecturer', '81708 Emily Trace\nHoraceview, VT 34898-6093', 'Craig Gleichner', '253.971.5774', 'Gladys Hudson', '+1-828-524-4756', 'Ottilie Thompson', '+1.252.821.1015', 'Grandparent', NULL, NULL, NULL, '1984-02-02', '1984-09-15', 'N/A', 'D0025', 1, 'N/A', NULL, '2025-11-18 05:35:04', '2025-11-18 05:35:04'),
(14, 'Torrance', 'Oberbrunner', '1972-10-19', 'Male', 'AB+', '26', '+1 (220) 274-4744', 'teacher14@example.com', '$2y$12$CAwedBb4tDDgW6KwjRxq2.pNuvsHuhQSIrAWPBgNw6KE0zPLSKdEW', 'Assistant Professor', '80445 Laurine Flats\nAllenestad, IA 36324-7118', 'Mr. Gilbert Schimmel', '458-858-1700', 'Dr. Gerry Dietrich DVM', '838.765.1856', 'Andreanne White', '262-917-9162', 'Aunt', NULL, NULL, NULL, '1975-03-25', '1998-01-18', 'N/A', 'D0027', 1, 'N/A', NULL, '2025-11-18 05:35:04', '2025-11-18 05:35:04'),
(15, 'Gisselle', 'Reichel', '1979-01-17', 'Female', 'O+', '28', '1-743-779-7711', 'teacher15@example.com', '$2y$12$Htcuq7CBEhBdcW0/ra/vq.c5pYRr2DenZyczAh9.5cYbXTp7VA8bC', 'Assistant Professor', '308 Laurence Common Suite 511\nWest Marge, ID 85312', 'Lavern Bednar', '847.525.1828', 'Mrs. Abagail Jast', '(410) 870-1829', 'Hellen Medhurst', '+1-541-506-0335', 'Aunt', NULL, NULL, NULL, '1990-08-22', '2011-10-29', 'N/A', 'D0029', 1, 'N/A', NULL, '2025-11-18 05:35:04', '2025-11-18 05:35:04');

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
  ADD UNIQUE KEY `attendances_student_id_attendance_date_unique` (`student_id`,`attendance_date`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
