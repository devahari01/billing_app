-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2024 at 12:00 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mallow`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add customer', 7, 'add_customer'),
(26, 'Can change customer', 7, 'change_customer'),
(27, 'Can delete customer', 7, 'delete_customer'),
(28, 'Can view customer', 7, 'view_customer'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add denomination', 9, 'add_denomination'),
(34, 'Can change denomination', 9, 'change_denomination'),
(35, 'Can delete denomination', 9, 'delete_denomination'),
(36, 'Can view denomination', 9, 'view_denomination'),
(37, 'Can add purchase', 10, 'add_purchase'),
(38, 'Can change purchase', 10, 'change_purchase'),
(39, 'Can delete purchase', 10, 'delete_purchase'),
(40, 'Can view purchase', 10, 'view_purchase');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$zEy38BWZXOxQbHnuRP0WGs$RxwnBmv7ZBJ7pD2W+g2VI4rNPRlFPmDyEG823KgJlRk=', '2024-11-28 02:18:32.503978', 1, 'admin', '', '', 'deva@gmail.com', 1, 1, '2024-11-28 02:18:05.848589');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billing_customer`
--

CREATE TABLE `billing_customer` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_customer`
--

INSERT INTO `billing_customer` (`id`, `email`) VALUES
(2, 'devahari.k@gmail.com'),
(1, 'k.devahari@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `billing_denomination`
--

CREATE TABLE `billing_denomination` (
  `id` bigint(20) NOT NULL,
  `value` int(10) UNSIGNED NOT NULL CHECK (`value` >= 0),
  `count` int(10) UNSIGNED NOT NULL CHECK (`count` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_denomination`
--

INSERT INTO `billing_denomination` (`id`, `value`, `count`) VALUES
(1, 500, 5),
(2, 100, 6),
(3, 50, 2),
(4, 200, 6),
(5, 20, 10),
(6, 10, 10),
(7, 5, 10),
(8, 2, 10),
(9, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `billing_product`
--

CREATE TABLE `billing_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `available_stocks` int(10) UNSIGNED NOT NULL CHECK (`available_stocks` >= 0),
  `price_per_unit` double NOT NULL,
  `tax_percentage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_product`
--

INSERT INTO `billing_product` (`id`, `name`, `product_id`, `available_stocks`, `price_per_unit`, `tax_percentage`) VALUES
(1, 'rice', '1', 10, 100, 5),
(2, 'Dal', '2', 20, 200, 5);

-- --------------------------------------------------------

--
-- Table structure for table `billing_purchase`
--

CREATE TABLE `billing_purchase` (
  `id` bigint(20) NOT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`products`)),
  `total_amount` double NOT NULL,
  `tax_amount` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_purchase`
--

INSERT INTO `billing_purchase` (`id`, `products`, `total_amount`, `tax_amount`, `date`, `customer_id`) VALUES
(9, '[{\"product_id\": \"1\", \"unit_price\": 100.0, \"quantity\": 1, \"purchase_price\": 100.0, \"tax_percentage\": 5.0, \"tax_payable\": 5.0, \"total_price\": 105.0}, {\"product_id\": \"2\", \"unit_price\": 200.0, \"quantity\": 1, \"purchase_price\": 200.0, \"tax_percentage\": 5.0, \"tax_payable\": 10.0, \"total_price\": 210.0}]', 315, 15, '2024-11-28 10:14:43.306899', 2),
(10, '[{\"product_id\": \"1\", \"unit_price\": 100.0, \"quantity\": 1, \"purchase_price\": 100.0, \"tax_percentage\": 5.0, \"tax_payable\": 5.0, \"total_price\": 105.0}]', 105, 5, '2024-11-28 10:51:32.443484', 2),
(11, '[{\"product_id\": \"1\", \"unit_price\": 100.0, \"quantity\": 1, \"purchase_price\": 100.0, \"tax_percentage\": 5.0, \"tax_payable\": 5.0, \"total_price\": 105.0}]', 105, 5, '2024-11-28 10:54:48.776568', 2),
(12, '[{\"product_id\": \"1\", \"unit_price\": 100.0, \"quantity\": 1, \"purchase_price\": 100.0, \"tax_percentage\": 5.0, \"tax_payable\": 5.0, \"total_price\": 105.0}]', 105, 5, '2024-11-28 10:55:08.855625', 2),
(13, '[{\"product_id\": \"1\", \"unit_price\": 100.0, \"quantity\": 1, \"purchase_price\": 100.0, \"tax_percentage\": 5.0, \"tax_payable\": 5.0, \"total_price\": 105.0}]', 105, 5, '2024-11-28 10:56:04.554715', 2),
(14, '[{\"product_id\": \"1\", \"unit_price\": 100.0, \"quantity\": 1, \"purchase_price\": 100.0, \"tax_percentage\": 5.0, \"tax_payable\": 5.0, \"total_price\": 105.0}]', 105, 5, '2024-11-28 10:56:25.968579', 2),
(15, '[{\"product_id\": \"1\", \"unit_price\": 100.0, \"quantity\": 1, \"purchase_price\": 100.0, \"tax_percentage\": 5.0, \"tax_payable\": 5.0, \"total_price\": 105.0}]', 105, 5, '2024-11-28 10:59:14.105642', 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-11-28 02:35:06.373789', '1', 'rice (1)', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-11-28 02:35:30.080589', '2', 'Dal (2)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-11-28 02:58:08.070881', '1', '500: 5', 1, '[{\"added\": {}}]', 9, 1),
(4, '2024-11-28 02:58:15.141789', '2', '100: 6', 1, '[{\"added\": {}}]', 9, 1),
(5, '2024-11-28 02:58:21.448727', '3', '50: 2', 1, '[{\"added\": {}}]', 9, 1),
(6, '2024-11-28 02:58:39.445611', '4', '200: 6', 1, '[{\"added\": {}}]', 9, 1),
(7, '2024-11-28 02:59:08.189363', '5', '20: 0', 1, '[{\"added\": {}}]', 9, 1),
(8, '2024-11-28 02:59:11.161047', '6', '10: 0', 1, '[{\"added\": {}}]', 9, 1),
(9, '2024-11-28 02:59:14.372587', '7', '5: 0', 1, '[{\"added\": {}}]', 9, 1),
(10, '2024-11-28 02:59:16.605091', '8', '2: 0', 1, '[{\"added\": {}}]', 9, 1),
(11, '2024-11-28 02:59:19.372086', '9', '1: 0', 1, '[{\"added\": {}}]', 9, 1),
(12, '2024-11-28 03:07:11.827765', '5', '20: 10', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 9, 1),
(13, '2024-11-28 03:07:17.171793', '9', '1: 10', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 9, 1),
(14, '2024-11-28 03:07:23.321096', '8', '2: 10', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 9, 1),
(15, '2024-11-28 03:07:29.013238', '7', '5: 10', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 9, 1),
(16, '2024-11-28 03:07:35.569992', '6', '10: 10', 2, '[{\"changed\": {\"fields\": [\"Count\"]}}]', 9, 1),
(17, '2024-11-28 09:56:42.672002', '5', 'Purchase by devahari.k@gmail.com on 2024-11-28 09:35:02.041146+00:00', 3, '', 10, 1),
(18, '2024-11-28 09:56:42.675641', '4', 'Purchase by devahari.k@gmail.com on 2024-11-28 09:34:22.206397+00:00', 3, '', 10, 1),
(19, '2024-11-28 09:56:42.678038', '3', 'Purchase by devahari.k@gmail.com on 2024-11-28 09:33:50.107967+00:00', 3, '', 10, 1),
(20, '2024-11-28 09:56:42.680200', '2', 'Purchase by devahari.k@gmail.com on 2024-11-28 09:23:16.529518+00:00', 3, '', 10, 1),
(21, '2024-11-28 09:56:42.685970', '1', 'Purchase by devahari.k@gmail.com on 2024-11-28 03:11:10.278927+00:00', 3, '', 10, 1),
(22, '2024-11-28 10:05:47.053026', '6', 'Purchase by devahari.k@gmail.com on 2024-11-28 09:57:41.453084+00:00', 3, '', 10, 1),
(23, '2024-11-28 10:10:48.009049', '7', 'Purchase by devahari.k@gmail.com on 2024-11-28 10:06:07.983340+00:00', 3, '', 10, 1),
(24, '2024-11-28 10:13:58.469080', '8', 'Purchase by devahari.k@gmail.com on 2024-11-28 10:12:36.101014+00:00', 3, '', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'billing', 'customer'),
(9, 'billing', 'denomination'),
(8, 'billing', 'product'),
(10, 'billing', 'purchase'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-28 02:15:57.602105'),
(2, 'auth', '0001_initial', '2024-11-28 02:15:58.098671'),
(3, 'admin', '0001_initial', '2024-11-28 02:15:58.194277'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-28 02:15:58.202272'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-28 02:15:58.210592'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-28 02:15:58.264373'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-28 02:15:58.303616'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-28 02:15:58.318608'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-28 02:15:58.327387'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-28 02:15:58.377405'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-28 02:15:58.382404'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-28 02:15:58.390397'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-28 02:15:58.404389'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-28 02:15:58.418014'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-28 02:15:58.431663'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-28 02:15:58.440258'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-28 02:15:58.452406'),
(18, 'billing', '0001_initial', '2024-11-28 02:15:58.488975'),
(19, 'billing', '0002_denomination_purchase', '2024-11-28 02:15:58.629377'),
(20, 'billing', '0003_alter_purchase_products', '2024-11-28 02:15:58.644062'),
(21, 'sessions', '0001_initial', '2024-11-28 02:15:58.682193'),
(22, 'billing', '0004_alter_purchase_products', '2024-11-28 09:56:55.701332'),
(23, 'billing', '0005_alter_purchase_products', '2024-11-28 09:56:55.713853'),
(24, 'billing', '0006_alter_purchase_products', '2024-11-28 10:14:16.889237');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1tfvlpoxql4v7j9bnpo4etgkutxhqq0h', '.eJxVjMEOwiAQRP-FsyEUaAGP3vsNZNndStXQpLQn479Lkx70Npn3Zt4iwr7luFde40ziKjpx-e0S4JPLAegB5b5IXMq2zkkeijxpleNC_Lqd7t9Bhprb2if0abIqWDCmBQq2A-akKKBG0MrxxEb3HvygXZODNcmHwXjSzmIvPl_9cTgQ:1tGU6y:QmJ1emZ76yI2mcEQztcnToicTwgnNKTCcQzKXe5iJ3g', '2024-12-12 02:18:32.506544');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `billing_customer`
--
ALTER TABLE `billing_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `billing_denomination`
--
ALTER TABLE `billing_denomination`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`);

--
-- Indexes for table `billing_product`
--
ALTER TABLE `billing_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `billing_purchase`
--
ALTER TABLE `billing_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_purchase_customer_id_b26459fa_fk_billing_customer_id` (`customer_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_customer`
--
ALTER TABLE `billing_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `billing_denomination`
--
ALTER TABLE `billing_denomination`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `billing_product`
--
ALTER TABLE `billing_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `billing_purchase`
--
ALTER TABLE `billing_purchase`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `billing_purchase`
--
ALTER TABLE `billing_purchase`
  ADD CONSTRAINT `billing_purchase_customer_id_b26459fa_fk_billing_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `billing_customer` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
