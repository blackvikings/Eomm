-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 01:42 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `area` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(11) NOT NULL,
  `full_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `area`, `city`, `zip`, `full_address`, `created_at`, `updated_at`) VALUES
(1, 'cxfvxcvcxcvxcvxc', 'xcvxzcvx', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-29 09:05:34', '2021-05-29 19:41:50'),
(2, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-29 20:45:39', '2021-05-29 20:45:39'),
(3, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-29 21:34:57', '2021-05-29 21:34:57'),
(4, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-29 21:35:18', '2021-05-29 21:35:18'),
(5, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-29 21:37:44', '2021-05-29 21:37:44'),
(6, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-29 21:37:46', '2021-05-29 21:37:46'),
(7, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-30 10:24:51', '2021-05-30 10:24:51'),
(8, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-30 10:26:17', '2021-05-30 10:26:17'),
(9, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-30 10:26:21', '2021-05-30 10:26:21'),
(10, 'City', 'Korba', 495677, 'T.P. Nagar Korba ward no. 2 house no. 350', '2021-05-30 10:46:53', '2021-05-30 10:46:53'),
(11, 'abc Road', 'Kolkata', 700009, 'abc Road', '2021-05-30 10:49:00', '2021-05-30 10:49:00'),
(12, 'xcvxcv xcvcxv', 'cxvvxcvxcvxcvxc', 495677, NULL, '2021-05-30 10:56:12', '2021-05-30 10:56:12'),
(13, 'akra', 'kolkata', 700141, 'akra', '2021-05-30 18:46:19', '2021-05-30 18:46:19'),
(14, 'akra', 'kolkata', 700141, NULL, '2021-05-30 19:22:43', '2021-05-30 19:22:43'),
(15, 'abc', 'abc', 700141, 'abc', '2021-05-30 22:14:52', '2021-05-30 22:14:52'),
(16, 'abc', 'abc', 700141, 'abc', '2021-05-30 22:15:59', '2021-05-30 22:15:59'),
(17, 'abc', 'abc', 700141, 'abc', '2021-05-30 22:17:08', '2021-05-30 22:17:08'),
(18, 'Rabindrapally 2nd lane', 'malda', 732101, 'Rabindrapally 2nd lane', '2021-05-30 22:26:44', '2021-05-30 22:26:44'),
(19, 'Rabindrapally 2nd lane', 'malda', 732101, NULL, '2021-05-30 22:30:40', '2021-05-30 22:30:40'),
(20, 'abc', 'abc', 700141, 'abc', '2021-05-30 22:31:04', '2021-05-30 22:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `name`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'Password', 'calcutta medicine', '2018-08-27 18:30:00', '2018-08-27 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `product_name`, `price`, `image`, `created_at`, `updated_at`, `user_id`, `qty`) VALUES
(1, 1, NULL, NULL, NULL, '2021-05-29 19:10:40', '2021-05-29 19:10:40', 5, NULL),
(2, 1, NULL, NULL, NULL, '2021-05-29 19:11:13', '2021-05-29 19:11:13', 5, NULL),
(3, 1, NULL, NULL, NULL, '2021-05-29 19:11:17', '2021-05-29 19:11:17', 5, NULL),
(4, 1, NULL, NULL, NULL, '2021-05-29 20:31:31', '2021-05-29 20:31:31', 5, NULL),
(5, 1, NULL, NULL, NULL, '2021-05-29 20:36:32', '2021-05-29 20:36:32', 1, '5'),
(6, 1, NULL, NULL, NULL, '2021-05-29 20:37:27', '2021-05-29 20:37:27', 1, '5'),
(7, 1, NULL, NULL, NULL, '2021-05-29 20:42:01', '2021-05-29 20:42:01', 1, '2'),
(8, 1, NULL, NULL, NULL, '2021-05-29 20:42:25', '2021-05-29 20:42:25', 1, '3'),
(9, 1, NULL, NULL, NULL, '2021-05-30 08:50:52', '2021-05-30 08:50:52', 1, '5');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `created_at`, `updated_at`, `images`) VALUES
(1, 'hello world 1', 'hello world 1', '2021-05-22 11:07:55', '2021-05-22 11:07:55', 'uploads/categories/1621667275.png'),
(2, 'hello world 2', 'hello world 2', '2021-05-22 11:08:13', '2021-05-22 11:08:13', 'uploads/categories/1621667293.png'),
(3, 'hello world 3', 'hello world 3', '2021-05-22 11:08:29', '2021-05-22 11:08:29', 'uploads/categories/1621667309.png'),
(4, 'new testing', 'new testing', '2021-05-30 20:46:49', '2021-05-30 20:46:49', 'uploads/categories/1622393209.png'),
(5, 'new  testing  2', 'hello world 3', '2021-05-30 23:09:44', '2021-05-30 23:09:44', 'uploads/categories/1622401783.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `compositions`
--

CREATE TABLE `compositions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compositions`
--

INSERT INTO `compositions` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'gerrgdf', '2021-05-29 15:09:59', '2021-05-29 15:09:59'),
(2, 'dfhgfdghdfgb', '2021-05-29 15:10:03', '2021-05-29 15:10:03'),
(3, 'fdgbfbf', '2021-05-29 15:10:05', '2021-05-29 15:10:05'),
(4, 'new testing', '2021-05-30 20:48:26', '2021-05-30 20:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_requests`
--

CREATE TABLE `medicine_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicine_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_04_19_173215_create_admins_table', 1),
(2, '2020_04_19_175655_create_addresses_table', 1),
(3, '2020_04_19_175938_create_categories_table', 1),
(4, '2020_04_20_141633_create_products_table', 1),
(5, '2020_04_20_142309_create_users_table', 1),
(6, '2020_04_20_142632_create_sales_table', 1),
(7, '2021_03_16_122739_add_api_token_user_table', 2),
(8, '2021_03_17_104806_create_table_upload_prescrition', 3),
(9, '2021_03_18_055021_add_timestamp_coloms_in_upload_prescription_table', 4),
(10, '2021_03_18_070844_create_carts_table', 5),
(11, '2021_03_18_071700_add_coloum_user_id_in_cart_table', 5),
(12, '2021_04_02_033536_add_coloum_in_prescriptions_table', 6),
(14, '2021_04_16_173932_add_coloum_images_in_categories', 8),
(15, '2021_04_16_175024_create_media_table', 9),
(16, '2021_05_02_135107_create_compositions_table', 10),
(17, '2021_05_03_101213_create_medicine_requests_table', 11),
(18, '2021_05_03_110858_create_notifications_table', 12),
(19, '2021_05_29_104331_add_cmposition_id_in_products_table', 13),
(20, '2021_05_29_162734_add_coloums_in_carts_table', 14),
(21, '2021_04_14_115113_create_product_sale', 15),
(22, '2021_05_29_190402_create_sale_details_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `name`, `age`, `weight`, `email`, `gender`, `mobile`, `user_id`, `title`, `created_at`, `updated_at`) VALUES
(4, 'szkdjjbvcbjhbzxdvcjhbsdjhbv', '56', '56', 'test@test.com', 'male', '7894561230', 1, 'uploads/prescription/image_1622459609.png', '2021-05-31 05:43:29', '2021-05-31 05:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `composition_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image_name`, `description`, `colors`, `price`, `discount`, `tag`, `category_id`, `composition_id`, `created_at`, `updated_at`) VALUES
(7, 'hello world 2', 'uploads/products/7/1.jpg', 'dxfcvdfvb dfvbcdv bcv sdfvbcv xcdfbcxv bxcv dfvxcvxcv  xcvxcdfvsdvcvffbfgnb', '#ce3636', 560, 200, 'fbgbg vcfdcnbvcfgbcvgdrxcfb', 2, 1, '2021-05-31 06:07:45', '2021-05-31 06:07:46'),
(8, 'hello world 3', 'uploads/products/8/1.jpg', 'cflihjjgifldhgkjb gvejhdfbjhdbjhfvbjhsdbfjhykbvjkndbkjvbjshdvbfhj', NULL, 25, 78, NULL, 1, 1, '2021-05-31 06:25:17', '2021-05-31 06:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_sale`
--

CREATE TABLE `product_sale` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sale`
--

INSERT INTO `product_sale` (`id`, `product_id`, `sale_id`) VALUES
(1, 7, 1),
(2, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `product_id`, `order_status`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'On Process', NULL, '2021-05-31 06:43:33', '2021-05-31 07:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(10) UNSIGNED NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, '2', '2021-05-31 06:43:33', '2021-05-31 06:43:33'),
(2, 1, '3', '2021-05-31 06:43:33', '2021-05-31 06:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `prev_password`, `address_id`, `created_at`, `updated_at`, `api_token`) VALUES
(1, 'Hello Wolrd', 'test@test123.com', '12345', '01711001133', NULL, 1, '2019-02-08 18:30:00', '2021-05-30 10:25:11', 'TnZxMG54ektXV1BvbmFHZXcwSWQyY2lreDdTcFVtM2w3SHlHdlhPa3dYWFdmN3BNUXRwbUJWcGIzQXI360b32fc76d49e'),
(2, 'Shakib Mostahid', 'b@gmail.com', '12345', '01922991100', NULL, 2, '2019-02-10 18:30:00', '2019-02-10 18:30:00', NULL),
(3, 'Nishat Ashraf', 'c@gmail.com', '12345', '01899001144', NULL, 3, '2019-02-10 18:30:00', '2019-02-10 18:30:00', NULL),
(4, 'Ayomi Hridy', 'd@gmail.com', '12345', '0111111111', NULL, 4, '2019-02-10 18:30:00', '2019-02-10 18:30:00', NULL),
(5, 'Hello Wolrd', 'test@test123.com', NULL, '8697604919', NULL, 12, NULL, '2021-05-30 16:56:57', 'YUlyNzEyaUN6R2hmQXJDU2xMWVpORldOeVAza2duNnRzRDFHVTB6eEZEZExsbEY4dWNCSDlUQXNTRUVU60b38b997fdda'),
(6, 'joy', 'abc@gmail.com', NULL, '+918697604919', NULL, 14, NULL, '2021-05-30 22:31:04', 'WVVYZUpoU3RuMG8zdFl0ODZWUmtjUU42d3J2Y0NSOU5kMGVNOURFWnc1WHRhWXFHVUNyOWR2VEVXZlRF60b3d9ce72803'),
(7, 'Sourav Saha', 'mesourav2021@gmail.com', NULL, '+917001865588', NULL, 19, NULL, '2021-05-30 22:30:40', 'eWwxd0I1ZXIyZzZZOVU3Z3M4QWhtVXh4OVpHWEtDOWVSZVhBQlhKSlNYWmVCeDhXNFlzc2Fhc25xV2JK60b3d8c61b282');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `compositions`
--
ALTER TABLE `compositions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_requests`
--
ALTER TABLE `medicine_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_composition_id_foreign` (`composition_id`);

--
-- Indexes for table `product_sale`
--
ALTER TABLE `product_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sale_product_id_foreign` (`product_id`),
  ADD KEY `product_sale_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_address_id_foreign` (`address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `compositions`
--
ALTER TABLE `compositions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_requests`
--
ALTER TABLE `medicine_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_sale`
--
ALTER TABLE `product_sale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_composition_id_foreign` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
