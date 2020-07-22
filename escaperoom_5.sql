-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2020 at 04:35 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escaperoom_5`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing_plans`
--

CREATE TABLE `billing_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'title of billing plans',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Currency',
  `is_tax_percentage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Amount;1-Percentage',
  `tax_value` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tax value of billing plans',
  `plan_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: For flat,1: For price per head',
  `amount` double(20,3) NOT NULL DEFAULT '0.000' COMMENT 'Amount of billing plan',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_plans`
--

INSERT INTO `billing_plans` (`id`, `title`, `currency`, `is_tax_percentage`, `tax_value`, `plan_type`, `amount`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Paypal', 'usd', 10, NULL, 0, 55.750, 1, 1, NULL, NULL, NULL, NULL),
(2, 'abc', 'aud', 0, '500', 1, 0.000, 1, 1, 1, '2020-05-06 01:46:15', '2020-05-06 02:38:50', NULL),
(3, 'paytm', 'inr', 1, '18', 1, 0.000, 1, 1, 1, '2020-05-06 02:39:22', '2020-05-10 04:36:57', NULL),
(4, 'xyz', 'usd', 0, '500', 1, 0.000, 1, 1, 1, '2020-05-06 02:52:56', '2020-05-06 02:55:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_plans_participants`
--

CREATE TABLE `billing_plans_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billing_plan_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reffernce key of billing plan',
  `participant_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Participatn number of billing plans',
  `amount` double(20,3) NOT NULL COMMENT 'Amount of participant',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_plans_participants`
--

INSERT INTO `billing_plans_participants` (`id`, `billing_plan_id`, `participant_number`, `amount`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, '1', 100.000, 1, 1, 1, '2020-05-06 02:24:04', '2020-05-06 02:31:14', NULL),
(2, 2, '2', 45.000, 1, 1, 1, '2020-05-06 02:24:04', '2020-05-06 02:31:14', NULL),
(3, 2, '1', 22.000, 1, 1, 1, '2020-05-06 02:32:12', '2020-05-06 02:32:24', '2020-04-30 18:30:00'),
(4, 2, '3', 44.500, 1, 1, 1, '2020-05-06 02:32:12', '2020-05-06 02:32:24', NULL),
(5, 4, '1', 50.000, 1, 1, 1, '2020-05-06 02:52:56', '2020-05-06 02:54:24', '2020-05-06 02:54:24'),
(6, 4, '2', 100.000, 1, 1, 1, '2020-05-06 02:52:56', '2020-05-06 02:54:24', '2020-05-06 02:54:24'),
(7, 4, '3', 200.000, 1, 1, 1, '2020-05-06 02:53:59', '2020-05-06 02:54:24', '2020-05-06 02:54:24'),
(8, 4, '1', 50.000, 1, 1, 1, '2020-05-06 02:55:30', '2020-05-06 02:55:57', NULL),
(9, 3, '2', 100.000, 1, 1, 1, '2020-05-06 02:55:30', '2020-05-06 02:55:57', NULL),
(10, 3, '1', 50.000, 1, 1, 1, '2020-05-10 04:36:57', '2020-05-10 04:36:57', NULL),
(11, 3, '3', 70.000, 1, 1, 1, '2020-05-10 04:36:57', '2020-05-10 04:36:57', NULL),
(12, 3, '4', 90.000, 1, 1, 1, '2020-05-10 04:36:57', '2020-05-10 04:36:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `er_access`
--

CREATE TABLE `er_access` (
  `access_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_public_id` char(64) DEFAULT NULL,
  `invoice_payment_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_item_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_id` varchar(64) DEFAULT NULL,
  `begin_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_access_cache`
--

CREATE TABLE `er_access_cache` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `fn` enum('product_id','product_category_id','user_group_id','special') NOT NULL,
  `id` int(11) NOT NULL,
  `days` int(11) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `payments_count` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','expired') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_access_cache`
--

INSERT INTO `er_access_cache` (`user_id`, `fn`, `id`, `days`, `begin_date`, `expire_date`, `payments_count`, `status`) VALUES
(0, 'special', 1, NULL, NULL, NULL, 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `er_access_log`
--

CREATE TABLE `er_access_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `time` datetime NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remote_addr` varchar(39) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_admin`
--

CREATE TABLE `er_admin` (
  `admin_id` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `name_f` varchar(64) NOT NULL,
  `name_l` varchar(64) NOT NULL,
  `pass` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_ip` varchar(39) DEFAULT NULL,
  `last_session` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `super_user` smallint(6) NOT NULL DEFAULT '0',
  `perms` text,
  `prefs` blob,
  `lang` varchar(32) DEFAULT NULL,
  `reseller_id` int(11) DEFAULT NULL,
  `is_disabled` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_admin`
--

INSERT INTO `er_admin` (`admin_id`, `login`, `name_f`, `name_l`, `pass`, `last_login`, `last_ip`, `last_session`, `email`, `super_user`, `perms`, `prefs`, `lang`, `reseller_id`, `is_disabled`) VALUES
(1, 'admin', '', '', '$P$Fede3MdRiT8ltZxgLRux.8aR6LhAfv.', '2020-05-15 01:11:11', '127.0.0.1', '7cn8ncg4milpo4u70jsctvfdfl', 'admin@mail.com', 1, NULL, 0x613a313a7b733a31373a2264617368626f6172642d77696467657473223b613a343a7b733a333a22746f70223b613a303a7b7d733a363a22626f74746f6d223b613a303a7b7d733a343a226d61696e223b613a323a7b693a303b733a353a227573657273223b693a313b733a383a227061796d656e7473223b7d733a353a226173696465223b613a343a7b693a303b733a353a2273616c6573223b693a313b733a383a226163746976697479223b693a323b733a31323a227265706f72742d7573657273223b693a333b733a393a22757365722d6e6f7465223b7d7d7d, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `er_admin_log`
--

CREATE TABLE `er_admin_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `dattm` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(39) DEFAULT NULL,
  `tablename` varchar(32) NOT NULL,
  `record_id` varchar(32) DEFAULT NULL,
  `message` text,
  `admin_login` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_admin_log`
--

INSERT INTO `er_admin_log` (`log_id`, `dattm`, `admin_id`, `ip`, `tablename`, `record_id`, `message`, `admin_login`) VALUES
(1, '2020-03-23 14:38:50', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(2, '2020-03-24 12:16:24', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(3, '2020-03-24 12:18:28', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(4, '2020-03-24 12:18:46', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(5, '2020-03-25 07:21:31', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(6, '2020-03-25 07:25:44', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(7, '2020-03-25 07:26:03', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(8, '2020-03-25 07:43:34', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(9, '2020-03-25 07:43:44', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(10, '2020-03-25 07:44:25', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(11, '2020-03-25 07:44:56', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(12, '2020-03-25 07:45:39', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(13, '2020-03-25 07:50:15', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(14, '2020-03-25 07:52:03', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(15, '2020-03-25 07:52:10', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(16, '2020-03-25 07:53:08', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(17, '2020-03-26 17:39:53', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(18, '2020-03-26 18:24:13', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(19, '2020-03-26 18:24:26', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(20, '2020-03-26 18:24:39', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(21, '2020-03-26 18:35:09', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(22, '2020-03-27 12:11:19', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(23, '2020-03-28 07:11:25', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(24, '2020-03-30 17:10:05', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(25, '2020-03-30 18:28:22', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(26, '2020-03-30 19:46:16', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(27, '2020-03-30 20:29:01', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(28, '2020-03-30 20:29:12', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(29, '2020-03-30 20:29:22', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(30, '2020-03-30 20:30:18', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(31, '2020-03-30 20:30:24', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(32, '2020-03-30 20:44:52', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(33, '2020-03-30 21:02:23', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(34, '2020-04-17 23:38:07', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(35, '2020-04-18 15:47:11', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(36, '2020-04-18 16:14:08', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(37, '2020-04-18 22:39:26', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(38, '2020-04-20 19:37:58', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(39, '2020-04-20 22:26:53', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(40, '2020-04-21 12:00:16', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(41, '2020-04-22 15:59:19', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(42, '2020-04-22 22:23:25', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(43, '2020-04-22 23:38:48', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(44, '2020-04-23 22:14:23', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(45, '2020-04-25 12:52:34', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(46, '2020-04-25 16:27:27', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(47, '2020-04-26 13:23:06', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(48, '2020-04-27 11:28:14', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(49, '2020-04-28 00:06:01', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(50, '2020-04-28 10:49:05', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(51, '2020-04-28 15:59:08', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(52, '2020-04-28 17:55:03', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(53, '2020-04-29 11:40:44', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(54, '2020-04-29 23:22:59', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(55, '2020-04-30 16:13:16', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(56, '2020-05-01 16:19:23', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(57, '2020-05-01 23:23:48', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(58, '2020-05-02 16:04:25', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(59, '2020-05-02 22:11:28', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(60, '2020-05-03 14:10:03', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(61, '2020-05-03 14:12:47', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(62, '2020-05-03 16:26:49', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(63, '2020-05-04 12:17:23', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(64, '2020-05-04 18:25:54', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(65, '2020-05-05 10:09:55', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(66, '2020-05-05 22:04:48', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(67, '2020-05-06 10:17:12', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(68, '2020-05-06 11:45:23', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(69, '2020-05-07 11:26:44', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(70, '2020-05-07 15:17:39', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(71, '2020-05-09 14:22:00', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(72, '2020-05-09 17:47:21', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(73, '2020-05-09 18:29:32', 1, '127.0.0.1', '', '0', 'Logged out', 'admin'),
(74, '2020-05-09 18:29:35', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(75, '2020-05-10 11:36:13', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(76, '2020-05-10 12:42:23', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(77, '2020-05-11 11:17:16', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(78, '2020-05-12 10:06:00', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(79, '2020-05-12 22:37:02', 1, '127.0.0.1', '', '0', 'Logged in', 'admin'),
(80, '2020-05-15 01:11:11', 1, '127.0.0.1', '', '0', 'Logged in', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `er_agreement`
--

CREATE TABLE `er_agreement` (
  `agreement_revision_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `body` mediumtext,
  `comment` varchar(255) DEFAULT NULL,
  `dattm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_current` tinyint(4) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_robots` set('noindex','nofollow','noarchive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_ban`
--

CREATE TABLE `er_ban` (
  `ban_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_billing_plan`
--

CREATE TABLE `er_billing_plan` (
  `plan_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `terms` varchar(255) NOT NULL,
  `first_price` decimal(12,2) NOT NULL,
  `first_period` varchar(32) NOT NULL,
  `rebill_times` int(11) NOT NULL DEFAULT '0',
  `second_price` decimal(12,2) DEFAULT NULL,
  `second_period` varchar(32) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '1',
  `variable_qty` tinyint(4) NOT NULL DEFAULT '0',
  `currency` char(3) DEFAULT NULL,
  `paysys_id` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_billing_plan`
--

INSERT INTO `er_billing_plan` (`plan_id`, `product_id`, `title`, `terms`, `first_price`, `first_period`, `rebill_times`, `second_price`, `second_period`, `disabled`, `qty`, `variable_qty`, `currency`, `paysys_id`, `sort_order`) VALUES
(1, 1, 'Default Billing Plan', '', '1.11', '1d', 99999, '2.22', '2d', 0, 1, 0, 'USD', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `er_button`
--

CREATE TABLE `er_button` (
  `button_id` int(11) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `use_coupons` tinyint(4) DEFAULT '0',
  `coupon` varchar(255) DEFAULT NULL,
  `is_disabled` tinyint(4) DEFAULT '0',
  `paysys_id` varchar(255) DEFAULT NULL,
  `billing_plan_id` varchar(255) DEFAULT NULL,
  `saved_form_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_cc`
--

CREATE TABLE `er_cc` (
  `cc_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `paysys_id` varchar(128) DEFAULT NULL,
  `token` text,
  `cc` varchar(25) DEFAULT NULL,
  `cc_number` varchar(255) DEFAULT NULL,
  `cc_expire` char(4) DEFAULT NULL,
  `cc_name_f` varchar(128) DEFAULT NULL,
  `cc_name_l` varchar(128) DEFAULT NULL,
  `cc_country` varchar(255) DEFAULT NULL,
  `cc_street` varchar(255) DEFAULT NULL,
  `cc_street2` varchar(255) DEFAULT NULL,
  `cc_city` varchar(255) DEFAULT NULL,
  `cc_state` varchar(255) DEFAULT NULL,
  `cc_zip` varchar(255) DEFAULT NULL,
  `cc_company` varchar(255) DEFAULT NULL,
  `cc_phone` varchar(255) DEFAULT NULL,
  `cc_housenumber` varchar(255) DEFAULT NULL,
  `cc_province` varchar(50) DEFAULT NULL,
  `cc_issuenum` varchar(25) DEFAULT NULL,
  `cc_startdate` varchar(12) DEFAULT NULL,
  `cc_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_cc_rebill`
--

CREATE TABLE `er_cc_rebill` (
  `cc_rebill_id` int(11) NOT NULL,
  `tm_added` datetime NOT NULL,
  `paysys_id` varchar(64) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `rebill_date` date DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `status_tm` datetime DEFAULT NULL,
  `status_msg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_config`
--

CREATE TABLE `er_config` (
  `config_id` int(10) UNSIGNED NOT NULL,
  `name` char(64) NOT NULL,
  `config` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_config`
--

INSERT INTO `er_config` (`config_id`, `name`, `config`) VALUES
(1, 'default', 0x613a32333a7b733a383a22726f6f745f75726c223b733a35353a22687474703a2f2f74657374322e6368656c6d73666f7264636f6d6d756e697479726164696f2e636f6d2f636f6e74726f6c70616e656c2f223b733a393a22726f6f745f7375726c223b733a35353a22687474703a2f2f74657374322e6368656c6d73666f7264636f6d6d756e697479726164696f2e636f6d2f636f6e74726f6c70616e656c2f223b733a31313a2261646d696e5f656d61696c223b733a31343a2261646d696e406d61696c2e636f6d223b733a31363a226c6f67696e5f6d696e5f6c656e677468223b733a313a2236223b733a31363a226c6f67696e5f6d61785f6c656e677468223b733a323a223332223b733a31353a22706173735f6d696e5f6c656e677468223b733a313a2236223b733a31353a22706173735f6d61785f6c656e677468223b733a323a223332223b733a31363a22636c6561725f6163636573735f6c6f67223b733a313a2231223b733a32313a22636c6561725f6163636573735f6c6f675f64617973223b733a313a2237223b733a31323a226d61785f69705f636f756e74223b733a313a2235223b733a31333a226d61785f69705f706572696f64223b733a343a2231343430223b733a31313a226d756c74695f7469746c65223b733a31303a224d656d62657273686970223b733a31363a2273656e645f7369676e75705f6d61696c223b733a313a2231223b733a373a226c6963656e7365223b733a35383a224c533835497a636b7454737376536b6e4f7a3830747a6373737153784b544d6e4d31774e797259784d4c497a4e72414b432f4b334d6b67453158223b733a373a22706c7567696e73223b613a323a7b733a373a2270726f74656374223b613a313a7b693a303b733a31313a226e65772d72657772697465223b7d733a373a227061796d656e74223b613a313a7b693a303b733a363a2270617970616c223b7d7d733a31303a22736974655f7469746c65223b733a353a227465737432223b733a31353a22736b69705f696e6465785f70616765223b733a313a2231223b733a32333a226175746f5f6c6f67696e5f61667465725f7369676e7570223b733a313a2231223b733a31343a22656d61696c5f6c6f675f64617973223b693a31303b733a31323a22616c6c6f775f63616e63656c223b693a313b733a353a2261646d696e223b613a313a7b733a31353a227265636f7264732d6f6e2d70616765223b733a323a223235223b7d733a353a227468656d65223b733a31313a22736f6c69642d636f6c6f72223b733a31353a2272616e646f6d2d736974652d6b6579223b733a34303a2262366439333733643738336238663530613763623337353462343061383863373261373531366331223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `er_country`
--

CREATE TABLE `er_country` (
  `country_id` int(11) NOT NULL,
  `country` char(2) NOT NULL,
  `alpha2` char(2) NOT NULL,
  `alpha3` char(3) NOT NULL,
  `numeric` smallint(6) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `status` enum('added','changed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_country`
--

INSERT INTO `er_country` (`country_id`, `country`, `alpha2`, `alpha3`, `numeric`, `title`, `tag`, `status`) VALUES
(1, 'US', 'US', 'USA', 840, 'United States', 10, NULL),
(2, 'CA', 'CA', 'CAN', 124, 'Canada', 5, NULL),
(3, 'AF', 'AF', 'AFG', 4, 'Afghanistan', 0, NULL),
(4, 'AL', 'AL', 'ALB', 8, 'Albania', 0, NULL),
(5, 'DZ', 'DZ', 'DZA', 12, 'Algeria', 0, NULL),
(6, 'AS', 'AS', 'ASM', 16, 'American Samoa', 0, NULL),
(7, 'AD', 'AD', 'AND', 20, 'Andorra', 0, NULL),
(8, 'AO', 'AO', 'AGO', 24, 'Angola', 0, NULL),
(9, 'AI', 'AI', 'AIA', 660, 'Anguilla', 0, NULL),
(10, 'AQ', 'AQ', 'ATA', 10, 'Antarctica', 0, NULL),
(11, 'AG', 'AG', 'ATG', 28, 'Antigua and Barbuda', 0, NULL),
(12, 'AR', 'AR', 'ARG', 32, 'Argentina', 0, NULL),
(13, 'AM', 'AM', 'ARM', 51, 'Armenia', 0, NULL),
(14, 'AW', 'AW', 'ABW', 533, 'Aruba', 0, NULL),
(15, 'AU', 'AU', 'AUS', 36, 'Australia', 0, NULL),
(16, 'AT', 'AT', 'AUT', 40, 'Austria', 0, NULL),
(17, 'AZ', 'AZ', 'AZE', 31, 'Azerbaijan', 0, NULL),
(18, 'BS', 'BS', 'BHS', 44, 'Bahamas', 0, NULL),
(19, 'BH', 'BH', 'BHR', 48, 'Bahrain', 0, NULL),
(20, 'BD', 'BD', 'BGD', 50, 'Bangladesh', 0, NULL),
(21, 'BB', 'BB', 'BRB', 52, 'Barbados', 0, NULL),
(22, 'BY', 'BY', 'BLR', 112, 'Belarus', 0, NULL),
(23, 'BE', 'BE', 'BEL', 56, 'Belgium', 0, NULL),
(24, 'BZ', 'BZ', 'BLZ', 84, 'Belize', 0, NULL),
(25, 'BJ', 'BJ', 'BEN', 204, 'Benin', 0, NULL),
(26, 'BM', 'BM', 'BMU', 60, 'Bermuda', 0, NULL),
(27, 'BT', 'BT', 'BTN', 64, 'Bhutan', 0, NULL),
(28, 'BO', 'BO', 'BOL', 68, 'Bolivia', 0, NULL),
(29, 'BA', 'BA', 'BIH', 70, 'Bosnia and Herzegovina', 0, NULL),
(30, 'BW', 'BW', 'BWA', 72, 'Botswana', 0, NULL),
(31, 'BV', 'BV', 'BVT', 74, 'Bouvet Island', 0, NULL),
(32, 'BR', 'BR', 'BRA', 76, 'Brazil', 0, NULL),
(33, 'IO', 'IO', 'IOT', 86, 'British Indian Ocean Territory', 0, NULL),
(34, 'BN', 'BN', 'BRN', 96, 'Brunei', 0, NULL),
(35, 'BG', 'BG', 'BGR', 100, 'Bulgaria', 0, NULL),
(36, 'BF', 'BF', 'BFA', 854, 'Burkina Faso', 0, NULL),
(37, 'BI', 'BI', 'BDI', 108, 'Burundi', 0, NULL),
(38, 'KH', 'KH', 'KHM', 116, 'Cambodia', 0, NULL),
(39, 'CM', 'CM', 'CMR', 120, 'Cameroon', 0, NULL),
(40, 'CV', 'CV', 'CPV', 132, 'Cape Verde', 0, NULL),
(41, 'KY', 'KY', 'CYM', 136, 'Cayman Islands', 0, NULL),
(42, 'CF', 'CF', 'CAF', 140, 'Central African Republic', 0, NULL),
(43, 'TD', 'TD', 'TCD', 148, 'Chad', 0, NULL),
(44, 'CL', 'CL', 'CHL', 152, 'Chile', 0, NULL),
(45, 'CN', 'CN', 'CHN', 156, 'China', 0, NULL),
(46, 'CX', 'CX', 'CXR', 162, 'Christmas Island', 0, NULL),
(47, 'CC', 'CC', 'CCK', 166, 'Cocos (Keeling) Islands', 0, NULL),
(48, 'CO', 'CO', 'COL', 170, 'Colombia', 0, NULL),
(49, 'KM', 'KM', 'COM', 174, 'Comoros', 0, NULL),
(50, 'CG', 'CG', 'COG', 178, 'Congo', 0, NULL),
(51, 'CK', 'CK', 'COK', 184, 'Cook Islands', 0, NULL),
(52, 'CR', 'CR', 'CRI', 188, 'Costa Rica', 0, NULL),
(53, 'CI', 'CI', 'CIV', 384, 'Cote d\'Ivoire', 0, NULL),
(54, 'HR', 'HR', 'HRV', 191, 'Croatia (Hrvatska)', 0, NULL),
(55, 'CU', 'CU', 'CUB', 192, 'Cuba', 0, NULL),
(56, 'CY', 'CY', 'CYP', 196, 'Cyprus', 0, NULL),
(57, 'CZ', 'CZ', 'CZE', 203, 'Czech Republic', 0, NULL),
(58, 'CD', 'CD', 'COD', 180, 'Congo (DRC)', 0, NULL),
(59, 'DK', 'DK', 'DNK', 208, 'Denmark', 0, NULL),
(60, 'DJ', 'DJ', 'DJI', 262, 'Djibouti', 0, NULL),
(61, 'DM', 'DM', 'DMA', 212, 'Dominica', 0, NULL),
(62, 'DO', 'DO', 'DOM', 214, 'Dominican Republic', 0, NULL),
(63, 'TL', 'TL', 'TLS', 626, 'East Timor', 0, NULL),
(64, 'EC', 'EC', 'ECU', 218, 'Ecuador', 0, NULL),
(65, 'EG', 'EG', 'EGY', 818, 'Egypt', 0, NULL),
(66, 'SV', 'SV', 'SLV', 222, 'El Salvador', 0, NULL),
(67, 'GQ', 'GQ', 'GNQ', 226, 'Equatorial Guinea', 0, NULL),
(68, 'ER', 'ER', 'ERI', 232, 'Eritrea', 0, NULL),
(69, 'EE', 'EE', 'EST', 233, 'Estonia', 0, NULL),
(70, 'ET', 'ET', 'ETH', 231, 'Ethiopia', 0, NULL),
(71, 'FK', 'FK', 'FLK', 238, 'Falkland Islands (Islas Malvinas)', 0, NULL),
(72, 'FO', 'FO', 'FRO', 234, 'Faroe Islands', 0, NULL),
(73, 'FJ', 'FJ', 'FJI', 242, 'Fiji Islands', 0, NULL),
(74, 'FI', 'FI', 'FIN', 246, 'Finland', 0, NULL),
(75, 'FR', 'FR', 'FRA', 250, 'France', 0, NULL),
(76, 'GF', 'GF', 'GUF', 254, 'French Guiana', 0, NULL),
(77, 'PF', 'PF', 'PYF', 258, 'French Polynesia', 0, NULL),
(78, 'TF', 'TF', 'ATF', 260, 'French Southern and Antarctic Lands', 0, NULL),
(79, 'GA', 'GA', 'GAB', 266, 'Gabon', 0, NULL),
(80, 'GM', 'GM', 'GMB', 270, 'Gambia', 0, NULL),
(81, 'GE', 'GE', 'GEO', 268, 'Georgia', 0, NULL),
(82, 'DE', 'DE', 'DEU', 276, 'Germany', 0, NULL),
(83, 'GH', 'GH', 'GHA', 288, 'Ghana', 0, NULL),
(84, 'GI', 'GI', 'GIB', 292, 'Gibraltar', 0, NULL),
(85, 'GR', 'GR', 'GRC', 300, 'Greece', 0, NULL),
(86, 'GL', 'GL', 'GRL', 304, 'Greenland', 0, NULL),
(87, 'GD', 'GD', 'GRD', 308, 'Grenada', 0, NULL),
(88, 'GP', 'GP', 'GLP', 312, 'Guadeloupe', 0, NULL),
(89, 'GU', 'GU', 'GUM', 316, 'Guam', 0, NULL),
(90, 'GT', 'GT', 'GTM', 320, 'Guatemala', 0, NULL),
(91, 'GN', 'GN', 'GIN', 324, 'Guinea', 0, NULL),
(92, 'GW', 'GW', 'GNB', 624, 'Guinea-Bissau', 0, NULL),
(93, 'GY', 'GY', 'GUY', 328, 'Guyana', 0, NULL),
(94, 'HT', 'HT', 'HTI', 332, 'Haiti', 0, NULL),
(95, 'HM', 'HM', 'HMD', 334, 'Heard Island and McDonald Islands', 0, NULL),
(96, 'HN', 'HN', 'HND', 340, 'Honduras', 0, NULL),
(97, 'HK', 'HK', 'HKG', 344, 'Hong Kong SAR', 0, NULL),
(98, 'HU', 'HU', 'HUN', 348, 'Hungary', 0, NULL),
(99, 'IS', 'IS', 'ISL', 352, 'Iceland', 0, NULL),
(100, 'IN', 'IN', 'IND', 356, 'India', 0, NULL),
(101, 'ID', 'ID', 'IDN', 360, 'Indonesia', 0, NULL),
(102, 'IR', 'IR', 'IRN', 364, 'Iran', 0, NULL),
(103, 'IQ', 'IQ', 'IRQ', 368, 'Iraq', 0, NULL),
(104, 'IE', 'IE', 'IRL', 372, 'Ireland', 0, NULL),
(105, 'IL', 'IL', 'ISR', 376, 'Israel', 0, NULL),
(106, 'IT', 'IT', 'ITA', 380, 'Italy', 0, NULL),
(107, 'JM', 'JM', 'JAM', 388, 'Jamaica', 0, NULL),
(108, 'JP', 'JP', 'JPN', 392, 'Japan', 0, NULL),
(109, 'JO', 'JO', 'JOR', 400, 'Jordan', 0, NULL),
(110, 'KZ', 'KZ', 'KAZ', 398, 'Kazakhstan', 0, NULL),
(111, 'KE', 'KE', 'KEN', 404, 'Kenya', 0, NULL),
(112, 'KI', 'KI', 'KIR', 296, 'Kiribati', 0, NULL),
(113, 'KR', 'KR', 'KOR', 410, 'Korea', 0, NULL),
(114, 'KW', 'KW', 'KWT', 414, 'Kuwait', 0, NULL),
(115, 'KG', 'KG', 'KGZ', 417, 'Kyrgyzstan', 0, NULL),
(116, 'LA', 'LA', 'LAO', 418, 'Laos', 0, NULL),
(117, 'LV', 'LV', 'LVA', 428, 'Latvia', 0, NULL),
(118, 'LB', 'LB', 'LBN', 422, 'Lebanon', 0, NULL),
(119, 'LS', 'LS', 'LSO', 426, 'Lesotho', 0, NULL),
(120, 'LR', 'LR', 'LBR', 430, 'Liberia', 0, NULL),
(121, 'LY', 'LY', 'LBY', 434, 'Libya', 0, NULL),
(122, 'LI', 'LI', 'LIE', 438, 'Liechtenstein', 0, NULL),
(123, 'LT', 'LT', 'LTU', 440, 'Lithuania', 0, NULL),
(124, 'LU', 'LU', 'LUX', 442, 'Luxembourg', 0, NULL),
(125, 'MO', 'MO', 'MAC', 446, 'Macao SAR', 0, NULL),
(126, 'MK', 'MK', 'MKD', 807, 'Macedonia', 0, NULL),
(127, 'MG', 'MG', 'MDG', 450, 'Madagascar', 0, NULL),
(128, 'MW', 'MW', 'MWI', 454, 'Malawi', 0, NULL),
(129, 'MY', 'MY', 'MYS', 458, 'Malaysia', 0, NULL),
(130, 'MV', 'MV', 'MDV', 462, 'Maldives', 0, NULL),
(131, 'ML', 'ML', 'MLI', 466, 'Mali', 0, NULL),
(132, 'MT', 'MT', 'MLT', 470, 'Malta', 0, NULL),
(133, 'MH', 'MH', 'MHL', 584, 'Marshall Islands', 0, NULL),
(134, 'MQ', 'MQ', 'MTQ', 474, 'Martinique', 0, NULL),
(135, 'MR', 'MR', 'MRT', 478, 'Mauritania', 0, NULL),
(136, 'MU', 'MU', 'MUS', 480, 'Mauritius', 0, NULL),
(137, 'YT', 'YT', 'MYT', 175, 'Mayotte', 0, NULL),
(138, 'MX', 'MX', 'MEX', 484, 'Mexico', 0, NULL),
(139, 'FM', 'FM', 'FSM', 583, 'Micronesia', 0, NULL),
(140, 'MD', 'MD', 'MDA', 498, 'Moldova', 0, NULL),
(141, 'MC', 'MC', 'MCO', 492, 'Monaco', 0, NULL),
(142, 'MN', 'MN', 'MNG', 496, 'Mongolia', 0, NULL),
(143, 'MS', 'MS', 'MSR', 500, 'Montserrat', 0, NULL),
(144, 'MA', 'MA', 'MAR', 504, 'Morocco', 0, NULL),
(145, 'MZ', 'MZ', 'MOZ', 508, 'Mozambique', 0, NULL),
(146, 'MM', 'MM', 'MMR', 104, 'Myanmar', 0, NULL),
(147, 'NA', 'NA', 'NAM', 516, 'Namibia', 0, NULL),
(148, 'NR', 'NR', 'NRU', 520, 'Nauru', 0, NULL),
(149, 'NP', 'NP', 'NPL', 524, 'Nepal', 0, NULL),
(150, 'NL', 'NL', 'NLD', 528, 'Netherlands', 0, NULL),
(151, 'AN', 'AN', 'ANT', 127, 'Netherlands Antilles', 0, NULL),
(152, 'NC', 'NC', 'NCL', 540, 'New Caledonia', 0, NULL),
(153, 'NZ', 'NZ', 'NZL', 554, 'New Zealand', 0, NULL),
(154, 'NI', 'NI', 'NIC', 558, 'Nicaragua', 0, NULL),
(155, 'NE', 'NE', 'NER', 562, 'Niger', 0, NULL),
(156, 'NG', 'NG', 'NGA', 566, 'Nigeria', 0, NULL),
(157, 'NU', 'NU', 'NIU', 570, 'Niue', 0, NULL),
(158, 'NF', 'NF', 'NFK', 574, 'Norfolk Island', 0, NULL),
(159, 'KP', 'KP', 'PRK', 408, 'North Korea', 0, NULL),
(160, 'MP', 'MP', 'MNP', 580, 'Northern Mariana Islands', 0, NULL),
(161, 'NO', 'NO', 'NOR', 578, 'Norway', 0, NULL),
(162, 'OM', 'OM', 'OMN', 512, 'Oman', 0, NULL),
(163, 'PK', 'PK', 'PAK', 586, 'Pakistan', 0, NULL),
(164, 'PW', 'PW', 'PLW', 585, 'Palau', 0, NULL),
(165, 'PA', 'PA', 'PAN', 591, 'Panama', 0, NULL),
(166, 'PG', 'PG', 'PNG', 598, 'Papua New Guinea', 0, NULL),
(167, 'PY', 'PY', 'PRY', 600, 'Paraguay', 0, NULL),
(168, 'PE', 'PE', 'PER', 604, 'Peru', 0, NULL),
(169, 'PH', 'PH', 'PHL', 608, 'Philippines', 0, NULL),
(170, 'PN', 'PN', 'PCN', 612, 'Pitcairn Islands', 0, NULL),
(171, 'PL', 'PL', 'POL', 616, 'Poland', 0, NULL),
(172, 'PT', 'PT', 'PRT', 620, 'Portugal', 0, NULL),
(173, 'PR', 'PR', 'PRI', 630, 'Puerto Rico', 0, NULL),
(174, 'QA', 'QA', 'QAT', 634, 'Qatar', 0, NULL),
(175, 'RE', 'RE', 'REU', 638, 'Reunion', 0, NULL),
(176, 'RO', 'RO', 'ROU', 642, 'Romania', 0, NULL),
(177, 'RU', 'RU', 'RUS', 643, 'Russia', 0, NULL),
(178, 'RW', 'RW', 'RWA', 646, 'Rwanda', 0, NULL),
(179, 'WS', 'WS', 'WSM', 882, 'Samoa', 0, NULL),
(180, 'SM', 'SM', 'SMR', 674, 'San Marino', 0, NULL),
(181, 'ST', 'ST', 'STP', 678, 'Sao Tome and Principe', 0, NULL),
(182, 'SA', 'SA', 'SAU', 682, 'Saudi Arabia', 0, NULL),
(183, 'SN', 'SN', 'SEN', 686, 'Senegal', 0, NULL),
(184, 'ME', 'ME', 'MNE', 499, 'Montenegro', 0, NULL),
(185, 'SC', 'SC', 'SYC', 690, 'Seychelles', 0, NULL),
(186, 'SL', 'SL', 'SLE', 694, 'Sierra Leone', 0, NULL),
(187, 'SG', 'SG', 'SGP', 702, 'Singapore', 0, NULL),
(188, 'SK', 'SK', 'SVK', 703, 'Slovakia', 0, NULL),
(189, 'SI', 'SI', 'SVN', 705, 'Slovenia', 0, NULL),
(190, 'SB', 'SB', 'SLB', 90, 'Solomon Islands', 0, NULL),
(191, 'SO', 'SO', 'SOM', 706, 'Somalia', 0, NULL),
(192, 'ZA', 'ZA', 'ZAF', 710, 'South Africa', 0, NULL),
(193, 'GS', 'GS', 'SGS', 239, 'South Georgia and the South Sandwich Islands', 0, NULL),
(194, 'ES', 'ES', 'ESP', 724, 'Spain', 0, NULL),
(195, 'LK', 'LK', 'LKA', 144, 'Sri Lanka', 0, NULL),
(196, 'SH', 'SH', 'SHN', 654, 'St. Helena', 0, NULL),
(197, 'KN', 'KN', 'KNA', 659, 'St. Kitts and Nevis', 0, NULL),
(198, 'LC', 'LC', 'LCA', 662, 'St. Lucia', 0, NULL),
(199, 'PM', 'PM', 'SPM', 666, 'St. Pierre and Miquelon', 0, NULL),
(200, 'VC', 'VC', 'VCT', 670, 'St. Vincent and the Grenadines', 0, NULL),
(201, 'SD', 'SD', 'SDN', 729, 'Sudan', 0, NULL),
(202, 'SR', 'SR', 'SUR', 740, 'Suriname', 0, NULL),
(203, 'SJ', 'SJ', 'SJM', 744, 'Svalbard and Jan Mayen', 0, NULL),
(204, 'SZ', 'SZ', 'SWZ', 748, 'Swaziland', 0, NULL),
(205, 'SE', 'SE', 'SWE', 752, 'Sweden', 0, NULL),
(206, 'CH', 'CH', 'CHE', 756, 'Switzerland', 0, NULL),
(207, 'SY', 'SY', 'SYR', 760, 'Syria', 0, NULL),
(208, 'TW', 'TW', 'TWN', 158, 'Taiwan', 0, NULL),
(209, 'TJ', 'TJ', 'TJK', 762, 'Tajikistan', 0, NULL),
(210, 'TZ', 'TZ', 'TZA', 834, 'Tanzania', 0, NULL),
(211, 'TH', 'TH', 'THA', 764, 'Thailand', 0, NULL),
(212, 'TG', 'TG', 'TGO', 768, 'Togo', 0, NULL),
(213, 'TK', 'TK', 'TKL', 772, 'Tokelau', 0, NULL),
(214, 'TO', 'TO', 'TON', 776, 'Tonga', 0, NULL),
(215, 'TT', 'TT', 'TTO', 780, 'Trinidad and Tobago', 0, NULL),
(216, 'TN', 'TN', 'TUN', 788, 'Tunisia', 0, NULL),
(217, 'TR', 'TR', 'TUR', 792, 'Turkey', 0, NULL),
(218, 'TM', 'TM', 'TKM', 795, 'Turkmenistan', 0, NULL),
(219, 'TC', 'TC', 'TCA', 796, 'Turks and Caicos Islands', 0, NULL),
(220, 'TV', 'TV', 'TUV', 798, 'Tuvalu', 0, NULL),
(221, 'UG', 'UG', 'UGA', 800, 'Uganda', 0, NULL),
(222, 'UA', 'UA', 'UKR', 804, 'Ukraine', 0, NULL),
(223, 'AE', 'AE', 'ARE', 784, 'United Arab Emirates', 0, NULL),
(224, 'GB', 'GB', 'GBR', 826, 'United Kingdom', 0, NULL),
(225, 'UM', 'UM', 'UMI', 581, 'United States Minor Outlying Islands', 0, NULL),
(226, 'UY', 'UY', 'URY', 858, 'Uruguay', 0, NULL),
(227, 'UZ', 'UZ', 'UZB', 860, 'Uzbekistan', 0, NULL),
(228, 'VU', 'VU', 'VUT', 548, 'Vanuatu', 0, NULL),
(229, 'VA', 'VA', 'VAT', 336, 'Vatican City', 0, NULL),
(230, 'VE', 'VE', 'VEN', 862, 'Venezuela', 0, NULL),
(231, 'VN', 'VN', 'VNM', 704, 'Viet Nam', 0, NULL),
(232, 'VG', 'VG', 'VGB', 92, 'Virgin Islands (British)', 0, NULL),
(233, 'VI', 'VI', 'VIR', 850, 'Virgin Islands', 0, NULL),
(234, 'WF', 'WF', 'WLF', 876, 'Wallis and Futuna', 0, NULL),
(235, 'YE', 'YE', 'YEM', 887, 'Yemen', 0, NULL),
(236, 'ZM', 'ZM', 'ZMB', 894, 'Zambia', 0, NULL),
(237, 'ZW', 'ZW', 'ZWE', 716, 'Zimbabwe', 0, NULL),
(238, 'AX', 'AX', 'ALA', 248, 'Åland Islands', 0, NULL),
(239, 'BQ', 'BQ', 'BES', 535, 'Bonaire, Sint Eustatius and Saba', 0, NULL),
(240, 'CW', 'CW', 'CUW', 531, 'Curaçao', 0, NULL),
(241, 'GG', 'GG', 'GGY', 831, 'Guernsey', 0, NULL),
(242, 'IM', 'IM', 'IMN', 833, 'Isle of Man', 0, NULL),
(243, 'JE', 'JE', 'JEY', 832, 'Jersey', 0, NULL),
(245, 'PS', 'PS', 'PSE', 275, 'Palestinian Territory, Occupied', 0, NULL),
(246, 'BL', 'BL', 'BLM', 652, 'Saint Barthélemy', 0, NULL),
(247, 'MF', 'MF', 'MAF', 663, 'Saint Martin (French part)', 0, NULL),
(248, 'RS', 'RS', 'SRB', 688, 'Serbia', 0, NULL),
(249, 'SX', 'SX', 'SXM', 534, 'Sint Maarten (Dutch part)', 0, NULL),
(250, 'SS', 'SS', 'SSD', 728, 'South Sudan', 0, NULL),
(251, 'EH', 'EH', 'ESH', 732, 'Western Sahara', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `er_coupon`
--

CREATE TABLE `er_coupon` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `batch_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(32) NOT NULL,
  `used_count` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_coupon_batch`
--

CREATE TABLE `er_coupon_batch` (
  `batch_id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `discount_type` enum('percent','number') DEFAULT 'number',
  `discount` decimal(12,2) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `is_disabled` tinyint(4) NOT NULL DEFAULT '0',
  `is_recurring` tinyint(4) NOT NULL DEFAULT '0',
  `product_ids` varchar(255) DEFAULT NULL,
  `use_count` int(11) DEFAULT NULL,
  `user_use_count` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `require_product` text,
  `prevent_if_product` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_currency_exchange`
--

CREATE TABLE `er_currency_exchange` (
  `rate_id` int(11) NOT NULL,
  `base` char(3) DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `date` date NOT NULL,
  `rate` decimal(12,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_custom_field_sort`
--

CREATE TABLE `er_custom_field_sort` (
  `custom_field_sort_id` int(10) UNSIGNED NOT NULL,
  `custom_field_table` varchar(32) NOT NULL,
  `custom_field_name` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_data`
--

CREATE TABLE `er_data` (
  `table` varchar(64) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  `blob` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_echeck`
--

CREATE TABLE `er_echeck` (
  `echeck_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `echeck` varchar(25) DEFAULT NULL,
  `echeck_ban` varchar(255) DEFAULT NULL,
  `echeck_aba` varchar(255) DEFAULT NULL,
  `echeck_bank_name` varchar(255) DEFAULT NULL,
  `echeck_account_name` varchar(255) DEFAULT NULL,
  `echeck_name_f` varchar(64) DEFAULT NULL,
  `echeck_name_l` varchar(64) DEFAULT NULL,
  `echeck_country` varchar(255) DEFAULT NULL,
  `echeck_street` varchar(255) DEFAULT NULL,
  `echeck_street2` varchar(255) DEFAULT NULL,
  `echeck_city` varchar(255) DEFAULT NULL,
  `echeck_state` varchar(255) DEFAULT NULL,
  `echeck_zip` varchar(255) DEFAULT NULL,
  `echeck_company` varchar(255) DEFAULT NULL,
  `echeck_phone` varchar(255) DEFAULT NULL,
  `echeck_housenumber` varchar(255) DEFAULT NULL,
  `echeck_province` varchar(50) DEFAULT NULL,
  `echeck_issuenum` varchar(25) DEFAULT NULL,
  `echeck_startdate` varchar(12) DEFAULT NULL,
  `echeck_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_email_sent`
--

CREATE TABLE `er_email_sent` (
  `email_sent_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `format` varchar(16) DEFAULT NULL,
  `body` mediumtext,
  `files` varchar(255) DEFAULT NULL,
  `newsletter_ids` varchar(255) DEFAULT NULL,
  `count_users` int(11) DEFAULT NULL,
  `sent_users` int(11) DEFAULT NULL,
  `last_email` varchar(255) DEFAULT NULL,
  `desc_users` varchar(255) DEFAULT NULL,
  `is_cancelled` varchar(255) DEFAULT NULL,
  `serialized_vars` mediumtext,
  `tm_added` datetime NOT NULL,
  `tm_finished` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_email_template`
--

CREATE TABLE `er_email_template` (
  `email_template_id` int(11) NOT NULL,
  `email_template_layout_id` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `lang` varchar(16) NOT NULL,
  `format` enum('text','html','multipart') NOT NULL DEFAULT 'text',
  `subject` varchar(255) NOT NULL,
  `txt` mediumtext NOT NULL,
  `plain_txt` mediumtext,
  `attachments` mediumtext,
  `attach_pdf_invoice` tinyint(4) DEFAULT NULL,
  `recurring` tinyint(4) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `days` varchar(255) DEFAULT NULL,
  `paysys_ids` varchar(255) DEFAULT NULL,
  `conditions` text,
  `not_conditions` varchar(255) DEFAULT NULL,
  `not_conditions_expired` tinyint(4) DEFAULT NULL,
  `not_conditions_future` tinyint(4) DEFAULT NULL,
  `recipient_user` tinyint(4) NOT NULL DEFAULT '1',
  `recipient_aff` tinyint(4) NOT NULL DEFAULT '0',
  `recipient_admin` tinyint(4) NOT NULL DEFAULT '0',
  `recipient_emails` text,
  `bcc` text,
  `reply_to` int(10) UNSIGNED DEFAULT NULL,
  `recipient_admins` varchar(255) DEFAULT NULL,
  `newsletter_lists` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_email_template`
--

INSERT INTO `er_email_template` (`email_template_id`, `email_template_layout_id`, `name`, `lang`, `format`, `subject`, `txt`, `plain_txt`, `attachments`, `attach_pdf_invoice`, `recurring`, `day`, `days`, `paysys_ids`, `conditions`, `not_conditions`, `not_conditions_expired`, `not_conditions_future`, `recipient_user`, `recipient_aff`, `recipient_admin`, `recipient_emails`, `bcc`, `reply_to`, `recipient_admins`, `newsletter_lists`) VALUES
(1, 2, 'bruteforce_notify', 'en', 'text', '%site_title%: Bruteforce Attack Detected', 'Bruteforce Attack Detected.\n\nIP: %ip%\nLast Used Login: %login%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'send_security_code', 'en', 'text', '%site_title%: Password Recovery', 'You have requested your log in information.\n\n     Your User ID:  %user.login%\n\nFollow a link below to change your password:\n  %url%\n\nThis link will be active %hours% hour(s).\n            \nPassword reset has been requested from IP address: %ip%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(3, 2, 'send_security_code_admin', 'en', 'text', '%site_title%: Password Recovery', 'You have requested your admin log in information.\n\n     Your User ID:  %user.login%\n\nFollow a link below to change your password:\n  %url%\n\nThis link will be active %hours% hour(s).\n            \nPassword reset has been requested from IP address: %ip%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(4, 2, 'send_password_admin', 'en', 'text', '%site_title%: New Admin Password', 'You have requested to reset your access credentials.\n\n     Your User ID:  %user.login%\n     New Password:  %pass%\n\nPlease login to admin control panel at:\n     %root_url%/admin/\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(5, 2, 'profile_changed', 'en', 'text', '%site_title%: User profile has been changed', 'User has changed profile.\n\nUser details:\n    Username:   %user.login%\n    Email:      %user.email%\n    Name:       %user.name_f% %user.name_l%\n\nChanged fields:\n%changes%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'manually_approve', 'en', 'text', '%site_title%: Your signup is pending', 'Thank you for subscribing!\n\nWe review all payments manually, so your payment\nstatus is pending. You will receive email when your\naccount will be approved. Thank you for your patience.\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(7, 1, 'invoice_approval_wait_user', 'en', 'text', '%site_title%: Your payment is under review', 'Thank you for subscribing!\n\nWe review all payments manually, so your payment\nstatus is pending. You will receive email when your\npayment will be approved. Thank you for your patience.\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(8, 1, 'invoice_pay_link', 'en', 'text', '%site_title%: New Invoice', '%message%\nFollow a link below to pay Invoice:\n%url%\n\n%invoice_text%\nInvoice is valid until: %invoice.due_date|date%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(9, 1, 'invoice_approved_user', 'en', 'text', '%site_title%: Your payment was approved!', 'Thank you for subscribing!\n\nYour payment was approved by our staff.\n\n   Your User ID: %user.login%\n\nLog-on to your member pages at:\n%root_url%/member\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(10, 2, 'mail_cancel_admin', 'en', 'text', '%site_title%: User subscription cancelled', 'User %user.login%, \"%user.name_f% %user.name_l%\" <%user.email%>\nhas cancelled recurring subscription #%invoice.invoice_id% to product\n%product.title%.\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(11, 1, 'mail_cancel_member', 'en', 'text', '%site_title%: Subscription cancelled', 'Your subscription to \"%product.title%\" cancelled. Feel free to subscribe\nagain, you can do it here:\n  %root_url%/member\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(12, 2, 'send_payment_admin', 'en', 'text', '%site_title%: *** New Payment', 'Payment Amount: %payment.amount% %payment.currency%\nPayment Reference: %payment.receipt_id%\n\n%invoice_text%\n\nUser details:\n    Username:   %user.login%\n    Email:      %user.email%\n    Name:       %user.name_f% %user.name_l%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(13, 1, 'registration_mail', 'en', 'text', '%site_title%: Registration', 'Thank you for registration on %site_title%!\n\n   Your User ID: %user.login%\n   Your Password: %password%\n\nLog-on to your member pages at:\n%root_url%/member\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(14, 2, 'registration_mail_admin', 'en', 'text', '%site_title%: User Registration', '\nNew User Registration:\n\n   User ID: %user.login%\n   %root_url%/admin-users?_u_a=edit&_u_id=%user.user_id%\n\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(15, 1, 'changepass_mail', 'en', 'text', '%site_title%: Password Change', 'You changed password on %site_title%!\n\n   Your User ID: %user.login%\n   Your Password: %password%\n\nLog-on to your member pages at:\n%root_url%/member\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(16, 1, 'send_signup_mail', 'en', 'text', '%site_title%: Membership Information', 'Thank you for subscribing on %site_title%!\n\n   Your User ID: %user.login%\n\nLog-on to your member pages at:\n%root_url%/member\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(17, 1, 'send_payment_mail', 'en', 'text', '%site_title%: Payment Receipt', 'Thank you for your order. You may find order details below:\n\nPayment Amount: %payment.amount% %payment.currency%\nPayment Reference: %payment.receipt_id%\n\n%invoice_text%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(18, 1, 'verify_email_signup', 'en', 'text', '%site_title%: Account Verification', 'You (or someone else) has just registered an account on %site_title%.\nClicking on the link below will activate the account:\n%url%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(19, 1, 'verify_email_profile', 'en', 'text', '%site_title%: Account Verification', 'You (or someone else) has just changed email address in your account on %site_title%.\nClicking on the link below will approve this change:\n%url%\n\nPlease note that email address will be changed in your profile only if you will click on above link.\nIf you didn\'t request email address change just disregard this message.\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(20, 2, 'send_free_payment_admin', 'en', 'text', '%site_title%: *** New Free Signup', '%invoice_text%\n\nUser details:\n    Username:   %user.login%\n    Email:      %user.email%\n    Name:       %user.name_f% %user.name_l%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(21, 2, 'manually_approve_admin', 'en', 'text', '%site_title%: Your approval required', 'New signup completed and is awaiting your approval.\nPlease log into aMember CP\n        %root_url%/admin/\nand then click the following link:\n        %root_url%/admin-users?_u_a=edit&_u_id=%user.user_id%\n\nUser details:\n    Username:   %user.login%\n    Email:      %user.email%\n    Name:       %user.name_f% %user.name_l%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(22, 2, 'invoice_approval_wait_admin', 'en', 'text', '%site_title%: Your approval required', 'New signup completed and is awaiting your approval.\nPlease log into aMember CP\n        %root_url%/admin/\nand then click the following link:\n        %root_url%/admin-user-payments/index/user_id/%user.user_id%\n\nUser details:\n    Username:   %user.login%\n    Email:      %user.email%\n    Name:       %user.name_f% %user.name_l%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(23, 2, 'max_ip_actions_admin', 'en', 'text', '%site_title%: Account Sharing Violation Detected', 'There is an automated message from %site_title%.\nAn account violation has been detected for the following\ncustomer:\nUser details:\n    Username:   %user.login%\n    Email:      %user.email%\n    Name:       %user.name_f% %user.name_l%\n%userlocked%\nIt has reached configured limit of %maxipcount% IP within\n%maxipperiod% minutes. Please login into aMember CP and review\nhis access log.\n\nIf it looks like a script mistake, you may disable sharing violation checking\nfor this user in the \"User Profile\", or disable it globally at\naMember CP -> Configuration -> Setup/Configuration -> Login Page\nby setting \"if customer uses more than IP\" to something like \"99999\".\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(24, 1, 'max_ip_actions_user', 'en', 'text', '%site_title%: Account Sharing Violation Detected', 'There is an automated message from %site_title%.\nAn account violation has been detected.\n%userlocked%\n\nIt has reached configured limit of %maxipcount% IP within\n%maxipperiod% minutes.\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(25, 1, 'mail_upgraded_cancel_member', 'en', 'text', '%site_title%: Subscription cancelled due to Upgrade', 'Your subscription to \"%product.title%\" cancelled due to Upgrade.\n  %root_url%/member\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(26, 2, 'admin_cancel_upgraded_invoice', 'en', 'text', '%site_title%: Cancel Upgraded Invoice', 'Your customer %user.login% \"%user.name_f% %user.name_l%\" <%user.email%>\nrecently changed his subscription to new payment plan. Unfortunately,\nthe payment system does not allow to cancel previous subscription automatically.\nPlease cancel previous user recurring subscription manually:\n   Payment System:         %invoice.paysys_id%\n   aMember Invoice Id:     %invoice.public_id%\n   Subscription Reference: %subscr_id%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(27, 2, 'admin_refund_upgraded_invoice', 'en', 'text', '%site_title%: Refund Upgraded Invoice', 'Your customer %user.login% \"%user.name_f% %user.name_l%\" <%user.email%>\nrecently changed his subscription to new payment plan. aMember has done\ncalculations and it is necessary to refund amount of money to the customer.\n\nUnfortunaetly, the payment system does not allow to process refunds\nautomatically.\nPlease process refund manually via payment system control panel:\n\n   Payment System:         %invoice.paysys_id%\n   Last Payment Reference: %subscr_id%\n   Amount to refund:       %refund_amount% %invoice.currency%\n   aMember Invoice Id:     %invoice.public_id%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(28, 2, 'cc.admin_rebill_stats', 'en', 'text', '%site_title%: %plugin% Rebill Statistics (%short_stats%)', 'Outlined below are the results of latest rebilling attempt on  %site_title%\n\nHere you can find statistics about SUCCESS rebills\n===\n%rebills_success%\n\n\nHere you can find statistics about FAILED rebills\n===\n%rebills_failed%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(29, 1, 'cc.rebill_failed', 'en', 'text', '%site_title%: Subscription Renewal Failed', 'Your subscription was not renewed automatically by membership system\ndue to payment failure: %error%\n\n%prorate%\n%manual_rebill_link%\nYou may update your credit card info here:.\n%root_url%/member\n\nThank you for attention!\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(30, 1, 'cc.rebill_success', 'en', 'text', '%site_title%: Subscription Renewed', 'Your subscription has been renewed automatically by our membership system.\nYour credit card was charged %amount%\n\nNext renewal date: %rebill_date%\n\nYou may login to membership info page at :\n%root_url%/member\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(31, 1, 'cc.card_expire', 'en', 'text', '%site_title%: Credit Card Expiration', 'Your credit card that we have on file for recurring billing will expire\non %expires%. Next recurring billing for invoice %invoice.public_id%\nis scheduled for %invoice.rebill_date|date%.\n\nTo avoid any interruption of your subscription, please visit page\n%root_url%/member\nand update your credit card information.\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(32, 2, 'delete_personal_data_notification', 'en', 'text', '%site_title%: New Delete Personal Data Request', '\nUser %user.login%, \"%user.name_f% %user.name_l%\" <%user.email%> has requested to delete his Personal Data from site. \n%errorsText%\nPlease login and process this request:  %root_surl%/admin-delete-personal-data\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(33, 1, 'send_refund_mail', 'en', 'text', '%site_title%: Refund Receipt', 'Refund has been processed. You may find details below:\n\nRefund Amount: %refund.amount% %refund.currency%\nRefund Reference: %refund.receipt_id%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL),
(34, 2, 'send_refund_admin', 'en', 'text', '%site_title%: *** New Refund', 'Refund Amount: %refund.amount% %refund.currency%\nRefund Reference: %refund.receipt_id%\n\nUser details:\n    Username:   %user.login%\n    Email:      %user.email%\n    Name:       %user.name_f% %user.name_l%\n        ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `er_email_template_layout`
--

CREATE TABLE `er_email_template_layout` (
  `email_template_layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `layout` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_email_template_layout`
--

INSERT INTO `er_email_template_layout` (`email_template_layout_id`, `name`, `layout`) VALUES
(1, 'Default User Layout', 'Dear %user.name_f% %user.name_l%,\n\n%content%\n\n--\nBest Regards,\n%site_title%\n%root_url%'),
(2, 'Default Admin Layout', 'Dear Administrator,\n\n%content%\n\n--\nBest Regards,\n%site_title%\n%root_url%'),
(3, 'Default Affiliate Layout', 'Dear %affiliate.name_f% %affiliate.name_l%,\n\n%content%\n\n--\nBest Regards,\n%site_title%\n%root_url%');

-- --------------------------------------------------------

--
-- Table structure for table `er_error_log`
--

CREATE TABLE `er_error_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `level` smallint(5) UNSIGNED DEFAULT NULL,
  `channel` varchar(64) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `time` datetime NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remote_addr` varchar(39) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `error` text,
  `trace` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_failed_login`
--

CREATE TABLE `er_failed_login` (
  `failed_login_id` int(10) UNSIGNED NOT NULL,
  `ip` char(39) NOT NULL,
  `login_type` int(11) NOT NULL,
  `failed_logins` int(11) NOT NULL,
  `last_failed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_failed_login`
--

INSERT INTO `er_failed_login` (`failed_login_id`, `ip`, `login_type`, `failed_logins`, `last_failed`) VALUES
(1, '127.0.0.1', 1, 1, 1589485257);

-- --------------------------------------------------------

--
-- Table structure for table `er_file`
--

CREATE TABLE `er_file` (
  `file_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text,
  `path` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `mime` varchar(64) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `display_type` varchar(255) DEFAULT NULL,
  `dattm` datetime DEFAULT NULL,
  `hide` smallint(6) DEFAULT '0',
  `download_limit` varchar(50) NOT NULL,
  `no_access_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_file_download`
--

CREATE TABLE `er_file_download` (
  `download_id` int(10) UNSIGNED NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `dattm` datetime NOT NULL,
  `remote_addr` varchar(39) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_folder`
--

CREATE TABLE `er_folder` (
  `folder_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text,
  `path` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `method` varchar(64) DEFAULT NULL,
  `dattm` datetime DEFAULT NULL,
  `hide` smallint(6) DEFAULT '0',
  `no_access_url` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_integration`
--

CREATE TABLE `er_integration` (
  `integration_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `plugin` text,
  `vars` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_invoice`
--

CREATE TABLE `er_invoice` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `paysys_id` varchar(64) DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `first_subtotal` decimal(12,2) DEFAULT NULL,
  `first_discount` decimal(12,2) DEFAULT NULL,
  `first_tax` decimal(12,2) DEFAULT NULL,
  `first_shipping` decimal(12,2) DEFAULT NULL,
  `first_total` decimal(12,2) DEFAULT NULL,
  `first_period` varchar(32) NOT NULL,
  `rebill_times` int(11) DEFAULT NULL,
  `second_subtotal` decimal(12,2) DEFAULT NULL,
  `second_discount` decimal(12,2) DEFAULT NULL,
  `second_tax` decimal(12,2) DEFAULT NULL,
  `second_shipping` decimal(12,2) DEFAULT NULL,
  `second_total` decimal(12,2) DEFAULT NULL,
  `second_period` varchar(32) DEFAULT NULL,
  `tax_rate` varchar(255) DEFAULT NULL,
  `tax_type` varchar(255) DEFAULT NULL,
  `tax_title` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `discount_first` decimal(12,2) DEFAULT NULL,
  `discount_second` decimal(12,2) DEFAULT NULL,
  `is_confirmed` tinyint(4) DEFAULT NULL,
  `public_id` char(64) NOT NULL,
  `invoice_key` varchar(32) DEFAULT NULL,
  `tm_added` datetime NOT NULL,
  `tm_started` datetime DEFAULT NULL,
  `tm_cancelled` datetime DEFAULT NULL,
  `rebill_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `comment` text,
  `base_currency_multi` decimal(12,6) DEFAULT '1.000000',
  `saved_form_id` int(10) UNSIGNED DEFAULT NULL,
  `remote_addr` varchar(39) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_invoice_item`
--

CREATE TABLE `er_invoice_item` (
  `invoice_item_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_public_id` char(64) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(16) NOT NULL DEFAULT 'product',
  `item_title` varchar(255) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `first_price` decimal(12,2) NOT NULL,
  `first_discount` decimal(12,2) NOT NULL,
  `first_tax` decimal(12,2) NOT NULL,
  `first_total` decimal(12,2) NOT NULL,
  `first_shipping` decimal(12,2) NOT NULL,
  `first_period` varchar(32) NOT NULL,
  `rebill_times` int(11) DEFAULT NULL,
  `second_price` decimal(12,2) DEFAULT NULL,
  `second_discount` decimal(12,2) DEFAULT NULL,
  `second_tax` decimal(12,2) DEFAULT NULL,
  `second_total` decimal(12,2) DEFAULT NULL,
  `second_shipping` decimal(12,2) DEFAULT NULL,
  `second_period` varchar(32) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `tax_group` varchar(255) DEFAULT '-1',
  `tax_rate` varchar(255) DEFAULT NULL,
  `is_countable` tinyint(4) NOT NULL DEFAULT '0',
  `variable_qty` tinyint(4) NOT NULL DEFAULT '0',
  `is_tangible` tinyint(4) DEFAULT NULL,
  `billing_plan_id` int(11) DEFAULT NULL,
  `billing_plan_data` text,
  `options` blob,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_invoice_item_option`
--

CREATE TABLE `er_invoice_item_option` (
  `invoice_item_option_id` int(10) UNSIGNED NOT NULL,
  `invoice_item_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(1024) DEFAULT NULL,
  `first_price` decimal(12,2) DEFAULT NULL,
  `second_price` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_invoice_log`
--

CREATE TABLE `er_invoice_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `tm` datetime NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `paysys_id` varchar(64) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  `remote_addr` varchar(39) DEFAULT NULL,
  `is_processed` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_invoice_payment`
--

CREATE TABLE `er_invoice_payment` (
  `invoice_payment_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_public_id` char(64) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `paysys_id` varchar(64) DEFAULT NULL,
  `receipt_id` varchar(64) NOT NULL,
  `transaction_id` varchar(64) NOT NULL,
  `dattm` datetime NOT NULL,
  `currency` char(3) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `tax` decimal(12,2) DEFAULT NULL,
  `shipping` decimal(12,2) DEFAULT NULL,
  `refund_dattm` datetime DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT NULL,
  `base_currency_multi` decimal(12,6) DEFAULT '1.000000',
  `display_invoice_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_invoice_refund`
--

CREATE TABLE `er_invoice_refund` (
  `invoice_refund_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_public_id` char(64) NOT NULL,
  `invoice_payment_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `paysys_id` varchar(64) DEFAULT NULL,
  `receipt_id` varchar(64) NOT NULL,
  `transaction_id` varchar(64) NOT NULL,
  `dattm` datetime NOT NULL,
  `currency` char(3) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `refund_type` int(11) NOT NULL DEFAULT '0',
  `base_currency_multi` decimal(12,6) DEFAULT '1.000000',
  `display_invoice_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_link`
--

CREATE TABLE `er_link` (
  `link_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text,
  `url` varchar(255) NOT NULL,
  `dattm` datetime DEFAULT NULL,
  `onmenu` smallint(6) DEFAULT '0',
  `hide` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_mail_queue`
--

CREATE TABLE `er_mail_queue` (
  `queue_id` int(10) UNSIGNED NOT NULL,
  `message_type` varchar(64) NOT NULL,
  `email_template_name` varchar(64) DEFAULT NULL,
  `from` varchar(255) NOT NULL,
  `recipients` varchar(255) NOT NULL,
  `count_recipients` smallint(6) NOT NULL,
  `subject` text,
  `added` int(11) NOT NULL,
  `sent` int(11) DEFAULT NULL,
  `failures` int(11) DEFAULT '0',
  `priority` int(11) DEFAULT '0',
  `last_error` varchar(255) DEFAULT NULL,
  `headers` blob,
  `body` mediumblob,
  `serialized` mediumblob,
  `is_postponed` int(11) DEFAULT NULL,
  `wait_for_email_confirm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_newsletter_list`
--

CREATE TABLE `er_newsletter_list` (
  `list_id` int(10) UNSIGNED NOT NULL,
  `plugin_id` varchar(64) DEFAULT NULL,
  `plugin_list_id` varchar(255) DEFAULT NULL,
  `title` varchar(60) NOT NULL,
  `desc` text,
  `hide` smallint(6) DEFAULT '0',
  `disabled` smallint(6) NOT NULL DEFAULT '0',
  `auto_subscribe` smallint(6) NOT NULL DEFAULT '0',
  `auto_unsubscribe` varchar(255) DEFAULT NULL,
  `vars` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_newsletter_user_subscription`
--

CREATE TABLE `er_newsletter_user_subscription` (
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '1',
  `type` enum('auto','user','unsubscribed') NOT NULL DEFAULT 'auto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_page`
--

CREATE TABLE `er_page` (
  `page_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text,
  `path` varchar(255) DEFAULT NULL,
  `use_layout` int(11) DEFAULT '0',
  `html` mediumtext,
  `dattm` datetime DEFAULT NULL,
  `onmenu` smallint(6) DEFAULT '0',
  `hide` smallint(6) DEFAULT '0',
  `tpl` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_robots` set('noindex','nofollow','noarchive') DEFAULT NULL,
  `no_access_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_product`
--

CREATE TABLE `er_product` (
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `trial_group` varchar(32) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `tax_group` varchar(255) DEFAULT '-1',
  `tax_rate_group` varchar(255) DEFAULT NULL,
  `tax_digital` varchar(255) DEFAULT '0',
  `sort_order` int(11) NOT NULL,
  `renewal_group` varchar(255) DEFAULT NULL,
  `start_date_fixed` date DEFAULT NULL,
  `require_other` text,
  `prevent_if_other` text,
  `paysys_id` varchar(255) DEFAULT NULL,
  `comment` text,
  `default_billing_plan_id` int(11) DEFAULT NULL,
  `is_tangible` tinyint(4) NOT NULL DEFAULT '0',
  `is_disabled` tinyint(4) NOT NULL DEFAULT '0',
  `is_archived` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_product`
--

INSERT INTO `er_product` (`product_id`, `title`, `description`, `url`, `trial_group`, `start_date`, `currency`, `tax_group`, `tax_rate_group`, `tax_digital`, `sort_order`, `renewal_group`, `start_date_fixed`, `require_other`, `prevent_if_other`, `paysys_id`, `comment`, `default_billing_plan_id`, `is_tangible`, `is_disabled`, `is_archived`) VALUES
(1, 'Sample Subscription', 'this is a sample subscription type', NULL, NULL, 'payment,product', 'USD', '-1', NULL, '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `er_product_category`
--

CREATE TABLE `er_product_category` (
  `product_category_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_product_option`
--

CREATE TABLE `er_product_option` (
  `product_option_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `default` varchar(255) DEFAULT NULL,
  `options` text,
  `is_required` tinyint(4) DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_product_product_category`
--

CREATE TABLE `er_product_product_category` (
  `product_product_category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_product_upgrade`
--

CREATE TABLE `er_product_upgrade` (
  `product_upgrade_id` int(11) NOT NULL,
  `from_billing_plan_id` int(11) DEFAULT NULL,
  `to_billing_plan_id` int(11) DEFAULT NULL,
  `surcharge` decimal(12,2) DEFAULT '0.00',
  `type` varchar(32) DEFAULT 'default',
  `comment` varchar(255) DEFAULT 'default',
  `terms` varchar(255) NOT NULL,
  `hide_if_to` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_rebill_log`
--

CREATE TABLE `er_rebill_log` (
  `rebill_log_id` int(10) UNSIGNED NOT NULL,
  `added_tm` datetime NOT NULL,
  `payment_date` date NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `rebill_payment_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `status_tm` datetime DEFAULT NULL,
  `status_msg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_resource_access`
--

CREATE TABLE `er_resource_access` (
  `resource_access_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED DEFAULT NULL,
  `resource_type` varchar(64) NOT NULL,
  `fn` enum('product_id','product_category_id','free','free_without_login','user_group_id','special') NOT NULL,
  `id` int(11) NOT NULL,
  `start_days` int(11) DEFAULT NULL,
  `start_payments` int(11) NOT NULL DEFAULT '0',
  `stop_days` int(11) DEFAULT NULL,
  `date_based` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_resource_access_sort`
--

CREATE TABLE `er_resource_access_sort` (
  `resource_access_sort_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED DEFAULT NULL,
  `resource_type` varchar(64) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_resource_access_sort`
--

INSERT INTO `er_resource_access_sort` (`resource_access_sort_id`, `resource_id`, `resource_type`, `sort_order`) VALUES
(1, 1, 'emailtemplate', 1),
(2, 2, 'emailtemplate', 2),
(3, 3, 'emailtemplate', 3),
(4, 4, 'emailtemplate', 4),
(5, 5, 'emailtemplate', 5),
(6, 6, 'emailtemplate', 6),
(7, 7, 'emailtemplate', 7),
(8, 8, 'emailtemplate', 8),
(9, 9, 'emailtemplate', 9),
(10, 10, 'emailtemplate', 10),
(11, 11, 'emailtemplate', 11),
(12, 12, 'emailtemplate', 12),
(13, 13, 'emailtemplate', 13),
(14, 14, 'emailtemplate', 14),
(15, 15, 'emailtemplate', 15),
(16, 16, 'emailtemplate', 16),
(17, 17, 'emailtemplate', 17),
(18, 18, 'emailtemplate', 18),
(19, 19, 'emailtemplate', 19),
(20, 20, 'emailtemplate', 20),
(21, 21, 'emailtemplate', 21),
(22, 22, 'emailtemplate', 22),
(23, 23, 'emailtemplate', 23),
(24, 24, 'emailtemplate', 24),
(25, 25, 'emailtemplate', 25),
(26, 26, 'emailtemplate', 26),
(27, 27, 'emailtemplate', 27),
(28, 28, 'emailtemplate', 28),
(29, 29, 'emailtemplate', 29),
(30, 30, 'emailtemplate', 30),
(31, 31, 'emailtemplate', 31),
(32, 32, 'emailtemplate', 32),
(33, 33, 'emailtemplate', 33),
(34, 34, 'emailtemplate', 34);

-- --------------------------------------------------------

--
-- Table structure for table `er_resource_category`
--

CREATE TABLE `er_resource_category` (
  `resource_category_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_resource_resource_category`
--

CREATE TABLE `er_resource_resource_category` (
  `resource_resource_category_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(11) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_saved_form`
--

CREATE TABLE `er_saved_form` (
  `saved_form_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `fields` mediumtext,
  `tpl` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `hide` smallint(6) DEFAULT '0',
  `is_disabled` smallint(6) DEFAULT '0',
  `default_for` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_robots` set('noindex','nofollow','noarchive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_saved_form`
--

INSERT INTO `er_saved_form` (`saved_form_id`, `title`, `comment`, `code`, `fields`, `tpl`, `type`, `hide`, `is_disabled`, `default_for`, `sort_order`, `meta_title`, `meta_keywords`, `meta_description`, `meta_robots`) VALUES
(1, 'Signup Form', 'customer signup/payment form', 'default', '[{\"id\":\"product-0\",\"class\":\"product\"},{\"id\":\"paysystem\",\"class\":\"paysystem\"},{\"id\":\"name\",\"class\":\"name\",\"hide\":\"1\"},{\"id\":\"email\",\"class\":\"email\",\"hide\":\"1\"},{\"id\":\"login\",\"class\":\"login\",\"hide\":\"1\"},{\"id\":\"password\",\"class\":\"password\",\"hide\":\"1\"}]', NULL, 'signup', 0, 0, 'signup,member', 1, NULL, NULL, NULL, NULL),
(2, 'Create Customer Profile', 'shopping cart signup form', NULL, '[{\"id\":\"name\",\"class\":\"name\",\"hide\":\"1\"},{\"id\":\"email\",\"class\":\"email\",\"hide\":\"1\"},{\"id\":\"login\",\"class\":\"login\",\"hide\":\"1\"},{\"id\":\"password\",\"class\":\"password\",\"hide\":\"1\"}]', NULL, 'cart', 0, 0, NULL, 2, NULL, NULL, NULL, NULL),
(3, 'Customer Profile', 'customer profile form', 'default', '[{\"id\":\"name\",\"class\":\"name\",\"hide\":\"1\"},{\"id\":\"email\",\"class\":\"email\",\"hide\":\"1\"},{\"id\":\"new-password\",\"class\":\"new-password\"}]', NULL, 'profile', 0, 0, 'profile', 3, NULL, NULL, NULL, NULL),
(4, 'Affiliate Signup Form', 'affiliate signup form', NULL, '[{\"id\":\"name\",\"class\":\"name\",\"hide\":\"1\"},{\"id\":\"email\",\"class\":\"email\",\"hide\":true},{\"id\":\"login\",\"class\":\"login\",\"hide\":true},{\"id\":\"password\",\"class\":\"password\",\"hide\":true},{\"id\":\"address\",\"class\":\"address\",\"hide\":\"1\",\"config\":{\"fields\":{\"street\":1,\"city\":1,\"country\":1,\"state\":1,\"zip\":1}}},{\"id\":\"payout\",\"class\":\"payout\"}]', NULL, 'aff', 0, 0, NULL, 4, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `er_saved_pass`
--

CREATE TABLE `er_saved_pass` (
  `saved_pass_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `format` varchar(32) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_saved_report`
--

CREATE TABLE `er_saved_report` (
  `saved_report_id` int(11) NOT NULL,
  `report_id` varchar(64) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `request` blob,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_saved_search`
--

CREATE TABLE `er_saved_search` (
  `saved_search_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `class` varchar(64) NOT NULL,
  `search` text,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_session`
--

CREATE TABLE `er_session` (
  `id` char(32) NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `data` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_session`
--

INSERT INTO `er_session` (`id`, `modified`, `lifetime`, `user_id`, `data`) VALUES
('7cn8ncg4milpo4u70jsctvfdfl', 1589485693, 7200, NULL, '__ZF|a:2:{s:12:\"amember_auth\";a:1:{s:3:\"ENT\";i:1589492893;}s:18:\"amember_admin_auth\";a:1:{s:3:\"ENT\";i:1589489293;}}amember_auth|a:1:{s:4:\"user\";N;}amember_admin_auth|a:1:{s:4:\"user\";a:15:{s:8:\"admin_id\";i:1;s:5:\"login\";s:5:\"admin\";s:6:\"name_f\";s:0:\"\";s:6:\"name_l\";s:0:\"\";s:4:\"pass\";s:34:\"$P$Fede3MdRiT8ltZxgLRux.8aR6LhAfv.\";s:10:\"last_login\";s:19:\"2020-05-12 10:06:00\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:12:\"last_session\";s:26:\"jot6qit875a4vpav15c3l48a6r\";s:5:\"email\";s:14:\"admin@mail.com\";s:10:\"super_user\";s:1:\"1\";s:5:\"perms\";N;s:5:\"prefs\";s:221:\"a:1:{s:17:\"dashboard-widgets\";a:4:{s:3:\"top\";a:0:{}s:6:\"bottom\";a:0:{}s:4:\"main\";a:2:{i:0;s:5:\"users\";i:1;s:8:\"payments\";}s:5:\"aside\";a:4:{i:0;s:5:\"sales\";i:1;s:8:\"activity\";i:2;s:12:\"report-users\";i:3;s:9:\"user-note\";}}}\";s:4:\"lang\";N;s:11:\"reseller_id\";N;s:11:\"is_disabled\";s:1:\"0\";}}amember|a:2:{s:14:\"uploadNeedBind\";N;s:14:\"admin_redirect\";N;}login-controller|a:1:{s:16:\"login_attempt_id\";a:0:{}}'),
('kqasp1ql14q8phirflc2qpu3k7', 1589540571, 7200, NULL, '__ZF|a:2:{s:12:\"amember_auth\";a:1:{s:3:\"ENT\";i:1589547771;}s:18:\"amember_admin_auth\";a:1:{s:3:\"ENT\";i:1589544171;}}amember_auth|a:1:{s:4:\"user\";N;}amember_admin_auth|a:1:{s:4:\"user\";N;}amember|a:1:{s:14:\"uploadNeedBind\";N;}login-controller|a:1:{s:16:\"login_attempt_id\";a:0:{}}'),
('okl3jevh8nqdcg0reju0g37g9e', 1589485130, 7200, NULL, '__ZF|a:2:{s:12:\"amember_auth\";a:1:{s:3:\"ENT\";i:1589492330;}s:18:\"amember_admin_auth\";a:1:{s:3:\"ENT\";i:1589488730;}}amember_auth|a:1:{s:4:\"user\";N;}amember_admin_auth|a:1:{s:4:\"user\";N;}amember|a:1:{s:14:\"uploadNeedBind\";N;}');

-- --------------------------------------------------------

--
-- Table structure for table `er_state`
--

CREATE TABLE `er_state` (
  `state_id` int(11) NOT NULL,
  `state` char(12) NOT NULL,
  `country` char(2) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `status` enum('added','changed') DEFAULT NULL,
  `tag` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_state`
--

INSERT INTO `er_state` (`state_id`, `state`, `country`, `title`, `status`, `tag`) VALUES
(1, 'AD-ALV', 'AD', 'Andorra la Vella', NULL, 0),
(2, 'AD-CAN', 'AD', 'Canillo', NULL, 0),
(3, 'AD-ENC', 'AD', 'Encamp', NULL, 0),
(4, 'AD-ESE', 'AD', 'Escaldes-Engordany', NULL, 0),
(5, 'AD-LMA', 'AD', 'La Massana', NULL, 0),
(6, 'AD-ORD', 'AD', 'Ordino', NULL, 0),
(7, 'AD-SJL', 'AD', 'Sant Julia de LOA', NULL, 0),
(8, 'AE-AJ', 'AE', '\'Ajman', NULL, 0),
(9, 'AE-AZ', 'AE', 'Abu Zaby', NULL, 0),
(10, 'AE-DU', 'AE', 'Dubayy', NULL, 0),
(11, 'AE-FU', 'AE', 'Al Fujayrah', NULL, 0),
(12, 'AE-RK', 'AE', 'R\'as al Khaymah', NULL, 0),
(13, 'AE-SH', 'AE', 'Ash Shariqah', NULL, 0),
(14, 'AE-UQ', 'AE', 'Umm al Qaywayn', NULL, 0),
(15, 'AF-BAL', 'AF', 'Balkh province', NULL, 0),
(16, 'AF-BAM', 'AF', 'Bamian province', NULL, 0),
(17, 'AF-BDG', 'AF', 'Badghis province', NULL, 0),
(18, 'AF-BDS', 'AF', 'Badakhshan province', NULL, 0),
(19, 'AF-BGL', 'AF', 'Baghlan province', NULL, 0),
(20, 'AF-FRA', 'AF', 'Farah province', NULL, 0),
(21, 'AF-FYB', 'AF', 'Faryab province', NULL, 0),
(22, 'AF-GHA', 'AF', 'Ghazni province', NULL, 0),
(23, 'AF-GHO', 'AF', 'Ghowr province', NULL, 0),
(24, 'AF-HEL', 'AF', 'Helmand province', NULL, 0),
(25, 'AF-HER', 'AF', 'Herat province', NULL, 0),
(26, 'AF-JOW', 'AF', 'Jowzjan province', NULL, 0),
(27, 'AF-KAB', 'AF', 'Kabul province', NULL, 0),
(28, 'AF-KAN', 'AF', 'Kandahar province', NULL, 0),
(29, 'AF-KAP', 'AF', 'Kapisa province', NULL, 0),
(30, 'AF-KDZ', 'AF', 'Kondoz province', NULL, 0),
(31, 'AF-KHO', 'AF', 'Khost province', NULL, 0),
(32, 'AF-KNR', 'AF', 'Konar province', NULL, 0),
(33, 'AF-LAG', 'AF', 'Laghman province', NULL, 0),
(34, 'AF-LOW', 'AF', 'Lowgar province', NULL, 0),
(35, 'AF-NAN', 'AF', 'Nangrahar province', NULL, 0),
(36, 'AF-NIM', 'AF', 'Nimruz province', NULL, 0),
(37, 'AF-NUR', 'AF', 'Nurestan province', NULL, 0),
(38, 'AF-ORU', 'AF', 'Oruzgan province', NULL, 0),
(39, 'AF-PAR', 'AF', 'Parwan province', NULL, 0),
(40, 'AF-PIA', 'AF', 'Paktia province', NULL, 0),
(41, 'AF-PKA', 'AF', 'Paktika province', NULL, 0),
(42, 'AF-SAM', 'AF', 'Samangan province', NULL, 0),
(43, 'AF-SAR', 'AF', 'Sar-e Pol province', NULL, 0),
(44, 'AF-TAK', 'AF', 'Takhar province', NULL, 0),
(45, 'AF-WAR', 'AF', 'Wardak province', NULL, 0),
(46, 'AF-ZAB', 'AF', 'Zabol province', NULL, 0),
(47, 'AG-ASG', 'AG', 'Saint George', NULL, 0),
(48, 'AG-ASH', 'AG', 'Saint Philip', NULL, 0),
(49, 'AG-ASJ', 'AG', 'Saint John', NULL, 0),
(50, 'AG-ASL', 'AG', 'Saint Paul', NULL, 0),
(51, 'AG-ASM', 'AG', 'Saint Mary', NULL, 0),
(52, 'AG-ASR', 'AG', 'Saint Peter', NULL, 0),
(53, 'AG-BAR', 'AG', 'Barbuda', NULL, 0),
(54, 'AG-RED', 'AG', 'Redonda', NULL, 0),
(55, 'AL-BR', 'AL', 'Berat', NULL, 0),
(56, 'AL-BU', 'AL', 'Bulqize', NULL, 0),
(57, 'AL-DI', 'AL', 'Diber', NULL, 0),
(58, 'AL-DL', 'AL', 'Delvine', NULL, 0),
(59, 'AL-DR', 'AL', 'Durres', NULL, 0),
(60, 'AL-DV', 'AL', 'Devoll', NULL, 0),
(61, 'AL-EL', 'AL', 'Elbasan', NULL, 0),
(62, 'AL-ER', 'AL', 'Kolonje', NULL, 0),
(63, 'AL-FR', 'AL', 'Fier', NULL, 0),
(64, 'AL-GJ', 'AL', 'Gjirokaster', NULL, 0),
(65, 'AL-GR', 'AL', 'Gramsh', NULL, 0),
(66, 'AL-HA', 'AL', 'Has', NULL, 0),
(67, 'AL-KA', 'AL', 'Kavaje', NULL, 0),
(68, 'AL-KB', 'AL', 'Kurbin', NULL, 0),
(69, 'AL-KC', 'AL', 'Kucove', NULL, 0),
(70, 'AL-KO', 'AL', 'Korce', NULL, 0),
(71, 'AL-KR', 'AL', 'Kruje', NULL, 0),
(72, 'AL-KU', 'AL', 'Kukes', NULL, 0),
(73, 'AL-LB', 'AL', 'Librazhd', NULL, 0),
(74, 'AL-LE', 'AL', 'Lezhe', NULL, 0),
(75, 'AL-LU', 'AL', 'Lushnje', NULL, 0),
(76, 'AL-MK', 'AL', 'Mallakaster', NULL, 0),
(77, 'AL-MM', 'AL', 'Malesi e Madhe', NULL, 0),
(78, 'AL-MR', 'AL', 'Mirdite', NULL, 0),
(79, 'AL-MT', 'AL', 'Mat', NULL, 0),
(80, 'AL-PG', 'AL', 'Pogradec', NULL, 0),
(81, 'AL-PQ', 'AL', 'Peqin', NULL, 0),
(82, 'AL-PR', 'AL', 'Permet', NULL, 0),
(83, 'AL-PU', 'AL', 'Puke', NULL, 0),
(84, 'AL-SH', 'AL', 'Shkoder', NULL, 0),
(85, 'AL-SK', 'AL', 'Skrapar', NULL, 0),
(86, 'AL-SR', 'AL', 'Sarande', NULL, 0),
(87, 'AL-TE', 'AL', 'Tepelene', NULL, 0),
(88, 'AL-TP', 'AL', 'Tropoje', NULL, 0),
(89, 'AL-TR', 'AL', 'Tirane', NULL, 0),
(90, 'AL-VL', 'AL', 'Vlore', NULL, 0),
(91, 'AM-AGT', 'AM', 'Aragatsotn', NULL, 0),
(92, 'AM-ARM', 'AM', 'Armavir', NULL, 0),
(93, 'AM-ARR', 'AM', 'Ararat', NULL, 0),
(94, 'AM-GEG', 'AM', 'Geghark\'unik\'', NULL, 0),
(95, 'AM-KOT', 'AM', 'Kotayk\'', NULL, 0),
(96, 'AM-LOR', 'AM', 'Lorri', NULL, 0),
(97, 'AM-SHI', 'AM', 'Shirak', NULL, 0),
(98, 'AM-SYU', 'AM', 'Syunik\'', NULL, 0),
(99, 'AM-TAV', 'AM', 'Tavush', NULL, 0),
(100, 'AM-VAY', 'AM', 'Vayots\' Dzor', NULL, 0),
(101, 'AM-YER', 'AM', 'Yerevan', NULL, 0),
(102, 'AO-BGO', 'AO', 'Bengo', NULL, 0),
(103, 'AO-BGU', 'AO', 'Benguela province', NULL, 0),
(104, 'AO-BIE', 'AO', 'Bie', NULL, 0),
(105, 'AO-CAB', 'AO', 'Cabinda', NULL, 0),
(106, 'AO-CCU', 'AO', 'Cuando-Cubango', NULL, 0),
(107, 'AO-CNN', 'AO', 'Cunene', NULL, 0),
(108, 'AO-CNO', 'AO', 'Cuanza Norte', NULL, 0),
(109, 'AO-CUS', 'AO', 'Cuanza Sul', NULL, 0),
(110, 'AO-HUA', 'AO', 'Huambo province', NULL, 0),
(111, 'AO-HUI', 'AO', 'Huila province', NULL, 0),
(112, 'AO-LNO', 'AO', 'Lunda Norte', NULL, 0),
(113, 'AO-LSU', 'AO', 'Lunda Sul', NULL, 0),
(114, 'AO-LUA', 'AO', 'Luanda', NULL, 0),
(115, 'AO-MAL', 'AO', 'Malange', NULL, 0),
(116, 'AO-MOX', 'AO', 'Moxico', NULL, 0),
(117, 'AO-NAM', 'AO', 'Namibe', NULL, 0),
(118, 'AO-UIG', 'AO', 'Uige', NULL, 0),
(119, 'AO-ZAI', 'AO', 'Zaire', NULL, 0),
(120, 'AR-A', 'AR', 'Salta', NULL, 0),
(121, 'AR-B', 'AR', 'Buenos Aires Province', NULL, 0),
(122, 'AR-C', 'AR', 'Distrito Federal', NULL, 0),
(123, 'AR-D', 'AR', 'San Luis', NULL, 0),
(124, 'AR-E', 'AR', 'Entre Rios', NULL, 0),
(125, 'AR-F', 'AR', 'La Rioja', NULL, 0),
(126, 'AR-G', 'AR', 'Santiago del Estero', NULL, 0),
(127, 'AR-H', 'AR', 'Chaco', NULL, 0),
(128, 'AR-J', 'AR', 'San Juan', NULL, 0),
(129, 'AR-K', 'AR', 'Catamarca', NULL, 0),
(130, 'AR-L', 'AR', 'La Pampa', NULL, 0),
(131, 'AR-M', 'AR', 'Mendoza', NULL, 0),
(132, 'AR-N', 'AR', 'Misiones', NULL, 0),
(133, 'AR-P', 'AR', 'Formosa', NULL, 0),
(134, 'AR-Q', 'AR', 'Neuquen', NULL, 0),
(135, 'AR-R', 'AR', 'Rio Negro', NULL, 0),
(136, 'AR-S', 'AR', 'Santa Fe', NULL, 0),
(137, 'AR-T', 'AR', 'Tucuman', NULL, 0),
(138, 'AR-U', 'AR', 'Chubut', NULL, 0),
(139, 'AR-V', 'AR', 'Tierra del Fuego', NULL, 0),
(140, 'AR-W', 'AR', 'Corrientes', NULL, 0),
(141, 'AR-X', 'AR', 'Cordoba', NULL, 0),
(142, 'AR-Y', 'AR', 'Jujuy', NULL, 0),
(143, 'AR-Z', 'AR', 'Santa Cruz', NULL, 0),
(144, 'AS-E', 'AS', 'Eastern', NULL, 0),
(145, 'AS-M', 'AS', 'Manu\'a', NULL, 0),
(146, 'AS-R', 'AS', 'Rose Island', NULL, 0),
(147, 'AS-S', 'AS', 'Swains Island', NULL, 0),
(148, 'AS-W', 'AS', 'Western', NULL, 0),
(149, 'AT-BUR', 'AT', 'Burgenland', NULL, 0),
(150, 'AT-KAR', 'AT', 'Karnten', NULL, 0),
(151, 'AT-NOS', 'AT', 'Niederosterreich', NULL, 0),
(152, 'AT-OOS', 'AT', 'Oberosterreich', NULL, 0),
(153, 'AT-SAL', 'AT', 'Salzburg', NULL, 0),
(154, 'AT-STE', 'AT', 'Steiermark', NULL, 0),
(155, 'AT-TIR', 'AT', 'Tirol', NULL, 0),
(156, 'AT-VOR', 'AT', 'Vorarlberg', NULL, 0),
(157, 'AT-WIE', 'AT', 'Wien', NULL, 0),
(158, 'AU-ACT', 'AU', 'Australian Capital Territory', NULL, 0),
(159, 'AU-NSW', 'AU', 'New South Wales', NULL, 0),
(160, 'AU-NT', 'AU', 'Northern Territory', NULL, 0),
(161, 'AU-QLD', 'AU', 'Queensland', NULL, 0),
(162, 'AU-SA', 'AU', 'South Australia', NULL, 0),
(163, 'AU-TAS', 'AU', 'Tasmania', NULL, 0),
(164, 'AU-VIC', 'AU', 'Victoria', NULL, 0),
(165, 'AU-WA', 'AU', 'Western Australia', NULL, 0),
(166, 'AZ-AB', 'AZ', 'Ali Bayramli', NULL, 0),
(167, 'AZ-ABS', 'AZ', 'Abseron', NULL, 0),
(168, 'AZ-AGA', 'AZ', 'Agstafa', NULL, 0),
(169, 'AZ-AGC', 'AZ', 'AgcabAdi', NULL, 0),
(170, 'AZ-AGM', 'AZ', 'Agdam', NULL, 0),
(171, 'AZ-AGS', 'AZ', 'Agdas', NULL, 0),
(172, 'AZ-AGU', 'AZ', 'Agsu', NULL, 0),
(173, 'AZ-AST', 'AZ', 'Astara', NULL, 0),
(174, 'AZ-BA', 'AZ', 'Baki', NULL, 0),
(175, 'AZ-BAB', 'AZ', 'Babak', NULL, 0),
(176, 'AZ-BAL', 'AZ', 'Balakan', NULL, 0),
(177, 'AZ-BAR', 'AZ', 'Barda', NULL, 0),
(178, 'AZ-BEY', 'AZ', 'Beylaqan', NULL, 0),
(179, 'AZ-BIL', 'AZ', 'Bilasuvar', NULL, 0),
(180, 'AZ-CAB', 'AZ', 'Cabrayil', NULL, 0),
(181, 'AZ-CAL', 'AZ', 'Calilabab', NULL, 0),
(182, 'AZ-CUL', 'AZ', 'Culfa', NULL, 0),
(183, 'AZ-DAS', 'AZ', 'Daskasan', NULL, 0),
(184, 'AZ-DAV', 'AZ', 'Davaci', NULL, 0),
(185, 'AZ-FUZ', 'AZ', 'Fuzuli', NULL, 0),
(186, 'AZ-GA', 'AZ', 'Ganca', NULL, 0),
(187, 'AZ-GAD', 'AZ', 'Gadabay', NULL, 0),
(188, 'AZ-GOR', 'AZ', 'Goranboy', NULL, 0),
(189, 'AZ-GOY', 'AZ', 'Goycay', NULL, 0),
(190, 'AZ-HAC', 'AZ', 'Haciqabul', NULL, 0),
(191, 'AZ-IMI', 'AZ', 'Imisli', NULL, 0),
(192, 'AZ-ISM', 'AZ', 'Ismayilli', NULL, 0),
(193, 'AZ-KAL', 'AZ', 'Kalbacar', NULL, 0),
(194, 'AZ-KUR', 'AZ', 'Kurdamir', NULL, 0),
(195, 'AZ-LAC', 'AZ', 'Lacin', NULL, 0),
(196, 'AZ-LAN', 'AZ', 'Lankaran', NULL, 0),
(197, 'AZ-LER', 'AZ', 'Lerik', NULL, 0),
(198, 'AZ-MAS', 'AZ', 'Masalli', NULL, 0),
(199, 'AZ-MI', 'AZ', 'Mingacevir', NULL, 0),
(200, 'AZ-NA', 'AZ', 'Naftalan', NULL, 0),
(201, 'AZ-NEF', 'AZ', 'Neftcala', NULL, 0),
(202, 'AZ-NX', 'AZ', 'Naxcivan', NULL, 0),
(203, 'AZ-OGU', 'AZ', 'Oguz', NULL, 0),
(204, 'AZ-ORD', 'AZ', 'Ordubad', NULL, 0),
(205, 'AZ-QAB', 'AZ', 'Qabala', NULL, 0),
(206, 'AZ-QAX', 'AZ', 'Qax', NULL, 0),
(207, 'AZ-QAZ', 'AZ', 'Qazax', NULL, 0),
(208, 'AZ-QBA', 'AZ', 'Quba', NULL, 0),
(209, 'AZ-QBI', 'AZ', 'Qubadli', NULL, 0),
(210, 'AZ-QOB', 'AZ', 'Qobustan', NULL, 0),
(211, 'AZ-QUS', 'AZ', 'Qusar', NULL, 0),
(212, 'AZ-SA', 'AZ', 'Saki', NULL, 0),
(213, 'AZ-SAB', 'AZ', 'Sabirabad', NULL, 0),
(214, 'AZ-SAD', 'AZ', 'Sadarak', NULL, 0),
(215, 'AZ-SAH', 'AZ', 'Sahbuz', NULL, 0),
(216, 'AZ-SAK', 'AZ', 'Saki', NULL, 0),
(217, 'AZ-SAL', 'AZ', 'Salyan', NULL, 0),
(218, 'AZ-SAR', 'AZ', 'Sarur', NULL, 0),
(219, 'AZ-SAT', 'AZ', 'Saatli', NULL, 0),
(220, 'AZ-SIY', 'AZ', 'Siyazan', NULL, 0),
(221, 'AZ-SKR', 'AZ', 'Samkir', NULL, 0),
(222, 'AZ-SM', 'AZ', 'Sumqayit', NULL, 0),
(223, 'AZ-SMI', 'AZ', 'Samaxi', NULL, 0),
(224, 'AZ-SMX', 'AZ', 'Samux', NULL, 0),
(225, 'AZ-SS', 'AZ', 'Susa', NULL, 0),
(226, 'AZ-SUS', 'AZ', 'Susa', NULL, 0),
(227, 'AZ-TAR', 'AZ', 'Tartar', NULL, 0),
(228, 'AZ-TOV', 'AZ', 'Tovuz', NULL, 0),
(229, 'AZ-UCA', 'AZ', 'Ucar', NULL, 0),
(230, 'AZ-XA', 'AZ', 'Xankandi', NULL, 0),
(231, 'AZ-XAC', 'AZ', 'Xacmaz', NULL, 0),
(232, 'AZ-XAN', 'AZ', 'Xanlar', NULL, 0),
(233, 'AZ-XCI', 'AZ', 'Xocali', NULL, 0),
(234, 'AZ-XIZ', 'AZ', 'Xizi', NULL, 0),
(235, 'AZ-XVD', 'AZ', 'Xocavand', NULL, 0),
(236, 'AZ-YAR', 'AZ', 'Yardimli', NULL, 0),
(237, 'AZ-YEV', 'AZ', 'Yevlax', NULL, 0),
(238, 'AZ-ZAN', 'AZ', 'Zangilan', NULL, 0),
(239, 'AZ-ZAQ', 'AZ', 'Zaqatala', NULL, 0),
(240, 'AZ-ZAR', 'AZ', 'Zardab', NULL, 0),
(241, 'BA-BRO', 'BA', 'Brcko district', NULL, 0),
(242, 'BA-FBP', 'BA', 'Bosanskopodrinjski Kanton', NULL, 0),
(243, 'BA-FHN', 'BA', 'Hercegovacko-neretvanski Kanton', NULL, 0),
(244, 'BA-FPO', 'BA', 'Posavski Kanton', NULL, 0),
(245, 'BA-FSA', 'BA', 'Kanton Sarajevo', NULL, 0),
(246, 'BA-FSB', 'BA', 'Srednjebosanski Kanton', NULL, 0),
(247, 'BA-FTU', 'BA', 'Tuzlanski Kanton', NULL, 0),
(248, 'BA-FUS', 'BA', 'Unsko-Sanski Kanton', NULL, 0),
(249, 'BA-FZA', 'BA', 'Zapadnobosanska', NULL, 0),
(250, 'BA-FZE', 'BA', 'Zenicko-Dobojski Kanton', NULL, 0),
(251, 'BA-FZH', 'BA', 'Zapadnohercegovacka Zupanija', NULL, 0),
(252, 'BA-SBI', 'BA', 'Bijeljina', NULL, 0),
(253, 'BA-SBL', 'BA', 'Banja Luka', NULL, 0),
(254, 'BA-SDO', 'BA', 'Doboj', NULL, 0),
(255, 'BA-SFO', 'BA', 'Foca', NULL, 0),
(256, 'BA-SSR', 'BA', 'Sarajevo-Romanija or Sokolac', NULL, 0),
(257, 'BA-STR', 'BA', 'Trebinje', NULL, 0),
(258, 'BA-SVL', 'BA', 'Vlasenica', NULL, 0),
(259, 'BB-AND', 'BB', 'Saint Andrew', NULL, 0),
(260, 'BB-CC', 'BB', 'Christ Church', NULL, 0),
(261, 'BB-GEO', 'BB', 'Saint George', NULL, 0),
(262, 'BB-JAM', 'BB', 'Saint James', NULL, 0),
(263, 'BB-JOH', 'BB', 'Saint John', NULL, 0),
(264, 'BB-JOS', 'BB', 'Saint Joseph', NULL, 0),
(265, 'BB-LUC', 'BB', 'Saint Lucy', NULL, 0),
(266, 'BB-MIC', 'BB', 'Saint Michael', NULL, 0),
(267, 'BB-PET', 'BB', 'Saint Peter', NULL, 0),
(268, 'BB-PHI', 'BB', 'Saint Philip', NULL, 0),
(269, 'BB-THO', 'BB', 'Saint Thomas', NULL, 0),
(270, 'BD-BAR', 'BD', 'Barisal', NULL, 0),
(271, 'BD-CHI', 'BD', 'Chittagong', NULL, 0),
(272, 'BD-DHA', 'BD', 'Dhaka', NULL, 0),
(273, 'BD-KHU', 'BD', 'Khulna', NULL, 0),
(274, 'BD-RAJ', 'BD', 'Rajshahi', NULL, 0),
(275, 'BD-SYL', 'BD', 'Sylhet', NULL, 0),
(276, 'BE-BRU', 'BE', 'Brussels', NULL, 0),
(277, 'BE-VAN', 'BE', 'Antwerpen', NULL, 0),
(278, 'BE-VBR', 'BE', 'Vlaams Brabant', NULL, 0),
(279, 'BE-VLI', 'BE', 'Limburg', NULL, 0),
(280, 'BE-VOV', 'BE', 'Oost-Vlaanderen', NULL, 0),
(281, 'BE-VWV', 'BE', 'West-Vlaanderen', NULL, 0),
(282, 'BE-WBR', 'BE', 'Brabant Wallon', NULL, 0),
(283, 'BE-WHT', 'BE', 'Hainaut', NULL, 0),
(284, 'BE-WLG', 'BE', 'Liege', NULL, 0),
(285, 'BE-WLX', 'BE', 'Luxembourg', NULL, 0),
(286, 'BE-WNA', 'BE', 'Namur', NULL, 0),
(287, 'BF-BAL', 'BF', 'Bale', NULL, 0),
(288, 'BF-BAM', 'BF', 'Bam', NULL, 0),
(289, 'BF-BAN', 'BF', 'Banwa', NULL, 0),
(290, 'BF-BAZ', 'BF', 'Bazega', NULL, 0),
(291, 'BF-BLG', 'BF', 'Boulgou', NULL, 0),
(292, 'BF-BOK', 'BF', 'Boulkiemde', NULL, 0),
(293, 'BF-BOR', 'BF', 'Bougouriba', NULL, 0),
(294, 'BF-COM', 'BF', 'Comoe', NULL, 0),
(295, 'BF-GAN', 'BF', 'Ganzourgou', NULL, 0),
(296, 'BF-GNA', 'BF', 'Gnagna', NULL, 0),
(297, 'BF-GOU', 'BF', 'Gourma', NULL, 0),
(298, 'BF-HOU', 'BF', 'Houet', NULL, 0),
(299, 'BF-IOA', 'BF', 'Ioba', NULL, 0),
(300, 'BF-KAD', 'BF', 'Kadiogo', NULL, 0),
(301, 'BF-KEN', 'BF', 'Kenedougou', NULL, 0),
(302, 'BF-KOD', 'BF', 'Komondjari', NULL, 0),
(303, 'BF-KOL', 'BF', 'Koulpelogo', NULL, 0),
(304, 'BF-KOP', 'BF', 'Kompienga', NULL, 0),
(305, 'BF-KOS', 'BF', 'Kossi', NULL, 0),
(306, 'BF-KOT', 'BF', 'Kouritenga', NULL, 0),
(307, 'BF-KOW', 'BF', 'Kourweogo', NULL, 0),
(308, 'BF-LER', 'BF', 'Leraba', NULL, 0),
(309, 'BF-LOR', 'BF', 'Loroum', NULL, 0),
(310, 'BF-MOU', 'BF', 'Mouhoun', NULL, 0),
(311, 'BF-NAH', 'BF', 'Nahouri', NULL, 0),
(312, 'BF-NAM', 'BF', 'Namentenga', NULL, 0),
(313, 'BF-NAY', 'BF', 'Nayala', NULL, 0),
(314, 'BF-NOU', 'BF', 'Noumbiel', NULL, 0),
(315, 'BF-OUB', 'BF', 'Oubritenga', NULL, 0),
(316, 'BF-OUD', 'BF', 'Oudalan', NULL, 0),
(317, 'BF-PAS', 'BF', 'Passore', NULL, 0),
(318, 'BF-PON', 'BF', 'Poni', NULL, 0),
(319, 'BF-SAG', 'BF', 'Sanguie', NULL, 0),
(320, 'BF-SAM', 'BF', 'Sanmatenga', NULL, 0),
(321, 'BF-SEN', 'BF', 'Seno', NULL, 0),
(322, 'BF-SIS', 'BF', 'Sissili', NULL, 0),
(323, 'BF-SOM', 'BF', 'Soum', NULL, 0),
(324, 'BF-SOR', 'BF', 'Sourou', NULL, 0),
(325, 'BF-TAP', 'BF', 'Tapoa', NULL, 0),
(326, 'BF-TUY', 'BF', 'Tuy', NULL, 0),
(327, 'BF-YAG', 'BF', 'Yagha', NULL, 0),
(328, 'BF-YAT', 'BF', 'Yatenga', NULL, 0),
(329, 'BF-ZIR', 'BF', 'Ziro', NULL, 0),
(330, 'BF-ZOD', 'BF', 'Zondoma', NULL, 0),
(331, 'BF-ZOW', 'BF', 'Zoundweogo', NULL, 0),
(332, 'BG-01', 'BG', 'Blagoevgrad', NULL, 0),
(333, 'BG-02', 'BG', 'Burgas', NULL, 0),
(334, 'BG-03', 'BG', 'Varna', NULL, 0),
(335, 'BG-04', 'BG', 'Veliko Turnovo', NULL, 0),
(336, 'BG-05', 'BG', 'Vidin', NULL, 0),
(337, 'BG-06', 'BG', 'Vratsa', NULL, 0),
(338, 'BG-07', 'BG', 'Gabrovo', NULL, 0),
(339, 'BG-08', 'BG', 'Dobrich', NULL, 0),
(340, 'BG-09', 'BG', 'Kurdzhali', NULL, 0),
(341, 'BG-10', 'BG', 'Kyustendil', NULL, 0),
(342, 'BG-11', 'BG', 'Lovech', NULL, 0),
(343, 'BG-12', 'BG', 'Montana', NULL, 0),
(344, 'BG-13', 'BG', 'Pazardzhik', NULL, 0),
(345, 'BG-14', 'BG', 'Pernik', NULL, 0),
(346, 'BG-15', 'BG', 'Pleven', NULL, 0),
(347, 'BG-16', 'BG', 'Plovdiv', NULL, 0),
(348, 'BG-17', 'BG', 'Razgrad', NULL, 0),
(349, 'BG-18', 'BG', 'Ruse', NULL, 0),
(350, 'BG-19', 'BG', 'Silistra', NULL, 0),
(351, 'BG-20', 'BG', 'Sliven', NULL, 0),
(352, 'BG-21', 'BG', 'Smolyan', NULL, 0),
(353, 'BG-22', 'BG', 'Sofia Region', NULL, 0),
(354, 'BG-23', 'BG', 'Sofia', NULL, 0),
(355, 'BG-24', 'BG', 'Stara Zagora', NULL, 0),
(356, 'BG-25', 'BG', 'Turgovishte', NULL, 0),
(357, 'BG-26', 'BG', 'Khaskovo', NULL, 0),
(358, 'BG-27', 'BG', 'Shumen', NULL, 0),
(359, 'BG-28', 'BG', 'Yambol', NULL, 0),
(360, 'BH-CAP', 'BH', 'Capital', NULL, 0),
(361, 'BH-CEN', 'BH', 'Central', NULL, 0),
(362, 'BH-MUH', 'BH', 'Muharraq', NULL, 0),
(363, 'BH-NOR', 'BH', 'Northern', NULL, 0),
(364, 'BH-SOU', 'BH', 'Southern', NULL, 0),
(365, 'BI-BB', 'BI', 'Bubanza', NULL, 0),
(366, 'BI-BJ', 'BI', 'Bujumbura', NULL, 0),
(367, 'BI-BR', 'BI', 'Bururi', NULL, 0),
(368, 'BI-CA', 'BI', 'Cankuzo', NULL, 0),
(369, 'BI-CI', 'BI', 'Cibitoke', NULL, 0),
(370, 'BI-GI', 'BI', 'Gitega', NULL, 0),
(371, 'BI-KI', 'BI', 'Kirundo', NULL, 0),
(372, 'BI-KR', 'BI', 'Karuzi', NULL, 0),
(373, 'BI-KY', 'BI', 'Kayanza', NULL, 0),
(374, 'BI-MA', 'BI', 'Makamba', NULL, 0),
(375, 'BI-MU', 'BI', 'Muramvya', NULL, 0),
(376, 'BI-MW', 'BI', 'Mwaro', NULL, 0),
(377, 'BI-MY', 'BI', 'Muyinga', NULL, 0),
(378, 'BI-NG', 'BI', 'Ngozi', NULL, 0),
(379, 'BI-RT', 'BI', 'Rutana', NULL, 0),
(380, 'BI-RY', 'BI', 'Ruyigi', NULL, 0),
(381, 'BJ-AK', 'BJ', 'Atakora', NULL, 0),
(382, 'BJ-AL', 'BJ', 'Alibori', NULL, 0),
(383, 'BJ-AQ', 'BJ', 'Atlantique', NULL, 0),
(384, 'BJ-BO', 'BJ', 'Borgou', NULL, 0),
(385, 'BJ-CO', 'BJ', 'Collines', NULL, 0),
(386, 'BJ-DO', 'BJ', 'Donga', NULL, 0),
(387, 'BJ-KO', 'BJ', 'Kouffo', NULL, 0),
(388, 'BJ-LI', 'BJ', 'Littoral', NULL, 0),
(389, 'BJ-MO', 'BJ', 'Mono', NULL, 0),
(390, 'BJ-OU', 'BJ', 'Oueme', NULL, 0),
(391, 'BJ-PL', 'BJ', 'Plateau', NULL, 0),
(392, 'BJ-ZO', 'BJ', 'Zou', NULL, 0),
(393, 'BM-DS', 'BM', 'Devonshire', NULL, 0),
(394, 'BM-GC', 'BM', 'Saint George City', NULL, 0),
(395, 'BM-HA', 'BM', 'Hamilton', NULL, 0),
(396, 'BM-HC', 'BM', 'Hamilton City', NULL, 0),
(397, 'BM-PB', 'BM', 'Pembroke', NULL, 0),
(398, 'BM-PG', 'BM', 'Paget', NULL, 0),
(399, 'BM-SA', 'BM', 'Sandys', NULL, 0),
(400, 'BM-SG', 'BM', 'Saint George\'s', NULL, 0),
(401, 'BM-SH', 'BM', 'Southampton', NULL, 0),
(402, 'BM-SM', 'BM', 'Smith\'s', NULL, 0),
(403, 'BM-WA', 'BM', 'Warwick', NULL, 0),
(404, 'BN-BEL', 'BN', 'Belait', NULL, 0),
(405, 'BN-BRM', 'BN', 'Brunei and Muara', NULL, 0),
(406, 'BN-TEM', 'BN', 'Temburong', NULL, 0),
(407, 'BN-TUT', 'BN', 'Tutong', NULL, 0),
(408, 'BO-BEN', 'BO', 'Departmento Beni', NULL, 0),
(409, 'BO-CHU', 'BO', 'Departmento Chuquisaca', NULL, 0),
(410, 'BO-COC', 'BO', 'Departmento Cochabamba', NULL, 0),
(411, 'BO-LPZ', 'BO', 'Departmento La Paz', NULL, 0),
(412, 'BO-ORU', 'BO', 'Departmento Oruro', NULL, 0),
(413, 'BO-PAN', 'BO', 'Departmento Pando', NULL, 0),
(414, 'BO-POT', 'BO', 'Departmento Potosi', NULL, 0),
(415, 'BO-SCZ', 'BO', 'Departmento Santa Cruz', NULL, 0),
(416, 'BO-TAR', 'BO', 'Departmento Tarija', NULL, 0),
(417, 'BR-AC', 'BR', 'Acre', NULL, 0),
(418, 'BR-AL', 'BR', 'Alagoas', NULL, 0),
(419, 'BR-AM', 'BR', 'Amazonas', NULL, 0),
(420, 'BR-AP', 'BR', 'Amapa', NULL, 0),
(421, 'BR-BA', 'BR', 'Bahia', NULL, 0),
(422, 'BR-CE', 'BR', 'Ceara', NULL, 0),
(423, 'BR-DF', 'BR', 'Distrito Federal', NULL, 0),
(424, 'BR-ES', 'BR', 'Espirito Santo', NULL, 0),
(425, 'BR-GO', 'BR', 'Goias', NULL, 0),
(426, 'BR-MA', 'BR', 'Maranhao', NULL, 0),
(427, 'BR-MG', 'BR', 'Minas Gerais', NULL, 0),
(428, 'BR-MS', 'BR', 'Mato Grosso do Sul', NULL, 0),
(429, 'BR-MT', 'BR', 'Mato Grosso', NULL, 0),
(430, 'BR-PA', 'BR', 'Para', NULL, 0),
(431, 'BR-PB', 'BR', 'Paraiba', NULL, 0),
(432, 'BR-PE', 'BR', 'Pernambuco', NULL, 0),
(433, 'BR-PI', 'BR', 'Piaui', NULL, 0),
(434, 'BR-PR', 'BR', 'Parana', NULL, 0),
(435, 'BR-RJ', 'BR', 'Rio de Janeiro', NULL, 0),
(436, 'BR-RN', 'BR', 'Rio Grande do Norte', NULL, 0),
(437, 'BR-RO', 'BR', 'Rondonia', NULL, 0),
(438, 'BR-RR', 'BR', 'Roraima', NULL, 0),
(439, 'BR-RS', 'BR', 'Rio Grande do Sul', NULL, 0),
(440, 'BR-SC', 'BR', 'Santa Catarina', NULL, 0),
(441, 'BR-SE', 'BR', 'Sergipe', NULL, 0),
(442, 'BR-SP', 'BR', 'Sao Paulo', NULL, 0),
(443, 'BR-TO', 'BR', 'Tocantins', NULL, 0),
(444, 'BS-ACK', 'BS', 'Acklins', NULL, 0),
(445, 'BS-BER', 'BS', 'Berry Islands', NULL, 0),
(446, 'BS-BIM', 'BS', 'Bimini', NULL, 0),
(447, 'BS-BLK', 'BS', 'Black Point', NULL, 0),
(448, 'BS-CAB', 'BS', 'Central Abaco', NULL, 0),
(449, 'BS-CAN', 'BS', 'Central Andros', NULL, 0),
(450, 'BS-CAT', 'BS', 'Cat Island', NULL, 0),
(451, 'BS-CEL', 'BS', 'Central Eleuthera', NULL, 0),
(452, 'BS-CRO', 'BS', 'Crooked Island', NULL, 0),
(453, 'BS-EGB', 'BS', 'East Grand Bahama', NULL, 0),
(454, 'BS-EXU', 'BS', 'Exuma', NULL, 0),
(455, 'BS-FRE', 'BS', 'City of Freeport', NULL, 0),
(456, 'BS-GRD', 'BS', 'Grand Cay', NULL, 0),
(457, 'BS-HAR', 'BS', 'Harbour Island', NULL, 0),
(458, 'BS-HOP', 'BS', 'Hope Town', NULL, 0),
(459, 'BS-INA', 'BS', 'Inagua', NULL, 0),
(460, 'BS-LNG', 'BS', 'Long Island', NULL, 0),
(461, 'BS-MAN', 'BS', 'Mangrove Cay', NULL, 0),
(462, 'BS-MAY', 'BS', 'Mayaguana', NULL, 0),
(463, 'BS-MOO', 'BS', 'Moore\'s Island', NULL, 0),
(464, 'BS-NAB', 'BS', 'North Abaco', NULL, 0),
(465, 'BS-NAN', 'BS', 'North Andros', NULL, 0),
(466, 'BS-NEL', 'BS', 'North Eleuthera', NULL, 0),
(467, 'BS-RAG', 'BS', 'Ragged Island', NULL, 0),
(468, 'BS-RUM', 'BS', 'Rum Cay', NULL, 0),
(469, 'BS-SAB', 'BS', 'South Abaco', NULL, 0),
(470, 'BS-SAL', 'BS', 'San Salvador', NULL, 0),
(471, 'BS-SAN', 'BS', 'South Andros', NULL, 0),
(472, 'BS-SEL', 'BS', 'South Eleuthera', NULL, 0),
(473, 'BS-SWE', 'BS', 'Spanish Wells', NULL, 0),
(474, 'BS-WGB', 'BS', 'West Grand Bahama', NULL, 0),
(475, 'BT-BUM', 'BT', 'Bumthang', NULL, 0),
(476, 'BT-CHU', 'BT', 'Chukha', NULL, 0),
(477, 'BT-DAG', 'BT', 'Dagana', NULL, 0),
(478, 'BT-GAS', 'BT', 'Gasa', NULL, 0),
(479, 'BT-HAA', 'BT', 'Haa', NULL, 0),
(480, 'BT-LHU', 'BT', 'Lhuntse', NULL, 0),
(481, 'BT-MON', 'BT', 'Mongar', NULL, 0),
(482, 'BT-PAR', 'BT', 'Paro', NULL, 0),
(483, 'BT-PEM', 'BT', 'Pemagatshel', NULL, 0),
(484, 'BT-PUN', 'BT', 'Punakha', NULL, 0),
(485, 'BT-SAR', 'BT', 'Sarpang', NULL, 0),
(486, 'BT-SAT', 'BT', 'Samtse', NULL, 0),
(487, 'BT-SJO', 'BT', 'Samdrup Jongkhar', NULL, 0),
(488, 'BT-THI', 'BT', 'Thimphu', NULL, 0),
(489, 'BT-TRG', 'BT', 'Trashigang', NULL, 0),
(490, 'BT-TRO', 'BT', 'Trongsa', NULL, 0),
(491, 'BT-TRY', 'BT', 'Trashiyangste', NULL, 0),
(492, 'BT-TSI', 'BT', 'Tsirang', NULL, 0),
(493, 'BT-WPH', 'BT', 'Wangdue Phodrang', NULL, 0),
(494, 'BT-ZHE', 'BT', 'Zhemgang', NULL, 0),
(495, 'BW-CE', 'BW', 'Central', NULL, 0),
(496, 'BW-GH', 'BW', 'Ghanzi', NULL, 0),
(497, 'BW-KD', 'BW', 'Kgalagadi', NULL, 0),
(498, 'BW-KT', 'BW', 'Kgatleng', NULL, 0),
(499, 'BW-KW', 'BW', 'Kweneng', NULL, 0),
(500, 'BW-NE', 'BW', 'North East', NULL, 0),
(501, 'BW-NG', 'BW', 'Ngamiland', NULL, 0),
(502, 'BW-NW', 'BW', 'North West', NULL, 0),
(503, 'BW-SE', 'BW', 'South East', NULL, 0),
(504, 'BW-SO', 'BW', 'Southern', NULL, 0),
(505, 'BY-BR', 'BY', 'Brest voblast', NULL, 0),
(506, 'BY-HO', 'BY', 'Homyel voblast', NULL, 0),
(507, 'BY-HR', 'BY', 'Hrodna voblast', NULL, 0),
(508, 'BY-MA', 'BY', 'Mahilyow voblast', NULL, 0),
(509, 'BY-MI', 'BY', 'Minsk voblast', NULL, 0),
(510, 'BY-VI', 'BY', 'Vitsebsk voblast', NULL, 0),
(511, 'BZ-BZ', 'BZ', 'Belize District', NULL, 0),
(512, 'BZ-CR', 'BZ', 'Corozal District', NULL, 0),
(513, 'BZ-CY', 'BZ', 'Cayo District', NULL, 0),
(514, 'BZ-OW', 'BZ', 'Orange Walk District', NULL, 0),
(515, 'BZ-SC', 'BZ', 'Stann Creek District', NULL, 0),
(516, 'BZ-TO', 'BZ', 'Toledo District', NULL, 0),
(517, 'AB', 'CA', 'Alberta', NULL, 0),
(518, 'BC', 'CA', 'British Columbia', NULL, 0),
(519, 'MB', 'CA', 'Manitoba', NULL, 0),
(520, 'NB', 'CA', 'New Brunswick', NULL, 0),
(521, 'NL', 'CA', 'Newfoundland and Labrador', NULL, 0),
(522, 'NS', 'CA', 'Nova Scotia', NULL, 0),
(523, 'NT', 'CA', 'Northwest Territories', NULL, 0),
(524, 'NU', 'CA', 'Nunavut', NULL, 0),
(525, 'ON', 'CA', 'Ontario', NULL, 0),
(526, 'PE', 'CA', 'Prince Edward Island', NULL, 0),
(527, 'QC', 'CA', 'Quebec', NULL, 0),
(528, 'SK', 'CA', 'Saskatchewan', NULL, 0),
(529, 'YT', 'CA', 'Yukon Territory', NULL, 0),
(530, 'CC-D', 'CC', 'Direction Island', NULL, 0),
(531, 'CC-H', 'CC', 'Home Island', NULL, 0),
(532, 'CC-O', 'CC', 'Horsburgh Island', NULL, 0),
(533, 'CC-S', 'CC', 'South Island', NULL, 0),
(534, 'CC-W', 'CC', 'West Island', NULL, 0),
(535, 'CD-BC', 'CD', 'Bas-Congo', NULL, 0),
(536, 'CD-BN', 'CD', 'Bandundu', NULL, 0),
(537, 'CD-EQ', 'CD', 'Equateur', NULL, 0),
(538, 'CD-KA', 'CD', 'Katanga', NULL, 0),
(539, 'CD-KE', 'CD', 'Kasai-Oriental', NULL, 0),
(540, 'CD-KN', 'CD', 'Kinshasa', NULL, 0),
(541, 'CD-KW', 'CD', 'Kasai-Occidental', NULL, 0),
(542, 'CD-MA', 'CD', 'Maniema', NULL, 0),
(543, 'CD-NK', 'CD', 'Nord-Kivu', NULL, 0),
(544, 'CD-OR', 'CD', 'Orientale', NULL, 0),
(545, 'CD-SK', 'CD', 'Sud-Kivu', NULL, 0),
(546, 'CF-BAN', 'CF', 'Bangui', NULL, 0),
(547, 'CF-BBA', 'CF', 'Bamingui-Bangoran', NULL, 0),
(548, 'CF-BKO', 'CF', 'Basse-Kotto', NULL, 0),
(549, 'CF-HKO', 'CF', 'Haute-Kotto', NULL, 0),
(550, 'CF-HMB', 'CF', 'Haut-Mbomou', NULL, 0),
(551, 'CF-KEM', 'CF', 'Kemo', NULL, 0),
(552, 'CF-LOB', 'CF', 'Lobaye', NULL, 0),
(553, 'CF-MBO', 'CF', 'Mbomou', NULL, 0),
(554, 'CF-MKD', 'CF', 'Mambere-KadeO?                                      C', NULL, 0),
(555, 'CF-NGR', 'CF', 'Nana-Grebizi', NULL, 0),
(556, 'CF-NMM', 'CF', 'Nana-Mambere', NULL, 0),
(557, 'CF-OMP', 'CF', 'Ombella-M\'Poko', NULL, 0),
(558, 'CF-OPE', 'CF', 'Ouham-Pende', NULL, 0),
(559, 'CF-OUH', 'CF', 'Ouham', NULL, 0),
(560, 'CF-OUK', 'CF', 'Ouaka', NULL, 0),
(561, 'CF-SMB', 'CF', 'Sangha-Mbaere', NULL, 0),
(562, 'CF-VAK', 'CF', 'Vakaga', NULL, 0),
(563, 'CG-BO', 'CG', 'Bouenza', NULL, 0),
(564, 'CG-BR', 'CG', 'Brazzaville', NULL, 0),
(565, 'CG-CO', 'CG', 'Cuvette-Ouest', NULL, 0),
(566, 'CG-CU', 'CG', 'Cuvette', NULL, 0),
(567, 'CG-KO', 'CG', 'Kouilou', NULL, 0),
(568, 'CG-LE', 'CG', 'Lekoumou', NULL, 0),
(569, 'CG-LI', 'CG', 'Likouala', NULL, 0),
(570, 'CG-NI', 'CG', 'Niari', NULL, 0),
(571, 'CG-PL', 'CG', 'Plateaux', NULL, 0),
(572, 'CG-PO', 'CG', 'Pool', NULL, 0),
(573, 'CG-SA', 'CG', 'Sangha', NULL, 0),
(574, 'CH-AG', 'CH', 'Aargau', NULL, 0),
(575, 'CH-AI', 'CH', 'Appenzell Innerhoden', NULL, 0),
(576, 'CH-AR', 'CH', 'Appenzell Ausserrhoden', NULL, 0),
(577, 'CH-BE', 'CH', 'Bern', NULL, 0),
(578, 'CH-BL', 'CH', 'Basel-Landschaft', NULL, 0),
(579, 'CH-BS', 'CH', 'Basel-Stadt', NULL, 0),
(580, 'CH-FR', 'CH', 'Fribourg', NULL, 0),
(581, 'CH-GE', 'CH', 'Geneva', NULL, 0),
(582, 'CH-GL', 'CH', 'Glarus', NULL, 0),
(583, 'CH-GR', 'CH', 'Graubunden', NULL, 0),
(584, 'CH-JU', 'CH', 'Jura', NULL, 0),
(585, 'CH-LU', 'CH', 'Lucerne', NULL, 0),
(586, 'CH-NE', 'CH', 'NeuchO?l                                            S', NULL, 0),
(587, 'CH-NW', 'CH', 'Nidwalden', NULL, 0),
(588, 'CH-OW', 'CH', 'Obwalden', NULL, 0),
(589, 'CH-SG', 'CH', 'St. Gallen', NULL, 0),
(590, 'CH-SH', 'CH', 'Schaffhausen', NULL, 0),
(591, 'CH-SO', 'CH', 'Solothurn', NULL, 0),
(592, 'CH-SZ', 'CH', 'Schwyz', NULL, 0),
(593, 'CH-TG', 'CH', 'Thurgau', NULL, 0),
(594, 'CH-TI', 'CH', 'Ticino', NULL, 0),
(595, 'CH-UR', 'CH', 'Uri', NULL, 0),
(596, 'CH-VD', 'CH', 'Vaud', NULL, 0),
(597, 'CH-VS', 'CH', 'Valais', NULL, 0),
(598, 'CH-ZG', 'CH', 'Zug', NULL, 0),
(599, 'CH-ZH', 'CH', 'Zurich', NULL, 0),
(600, 'CI-ABE', 'CI', 'Abengourou', NULL, 0),
(601, 'CI-ABI', 'CI', 'Abidjan', NULL, 0),
(602, 'CI-ABO', 'CI', 'Aboisso', NULL, 0),
(603, 'CI-ADI', 'CI', 'Adiake', NULL, 0),
(604, 'CI-ADZ', 'CI', 'Adzope', NULL, 0),
(605, 'CI-AGB', 'CI', 'Agboville', NULL, 0),
(606, 'CI-AGN', 'CI', 'Agnibilekrou', NULL, 0),
(607, 'CI-ALE', 'CI', 'Alepe', NULL, 0),
(608, 'CI-BAN', 'CI', 'Bangolo', NULL, 0),
(609, 'CI-BDK', 'CI', 'Bondoukou', NULL, 0),
(610, 'CI-BDL', 'CI', 'Boundiali', NULL, 0),
(611, 'CI-BEO', 'CI', 'Beoumi', NULL, 0),
(612, 'CI-BFL', 'CI', 'Bouafle', NULL, 0),
(613, 'CI-BGN', 'CI', 'Bongouanou', NULL, 0),
(614, 'CI-BIA', 'CI', 'Biankouma', NULL, 0),
(615, 'CI-BKE', 'CI', 'Bouake', NULL, 0),
(616, 'CI-BNA', 'CI', 'Bouna', NULL, 0),
(617, 'CI-BOC', 'CI', 'Bocanda', NULL, 0),
(618, 'CI-DAL', 'CI', 'Daloa', NULL, 0),
(619, 'CI-DAN', 'CI', 'Danane', NULL, 0),
(620, 'CI-DAO', 'CI', 'Daoukro', NULL, 0),
(621, 'CI-DBU', 'CI', 'Dabou', NULL, 0),
(622, 'CI-DIM', 'CI', 'Dimbokro', NULL, 0),
(623, 'CI-DIV', 'CI', 'Divo', NULL, 0),
(624, 'CI-DKL', 'CI', 'Dabakala', NULL, 0),
(625, 'CI-DUE', 'CI', 'Duekoue', NULL, 0),
(626, 'CI-FER', 'CI', 'Ferkessedougou', NULL, 0),
(627, 'CI-GAG', 'CI', 'Gagnoa', NULL, 0),
(628, 'CI-GBA', 'CI', 'Grand-Bassam', NULL, 0),
(629, 'CI-GLA', 'CI', 'Grand-Lahou', NULL, 0),
(630, 'CI-GUI', 'CI', 'Guiglo', NULL, 0),
(631, 'CI-ISS', 'CI', 'Issia', NULL, 0),
(632, 'CI-JAC', 'CI', 'Jacqueville', NULL, 0),
(633, 'CI-KAT', 'CI', 'Katiola', NULL, 0),
(634, 'CI-KOR', 'CI', 'Korhogo', NULL, 0),
(635, 'CI-LAK', 'CI', 'Lakota', NULL, 0),
(636, 'CI-MAN', 'CI', 'Man', NULL, 0),
(637, 'CI-MBA', 'CI', 'Mbahiakro', NULL, 0),
(638, 'CI-MKN', 'CI', 'Mankono', NULL, 0),
(639, 'CI-ODI', 'CI', 'Odienne', NULL, 0),
(640, 'CI-OUM', 'CI', 'Oume', NULL, 0),
(641, 'CI-SAK', 'CI', 'Sakassou', NULL, 0),
(642, 'CI-SAS', 'CI', 'Sassandra', NULL, 0),
(643, 'CI-SEG', 'CI', 'Seguela', NULL, 0),
(644, 'CI-SIN', 'CI', 'Sinfra', NULL, 0),
(645, 'CI-SOU', 'CI', 'Soubre', NULL, 0),
(646, 'CI-SPE', 'CI', 'San-Pedro', NULL, 0),
(647, 'CI-TAB', 'CI', 'Tabou', NULL, 0),
(648, 'CI-TAN', 'CI', 'Tanda', NULL, 0),
(649, 'CI-TBA', 'CI', 'Touba', NULL, 0),
(650, 'CI-TIA', 'CI', 'Tiassale', NULL, 0),
(651, 'CI-TIE', 'CI', 'Tiebissou', NULL, 0),
(652, 'CI-TIN', 'CI', 'Tingrela', NULL, 0),
(653, 'CI-TLP', 'CI', 'Toulepleu', NULL, 0),
(654, 'CI-TMD', 'CI', 'Toumodi', NULL, 0),
(655, 'CI-VAV', 'CI', 'Vavoua', NULL, 0),
(656, 'CI-YAM', 'CI', 'Yamoussoukro', NULL, 0),
(657, 'CI-ZUE', 'CI', 'Zuenoula', NULL, 0),
(658, 'CK-AI', 'CK', 'Aitutaki', NULL, 0),
(659, 'CK-AT', 'CK', 'Atiu', NULL, 0),
(660, 'CK-MA', 'CK', 'Manuae', NULL, 0),
(661, 'CK-MG', 'CK', 'Mangaia', NULL, 0),
(662, 'CK-MK', 'CK', 'Manihiki', NULL, 0),
(663, 'CK-MT', 'CK', 'Mitiaro', NULL, 0),
(664, 'CK-MU', 'CK', 'Mauke', NULL, 0),
(665, 'CK-NI', 'CK', 'Nassau Island', NULL, 0),
(666, 'CK-PA', 'CK', 'Palmerston', NULL, 0),
(667, 'CK-PE', 'CK', 'Penrhyn', NULL, 0),
(668, 'CK-PU', 'CK', 'Pukapuka', NULL, 0),
(669, 'CK-RK', 'CK', 'Rakahanga', NULL, 0),
(670, 'CK-RR', 'CK', 'Rarotonga', NULL, 0),
(671, 'CK-SU', 'CK', 'Surwarrow', NULL, 0),
(672, 'CK-TA', 'CK', 'Takutea', NULL, 0),
(673, 'CL-AI', 'CL', 'Aisen del General Carlos Ibanez del Campo (XI)', NULL, 0),
(674, 'CL-AN', 'CL', 'Antofagasta (II)', NULL, 0),
(675, 'CL-AR', 'CL', 'Araucania (IX)', NULL, 0),
(676, 'CL-AT', 'CL', 'Atacama (III)', NULL, 0),
(677, 'CL-BI', 'CL', 'Bio-Bio (VIII)', NULL, 0),
(678, 'CL-CO', 'CL', 'Coquimbo (IV)', NULL, 0),
(679, 'CL-LI', 'CL', 'Libertador General Bernardo O\'Higgins (VI)', NULL, 0),
(680, 'CL-LL', 'CL', 'Los Lagos (X)', NULL, 0),
(681, 'CL-MA', 'CL', 'Magallanes (XII)', NULL, 0),
(682, 'CL-ML', 'CL', 'Maule (VII)', NULL, 0),
(683, 'CL-RM', 'CL', 'Region Metropolitana (RM)', NULL, 0),
(684, 'CL-TA', 'CL', 'Tarapaca (I)', NULL, 0),
(685, 'CL-VS', 'CL', 'Valparaiso (V)', NULL, 0),
(686, 'CM-ADA', 'CM', 'Adamawa Province (Adamaoua)', NULL, 0),
(687, 'CM-CEN', 'CM', 'Centre Province', NULL, 0),
(688, 'CM-EST', 'CM', 'East Province (Est)', NULL, 0),
(689, 'CM-EXN', 'CM', 'Extreme North Province (ExtrO?-Nord)                C', NULL, 0),
(690, 'CM-LIT', 'CM', 'Littoral Province', NULL, 0),
(691, 'CM-NOR', 'CM', 'North Province (Nord)', NULL, 0),
(692, 'CM-NOT', 'CM', 'Northwest Province (Nord-Ouest)', NULL, 0),
(693, 'CM-OUE', 'CM', 'West Province (Ouest)', NULL, 0),
(694, 'CM-SOU', 'CM', 'Southwest Province (Sud-Ouest).', NULL, 0),
(695, 'CM-SUD', 'CM', 'South Province (Sud)', NULL, 0),
(696, 'CN-11', 'CN', 'Beijing', NULL, 0),
(697, 'CN-12', 'CN', 'Tianjin', NULL, 0),
(698, 'CN-13', 'CN', 'Hebei', NULL, 0),
(699, 'CN-14', 'CN', 'Shanxi', NULL, 0),
(700, 'CN-15', 'CN', 'Nei Mongol', NULL, 0),
(701, 'CN-21', 'CN', 'Liaoning', NULL, 0),
(702, 'CN-22', 'CN', 'Jilin', NULL, 0),
(703, 'CN-23', 'CN', 'Heilongjiang', NULL, 0),
(704, 'CN-31', 'CN', 'Shanghai', NULL, 0),
(705, 'CN-32', 'CN', 'Jiangsu', NULL, 0),
(706, 'CN-33', 'CN', 'Zhejiang', NULL, 0),
(707, 'CN-34', 'CN', 'Anhui', NULL, 0),
(708, 'CN-35', 'CN', 'Fujian', NULL, 0),
(709, 'CN-36', 'CN', 'Jiangxi', NULL, 0),
(710, 'CN-37', 'CN', 'Shandong', NULL, 0),
(711, 'CN-41', 'CN', 'Henan', NULL, 0),
(712, 'CN-42', 'CN', 'Hubei', NULL, 0),
(713, 'CN-43', 'CN', 'Hunan', NULL, 0),
(714, 'CN-44', 'CN', 'Guangdong', NULL, 0),
(715, 'CN-45', 'CN', 'Guangxi', NULL, 0),
(716, 'CN-46', 'CN', 'Hainan', NULL, 0),
(717, 'CN-51', 'CN', 'Sichuan', NULL, 0),
(718, 'CN-52', 'CN', 'Guizhou', NULL, 0),
(719, 'CN-53', 'CN', 'Yunnan', NULL, 0),
(720, 'CN-54', 'CN', 'Xizang ZO?O? (Tibet)                               CH', NULL, 0),
(721, 'CN-61', 'CN', 'Shaanxi', NULL, 0),
(722, 'CN-62', 'CN', 'Gansu', NULL, 0),
(723, 'CN-63', 'CN', 'Qinghai', NULL, 0),
(724, 'CN-64', 'CN', 'Ningxia', NULL, 0),
(725, 'CN-65', 'CN', 'Xinjiang', NULL, 0),
(726, 'CN-71', 'CN', 'Taiwan', NULL, 0),
(727, 'CN-91', 'CN', 'Xianggang', NULL, 0),
(728, 'CN-92', 'CN', 'Aomen', NULL, 0),
(729, 'CN-97', 'CN', 'ChongqO?                                            C', NULL, 0),
(730, 'CN-98', 'CN', 'Gaoxiong', NULL, 0),
(731, 'CN-99', 'CN', 'Taibei', NULL, 0),
(732, 'CO-AMZ', 'CO', 'Amazonas', NULL, 0),
(733, 'CO-ANT', 'CO', 'Antioquia', NULL, 0),
(734, 'CO-ARA', 'CO', 'Arauca', NULL, 0),
(735, 'CO-ATL', 'CO', 'Atlantico', NULL, 0),
(736, 'CO-BDC', 'CO', 'Bogota D.C.', NULL, 0),
(737, 'CO-BOL', 'CO', 'Bolivar', NULL, 0),
(738, 'CO-BOY', 'CO', 'Boyaca', NULL, 0),
(739, 'CO-CAL', 'CO', 'Caldas', NULL, 0),
(740, 'CO-CAM', 'CO', 'Cundinamarca', NULL, 0),
(741, 'CO-CAQ', 'CO', 'Caqueta', NULL, 0),
(742, 'CO-CAS', 'CO', 'Casanare', NULL, 0),
(743, 'CO-CAU', 'CO', 'Cauca', NULL, 0),
(744, 'CO-CES', 'CO', 'Cesar', NULL, 0),
(745, 'CO-CHO', 'CO', 'Choco', NULL, 0),
(746, 'CO-COR', 'CO', 'Cordoba', NULL, 0),
(747, 'CO-GJR', 'CO', 'Guajira', NULL, 0),
(748, 'CO-GNA', 'CO', 'Guainia', NULL, 0),
(749, 'CO-GVR', 'CO', 'Guaviare', NULL, 0),
(750, 'CO-HUI', 'CO', 'Huila', NULL, 0),
(751, 'CO-MAG', 'CO', 'Magdalena', NULL, 0),
(752, 'CO-MET', 'CO', 'Meta', NULL, 0),
(753, 'CO-NAR', 'CO', 'Narino', NULL, 0),
(754, 'CO-NDS', 'CO', 'Norte de Santander', NULL, 0),
(755, 'CO-PUT', 'CO', 'Putumayo', NULL, 0),
(756, 'CO-QUI', 'CO', 'Quindio', NULL, 0),
(757, 'CO-RIS', 'CO', 'Risaralda', NULL, 0),
(758, 'CO-SAN', 'CO', 'Santander', NULL, 0),
(759, 'CO-SAP', 'CO', 'San Andres y Providencia', NULL, 0),
(760, 'CO-SUC', 'CO', 'Sucre', NULL, 0),
(761, 'CO-TOL', 'CO', 'Tolima', NULL, 0),
(762, 'CO-VAU', 'CO', 'Vaupes', NULL, 0),
(763, 'CO-VDC', 'CO', 'Valle del Cauca', NULL, 0),
(764, 'CO-VIC', 'CO', 'Vichada', NULL, 0),
(765, 'CR-AL', 'CR', 'Alajuela', NULL, 0),
(766, 'CR-CA', 'CR', 'Cartago', NULL, 0),
(767, 'CR-GU', 'CR', 'Guanacaste', NULL, 0),
(768, 'CR-HE', 'CR', 'Heredia', NULL, 0),
(769, 'CR-LI', 'CR', 'Limon', NULL, 0),
(770, 'CR-PU', 'CR', 'Puntarenas', NULL, 0),
(771, 'CR-SJ', 'CR', 'San Jose', NULL, 0),
(772, 'CU-CAM', 'CU', 'Camaguey', NULL, 0),
(773, 'CU-CAV', 'CU', 'Ciego de Avila', NULL, 0),
(774, 'CU-CFU', 'CU', 'Cienfuegos', NULL, 0),
(775, 'CU-CLH', 'CU', 'Ciudad de La Habana', NULL, 0),
(776, 'CU-GRA', 'CU', 'Granma', NULL, 0),
(777, 'CU-GUA', 'CU', 'Guantanamo', NULL, 0),
(778, 'CU-HOL', 'CU', 'Holguin', NULL, 0),
(779, 'CU-IJU', 'CU', 'Isla de la Juventud', NULL, 0),
(780, 'CU-LHA', 'CU', 'La Habana', NULL, 0),
(781, 'CU-LTU', 'CU', 'Las Tunas', NULL, 0),
(782, 'CU-MAT', 'CU', 'Matanzas', NULL, 0),
(783, 'CU-PRI', 'CU', 'Pinar del Rio', NULL, 0),
(784, 'CU-SCU', 'CU', 'Santiago de Cuba', NULL, 0),
(785, 'CU-SSP', 'CU', 'Sancti Spiritus', NULL, 0),
(786, 'CU-VCL', 'CU', 'Villa Clara', NULL, 0),
(787, 'CV-BR', 'CV', 'Brava', NULL, 0),
(788, 'CV-BV', 'CV', 'Boa Vista', NULL, 0),
(789, 'CV-CA', 'CV', 'Santa Catarina', NULL, 0),
(790, 'CV-CR', 'CV', 'Santa Cruz', NULL, 0),
(791, 'CV-CS', 'CV', 'Calheta de Sao Miguel', NULL, 0),
(792, 'CV-MA', 'CV', 'Maio', NULL, 0),
(793, 'CV-MO', 'CV', 'Mosteiros', NULL, 0),
(794, 'CV-PA', 'CV', 'Paul', NULL, 0),
(795, 'CV-PN', 'CV', 'Porto Novo', NULL, 0),
(796, 'CV-PR', 'CV', 'Praia', NULL, 0),
(797, 'CV-RG', 'CV', 'Ribeira Grande', NULL, 0),
(798, 'CV-SD', 'CV', 'Sao Domingos', NULL, 0),
(799, 'CV-SF', 'CV', 'Sao Filipe', NULL, 0),
(800, 'CV-SL', 'CV', 'Sal', NULL, 0),
(801, 'CV-SN', 'CV', 'Sao Nicolau', NULL, 0),
(802, 'CV-SV', 'CV', 'Sao Vicente', NULL, 0),
(803, 'CV-TA', 'CV', 'Tarrafal', NULL, 0),
(804, 'CY-A', 'CY', 'Larnaca', NULL, 0),
(805, 'CY-F', 'CY', 'Famagusta', NULL, 0),
(806, 'CY-I', 'CY', 'Limassol', NULL, 0),
(807, 'CY-K', 'CY', 'Kyrenia', NULL, 0),
(808, 'CY-N', 'CY', 'Nicosia', NULL, 0),
(809, 'CY-P', 'CY', 'Paphos', NULL, 0),
(810, 'CZ-JC', 'CZ', 'South Bohemian Region (Jihocesky kraj)', NULL, 0),
(811, 'CZ-JM', 'CZ', 'South Moravian Region (Jihomoravsky kraj)', NULL, 0),
(812, 'CZ-KA', 'CZ', 'Carlsbad Region  (Karlovarsky kraj)', NULL, 0),
(813, 'CZ-KR', 'CZ', 'Hradec Kralove Region (Kralovehradecky kraj)', NULL, 0),
(814, 'CZ-LI', 'CZ', 'Liberec Region (Liberecky kraj)', NULL, 0),
(815, 'CZ-MO', 'CZ', 'Moravian-Silesian Region (Moravskoslezsky kraj)', NULL, 0),
(816, 'CZ-OL', 'CZ', 'Olomouc Region (Olomoucky kraj)', NULL, 0),
(817, 'CZ-PA', 'CZ', 'Pardubice Region (Pardubicky kraj)', NULL, 0),
(818, 'CZ-PL', 'CZ', 'Plzen( Region Plzensky kraj)', NULL, 0),
(819, 'CZ-PR', 'CZ', 'Prague - the Capital (Praha - hlavni mesto)', NULL, 0),
(820, 'CZ-ST', 'CZ', 'Central Bohemian Region (Stredocesky kraj)', NULL, 0),
(821, 'CZ-US', 'CZ', 'Usti nad Labem Region (Ustecky kraj)', NULL, 0),
(822, 'CZ-VY', 'CZ', 'Vysoc(ina Region (kraj Vysoc(ina)', NULL, 0),
(823, 'CZ-ZL', 'CZ', 'Zlin Region (Zlinsky kraj)', NULL, 0),
(824, 'DE-BE', 'DE', 'Berlin', NULL, 0),
(825, 'DE-BR', 'DE', 'Brandenburg', NULL, 0),
(826, 'DE-BW', 'DE', 'Baden-Wurttemberg', NULL, 0),
(827, 'DE-BY', 'DE', 'Bayern', NULL, 0),
(828, 'DE-HB', 'DE', 'Bremen', NULL, 0),
(829, 'DE-HE', 'DE', 'Hessen', NULL, 0),
(830, 'DE-HH', 'DE', 'Hamburg', NULL, 0),
(831, 'DE-MV', 'DE', 'Mecklenburg-Vorpommern', NULL, 0),
(832, 'DE-NI', 'DE', 'Niedersachsen', NULL, 0),
(833, 'DE-NW', 'DE', 'Nordrhein-Westfalen', NULL, 0),
(834, 'DE-RP', 'DE', 'Rheinland-Pfalz', NULL, 0),
(835, 'DE-SH', 'DE', 'Schleswig-Holstein', NULL, 0),
(836, 'DE-SL', 'DE', 'Saarland', NULL, 0),
(837, 'DE-SN', 'DE', 'Sachsen', NULL, 0),
(838, 'DE-ST', 'DE', 'Sachsen-Anhalt', NULL, 0),
(839, 'DE-TH', 'DE', 'Thuringen', NULL, 0),
(840, 'DJ-J', 'DJ', 'Djibouti', NULL, 0),
(841, 'DJ-K', 'DJ', 'Dikhil', NULL, 0),
(842, 'DJ-O', 'DJ', 'Obock', NULL, 0),
(843, 'DJ-S', 'DJ', '\'Ali Sabih', NULL, 0),
(844, 'DJ-T', 'DJ', 'Tadjoura', NULL, 0),
(845, 'DK-AR', 'DK', 'Arhus', NULL, 0),
(846, 'DK-BH', 'DK', 'Bornholm', NULL, 0),
(847, 'DK-CC', 'DK', 'Copenhagen (municipality)', NULL, 0),
(848, 'DK-CO', 'DK', 'Copenhagen', NULL, 0),
(849, 'DK-FC', 'DK', 'Frederiksberg (municipality)', NULL, 0),
(850, 'DK-FO', 'DK', 'Faroe Islands', NULL, 0),
(851, 'DK-FR', 'DK', 'Frederiksborg', NULL, 0),
(852, 'DK-FU', 'DK', 'Funen', NULL, 0),
(853, 'DK-GL', 'DK', 'Greenland', NULL, 0),
(854, 'DK-NJ', 'DK', 'North Jutland', NULL, 0),
(855, 'DK-RB', 'DK', 'Ribe', NULL, 0),
(856, 'DK-RK', 'DK', 'Ringkjobing', NULL, 0),
(857, 'DK-RO', 'DK', 'Roskilde', NULL, 0),
(858, 'DK-SJ', 'DK', 'South Jutland', NULL, 0),
(859, 'DK-ST', 'DK', 'Storstrom', NULL, 0),
(860, 'DK-VB', 'DK', 'Viborg', NULL, 0),
(861, 'DK-VK', 'DK', 'Vejle', NULL, 0),
(862, 'DK-WZ', 'DK', 'West Zealand', NULL, 0),
(863, 'DM-AND', 'DM', 'Saint Andrew Parish', NULL, 0),
(864, 'DM-DAV', 'DM', 'Saint David Parish', NULL, 0),
(865, 'DM-GEO', 'DM', 'Saint George Parish', NULL, 0),
(866, 'DM-JOH', 'DM', 'Saint John Parish', NULL, 0),
(867, 'DM-JOS', 'DM', 'Saint Joseph Parish', NULL, 0),
(868, 'DM-LUK', 'DM', 'Saint Luke Parish', NULL, 0),
(869, 'DM-MAR', 'DM', 'Saint Mark Parish', NULL, 0),
(870, 'DM-PAT', 'DM', 'Saint Patrick Parish', NULL, 0),
(871, 'DM-PAU', 'DM', 'Saint Paul Parish', NULL, 0),
(872, 'DM-PET', 'DM', 'Saint Peter Parish', NULL, 0),
(873, 'DO-AL', 'DO', 'La Altagracia', NULL, 0),
(874, 'DO-AZ', 'DO', 'Azua', NULL, 0),
(875, 'DO-BC', 'DO', 'Baoruco', NULL, 0),
(876, 'DO-BH', 'DO', 'Barahona', NULL, 0),
(877, 'DO-DJ', 'DO', 'Dajabon', NULL, 0),
(878, 'DO-DN', 'DO', 'Distrito Nacional', NULL, 0),
(879, 'DO-DU', 'DO', 'Duarte', NULL, 0),
(880, 'DO-EL', 'DO', 'Elias Pina', NULL, 0),
(881, 'DO-ET', 'DO', 'Espaillat', NULL, 0),
(882, 'DO-HM', 'DO', 'Hato Mayor', NULL, 0),
(883, 'DO-IN', 'DO', 'Independencia', NULL, 0),
(884, 'DO-JO', 'DO', 'San Jose de Ocoa', NULL, 0),
(885, 'DO-MC', 'DO', 'Monte Cristi', NULL, 0),
(886, 'DO-MN', 'DO', 'Monsenor Nouel', NULL, 0),
(887, 'DO-MP', 'DO', 'Monte Plata', NULL, 0),
(888, 'DO-MT', 'DO', 'Maria Trinidad Sanchez', NULL, 0),
(889, 'DO-PD', 'DO', 'Pedernales', NULL, 0),
(890, 'DO-PM', 'DO', 'San Pedro de Macoris', NULL, 0),
(891, 'DO-PP', 'DO', 'Puerto Plata', NULL, 0),
(892, 'DO-PR', 'DO', 'Peravia (Bani)', NULL, 0),
(893, 'DO-RO', 'DO', 'La Romana', NULL, 0),
(894, 'DO-SA', 'DO', 'Santiago', NULL, 0),
(895, 'DO-SC', 'DO', 'San Cristobal', NULL, 0),
(896, 'DO-SD', 'DO', 'Santo Domingo', NULL, 0),
(897, 'DO-SH', 'DO', 'Sanchez Ramirez', NULL, 0),
(898, 'DO-SJ', 'DO', 'San Juan', NULL, 0),
(899, 'DO-SL', 'DO', 'Salcedo', NULL, 0),
(900, 'DO-SM', 'DO', 'Samana', NULL, 0),
(901, 'DO-ST', 'DO', 'Santiago Rodriguez', NULL, 0),
(902, 'DO-SY', 'DO', 'El Seybo', NULL, 0),
(903, 'DO-VA', 'DO', 'Valverde', NULL, 0),
(904, 'DO-VE', 'DO', 'La Vega', NULL, 0),
(905, 'DZ-ADE', 'DZ', 'Ain Defla', NULL, 0),
(906, 'DZ-ADR', 'DZ', 'Adrar', NULL, 0),
(907, 'DZ-ALG', 'DZ', 'Alger', NULL, 0),
(908, 'DZ-ANN', 'DZ', 'Annaba', NULL, 0),
(909, 'DZ-ATE', 'DZ', 'Ain Temouchent', NULL, 0),
(910, 'DZ-BAT', 'DZ', 'Batna', NULL, 0),
(911, 'DZ-BBA', 'DZ', 'Bordj Bou Arreridj', NULL, 0),
(912, 'DZ-BEC', 'DZ', 'Bechar', NULL, 0),
(913, 'DZ-BEJ', 'DZ', 'Bejaia', NULL, 0),
(914, 'DZ-BIS', 'DZ', 'Biskra', NULL, 0),
(915, 'DZ-BLI', 'DZ', 'Blida', NULL, 0),
(916, 'DZ-BMD', 'DZ', 'Boumerdes', NULL, 0),
(917, 'DZ-BOA', 'DZ', 'Bouira', NULL, 0),
(918, 'DZ-CHL', 'DZ', 'Chlef', NULL, 0),
(919, 'DZ-CON', 'DZ', 'Constantine', NULL, 0),
(920, 'DZ-DJE', 'DZ', 'Djelfa', NULL, 0),
(921, 'DZ-EBA', 'DZ', 'El Bayadh', NULL, 0),
(922, 'DZ-EOU', 'DZ', 'El Oued', NULL, 0),
(923, 'DZ-ETA', 'DZ', 'El Tarf', NULL, 0),
(924, 'DZ-GHA', 'DZ', 'Ghardaia', NULL, 0),
(925, 'DZ-GUE', 'DZ', 'Guelma', NULL, 0),
(926, 'DZ-ILL', 'DZ', 'Illizi', NULL, 0),
(927, 'DZ-JIJ', 'DZ', 'Jijel', NULL, 0),
(928, 'DZ-KHE', 'DZ', 'Khenchela', NULL, 0),
(929, 'DZ-LAG', 'DZ', 'Laghouat', NULL, 0),
(930, 'DZ-MED', 'DZ', 'Medea', NULL, 0),
(931, 'DZ-MIL', 'DZ', 'Mila', NULL, 0),
(932, 'DZ-MOS', 'DZ', 'Mostaganem', NULL, 0),
(933, 'DZ-MSI', 'DZ', 'M\'Sila', NULL, 0),
(934, 'DZ-MUA', 'DZ', 'Muaskar', NULL, 0),
(935, 'DZ-NAA', 'DZ', 'Naama', NULL, 0),
(936, 'DZ-OEB', 'DZ', 'Oum el-Bouaghi', NULL, 0),
(937, 'DZ-ORA', 'DZ', 'Oran', NULL, 0),
(938, 'DZ-OUA', 'DZ', 'Ouargla', NULL, 0),
(939, 'DZ-REL', 'DZ', 'Relizane', NULL, 0),
(940, 'DZ-SAH', 'DZ', 'Souk Ahras', NULL, 0),
(941, 'DZ-SAI', 'DZ', 'Saida', NULL, 0),
(942, 'DZ-SBA', 'DZ', 'Sidi Bel Abbes', NULL, 0),
(943, 'DZ-SET', 'DZ', 'Setif', NULL, 0),
(944, 'DZ-SKI', 'DZ', 'Skikda', NULL, 0),
(945, 'DZ-TAM', 'DZ', 'Tamanghasset', NULL, 0),
(946, 'DZ-TEB', 'DZ', 'Tebessa', NULL, 0),
(947, 'DZ-TIA', 'DZ', 'Tiaret', NULL, 0),
(948, 'DZ-TIN', 'DZ', 'Tindouf', NULL, 0),
(949, 'DZ-TIP', 'DZ', 'Tipaza', NULL, 0),
(950, 'DZ-TIS', 'DZ', 'Tissemsilt', NULL, 0),
(951, 'DZ-TLE', 'DZ', 'Tlemcen', NULL, 0),
(952, 'DZ-TOU', 'DZ', 'Tizi Ouzou', NULL, 0),
(953, 'EC-A', 'EC', 'Azuay', NULL, 0),
(954, 'EC-B', 'EC', 'Bolivar', NULL, 0),
(955, 'EC-C', 'EC', 'Carchi', NULL, 0),
(956, 'EC-D', 'EC', 'Orellana', NULL, 0),
(957, 'EC-E', 'EC', 'Esmeraldas', NULL, 0),
(958, 'EC-F', 'EC', 'Canar', NULL, 0),
(959, 'EC-G', 'EC', 'Guayas', NULL, 0),
(960, 'EC-H', 'EC', 'Chimborazo', NULL, 0),
(961, 'EC-I', 'EC', 'Imbabura', NULL, 0),
(962, 'EC-L', 'EC', 'Loja', NULL, 0),
(963, 'EC-M', 'EC', 'Manabi', NULL, 0),
(964, 'EC-N', 'EC', 'Napo', NULL, 0),
(965, 'EC-O', 'EC', 'El Oro', NULL, 0),
(966, 'EC-P', 'EC', 'Pichincha', NULL, 0),
(967, 'EC-R', 'EC', 'Los Rios', NULL, 0),
(968, 'EC-S', 'EC', 'Morona-Santiago', NULL, 0),
(969, 'EC-T', 'EC', 'Tungurahua', NULL, 0),
(970, 'EC-U', 'EC', 'Sucumbios', NULL, 0),
(971, 'EC-W', 'EC', 'Galapagos', NULL, 0),
(972, 'EC-X', 'EC', 'Cotopaxi', NULL, 0),
(973, 'EC-Y', 'EC', 'Pastaza', NULL, 0),
(974, 'EC-Z', 'EC', 'Zamora-Chinchipe', NULL, 0),
(975, 'EE-37', 'EE', 'Harju County', NULL, 0),
(976, 'EE-39', 'EE', 'Hiiu County', NULL, 0),
(977, 'EE-44', 'EE', 'Ida-Viru County', NULL, 0),
(978, 'EE-49', 'EE', 'JOAa County', NULL, 0),
(979, 'EE-51', 'EE', 'JArva County', NULL, 0),
(980, 'EE-57', 'EE', 'LAAne County', NULL, 0),
(981, 'EE-59', 'EE', 'LAAne-Viru County', NULL, 0),
(982, 'EE-65', 'EE', 'POA County', NULL, 0),
(983, 'EE-67', 'EE', 'PArnu County', NULL, 0),
(984, 'EE-70', 'EE', 'Rapla County', NULL, 0),
(985, 'EE-74', 'EE', 'Saare County', NULL, 0),
(986, 'EE-78', 'EE', 'Tartu County', NULL, 0),
(987, 'EE-82', 'EE', 'Valga County', NULL, 0),
(988, 'EE-84', 'EE', 'Viljandi County', NULL, 0),
(989, 'EE-86', 'EE', 'VOACounty', NULL, 0),
(990, 'EG-ASW', 'EG', 'Aswan', NULL, 0),
(991, 'EG-ASY', 'EG', 'Asyut', NULL, 0),
(992, 'EG-BAM', 'EG', 'Al Bahr al Ahmar', NULL, 0),
(993, 'EG-BHY', 'EG', 'Al Buhayrah', NULL, 0),
(994, 'EG-BSD', 'EG', 'Bur Sa\'id', NULL, 0),
(995, 'EG-BSW', 'EG', 'Bani Suwayf', NULL, 0),
(996, 'EG-DHY', 'EG', 'Ad Daqahliyah', NULL, 0),
(997, 'EG-DMY', 'EG', 'Dumyat', NULL, 0),
(998, 'EG-FYM', 'EG', 'Al Fayyum', NULL, 0),
(999, 'EG-GBY', 'EG', 'Al Gharbiyah', NULL, 0),
(1000, 'EG-IDR', 'EG', 'Al Iskandariyah', NULL, 0),
(1001, 'EG-IML', 'EG', 'Al Isma\'iliyah', NULL, 0),
(1002, 'EG-JNS', 'EG', 'Janub Sina\'', NULL, 0),
(1003, 'EG-JZH', 'EG', 'Al Jizah', NULL, 0),
(1004, 'EG-KSH', 'EG', 'Kafr ash Shaykh', NULL, 0),
(1005, 'EG-MAT', 'EG', 'Matruh', NULL, 0),
(1006, 'EG-MFY', 'EG', 'Al Minufiyah', NULL, 0),
(1007, 'EG-MNY', 'EG', 'Al Minya', NULL, 0),
(1008, 'EG-QHR', 'EG', 'Al Qahirah', NULL, 0),
(1009, 'EG-QIN', 'EG', 'Qina', NULL, 0),
(1010, 'EG-QLY', 'EG', 'Al Qalyubiyah', NULL, 0),
(1011, 'EG-SHQ', 'EG', 'Ash Sharqiyah', NULL, 0),
(1012, 'EG-SHS', 'EG', 'Shamal Sina\'', NULL, 0),
(1013, 'EG-SUH', 'EG', 'Suhaj', NULL, 0),
(1014, 'EG-SWY', 'EG', 'As Suways', NULL, 0),
(1015, 'EG-WJD', 'EG', 'Al Wadi al Jadid', NULL, 0),
(1016, 'ER-BR', 'ER', 'Gash-Barka (Barentu)', NULL, 0),
(1017, 'ER-DE', 'ER', 'Southern (Debub)', NULL, 0),
(1018, 'ER-DK', 'ER', 'Southern Red Sea (Debub-Keih-Bahri)', NULL, 0),
(1019, 'ER-KE', 'ER', 'Anseba (Keren)', NULL, 0),
(1020, 'ER-MA', 'ER', 'Central (Maekel)', NULL, 0),
(1021, 'ER-SK', 'ER', 'Northern Red Sea (Semien-Keih-Bahri)', NULL, 0),
(1022, 'ES-AB', 'ES', 'Albacete', NULL, 0),
(1023, 'ES-AC', 'ES', 'Alicante', NULL, 0),
(1024, 'ES-AL', 'ES', 'Alava', NULL, 0),
(1025, 'ES-AM', 'ES', 'Almeria', NULL, 0),
(1026, 'ES-AS', 'ES', 'Asturias', NULL, 0),
(1027, 'ES-AV', 'ES', 'Avila', NULL, 0),
(1028, 'ES-BA', 'ES', 'Barcelona', NULL, 0),
(1029, 'ES-BJ', 'ES', 'Badajoz', NULL, 0),
(1030, 'ES-BU', 'ES', 'Burgos', NULL, 0),
(1031, 'ES-CA', 'ES', 'A Coruna', NULL, 0),
(1032, 'ES-CC', 'ES', 'Caceres', NULL, 0),
(1033, 'ES-CD', 'ES', 'Cordoba', NULL, 0),
(1034, 'ES-CL', 'ES', 'Castellon', NULL, 0),
(1035, 'ES-CR', 'ES', 'Ciudad Real', NULL, 0),
(1036, 'ES-CT', 'ES', 'Cantabria', NULL, 0),
(1037, 'ES-CU', 'ES', 'Cuenca', NULL, 0),
(1038, 'ES-CZ', 'ES', 'Cadiz', NULL, 0),
(1039, 'ES-GD', 'ES', 'Granada', NULL, 0),
(1040, 'ES-GI', 'ES', 'Girona', NULL, 0),
(1041, 'ES-GJ', 'ES', 'Guadalajara', NULL, 0),
(1042, 'ES-GP', 'ES', 'Guipuzcoa', NULL, 0),
(1043, 'ES-HL', 'ES', 'Huelva', NULL, 0),
(1044, 'ES-HS', 'ES', 'Huesca', NULL, 0),
(1045, 'ES-IB', 'ES', 'Illes Balears', NULL, 0),
(1046, 'ES-JN', 'ES', 'Jaen', NULL, 0),
(1047, 'ES-LE', 'ES', 'Leon', NULL, 0),
(1048, 'ES-LG', 'ES', 'Lugo', NULL, 0),
(1049, 'ES-LL', 'ES', 'Lleida', NULL, 0),
(1050, 'ES-MD', 'ES', 'Madrid', NULL, 0),
(1051, 'ES-ML', 'ES', 'Malaga', NULL, 0),
(1052, 'ES-MU', 'ES', 'Mucria', NULL, 0),
(1053, 'ES-NV', 'ES', 'Navarra', NULL, 0),
(1054, 'ES-OU', 'ES', 'Ourense', NULL, 0),
(1055, 'ES-PL', 'ES', 'Palencia', NULL, 0),
(1056, 'ES-PM', 'ES', 'Las Palmas', NULL, 0),
(1057, 'ES-PO', 'ES', 'Pontevedra', NULL, 0),
(1058, 'ES-RJ', 'ES', 'La Rioja', NULL, 0),
(1059, 'ES-SC', 'ES', 'Santa Cruz de Tererife', NULL, 0),
(1060, 'ES-SG', 'ES', 'Segovia', NULL, 0),
(1061, 'ES-SL', 'ES', 'Salamanca', NULL, 0),
(1062, 'ES-SO', 'ES', 'Soria', NULL, 0),
(1063, 'ES-SV', 'ES', 'Sevilla', NULL, 0),
(1064, 'ES-TA', 'ES', 'Tarragona', NULL, 0),
(1065, 'ES-TE', 'ES', 'Teruel', NULL, 0),
(1066, 'ES-TO', 'ES', 'Toledo', NULL, 0),
(1067, 'ES-VC', 'ES', 'Valencia', NULL, 0),
(1068, 'ES-VD', 'ES', 'Valladolid', NULL, 0),
(1069, 'ES-VZ', 'ES', 'Vizcaya', NULL, 0),
(1070, 'ES-ZM', 'ES', 'Zamora', NULL, 0),
(1071, 'ES-ZR', 'ES', 'Zaragoza', NULL, 0),
(1072, 'ET-AA', 'ET', 'Addis Ababa', NULL, 0),
(1073, 'ET-AF', 'ET', 'Afar', NULL, 0),
(1074, 'ET-AH', 'ET', 'Amhara', NULL, 0),
(1075, 'ET-BG', 'ET', 'Benishangul-Gumaz', NULL, 0),
(1076, 'ET-DD', 'ET', 'Dire Dawa', NULL, 0),
(1077, 'ET-GB', 'ET', 'Gambela', NULL, 0),
(1078, 'ET-HR', 'ET', 'Hariai', NULL, 0),
(1079, 'ET-OR', 'ET', 'Oromia', NULL, 0),
(1080, 'ET-SM', 'ET', 'Somali', NULL, 0),
(1081, 'ET-SN', 'ET', 'Southern Nations - Nationalities and Peoples Region', NULL, 0),
(1082, 'ET-TG', 'ET', 'Tigray', NULL, 0),
(1083, 'FI-AH', 'FI', 'Ahvenanmaan laani', NULL, 0),
(1084, 'FI-ES', 'FI', 'Etela-Suomen laani', NULL, 0),
(1085, 'FI-IS', 'FI', 'Ita-Suomen laani', NULL, 0),
(1086, 'FI-LL', 'FI', 'Lapin laani', NULL, 0),
(1087, 'FI-LS', 'FI', 'Lansi-Suomen laani', NULL, 0),
(1088, 'FI-OU', 'FI', 'Oulun laani', NULL, 0),
(1089, 'FJ-C', 'FJ', 'Central Division', NULL, 0),
(1090, 'FJ-E', 'FJ', 'Eastern Division', NULL, 0),
(1091, 'FJ-N', 'FJ', 'Northern Division', NULL, 0),
(1092, 'FJ-R', 'FJ', 'Rotuma', NULL, 0),
(1093, 'FJ-W', 'FJ', 'Western Division', NULL, 0),
(1094, 'FM-C', 'FM', 'Chuuk', NULL, 0),
(1095, 'FM-K', 'FM', 'Kosrae', NULL, 0),
(1096, 'FM-P', 'FM', 'Pohnpei', NULL, 0),
(1097, 'FM-Y', 'FM', 'Yap', NULL, 0),
(1098, 'FR-V01', 'FR', 'Ain', NULL, 0),
(1099, 'FR-S02', 'FR', 'Aisne', NULL, 0),
(1100, 'FR-C03', 'FR', 'Allier', NULL, 0),
(1101, 'FR-U04', 'FR', 'Alpes-de-Haute-Provence', NULL, 0),
(1102, 'FR-U05', 'FR', 'Hautes-Alpes', NULL, 0),
(1103, 'FR-U06', 'FR', 'Alpes-Maritimes', NULL, 0),
(1104, 'FR-V07', 'FR', 'Ardèche', NULL, 0),
(1105, 'FR-G08', 'FR', 'Ardennes', NULL, 0),
(1106, 'FR-N09', 'FR', 'Ariège', NULL, 0),
(1107, 'FR-G10', 'FR', 'Aube', NULL, 0),
(1108, 'FR-K11', 'FR', 'Aude', NULL, 0),
(1109, 'FR-N12', 'FR', 'Aveyron', NULL, 0),
(1110, 'FR-U13', 'FR', 'Bouches-du-Rhône', NULL, 0),
(1111, 'FR-P14', 'FR', 'Calvados', NULL, 0),
(1112, 'FR-C15', 'FR', 'Cantal', NULL, 0),
(1113, 'FR-T16', 'FR', 'Charente', NULL, 0),
(1114, 'FR-T17', 'FR', 'Charente-Maritime', NULL, 0),
(1115, 'FR-F18', 'FR', 'Cher', NULL, 0),
(1116, 'FR-L19', 'FR', 'Corrèze', NULL, 0),
(1117, 'FR-H2A', 'FR', 'Corse-du-Sud', NULL, 0),
(1118, 'FR-H2B', 'FR', 'Haute-Corse', NULL, 0),
(1119, 'FR-D21', 'FR', 'Côte-d\'Or', NULL, 0),
(1120, 'FR-E22', 'FR', 'Côtes-d\'Armor', NULL, 0),
(1121, 'FR-L23', 'FR', 'Creuse', NULL, 0),
(1122, 'FR-B24', 'FR', 'Dordogne', NULL, 0),
(1123, 'FR-I25', 'FR', 'Doubs', NULL, 0),
(1124, 'FR-V26', 'FR', 'Drôme', NULL, 0),
(1125, 'FR-Q27', 'FR', 'Eure', NULL, 0),
(1126, 'FR-F28', 'FR', 'Eure-et-Loir', NULL, 0),
(1127, 'FR-E29', 'FR', 'Finistère', NULL, 0),
(1128, 'FR-K30', 'FR', 'Gard', NULL, 0),
(1129, 'FR-N31', 'FR', 'Haute-Garonne', NULL, 0),
(1130, 'FR-N32', 'FR', 'Gers', NULL, 0),
(1131, 'FR-B33', 'FR', 'Gironde', NULL, 0),
(1132, 'FR-K34', 'FR', 'Hérault', NULL, 0),
(1133, 'FR-E35', 'FR', 'Ille-et-Vilaine', NULL, 0),
(1134, 'FR-F36', 'FR', 'Indre', NULL, 0),
(1135, 'FR-F37', 'FR', 'Indre-et-Loire', NULL, 0),
(1136, 'FR-V38', 'FR', 'Isère', NULL, 0),
(1137, 'FR-I39', 'FR', 'Jura', NULL, 0),
(1138, 'FR-B40', 'FR', 'Landes', NULL, 0),
(1139, 'FR-F41', 'FR', 'Loir-et-Cher', NULL, 0),
(1140, 'FR-V42', 'FR', 'Loire', NULL, 0),
(1141, 'FR-C43', 'FR', 'Haute-Loire', NULL, 0),
(1142, 'FR-R44', 'FR', 'Loire-Atlantique', NULL, 0),
(1143, 'FR-F45', 'FR', 'Loiret', NULL, 0),
(1144, 'FR-N46', 'FR', 'Lot', NULL, 0),
(1145, 'FR-B47', 'FR', 'Lot-et-Garonne', NULL, 0),
(1146, 'FR-K48', 'FR', 'Lozère', NULL, 0),
(1147, 'FR-R49', 'FR', 'Maine-et-Loire', NULL, 0);
INSERT INTO `er_state` (`state_id`, `state`, `country`, `title`, `status`, `tag`) VALUES
(1148, 'FR-P50', 'FR', 'Manche', NULL, 0),
(1149, 'FR-G51', 'FR', 'Marne', NULL, 0),
(1150, 'FR-G52', 'FR', 'Haute-Marne', NULL, 0),
(1151, 'FR-R53', 'FR', 'Mayenne', NULL, 0),
(1152, 'FR-M54', 'FR', 'Meurthe-et-Moselle', NULL, 0),
(1153, 'FR-M55', 'FR', 'Meuse', NULL, 0),
(1154, 'FR-E56', 'FR', 'Morbihan', NULL, 0),
(1155, 'FR-M57', 'FR', 'Moselle', NULL, 0),
(1156, 'FR-D58', 'FR', 'Nièvre', NULL, 0),
(1157, 'FR-O59', 'FR', 'Nord', NULL, 0),
(1158, 'FR-S60', 'FR', 'Oise', NULL, 0),
(1159, 'FR-P61', 'FR', 'Orne', NULL, 0),
(1160, 'FR-O62', 'FR', 'Pas-de-Calais', NULL, 0),
(1161, 'FR-C63', 'FR', 'Puy-de-Dôme', NULL, 0),
(1162, 'FR-B64', 'FR', 'Pyrénées-Atlantiques', NULL, 0),
(1163, 'FR-N65', 'FR', 'Hautes-Pyrénées', NULL, 0),
(1164, 'FR-K66', 'FR', 'Pyrénées-Orientales', NULL, 0),
(1165, 'FR-A67', 'FR', 'Bas-Rhin', NULL, 0),
(1166, 'FR-A68', 'FR', 'Haut-Rhin', NULL, 0),
(1167, 'FR-V69', 'FR', 'Rhône', NULL, 0),
(1168, 'FR-I70', 'FR', 'Haute-Saône', NULL, 0),
(1169, 'FR-D71', 'FR', 'Saône-et-Loire', NULL, 0),
(1170, 'FR-R72', 'FR', 'Sarthe', NULL, 0),
(1171, 'FR-V73', 'FR', 'Savoie', NULL, 0),
(1172, 'FR-V74', 'FR', 'Haute-Savoie', NULL, 0),
(1173, 'FR-J75', 'FR', 'Paris', NULL, 0),
(1174, 'FR-Q76', 'FR', 'Seine-Maritime', NULL, 0),
(1175, 'FR-J77', 'FR', 'Seine-et-Marne', NULL, 0),
(1176, 'FR-J78', 'FR', 'Yvelines', NULL, 0),
(1177, 'FR-T79', 'FR', 'Deux-Sèvres', NULL, 0),
(1178, 'FR-S80', 'FR', 'Somme', NULL, 0),
(1179, 'FR-N81', 'FR', 'Tarn', NULL, 0),
(1180, 'FR-N82', 'FR', 'Tarn-et-Garonne', NULL, 0),
(1181, 'FR-U83', 'FR', 'Var', NULL, 0),
(1182, 'FR-U84', 'FR', 'Vaucluse', NULL, 0),
(1183, 'FR-R85', 'FR', 'Vendée', NULL, 0),
(1184, 'FR-T86', 'FR', 'Vienne', NULL, 0),
(1185, 'FR-L87', 'FR', 'Haute-Vienne', NULL, 0),
(1186, 'FR-M88', 'FR', 'Vosges', NULL, 0),
(1187, 'FR-D89', 'FR', 'Yonne', NULL, 0),
(1188, 'FR-I90', 'FR', 'Territoire de Belfort', NULL, 0),
(1189, 'FR-J91', 'FR', 'Essonne', NULL, 0),
(1190, 'FR-J92', 'FR', 'Hauts-de-Seine', NULL, 0),
(1191, 'FR-J93', 'FR', 'Seine-Saint-Denis', NULL, 0),
(1192, 'FR-J94', 'FR', 'Val-de-Marne', NULL, 0),
(1193, 'FR-J95', 'FR', 'Val-d\'Oise', NULL, 0),
(1194, 'GA-ES', 'GA', 'Estuaire', NULL, 0),
(1195, 'GA-HO', 'GA', 'Haut-Ogooue', NULL, 0),
(1196, 'GA-MO', 'GA', 'Moyen-Ogooue', NULL, 0),
(1197, 'GA-NG', 'GA', 'Ngounie', NULL, 0),
(1198, 'GA-NY', 'GA', 'Nyanga', NULL, 0),
(1199, 'GA-OI', 'GA', 'Ogooue-Ivindo', NULL, 0),
(1200, 'GA-OL', 'GA', 'Ogooue-Lolo', NULL, 0),
(1201, 'GA-OM', 'GA', 'Ogooue-Maritime', NULL, 0),
(1202, 'GA-WN', 'GA', 'Woleu-Ntem', NULL, 0),
(1203, 'GB-ABD', 'GB', 'Aberdeenshire', NULL, 0),
(1204, 'GB-ABE', 'GB', 'Aberdeen', NULL, 0),
(1205, 'GB-AGB', 'GB', 'Argyll and Bute', NULL, 0),
(1206, 'GB-AGY', 'GB', 'Anglesey', NULL, 0),
(1207, 'GB-ANS', 'GB', 'Angus', NULL, 0),
(1208, 'GB-ANT', 'GB', 'County Antrim', NULL, 0),
(1209, 'GB-ARD', 'GB', 'Ards', NULL, 0),
(1210, 'GB-ARM', 'GB', 'County Armagh', NULL, 0),
(1211, 'GB-AVN', 'GB', 'Avon', NULL, 0),
(1212, 'GB-AYR', 'GB', 'Ayrshire', NULL, 0),
(1213, 'GB-BAS', 'GB', 'Bath and North East Somerset', NULL, 0),
(1214, 'GB-BBD', 'GB', 'Blackburn with Darwen', NULL, 0),
(1215, 'GB-BDF', 'GB', 'Bedfordshire', NULL, 0),
(1216, 'GB-BRK', 'GB', 'Berkshire', NULL, 0),
(1217, 'GB-BDG', 'GB', 'Barking and Dagenham', NULL, 0),
(1218, 'GB-BEN', 'GB', 'Brent', NULL, 0),
(1219, 'GB-BEX', 'GB', 'Bexley', NULL, 0),
(1220, 'GB-BFS', 'GB', 'Belfast', NULL, 0),
(1221, 'GB-BGE', 'GB', 'Bridgend', NULL, 0),
(1222, 'GB-BGW', 'GB', 'Blaenau Gwent', NULL, 0),
(1223, 'GB-BIR', 'GB', 'Birmingham', NULL, 0),
(1224, 'GB-BKM', 'GB', 'Buckinghamshire', NULL, 0),
(1225, 'GB-BLA', 'GB', 'Ballymena', NULL, 0),
(1226, 'GB-BLY', 'GB', 'Ballymoney', NULL, 0),
(1227, 'GB-BMH', 'GB', 'Bournemouth', NULL, 0),
(1228, 'GB-BNB', 'GB', 'Banbridge', NULL, 0),
(1229, 'GB-BNE', 'GB', 'Barnet', NULL, 0),
(1230, 'GB-BNH', 'GB', 'Brighton and Hove', NULL, 0),
(1231, 'GB-BNS', 'GB', 'Barnsley', NULL, 0),
(1232, 'GB-BOL', 'GB', 'Bolton', NULL, 0),
(1233, 'GB-BPL', 'GB', 'Blackpool', NULL, 0),
(1234, 'GB-BRC', 'GB', 'Bracknell Forest', NULL, 0),
(1235, 'GB-BRD', 'GB', 'Bradford', NULL, 0),
(1236, 'GB-BRY', 'GB', 'Bromley', NULL, 0),
(1237, 'GB-BST', 'GB', 'City of Bristol', NULL, 0),
(1238, 'GB-BUR', 'GB', 'Bury', NULL, 0),
(1239, 'GB-CAI', 'GB', 'Caithness', NULL, 0),
(1240, 'GB-CAM', 'GB', 'Cambridgeshire', NULL, 0),
(1241, 'GB-CAY', 'GB', 'Caerphilly', NULL, 0),
(1242, 'GB-CGN', 'GB', 'Ceredigion', NULL, 0),
(1243, 'GB-CGV', 'GB', 'Craigavon', NULL, 0),
(1244, 'GB-CHS', 'GB', 'Cheshire', NULL, 0),
(1245, 'GB-CKF', 'GB', 'Carrickfergus', NULL, 0),
(1246, 'GB-CKT', 'GB', 'Cookstown', NULL, 0),
(1247, 'GB-CLD', 'GB', 'Calderdale', NULL, 0),
(1248, 'GB-CLK', 'GB', 'Clackmannanshire', NULL, 0),
(1249, 'GB-CWD', 'GB', 'Clwyd', NULL, 0),
(1250, 'GB-CLR', 'GB', 'Coleraine', NULL, 0),
(1251, 'GB-CMA', 'GB', 'Cumbria', NULL, 0),
(1252, 'GB-CMD', 'GB', 'Camden', NULL, 0),
(1253, 'GB-CMN', 'GB', 'Carmarthenshire', NULL, 0),
(1254, 'GB-CON', 'GB', 'Cornwall', NULL, 0),
(1255, 'GB-COV', 'GB', 'Coventry (West Midlands district)', NULL, 0),
(1256, 'GB-CRF', 'GB', 'Cardiff', NULL, 0),
(1257, 'GB-CRY', 'GB', 'Croydon', NULL, 0),
(1258, 'GB-CSR', 'GB', 'Castlereagh', NULL, 0),
(1259, 'GB-CWY', 'GB', 'Conwy', NULL, 0),
(1260, 'GB-DAL', 'GB', 'Darlington', NULL, 0),
(1261, 'GB-DBY', 'GB', 'Derbyshire', NULL, 0),
(1262, 'GB-DEN', 'GB', 'Denbighshire', NULL, 0),
(1263, 'GB-DER', 'GB', 'Derby', NULL, 0),
(1264, 'GB-DEV', 'GB', 'Devon', NULL, 0),
(1265, 'GB-DGN', 'GB', 'Dungannon and South Tyrone', NULL, 0),
(1266, 'GB-DGY', 'GB', 'Dumfries and Galloway', NULL, 0),
(1267, 'GB-DNC', 'GB', 'Doncaster', NULL, 0),
(1268, 'GB-DND', 'GB', 'Dundee', NULL, 0),
(1269, 'GB-DOR', 'GB', 'Dorset', NULL, 0),
(1270, 'GB-DOW', 'GB', 'County Down', NULL, 0),
(1271, 'GB-DRY', 'GB', 'Derry', NULL, 0),
(1272, 'GB-DUD', 'GB', 'Dudley (West Midlands district)', NULL, 0),
(1273, 'GB-DUR', 'GB', 'County Durham', NULL, 0),
(1274, 'GB-EAL', 'GB', 'Ealing', NULL, 0),
(1275, 'GB-EAY', 'GB', 'East Ayrshire', NULL, 0),
(1276, 'GB-EDH', 'GB', 'City of Edinburgh', NULL, 0),
(1277, 'GB-EDU', 'GB', 'East Dunbartonshire', NULL, 0),
(1278, 'GB-ELN', 'GB', 'East Lothian', NULL, 0),
(1279, 'GB-ELS', 'GB', 'Eilean Siar', NULL, 0),
(1280, 'GB-ENF', 'GB', 'Enfield', NULL, 0),
(1281, 'GB-ERW', 'GB', 'East Renfrewshire', NULL, 0),
(1282, 'GB-ERY', 'GB', 'East Riding of Yorkshire', NULL, 0),
(1283, 'GB-ESS', 'GB', 'Essex', NULL, 0),
(1284, 'GB-ESX', 'GB', 'East Sussex', NULL, 0),
(1285, 'GB-FAL', 'GB', 'Falkirk', NULL, 0),
(1286, 'GB-FER', 'GB', 'Fermanagh', NULL, 0),
(1287, 'GB-FIF', 'GB', 'Fife', NULL, 0),
(1288, 'GB-FLN', 'GB', 'Flintshire', NULL, 0),
(1289, 'GB-GLG', 'GB', 'Glasgow City', NULL, 0),
(1290, 'GB-GLS', 'GB', 'Gloucestershire', NULL, 0),
(1291, 'GB-GNT', 'GB', 'Gwent', NULL, 0),
(1292, 'GB-GRE', 'GB', 'Greenwich', NULL, 0),
(1293, 'GB-GSY', 'GB', 'Guernsey', NULL, 0),
(1294, 'GB-GWN', 'GB', 'Gwynedd', NULL, 0),
(1295, 'GB-HAL', 'GB', 'Halton', NULL, 0),
(1296, 'GB-HAM', 'GB', 'Hampshire', NULL, 0),
(1297, 'GB-HAV', 'GB', 'Havering', NULL, 0),
(1298, 'GB-HCK', 'GB', 'Hackney', NULL, 0),
(1299, 'GB-HEF', 'GB', 'Herefordshire', NULL, 0),
(1300, 'GB-HIL', 'GB', 'Hillingdon', NULL, 0),
(1301, 'GB-HLD', 'GB', 'Scottish Highlands', NULL, 0),
(1302, 'GB-HMF', 'GB', 'Hammersmith and Fulham', NULL, 0),
(1303, 'GB-HNS', 'GB', 'Hounslow', NULL, 0),
(1304, 'GB-HPL', 'GB', 'Hartlepool', NULL, 0),
(1305, 'GB-HRT', 'GB', 'Hertfordshire', NULL, 0),
(1306, 'GB-HRW', 'GB', 'Harrow', NULL, 0),
(1307, 'GB-HRY', 'GB', 'Haringey', NULL, 0),
(1308, 'GB-IOS', 'GB', 'Isles of Scilly', NULL, 0),
(1309, 'GB-IOW', 'GB', 'Isle of Wight', NULL, 0),
(1310, 'GB-ISL', 'GB', 'Islington', NULL, 0),
(1311, 'GB-IVC', 'GB', 'Inverclyde', NULL, 0),
(1312, 'GB-JSY', 'GB', 'Jersey', NULL, 0),
(1313, 'GB-KEC', 'GB', 'Kensington and Chelsea', NULL, 0),
(1314, 'GB-KEN', 'GB', 'Kent', NULL, 0),
(1315, 'GB-KCD', 'GB', 'Kincardineshire', NULL, 0),
(1316, 'GB-KHL', 'GB', 'Kingston upon Hull City of', NULL, 0),
(1317, 'GB-KIR', 'GB', 'Kirklees', NULL, 0),
(1318, 'GB-KTT', 'GB', 'Kingston upon Thames', NULL, 0),
(1319, 'GB-KWL', 'GB', 'Knowsley', NULL, 0),
(1320, 'GB-LAN', 'GB', 'Lancashire', NULL, 0),
(1321, 'GB-LBH', 'GB', 'Lambeth', NULL, 0),
(1322, 'GB-LCE', 'GB', 'Leicester', NULL, 0),
(1323, 'GB-LDS', 'GB', 'Leeds', NULL, 0),
(1324, 'GB-LEC', 'GB', 'Leicestershire', NULL, 0),
(1325, 'GB-LEW', 'GB', 'Lewisham', NULL, 0),
(1326, 'GB-LIN', 'GB', 'Lincolnshire', NULL, 0),
(1327, 'GB-LIV', 'GB', 'Liverpool', NULL, 0),
(1328, 'GB-LMV', 'GB', 'Limavady', NULL, 0),
(1329, 'GB-LND', 'GB', 'Greater London', NULL, 0),
(1330, 'GB-LRN', 'GB', 'Larne', NULL, 0),
(1331, 'GB-LSB', 'GB', 'Lisburn', NULL, 0),
(1332, 'GB-LUT', 'GB', 'Luton', NULL, 0),
(1333, 'GB-MAN', 'GB', 'Greater Manchester', NULL, 0),
(1334, 'GB-MDB', 'GB', 'Middlesbrough', NULL, 0),
(1335, 'GB-MDW', 'GB', 'Medway', NULL, 0),
(1336, 'GB-MFT', 'GB', 'Magherafelt', NULL, 0),
(1337, 'GB-MIK', 'GB', 'Milton Keynes', NULL, 0),
(1338, 'GB-MLN', 'GB', 'Midlothian', NULL, 0),
(1339, 'GB-MON', 'GB', 'Monmouthshire', NULL, 0),
(1340, 'GB-MSY', 'GB', 'Merseyside', NULL, 0),
(1341, 'GB-MRT', 'GB', 'Merton', NULL, 0),
(1342, 'GB-MGM', 'GB', 'Mid Glamorgan', NULL, 0),
(1343, 'GB-MDX', 'GB', 'Middlesex', NULL, 0),
(1344, 'GB-MRY', 'GB', 'Moray', NULL, 0),
(1345, 'GB-MTY', 'GB', 'Merthyr Tydfil', NULL, 0),
(1346, 'GB-MYL', 'GB', 'Moyle', NULL, 0),
(1347, 'GB-NAY', 'GB', 'North Ayrshire', NULL, 0),
(1348, 'GB-NBL', 'GB', 'Northumberland', NULL, 0),
(1349, 'GB-NDN', 'GB', 'North Down', NULL, 0),
(1350, 'GB-NEL', 'GB', 'North East Lincolnshire', NULL, 0),
(1351, 'GB-NET', 'GB', 'Newcastle upon Tyne', NULL, 0),
(1352, 'GB-NFK', 'GB', 'Norfolk', NULL, 0),
(1353, 'GB-NGM', 'GB', 'Nottingham', NULL, 0),
(1354, 'GB-NLK', 'GB', 'North Lanarkshire', NULL, 0),
(1355, 'GB-NLN', 'GB', 'North Lincolnshire', NULL, 0),
(1356, 'GB-NSM', 'GB', 'North Somerset', NULL, 0),
(1357, 'GB-NTA', 'GB', 'Newtownabbey', NULL, 0),
(1358, 'GB-NTH', 'GB', 'Northamptonshire', NULL, 0),
(1359, 'GB-NTL', 'GB', 'Neath Port Talbot', NULL, 0),
(1360, 'GB-NTT', 'GB', 'Nottinghamshire', NULL, 0),
(1361, 'GB-NTY', 'GB', 'North Tyneside', NULL, 0),
(1362, 'GB-NWM', 'GB', 'Newham', NULL, 0),
(1363, 'GB-NWP', 'GB', 'Newport', NULL, 0),
(1364, 'GB-NYK', 'GB', 'North Yorkshire', NULL, 0),
(1365, 'GB-NYM', 'GB', 'Newry and Mourne', NULL, 0),
(1366, 'GB-OLD', 'GB', 'Oldham', NULL, 0),
(1367, 'GB-OMH', 'GB', 'Omagh', NULL, 0),
(1368, 'GB-ORK', 'GB', 'Orkney Islands', NULL, 0),
(1369, 'GB-OXF', 'GB', 'Oxfordshire', NULL, 0),
(1370, 'GB-PEM', 'GB', 'Pembrokeshire', NULL, 0),
(1371, 'GB-PKN', 'GB', 'Perth and Kinross', NULL, 0),
(1372, 'GB-PLY', 'GB', 'Plymouth', NULL, 0),
(1373, 'GB-POL', 'GB', 'Poole', NULL, 0),
(1374, 'GB-POR', 'GB', 'Portsmouth', NULL, 0),
(1375, 'GB-POW', 'GB', 'Powys', NULL, 0),
(1376, 'GB-PTE', 'GB', 'Peterborough', NULL, 0),
(1377, 'GB-RCC', 'GB', 'Redcar and Cleveland', NULL, 0),
(1378, 'GB-RCH', 'GB', 'Rochdale', NULL, 0),
(1379, 'GB-RCT', 'GB', 'Rhondda Cynon Taf', NULL, 0),
(1380, 'GB-RDB', 'GB', 'Redbridge', NULL, 0),
(1381, 'GB-RDG', 'GB', 'Reading', NULL, 0),
(1382, 'GB-RFW', 'GB', 'Renfrewshire', NULL, 0),
(1383, 'GB-RIC', 'GB', 'Richmond upon Thames', NULL, 0),
(1384, 'GB-ROT', 'GB', 'Rotherham', NULL, 0),
(1385, 'GB-RUT', 'GB', 'Rutland', NULL, 0),
(1386, 'GB-SAW', 'GB', 'Sandwell', NULL, 0),
(1387, 'GB-SAY', 'GB', 'South Ayrshire', NULL, 0),
(1388, 'GB-SCB', 'GB', 'Scottish Borders', NULL, 0),
(1389, 'GB-SFK', 'GB', 'Suffolk', NULL, 0),
(1390, 'GB-SFT', 'GB', 'Sefton', NULL, 0),
(1391, 'GB-SGC', 'GB', 'South Gloucestershire', NULL, 0),
(1392, 'GB-SHF', 'GB', 'Sheffield', NULL, 0),
(1393, 'GB-SHN', 'GB', 'St Helens', NULL, 0),
(1394, 'GB-SHR', 'GB', 'Shropshire', NULL, 0),
(1395, 'GB-SKP', 'GB', 'Stockport', NULL, 0),
(1396, 'GB-SLF', 'GB', 'Salford', NULL, 0),
(1397, 'GB-SLG', 'GB', 'Slough', NULL, 0),
(1398, 'GB-SLK', 'GB', 'South Lanarkshire', NULL, 0),
(1399, 'GB-SGM', 'GB', 'South Glamorgan', NULL, 0),
(1400, 'GB-SYK', 'GB', 'South Yorkshire', NULL, 0),
(1401, 'GB-SND', 'GB', 'Sunderland', NULL, 0),
(1402, 'GB-SOL', 'GB', 'Solihull', NULL, 0),
(1403, 'GB-SOM', 'GB', 'Somerset', NULL, 0),
(1404, 'GB-SOS', 'GB', 'Southend-on-Sea', NULL, 0),
(1405, 'GB-SRY', 'GB', 'Surrey', NULL, 0),
(1406, 'GB-STB', 'GB', 'Strabane', NULL, 0),
(1407, 'GB-STE', 'GB', 'Stoke-on-Trent', NULL, 0),
(1408, 'GB-STG', 'GB', 'Stirling', NULL, 0),
(1409, 'GB-STH', 'GB', 'Southampton', NULL, 0),
(1410, 'GB-STN', 'GB', 'Sutton', NULL, 0),
(1411, 'GB-STS', 'GB', 'Staffordshire', NULL, 0),
(1412, 'GB-STT', 'GB', 'Stockton-on-Tees', NULL, 0),
(1413, 'GB-STY', 'GB', 'South Tyneside', NULL, 0),
(1414, 'GB-SWA', 'GB', 'Swansea', NULL, 0),
(1415, 'GB-SWD', 'GB', 'Swindon', NULL, 0),
(1416, 'GB-SWK', 'GB', 'Southwark', NULL, 0),
(1417, 'GB-TAM', 'GB', 'Tameside', NULL, 0),
(1418, 'GB-TFW', 'GB', 'Telford and Wrekin', NULL, 0),
(1419, 'GB-THR', 'GB', 'Thurrock', NULL, 0),
(1420, 'GB-TOB', 'GB', 'Torbay', NULL, 0),
(1421, 'GB-TOF', 'GB', 'Torfaen', NULL, 0),
(1422, 'GB-TRF', 'GB', 'Trafford', NULL, 0),
(1423, 'GB-TWH', 'GB', 'Tower Hamlets', NULL, 0),
(1424, 'GB-TWR', 'GB', 'Tyne and Wear', NULL, 0),
(1425, 'GB-VGL', 'GB', 'Vale of Glamorgan', NULL, 0),
(1426, 'GB-WAR', 'GB', 'Warwickshire', NULL, 0),
(1427, 'GB-WBK', 'GB', 'West Berkshire', NULL, 0),
(1428, 'GB-WDU', 'GB', 'West Dunbartonshire', NULL, 0),
(1429, 'GB-WFT', 'GB', 'Waltham Forest', NULL, 0),
(1430, 'GB-WGN', 'GB', 'Wigan', NULL, 0),
(1431, 'GB-WIL', 'GB', 'Wiltshire', NULL, 0),
(1432, 'GB-WKF', 'GB', 'Wakefield', NULL, 0),
(1433, 'GB-WLL', 'GB', 'Walsall', NULL, 0),
(1434, 'GB-WLN', 'GB', 'West Lothian', NULL, 0),
(1435, 'GB-WGM', 'GB', 'West Glamorgan', NULL, 0),
(1436, 'GB-WMD', 'GB', 'West Midlands', NULL, 0),
(1437, 'GB-WYK', 'GB', 'West Yorkshire', NULL, 0),
(1438, 'GB-WLV', 'GB', 'Wolverhampton', NULL, 0),
(1439, 'GB-WND', 'GB', 'Wandsworth', NULL, 0),
(1440, 'GB-WNM', 'GB', 'Windsor and Maidenhead', NULL, 0),
(1441, 'GB-WOK', 'GB', 'Wokingham', NULL, 0),
(1442, 'GB-WOR', 'GB', 'Worcestershire', NULL, 0),
(1443, 'GB-WRL', 'GB', 'Wirral', NULL, 0),
(1444, 'GB-WRT', 'GB', 'Warrington', NULL, 0),
(1445, 'GB-WRX', 'GB', 'Wrexham', NULL, 0),
(1446, 'GB-WSM', 'GB', 'Westminster', NULL, 0),
(1447, 'GB-WSX', 'GB', 'West Sussex', NULL, 0),
(1448, 'GB-YOR', 'GB', 'York', NULL, 0),
(1449, 'GB-ZET', 'GB', 'Shetland Islands', NULL, 0),
(1450, 'GD-A', 'GD', 'Saint Andrew', NULL, 0),
(1451, 'GD-C', 'GD', 'Carriacou', NULL, 0),
(1452, 'GD-D', 'GD', 'Saint David', NULL, 0),
(1453, 'GD-G', 'GD', 'Saint George', NULL, 0),
(1454, 'GD-J', 'GD', 'Saint John', NULL, 0),
(1455, 'GD-M', 'GD', 'Saint Mark', NULL, 0),
(1456, 'GD-P', 'GD', 'Saint Patrick', NULL, 0),
(1457, 'GD-Q', 'GD', 'Petit Martinique', NULL, 0),
(1458, 'GE-AB', 'GE', 'Abkhazia', NULL, 0),
(1459, 'GE-AJ', 'GE', 'Ajaria', NULL, 0),
(1460, 'GE-GU', 'GE', 'Guria', NULL, 0),
(1461, 'GE-IM', 'GE', 'Imereti', NULL, 0),
(1462, 'GE-KA', 'GE', 'Kakheti', NULL, 0),
(1463, 'GE-KK', 'GE', 'Kvemo Kartli', NULL, 0),
(1464, 'GE-MM', 'GE', 'Mtskheta-Mtianeti', NULL, 0),
(1465, 'GE-RL', 'GE', 'Racha Lechkhumi and Kvemo Svaneti', NULL, 0),
(1466, 'GE-SJ', 'GE', 'Samtskhe-Javakheti', NULL, 0),
(1467, 'GE-SK', 'GE', 'Shida Kartli', NULL, 0),
(1468, 'GE-SZ', 'GE', 'Samegrelo-Zemo Svaneti', NULL, 0),
(1469, 'GE-TB', 'GE', 'Tbilisi', NULL, 0),
(1470, 'GH-AS', 'GH', 'Ashanti Region', NULL, 0),
(1471, 'GH-BA', 'GH', 'Brong-Ahafo Region', NULL, 0),
(1472, 'GH-CE', 'GH', 'Central Region', NULL, 0),
(1473, 'GH-EA', 'GH', 'Eastern Region', NULL, 0),
(1474, 'GH-GA', 'GH', 'Greater Accra Region', NULL, 0),
(1475, 'GH-NO', 'GH', 'Northern Region', NULL, 0),
(1476, 'GH-UE', 'GH', 'Upper East Region', NULL, 0),
(1477, 'GH-UW', 'GH', 'Upper West Region', NULL, 0),
(1478, 'GH-VO', 'GH', 'Volta Region', NULL, 0),
(1479, 'GH-WE', 'GH', 'Western Region', NULL, 0),
(1480, 'GL-A', 'GL', 'Avannaa', NULL, 0),
(1481, 'GL-K', 'GL', 'Kitaa', NULL, 0),
(1482, 'GL-T', 'GL', 'Tunu', NULL, 0),
(1483, 'GM-BJ', 'GM', 'Banjul', NULL, 0),
(1484, 'GM-BR', 'GM', 'Brikama', NULL, 0),
(1485, 'GM-BS', 'GM', 'Basse', NULL, 0),
(1486, 'GM-CR', 'GM', 'Central River', NULL, 0),
(1487, 'GM-JA', 'GM', 'Janjangbure', NULL, 0),
(1488, 'GM-KA', 'GM', 'Kanifeng', NULL, 0),
(1489, 'GM-KE', 'GM', 'Kerewan', NULL, 0),
(1490, 'GM-KU', 'GM', 'Kuntaur', NULL, 0),
(1491, 'GM-LR', 'GM', 'Lower River', NULL, 0),
(1492, 'GM-MA', 'GM', 'Mansakonko', NULL, 0),
(1493, 'GM-NB', 'GM', 'North Bank', NULL, 0),
(1494, 'GM-UR', 'GM', 'Upper River', NULL, 0),
(1495, 'GM-WE', 'GM', 'Western', NULL, 0),
(1496, 'GN-BFA', 'GN', 'Boffa', NULL, 0),
(1497, 'GN-BOK', 'GN', 'Boke', NULL, 0),
(1498, 'GN-BYL', 'GN', 'Beyla', NULL, 0),
(1499, 'GN-CNK', 'GN', 'Conakry', NULL, 0),
(1500, 'GN-COY', 'GN', 'Coyah', NULL, 0),
(1501, 'GN-DBL', 'GN', 'Dabola', NULL, 0),
(1502, 'GN-DBR', 'GN', 'Dubreka', NULL, 0),
(1503, 'GN-DGR', 'GN', 'Dinguiraye', NULL, 0),
(1504, 'GN-DLB', 'GN', 'Dalaba', NULL, 0),
(1505, 'GN-FRC', 'GN', 'Forecariah', NULL, 0),
(1506, 'GN-FRI', 'GN', 'Fria', NULL, 0),
(1507, 'GN-FRN', 'GN', 'Faranah', NULL, 0),
(1508, 'GN-GAO', 'GN', 'Gaoual', NULL, 0),
(1509, 'GN-GCD', 'GN', 'Gueckedou', NULL, 0),
(1510, 'GN-KBA', 'GN', 'Koubia', NULL, 0),
(1511, 'GN-KDA', 'GN', 'Koundara', NULL, 0),
(1512, 'GN-KND', 'GN', 'Kindia', NULL, 0),
(1513, 'GN-KNK', 'GN', 'Kankan', NULL, 0),
(1514, 'GN-KRA', 'GN', 'Kouroussa', NULL, 0),
(1515, 'GN-KRN', 'GN', 'Kerouane', NULL, 0),
(1516, 'GN-KSD', 'GN', 'Kissidougou', NULL, 0),
(1517, 'GN-LAB', 'GN', 'Labe', NULL, 0),
(1518, 'GN-LLM', 'GN', 'Lelouma', NULL, 0),
(1519, 'GN-LOL', 'GN', 'Lola', NULL, 0),
(1520, 'GN-MAL', 'GN', 'Mali', NULL, 0),
(1521, 'GN-MAM', 'GN', 'Mamou', NULL, 0),
(1522, 'GN-MAN', 'GN', 'Mandiana', NULL, 0),
(1523, 'GN-MCT', 'GN', 'Macenta', NULL, 0),
(1524, 'GN-NZR', 'GN', 'Nzerekore', NULL, 0),
(1525, 'GN-PIT', 'GN', 'Pita', NULL, 0),
(1526, 'GN-SIG', 'GN', 'Siguiri', NULL, 0),
(1527, 'GN-TLM', 'GN', 'Telimele', NULL, 0),
(1528, 'GN-TOG', 'GN', 'Tougue', NULL, 0),
(1529, 'GN-YOM', 'GN', 'Yomou', NULL, 0),
(1530, 'GQ-AN', 'GQ', 'Provincia Annobon', NULL, 0),
(1531, 'GQ-BN', 'GQ', 'Provincia Bioko Norte', NULL, 0),
(1532, 'GQ-BS', 'GQ', 'Provincia Bioko Sur', NULL, 0),
(1533, 'GQ-CS', 'GQ', 'Provincia Centro Sur', NULL, 0),
(1534, 'GQ-KN', 'GQ', 'Provincia Kie-Ntem', NULL, 0),
(1535, 'GQ-LI', 'GQ', 'Provincia Litoral', NULL, 0),
(1536, 'GQ-WN', 'GQ', 'Provincia Wele-Nzas', NULL, 0),
(1537, 'GR-AT', 'GR', 'Attica', NULL, 0),
(1538, 'GR-CM', 'GR', 'Central Macedonia', NULL, 0),
(1539, 'GR-CN', 'GR', 'Central Greece', NULL, 0),
(1540, 'GR-CR', 'GR', 'Crete', NULL, 0),
(1541, 'GR-EM', 'GR', 'East Macedonia and Thrace', NULL, 0),
(1542, 'GR-EP', 'GR', 'Epirus', NULL, 0),
(1543, 'GR-II', 'GR', 'Ionian Islands', NULL, 0),
(1544, 'GR-NA', 'GR', 'North Aegean', NULL, 0),
(1545, 'GR-PP', 'GR', 'Peloponnesos', NULL, 0),
(1546, 'GR-SA', 'GR', 'South Aegean', NULL, 0),
(1547, 'GR-TH', 'GR', 'Thessaly', NULL, 0),
(1548, 'GR-WG', 'GR', 'West Greece', NULL, 0),
(1549, 'GR-WM', 'GR', 'West Macedonia', NULL, 0),
(1550, 'GT-AV', 'GT', 'Alta Verapaz', NULL, 0),
(1551, 'GT-BV', 'GT', 'Baja Verapaz', NULL, 0),
(1552, 'GT-CM', 'GT', 'Chimaltenango', NULL, 0),
(1553, 'GT-CQ', 'GT', 'Chiquimula', NULL, 0),
(1554, 'GT-ES', 'GT', 'Escuintla', NULL, 0),
(1555, 'GT-GU', 'GT', 'Guatemala', NULL, 0),
(1556, 'GT-HU', 'GT', 'Huehuetenango', NULL, 0),
(1557, 'GT-IZ', 'GT', 'Izabal', NULL, 0),
(1558, 'GT-JA', 'GT', 'Jalapa', NULL, 0),
(1559, 'GT-JU', 'GT', 'Jutiapa', NULL, 0),
(1560, 'GT-PE', 'GT', 'El Peten', NULL, 0),
(1561, 'GT-PR', 'GT', 'El Progreso', NULL, 0),
(1562, 'GT-QC', 'GT', 'El Quiche', NULL, 0),
(1563, 'GT-QZ', 'GT', 'Quetzaltenango', NULL, 0),
(1564, 'GT-RE', 'GT', 'Retalhuleu', NULL, 0),
(1565, 'GT-SM', 'GT', 'San Marcos', NULL, 0),
(1566, 'GT-SO', 'GT', 'Solola', NULL, 0),
(1567, 'GT-SR', 'GT', 'Santa Rosa', NULL, 0),
(1568, 'GT-ST', 'GT', 'Sacatepequez', NULL, 0),
(1569, 'GT-SU', 'GT', 'Suchitepequez', NULL, 0),
(1570, 'GT-TO', 'GT', 'Totonicapan', NULL, 0),
(1571, 'GT-ZA', 'GT', 'Zacapa', NULL, 0),
(1572, 'GW-BB', 'GW', 'Biombo Region', NULL, 0),
(1573, 'GW-BF', 'GW', 'Bafata Region', NULL, 0),
(1574, 'GW-BL', 'GW', 'Bolama Region', NULL, 0),
(1575, 'GW-BS', 'GW', 'Bissau Region', NULL, 0),
(1576, 'GW-CA', 'GW', 'Cacheu Region', NULL, 0),
(1577, 'GW-GA', 'GW', 'Gabu Region', NULL, 0),
(1578, 'GW-OI', 'GW', 'Oio Region', NULL, 0),
(1579, 'GW-QU', 'GW', 'Quinara Region', NULL, 0),
(1580, 'GW-TO', 'GW', 'Tombali Region', NULL, 0),
(1581, 'GY-BW', 'GY', 'Barima-Waini', NULL, 0),
(1582, 'GY-CM', 'GY', 'Cuyuni-Mazaruni', NULL, 0),
(1583, 'GY-DM', 'GY', 'Demerara-Mahaica', NULL, 0),
(1584, 'GY-EC', 'GY', 'East Berbice-Corentyne', NULL, 0),
(1585, 'GY-EW', 'GY', 'Essequibo Islands-West Demerara', NULL, 0),
(1586, 'GY-MB', 'GY', 'Mahaica-Berbice', NULL, 0),
(1587, 'GY-PI', 'GY', 'Potaro-Siparuni', NULL, 0),
(1588, 'GY-PM', 'GY', 'Pomeroon-Supenaam', NULL, 0),
(1589, 'GY-UD', 'GY', 'Upper Demerara-Berbice', NULL, 0),
(1590, 'GY-UT', 'GY', 'Upper Takutu-Upper Essequibo', NULL, 0),
(1591, 'HK-HCW', 'HK', 'Central and Western Hong Kong Island', NULL, 0),
(1592, 'HK-HEA', 'HK', 'Eastern Hong Kong Island', NULL, 0),
(1593, 'HK-HSO', 'HK', 'Southern Hong Kong Island', NULL, 0),
(1594, 'HK-HWC', 'HK', 'Wan Chai Hong Kong Island', NULL, 0),
(1595, 'HK-KKC', 'HK', 'Kowloon City Kowloon', NULL, 0),
(1596, 'HK-KKT', 'HK', 'Kwun Tong Kowloon', NULL, 0),
(1597, 'HK-KSS', 'HK', 'Sham Shui Po Kowloon', NULL, 0),
(1598, 'HK-KWT', 'HK', 'Wong Tai Sin Kowloon', NULL, 0),
(1599, 'HK-KYT', 'HK', 'Yau Tsim Mong Kowloon', NULL, 0),
(1600, 'HK-NIS', 'HK', 'Islands New Territories', NULL, 0),
(1601, 'HK-NKT', 'HK', 'Kwai Tsing New Territories', NULL, 0),
(1602, 'HK-NNO', 'HK', 'North New Territories', NULL, 0),
(1603, 'HK-NSK', 'HK', 'Sai Kung New Territories', NULL, 0),
(1604, 'HK-NST', 'HK', 'Sha Tin New Territories', NULL, 0),
(1605, 'HK-NTM', 'HK', 'Tuen Mun New Territories', NULL, 0),
(1606, 'HK-NTP', 'HK', 'Tai Po New Territories', NULL, 0),
(1607, 'HK-NTW', 'HK', 'Tsuen Wan New Territories', NULL, 0),
(1608, 'HK-NYL', 'HK', 'Yuen Long New Territories', NULL, 0),
(1609, 'HM-F', 'HM', 'Flat Island', NULL, 0),
(1610, 'HM-H', 'HM', 'Heard Island', NULL, 0),
(1611, 'HM-M', 'HM', 'McDonald Island', NULL, 0),
(1612, 'HM-S', 'HM', 'Shag Island', NULL, 0),
(1613, 'HN-AT', 'HN', 'Atlantida', NULL, 0),
(1614, 'HN-CH', 'HN', 'Choluteca', NULL, 0),
(1615, 'HN-CL', 'HN', 'Colon', NULL, 0),
(1616, 'HN-CM', 'HN', 'Comayagua', NULL, 0),
(1617, 'HN-CP', 'HN', 'Copan', NULL, 0),
(1618, 'HN-CR', 'HN', 'Cortes', NULL, 0),
(1619, 'HN-FM', 'HN', 'Francisco Morazan', NULL, 0),
(1620, 'HN-GD', 'HN', 'Gracias a Dios', NULL, 0),
(1621, 'HN-IB', 'HN', 'Islas de la Bahia (Bay Islands)', NULL, 0),
(1622, 'HN-IN', 'HN', 'Intibuca', NULL, 0),
(1623, 'HN-LE', 'HN', 'Lempira', NULL, 0),
(1624, 'HN-OC', 'HN', 'Ocotepeque', NULL, 0),
(1625, 'HN-OL', 'HN', 'Olancho', NULL, 0),
(1626, 'HN-PA', 'HN', 'El Paraiso', NULL, 0),
(1627, 'HN-PZ', 'HN', 'La Paz', NULL, 0),
(1628, 'HN-SB', 'HN', 'Santa Barbara', NULL, 0),
(1629, 'HN-VA', 'HN', 'Valle', NULL, 0),
(1630, 'HN-YO', 'HN', 'Yoro', NULL, 0),
(1631, 'HR-01', 'HR', 'Zagreb county', NULL, 0),
(1632, 'HR-02', 'HR', 'Krapina-Zagorje county', NULL, 0),
(1633, 'HR-03', 'HR', 'Sisak-Moslavina county', NULL, 0),
(1634, 'HR-04', 'HR', 'Karlovac county', NULL, 0),
(1635, 'HR-05', 'HR', 'Varazdin county', NULL, 0),
(1636, 'HR-06', 'HR', 'Koprivnica-Krizevci county', NULL, 0),
(1637, 'HR-07', 'HR', 'Bjelovar-Bilogora county', NULL, 0),
(1638, 'HR-08', 'HR', 'Primorje-Gorski Kotar county', NULL, 0),
(1639, 'HR-09', 'HR', 'Lika-Senj county', NULL, 0),
(1640, 'HR-10', 'HR', 'Virovitica-Podravina county', NULL, 0),
(1641, 'HR-11', 'HR', 'Pozega-Slavonia county', NULL, 0),
(1642, 'HR-12', 'HR', 'Brod-Posavina county', NULL, 0),
(1643, 'HR-13', 'HR', 'Zadar county', NULL, 0),
(1644, 'HR-14', 'HR', 'Osijek-Baranja county', NULL, 0),
(1645, 'HR-15', 'HR', 'Sibenik-Knin county', NULL, 0),
(1646, 'HR-16', 'HR', 'Vukovar-Srijem county', NULL, 0),
(1647, 'HR-17', 'HR', 'Split-Dalmatia county', NULL, 0),
(1648, 'HR-18', 'HR', 'Istria county', NULL, 0),
(1649, 'HR-19', 'HR', 'Dubrovnik-Neretva county', NULL, 0),
(1650, 'HR-20', 'HR', 'Medjimurje county', NULL, 0),
(1651, 'HR-21', 'HR', 'Zagreb (city)', NULL, 0),
(1652, 'HT-AR', 'HT', 'Artibonite', NULL, 0),
(1653, 'HT-CE', 'HT', 'Centre', NULL, 0),
(1654, 'HT-GA', 'HT', 'Grand\'Anse', NULL, 0),
(1655, 'HT-ND', 'HT', 'Nord', NULL, 0),
(1656, 'HT-NE', 'HT', 'Nord-Est', NULL, 0),
(1657, 'HT-NO', 'HT', 'Nord-Ouest', NULL, 0),
(1658, 'HT-OU', 'HT', 'Ouest', NULL, 0),
(1659, 'HT-SD', 'HT', 'Sud', NULL, 0),
(1660, 'HT-SE', 'HT', 'Sud-Est', NULL, 0),
(1661, 'HU-BA', 'HU', 'Borsod-Abauj-Zemplen', NULL, 0),
(1662, 'HU-BC', 'HU', 'Bekescsaba', NULL, 0),
(1663, 'HU-BK', 'HU', 'Bacs-Kiskun', NULL, 0),
(1664, 'HU-BR', 'HU', 'Baranya', NULL, 0),
(1665, 'HU-BS', 'HU', 'Bekes', NULL, 0),
(1666, 'HU-BU', 'HU', 'Budapest', NULL, 0),
(1667, 'HU-CG', 'HU', 'Csongrad', NULL, 0),
(1668, 'HU-DB', 'HU', 'Debrecen', NULL, 0),
(1669, 'HU-DJ', 'HU', 'Dunaujvaros', NULL, 0),
(1670, 'HU-EG', 'HU', 'Eger', NULL, 0),
(1671, 'HU-FJ', 'HU', 'Fejer', NULL, 0),
(1672, 'HU-GM', 'HU', 'Gyor-Moson-Sopron', NULL, 0),
(1673, 'HU-GY', 'HU', 'Gyor', NULL, 0),
(1674, 'HU-HB', 'HU', 'Hajdu-Bihar', NULL, 0),
(1675, 'HU-HM', 'HU', 'Hodmezovasarhely', NULL, 0),
(1676, 'HU-HV', 'HU', 'Heves', NULL, 0),
(1677, 'HU-JN', 'HU', 'Jasz-Nagykun-Szolnok', NULL, 0),
(1678, 'HU-KC', 'HU', 'Kecskemet', NULL, 0),
(1679, 'HU-KE', 'HU', 'Komarom-Esztergom', NULL, 0),
(1680, 'HU-KP', 'HU', 'Kaposvar', NULL, 0),
(1681, 'HU-MK', 'HU', 'Miskolc', NULL, 0),
(1682, 'HU-NG', 'HU', 'Nograd', NULL, 0),
(1683, 'HU-NK', 'HU', 'Nagykanizsa', NULL, 0),
(1684, 'HU-NY', 'HU', 'Nyiregyhaza', NULL, 0),
(1685, 'HU-PC', 'HU', 'Pecs', NULL, 0),
(1686, 'HU-PE', 'HU', 'Pest', NULL, 0),
(1687, 'HU-SB', 'HU', 'Szombathely', NULL, 0),
(1688, 'HU-SG', 'HU', 'Szeged', NULL, 0),
(1689, 'HU-SK', 'HU', 'Szekesfehervar', NULL, 0),
(1690, 'HU-SL', 'HU', 'Szolnok', NULL, 0),
(1691, 'HU-SM', 'HU', 'Somogy', NULL, 0),
(1692, 'HU-SO', 'HU', 'Sopron', NULL, 0),
(1693, 'HU-SS', 'HU', 'Szabolcs-Szatmar-Bereg', NULL, 0),
(1694, 'HU-TB', 'HU', 'Tatabanya', NULL, 0),
(1695, 'HU-TO', 'HU', 'Tolna', NULL, 0),
(1696, 'HU-VA', 'HU', 'Vas', NULL, 0),
(1697, 'HU-VZ', 'HU', 'Veszprem', NULL, 0),
(1698, 'HU-ZA', 'HU', 'Zala', NULL, 0),
(1699, 'HU-ZG', 'HU', 'Zalaegerszeg', NULL, 0),
(1700, 'ID-AC', 'ID', 'Aceh', NULL, 0),
(1701, 'ID-BA', 'ID', 'Bali', NULL, 0),
(1702, 'ID-BB', 'ID', 'Bangka-Belitung', NULL, 0),
(1703, 'ID-BE', 'ID', 'Bengkulu', NULL, 0),
(1704, 'ID-BT', 'ID', 'Banten', NULL, 0),
(1705, 'ID-GO', 'ID', 'Gorontalo', NULL, 0),
(1706, 'ID-IJ', 'ID', 'Papua', NULL, 0),
(1707, 'ID-JA', 'ID', 'Jambi', NULL, 0),
(1708, 'ID-JI', 'ID', 'Jawa Timur', NULL, 0),
(1709, 'ID-JK', 'ID', 'Jakarta Raya', NULL, 0),
(1710, 'ID-JR', 'ID', 'Jawa Barat', NULL, 0),
(1711, 'ID-JT', 'ID', 'Jawa Tengah', NULL, 0),
(1712, 'ID-KB', 'ID', 'Kalimantan Barat', NULL, 0),
(1713, 'ID-KI', 'ID', 'Kalimantan Timur', NULL, 0),
(1714, 'ID-KS', 'ID', 'Kalimantan Selatan', NULL, 0),
(1715, 'ID-KT', 'ID', 'Kalimantan Tengah', NULL, 0),
(1716, 'ID-LA', 'ID', 'Lampung', NULL, 0),
(1717, 'ID-MA', 'ID', 'Maluku', NULL, 0),
(1718, 'ID-MU', 'ID', 'Maluku Utara', NULL, 0),
(1719, 'ID-NB', 'ID', 'Nusa Tenggara Barat', NULL, 0),
(1720, 'ID-NT', 'ID', 'Nusa Tenggara Timur', NULL, 0),
(1721, 'ID-RI', 'ID', 'Riau', NULL, 0),
(1722, 'ID-SB', 'ID', 'Sumatera Barat', NULL, 0),
(1723, 'ID-SG', 'ID', 'Sulawesi Tenggara', NULL, 0),
(1724, 'ID-SL', 'ID', 'Sumatera Selatan', NULL, 0),
(1725, 'ID-SN', 'ID', 'Sulawesi Selatan', NULL, 0),
(1726, 'ID-ST', 'ID', 'Sulawesi Tengah', NULL, 0),
(1727, 'ID-SU', 'ID', 'Sumatera Utara', NULL, 0),
(1728, 'ID-SW', 'ID', 'Sulawesi Utara', NULL, 0),
(1729, 'ID-YO', 'ID', 'Yogyakarta', NULL, 0),
(1730, 'IE-CK', 'IE', 'Cork', NULL, 0),
(1731, 'IE-CL', 'IE', 'Clare', NULL, 0),
(1732, 'IE-CV', 'IE', 'Cavan', NULL, 0),
(1733, 'IE-CW', 'IE', 'Carlow', NULL, 0),
(1734, 'IE-DB', 'IE', 'Dublin', NULL, 0),
(1735, 'IE-DG', 'IE', 'Donegal', NULL, 0),
(1736, 'IE-GW', 'IE', 'Galway', NULL, 0),
(1737, 'IE-KD', 'IE', 'Kildare', NULL, 0),
(1738, 'IE-KK', 'IE', 'Kilkenny', NULL, 0),
(1739, 'IE-KR', 'IE', 'Kerry', NULL, 0),
(1740, 'IE-LA', 'IE', 'Laois', NULL, 0),
(1741, 'IE-LF', 'IE', 'Longford', NULL, 0),
(1742, 'IE-LM', 'IE', 'Limerick', NULL, 0),
(1743, 'IE-LR', 'IE', 'Leitrim', NULL, 0),
(1744, 'IE-LT', 'IE', 'Louth', NULL, 0),
(1745, 'IE-MG', 'IE', 'Monaghan', NULL, 0),
(1746, 'IE-MT', 'IE', 'Meath', NULL, 0),
(1747, 'IE-MY', 'IE', 'Mayo', NULL, 0),
(1748, 'IE-OF', 'IE', 'Offaly', NULL, 0),
(1749, 'IE-RC', 'IE', 'Roscommon', NULL, 0),
(1750, 'IE-SL', 'IE', 'Sligo', NULL, 0),
(1751, 'IE-TP', 'IE', 'Tipperary', NULL, 0),
(1752, 'IE-WF', 'IE', 'Waterford', NULL, 0),
(1753, 'IE-WK', 'IE', 'Wicklow', NULL, 0),
(1754, 'IE-WM', 'IE', 'Westmeath', NULL, 0),
(1755, 'IE-WX', 'IE', 'Wexford', NULL, 0),
(1756, 'IL-C', 'IL', 'Central', NULL, 0),
(1757, 'IL-H', 'IL', 'Haifa', NULL, 0),
(1758, 'IL-J', 'IL', 'Jerusalem', NULL, 0),
(1759, 'IL-N', 'IL', 'Northern', NULL, 0),
(1760, 'IL-S', 'IL', 'Southern', NULL, 0),
(1761, 'IL-T', 'IL', 'Tel Aviv', NULL, 0),
(1762, 'IN-AN', 'IN', 'Andaman and Nicobar Islands', NULL, 0),
(1763, 'IN-AP', 'IN', 'Andhra Pradesh', NULL, 0),
(1764, 'IN-AR', 'IN', 'Arunachal Pradesh', NULL, 0),
(1765, 'IN-AS', 'IN', 'Assam', NULL, 0),
(1766, 'IN-BR', 'IN', 'Bihar', NULL, 0),
(1767, 'IN-CH', 'IN', 'Chandigarh', NULL, 0),
(1768, 'IN-CT', 'IN', 'Chhattisgarh', NULL, 0),
(1769, 'IN-DD', 'IN', 'Daman and Diu', NULL, 0),
(1770, 'IN-DL', 'IN', 'Delhi', NULL, 0),
(1771, 'IN-DN', 'IN', 'Dadra and Nagar Haveli', NULL, 0),
(1772, 'IN-GA', 'IN', 'Goa', NULL, 0),
(1773, 'IN-GJ', 'IN', 'Gujarat', NULL, 0),
(1774, 'IN-HP', 'IN', 'Himachal Pradesh', NULL, 0),
(1775, 'IN-HR', 'IN', 'Haryana', NULL, 0),
(1776, 'IN-JH', 'IN', 'Jharkhand', NULL, 0),
(1777, 'IN-JK', 'IN', 'Jammu and Kashmir', NULL, 0),
(1778, 'IN-KA', 'IN', 'Karnataka', NULL, 0),
(1779, 'IN-KL', 'IN', 'Kerala', NULL, 0),
(1780, 'IN-LD', 'IN', 'Lakshadweep', NULL, 0),
(1781, 'IN-ML', 'IN', 'Meghalaya', NULL, 0),
(1782, 'IN-MM', 'IN', 'Maharashtra', NULL, 0),
(1783, 'IN-MN', 'IN', 'Manipur', NULL, 0),
(1784, 'IN-MP', 'IN', 'Madhya Pradesh', NULL, 0),
(1785, 'IN-MZ', 'IN', 'Mizoram', NULL, 0),
(1786, 'IN-NL', 'IN', 'Nagaland', NULL, 0),
(1787, 'IN-OR', 'IN', 'Orissa', NULL, 0),
(1788, 'IN-PB', 'IN', 'Punjab', NULL, 0),
(1789, 'IN-PY', 'IN', 'Pondicherry', NULL, 0),
(1790, 'IN-RJ', 'IN', 'Rajasthan', NULL, 0),
(1791, 'IN-SK', 'IN', 'Sikkim', NULL, 0),
(1792, 'IN-TN', 'IN', 'Tamil Nadu', NULL, 0),
(1793, 'IN-TR', 'IN', 'Tripura', NULL, 0),
(1794, 'IN-UL', 'IN', 'Uttaranchal', NULL, 0),
(1795, 'IN-UP', 'IN', 'Uttar Pradesh', NULL, 0),
(1796, 'IN-WB', 'IN', 'West Bengal', NULL, 0),
(1797, 'IO-DG', 'IO', 'Diego Garcia', NULL, 0),
(1798, 'IO-DI', 'IO', 'Danger Island', NULL, 0),
(1799, 'IO-EA', 'IO', 'Eagle Islands', NULL, 0),
(1800, 'IO-EG', 'IO', 'Egmont Islands', NULL, 0),
(1801, 'IO-NI', 'IO', 'Nelsons Island', NULL, 0),
(1802, 'IO-PB', 'IO', 'Peros Banhos', NULL, 0),
(1803, 'IO-SI', 'IO', 'Salomon Islands', NULL, 0),
(1804, 'IO-TB', 'IO', 'Three Brothers', NULL, 0),
(1805, 'IQ-AB', 'IQ', 'Al Anbar', NULL, 0),
(1806, 'IQ-AL', 'IQ', 'Arbil', NULL, 0),
(1807, 'IQ-BA', 'IQ', 'Al Basrah', NULL, 0),
(1808, 'IQ-BB', 'IQ', 'Babil', NULL, 0),
(1809, 'IQ-BD', 'IQ', 'Baghdad', NULL, 0),
(1810, 'IQ-DH', 'IQ', 'Dahuk', NULL, 0),
(1811, 'IQ-DQ', 'IQ', 'Dhi Qar', NULL, 0),
(1812, 'IQ-DY', 'IQ', 'Diyala', NULL, 0),
(1813, 'IQ-KB', 'IQ', 'Al Karbala', NULL, 0),
(1814, 'IQ-MU', 'IQ', 'Al Muthanna', NULL, 0),
(1815, 'IQ-MY', 'IQ', 'Maysan', NULL, 0),
(1816, 'IQ-NJ', 'IQ', 'An Najaf', NULL, 0),
(1817, 'IQ-NN', 'IQ', 'Ninawa', NULL, 0),
(1818, 'IQ-QA', 'IQ', 'Al Qadisyah', NULL, 0),
(1819, 'IQ-SD', 'IQ', 'Salah ad Din', NULL, 0),
(1820, 'IQ-SL', 'IQ', 'As Sulaymaniyah', NULL, 0),
(1821, 'IQ-TM', 'IQ', 'At Ta\'mim', NULL, 0),
(1822, 'IQ-WS', 'IQ', 'Wasit', NULL, 0),
(1823, 'IR-ARD', 'IR', 'Ardabil', NULL, 0),
(1824, 'IR-BSH', 'IR', 'Bushehr', NULL, 0),
(1825, 'IR-CMB', 'IR', 'Chahar Mahaal and Bakhtiari', NULL, 0),
(1826, 'IR-EAZ', 'IR', 'East Azarbaijan', NULL, 0),
(1827, 'IR-EFH', 'IR', 'Esfahan', NULL, 0),
(1828, 'IR-FAR', 'IR', 'Fars', NULL, 0),
(1829, 'IR-GIL', 'IR', 'Gilan', NULL, 0),
(1830, 'IR-GLS', 'IR', 'Golestan', NULL, 0),
(1831, 'IR-HMD', 'IR', 'Hamadan', NULL, 0),
(1832, 'IR-HRM', 'IR', 'Hormozgan', NULL, 0),
(1833, 'IR-ILM', 'IR', 'Ilam', NULL, 0),
(1834, 'IR-KBA', 'IR', 'Kohkiluyeh and Buyer Ahmad', NULL, 0),
(1835, 'IR-KRB', 'IR', 'Kerman', NULL, 0),
(1836, 'IR-KRD', 'IR', 'Kurdistan', NULL, 0),
(1837, 'IR-KRM', 'IR', 'Kermanshah', NULL, 0),
(1838, 'IR-KZT', 'IR', 'Khuzestan', NULL, 0),
(1839, 'IR-LRS', 'IR', 'Lorestan', NULL, 0),
(1840, 'IR-MKZ', 'IR', 'Markazi', NULL, 0),
(1841, 'IR-MZD', 'IR', 'Mazandaran', NULL, 0),
(1842, 'IR-NKH', 'IR', 'North Khorasan', NULL, 0),
(1843, 'IR-QAZ', 'IR', 'Qazvin', NULL, 0),
(1844, 'IR-QOM', 'IR', 'Qom', NULL, 0),
(1845, 'IR-RKH', 'IR', 'Razavi Khorasan', NULL, 0),
(1846, 'IR-SBL', 'IR', 'Sistan and Baluchistan', NULL, 0),
(1847, 'IR-SKH', 'IR', 'South Khorasan', NULL, 0),
(1848, 'IR-SMN', 'IR', 'Semnan', NULL, 0),
(1849, 'IR-TEH', 'IR', 'Tehran', NULL, 0),
(1850, 'IR-WEZ', 'IR', 'West Azarbaijan', NULL, 0),
(1851, 'IR-YZD', 'IR', 'Yazd', NULL, 0),
(1852, 'IR-ZAN', 'IR', 'Zanjan', NULL, 0),
(1853, 'IS-AL', 'IS', 'Austurland', NULL, 0),
(1854, 'IS-HF', 'IS', 'Hofuoborgarsvaeoi', NULL, 0),
(1855, 'IS-NE', 'IS', 'Norourland eystra', NULL, 0),
(1856, 'IS-NV', 'IS', 'Norourland vestra', NULL, 0),
(1857, 'IS-SL', 'IS', 'Suourland', NULL, 0),
(1858, 'IS-SN', 'IS', 'Suournes', NULL, 0),
(1859, 'IS-VF', 'IS', 'Vestfiroir', NULL, 0),
(1860, 'IS-VL', 'IS', 'Vesturland', NULL, 0),
(1861, 'IT-AG', 'IT', 'Agrigento', NULL, 0),
(1862, 'IT-AL', 'IT', 'Alessandria', NULL, 0),
(1863, 'IT-AN', 'IT', 'Ancona', NULL, 0),
(1864, 'IT-AO', 'IT', 'Aosta', NULL, 0),
(1865, 'IT-AR', 'IT', 'Arezzo', NULL, 0),
(1866, 'IT-AP', 'IT', 'Ascoli Piceno', NULL, 0),
(1867, 'IT-AT', 'IT', 'Asti', NULL, 0),
(1868, 'IT-AV', 'IT', 'Avellino', NULL, 0),
(1869, 'IT-BA', 'IT', 'Bari', NULL, 0),
(1870, 'IT-BT', 'IT', 'Barletta-Andria-Trani', NULL, 0),
(1871, 'IT-BL', 'IT', 'Belluno', NULL, 0),
(1872, 'IT-BN', 'IT', 'Benevento', NULL, 0),
(1873, 'IT-BG', 'IT', 'Bergamo', NULL, 0),
(1874, 'IT-BI', 'IT', 'Biella', NULL, 0),
(1875, 'IT-BO', 'IT', 'Bologna', NULL, 0),
(1876, 'IT-BZ', 'IT', 'Bolzano', NULL, 0),
(1877, 'IT-BS', 'IT', 'Brescia', NULL, 0),
(1878, 'IT-BR', 'IT', 'Brindisi', NULL, 0),
(1879, 'IT-CA', 'IT', 'Cagliari', NULL, 0),
(1880, 'IT-CL', 'IT', 'Caltanissetta', NULL, 0),
(1881, 'IT-CB', 'IT', 'Campobasso', NULL, 0),
(1882, 'IT-CI', 'IT', 'Carbonia-Iglesias', NULL, 0),
(1883, 'IT-CE', 'IT', 'Caserta', NULL, 0),
(1884, 'IT-CT', 'IT', 'Catania', NULL, 0),
(1885, 'IT-CZ', 'IT', 'Catanzaro', NULL, 0),
(1886, 'IT-CH', 'IT', 'Chieti', NULL, 0),
(1887, 'IT-CO', 'IT', 'Como', NULL, 0),
(1888, 'IT-CS', 'IT', 'Cosenza', NULL, 0),
(1889, 'IT-CR', 'IT', 'Cremona', NULL, 0),
(1890, 'IT-KR', 'IT', 'Crotone', NULL, 0),
(1891, 'IT-CN', 'IT', 'Cuneo', NULL, 0),
(1892, 'IT-EN', 'IT', 'Enna', NULL, 0),
(1893, 'IT-FM', 'IT', 'Fermo', NULL, 0),
(1894, 'IT-FE', 'IT', 'Ferrara', NULL, 0),
(1895, 'IT-FI', 'IT', 'Firenze', NULL, 0),
(1896, 'IT-FG', 'IT', 'Foggia', NULL, 0),
(1897, 'IT-FC', 'IT', 'Forlì-Cesena', NULL, 0),
(1898, 'IT-FR', 'IT', 'Frosinone', NULL, 0),
(1899, 'IT-GE', 'IT', 'Genova', NULL, 0),
(1900, 'IT-GO', 'IT', 'Gorizia', NULL, 0),
(1901, 'IT-GR', 'IT', 'Grosseto', NULL, 0),
(1902, 'IT-IM', 'IT', 'Imperia', NULL, 0),
(1903, 'IT-IS', 'IT', 'Isernia', NULL, 0),
(1904, 'IT-SP', 'IT', 'La Spezia', NULL, 0),
(1905, 'IT-AQ', 'IT', 'L\'Aquila', NULL, 0),
(1906, 'IT-LT', 'IT', 'Latina', NULL, 0),
(1907, 'IT-LE', 'IT', 'Lecce', NULL, 0),
(1908, 'IT-LC', 'IT', 'Lecco', NULL, 0),
(1909, 'IT-LI', 'IT', 'Livorno', NULL, 0),
(1910, 'IT-LO', 'IT', 'Lodi', NULL, 0),
(1911, 'IT-LU', 'IT', 'Lucca', NULL, 0),
(1912, 'IT-MC', 'IT', 'Macerata', NULL, 0),
(1913, 'IT-MN', 'IT', 'Mantova', NULL, 0),
(1914, 'IT-MS', 'IT', 'Massa-Carrara', NULL, 0),
(1915, 'IT-MT', 'IT', 'Matera', NULL, 0),
(1916, 'IT-ME', 'IT', 'Messina', NULL, 0),
(1917, 'IT-MI', 'IT', 'Milano', NULL, 0),
(1918, 'IT-MO', 'IT', 'Modena', NULL, 0),
(1919, 'IT-MB', 'IT', 'Monza e della Brianza', NULL, 0),
(1920, 'IT-NA', 'IT', 'Napoli', NULL, 0),
(1921, 'IT-NO', 'IT', 'Novara', NULL, 0),
(1922, 'IT-NU', 'IT', 'Nuoro', NULL, 0),
(1923, 'IT-OT', 'IT', 'Olbia-Tempio', NULL, 0),
(1924, 'IT-OR', 'IT', 'Oristano', NULL, 0),
(1925, 'IT-PD', 'IT', 'Padova', NULL, 0),
(1926, 'IT-PA', 'IT', 'Palermo', NULL, 0),
(1927, 'IT-PR', 'IT', 'Parma', NULL, 0),
(1928, 'IT-PV', 'IT', 'Pavia', NULL, 0),
(1929, 'IT-PG', 'IT', 'Perugia', NULL, 0),
(1930, 'IT-PU', 'IT', 'Pesaro e Urbino', NULL, 0),
(1931, 'IT-PE', 'IT', 'Pescara', NULL, 0),
(1932, 'IT-PC', 'IT', 'Piacenza', NULL, 0),
(1933, 'IT-PI', 'IT', 'Pisa', NULL, 0),
(1934, 'IT-PT', 'IT', 'Pistoia', NULL, 0),
(1935, 'IT-PN', 'IT', 'Pordenone', NULL, 0),
(1936, 'IT-PZ', 'IT', 'Potenza', NULL, 0),
(1937, 'IT-PO', 'IT', 'Prato', NULL, 0),
(1938, 'IT-RG', 'IT', 'Ragusa', NULL, 0),
(1939, 'IT-RA', 'IT', 'Ravenna', NULL, 0),
(1940, 'IT-RC', 'IT', 'Reggio Calabria', NULL, 0),
(1941, 'IT-RE', 'IT', 'Reggio Emilia', NULL, 0),
(1942, 'IT-RI', 'IT', 'Rieti', NULL, 0),
(1943, 'IT-RN', 'IT', 'Rimini', NULL, 0),
(1944, 'IT-RM', 'IT', 'Roma', NULL, 0),
(1945, 'IT-RO', 'IT', 'Rovigo', NULL, 0),
(1946, 'IT-SA', 'IT', 'Salerno', NULL, 0),
(1947, 'IT-VS', 'IT', 'Medio Campidano', NULL, 0),
(1948, 'IT-SS', 'IT', 'Sassari', NULL, 0),
(1949, 'IT-SV', 'IT', 'Savona', NULL, 0),
(1950, 'IT-SI', 'IT', 'Siena', NULL, 0),
(1951, 'IT-SR', 'IT', 'Siracusa', NULL, 0),
(1952, 'IT-SO', 'IT', 'Sondrio', NULL, 0),
(1953, 'IT-TA', 'IT', 'Taranto', NULL, 0),
(1954, 'IT-TE', 'IT', 'Teramo', NULL, 0),
(1955, 'IT-TR', 'IT', 'Terni', NULL, 0),
(1956, 'IT-TO', 'IT', 'Torino', NULL, 0),
(1957, 'IT-OG', 'IT', 'Ogliastra', NULL, 0),
(1958, 'IT-TP', 'IT', 'Trapani', NULL, 0),
(1959, 'IT-TN', 'IT', 'Trento', NULL, 0),
(1960, 'IT-TV', 'IT', 'Treviso', NULL, 0),
(1961, 'IT-TS', 'IT', 'Trieste', NULL, 0),
(1962, 'IT-UD', 'IT', 'Udine', NULL, 0),
(1963, 'IT-VA', 'IT', 'Varese', NULL, 0),
(1964, 'IT-VE', 'IT', 'Venezia', NULL, 0),
(1965, 'IT-VB', 'IT', 'Verbano-Cusio-Ossola', NULL, 0),
(1966, 'IT-VC', 'IT', 'Vercelli', NULL, 0),
(1967, 'IT-VR', 'IT', 'Verona', NULL, 0),
(1968, 'IT-VV', 'IT', 'Vibo Valentia', NULL, 0),
(1969, 'IT-VI', 'IT', 'Vicenza', NULL, 0),
(1970, 'IT-VT', 'IT', 'Viterbo', NULL, 0),
(1971, 'JM-AND', 'JM', 'Saint Andrew Parish', NULL, 0),
(1972, 'JM-ANN', 'JM', 'Saint Ann Parish', NULL, 0),
(1973, 'JM-CAT', 'JM', 'Saint Catherine Parish', NULL, 0),
(1974, 'JM-CLA', 'JM', 'Clarendon Parish', NULL, 0),
(1975, 'JM-ELI', 'JM', 'Saint Elizabeth Parish', NULL, 0),
(1976, 'JM-HAN', 'JM', 'Hanover Parish', NULL, 0),
(1977, 'JM-JAM', 'JM', 'Saint James Parish', NULL, 0),
(1978, 'JM-KIN', 'JM', 'Kingston Parish', NULL, 0),
(1979, 'JM-MAN', 'JM', 'Manchester Parish', NULL, 0),
(1980, 'JM-MAR', 'JM', 'Saint Mary Parish', NULL, 0),
(1981, 'JM-POR', 'JM', 'Portland Parish', NULL, 0),
(1982, 'JM-THO', 'JM', 'Saint Thomas Parish', NULL, 0),
(1983, 'JM-TRL', 'JM', 'Trelawny Parish', NULL, 0),
(1984, 'JM-WML', 'JM', 'Westmoreland Parish', NULL, 0),
(1985, 'JO-AJ', 'JO', 'Ajlun', NULL, 0),
(1986, 'JO-AM', 'JO', '\'Amman', NULL, 0),
(1987, 'JO-AQ', 'JO', 'Al \'Aqabah', NULL, 0),
(1988, 'JO-BA', 'JO', 'Al Balqa\'', NULL, 0),
(1989, 'JO-IR', 'JO', 'Irbid', NULL, 0),
(1990, 'JO-JA', 'JO', 'Jarash', NULL, 0),
(1991, 'JO-KA', 'JO', 'Al Karak', NULL, 0),
(1992, 'JO-MD', 'JO', 'Madaba', NULL, 0),
(1993, 'JO-MF', 'JO', 'Al Mafraq', NULL, 0),
(1994, 'JO-MN', 'JO', 'Ma\'an', NULL, 0),
(1995, 'JO-TA', 'JO', 'At Tafilah', NULL, 0),
(1996, 'JO-ZA', 'JO', 'Az Zarqa\'', NULL, 0),
(1997, 'JP-01', 'JP', 'Hokkaido', NULL, 0),
(1998, 'JP-02', 'JP', 'Aomori', NULL, 0),
(1999, 'JP-03', 'JP', 'Iwate', NULL, 0),
(2000, 'JP-04', 'JP', 'Miyagi', NULL, 0),
(2001, 'JP-05', 'JP', 'Akita', NULL, 0),
(2002, 'JP-06', 'JP', 'Yamagata', NULL, 0),
(2003, 'JP-07', 'JP', 'Hukusima (Fukushima)', NULL, 0),
(2004, 'JP-08', 'JP', 'Ibaraki', NULL, 0),
(2005, 'JP-09', 'JP', 'Totigi (Tochigi)', NULL, 0),
(2006, 'JP-10', 'JP', 'Gunma', NULL, 0),
(2007, 'JP-11', 'JP', 'Saitama', NULL, 0),
(2008, 'JP-12', 'JP', 'Tiba (Chiba)', NULL, 0),
(2009, 'JP-13', 'JP', 'Tokyo', NULL, 0),
(2010, 'JP-14', 'JP', 'Kanagawa', NULL, 0),
(2011, 'JP-15', 'JP', 'Niigata', NULL, 0),
(2012, 'JP-16', 'JP', 'Toyama', NULL, 0),
(2013, 'JP-17', 'JP', 'Isikawa (Ishikawa)', NULL, 0),
(2014, 'JP-18', 'JP', 'Hukui (Fukui)', NULL, 0),
(2015, 'JP-19', 'JP', 'Yamanasi (Yamanashi)', NULL, 0),
(2016, 'JP-20', 'JP', 'Nagano', NULL, 0),
(2017, 'JP-21', 'JP', 'Gihu  (Gifu)', NULL, 0),
(2018, 'JP-22', 'JP', 'Sizuoka (Shizuoka)', NULL, 0),
(2019, 'JP-23', 'JP', 'Aiti (Aichi)', NULL, 0),
(2020, 'JP-24', 'JP', 'Mie', NULL, 0),
(2021, 'JP-25', 'JP', 'Siga (Shiga)', NULL, 0),
(2022, 'JP-26', 'JP', 'Kyoto', NULL, 0),
(2023, 'JP-27', 'JP', 'Osaka', NULL, 0),
(2024, 'JP-28', 'JP', 'Hyogo', NULL, 0),
(2025, 'JP-29', 'JP', 'Nara', NULL, 0),
(2026, 'JP-30', 'JP', 'Wakayama', NULL, 0),
(2027, 'JP-31', 'JP', 'Tottori', NULL, 0),
(2028, 'JP-32', 'JP', 'Simane (Shimane)', NULL, 0),
(2029, 'JP-33', 'JP', 'Okayama', NULL, 0),
(2030, 'JP-34', 'JP', 'Hirosima (Hiroshima)', NULL, 0),
(2031, 'JP-35', 'JP', 'Yamaguti (Yamaguchi)', NULL, 0),
(2032, 'JP-36', 'JP', 'Tokusima (Tokushima)', NULL, 0),
(2033, 'JP-37', 'JP', 'Kagawa', NULL, 0),
(2034, 'JP-38', 'JP', 'Ehime', NULL, 0),
(2035, 'JP-39', 'JP', 'Koti (Kochi)', NULL, 0),
(2036, 'JP-40', 'JP', 'Hukuoka (Fukuoka)', NULL, 0),
(2037, 'JP-41', 'JP', 'Saga', NULL, 0),
(2038, 'JP-42', 'JP', 'Nagasaki', NULL, 0),
(2039, 'JP-43', 'JP', 'Kumamoto', NULL, 0),
(2040, 'JP-44', 'JP', 'Oita', NULL, 0),
(2041, 'JP-45', 'JP', 'Miyazaki', NULL, 0),
(2042, 'JP-46', 'JP', 'Kagosima (Kagoshima)', NULL, 0),
(2043, 'JP-47', 'JP', 'Okinawa', NULL, 0),
(2044, 'KE-CE', 'KE', 'Central', NULL, 0),
(2045, 'KE-CO', 'KE', 'Coast', NULL, 0),
(2046, 'KE-EA', 'KE', 'Eastern', NULL, 0),
(2047, 'KE-NA', 'KE', 'Nairobi Area', NULL, 0),
(2048, 'KE-NE', 'KE', 'North Eastern', NULL, 0),
(2049, 'KE-NY', 'KE', 'Nyanza', NULL, 0),
(2050, 'KE-RV', 'KE', 'Rift Valley', NULL, 0),
(2051, 'KE-WE', 'KE', 'Western', NULL, 0),
(2052, 'KG-B', 'KG', 'Batken', NULL, 0),
(2053, 'KG-C', 'KG', 'Chu', NULL, 0),
(2054, 'KG-GB', 'KG', 'Bishkek', NULL, 0),
(2055, 'KG-J', 'KG', 'Jalal-Abad', NULL, 0),
(2056, 'KG-N', 'KG', 'Naryn', NULL, 0),
(2057, 'KG-O', 'KG', 'Osh', NULL, 0),
(2058, 'KG-T', 'KG', 'Talas', NULL, 0),
(2059, 'KG-Y', 'KG', 'Ysyk-Kol', NULL, 0),
(2060, 'KH-BA', 'KH', 'Battambang', NULL, 0),
(2061, 'KH-BM', 'KH', 'Banteay Meanchey', NULL, 0),
(2062, 'KH-KB', 'KH', 'Keb', NULL, 0),
(2063, 'KH-KK', 'KH', 'Kaoh Kong', NULL, 0),
(2064, 'KH-KL', 'KH', 'Kandal', NULL, 0),
(2065, 'KH-KM', 'KH', 'Kampong Cham', NULL, 0),
(2066, 'KH-KN', 'KH', 'Kampong Chhnang', NULL, 0),
(2067, 'KH-KO', 'KH', 'Kampong Som', NULL, 0),
(2068, 'KH-KP', 'KH', 'Kampot', NULL, 0),
(2069, 'KH-KR', 'KH', 'Kratie', NULL, 0),
(2070, 'KH-KT', 'KH', 'Kampong Thom', NULL, 0),
(2071, 'KH-KU', 'KH', 'Kampong Speu', NULL, 0),
(2072, 'KH-MK', 'KH', 'Mondul Kiri', NULL, 0),
(2073, 'KH-OM', 'KH', 'Oddar Meancheay', NULL, 0),
(2074, 'KH-PA', 'KH', 'Pailin', NULL, 0),
(2075, 'KH-PG', 'KH', 'Prey Veng', NULL, 0),
(2076, 'KH-PP', 'KH', 'Phnom Penh', NULL, 0),
(2077, 'KH-PR', 'KH', 'Preah Vihear', NULL, 0),
(2078, 'KH-PS', 'KH', 'Preah Seihanu (Kompong Som or Sihanoukville)', NULL, 0),
(2079, 'KH-PU', 'KH', 'Pursat', NULL, 0),
(2080, 'KH-RK', 'KH', 'Ratanak Kiri', NULL, 0),
(2081, 'KH-SI', 'KH', 'Siemreap', NULL, 0),
(2082, 'KH-SR', 'KH', 'Svay Rieng', NULL, 0),
(2083, 'KH-ST', 'KH', 'Stung Treng', NULL, 0),
(2084, 'KH-TK', 'KH', 'Takeo', NULL, 0),
(2085, 'KI-AG', 'KI', 'Abaiang', NULL, 0),
(2086, 'KI-AK', 'KI', 'Aranuka', NULL, 0),
(2087, 'KI-AM', 'KI', 'Abemama', NULL, 0),
(2088, 'KI-AO', 'KI', 'Arorae', NULL, 0),
(2089, 'KI-BA', 'KI', 'Banaba', NULL, 0),
(2090, 'KI-BE', 'KI', 'Beru', NULL, 0),
(2091, 'KI-KA', 'KI', 'Kanton', NULL, 0),
(2092, 'KI-KR', 'KI', 'Kiritimati', NULL, 0),
(2093, 'KI-KU', 'KI', 'Kuria', NULL, 0),
(2094, 'KI-ME', 'KI', 'Marakei', NULL, 0),
(2095, 'KI-MI', 'KI', 'Maiana', NULL, 0),
(2096, 'KI-MN', 'KI', 'Makin', NULL, 0),
(2097, 'KI-NI', 'KI', 'Nikunau', NULL, 0),
(2098, 'KI-NO', 'KI', 'Nonouti', NULL, 0),
(2099, 'KI-ON', 'KI', 'Onotoa', NULL, 0),
(2100, 'KI-TE', 'KI', 'Teraina', NULL, 0),
(2101, 'KI-TM', 'KI', 'Tamana', NULL, 0),
(2102, 'KI-TR', 'KI', 'Tabuaeran', NULL, 0),
(2103, 'KI-TT', 'KI', 'Tabiteuea', NULL, 0),
(2104, 'KI-TW', 'KI', 'Tarawa', NULL, 0),
(2105, 'KI-bT', 'KI', 'Butaritari', NULL, 0),
(2106, 'KM-A', 'KM', 'Anjouan', NULL, 0),
(2107, 'KM-G', 'KM', 'Grande Comore', NULL, 0),
(2108, 'KM-M', 'KM', 'Moheli', NULL, 0),
(2109, 'KN-CAP', 'KN', 'Saint Paul Capesterre', NULL, 0),
(2110, 'KN-CCN', 'KN', 'Christ Church Nichola Town', NULL, 0),
(2111, 'KN-CHA', 'KN', 'Saint Paul Charlestown', NULL, 0),
(2112, 'KN-SAS', 'KN', 'Saint Anne Sandy Point', NULL, 0),
(2113, 'KN-SGB', 'KN', 'Saint George Basseterre', NULL, 0),
(2114, 'KN-SGG', 'KN', 'Saint George Gingerland', NULL, 0),
(2115, 'KN-SJC', 'KN', 'Saint John Capesterre', NULL, 0),
(2116, 'KN-SJF', 'KN', 'Saint John Figtree', NULL, 0),
(2117, 'KN-SJW', 'KN', 'Saint James Windward', NULL, 0),
(2118, 'KN-SMC', 'KN', 'Saint Mary Cayon', NULL, 0),
(2119, 'KN-SPB', 'KN', 'Saint Peter Basseterre', NULL, 0),
(2120, 'KN-STL', 'KN', 'Saint Thomas Lowland', NULL, 0),
(2121, 'KN-STM', 'KN', 'Saint Thomas Middle Island', NULL, 0),
(2122, 'KN-TPP', 'KN', 'Trinity Palmetto Point', NULL, 0),
(2123, 'KP-CHA', 'KP', 'Chagang-do', NULL, 0),
(2124, 'KP-HAB', 'KP', 'Hamgyong-bukto', NULL, 0),
(2125, 'KP-HAN', 'KP', 'Hamgyong-namdo', NULL, 0),
(2126, 'KP-HWB', 'KP', 'Hwanghae-bukto', NULL, 0),
(2127, 'KP-HWN', 'KP', 'Hwanghae-namdo', NULL, 0),
(2128, 'KP-KAN', 'KP', 'Kangwon-do', NULL, 0),
(2129, 'KP-NAJ', 'KP', 'Rason Directly Governed City', NULL, 0),
(2130, 'KP-PYB', 'KP', 'P\'yongan-bukto', NULL, 0),
(2131, 'KP-PYN', 'KP', 'P\'yongan-namdo', NULL, 0),
(2132, 'KP-PYO', 'KP', 'P\'yongyang Special City', NULL, 0),
(2133, 'KP-YAN', 'KP', 'Ryanggang-do (Yanggang-do)', NULL, 0),
(2134, 'KR-11', 'KR', 'Seoul Special City', NULL, 0),
(2135, 'KR-26', 'KR', 'Busan Metropolitan City', NULL, 0),
(2136, 'KR-27', 'KR', 'Daegu Metropolitan City', NULL, 0),
(2137, 'KR-28', 'KR', 'Incheon Metropolitan City', NULL, 0),
(2138, 'KR-29', 'KR', 'Gwangju Metropolitan City', NULL, 0),
(2139, 'KR-30', 'KR', 'Daejeon Metropolitan City', NULL, 0),
(2140, 'KR-31', 'KR', 'Ulsan Metropolitan City', NULL, 0),
(2141, 'KR-41', 'KR', 'Gyeonggi-do', NULL, 0),
(2142, 'KR-42', 'KR', 'Gangwon-do', NULL, 0),
(2143, 'KR-43', 'KR', 'Chungcheongbuk-do', NULL, 0),
(2144, 'KR-44', 'KR', 'Chungcheongnam-do', NULL, 0),
(2145, 'KR-45', 'KR', 'Jeollabuk-do', NULL, 0),
(2146, 'KR-46', 'KR', 'Jeollanam-do', NULL, 0),
(2147, 'KR-47', 'KR', 'Gyeongsangbuk-do', NULL, 0),
(2148, 'KR-48', 'KR', 'Gyeongsangnam-do', NULL, 0),
(2149, 'KR-49', 'KR', 'Jeju-do', NULL, 0),
(2150, 'KW-D', 'KW', 'Al Ahmadi', NULL, 0),
(2151, 'KW-F', 'KW', 'Al Farwaniyah', NULL, 0),
(2152, 'KW-H', 'KW', 'Hawalli', NULL, 0),
(2153, 'KW-J', 'KW', 'Al Jahra', NULL, 0),
(2154, 'KW-S', 'KW', 'Al Asimah', NULL, 0),
(2155, 'KY-CR', 'KY', 'Creek', NULL, 0),
(2156, 'KY-EA', 'KY', 'Eastern', NULL, 0),
(2157, 'KY-ML', 'KY', 'Midland', NULL, 0),
(2158, 'KY-SK', 'KY', 'Stake Bay', NULL, 0),
(2159, 'KY-SP', 'KY', 'Spot Bay', NULL, 0),
(2160, 'KY-ST', 'KY', 'South Town', NULL, 0),
(2161, 'KY-WD', 'KY', 'West End', NULL, 0),
(2162, 'KY-WN', 'KY', 'Western', NULL, 0),
(2163, 'KZ-AKM', 'KZ', 'Aqmola', NULL, 0),
(2164, 'KZ-AKT', 'KZ', 'Aqtobe', NULL, 0),
(2165, 'KZ-ALA', 'KZ', 'Almaty', NULL, 0),
(2166, 'KZ-ALM', 'KZ', 'Almaty', NULL, 0),
(2167, 'KZ-AST', 'KZ', 'Astana', NULL, 0),
(2168, 'KZ-ATY', 'KZ', 'Atyrau', NULL, 0),
(2169, 'KZ-KAR', 'KZ', 'Qaraghandy', NULL, 0),
(2170, 'KZ-KUS', 'KZ', 'Qustanay', NULL, 0),
(2171, 'KZ-KZY', 'KZ', 'Qyzylorda', NULL, 0),
(2172, 'KZ-MAN', 'KZ', 'Mangghystau', NULL, 0),
(2173, 'KZ-PAV', 'KZ', 'Paylodar', NULL, 0),
(2174, 'KZ-SEV', 'KZ', 'Soltustik Qazaqstan', NULL, 0),
(2175, 'KZ-VOS', 'KZ', 'Shyghys Qazaqstan', NULL, 0),
(2176, 'KZ-YUZ', 'KZ', 'Ongtustik Qazaqstan', NULL, 0),
(2177, 'KZ-ZAP', 'KZ', 'Baty Qazaqstan', NULL, 0),
(2178, 'KZ-ZHA', 'KZ', 'Zhambyl', NULL, 0),
(2179, 'LA-AT', 'LA', 'Attapu', NULL, 0),
(2180, 'LA-BK', 'LA', 'Bokeo', NULL, 0),
(2181, 'LA-BL', 'LA', 'Bolikhamxai', NULL, 0),
(2182, 'LA-CH', 'LA', 'Champasak', NULL, 0),
(2183, 'LA-HO', 'LA', 'Houaphan', NULL, 0),
(2184, 'LA-KH', 'LA', 'Khammouan', NULL, 0),
(2185, 'LA-LM', 'LA', 'Louang Namtha', NULL, 0),
(2186, 'LA-LP', 'LA', 'Louangphabang', NULL, 0),
(2187, 'LA-OU', 'LA', 'Oudomxai', NULL, 0),
(2188, 'LA-PH', 'LA', 'Phongsali', NULL, 0),
(2189, 'LA-SL', 'LA', 'Salavan', NULL, 0),
(2190, 'LA-SV', 'LA', 'Savannakhet', NULL, 0),
(2191, 'LA-VI', 'LA', 'Vientiane', NULL, 0),
(2192, 'LA-VT', 'LA', 'Vientiane', NULL, 0),
(2193, 'LA-XA', 'LA', 'Xaignabouli', NULL, 0),
(2194, 'LA-XE', 'LA', 'Xekong', NULL, 0),
(2195, 'LA-XI', 'LA', 'Xiangkhoang', NULL, 0),
(2196, 'LA-XN', 'LA', 'Xaisomboun', NULL, 0),
(2197, 'LC-AR', 'LC', 'Anse-la-Raye', NULL, 0),
(2198, 'LC-CA', 'LC', 'Castries', NULL, 0),
(2199, 'LC-CH', 'LC', 'Choiseul', NULL, 0),
(2200, 'LC-DA', 'LC', 'Dauphin', NULL, 0),
(2201, 'LC-DE', 'LC', 'Dennery', NULL, 0),
(2202, 'LC-GI', 'LC', 'Gros-Islet', NULL, 0),
(2203, 'LC-LA', 'LC', 'Laborie', NULL, 0),
(2204, 'LC-MI', 'LC', 'Micoud', NULL, 0),
(2205, 'LC-PR', 'LC', 'Praslin', NULL, 0),
(2206, 'LC-SO', 'LC', 'Soufriere', NULL, 0),
(2207, 'LC-VF', 'LC', 'Vieux-Fort', NULL, 0),
(2208, 'LI-A', 'LI', 'Schaan', NULL, 0),
(2209, 'LI-B', 'LI', 'Balzers', NULL, 0),
(2210, 'LI-E', 'LI', 'Eschen', NULL, 0),
(2211, 'LI-G', 'LI', 'Gamprin', NULL, 0),
(2212, 'LI-M', 'LI', 'Mauren', NULL, 0),
(2213, 'LI-N', 'LI', 'Triesen', NULL, 0),
(2214, 'LI-P', 'LI', 'Planken', NULL, 0),
(2215, 'LI-R', 'LI', 'Ruggell', NULL, 0),
(2216, 'LI-T', 'LI', 'Triesenberg', NULL, 0),
(2217, 'LI-V', 'LI', 'Vaduz', NULL, 0),
(2218, 'Li-L', 'LI', 'Schellenberg', NULL, 0),
(2219, 'LK-CE', 'LK', 'Central', NULL, 0),
(2220, 'LK-EA', 'LK', 'Eastern', NULL, 0),
(2221, 'LK-NC', 'LK', 'North Central', NULL, 0),
(2222, 'LK-NO', 'LK', 'Northern', NULL, 0),
(2223, 'LK-NW', 'LK', 'North Western', NULL, 0),
(2224, 'LK-SA', 'LK', 'Sabaragamuwa', NULL, 0),
(2225, 'LK-SO', 'LK', 'Southern', NULL, 0),
(2226, 'LK-UV', 'LK', 'Uva', NULL, 0),
(2227, 'LK-WE', 'LK', 'Western', NULL, 0),
(2228, 'LR-BG', 'LR', 'Bong', NULL, 0),
(2229, 'LR-BI', 'LR', 'Bomi', NULL, 0),
(2230, 'LR-CM', 'LR', 'Grand Cape Mount', NULL, 0),
(2231, 'LR-GB', 'LR', 'Grand Bassa', NULL, 0),
(2232, 'LR-GG', 'LR', 'Grand Gedeh', NULL, 0),
(2233, 'LR-GK', 'LR', 'Grand Kru', NULL, 0),
(2234, 'LR-LO', 'LR', 'Lofa', NULL, 0),
(2235, 'LR-MG', 'LR', 'Margibi', NULL, 0),
(2236, 'LR-ML', 'LR', 'Maryland', NULL, 0),
(2237, 'LR-MS', 'LR', 'Montserrado', NULL, 0),
(2238, 'LR-NB', 'LR', 'Nimba', NULL, 0),
(2239, 'LR-RC', 'LR', 'River Cess', NULL, 0),
(2240, 'LR-SN', 'LR', 'Sinoe', NULL, 0),
(2241, 'LS-BB', 'LS', 'Butha-Buthe', NULL, 0),
(2242, 'LS-BE', 'LS', 'Berea', NULL, 0),
(2243, 'LS-LE', 'LS', 'Leribe', NULL, 0),
(2244, 'LS-MF', 'LS', 'Mafeteng', NULL, 0),
(2245, 'LS-MH', 'LS', 'Mohale\'s Hoek', NULL, 0),
(2246, 'LS-MK', 'LS', 'Mokhotlong', NULL, 0),
(2247, 'LS-MS', 'LS', 'Maseru', NULL, 0),
(2248, 'LS-QN', 'LS', 'Qacha\'s Nek', NULL, 0),
(2249, 'LS-QT', 'LS', 'Quthing', NULL, 0),
(2250, 'LS-TT', 'LS', 'Thaba-Tseka', NULL, 0),
(2251, 'LT-AL', 'LT', 'Alytus', NULL, 0),
(2252, 'LT-KA', 'LT', 'Kaunas', NULL, 0),
(2253, 'LT-KL', 'LT', 'Klaipeda', NULL, 0),
(2254, 'LT-MA', 'LT', 'Marijampole', NULL, 0),
(2255, 'LT-PA', 'LT', 'Panevezys', NULL, 0),
(2256, 'LT-SI', 'LT', 'Siauliai', NULL, 0),
(2257, 'LT-TA', 'LT', 'Taurage', NULL, 0);
INSERT INTO `er_state` (`state_id`, `state`, `country`, `title`, `status`, `tag`) VALUES
(2258, 'LT-TE', 'LT', 'Telsiai', NULL, 0),
(2259, 'LT-UT', 'LT', 'Utena', NULL, 0),
(2260, 'LT-VI', 'LT', 'Vilnius', NULL, 0),
(2261, 'LU-DC', 'LU', 'Clervaux', NULL, 0),
(2262, 'LU-DD', 'LU', 'Diekirch', NULL, 0),
(2263, 'LU-DR', 'LU', 'Redange', NULL, 0),
(2264, 'LU-DV', 'LU', 'Vianden', NULL, 0),
(2265, 'LU-DW', 'LU', 'Wiltz', NULL, 0),
(2266, 'LU-GE', 'LU', 'Echternach', NULL, 0),
(2267, 'LU-GG', 'LU', 'Grevenmacher', NULL, 0),
(2268, 'LU-GR', 'LU', 'Remich', NULL, 0),
(2269, 'LU-LC', 'LU', 'Capellen', NULL, 0),
(2270, 'LU-LE', 'LU', 'Esch-sur-Alzette', NULL, 0),
(2271, 'LU-LL', 'LU', 'Luxembourg', NULL, 0),
(2272, 'LU-LM', 'LU', 'Mersch', NULL, 0),
(2273, 'LV-AIZ', 'LV', 'Aizkraukles Rajons', NULL, 0),
(2274, 'LV-ALU', 'LV', 'Aluksnes Rajons', NULL, 0),
(2275, 'LV-BAL', 'LV', 'Balvu Rajons', NULL, 0),
(2276, 'LV-BAU', 'LV', 'Bauskas Rajons', NULL, 0),
(2277, 'LV-CES', 'LV', 'Cesu Rajons', NULL, 0),
(2278, 'LV-DGR', 'LV', 'Daugavpils Rajons', NULL, 0),
(2279, 'LV-DGV', 'LV', 'Daugavpils', NULL, 0),
(2280, 'LV-DOB', 'LV', 'Dobeles Rajons', NULL, 0),
(2281, 'LV-GUL', 'LV', 'Gulbenes Rajons', NULL, 0),
(2282, 'LV-JEK', 'LV', 'Jekabpils Rajons', NULL, 0),
(2283, 'LV-JGR', 'LV', 'Jelgavas Rajons', NULL, 0),
(2284, 'LV-JGV', 'LV', 'Jelgava', NULL, 0),
(2285, 'LV-JUR', 'LV', 'Jurmala', NULL, 0),
(2286, 'LV-KRA', 'LV', 'Kraslavas Rajons', NULL, 0),
(2287, 'LV-KUL', 'LV', 'Kuldigas Rajons', NULL, 0),
(2288, 'LV-LIM', 'LV', 'Limbazu Rajons', NULL, 0),
(2289, 'LV-LPK', 'LV', 'Liepaja', NULL, 0),
(2290, 'LV-LPR', 'LV', 'Liepajas Rajons', NULL, 0),
(2291, 'LV-LUD', 'LV', 'Ludzas Rajons', NULL, 0),
(2292, 'LV-MAD', 'LV', 'Madonas Rajons', NULL, 0),
(2293, 'LV-OGR', 'LV', 'Ogres Rajons', NULL, 0),
(2294, 'LV-PRE', 'LV', 'Preilu Rajons', NULL, 0),
(2295, 'LV-RGA', 'LV', 'Riga', NULL, 0),
(2296, 'LV-RGR', 'LV', 'Rigas Rajons', NULL, 0),
(2297, 'LV-RZK', 'LV', 'Rezekne', NULL, 0),
(2298, 'LV-RZR', 'LV', 'Rezeknes Rajons', NULL, 0),
(2299, 'LV-SAL', 'LV', 'Saldus Rajons', NULL, 0),
(2300, 'LV-TAL', 'LV', 'Talsu Rajons', NULL, 0),
(2301, 'LV-TUK', 'LV', 'Tukuma Rajons', NULL, 0),
(2302, 'LV-VLK', 'LV', 'Valkas Rajons', NULL, 0),
(2303, 'LV-VLM', 'LV', 'Valmieras Rajons', NULL, 0),
(2304, 'LV-VSL', 'LV', 'Ventspils', NULL, 0),
(2305, 'LV-VSR', 'LV', 'Ventspils Rajons', NULL, 0),
(2306, 'LY-AJ', 'LY', 'Ajdabiya', NULL, 0),
(2307, 'LY-AS', 'LY', 'Ash Shati\'', NULL, 0),
(2308, 'LY-AW', 'LY', 'Awbari', NULL, 0),
(2309, 'LY-AZ', 'LY', 'Al \'Aziziyah', NULL, 0),
(2310, 'LY-BA', 'LY', 'Banghazi', NULL, 0),
(2311, 'LY-DA', 'LY', 'Darnah', NULL, 0),
(2312, 'LY-FA', 'LY', 'Al Fatih', NULL, 0),
(2313, 'LY-GD', 'LY', 'Ghadamis', NULL, 0),
(2314, 'LY-GY', 'LY', 'Gharyan', NULL, 0),
(2315, 'LY-JA', 'LY', 'Al Jabal al Akhdar', NULL, 0),
(2316, 'LY-JU', 'LY', 'Al Jufrah', NULL, 0),
(2317, 'LY-KH', 'LY', 'Al Khums', NULL, 0),
(2318, 'LY-KU', 'LY', 'Al Kufrah', NULL, 0),
(2319, 'LY-MI', 'LY', 'Misratah', NULL, 0),
(2320, 'LY-MZ', 'LY', 'Murzuq', NULL, 0),
(2321, 'LY-NK', 'LY', 'An Nuqat al Khams', NULL, 0),
(2322, 'LY-SB', 'LY', 'Sabha', NULL, 0),
(2323, 'LY-SU', 'LY', 'Surt', NULL, 0),
(2324, 'LY-SW', 'LY', 'Sawfajjin', NULL, 0),
(2325, 'LY-TH', 'LY', 'Tarhunah', NULL, 0),
(2326, 'LY-TL', 'LY', 'Tarabulus (Tripoli)', NULL, 0),
(2327, 'LY-TU', 'LY', 'Tubruq', NULL, 0),
(2328, 'LY-YA', 'LY', 'Yafran', NULL, 0),
(2329, 'LY-ZA', 'LY', 'Az Zawiyah', NULL, 0),
(2330, 'LY-ZL', 'LY', 'Zlitan', NULL, 0),
(2331, 'MA-ADK', 'MA', 'Ad Dakhla', NULL, 0),
(2332, 'MA-AGD', 'MA', 'Agadir', NULL, 0),
(2333, 'MA-AZI', 'MA', 'Azilal', NULL, 0),
(2334, 'MA-BJD', 'MA', 'Boujdour', NULL, 0),
(2335, 'MA-BLM', 'MA', 'Boulemane', NULL, 0),
(2336, 'MA-BME', 'MA', 'Beni Mellal', NULL, 0),
(2337, 'MA-BSL', 'MA', 'Ben Slimane', NULL, 0),
(2338, 'MA-CBL', 'MA', 'Casablanca', NULL, 0),
(2339, 'MA-CHA', 'MA', 'Chaouen', NULL, 0),
(2340, 'MA-EJA', 'MA', 'El Jadida', NULL, 0),
(2341, 'MA-EKS', 'MA', 'El Kelaa des Sraghna', NULL, 0),
(2342, 'MA-ERA', 'MA', 'Er Rachidia', NULL, 0),
(2343, 'MA-ESM', 'MA', 'Es Smara', NULL, 0),
(2344, 'MA-ESS', 'MA', 'Essaouira', NULL, 0),
(2345, 'MA-FES', 'MA', 'Fes', NULL, 0),
(2346, 'MA-FIG', 'MA', 'Figuig', NULL, 0),
(2347, 'MA-GLM', 'MA', 'Guelmim', NULL, 0),
(2348, 'MA-HOC', 'MA', 'Al Hoceima', NULL, 0),
(2349, 'MA-IFR', 'MA', 'Ifrane', NULL, 0),
(2350, 'MA-KEN', 'MA', 'Kenitra', NULL, 0),
(2351, 'MA-KHM', 'MA', 'Khemisset', NULL, 0),
(2352, 'MA-KHN', 'MA', 'Khenifra', NULL, 0),
(2353, 'MA-KHO', 'MA', 'Khouribga', NULL, 0),
(2354, 'MA-LAR', 'MA', 'Larache', NULL, 0),
(2355, 'MA-LYN', 'MA', 'Laayoune', NULL, 0),
(2356, 'MA-MKN', 'MA', 'Meknes', NULL, 0),
(2357, 'MA-MRK', 'MA', 'Marrakech', NULL, 0),
(2358, 'MA-NAD', 'MA', 'Nador', NULL, 0),
(2359, 'MA-ORZ', 'MA', 'Ouarzazate', NULL, 0),
(2360, 'MA-OUJ', 'MA', 'Oujda', NULL, 0),
(2361, 'MA-RSA', 'MA', 'Rabat-Sale', NULL, 0),
(2362, 'MA-SAF', 'MA', 'Safi', NULL, 0),
(2363, 'MA-SET', 'MA', 'Settat', NULL, 0),
(2364, 'MA-SKA', 'MA', 'Sidi Kacem', NULL, 0),
(2365, 'MA-TAN', 'MA', 'Tan-Tan', NULL, 0),
(2366, 'MA-TAO', 'MA', 'Taounate', NULL, 0),
(2367, 'MA-TAT', 'MA', 'Tata', NULL, 0),
(2368, 'MA-TAZ', 'MA', 'Taza', NULL, 0),
(2369, 'MA-TET', 'MA', 'Tetouan', NULL, 0),
(2370, 'MA-TGR', 'MA', 'Tangier', NULL, 0),
(2371, 'MA-TIZ', 'MA', 'Tiznit', NULL, 0),
(2372, 'MA-TRD', 'MA', 'Taroudannt', NULL, 0),
(2373, 'MC-FV', 'MC', 'Fontvieille', NULL, 0),
(2374, 'MC-LC', 'MC', 'La Condamine', NULL, 0),
(2375, 'MC-MC', 'MC', 'Monte-Carlo', NULL, 0),
(2376, 'MC-MV', 'MC', 'Monaco-Ville', NULL, 0),
(2377, 'MD-BA', 'MD', 'Balti', NULL, 0),
(2378, 'MD-CA', 'MD', 'Cahul', NULL, 0),
(2379, 'MD-CU', 'MD', 'Chisinau', NULL, 0),
(2380, 'MD-ED', 'MD', 'Edinet', NULL, 0),
(2381, 'MD-GA', 'MD', 'Gagauzia', NULL, 0),
(2382, 'MD-LA', 'MD', 'Lapusna', NULL, 0),
(2383, 'MD-OR', 'MD', 'Orhei', NULL, 0),
(2384, 'MD-SN', 'MD', 'StO?a Nistrului', NULL, 0),
(2385, 'MD-SO', 'MD', 'Soroca', NULL, 0),
(2386, 'MD-TI', 'MD', 'Tighina', NULL, 0),
(2387, 'MD-UN', 'MD', 'Ungheni', NULL, 0),
(2388, 'ME-01', 'ME', 'Andrijevica', NULL, 0),
(2389, 'ME-02', 'ME', 'Bar', NULL, 0),
(2390, 'ME-03', 'ME', 'Berane', NULL, 0),
(2391, 'ME-04', 'ME', 'Bijelo Polje', NULL, 0),
(2392, 'ME-05', 'ME', 'Budva', NULL, 0),
(2393, 'ME-06', 'ME', 'Cetinje', NULL, 0),
(2394, 'ME-07', 'ME', 'Danilovgrad', NULL, 0),
(2395, 'ME-08', 'ME', 'Herceg-Novi', NULL, 0),
(2396, 'ME-09', 'ME', 'Kolašin', NULL, 0),
(2397, 'ME-10', 'ME', 'Kotor', NULL, 0),
(2398, 'ME-11', 'ME', 'Mojkovac', NULL, 0),
(2399, 'ME-12', 'ME', 'Nikšic', NULL, 0),
(2400, 'ME-13', 'ME', 'Plav', NULL, 0),
(2401, 'ME-14', 'ME', 'Pljevlja', NULL, 0),
(2402, 'ME-15', 'ME', 'Plužine', NULL, 0),
(2403, 'ME-16', 'ME', 'Podgorica', NULL, 0),
(2404, 'ME-17', 'ME', 'Rožaje', NULL, 0),
(2405, 'ME-19', 'ME', 'Tivat', NULL, 0),
(2406, 'ME-20', 'ME', 'Ulcinj', NULL, 0),
(2407, 'ME-18', 'ME', 'Šavnik', NULL, 0),
(2408, 'ME-21', 'ME', 'Žabljak', NULL, 0),
(2409, 'MG-AN', 'MG', 'Antananarivo province', NULL, 0),
(2410, 'MG-AS', 'MG', 'Antsiranana province', NULL, 0),
(2411, 'MG-FN', 'MG', 'Fianarantsoa province', NULL, 0),
(2412, 'MG-MJ', 'MG', 'Mahajanga province', NULL, 0),
(2413, 'MG-TL', 'MG', 'Toliara province', NULL, 0),
(2414, 'MG-TM', 'MG', 'Toamasina province', NULL, 0),
(2415, 'MH-ALG', 'MH', 'Ailinginae', NULL, 0),
(2416, 'MH-ALK', 'MH', 'Ailuk', NULL, 0),
(2417, 'MH-ALL', 'MH', 'Ailinglaplap', NULL, 0),
(2418, 'MH-ARN', 'MH', 'Arno', NULL, 0),
(2419, 'MH-AUR', 'MH', 'Aur', NULL, 0),
(2420, 'MH-BKK', 'MH', 'Bokak', NULL, 0),
(2421, 'MH-BKN', 'MH', 'Bikini', NULL, 0),
(2422, 'MH-BKR', 'MH', 'Bikar', NULL, 0),
(2423, 'MH-EBN', 'MH', 'Ebon', NULL, 0),
(2424, 'MH-EKB', 'MH', 'Erikub', NULL, 0),
(2425, 'MH-ENT', 'MH', 'Enewetak', NULL, 0),
(2426, 'MH-JBT', 'MH', 'Jabat', NULL, 0),
(2427, 'MH-JEM', 'MH', 'Jemo', NULL, 0),
(2428, 'MH-JLT', 'MH', 'Jaluit', NULL, 0),
(2429, 'MH-KIL', 'MH', 'Kili', NULL, 0),
(2430, 'MH-KWJ', 'MH', 'Kwajalein', NULL, 0),
(2431, 'MH-LAE', 'MH', 'Lae', NULL, 0),
(2432, 'MH-LIB', 'MH', 'Lib', NULL, 0),
(2433, 'MH-LKP', 'MH', 'Likiep', NULL, 0),
(2434, 'MH-MIL', 'MH', 'Mili', NULL, 0),
(2435, 'MH-MJR', 'MH', 'Majuro', NULL, 0),
(2436, 'MH-MJT', 'MH', 'Mejit', NULL, 0),
(2437, 'MH-MLP', 'MH', 'Maloelap', NULL, 0),
(2438, 'MH-NAM', 'MH', 'Namu', NULL, 0),
(2439, 'MH-NMK', 'MH', 'Namorik', NULL, 0),
(2440, 'MH-RGK', 'MH', 'Rongrik', NULL, 0),
(2441, 'MH-RGL', 'MH', 'Rongelap', NULL, 0),
(2442, 'MH-TOK', 'MH', 'Toke', NULL, 0),
(2443, 'MH-UJA', 'MH', 'Ujae', NULL, 0),
(2444, 'MH-UJL', 'MH', 'Ujelang', NULL, 0),
(2445, 'MH-UTK', 'MH', 'Utirik', NULL, 0),
(2446, 'MH-WTH', 'MH', 'Wotho', NULL, 0),
(2447, 'MH-WTJ', 'MH', 'Wotje', NULL, 0),
(2448, 'ML-CD', 'ML', 'Bamako Capital District', NULL, 0),
(2449, 'ML-GA', 'ML', 'Gao', NULL, 0),
(2450, 'ML-KD', 'ML', 'Kidal', NULL, 0),
(2451, 'ML-KL', 'ML', 'Koulikoro', NULL, 0),
(2452, 'ML-KY', 'ML', 'Kayes', NULL, 0),
(2453, 'ML-MP', 'ML', 'Mopti', NULL, 0),
(2454, 'ML-SG', 'ML', 'Segou', NULL, 0),
(2455, 'ML-SK', 'ML', 'Sikasso', NULL, 0),
(2456, 'ML-TB', 'ML', 'Tombouctou', NULL, 0),
(2457, 'MM-AY', 'MM', 'Ayeyarwady', NULL, 0),
(2458, 'MM-BG', 'MM', 'Bago', NULL, 0),
(2459, 'MM-CH', 'MM', 'Chin State', NULL, 0),
(2460, 'MM-KC', 'MM', 'Kachin State', NULL, 0),
(2461, 'MM-KH', 'MM', 'Kayah State', NULL, 0),
(2462, 'MM-KN', 'MM', 'Kayin State', NULL, 0),
(2463, 'MM-MD', 'MM', 'Mandalay', NULL, 0),
(2464, 'MM-MG', 'MM', 'Magway', NULL, 0),
(2465, 'MM-MN', 'MM', 'Mon State', NULL, 0),
(2466, 'MM-RK', 'MM', 'Rakhine State', NULL, 0),
(2467, 'MM-SG', 'MM', 'Sagaing', NULL, 0),
(2468, 'MM-SH', 'MM', 'Shan State', NULL, 0),
(2469, 'MM-TN', 'MM', 'Tanintharyi', NULL, 0),
(2470, 'MM-YG', 'MM', 'Yangon', NULL, 0),
(2471, 'MN-035', 'MN', 'Orhon', NULL, 0),
(2472, 'MN-037', 'MN', 'Darhan uul', NULL, 0),
(2473, 'MN-039', 'MN', 'Hentiy', NULL, 0),
(2474, 'MN-041', 'MN', 'Hovsgol', NULL, 0),
(2475, 'MN-043', 'MN', 'Hovd', NULL, 0),
(2476, 'MN-046', 'MN', 'Uvs', NULL, 0),
(2477, 'MN-047', 'MN', 'Tov', NULL, 0),
(2478, 'MN-049', 'MN', 'Selenge', NULL, 0),
(2479, 'MN-051', 'MN', 'Suhbaatar', NULL, 0),
(2480, 'MN-053', 'MN', 'Omnogovi', NULL, 0),
(2481, 'MN-055', 'MN', 'Ovorhangay', NULL, 0),
(2482, 'MN-057', 'MN', 'Dzavhan', NULL, 0),
(2483, 'MN-059', 'MN', 'DundgovL', NULL, 0),
(2484, 'MN-061', 'MN', 'Dornod', NULL, 0),
(2485, 'MN-063', 'MN', 'Dornogov', NULL, 0),
(2486, 'MN-064', 'MN', 'Govi-Sumber', NULL, 0),
(2487, 'MN-065', 'MN', 'Govi-Altay', NULL, 0),
(2488, 'MN-067', 'MN', 'Bulgan', NULL, 0),
(2489, 'MN-069', 'MN', 'Bayanhongor', NULL, 0),
(2490, 'MN-071', 'MN', 'Bayan-Olgiy', NULL, 0),
(2491, 'MN-073', 'MN', 'Arhangay', NULL, 0),
(2492, 'MN-1', 'MN', 'Ulanbaatar', NULL, 0),
(2493, 'MO-ANT', 'MO', 'St. Anthony Parish', NULL, 0),
(2494, 'MO-CAT', 'MO', 'Cathedral Parish', NULL, 0),
(2495, 'MO-LAW', 'MO', 'St. Lawrence Parish', NULL, 0),
(2496, 'MO-LAZ', 'MO', 'St. Lazarus Parish', NULL, 0),
(2497, 'MO-OLF', 'MO', 'Our Lady Fatima Parish', NULL, 0),
(2498, 'MP-N', 'MP', 'Northern Islands', NULL, 0),
(2499, 'MP-R', 'MP', 'Rota', NULL, 0),
(2500, 'MP-S', 'MP', 'Saipan', NULL, 0),
(2501, 'MP-T', 'MP', 'Tinian', NULL, 0),
(2502, 'MR-AD', 'MR', 'Adrar', NULL, 0),
(2503, 'MR-AS', 'MR', 'Assaba', NULL, 0),
(2504, 'MR-BR', 'MR', 'Brakna', NULL, 0),
(2505, 'MR-DN', 'MR', 'Dakhlet Nouadhibou', NULL, 0),
(2506, 'MR-GM', 'MR', 'Guidimaka', NULL, 0),
(2507, 'MR-GO', 'MR', 'Gorgol', NULL, 0),
(2508, 'MR-HC', 'MR', 'Hodh Ech Chargui', NULL, 0),
(2509, 'MR-HG', 'MR', 'Hodh El Gharbi', NULL, 0),
(2510, 'MR-IN', 'MR', 'Inchiri', NULL, 0),
(2511, 'MR-NO', 'MR', 'Nouakchott', NULL, 0),
(2512, 'MR-TA', 'MR', 'Tagant', NULL, 0),
(2513, 'MR-TR', 'MR', 'Trarza', NULL, 0),
(2514, 'MR-TZ', 'MR', 'Tiris Zemmour', NULL, 0),
(2515, 'MS-A', 'MS', 'Saint Anthony', NULL, 0),
(2516, 'MS-G', 'MS', 'Saint Georges', NULL, 0),
(2517, 'MS-P', 'MS', 'Saint Peter', NULL, 0),
(2518, 'MT-ATT', 'MT', 'Attard', NULL, 0),
(2519, 'MT-BAL', 'MT', 'Balzan', NULL, 0),
(2520, 'MT-BGU', 'MT', 'Birgu', NULL, 0),
(2521, 'MT-BKK', 'MT', 'Birkirkara', NULL, 0),
(2522, 'MT-BOR', 'MT', 'Bormla', NULL, 0),
(2523, 'MT-BRZ', 'MT', 'Birzebbuga', NULL, 0),
(2524, 'MT-DIN', 'MT', 'Dingli', NULL, 0),
(2525, 'MT-FGU', 'MT', 'Fgura', NULL, 0),
(2526, 'MT-FLO', 'MT', 'Floriana', NULL, 0),
(2527, 'MT-FNT', 'MT', 'Fontana', NULL, 0),
(2528, 'MT-GDJ', 'MT', 'Gudja', NULL, 0),
(2529, 'MT-GHJ', 'MT', 'Ghajnsielem', NULL, 0),
(2530, 'MT-GHR', 'MT', 'Gharb', NULL, 0),
(2531, 'MT-GHS', 'MT', 'Ghasri', NULL, 0),
(2532, 'MT-GRG', 'MT', 'Gargur', NULL, 0),
(2533, 'MT-GXQ', 'MT', 'Gaxaq', NULL, 0),
(2534, 'MT-GZR', 'MT', 'Gzira', NULL, 0),
(2535, 'MT-HMR', 'MT', 'Hamrun', NULL, 0),
(2536, 'MT-IKL', 'MT', 'Iklin', NULL, 0),
(2537, 'MT-ISL', 'MT', 'Isla', NULL, 0),
(2538, 'MT-KLK', 'MT', 'Kalkara', NULL, 0),
(2539, 'MT-KRC', 'MT', 'Kercem', NULL, 0),
(2540, 'MT-KRK', 'MT', 'Kirkop', NULL, 0),
(2541, 'MT-LIJ', 'MT', 'Lija', NULL, 0),
(2542, 'MT-LUQ', 'MT', 'Luqa', NULL, 0),
(2543, 'MT-MDN', 'MT', 'Mdina', NULL, 0),
(2544, 'MT-MEL', 'MT', 'Melliea', NULL, 0),
(2545, 'MT-MGR', 'MT', 'Mgarr', NULL, 0),
(2546, 'MT-MKL', 'MT', 'Marsaskala', NULL, 0),
(2547, 'MT-MQA', 'MT', 'Mqabba', NULL, 0),
(2548, 'MT-MRS', 'MT', 'Marsa', NULL, 0),
(2549, 'MT-MSI', 'MT', 'Msida', NULL, 0),
(2550, 'MT-MST', 'MT', 'Mosta', NULL, 0),
(2551, 'MT-MTF', 'MT', 'Mtarfa', NULL, 0),
(2552, 'MT-MUN', 'MT', 'Munxar', NULL, 0),
(2553, 'MT-MXL', 'MT', 'Marsaxlokk', NULL, 0),
(2554, 'MT-NAD', 'MT', 'Nadur', NULL, 0),
(2555, 'MT-NAX', 'MT', 'Naxxar', NULL, 0),
(2556, 'MT-PAO', 'MT', 'Paola', NULL, 0),
(2557, 'MT-PEM', 'MT', 'Pembroke', NULL, 0),
(2558, 'MT-PIE', 'MT', 'Pieta', NULL, 0),
(2559, 'MT-QAL', 'MT', 'Qala', NULL, 0),
(2560, 'MT-QOR', 'MT', 'Qormi', NULL, 0),
(2561, 'MT-QRE', 'MT', 'Qrendi', NULL, 0),
(2562, 'MT-RAB', 'MT', 'Rabat', NULL, 0),
(2563, 'MT-SAF', 'MT', 'Safi', NULL, 0),
(2564, 'MT-SGI', 'MT', 'San Giljan', NULL, 0),
(2565, 'MT-SGW', 'MT', 'San Gwann', NULL, 0),
(2566, 'MT-SIG', 'MT', 'Siggiewi', NULL, 0),
(2567, 'MT-SLA', 'MT', 'San Lawrenz', NULL, 0),
(2568, 'MT-SLM', 'MT', 'Sliema', NULL, 0),
(2569, 'MT-SLU', 'MT', 'Santa Lucija', NULL, 0),
(2570, 'MT-SNT', 'MT', 'Sannat', NULL, 0),
(2571, 'MT-SPB', 'MT', 'San Pawl il-Bahar', NULL, 0),
(2572, 'MT-SVE', 'MT', 'Santa Venera', NULL, 0),
(2573, 'MT-SWQ', 'MT', 'Swieqi', NULL, 0),
(2574, 'MT-TRX', 'MT', 'Tarxien', NULL, 0),
(2575, 'MT-TXB', 'MT', 'Ta Xbiex', NULL, 0),
(2576, 'MT-VIC', 'MT', 'Victoria', NULL, 0),
(2577, 'MT-VLT', 'MT', 'Valletta', NULL, 0),
(2578, 'MT-XEW', 'MT', 'Xewkija', NULL, 0),
(2579, 'MT-XGJ', 'MT', 'Xgajra', NULL, 0),
(2580, 'MT-ZAG', 'MT', 'Xagra', NULL, 0),
(2581, 'MT-ZBG', 'MT', 'Zebbug', NULL, 0),
(2582, 'MT-ZBR', 'MT', 'Zabbar', NULL, 0),
(2583, 'MT-ZEB', 'MT', 'Zebbug', NULL, 0),
(2584, 'MT-ZJT', 'MT', 'Zejtun', NULL, 0),
(2585, 'MT-ZRQ', 'MT', 'Zurrieq', NULL, 0),
(2586, 'MU-AG', 'MU', 'Agalega Islands', NULL, 0),
(2587, 'MU-BL', 'MU', 'Black River', NULL, 0),
(2588, 'MU-BR', 'MU', 'Beau Bassin-Rose Hill', NULL, 0),
(2589, 'MU-CC', 'MU', 'Cargados Carajos Shoals (Saint Brandon Islands)', NULL, 0),
(2590, 'MU-CU', 'MU', 'Curepipe', NULL, 0),
(2591, 'MU-FL', 'MU', 'Flacq', NULL, 0),
(2592, 'MU-GP', 'MU', 'Grand Port', NULL, 0),
(2593, 'MU-MO', 'MU', 'Moka', NULL, 0),
(2594, 'MU-PA', 'MU', 'Pamplemousses', NULL, 0),
(2595, 'MU-PL', 'MU', 'Port Louis', NULL, 0),
(2596, 'MU-PU', 'MU', 'Port Louis', NULL, 0),
(2597, 'MU-PW', 'MU', 'Plaines Wilhems', NULL, 0),
(2598, 'MU-QB', 'MU', 'Quatre Bornes', NULL, 0),
(2599, 'MU-RO', 'MU', 'Rodrigues', NULL, 0),
(2600, 'MU-RR', 'MU', 'Riviere du Rempart', NULL, 0),
(2601, 'MU-SA', 'MU', 'Savanne', NULL, 0),
(2602, 'MU-VP', 'MU', 'Vacoas-Phoenix', NULL, 0),
(2603, 'MV-AAD', 'MV', 'Ari Atoll Dheknu', NULL, 0),
(2604, 'MV-AAU', 'MV', 'Ari Atoll Uthuru', NULL, 0),
(2605, 'MV-ADD', 'MV', 'Addu', NULL, 0),
(2606, 'MV-FAA', 'MV', 'Faadhippolhu', NULL, 0),
(2607, 'MV-FEA', 'MV', 'Felidhe Atoll', NULL, 0),
(2608, 'MV-FMU', 'MV', 'Fua Mulaku', NULL, 0),
(2609, 'MV-HAD', 'MV', 'Huvadhu Atoll Dhekunu', NULL, 0),
(2610, 'MV-HAU', 'MV', 'Huvadhu Atoll Uthuru', NULL, 0),
(2611, 'MV-HDH', 'MV', 'Hadhdhunmathi', NULL, 0),
(2612, 'MV-KLH', 'MV', 'Kolhumadulu', NULL, 0),
(2613, 'MV-MAA', 'MV', 'Male Atoll', NULL, 0),
(2614, 'MV-MAD', 'MV', 'Maalhosmadulu Dhekunu', NULL, 0),
(2615, 'MV-MAU', 'MV', 'Maalhosmadulu Uthuru', NULL, 0),
(2616, 'MV-MLD', 'MV', 'Miladhunmadulu Dhekunu', NULL, 0),
(2617, 'MV-MLU', 'MV', 'Miladhunmadulu Uthuru', NULL, 0),
(2618, 'MV-MUA', 'MV', 'Mulaku Atoll', NULL, 0),
(2619, 'MV-NAD', 'MV', 'Nilandhe Atoll Dhekunu', NULL, 0),
(2620, 'MV-NAU', 'MV', 'Nilandhe Atoll Uthuru', NULL, 0),
(2621, 'MV-THD', 'MV', 'Thiladhunmathi Dhekunu', NULL, 0),
(2622, 'MV-THU', 'MV', 'Thiladhunmathi Uthuru', NULL, 0),
(2623, 'MW-BLK', 'MW', 'Balaka', NULL, 0),
(2624, 'MW-BLT', 'MW', 'Blantyre', NULL, 0),
(2625, 'MW-CKW', 'MW', 'Chikwawa', NULL, 0),
(2626, 'MW-CRD', 'MW', 'Chiradzulu', NULL, 0),
(2627, 'MW-CTP', 'MW', 'Chitipa', NULL, 0),
(2628, 'MW-DDZ', 'MW', 'Dedza', NULL, 0),
(2629, 'MW-DWA', 'MW', 'Dowa', NULL, 0),
(2630, 'MW-KRG', 'MW', 'Karonga', NULL, 0),
(2631, 'MW-KSG', 'MW', 'Kasungu', NULL, 0),
(2632, 'MW-LKM', 'MW', 'Likoma', NULL, 0),
(2633, 'MW-LLG', 'MW', 'Lilongwe', NULL, 0),
(2634, 'MW-MCG', 'MW', 'Machinga', NULL, 0),
(2635, 'MW-MCH', 'MW', 'Mchinji', NULL, 0),
(2636, 'MW-MGC', 'MW', 'Mangochi', NULL, 0),
(2637, 'MW-MLJ', 'MW', 'Mulanje', NULL, 0),
(2638, 'MW-MWZ', 'MW', 'Mwanza', NULL, 0),
(2639, 'MW-MZM', 'MW', 'Mzimba', NULL, 0),
(2640, 'MW-NKB', 'MW', 'Nkhata Bay', NULL, 0),
(2641, 'MW-NKH', 'MW', 'Nkhotakota', NULL, 0),
(2642, 'MW-NSJ', 'MW', 'Nsanje', NULL, 0),
(2643, 'MW-NTI', 'MW', 'Ntchisi', NULL, 0),
(2644, 'MW-NTU', 'MW', 'Ntcheu', NULL, 0),
(2645, 'MW-PHL', 'MW', 'Phalombe', NULL, 0),
(2646, 'MW-RMP', 'MW', 'Rumphi', NULL, 0),
(2647, 'MW-SLM', 'MW', 'Salima', NULL, 0),
(2648, 'MW-THY', 'MW', 'Thyolo', NULL, 0),
(2649, 'MW-ZBA', 'MW', 'Zomba', NULL, 0),
(2650, 'MX-AGU', 'MX', 'Aguascalientes', NULL, 0),
(2651, 'MX-BCN', 'MX', 'Baja California', NULL, 0),
(2652, 'MX-BCS', 'MX', 'Baja California Sur', NULL, 0),
(2653, 'MX-CAM', 'MX', 'Campeche', NULL, 0),
(2654, 'MX-CHH', 'MX', 'Chihuahua', NULL, 0),
(2655, 'MX-CHP', 'MX', 'Chiapas', NULL, 0),
(2656, 'MX-COA', 'MX', 'Coahuila', NULL, 0),
(2657, 'MX-COL', 'MX', 'Colima', NULL, 0),
(2658, 'MX-DIF', 'MX', 'Distrito Federal', NULL, 0),
(2659, 'MX-DUR', 'MX', 'Durango', NULL, 0),
(2660, 'MX-GRO', 'MX', 'Guerrero', NULL, 0),
(2661, 'MX-GUA', 'MX', 'Guanajuato', NULL, 0),
(2662, 'MX-HID', 'MX', 'Hidalgo', NULL, 0),
(2663, 'MX-JAL', 'MX', 'Jalisco', NULL, 0),
(2664, 'MX-MEX', 'MX', 'Mexico', NULL, 0),
(2665, 'MX-MIC', 'MX', 'Michoacan', NULL, 0),
(2666, 'MX-MOR', 'MX', 'Morelos', NULL, 0),
(2667, 'MX-NAY', 'MX', 'Nayarit', NULL, 0),
(2668, 'MX-NLE', 'MX', 'Nuevo Leon', NULL, 0),
(2669, 'MX-OAX', 'MX', 'Oaxaca', NULL, 0),
(2670, 'MX-PUE', 'MX', 'Puebla', NULL, 0),
(2671, 'MX-QUE', 'MX', 'Queretaro', NULL, 0),
(2672, 'MX-ROO', 'MX', 'Quintana Roo', NULL, 0),
(2673, 'MX-SIN', 'MX', 'Sinaloa', NULL, 0),
(2674, 'MX-SLP', 'MX', 'San Luis Potosi', NULL, 0),
(2675, 'MX-SON', 'MX', 'Sonora', NULL, 0),
(2676, 'MX-TAB', 'MX', 'Tabasco', NULL, 0),
(2677, 'MX-TAM', 'MX', 'Tamaulipas', NULL, 0),
(2678, 'MX-TLA', 'MX', 'Tlaxcala', NULL, 0),
(2679, 'MX-VER', 'MX', 'Veracruz', NULL, 0),
(2680, 'MX-YUC', 'MX', 'Yucatan', NULL, 0),
(2681, 'MX-ZAC', 'MX', 'Zacatecas', NULL, 0),
(2682, 'MY-JH', 'MY', 'Johor', NULL, 0),
(2683, 'MY-KD', 'MY', 'Kedah', NULL, 0),
(2684, 'MY-KL', 'MY', 'Kuala Lumpur', NULL, 0),
(2685, 'MY-KN', 'MY', 'Kelantan', NULL, 0),
(2686, 'MY-LB', 'MY', 'Labuan', NULL, 0),
(2687, 'MY-ML', 'MY', 'Malacca', NULL, 0),
(2688, 'MY-NS', 'MY', 'Negeri Sembilan', NULL, 0),
(2689, 'MY-PG', 'MY', 'Pulau Pinang', NULL, 0),
(2690, 'MY-PH', 'MY', 'Pahang', NULL, 0),
(2691, 'MY-PK', 'MY', 'Perak', NULL, 0),
(2692, 'MY-PS', 'MY', 'Perlis', NULL, 0),
(2693, 'MY-PJ', 'MY', 'Putra Jaya', NULL, 0),
(2694, 'MY-SB', 'MY', 'Sabah', NULL, 0),
(2695, 'MY-SL', 'MY', 'Selangor', NULL, 0),
(2696, 'MY-SR', 'MY', 'Sarawak', NULL, 0),
(2697, 'MY-TR', 'MY', 'Terengganu', NULL, 0),
(2698, 'MY-WP', 'MY', 'Wilayah Persekutuan', NULL, 0),
(2699, 'MZ-CD', 'MZ', 'Cabo Delgado', NULL, 0),
(2700, 'MZ-GZ', 'MZ', 'Gaza', NULL, 0),
(2701, 'MZ-IN', 'MZ', 'Inhambane', NULL, 0),
(2702, 'MZ-MC', 'MZ', 'Maputo (city)', NULL, 0),
(2703, 'MZ-MN', 'MZ', 'Manica', NULL, 0),
(2704, 'MZ-MP', 'MZ', 'Maputo', NULL, 0),
(2705, 'MZ-NA', 'MZ', 'Nampula', NULL, 0),
(2706, 'MZ-NI', 'MZ', 'Niassa', NULL, 0),
(2707, 'MZ-SO', 'MZ', 'Sofala', NULL, 0),
(2708, 'MZ-TE', 'MZ', 'Tete', NULL, 0),
(2709, 'MZ-ZA', 'MZ', 'Zambezia', NULL, 0),
(2710, 'NA-CA', 'NA', 'Caprivi', NULL, 0),
(2711, 'NA-ER', 'NA', 'Erongo', NULL, 0),
(2712, 'NA-HA', 'NA', 'Hardap', NULL, 0),
(2713, 'NA-KH', 'NA', 'Khomas', NULL, 0),
(2714, 'NA-KR', 'NA', 'Karas', NULL, 0),
(2715, 'NA-KU', 'NA', 'Kunene', NULL, 0),
(2716, 'NA-KV', 'NA', 'Kavango', NULL, 0),
(2717, 'NA-OJ', 'NA', 'Otjozondjupa', NULL, 0),
(2718, 'NA-OK', 'NA', 'Omaheke', NULL, 0),
(2719, 'NA-ON', 'NA', 'Oshana', NULL, 0),
(2720, 'NA-OO', 'NA', 'Oshikoto', NULL, 0),
(2721, 'NA-OT', 'NA', 'Omusati', NULL, 0),
(2722, 'NA-OW', 'NA', 'Ohangwena', NULL, 0),
(2723, 'NC-L', 'NC', 'Iles Loyaute', NULL, 0),
(2724, 'NC-N', 'NC', 'Nord', NULL, 0),
(2725, 'NC-S', 'NC', 'Sud', NULL, 0),
(2726, 'NG-AB', 'NG', 'Abia', NULL, 0),
(2727, 'NG-AD', 'NG', 'Adamawa', NULL, 0),
(2728, 'NG-AG', 'NG', 'Agadez', NULL, 0),
(2729, 'NG-AK', 'NG', 'Akwa Ibom', NULL, 0),
(2730, 'NG-AN', 'NG', 'Anambra', NULL, 0),
(2731, 'NG-BC', 'NG', 'Bauchi', NULL, 0),
(2732, 'NG-BN', 'NG', 'Benue', NULL, 0),
(2733, 'NG-BO', 'NG', 'Borno', NULL, 0),
(2734, 'NG-BY', 'NG', 'Bayelsa', NULL, 0),
(2735, 'NG-CR', 'NG', 'Cross River', NULL, 0),
(2736, 'NG-CT', 'NG', 'Federal Capital Territory', NULL, 0),
(2737, 'NG-DE', 'NG', 'Delta', NULL, 0),
(2738, 'NG-DF', 'NG', 'Diffa', NULL, 0),
(2739, 'NG-DS', 'NG', 'Dosso', NULL, 0),
(2740, 'NG-EB', 'NG', 'Ebonyi', NULL, 0),
(2741, 'NG-ED', 'NG', 'Edo', NULL, 0),
(2742, 'NG-EK', 'NG', 'Ekiti', NULL, 0),
(2743, 'NG-EN', 'NG', 'Enugu', NULL, 0),
(2744, 'NG-GO', 'NG', 'Gombe', NULL, 0),
(2745, 'NG-IM', 'NG', 'Imo', NULL, 0),
(2746, 'NG-JI', 'NG', 'Jigawa', NULL, 0),
(2747, 'NG-KD', 'NG', 'Kaduna', NULL, 0),
(2748, 'NG-KE', 'NG', 'Kebbi', NULL, 0),
(2749, 'NG-KN', 'NG', 'Kano', NULL, 0),
(2750, 'NG-KO', 'NG', 'Kogi', NULL, 0),
(2751, 'NG-KT', 'NG', 'Katsina', NULL, 0),
(2752, 'NG-KW', 'NG', 'Kwara', NULL, 0),
(2753, 'NG-LA', 'NG', 'Lagos', NULL, 0),
(2754, 'NG-MA', 'NG', 'Maradi', NULL, 0),
(2755, 'NG-NA', 'NG', 'Nassarawa', NULL, 0),
(2756, 'NG-NI', 'NG', 'Niger', NULL, 0),
(2757, 'NG-NM', 'NG', 'Niamey', NULL, 0),
(2758, 'NG-OG', 'NG', 'Ogun', NULL, 0),
(2759, 'NG-ONG', 'NG', 'Ondo', NULL, 0),
(2760, 'NG-OS', 'NG', 'Osun', NULL, 0),
(2761, 'NG-OY', 'NG', 'Oyo', NULL, 0),
(2762, 'NG-PL', 'NG', 'Plateau', NULL, 0),
(2763, 'NG-RI', 'NG', 'Rivers', NULL, 0),
(2764, 'NG-SO', 'NG', 'Sokoto', NULL, 0),
(2765, 'NG-TA', 'NG', 'Taraba', NULL, 0),
(2766, 'NG-TH', 'NG', 'Tahoua', NULL, 0),
(2767, 'NG-TL', 'NG', 'Tillaberi', NULL, 0),
(2768, 'NG-YO', 'NG', 'Yobe', NULL, 0),
(2769, 'NG-ZA', 'NG', 'Zamfara', NULL, 0),
(2770, 'NG-ZD', 'NG', 'Zinder', NULL, 0),
(2771, 'NI-AN', 'NI', 'Region Autonoma del Atlantico Norte', NULL, 0),
(2772, 'NI-AS', 'NI', 'Region Autonoma del Atlantico Sur', NULL, 0),
(2773, 'NI-BO', 'NI', 'Boaco', NULL, 0),
(2774, 'NI-CA', 'NI', 'Carazo', NULL, 0),
(2775, 'NI-CD', 'NI', 'Chinandega', NULL, 0),
(2776, 'NI-CT', 'NI', 'Chontales', NULL, 0),
(2777, 'NI-ES', 'NI', 'Esteli', NULL, 0),
(2778, 'NI-GR', 'NI', 'Granada', NULL, 0),
(2779, 'NI-JI', 'NI', 'Jinotega', NULL, 0),
(2780, 'NI-LE', 'NI', 'Leon', NULL, 0),
(2781, 'NI-MD', 'NI', 'Madriz', NULL, 0),
(2782, 'NI-MN', 'NI', 'Managua', NULL, 0),
(2783, 'NI-MS', 'NI', 'Masaya', NULL, 0),
(2784, 'NI-MT', 'NI', 'Matagalpa', NULL, 0),
(2785, 'NI-NS', 'NI', 'Nueva Segovia', NULL, 0),
(2786, 'NI-RV', 'NI', 'Rivas', NULL, 0),
(2787, 'NI-SJ', 'NI', 'Rio San Juan', NULL, 0),
(2788, 'NL-DR', 'NL', 'Drenthe', NULL, 0),
(2789, 'NL-FL', 'NL', 'Flevoland', NULL, 0),
(2790, 'NL-FR', 'NL', 'Friesland', NULL, 0),
(2791, 'NL-GE', 'NL', 'Gelderland', NULL, 0),
(2792, 'NL-GR', 'NL', 'Groningen', NULL, 0),
(2793, 'NL-LI', 'NL', 'Limburg', NULL, 0),
(2794, 'NL-NB', 'NL', 'Noord Brabant', NULL, 0),
(2795, 'NL-NH', 'NL', 'Noord Holland', NULL, 0),
(2796, 'NL-OV', 'NL', 'Overijssel', NULL, 0),
(2797, 'NL-UT', 'NL', 'Utrecht', NULL, 0),
(2798, 'NL-ZE', 'NL', 'Zeeland', NULL, 0),
(2799, 'NL-ZH', 'NL', 'Zuid Holland', NULL, 0),
(2800, 'NO-AA', 'NO', 'Aust-Agder', NULL, 0),
(2801, 'NO-AK', 'NO', 'Akershus', NULL, 0),
(2802, 'NO-BU', 'NO', 'Buskerud', NULL, 0),
(2803, 'NO-FM', 'NO', 'Finnmark', NULL, 0),
(2804, 'NO-HL', 'NO', 'Hordaland', NULL, 0),
(2805, 'NO-HM', 'NO', 'Hedmark', NULL, 0),
(2806, 'NO-MR', 'NO', 'More og Romdal', NULL, 0),
(2807, 'NO-NL', 'NO', 'Nordland', NULL, 0),
(2808, 'NO-NT', 'NO', 'Nord-Trondelag', NULL, 0),
(2809, 'NO-OF', 'NO', 'Ostfold', NULL, 0),
(2810, 'NO-OL', 'NO', 'Oslo', NULL, 0),
(2811, 'NO-OP', 'NO', 'Oppland', NULL, 0),
(2812, 'NO-RL', 'NO', 'Rogaland', NULL, 0),
(2813, 'NO-SJ', 'NO', 'Sogn og Fjordane', NULL, 0),
(2814, 'NO-ST', 'NO', 'Sor-Trondelag', NULL, 0),
(2815, 'NO-TM', 'NO', 'Telemark', NULL, 0),
(2816, 'NO-TR', 'NO', 'Troms', NULL, 0),
(2817, 'NO-VA', 'NO', 'Vest-Agder', NULL, 0),
(2818, 'NO-VF', 'NO', 'Vestfold', NULL, 0),
(2819, 'NP-BA', 'NP', 'Bagmati', NULL, 0),
(2820, 'NP-BH', 'NP', 'Bheri', NULL, 0),
(2821, 'NP-DH', 'NP', 'Dhawalagiri', NULL, 0),
(2822, 'NP-GA', 'NP', 'Gandaki', NULL, 0),
(2823, 'NP-JA', 'NP', 'Janakpur', NULL, 0),
(2824, 'NP-KA', 'NP', 'Karnali', NULL, 0),
(2825, 'NP-KO', 'NP', 'Kosi', NULL, 0),
(2826, 'NP-LU', 'NP', 'Lumbini', NULL, 0),
(2827, 'NP-MA', 'NP', 'Mahakali', NULL, 0),
(2828, 'NP-ME', 'NP', 'Mechi', NULL, 0),
(2829, 'NP-NA', 'NP', 'Narayani', NULL, 0),
(2830, 'NP-RA', 'NP', 'Rapti', NULL, 0),
(2831, 'NP-SA', 'NP', 'Sagarmatha', NULL, 0),
(2832, 'NP-SE', 'NP', 'Seti', NULL, 0),
(2833, 'NR-AA', 'NR', 'Anabar', NULL, 0),
(2834, 'NR-AI', 'NR', 'Anibare', NULL, 0),
(2835, 'NR-AO', 'NR', 'Aiwo', NULL, 0),
(2836, 'NR-AT', 'NR', 'Anetan', NULL, 0),
(2837, 'NR-BA', 'NR', 'Baiti', NULL, 0),
(2838, 'NR-BO', 'NR', 'Boe', NULL, 0),
(2839, 'NR-BU', 'NR', 'Buada', NULL, 0),
(2840, 'NR-DE', 'NR', 'Denigomodu', NULL, 0),
(2841, 'NR-EW', 'NR', 'Ewa', NULL, 0),
(2842, 'NR-IJ', 'NR', 'Ijuw', NULL, 0),
(2843, 'NR-ME', 'NR', 'Meneng', NULL, 0),
(2844, 'NR-NI', 'NR', 'Nibok', NULL, 0),
(2845, 'NR-UA', 'NR', 'Uaboe', NULL, 0),
(2846, 'NR-YA', 'NR', 'Yaren', NULL, 0),
(2847, 'NZ-AUK', 'NZ', 'Auckland', NULL, 0),
(2848, 'NZ-BOP', 'NZ', 'Bay of Plenty', NULL, 0),
(2849, 'NZ-CAN', 'NZ', 'Canterbury', NULL, 0),
(2850, 'NZ-GIS', 'NZ', 'Gisborne', NULL, 0),
(2851, 'NZ-HKB', 'NZ', 'Hawke\'s Bay', NULL, 0),
(2852, 'NZ-MBH', 'NZ', 'Marlborough', NULL, 0),
(2853, 'NZ-MWT', 'NZ', 'Manawatu-Wanganui', NULL, 0),
(2854, 'NZ-NSN', 'NZ', 'Nelson', NULL, 0),
(2855, 'NZ-NTL', 'NZ', 'Northland', NULL, 0),
(2856, 'NZ-OTA', 'NZ', 'Otago', NULL, 0),
(2857, 'NZ-STL', 'NZ', 'Southland', NULL, 0),
(2858, 'NZ-TAS', 'NZ', 'Tasman', NULL, 0),
(2859, 'NZ-TKI', 'NZ', 'Taranaki', NULL, 0),
(2860, 'NZ-WGN', 'NZ', 'Wellington', NULL, 0),
(2861, 'NZ-WKO', 'NZ', 'Waikato', NULL, 0),
(2862, 'NZ-WTC', 'NZ', 'West Coast', NULL, 0),
(2863, 'OM-BA', 'OM', 'Al Batinah', NULL, 0),
(2864, 'OM-DA', 'OM', 'Ad Dakhiliyah', NULL, 0),
(2865, 'OM-MA', 'OM', 'Masqat', NULL, 0),
(2866, 'OM-MU', 'OM', 'Musandam', NULL, 0),
(2867, 'OM-SH', 'OM', 'Ash Sharqiyah', NULL, 0),
(2868, 'OM-WU', 'OM', 'Al Wusta', NULL, 0),
(2869, 'OM-ZA', 'OM', 'Az Zahirah', NULL, 0),
(2870, 'OM-ZU', 'OM', 'Zufar', NULL, 0),
(2871, 'PA-BT', 'PA', 'Bocas del Toro', NULL, 0),
(2872, 'PA-CC', 'PA', 'Cocle', NULL, 0),
(2873, 'PA-CH', 'PA', 'Chiriqui', NULL, 0),
(2874, 'PA-CL', 'PA', 'Colon', NULL, 0),
(2875, 'PA-DA', 'PA', 'Darien', NULL, 0),
(2876, 'PA-HE', 'PA', 'Herrera', NULL, 0),
(2877, 'PA-LS', 'PA', 'Los Santos', NULL, 0),
(2878, 'PA-PA', 'PA', 'Panama', NULL, 0),
(2879, 'PA-SB', 'PA', 'San Blas', NULL, 0),
(2880, 'PA-VG', 'PA', 'Veraguas', NULL, 0),
(2881, 'PE-AM', 'PE', 'Amazonas', NULL, 0),
(2882, 'PE-AN', 'PE', 'Ancash', NULL, 0),
(2883, 'PE-AP', 'PE', 'Apurimac', NULL, 0),
(2884, 'PE-AR', 'PE', 'Arequipa', NULL, 0),
(2885, 'PE-AY', 'PE', 'Ayacucho', NULL, 0),
(2886, 'PE-CJ', 'PE', 'Cajamarca', NULL, 0),
(2887, 'PE-CL', 'PE', 'Callao', NULL, 0),
(2888, 'PE-CU', 'PE', 'Cusco', NULL, 0),
(2889, 'PE-HO', 'PE', 'Huanuco', NULL, 0),
(2890, 'PE-HV', 'PE', 'Huancavelica', NULL, 0),
(2891, 'PE-IC', 'PE', 'Ica', NULL, 0),
(2892, 'PE-JU', 'PE', 'Junin', NULL, 0),
(2893, 'PE-LD', 'PE', 'La Libertad', NULL, 0),
(2894, 'PE-LI', 'PE', 'Lima', NULL, 0),
(2895, 'PE-LO', 'PE', 'Loreto', NULL, 0),
(2896, 'PE-LY', 'PE', 'Lambayeque', NULL, 0),
(2897, 'PE-MD', 'PE', 'Madre de Dios', NULL, 0),
(2898, 'PE-MO', 'PE', 'Moquegua', NULL, 0),
(2899, 'PE-PA', 'PE', 'Pasco', NULL, 0),
(2900, 'PE-PI', 'PE', 'Piura', NULL, 0),
(2901, 'PE-PU', 'PE', 'Puno', NULL, 0),
(2902, 'PE-SM', 'PE', 'San Martin', NULL, 0),
(2903, 'PE-TA', 'PE', 'Tacna', NULL, 0),
(2904, 'PE-TU', 'PE', 'Tumbes', NULL, 0),
(2905, 'PE-UC', 'PE', 'Ucayali', NULL, 0),
(2906, 'PF-I', 'PF', 'Archipel des Tubuai', NULL, 0),
(2907, 'PF-M', 'PF', 'Archipel des Marquises', NULL, 0),
(2908, 'PF-S', 'PF', 'Iles Sous-le-Vent', NULL, 0),
(2909, 'PF-T', 'PF', 'Archipel des Tuamotu', NULL, 0),
(2910, 'PF-V', 'PF', 'Iles du Vent', NULL, 0),
(2911, 'PG-BV', 'PG', 'Bougainville', NULL, 0),
(2912, 'PG-CE', 'PG', 'Central', NULL, 0),
(2913, 'PG-CH', 'PG', 'Chimbu', NULL, 0),
(2914, 'PG-EB', 'PG', 'East New Britain', NULL, 0),
(2915, 'PG-EH', 'PG', 'Eastern Highlands', NULL, 0),
(2916, 'PG-EN', 'PG', 'Enga', NULL, 0),
(2917, 'PG-ES', 'PG', 'East Sepik', NULL, 0),
(2918, 'PG-GU', 'PG', 'Gulf', NULL, 0),
(2919, 'PG-MB', 'PG', 'Milne Bay', NULL, 0),
(2920, 'PG-MD', 'PG', 'Madang', NULL, 0),
(2921, 'PG-MN', 'PG', 'Manus', NULL, 0),
(2922, 'PG-MR', 'PG', 'Morobe', NULL, 0),
(2923, 'PG-NC', 'PG', 'National Capital', NULL, 0),
(2924, 'PG-NI', 'PG', 'New Ireland', NULL, 0),
(2925, 'PG-NO', 'PG', 'Northern', NULL, 0),
(2926, 'PG-SA', 'PG', 'Sandaun', NULL, 0),
(2927, 'PG-SH', 'PG', 'Southern Highlands', NULL, 0),
(2928, 'PG-WB', 'PG', 'West New Britain', NULL, 0),
(2929, 'PG-WE', 'PG', 'Western', NULL, 0),
(2930, 'PG-WH', 'PG', 'Western Highlands', NULL, 0),
(2931, 'PH-ABR', 'PH', 'Abra', NULL, 0),
(2932, 'PH-AKL', 'PH', 'Aklan', NULL, 0),
(2933, 'PH-ALB', 'PH', 'Albay', NULL, 0),
(2934, 'PH-ANO', 'PH', 'Agusan del Norte', NULL, 0),
(2935, 'PH-ANT', 'PH', 'Antique', NULL, 0),
(2936, 'PH-APY', 'PH', 'Apayao', NULL, 0),
(2937, 'PH-ASU', 'PH', 'Agusan del Sur', NULL, 0),
(2938, 'PH-AUR', 'PH', 'Aurora', NULL, 0),
(2939, 'PH-BAS', 'PH', 'Basilan', NULL, 0),
(2940, 'PH-BEN', 'PH', 'Benguet', NULL, 0),
(2941, 'PH-BLR', 'PH', 'Biliran', NULL, 0),
(2942, 'PH-BOL', 'PH', 'Bohol', NULL, 0),
(2943, 'PH-BTA', 'PH', 'Bataan', NULL, 0),
(2944, 'PH-BTE', 'PH', 'Batanes', NULL, 0),
(2945, 'PH-BTG', 'PH', 'Batangas', NULL, 0),
(2946, 'PH-BUK', 'PH', 'Bukidnon', NULL, 0),
(2947, 'PH-BUL', 'PH', 'Bulacan', NULL, 0),
(2948, 'PH-CAG', 'PH', 'Cagayan', NULL, 0),
(2949, 'PH-CAM', 'PH', 'Camiguin', NULL, 0),
(2950, 'PH-CAP', 'PH', 'Capiz', NULL, 0),
(2951, 'PH-CAT', 'PH', 'Catanduanes', NULL, 0),
(2952, 'PH-CAV', 'PH', 'Cavite', NULL, 0),
(2953, 'PH-CEB', 'PH', 'Cebu', NULL, 0),
(2954, 'PH-CMP', 'PH', 'Compostela', NULL, 0),
(2955, 'PH-CNO', 'PH', 'Camarines Norte', NULL, 0),
(2956, 'PH-CSU', 'PH', 'Camarines Sur', NULL, 0),
(2957, 'PH-DNO', 'PH', 'Davao del Norte', NULL, 0),
(2958, 'PH-DOR', 'PH', 'Davao Oriental', NULL, 0),
(2959, 'PH-DSU', 'PH', 'Davao del Sur', NULL, 0),
(2960, 'PH-ESA', 'PH', 'Eastern Samar', NULL, 0),
(2961, 'PH-GUI', 'PH', 'Guimaras', NULL, 0),
(2962, 'PH-IFU', 'PH', 'Ifugao', NULL, 0),
(2963, 'PH-ILO', 'PH', 'Iloilo', NULL, 0),
(2964, 'PH-INO', 'PH', 'Ilocos Norte', NULL, 0),
(2965, 'PH-ISA', 'PH', 'Isabela', NULL, 0),
(2966, 'PH-ISU', 'PH', 'Ilocos Sur', NULL, 0),
(2967, 'PH-KAL', 'PH', 'Kalinga', NULL, 0),
(2968, 'PH-LAG', 'PH', 'Laguna', NULL, 0),
(2969, 'PH-LEY', 'PH', 'Leyte', NULL, 0),
(2970, 'PH-LNO', 'PH', 'Lanao del Norte', NULL, 0),
(2971, 'PH-LSU', 'PH', 'Lanao del Sur', NULL, 0),
(2972, 'PH-MAG', 'PH', 'Maguindanao', NULL, 0),
(2973, 'PH-MIC', 'PH', 'Mindoro Occidental', NULL, 0),
(2974, 'PH-MIR', 'PH', 'Mindoro Oriental', NULL, 0),
(2975, 'PH-MOP', 'PH', 'Mountain Province', NULL, 0),
(2976, 'PH-MOR', 'PH', 'Misamis Oriental', NULL, 0),
(2977, 'PH-MRN', 'PH', 'Marinduque', NULL, 0),
(2978, 'PH-MSB', 'PH', 'Masbate', NULL, 0),
(2979, 'PH-MSC', 'PH', 'Misamis Occidental', NULL, 0),
(2980, 'PH-NCT', 'PH', 'North Cotabato', NULL, 0),
(2981, 'PH-NEC', 'PH', 'Nueva Ecija', NULL, 0),
(2982, 'PH-NOC', 'PH', 'Negros Occidental', NULL, 0),
(2983, 'PH-NOR', 'PH', 'Negros Oriental', NULL, 0),
(2984, 'PH-NSM', 'PH', 'Northern Samar', NULL, 0),
(2985, 'PH-NVZ', 'PH', 'Nueva Vizcaya', NULL, 0),
(2986, 'PH-PLW', 'PH', 'Palawan', NULL, 0),
(2987, 'PH-PMP', 'PH', 'Pampanga', NULL, 0),
(2988, 'PH-PNG', 'PH', 'Pangasinan', NULL, 0),
(2989, 'PH-QRN', 'PH', 'Quirino', NULL, 0),
(2990, 'PH-QZN', 'PH', 'Quezon', NULL, 0),
(2991, 'PH-RIZ', 'PH', 'Rizal', NULL, 0),
(2992, 'PH-ROM', 'PH', 'Romblon', NULL, 0),
(2993, 'PH-SCO', 'PH', 'South Cotabato', NULL, 0),
(2994, 'PH-SKU', 'PH', 'Sultan Kudarat', NULL, 0),
(2995, 'PH-SLE', 'PH', 'Southern Leyte', NULL, 0),
(2996, 'PH-SLU', 'PH', 'Sulu', NULL, 0),
(2997, 'PH-SMR', 'PH', 'Samar', NULL, 0),
(2998, 'PH-SNO', 'PH', 'Surigao del Norte', NULL, 0),
(2999, 'PH-SQJ', 'PH', 'Siquijor', NULL, 0),
(3000, 'PH-SRG', 'PH', 'Sarangani', NULL, 0),
(3001, 'PH-SRS', 'PH', 'Sorsogon', NULL, 0),
(3002, 'PH-SSU', 'PH', 'Surigao del Sur', NULL, 0),
(3003, 'PH-TAR', 'PH', 'Tarlac', NULL, 0),
(3004, 'PH-TAW', 'PH', 'Tawi-Tawi', NULL, 0),
(3005, 'PH-UNI', 'PH', 'La Union', NULL, 0),
(3006, 'PH-ZBL', 'PH', 'Zambales', NULL, 0),
(3007, 'PH-ZNO', 'PH', 'Zamboanga del Norte', NULL, 0),
(3008, 'PH-ZSI', 'PH', 'Zamboanga Sibugay', NULL, 0),
(3009, 'PH-ZSU', 'PH', 'Zamboanga del Sur', NULL, 0),
(3010, 'PK-B', 'PK', 'Balochistan', NULL, 0),
(3011, 'PK-I', 'PK', 'Islamabad Capital Territory', NULL, 0),
(3012, 'PK-N', 'PK', 'North-West Frontier Province', NULL, 0),
(3013, 'PK-P', 'PK', 'Punjab', NULL, 0),
(3014, 'PK-S', 'PK', 'Sindh', NULL, 0),
(3015, 'PK-T', 'PK', 'Federally Administered Tribal Areas', NULL, 0),
(3016, 'PL-DO', 'PL', 'Dolnoslaskie', NULL, 0),
(3017, 'PL-KP', 'PL', 'Kujawsko-Pomorskie', NULL, 0),
(3018, 'PL-LL', 'PL', 'Lubelskie', NULL, 0),
(3019, 'PL-LO', 'PL', 'Lodzkie', NULL, 0),
(3020, 'PL-LU', 'PL', 'Lubuskie', NULL, 0),
(3021, 'PL-ML', 'PL', 'Malopolskie', NULL, 0),
(3022, 'PL-MZ', 'PL', 'Mazowieckie', NULL, 0),
(3023, 'PL-OP', 'PL', 'Opolskie', NULL, 0),
(3024, 'PL-PL', 'PL', 'Podlaskie', NULL, 0),
(3025, 'PL-PM', 'PL', 'Pomorskie', NULL, 0),
(3026, 'PL-PP', 'PL', 'Podkarpackie', NULL, 0),
(3027, 'PL-SL', 'PL', 'Slaskie', NULL, 0),
(3028, 'PL-SW', 'PL', 'Swietokrzyskie', NULL, 0),
(3029, 'PL-WM', 'PL', 'Warminsko-Mazurskie', NULL, 0),
(3030, 'PL-WP', 'PL', 'Wielkopolskie', NULL, 0),
(3031, 'PL-ZA', 'PL', 'Zachodniopomorskie', NULL, 0),
(3032, 'PM-M', 'PM', 'Miquelon', NULL, 0),
(3033, 'PM-P', 'PM', 'Saint Pierre', NULL, 0),
(3034, 'PT-AR', 'PT', 'Acores (Azores)', NULL, 0),
(3035, 'PT-AV', 'PT', 'Aveiro', NULL, 0),
(3036, 'PT-BA', 'PT', 'Braga', NULL, 0),
(3037, 'PT-BJ', 'PT', 'Beja', NULL, 0),
(3038, 'PT-BN', 'PT', 'Braganca', NULL, 0),
(3039, 'PT-CB', 'PT', 'Castelo Branco', NULL, 0),
(3040, 'PT-CO', 'PT', 'Coimbra', NULL, 0),
(3041, 'PT-EV', 'PT', 'Evora', NULL, 0),
(3042, 'PT-FA', 'PT', 'Faro', NULL, 0),
(3043, 'PT-GU', 'PT', 'Guarda', NULL, 0),
(3044, 'PT-LE', 'PT', 'Leiria', NULL, 0),
(3045, 'PT-LI', 'PT', 'Lisboa', NULL, 0),
(3046, 'PT-MA', 'PT', 'Madeira', NULL, 0),
(3047, 'PT-PG', 'PT', 'Portalegre', NULL, 0),
(3048, 'PT-PO', 'PT', 'Porto', NULL, 0),
(3049, 'PT-SA', 'PT', 'Santarem', NULL, 0),
(3050, 'PT-SE', 'PT', 'Setubal', NULL, 0),
(3051, 'PT-VC', 'PT', 'Viana do Castelo', NULL, 0),
(3052, 'PT-VR', 'PT', 'Vila Real', NULL, 0),
(3053, 'PT-VS', 'PT', 'Viseu', NULL, 0),
(3054, 'PW-AM', 'PW', 'Aimeliik', NULL, 0),
(3055, 'PW-AN', 'PW', 'Angaur', NULL, 0),
(3056, 'PW-AR', 'PW', 'Airai', NULL, 0),
(3057, 'PW-HA', 'PW', 'Hatohobei', NULL, 0),
(3058, 'PW-KA', 'PW', 'Kayangel', NULL, 0),
(3059, 'PW-KO', 'PW', 'Koror', NULL, 0),
(3060, 'PW-ME', 'PW', 'Melekeok', NULL, 0),
(3061, 'PW-NA', 'PW', 'Ngaraard', NULL, 0),
(3062, 'PW-NC', 'PW', 'Ngchesar', NULL, 0),
(3063, 'PW-ND', 'PW', 'Ngardmau', NULL, 0),
(3064, 'PW-NG', 'PW', 'Ngarchelong', NULL, 0),
(3065, 'PW-NR', 'PW', 'Ngeremlengui', NULL, 0),
(3066, 'PW-NT', 'PW', 'Ngatpang', NULL, 0),
(3067, 'PW-NW', 'PW', 'Ngiwal', NULL, 0),
(3068, 'PW-PE', 'PW', 'Peleliu', NULL, 0),
(3069, 'PW-SO', 'PW', 'Sonsorol', NULL, 0),
(3070, 'PY-AG', 'PY', 'Alto Paraguay', NULL, 0),
(3071, 'PY-AM', 'PY', 'Amambay', NULL, 0),
(3072, 'PY-AN', 'PY', 'Alto Parana', NULL, 0),
(3073, 'PY-AS', 'PY', 'Asuncion', NULL, 0),
(3074, 'PY-BO', 'PY', 'Boqueron', NULL, 0),
(3075, 'PY-CC', 'PY', 'Concepcion', NULL, 0),
(3076, 'PY-CD', 'PY', 'Cordillera', NULL, 0),
(3077, 'PY-CE', 'PY', 'Central', NULL, 0),
(3078, 'PY-CG', 'PY', 'Caaguazu', NULL, 0),
(3079, 'PY-CN', 'PY', 'Canindeyu', NULL, 0),
(3080, 'PY-CZ', 'PY', 'Caazapa', NULL, 0),
(3081, 'PY-GU', 'PY', 'Guaira', NULL, 0),
(3082, 'PY-IT', 'PY', 'Itapua', NULL, 0),
(3083, 'PY-MI', 'PY', 'Misiones', NULL, 0),
(3084, 'PY-NE', 'PY', 'Neembucu', NULL, 0),
(3085, 'PY-PA', 'PY', 'Paraguari', NULL, 0),
(3086, 'PY-PH', 'PY', 'Presidente Hayes', NULL, 0),
(3087, 'PY-SP', 'PY', 'San Pedro', NULL, 0),
(3088, 'QA-DW', 'QA', 'Ad Dawhah', NULL, 0),
(3089, 'QA-GW', 'QA', 'Al Ghuwayriyah', NULL, 0),
(3090, 'QA-JB', 'QA', 'Jarayan al Batinah', NULL, 0),
(3091, 'QA-JM', 'QA', 'Al Jumayliyah', NULL, 0),
(3092, 'QA-KR', 'QA', 'Al Khawr', NULL, 0),
(3093, 'QA-MS', 'QA', 'Madinat ash Shamal', NULL, 0),
(3094, 'QA-RN', 'QA', 'Ar Rayyan', NULL, 0),
(3095, 'QA-UD', 'QA', 'Umm Sa\'id', NULL, 0),
(3096, 'QA-UL', 'QA', 'Umm Salal', NULL, 0),
(3097, 'QA-WK', 'QA', 'Al Wakrah', NULL, 0),
(3098, 'RO-AD', 'RO', 'Arad', NULL, 0),
(3099, 'RO-AG', 'RO', 'Arges', NULL, 0),
(3100, 'RO-AL', 'RO', 'Alba', NULL, 0),
(3101, 'RO-BA', 'RO', 'Bacau', NULL, 0),
(3102, 'RO-BC', 'RO', 'Bucuresti', NULL, 0),
(3103, 'RO-BH', 'RO', 'Bihor', NULL, 0),
(3104, 'RO-BL', 'RO', 'Braila', NULL, 0),
(3105, 'RO-BN', 'RO', 'Bistrita-Nasaud', NULL, 0),
(3106, 'RO-BO', 'RO', 'Botosani', NULL, 0),
(3107, 'RO-BS', 'RO', 'Brasov', NULL, 0),
(3108, 'RO-BZ', 'RO', 'Buzau', NULL, 0),
(3109, 'RO-CJ', 'RO', 'Cluj', NULL, 0),
(3110, 'RO-CR', 'RO', 'Calarasi', NULL, 0),
(3111, 'RO-CS', 'RO', 'Caras-Severin', NULL, 0),
(3112, 'RO-CT', 'RO', 'Constanta', NULL, 0),
(3113, 'RO-CV', 'RO', 'Covasna', NULL, 0),
(3114, 'RO-DI', 'RO', 'Dimbovita', NULL, 0),
(3115, 'RO-DO', 'RO', 'Dolj', NULL, 0),
(3116, 'RO-GG', 'RO', 'Giurgiu', NULL, 0),
(3117, 'RO-GJ', 'RO', 'Gorj', NULL, 0),
(3118, 'RO-GL', 'RO', 'Galati', NULL, 0),
(3119, 'RO-HA', 'RO', 'Harghita', NULL, 0),
(3120, 'RO-HU', 'RO', 'Hunedoara', NULL, 0),
(3121, 'RO-IF', 'RO', 'Ilfov', NULL, 0),
(3122, 'RO-IM', 'RO', 'Ialomita', NULL, 0),
(3123, 'RO-IS', 'RO', 'Iasi', NULL, 0),
(3124, 'RO-MA', 'RO', 'Maramures', NULL, 0),
(3125, 'RO-ME', 'RO', 'Mehedinti', NULL, 0),
(3126, 'RO-MU', 'RO', 'Mures', NULL, 0),
(3127, 'RO-NE', 'RO', 'Neamt', NULL, 0),
(3128, 'RO-OL', 'RO', 'Olt', NULL, 0),
(3129, 'RO-PR', 'RO', 'Prahova', NULL, 0),
(3130, 'RO-SI', 'RO', 'Timis', NULL, 0),
(3131, 'RO-SJ', 'RO', 'Salaj', NULL, 0),
(3132, 'RO-SM', 'RO', 'Satu Mare', NULL, 0),
(3133, 'RO-SO', 'RO', 'Sibiu', NULL, 0),
(3134, 'RO-SU', 'RO', 'Suceava', NULL, 0),
(3135, 'RO-TE', 'RO', 'Teleorman', NULL, 0),
(3136, 'RO-TU', 'RO', 'Tulcea', NULL, 0),
(3137, 'RO-VA', 'RO', 'Vaslui', NULL, 0),
(3138, 'RO-VI', 'RO', 'Vilcea', NULL, 0),
(3139, 'RO-VR', 'RO', 'Vrancea', NULL, 0),
(3140, 'RS-00', 'RS', 'Belgrade', NULL, 0),
(3141, 'RS-14', 'RS', 'Borski okrug', NULL, 0),
(3142, 'RS-11', 'RS', 'Braničevski okrug', NULL, 0),
(3143, 'RS-23', 'RS', 'Jablanički okrug', NULL, 0),
(3144, 'RS-06', 'RS', 'Južnobanatski okrug', NULL, 0),
(3145, 'RS-04', 'RS', 'Južnobanatski okrug', NULL, 0),
(3146, 'RS-09', 'RS', 'Kolubarski okrug', NULL, 0),
(3147, 'RS-25', 'RS', 'Kosovski okrug', NULL, 0),
(3148, 'RS-28', 'RS', 'Kosovsko-Mitrovački okrug', NULL, 0),
(3149, 'RS-29', 'RS', 'Kosovsko-Pomoravski okrug', NULL, 0),
(3150, 'RS-08', 'RS', 'Mačvanski okrug', NULL, 0),
(3151, 'RS-17', 'RS', 'Moravički okrug', NULL, 0),
(3152, 'RS-20', 'RS', 'Nišavski okrug', NULL, 0),
(3153, 'RS-26', 'RS', 'Pećki okrug', NULL, 0),
(3154, 'RS-22', 'RS', 'Pirotski okrug', NULL, 0),
(3155, 'RS-10', 'RS', 'Podunavski okrug', NULL, 0),
(3156, 'RS-13', 'RS', 'Pomoravski okrug', NULL, 0),
(3157, 'RS-27', 'RS', 'Prizrenski okrug', NULL, 0),
(3158, 'RS-24', 'RS', 'Pčinjski okrug', NULL, 0),
(3159, 'RS-19', 'RS', 'Rasinski okrug', NULL, 0),
(3160, 'RS-18', 'RS', 'Raška okrug', NULL, 0),
(3161, 'RS-03', 'RS', 'Severnobanatski okrug', NULL, 0),
(3162, 'RS-01', 'RS', 'Severnobački okrug', NULL, 0),
(3163, 'RS-02', 'RS', 'Srednjebanatski okrug', NULL, 0),
(3164, 'RS-07', 'RS', 'Sremski okrug', NULL, 0),
(3165, 'RS-21', 'RS', 'Toplièki okrug', NULL, 0),
(3166, 'RS-15', 'RS', 'Zajeèarski okrug', NULL, 0),
(3167, 'RS-05', 'RS', 'Zapadnobaèki okrug', NULL, 0),
(3168, 'RS-16', 'RS', 'Zlatiborski okrug', NULL, 0),
(3169, 'RS-12', 'RS', 'Šumadijski okrug', NULL, 0),
(3170, 'RU-AD', 'RU', 'Adygeya', NULL, 0),
(3171, 'RU-AGB', 'RU', 'Aga Buryatia', NULL, 0),
(3172, 'RU-AL', 'RU', 'Altai Republic', NULL, 0),
(3173, 'RU-ALT', 'RU', 'Altai Krai', NULL, 0),
(3174, 'RU-AMU', 'RU', 'Amur', NULL, 0),
(3175, 'RU-ARK', 'RU', 'Arkhangelsk', NULL, 0),
(3176, 'RU-AST', 'RU', 'Astrakhan', NULL, 0),
(3177, 'RU-BA', 'RU', 'Bashkortostan', NULL, 0),
(3178, 'RU-BEL', 'RU', 'Belgorod', NULL, 0),
(3179, 'RU-BRY', 'RU', 'Bryansk', NULL, 0),
(3180, 'RU-BU', 'RU', 'Buryatia', NULL, 0),
(3181, 'RU-CE', 'RU', 'Chechnya', NULL, 0),
(3182, 'RU-CHE', 'RU', 'Chelyabinsk', NULL, 0),
(3183, 'RU-CHI', 'RU', 'Chita', NULL, 0),
(3184, 'RU-CHU', 'RU', 'Chukotka', NULL, 0),
(3185, 'RU-CU', 'RU', 'Chuvashia', NULL, 0),
(3186, 'RU-DA', 'RU', 'Dagestan', NULL, 0),
(3187, 'RU-EVE', 'RU', 'Evenkia', NULL, 0),
(3188, 'RU-IN', 'RU', 'Ingushetia', NULL, 0),
(3189, 'RU-IRK', 'RU', 'Irkutsk', NULL, 0),
(3190, 'RU-IVA', 'RU', 'Ivanovo', NULL, 0),
(3191, 'RU-KAM', 'RU', 'Kamchatka', NULL, 0),
(3192, 'RU-KB', 'RU', 'Kabardino-Balkaria', NULL, 0),
(3193, 'RU-KC', 'RU', 'Karachay-Cherkessia', NULL, 0),
(3194, 'RU-KDA', 'RU', 'Krasnodar', NULL, 0),
(3195, 'RU-KEM', 'RU', 'Kemerovo', NULL, 0),
(3196, 'RU-KGD', 'RU', 'Kaliningrad', NULL, 0),
(3197, 'RU-KGN', 'RU', 'Kurgan', NULL, 0),
(3198, 'RU-KHA', 'RU', 'Khabarovsk', NULL, 0),
(3199, 'RU-KHM', 'RU', 'Khantia-Mansia', NULL, 0),
(3200, 'RU-KIR', 'RU', 'Kirov', NULL, 0),
(3201, 'RU-KK', 'RU', 'Khakassia', NULL, 0),
(3202, 'RU-KL', 'RU', 'Kalmykia', NULL, 0),
(3203, 'RU-KLU', 'RU', 'Kaluga', NULL, 0),
(3204, 'RU-KO', 'RU', 'Komi', NULL, 0),
(3205, 'RU-KOP', 'RU', 'Permyakia', NULL, 0),
(3206, 'RU-KOR', 'RU', 'Koryakia', NULL, 0),
(3207, 'RU-KOS', 'RU', 'Kostroma', NULL, 0),
(3208, 'RU-KR', 'RU', 'Karelia', NULL, 0),
(3209, 'RU-KRS', 'RU', 'Kursk', NULL, 0),
(3210, 'RU-KYA', 'RU', 'Krasnoyarsk', NULL, 0),
(3211, 'RU-LEN', 'RU', 'Leningrad', NULL, 0),
(3212, 'RU-LIP', 'RU', 'Lipetsk', NULL, 0),
(3213, 'RU-MAG', 'RU', 'Magadan', NULL, 0),
(3214, 'RU-ME', 'RU', 'Mari El', NULL, 0),
(3215, 'RU-MO', 'RU', 'Mordovia', NULL, 0),
(3216, 'RU-MOS', 'RU', 'Moscow (Province)', NULL, 0),
(3217, 'RU-MOW', 'RU', 'Moscow (City)', NULL, 0),
(3218, 'RU-MUR', 'RU', 'Murmansk', NULL, 0),
(3219, 'RU-NEN', 'RU', 'Nenetsia', NULL, 0),
(3220, 'RU-NGR', 'RU', 'Novgorod', NULL, 0),
(3221, 'RU-NIZ', 'RU', 'Nizhny Novgorod', NULL, 0),
(3222, 'RU-NVS', 'RU', 'Novosibirsk', NULL, 0),
(3223, 'RU-OMS', 'RU', 'Omsk', NULL, 0),
(3224, 'RU-ORE', 'RU', 'Orenburg', NULL, 0),
(3225, 'RU-ORL', 'RU', 'Oryol', NULL, 0),
(3226, 'RU-PER', 'RU', 'Perm', NULL, 0),
(3227, 'RU-PNZ', 'RU', 'Penza', NULL, 0),
(3228, 'RU-PRI', 'RU', 'Primorsky', NULL, 0),
(3229, 'RU-PSK', 'RU', 'Pskov', NULL, 0),
(3230, 'RU-ROS', 'RU', 'Rostov', NULL, 0),
(3231, 'RU-RYA', 'RU', 'Ryazan', NULL, 0),
(3232, 'RU-SA', 'RU', 'Sakha', NULL, 0),
(3233, 'RU-SAK', 'RU', 'Sakhalin', NULL, 0),
(3234, 'RU-SAM', 'RU', 'Samara', NULL, 0),
(3235, 'RU-SAR', 'RU', 'Saratov', NULL, 0),
(3236, 'RU-SE', 'RU', 'North Ossetia', NULL, 0),
(3237, 'RU-SMO', 'RU', 'Smolensk', NULL, 0),
(3238, 'RU-SPE', 'RU', 'St. Petersburg', NULL, 0),
(3239, 'RU-STA', 'RU', 'Stavropol', NULL, 0),
(3240, 'RU-SVE', 'RU', 'Sverdlovsk', NULL, 0),
(3241, 'RU-TA', 'RU', 'Tatarstan', NULL, 0),
(3242, 'RU-TAM', 'RU', 'Tambov', NULL, 0),
(3243, 'RU-TAY', 'RU', 'Taymyria', NULL, 0),
(3244, 'RU-TOM', 'RU', 'Tomsk', NULL, 0),
(3245, 'RU-TUL', 'RU', 'Tula', NULL, 0),
(3246, 'RU-TVE', 'RU', 'Tver', NULL, 0),
(3247, 'RU-TY', 'RU', 'Tuva', NULL, 0),
(3248, 'RU-TYU', 'RU', 'Tyumen', NULL, 0),
(3249, 'RU-UD', 'RU', 'Udmurtia', NULL, 0),
(3250, 'RU-ULY', 'RU', 'Ulynovsk', NULL, 0),
(3251, 'RU-UOB', 'RU', 'Ust-Orda Buryatia', NULL, 0),
(3252, 'RU-VGG', 'RU', 'Volgograd', NULL, 0),
(3253, 'RU-VLA', 'RU', 'Vladimir', NULL, 0),
(3254, 'RU-VLG', 'RU', 'Vologda', NULL, 0),
(3255, 'RU-VOR', 'RU', 'Voronezh', NULL, 0),
(3256, 'RU-YAN', 'RU', 'Yamalia', NULL, 0),
(3257, 'RU-YAR', 'RU', 'Yaroslavl', NULL, 0),
(3258, 'RU-YEV', 'RU', 'Jewish Oblast', NULL, 0),
(3259, 'RW-BU', 'RW', 'Butare', NULL, 0),
(3260, 'RW-BY', 'RW', 'Byumba', NULL, 0),
(3261, 'RW-CY', 'RW', 'Cyangugu', NULL, 0),
(3262, 'RW-GK', 'RW', 'Gikongoro', NULL, 0),
(3263, 'RW-GS', 'RW', 'Gisenyi', NULL, 0),
(3264, 'RW-GT', 'RW', 'Gitarama', NULL, 0),
(3265, 'RW-KG', 'RW', 'Kibungo', NULL, 0),
(3266, 'RW-KR', 'RW', 'Kigali Rurale', NULL, 0),
(3267, 'RW-KV', 'RW', 'Kigali-ville', NULL, 0),
(3268, 'RW-KY', 'RW', 'Kibuye', NULL, 0),
(3269, 'RW-RU', 'RW', 'Ruhengeri', NULL, 0),
(3270, 'RW-UM', 'RW', 'Umutara', NULL, 0),
(3271, 'SA-AQ', 'SA', 'Ash Sharqiyah (Eastern Province)', NULL, 0),
(3272, 'SA-AS', 'SA', '\'Asir', NULL, 0),
(3273, 'SA-BH', 'SA', 'Al Bahah', NULL, 0),
(3274, 'SA-HL', 'SA', 'Ha\'il', NULL, 0),
(3275, 'SA-HS', 'SA', 'Al Hudud ash Shamaliyah', NULL, 0),
(3276, 'SA-JF', 'SA', 'Al Jawf', NULL, 0),
(3277, 'SA-JZ', 'SA', 'Jizan', NULL, 0),
(3278, 'SA-MD', 'SA', 'Al Madinah', NULL, 0),
(3279, 'SA-ML', 'SA', 'Makkah', NULL, 0),
(3280, 'SA-NR', 'SA', 'Najran', NULL, 0),
(3281, 'SA-QS', 'SA', 'Al Qasim', NULL, 0),
(3282, 'SA-RD', 'SA', 'Ar Riyad', NULL, 0),
(3283, 'SA-TB', 'SA', 'Tabuk', NULL, 0),
(3284, 'SB-CE', 'SB', 'Central', NULL, 0),
(3285, 'SB-CH', 'SB', 'Choiseul', NULL, 0),
(3286, 'SB-GC', 'SB', 'Guadalcanal', NULL, 0),
(3287, 'SB-HO', 'SB', 'Honiara', NULL, 0),
(3288, 'SB-IS', 'SB', 'Isabel', NULL, 0),
(3289, 'SB-MK', 'SB', 'Makira', NULL, 0),
(3290, 'SB-ML', 'SB', 'Malaita', NULL, 0),
(3291, 'SB-RB', 'SB', 'Rennell and Bellona', NULL, 0),
(3292, 'SB-TM', 'SB', 'Temotu', NULL, 0),
(3293, 'SB-WE', 'SB', 'Western', NULL, 0),
(3294, 'SC-AB', 'SC', 'Anse Boileau', NULL, 0),
(3295, 'SC-AE', 'SC', 'Anse Etoile', NULL, 0),
(3296, 'SC-AL', 'SC', 'Anse Louis', NULL, 0),
(3297, 'SC-AP', 'SC', 'Anse aux Pins', NULL, 0),
(3298, 'SC-AR', 'SC', 'Anse Royale', NULL, 0),
(3299, 'SC-BA', 'SC', 'Bel Air', NULL, 0),
(3300, 'SC-BL', 'SC', 'Baie Lazare', NULL, 0),
(3301, 'SC-BO', 'SC', 'Bel Ombre', NULL, 0),
(3302, 'SC-BS', 'SC', 'Baie Sainte Anne', NULL, 0),
(3303, 'SC-BV', 'SC', 'Beau Vallon', NULL, 0),
(3304, 'SC-CA', 'SC', 'Cascade', NULL, 0),
(3305, 'SC-DG', 'SC', 'La Digue', NULL, 0),
(3306, 'SC-GL', 'SC', 'Glacis', NULL, 0),
(3307, 'SC-GM', 'SC', 'Grand\' Anse (on Mahe)', NULL, 0),
(3308, 'SC-GP', 'SC', 'Grand\' Anse (on Praslin)', NULL, 0),
(3309, 'SC-MB', 'SC', 'Mont Buxton', NULL, 0),
(3310, 'SC-MF', 'SC', 'Mont Fleuri', NULL, 0),
(3311, 'SC-PG', 'SC', 'Port Glaud', NULL, 0),
(3312, 'SC-PL', 'SC', 'Plaisance', NULL, 0),
(3313, 'SC-PR', 'SC', 'Pointe La Rue', NULL, 0),
(3314, 'SC-RA', 'SC', 'La Riviere Anglaise', NULL, 0),
(3315, 'SC-SL', 'SC', 'Saint Louis', NULL, 0),
(3316, 'SC-TA', 'SC', 'Takamaka', NULL, 0),
(3317, 'SD-ANB', 'SD', 'An Nil al Abyad', NULL, 0),
(3318, 'SD-ANL', 'SD', 'A\'ali an Nil', NULL, 0),
(3319, 'SD-ANZ', 'SD', 'An Nil al Azraq', NULL, 0),
(3320, 'SD-ASH', 'SD', 'Ash Shamaliyah', NULL, 0),
(3321, 'SD-BAM', 'SD', 'Al Bahr al Ahmar', NULL, 0),
(3322, 'SD-BJA', 'SD', 'Bahr al Jabal', NULL, 0),
(3323, 'SD-BRT', 'SD', 'Al Buhayrat', NULL, 0),
(3324, 'SD-GBG', 'SD', 'Gharb Bahr al Ghazal', NULL, 0),
(3325, 'SD-GDA', 'SD', 'Gharb Darfur', NULL, 0),
(3326, 'SD-GIS', 'SD', 'Gharb al Istiwa\'iyah', NULL, 0),
(3327, 'SD-GKU', 'SD', 'Gharb Kurdufan', NULL, 0),
(3328, 'SD-JDA', 'SD', 'Janub Darfur', NULL, 0),
(3329, 'SD-JKU', 'SD', 'Janub Kurdufan', NULL, 0),
(3330, 'SD-JQL', 'SD', 'Junqali', NULL, 0),
(3331, 'SD-JZR', 'SD', 'Al Jazirah', NULL, 0),
(3332, 'SD-KRT', 'SD', 'Al Khartum', NULL, 0),
(3333, 'SD-KSL', 'SD', 'Kassala', NULL, 0),
(3334, 'SD-NNL', 'SD', 'Nahr an Nil', NULL, 0),
(3335, 'SD-QDR', 'SD', 'Al Qadarif', NULL, 0),
(3336, 'SD-SBG', 'SD', 'Shamal Bahr al Ghazal', NULL, 0),
(3337, 'SD-SDA', 'SD', 'Shamal Darfur', NULL, 0),
(3338, 'SD-SIS', 'SD', 'Sharq al Istiwa\'iyah', NULL, 0),
(3339, 'SD-SKU', 'SD', 'Shamal Kurdufan', NULL, 0),
(3340, 'SD-SNR', 'SD', 'Sinnar', NULL, 0),
(3341, 'SD-WDH', 'SD', 'Al Wahdah', NULL, 0),
(3342, 'SD-WRB', 'SD', 'Warab', NULL, 0),
(3343, 'SH-A', 'SH', 'Ascension', NULL, 0),
(3344, 'SH-S', 'SH', 'Saint Helena', NULL, 0),
(3345, 'SH-T', 'SH', 'Tristan da Cunha', NULL, 0),
(3346, 'SK-BA', 'SK', 'Banskobystricky', NULL, 0),
(3347, 'SK-BR', 'SK', 'Bratislavsky', NULL, 0),
(3348, 'SK-KO', 'SK', 'Kosicky', NULL, 0),
(3349, 'SK-NI', 'SK', 'Nitriansky', NULL, 0),
(3350, 'SK-PR', 'SK', 'Presovsky', NULL, 0),
(3351, 'SK-TC', 'SK', 'Trenciansky', NULL, 0),
(3352, 'SK-TV', 'SK', 'Trnavsky', NULL, 0),
(3353, 'SK-ZI', 'SK', 'Zilinsky', NULL, 0),
(3354, 'SL-E', 'SL', 'Eastern', NULL, 0),
(3355, 'SL-N', 'SL', 'Northern', NULL, 0),
(3356, 'SL-S', 'SL', 'Southern', NULL, 0),
(3357, 'SL-W', 'SL', 'Western', NULL, 0),
(3358, 'SM-AC', 'SM', 'Acquaviva', NULL, 0),
(3359, 'SM-BM', 'SM', 'Borgo Maggiore', NULL, 0),
(3360, 'SM-CH', 'SM', 'Chiesanuova', NULL, 0),
(3361, 'SM-DO', 'SM', 'Domagnano', NULL, 0),
(3362, 'SM-FA', 'SM', 'Faetano', NULL, 0),
(3363, 'SM-FI', 'SM', 'Fiorentino', NULL, 0),
(3364, 'SM-MO', 'SM', 'Montegiardino', NULL, 0),
(3365, 'SM-SE', 'SM', 'Serravalle', NULL, 0),
(3366, 'SM-SM', 'SM', 'Citta di San Marino', NULL, 0),
(3367, 'SN-DA', 'SN', 'Dakar', NULL, 0),
(3368, 'SN-DI', 'SN', 'Diourbel', NULL, 0),
(3369, 'SN-FA', 'SN', 'Fatick', NULL, 0),
(3370, 'SN-KA', 'SN', 'Kaolack', NULL, 0),
(3371, 'SN-KO', 'SN', 'Kolda', NULL, 0),
(3372, 'SN-LO', 'SN', 'Louga', NULL, 0),
(3373, 'SN-MA', 'SN', 'Matam', NULL, 0),
(3374, 'SN-SL', 'SN', 'Saint-Louis', NULL, 0),
(3375, 'SN-TA', 'SN', 'Tambacounda', NULL, 0),
(3376, 'SN-TH', 'SN', 'Thies', NULL, 0),
(3377, 'SN-ZI', 'SN', 'Ziguinchor', NULL, 0),
(3378, 'SO-AW', 'SO', 'Awdal', NULL, 0),
(3379, 'SO-BK', 'SO', 'Bakool', NULL, 0),
(3380, 'SO-BN', 'SO', 'Banaadir', NULL, 0),
(3381, 'SO-BR', 'SO', 'Bari', NULL, 0),
(3382, 'SO-BY', 'SO', 'Bay', NULL, 0),
(3383, 'SO-GA', 'SO', 'Galguduud', NULL, 0),
(3384, 'SO-GE', 'SO', 'Gedo', NULL, 0),
(3385, 'SO-HI', 'SO', 'Hiiraan', NULL, 0),
(3386, 'SO-JD', 'SO', 'Jubbada Dhexe', NULL, 0),
(3387, 'SO-JH', 'SO', 'Jubbada Hoose', NULL, 0),
(3388, 'SO-MU', 'SO', 'Mudug', NULL, 0),
(3389, 'SO-NU', 'SO', 'Nugaal', NULL, 0),
(3390, 'SO-SA', 'SO', 'Sanaag', NULL, 0),
(3391, 'SO-SD', 'SO', 'Shabeellaha Dhexe', NULL, 0),
(3392, 'SO-SH', 'SO', 'Shabeellaha Hoose', NULL, 0),
(3393, 'SO-SL', 'SO', 'Sool', NULL, 0),
(3394, 'SO-TO', 'SO', 'Togdheer', NULL, 0),
(3395, 'SO-WG', 'SO', 'Woqooyi Galbeed', NULL, 0),
(3396, 'SR-BR', 'SR', 'Brokopondo', NULL, 0),
(3397, 'SR-CM', 'SR', 'Commewijne', NULL, 0),
(3398, 'SR-CR', 'SR', 'Coronie', NULL, 0),
(3399, 'SR-MA', 'SR', 'Marowijne', NULL, 0),
(3400, 'SR-NI', 'SR', 'Nickerie', NULL, 0),
(3401, 'SR-PA', 'SR', 'Para', NULL, 0),
(3402, 'SR-PM', 'SR', 'Paramaribo', NULL, 0),
(3403, 'SR-SA', 'SR', 'Saramacca', NULL, 0);
INSERT INTO `er_state` (`state_id`, `state`, `country`, `title`, `status`, `tag`) VALUES
(3404, 'SR-SI', 'SR', 'Sipaliwini', NULL, 0),
(3405, 'SR-WA', 'SR', 'Wanica', NULL, 0),
(3406, 'ST-P', 'ST', 'Principe', NULL, 0),
(3407, 'ST-S', 'ST', 'Sao Tome', NULL, 0),
(3408, 'SV-AH', 'SV', 'Ahuachapan', NULL, 0),
(3409, 'SV-CA', 'SV', 'Cabanas', NULL, 0),
(3410, 'SV-CH', 'SV', 'Chalatenango', NULL, 0),
(3411, 'SV-CU', 'SV', 'Cuscatlan', NULL, 0),
(3412, 'SV-LB', 'SV', 'La Libertad', NULL, 0),
(3413, 'SV-MO', 'SV', 'Morazan', NULL, 0),
(3414, 'SV-PZ', 'SV', 'La Paz', NULL, 0),
(3415, 'SV-SA', 'SV', 'Santa Ana', NULL, 0),
(3416, 'SV-SM', 'SV', 'San Miguel', NULL, 0),
(3417, 'SV-SO', 'SV', 'Sonsonate', NULL, 0),
(3418, 'SV-SS', 'SV', 'San Salvador', NULL, 0),
(3419, 'SV-SV', 'SV', 'San Vicente', NULL, 0),
(3420, 'SV-UN', 'SV', 'La Union', NULL, 0),
(3421, 'SV-US', 'SV', 'Usulutan', NULL, 0),
(3422, 'SE-BL', 'SE', 'Blekinge', NULL, 0),
(3423, 'SE-DA', 'SE', 'Dalama', NULL, 0),
(3424, 'SE-GA', 'SE', 'Gavleborg', NULL, 0),
(3425, 'SE-GO', 'SE', 'Gotland', NULL, 0),
(3426, 'SE-HA', 'SE', 'Halland', NULL, 0),
(3427, 'SE-JA', 'SE', 'Jamtland', NULL, 0),
(3428, 'SE-JO', 'SE', 'Jonkping', NULL, 0),
(3429, 'SE-KA', 'SE', 'Kalmar', NULL, 0),
(3430, 'SE-KR', 'SE', 'Kronoberg', NULL, 0),
(3431, 'SE-NO', 'SE', 'Norrbotten', NULL, 0),
(3432, 'SE-OG', 'SE', 'Ostergotland', NULL, 0),
(3433, 'SE-OR', 'SE', 'Orebro', NULL, 0),
(3434, 'SE-SK', 'SE', 'Skane', NULL, 0),
(3435, 'SE-SO', 'SE', 'Sodermanland', NULL, 0),
(3436, 'SE-ST', 'SE', 'Stockholm', NULL, 0),
(3437, 'SE-UP', 'SE', 'Uppdala', NULL, 0),
(3438, 'SE-VB', 'SE', 'Vasterbotten', NULL, 0),
(3439, 'SE-VG', 'SE', 'Vastra Gotaland', NULL, 0),
(3440, 'SE-VL', 'SE', 'Varmland', NULL, 0),
(3441, 'SE-VM', 'SE', 'Vastmanland', NULL, 0),
(3442, 'SE-VN', 'SE', 'Vasternorrland', NULL, 0),
(3443, 'SY-DA', 'SY', 'Dara', NULL, 0),
(3444, 'SY-DI', 'SY', 'Dimashq', NULL, 0),
(3445, 'SY-DZ', 'SY', 'Dayr az Zawr', NULL, 0),
(3446, 'SY-HA', 'SY', 'Al Hasakah', NULL, 0),
(3447, 'SY-HI', 'SY', 'Hims', NULL, 0),
(3448, 'SY-HL', 'SY', 'Halab', NULL, 0),
(3449, 'SY-HM', 'SY', 'Hamah', NULL, 0),
(3450, 'SY-ID', 'SY', 'Idlib', NULL, 0),
(3451, 'SY-LA', 'SY', 'Al Ladhiqiyah', NULL, 0),
(3452, 'SY-QU', 'SY', 'Al Qunaytirah', NULL, 0),
(3453, 'SY-RD', 'SY', 'Rif Dimashq', NULL, 0),
(3454, 'SY-RQ', 'SY', 'Ar Raqqah', NULL, 0),
(3455, 'SY-SU', 'SY', 'As Suwayda', NULL, 0),
(3456, 'SY-TA', 'SY', 'Tartus', NULL, 0),
(3457, 'SZ-H', 'SZ', 'Hhohho', NULL, 0),
(3458, 'SZ-L', 'SZ', 'Lubombo', NULL, 0),
(3459, 'SZ-M', 'SZ', 'Manzini', NULL, 0),
(3460, 'SZ-S', 'SZ', 'Shishelweni', NULL, 0),
(3461, 'TC-AC', 'TC', 'Ambergris Cays', NULL, 0),
(3462, 'TC-DC', 'TC', 'Dellis Cay', NULL, 0),
(3463, 'TC-EC', 'TC', 'East Caicos', NULL, 0),
(3464, 'TC-FC', 'TC', 'French Cay', NULL, 0),
(3465, 'TC-GT', 'TC', 'Grand Turk', NULL, 0),
(3466, 'TC-LW', 'TC', 'Little Water Cay', NULL, 0),
(3467, 'TC-MC', 'TC', 'Middle Caicos', NULL, 0),
(3468, 'TC-NC', 'TC', 'North Caicos', NULL, 0),
(3469, 'TC-PN', 'TC', 'Pine Cay', NULL, 0),
(3470, 'TC-PR', 'TC', 'Providenciales', NULL, 0),
(3471, 'TC-RC', 'TC', 'Parrot Cay', NULL, 0),
(3472, 'TC-SC', 'TC', 'South Caicos', NULL, 0),
(3473, 'TC-SL', 'TC', 'Salt Cay', NULL, 0),
(3474, 'TC-WC', 'TC', 'West Caicos', NULL, 0),
(3475, 'TD-BA', 'TD', 'Batha', NULL, 0),
(3476, 'TD-BE', 'TD', 'Borkou-Ennedi-Tibesti', NULL, 0),
(3477, 'TD-BI', 'TD', 'Biltine', NULL, 0),
(3478, 'TD-CB', 'TD', 'Chari-Baguirmi', NULL, 0),
(3479, 'TD-GU', 'TD', 'Guera', NULL, 0),
(3480, 'TD-KA', 'TD', 'Kanem', NULL, 0),
(3481, 'TD-LA', 'TD', 'Lac', NULL, 0),
(3482, 'TD-LC', 'TD', 'Logone Occidental', NULL, 0),
(3483, 'TD-LR', 'TD', 'Logone Oriental', NULL, 0),
(3484, 'TD-MC', 'TD', 'Moyen-Chari', NULL, 0),
(3485, 'TD-MK', 'TD', 'Mayo-Kebbi', NULL, 0),
(3486, 'TD-OU', 'TD', 'Ouaddai', NULL, 0),
(3487, 'TD-SA', 'TD', 'Salamat', NULL, 0),
(3488, 'TD-TA', 'TD', 'Tandjile', NULL, 0),
(3489, 'TF-A', 'TF', 'Ile Amsterdam', NULL, 0),
(3490, 'TF-C', 'TF', 'Iles Crozet', NULL, 0),
(3491, 'TF-D', 'TF', 'Adelie Land', NULL, 0),
(3492, 'TF-K', 'TF', 'Iles Kerguelen', NULL, 0),
(3493, 'TF-P', 'TF', 'Ile Saint-Paul', NULL, 0),
(3494, 'TG-C', 'TG', 'Centrale', NULL, 0),
(3495, 'TG-K', 'TG', 'Kara', NULL, 0),
(3496, 'TG-M', 'TG', 'Maritime', NULL, 0),
(3497, 'TG-P', 'TG', 'Plateaux', NULL, 0),
(3498, 'TG-S', 'TG', 'Savanes', NULL, 0),
(3499, 'TH-10', 'TH', 'Bangkok', NULL, 0),
(3500, 'TH-11', 'TH', 'Samut Prakan', NULL, 0),
(3501, 'TH-12', 'TH', 'Nonthaburi', NULL, 0),
(3502, 'TH-13', 'TH', 'Pathum Thani', NULL, 0),
(3503, 'TH-14', 'TH', 'Phra Nakhon Si Ayutthaya', NULL, 0),
(3504, 'TH-15', 'TH', 'Ang Thong', NULL, 0),
(3505, 'TH-16', 'TH', 'Lop Buri', NULL, 0),
(3506, 'TH-17', 'TH', 'Sing Buri', NULL, 0),
(3507, 'TH-18', 'TH', 'Chai Nat', NULL, 0),
(3508, 'TH-19', 'TH', 'Saraburi', NULL, 0),
(3509, 'TH-20', 'TH', 'Chon Buri', NULL, 0),
(3510, 'TH-21', 'TH', 'Rayong', NULL, 0),
(3511, 'TH-22', 'TH', 'Chanthaburi', NULL, 0),
(3512, 'TH-23', 'TH', 'Trat', NULL, 0),
(3513, 'TH-24', 'TH', 'Chachoengsao', NULL, 0),
(3514, 'TH-25', 'TH', 'Prachin Buri', NULL, 0),
(3515, 'TH-26', 'TH', 'Nakhon Nayok', NULL, 0),
(3516, 'TH-27', 'TH', 'Sa Kaeo', NULL, 0),
(3517, 'TH-30', 'TH', 'Nakhon Ratchasima', NULL, 0),
(3518, 'TH-31', 'TH', 'Buri Ram', NULL, 0),
(3519, 'TH-32', 'TH', 'Surin', NULL, 0),
(3520, 'TH-33', 'TH', 'Si Sa Ket', NULL, 0),
(3521, 'TH-34', 'TH', 'Ubon Ratchathani', NULL, 0),
(3522, 'TH-35', 'TH', 'Yasothon', NULL, 0),
(3523, 'TH-36', 'TH', 'Chaiyaphum', NULL, 0),
(3524, 'TH-37', 'TH', 'Amnat Charoen', NULL, 0),
(3525, 'TH-39', 'TH', 'Nong Bua Lam Phu', NULL, 0),
(3526, 'TH-40', 'TH', 'Khon Kaen', NULL, 0),
(3527, 'TH-41', 'TH', 'Udon Thani', NULL, 0),
(3528, 'TH-42', 'TH', 'Loei', NULL, 0),
(3529, 'TH-43', 'TH', 'Nong Khai', NULL, 0),
(3530, 'TH-44', 'TH', 'Maha Sarakham', NULL, 0),
(3531, 'TH-45', 'TH', 'Roi Et', NULL, 0),
(3532, 'TH-46', 'TH', 'Kalasin', NULL, 0),
(3533, 'TH-47', 'TH', 'Sakon Nakhon', NULL, 0),
(3534, 'TH-48', 'TH', 'Nakhon Phanom', NULL, 0),
(3535, 'TH-49', 'TH', 'Mukdahan', NULL, 0),
(3536, 'TH-50', 'TH', 'Chiang Mai', NULL, 0),
(3537, 'TH-51', 'TH', 'Lamphun', NULL, 0),
(3538, 'TH-52', 'TH', 'Lampang', NULL, 0),
(3539, 'TH-53', 'TH', 'Uttaradit', NULL, 0),
(3540, 'TH-54', 'TH', 'Phrae', NULL, 0),
(3541, 'TH-55', 'TH', 'Nan', NULL, 0),
(3542, 'TH-56', 'TH', 'Phayao', NULL, 0),
(3543, 'TH-57', 'TH', 'Chiang Rai', NULL, 0),
(3544, 'TH-58', 'TH', 'Mae Hong Son', NULL, 0),
(3545, 'TH-60', 'TH', 'Nakhon Sawan', NULL, 0),
(3546, 'TH-61', 'TH', 'Uthai Thani', NULL, 0),
(3547, 'TH-62', 'TH', 'Kamphaeng Phet', NULL, 0),
(3548, 'TH-63', 'TH', 'Tak', NULL, 0),
(3549, 'TH-64', 'TH', 'Sukhothai', NULL, 0),
(3550, 'TH-65', 'TH', 'Phitsanulok', NULL, 0),
(3551, 'TH-66', 'TH', 'Phichit', NULL, 0),
(3552, 'TH-70', 'TH', 'Ratchaburi', NULL, 0),
(3553, 'TH-71', 'TH', 'Kanchanaburi', NULL, 0),
(3554, 'TH-72', 'TH', 'Suphanburi', NULL, 0),
(3555, 'TH-73', 'TH', 'Nakhon Pathom', NULL, 0),
(3556, 'TH-74', 'TH', 'Samut Sakhon', NULL, 0),
(3557, 'TH-75', 'TH', 'Samut Songkhram', NULL, 0),
(3558, 'TH-76', 'TH', 'Phetchabun', NULL, 0),
(3559, 'TH-77', 'TH', 'Prachuap Khiri Khan', NULL, 0),
(3560, 'TH-78', 'TH', 'Phetchaburi', NULL, 0),
(3561, 'TH-80', 'TH', 'Nakhon Si Thammarat', NULL, 0),
(3562, 'TH-81', 'TH', 'Krabi', NULL, 0),
(3563, 'TH-82', 'TH', 'Phang Nga', NULL, 0),
(3564, 'TH-83', 'TH', 'Phuket', NULL, 0),
(3565, 'TH-84', 'TH', 'Surat Thani', NULL, 0),
(3566, 'TH-85', 'TH', 'Ranong', NULL, 0),
(3567, 'TH-86', 'TH', 'Chumpon', NULL, 0),
(3568, 'TH-90', 'TH', 'Songkhla', NULL, 0),
(3569, 'TH-91', 'TH', 'Satun', NULL, 0),
(3570, 'TH-92', 'TH', 'Trang', NULL, 0),
(3571, 'TH-93', 'TH', 'Phattalung', NULL, 0),
(3572, 'TH-94', 'TH', 'Pattani', NULL, 0),
(3573, 'TH-95', 'TH', 'Yala', NULL, 0),
(3574, 'TH-96', 'TH', 'Narathiwat', NULL, 0),
(3575, 'TH-S', 'TH', 'Pattaya', NULL, 0),
(3576, 'TJ-GB', 'TJ', 'Gorno-Badakhstan', NULL, 0),
(3577, 'TJ-KT', 'TJ', 'Khatlon', NULL, 0),
(3578, 'TJ-SU', 'TJ', 'Sughd', NULL, 0),
(3579, 'TK-A', 'TK', 'Atafu', NULL, 0),
(3580, 'TK-F', 'TK', 'Fakaofo', NULL, 0),
(3581, 'TK-N', 'TK', 'Nukunonu', NULL, 0),
(3582, 'TL-AL', 'TL', 'Aileu', NULL, 0),
(3583, 'TL-AN', 'TL', 'Ainaro', NULL, 0),
(3584, 'TL-BA', 'TL', 'Baucau', NULL, 0),
(3585, 'TL-BO', 'TL', 'Bobonaro', NULL, 0),
(3586, 'TL-CO', 'TL', 'Cova Lima', NULL, 0),
(3587, 'TL-DI', 'TL', 'Dili', NULL, 0),
(3588, 'TL-ER', 'TL', 'Ermera', NULL, 0),
(3589, 'TL-LA', 'TL', 'Lautem', NULL, 0),
(3590, 'TL-LI', 'TL', 'Liquica', NULL, 0),
(3591, 'TL-MF', 'TL', 'Manufahi', NULL, 0),
(3592, 'TL-MT', 'TL', 'Manatuto', NULL, 0),
(3593, 'TL-OE', 'TL', 'Oecussi', NULL, 0),
(3594, 'TL-VI', 'TL', 'Viqueque', NULL, 0),
(3595, 'TM-A', 'TM', 'Ahal Welayaty', NULL, 0),
(3596, 'TM-B', 'TM', 'Balkan Welayaty', NULL, 0),
(3597, 'TM-D', 'TM', 'Dashhowuz Welayaty', NULL, 0),
(3598, 'TM-L', 'TM', 'Lebap Welayaty', NULL, 0),
(3599, 'TM-M', 'TM', 'Mary Welayaty', NULL, 0),
(3600, 'TN-AR', 'TN', 'Ariana', NULL, 0),
(3601, 'TN-BA', 'TN', 'Ben Arous', NULL, 0),
(3602, 'TN-BI', 'TN', 'Bizerte', NULL, 0),
(3603, 'TN-BJ', 'TN', 'Beja', NULL, 0),
(3604, 'TN-GB', 'TN', 'Gabes', NULL, 0),
(3605, 'TN-GF', 'TN', 'Gafsa', NULL, 0),
(3606, 'TN-JE', 'TN', 'Jendouba', NULL, 0),
(3607, 'TN-KB', 'TN', 'Kebili', NULL, 0),
(3608, 'TN-KF', 'TN', 'Kef', NULL, 0),
(3609, 'TN-KR', 'TN', 'Kairouan', NULL, 0),
(3610, 'TN-KS', 'TN', 'Kasserine', NULL, 0),
(3611, 'TN-ME', 'TN', 'Medenine', NULL, 0),
(3612, 'TN-MH', 'TN', 'Mahdia', NULL, 0),
(3613, 'TN-MN', 'TN', 'Manouba', NULL, 0),
(3614, 'TN-MO', 'TN', 'Monastir', NULL, 0),
(3615, 'TN-NA', 'TN', 'Nabeul', NULL, 0),
(3616, 'TN-SD', 'TN', 'Sidi', NULL, 0),
(3617, 'TN-SF', 'TN', 'Sfax', NULL, 0),
(3618, 'TN-SL', 'TN', 'Siliana', NULL, 0),
(3619, 'TN-SO', 'TN', 'Sousse', NULL, 0),
(3620, 'TN-TA', 'TN', 'Tataouine', NULL, 0),
(3621, 'TN-TO', 'TN', 'Tozeur', NULL, 0),
(3622, 'TN-TU', 'TN', 'Tunis', NULL, 0),
(3623, 'TN-ZA', 'TN', 'Zaghouan', NULL, 0),
(3624, 'TO-H', 'TO', 'Ha\'apai', NULL, 0),
(3625, 'TO-T', 'TO', 'Tongatapu', NULL, 0),
(3626, 'TO-V', 'TO', 'Vava\'u', NULL, 0),
(3627, 'TR-ADA', 'TR', 'Adana', NULL, 0),
(3628, 'TR-ADI', 'TR', 'Adiyaman', NULL, 0),
(3629, 'TR-AFY', 'TR', 'Afyonkarahisar', NULL, 0),
(3630, 'TR-AGR', 'TR', 'Agri', NULL, 0),
(3631, 'TR-AKS', 'TR', 'Aksaray', NULL, 0),
(3632, 'TR-AMA', 'TR', 'Amasya', NULL, 0),
(3633, 'TR-ANK', 'TR', 'Ankara', NULL, 0),
(3634, 'TR-ANT', 'TR', 'Antalya', NULL, 0),
(3635, 'TR-ARD', 'TR', 'Ardahan', NULL, 0),
(3636, 'TR-ART', 'TR', 'Artvin', NULL, 0),
(3637, 'TR-AYI', 'TR', 'Aydin', NULL, 0),
(3638, 'TR-BAL', 'TR', 'Balikesir', NULL, 0),
(3639, 'TR-BAR', 'TR', 'Bartin', NULL, 0),
(3640, 'TR-BAT', 'TR', 'Batman', NULL, 0),
(3641, 'TR-BAY', 'TR', 'Bayburt', NULL, 0),
(3642, 'TR-BIL', 'TR', 'Bilecik', NULL, 0),
(3643, 'TR-BIN', 'TR', 'Bingol', NULL, 0),
(3644, 'TR-BIT', 'TR', 'Bitlis', NULL, 0),
(3645, 'TR-BOL', 'TR', 'Bolu', NULL, 0),
(3646, 'TR-BRD', 'TR', 'Burdur', NULL, 0),
(3647, 'TR-BRS', 'TR', 'Bursa', NULL, 0),
(3648, 'TR-CKL', 'TR', 'Canakkale', NULL, 0),
(3649, 'TR-CKR', 'TR', 'Cankiri', NULL, 0),
(3650, 'TR-COR', 'TR', 'Corum', NULL, 0),
(3651, 'TR-DEN', 'TR', 'Denizli', NULL, 0),
(3652, 'TR-DIY', 'TR', 'Diyarbakir', NULL, 0),
(3653, 'TR-DUZ', 'TR', 'Duzce', NULL, 0),
(3654, 'TR-EDI', 'TR', 'Edirne', NULL, 0),
(3655, 'TR-ELA', 'TR', 'Elazig', NULL, 0),
(3656, 'TR-ESK', 'TR', 'Eskisehir', NULL, 0),
(3657, 'TR-EZC', 'TR', 'Erzincan', NULL, 0),
(3658, 'TR-EZR', 'TR', 'Erzurum', NULL, 0),
(3659, 'TR-GAZ', 'TR', 'Gaziantep', NULL, 0),
(3660, 'TR-GIR', 'TR', 'Giresun', NULL, 0),
(3661, 'TR-GMS', 'TR', 'Gumushane', NULL, 0),
(3662, 'TR-HKR', 'TR', 'Hakkari', NULL, 0),
(3663, 'TR-HTY', 'TR', 'Hatay', NULL, 0),
(3664, 'TR-IGD', 'TR', 'Igdir', NULL, 0),
(3665, 'TR-ISP', 'TR', 'Isparta', NULL, 0),
(3666, 'TR-IST', 'TR', 'Istanbul', NULL, 0),
(3667, 'TR-IZM', 'TR', 'Izmir', NULL, 0),
(3668, 'TR-KAH', 'TR', 'Kahramanmaras', NULL, 0),
(3669, 'TR-KAS', 'TR', 'Kastamonu', NULL, 0),
(3670, 'TR-KAY', 'TR', 'Kayseri', NULL, 0),
(3671, 'TR-KLR', 'TR', 'Kirklareli', NULL, 0),
(3672, 'TR-KLS', 'TR', 'Kilis', NULL, 0),
(3673, 'TR-KOC', 'TR', 'Kocaeli', NULL, 0),
(3674, 'TR-KON', 'TR', 'Konya', NULL, 0),
(3675, 'TR-KRB', 'TR', 'Karabuk', NULL, 0),
(3676, 'TR-KRH', 'TR', 'Kirsehir', NULL, 0),
(3677, 'TR-KRK', 'TR', 'Kirikkale', NULL, 0),
(3678, 'TR-KRM', 'TR', 'Karaman', NULL, 0),
(3679, 'TR-KRS', 'TR', 'Kars', NULL, 0),
(3680, 'TR-KUT', 'TR', 'Kutahya', NULL, 0),
(3681, 'TR-MAL', 'TR', 'Malatya', NULL, 0),
(3682, 'TR-MAN', 'TR', 'Manisa', NULL, 0),
(3683, 'TR-MAR', 'TR', 'Mardin', NULL, 0),
(3684, 'TR-MER', 'TR', 'Mersin', NULL, 0),
(3685, 'TR-MUG', 'TR', 'Mugla', NULL, 0),
(3686, 'TR-MUS', 'TR', 'Mus', NULL, 0),
(3687, 'TR-NEV', 'TR', 'Nevsehir', NULL, 0),
(3688, 'TR-NIG', 'TR', 'Nigde', NULL, 0),
(3689, 'TR-ORD', 'TR', 'Ordu', NULL, 0),
(3690, 'TR-OSM', 'TR', 'Osmaniye', NULL, 0),
(3691, 'TR-RIZ', 'TR', 'Rize', NULL, 0),
(3692, 'TR-SAK', 'TR', 'Sakarya', NULL, 0),
(3693, 'TR-SAM', 'TR', 'Samsun', NULL, 0),
(3694, 'TR-SAN', 'TR', 'Sanliurfa', NULL, 0),
(3695, 'TR-SII', 'TR', 'Siirt', NULL, 0),
(3696, 'TR-SIN', 'TR', 'Sinop', NULL, 0),
(3697, 'TR-SIR', 'TR', 'Sirnak', NULL, 0),
(3698, 'TR-SIV', 'TR', 'Sivas', NULL, 0),
(3699, 'TR-TEL', 'TR', 'Tekirdag', NULL, 0),
(3700, 'TR-TOK', 'TR', 'Tokat', NULL, 0),
(3701, 'TR-TRA', 'TR', 'Trabzon', NULL, 0),
(3702, 'TR-TUN', 'TR', 'Tunceli', NULL, 0),
(3703, 'TR-USK', 'TR', 'Usak', NULL, 0),
(3704, 'TR-VAN', 'TR', 'Van', NULL, 0),
(3705, 'TR-YAL', 'TR', 'Yalova', NULL, 0),
(3706, 'TR-YOZ', 'TR', 'Yozgat', NULL, 0),
(3707, 'TR-ZON', 'TR', 'Zonguldak', NULL, 0),
(3708, 'TT-AR', 'TT', 'Arima', NULL, 0),
(3709, 'TT-CH', 'TT', 'Chaguanas', NULL, 0),
(3710, 'TT-CT', 'TT', 'Couva/Tabaquite/Talparo', NULL, 0),
(3711, 'TT-DM', 'TT', 'Diego Martin', NULL, 0),
(3712, 'TT-MR', 'TT', 'Mayaro/Rio Claro', NULL, 0),
(3713, 'TT-PD', 'TT', 'Penal/Debe', NULL, 0),
(3714, 'TT-PF', 'TT', 'Point Fortin', NULL, 0),
(3715, 'TT-PS', 'TT', 'Port of Spain', NULL, 0),
(3716, 'TT-PT', 'TT', 'Princes Town', NULL, 0),
(3717, 'TT-SF', 'TT', 'San Fernando', NULL, 0),
(3718, 'TT-SG', 'TT', 'Sangre Grande', NULL, 0),
(3719, 'TT-SI', 'TT', 'Siparia', NULL, 0),
(3720, 'TT-SL', 'TT', 'San Juan/Laventille', NULL, 0),
(3721, 'TT-TO', 'TT', 'Tobago', NULL, 0),
(3722, 'TT-TP', 'TT', 'Tunapuna/Piarco', NULL, 0),
(3723, 'TV-FUN', 'TV', 'Funafuti', NULL, 0),
(3724, 'TV-NFT', 'TV', 'Nukufetau', NULL, 0),
(3725, 'TV-NLK', 'TV', 'Niulakita', NULL, 0),
(3726, 'TV-NLL', 'TV', 'Nukulaelae', NULL, 0),
(3727, 'TV-NME', 'TV', 'Nanumea', NULL, 0),
(3728, 'TV-NMG', 'TV', 'Nanumanga', NULL, 0),
(3729, 'TV-NTO', 'TV', 'Niutao', NULL, 0),
(3730, 'TV-NUI', 'TV', 'Nui', NULL, 0),
(3731, 'TV-VAI', 'TV', 'Vaitupu', NULL, 0),
(3732, 'TW-CC', 'TW', 'Chia-i city', NULL, 0),
(3733, 'TW-CH', 'TW', 'Chang-hua', NULL, 0),
(3734, 'TW-CI', 'TW', 'Chia-i', NULL, 0),
(3735, 'TW-CL', 'TW', 'Chi-lung', NULL, 0),
(3736, 'TW-HC', 'TW', 'Hsin-chu', NULL, 0),
(3737, 'TW-HL', 'TW', 'Hua-lien', NULL, 0),
(3738, 'TW-HS', 'TW', 'Hsin-chu', NULL, 0),
(3739, 'TW-IL', 'TW', 'I-lan', NULL, 0),
(3740, 'TW-KC', 'TW', 'Kao-hsiung city', NULL, 0),
(3741, 'TW-KH', 'TW', 'Kao-hsiung county', NULL, 0),
(3742, 'TW-KM', 'TW', 'Kin-men', NULL, 0),
(3743, 'TW-LC', 'TW', 'Lien-chiang', NULL, 0),
(3744, 'TW-ML', 'TW', 'Miao-li', NULL, 0),
(3745, 'TW-NT', 'TW', 'Nan-t\'ou', NULL, 0),
(3746, 'TW-PH', 'TW', 'P\'eng-hu', NULL, 0),
(3747, 'TW-PT', 'TW', 'P\'ing-tung', NULL, 0),
(3748, 'TW-TA', 'TW', 'T\'ai-nan', NULL, 0),
(3749, 'TW-TC', 'TW', 'T\'ai-pei city', NULL, 0),
(3750, 'TW-TG', 'TW', 'T\'ai-chung', NULL, 0),
(3751, 'TW-TH', 'TW', 'T\'ai-chung', NULL, 0),
(3752, 'TW-TN', 'TW', 'T\'ai-nan', NULL, 0),
(3753, 'TW-TP', 'TW', 'T\'ai-pei county', NULL, 0),
(3754, 'TW-TT', 'TW', 'T\'ai-tung', NULL, 0),
(3755, 'TW-TY', 'TW', 'T\'ao-yuan', NULL, 0),
(3756, 'TW-YL', 'TW', 'Yun-lin', NULL, 0),
(3757, 'TZ-AR', 'TZ', 'Arusha', NULL, 0),
(3758, 'TZ-DO', 'TZ', 'Dodoma', NULL, 0),
(3759, 'TZ-DS', 'TZ', 'Dar es Salaam', NULL, 0),
(3760, 'TZ-IR', 'TZ', 'Iringa', NULL, 0),
(3761, 'TZ-KA', 'TZ', 'Kagera', NULL, 0),
(3762, 'TZ-KI', 'TZ', 'Kigoma', NULL, 0),
(3763, 'TZ-KJ', 'TZ', 'Kilimanjaro', NULL, 0),
(3764, 'TZ-LN', 'TZ', 'Lindi', NULL, 0),
(3765, 'TZ-MB', 'TZ', 'Mbeya', NULL, 0),
(3766, 'TZ-MO', 'TZ', 'Morogoro', NULL, 0),
(3767, 'TZ-MR', 'TZ', 'Mara', NULL, 0),
(3768, 'TZ-MT', 'TZ', 'Mtwara', NULL, 0),
(3769, 'TZ-MW', 'TZ', 'Mwanza', NULL, 0),
(3770, 'TZ-MY', 'TZ', 'Manyara', NULL, 0),
(3771, 'TZ-PN', 'TZ', 'Pemba North', NULL, 0),
(3772, 'TZ-PS', 'TZ', 'Pemba South', NULL, 0),
(3773, 'TZ-PW', 'TZ', 'Pwani', NULL, 0),
(3774, 'TZ-RK', 'TZ', 'Rukwa', NULL, 0),
(3775, 'TZ-RV', 'TZ', 'Ruvuma', NULL, 0),
(3776, 'TZ-SH', 'TZ', 'Shinyanga', NULL, 0),
(3777, 'TZ-SI', 'TZ', 'Singida', NULL, 0),
(3778, 'TZ-TB', 'TZ', 'Tabora', NULL, 0),
(3779, 'TZ-TN', 'TZ', 'Tanga', NULL, 0),
(3780, 'TZ-ZC', 'TZ', 'Zanzibar Central/South', NULL, 0),
(3781, 'TZ-ZN', 'TZ', 'Zanzibar North', NULL, 0),
(3782, 'TZ-ZU', 'TZ', 'Zanzibar Urban/West', NULL, 0),
(3783, 'UA-CH', 'UA', 'Chernihiv', NULL, 0),
(3784, 'UA-CK', 'UA', 'Cherkasy', NULL, 0),
(3785, 'UA-CR', 'UA', 'Crimea', NULL, 0),
(3786, 'UA-CV', 'UA', 'Chernivtsi', NULL, 0),
(3787, 'UA-DN', 'UA', 'Dnipropetrovs\'k', NULL, 0),
(3788, 'UA-DO', 'UA', 'Donets\'k', NULL, 0),
(3789, 'UA-IV', 'UA', 'Ivano-Frankivs\'k', NULL, 0),
(3790, 'UA-KL', 'UA', 'Kharkiv Kherson', NULL, 0),
(3791, 'UA-KM', 'UA', 'Khmel\'nyts\'kyy', NULL, 0),
(3792, 'UA-KR', 'UA', 'Kirovohrad', NULL, 0),
(3793, 'UA-KV', 'UA', 'Kiev', NULL, 0),
(3794, 'UA-KY', 'UA', 'Kyyiv', NULL, 0),
(3795, 'UA-LU', 'UA', 'Luhans\'k', NULL, 0),
(3796, 'UA-LV', 'UA', 'L\'viv', NULL, 0),
(3797, 'UA-MY', 'UA', 'Mykolayiv', NULL, 0),
(3798, 'UA-OD', 'UA', 'Odesa', NULL, 0),
(3799, 'UA-PO', 'UA', 'Poltava', NULL, 0),
(3800, 'UA-RI', 'UA', 'Rivne', NULL, 0),
(3801, 'UA-SE', 'UA', 'Sevastopol', NULL, 0),
(3802, 'UA-SU', 'UA', 'Sumy', NULL, 0),
(3803, 'UA-TE', 'UA', 'Ternopil\'', NULL, 0),
(3804, 'UA-VI', 'UA', 'Vinnytsya', NULL, 0),
(3805, 'UA-VO', 'UA', 'Volyn\'', NULL, 0),
(3806, 'UA-ZA', 'UA', 'Zaporizhzhya', NULL, 0),
(3807, 'UA-ZH', 'UA', 'Zhytomyr', NULL, 0),
(3808, 'UA-ZK', 'UA', 'Zakarpattya', NULL, 0),
(3809, 'UG-ADJ', 'UG', 'Adjumani', NULL, 0),
(3810, 'UG-APC', 'UG', 'Apac', NULL, 0),
(3811, 'UG-ARU', 'UG', 'Arua', NULL, 0),
(3812, 'UG-BSH', 'UG', 'Bushenyi', NULL, 0),
(3813, 'UG-BUG', 'UG', 'Bugiri', NULL, 0),
(3814, 'UG-BUN', 'UG', 'Bundibugyo', NULL, 0),
(3815, 'UG-BUS', 'UG', 'Busia', NULL, 0),
(3816, 'UG-GUL', 'UG', 'Gulu', NULL, 0),
(3817, 'UG-HOI', 'UG', 'Hoima', NULL, 0),
(3818, 'UG-IGA', 'UG', 'Iganga', NULL, 0),
(3819, 'UG-JIN', 'UG', 'Jinja', NULL, 0),
(3820, 'UG-KAB', 'UG', 'Kaberamaido', NULL, 0),
(3821, 'UG-KAL', 'UG', 'Kalangala', NULL, 0),
(3822, 'UG-KAM', 'UG', 'Kamwenge', NULL, 0),
(3823, 'UG-KAN', 'UG', 'Kanungu', NULL, 0),
(3824, 'UG-KAR', 'UG', 'Kabarole', NULL, 0),
(3825, 'UG-KAS', 'UG', 'Kasese', NULL, 0),
(3826, 'UG-KAY', 'UG', 'Kayunga', NULL, 0),
(3827, 'UG-KBA', 'UG', 'Kibaale', NULL, 0),
(3828, 'UG-KBL', 'UG', 'Kabale', NULL, 0),
(3829, 'UG-KIB', 'UG', 'Kiboga', NULL, 0),
(3830, 'UG-KIS', 'UG', 'Kisoro', NULL, 0),
(3831, 'UG-KIT', 'UG', 'Kitgum', NULL, 0),
(3832, 'UG-KML', 'UG', 'Kamuli', NULL, 0),
(3833, 'UG-KMP', 'UG', 'Kampala', NULL, 0),
(3834, 'UG-KOT', 'UG', 'Kotido', NULL, 0),
(3835, 'UG-KPC', 'UG', 'Kapchorwa', NULL, 0),
(3836, 'UG-KTK', 'UG', 'Katakwi', NULL, 0),
(3837, 'UG-KUM', 'UG', 'Kumi', NULL, 0),
(3838, 'UG-KYE', 'UG', 'Kyenjojo', NULL, 0),
(3839, 'UG-LIR', 'UG', 'Lira', NULL, 0),
(3840, 'UG-LUW', 'UG', 'Luwero', NULL, 0),
(3841, 'UG-MAS', 'UG', 'Masaka', NULL, 0),
(3842, 'UG-MAY', 'UG', 'Mayuge', NULL, 0),
(3843, 'UG-MBA', 'UG', 'Mbale', NULL, 0),
(3844, 'UG-MBR', 'UG', 'Mbarara', NULL, 0),
(3845, 'UG-MOY', 'UG', 'Moyo', NULL, 0),
(3846, 'UG-MPI', 'UG', 'Mpigi', NULL, 0),
(3847, 'UG-MRT', 'UG', 'Moroto', NULL, 0),
(3848, 'UG-MSN', 'UG', 'Masindi', NULL, 0),
(3849, 'UG-MUB', 'UG', 'Mubende', NULL, 0),
(3850, 'UG-MUK', 'UG', 'Mukono', NULL, 0),
(3851, 'UG-NAK', 'UG', 'Nakapiripirit', NULL, 0),
(3852, 'UG-NEB', 'UG', 'Nebbi', NULL, 0),
(3853, 'UG-NKS', 'UG', 'Nakasongola', NULL, 0),
(3854, 'UG-NTU', 'UG', 'Ntungamo', NULL, 0),
(3855, 'UG-PAD', 'UG', 'Pader', NULL, 0),
(3856, 'UG-PAL', 'UG', 'Pallisa', NULL, 0),
(3857, 'UG-RAK', 'UG', 'Rakai', NULL, 0),
(3858, 'UG-RUK', 'UG', 'Rukungiri', NULL, 0),
(3859, 'UG-SEM', 'UG', 'Sembabule', NULL, 0),
(3860, 'UG-SIR', 'UG', 'Sironko', NULL, 0),
(3861, 'UG-SOR', 'UG', 'Soroti', NULL, 0),
(3862, 'UG-TOR', 'UG', 'Tororo', NULL, 0),
(3863, 'UG-WAK', 'UG', 'Wakiso', NULL, 0),
(3864, 'UG-YUM', 'UG', 'Yumbe', NULL, 0),
(3865, 'UM-BI', 'UM', 'Baker Island', NULL, 0),
(3866, 'UM-HI', 'UM', 'Howland Island', NULL, 0),
(3867, 'UM-JA', 'UM', 'Johnston Atoll', NULL, 0),
(3868, 'UM-JI', 'UM', 'Jarvis Island', NULL, 0),
(3869, 'UM-KR', 'UM', 'Kingman Reef', NULL, 0),
(3870, 'UM-MA', 'UM', 'Midway Atoll', NULL, 0),
(3871, 'UM-NI', 'UM', 'Navassa Island', NULL, 0),
(3872, 'UM-PA', 'UM', 'Palmyra Atoll', NULL, 0),
(3873, 'UM-WI', 'UM', 'Wake Island', NULL, 0),
(3874, 'AK', 'US', 'Alaska', NULL, 0),
(3875, 'AL', 'US', 'Alabama', NULL, 0),
(3876, 'AR', 'US', 'Arkansas', NULL, 0),
(3877, 'AS', 'US', 'American Samoa', NULL, 0),
(3878, 'AZ', 'US', 'Arizona', NULL, 0),
(3879, 'CA', 'US', 'California', NULL, 0),
(3880, 'CO', 'US', 'Colorado', NULL, 0),
(3881, 'CT', 'US', 'Connecticut', NULL, 0),
(3882, 'DC', 'US', 'District of Columbia', NULL, 0),
(3883, 'DE', 'US', 'Delaware', NULL, 0),
(3884, 'FL', 'US', 'Florida', NULL, 0),
(3885, 'GA', 'US', 'Georgia', NULL, 0),
(3886, 'GU', 'US', 'Guam', NULL, 0),
(3887, 'HI', 'US', 'Hawaii', NULL, 0),
(3888, 'IA', 'US', 'Iowa', NULL, 0),
(3889, 'ID', 'US', 'Idaho', NULL, 0),
(3890, 'IL', 'US', 'Illinois', NULL, 0),
(3891, 'IN', 'US', 'Indiana', NULL, 0),
(3892, 'KS', 'US', 'Kansas', NULL, 0),
(3893, 'KY', 'US', 'Kentucky', NULL, 0),
(3894, 'LA', 'US', 'Louisiana', NULL, 0),
(3895, 'MA', 'US', 'Massachusetts', NULL, 0),
(3896, 'MD', 'US', 'Maryland', NULL, 0),
(3897, 'ME', 'US', 'Maine', NULL, 0),
(3898, 'MI', 'US', 'Michigan', NULL, 0),
(3899, 'MN', 'US', 'Minnesota', NULL, 0),
(3900, 'MO', 'US', 'Missouri', NULL, 0),
(3901, 'MP', 'US', 'Northern Mariana Islands', NULL, 0),
(3902, 'MS', 'US', 'Mississippi', NULL, 0),
(3903, 'MT', 'US', 'Montana', NULL, 0),
(3904, 'NC', 'US', 'North Carolina', NULL, 0),
(3905, 'ND', 'US', 'North Dakota', NULL, 0),
(3906, 'NE', 'US', 'Nebraska', NULL, 0),
(3907, 'NH', 'US', 'New Hampshire', NULL, 0),
(3908, 'NJ', 'US', 'New Jersey', NULL, 0),
(3909, 'NM', 'US', 'New Mexico', NULL, 0),
(3910, 'NV', 'US', 'Nevada', NULL, 0),
(3911, 'NY', 'US', 'New York', NULL, 0),
(3912, 'OH', 'US', 'Ohio', NULL, 0),
(3913, 'OK', 'US', 'Oklahoma', NULL, 0),
(3914, 'OR', 'US', 'Oregon', NULL, 0),
(3915, 'PA', 'US', 'Pennsylvania', NULL, 0),
(3916, 'PR', 'US', 'Puerto Rico', NULL, 0),
(3917, 'RI', 'US', 'Rhode Island', NULL, 0),
(3918, 'SC', 'US', 'South Carolina', NULL, 0),
(3919, 'SD', 'US', 'South Dakota', NULL, 0),
(3920, 'TN', 'US', 'Tennessee', NULL, 0),
(3921, 'TX', 'US', 'Texas', NULL, 0),
(3922, 'UM', 'US', 'U.S. Minor Outlying Islands', NULL, 0),
(3923, 'UT', 'US', 'Utah', NULL, 0),
(3924, 'VA', 'US', 'Virginia', NULL, 0),
(3925, 'VI', 'US', 'Virgin Islands of the U.S.', NULL, 0),
(3926, 'VT', 'US', 'Vermont', NULL, 0),
(3927, 'WA', 'US', 'Washington', NULL, 0),
(3928, 'WI', 'US', 'Wisconsin', NULL, 0),
(3929, 'WV', 'US', 'West Virginia', NULL, 0),
(3930, 'WY', 'US', 'Wyoming', NULL, 0),
(3931, 'AA', 'US', 'Armed Forces Americas (except Canada)', NULL, 0),
(3932, 'AE', 'US', 'Armed Forces Europe/Africa/Canada', NULL, 0),
(3933, 'AP', 'US', 'Armed Forces Pacific', NULL, 0),
(3934, 'UY-AR', 'UY', 'Artigas', NULL, 0),
(3935, 'UY-CA', 'UY', 'Canelones', NULL, 0),
(3936, 'UY-CL', 'UY', 'Cerro Largo', NULL, 0),
(3937, 'UY-CO', 'UY', 'Colonia', NULL, 0),
(3938, 'UY-DU', 'UY', 'Durazno', NULL, 0),
(3939, 'UY-FA', 'UY', 'Florida', NULL, 0),
(3940, 'UY-FS', 'UY', 'Flores', NULL, 0),
(3941, 'UY-LA', 'UY', 'Lavalleja', NULL, 0),
(3942, 'UY-MA', 'UY', 'Maldonado', NULL, 0),
(3943, 'UY-MO', 'UY', 'Montevideo', NULL, 0),
(3944, 'UY-PA', 'UY', 'Paysandu', NULL, 0),
(3945, 'UY-RN', 'UY', 'Rio Negro', NULL, 0),
(3946, 'UY-RO', 'UY', 'Rocha', NULL, 0),
(3947, 'UY-RV', 'UY', 'Rivera', NULL, 0),
(3948, 'UY-SJ', 'UY', 'San Jose', NULL, 0),
(3949, 'UY-SL', 'UY', 'Salto', NULL, 0),
(3950, 'UY-SO', 'UY', 'Soriano', NULL, 0),
(3951, 'UY-TT', 'UY', 'Treinta y Tres', NULL, 0),
(3952, 'UZ-AN', 'UZ', 'Andijon', NULL, 0),
(3953, 'UZ-BU', 'UZ', 'Buxoro', NULL, 0),
(3954, 'UZ-FA', 'UZ', 'Farg\'ona', NULL, 0),
(3955, 'UZ-JI', 'UZ', 'Jizzax', NULL, 0),
(3956, 'UZ-NG', 'UZ', 'Namangan', NULL, 0),
(3957, 'UZ-NW', 'UZ', 'Navoiy', NULL, 0),
(3958, 'UZ-QA', 'UZ', 'Qashqadaryo', NULL, 0),
(3959, 'UZ-QR', 'UZ', 'Qoraqalpog\'iston Republikasi', NULL, 0),
(3960, 'UZ-SA', 'UZ', 'Samarqand', NULL, 0),
(3961, 'UZ-SI', 'UZ', 'Sirdaryo', NULL, 0),
(3962, 'UZ-SU', 'UZ', 'Surxondaryo', NULL, 0),
(3963, 'UZ-TK', 'UZ', 'Toshkent city', NULL, 0),
(3964, 'UZ-TO', 'UZ', 'Toshkent region', NULL, 0),
(3965, 'UZ-XO', 'UZ', 'Xorazm', NULL, 0),
(3966, 'VC-A', 'VC', 'Saint Andrew', NULL, 0),
(3967, 'VC-C', 'VC', 'Charlotte', NULL, 0),
(3968, 'VC-D', 'VC', 'Saint David', NULL, 0),
(3969, 'VC-G', 'VC', 'Saint George', NULL, 0),
(3970, 'VC-P', 'VC', 'Saint Patrick', NULL, 0),
(3971, 'VC-R', 'VC', 'Grenadines', NULL, 0),
(3972, 'VE-A', 'VE', 'Federal District', NULL, 0),
(3973, 'VE-B', 'VE', 'Anzoategui', NULL, 0),
(3974, 'VE-C', 'VE', 'Apure', NULL, 0),
(3975, 'VE-D', 'VE', 'Aragua', NULL, 0),
(3976, 'VE-E', 'VE', 'Barinas', NULL, 0),
(3977, 'VE-F', 'VE', 'Bolivar', NULL, 0),
(3978, 'VE-G', 'VE', 'Carabobo', NULL, 0),
(3979, 'VE-H', 'VE', 'Cojedes', NULL, 0),
(3980, 'VE-I', 'VE', 'Falcon', NULL, 0),
(3981, 'VE-J', 'VE', 'Guarico', NULL, 0),
(3982, 'VE-K', 'VE', 'Lara', NULL, 0),
(3983, 'VE-L', 'VE', 'Merida', NULL, 0),
(3984, 'VE-M', 'VE', 'Miranda', NULL, 0),
(3985, 'VE-N', 'VE', 'Monagas', NULL, 0),
(3986, 'VE-O', 'VE', 'Nueva Esparta', NULL, 0),
(3987, 'VE-P', 'VE', 'Portuguesa', NULL, 0),
(3988, 'VE-R', 'VE', 'Sucre', NULL, 0),
(3989, 'VE-S', 'VE', 'Tachira', NULL, 0),
(3990, 'VE-T', 'VE', 'Trujillo', NULL, 0),
(3991, 'VE-U', 'VE', 'Yaracuy', NULL, 0),
(3992, 'VE-V', 'VE', 'Zulia', NULL, 0),
(3993, 'VE-W', 'VE', 'Federal Dependency', NULL, 0),
(3994, 'VE-X', 'VE', 'Vargas', NULL, 0),
(3995, 'VE-Y', 'VE', 'Delta Amacuro', NULL, 0),
(3996, 'VE-Z', 'VE', 'Amazonas', NULL, 0),
(3997, 'VI-C', 'VI', 'Saint Croix', NULL, 0),
(3998, 'VI-J', 'VI', 'Saint John', NULL, 0),
(3999, 'VI-T', 'VI', 'Saint Thomas', NULL, 0),
(4000, 'VN-AG', 'VN', 'An Giang', NULL, 0),
(4001, 'VN-BC', 'VN', 'Bac Ninh', NULL, 0),
(4002, 'VN-BG', 'VN', 'Bac Giang', NULL, 0),
(4003, 'VN-BH', 'VN', 'Binh Dinh', NULL, 0),
(4004, 'VN-BK', 'VN', 'Bac Kan', NULL, 0),
(4005, 'VN-BL', 'VN', 'Bac Lieu', NULL, 0),
(4006, 'VN-BN', 'VN', 'Ben Tre', NULL, 0),
(4007, 'VN-BP', 'VN', 'Binh Phuoc', NULL, 0),
(4008, 'VN-BR', 'VN', 'Ba Ria-Vung Tau', NULL, 0),
(4009, 'VN-BT', 'VN', 'Binh Thuan', NULL, 0),
(4010, 'VN-BU', 'VN', 'Binh Duong', NULL, 0),
(4011, 'VN-CB', 'VN', 'Cao Bang', NULL, 0),
(4012, 'VN-CM', 'VN', 'Ca Mau', NULL, 0),
(4013, 'VN-CT', 'VN', 'Can Tho', NULL, 0),
(4014, 'VN-DB', 'VN', 'Dien Bien', NULL, 0),
(4015, 'VN-DG', 'VN', 'Dak Nong', NULL, 0),
(4016, 'VN-DI', 'VN', 'Dong Nai', NULL, 0),
(4017, 'VN-DL', 'VN', 'Dak Lak', NULL, 0),
(4018, 'VN-DN', 'VN', 'Da Nang', NULL, 0),
(4019, 'VN-DT', 'VN', 'Dong Thap', NULL, 0),
(4020, 'VN-GL', 'VN', 'Gia Lai', NULL, 0),
(4021, 'VN-HB', 'VN', 'Hoa Binh', NULL, 0),
(4022, 'VN-HC', 'VN', 'Ho Chin Minh', NULL, 0),
(4023, 'VN-HD', 'VN', 'Hai Duong', NULL, 0),
(4024, 'VN-HG', 'VN', 'Ha Giang', NULL, 0),
(4025, 'VN-HH', 'VN', 'Ha Tinh', NULL, 0),
(4026, 'VN-HI', 'VN', 'Ha Noi', NULL, 0),
(4027, 'VN-HM', 'VN', 'Ha Nam', NULL, 0),
(4028, 'VN-HP', 'VN', 'Hai Phong', NULL, 0),
(4029, 'VN-HT', 'VN', 'Ha Tay', NULL, 0),
(4030, 'VN-HU', 'VN', 'Hau Giang', NULL, 0),
(4031, 'VN-HY', 'VN', 'Hung Yen', NULL, 0),
(4032, 'VU-MA', 'VU', 'Malampa', NULL, 0),
(4033, 'VU-PE', 'VU', 'Penama', NULL, 0),
(4034, 'VU-SA', 'VU', 'Sanma', NULL, 0),
(4035, 'VU-SH', 'VU', 'Shefa', NULL, 0),
(4036, 'VU-TA', 'VU', 'Tafea', NULL, 0),
(4037, 'VU-TO', 'VU', 'Torba', NULL, 0),
(4038, 'WF-A', 'WF', 'Alo', NULL, 0),
(4039, 'WF-S', 'WF', 'Sigave', NULL, 0),
(4040, 'WF-W', 'WF', 'Wallis', NULL, 0),
(4041, 'WS-AI', 'WS', 'Aiga-i-le-Tai', NULL, 0),
(4042, 'WS-AN', 'WS', 'A\'ana', NULL, 0),
(4043, 'WS-AT', 'WS', 'Atua', NULL, 0),
(4044, 'WS-FA', 'WS', 'Fa\'asaleleaga', NULL, 0),
(4045, 'WS-GE', 'WS', 'Gaga\'emauga', NULL, 0),
(4046, 'WS-GF', 'WS', 'Gagaifomauga', NULL, 0),
(4047, 'WS-PA', 'WS', 'Palauli', NULL, 0),
(4048, 'WS-SA', 'WS', 'Satupa\'itea', NULL, 0),
(4049, 'WS-TU', 'WS', 'Tuamasaga', NULL, 0),
(4050, 'WS-VF', 'WS', 'Va\'a-o-Fonoti', NULL, 0),
(4051, 'WS-VS', 'WS', 'Vaisigano', NULL, 0),
(4052, 'YE-AB', 'YE', 'Abyan', NULL, 0),
(4053, 'YE-AD', 'YE', 'Adan', NULL, 0),
(4054, 'YE-AM', 'YE', 'Amran', NULL, 0),
(4055, 'YE-BA', 'YE', 'Al Bayda', NULL, 0),
(4056, 'YE-DA', 'YE', 'Ad Dali', NULL, 0),
(4057, 'YE-DH', 'YE', 'Dhamar', NULL, 0),
(4058, 'YE-HD', 'YE', 'Hadramawt', NULL, 0),
(4059, 'YE-HJ', 'YE', 'Hajjah', NULL, 0),
(4060, 'YE-HU', 'YE', 'Al Hudaydah', NULL, 0),
(4061, 'YE-IB', 'YE', 'Ibb', NULL, 0),
(4062, 'YE-JA', 'YE', 'Al Jawf', NULL, 0),
(4063, 'YE-LA', 'YE', 'Lahij', NULL, 0),
(4064, 'YE-MA', 'YE', 'Ma\'rib', NULL, 0),
(4065, 'YE-MR', 'YE', 'Al Mahrah', NULL, 0),
(4066, 'YE-MW', 'YE', 'Al Mahwit', NULL, 0),
(4067, 'YE-SD', 'YE', 'Sa\'dah', NULL, 0),
(4068, 'YE-SH', 'YE', 'Shabwah', NULL, 0),
(4069, 'YE-SN', 'YE', 'San\'a', NULL, 0),
(4070, 'YE-TA', 'YE', 'Ta\'izz', NULL, 0),
(4071, 'ZA-EC', 'ZA', 'Eastern Cape', NULL, 0),
(4072, 'ZA-FS', 'ZA', 'Free State', NULL, 0),
(4073, 'ZA-GT', 'ZA', 'Gauteng', NULL, 0),
(4074, 'ZA-KN', 'ZA', 'KwaZulu-Natal', NULL, 0),
(4075, 'ZA-LP', 'ZA', 'Limpopo', NULL, 0),
(4076, 'ZA-MP', 'ZA', 'Mpumalanga', NULL, 0),
(4077, 'ZA-NC', 'ZA', 'Northern Cape', NULL, 0),
(4078, 'ZA-NW', 'ZA', 'North West', NULL, 0),
(4079, 'ZA-WC', 'ZA', 'Western Cape', NULL, 0),
(4080, 'ZM-CB', 'ZM', 'Copperbelt Province', NULL, 0),
(4081, 'ZM-CE', 'ZM', 'Central Province', NULL, 0),
(4082, 'ZM-EA', 'ZM', 'Eastern Province', NULL, 0),
(4083, 'ZM-LK', 'ZM', 'Lusaka Province', NULL, 0),
(4084, 'ZM-LP', 'ZM', 'Luapula Province', NULL, 0),
(4085, 'ZM-NO', 'ZM', 'Northern Province', NULL, 0),
(4086, 'ZM-NW', 'ZM', 'North-Western Province', NULL, 0),
(4087, 'ZM-SO', 'ZM', 'Southern Province', NULL, 0),
(4088, 'ZM-WE', 'ZM', 'Western Province', NULL, 0),
(4089, 'ZW-BU', 'ZW', 'Bulawayo (city)', NULL, 0),
(4090, 'ZW-HA', 'ZW', 'Harare (city)', NULL, 0),
(4091, 'ZW-MC', 'ZW', 'Mashonaland Central', NULL, 0),
(4092, 'ZW-MD', 'ZW', 'Midlands', NULL, 0),
(4093, 'ZW-ME', 'ZW', 'Mashonaland East', NULL, 0),
(4094, 'ZW-ML', 'ZW', 'Manicaland', NULL, 0),
(4095, 'ZW-MN', 'ZW', 'Matabeleland North', NULL, 0),
(4096, 'ZW-MS', 'ZW', 'Matabeleland South', NULL, 0),
(4097, 'ZW-MV', 'ZW', 'Masvingo', NULL, 0),
(4098, 'ZW-MW', 'ZW', 'Mashonaland West', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `er_store`
--

CREATE TABLE `er_store` (
  `store_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `blob_value` mediumblob,
  `expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_store`
--

INSERT INTO `er_store` (`store_id`, `name`, `value`, `blob_value`, `expires`) VALUES
(2, 'db_version', '6.1.7', NULL, NULL),
(3, 'upgrades-list', NULL, 0x613a333a7b733a373a225f6c6f61646564223b693a313538393438353237343b733a31303a225f6469736d6973736564223b4e3b733a353a226974656d73223b613a313a7b693a303b4f3a383a22737464436c617373223a393a7b733a343a2274797065223b733a343a22636f7265223b733a323a226964223b733a343a22636f7265223b733a353a227469746c65223b733a31363a224245544120614d656d6265722050726f223b733a373a2276657273696f6e223b733a31303a22362e322e322d42455441223b733a343a2264617465223b733a31303a22323032302d30352d3131223b733a373a22757267656e6379223b733a363a226e6f726d616c223b733a373a22636865636b6564223b733a313a2231223b733a373a226170692d75726c223b733a35373a2268747470733a2f2f7777772e616d656d6265722e636f6d2f616d656d6265722f617069322f6367692d757067726164652d646f776e6c6f6164223b733a343a2274657874223b733a343930363a224368616e6765732073696e636520362e312e373a0a0a362e322e3220323032302d30352d31312032323a34393a3436202b303430300a20202020416464206d697373696e672072657365742e63737320616e6420736974652d646973742e6373732066696c657320746f2072656c656173650a2020202055736520756e6971756520494420666f722061677265656d656e747320656c656d656e74732048544d4c20636f64650a202020204f617574683a2074726967676572206576656e742056616c69646174655361766564466f726d20666f722072656769737465720a202020205472616e736c6174696f6e2066696c657320757064617465640a0a362e322e3120323032302d30352d30372031353a33313a3136202b303430300a202020204164646564202671756f743b776f6666322671756f743b20696e746f20726f6f74202e68746163636573732066696c6520286e6f742075706461746564206f6e2075706772616465290a20202020416464206261636b2076696577732f7075626c69632f2e687461636365737320696e746f206275696c6420286d697373696e6720696e20362e322e30290a20202020446f6e6174696f6e20706c7567696e2066697865640a20202020446f206e6f742073686f77202671756f743b7061796d656e7420616c72656164792070726f6365737365642671756f743b206572726f727320616e6420646f206e6f74206c6f672073756368206572726f72732e205265646972656374207573657220746f206d656d62657226233033393b73207061676520696e73746561642e0a2020202052455354204150493a2046697865642062756720726567697374726174696f6e20656d61696c73207761736e26233033393b742073656e74207768656e2075736572207761732063726561746564207468726f756768204150490a20202020476f636172646c65737350524f3a207570646174656420737570706f727465642063757272656e63696573206c6973740a202020204e6577736c65747465723a20646f206e6f7420746f756368207469746c657320666f72206578697374696e67206c69737473206f6e2073796e63202d2061646d696e2063616e20637573746f6d697a652069740a202020204c6f67202671756f743b6578706f72742671756f743b20616374696f6e20746f2061646d696e206c6f670a20202020466978206d656e75207374796c6520776974682044495649207468656d650a0a362e322e3020323032302d30342d32392031323a35363a3534202b303430300a202020205265776f726b656420696e7465726e616c204a617661536372697074206c696272617269657320666f722066726f6e74656e6420616e64206261636b656e64207061676573202d20776f726b73206d75636820666173746572206e6f770a20202020614d656d62657220646f63756d656e746174696f6e207265776f726b65642c20636f6e746578742068656c7020666f7220706c7567696e732061646465640a20202020446973616c6c6f77206f70656e696e6720614d656d62657220706167657320696e20696672616d65206f6e2033726420706172747920646f6d61696e7320746f2061766f696420636c69636b6a61636b696e672061747461636b730a20202020496d70726f7665642052657365742041646d696e2050617373776f726420466c6f770a0a2020202050726f64756374204f7074696f6e733a204162696c69747920746f20616464204465736372697074696f6e20666f722070726f64756374206f7074696f6e730a202020205570677261646573202d20646f206e6f742067657420696e766f6963657320776974682065787069726564206163636573730a202020204669786564206275673a20496e636f72726563742075706772616465206c696e6b206265686176696f757220696e2041637469766520737562736372697074696f6e73207769646765742e2057726f6e6720696e766f696365207761732063686f73656e20746f20757067726164650a20202020536f6c696420436f6c6f72205468656d653a20486561646572204d656e750a202020204f6175746832204d6f64756c653a20656e61626c6520504b434520737570706f72742e0a202020204162696c69747920746f20436f6e6669677572652064656570206d656e75206c6576656c730a20202020416d5f4c6974653a3a6765745174792829206d6574686f642061646465640a20202020416464656420746f756368206576656e7420737570706f727420666f72206a71756572792075690a202020202671756f743b636f70792d746f2d636c6970626f6172642671756f743b206f7074696f6e20666f722067656e6572616c20616666696c69617465206c696e6b0a202020205061796d656e7420706c7567696e733a20686964652065787472612073657474696e67732062792064656661756c742e0a20202020495320454d50545920636f6e646974696f6e20666f72206d756c74695f73656c6563742f6d756c74695f75706c6f6164206669656c64730a202020204669786564206275673a20496e667573696f6e536f667420706c7567696e20756e61626c6520746f2075706461746520757365726e616d652f70617373776f72642e0a2020202070646f5f6f7074696f6e732063616e206265207365742077697468696e20636f6e6669672e7068702066696c650a202020204275672046697865643a2064656661756c7420636f75706f6e20666f7220636f75706f6e20627269636b2077697468696e206669656c647365740a20202020427269636b20436f6e646974696f6e616c20446973706c61793a204162696c69747920746f2063686f6f73652026233033393b416e79204d6174636826233033393b7c26233033393b416c6c204d6174636826233033393b0a202020206a5175657279206c696272617279207570646174656420666f7220766964656f204a5320636f64650a20202020627567206669786564202d207265636f676e697a6520617564696f2f6d703320617320617564696f0a202020204162696c69747920746f2063616c63756c61746520616e6420616464205469657220636f6d6d697373696f6e73207768656e2061646d696e20616464206d616e75616c20636f6d6d697373696f6e20746f20616666696c696174652e0a202020204f7074696f6e7320456469746f723a206162696c69747920746f20736f7274206f7074696f6e730a202020204f7074696f6e7320456469746f723a204162696c69747920746f204578706f7274204f7074696f6e730a20202020427567206669786564202d2075736572206c6f6f6b757020646964206e6f7420776f726b20726967687420617420456d61696c55736572732073656374696f6e0a202020204162696c69747920746f2075736520637573746f6d207061676520666f722041636365737320466f7262696464656e0a20202020416666696c696174653a2073686f77207374617469737469637320666f7220726563656e7420706572696f64732066697273740a202020206d6178696d697a652061626f76652075692d66726f6e74207768656e20636b656469746f72207573656420696e206469616c6f6775650a202020204275672046697865643a20536f667473616c65202d2072657370656374206f7074696f6e20686964655f657870697265645f6c6963656e7365730a20202020436f75706f6e2077697468206162736f6c75746520646973636f756e743a2066697820646973636f756e7420646973747269627574696f6e206265747765656e206974656d732028726f756e64206572726f72290a20202020456d61696c20636f6e6669726d6174696f6e2074656d706c617465202d20757365206d6f7265207661726961626c65730a2020202061646d696e2d736574757020737065656420696d70726f76656d656e74202d206c617a7920696e697420706c7567696e20736574757020666f726d730a2020202047726964733a2061766f6964207573656c6573732074657874206c696b652026233033393b73686f77696e67207265636f72647320312d312066726f6d203126233033393b0a202020206f7574707574206d61736b6564204950206164647265737320696e2061646d696e20554920666f722062657474657220707269766163790a202020204164646564204162696c69747920746f20726573656e64207061796d656e74207265636569707420656d61696c0a2020202053686f7720746f74616c20636f75706f6e20726576656e7565206f6e20436f75706f6e2075736167652073637265656e0a202020204d61737320416374696f6e3a20416d656e6420416363657373205065726d697373696f6e0a20202020416476616e636564205365617263683a204e4f5420494e20636f6e646974696f6e0a0a2020202048656c706465736b3a0a202020202020202041646420456d6f6a692050616e656c20746f20726573706f6e7365206469616c6f670a2020202020202020626f6c6420616e64206974616c696320666f726d617420746f2068656c706465736b206d657373616765730a202020202020202041646420736e69707065747320746f206d656e750a20202020202020204164642043617465676f7269657320666f72207265706c7920736e6970706574730a20202020202020204d617373205469636b6574205265706c7920616374696f6e0a202020202020202053686f7720696e206772696420696620736f6d652061646d696e20616c726561647920776f726b696e67206f6e207469636b65740a20202020202020204162696c69747920746f206d616e61676520736f7274206f72646572206f66207265706c7920736e6970706574730a0a202020205061796d656e74730a2020202020202020456c61766f6e207061796d656e7420706c7567696e0a2020202020202020536d61727444656269743a207265662f7075626c696349640a2020202020202020536d61727444656269743a2070726f63657373205375636365737366756c20436f6c6c656374696f6e205265706f72740a2020202020202020536d61727444656269743a206162696c69747920746f20636f6e6669677572652073616e64626f78206163636f756e740a2020202020202020536d61727444656269743a206c6561642074696d6520666f7220726562696c6c730a202020202020202050617970616c3a2070726f7065722075726c20746f2063616e63656c20737562736372697074696f6e0a2020202020202020526f626f6b617373613a20726563757272696e67207061796d656e7420706c7567696e2061646465640a202020202020202050617950616c20457870726573733a206164642070726f64756374206e616d65206f662062696c6c696e672070726f66696c65206465736372697074696f6e0a20202020202020204b6f6e6e656b74697665207061796d656e7420706c7567696e2061646465640a202020202020202053747269706520736f75726365732070726f626c656d202671756f743b496e76616c69642073746174656d656e742064657363726970746f722e2043616e6e6f7420636f6e7461696e207468652063686172616374657273202f2c20282c20292c207b2c206f72207d2671756f743b2066697865640a0a20202020496e746567726174696f6e730a202020202020202050687042423a20636f6d7061746962696c697479207769746820332e330a20202020202020205a656e646465736b3a204164646564207461677320737570706f72740a20202020202020205865726f6170693a20616d6f756e74732066697865640a20202020202020204d61676f776172653a207570646174652070617373776f72642066697865640a2020202020202020496e766973696f6e343a2073736f2066697865640a2020202020202020436572623920696e746567726174696f6e20706c7567696e0a20202020202020204e657720506c7567696e3a20496e746567726174696f6e207769746820476f546f576562696e61720a2020202020202020534d463a207373692066697865640a202020202020202041637469766563616d706169676e3a20646f206e6f7420656d70747920666972737420616e64206c617374206e616d652028736b6970207468657365206669656c64732069662077652068617665206e6f742076616c7565290a20202020202020204d61696c6368696d7020706c7567696e3a204164646564206162696c69747920746f20736574204d61696c6368696d70204d65726765206669656c64732066726f6d20614d656d62657226233033393b732070726f66696c6520696e666f726d6174696f6e0a20202020202020204d61696c4368696d7020506c7567696e3a204164646564206d65726765207461677320737570706f72740a0a20202020506c7567696e730a2020202020202020446f6e6174696f6e20706c7567696e3a20656d6f74696f6e616c206c61796f75742077697468206d696e696d756d213d3020616e6420616c6c6f7720746f20736b697020646f6e6174696f6e0a2020202020202020437265646974733a204c6f77204c6576656c2055736572204e6f74696669636174696f6e0a20202020202020207363686564756c652d616363657373206d6f72652067656e746c652077617920746f2068616e646c652077726f6e6720636f6e66696775726174696f6e0a0a223b7d7d7d, NULL),
(107, 'cron-last-run', '1589540563', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `er_store_rebuild`
--

CREATE TABLE `er_store_rebuild` (
  `store_rebuild_id` int(10) UNSIGNED NOT NULL,
  `rebuild_name` char(32) NOT NULL,
  `session_id` char(32) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_translation`
--

CREATE TABLE `er_translation` (
  `language` varchar(10) NOT NULL,
  `translations` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `er_translation`
--

INSERT INTO `er_translation` (`language`, `translations`) VALUES
('en', 'a:1:{s:25:\"aMember Pro Control Panel\";s:13:\"Control Panel\";}');

-- --------------------------------------------------------

--
-- Table structure for table `er_upload`
--

CREATE TABLE `er_upload` (
  `upload_id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `delete` int(11) DEFAULT NULL,
  `uploaded` int(11) DEFAULT NULL,
  `storage_id` varchar(32) DEFAULT 'null',
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_user`
--

CREATE TABLE `er_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `login` varchar(64) NOT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `remember_key` varchar(40) DEFAULT NULL,
  `pass_dattm` datetime DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `name_f` varchar(64) NOT NULL,
  `name_l` varchar(64) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `remote_addr` varchar(39) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `saved_form_id` int(10) UNSIGNED DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `unsubscribed` tinyint(4) NOT NULL DEFAULT '0',
  `email_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `email_confirmation_date` datetime DEFAULT NULL,
  `lang` varchar(32) DEFAULT NULL,
  `i_agree` tinyint(4) DEFAULT '0',
  `is_approved` tinyint(4) DEFAULT '1',
  `is_locked` tinyint(4) DEFAULT '0',
  `disable_lock_until` datetime DEFAULT NULL,
  `reseller_id` int(11) DEFAULT NULL,
  `comment` text,
  `tax_id` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_ip` varchar(39) DEFAULT NULL,
  `last_user_agent` varchar(255) DEFAULT NULL,
  `last_session` varchar(32) DEFAULT NULL,
  `aff_id` int(10) UNSIGNED DEFAULT NULL,
  `aff_added` datetime DEFAULT NULL,
  `is_affiliate` tinyint(4) DEFAULT NULL,
  `aff_payout_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_user_consent`
--

CREATE TABLE `er_user_consent` (
  `consent_id` int(11) NOT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `dattm` datetime DEFAULT NULL,
  `remote_addr` varchar(39) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `cancel_dattm` datetime DEFAULT NULL,
  `cancel_remote_addr` varchar(39) DEFAULT NULL,
  `cancel_source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_user_delete_request`
--

CREATE TABLE `er_user_delete_request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `added` datetime DEFAULT NULL,
  `processed` datetime DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `remote_addr` varchar(39) DEFAULT NULL,
  `errors` text,
  `completed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_user_group`
--

CREATE TABLE `er_user_group` (
  `user_group_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `parent_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_user_note`
--

CREATE TABLE `er_user_note` (
  `note_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text,
  `dattm` datetime DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_user_status`
--

CREATE TABLE `er_user_status` (
  `user_status_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_user_user_group`
--

CREATE TABLE `er_user_user_group` (
  `user_user_group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `er_video`
--

CREATE TABLE `er_video` (
  `video_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text,
  `path` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `poster_id` varchar(255) DEFAULT NULL,
  `cc_id` int(11) DEFAULT NULL,
  `cc_vtt_id` int(11) DEFAULT NULL,
  `mime` varchar(64) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `dattm` datetime DEFAULT NULL,
  `hide` smallint(6) DEFAULT '0',
  `tpl` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_robots` set('noindex','nofollow','noarchive') DEFAULT NULL,
  `config` blob,
  `no_access_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of games',
  `description` longtext COLLATE utf8mb4_unicode_ci COMMENT 'Description of games',
  `image` text COLLATE utf8mb4_unicode_ci COMMENT 'image of games',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Slug name of games',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `description`, `image`, `status`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PUBGY', 'Battlegrounds is a player versus player shooter game in which up to one hundred players fight in a battle royale, a type of large-scale last man standing deathmatch where players fight to remain the last alive. Players can choose to enter the match solo, duo, or with a small team of up to four people.', '1588439764PUBG.jpg', 1, NULL, 1, 1, NULL, '2020-05-04 07:26:14', NULL),
(2, 'Mari o', '<p><b style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif;\">Mario</b><span style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif;\"> is depicted as a portly plumber who lives in the fictional land of the Mushroom Kingdom with Luigi, his younger, taller brother. In the television series and film, </span><b style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif;\">Mario</b><span style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif;\"> and Luigi are originally from Brooklyn, New York.</span><br><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/Wmh4OoC7ufI\" width=\"640\" height=\"360\" class=\"note-video-clip\"></iframe></p>', '1588439944Super-Mario-Level-Up-Boardgame-605999.jpg', 1, 'mari-o', 1, 1, '2020-05-02 11:47:51', '2020-05-02 13:30:26', NULL),
(3, 'Contrast', '<p><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">Contrast is a puzzle-based platform style video game developed by Compulsion Games for Microsoft Windows, PlayStation 3</span><br></p>', '1588440865contrast_111113_1600.jpg', 1, 'contrast', 1, 1, '2020-05-02 12:04:25', '2020-05-02 12:04:45', NULL),
(4, 'IPL', '<p><span style=\"font-weight: bold; color: rgb(95, 99, 104); font-family: arial, sans-serif; font-size: 14px;\">IPL</span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">&nbsp;Cricket Ultimate is a&nbsp;</span><span style=\"font-weight: bold; color: rgb(95, 99, 104); font-family: arial, sans-serif; font-size: 14px;\">IPL</span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">&nbsp;cricket&nbsp;</span><span style=\"font-weight: bold; color: rgb(95, 99, 104); font-family: arial, sans-serif; font-size: 14px;\">game</span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">&nbsp;were you can choose your team and hit them to victory. Controls: Arrow keys to choose the direction of the bat, \'z\' button - for shot, \'x\' button - for drive, space bar - To run. Player: You are player number 1139789.</span><br></p>', '1588446262Real-Cricket-14.jpg', 1, 'ipl', 1, 1, '2020-05-02 13:34:22', '2020-05-02 13:34:22', NULL),
(5, 'Pubg', '<p>Battlegrounds is a player versus player shooter game in which up to one hundred players fight in a battle royale, a type of large-scale last man standing deathmatch where players fight to remain the last alive. Players can choose to enter the match solo, duo, or with a small team of up to four people.<br></p>', '1588597028PUBG.jpg', 1, 'pubg', 1, 1, '2020-05-04 07:27:08', '2020-05-04 07:27:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_timings`
--

CREATE TABLE `game_timings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_venue_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reffernce key of game venue',
  `game_date` date NOT NULL COMMENT 'Date of game',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_timings`
--

INSERT INTO `game_timings` (`id`, `game_venue_id`, `game_date`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, '2020-05-18', 1, 1, NULL, NULL, NULL, NULL),
(2, 1, '2020-05-07', 1, 1, NULL, NULL, NULL, NULL),
(3, 5, '2020-05-12', 1, 1, NULL, NULL, NULL, NULL),
(4, 5, '2020-05-14', 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_timings_time_slots`
--

CREATE TABLE `game_timings_time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billing_plan_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reffernce key of billing plan',
  `game_timing_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reffernce key of game timings',
  `start_time` time NOT NULL COMMENT 'Start time of game',
  `end_time` time NOT NULL COMMENT 'End time of game',
  `min_participants` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Min Participats for game',
  `max_participants` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Max Participatn for game',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `game_master_id` int(10) UNSIGNED NOT NULL COMMENT 'Reffernce key of user',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_timings_time_slots`
--

INSERT INTO `game_timings_time_slots` (`id`, `billing_plan_id`, `game_timing_id`, `start_time`, `end_time`, `min_participants`, `max_participants`, `status`, `game_master_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '20:00:00', '23:00:00', '3', '5', 1, 1, 1, NULL, NULL, NULL, NULL),
(2, 2, 1, '20:19:00', '00:00:00', '2', '3', 1, 1, 1, NULL, NULL, NULL, NULL),
(3, 1, 2, '07:00:00', '08:00:00', '4', '5', 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 1, 2, '12:00:00', '15:00:00', '2', '7', 1, 1, 1, NULL, NULL, NULL, NULL),
(5, 1, 2, '17:27:00', '19:00:00', '5', '9', 1, 1, 1, NULL, NULL, NULL, NULL),
(6, 3, 3, '09:00:00', '09:00:00', '2', '5', 1, 1, 1, NULL, NULL, NULL, NULL),
(7, 1, 2, '19:18:00', '20:00:00', '1', '9', 1, 1, 1, NULL, NULL, NULL, NULL),
(8, 1, 3, '06:06:00', '15:00:00', '1', '9', 1, 1, 1, NULL, NULL, NULL, NULL),
(9, 1, 4, '22:57:00', '00:00:00', '5', '9', 1, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_venues`
--

CREATE TABLE `game_venues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reffernce key of game',
  `venue_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reffernce key of venue',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_venues`
--

INSERT INTO `game_venues` (`id`, `game_id`, `venue_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 10, 1, 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 1, 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 1, 1, NULL, NULL, NULL, NULL),
(5, 3, 10, 1, 1, NULL, NULL, NULL, NULL),
(6, 1, 1, 1, 1, NULL, NULL, NULL, '2020-04-30 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_04_04_050028_create_venues_table', 1),
(2, '2020_04_11_140920_create_billing_plans_table', 1),
(3, '2020_04_11_152803_create_billing_plans_participants_table', 1),
(6, '2020_04_11_152912_create_game_timings_table', 1),
(7, '2020_04_12_122147_create_game_timings_time_slots_table', 1),
(8, '2020_04_12_132510_payment_gateway', 2),
(9, '2020_05_02_164658_alter_venues_table', 3),
(16, '2020_04_11_152828_create_games_table', 4),
(17, '2020_05_02_165123_alter_games_table', 4),
(18, '2020_04_11_152840_create_game_venues_table', 5),
(19, '2020_05_06_044841_add_column_billing_plan_table', 6),
(20, '2020_05_11_164637_alter_billing_plan_table_amount_column', 7);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of payment gateway',
  `type` tinyint(4) NOT NULL COMMENT 'Type of payment gateway such as paypal, stripe etc..',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Settings related to payment gateway',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of venues',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Description of venues',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image of venues',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Slug name of venues',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`id`, `name`, `description`, `image`, `status`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SS', 'hghgh', '1589178948Real-Cricket-14.jpg', 1, 'ss', 1, 1, '2020-04-23 11:26:15', '2020-05-11 01:05:48', NULL),
(7, 'Pune', 'Pune', '1587662445wallpaper2you_284747.jpg', 1, 'pune', 1, 1, '2020-04-23 11:50:45', '2020-04-23 11:51:23', '2020-04-23 11:51:23'),
(8, 'Pune', 'Pune', '1587662504ubuntu-wallpaper-1280x800-003.jpg', 1, NULL, 1, 1, '2020-04-23 11:51:44', '2020-04-23 12:05:01', '2020-04-23 12:05:01'),
(10, 'Pune', 'Pune', '1587663345ubuntu_purple_orange_white_33046_1920x1080.jpg', 1, 'pune', 1, 1, '2020-04-23 12:05:45', '2020-05-02 12:06:09', NULL),
(11, 'uk', 'asas', '1588243843ubuntu-1586627771216-615.jpg', 1, 'uk', 1, 1, '2020-04-30 05:20:43', '2020-05-09 07:42:36', NULL),
(12, 'gfgg', 'gfgf', '1588760058ubuntu-wallpaper-1440x900-002.jpg', 1, NULL, 1, 1, '2020-05-06 04:44:18', '2020-05-06 04:44:18', NULL),
(13, 'fhfh', '', '1588844880ubuntu_purple_orange_white_33046_1920x1080.jpg', 1, 'fhfh', 1, 1, '2020-05-07 04:18:00', '2020-05-07 04:18:00', NULL),
(14, 'sdffdf', '', '1589028924ubuntu_purple_orange_white_33046_1920x1080.jpg', 1, 'sdffdf', 1, 1, '2020-05-09 07:25:24', '2020-05-09 07:25:40', NULL),
(15, 'fdfdrerer', 'gfgf', '1589030318Super-Mario-Level-Up-Boardgame-605999.jpg', 1, 'fdfdrerer', 1, 1, '2020-05-09 07:48:38', '2020-05-09 07:48:38', NULL),
(16, 'fdfd', 'dfd', '1589177693PUBG.jpg', 1, 'fdfd', 1, 1, '2020-05-11 00:44:53', '2020-05-11 00:44:53', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_plans`
--
ALTER TABLE `billing_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_plans_title_index` (`title`),
  ADD KEY `billing_plans_created_by_index` (`created_by`);

--
-- Indexes for table `billing_plans_participants`
--
ALTER TABLE `billing_plans_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_plans_participants_billing_plan_id_index` (`billing_plan_id`),
  ADD KEY `billing_plans_participants_created_by_index` (`created_by`);

--
-- Indexes for table `er_access`
--
ALTER TABLE `er_access`
  ADD PRIMARY KEY (`access_id`),
  ADD UNIQUE KEY `invoice_id_2` (`invoice_id`,`user_id`,`product_id`,`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `invoice_id` (`invoice_id`,`invoice_item_id`),
  ADD KEY `invoice_public_id` (`invoice_public_id`),
  ADD KEY `transaction_product` (`transaction_id`,`product_id`);

--
-- Indexes for table `er_access_cache`
--
ALTER TABLE `er_access_cache`
  ADD UNIQUE KEY `speed` (`user_id`,`fn`,`id`);

--
-- Indexes for table `er_access_log`
--
ALTER TABLE `er_access_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`,`time`,`remote_addr`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `er_admin`
--
ALTER TABLE `er_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Indexes for table `er_admin_log`
--
ALTER TABLE `er_admin_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `al` (`tablename`,`record_id`);

--
-- Indexes for table `er_agreement`
--
ALTER TABLE `er_agreement`
  ADD PRIMARY KEY (`agreement_revision_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `er_ban`
--
ALTER TABLE `er_ban`
  ADD PRIMARY KEY (`ban_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `er_billing_plan`
--
ALTER TABLE `er_billing_plan`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `product` (`product_id`);

--
-- Indexes for table `er_button`
--
ALTER TABLE `er_button`
  ADD PRIMARY KEY (`button_id`);

--
-- Indexes for table `er_cc`
--
ALTER TABLE `er_cc`
  ADD PRIMARY KEY (`cc_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `er_cc_rebill`
--
ALTER TABLE `er_cc_rebill`
  ADD PRIMARY KEY (`cc_rebill_id`),
  ADD UNIQUE KEY `invoice_date` (`invoice_id`,`rebill_date`),
  ADD KEY `by_date` (`rebill_date`);

--
-- Indexes for table `er_config`
--
ALTER TABLE `er_config`
  ADD PRIMARY KEY (`config_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `er_country`
--
ALTER TABLE `er_country`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `country` (`country`);

--
-- Indexes for table `er_coupon`
--
ALTER TABLE `er_coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `er_coupon_batch`
--
ALTER TABLE `er_coupon_batch`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `er_currency_exchange`
--
ALTER TABLE `er_currency_exchange`
  ADD PRIMARY KEY (`rate_id`),
  ADD UNIQUE KEY `currency_rate` (`currency`,`date`);

--
-- Indexes for table `er_custom_field_sort`
--
ALTER TABLE `er_custom_field_sort`
  ADD PRIMARY KEY (`custom_field_sort_id`),
  ADD UNIQUE KEY `res` (`custom_field_table`,`custom_field_name`),
  ADD KEY `sort_order` (`sort_order`);

--
-- Indexes for table `er_data`
--
ALTER TABLE `er_data`
  ADD UNIQUE KEY `table` (`table`(16),`id`,`key`(160));

--
-- Indexes for table `er_echeck`
--
ALTER TABLE `er_echeck`
  ADD PRIMARY KEY (`echeck_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `er_email_sent`
--
ALTER TABLE `er_email_sent`
  ADD PRIMARY KEY (`email_sent_id`);

--
-- Indexes for table `er_email_template`
--
ALTER TABLE `er_email_template`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indexes for table `er_email_template_layout`
--
ALTER TABLE `er_email_template_layout`
  ADD PRIMARY KEY (`email_template_layout_id`);

--
-- Indexes for table `er_error_log`
--
ALTER TABLE `er_error_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `er_failed_login`
--
ALTER TABLE `er_failed_login`
  ADD PRIMARY KEY (`failed_login_id`),
  ADD UNIQUE KEY `ip` (`ip`,`login_type`);

--
-- Indexes for table `er_file`
--
ALTER TABLE `er_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `er_file_download`
--
ALTER TABLE `er_file_download`
  ADD PRIMARY KEY (`download_id`),
  ADD KEY `download` (`file_id`,`user_id`,`dattm`);

--
-- Indexes for table `er_folder`
--
ALTER TABLE `er_folder`
  ADD PRIMARY KEY (`folder_id`),
  ADD UNIQUE KEY `path` (`path`(191)),
  ADD UNIQUE KEY `url` (`url`(191));

--
-- Indexes for table `er_integration`
--
ALTER TABLE `er_integration`
  ADD PRIMARY KEY (`integration_id`);

--
-- Indexes for table `er_invoice`
--
ALTER TABLE `er_invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `rebill_date` (`rebill_date`);

--
-- Indexes for table `er_invoice_item`
--
ALTER TABLE `er_invoice_item`
  ADD PRIMARY KEY (`invoice_item_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `invoice_public_id` (`invoice_public_id`);

--
-- Indexes for table `er_invoice_item_option`
--
ALTER TABLE `er_invoice_item_option`
  ADD PRIMARY KEY (`invoice_item_option_id`),
  ADD KEY `invoice_item_id` (`invoice_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `er_invoice_log`
--
ALTER TABLE `er_invoice_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `er_invoice_payment`
--
ALTER TABLE `er_invoice_payment`
  ADD PRIMARY KEY (`invoice_payment_id`),
  ADD UNIQUE KEY `invoice_id` (`invoice_id`,`user_id`,`transaction_id`),
  ADD KEY `invoice_public_id` (`invoice_public_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dattm` (`dattm`);

--
-- Indexes for table `er_invoice_refund`
--
ALTER TABLE `er_invoice_refund`
  ADD PRIMARY KEY (`invoice_refund_id`),
  ADD UNIQUE KEY `invoice_id` (`invoice_id`,`user_id`,`transaction_id`),
  ADD KEY `invoice_payment_id` (`invoice_payment_id`),
  ADD KEY `invoice_public_id` (`invoice_public_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dattm` (`dattm`);

--
-- Indexes for table `er_link`
--
ALTER TABLE `er_link`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `er_mail_queue`
--
ALTER TABLE `er_mail_queue`
  ADD PRIMARY KEY (`queue_id`),
  ADD KEY `sent` (`sent`,`priority`,`added`);

--
-- Indexes for table `er_newsletter_list`
--
ALTER TABLE `er_newsletter_list`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `er_newsletter_user_subscription`
--
ALTER TABLE `er_newsletter_user_subscription`
  ADD PRIMARY KEY (`subscription_id`),
  ADD UNIQUE KEY `user_list` (`user_id`,`list_id`),
  ADD KEY `list` (`list_id`);

--
-- Indexes for table `er_page`
--
ALTER TABLE `er_page`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `path` (`path`(191));

--
-- Indexes for table `er_product`
--
ALTER TABLE `er_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `er_product_category`
--
ALTER TABLE `er_product_category`
  ADD PRIMARY KEY (`product_category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `er_product_option`
--
ALTER TABLE `er_product_option`
  ADD UNIQUE KEY `product_name` (`product_id`,`name`(187)),
  ADD KEY `product_option_id` (`product_option_id`);

--
-- Indexes for table `er_product_product_category`
--
ALTER TABLE `er_product_product_category`
  ADD PRIMARY KEY (`product_product_category_id`),
  ADD UNIQUE KEY `product_category` (`product_id`,`product_category_id`),
  ADD KEY `product_category_id` (`product_category_id`);

--
-- Indexes for table `er_product_upgrade`
--
ALTER TABLE `er_product_upgrade`
  ADD PRIMARY KEY (`product_upgrade_id`);

--
-- Indexes for table `er_rebill_log`
--
ALTER TABLE `er_rebill_log`
  ADD PRIMARY KEY (`rebill_log_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `er_resource_access`
--
ALTER TABLE `er_resource_access`
  ADD PRIMARY KEY (`resource_access_id`),
  ADD KEY `res` (`resource_type`,`resource_id`);

--
-- Indexes for table `er_resource_access_sort`
--
ALTER TABLE `er_resource_access_sort`
  ADD PRIMARY KEY (`resource_access_sort_id`),
  ADD UNIQUE KEY `res` (`resource_type`,`resource_id`),
  ADD KEY `sort_order` (`sort_order`);

--
-- Indexes for table `er_resource_category`
--
ALTER TABLE `er_resource_category`
  ADD PRIMARY KEY (`resource_category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `er_resource_resource_category`
--
ALTER TABLE `er_resource_resource_category`
  ADD PRIMARY KEY (`resource_resource_category_id`),
  ADD UNIQUE KEY `resource_category` (`resource_id`,`resource_type`,`resource_category_id`),
  ADD KEY `resource_category_id` (`resource_category_id`);

--
-- Indexes for table `er_saved_form`
--
ALTER TABLE `er_saved_form`
  ADD PRIMARY KEY (`saved_form_id`);

--
-- Indexes for table `er_saved_pass`
--
ALTER TABLE `er_saved_pass`
  ADD PRIMARY KEY (`saved_pass_id`),
  ADD UNIQUE KEY `user` (`user_id`,`format`);

--
-- Indexes for table `er_saved_report`
--
ALTER TABLE `er_saved_report`
  ADD PRIMARY KEY (`saved_report_id`);

--
-- Indexes for table `er_saved_search`
--
ALTER TABLE `er_saved_search`
  ADD PRIMARY KEY (`saved_search_id`);

--
-- Indexes for table `er_session`
--
ALTER TABLE `er_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `er_state`
--
ALTER TABLE `er_state`
  ADD PRIMARY KEY (`state_id`),
  ADD UNIQUE KEY `state` (`state`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `er_store`
--
ALTER TABLE `er_store`
  ADD PRIMARY KEY (`store_id`),
  ADD UNIQUE KEY `name` (`name`(191));

--
-- Indexes for table `er_store_rebuild`
--
ALTER TABLE `er_store_rebuild`
  ADD PRIMARY KEY (`store_rebuild_id`),
  ADD UNIQUE KEY `full_name` (`rebuild_name`,`session_id`,`user_id`);

--
-- Indexes for table `er_translation`
--
ALTER TABLE `er_translation`
  ADD PRIMARY KEY (`language`);

--
-- Indexes for table `er_upload`
--
ALTER TABLE `er_upload`
  ADD PRIMARY KEY (`upload_id`),
  ADD KEY `prefix` (`prefix`(191));

--
-- Indexes for table `er_user`
--
ALTER TABLE `er_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `email` (`email`),
  ADD KEY `country` (`country`(3)),
  ADD KEY `state` (`state`(191));

--
-- Indexes for table `er_user_consent`
--
ALTER TABLE `er_user_consent`
  ADD PRIMARY KEY (`consent_id`),
  ADD KEY `agreement_revision_id` (`revision_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `er_user_delete_request`
--
ALTER TABLE `er_user_delete_request`
  ADD PRIMARY KEY (`request_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `er_user_group`
--
ALTER TABLE `er_user_group`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `er_user_note`
--
ALTER TABLE `er_user_note`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `er_user_status`
--
ALTER TABLE `er_user_status`
  ADD PRIMARY KEY (`user_status_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `er_user_user_group`
--
ALTER TABLE `er_user_user_group`
  ADD PRIMARY KEY (`user_user_group_id`),
  ADD UNIQUE KEY `user_group` (`user_id`,`user_group_id`),
  ADD KEY `user_group_id` (`user_group_id`);

--
-- Indexes for table `er_video`
--
ALTER TABLE `er_video`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `games_name_unique` (`name`),
  ADD KEY `games_created_by_index` (`created_by`);

--
-- Indexes for table `game_timings`
--
ALTER TABLE `game_timings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_timings_game_venue_id_index` (`game_venue_id`),
  ADD KEY `game_timings_created_by_index` (`created_by`);

--
-- Indexes for table `game_timings_time_slots`
--
ALTER TABLE `game_timings_time_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_timings_time_slots_billing_plan_id_index` (`billing_plan_id`),
  ADD KEY `game_timings_time_slots_game_timings_id_index` (`game_timing_id`),
  ADD KEY `game_timings_time_slots_game_master_id_index` (`game_master_id`),
  ADD KEY `game_timings_time_slots_created_by_index` (`created_by`);

--
-- Indexes for table `game_venues`
--
ALTER TABLE `game_venues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_venues_game_id_index` (`game_id`),
  ADD KEY `game_venues_venue_id_index` (`venue_id`),
  ADD KEY `game_venues_created_by_index` (`created_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateway_created_by_index` (`created_by`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venues_name_index` (`name`),
  ADD KEY `venues_created_by_index` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_plans`
--
ALTER TABLE `billing_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `billing_plans_participants`
--
ALTER TABLE `billing_plans_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `er_access`
--
ALTER TABLE `er_access`
  MODIFY `access_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_access_log`
--
ALTER TABLE `er_access_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_admin`
--
ALTER TABLE `er_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `er_admin_log`
--
ALTER TABLE `er_admin_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `er_agreement`
--
ALTER TABLE `er_agreement`
  MODIFY `agreement_revision_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_ban`
--
ALTER TABLE `er_ban`
  MODIFY `ban_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_billing_plan`
--
ALTER TABLE `er_billing_plan`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `er_button`
--
ALTER TABLE `er_button`
  MODIFY `button_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_cc`
--
ALTER TABLE `er_cc`
  MODIFY `cc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_cc_rebill`
--
ALTER TABLE `er_cc_rebill`
  MODIFY `cc_rebill_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_config`
--
ALTER TABLE `er_config`
  MODIFY `config_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `er_country`
--
ALTER TABLE `er_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `er_coupon`
--
ALTER TABLE `er_coupon`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_coupon_batch`
--
ALTER TABLE `er_coupon_batch`
  MODIFY `batch_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_currency_exchange`
--
ALTER TABLE `er_currency_exchange`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_custom_field_sort`
--
ALTER TABLE `er_custom_field_sort`
  MODIFY `custom_field_sort_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_echeck`
--
ALTER TABLE `er_echeck`
  MODIFY `echeck_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_email_sent`
--
ALTER TABLE `er_email_sent`
  MODIFY `email_sent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_email_template`
--
ALTER TABLE `er_email_template`
  MODIFY `email_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `er_email_template_layout`
--
ALTER TABLE `er_email_template_layout`
  MODIFY `email_template_layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `er_error_log`
--
ALTER TABLE `er_error_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_failed_login`
--
ALTER TABLE `er_failed_login`
  MODIFY `failed_login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `er_file`
--
ALTER TABLE `er_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_file_download`
--
ALTER TABLE `er_file_download`
  MODIFY `download_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_folder`
--
ALTER TABLE `er_folder`
  MODIFY `folder_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_integration`
--
ALTER TABLE `er_integration`
  MODIFY `integration_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_invoice`
--
ALTER TABLE `er_invoice`
  MODIFY `invoice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_invoice_item`
--
ALTER TABLE `er_invoice_item`
  MODIFY `invoice_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_invoice_item_option`
--
ALTER TABLE `er_invoice_item_option`
  MODIFY `invoice_item_option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_invoice_log`
--
ALTER TABLE `er_invoice_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_invoice_payment`
--
ALTER TABLE `er_invoice_payment`
  MODIFY `invoice_payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_invoice_refund`
--
ALTER TABLE `er_invoice_refund`
  MODIFY `invoice_refund_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_link`
--
ALTER TABLE `er_link`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_mail_queue`
--
ALTER TABLE `er_mail_queue`
  MODIFY `queue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_newsletter_list`
--
ALTER TABLE `er_newsletter_list`
  MODIFY `list_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_newsletter_user_subscription`
--
ALTER TABLE `er_newsletter_user_subscription`
  MODIFY `subscription_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_page`
--
ALTER TABLE `er_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_product`
--
ALTER TABLE `er_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `er_product_category`
--
ALTER TABLE `er_product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_product_option`
--
ALTER TABLE `er_product_option`
  MODIFY `product_option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_product_product_category`
--
ALTER TABLE `er_product_product_category`
  MODIFY `product_product_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_product_upgrade`
--
ALTER TABLE `er_product_upgrade`
  MODIFY `product_upgrade_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_rebill_log`
--
ALTER TABLE `er_rebill_log`
  MODIFY `rebill_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_resource_access`
--
ALTER TABLE `er_resource_access`
  MODIFY `resource_access_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_resource_access_sort`
--
ALTER TABLE `er_resource_access_sort`
  MODIFY `resource_access_sort_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `er_resource_category`
--
ALTER TABLE `er_resource_category`
  MODIFY `resource_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_resource_resource_category`
--
ALTER TABLE `er_resource_resource_category`
  MODIFY `resource_resource_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_saved_form`
--
ALTER TABLE `er_saved_form`
  MODIFY `saved_form_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `er_saved_pass`
--
ALTER TABLE `er_saved_pass`
  MODIFY `saved_pass_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_saved_report`
--
ALTER TABLE `er_saved_report`
  MODIFY `saved_report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_saved_search`
--
ALTER TABLE `er_saved_search`
  MODIFY `saved_search_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_state`
--
ALTER TABLE `er_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4099;
--
-- AUTO_INCREMENT for table `er_store`
--
ALTER TABLE `er_store`
  MODIFY `store_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `er_store_rebuild`
--
ALTER TABLE `er_store_rebuild`
  MODIFY `store_rebuild_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_upload`
--
ALTER TABLE `er_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_user`
--
ALTER TABLE `er_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_user_consent`
--
ALTER TABLE `er_user_consent`
  MODIFY `consent_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_user_delete_request`
--
ALTER TABLE `er_user_delete_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_user_group`
--
ALTER TABLE `er_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_user_note`
--
ALTER TABLE `er_user_note`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_user_status`
--
ALTER TABLE `er_user_status`
  MODIFY `user_status_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_user_user_group`
--
ALTER TABLE `er_user_user_group`
  MODIFY `user_user_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `er_video`
--
ALTER TABLE `er_video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `game_timings`
--
ALTER TABLE `game_timings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `game_timings_time_slots`
--
ALTER TABLE `game_timings_time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `game_venues`
--
ALTER TABLE `game_venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_plans_participants`
--
ALTER TABLE `billing_plans_participants`
  ADD CONSTRAINT `billing_plans_participants_billing_plan_id_foreign` FOREIGN KEY (`billing_plan_id`) REFERENCES `billing_plans` (`id`);

--
-- Constraints for table `game_timings`
--
ALTER TABLE `game_timings`
  ADD CONSTRAINT `game_timings_game_venue_id_foreign` FOREIGN KEY (`game_venue_id`) REFERENCES `game_venues` (`id`);

--
-- Constraints for table `game_timings_time_slots`
--
ALTER TABLE `game_timings_time_slots`
  ADD CONSTRAINT `game_timings_time_slots_billing_plan_id_foreign` FOREIGN KEY (`billing_plan_id`) REFERENCES `billing_plans` (`id`),
  ADD CONSTRAINT `game_timings_time_slots_game_timings_id_foreign` FOREIGN KEY (`game_timing_id`) REFERENCES `game_timings` (`id`);

--
-- Constraints for table `game_venues`
--
ALTER TABLE `game_venues`
  ADD CONSTRAINT `game_venues_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `game_venues_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
