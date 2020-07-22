-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2020 at 04:34 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escaperoom`
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
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of companies',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Description of companies',
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Logo of companies',
  `color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Color of companies',
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Domain of companies',
  `sub_domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subdomain of companies',
  `license_key` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `modified_by` int(10) UNSIGNED NOT NULL COMMENT 'Record modified by',
  `modified_date` datetime DEFAULT NULL COMMENT 'Record modified by date',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `description`, `logo`, `color`, `domain`, `sub_domain`, `license_key`, `start_date`, `end_date`, `status`, `created_by`, `modified_by`, `modified_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'chelmsfordcommunityradio', 'chelmsfordcommunityradio', '1587144930ubuntu-wallpaper-1280x800-003.jpg', '#44D3FF', 'chelmsfordcommunityradio.com', 'test', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-04-18 00:00:00', '2020-05-08 00:00:00', 1, 1, 1, NULL, NULL, '2020-05-06 04:43:56', NULL),
(5, 'test2', 'test2', '1587146781ubuntu-1586627771216-615.jpg', '#79FFF3', 'chelmsfordcommunityradio.com', 'test2', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-04-17 00:00:00', '2020-04-30 00:00:00', 1, 1, 1, NULL, '2020-04-17 12:36:21', '2020-04-17 12:36:21', NULL),
(6, 'test3', 'test3', '1587146866wallpaper2you_284747.jpg', '#7928FF', 'chelmsfordcommunityradio.com', 'test3', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-04-17 00:00:00', '2020-04-30 00:00:00', 1, 1, 1, NULL, '2020-04-17 12:37:46', '2020-04-17 12:37:46', NULL),
(7, 'test4', 'test4', '1587146866wallpaper2you_284747.jpg', '#7928FF', 'chelmsfordcommunityradio.com', 'test4', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-04-17 00:00:00', '2020-04-30 00:00:00', 1, 1, 1, NULL, '2020-04-17 12:37:46', '2020-04-17 12:37:46', NULL),
(8, 'sdsd', 'sdsd', '1588759521ubuntu-wallpaper-1280x800-003.jpg', '#953EFF', 'sdsds', 'sdsdsds', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-06 00:00:00', '2020-06-03 00:00:00', 1, 1, 1, NULL, '2020-05-06 04:35:21', '2020-05-06 04:35:21', NULL),
(9, 'sdsdsd', 'sdsdsdsd', '1588759580Super-Mario-Level-Up-Boardgame-605999.jpg', '#6F5EFF', 'fggfgf', 'hhhhh', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-06 00:00:00', '2020-06-03 00:00:00', 1, 1, 1, NULL, '2020-05-06 04:36:20', '2020-05-06 04:36:20', NULL),
(10, 'ghhgh', 'ghghghgh', '1588759820Super-Mario-Level-Up-Boardgame-605999.jpg', '#7764FF', 'hjhjh', 'gfgfgfg', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-06 00:00:00', '2020-05-20 00:00:00', 1, 1, 1, NULL, '2020-05-06 04:40:20', '2020-05-06 04:40:20', NULL),
(11, 'jhjhj', 'hjhjh', '1588759846ubuntu-wallpaper-1280x800-003.jpg', '#6234FF', 'jhjhjh', 'hjhjh', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-07 00:00:00', '2020-05-13 00:00:00', 1, 1, 1, NULL, '2020-05-06 04:40:46', '2020-05-06 04:40:46', NULL),
(12, 'hjhjh', 'fgfgfg', '1588759876ubuntu_purple_orange_white_33046_1920x1080.jpg', '#FFFFFF', 'ghghgh', 'hjhjhj', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-06 00:00:00', '2020-05-28 00:00:00', 1, 1, 1, NULL, '2020-05-06 04:41:16', '2020-05-06 04:41:16', NULL),
(13, 'ghh', 'gfgf', '1588831067ubuntu-wallpaper-1440x900-002.jpg', '#FFFFFF', 'kjhjhjhj', 'khkhkhkhk', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-07 00:00:00', '2020-06-03 00:00:00', 1, 1, 1, NULL, '2020-05-07 00:27:47', '2020-05-07 00:27:47', NULL),
(14, 'dsdsd', 'dfdfdf', '1589028275ubuntu-wallpaper-1280x800-003.jpg', '#FFFFFF', 'sdsdsd', 'sdfdfdfd', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-15 00:00:00', '2020-05-22 00:00:00', 1, 1, 1, NULL, '2020-05-09 06:50:15', '2020-05-09 07:48:11', NULL),
(15, 'jfdfjkdfkj', 'kdjskdjsk', '1589096168ubuntu_purple_orange_white_33046_1920x1080.jpg', '#FFFFFF', 'dsdsds', 'dsdsdsds', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-12 00:00:00', '2020-07-09 00:00:00', 1, 1, 1, NULL, '2020-05-10 02:06:08', '2020-05-10 02:06:08', NULL),
(16, 'jfdfjkdfkj', 'kdjskdjsk', '1589096211sign.jpg', '#FFFFFF', 'dsdsdssdsd', 'dsdsdsds', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-12 00:00:00', '2020-07-09 00:00:00', 1, 1, 1, NULL, '2020-05-10 02:06:51', '2020-05-10 02:06:51', NULL),
(17, 'sdsd', 'sdsdsds', '1589176554Real-Cricket-14.jpg', '#FFFFFF', 'sddsdsds', 'dsdsdsd', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-11 00:00:00', '2020-05-14 00:00:00', 1, 1, 1, NULL, '2020-05-11 00:25:37', '2020-05-11 00:25:54', NULL),
(18, 'dsds', 'sdsd', '1589178805PlayerUnknown\'s_Battlegrounds_Steam_Logo.jpg', '#2A04FF', 'fgfhgh', 'ghghjhjhj', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-11 00:00:00', '2020-05-15 00:00:00', 1, 1, 1, NULL, '2020-05-11 01:03:25', '2020-05-11 01:03:25', NULL),
(19, 'hhh', 'hhh', '1589485355Super-Mario-Level-Up-Boardgame-605999.jpg', '#3D3CFF', 'fffff', 'hhhhhh', 'LS85IzcktTssvSknOz80tzcssqSxKTMnM1wNyrYxMLIzNrAKC/K3MkgE1X', '2020-05-16 00:00:00', '2020-05-29 00:00:00', 0, 1, 1, NULL, '2020-05-14 14:12:35', '2020-05-14 14:12:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of games',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Description of games',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image of games',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Slug name of games',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game_timings`
--

CREATE TABLE `game_timings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_venue_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reffernce key of game venue',
  `game_date` date NOT NULL COMMENT 'Date of game',
  `batch` bigint(20) UNSIGNED NOT NULL COMMENT 'Batch number of timing',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive;1-Active;2-Deleted',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Record created by',
  `updated_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'Record updated by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Record deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2020_03_16_163519_create_companies_table', 1),
(7, '2020_03_26_092120_alter_company_tables', 1),
(8, '2020_03_26_125543_change_company_tables', 1),
(9, '2020_03_28_121501_add_filepath_columns', 1),
(10, '2020_04_02_114606_remove_filepath_column', 1),
(11, '2020_04_02_121234_add_filed_licence-key_company', 1),
(12, '2020_04_06_180346_create_games_table', 1),
(13, '2020_04_04_050028_create_venues_table', 2),
(14, '2020_04_11_140920_create_billing_plans_table', 2),
(15, '2020_04_11_152803_create_billing_plans_participants_table', 2),
(16, '2020_04_11_152828_create_games_table', 2),
(17, '2020_04_11_152840_create_game_venues_table', 2),
(18, '2020_04_11_152912_create_game_timings_table', 2),
(19, '2020_04_12_122147_create_game_timings_time_slots_table', 2),
(20, '2020_04_12_132510_payment_gateway', 2),
(21, '2020_05_02_164658_alter_venues_table', 2),
(22, '2020_05_02_165123_alter_games_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_name_index` (`name`),
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
  ADD KEY `game_timings_time_slots_game_timing_id_index` (`game_timing_id`),
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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing_plans_participants`
--
ALTER TABLE `billing_plans_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `game_timings`
--
ALTER TABLE `game_timings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `game_timings_time_slots`
--
ALTER TABLE `game_timings_time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `game_venues`
--
ALTER TABLE `game_venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `game_timings_time_slots_game_timing_id_foreign` FOREIGN KEY (`game_timing_id`) REFERENCES `game_timings` (`id`);

--
-- Constraints for table `game_venues`
--
ALTER TABLE `game_venues`
  ADD CONSTRAINT `game_venues_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `game_venues_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
