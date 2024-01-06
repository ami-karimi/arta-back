-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 01:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arta-back`
--

-- --------------------------------------------------------

--
-- Table structure for table `acct_saved`
--

CREATE TABLE `acct_saved` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `groups` varchar(40) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(1500) NOT NULL,
  `picture` varchar(890) DEFAULT NULL,
  `content` text NOT NULL,
  `attachments` text DEFAULT NULL,
  `show_for` text DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT 1,
  `view_count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `card_numbers`
--

CREATE TABLE `card_numbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `for` int(11) DEFAULT NULL,
  `card_number_name` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_number_bank` varchar(255) DEFAULT NULL,
  `is_enabled` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `card_numbers`
--

INSERT INTO `card_numbers` (`id`, `for`, `card_number_name`, `card_number`, `card_number_bank`, `is_enabled`, `created_at`, `updated_at`) VALUES
(4, 0, 'شماره کارت مدیریت', '6104-1234-4236-1234', 'نام بانک', 1, '2023-04-21 04:12:03', '2023-08-05 11:14:39');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `financial`
--

CREATE TABLE `financial` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator` int(10) UNSIGNED NOT NULL,
  `for` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('plus','minus','plus_amn','minus_amn') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_volume` bigint(20) NOT NULL DEFAULT 0,
  `group_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'expire',
  `price` bigint(20) NOT NULL DEFAULT 0,
  `price_reseler` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_type` enum('no_expire','minutes','hours','days','month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no_expire',
  `expire_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multi_login` int(11) NOT NULL DEFAULT 200,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_volume`, `group_type`, `price`, `price_reseler`, `name`, `expire_type`, `expire_value`, `multi_login`, `created_at`, `updated_at`) VALUES
(1, 0, 'expire', 150000, 82000, '1 ماهه 1 کاربره', 'month', '1', 1, '2023-04-17 23:57:46', '2023-10-25 10:57:27'),
(3, 0, 'expire', 200000, 100000, '1 ماهه 2 کاربره', 'month', '1', 2, '2023-04-19 05:02:28', '2023-10-25 10:57:35'),
(4, 0, 'expire', 65000, 30000, '10 روزه 1 کاربره ', 'days', '10', 1, '2023-04-22 00:48:01', '2023-05-22 17:48:46'),
(5, 0, 'expire', 85000, 39000, '15 روزه 1 کاربره ', 'days', '15', 1, '2023-04-22 00:48:26', '2023-05-22 17:48:22'),
(6, 0, 'expire', 500000, 285000, '3 ماهه 2 کاربره', 'month', '3', 2, '2023-04-22 00:49:08', '2023-10-25 10:58:47'),
(7, 0, 'expire', 350000, 230000, 'سه ماهه 1 کاربره', 'month', '3', 1, '2023-04-22 00:49:41', '2023-10-25 10:58:35'),
(8, 0, 'expire', 280000, 140000, '2 ماهه 1 کاربره', 'month', '2', 1, '2023-04-22 00:50:17', '2023-10-25 10:58:09'),
(9, 0, 'expire', 0, 0, 'test', 'hours', '2', 2, '2023-04-27 06:43:26', '2023-04-27 06:43:26'),
(12, 10, 'volume', 50000, 35000, 'حجمی 10 گیگ -30 روزه - 5 کاربره', 'days', '30', 5, '2023-05-22 17:51:32', '2023-10-13 00:21:55'),
(13, 20, 'volume', 90000, 65000, 'حجمی 20 گیگ - 30 روزه  - 5 کاربره', 'days', '30', 5, '2023-05-22 17:52:08', '2023-10-14 11:43:46'),
(14, 40, 'volume', 170000, 120000, 'حجمی 40 گیگ -30 روزه - 5 کاربره', 'days', '30', 5, '2023-05-22 17:53:46', '2023-10-14 11:44:01'),
(15, 50, 'volume', 200000, 160000, 'حجمی 50 گیگ - 30 روزه - 5 کاربره', 'days', '30', 5, '2023-05-22 17:54:18', '2023-10-13 00:27:14'),
(16, 30, 'expire', 300000, 140000, 'وایرگارد - 2 ماهه', 'month', '2', 1, '2023-06-11 18:54:36', '2023-06-12 18:50:47'),
(17, 60, 'expire', 450000, 230000, 'وایرگارد -3 ماهه', 'month', '3', 1, '2023-06-11 18:55:09', '2023-06-12 18:50:29'),
(18, 0, 'expire', 170000, 82000, 'وایرگارد - 1 ماهه', 'month', '1', 1, '2023-06-11 18:56:10', '2023-06-12 18:50:10'),
(19, 30, 'volume', 130000, 90000, '30 گیگ  - 30 روزه - 5 کاربره', 'days', '30', 200, '2023-08-08 08:16:53', '2023-10-13 00:24:53'),
(20, 0, 'expire', 390000, 220000, '2 ماهه 2 کاربره', 'month', '2', 2, '2023-10-08 07:03:22', '2023-10-25 10:59:14'),
(21, 5, 'volume', 25000, 17500, '5 گیگ 30 روزه - v2ray', 'days', '30', 200, '2023-11-22 00:51:55', '2023-11-22 00:51:55'),
(22, 10, 'volume', 49000, 35000, '10 گیگ 30 روزه - v2ray', 'days', '30', 200, '2023-11-22 00:52:43', '2023-11-22 00:52:43'),
(23, 15, 'volume', 73000, 52000, '15 گیگ 30 روزه - v2ray', 'days', '30', 200, '2023-11-22 00:53:37', '2023-11-22 00:53:37'),
(24, 25, 'volume', 120000, 87000, '25 گیگ 30 روزه - v2ray', 'days', '30', 200, '2023-11-22 00:54:18', '2023-11-22 00:54:18'),
(25, 40, 'volume', 200000, 140000, '40 گیگ 30 روزه - v2ray', 'days', '30', 200, '2023-11-22 00:54:53', '2023-11-22 00:54:53');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2018_10_09_190213_create_nas_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_04_16_230434_groups', 1),
(7, '2023_04_16_230538_radpostauth', 1),
(8, '2023_04_16_230623_radreply', 1),
(9, '2023_04_16_230645_radacct_table', 1),
(10, '2023_04_18_052842_acct_saved', 2),
(11, '2023_04_19_111327_financial', 3),
(12, '2023_04_19_142305_price_for_reseler', 4),
(13, '2023_04_21_073257_card_numbers', 5),
(14, '2023_04_21_075336_activity', 6),
(15, '2023_04_21_075901_notifications', 7),
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2018_10_09_190213_create_nas_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_04_16_230434_groups', 1),
(7, '2023_04_16_230538_radpostauth', 1),
(8, '2023_04_16_230623_radreply', 1),
(9, '2023_04_16_230645_radacct_table', 1),
(10, '2023_04_18_052842_acct_saved', 2),
(11, '2023_04_19_111327_financial', 3),
(12, '2023_04_19_142305_price_for_reseler', 4),
(13, '2023_04_21_073257_card_numbers', 5),
(14, '2023_04_21_075336_activity', 6),
(15, '2023_04_21_075901_notifications', 7);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_tokens`
--

CREATE TABLE `mobile_tokens` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expire_time` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `nas`
--

CREATE TABLE `nas` (
  `id` int(10) UNSIGNED NOT NULL,
  `mikrotik_server` int(11) NOT NULL DEFAULT 0,
  `mikortik_domain` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_port` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_username` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssh_username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssh_password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssh_port` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssh_server` int(11) NOT NULL DEFAULT 0,
  `config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_app` int(11) NOT NULL DEFAULT 1,
  `unlimited` int(11) NOT NULL DEFAULT 0,
  `password_v2ray` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_v2ray` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username_v2ray` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cdn_address_v2ray` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openvpn_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'l2tp',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `server_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_location_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l2tp_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '123456',
  `ipaddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `for` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_for_reseler`
--

CREATE TABLE `price_for_reseler` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `reseler_id` int(10) UNSIGNED NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `radacct`
--

CREATE TABLE `radacct` (
  `saved` int(11) NOT NULL DEFAULT 0,
  `radacctid` bigint(20) NOT NULL,
  `acctsessionid` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `realm` varchar(64) CHARACTER SET latin1 DEFAULT '',
  `nasipaddress` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `nasportid` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nasporttype` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctinterval` int(11) DEFAULT NULL,
  `acctsessiontime` int(10) UNSIGNED DEFAULT NULL,
  `acctauthentic` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `connectinfo_start` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `connectinfo_stop` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `callingstationid` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `servicetype` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `framedprotocol` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `framedipaddress` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `framedipv6address` varchar(44) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `framedipv6prefix` varchar(44) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `framedinterfaceid` varchar(44) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `delegatedipv6prefix` varchar(44) CHARACTER SET latin1 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `radpostauth`
--

CREATE TABLE `radpostauth` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `radreply`
--

CREATE TABLE `radreply` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `op` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rseler_meta`
--

CREATE TABLE `rseler_meta` (
  `id` int(11) NOT NULL,
  `reseler_id` bigint(20) NOT NULL DEFAULT 0,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_childs`
--

CREATE TABLE `service_childs` (
  `id` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `volume` int(11) NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `general_group_id` int(11) NOT NULL DEFAULT 0,
  `price` bigint(20) NOT NULL DEFAULT 0,
  `multi_login` int(11) NOT NULL DEFAULT 1,
  `is_enabled` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `service_group`
--

CREATE TABLE `service_group` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `server_select` int(11) NOT NULL DEFAULT 0,
  `type` enum('wireguard','l2tp_cisco','v2ray') DEFAULT NULL,
  `is_enabled` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(400) DEFAULT NULL,
  `group` varchar(80) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'private'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `group`, `value`, `type`) VALUES
(1, 'FTP_enabled', 'ftp', '1', 'private'),
(2, 'FTP_ip', 'ftp', '', 'private'),
(3, 'FTP_port', 'ftp', '21', 'private'),
(4, 'FTP_username', 'ftp', NULL, 'private'),
(5, 'FTP_password', 'ftp', '', 'private'),
(6, 'FTP_backup_server', 'ftp_backup_servers', '[]', 'private'),
(7, 'SITE_TITLE', 'general', 'اکانتینگ سیستم آرتا', 'public'),
(8, 'QR_WATRMARK', 'general', 'ArtaPannel', 'public'),
(10, 'FAV_ICON', 'general', 'http://localhost:8000/general/FAV_1703682811.svg', 'public'),
(11, 'SITE_LOGO', 'general', 'http://localhost:8000/general/SITE_LOGO_1703682175.png', 'public'),
(13, 'MAINTENANCE_STATUS', 'maintenance', '1', 'public'),
(14, 'MAINTENANCE_TEXT', 'maintenance', 'فعال است', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `tg_service_orders`
--

CREATE TABLE `tg_service_orders` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `fullname` varchar(300) DEFAULT NULL,
  `service_id` int(11) NOT NULL DEFAULT 0,
  `child_id` int(11) NOT NULL DEFAULT 0,
  `server_id` int(11) NOT NULL DEFAULT 0,
  `order_type` varchar(100) NOT NULL DEFAULT '200',
  `status` varchar(200) DEFAULT NULL,
  `price` bigint(20) NOT NULL DEFAULT 0,
  `ng_price` bigint(20) NOT NULL DEFAULT 0,
  `sync_id` int(11) NOT NULL DEFAULT 0,
  `build_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tg_user_id` bigint(20) NOT NULL DEFAULT 0,
  `uuid_v2ray` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v2ray_config_uri` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tg_group_id` int(11) NOT NULL DEFAULT 0,
  `limited` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(890) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_app` int(11) NOT NULL DEFAULT 1,
  `phonenumber` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `v2ray_location` bigint(20) NOT NULL DEFAULT 0,
  `upload_usage` bigint(20) NOT NULL DEFAULT 0,
  `download_usage` bigint(20) NOT NULL DEFAULT 0,
  `usage` bigint(20) NOT NULL,
  `max_usage` bigint(20) NOT NULL DEFAULT 80000000000,
  `v2ray_transmission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_v2ray` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark_v2ray` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `protocol_v2ray` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v2ray_id` bigint(20) NOT NULL DEFAULT 0,
  `service_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'l2tp_cisco',
  `creator` int(10) UNSIGNED DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  `first_login` datetime DEFAULT NULL,
  `expire_type` enum('no_expire','minutes','month','hours','days','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no_expire',
  `expired` int(11) NOT NULL DEFAULT 0,
  `v2ray_u_id` bigint(20) NOT NULL DEFAULT 0,
  `role` enum('admin','user','agent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `expire_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_val_minute` bigint(20) NOT NULL DEFAULT 0,
  `is_online` int(11) NOT NULL DEFAULT 0,
  `expire_set` int(11) NOT NULL DEFAULT 0,
  `multi_login` int(11) NOT NULL DEFAULT 200,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `incom` bigint(20) NOT NULL DEFAULT 0,
  `default_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creadit` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `tg_user_id`, `uuid_v2ray`, `v2ray_config_uri`, `tg_group_id`, `limited`, `flag`, `config`, `in_app`, `phonenumber`, `group_id`, `v2ray_location`, `upload_usage`, `download_usage`, `usage`, `max_usage`, `v2ray_transmission`, `port_v2ray`, `remark_v2ray`, `protocol_v2ray`, `v2ray_id`, `service_group`, `creator`, `is_enabled`, `name`, `email`, `username`, `email_verified_at`, `expire_date`, `first_login`, `expire_type`, `expired`, `v2ray_u_id`, `role`, `expire_value`, `exp_val_minute`, `is_online`, `expire_set`, `multi_login`, `password`, `incom`, `default_password`, `remember_token`, `creadit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 0, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0, 80000000000, NULL, NULL, NULL, NULL, 0, 'l2tp_cisco', NULL, 1, 'ArtaAdmin', 'admin@gmail.com', NULL, NULL, NULL, NULL, 'no_expire', 0, 0, 'admin', NULL, 0, 0, 0, 200, '$2y$10$FAPxBipfmo.8xF86VkOQouCr2IZw7cALPpP3CqFiSqNDkRQuL0zLq', 0, '$2y$10$KSUPvshENEsX/ycryjoTfuUrbDe4bzrNHxtJmL5XIcLbTtXyigzPC', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_activity`
--

CREATE TABLE `users_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_view` int(11) NOT NULL DEFAULT 0,
  `admin_view` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_graph`
--

CREATE TABLE `user_graph` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `rx` bigint(20) NOT NULL,
  `tx` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `user_metas`
--

CREATE TABLE `user_metas` (
  `id` int(11) NOT NULL,
  `by` bigint(20) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acct_saved`
--
ALTER TABLE `acct_saved`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_numbers`
--
ALTER TABLE `card_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `financial`
--
ALTER TABLE `financial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_tokens`
--
ALTER TABLE `mobile_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nas`
--
ALTER TABLE `nas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_for_reseler`
--
ALTER TABLE `price_for_reseler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radacct`
--
ALTER TABLE `radacct`
  ADD PRIMARY KEY (`radacctid`),
  ADD UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  ADD KEY `username` (`username`),
  ADD KEY `framedipaddress` (`framedipaddress`),
  ADD KEY `framedipv6address` (`framedipv6address`),
  ADD KEY `framedipv6prefix` (`framedipv6prefix`),
  ADD KEY `framedinterfaceid` (`framedinterfaceid`),
  ADD KEY `delegatedipv6prefix` (`delegatedipv6prefix`),
  ADD KEY `acctsessionid` (`acctsessionid`),
  ADD KEY `acctsessiontime` (`acctsessiontime`),
  ADD KEY `acctstarttime` (`acctstarttime`),
  ADD KEY `acctinterval` (`acctinterval`),
  ADD KEY `acctstoptime` (`acctstoptime`),
  ADD KEY `nasipaddress` (`nasipaddress`),
  ADD KEY `bulk_close` (`acctstoptime`,`nasipaddress`,`acctstarttime`);

--
-- Indexes for table `radpostauth`
--
ALTER TABLE `radpostauth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radreply`
--
ALTER TABLE `radreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rseler_meta`
--
ALTER TABLE `rseler_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_childs`
--
ALTER TABLE `service_childs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_group`
--
ALTER TABLE `service_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tg_service_orders`
--
ALTER TABLE `tg_service_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_activity`
--
ALTER TABLE `users_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_graph`
--
ALTER TABLE `user_graph`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_metas`
--
ALTER TABLE `user_metas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acct_saved`
--
ALTER TABLE `acct_saved`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_numbers`
--
ALTER TABLE `card_numbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial`
--
ALTER TABLE `financial`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mobile_tokens`
--
ALTER TABLE `mobile_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nas`
--
ALTER TABLE `nas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_for_reseler`
--
ALTER TABLE `price_for_reseler`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radacct`
--
ALTER TABLE `radacct`
  MODIFY `radacctid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radpostauth`
--
ALTER TABLE `radpostauth`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radreply`
--
ALTER TABLE `radreply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rseler_meta`
--
ALTER TABLE `rseler_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_childs`
--
ALTER TABLE `service_childs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_group`
--
ALTER TABLE `service_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tg_service_orders`
--
ALTER TABLE `tg_service_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_activity`
--
ALTER TABLE `users_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_graph`
--
ALTER TABLE `user_graph`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_metas`
--
ALTER TABLE `user_metas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
