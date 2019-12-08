-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2019 at 11:39 AM
-- Server version: 5.6.45
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seductx_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `reset_code`) VALUES
(1, 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', '4116');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `agency_name` varchar(555) NOT NULL,
  `email` varchar(255) NOT NULL,
  `deviceToken` varchar(555) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `mobile_verify` int(11) NOT NULL COMMENT '0 - unverify ,1 - verify ',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock , 2 -block '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`agent_id`, `first_name`, `last_name`, `agency_name`, `email`, `deviceToken`, `password`, `reset_code`, `country_code`, `phone_number`, `latitude`, `longitude`, `token`, `created_at`, `mobile_verify`, `status`) VALUES
(1, 'ritesh', 'agent', 'ritesh private agency', 'agent@mailinator.com', '', 'e10adc3949ba59abbe56e057f20f883e', '', '101', '8319846729', '12.975596', '77.53538809999998', '', '2019-11-26 17:51:58', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `body_type`
--

CREATE TABLE `body_type` (
  `body_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `body_type`
--

INSERT INTO `body_type` (`body_type_id`, `name`, `status`) VALUES
(1, 'Slim', 1),
(2, 'Average', 1),
(3, 'Athletic', 1),
(4, 'Curvy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL,
  `hour` int(11) NOT NULL,
  `shot` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `services` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `special_request` text NOT NULL,
  `hotel` varchar(255) NOT NULL,
  `room_no` varchar(255) NOT NULL,
  `booking_date` datetime NOT NULL,
  `booking_end_date` datetime NOT NULL,
  `booking_expiry_date` datetime NOT NULL,
  `booking_location` text NOT NULL,
  `booking_latitude` varchar(255) NOT NULL,
  `booking_longitude` varchar(255) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `booking_call` varchar(255) NOT NULL,
  `request_status` int(11) NOT NULL COMMENT '0 - pending , 1 - accept , 2 - cancel, 3 - started , 4 -completed',
  `user_booking_status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - show, 2 -hide',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `escort_id`, `hour`, `shot`, `price`, `services`, `user_name`, `user_email`, `special_request`, `hotel`, `room_no`, `booking_date`, `booking_end_date`, `booking_expiry_date`, `booking_location`, `booking_latitude`, `booking_longitude`, `total_amount`, `booking_call`, `request_status`, `user_booking_status`, `created_at`) VALUES
(1, 1, 1, 2, 6, 12, '1,3,8,10', 'ajay user', 'user@mailinator.com', 'this is test request', 'sayaji', '52', '2019-11-26 18:30:44', '2019-11-26 20:30:44', '2019-11-26 21:30:44', '21, Rajgadh Kothi, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7514115', '75.88917400000003', 2500, 'Outcall', 4, 1, '2019-11-26 17:27:01'),
(2, 1, 1, 2, 6, 12, '1,3,8,10', 'ajay user', 'user@mailinator.com', 'sdfsdf', 'sayaji', '52', '2019-11-26 18:45:55', '2019-11-26 20:45:55', '2019-11-26 21:45:55', '21, Rajgadh Kothi, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7514115', '75.88917400000003', 2500, 'Outcall', 4, 1, '2019-11-26 17:33:08'),
(3, 1, 1, 2, 6, 12, '1,3,8,10', 'test user', 'user@maiinator.com', 'dasasd', 'sayaji', '23', '2019-11-26 19:45:50', '2019-11-26 21:45:50', '2019-11-26 22:45:50', '21, Rajgadh Kothi, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7514115', '75.88917400000003', 2500, 'Outcall', 4, 1, '2019-11-26 18:37:47'),
(4, 1, 1, 2, 6, 12, '1,3,8,10', 'user', 'user@mailinatoe.com', 'this is test desp', 'sayaji', '200', '2019-11-27 13:45:04', '2019-11-27 15:45:04', '2019-11-27 16:45:04', '21, Rajgadh Kothi, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7514115', '75.88917400000003', 2500, 'Outcall', 4, 1, '2019-11-27 12:38:43'),
(5, 2, 1, 2, 6, 12, '1,3,8,10', 'User', 'rajiv@mailinator.com', 'Gsgsggs', 'Sayaji', '23', '2019-11-27 16:00:07', '2019-11-27 18:00:07', '2019-11-27 19:00:07', '6, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7195687', '75.85772580000003', 2500, 'Outcall', 4, 1, '2019-11-27 14:56:01'),
(6, 3, 1, 2, 6, 12, '1,3,8,10', 'Ueueu', 'ueueu@gmail.com', 'Gdhhd', 'Gdgrg', '23', '2019-11-28 14:00:21', '2019-11-28 16:00:21', '2019-11-28 17:00:21', '6, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7195687', '75.85772580000003', 2500, 'Outcall', 4, 1, '2019-11-28 12:55:09'),
(7, 1, 1, 2, 6, 12, '1,3,8,10', 'Test user', 'user@mailinator.com', 'Ghhjj', 'Sayaji', '23', '2019-11-30 17:15:25', '2019-11-30 19:15:25', '2019-11-30 20:15:25', '6, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '19.1412127', '72.8309064', 2500, 'Outcall', 4, 1, '2019-11-30 16:15:23'),
(8, 1, 1, 1, 3, 1, '1,3,8,10', 'Tcgct', 'user@mailinator.com', 'Hi hvhv', 'Fttdt', '123', '2019-11-30 17:30:41', '2019-11-30 18:30:41', '2019-11-30 19:30:41', '6, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7195687', '75.85772580000003', 1000, 'Outcall', 3, 1, '2019-11-30 16:19:16'),
(9, 1, 1, 2, 6, 12, '1,3,8,10', 'User', 'user@mailinator.com', 'Gggh', 'Sayaji', '23', '2019-11-30 18:00:26', '2019-11-30 20:00:26', '2019-11-30 21:00:26', '6, Manorama Ganj, Indore, Madhya Pradesh 452001, India', '22.7514115', '75.88917400000003', 2500, 'Outcall', 1, 1, '2019-11-30 16:56:23'),
(10, 5, 1, 3, 8, 18, '1,3,8,10', 'Luke', 'dunshea.luke@gmail.com', '1', 'Holiday Inn', '69', '2019-12-01 03:45:36', '2019-12-01 06:45:36', '2019-12-01 07:45:36', '1274 Pacific Hwy, Turramurra NSW 2074, Australia', '-33.8688197', '151.20929550000005', 1000, 'Outcall', 2, 2, '2019-11-30 21:12:34'),
(11, 5, 6, 6, 23, 49, '1,2,3,4,5,6,7,8,9,10', 'luke', 'dunshea.luke@gmail.com', '1', 'Holiday Inn', '69', '2019-12-02 01:00:46', '2019-12-02 09:00:46', '2019-12-02 10:00:46', 'undefined', '-33.87443', '151.22226', 1000, 'Outcall', 4, 2, '2019-12-01 18:33:22'),
(12, 5, 6, 6, 23, 49, '1,2,3,4,5,6,7,8,9,10', 'Test', 'dunshea.luke@gmail', '1', 'Test', '1', '2019-12-02 01:30:15', '2019-12-02 09:30:15', '2019-12-02 10:30:15', '1274 Pacific Hwy, Turramurra NSW 2074, Australia', '-33.737157', '151.1334397', 1000, 'Outcall', 2, 2, '2019-12-01 18:56:11'),
(13, 5, 6, 6, 23, 49, '1,2,3,4,5,6,7,8,9,10', 'Luke', '1', '1', '1', '1', '2019-12-02 20:15:30', '2019-12-03 04:15:30', '2019-12-03 05:15:30', '1274 Pacific Hwy, Turramurra NSW 2074, Australia', '-33.87443', '151.22226', 1000, 'Outcall', 2, 2, '2019-12-02 13:39:26'),
(14, 5, 6, 1, 2, 1, '1,2,3,4,5,6,7,8,9,10', '1', '1', '1', '1', '1', '2019-12-02 20:15:07', '2019-12-02 21:15:07', '2019-12-02 22:15:07', '1274 Pacific Hwy, Turramurra NSW 2074, Australia', '-33.8688197', '151.20929550000005', 1000, 'Outcall', 4, 2, '2019-12-02 13:42:49'),
(15, 5, 6, 6, 23, 49, '1,2,3,4,5,6,7,8,9,10', 'Q', 'q', 'Q', 'W', '1', '2019-12-03 10:00:29', '2019-12-03 18:00:29', '2019-12-03 19:00:29', '9 Carlotta St, Artarmon NSW 2064, Australia', '-33.8688197', '151.20929550000005', 1000, 'Outcall', 1, 1, '2019-12-03 03:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `bust_size`
--

CREATE TABLE `bust_size` (
  `bust_size_id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bust_size`
--

INSERT INTO `bust_size` (`bust_size_id`, `size`, `status`) VALUES
(1, 30, 1),
(2, 32, 1),
(3, 34, 1),
(4, 36, 1),
(5, 38, 1),
(6, 40, 1),
(7, 42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `userFrom` int(11) NOT NULL,
  `userTo` int(11) NOT NULL,
  `message` text NOT NULL,
  `sendForm` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `userFrom`, `userTo`, `message`, `sendForm`, `created_at`) VALUES
(1, 1, 1, 'hii', 'provider', '2019-11-26 17:27:38'),
(2, 1, 1, 'hello', 'user', '2019-11-26 17:27:42'),
(3, 1, 1, 'how are you ', 'user', '2019-11-26 17:27:48'),
(4, 1, 1, 'i am fine', 'provider', '2019-11-26 17:27:54'),
(5, 1, 1, 'hello', 'user', '2019-11-26 18:38:26'),
(6, 1, 1, 'test', 'provider', '2019-11-26 18:38:30'),
(7, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:49'),
(8, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:49'),
(9, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:50'),
(10, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:52'),
(11, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:52'),
(12, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:52'),
(13, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:52'),
(14, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:52'),
(15, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:53'),
(16, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:53'),
(17, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:53'),
(18, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:53'),
(19, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:53'),
(20, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:53'),
(21, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:53'),
(22, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:54'),
(23, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:54'),
(24, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:54'),
(25, 1, 2, 'tfrtrr', 'provider', '2019-11-29 13:26:54'),
(26, 1, 2, 'fg', 'provider', '2019-11-29 15:59:12'),
(27, 1, 2, 'hello', 'provider', '2019-11-29 16:00:35'),
(28, 1, 1, 'Hiii', 'user', '2019-11-29 16:02:45'),
(29, 1, 2, 'hello', 'provider', '2019-11-29 16:02:53'),
(30, 1, 2, 'hello', 'provider', '2019-11-29 16:02:57'),
(31, 1, 2, 'hello', 'provider', '2019-11-29 16:02:57'),
(32, 1, 1, 'Hiii', 'user', '2019-11-29 16:03:26'),
(33, 1, 1, 'Hiii', 'user', '2019-11-29 16:05:45'),
(34, 2, 1, 'fgdfgdfgdfg', 'user', '2019-11-29 16:08:43'),
(35, 1, 2, 'fdgdfg', 'provider', '2019-11-29 16:08:50'),
(36, 2, 1, 'hii', 'user', '2019-11-29 16:10:17'),
(37, 2, 1, 'fdg', 'user', '2019-11-29 16:14:34'),
(38, 2, 1, 'fdgdfg', 'user', '2019-11-29 16:19:01'),
(39, 2, 1, 'dfgdfg', 'user', '2019-11-29 16:20:11'),
(40, 2, 1, 'fgdfgd', 'user', '2019-11-29 16:21:26'),
(41, 2, 1, '1111111111111', 'user', '2019-11-29 16:21:32'),
(42, 1, 2, 'fdgdfgd', 'provider', '2019-11-29 16:24:01'),
(43, 1, 2, 'fdgdfgd', 'provider', '2019-11-29 16:24:07'),
(44, 1, 2, 'fdgdfgd', 'provider', '2019-11-29 16:24:07'),
(45, 1, 2, 'hello', 'provider', '2019-11-29 16:24:31'),
(46, 2, 1, 'sdfsg', 'user', '2019-11-29 16:27:51'),
(47, 1, 1, 'hiiiii', 'provider', '2019-11-29 16:34:15'),
(48, 1, 1, 'fdfgdfgdfgdfgdfg', 'provider', '2019-11-29 16:34:39'),
(49, 1, 1, 'hello', 'provider', '2019-11-29 16:35:33'),
(50, 2, 1, 'dfgdfgdfg\'', 'user', '2019-11-29 16:36:32'),
(51, 2, 1, 'dfgdfgdfg\'', 'user', '2019-11-29 16:37:10'),
(52, 2, 1, 'dfgdfgdfg\'', 'user', '2019-11-29 16:37:54'),
(53, 1, 2, 'sdfsdfsdf', 'provider', '2019-11-29 16:40:40'),
(54, 2, 1, 'sdfsdf', 'user', '2019-11-29 16:40:46'),
(55, 1, 2, 'hiiii', 'provider', '2019-11-29 16:40:53'),
(56, 2, 1, 'hello', 'user', '2019-11-29 16:40:56'),
(57, 1, 1, 'Hiii', 'user', '2019-11-29 16:41:06'),
(58, 1, 1, 'Hiii ggg', 'user', '2019-11-29 16:41:18'),
(59, 1, 2, 'dfdfg', 'provider', '2019-11-29 16:42:39'),
(60, 2, 1, 'hiii', 'user', '2019-11-29 16:42:43'),
(61, 1, 2, 'dfdfg', 'provider', '2019-11-29 16:42:51'),
(62, 2, 1, 'hii', 'user', '2019-11-29 16:43:48'),
(63, 2, 1, 'hiii', 'user', '2019-11-29 16:44:24'),
(64, 2, 1, 'raj', 'user', '2019-11-29 16:44:31'),
(65, 1, 2, 'hi raj', 'provider', '2019-11-29 16:44:37'),
(66, 2, 1, 'raj fgdfg', 'user', '2019-11-29 16:44:45'),
(67, 1, 1, 'Hiii ggg', 'user', '2019-11-29 16:44:48'),
(68, 1, 2, 'hiii', 'provider', '2019-11-29 16:47:54'),
(69, 2, 1, 'hello', 'user', '2019-11-29 16:47:58'),
(70, 1, 2, 'how are you ', 'provider', '2019-11-29 16:48:06'),
(71, 2, 1, 'i am fine', 'user', '2019-11-29 16:48:11'),
(72, 1, 2, 'lets test', 'provider', '2019-11-29 16:48:20'),
(73, 2, 1, 'ok we test', 'user', '2019-11-29 16:48:27'),
(74, 1, 2, 'test 1', 'provider', '2019-11-29 16:48:48'),
(75, 2, 1, 'test2', 'user', '2019-11-29 16:48:55'),
(76, 1, 1, 'Another test', 'user', '2019-11-29 16:49:08'),
(77, 6, 5, 'Test', 'provider', '2019-12-01 18:35:25'),
(78, 6, 5, 'Test', 'provider', '2019-12-01 18:35:32'),
(79, 6, 5, 'Test', 'provider', '2019-12-01 18:52:58'),
(80, 6, 5, 'Test', 'provider', '2019-12-01 18:54:02'),
(81, 6, 5, 'Test', 'provider', '2019-12-01 18:57:16'),
(82, 5, 6, 'Test', 'user', '2019-12-01 19:27:38'),
(83, 1, 1, 'Hii', 'provider', '2019-12-01 19:35:55'),
(84, 1, 1, 'Hello', 'user', '2019-12-02 11:28:57'),
(85, 1, 1, 'how are you', 'provider', '2019-12-02 11:29:04'),
(86, 1, 1, 'I am fine', 'user', '2019-12-02 11:29:12'),
(87, 1, 1, 'Tgchvi', 'provider', '2019-12-02 13:30:39'),
(88, 1, 1, 'Hii', 'user', '2019-12-02 13:30:39'),
(89, 1, 1, 'Hii', 'user', '2019-12-02 13:30:39'),
(90, 1, 1, 'Hii', 'provider', '2019-12-02 13:30:54'),
(91, 1, 1, 'Hello', 'user', '2019-12-02 13:30:58'),
(92, 1, 1, 'Hiii', 'user', '2019-12-02 13:31:25'),
(93, 1, 1, 'Dg in fy', 'provider', '2019-12-02 13:31:32'),
(94, 1, 1, 'Hii', 'provider', '2019-12-02 17:01:10'),
(95, 1, 1, 'Hfhfu', 'user', '2019-12-02 17:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `chinese`
--

CREATE TABLE `chinese` (
  `chinese_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chinese`
--

INSERT INTO `chinese` (`chinese_id`, `type`, `status`) VALUES
(1, 'Don\'t speak', 1),
(2, 'Basic', 1),
(3, 'Average', 1),
(4, 'Fluent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_id`, `status`) VALUES
(1, 'SYDNEY', 1, 1),
(2, 'MELBOURNE', 1, 1),
(3, 'BRISBANE', 1, 1),
(4, 'GOLD COAST', 1, 1),
(5, 'ADELAIDE', 1, 1),
(6, 'CANBERRA', 1, 1),
(7, 'NEWCASTLE', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`, `phonecode`, `status`) VALUES
(1, 'AF', 'Afghanistan', 93, 1),
(2, 'AL', 'Albania', 355, 1),
(3, 'DZ', 'Algeria', 213, 1),
(4, 'AS', 'American Samoa', 1684, 1),
(5, 'AD', 'Andorra', 376, 1),
(6, 'AO', 'Angola', 244, 1),
(7, 'AI', 'Anguilla', 1264, 1),
(8, 'AQ', 'Antarctica', 0, 1),
(9, 'AG', 'Antigua And Barbuda', 1268, 1),
(10, 'AR', 'Argentina', 54, 1),
(11, 'AM', 'Armenia', 374, 1),
(12, 'AW', 'Aruba', 297, 1),
(13, 'AU', 'Australia', 61, 1),
(14, 'AT', 'Austria', 43, 1),
(15, 'AZ', 'Azerbaijan', 994, 1),
(16, 'BS', 'Bahamas The', 1242, 1),
(17, 'BH', 'Bahrain', 973, 1),
(18, 'BD', 'Bangladesh', 880, 1),
(19, 'BB', 'Barbados', 1246, 1),
(20, 'BY', 'Belarus', 375, 1),
(21, 'BE', 'Belgium', 32, 1),
(22, 'BZ', 'Belize', 501, 1),
(23, 'BJ', 'Benin', 229, 1),
(24, 'BM', 'Bermuda', 1441, 1),
(25, 'BT', 'Bhutan', 975, 1),
(26, 'BO', 'Bolivia', 591, 1),
(27, 'BA', 'Bosnia and Herzegovina', 387, 1),
(28, 'BW', 'Botswana', 267, 1),
(29, 'BV', 'Bouvet Island', 0, 1),
(30, 'BR', 'Brazil', 55, 1),
(31, 'IO', 'British Indian Ocean Territory', 246, 1),
(32, 'BN', 'Brunei', 673, 1),
(33, 'BG', 'Bulgaria', 359, 1),
(34, 'BF', 'Burkina Faso', 226, 1),
(35, 'BI', 'Burundi', 257, 1),
(36, 'KH', 'Cambodia', 855, 1),
(37, 'CM', 'Cameroon', 237, 1),
(38, 'CA', 'Canada', 1, 1),
(39, 'CV', 'Cape Verde', 238, 1),
(40, 'KY', 'Cayman Islands', 1345, 1),
(41, 'CF', 'Central African Republic', 236, 1),
(42, 'TD', 'Chad', 235, 1),
(43, 'CL', 'Chile', 56, 1),
(44, 'CN', 'China', 86, 1),
(45, 'CX', 'Christmas Island', 61, 1),
(46, 'CC', 'Cocos (Keeling) Islands', 672, 1),
(47, 'CO', 'Colombia', 57, 1),
(48, 'KM', 'Comoros', 269, 1),
(49, 'CG', 'Republic Of The Congo', 242, 1),
(50, 'CD', 'Democratic Republic Of The Congo', 242, 1),
(51, 'CK', 'Cook Islands', 682, 1),
(52, 'CR', 'Costa Rica', 506, 1),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225, 1),
(54, 'HR', 'Croatia (Hrvatska)', 385, 1),
(55, 'CU', 'Cuba', 53, 1),
(56, 'CY', 'Cyprus', 357, 1),
(57, 'CZ', 'Czech Republic', 420, 1),
(58, 'DK', 'Denmark', 45, 1),
(59, 'DJ', 'Djibouti', 253, 1),
(60, 'DM', 'Dominica', 1767, 1),
(61, 'DO', 'Dominican Republic', 1809, 1),
(62, 'TP', 'East Timor', 670, 1),
(63, 'EC', 'Ecuador', 593, 1),
(64, 'EG', 'Egypt', 20, 1),
(65, 'SV', 'El Salvador', 503, 1),
(66, 'GQ', 'Equatorial Guinea', 240, 1),
(67, 'ER', 'Eritrea', 291, 1),
(68, 'EE', 'Estonia', 372, 1),
(69, 'ET', 'Ethiopia', 251, 1),
(70, 'XA', 'External Territories of Australia', 61, 1),
(71, 'FK', 'Falkland Islands', 500, 1),
(72, 'FO', 'Faroe Islands', 298, 1),
(73, 'FJ', 'Fiji Islands', 679, 1),
(74, 'FI', 'Finland', 358, 1),
(75, 'FR', 'France', 33, 1),
(76, 'GF', 'French Guiana', 594, 1),
(77, 'PF', 'French Polynesia', 689, 1),
(78, 'TF', 'French Southern Territories', 0, 1),
(79, 'GA', 'Gabon', 241, 1),
(80, 'GM', 'Gambia The', 220, 1),
(81, 'GE', 'Georgia', 995, 1),
(82, 'DE', 'Germany', 49, 1),
(83, 'GH', 'Ghana', 233, 1),
(84, 'GI', 'Gibraltar', 350, 1),
(85, 'GR', 'Greece', 30, 1),
(86, 'GL', 'Greenland', 299, 1),
(87, 'GD', 'Grenada', 1473, 1),
(88, 'GP', 'Guadeloupe', 590, 1),
(89, 'GU', 'Guam', 1671, 1),
(90, 'GT', 'Guatemala', 502, 1),
(91, 'XU', 'Guernsey and Alderney', 44, 1),
(92, 'GN', 'Guinea', 224, 1),
(93, 'GW', 'Guinea-Bissau', 245, 1),
(94, 'GY', 'Guyana', 592, 1),
(95, 'HT', 'Haiti', 509, 1),
(96, 'HM', 'Heard and McDonald Islands', 0, 1),
(97, 'HN', 'Honduras', 504, 1),
(98, 'HK', 'Hong Kong S.A.R.', 852, 1),
(99, 'HU', 'Hungary', 36, 1),
(100, 'IS', 'Iceland', 354, 1),
(101, 'IN', 'India', 91, 1),
(102, 'ID', 'Indonesia', 62, 1),
(103, 'IR', 'Iran', 98, 1),
(104, 'IQ', 'Iraq', 964, 1),
(105, 'IE', 'Ireland', 353, 1),
(106, 'IL', 'Israel', 972, 1),
(107, 'IT', 'Italy', 39, 1),
(108, 'JM', 'Jamaica', 1876, 1),
(109, 'JP', 'Japan', 81, 1),
(110, 'XJ', 'Jersey', 44, 1),
(111, 'JO', 'Jordan', 962, 1),
(112, 'KZ', 'Kazakhstan', 7, 1),
(113, 'KE', 'Kenya', 254, 1),
(114, 'KI', 'Kiribati', 686, 1),
(115, 'KP', 'Korea North', 850, 1),
(116, 'KR', 'Korea South', 82, 1),
(117, 'KW', 'Kuwait', 965, 1),
(118, 'KG', 'Kyrgyzstan', 996, 1),
(119, 'LA', 'Laos', 856, 1),
(120, 'LV', 'Latvia', 371, 1),
(121, 'LB', 'Lebanon', 961, 1),
(122, 'LS', 'Lesotho', 266, 1),
(123, 'LR', 'Liberia', 231, 1),
(124, 'LY', 'Libya', 218, 1),
(125, 'LI', 'Liechtenstein', 423, 1),
(126, 'LT', 'Lithuania', 370, 1),
(127, 'LU', 'Luxembourg', 352, 1),
(128, 'MO', 'Macau S.A.R.', 853, 1),
(129, 'MK', 'Macedonia', 389, 1),
(130, 'MG', 'Madagascar', 261, 1),
(131, 'MW', 'Malawi', 265, 1),
(132, 'MY', 'Malaysia', 60, 1),
(133, 'MV', 'Maldives', 960, 1),
(134, 'ML', 'Mali', 223, 1),
(135, 'MT', 'Malta', 356, 1),
(136, 'XM', 'Man (Isle of)', 44, 1),
(137, 'MH', 'Marshall Islands', 692, 1),
(138, 'MQ', 'Martinique', 596, 1),
(139, 'MR', 'Mauritania', 222, 1),
(140, 'MU', 'Mauritius', 230, 1),
(141, 'YT', 'Mayotte', 269, 1),
(142, 'MX', 'Mexico', 52, 1),
(143, 'FM', 'Micronesia', 691, 1),
(144, 'MD', 'Moldova', 373, 1),
(145, 'MC', 'Monaco', 377, 1),
(146, 'MN', 'Mongolia', 976, 1),
(147, 'MS', 'Montserrat', 1664, 1),
(148, 'MA', 'Morocco', 212, 1),
(149, 'MZ', 'Mozambique', 258, 1),
(150, 'MM', 'Myanmar', 95, 1),
(151, 'NA', 'Namibia', 264, 1),
(152, 'NR', 'Nauru', 674, 1),
(153, 'NP', 'Nepal', 977, 1),
(154, 'AN', 'Netherlands Antilles', 599, 1),
(155, 'NL', 'Netherlands The', 31, 1),
(156, 'NC', 'New Caledonia', 687, 1),
(157, 'NZ', 'New Zealand', 64, 1),
(158, 'NI', 'Nicaragua', 505, 1),
(159, 'NE', 'Niger', 227, 1),
(160, 'NG', 'Nigeria', 234, 1),
(161, 'NU', 'Niue', 683, 1),
(162, 'NF', 'Norfolk Island', 672, 1),
(163, 'MP', 'Northern Mariana Islands', 1670, 1),
(164, 'NO', 'Norway', 47, 1),
(165, 'OM', 'Oman', 968, 1),
(166, 'PK', 'Pakistan', 92, 1),
(167, 'PW', 'Palau', 680, 1),
(168, 'PS', 'Palestinian Territory Occupied', 970, 1),
(169, 'PA', 'Panama', 507, 1),
(170, 'PG', 'Papua new Guinea', 675, 1),
(171, 'PY', 'Paraguay', 595, 1),
(172, 'PE', 'Peru', 51, 1),
(173, 'PH', 'Philippines', 63, 1),
(174, 'PN', 'Pitcairn Island', 0, 1),
(175, 'PL', 'Poland', 48, 1),
(176, 'PT', 'Portugal', 351, 1),
(177, 'PR', 'Puerto Rico', 1787, 1),
(178, 'QA', 'Qatar', 974, 1),
(179, 'RE', 'Reunion', 262, 1),
(180, 'RO', 'Romania', 40, 1),
(181, 'RU', 'Russia', 70, 1),
(182, 'RW', 'Rwanda', 250, 1),
(183, 'SH', 'Saint Helena', 290, 1),
(184, 'KN', 'Saint Kitts And Nevis', 1869, 1),
(185, 'LC', 'Saint Lucia', 1758, 1),
(186, 'PM', 'Saint Pierre and Miquelon', 508, 1),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784, 1),
(188, 'WS', 'Samoa', 684, 1),
(189, 'SM', 'San Marino', 378, 1),
(190, 'ST', 'Sao Tome and Principe', 239, 1),
(191, 'SA', 'Saudi Arabia', 966, 1),
(192, 'SN', 'Senegal', 221, 1),
(193, 'RS', 'Serbia', 381, 1),
(194, 'SC', 'Seychelles', 248, 1),
(195, 'SL', 'Sierra Leone', 232, 1),
(196, 'SG', 'Singapore', 65, 1),
(197, 'SK', 'Slovakia', 421, 1),
(198, 'SI', 'Slovenia', 386, 1),
(199, 'XG', 'Smaller Territories of the UK', 44, 1),
(200, 'SB', 'Solomon Islands', 677, 1),
(201, 'SO', 'Somalia', 252, 1),
(202, 'ZA', 'South Africa', 27, 1),
(203, 'GS', 'South Georgia', 0, 1),
(204, 'SS', 'South Sudan', 211, 1),
(205, 'ES', 'Spain', 34, 1),
(206, 'LK', 'Sri Lanka', 94, 1),
(207, 'SD', 'Sudan', 249, 1),
(208, 'SR', 'Suriname', 597, 1),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47, 1),
(210, 'SZ', 'Swaziland', 268, 1),
(211, 'SE', 'Sweden', 46, 1),
(212, 'CH', 'Switzerland', 41, 1),
(213, 'SY', 'Syria', 963, 1),
(214, 'TW', 'Taiwan', 886, 1),
(215, 'TJ', 'Tajikistan', 992, 1),
(216, 'TZ', 'Tanzania', 255, 1),
(217, 'TH', 'Thailand', 66, 1),
(218, 'TG', 'Togo', 228, 1),
(219, 'TK', 'Tokelau', 690, 1),
(220, 'TO', 'Tonga', 676, 1),
(221, 'TT', 'Trinidad And Tobago', 1868, 1),
(222, 'TN', 'Tunisia', 216, 1),
(223, 'TR', 'Turkey', 90, 1),
(224, 'TM', 'Turkmenistan', 7370, 1),
(225, 'TC', 'Turks And Caicos Islands', 1649, 1),
(226, 'TV', 'Tuvalu', 688, 1),
(227, 'UG', 'Uganda', 256, 1),
(228, 'UA', 'Ukraine', 380, 1),
(229, 'AE', 'United Arab Emirates', 971, 1),
(230, 'GB', 'United Kingdom', 44, 1),
(231, 'US', 'United States', 1, 1),
(232, 'UM', 'United States Minor Outlying Islands', 1, 1),
(233, 'UY', 'Uruguay', 598, 1),
(234, 'UZ', 'Uzbekistan', 998, 1),
(235, 'VU', 'Vanuatu', 678, 1),
(236, 'VA', 'Vatican City State (Holy See)', 39, 1),
(237, 'VE', 'Venezuela', 58, 1),
(238, 'VN', 'Vietnam', 84, 1),
(239, 'VG', 'Virgin Islands (British)', 1284, 1),
(240, 'VI', 'Virgin Islands (US)', 1340, 1),
(241, 'WF', 'Wallis And Futuna Islands', 681, 1),
(242, 'EH', 'Western Sahara', 212, 1),
(243, 'YE', 'Yemen', 967, 1),
(244, 'YU', 'Yugoslavia', 38, 1),
(245, 'ZM', 'Zambia', 260, 1),
(246, 'ZW', 'Zimbabwe', 263, 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `status`) VALUES
(1, 'AUSTRALIA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cup_size`
--

CREATE TABLE `cup_size` (
  `cup_size_id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cup_size`
--

INSERT INTO `cup_size` (`cup_size_id`, `size`, `status`) VALUES
(1, 'A', 1),
(2, 'B', 1),
(3, 'C', 1),
(4, 'D', 1),
(5, 'D+', 1);

-- --------------------------------------------------------

--
-- Table structure for table `english`
--

CREATE TABLE `english` (
  `english_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `english`
--

INSERT INTO `english` (`english_id`, `type`, `status`) VALUES
(1, 'Don\'t speak', 1),
(2, 'Basic', 1),
(3, 'Average', 1),
(4, 'Fluent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `escort`
--

CREATE TABLE `escort` (
  `escort_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `deviceToken` varchar(555) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_code` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `body_type` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `height` float NOT NULL,
  `bust_size` int(11) NOT NULL,
  `cup_size` int(11) NOT NULL,
  `waise_size` int(11) NOT NULL,
  `hip_size` int(11) NOT NULL,
  `english` int(11) NOT NULL,
  `chinese` int(11) NOT NULL,
  `japanese` int(11) NOT NULL,
  `korean` int(11) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL,
  `image4` varchar(255) NOT NULL,
  `image5` varchar(255) NOT NULL,
  `image6` varchar(255) NOT NULL,
  `service` varchar(555) NOT NULL,
  `cancellation_policy` varchar(555) NOT NULL,
  `payment_method` varchar(555) NOT NULL,
  `avg_rating` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock , 2 -block ',
  `online_status` int(11) NOT NULL DEFAULT '2' COMMENT '1 -online , 2 - offline',
  `progress_status` int(11) NOT NULL COMMENT '0 - signup , 1 - profile , 2 - service , 3 -  Rates , 4 - complete',
  `mobile_verify` int(11) NOT NULL COMMENT '0 - unverify , 1 - verify',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `escort`
--

INSERT INTO `escort` (`escort_id`, `agent_id`, `first_name`, `last_name`, `latitude`, `longitude`, `email`, `deviceToken`, `profile_image`, `password`, `reset_code`, `token`, `country_code`, `phone_number`, `country_id`, `state_id`, `city_id`, `gender`, `body_type`, `age`, `height`, `bust_size`, `cup_size`, `waise_size`, `hip_size`, `english`, `chinese`, `japanese`, `korean`, `image1`, `image2`, `image3`, `image4`, `image5`, `image6`, `service`, `cancellation_policy`, `payment_method`, `avg_rating`, `status`, `online_status`, `progress_status`, `mobile_verify`, `created_at`) VALUES
(1, 1, 'ajay', 'provider', '22.7532848', '75.89369620000002', 'provider@mailinator.com', 'cMQV-a1UT8I:APA91bGr9DhHC1vBG0IJG_XWY12nUQorn8gpkqh6RcCULVb4Xvi_ET6_H6jvGn7hwv0o3X7mgcwyLicle5KxrOnhp0G2ZiP4uRHHF6721eYAhdKkbf8HQpWMecB2sApMzzL20ZYH8S8U', 'assets/escortfile/profile/caadc1d9b92cd625023076834f2ae2fe.jpg', 'e10adc3949ba59abbe56e057f20f883e', '', '', '101', '8319846725', 1, 0, 1, 2, 1, 22, 225, 1, 1, 1, 1, 1, 1, 1, 1, 'assets/escortfile/image/74a568d9b92e65e7de8438bea409a15e.jpg', 'assets/escortfile/image/49d9cc3a26d268536e36313466f62a0e.jpg', 'assets/escortfile/image/c406b463b5b2145db01d9f7763840b65.jpg', 'assets/escortfile/image/dde9751ebaddfe61d2e5ec092f757aea.jpg', 'assets/escortfile/image/089a8180c3d6aaf265352e99516bf916.jpg', 'assets/escortfile/image/5305ab5df9b6421effef9e26b2ceef60.jpg', '1,3,8,10', 'this is test cancel policy', 'by cash', 4, 1, 1, 4, 1, '2019-11-26 17:12:45'),
(2, 1, 'rajiv', 'provider', '22.7195687', '75.85772580000003', 'rajiv@mailinator.com', '', 'assets/escortfile/profile/9506a4f1d680585b9a37d6f4ee13b602.jpg', 'e10adc3949ba59abbe56e057f20f883e', '', '', '101', '8319846729', 1, 0, 1, 2, 2, 22, 22, 2, 2, 6, 6, 2, 2, 1, 1, 'assets/escortfile/image/7a6aa56e8dae138e555eccbdc6a16c37.jpg', 'assets/escortfile/image/26eba2a399ff47f1c2c0007c54f83e3c.jpg', 'assets/escortfile/image/7ee7b5cd83eafa87ebe3a45b7e9ed29d.jpg', 'assets/escortfile/image/9aa1dfc5f55ba9bcfa61f979786081c2.jpg', 'assets/escortfile/image/06b76ff86fe8567792304a8a9eb5a991.jpg', 'assets/escortfile/image/250c32a854fd7ae4e345620925a623d1.jpg', '1,3', 'dgd', 'dfg', 0, 1, 2, 4, 1, '2019-11-26 18:01:10'),
(3, 0, 'gaurav', 'provider', '22.7532848', '75.89369620000002', 'gaurav@mailinator.com', '', 'assets/escortfile/profile/2032347d9e53eb760bf3b1844258f062.jpg', 'e10adc3949ba59abbe56e057f20f883e', '', '', '101', '7694950009', 1, 0, 1, 2, 1, 22, 223, 6, 1, 2, 4, 2, 2, 2, 2, 'assets/escortfile/image/dc87e89cefff6eb5c0f5a94e551fe767.jpg', 'assets/escortfile/image/83233d35536f57056580e4c922e2fcfd.jpg', 'assets/escortfile/image/cd7e1f4220c4294d25a05053da17eed9.jpg', 'assets/escortfile/image/fe3071de3b7ecae2fce330dcdbdee254.jpg', 'assets/escortfile/image/eefc73fb216131a79cf88c53d18a1792.jpg', 'assets/escortfile/image/d4e6dd1dbdde9b596c67e210d34c8a61.jpg', '1,3', 'dfdfg', 'dfgdfg', 0, 1, 2, 4, 1, '2019-11-26 19:06:03'),
(4, 0, 'vijay', 'provider', '22.7195687', '75.85772580000003', 'vijay@mailinator.com', '', 'assets/escortfile/profile/27200bfadc86ff30d951867acbe8d659.jpg', 'e10adc3949ba59abbe56e057f20f883e', '', '', '101', '4651465465', 1, 0, 1, 2, 1, 22, 223, 2, 2, 3, 3, 2, 1, 2, 2, 'assets/escortfile/image/79c01ae6e77be491f9a56af2004af61b.jpg', 'assets/escortfile/image/76fac43620eff35f955b6f4b024f6052.jpg', 'assets/escortfile/image/c5c20271eeaf2f5a12606949c1be9e63.jpg', 'assets/escortfile/image/2b52ed319da386d2b2bb52b8a7e70efa.jpg', 'assets/escortfile/image/16de3baeacc9dd47cca3dd80983e8fc4.jpg', 'assets/escortfile/image/2cf2814c72a4e61b463be4a64f720ffa.jpg', '1,3', 'asfsdf', 'sdfs', 0, 1, 2, 4, 1, '2019-11-28 12:50:09'),
(5, 0, 'faran', 'provider', '22.7195687', '75.85772580000003', 'faran@mailinator.com', '', 'assets/escortfile/profile/fdcf276e8c5f9922ea4fa955aa95d6e5.jpg', 'e10adc3949ba59abbe56e057f20f883e', '', '', '101', '784578451', 1, 0, 1, 2, 1, 18, 5.5, 3, 2, 6, 4, 3, 2, 2, 2, 'assets/escortfile/image/908b2564e9db131794dc97c5c50fc8e3.jpg', 'assets/escortfile/image/2e2655a89b9bd0667bd19656377cb99c.jpg', 'assets/escortfile/image/b7be98588a47c31f72d913ebe2780a13.jpg', 'assets/escortfile/image/f7f5bec87e342a97bfd85b1e11fdf9e3.jpg', 'assets/escortfile/image/8a2aa0a17bc764f2dc552fe98f17c07d.jpg', 'assets/escortfile/image/b3d393af6f2856ec88827878ba9e448a.jpg', '1,2', 'test demo', 'pay by cash', 0, 1, 2, 4, 1, '2019-11-29 17:54:16'),
(6, 0, 'Test', 'Escort', '-33.8688197', '151.20929550000005', 'seductxtest1@mailinator.com', '', 'assets/escortfile/profile/0941447279854fb6b742e9bb23396854.png', 'c23b2ed66eedb321c5bcfb5e3724b978', '', '', '13', '0499987599', 1, 0, 1, 2, 1, 22, 170, 7, 5, 3, 3, 4, 4, 4, 4, 'assets/escortfile/image/9ab156d23fe1116340421679c7466a0d.png', 'assets/escortfile/image/628204c99c5b9e764cca683d8169c62d.png', 'assets/escortfile/image/21e3e3c345611c657259d4c9a7e49773.png', 'assets/escortfile/image/dd31520f7055cd28046b21a523ce9870.png', 'assets/escortfile/image/03a25142974c841280684c23c231f7ea.png', 'assets/escortfile/image/291d3b37e225d3c9a4a2c049115085f1.png', '1,2,3,4,5,6,7,8,9,10', '1', 'Cash', 5, 1, 2, 4, 1, '2019-12-01 05:09:59'),
(7, 0, 'kabir', 'provider', '22.7195687', '75.85772580000003', 'kabir223@mailinator.com', '', '', 'e10adc3949ba59abbe56e057f20f883e', '', '', '101', '8956235689', 1, 0, 1, 2, 2, 23, 333, 3, 1, 5, 2, 2, 2, 1, 1, '', '', '', '', '', '', '1,3', 'dfgdfg', 'dfgdfg', 0, 1, 2, 3, 1, '2019-12-02 11:38:58'),
(8, 0, 'rajat', 'sharma', '22.7195687', '75.85772580000003', 'rajat@mailinator.com', '', '', 'e10adc3949ba59abbe56e057f20f883e', '', '', '101', '8319847899', 1, 0, 1, 2, 2, 22, 223, 2, 2, 7, 4, 1, 1, 4, 3, '', '', '', '', '', '', '1,3', 'hjkh', 'hjkhjk', 0, 1, 2, 3, 1, '2019-12-02 13:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `escort_additional_service`
--

CREATE TABLE `escort_additional_service` (
  `escort_additional_service_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `escort_additional_service`
--

INSERT INTO `escort_additional_service` (`escort_additional_service_id`, `service_id`, `price_id`, `escort_id`) VALUES
(4, 12, 12, 1),
(5, 11, 8, 1),
(6, 11, 1, 2),
(7, 11, 1, 3),
(8, 11, 1, 4),
(9, 11, 8, 5),
(10, 11, 10, 6),
(11, 12, 12, 6),
(12, 11, 1, 7),
(13, 11, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `escort_follow`
--

CREATE TABLE `escort_follow` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL,
  `follow_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `escort_follow`
--

INSERT INTO `escort_follow` (`id`, `user_id`, `escort_id`, `follow_time`) VALUES
(5, 5, 6, '2019-12-02 13:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `escort_rate`
--

CREATE TABLE `escort_rate` (
  `escort_rate_id` int(11) NOT NULL,
  `hour` int(11) NOT NULL,
  `shot` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `escort_rate`
--

INSERT INTO `escort_rate` (`escort_rate_id`, `hour`, `shot`, `price`, `escort_id`) VALUES
(8, 6, 23, 49, 1),
(9, 1, 3, 1, 1),
(10, 2, 6, 12, 1),
(11, 3, 8, 18, 1),
(12, 5, 17, 38, 2),
(13, 6, 23, 49, 2),
(14, 7, 36, 61, 2),
(15, 3, 8, 18, 3),
(16, 5, 17, 38, 3),
(17, 4, 12, 27, 3),
(18, 7, 36, 61, 4),
(19, 8, 43, 72, 4),
(20, 8, 43, 72, 5),
(21, 2, 4, 9, 5),
(22, 3, 8, 18, 5),
(23, 1, 2, 1, 6),
(24, 2, 4, 9, 6),
(25, 3, 8, 18, 6),
(26, 4, 12, 27, 6),
(27, 5, 17, 38, 6),
(28, 6, 23, 49, 6),
(29, 1, 1, 1, 7),
(30, 2, 4, 9, 7),
(31, 1, 1, 1, 8),
(32, 2, 4, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `faq_tbl`
--

CREATE TABLE `faq_tbl` (
  `id` int(11) NOT NULL,
  `info` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq_tbl`
--

INSERT INTO `faq_tbl` (`id`, `info`) VALUES
(1, '<p><strong>Client</strong></p>\r\n\r\n<p>How do I sign up for SeductX? (LINK to PREMIUM MEMBERSHIP)</p>\r\n\r\n<p>What are the benefits of being a premium member? (LINK to PREMIUM MEMBERSHIP)</p>\r\n\r\n<p>How much is a premium membership? (LINK to PREMIUM MEMBERSHIP)</p>\r\n\r\n<p>Why do I need to verify myself? (LINK to PREMIUM MEMBERSHIP)</p>\r\n\r\n<p>How do I hire an escort? (LINK to CLIENT SIGN UP)</p>\r\n\r\n<p>I arranged a booking, now what? (LINK to CLIENT GUIDE)</p>\r\n\r\n<p>How does the payment work? (LINK to CLIENT GUIDE)</p>\r\n\r\n<p>I&rsquo;m not satisfied with my escort, now what? (LINK to TERMS &amp; SERVICES)</p>\r\n\r\n<p><strong>Escort / Agencies</strong></p>\r\n\r\n<p>How do I sign up for SeductX? (LINK to BECOME AN ESCORT)</p>\r\n\r\n<p>Why would I choose to be a premium escort? (LINK to BECOME AN ESCORT)</p>\r\n\r\n<p>How much is a premium escort membership? (LINK to BECOME AN ESCORT)</p>\r\n\r\n<p>Why do I need to verify myself? (LINK to BECOME AN ESCORT)</p>\r\n\r\n<p>A client booked with me, now what? (LINK to ESCORT STYLE GUIDE)</p>\r\n\r\n<p>A booking was arranged, but the client didn&rsquo;t show up. Now what? (LINK to ESCORT STYLE</p>\r\n\r\n<p>GUIDE)</p>\r\n\r\n<p>The client is not hygienic, violent or intoxicated. Can I cancel the booking? (LINK to ESCORT</p>\r\n\r\n<p>STYLE GUIDE)</p>\r\n\r\n<p>How does the payment work? LINK to ESCORT STYLE GUIDE)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Premium Membership for Clients</strong></p>\r\n\r\n<p>For those who want to establish a more intimate bond with our escorts, and for those who</p>\r\n\r\n<p>want to get to know our escorts a bit better, we offer a Premium Membership starting from</p>\r\n\r\n<p>only $9.99 for 3 days.</p>\r\n\r\n<p><strong>Chat with any escort</strong></p>\r\n\r\n<p>Our premium members are able to chat with any escort any time, without the need to book</p>\r\n\r\n<p>them. Ideal for those who want to know more about an escort, before booking and meeting</p>\r\n\r\n<p>them in real life.</p>\r\n\r\n<p><strong>Geolocation service</strong></p>\r\n\r\n<p>Premium clients get access to geolocation services, giving clients an idea how long it will</p>\r\n\r\n<p>take before their escort will arrive. Keep in mind, exact locations of our escorts will never be</p>\r\n\r\n<p>revealed for privacy reasons.</p>\r\n\r\n<p><strong>Phone numbers never exposed</strong></p>\r\n\r\n<p>There&rsquo;s no more need to carry a second phone. When clients are using SeductX, all</p>\r\n\r\n<p>communication goes through our platform. Phone numbers from clients are never exposed</p>\r\n\r\n<p>to escorts or anybody else.</p>\r\n\r\n<p><strong>Verified photos and comments</strong></p>\r\n\r\n<p>On top of this, premium clients have the ability to see verified photos. These photos have</p>\r\n\r\n<p>been verified by the community, based on past experiences and bookings. That way</p>\r\n\r\n<p>premium clients can be sure to book the escort they are looking for. Verified user comments</p>\r\n\r\n<p>will also be viewable by our premium clients, adding another layer of trust and authenticity</p>\r\n\r\n<p>SeductX&rsquo;s Premium Membership.</p>\r\n\r\n<p><strong>Booking advantages</strong></p>\r\n\r\n<p>Standard members can book their escort 4 hours in advance, while Premium Members have</p>\r\n\r\n<p>the option to do this 24 hours in advance. On top of that Premium Members can book an</p>\r\n\r\n<p>escort for just 1 hour, while standard members have a 2 hour minimum. To make things</p>\r\n\r\n<p>even easier for our Premium Members, they can find online and offline escorts on our</p>\r\n\r\n<p>platform. Standard members can only find our online escorts. Clients can set notifications for</p>\r\n\r\n<p>the moment an escort comes online, while the escort receives a message when a client is</p>\r\n\r\n<p>interested.</p>\r\n\r\n<p>That&rsquo;s a whole lot of benefits for our Premium Clients. Apply now for our Premium</p>\r\n\r\n<p>Membership.</p>\r\n\r\n<p>● Premium Membership - 3 days $9.99</p>\r\n\r\n<p>● Premium Membership - 7 days $14.99</p>\r\n\r\n<p>● Premium Membership - 30 days $24.99</p>\r\n\r\n<p>● Xclusive Premium Membership - 1 year $99.99</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>SIGN UP FOR THE SEDUCTX PREMIUM MEMBERSHIP</p>\r\n\r\n<p>Make an account and login</p>\r\n\r\n<p>Credit card / Mastercard / Visa</p>\r\n\r\n<p>Online bank payment option</p>\r\n\r\n<p>Crypto payment option (Bitpay)</p>\r\n\r\n<p>Our services will be invoiced by:--</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`id`, `user_id`, `escort_id`, `created_at`) VALUES
(5, 1, 1, '2019-11-30 16:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock , 2 - unblock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `name`, `status`) VALUES
(1, 'Male', 1),
(2, 'Female', 1),
(3, 'Transgender', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hip_size`
--

CREATE TABLE `hip_size` (
  `hip_size_id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hip_size`
--

INSERT INTO `hip_size` (`hip_size_id`, `size`, `status`) VALUES
(1, 30, 1),
(2, 32, 1),
(3, 34, 1),
(4, 36, 1),
(5, 38, 1),
(6, 40, 1),
(7, 42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `hour_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hour_time` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`hour_id`, `name`, `hour_time`, `status`) VALUES
(1, '1 hr', 1, 1),
(2, '2 hr', 2, 1),
(3, '3 hr', 3, 1),
(4, '4 hr', 4, 1),
(5, '6 hr', 6, 1),
(6, '8 hr', 8, 1),
(7, '10 hr', 10, 1),
(8, '12 hr', 12, 1),
(9, '15 hr', 15, 1),
(10, '24 hr', 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `japanese`
--

CREATE TABLE `japanese` (
  `japanese_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `japanese`
--

INSERT INTO `japanese` (`japanese_id`, `type`, `status`) VALUES
(1, 'Don\'t speak', 1),
(2, 'Basic', 1),
(3, 'Average', 1),
(4, 'Fluent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `korean`
--

CREATE TABLE `korean` (
  `korean_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korean`
--

INSERT INTO `korean` (`korean_id`, `type`, `status`) VALUES
(1, 'Don\'t speak', 1),
(2, 'Basic', 1),
(3, 'Average', 1),
(4, 'Fluent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification_tbl`
--

CREATE TABLE `notification_tbl` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `send_form` int(11) NOT NULL,
  `send_to` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 - booking accept ,2 - booking reject , 3 - booking request, 4 - online escort ',
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_tbl`
--

INSERT INTO `notification_tbl` (`id`, `message`, `send_form`, `send_to`, `date`, `type`, `booking_id`) VALUES
(1, 'you have a new booking request :', 1, 1, '2019-11-26 17:27:01', 3, 1),
(2, 'has been accepted your request', 1, 1, '2019-11-26 17:27:17', 1, 1),
(3, 'has been started your request', 1, 1, '2019-11-26 17:28:30', 3, 1),
(4, 'has been completed your request', 1, 1, '2019-11-26 17:28:40', 4, 1),
(5, 'you have a new booking request :', 1, 1, '2019-11-26 17:33:09', 3, 2),
(6, 'has been accepted your request', 1, 1, '2019-11-26 17:33:21', 1, 2),
(7, 'you have a new booking request :', 1, 1, '2019-11-26 18:37:47', 3, 3),
(8, 'has been accepted your request', 1, 1, '2019-11-26 18:37:57', 1, 3),
(9, 'has been started your request', 1, 1, '2019-11-26 18:38:12', 3, 3),
(10, 'has been started your request', 1, 1, '2019-11-26 18:38:41', 3, 2),
(11, 'has been completed your request', 1, 1, '2019-11-26 18:38:45', 4, 3),
(12, 'has been completed your request', 1, 1, '2019-11-26 18:38:50', 4, 2),
(13, 'you have a new booking request :', 1, 1, '2019-11-27 12:38:44', 3, 4),
(14, 'has been accepted your request', 1, 1, '2019-11-27 12:39:12', 1, 4),
(15, 'you have a new booking request :', 2, 1, '2019-11-27 14:56:01', 3, 5),
(16, 'has been accepted your request', 1, 2, '2019-11-27 14:56:47', 1, 5),
(17, 'you have a new booking request :', 3, 1, '2019-11-28 12:55:09', 3, 6),
(18, 'has been accepted your request', 1, 3, '2019-11-28 12:55:20', 1, 6),
(19, 'has been started your request', 1, 3, '2019-11-29 12:41:26', 3, 6),
(20, 'has been started your request', 1, 2, '2019-11-30 16:12:06', 3, 5),
(21, 'has been started your request', 1, 1, '2019-11-30 16:13:21', 3, 4),
(22, 'has been completed your request', 1, 1, '2019-11-30 16:13:38', 4, 4),
(23, 'has been completed your request', 1, 2, '2019-11-30 16:13:58', 4, 5),
(24, 'you have a new booking request :', 1, 1, '2019-11-30 16:15:23', 3, 7),
(25, 'has been accepted your request', 1, 1, '2019-11-30 16:16:21', 1, 7),
(26, 'has been started your request', 1, 1, '2019-11-30 16:16:45', 3, 7),
(27, 'has been completed your request', 1, 1, '2019-11-30 16:16:53', 4, 7),
(28, 'you have a new booking request :', 1, 1, '2019-11-30 16:19:17', 3, 8),
(29, 'has been accepted your request', 1, 1, '2019-11-30 16:19:35', 1, 8),
(30, 'has been started your request', 1, 1, '2019-11-30 16:20:11', 3, 8),
(31, 'you have a new booking request :', 1, 1, '2019-11-30 16:56:23', 3, 9),
(32, 'has been accepted your request', 1, 1, '2019-11-30 16:56:40', 1, 9),
(33, 'has been started your request', 1, 1, '2019-11-30 16:57:28', 3, 9),
(34, 'has been completed your request', 1, 3, '2019-11-30 16:57:43', 4, 6),
(35, 'you have a new booking request :', 5, 1, '2019-11-30 21:12:34', 3, 10),
(36, 'you have a new booking request :', 5, 6, '2019-12-01 18:33:23', 3, 11),
(37, 'has been accepted your request', 6, 5, '2019-12-01 18:35:09', 1, 11),
(38, 'has been rejected your request', 1, 5, '2019-12-01 18:35:16', 2, 10),
(39, 'has been started your request', 6, 5, '2019-12-01 18:53:41', 3, 11),
(40, 'has been completed your request', 6, 5, '2019-12-01 18:54:54', 4, 11),
(41, 'you have a new booking request :', 5, 6, '2019-12-01 18:56:11', 3, 12),
(42, 'has been accepted your request', 6, 5, '2019-12-01 18:56:33', 1, 12),
(43, 'has been rejected your request', 6, 5, '2019-12-02 13:38:18', 2, 12),
(44, 'you have a new booking request :', 5, 6, '2019-12-02 13:39:26', 3, 13),
(45, 'has been accepted your request', 6, 5, '2019-12-02 13:39:43', 1, 13),
(46, 'has been rejected your request', 6, 5, '2019-12-02 13:41:51', 2, 13),
(47, 'you have a new booking request :', 5, 6, '2019-12-02 13:42:49', 3, 14),
(48, 'has been accepted your request', 6, 5, '2019-12-02 13:43:10', 1, 14),
(49, 'has been online now', 6, 5, '2019-12-02 13:43:39', 4, 0),
(50, 'has been started your request', 6, 5, '2019-12-02 13:45:24', 3, 14),
(51, 'has been completed your request', 6, 5, '2019-12-02 13:45:35', 4, 14),
(52, 'has been online now', 6, 5, '2019-12-02 13:45:57', 4, 0),
(53, 'has been online now', 6, 5, '2019-12-03 03:17:25', 4, 0),
(54, 'you have a new booking request :', 5, 6, '2019-12-03 03:18:57', 3, 15),
(55, 'has been accepted your request', 6, 5, '2019-12-03 03:19:18', 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `payment_escort`
--

CREATE TABLE `payment_escort` (
  `payment_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL,
  `amount` double(26,2) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `sub_duration` int(11) NOT NULL,
  `sub_duration_type` varchar(255) NOT NULL,
  `sub_price` double(26,2) NOT NULL,
  `pay_status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_escort`
--

INSERT INTO `payment_escort` (`payment_id`, `escort_id`, `amount`, `plan_id`, `sub_name`, `sub_duration`, `sub_duration_type`, `sub_price`, `pay_status`, `created_at`) VALUES
(1, 1, 24.99, 2, '1 week', 1, 'week', 24.99, 'paid', '2019-11-26 17:21:22'),
(2, 3, 24.99, 2, '1 week', 1, 'week', 24.99, 'paid', '2019-11-27 13:53:20'),
(3, 3, 39.99, 3, '1 month', 1, 'month', 39.99, 'paid', '2019-11-27 13:54:16'),
(4, 3, 24.99, 2, '1 week', 1, 'week', 24.99, 'paid', '2019-12-02 13:24:51'),
(5, 6, 149.99, 4, '1 year', 1, 'year', 149.99, 'paid', '2019-12-02 14:56:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_user`
--

CREATE TABLE `payment_user` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(26,2) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `sub_duration` int(11) NOT NULL,
  `sub_duration_type` varchar(255) NOT NULL,
  `sub_price` double(26,2) NOT NULL,
  `pay_status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_user`
--

INSERT INTO `payment_user` (`payment_id`, `user_id`, `amount`, `plan_id`, `sub_name`, `sub_duration`, `sub_duration_type`, `sub_price`, `pay_status`, `created_at`) VALUES
(1, 1, 24.99, 2, '1 week', 1, 'week', 24.99, 'paid', '2019-11-26 18:39:21'),
(2, 1, 39.99, 3, '1 month', 1, 'month', 39.99, 'paid', '2019-11-26 18:42:05'),
(3, 2, 149.99, 4, '1 year', 1, 'year', 149.99, 'paid', '2019-11-28 12:06:27'),
(4, 2, 149.99, 4, '1 year', 1, 'year', 149.99, 'paid', '2019-11-28 12:06:32'),
(5, 2, 39.99, 3, '1 month', 1, 'month', 39.99, 'paid', '2019-11-28 12:06:42'),
(6, 2, 39.99, 3, '1 month', 1, 'month', 39.99, 'paid', '2019-11-28 12:06:58'),
(7, 2, 149.99, 4, '1 year', 1, 'year', 149.99, 'paid', '2019-11-28 12:07:33'),
(8, 5, 14.99, 1, '4 days', 3, 'day', 14.99, 'paid', '2019-12-01 19:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy_tbl`
--

CREATE TABLE `privacy_policy_tbl` (
  `id` int(11) NOT NULL,
  `info` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privacy_policy_tbl`
--

INSERT INTO `privacy_policy_tbl` (`id`, `info`) VALUES
(1, '<p>This Privacy Policy is as updated at DATE OF LAST UPDATE</p>\r\n\r\n<p>SeductX is part of the SeductX Group which includes SeductX International and</p>\r\n\r\n<p>SeductX Direct. This privacy policy will explain how our organization uses the</p>\r\n\r\n<p>personal data we collect from you when you use our website. The Terms of SeductX are</p>\r\n\r\n<p>governed by the laws of the Netherlands. Any disputes arising from or in relation to the use of the</p>\r\n\r\n<p>Website or the Terms shall be subject to the jurisdiction of the court in Amsterdam, the</p>\r\n\r\n<p>Netherlands.</p>\r\n\r\n<p>By using the SeductX website(s), you are consenting to SeductX collecting, using and disclosing</p>\r\n\r\n<p>your personal information. This information is collected from you for the purposes of:</p>\r\n\r\n<p>providing you with our services; identifying you; managing and administering our services; and</p>\r\n\r\n<p>protecting against fraud. The information SeductX may collect may include your name, address,</p>\r\n\r\n<p>date of birth, email address, location and such other information that is considered reasonably</p>\r\n\r\n<p>necessary. Where possible, SeductX will collect the personal information directly from you. In</p>\r\n\r\n<p>some circumstances, however, SeductX may need to collect this information from a third party.</p>\r\n\r\n<p>If you do not provide some or all of the information requested, SeductX may be unable to provide</p>\r\n\r\n<p>you with the requested products and services.</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>Topics:</strong></p>\r\n\r\n<p>● What data do we collect?</p>\r\n\r\n<p>● How do we collect your data?</p>\r\n\r\n<p>● How will we use your data?</p>\r\n\r\n<p>● How do we store your data?</p>\r\n\r\n<p>● Marketing</p>\r\n\r\n<p>● What are your data protection rights?</p>\r\n\r\n<p>● What are cookies?</p>\r\n\r\n<p>● How do we use cookies?</p>\r\n\r\n<p>● What types of cookies do we use?</p>\r\n\r\n<p>● How to manage your cookies</p>\r\n\r\n<p>● Privacy policies of other websites</p>\r\n\r\n<p>● Changes to our privacy policy</p>\r\n\r\n<p>● How to contact us</p>\r\n\r\n<p>● How to contact the appropriate authorities</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>What data do we collect?</strong></p>\r\n\r\n<p>SeductX collects the following data:</p>\r\n\r\n<p>● Personal identification information (Name, email address, phone number, etc.)</p>\r\n\r\n<p>● [Add any other data SeductX collects]</p>\r\n\r\n<p><strong>How do we collect your data?</strong></p>\r\n\r\n<p>You directly provide SeductX with most of the data we collect. We collect data and</p>\r\n\r\n<p>process data when you:</p>\r\n\r\n<p>● Register online or place an order for any of our products or services.</p>\r\n\r\n<p>● Voluntarily complete a customer survey or provide feedback on any of our</p>\r\n\r\n<p>message boards or via email.</p>\r\n\r\n<p>● Use or view our website via your browser&rsquo;s cookies.</p>\r\n\r\n<p>● [Add any other ways SeductX collects data]</p>\r\n\r\n<p>SeductX may also receive your data indirectly from the following sources:</p>\r\n\r\n<p>● Google Analytics</p>\r\n\r\n<p>● Payment processor</p>\r\n\r\n<p><strong>How will we use your data?</strong></p>\r\n\r\n<p>SeductX collects your data so that we can:</p>\r\n\r\n<p>● Process your order and manage your account.</p>\r\n\r\n<p>● Email you with special offers on other products and services we think you</p>\r\n\r\n<p>might like.</p>\r\n\r\n<p>● [Add how else SeductX uses data]</p>\r\n\r\n<p>If you agree, SeductX will share your data with our partner companies so that they</p>\r\n\r\n<p>may offer you their products and services.</p>\r\n\r\n<p>● [List organizations that will receive data]</p>\r\n\r\n<p>When SeductX processes your order, it may send your data to, and also use the</p>\r\n\r\n<p>resulting information from, credit reference agencies to prevent fraudulent</p>\r\n\r\n<p>purchases.</p>\r\n\r\n<p><strong>How do we store your data?</strong></p>\r\n\r\n<p>SeductX securely stores your data at [enter the location and describe security</p>\r\n\r\n<p>precautions taken].</p>\r\n\r\n<p>SeductX will keep your [enter type of data] for [enter time period]. Once this time</p>\r\n\r\n<p>period has expired, we will delete your data by [enter how you delete users&rsquo; data].</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Marketing</strong></p>\r\n\r\n<p>SeductX would like to send you information about products and services of ours that</p>\r\n\r\n<p>we think you might like, as well as those of our partner companies.</p>\r\n\r\n<p>● [List organizations that will receive data]</p>\r\n\r\n<p>If you have agreed to receive marketing, you may always opt out at a later date.</p>\r\n\r\n<p>You have the right at any time to stop SeductX from contacting you for marketing</p>\r\n\r\n<p>purposes or giving your data to other members of the SeductX Group.</p>\r\n\r\n<p>If you no longer wish to be contacted for marketing purposes, please click here.</p>\r\n\r\n<p><strong>What are your data protection rights?</strong></p>\r\n\r\n<p>SeductX would like to make sure you are fully aware of all of your data protection</p>\r\n\r\n<p>rights. Every user is entitled to the following:</p>\r\n\r\n<p>The right to access &ndash; You have the right to request SeductX for copies of your</p>\r\n\r\n<p>personal data. We may charge you a small fee for this service.</p>\r\n\r\n<p>The right to rectification &ndash; You have the right to request that SeductX correct any</p>\r\n\r\n<p>information you believe is inaccurate. You also have the right to request SeductX to</p>\r\n\r\n<p>complete the information you believe is incomplete.</p>\r\n\r\n<p>The right to erasure &ndash; You have the right to request that SeductX erase your</p>\r\n\r\n<p>personal data, under certain conditions.</p>\r\n\r\n<p>The right to restrict processing &ndash; You have the right to request that SeductX</p>\r\n\r\n<p>restrict the processing of your personal data, under certain conditions.</p>\r\n\r\n<p>The right to object to processing &ndash; You have the right to object to SeductX&rsquo;s</p>\r\n\r\n<p>processing of your personal data, under certain conditions.</p>\r\n\r\n<p>The right to data portability &ndash; You have the right to request that SeductX transfer</p>\r\n\r\n<p>the data that we have collected to another organization, or directly to you, under</p>\r\n\r\n<p>certain conditions.</p>\r\n\r\n<p>If you make a request, we have one month to respond to you. If you would like to</p>\r\n\r\n<p>exercise any of these rights, please contact us at our email:</p>\r\n\r\n<p>Call us at:</p>\r\n\r\n<p>Or write to us:</p>\r\n\r\n<p>Cookies</p>\r\n\r\n<p>Cookies are text files placed on your computer to collect standard Internet log</p>\r\n\r\n<p>information and visitor behavior information. When you visit our websites, we may</p>\r\n\r\n<p>collect information from you automatically through cookies or similar technology</p>\r\n\r\n<p>For further information, visit allaboutcookies.org.</p>\r\n\r\n<p><strong>How do we use cookies?</strong></p>\r\n\r\n<p>SeductX uses cookies in a range of ways to improve your experience on our</p>\r\n\r\n<p>website, including:</p>\r\n\r\n<p>● Keeping you signed in</p>\r\n\r\n<p>● Understanding how you use our website</p>\r\n\r\n<p>● [Add any uses SeductX has for cookies]</p>\r\n\r\n<p>What types of cookies do we use?</p>\r\n\r\n<p>There are a number of different types of cookies, however, our website uses:</p>\r\n\r\n<p>● Functionality &ndash; SeductX uses these cookies so that we recognize you on our</p>\r\n\r\n<p>website and remember your previously selected preferences. These could</p>\r\n\r\n<p>include what language you prefer and location you are in. A mix of first-party</p>\r\n\r\n<p>and third-party cookies are used.</p>\r\n\r\n<p>● Advertising &ndash; SeductX uses these cookies to collect information about your</p>\r\n\r\n<p>visit to our website, the content you viewed, the links you followed and</p>\r\n\r\n<p>information about your browser, device, and your IP address. SeductX</p>\r\n\r\n<p>sometimes shares some limited aspects of this data with third parties for</p>\r\n\r\n<p>advertising purposes. We may also share online data collected through</p>\r\n\r\n<p>cookies with our advertising partners. This means that when you visit another</p>\r\n\r\n<p>website, you may be shown advertising based on your browsing patterns on</p>\r\n\r\n<p>our website.</p>\r\n\r\n<p>● [Add any other types of cookies SeductX uses]</p>\r\n\r\n<p><strong>How to manage cookies</strong></p>\r\n\r\n<p>You can set your browser not to accept cookies, and the above website tells you</p>\r\n\r\n<p>how to remove cookies from your browser. However, in a few cases, some of our</p>\r\n\r\n<p>website features may not function as a result.</p>\r\n\r\n<p><strong>Privacy policies of other websites</strong></p>\r\n\r\n<p>The SeductX website contains links to other websites. Our privacy policy applies</p>\r\n\r\n<p>only to our website, so if you click on a link to another website, you should read their</p>\r\n\r\n<p>privacy policy.</p>\r\n\r\n<p><strong>Changes to our privacy policy</strong></p>\r\n\r\n<p>SeductX keeps its privacy policy under regular review and places any updates on</p>\r\n\r\n<p>this web page. This privacy policy was last updated on 4 August 2019.</p>\r\n\r\n<p><strong>How to contact us</strong></p>\r\n\r\n<p>If you have any questions about SeductX&rsquo;s privacy policy, the data we hold on you,</p>\r\n\r\n<p>or you would like to exercise one of your data protection rights, please do not</p>\r\n\r\n<p>hesitate to contact us.</p>\r\n\r\n<p>Email us at:</p>\r\n\r\n<p>Call us:</p>\r\n\r\n<p>Or write to us at:</p>\r\n\r\n<p><strong>How to contact the appropriate authority</strong></p>\r\n\r\n<p>Should you wish to report a complaint or if you feel that SeductX has not addressed</p>\r\n\r\n<p>your concern in a satisfactory manner, you may contact the Information</p>\r\n\r\n<p>Commissioner&rsquo;s Office.</p>\r\n\r\n<p>Email:</p>\r\n\r\n<p>Address</p>\r\n\r\n<h1>&nbsp;</h1>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `rating_escort`
--

CREATE TABLE `rating_escort` (
  `rating_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating_escort`
--

INSERT INTO `rating_escort` (`rating_id`, `escort_id`, `user_id`, `rating`, `created_at`) VALUES
(1, 1, 1, 4, '2019-11-26 17:38:09'),
(2, 6, 5, 5, '2019-12-01 19:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `rating_user`
--

CREATE TABLE `rating_user` (
  `rating_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating_user`
--

INSERT INTO `rating_user` (`rating_id`, `escort_id`, `user_id`, `rating`, `created_at`) VALUES
(1, 1, 1, 3, '2019-11-26 17:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `services_id` int(11) NOT NULL,
  `title` varchar(555) NOT NULL,
  `description` text NOT NULL,
  `service_type` int(11) NOT NULL DEFAULT '1' COMMENT '1 - normal service , 2 - additional services',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`services_id`, `title`, `description`, `service_type`, `status`) VALUES
(1, 'BBBJ', 'Bare back blow job', 1, 1),
(2, 'CIM', 'Cum in mouth', 1, 1),
(3, 'COF', 'Cum on body', 1, 1),
(4, 'DATY', 'Receives oral sex', 1, 1),
(5, 'DFK', 'Deep french kissing', 1, 1),
(6, 'Full Service', 'Full protected sex', 1, 1),
(7, 'Guide', 'Travel guide', 1, 1),
(8, 'Lesbian', 'Lesbian', 1, 1),
(9, 'Massage', 'Massage', 1, 1),
(10, 'Rimming', 'Gives rimming', 1, 1),
(11, 'A-Level', 'Receives anal', 2, 1),
(12, 'Couples', 'Has sex with couples', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_price`
--

CREATE TABLE `service_price` (
  `service_price_id` int(11) NOT NULL,
  `info` varchar(255) NOT NULL,
  `services_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_price`
--

INSERT INTO `service_price` (`service_price_id`, `info`, `services_id`) VALUES
(1, 'Free', 11),
(2, '500 THB', 11),
(3, '1,000 THB', 11),
(4, '1,500 THB', 11),
(5, '2,000 THB', 11),
(6, '2,500 THB', 11),
(7, '3,000 THB', 11),
(8, '3,500 THB', 11),
(9, '4,000 THB', 11),
(10, '4,500 THB', 11),
(11, 'Free', 12),
(12, 'Double', 12);

-- --------------------------------------------------------

--
-- Table structure for table `shots`
--

CREATE TABLE `shots` (
  `shot_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hour_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shots`
--

INSERT INTO `shots` (`shot_id`, `name`, `hour_id`) VALUES
(1, 'Unlimited', 1),
(2, '1 shot', 1),
(3, '2 shots', 1),
(4, 'Unlimited', 2),
(5, '1 shot', 2),
(6, '2 shots', 2),
(7, '3 shots', 2),
(8, 'Unlimited', 3),
(9, '1 shot', 2),
(10, '2 shots', 3),
(11, '3 shots', 3),
(12, 'Unlimited', 4),
(13, '1 shot', 4),
(14, '2 shots', 4),
(15, '3 shots', 4),
(16, '4 shots', 4),
(17, 'Unlimited', 5),
(18, '1 shot', 5),
(19, '2 shots', 5),
(20, '3 shots', 5),
(21, '4 shots', 5),
(22, '5 shots', 5),
(23, 'Unlimited', 6),
(24, '1 shot', 6),
(25, '2 shots', 6),
(26, '3 shots', 6),
(27, '4 shots', 6),
(28, '5 shots', 6),
(29, 'Unlimited', 6),
(30, '1 shot', 6),
(31, '2 shots', 6),
(32, '3 shots', 6),
(33, '4 shots', 6),
(34, '5 shots', 6),
(35, '6 shots', 6),
(36, 'Unlimited', 7),
(37, '1 shot', 7),
(38, '2 shots', 7),
(39, '3 shots', 7),
(40, '4 shots', 7),
(41, '5 shots', 7),
(42, '6 shots', 7),
(43, 'Unlimited', 8),
(44, '1 shot', 8),
(45, '2 shots', 8),
(46, '3 shots', 8),
(47, '4 shots', 8),
(48, '5 shots', 8),
(49, '6 shots', 8),
(50, 'Unlimited', 9),
(51, '1 shot', 9),
(52, '2 shots', 9),
(53, '3 shots', 9),
(54, '4 shots', 9),
(55, '5 shots', 9),
(56, '6 shots', 9),
(57, 'Unlimited', 10),
(58, '1 shot', 10),
(59, '2 shots', 10),
(60, '3 shots', 10),
(61, '4 shots', 10),
(62, '5 shots', 10),
(63, '6 shots', 10);

-- --------------------------------------------------------

--
-- Table structure for table `shots_price`
--

CREATE TABLE `shots_price` (
  `shots_price_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `hour_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shots_price`
--

INSERT INTO `shots_price` (`shots_price_id`, `name`, `amount`, `hour_id`) VALUES
(1, '1,000 THB', 1000, 1),
(2, '1,500 THB', 1500, 1),
(3, '2,000 THB', 2000, 1),
(4, '2,500 THB', 2500, 1),
(5, '3,000 THB', 3000, 1),
(6, '3,500 THB', 3500, 1),
(7, '4,000 THB', 4000, 1),
(8, '4,500 THB', 4500, 1),
(9, '1,000 THB', 1000, 2),
(10, '1,500 THB', 1500, 2),
(11, '2,000 THB', 2000, 2),
(12, '2,500 THB', 2500, 2),
(13, '3,000 THB', 3000, 2),
(14, '3,500 THB', 3500, 2),
(15, '4,000 THB', 4000, 2),
(16, '4,500 THB', 4500, 2),
(17, '5,000 THB', 5000, 2),
(18, '1,000 THB', 1000, 3),
(19, '1,500 THB', 10500, 3),
(20, '3,000 THB', 3000, 3),
(21, '3,500 THB', 3500, 3),
(22, '3,000 THB', 3000, 3),
(23, '3,500 THB', 3500, 3),
(24, '4,000 THB', 4000, 3),
(25, '4,500 THB', 4500, 3),
(26, '5,000 THB', 5000, 3),
(27, '1,000 THB', 1000, 4),
(28, '1,500 THB', 1500, 4),
(29, '4,000 THB', 4000, 4),
(30, '4,500 THB', 4500, 4),
(31, '4,000 THB', 4000, 4),
(32, '4,500 THB', 4500, 4),
(33, '4,000 THB', 4000, 4),
(34, '4,500 THB', 4500, 4),
(35, '5,000 THB', 5000, 4),
(36, '5,500 THB', 5500, 4),
(37, '6,000 THB', 6000, 4),
(38, '1,000 THB', 1000, 5),
(39, '1,500 THB', 1500, 5),
(40, '2,000 THB', 2000, 5),
(41, '2,500 THB', 2500, 5),
(42, '3,000 THB', 3000, 5),
(43, '3,500 THB', 3500, 5),
(44, '4,000 THB', 4000, 5),
(45, '4,500 THB', 4500, 5),
(46, '5,000 THB', 5000, 5),
(47, '5,500 THB', 5500, 5),
(48, '6,000 THB', 6000, 4),
(49, '1,000 THB', 1000, 6),
(50, '1,500 THB', 1500, 6),
(51, '2,000 THB', 2000, 6),
(52, '2,500 THB', 2500, 6),
(53, '3,000 THB', 3000, 6),
(54, '3,500 THB', 3500, 6),
(55, '4,000 THB', 4000, 6),
(56, '4,500 THB', 4500, 6),
(57, '5,000 THB', 5000, 6),
(58, '5,500 THB', 5500, 6),
(59, '6,000 THB', 6000, 6),
(60, '6,500 THB', 6500, 6),
(61, '1,000 THB', 1000, 7),
(62, '1,500 THB', 1500, 7),
(63, '2,000 THB', 2000, 7),
(64, '2,500 THB', 2500, 7),
(65, '3,000 THB', 3000, 7),
(66, '3,500 THB', 3500, 7),
(67, '4,000 THB', 4000, 7),
(68, '4,500 THB', 4500, 7),
(69, '5,000 THB', 5000, 7),
(70, '5,500 THB', 5500, 7),
(71, '6,000 THB', 6000, 7),
(72, '1,000 THB', 1000, 8),
(73, '1,500 THB', 1500, 8),
(74, '2,000 THB', 2000, 8),
(75, '2,500 THB', 2500, 8),
(76, '3,000 THB', 3000, 8),
(77, '3,500 THB', 3500, 8),
(78, '4,000 THB', 4000, 8),
(79, '4,500 THB', 4500, 8),
(80, '5,000 THB', 5000, 8),
(81, '5,500 THB', 5500, 8),
(82, '6,000 THB', 6000, 8),
(83, '1,000 THB', 1000, 9),
(84, '1,500 THB', 1500, 9),
(85, '2,000 THB', 2000, 9),
(86, '2,500 THB', 2500, 9),
(87, '3,000 THB', 3000, 9),
(88, '3,500 THB', 3500, 9),
(89, '4,000 THB', 4000, 9),
(90, '4,500 THB', 4500, 9),
(91, '5,000 THB', 5000, 9),
(92, '5,500 THB', 5500, 9),
(93, '6,000 THB', 6000, 9),
(94, '1,000 THB', 1000, 10),
(95, '1,500 THB', 1500, 10),
(96, '2,000 THB', 2000, 10),
(97, '2,500 THB', 2500, 10),
(98, '3,000 THB', 3000, 10),
(99, '3,500 THB', 3500, 10),
(100, '4,000 THB', 4000, 10),
(101, '4,500 THB', 4500, 10),
(102, '5,000 THB', 5000, 10),
(103, '5,500 THB', 5500, 10),
(104, '6,000 THB', 6000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `status`) VALUES
(1, 'Andaman and Nicobar Islands', 101, 1),
(2, 'Andhra Pradesh', 101, 1),
(3, 'Arunachal Pradesh', 101, 1),
(4, 'Assam', 101, 1),
(5, 'Bihar', 101, 1),
(6, 'Chandigarh', 101, 1),
(7, 'Chhattisgarh', 101, 1),
(8, 'Dadra and Nagar Haveli', 101, 1),
(9, 'Daman and Diu', 101, 1),
(10, 'Delhi', 101, 1),
(11, 'Goa', 101, 1),
(12, 'Gujarat', 101, 1),
(13, 'Haryana', 101, 1),
(14, 'Himachal Pradesh', 101, 1),
(15, 'Jammu and Kashmir', 101, 1),
(16, 'Jharkhand', 101, 1),
(17, 'Karnataka', 101, 1),
(18, 'Kenmore', 101, 1),
(19, 'Kerala', 101, 1),
(20, 'Lakshadweep', 101, 1),
(21, 'Madhya Pradesh', 101, 1),
(22, 'Maharashtra', 101, 1),
(23, 'Manipur', 101, 1),
(24, 'Meghalaya', 101, 1),
(25, 'Mizoram', 101, 1),
(26, 'Nagaland', 101, 1),
(27, 'Narora', 101, 1),
(28, 'Natwar', 101, 1),
(29, 'Odisha', 101, 1),
(30, 'Paschim Medinipur', 101, 1),
(31, 'Pondicherry', 101, 1),
(32, 'Punjab', 101, 1),
(33, 'Rajasthan', 101, 1),
(34, 'Sikkim', 101, 1),
(35, 'Tamil Nadu', 101, 1),
(36, 'Telangana', 101, 1),
(37, 'Tripura', 101, 1),
(38, 'Uttar Pradesh', 101, 1),
(39, 'Uttarakhand', 101, 1),
(40, 'Vaishali', 101, 1),
(41, 'West Bengal', 101, 1),
(42, 'Badakhshan', 1, 1),
(43, 'Badgis', 1, 1),
(44, 'Baglan', 1, 1),
(45, 'Balkh', 1, 1),
(46, 'Bamiyan', 1, 1),
(47, 'Farah', 1, 1),
(48, 'Faryab', 1, 1),
(49, 'Gawr', 1, 1),
(50, 'Gazni', 1, 1),
(51, 'Herat', 1, 1),
(52, 'Hilmand', 1, 1),
(53, 'Jawzjan', 1, 1),
(54, 'Kabul', 1, 1),
(55, 'Kapisa', 1, 1),
(56, 'Khawst', 1, 1),
(57, 'Kunar', 1, 1),
(58, 'Lagman', 1, 1),
(59, 'Lawghar', 1, 1),
(60, 'Nangarhar', 1, 1),
(61, 'Nimruz', 1, 1),
(62, 'Nuristan', 1, 1),
(63, 'Paktika', 1, 1),
(64, 'Paktiya', 1, 1),
(65, 'Parwan', 1, 1),
(66, 'Qandahar', 1, 1),
(67, 'Qunduz', 1, 1),
(68, 'Samangan', 1, 1),
(69, 'Sar-e Pul', 1, 1),
(70, 'Takhar', 1, 1),
(71, 'Uruzgan', 1, 1),
(72, 'Wardag', 1, 1),
(73, 'Zabul', 1, 1),
(74, 'Berat', 2, 1),
(75, 'Bulqize', 2, 1),
(76, 'Delvine', 2, 1),
(77, 'Devoll', 2, 1),
(78, 'Dibre', 2, 1),
(79, 'Durres', 2, 1),
(80, 'Elbasan', 2, 1),
(81, 'Fier', 2, 1),
(82, 'Gjirokaster', 2, 1),
(83, 'Gramsh', 2, 1),
(84, 'Has', 2, 1),
(85, 'Kavaje', 2, 1),
(86, 'Kolonje', 2, 1),
(87, 'Korce', 2, 1),
(88, 'Kruje', 2, 1),
(89, 'Kucove', 2, 1),
(90, 'Kukes', 2, 1),
(91, 'Kurbin', 2, 1),
(92, 'Lezhe', 2, 1),
(93, 'Librazhd', 2, 1),
(94, 'Lushnje', 2, 1),
(95, 'Mallakaster', 2, 1),
(96, 'Malsi e Madhe', 2, 1),
(97, 'Mat', 2, 1),
(98, 'Mirdite', 2, 1),
(99, 'Peqin', 2, 1),
(100, 'Permet', 2, 1),
(101, 'Pogradec', 2, 1),
(102, 'Puke', 2, 1),
(103, 'Sarande', 2, 1),
(104, 'Shkoder', 2, 1),
(105, 'Skrapar', 2, 1),
(106, 'Tepelene', 2, 1),
(107, 'Tirane', 2, 1),
(108, 'Tropoje', 2, 1),
(109, 'Vlore', 2, 1),
(110, '\'Ayn Daflah', 3, 1),
(111, '\'Ayn Tamushanat', 3, 1),
(112, 'Adrar', 3, 1),
(113, 'Algiers', 3, 1),
(114, 'Annabah', 3, 1),
(115, 'Bashshar', 3, 1),
(116, 'Batnah', 3, 1),
(117, 'Bijayah', 3, 1),
(118, 'Biskrah', 3, 1),
(119, 'Blidah', 3, 1),
(120, 'Buirah', 3, 1),
(121, 'Bumardas', 3, 1),
(122, 'Burj Bu Arririj', 3, 1),
(123, 'Ghalizan', 3, 1),
(124, 'Ghardayah', 3, 1),
(125, 'Ilizi', 3, 1),
(126, 'Jijili', 3, 1),
(127, 'Jilfah', 3, 1),
(128, 'Khanshalah', 3, 1),
(129, 'Masilah', 3, 1),
(130, 'Midyah', 3, 1),
(131, 'Milah', 3, 1),
(132, 'Muaskar', 3, 1),
(133, 'Mustaghanam', 3, 1),
(134, 'Naama', 3, 1),
(135, 'Oran', 3, 1),
(136, 'Ouargla', 3, 1),
(137, 'Qalmah', 3, 1),
(138, 'Qustantinah', 3, 1),
(139, 'Sakikdah', 3, 1),
(140, 'Satif', 3, 1),
(141, 'Sayda\'', 3, 1),
(142, 'Sidi ban-al-\'Abbas', 3, 1),
(143, 'Suq Ahras', 3, 1),
(144, 'Tamanghasat', 3, 1),
(145, 'Tibazah', 3, 1),
(146, 'Tibissah', 3, 1),
(147, 'Tilimsan', 3, 1),
(148, 'Tinduf', 3, 1),
(149, 'Tisamsilt', 3, 1),
(150, 'Tiyarat', 3, 1),
(151, 'Tizi Wazu', 3, 1),
(152, 'Umm-al-Bawaghi', 3, 1),
(153, 'Wahran', 3, 1),
(154, 'Warqla', 3, 1),
(155, 'Wilaya d Alger', 3, 1),
(156, 'Wilaya de Bejaia', 3, 1),
(157, 'Wilaya de Constantine', 3, 1),
(158, 'al-Aghwat', 3, 1),
(159, 'al-Bayadh', 3, 1),
(160, 'al-Jaza\'ir', 3, 1),
(161, 'al-Wad', 3, 1),
(162, 'ash-Shalif', 3, 1),
(163, 'at-Tarif', 3, 1),
(164, 'Eastern', 4, 1),
(165, 'Manu\'a', 4, 1),
(166, 'Swains Island', 4, 1),
(167, 'Western', 4, 1),
(168, 'Andorra la Vella', 5, 1),
(169, 'Canillo', 5, 1),
(170, 'Encamp', 5, 1),
(171, 'La Massana', 5, 1),
(172, 'Les Escaldes', 5, 1),
(173, 'Ordino', 5, 1),
(174, 'Sant Julia de Loria', 5, 1),
(175, 'Bengo', 6, 1),
(176, 'Benguela', 6, 1),
(177, 'Bie', 6, 1),
(178, 'Cabinda', 6, 1),
(179, 'Cunene', 6, 1),
(180, 'Huambo', 6, 1),
(181, 'Huila', 6, 1),
(182, 'Kuando-Kubango', 6, 1),
(183, 'Kwanza Norte', 6, 1),
(184, 'Kwanza Sul', 6, 1),
(185, 'Luanda', 6, 1),
(186, 'Lunda Norte', 6, 1),
(187, 'Lunda Sul', 6, 1),
(188, 'Malanje', 6, 1),
(189, 'Moxico', 6, 1),
(190, 'Namibe', 6, 1),
(191, 'Uige', 6, 1),
(192, 'Zaire', 6, 1),
(193, 'Other Provinces', 7, 1),
(194, 'Sector claimed by Argentina/Ch', 8, 1),
(195, 'Sector claimed by Argentina/UK', 8, 1),
(196, 'Sector claimed by Australia', 8, 1),
(197, 'Sector claimed by France', 8, 1),
(198, 'Sector claimed by New Zealand', 8, 1),
(199, 'Sector claimed by Norway', 8, 1),
(200, 'Unclaimed Sector', 8, 1),
(201, 'Barbuda', 9, 1),
(202, 'Saint George', 9, 1),
(203, 'Saint John', 9, 1),
(204, 'Saint Mary', 9, 1),
(205, 'Saint Paul', 9, 1),
(206, 'Saint Peter', 9, 1),
(207, 'Saint Philip', 9, 1),
(208, 'Buenos Aires', 10, 1),
(209, 'Catamarca', 10, 1),
(210, 'Chaco', 10, 1),
(211, 'Chubut', 10, 1),
(212, 'Cordoba', 10, 1),
(213, 'Corrientes', 10, 1),
(214, 'Distrito Federal', 10, 1),
(215, 'Entre Rios', 10, 1),
(216, 'Formosa', 10, 1),
(217, 'Jujuy', 10, 1),
(218, 'La Pampa', 10, 1),
(219, 'La Rioja', 10, 1),
(220, 'Mendoza', 10, 1),
(221, 'Misiones', 10, 1),
(222, 'Neuquen', 10, 1),
(223, 'Rio Negro', 10, 1),
(224, 'Salta', 10, 1),
(225, 'San Juan', 10, 1),
(226, 'San Luis', 10, 1),
(227, 'Santa Cruz', 10, 1),
(228, 'Santa Fe', 10, 1),
(229, 'Santiago del Estero', 10, 1),
(230, 'Tierra del Fuego', 10, 1),
(231, 'Tucuman', 10, 1),
(232, 'Aragatsotn', 11, 1),
(233, 'Ararat', 11, 1),
(234, 'Armavir', 11, 1),
(235, 'Gegharkunik', 11, 1),
(236, 'Kotaik', 11, 1),
(237, 'Lori', 11, 1),
(238, 'Shirak', 11, 1),
(239, 'Stepanakert', 11, 1),
(240, 'Syunik', 11, 1),
(241, 'Tavush', 11, 1),
(242, 'Vayots Dzor', 11, 1),
(243, 'Yerevan', 11, 1),
(244, 'Aruba', 12, 1),
(245, 'Auckland', 13, 1),
(246, 'Australian Capital Territory', 13, 1),
(247, 'Balgowlah', 13, 1),
(248, 'Balmain', 13, 1),
(249, 'Bankstown', 13, 1),
(250, 'Baulkham Hills', 13, 1),
(251, 'Bonnet Bay', 13, 1),
(252, 'Camberwell', 13, 1),
(253, 'Carole Park', 13, 1),
(254, 'Castle Hill', 13, 1),
(255, 'Caulfield', 13, 1),
(256, 'Chatswood', 13, 1),
(257, 'Cheltenham', 13, 1),
(258, 'Cherrybrook', 13, 1),
(259, 'Clayton', 13, 1),
(260, 'Collingwood', 13, 1),
(261, 'Frenchs Forest', 13, 1),
(262, 'Hawthorn', 13, 1),
(263, 'Jannnali', 13, 1),
(264, 'Knoxfield', 13, 1),
(265, 'Melbourne', 13, 1),
(266, 'New South Wales', 13, 1),
(267, 'Northern Territory', 13, 1),
(268, 'Perth', 13, 1),
(269, 'Queensland', 13, 1),
(270, 'South Australia', 13, 1),
(271, 'Tasmania', 13, 1),
(272, 'Templestowe', 13, 1),
(273, 'Victoria', 13, 1),
(274, 'Werribee south', 13, 1),
(275, 'Western Australia', 13, 1),
(276, 'Wheeler', 13, 1),
(277, 'Bundesland Salzburg', 14, 1),
(278, 'Bundesland Steiermark', 14, 1),
(279, 'Bundesland Tirol', 14, 1),
(280, 'Burgenland', 14, 1),
(281, 'Carinthia', 14, 1),
(282, 'Karnten', 14, 1),
(283, 'Liezen', 14, 1),
(284, 'Lower Austria', 14, 1),
(285, 'Niederosterreich', 14, 1),
(286, 'Oberosterreich', 14, 1),
(287, 'Salzburg', 14, 1),
(288, 'Schleswig-Holstein', 14, 1),
(289, 'Steiermark', 14, 1),
(290, 'Styria', 14, 1),
(291, 'Tirol', 14, 1),
(292, 'Upper Austria', 14, 1),
(293, 'Vorarlberg', 14, 1),
(294, 'Wien', 14, 1),
(295, 'Abseron', 15, 1),
(296, 'Baki Sahari', 15, 1),
(297, 'Ganca', 15, 1),
(298, 'Ganja', 15, 1),
(299, 'Kalbacar', 15, 1),
(300, 'Lankaran', 15, 1),
(301, 'Mil-Qarabax', 15, 1),
(302, 'Mugan-Salyan', 15, 1),
(303, 'Nagorni-Qarabax', 15, 1),
(304, 'Naxcivan', 15, 1),
(305, 'Priaraks', 15, 1),
(306, 'Qazax', 15, 1),
(307, 'Saki', 15, 1),
(308, 'Sirvan', 15, 1),
(309, 'Xacmaz', 15, 1),
(310, 'Abaco', 16, 1),
(311, 'Acklins Island', 16, 1),
(312, 'Andros', 16, 1),
(313, 'Berry Islands', 16, 1),
(314, 'Biminis', 16, 1),
(315, 'Cat Island', 16, 1),
(316, 'Crooked Island', 16, 1),
(317, 'Eleuthera', 16, 1),
(318, 'Exuma and Cays', 16, 1),
(319, 'Grand Bahama', 16, 1),
(320, 'Inagua Islands', 16, 1),
(321, 'Long Island', 16, 1),
(322, 'Mayaguana', 16, 1),
(323, 'New Providence', 16, 1),
(324, 'Ragged Island', 16, 1),
(325, 'Rum Cay', 16, 1),
(326, 'San Salvador', 16, 1),
(327, '\'Isa', 17, 1),
(328, 'Badiyah', 17, 1),
(329, 'Hidd', 17, 1),
(330, 'Jidd Hafs', 17, 1),
(331, 'Mahama', 17, 1),
(332, 'Manama', 17, 1),
(333, 'Sitrah', 17, 1),
(334, 'al-Manamah', 17, 1),
(335, 'al-Muharraq', 17, 1),
(336, 'ar-Rifa\'a', 17, 1),
(337, 'Bagar Hat', 18, 1),
(338, 'Bandarban', 18, 1),
(339, 'Barguna', 18, 1),
(340, 'Barisal', 18, 1),
(341, 'Bhola', 18, 1),
(342, 'Bogora', 18, 1),
(343, 'Brahman Bariya', 18, 1),
(344, 'Chandpur', 18, 1),
(345, 'Chattagam', 18, 1),
(346, 'Chittagong Division', 18, 1),
(347, 'Chuadanga', 18, 1),
(348, 'Dhaka', 18, 1),
(349, 'Dinajpur', 18, 1),
(350, 'Faridpur', 18, 1),
(351, 'Feni', 18, 1),
(352, 'Gaybanda', 18, 1),
(353, 'Gazipur', 18, 1),
(354, 'Gopalganj', 18, 1),
(355, 'Habiganj', 18, 1),
(356, 'Jaipur Hat', 18, 1),
(357, 'Jamalpur', 18, 1),
(358, 'Jessor', 18, 1),
(359, 'Jhalakati', 18, 1),
(360, 'Jhanaydah', 18, 1),
(361, 'Khagrachhari', 18, 1),
(362, 'Khulna', 18, 1),
(363, 'Kishorganj', 18, 1),
(364, 'Koks Bazar', 18, 1),
(365, 'Komilla', 18, 1),
(366, 'Kurigram', 18, 1),
(367, 'Kushtiya', 18, 1),
(368, 'Lakshmipur', 18, 1),
(369, 'Lalmanir Hat', 18, 1),
(370, 'Madaripur', 18, 1),
(371, 'Magura', 18, 1),
(372, 'Maimansingh', 18, 1),
(373, 'Manikganj', 18, 1),
(374, 'Maulvi Bazar', 18, 1),
(375, 'Meherpur', 18, 1),
(376, 'Munshiganj', 18, 1),
(377, 'Naral', 18, 1),
(378, 'Narayanganj', 18, 1),
(379, 'Narsingdi', 18, 1),
(380, 'Nator', 18, 1),
(381, 'Naugaon', 18, 1),
(382, 'Nawabganj', 18, 1),
(383, 'Netrakona', 18, 1),
(384, 'Nilphamari', 18, 1),
(385, 'Noakhali', 18, 1),
(386, 'Pabna', 18, 1),
(387, 'Panchagarh', 18, 1),
(388, 'Patuakhali', 18, 1),
(389, 'Pirojpur', 18, 1),
(390, 'Rajbari', 18, 1),
(391, 'Rajshahi', 18, 1),
(392, 'Rangamati', 18, 1),
(393, 'Rangpur', 18, 1),
(394, 'Satkhira', 18, 1),
(395, 'Shariatpur', 18, 1),
(396, 'Sherpur', 18, 1),
(397, 'Silhat', 18, 1),
(398, 'Sirajganj', 18, 1),
(399, 'Sunamganj', 18, 1),
(400, 'Tangayal', 18, 1),
(401, 'Thakurgaon', 18, 1),
(402, 'Christ Church', 19, 1),
(403, 'Saint Andrew', 19, 1),
(404, 'Saint George', 19, 1),
(405, 'Saint James', 19, 1),
(406, 'Saint John', 19, 1),
(407, 'Saint Joseph', 19, 1),
(408, 'Saint Lucy', 19, 1),
(409, 'Saint Michael', 19, 1),
(410, 'Saint Peter', 19, 1),
(411, 'Saint Philip', 19, 1),
(412, 'Saint Thomas', 19, 1),
(413, 'Brest', 20, 1),
(414, 'Homjel\'', 20, 1),
(415, 'Hrodna', 20, 1),
(416, 'Mahiljow', 20, 1),
(417, 'Mahilyowskaya Voblasts', 20, 1),
(418, 'Minsk', 20, 1),
(419, 'Minskaja Voblasts\'', 20, 1),
(420, 'Petrik', 20, 1),
(421, 'Vicebsk', 20, 1),
(422, 'Antwerpen', 21, 1),
(423, 'Berchem', 21, 1),
(424, 'Brabant', 21, 1),
(425, 'Brabant Wallon', 21, 1),
(426, 'Brussel', 21, 1),
(427, 'East Flanders', 21, 1),
(428, 'Hainaut', 21, 1),
(429, 'Liege', 21, 1),
(430, 'Limburg', 21, 1),
(431, 'Luxembourg', 21, 1),
(432, 'Namur', 21, 1),
(433, 'Ontario', 21, 1),
(434, 'Oost-Vlaanderen', 21, 1),
(435, 'Provincie Brabant', 21, 1),
(436, 'Vlaams-Brabant', 21, 1),
(437, 'Wallonne', 21, 1),
(438, 'West-Vlaanderen', 21, 1),
(439, 'Belize', 22, 1),
(440, 'Cayo', 22, 1),
(441, 'Corozal', 22, 1),
(442, 'Orange Walk', 22, 1),
(443, 'Stann Creek', 22, 1),
(444, 'Toledo', 22, 1),
(445, 'Alibori', 23, 1),
(446, 'Atacora', 23, 1),
(447, 'Atlantique', 23, 1),
(448, 'Borgou', 23, 1),
(449, 'Collines', 23, 1),
(450, 'Couffo', 23, 1),
(451, 'Donga', 23, 1),
(452, 'Littoral', 23, 1),
(453, 'Mono', 23, 1),
(454, 'Oueme', 23, 1),
(455, 'Plateau', 23, 1),
(456, 'Zou', 23, 1),
(457, 'Hamilton', 24, 1),
(458, 'Saint George', 24, 1),
(459, 'Bumthang', 25, 1),
(460, 'Chhukha', 25, 1),
(461, 'Chirang', 25, 1),
(462, 'Daga', 25, 1),
(463, 'Geylegphug', 25, 1),
(464, 'Ha', 25, 1),
(465, 'Lhuntshi', 25, 1),
(466, 'Mongar', 25, 1),
(467, 'Pemagatsel', 25, 1),
(468, 'Punakha', 25, 1),
(469, 'Rinpung', 25, 1),
(470, 'Samchi', 25, 1),
(471, 'Samdrup Jongkhar', 25, 1),
(472, 'Shemgang', 25, 1),
(473, 'Tashigang', 25, 1),
(474, 'Timphu', 25, 1),
(475, 'Tongsa', 25, 1),
(476, 'Wangdiphodrang', 25, 1),
(477, 'Beni', 26, 1),
(478, 'Chuquisaca', 26, 1),
(479, 'Cochabamba', 26, 1),
(480, 'La Paz', 26, 1),
(481, 'Oruro', 26, 1),
(482, 'Pando', 26, 1),
(483, 'Potosi', 26, 1),
(484, 'Santa Cruz', 26, 1),
(485, 'Tarija', 26, 1),
(486, 'Federacija Bosna i Hercegovina', 27, 1),
(487, 'Republika Srpska', 27, 1),
(488, 'Central Bobonong', 28, 1),
(489, 'Central Boteti', 28, 1),
(490, 'Central Mahalapye', 28, 1),
(491, 'Central Serowe-Palapye', 28, 1),
(492, 'Central Tutume', 28, 1),
(493, 'Chobe', 28, 1),
(494, 'Francistown', 28, 1),
(495, 'Gaborone', 28, 1),
(496, 'Ghanzi', 28, 1),
(497, 'Jwaneng', 28, 1),
(498, 'Kgalagadi North', 28, 1),
(499, 'Kgalagadi South', 28, 1),
(500, 'Kgatleng', 28, 1),
(501, 'Kweneng', 28, 1),
(502, 'Lobatse', 28, 1),
(503, 'Ngamiland', 28, 1),
(504, 'Ngwaketse', 28, 1),
(505, 'North East', 28, 1),
(506, 'Okavango', 28, 1),
(507, 'Orapa', 28, 1),
(508, 'Selibe Phikwe', 28, 1),
(509, 'South East', 28, 1),
(510, 'Sowa', 28, 1),
(511, 'Bouvet Island', 29, 1),
(512, 'Acre', 30, 1),
(513, 'Alagoas', 30, 1),
(514, 'Amapa', 30, 1),
(515, 'Amazonas', 30, 1),
(516, 'Bahia', 30, 1),
(517, 'Ceara', 30, 1),
(518, 'Distrito Federal', 30, 1),
(519, 'Espirito Santo', 30, 1),
(520, 'Estado de Sao Paulo', 30, 1),
(521, 'Goias', 30, 1),
(522, 'Maranhao', 30, 1),
(523, 'Mato Grosso', 30, 1),
(524, 'Mato Grosso do Sul', 30, 1),
(525, 'Minas Gerais', 30, 1),
(526, 'Para', 30, 1),
(527, 'Paraiba', 30, 1),
(528, 'Parana', 30, 1),
(529, 'Pernambuco', 30, 1),
(530, 'Piaui', 30, 1),
(531, 'Rio Grande do Norte', 30, 1),
(532, 'Rio Grande do Sul', 30, 1),
(533, 'Rio de Janeiro', 30, 1),
(534, 'Rondonia', 30, 1),
(535, 'Roraima', 30, 1),
(536, 'Santa Catarina', 30, 1),
(537, 'Sao Paulo', 30, 1),
(538, 'Sergipe', 30, 1),
(539, 'Tocantins', 30, 1),
(540, 'British Indian Ocean Territory', 31, 1),
(541, 'Belait', 32, 1),
(542, 'Brunei-Muara', 32, 1),
(543, 'Temburong', 32, 1),
(544, 'Tutong', 32, 1),
(545, 'Blagoevgrad', 33, 1),
(546, 'Burgas', 33, 1),
(547, 'Dobrich', 33, 1),
(548, 'Gabrovo', 33, 1),
(549, 'Haskovo', 33, 1),
(550, 'Jambol', 33, 1),
(551, 'Kardzhali', 33, 1),
(552, 'Kjustendil', 33, 1),
(553, 'Lovech', 33, 1),
(554, 'Montana', 33, 1),
(555, 'Oblast Sofiya-Grad', 33, 1),
(556, 'Pazardzhik', 33, 1),
(557, 'Pernik', 33, 1),
(558, 'Pleven', 33, 1),
(559, 'Plovdiv', 33, 1),
(560, 'Razgrad', 33, 1),
(561, 'Ruse', 33, 1),
(562, 'Shumen', 33, 1),
(563, 'Silistra', 33, 1),
(564, 'Sliven', 33, 1),
(565, 'Smoljan', 33, 1),
(566, 'Sofija grad', 33, 1),
(567, 'Sofijska oblast', 33, 1),
(568, 'Stara Zagora', 33, 1),
(569, 'Targovishte', 33, 1),
(570, 'Varna', 33, 1),
(571, 'Veliko Tarnovo', 33, 1),
(572, 'Vidin', 33, 1),
(573, 'Vraca', 33, 1),
(574, 'Yablaniza', 33, 1),
(575, 'Bale', 34, 1),
(576, 'Bam', 34, 1),
(577, 'Bazega', 34, 1),
(578, 'Bougouriba', 34, 1),
(579, 'Boulgou', 34, 1),
(580, 'Boulkiemde', 34, 1),
(581, 'Comoe', 34, 1),
(582, 'Ganzourgou', 34, 1),
(583, 'Gnagna', 34, 1),
(584, 'Gourma', 34, 1),
(585, 'Houet', 34, 1),
(586, 'Ioba', 34, 1),
(587, 'Kadiogo', 34, 1),
(588, 'Kenedougou', 34, 1),
(589, 'Komandjari', 34, 1),
(590, 'Kompienga', 34, 1),
(591, 'Kossi', 34, 1),
(592, 'Kouritenga', 34, 1),
(593, 'Kourweogo', 34, 1),
(594, 'Leraba', 34, 1),
(595, 'Mouhoun', 34, 1),
(596, 'Nahouri', 34, 1),
(597, 'Namentenga', 34, 1),
(598, 'Noumbiel', 34, 1),
(599, 'Oubritenga', 34, 1),
(600, 'Oudalan', 34, 1),
(601, 'Passore', 34, 1),
(602, 'Poni', 34, 1),
(603, 'Sanguie', 34, 1),
(604, 'Sanmatenga', 34, 1),
(605, 'Seno', 34, 1),
(606, 'Sissili', 34, 1),
(607, 'Soum', 34, 1),
(608, 'Sourou', 34, 1),
(609, 'Tapoa', 34, 1),
(610, 'Tuy', 34, 1),
(611, 'Yatenga', 34, 1),
(612, 'Zondoma', 34, 1),
(613, 'Zoundweogo', 34, 1),
(614, 'Bubanza', 35, 1),
(615, 'Bujumbura', 35, 1),
(616, 'Bururi', 35, 1),
(617, 'Cankuzo', 35, 1),
(618, 'Cibitoke', 35, 1),
(619, 'Gitega', 35, 1),
(620, 'Karuzi', 35, 1),
(621, 'Kayanza', 35, 1),
(622, 'Kirundo', 35, 1),
(623, 'Makamba', 35, 1),
(624, 'Muramvya', 35, 1),
(625, 'Muyinga', 35, 1),
(626, 'Ngozi', 35, 1),
(627, 'Rutana', 35, 1),
(628, 'Ruyigi', 35, 1),
(629, 'Banteay Mean Chey', 36, 1),
(630, 'Bat Dambang', 36, 1),
(631, 'Kampong Cham', 36, 1),
(632, 'Kampong Chhnang', 36, 1),
(633, 'Kampong Spoeu', 36, 1),
(634, 'Kampong Thum', 36, 1),
(635, 'Kampot', 36, 1),
(636, 'Kandal', 36, 1),
(637, 'Kaoh Kong', 36, 1),
(638, 'Kracheh', 36, 1),
(639, 'Krong Kaeb', 36, 1),
(640, 'Krong Pailin', 36, 1),
(641, 'Krong Preah Sihanouk', 36, 1),
(642, 'Mondol Kiri', 36, 1),
(643, 'Otdar Mean Chey', 36, 1),
(644, 'Phnum Penh', 36, 1),
(645, 'Pousat', 36, 1),
(646, 'Preah Vihear', 36, 1),
(647, 'Prey Veaeng', 36, 1),
(648, 'Rotanak Kiri', 36, 1),
(649, 'Siem Reab', 36, 1),
(650, 'Stueng Traeng', 36, 1),
(651, 'Svay Rieng', 36, 1),
(652, 'Takaev', 36, 1),
(653, 'Adamaoua', 37, 1),
(654, 'Centre', 37, 1),
(655, 'Est', 37, 1),
(656, 'Littoral', 37, 1),
(657, 'Nord', 37, 1),
(658, 'Nord Extreme', 37, 1),
(659, 'Nordouest', 37, 1),
(660, 'Ouest', 37, 1),
(661, 'Sud', 37, 1),
(662, 'Sudouest', 37, 1),
(663, 'Alberta', 38, 1),
(664, 'British Columbia', 38, 1),
(665, 'Manitoba', 38, 1),
(666, 'New Brunswick', 38, 1),
(667, 'Newfoundland and Labrador', 38, 1),
(668, 'Northwest Territories', 38, 1),
(669, 'Nova Scotia', 38, 1),
(670, 'Nunavut', 38, 1),
(671, 'Ontario', 38, 1),
(672, 'Prince Edward Island', 38, 1),
(673, 'Quebec', 38, 1),
(674, 'Saskatchewan', 38, 1),
(675, 'Yukon', 38, 1),
(676, 'Boavista', 39, 1),
(677, 'Brava', 39, 1),
(678, 'Fogo', 39, 1),
(679, 'Maio', 39, 1),
(680, 'Sal', 39, 1),
(681, 'Santo Antao', 39, 1),
(682, 'Sao Nicolau', 39, 1),
(683, 'Sao Tiago', 39, 1),
(684, 'Sao Vicente', 39, 1),
(685, 'Grand Cayman', 40, 1),
(686, 'Bamingui-Bangoran', 41, 1),
(687, 'Bangui', 41, 1),
(688, 'Basse-Kotto', 41, 1),
(689, 'Haut-Mbomou', 41, 1),
(690, 'Haute-Kotto', 41, 1),
(691, 'Kemo', 41, 1),
(692, 'Lobaye', 41, 1),
(693, 'Mambere-Kadei', 41, 1),
(694, 'Mbomou', 41, 1),
(695, 'Nana-Gribizi', 41, 1),
(696, 'Nana-Mambere', 41, 1),
(697, 'Ombella Mpoko', 41, 1),
(698, 'Ouaka', 41, 1),
(699, 'Ouham', 41, 1),
(700, 'Ouham-Pende', 41, 1),
(701, 'Sangha-Mbaere', 41, 1),
(702, 'Vakaga', 41, 1),
(703, 'Batha', 42, 1),
(704, 'Biltine', 42, 1),
(705, 'Bourkou-Ennedi-Tibesti', 42, 1),
(706, 'Chari-Baguirmi', 42, 1),
(707, 'Guera', 42, 1),
(708, 'Kanem', 42, 1),
(709, 'Lac', 42, 1),
(710, 'Logone Occidental', 42, 1),
(711, 'Logone Oriental', 42, 1),
(712, 'Mayo-Kebbi', 42, 1),
(713, 'Moyen-Chari', 42, 1),
(714, 'Ouaddai', 42, 1),
(715, 'Salamat', 42, 1),
(716, 'Tandjile', 42, 1),
(717, 'Aisen', 43, 1),
(718, 'Antofagasta', 43, 1),
(719, 'Araucania', 43, 1),
(720, 'Atacama', 43, 1),
(721, 'Bio Bio', 43, 1),
(722, 'Coquimbo', 43, 1),
(723, 'Libertador General Bernardo O\'', 43, 1),
(724, 'Los Lagos', 43, 1),
(725, 'Magellanes', 43, 1),
(726, 'Maule', 43, 1),
(727, 'Metropolitana', 43, 1),
(728, 'Metropolitana de Santiago', 43, 1),
(729, 'Tarapaca', 43, 1),
(730, 'Valparaiso', 43, 1),
(731, 'Anhui', 44, 1),
(734, 'Aomen', 44, 1),
(735, 'Beijing', 44, 1),
(736, 'Beijing Shi', 44, 1),
(737, 'Chongqing', 44, 1),
(738, 'Fujian', 44, 1),
(740, 'Gansu', 44, 1),
(741, 'Guangdong', 44, 1),
(743, 'Guangxi', 44, 1),
(744, 'Guizhou', 44, 1),
(745, 'Hainan', 44, 1),
(746, 'Hebei', 44, 1),
(747, 'Heilongjiang', 44, 1),
(748, 'Henan', 44, 1),
(749, 'Hubei', 44, 1),
(750, 'Hunan', 44, 1),
(751, 'Jiangsu', 44, 1),
(753, 'Jiangxi', 44, 1),
(754, 'Jilin', 44, 1),
(755, 'Liaoning', 44, 1),
(757, 'Nei Monggol', 44, 1),
(758, 'Ningxia Hui', 44, 1),
(759, 'Qinghai', 44, 1),
(760, 'Shaanxi', 44, 1),
(761, 'Shandong', 44, 1),
(763, 'Shanghai', 44, 1),
(764, 'Shanxi', 44, 1),
(765, 'Sichuan', 44, 1),
(766, 'Tianjin', 44, 1),
(767, 'Xianggang', 44, 1),
(768, 'Xinjiang', 44, 1),
(769, 'Xizang', 44, 1),
(770, 'Yunnan', 44, 1),
(771, 'Zhejiang', 44, 1),
(773, 'Christmas Island', 45, 1),
(774, 'Cocos (Keeling) Islands', 46, 1),
(775, 'Amazonas', 47, 1),
(776, 'Antioquia', 47, 1),
(777, 'Arauca', 47, 1),
(778, 'Atlantico', 47, 1),
(779, 'Bogota', 47, 1),
(780, 'Bolivar', 47, 1),
(781, 'Boyaca', 47, 1),
(782, 'Caldas', 47, 1),
(783, 'Caqueta', 47, 1),
(784, 'Casanare', 47, 1),
(785, 'Cauca', 47, 1),
(786, 'Cesar', 47, 1),
(787, 'Choco', 47, 1),
(788, 'Cordoba', 47, 1),
(789, 'Cundinamarca', 47, 1),
(790, 'Guainia', 47, 1),
(791, 'Guaviare', 47, 1),
(792, 'Huila', 47, 1),
(793, 'La Guajira', 47, 1),
(794, 'Magdalena', 47, 1),
(795, 'Meta', 47, 1),
(796, 'Narino', 47, 1),
(797, 'Norte de Santander', 47, 1),
(798, 'Putumayo', 47, 1),
(799, 'Quindio', 47, 1),
(800, 'Risaralda', 47, 1),
(801, 'San Andres y Providencia', 47, 1),
(802, 'Santander', 47, 1),
(803, 'Sucre', 47, 1),
(804, 'Tolima', 47, 1),
(805, 'Valle del Cauca', 47, 1),
(806, 'Vaupes', 47, 1),
(807, 'Vichada', 47, 1),
(808, 'Mwali', 48, 1),
(809, 'Njazidja', 48, 1),
(810, 'Nzwani', 48, 1),
(811, 'Bouenza', 49, 1),
(812, 'Brazzaville', 49, 1),
(813, 'Cuvette', 49, 1),
(814, 'Kouilou', 49, 1),
(815, 'Lekoumou', 49, 1),
(816, 'Likouala', 49, 1),
(817, 'Niari', 49, 1),
(818, 'Plateaux', 49, 1),
(819, 'Pool', 49, 1),
(820, 'Sangha', 49, 1),
(821, 'Bandundu', 50, 1),
(822, 'Bas-Congo', 50, 1),
(823, 'Equateur', 50, 1),
(824, 'Haut-Congo', 50, 1),
(825, 'Kasai-Occidental', 50, 1),
(826, 'Kasai-Oriental', 50, 1),
(827, 'Katanga', 50, 1),
(828, 'Kinshasa', 50, 1),
(829, 'Maniema', 50, 1),
(830, 'Nord-Kivu', 50, 1),
(831, 'Sud-Kivu', 50, 1),
(832, 'Aitutaki', 51, 1),
(833, 'Atiu', 51, 1),
(834, 'Mangaia', 51, 1),
(835, 'Manihiki', 51, 1),
(836, 'Mauke', 51, 1),
(837, 'Mitiaro', 51, 1),
(838, 'Nassau', 51, 1),
(839, 'Pukapuka', 51, 1),
(840, 'Rakahanga', 51, 1),
(841, 'Rarotonga', 51, 1),
(842, 'Tongareva', 51, 1),
(843, 'Alajuela', 52, 1),
(844, 'Cartago', 52, 1),
(845, 'Guanacaste', 52, 1),
(846, 'Heredia', 52, 1),
(847, 'Limon', 52, 1),
(848, 'Puntarenas', 52, 1),
(849, 'San Jose', 52, 1),
(850, 'Abidjan', 53, 1),
(851, 'Agneby', 53, 1),
(852, 'Bafing', 53, 1),
(853, 'Denguele', 53, 1),
(854, 'Dix-huit Montagnes', 53, 1),
(855, 'Fromager', 53, 1),
(856, 'Haut-Sassandra', 53, 1),
(857, 'Lacs', 53, 1),
(858, 'Lagunes', 53, 1),
(859, 'Marahoue', 53, 1),
(860, 'Moyen-Cavally', 53, 1),
(861, 'Moyen-Comoe', 53, 1),
(862, 'N\'zi-Comoe', 53, 1),
(863, 'Sassandra', 53, 1),
(864, 'Savanes', 53, 1),
(865, 'Sud-Bandama', 53, 1),
(866, 'Sud-Comoe', 53, 1),
(867, 'Vallee du Bandama', 53, 1),
(868, 'Worodougou', 53, 1),
(869, 'Zanzan', 53, 1),
(870, 'Bjelovar-Bilogora', 54, 1),
(871, 'Dubrovnik-Neretva', 54, 1),
(872, 'Grad Zagreb', 54, 1),
(873, 'Istra', 54, 1),
(874, 'Karlovac', 54, 1),
(875, 'Koprivnica-Krizhevci', 54, 1),
(876, 'Krapina-Zagorje', 54, 1),
(877, 'Lika-Senj', 54, 1),
(878, 'Medhimurje', 54, 1),
(879, 'Medimurska Zupanija', 54, 1),
(880, 'Osijek-Baranja', 54, 1),
(881, 'Osjecko-Baranjska Zupanija', 54, 1),
(882, 'Pozhega-Slavonija', 54, 1),
(883, 'Primorje-Gorski Kotar', 54, 1),
(884, 'Shibenik-Knin', 54, 1),
(885, 'Sisak-Moslavina', 54, 1),
(886, 'Slavonski Brod-Posavina', 54, 1),
(887, 'Split-Dalmacija', 54, 1),
(888, 'Varazhdin', 54, 1),
(889, 'Virovitica-Podravina', 54, 1),
(890, 'Vukovar-Srijem', 54, 1),
(891, 'Zadar', 54, 1),
(892, 'Zagreb', 54, 1),
(893, 'Camaguey', 55, 1),
(894, 'Ciego de Avila', 55, 1),
(895, 'Cienfuegos', 55, 1),
(896, 'Ciudad de la Habana', 55, 1),
(897, 'Granma', 55, 1),
(898, 'Guantanamo', 55, 1),
(899, 'Habana', 55, 1),
(900, 'Holguin', 55, 1),
(901, 'Isla de la Juventud', 55, 1),
(902, 'La Habana', 55, 1),
(903, 'Las Tunas', 55, 1),
(904, 'Matanzas', 55, 1),
(905, 'Pinar del Rio', 55, 1),
(906, 'Sancti Spiritus', 55, 1),
(907, 'Santiago de Cuba', 55, 1),
(908, 'Villa Clara', 55, 1),
(909, 'Government controlled area', 56, 1),
(910, 'Limassol', 56, 1),
(911, 'Nicosia District', 56, 1),
(912, 'Paphos', 56, 1),
(913, 'Turkish controlled area', 56, 1),
(914, 'Central Bohemian', 57, 1),
(915, 'Frycovice', 57, 1),
(916, 'Jihocesky Kraj', 57, 1),
(917, 'Jihochesky', 57, 1),
(918, 'Jihomoravsky', 57, 1),
(919, 'Karlovarsky', 57, 1),
(920, 'Klecany', 57, 1),
(921, 'Kralovehradecky', 57, 1),
(922, 'Liberecky', 57, 1),
(923, 'Lipov', 57, 1),
(924, 'Moravskoslezsky', 57, 1),
(925, 'Olomoucky', 57, 1),
(926, 'Olomoucky Kraj', 57, 1),
(927, 'Pardubicky', 57, 1),
(928, 'Plzensky', 57, 1),
(929, 'Praha', 57, 1),
(930, 'Rajhrad', 57, 1),
(931, 'Smirice', 57, 1),
(932, 'South Moravian', 57, 1),
(933, 'Straz nad Nisou', 57, 1),
(934, 'Stredochesky', 57, 1),
(935, 'Unicov', 57, 1),
(936, 'Ustecky', 57, 1),
(937, 'Valletta', 57, 1),
(938, 'Velesin', 57, 1),
(939, 'Vysochina', 57, 1),
(940, 'Zlinsky', 57, 1),
(941, 'Arhus', 58, 1),
(942, 'Bornholm', 58, 1),
(943, 'Frederiksborg', 58, 1),
(944, 'Fyn', 58, 1),
(945, 'Hovedstaden', 58, 1),
(946, 'Kobenhavn', 58, 1),
(947, 'Kobenhavns Amt', 58, 1),
(948, 'Kobenhavns Kommune', 58, 1),
(949, 'Nordjylland', 58, 1),
(950, 'Ribe', 58, 1),
(951, 'Ringkobing', 58, 1),
(952, 'Roervig', 58, 1),
(953, 'Roskilde', 58, 1),
(954, 'Roslev', 58, 1),
(955, 'Sjaelland', 58, 1),
(956, 'Soeborg', 58, 1),
(957, 'Sonderjylland', 58, 1),
(958, 'Storstrom', 58, 1),
(959, 'Syddanmark', 58, 1),
(960, 'Toelloese', 58, 1),
(961, 'Vejle', 58, 1),
(962, 'Vestsjalland', 58, 1),
(963, 'Viborg', 58, 1),
(964, '\'Ali Sabih', 59, 1),
(965, 'Dikhil', 59, 1),
(966, 'Jibuti', 59, 1),
(967, 'Tajurah', 59, 1),
(968, 'Ubuk', 59, 1),
(969, 'Saint Andrew', 60, 1),
(970, 'Saint David', 60, 1),
(971, 'Saint George', 60, 1),
(972, 'Saint John', 60, 1),
(973, 'Saint Joseph', 60, 1),
(974, 'Saint Luke', 60, 1),
(975, 'Saint Mark', 60, 1),
(976, 'Saint Patrick', 60, 1),
(977, 'Saint Paul', 60, 1),
(978, 'Saint Peter', 60, 1),
(979, 'Azua', 61, 1),
(980, 'Bahoruco', 61, 1),
(981, 'Barahona', 61, 1),
(982, 'Dajabon', 61, 1),
(983, 'Distrito Nacional', 61, 1),
(984, 'Duarte', 61, 1),
(985, 'El Seybo', 61, 1),
(986, 'Elias Pina', 61, 1),
(987, 'Espaillat', 61, 1),
(988, 'Hato Mayor', 61, 1),
(989, 'Independencia', 61, 1),
(990, 'La Altagracia', 61, 1),
(991, 'La Romana', 61, 1),
(992, 'La Vega', 61, 1),
(993, 'Maria Trinidad Sanchez', 61, 1),
(994, 'Monsenor Nouel', 61, 1),
(995, 'Monte Cristi', 61, 1),
(996, 'Monte Plata', 61, 1),
(997, 'Pedernales', 61, 1),
(998, 'Peravia', 61, 1),
(999, 'Puerto Plata', 61, 1),
(1000, 'Salcedo', 61, 1),
(1001, 'Samana', 61, 1),
(1002, 'San Cristobal', 61, 1),
(1003, 'San Juan', 61, 1),
(1004, 'San Pedro de Macoris', 61, 1),
(1005, 'Sanchez Ramirez', 61, 1),
(1006, 'Santiago', 61, 1),
(1007, 'Santiago Rodriguez', 61, 1),
(1008, 'Valverde', 61, 1),
(1009, 'Aileu', 62, 1),
(1010, 'Ainaro', 62, 1),
(1011, 'Ambeno', 62, 1),
(1012, 'Baucau', 62, 1),
(1013, 'Bobonaro', 62, 1),
(1014, 'Cova Lima', 62, 1),
(1015, 'Dili', 62, 1),
(1016, 'Ermera', 62, 1),
(1017, 'Lautem', 62, 1),
(1018, 'Liquica', 62, 1),
(1019, 'Manatuto', 62, 1),
(1020, 'Manufahi', 62, 1),
(1021, 'Viqueque', 62, 1),
(1022, 'Azuay', 63, 1),
(1023, 'Bolivar', 63, 1),
(1024, 'Canar', 63, 1),
(1025, 'Carchi', 63, 1),
(1026, 'Chimborazo', 63, 1),
(1027, 'Cotopaxi', 63, 1),
(1028, 'El Oro', 63, 1),
(1029, 'Esmeraldas', 63, 1),
(1030, 'Galapagos', 63, 1),
(1031, 'Guayas', 63, 1),
(1032, 'Imbabura', 63, 1),
(1033, 'Loja', 63, 1),
(1034, 'Los Rios', 63, 1),
(1035, 'Manabi', 63, 1),
(1036, 'Morona Santiago', 63, 1),
(1037, 'Napo', 63, 1),
(1038, 'Orellana', 63, 1),
(1039, 'Pastaza', 63, 1),
(1040, 'Pichincha', 63, 1),
(1041, 'Sucumbios', 63, 1),
(1042, 'Tungurahua', 63, 1),
(1043, 'Zamora Chinchipe', 63, 1),
(1044, 'Aswan', 64, 1),
(1045, 'Asyut', 64, 1),
(1046, 'Bani Suwayf', 64, 1),
(1047, 'Bur Sa\'id', 64, 1),
(1048, 'Cairo', 64, 1),
(1049, 'Dumyat', 64, 1),
(1050, 'Kafr-ash-Shaykh', 64, 1),
(1051, 'Matruh', 64, 1),
(1052, 'Muhafazat ad Daqahliyah', 64, 1),
(1053, 'Muhafazat al Fayyum', 64, 1),
(1054, 'Muhafazat al Gharbiyah', 64, 1),
(1055, 'Muhafazat al Iskandariyah', 64, 1),
(1056, 'Muhafazat al Qahirah', 64, 1),
(1057, 'Qina', 64, 1),
(1058, 'Sawhaj', 64, 1),
(1059, 'Sina al-Janubiyah', 64, 1),
(1060, 'Sina ash-Shamaliyah', 64, 1),
(1061, 'ad-Daqahliyah', 64, 1),
(1062, 'al-Bahr-al-Ahmar', 64, 1),
(1063, 'al-Buhayrah', 64, 1),
(1064, 'al-Fayyum', 64, 1),
(1065, 'al-Gharbiyah', 64, 1),
(1066, 'al-Iskandariyah', 64, 1),
(1067, 'al-Ismailiyah', 64, 1),
(1068, 'al-Jizah', 64, 1),
(1069, 'al-Minufiyah', 64, 1),
(1070, 'al-Minya', 64, 1),
(1071, 'al-Qahira', 64, 1),
(1072, 'al-Qalyubiyah', 64, 1),
(1073, 'al-Uqsur', 64, 1),
(1074, 'al-Wadi al-Jadid', 64, 1),
(1075, 'as-Suways', 64, 1),
(1076, 'ash-Sharqiyah', 64, 1),
(1077, 'Ahuachapan', 65, 1),
(1078, 'Cabanas', 65, 1),
(1079, 'Chalatenango', 65, 1),
(1080, 'Cuscatlan', 65, 1),
(1081, 'La Libertad', 65, 1),
(1082, 'La Paz', 65, 1),
(1083, 'La Union', 65, 1),
(1084, 'Morazan', 65, 1),
(1085, 'San Miguel', 65, 1),
(1086, 'San Salvador', 65, 1),
(1087, 'San Vicente', 65, 1),
(1088, 'Santa Ana', 65, 1),
(1089, 'Sonsonate', 65, 1),
(1090, 'Usulutan', 65, 1),
(1091, 'Annobon', 66, 1),
(1092, 'Bioko Norte', 66, 1),
(1093, 'Bioko Sur', 66, 1),
(1094, 'Centro Sur', 66, 1),
(1095, 'Kie-Ntem', 66, 1),
(1096, 'Litoral', 66, 1),
(1097, 'Wele-Nzas', 66, 1),
(1098, 'Anseba', 67, 1),
(1099, 'Debub', 67, 1),
(1100, 'Debub-Keih-Bahri', 67, 1),
(1101, 'Gash-Barka', 67, 1),
(1102, 'Maekel', 67, 1),
(1103, 'Semien-Keih-Bahri', 67, 1),
(1104, 'Harju', 68, 1),
(1105, 'Hiiu', 68, 1),
(1106, 'Ida-Viru', 68, 1),
(1107, 'Jarva', 68, 1),
(1108, 'Jogeva', 68, 1),
(1109, 'Laane', 68, 1),
(1110, 'Laane-Viru', 68, 1),
(1111, 'Parnu', 68, 1),
(1112, 'Polva', 68, 1),
(1113, 'Rapla', 68, 1),
(1114, 'Saare', 68, 1),
(1115, 'Tartu', 68, 1),
(1116, 'Valga', 68, 1),
(1117, 'Viljandi', 68, 1),
(1118, 'Voru', 68, 1),
(1119, 'Addis Abeba', 69, 1),
(1120, 'Afar', 69, 1),
(1121, 'Amhara', 69, 1),
(1122, 'Benishangul', 69, 1),
(1123, 'Diredawa', 69, 1),
(1124, 'Gambella', 69, 1),
(1125, 'Harar', 69, 1),
(1126, 'Jigjiga', 69, 1),
(1127, 'Mekele', 69, 1),
(1128, 'Oromia', 69, 1),
(1129, 'Somali', 69, 1),
(1130, 'Southern', 69, 1),
(1131, 'Tigray', 69, 1),
(1132, 'Christmas Island', 70, 1),
(1133, 'Cocos Islands', 70, 1),
(1134, 'Coral Sea Islands', 70, 1),
(1135, 'Falkland Islands', 71, 1),
(1136, 'South Georgia', 71, 1),
(1137, 'Klaksvik', 72, 1),
(1138, 'Nor ara Eysturoy', 72, 1),
(1139, 'Nor oy', 72, 1),
(1140, 'Sandoy', 72, 1),
(1141, 'Streymoy', 72, 1),
(1142, 'Su uroy', 72, 1),
(1143, 'Sy ra Eysturoy', 72, 1),
(1144, 'Torshavn', 72, 1),
(1145, 'Vaga', 72, 1),
(1146, 'Central', 73, 1),
(1147, 'Eastern', 73, 1),
(1148, 'Northern', 73, 1),
(1149, 'South Pacific', 73, 1),
(1150, 'Western', 73, 1),
(1151, 'Ahvenanmaa', 74, 1),
(1152, 'Etela-Karjala', 74, 1),
(1153, 'Etela-Pohjanmaa', 74, 1),
(1154, 'Etela-Savo', 74, 1),
(1155, 'Etela-Suomen Laani', 74, 1),
(1156, 'Ita-Suomen Laani', 74, 1),
(1157, 'Ita-Uusimaa', 74, 1),
(1158, 'Kainuu', 74, 1),
(1159, 'Kanta-Hame', 74, 1),
(1160, 'Keski-Pohjanmaa', 74, 1),
(1161, 'Keski-Suomi', 74, 1),
(1162, 'Kymenlaakso', 74, 1),
(1163, 'Lansi-Suomen Laani', 74, 1),
(1164, 'Lappi', 74, 1),
(1165, 'Northern Savonia', 74, 1),
(1166, 'Ostrobothnia', 74, 1),
(1167, 'Oulun Laani', 74, 1),
(1168, 'Paijat-Hame', 74, 1),
(1169, 'Pirkanmaa', 74, 1),
(1170, 'Pohjanmaa', 74, 1),
(1171, 'Pohjois-Karjala', 74, 1),
(1172, 'Pohjois-Pohjanmaa', 74, 1),
(1173, 'Pohjois-Savo', 74, 1),
(1174, 'Saarijarvi', 74, 1),
(1175, 'Satakunta', 74, 1),
(1176, 'Southern Savonia', 74, 1),
(1177, 'Tavastia Proper', 74, 1),
(1178, 'Uleaborgs Lan', 74, 1),
(1179, 'Uusimaa', 74, 1),
(1180, 'Varsinais-Suomi', 74, 1),
(1181, 'Ain', 75, 1),
(1182, 'Aisne', 75, 1),
(1183, 'Albi Le Sequestre', 75, 1),
(1184, 'Allier', 75, 1),
(1185, 'Alpes-Cote dAzur', 75, 1),
(1186, 'Alpes-Maritimes', 75, 1),
(1187, 'Alpes-de-Haute-Provence', 75, 1),
(1188, 'Alsace', 75, 1),
(1189, 'Aquitaine', 75, 1),
(1190, 'Ardeche', 75, 1),
(1191, 'Ardennes', 75, 1),
(1192, 'Ariege', 75, 1),
(1193, 'Aube', 75, 1),
(1194, 'Aude', 75, 1),
(1195, 'Auvergne', 75, 1),
(1196, 'Aveyron', 75, 1),
(1197, 'Bas-Rhin', 75, 1),
(1198, 'Basse-Normandie', 75, 1),
(1199, 'Bouches-du-Rhone', 75, 1),
(1200, 'Bourgogne', 75, 1),
(1201, 'Bretagne', 75, 1),
(1202, 'Brittany', 75, 1),
(1203, 'Burgundy', 75, 1),
(1204, 'Calvados', 75, 1),
(1205, 'Cantal', 75, 1),
(1206, 'Cedex', 75, 1),
(1207, 'Centre', 75, 1),
(1208, 'Charente', 75, 1),
(1209, 'Charente-Maritime', 75, 1),
(1210, 'Cher', 75, 1),
(1211, 'Correze', 75, 1),
(1212, 'Corse-du-Sud', 75, 1),
(1213, 'Cote-d\'Or', 75, 1),
(1214, 'Cotes-d\'Armor', 75, 1),
(1215, 'Creuse', 75, 1),
(1216, 'Crolles', 75, 1),
(1217, 'Deux-Sevres', 75, 1),
(1218, 'Dordogne', 75, 1),
(1219, 'Doubs', 75, 1),
(1220, 'Drome', 75, 1),
(1221, 'Essonne', 75, 1),
(1222, 'Eure', 75, 1),
(1223, 'Eure-et-Loir', 75, 1),
(1224, 'Feucherolles', 75, 1),
(1225, 'Finistere', 75, 1),
(1226, 'Franche-Comte', 75, 1),
(1227, 'Gard', 75, 1),
(1228, 'Gers', 75, 1),
(1229, 'Gironde', 75, 1),
(1230, 'Haut-Rhin', 75, 1),
(1231, 'Haute-Corse', 75, 1),
(1232, 'Haute-Garonne', 75, 1),
(1233, 'Haute-Loire', 75, 1),
(1234, 'Haute-Marne', 75, 1),
(1235, 'Haute-Saone', 75, 1),
(1236, 'Haute-Savoie', 75, 1),
(1237, 'Haute-Vienne', 75, 1),
(1238, 'Hautes-Alpes', 75, 1),
(1239, 'Hautes-Pyrenees', 75, 1),
(1240, 'Hauts-de-Seine', 75, 1),
(1241, 'Herault', 75, 1),
(1242, 'Ile-de-France', 75, 1),
(1243, 'Ille-et-Vilaine', 75, 1),
(1244, 'Indre', 75, 1),
(1245, 'Indre-et-Loire', 75, 1),
(1246, 'Isere', 75, 1),
(1247, 'Jura', 75, 1),
(1248, 'Klagenfurt', 75, 1),
(1249, 'Landes', 75, 1),
(1250, 'Languedoc-Roussillon', 75, 1),
(1251, 'Larcay', 75, 1),
(1252, 'Le Castellet', 75, 1),
(1253, 'Le Creusot', 75, 1),
(1254, 'Limousin', 75, 1),
(1255, 'Loir-et-Cher', 75, 1),
(1256, 'Loire', 75, 1),
(1257, 'Loire-Atlantique', 75, 1),
(1258, 'Loiret', 75, 1),
(1259, 'Lorraine', 75, 1),
(1260, 'Lot', 75, 1),
(1261, 'Lot-et-Garonne', 75, 1),
(1262, 'Lower Normandy', 75, 1),
(1263, 'Lozere', 75, 1),
(1264, 'Maine-et-Loire', 75, 1),
(1265, 'Manche', 75, 1),
(1266, 'Marne', 75, 1),
(1267, 'Mayenne', 75, 1),
(1268, 'Meurthe-et-Moselle', 75, 1),
(1269, 'Meuse', 75, 1),
(1270, 'Midi-Pyrenees', 75, 1),
(1271, 'Morbihan', 75, 1),
(1272, 'Moselle', 75, 1),
(1273, 'Nievre', 75, 1),
(1274, 'Nord', 75, 1),
(1275, 'Nord-Pas-de-Calais', 75, 1),
(1276, 'Oise', 75, 1),
(1277, 'Orne', 75, 1),
(1278, 'Paris', 75, 1),
(1279, 'Pas-de-Calais', 75, 1),
(1280, 'Pays de la Loire', 75, 1),
(1281, 'Pays-de-la-Loire', 75, 1),
(1282, 'Picardy', 75, 1),
(1283, 'Puy-de-Dome', 75, 1),
(1284, 'Pyrenees-Atlantiques', 75, 1),
(1285, 'Pyrenees-Orientales', 75, 1),
(1286, 'Quelmes', 75, 1),
(1287, 'Rhone', 75, 1),
(1288, 'Rhone-Alpes', 75, 1),
(1289, 'Saint Ouen', 75, 1),
(1290, 'Saint Viatre', 75, 1),
(1291, 'Saone-et-Loire', 75, 1),
(1292, 'Sarthe', 75, 1),
(1293, 'Savoie', 75, 1),
(1294, 'Seine-Maritime', 75, 1),
(1295, 'Seine-Saint-Denis', 75, 1),
(1296, 'Seine-et-Marne', 75, 1),
(1297, 'Somme', 75, 1),
(1298, 'Sophia Antipolis', 75, 1),
(1299, 'Souvans', 75, 1),
(1300, 'Tarn', 75, 1),
(1301, 'Tarn-et-Garonne', 75, 1),
(1302, 'Territoire de Belfort', 75, 1),
(1303, 'Treignac', 75, 1),
(1304, 'Upper Normandy', 75, 1),
(1305, 'Val-d\'Oise', 75, 1),
(1306, 'Val-de-Marne', 75, 1),
(1307, 'Var', 75, 1),
(1308, 'Vaucluse', 75, 1),
(1309, 'Vellise', 75, 1),
(1310, 'Vendee', 75, 1),
(1311, 'Vienne', 75, 1),
(1312, 'Vosges', 75, 1),
(1313, 'Yonne', 75, 1),
(1314, 'Yvelines', 75, 1),
(1315, 'Cayenne', 76, 1),
(1316, 'Saint-Laurent-du-Maroni', 76, 1),
(1317, 'Iles du Vent', 77, 1),
(1318, 'Iles sous le Vent', 77, 1),
(1319, 'Marquesas', 77, 1),
(1320, 'Tuamotu', 77, 1),
(1321, 'Tubuai', 77, 1),
(1322, 'Amsterdam', 78, 1),
(1323, 'Crozet Islands', 78, 1),
(1324, 'Kerguelen', 78, 1),
(1325, 'Estuaire', 79, 1),
(1326, 'Haut-Ogooue', 79, 1),
(1327, 'Moyen-Ogooue', 79, 1),
(1328, 'Ngounie', 79, 1),
(1329, 'Nyanga', 79, 1),
(1330, 'Ogooue-Ivindo', 79, 1),
(1331, 'Ogooue-Lolo', 79, 1),
(1332, 'Ogooue-Maritime', 79, 1),
(1333, 'Woleu-Ntem', 79, 1),
(1334, 'Banjul', 80, 1),
(1335, 'Basse', 80, 1),
(1336, 'Brikama', 80, 1),
(1337, 'Janjanbureh', 80, 1),
(1338, 'Kanifing', 80, 1),
(1339, 'Kerewan', 80, 1),
(1340, 'Kuntaur', 80, 1),
(1341, 'Mansakonko', 80, 1),
(1342, 'Abhasia', 81, 1),
(1343, 'Ajaria', 81, 1),
(1344, 'Guria', 81, 1),
(1345, 'Imereti', 81, 1),
(1346, 'Kaheti', 81, 1),
(1347, 'Kvemo Kartli', 81, 1),
(1348, 'Mcheta-Mtianeti', 81, 1),
(1349, 'Racha', 81, 1),
(1350, 'Samagrelo-Zemo Svaneti', 81, 1),
(1351, 'Samche-Zhavaheti', 81, 1),
(1352, 'Shida Kartli', 81, 1),
(1353, 'Tbilisi', 81, 1),
(1354, 'Auvergne', 82, 1),
(1355, 'Baden-Wurttemberg', 82, 1),
(1356, 'Bavaria', 82, 1),
(1357, 'Bayern', 82, 1),
(1358, 'Beilstein Wurtt', 82, 1),
(1359, 'Berlin', 82, 1),
(1360, 'Brandenburg', 82, 1),
(1361, 'Bremen', 82, 1),
(1362, 'Dreisbach', 82, 1),
(1363, 'Freistaat Bayern', 82, 1),
(1364, 'Hamburg', 82, 1),
(1365, 'Hannover', 82, 1),
(1366, 'Heroldstatt', 82, 1),
(1367, 'Hessen', 82, 1),
(1368, 'Kortenberg', 82, 1),
(1369, 'Laasdorf', 82, 1),
(1370, 'Land Baden-Wurttemberg', 82, 1),
(1371, 'Land Bayern', 82, 1),
(1372, 'Land Brandenburg', 82, 1),
(1373, 'Land Hessen', 82, 1),
(1374, 'Land Mecklenburg-Vorpommern', 82, 1),
(1375, 'Land Nordrhein-Westfalen', 82, 1),
(1376, 'Land Rheinland-Pfalz', 82, 1),
(1377, 'Land Sachsen', 82, 1),
(1378, 'Land Sachsen-Anhalt', 82, 1),
(1379, 'Land Thuringen', 82, 1),
(1380, 'Lower Saxony', 82, 1),
(1381, 'Mecklenburg-Vorpommern', 82, 1),
(1382, 'Mulfingen', 82, 1),
(1383, 'Munich', 82, 1),
(1384, 'Neubeuern', 82, 1),
(1385, 'Niedersachsen', 82, 1),
(1386, 'Noord-Holland', 82, 1),
(1387, 'Nordrhein-Westfalen', 82, 1),
(1388, 'North Rhine-Westphalia', 82, 1),
(1389, 'Osterode', 82, 1),
(1390, 'Rheinland-Pfalz', 82, 1),
(1391, 'Rhineland-Palatinate', 82, 1),
(1392, 'Saarland', 82, 1),
(1393, 'Sachsen', 82, 1),
(1394, 'Sachsen-Anhalt', 82, 1),
(1395, 'Saxony', 82, 1),
(1396, 'Schleswig-Holstein', 82, 1),
(1397, 'Thuringia', 82, 1),
(1398, 'Webling', 82, 1),
(1399, 'Weinstrabe', 82, 1),
(1400, 'schlobborn', 82, 1),
(1401, 'Ashanti', 83, 1),
(1402, 'Brong-Ahafo', 83, 1),
(1403, 'Central', 83, 1),
(1404, 'Eastern', 83, 1),
(1405, 'Greater Accra', 83, 1),
(1406, 'Northern', 83, 1),
(1407, 'Upper East', 83, 1),
(1408, 'Upper West', 83, 1),
(1409, 'Volta', 83, 1),
(1410, 'Western', 83, 1),
(1411, 'Gibraltar', 84, 1),
(1412, 'Acharnes', 85, 1),
(1413, 'Ahaia', 85, 1),
(1414, 'Aitolia kai Akarnania', 85, 1),
(1415, 'Argolis', 85, 1),
(1416, 'Arkadia', 85, 1),
(1417, 'Arta', 85, 1),
(1418, 'Attica', 85, 1),
(1419, 'Attiki', 85, 1),
(1420, 'Ayion Oros', 85, 1),
(1421, 'Crete', 85, 1),
(1422, 'Dodekanisos', 85, 1),
(1423, 'Drama', 85, 1),
(1424, 'Evia', 85, 1),
(1425, 'Evritania', 85, 1),
(1426, 'Evros', 85, 1),
(1427, 'Evvoia', 85, 1),
(1428, 'Florina', 85, 1),
(1429, 'Fokis', 85, 1),
(1430, 'Fthiotis', 85, 1),
(1431, 'Grevena', 85, 1),
(1432, 'Halandri', 85, 1),
(1433, 'Halkidiki', 85, 1),
(1434, 'Hania', 85, 1),
(1435, 'Heraklion', 85, 1),
(1436, 'Hios', 85, 1),
(1437, 'Ilia', 85, 1),
(1438, 'Imathia', 85, 1),
(1439, 'Ioannina', 85, 1),
(1440, 'Iraklion', 85, 1),
(1441, 'Karditsa', 85, 1),
(1442, 'Kastoria', 85, 1),
(1443, 'Kavala', 85, 1),
(1444, 'Kefallinia', 85, 1),
(1445, 'Kerkira', 85, 1),
(1446, 'Kiklades', 85, 1),
(1447, 'Kilkis', 85, 1),
(1448, 'Korinthia', 85, 1),
(1449, 'Kozani', 85, 1),
(1450, 'Lakonia', 85, 1),
(1451, 'Larisa', 85, 1),
(1452, 'Lasithi', 85, 1),
(1453, 'Lesvos', 85, 1),
(1454, 'Levkas', 85, 1),
(1455, 'Magnisia', 85, 1),
(1456, 'Messinia', 85, 1),
(1457, 'Nomos Attikis', 85, 1),
(1458, 'Nomos Zakynthou', 85, 1),
(1459, 'Pella', 85, 1),
(1460, 'Pieria', 85, 1),
(1461, 'Piraios', 85, 1),
(1462, 'Preveza', 85, 1),
(1463, 'Rethimni', 85, 1),
(1464, 'Rodopi', 85, 1),
(1465, 'Samos', 85, 1),
(1466, 'Serrai', 85, 1),
(1467, 'Thesprotia', 85, 1),
(1468, 'Thessaloniki', 85, 1),
(1469, 'Trikala', 85, 1),
(1470, 'Voiotia', 85, 1),
(1471, 'West Greece', 85, 1),
(1472, 'Xanthi', 85, 1),
(1473, 'Zakinthos', 85, 1),
(1474, 'Aasiaat', 86, 1),
(1475, 'Ammassalik', 86, 1),
(1476, 'Illoqqortoormiut', 86, 1),
(1477, 'Ilulissat', 86, 1),
(1478, 'Ivittuut', 86, 1),
(1479, 'Kangaatsiaq', 86, 1),
(1480, 'Maniitsoq', 86, 1),
(1481, 'Nanortalik', 86, 1),
(1482, 'Narsaq', 86, 1),
(1483, 'Nuuk', 86, 1),
(1484, 'Paamiut', 86, 1),
(1485, 'Qaanaaq', 86, 1),
(1486, 'Qaqortoq', 86, 1),
(1487, 'Qasigiannguit', 86, 1),
(1488, 'Qeqertarsuaq', 86, 1),
(1489, 'Sisimiut', 86, 1),
(1490, 'Udenfor kommunal inddeling', 86, 1),
(1491, 'Upernavik', 86, 1),
(1492, 'Uummannaq', 86, 1),
(1493, 'Carriacou-Petite Martinique', 87, 1),
(1494, 'Saint Andrew', 87, 1),
(1495, 'Saint Davids', 87, 1),
(1496, 'Saint George\'s', 87, 1),
(1497, 'Saint John', 87, 1),
(1498, 'Saint Mark', 87, 1),
(1499, 'Saint Patrick', 87, 1),
(1500, 'Basse-Terre', 88, 1),
(1501, 'Grande-Terre', 88, 1),
(1502, 'Iles des Saintes', 88, 1),
(1503, 'La Desirade', 88, 1),
(1504, 'Marie-Galante', 88, 1),
(1505, 'Saint Barthelemy', 88, 1),
(1506, 'Saint Martin', 88, 1),
(1507, 'Agana Heights', 89, 1),
(1508, 'Agat', 89, 1),
(1509, 'Barrigada', 89, 1),
(1510, 'Chalan-Pago-Ordot', 89, 1),
(1511, 'Dededo', 89, 1),
(1512, 'Hagatna', 89, 1),
(1513, 'Inarajan', 89, 1),
(1514, 'Mangilao', 89, 1),
(1515, 'Merizo', 89, 1),
(1516, 'Mongmong-Toto-Maite', 89, 1),
(1517, 'Santa Rita', 89, 1),
(1518, 'Sinajana', 89, 1),
(1519, 'Talofofo', 89, 1),
(1520, 'Tamuning', 89, 1),
(1521, 'Yigo', 89, 1),
(1522, 'Yona', 89, 1),
(1523, 'Alta Verapaz', 90, 1),
(1524, 'Baja Verapaz', 90, 1),
(1525, 'Chimaltenango', 90, 1),
(1526, 'Chiquimula', 90, 1),
(1527, 'El Progreso', 90, 1),
(1528, 'Escuintla', 90, 1),
(1529, 'Guatemala', 90, 1),
(1530, 'Huehuetenango', 90, 1),
(1531, 'Izabal', 90, 1),
(1532, 'Jalapa', 90, 1),
(1533, 'Jutiapa', 90, 1),
(1534, 'Peten', 90, 1),
(1535, 'Quezaltenango', 90, 1),
(1536, 'Quiche', 90, 1),
(1537, 'Retalhuleu', 90, 1),
(1538, 'Sacatepequez', 90, 1),
(1539, 'San Marcos', 90, 1),
(1540, 'Santa Rosa', 90, 1),
(1541, 'Solola', 90, 1),
(1542, 'Suchitepequez', 90, 1),
(1543, 'Totonicapan', 90, 1),
(1544, 'Zacapa', 90, 1),
(1545, 'Alderney', 91, 1),
(1546, 'Castel', 91, 1),
(1547, 'Forest', 91, 1),
(1548, 'Saint Andrew', 91, 1),
(1549, 'Saint Martin', 91, 1),
(1550, 'Saint Peter Port', 91, 1),
(1551, 'Saint Pierre du Bois', 91, 1),
(1552, 'Saint Sampson', 91, 1),
(1553, 'Saint Saviour', 91, 1),
(1554, 'Sark', 91, 1),
(1555, 'Torteval', 91, 1),
(1556, 'Vale', 91, 1),
(1557, 'Beyla', 92, 1),
(1558, 'Boffa', 92, 1),
(1559, 'Boke', 92, 1),
(1560, 'Conakry', 92, 1),
(1561, 'Coyah', 92, 1),
(1562, 'Dabola', 92, 1),
(1563, 'Dalaba', 92, 1),
(1564, 'Dinguiraye', 92, 1),
(1565, 'Faranah', 92, 1),
(1566, 'Forecariah', 92, 1),
(1567, 'Fria', 92, 1),
(1568, 'Gaoual', 92, 1),
(1569, 'Gueckedou', 92, 1),
(1570, 'Kankan', 92, 1),
(1571, 'Kerouane', 92, 1),
(1572, 'Kindia', 92, 1),
(1573, 'Kissidougou', 92, 1),
(1574, 'Koubia', 92, 1),
(1575, 'Koundara', 92, 1),
(1576, 'Kouroussa', 92, 1),
(1577, 'Labe', 92, 1),
(1578, 'Lola', 92, 1),
(1579, 'Macenta', 92, 1),
(1580, 'Mali', 92, 1),
(1581, 'Mamou', 92, 1),
(1582, 'Mandiana', 92, 1),
(1583, 'Nzerekore', 92, 1),
(1584, 'Pita', 92, 1),
(1585, 'Siguiri', 92, 1),
(1586, 'Telimele', 92, 1),
(1587, 'Tougue', 92, 1),
(1588, 'Yomou', 92, 1),
(1589, 'Bafata', 93, 1),
(1590, 'Bissau', 93, 1),
(1591, 'Bolama', 93, 1),
(1592, 'Cacheu', 93, 1),
(1593, 'Gabu', 93, 1),
(1594, 'Oio', 93, 1),
(1595, 'Quinara', 93, 1),
(1596, 'Tombali', 93, 1),
(1597, 'Barima-Waini', 94, 1),
(1598, 'Cuyuni-Mazaruni', 94, 1),
(1599, 'Demerara-Mahaica', 94, 1),
(1600, 'East Berbice-Corentyne', 94, 1),
(1601, 'Essequibo Islands-West Demerar', 94, 1),
(1602, 'Mahaica-Berbice', 94, 1),
(1603, 'Pomeroon-Supenaam', 94, 1),
(1604, 'Potaro-Siparuni', 94, 1),
(1605, 'Upper Demerara-Berbice', 94, 1),
(1606, 'Upper Takutu-Upper Essequibo', 94, 1),
(1607, 'Artibonite', 95, 1),
(1608, 'Centre', 95, 1),
(1609, 'Grand\'Anse', 95, 1),
(1610, 'Nord', 95, 1),
(1611, 'Nord-Est', 95, 1),
(1612, 'Nord-Ouest', 95, 1),
(1613, 'Ouest', 95, 1),
(1614, 'Sud', 95, 1),
(1615, 'Sud-Est', 95, 1),
(1616, 'Heard and McDonald Islands', 96, 1),
(1617, 'Atlantida', 97, 1),
(1618, 'Choluteca', 97, 1),
(1619, 'Colon', 97, 1),
(1620, 'Comayagua', 97, 1),
(1621, 'Copan', 97, 1),
(1622, 'Cortes', 97, 1),
(1623, 'Distrito Central', 97, 1),
(1624, 'El Paraiso', 97, 1),
(1625, 'Francisco Morazan', 97, 1),
(1626, 'Gracias a Dios', 97, 1),
(1627, 'Intibuca', 97, 1),
(1628, 'Islas de la Bahia', 97, 1),
(1629, 'La Paz', 97, 1),
(1630, 'Lempira', 97, 1),
(1631, 'Ocotepeque', 97, 1),
(1632, 'Olancho', 97, 1),
(1633, 'Santa Barbara', 97, 1),
(1634, 'Valle', 97, 1),
(1635, 'Yoro', 97, 1),
(1636, 'Hong Kong', 98, 1),
(1637, 'Bacs-Kiskun', 99, 1),
(1638, 'Baranya', 99, 1),
(1639, 'Bekes', 99, 1),
(1640, 'Borsod-Abauj-Zemplen', 99, 1),
(1641, 'Budapest', 99, 1),
(1642, 'Csongrad', 99, 1),
(1643, 'Fejer', 99, 1),
(1644, 'Gyor-Moson-Sopron', 99, 1),
(1645, 'Hajdu-Bihar', 99, 1),
(1646, 'Heves', 99, 1),
(1647, 'Jasz-Nagykun-Szolnok', 99, 1),
(1648, 'Komarom-Esztergom', 99, 1),
(1649, 'Nograd', 99, 1),
(1650, 'Pest', 99, 1),
(1651, 'Somogy', 99, 1),
(1652, 'Szabolcs-Szatmar-Bereg', 99, 1),
(1653, 'Tolna', 99, 1),
(1654, 'Vas', 99, 1),
(1655, 'Veszprem', 99, 1),
(1656, 'Zala', 99, 1),
(1657, 'Austurland', 100, 1),
(1658, 'Gullbringusysla', 100, 1),
(1659, 'Hofu borgarsva i', 100, 1),
(1660, 'Nor urland eystra', 100, 1),
(1661, 'Nor urland vestra', 100, 1),
(1662, 'Su urland', 100, 1),
(1663, 'Su urnes', 100, 1),
(1664, 'Vestfir ir', 100, 1),
(1665, 'Vesturland', 100, 1),
(1666, 'Aceh', 102, 1),
(1667, 'Bali', 102, 1),
(1668, 'Bangka-Belitung', 102, 1),
(1669, 'Banten', 102, 1),
(1670, 'Bengkulu', 102, 1),
(1671, 'Gandaria', 102, 1),
(1672, 'Gorontalo', 102, 1),
(1673, 'Jakarta', 102, 1),
(1674, 'Jambi', 102, 1),
(1675, 'Jawa Barat', 102, 1),
(1676, 'Jawa Tengah', 102, 1),
(1677, 'Jawa Timur', 102, 1),
(1678, 'Kalimantan Barat', 102, 1),
(1679, 'Kalimantan Selatan', 102, 1),
(1680, 'Kalimantan Tengah', 102, 1),
(1681, 'Kalimantan Timur', 102, 1),
(1682, 'Kendal', 102, 1),
(1683, 'Lampung', 102, 1),
(1684, 'Maluku', 102, 1),
(1685, 'Maluku Utara', 102, 1),
(1686, 'Nusa Tenggara Barat', 102, 1),
(1687, 'Nusa Tenggara Timur', 102, 1),
(1688, 'Papua', 102, 1),
(1689, 'Riau', 102, 1),
(1690, 'Riau Kepulauan', 102, 1),
(1691, 'Solo', 102, 1),
(1692, 'Sulawesi Selatan', 102, 1),
(1693, 'Sulawesi Tengah', 102, 1),
(1694, 'Sulawesi Tenggara', 102, 1),
(1695, 'Sulawesi Utara', 102, 1),
(1696, 'Sumatera Barat', 102, 1),
(1697, 'Sumatera Selatan', 102, 1),
(1698, 'Sumatera Utara', 102, 1),
(1699, 'Yogyakarta', 102, 1),
(1700, 'Ardabil', 103, 1),
(1701, 'Azarbayjan-e Bakhtari', 103, 1),
(1702, 'Azarbayjan-e Khavari', 103, 1),
(1703, 'Bushehr', 103, 1),
(1704, 'Chahar Mahal-e Bakhtiari', 103, 1),
(1705, 'Esfahan', 103, 1),
(1706, 'Fars', 103, 1),
(1707, 'Gilan', 103, 1),
(1708, 'Golestan', 103, 1),
(1709, 'Hamadan', 103, 1),
(1710, 'Hormozgan', 103, 1),
(1711, 'Ilam', 103, 1),
(1712, 'Kerman', 103, 1),
(1713, 'Kermanshah', 103, 1),
(1714, 'Khorasan', 103, 1),
(1715, 'Khuzestan', 103, 1),
(1716, 'Kohgiluyeh-e Boyerahmad', 103, 1),
(1717, 'Kordestan', 103, 1),
(1718, 'Lorestan', 103, 1),
(1719, 'Markazi', 103, 1),
(1720, 'Mazandaran', 103, 1),
(1721, 'Ostan-e Esfahan', 103, 1),
(1722, 'Qazvin', 103, 1),
(1723, 'Qom', 103, 1),
(1724, 'Semnan', 103, 1),
(1725, 'Sistan-e Baluchestan', 103, 1),
(1726, 'Tehran', 103, 1),
(1727, 'Yazd', 103, 1),
(1728, 'Zanjan', 103, 1),
(1729, 'Babil', 104, 1),
(1730, 'Baghdad', 104, 1),
(1731, 'Dahuk', 104, 1),
(1732, 'Dhi Qar', 104, 1),
(1733, 'Diyala', 104, 1),
(1734, 'Erbil', 104, 1),
(1735, 'Irbil', 104, 1),
(1736, 'Karbala', 104, 1),
(1737, 'Kurdistan', 104, 1),
(1738, 'Maysan', 104, 1),
(1739, 'Ninawa', 104, 1),
(1740, 'Salah-ad-Din', 104, 1),
(1741, 'Wasit', 104, 1),
(1742, 'al-Anbar', 104, 1),
(1743, 'al-Basrah', 104, 1),
(1744, 'al-Muthanna', 104, 1),
(1745, 'al-Qadisiyah', 104, 1),
(1746, 'an-Najaf', 104, 1),
(1747, 'as-Sulaymaniyah', 104, 1),
(1748, 'at-Ta\'mim', 104, 1),
(1749, 'Armagh', 105, 1),
(1750, 'Carlow', 105, 1),
(1751, 'Cavan', 105, 1),
(1752, 'Clare', 105, 1),
(1753, 'Cork', 105, 1),
(1754, 'Donegal', 105, 1),
(1755, 'Dublin', 105, 1),
(1756, 'Galway', 105, 1),
(1757, 'Kerry', 105, 1),
(1758, 'Kildare', 105, 1),
(1759, 'Kilkenny', 105, 1),
(1760, 'Laois', 105, 1),
(1761, 'Leinster', 105, 1),
(1762, 'Leitrim', 105, 1),
(1763, 'Limerick', 105, 1),
(1764, 'Loch Garman', 105, 1),
(1765, 'Longford', 105, 1),
(1766, 'Louth', 105, 1),
(1767, 'Mayo', 105, 1),
(1768, 'Meath', 105, 1),
(1769, 'Monaghan', 105, 1),
(1770, 'Offaly', 105, 1),
(1771, 'Roscommon', 105, 1),
(1772, 'Sligo', 105, 1),
(1773, 'Tipperary North Riding', 105, 1),
(1774, 'Tipperary South Riding', 105, 1),
(1775, 'Ulster', 105, 1),
(1776, 'Waterford', 105, 1),
(1777, 'Westmeath', 105, 1),
(1778, 'Wexford', 105, 1),
(1779, 'Wicklow', 105, 1),
(1780, 'Beit Hanania', 106, 1),
(1781, 'Ben Gurion Airport', 106, 1),
(1782, 'Bethlehem', 106, 1),
(1783, 'Caesarea', 106, 1),
(1784, 'Centre', 106, 1),
(1785, 'Gaza', 106, 1),
(1786, 'Hadaron', 106, 1),
(1787, 'Haifa District', 106, 1),
(1788, 'Hamerkaz', 106, 1),
(1789, 'Hazafon', 106, 1),
(1790, 'Hebron', 106, 1),
(1791, 'Jaffa', 106, 1),
(1792, 'Jerusalem', 106, 1),
(1793, 'Khefa', 106, 1),
(1794, 'Kiryat Yam', 106, 1),
(1795, 'Lower Galilee', 106, 1),
(1796, 'Qalqilya', 106, 1),
(1797, 'Talme Elazar', 106, 1),
(1798, 'Tel Aviv', 106, 1),
(1799, 'Tsafon', 106, 1),
(1800, 'Umm El Fahem', 106, 1),
(1801, 'Yerushalayim', 106, 1),
(1802, 'Abruzzi', 107, 1),
(1803, 'Abruzzo', 107, 1),
(1804, 'Agrigento', 107, 1),
(1805, 'Alessandria', 107, 1),
(1806, 'Ancona', 107, 1),
(1807, 'Arezzo', 107, 1),
(1808, 'Ascoli Piceno', 107, 1),
(1809, 'Asti', 107, 1),
(1810, 'Avellino', 107, 1),
(1811, 'Bari', 107, 1),
(1812, 'Basilicata', 107, 1),
(1813, 'Belluno', 107, 1),
(1814, 'Benevento', 107, 1),
(1815, 'Bergamo', 107, 1),
(1816, 'Biella', 107, 1),
(1817, 'Bologna', 107, 1),
(1818, 'Bolzano', 107, 1),
(1819, 'Brescia', 107, 1),
(1820, 'Brindisi', 107, 1),
(1821, 'Calabria', 107, 1),
(1822, 'Campania', 107, 1),
(1823, 'Cartoceto', 107, 1),
(1824, 'Caserta', 107, 1),
(1825, 'Catania', 107, 1),
(1826, 'Chieti', 107, 1),
(1827, 'Como', 107, 1),
(1828, 'Cosenza', 107, 1),
(1829, 'Cremona', 107, 1),
(1830, 'Cuneo', 107, 1),
(1831, 'Emilia-Romagna', 107, 1),
(1832, 'Ferrara', 107, 1),
(1833, 'Firenze', 107, 1),
(1834, 'Florence', 107, 1),
(1835, 'Forli-Cesena ', 107, 1),
(1836, 'Friuli-Venezia Giulia', 107, 1),
(1837, 'Frosinone', 107, 1),
(1838, 'Genoa', 107, 1),
(1839, 'Gorizia', 107, 1),
(1840, 'L\'Aquila', 107, 1),
(1841, 'Lazio', 107, 1),
(1842, 'Lecce', 107, 1),
(1843, 'Lecco', 107, 1),
(1845, 'Liguria', 107, 1),
(1846, 'Lodi', 107, 1),
(1847, 'Lombardia', 107, 1),
(1848, 'Lombardy', 107, 1),
(1849, 'Macerata', 107, 1),
(1850, 'Mantova', 107, 1),
(1851, 'Marche', 107, 1),
(1852, 'Messina', 107, 1),
(1853, 'Milan', 107, 1),
(1854, 'Modena', 107, 1),
(1855, 'Molise', 107, 1),
(1856, 'Molteno', 107, 1),
(1857, 'Montenegro', 107, 1),
(1858, 'Monza and Brianza', 107, 1),
(1859, 'Naples', 107, 1),
(1860, 'Novara', 107, 1),
(1861, 'Padova', 107, 1),
(1862, 'Parma', 107, 1),
(1863, 'Pavia', 107, 1),
(1864, 'Perugia', 107, 1),
(1865, 'Pesaro-Urbino', 107, 1),
(1866, 'Piacenza', 107, 1),
(1867, 'Piedmont', 107, 1),
(1868, 'Piemonte', 107, 1),
(1869, 'Pisa', 107, 1),
(1870, 'Pordenone', 107, 1),
(1871, 'Potenza', 107, 1),
(1872, 'Puglia', 107, 1),
(1873, 'Reggio Emilia', 107, 1),
(1874, 'Rimini', 107, 1),
(1875, 'Roma', 107, 1),
(1876, 'Salerno', 107, 1),
(1877, 'Sardegna', 107, 1),
(1878, 'Sassari', 107, 1),
(1879, 'Savona', 107, 1),
(1880, 'Sicilia', 107, 1),
(1881, 'Siena', 107, 1),
(1882, 'Sondrio', 107, 1),
(1883, 'South Tyrol', 107, 1),
(1884, 'Taranto', 107, 1),
(1885, 'Teramo', 107, 1),
(1886, 'Torino', 107, 1),
(1887, 'Toscana', 107, 1),
(1888, 'Trapani', 107, 1),
(1889, 'Trentino-Alto Adige', 107, 1),
(1890, 'Trento', 107, 1),
(1891, 'Treviso', 107, 1),
(1892, 'Udine', 107, 1),
(1893, 'Umbria', 107, 1),
(1894, 'Valle d\'Aosta', 107, 1),
(1895, 'Varese', 107, 1),
(1896, 'Veneto', 107, 1),
(1897, 'Venezia', 107, 1),
(1898, 'Verbano-Cusio-Ossola', 107, 1),
(1899, 'Vercelli', 107, 1),
(1900, 'Verona', 107, 1),
(1901, 'Vicenza', 107, 1),
(1902, 'Viterbo', 107, 1),
(1903, 'Buxoro Viloyati', 108, 1),
(1904, 'Clarendon', 108, 1),
(1905, 'Hanover', 108, 1),
(1906, 'Kingston', 108, 1),
(1907, 'Manchester', 108, 1),
(1908, 'Portland', 108, 1),
(1909, 'Saint Andrews', 108, 1),
(1910, 'Saint Ann', 108, 1),
(1911, 'Saint Catherine', 108, 1),
(1912, 'Saint Elizabeth', 108, 1),
(1913, 'Saint James', 108, 1),
(1914, 'Saint Mary', 108, 1),
(1915, 'Saint Thomas', 108, 1),
(1916, 'Trelawney', 108, 1),
(1917, 'Westmoreland', 108, 1),
(1918, 'Aichi', 109, 1),
(1919, 'Akita', 109, 1),
(1920, 'Aomori', 109, 1),
(1921, 'Chiba', 109, 1),
(1922, 'Ehime', 109, 1),
(1923, 'Fukui', 109, 1),
(1924, 'Fukuoka', 109, 1),
(1925, 'Fukushima', 109, 1),
(1926, 'Gifu', 109, 1),
(1927, 'Gumma', 109, 1),
(1928, 'Hiroshima', 109, 1),
(1929, 'Hokkaido', 109, 1),
(1930, 'Hyogo', 109, 1),
(1931, 'Ibaraki', 109, 1),
(1932, 'Ishikawa', 109, 1),
(1933, 'Iwate', 109, 1),
(1934, 'Kagawa', 109, 1),
(1935, 'Kagoshima', 109, 1),
(1936, 'Kanagawa', 109, 1),
(1937, 'Kanto', 109, 1),
(1938, 'Kochi', 109, 1),
(1939, 'Kumamoto', 109, 1),
(1940, 'Kyoto', 109, 1),
(1941, 'Mie', 109, 1),
(1942, 'Miyagi', 109, 1),
(1943, 'Miyazaki', 109, 1),
(1944, 'Nagano', 109, 1),
(1945, 'Nagasaki', 109, 1),
(1946, 'Nara', 109, 1);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`) VALUES
(1947, 'Niigata', 109, 1),
(1948, 'Oita', 109, 1),
(1949, 'Okayama', 109, 1),
(1950, 'Okinawa', 109, 1),
(1951, 'Osaka', 109, 1),
(1952, 'Saga', 109, 1),
(1953, 'Saitama', 109, 1),
(1954, 'Shiga', 109, 1),
(1955, 'Shimane', 109, 1),
(1956, 'Shizuoka', 109, 1),
(1957, 'Tochigi', 109, 1),
(1958, 'Tokushima', 109, 1),
(1959, 'Tokyo', 109, 1),
(1960, 'Tottori', 109, 1),
(1961, 'Toyama', 109, 1),
(1962, 'Wakayama', 109, 1),
(1963, 'Yamagata', 109, 1),
(1964, 'Yamaguchi', 109, 1),
(1965, 'Yamanashi', 109, 1),
(1966, 'Grouville', 110, 1),
(1967, 'Saint Brelade', 110, 1),
(1968, 'Saint Clement', 110, 1),
(1969, 'Saint Helier', 110, 1),
(1970, 'Saint John', 110, 1),
(1971, 'Saint Lawrence', 110, 1),
(1972, 'Saint Martin', 110, 1),
(1973, 'Saint Mary', 110, 1),
(1974, 'Saint Peter', 110, 1),
(1975, 'Saint Saviour', 110, 1),
(1976, 'Trinity', 110, 1),
(1977, '\'Ajlun', 111, 1),
(1978, 'Amman', 111, 1),
(1979, 'Irbid', 111, 1),
(1980, 'Jarash', 111, 1),
(1981, 'Ma\'an', 111, 1),
(1982, 'Madaba', 111, 1),
(1983, 'al-\'Aqabah', 111, 1),
(1984, 'al-Balqa\'', 111, 1),
(1985, 'al-Karak', 111, 1),
(1986, 'al-Mafraq', 111, 1),
(1987, 'at-Tafilah', 111, 1),
(1988, 'az-Zarqa\'', 111, 1),
(1989, 'Akmecet', 112, 1),
(1990, 'Akmola', 112, 1),
(1991, 'Aktobe', 112, 1),
(1992, 'Almati', 112, 1),
(1993, 'Atirau', 112, 1),
(1994, 'Batis Kazakstan', 112, 1),
(1995, 'Burlinsky Region', 112, 1),
(1996, 'Karagandi', 112, 1),
(1997, 'Kostanay', 112, 1),
(1998, 'Mankistau', 112, 1),
(1999, 'Ontustik Kazakstan', 112, 1),
(2000, 'Pavlodar', 112, 1),
(2001, 'Sigis Kazakstan', 112, 1),
(2002, 'Soltustik Kazakstan', 112, 1),
(2003, 'Taraz', 112, 1),
(2004, 'Central', 113, 1),
(2005, 'Coast', 113, 1),
(2006, 'Eastern', 113, 1),
(2007, 'Nairobi', 113, 1),
(2008, 'North Eastern', 113, 1),
(2009, 'Nyanza', 113, 1),
(2010, 'Rift Valley', 113, 1),
(2011, 'Western', 113, 1),
(2012, 'Abaiang', 114, 1),
(2013, 'Abemana', 114, 1),
(2014, 'Aranuka', 114, 1),
(2015, 'Arorae', 114, 1),
(2016, 'Banaba', 114, 1),
(2017, 'Beru', 114, 1),
(2018, 'Butaritari', 114, 1),
(2019, 'Kiritimati', 114, 1),
(2020, 'Kuria', 114, 1),
(2021, 'Maiana', 114, 1),
(2022, 'Makin', 114, 1),
(2023, 'Marakei', 114, 1),
(2024, 'Nikunau', 114, 1),
(2025, 'Nonouti', 114, 1),
(2026, 'Onotoa', 114, 1),
(2027, 'Phoenix Islands', 114, 1),
(2028, 'Tabiteuea North', 114, 1),
(2029, 'Tabiteuea South', 114, 1),
(2030, 'Tabuaeran', 114, 1),
(2031, 'Tamana', 114, 1),
(2032, 'Tarawa North', 114, 1),
(2033, 'Tarawa South', 114, 1),
(2034, 'Teraina', 114, 1),
(2035, 'Chagangdo', 115, 1),
(2036, 'Hamgyeongbukto', 115, 1),
(2037, 'Hamgyeongnamdo', 115, 1),
(2038, 'Hwanghaebukto', 115, 1),
(2039, 'Hwanghaenamdo', 115, 1),
(2040, 'Kaeseong', 115, 1),
(2041, 'Kangweon', 115, 1),
(2042, 'Nampo', 115, 1),
(2043, 'Pyeonganbukto', 115, 1),
(2044, 'Pyeongannamdo', 115, 1),
(2045, 'Pyeongyang', 115, 1),
(2046, 'Yanggang', 115, 1),
(2047, 'Busan', 116, 1),
(2048, 'Cheju', 116, 1),
(2049, 'Chollabuk', 116, 1),
(2050, 'Chollanam', 116, 1),
(2051, 'Chungbuk', 116, 1),
(2052, 'Chungcheongbuk', 116, 1),
(2053, 'Chungcheongnam', 116, 1),
(2054, 'Chungnam', 116, 1),
(2055, 'Daegu', 116, 1),
(2056, 'Gangwon-do', 116, 1),
(2057, 'Goyang-si', 116, 1),
(2058, 'Gyeonggi-do', 116, 1),
(2059, 'Gyeongsang ', 116, 1),
(2060, 'Gyeongsangnam-do', 116, 1),
(2061, 'Incheon', 116, 1),
(2062, 'Jeju-Si', 116, 1),
(2063, 'Jeonbuk', 116, 1),
(2064, 'Kangweon', 116, 1),
(2065, 'Kwangju', 116, 1),
(2066, 'Kyeonggi', 116, 1),
(2067, 'Kyeongsangbuk', 116, 1),
(2068, 'Kyeongsangnam', 116, 1),
(2069, 'Kyonggi-do', 116, 1),
(2070, 'Kyungbuk-Do', 116, 1),
(2071, 'Kyunggi-Do', 116, 1),
(2072, 'Kyunggi-do', 116, 1),
(2073, 'Pusan', 116, 1),
(2074, 'Seoul', 116, 1),
(2075, 'Sudogwon', 116, 1),
(2076, 'Taegu', 116, 1),
(2077, 'Taejeon', 116, 1),
(2078, 'Taejon-gwangyoksi', 116, 1),
(2079, 'Ulsan', 116, 1),
(2080, 'Wonju', 116, 1),
(2081, 'gwangyoksi', 116, 1),
(2082, 'Al Asimah', 117, 1),
(2083, 'Hawalli', 117, 1),
(2084, 'Mishref', 117, 1),
(2085, 'Qadesiya', 117, 1),
(2086, 'Safat', 117, 1),
(2087, 'Salmiya', 117, 1),
(2088, 'al-Ahmadi', 117, 1),
(2089, 'al-Farwaniyah', 117, 1),
(2090, 'al-Jahra', 117, 1),
(2091, 'al-Kuwayt', 117, 1),
(2092, 'Batken', 118, 1),
(2093, 'Bishkek', 118, 1),
(2094, 'Chui', 118, 1),
(2095, 'Issyk-Kul', 118, 1),
(2096, 'Jalal-Abad', 118, 1),
(2097, 'Naryn', 118, 1),
(2098, 'Osh', 118, 1),
(2099, 'Talas', 118, 1),
(2100, 'Attopu', 119, 1),
(2101, 'Bokeo', 119, 1),
(2102, 'Bolikhamsay', 119, 1),
(2103, 'Champasak', 119, 1),
(2104, 'Houaphanh', 119, 1),
(2105, 'Khammouane', 119, 1),
(2106, 'Luang Nam Tha', 119, 1),
(2107, 'Luang Prabang', 119, 1),
(2108, 'Oudomxay', 119, 1),
(2109, 'Phongsaly', 119, 1),
(2110, 'Saravan', 119, 1),
(2111, 'Savannakhet', 119, 1),
(2112, 'Sekong', 119, 1),
(2113, 'Viangchan Prefecture', 119, 1),
(2114, 'Viangchan Province', 119, 1),
(2115, 'Xaignabury', 119, 1),
(2116, 'Xiang Khuang', 119, 1),
(2117, 'Aizkraukles', 120, 1),
(2118, 'Aluksnes', 120, 1),
(2119, 'Balvu', 120, 1),
(2120, 'Bauskas', 120, 1),
(2121, 'Cesu', 120, 1),
(2122, 'Daugavpils', 120, 1),
(2123, 'Daugavpils City', 120, 1),
(2124, 'Dobeles', 120, 1),
(2125, 'Gulbenes', 120, 1),
(2126, 'Jekabspils', 120, 1),
(2127, 'Jelgava', 120, 1),
(2128, 'Jelgavas', 120, 1),
(2129, 'Jurmala City', 120, 1),
(2130, 'Kraslavas', 120, 1),
(2131, 'Kuldigas', 120, 1),
(2132, 'Liepaja', 120, 1),
(2133, 'Liepajas', 120, 1),
(2134, 'Limbazhu', 120, 1),
(2135, 'Ludzas', 120, 1),
(2136, 'Madonas', 120, 1),
(2137, 'Ogres', 120, 1),
(2138, 'Preilu', 120, 1),
(2139, 'Rezekne', 120, 1),
(2140, 'Rezeknes', 120, 1),
(2141, 'Riga', 120, 1),
(2142, 'Rigas', 120, 1),
(2143, 'Saldus', 120, 1),
(2144, 'Talsu', 120, 1),
(2145, 'Tukuma', 120, 1),
(2146, 'Valkas', 120, 1),
(2147, 'Valmieras', 120, 1),
(2148, 'Ventspils', 120, 1),
(2149, 'Ventspils City', 120, 1),
(2150, 'Beirut', 121, 1),
(2151, 'Jabal Lubnan', 121, 1),
(2152, 'Mohafazat Liban-Nord', 121, 1),
(2153, 'Mohafazat Mont-Liban', 121, 1),
(2154, 'Sidon', 121, 1),
(2155, 'al-Biqa', 121, 1),
(2156, 'al-Janub', 121, 1),
(2157, 'an-Nabatiyah', 121, 1),
(2158, 'ash-Shamal', 121, 1),
(2159, 'Berea', 122, 1),
(2160, 'Butha-Buthe', 122, 1),
(2161, 'Leribe', 122, 1),
(2162, 'Mafeteng', 122, 1),
(2163, 'Maseru', 122, 1),
(2164, 'Mohale\'s Hoek', 122, 1),
(2165, 'Mokhotlong', 122, 1),
(2166, 'Qacha\'s Nek', 122, 1),
(2167, 'Quthing', 122, 1),
(2168, 'Thaba-Tseka', 122, 1),
(2169, 'Bomi', 123, 1),
(2170, 'Bong', 123, 1),
(2171, 'Grand Bassa', 123, 1),
(2172, 'Grand Cape Mount', 123, 1),
(2173, 'Grand Gedeh', 123, 1),
(2174, 'Loffa', 123, 1),
(2175, 'Margibi', 123, 1),
(2176, 'Maryland and Grand Kru', 123, 1),
(2177, 'Montserrado', 123, 1),
(2178, 'Nimba', 123, 1),
(2179, 'Rivercess', 123, 1),
(2180, 'Sinoe', 123, 1),
(2181, 'Ajdabiya', 124, 1),
(2182, 'Fezzan', 124, 1),
(2183, 'Banghazi', 124, 1),
(2184, 'Darnah', 124, 1),
(2185, 'Ghadamis', 124, 1),
(2186, 'Gharyan', 124, 1),
(2187, 'Misratah', 124, 1),
(2188, 'Murzuq', 124, 1),
(2189, 'Sabha', 124, 1),
(2190, 'Sawfajjin', 124, 1),
(2191, 'Surt', 124, 1),
(2192, 'Tarabulus', 124, 1),
(2193, 'Tarhunah', 124, 1),
(2194, 'Tripolitania', 124, 1),
(2195, 'Tubruq', 124, 1),
(2196, 'Yafran', 124, 1),
(2197, 'Zlitan', 124, 1),
(2198, 'al-\'Aziziyah', 124, 1),
(2199, 'al-Fatih', 124, 1),
(2200, 'al-Jabal al Akhdar', 124, 1),
(2201, 'al-Jufrah', 124, 1),
(2202, 'al-Khums', 124, 1),
(2203, 'al-Kufrah', 124, 1),
(2204, 'an-Nuqat al-Khams', 124, 1),
(2205, 'ash-Shati\'', 124, 1),
(2206, 'az-Zawiyah', 124, 1),
(2207, 'Balzers', 125, 1),
(2208, 'Eschen', 125, 1),
(2209, 'Gamprin', 125, 1),
(2210, 'Mauren', 125, 1),
(2211, 'Planken', 125, 1),
(2212, 'Ruggell', 125, 1),
(2213, 'Schaan', 125, 1),
(2214, 'Schellenberg', 125, 1),
(2215, 'Triesen', 125, 1),
(2216, 'Triesenberg', 125, 1),
(2217, 'Vaduz', 125, 1),
(2218, 'Alytaus', 126, 1),
(2219, 'Anyksciai', 126, 1),
(2220, 'Kauno', 126, 1),
(2221, 'Klaipedos', 126, 1),
(2222, 'Marijampoles', 126, 1),
(2223, 'Panevezhio', 126, 1),
(2224, 'Panevezys', 126, 1),
(2225, 'Shiauliu', 126, 1),
(2226, 'Taurages', 126, 1),
(2227, 'Telshiu', 126, 1),
(2228, 'Telsiai', 126, 1),
(2229, 'Utenos', 126, 1),
(2230, 'Vilniaus', 126, 1),
(2231, 'Capellen', 127, 1),
(2232, 'Clervaux', 127, 1),
(2233, 'Diekirch', 127, 1),
(2234, 'Echternach', 127, 1),
(2235, 'Esch-sur-Alzette', 127, 1),
(2236, 'Grevenmacher', 127, 1),
(2237, 'Luxembourg', 127, 1),
(2238, 'Mersch', 127, 1),
(2239, 'Redange', 127, 1),
(2240, 'Remich', 127, 1),
(2241, 'Vianden', 127, 1),
(2242, 'Wiltz', 127, 1),
(2243, 'Macau', 128, 1),
(2244, 'Berovo', 129, 1),
(2245, 'Bitola', 129, 1),
(2246, 'Brod', 129, 1),
(2247, 'Debar', 129, 1),
(2248, 'Delchevo', 129, 1),
(2249, 'Demir Hisar', 129, 1),
(2250, 'Gevgelija', 129, 1),
(2251, 'Gostivar', 129, 1),
(2252, 'Kavadarci', 129, 1),
(2253, 'Kichevo', 129, 1),
(2254, 'Kochani', 129, 1),
(2255, 'Kratovo', 129, 1),
(2256, 'Kriva Palanka', 129, 1),
(2257, 'Krushevo', 129, 1),
(2258, 'Kumanovo', 129, 1),
(2259, 'Negotino', 129, 1),
(2260, 'Ohrid', 129, 1),
(2261, 'Prilep', 129, 1),
(2262, 'Probishtip', 129, 1),
(2263, 'Radovish', 129, 1),
(2264, 'Resen', 129, 1),
(2265, 'Shtip', 129, 1),
(2266, 'Skopje', 129, 1),
(2267, 'Struga', 129, 1),
(2268, 'Strumica', 129, 1),
(2269, 'Sveti Nikole', 129, 1),
(2270, 'Tetovo', 129, 1),
(2271, 'Valandovo', 129, 1),
(2272, 'Veles', 129, 1),
(2273, 'Vinica', 129, 1),
(2274, 'Antananarivo', 130, 1),
(2275, 'Antsiranana', 130, 1),
(2276, 'Fianarantsoa', 130, 1),
(2277, 'Mahajanga', 130, 1),
(2278, 'Toamasina', 130, 1),
(2279, 'Toliary', 130, 1),
(2280, 'Balaka', 131, 1),
(2281, 'Blantyre City', 131, 1),
(2282, 'Chikwawa', 131, 1),
(2283, 'Chiradzulu', 131, 1),
(2284, 'Chitipa', 131, 1),
(2285, 'Dedza', 131, 1),
(2286, 'Dowa', 131, 1),
(2287, 'Karonga', 131, 1),
(2288, 'Kasungu', 131, 1),
(2289, 'Lilongwe City', 131, 1),
(2290, 'Machinga', 131, 1),
(2291, 'Mangochi', 131, 1),
(2292, 'Mchinji', 131, 1),
(2293, 'Mulanje', 131, 1),
(2294, 'Mwanza', 131, 1),
(2295, 'Mzimba', 131, 1),
(2296, 'Mzuzu City', 131, 1),
(2297, 'Nkhata Bay', 131, 1),
(2298, 'Nkhotakota', 131, 1),
(2299, 'Nsanje', 131, 1),
(2300, 'Ntcheu', 131, 1),
(2301, 'Ntchisi', 131, 1),
(2302, 'Phalombe', 131, 1),
(2303, 'Rumphi', 131, 1),
(2304, 'Salima', 131, 1),
(2305, 'Thyolo', 131, 1),
(2306, 'Zomba Municipality', 131, 1),
(2307, 'Johor', 132, 1),
(2308, 'Kedah', 132, 1),
(2309, 'Kelantan', 132, 1),
(2310, 'Kuala Lumpur', 132, 1),
(2311, 'Labuan', 132, 1),
(2312, 'Melaka', 132, 1),
(2313, 'Negeri Johor', 132, 1),
(2314, 'Negeri Sembilan', 132, 1),
(2315, 'Pahang', 132, 1),
(2316, 'Penang', 132, 1),
(2317, 'Perak', 132, 1),
(2318, 'Perlis', 132, 1),
(2319, 'Pulau Pinang', 132, 1),
(2320, 'Sabah', 132, 1),
(2321, 'Sarawak', 132, 1),
(2322, 'Selangor', 132, 1),
(2323, 'Sembilan', 132, 1),
(2324, 'Terengganu', 132, 1),
(2325, 'Alif Alif', 133, 1),
(2326, 'Alif Dhaal', 133, 1),
(2327, 'Baa', 133, 1),
(2328, 'Dhaal', 133, 1),
(2329, 'Faaf', 133, 1),
(2330, 'Gaaf Alif', 133, 1),
(2331, 'Gaaf Dhaal', 133, 1),
(2332, 'Ghaviyani', 133, 1),
(2333, 'Haa Alif', 133, 1),
(2334, 'Haa Dhaal', 133, 1),
(2335, 'Kaaf', 133, 1),
(2336, 'Laam', 133, 1),
(2337, 'Lhaviyani', 133, 1),
(2338, 'Male', 133, 1),
(2339, 'Miim', 133, 1),
(2340, 'Nuun', 133, 1),
(2341, 'Raa', 133, 1),
(2342, 'Shaviyani', 133, 1),
(2343, 'Siin', 133, 1),
(2344, 'Thaa', 133, 1),
(2345, 'Vaav', 133, 1),
(2346, 'Bamako', 134, 1),
(2347, 'Gao', 134, 1),
(2348, 'Kayes', 134, 1),
(2349, 'Kidal', 134, 1),
(2350, 'Koulikoro', 134, 1),
(2351, 'Mopti', 134, 1),
(2352, 'Segou', 134, 1),
(2353, 'Sikasso', 134, 1),
(2354, 'Tombouctou', 134, 1),
(2355, 'Gozo and Comino', 135, 1),
(2356, 'Inner Harbour', 135, 1),
(2357, 'Northern', 135, 1),
(2358, 'Outer Harbour', 135, 1),
(2359, 'South Eastern', 135, 1),
(2360, 'Valletta', 135, 1),
(2361, 'Western', 135, 1),
(2362, 'Castletown', 136, 1),
(2363, 'Douglas', 136, 1),
(2364, 'Laxey', 136, 1),
(2365, 'Onchan', 136, 1),
(2366, 'Peel', 136, 1),
(2367, 'Port Erin', 136, 1),
(2368, 'Port Saint Mary', 136, 1),
(2369, 'Ramsey', 136, 1),
(2370, 'Ailinlaplap', 137, 1),
(2371, 'Ailuk', 137, 1),
(2372, 'Arno', 137, 1),
(2373, 'Aur', 137, 1),
(2374, 'Bikini', 137, 1),
(2375, 'Ebon', 137, 1),
(2376, 'Enewetak', 137, 1),
(2377, 'Jabat', 137, 1),
(2378, 'Jaluit', 137, 1),
(2379, 'Kili', 137, 1),
(2380, 'Kwajalein', 137, 1),
(2381, 'Lae', 137, 1),
(2382, 'Lib', 137, 1),
(2383, 'Likiep', 137, 1),
(2384, 'Majuro', 137, 1),
(2385, 'Maloelap', 137, 1),
(2386, 'Mejit', 137, 1),
(2387, 'Mili', 137, 1),
(2388, 'Namorik', 137, 1),
(2389, 'Namu', 137, 1),
(2390, 'Rongelap', 137, 1),
(2391, 'Ujae', 137, 1),
(2392, 'Utrik', 137, 1),
(2393, 'Wotho', 137, 1),
(2394, 'Wotje', 137, 1),
(2395, 'Fort-de-France', 138, 1),
(2396, 'La Trinite', 138, 1),
(2397, 'Le Marin', 138, 1),
(2398, 'Saint-Pierre', 138, 1),
(2399, 'Adrar', 139, 1),
(2400, 'Assaba', 139, 1),
(2401, 'Brakna', 139, 1),
(2402, 'Dhakhlat Nawadibu', 139, 1),
(2403, 'Hudh-al-Gharbi', 139, 1),
(2404, 'Hudh-ash-Sharqi', 139, 1),
(2405, 'Inshiri', 139, 1),
(2406, 'Nawakshut', 139, 1),
(2407, 'Qidimagha', 139, 1),
(2408, 'Qurqul', 139, 1),
(2409, 'Taqant', 139, 1),
(2410, 'Tiris Zammur', 139, 1),
(2411, 'Trarza', 139, 1),
(2412, 'Black River', 140, 1),
(2413, 'Eau Coulee', 140, 1),
(2414, 'Flacq', 140, 1),
(2415, 'Floreal', 140, 1),
(2416, 'Grand Port', 140, 1),
(2417, 'Moka', 140, 1),
(2418, 'Pamplempousses', 140, 1),
(2419, 'Plaines Wilhelm', 140, 1),
(2420, 'Port Louis', 140, 1),
(2421, 'Riviere du Rempart', 140, 1),
(2422, 'Rodrigues', 140, 1),
(2423, 'Rose Hill', 140, 1),
(2424, 'Savanne', 140, 1),
(2425, 'Mayotte', 141, 1),
(2426, 'Pamanzi', 141, 1),
(2427, 'Aguascalientes', 142, 1),
(2428, 'Baja California', 142, 1),
(2429, 'Baja California Sur', 142, 1),
(2430, 'Campeche', 142, 1),
(2431, 'Chiapas', 142, 1),
(2432, 'Chihuahua', 142, 1),
(2433, 'Coahuila', 142, 1),
(2434, 'Colima', 142, 1),
(2435, 'Distrito Federal', 142, 1),
(2436, 'Durango', 142, 1),
(2437, 'Estado de Mexico', 142, 1),
(2438, 'Guanajuato', 142, 1),
(2439, 'Guerrero', 142, 1),
(2440, 'Hidalgo', 142, 1),
(2441, 'Jalisco', 142, 1),
(2442, 'Mexico', 142, 1),
(2443, 'Michoacan', 142, 1),
(2444, 'Morelos', 142, 1),
(2445, 'Nayarit', 142, 1),
(2446, 'Nuevo Leon', 142, 1),
(2447, 'Oaxaca', 142, 1),
(2448, 'Puebla', 142, 1),
(2449, 'Queretaro', 142, 1),
(2450, 'Quintana Roo', 142, 1),
(2451, 'San Luis Potosi', 142, 1),
(2452, 'Sinaloa', 142, 1),
(2453, 'Sonora', 142, 1),
(2454, 'Tabasco', 142, 1),
(2455, 'Tamaulipas', 142, 1),
(2456, 'Tlaxcala', 142, 1),
(2457, 'Veracruz', 142, 1),
(2458, 'Yucatan', 142, 1),
(2459, 'Zacatecas', 142, 1),
(2460, 'Chuuk', 143, 1),
(2461, 'Kusaie', 143, 1),
(2462, 'Pohnpei', 143, 1),
(2463, 'Yap', 143, 1),
(2464, 'Balti', 144, 1),
(2465, 'Cahul', 144, 1),
(2466, 'Chisinau', 144, 1),
(2467, 'Chisinau Oras', 144, 1),
(2468, 'Edinet', 144, 1),
(2469, 'Gagauzia', 144, 1),
(2470, 'Lapusna', 144, 1),
(2471, 'Orhei', 144, 1),
(2472, 'Soroca', 144, 1),
(2473, 'Taraclia', 144, 1),
(2474, 'Tighina', 144, 1),
(2475, 'Transnistria', 144, 1),
(2476, 'Ungheni', 144, 1),
(2477, 'Fontvieille', 145, 1),
(2478, 'La Condamine', 145, 1),
(2479, 'Monaco-Ville', 145, 1),
(2480, 'Monte Carlo', 145, 1),
(2481, 'Arhangaj', 146, 1),
(2482, 'Bajan-Olgij', 146, 1),
(2483, 'Bajanhongor', 146, 1),
(2484, 'Bulgan', 146, 1),
(2485, 'Darhan-Uul', 146, 1),
(2486, 'Dornod', 146, 1),
(2487, 'Dornogovi', 146, 1),
(2488, 'Dundgovi', 146, 1),
(2489, 'Govi-Altaj', 146, 1),
(2490, 'Govisumber', 146, 1),
(2491, 'Hentij', 146, 1),
(2492, 'Hovd', 146, 1),
(2493, 'Hovsgol', 146, 1),
(2494, 'Omnogovi', 146, 1),
(2495, 'Orhon', 146, 1),
(2496, 'Ovorhangaj', 146, 1),
(2497, 'Selenge', 146, 1),
(2498, 'Suhbaatar', 146, 1),
(2499, 'Tov', 146, 1),
(2500, 'Ulaanbaatar', 146, 1),
(2501, 'Uvs', 146, 1),
(2502, 'Zavhan', 146, 1),
(2503, 'Montserrat', 147, 1),
(2504, 'Agadir', 148, 1),
(2505, 'Casablanca', 148, 1),
(2506, 'Chaouia-Ouardigha', 148, 1),
(2507, 'Doukkala-Abda', 148, 1),
(2508, 'Fes-Boulemane', 148, 1),
(2509, 'Gharb-Chrarda-Beni Hssen', 148, 1),
(2510, 'Guelmim', 148, 1),
(2511, 'Kenitra', 148, 1),
(2512, 'Marrakech-Tensift-Al Haouz', 148, 1),
(2513, 'Meknes-Tafilalet', 148, 1),
(2514, 'Oriental', 148, 1),
(2515, 'Oujda', 148, 1),
(2516, 'Province de Tanger', 148, 1),
(2517, 'Rabat-Sale-Zammour-Zaer', 148, 1),
(2518, 'Sala Al Jadida', 148, 1),
(2519, 'Settat', 148, 1),
(2520, 'Souss Massa-Draa', 148, 1),
(2521, 'Tadla-Azilal', 148, 1),
(2522, 'Tangier-Tetouan', 148, 1),
(2523, 'Taza-Al Hoceima-Taounate', 148, 1),
(2524, 'Wilaya de Casablanca', 148, 1),
(2525, 'Wilaya de Rabat-Sale', 148, 1),
(2526, 'Cabo Delgado', 149, 1),
(2527, 'Gaza', 149, 1),
(2528, 'Inhambane', 149, 1),
(2529, 'Manica', 149, 1),
(2530, 'Maputo', 149, 1),
(2531, 'Maputo Provincia', 149, 1),
(2532, 'Nampula', 149, 1),
(2533, 'Niassa', 149, 1),
(2534, 'Sofala', 149, 1),
(2535, 'Tete', 149, 1),
(2536, 'Zambezia', 149, 1),
(2537, 'Ayeyarwady', 150, 1),
(2538, 'Bago', 150, 1),
(2539, 'Chin', 150, 1),
(2540, 'Kachin', 150, 1),
(2541, 'Kayah', 150, 1),
(2542, 'Kayin', 150, 1),
(2543, 'Magway', 150, 1),
(2544, 'Mandalay', 150, 1),
(2545, 'Mon', 150, 1),
(2546, 'Nay Pyi Taw', 150, 1),
(2547, 'Rakhine', 150, 1),
(2548, 'Sagaing', 150, 1),
(2549, 'Shan', 150, 1),
(2550, 'Tanintharyi', 150, 1),
(2551, 'Yangon', 150, 1),
(2552, 'Caprivi', 151, 1),
(2553, 'Erongo', 151, 1),
(2554, 'Hardap', 151, 1),
(2555, 'Karas', 151, 1),
(2556, 'Kavango', 151, 1),
(2557, 'Khomas', 151, 1),
(2558, 'Kunene', 151, 1),
(2559, 'Ohangwena', 151, 1),
(2560, 'Omaheke', 151, 1),
(2561, 'Omusati', 151, 1),
(2562, 'Oshana', 151, 1),
(2563, 'Oshikoto', 151, 1),
(2564, 'Otjozondjupa', 151, 1),
(2565, 'Yaren', 152, 1),
(2566, 'Bagmati', 153, 1),
(2567, 'Bheri', 153, 1),
(2568, 'Dhawalagiri', 153, 1),
(2569, 'Gandaki', 153, 1),
(2570, 'Janakpur', 153, 1),
(2571, 'Karnali', 153, 1),
(2572, 'Koshi', 153, 1),
(2573, 'Lumbini', 153, 1),
(2574, 'Mahakali', 153, 1),
(2575, 'Mechi', 153, 1),
(2576, 'Narayani', 153, 1),
(2577, 'Rapti', 153, 1),
(2578, 'Sagarmatha', 153, 1),
(2579, 'Seti', 153, 1),
(2580, 'Bonaire', 154, 1),
(2581, 'Curacao', 154, 1),
(2582, 'Saba', 154, 1),
(2583, 'Sint Eustatius', 154, 1),
(2584, 'Sint Maarten', 154, 1),
(2585, 'Amsterdam', 155, 1),
(2586, 'Benelux', 155, 1),
(2587, 'Drenthe', 155, 1),
(2588, 'Flevoland', 155, 1),
(2589, 'Friesland', 155, 1),
(2590, 'Gelderland', 155, 1),
(2591, 'Groningen', 155, 1),
(2592, 'Limburg', 155, 1),
(2593, 'Noord-Brabant', 155, 1),
(2594, 'Noord-Holland', 155, 1),
(2595, 'Overijssel', 155, 1),
(2596, 'South Holland', 155, 1),
(2597, 'Utrecht', 155, 1),
(2598, 'Zeeland', 155, 1),
(2599, 'Zuid-Holland', 155, 1),
(2600, 'Iles', 156, 1),
(2601, 'Nord', 156, 1),
(2602, 'Sud', 156, 1),
(2603, 'Area Outside Region', 157, 1),
(2604, 'Auckland', 157, 1),
(2605, 'Bay of Plenty', 157, 1),
(2606, 'Canterbury', 157, 1),
(2607, 'Christchurch', 157, 1),
(2608, 'Gisborne', 157, 1),
(2609, 'Hawke\'s Bay', 157, 1),
(2610, 'Manawatu-Wanganui', 157, 1),
(2611, 'Marlborough', 157, 1),
(2612, 'Nelson', 157, 1),
(2613, 'Northland', 157, 1),
(2614, 'Otago', 157, 1),
(2615, 'Rodney', 157, 1),
(2616, 'Southland', 157, 1),
(2617, 'Taranaki', 157, 1),
(2618, 'Tasman', 157, 1),
(2619, 'Waikato', 157, 1),
(2620, 'Wellington', 157, 1),
(2621, 'West Coast', 157, 1),
(2622, 'Atlantico Norte', 158, 1),
(2623, 'Atlantico Sur', 158, 1),
(2624, 'Boaco', 158, 1),
(2625, 'Carazo', 158, 1),
(2626, 'Chinandega', 158, 1),
(2627, 'Chontales', 158, 1),
(2628, 'Esteli', 158, 1),
(2629, 'Granada', 158, 1),
(2630, 'Jinotega', 158, 1),
(2631, 'Leon', 158, 1),
(2632, 'Madriz', 158, 1),
(2633, 'Managua', 158, 1),
(2634, 'Masaya', 158, 1),
(2635, 'Matagalpa', 158, 1),
(2636, 'Nueva Segovia', 158, 1),
(2637, 'Rio San Juan', 158, 1),
(2638, 'Rivas', 158, 1),
(2639, 'Agadez', 159, 1),
(2640, 'Diffa', 159, 1),
(2641, 'Dosso', 159, 1),
(2642, 'Maradi', 159, 1),
(2643, 'Niamey', 159, 1),
(2644, 'Tahoua', 159, 1),
(2645, 'Tillabery', 159, 1),
(2646, 'Zinder', 159, 1),
(2647, 'Abia', 160, 1),
(2648, 'Abuja Federal Capital Territor', 160, 1),
(2649, 'Adamawa', 160, 1),
(2650, 'Akwa Ibom', 160, 1),
(2651, 'Anambra', 160, 1),
(2652, 'Bauchi', 160, 1),
(2653, 'Bayelsa', 160, 1),
(2654, 'Benue', 160, 1),
(2655, 'Borno', 160, 1),
(2656, 'Cross River', 160, 1),
(2657, 'Delta', 160, 1),
(2658, 'Ebonyi', 160, 1),
(2659, 'Edo', 160, 1),
(2660, 'Ekiti', 160, 1),
(2661, 'Enugu', 160, 1),
(2662, 'Gombe', 160, 1),
(2663, 'Imo', 160, 1),
(2664, 'Jigawa', 160, 1),
(2665, 'Kaduna', 160, 1),
(2666, 'Kano', 160, 1),
(2667, 'Katsina', 160, 1),
(2668, 'Kebbi', 160, 1),
(2669, 'Kogi', 160, 1),
(2670, 'Kwara', 160, 1),
(2671, 'Lagos', 160, 1),
(2672, 'Nassarawa', 160, 1),
(2673, 'Niger', 160, 1),
(2674, 'Ogun', 160, 1),
(2675, 'Ondo', 160, 1),
(2676, 'Osun', 160, 1),
(2677, 'Oyo', 160, 1),
(2678, 'Plateau', 160, 1),
(2679, 'Rivers', 160, 1),
(2680, 'Sokoto', 160, 1),
(2681, 'Taraba', 160, 1),
(2682, 'Yobe', 160, 1),
(2683, 'Zamfara', 160, 1),
(2684, 'Niue', 161, 1),
(2685, 'Norfolk Island', 162, 1),
(2686, 'Northern Islands', 163, 1),
(2687, 'Rota', 163, 1),
(2688, 'Saipan', 163, 1),
(2689, 'Tinian', 163, 1),
(2690, 'Akershus', 164, 1),
(2691, 'Aust Agder', 164, 1),
(2692, 'Bergen', 164, 1),
(2693, 'Buskerud', 164, 1),
(2694, 'Finnmark', 164, 1),
(2695, 'Hedmark', 164, 1),
(2696, 'Hordaland', 164, 1),
(2697, 'Moere og Romsdal', 164, 1),
(2698, 'Nord Trondelag', 164, 1),
(2699, 'Nordland', 164, 1),
(2700, 'Oestfold', 164, 1),
(2701, 'Oppland', 164, 1),
(2702, 'Oslo', 164, 1),
(2703, 'Rogaland', 164, 1),
(2704, 'Soer Troendelag', 164, 1),
(2705, 'Sogn og Fjordane', 164, 1),
(2706, 'Stavern', 164, 1),
(2707, 'Sykkylven', 164, 1),
(2708, 'Telemark', 164, 1),
(2709, 'Troms', 164, 1),
(2710, 'Vest Agder', 164, 1),
(2711, 'Vestfold', 164, 1),
(2712, 'ÃƒÂ˜stfold', 164, 1),
(2713, 'Al Buraimi', 165, 1),
(2714, 'Dhufar', 165, 1),
(2715, 'Masqat', 165, 1),
(2716, 'Musandam', 165, 1),
(2717, 'Rusayl', 165, 1),
(2718, 'Wadi Kabir', 165, 1),
(2719, 'ad-Dakhiliyah', 165, 1),
(2720, 'adh-Dhahirah', 165, 1),
(2721, 'al-Batinah', 165, 1),
(2722, 'ash-Sharqiyah', 165, 1),
(2723, 'Baluchistan', 166, 1),
(2724, 'Federal Capital Area', 166, 1),
(2725, 'Federally administered Tribal ', 166, 1),
(2726, 'North-West Frontier', 166, 1),
(2727, 'Northern Areas', 166, 1),
(2728, 'Punjab', 166, 1),
(2729, 'Sind', 166, 1),
(2730, 'Aimeliik', 167, 1),
(2731, 'Airai', 167, 1),
(2732, 'Angaur', 167, 1),
(2733, 'Hatobohei', 167, 1),
(2734, 'Kayangel', 167, 1),
(2735, 'Koror', 167, 1),
(2736, 'Melekeok', 167, 1),
(2737, 'Ngaraard', 167, 1),
(2738, 'Ngardmau', 167, 1),
(2739, 'Ngaremlengui', 167, 1),
(2740, 'Ngatpang', 167, 1),
(2741, 'Ngchesar', 167, 1),
(2742, 'Ngerchelong', 167, 1),
(2743, 'Ngiwal', 167, 1),
(2744, 'Peleliu', 167, 1),
(2745, 'Sonsorol', 167, 1),
(2746, 'Ariha', 168, 1),
(2747, 'Bayt Lahm', 168, 1),
(2748, 'Bethlehem', 168, 1),
(2749, 'Dayr-al-Balah', 168, 1),
(2750, 'Ghazzah', 168, 1),
(2751, 'Ghazzah ash-Shamaliyah', 168, 1),
(2752, 'Janin', 168, 1),
(2753, 'Khan Yunis', 168, 1),
(2754, 'Nabulus', 168, 1),
(2755, 'Qalqilyah', 168, 1),
(2756, 'Rafah', 168, 1),
(2757, 'Ram Allah wal-Birah', 168, 1),
(2758, 'Salfit', 168, 1),
(2759, 'Tubas', 168, 1),
(2760, 'Tulkarm', 168, 1),
(2761, 'al-Khalil', 168, 1),
(2762, 'al-Quds', 168, 1),
(2763, 'Bocas del Toro', 169, 1),
(2764, 'Chiriqui', 169, 1),
(2765, 'Cocle', 169, 1),
(2766, 'Colon', 169, 1),
(2767, 'Darien', 169, 1),
(2768, 'Embera', 169, 1),
(2769, 'Herrera', 169, 1),
(2770, 'Kuna Yala', 169, 1),
(2771, 'Los Santos', 169, 1),
(2772, 'Ngobe Bugle', 169, 1),
(2773, 'Panama', 169, 1),
(2774, 'Veraguas', 169, 1),
(2775, 'East New Britain', 170, 1),
(2776, 'East Sepik', 170, 1),
(2777, 'Eastern Highlands', 170, 1),
(2778, 'Enga', 170, 1),
(2779, 'Fly River', 170, 1),
(2780, 'Gulf', 170, 1),
(2781, 'Madang', 170, 1),
(2782, 'Manus', 170, 1),
(2783, 'Milne Bay', 170, 1),
(2784, 'Morobe', 170, 1),
(2785, 'National Capital District', 170, 1),
(2786, 'New Ireland', 170, 1),
(2787, 'North Solomons', 170, 1),
(2788, 'Oro', 170, 1),
(2789, 'Sandaun', 170, 1),
(2790, 'Simbu', 170, 1),
(2791, 'Southern Highlands', 170, 1),
(2792, 'West New Britain', 170, 1),
(2793, 'Western Highlands', 170, 1),
(2794, 'Alto Paraguay', 171, 1),
(2795, 'Alto Parana', 171, 1),
(2796, 'Amambay', 171, 1),
(2797, 'Asuncion', 171, 1),
(2798, 'Boqueron', 171, 1),
(2799, 'Caaguazu', 171, 1),
(2800, 'Caazapa', 171, 1),
(2801, 'Canendiyu', 171, 1),
(2802, 'Central', 171, 1),
(2803, 'Concepcion', 171, 1),
(2804, 'Cordillera', 171, 1),
(2805, 'Guaira', 171, 1),
(2806, 'Itapua', 171, 1),
(2807, 'Misiones', 171, 1),
(2808, 'Neembucu', 171, 1),
(2809, 'Paraguari', 171, 1),
(2810, 'Presidente Hayes', 171, 1),
(2811, 'San Pedro', 171, 1),
(2812, 'Amazonas', 172, 1),
(2813, 'Ancash', 172, 1),
(2814, 'Apurimac', 172, 1),
(2815, 'Arequipa', 172, 1),
(2816, 'Ayacucho', 172, 1),
(2817, 'Cajamarca', 172, 1),
(2818, 'Cusco', 172, 1),
(2819, 'Huancavelica', 172, 1),
(2820, 'Huanuco', 172, 1),
(2821, 'Ica', 172, 1),
(2822, 'Junin', 172, 1),
(2823, 'La Libertad', 172, 1),
(2824, 'Lambayeque', 172, 1),
(2825, 'Lima y Callao', 172, 1),
(2826, 'Loreto', 172, 1),
(2827, 'Madre de Dios', 172, 1),
(2828, 'Moquegua', 172, 1),
(2829, 'Pasco', 172, 1),
(2830, 'Piura', 172, 1),
(2831, 'Puno', 172, 1),
(2832, 'San Martin', 172, 1),
(2833, 'Tacna', 172, 1),
(2834, 'Tumbes', 172, 1),
(2835, 'Ucayali', 172, 1),
(2836, 'Batangas', 173, 1),
(2837, 'Bicol', 173, 1),
(2838, 'Bulacan', 173, 1),
(2839, 'Cagayan', 173, 1),
(2840, 'Caraga', 173, 1),
(2841, 'Central Luzon', 173, 1),
(2842, 'Central Mindanao', 173, 1),
(2843, 'Central Visayas', 173, 1),
(2844, 'Cordillera', 173, 1),
(2845, 'Davao', 173, 1),
(2846, 'Eastern Visayas', 173, 1),
(2847, 'Greater Metropolitan Area', 173, 1),
(2848, 'Ilocos', 173, 1),
(2849, 'Laguna', 173, 1),
(2850, 'Luzon', 173, 1),
(2851, 'Mactan', 173, 1),
(2852, 'Metropolitan Manila Area', 173, 1),
(2853, 'Muslim Mindanao', 173, 1),
(2854, 'Northern Mindanao', 173, 1),
(2855, 'Southern Mindanao', 173, 1),
(2856, 'Southern Tagalog', 173, 1),
(2857, 'Western Mindanao', 173, 1),
(2858, 'Western Visayas', 173, 1),
(2859, 'Pitcairn Island', 174, 1),
(2860, 'Biale Blota', 175, 1),
(2861, 'Dobroszyce', 175, 1),
(2862, 'Dolnoslaskie', 175, 1),
(2863, 'Dziekanow Lesny', 175, 1),
(2864, 'Hopowo', 175, 1),
(2865, 'Kartuzy', 175, 1),
(2866, 'Koscian', 175, 1),
(2867, 'Krakow', 175, 1),
(2868, 'Kujawsko-Pomorskie', 175, 1),
(2869, 'Lodzkie', 175, 1),
(2870, 'Lubelskie', 175, 1),
(2871, 'Lubuskie', 175, 1),
(2872, 'Malomice', 175, 1),
(2873, 'Malopolskie', 175, 1),
(2874, 'Mazowieckie', 175, 1),
(2875, 'Mirkow', 175, 1),
(2876, 'Opolskie', 175, 1),
(2877, 'Ostrowiec', 175, 1),
(2878, 'Podkarpackie', 175, 1),
(2879, 'Podlaskie', 175, 1),
(2880, 'Polska', 175, 1),
(2881, 'Pomorskie', 175, 1),
(2882, 'Poznan', 175, 1),
(2883, 'Pruszkow', 175, 1),
(2884, 'Rymanowska', 175, 1),
(2885, 'Rzeszow', 175, 1),
(2886, 'Slaskie', 175, 1),
(2887, 'Stare Pole', 175, 1),
(2888, 'Swietokrzyskie', 175, 1),
(2889, 'Warminsko-Mazurskie', 175, 1),
(2890, 'Warsaw', 175, 1),
(2891, 'Wejherowo', 175, 1),
(2892, 'Wielkopolskie', 175, 1),
(2893, 'Wroclaw', 175, 1),
(2894, 'Zachodnio-Pomorskie', 175, 1),
(2895, 'Zukowo', 175, 1),
(2896, 'Abrantes', 176, 1),
(2897, 'Acores', 176, 1),
(2898, 'Alentejo', 176, 1),
(2899, 'Algarve', 176, 1),
(2900, 'Braga', 176, 1),
(2901, 'Centro', 176, 1),
(2902, 'Distrito de Leiria', 176, 1),
(2903, 'Distrito de Viana do Castelo', 176, 1),
(2904, 'Distrito de Vila Real', 176, 1),
(2905, 'Distrito do Porto', 176, 1),
(2906, 'Lisboa e Vale do Tejo', 176, 1),
(2907, 'Madeira', 176, 1),
(2908, 'Norte', 176, 1),
(2909, 'Paivas', 176, 1),
(2910, 'Arecibo', 177, 1),
(2911, 'Bayamon', 177, 1),
(2912, 'Carolina', 177, 1),
(2913, 'Florida', 177, 1),
(2914, 'Guayama', 177, 1),
(2915, 'Humacao', 177, 1),
(2916, 'Mayaguez-Aguadilla', 177, 1),
(2917, 'Ponce', 177, 1),
(2918, 'Salinas', 177, 1),
(2919, 'San Juan', 177, 1),
(2920, 'Doha', 178, 1),
(2921, 'Jarian-al-Batnah', 178, 1),
(2922, 'Umm Salal', 178, 1),
(2923, 'ad-Dawhah', 178, 1),
(2924, 'al-Ghuwayriyah', 178, 1),
(2925, 'al-Jumayliyah', 178, 1),
(2926, 'al-Khawr', 178, 1),
(2927, 'al-Wakrah', 178, 1),
(2928, 'ar-Rayyan', 178, 1),
(2929, 'ash-Shamal', 178, 1),
(2930, 'Saint-Benoit', 179, 1),
(2931, 'Saint-Denis', 179, 1),
(2932, 'Saint-Paul', 179, 1),
(2933, 'Saint-Pierre', 179, 1),
(2934, 'Alba', 180, 1),
(2935, 'Arad', 180, 1),
(2936, 'Arges', 180, 1),
(2937, 'Bacau', 180, 1),
(2938, 'Bihor', 180, 1),
(2939, 'Bistrita-Nasaud', 180, 1),
(2940, 'Botosani', 180, 1),
(2941, 'Braila', 180, 1),
(2942, 'Brasov', 180, 1),
(2943, 'Bucuresti', 180, 1),
(2944, 'Buzau', 180, 1),
(2945, 'Calarasi', 180, 1),
(2946, 'Caras-Severin', 180, 1),
(2947, 'Cluj', 180, 1),
(2948, 'Constanta', 180, 1),
(2949, 'Covasna', 180, 1),
(2950, 'Dambovita', 180, 1),
(2951, 'Dolj', 180, 1),
(2952, 'Galati', 180, 1),
(2953, 'Giurgiu', 180, 1),
(2954, 'Gorj', 180, 1),
(2955, 'Harghita', 180, 1),
(2956, 'Hunedoara', 180, 1),
(2957, 'Ialomita', 180, 1),
(2958, 'Iasi', 180, 1),
(2959, 'Ilfov', 180, 1),
(2960, 'Maramures', 180, 1),
(2961, 'Mehedinti', 180, 1),
(2962, 'Mures', 180, 1),
(2963, 'Neamt', 180, 1),
(2964, 'Olt', 180, 1),
(2965, 'Prahova', 180, 1),
(2966, 'Salaj', 180, 1),
(2967, 'Satu Mare', 180, 1),
(2968, 'Sibiu', 180, 1),
(2969, 'Sondelor', 180, 1),
(2970, 'Suceava', 180, 1),
(2971, 'Teleorman', 180, 1),
(2972, 'Timis', 180, 1),
(2973, 'Tulcea', 180, 1),
(2974, 'Valcea', 180, 1),
(2975, 'Vaslui', 180, 1),
(2976, 'Vrancea', 180, 1),
(2977, 'Adygeja', 181, 1),
(2978, 'Aga', 181, 1),
(2979, 'Alanija', 181, 1),
(2980, 'Altaj', 181, 1),
(2981, 'Amur', 181, 1),
(2982, 'Arhangelsk', 181, 1),
(2983, 'Astrahan', 181, 1),
(2984, 'Bashkortostan', 181, 1),
(2985, 'Belgorod', 181, 1),
(2986, 'Brjansk', 181, 1),
(2987, 'Burjatija', 181, 1),
(2988, 'Chechenija', 181, 1),
(2989, 'Cheljabinsk', 181, 1),
(2990, 'Chita', 181, 1),
(2991, 'Chukotka', 181, 1),
(2992, 'Chuvashija', 181, 1),
(2993, 'Dagestan', 181, 1),
(2994, 'Evenkija', 181, 1),
(2995, 'Gorno-Altaj', 181, 1),
(2996, 'Habarovsk', 181, 1),
(2997, 'Hakasija', 181, 1),
(2998, 'Hanty-Mansija', 181, 1),
(2999, 'Ingusetija', 181, 1),
(3000, 'Irkutsk', 181, 1),
(3001, 'Ivanovo', 181, 1),
(3002, 'Jamalo-Nenets', 181, 1),
(3003, 'Jaroslavl', 181, 1),
(3004, 'Jevrej', 181, 1),
(3005, 'Kabardino-Balkarija', 181, 1),
(3006, 'Kaliningrad', 181, 1),
(3007, 'Kalmykija', 181, 1),
(3008, 'Kaluga', 181, 1),
(3009, 'Kamchatka', 181, 1),
(3010, 'Karachaj-Cherkessija', 181, 1),
(3011, 'Karelija', 181, 1),
(3012, 'Kemerovo', 181, 1),
(3013, 'Khabarovskiy Kray', 181, 1),
(3014, 'Kirov', 181, 1),
(3015, 'Komi', 181, 1),
(3016, 'Komi-Permjakija', 181, 1),
(3017, 'Korjakija', 181, 1),
(3018, 'Kostroma', 181, 1),
(3019, 'Krasnodar', 181, 1),
(3020, 'Krasnojarsk', 181, 1),
(3021, 'Krasnoyarskiy Kray', 181, 1),
(3022, 'Kurgan', 181, 1),
(3023, 'Kursk', 181, 1),
(3024, 'Leningrad', 181, 1),
(3025, 'Lipeck', 181, 1),
(3026, 'Magadan', 181, 1),
(3027, 'Marij El', 181, 1),
(3028, 'Mordovija', 181, 1),
(3029, 'Moscow', 181, 1),
(3030, 'Moskovskaja Oblast', 181, 1),
(3031, 'Moskovskaya Oblast', 181, 1),
(3032, 'Moskva', 181, 1),
(3033, 'Murmansk', 181, 1),
(3034, 'Nenets', 181, 1),
(3035, 'Nizhnij Novgorod', 181, 1),
(3036, 'Novgorod', 181, 1),
(3037, 'Novokusnezk', 181, 1),
(3038, 'Novosibirsk', 181, 1),
(3039, 'Omsk', 181, 1),
(3040, 'Orenburg', 181, 1),
(3041, 'Orjol', 181, 1),
(3042, 'Penza', 181, 1),
(3043, 'Perm', 181, 1),
(3044, 'Primorje', 181, 1),
(3045, 'Pskov', 181, 1),
(3046, 'Pskovskaya Oblast', 181, 1),
(3047, 'Rjazan', 181, 1),
(3048, 'Rostov', 181, 1),
(3049, 'Saha', 181, 1),
(3050, 'Sahalin', 181, 1),
(3051, 'Samara', 181, 1),
(3052, 'Samarskaya', 181, 1),
(3053, 'Sankt-Peterburg', 181, 1),
(3054, 'Saratov', 181, 1),
(3055, 'Smolensk', 181, 1),
(3056, 'Stavropol', 181, 1),
(3057, 'Sverdlovsk', 181, 1),
(3058, 'Tajmyrija', 181, 1),
(3059, 'Tambov', 181, 1),
(3060, 'Tatarstan', 181, 1),
(3061, 'Tjumen', 181, 1),
(3062, 'Tomsk', 181, 1),
(3063, 'Tula', 181, 1),
(3064, 'Tver', 181, 1),
(3065, 'Tyva', 181, 1),
(3066, 'Udmurtija', 181, 1),
(3067, 'Uljanovsk', 181, 1),
(3068, 'Ulyanovskaya Oblast', 181, 1),
(3069, 'Ust-Orda', 181, 1),
(3070, 'Vladimir', 181, 1),
(3071, 'Volgograd', 181, 1),
(3072, 'Vologda', 181, 1),
(3073, 'Voronezh', 181, 1),
(3074, 'Butare', 182, 1),
(3075, 'Byumba', 182, 1),
(3076, 'Cyangugu', 182, 1),
(3077, 'Gikongoro', 182, 1),
(3078, 'Gisenyi', 182, 1),
(3079, 'Gitarama', 182, 1),
(3080, 'Kibungo', 182, 1),
(3081, 'Kibuye', 182, 1),
(3082, 'Kigali-ngali', 182, 1),
(3083, 'Ruhengeri', 182, 1),
(3084, 'Ascension', 183, 1),
(3085, 'Gough Island', 183, 1),
(3086, 'Saint Helena', 183, 1),
(3087, 'Tristan da Cunha', 183, 1),
(3088, 'Christ Church Nichola Town', 184, 1),
(3089, 'Saint Anne Sandy Point', 184, 1),
(3090, 'Saint George Basseterre', 184, 1),
(3091, 'Saint George Gingerland', 184, 1),
(3092, 'Saint James Windward', 184, 1),
(3093, 'Saint John Capesterre', 184, 1),
(3094, 'Saint John Figtree', 184, 1),
(3095, 'Saint Mary Cayon', 184, 1),
(3096, 'Saint Paul Capesterre', 184, 1),
(3097, 'Saint Paul Charlestown', 184, 1),
(3098, 'Saint Peter Basseterre', 184, 1),
(3099, 'Saint Thomas Lowland', 184, 1),
(3100, 'Saint Thomas Middle Island', 184, 1),
(3101, 'Trinity Palmetto Point', 184, 1),
(3102, 'Anse-la-Raye', 185, 1),
(3103, 'Canaries', 185, 1),
(3104, 'Castries', 185, 1),
(3105, 'Choiseul', 185, 1),
(3106, 'Dennery', 185, 1),
(3107, 'Gros Inlet', 185, 1),
(3108, 'Laborie', 185, 1),
(3109, 'Micoud', 185, 1),
(3110, 'Soufriere', 185, 1),
(3111, 'Vieux Fort', 185, 1),
(3112, 'Miquelon-Langlade', 186, 1),
(3113, 'Saint-Pierre', 186, 1),
(3114, 'Charlotte', 187, 1),
(3115, 'Grenadines', 187, 1),
(3116, 'Saint Andrew', 187, 1),
(3117, 'Saint David', 187, 1),
(3118, 'Saint George', 187, 1),
(3119, 'Saint Patrick', 187, 1),
(3120, 'A\'ana', 188, 1),
(3121, 'Aiga-i-le-Tai', 188, 1),
(3122, 'Atua', 188, 1),
(3123, 'Fa\'asaleleaga', 188, 1),
(3124, 'Gaga\'emauga', 188, 1),
(3125, 'Gagaifomauga', 188, 1),
(3126, 'Palauli', 188, 1),
(3127, 'Satupa\'itea', 188, 1),
(3128, 'Tuamasaga', 188, 1),
(3129, 'Va\'a-o-Fonoti', 188, 1),
(3130, 'Vaisigano', 188, 1),
(3131, 'Acquaviva', 189, 1),
(3132, 'Borgo Maggiore', 189, 1),
(3133, 'Chiesanuova', 189, 1),
(3134, 'Domagnano', 189, 1),
(3135, 'Faetano', 189, 1),
(3136, 'Fiorentino', 189, 1),
(3137, 'Montegiardino', 189, 1),
(3138, 'San Marino', 189, 1),
(3139, 'Serravalle', 189, 1),
(3140, 'Agua Grande', 190, 1),
(3141, 'Cantagalo', 190, 1),
(3142, 'Lemba', 190, 1),
(3143, 'Lobata', 190, 1),
(3144, 'Me-Zochi', 190, 1),
(3145, 'Pague', 190, 1),
(3146, 'Al Khobar', 191, 1),
(3147, 'Aseer', 191, 1),
(3148, 'Ash Sharqiyah', 191, 1),
(3149, 'Asir', 191, 1),
(3150, 'Central Province', 191, 1),
(3151, 'Eastern Province', 191, 1),
(3152, 'Ha\'il', 191, 1),
(3153, 'Jawf', 191, 1),
(3154, 'Jizan', 191, 1),
(3155, 'Makkah', 191, 1),
(3156, 'Najran', 191, 1),
(3157, 'Qasim', 191, 1),
(3158, 'Tabuk', 191, 1),
(3159, 'Western Province', 191, 1),
(3160, 'al-Bahah', 191, 1),
(3161, 'al-Hudud-ash-Shamaliyah', 191, 1),
(3162, 'al-Madinah', 191, 1),
(3163, 'ar-Riyad', 191, 1),
(3164, 'Dakar', 192, 1),
(3165, 'Diourbel', 192, 1),
(3166, 'Fatick', 192, 1),
(3167, 'Kaolack', 192, 1),
(3168, 'Kolda', 192, 1),
(3169, 'Louga', 192, 1),
(3170, 'Saint-Louis', 192, 1),
(3171, 'Tambacounda', 192, 1),
(3172, 'Thies', 192, 1),
(3173, 'Ziguinchor', 192, 1),
(3174, 'Central Serbia', 193, 1),
(3175, 'Kosovo and Metohija', 193, 1),
(3176, 'Vojvodina', 193, 1),
(3177, 'Anse Boileau', 194, 1),
(3178, 'Anse Royale', 194, 1),
(3179, 'Cascade', 194, 1),
(3180, 'Takamaka', 194, 1),
(3181, 'Victoria', 194, 1),
(3182, 'Eastern', 195, 1),
(3183, 'Northern', 195, 1),
(3184, 'Southern', 195, 1),
(3185, 'Western', 195, 1),
(3186, 'Singapore', 196, 1),
(3187, 'Banskobystricky', 197, 1),
(3188, 'Bratislavsky', 197, 1),
(3189, 'Kosicky', 197, 1),
(3190, 'Nitriansky', 197, 1),
(3191, 'Presovsky', 197, 1),
(3192, 'Trenciansky', 197, 1),
(3193, 'Trnavsky', 197, 1),
(3194, 'Zilinsky', 197, 1),
(3195, 'Benedikt', 198, 1),
(3196, 'Gorenjska', 198, 1),
(3197, 'Gorishka', 198, 1),
(3198, 'Jugovzhodna Slovenija', 198, 1),
(3199, 'Koroshka', 198, 1),
(3200, 'Notranjsko-krashka', 198, 1),
(3201, 'Obalno-krashka', 198, 1),
(3202, 'Obcina Domzale', 198, 1),
(3203, 'Obcina Vitanje', 198, 1),
(3204, 'Osrednjeslovenska', 198, 1),
(3205, 'Podravska', 198, 1),
(3206, 'Pomurska', 198, 1),
(3207, 'Savinjska', 198, 1),
(3208, 'Slovenian Littoral', 198, 1),
(3209, 'Spodnjeposavska', 198, 1),
(3210, 'Zasavska', 198, 1),
(3211, 'Pitcairn', 199, 1),
(3212, 'Central', 200, 1),
(3213, 'Choiseul', 200, 1),
(3214, 'Guadalcanal', 200, 1),
(3215, 'Isabel', 200, 1),
(3216, 'Makira and Ulawa', 200, 1),
(3217, 'Malaita', 200, 1),
(3218, 'Rennell and Bellona', 200, 1),
(3219, 'Temotu', 200, 1),
(3220, 'Western', 200, 1),
(3221, 'Awdal', 201, 1),
(3222, 'Bakol', 201, 1),
(3223, 'Banadir', 201, 1),
(3224, 'Bari', 201, 1),
(3225, 'Bay', 201, 1),
(3226, 'Galgudug', 201, 1),
(3227, 'Gedo', 201, 1),
(3228, 'Hiran', 201, 1),
(3229, 'Jubbada Hose', 201, 1),
(3230, 'Jubbadha Dexe', 201, 1),
(3231, 'Mudug', 201, 1),
(3232, 'Nugal', 201, 1),
(3233, 'Sanag', 201, 1),
(3234, 'Shabellaha Dhexe', 201, 1),
(3235, 'Shabellaha Hose', 201, 1),
(3236, 'Togdher', 201, 1),
(3237, 'Woqoyi Galbed', 201, 1),
(3238, 'Eastern Cape', 202, 1),
(3239, 'Free State', 202, 1),
(3240, 'Gauteng', 202, 1),
(3241, 'Kempton Park', 202, 1),
(3242, 'Kramerville', 202, 1),
(3243, 'KwaZulu Natal', 202, 1),
(3244, 'Limpopo', 202, 1),
(3245, 'Mpumalanga', 202, 1),
(3246, 'North West', 202, 1),
(3247, 'Northern Cape', 202, 1),
(3248, 'Parow', 202, 1),
(3249, 'Table View', 202, 1),
(3250, 'Umtentweni', 202, 1),
(3251, 'Western Cape', 202, 1),
(3252, 'South Georgia', 203, 1),
(3253, 'Central Equatoria', 204, 1),
(3254, 'A Coruna', 205, 1),
(3255, 'Alacant', 205, 1),
(3256, 'Alava', 205, 1),
(3257, 'Albacete', 205, 1),
(3258, 'Almeria', 205, 1),
(3260, 'Asturias', 205, 1),
(3261, 'Avila', 205, 1),
(3262, 'Badajoz', 205, 1),
(3263, 'Balears', 205, 1),
(3264, 'Barcelona', 205, 1),
(3267, 'Burgos', 205, 1),
(3268, 'Caceres', 205, 1),
(3269, 'Cadiz', 205, 1),
(3270, 'Cantabria', 205, 1),
(3271, 'Castello', 205, 1),
(3273, 'Ceuta', 205, 1),
(3274, 'Ciudad Real', 205, 1),
(3281, 'Cordoba', 205, 1),
(3282, 'Cuenca', 205, 1),
(3284, 'Girona', 205, 1),
(3285, 'Granada', 205, 1),
(3286, 'Guadalajara', 205, 1),
(3287, 'Guipuzcoa', 205, 1),
(3288, 'Huelva', 205, 1),
(3289, 'Huesca', 205, 1),
(3290, 'Jaen', 205, 1),
(3291, 'La Rioja', 205, 1),
(3292, 'Las Palmas', 205, 1),
(3293, 'Leon', 205, 1),
(3295, 'Lleida', 205, 1),
(3296, 'Lugo', 205, 1),
(3297, 'Madrid', 205, 1),
(3298, 'Malaga', 205, 1),
(3299, 'Melilla', 205, 1),
(3300, 'Murcia', 205, 1),
(3301, 'Navarra', 205, 1),
(3302, 'Ourense', 205, 1),
(3303, 'Pais Vasco', 205, 1),
(3304, 'Palencia', 205, 1),
(3305, 'Pontevedra', 205, 1),
(3306, 'Salamanca', 205, 1),
(3308, 'Segovia', 205, 1),
(3309, 'Sevilla', 205, 1),
(3310, 'Soria', 205, 1),
(3311, 'Tarragona', 205, 1),
(3312, 'Santa Cruz de Tenerife', 205, 1),
(3313, 'Teruel', 205, 1),
(3314, 'Toledo', 205, 1),
(3315, 'Valencia', 205, 1),
(3316, 'Valladolid', 205, 1),
(3317, 'Vizcaya', 205, 1),
(3318, 'Zamora', 205, 1),
(3319, 'Zaragoza', 205, 1),
(3320, 'Amparai', 206, 1),
(3321, 'Anuradhapuraya', 206, 1),
(3322, 'Badulla', 206, 1),
(3323, 'Boralesgamuwa', 206, 1),
(3324, 'Colombo', 206, 1),
(3325, 'Galla', 206, 1),
(3326, 'Gampaha', 206, 1),
(3327, 'Hambantota', 206, 1),
(3328, 'Kalatura', 206, 1),
(3329, 'Kegalla', 206, 1),
(3330, 'Kilinochchi', 206, 1),
(3331, 'Kurunegala', 206, 1),
(3332, 'Madakalpuwa', 206, 1),
(3333, 'Maha Nuwara', 206, 1),
(3334, 'Malwana', 206, 1),
(3335, 'Mannarama', 206, 1),
(3336, 'Matale', 206, 1),
(3337, 'Matara', 206, 1),
(3338, 'Monaragala', 206, 1),
(3339, 'Mullaitivu', 206, 1),
(3340, 'North Eastern Province', 206, 1),
(3341, 'North Western Province', 206, 1),
(3342, 'Nuwara Eliya', 206, 1),
(3343, 'Polonnaruwa', 206, 1),
(3344, 'Puttalama', 206, 1),
(3345, 'Ratnapuraya', 206, 1),
(3346, 'Southern Province', 206, 1),
(3347, 'Tirikunamalaya', 206, 1),
(3348, 'Tuscany', 206, 1),
(3349, 'Vavuniyawa', 206, 1),
(3350, 'Western Province', 206, 1),
(3351, 'Yapanaya', 206, 1),
(3352, 'kadawatha', 206, 1),
(3353, 'A\'ali-an-Nil', 207, 1),
(3354, 'Bahr-al-Jabal', 207, 1),
(3355, 'Central Equatoria', 207, 1),
(3356, 'Gharb Bahr-al-Ghazal', 207, 1),
(3357, 'Gharb Darfur', 207, 1),
(3358, 'Gharb Kurdufan', 207, 1),
(3359, 'Gharb-al-Istiwa\'iyah', 207, 1),
(3360, 'Janub Darfur', 207, 1),
(3361, 'Janub Kurdufan', 207, 1),
(3362, 'Junqali', 207, 1),
(3363, 'Kassala', 207, 1),
(3364, 'Nahr-an-Nil', 207, 1),
(3365, 'Shamal Bahr-al-Ghazal', 207, 1),
(3366, 'Shamal Darfur', 207, 1),
(3367, 'Shamal Kurdufan', 207, 1),
(3368, 'Sharq-al-Istiwa\'iyah', 207, 1),
(3369, 'Sinnar', 207, 1),
(3370, 'Warab', 207, 1),
(3371, 'Wilayat al Khartum', 207, 1),
(3372, 'al-Bahr-al-Ahmar', 207, 1),
(3373, 'al-Buhayrat', 207, 1),
(3374, 'al-Jazirah', 207, 1),
(3375, 'al-Khartum', 207, 1),
(3376, 'al-Qadarif', 207, 1),
(3377, 'al-Wahdah', 207, 1),
(3378, 'an-Nil-al-Abyad', 207, 1),
(3379, 'an-Nil-al-Azraq', 207, 1),
(3380, 'ash-Shamaliyah', 207, 1),
(3381, 'Brokopondo', 208, 1),
(3382, 'Commewijne', 208, 1),
(3383, 'Coronie', 208, 1),
(3384, 'Marowijne', 208, 1),
(3385, 'Nickerie', 208, 1),
(3386, 'Para', 208, 1),
(3387, 'Paramaribo', 208, 1),
(3388, 'Saramacca', 208, 1),
(3389, 'Wanica', 208, 1),
(3390, 'Svalbard', 209, 1),
(3391, 'Hhohho', 210, 1),
(3392, 'Lubombo', 210, 1),
(3393, 'Manzini', 210, 1),
(3394, 'Shiselweni', 210, 1),
(3395, 'Alvsborgs Lan', 211, 1),
(3396, 'Angermanland', 211, 1),
(3397, 'Blekinge', 211, 1),
(3398, 'Bohuslan', 211, 1),
(3399, 'Dalarna', 211, 1),
(3400, 'Gavleborg', 211, 1),
(3401, 'Gaza', 211, 1),
(3402, 'Gotland', 211, 1),
(3403, 'Halland', 211, 1),
(3404, 'Jamtland', 211, 1),
(3405, 'Jonkoping', 211, 1),
(3406, 'Kalmar', 211, 1),
(3407, 'Kristianstads', 211, 1),
(3408, 'Kronoberg', 211, 1),
(3409, 'Norrbotten', 211, 1),
(3410, 'Orebro', 211, 1),
(3411, 'Ostergotland', 211, 1),
(3412, 'Saltsjo-Boo', 211, 1),
(3413, 'Skane', 211, 1),
(3414, 'Smaland', 211, 1),
(3415, 'Sodermanland', 211, 1),
(3416, 'Stockholm', 211, 1),
(3417, 'Uppsala', 211, 1),
(3418, 'Varmland', 211, 1),
(3419, 'Vasterbotten', 211, 1),
(3420, 'Vastergotland', 211, 1),
(3421, 'Vasternorrland', 211, 1),
(3422, 'Vastmanland', 211, 1),
(3423, 'Vastra Gotaland', 211, 1),
(3424, 'Aargau', 212, 1),
(3425, 'Appenzell Inner-Rhoden', 212, 1),
(3426, 'Appenzell-Ausser Rhoden', 212, 1),
(3427, 'Basel-Landschaft', 212, 1),
(3428, 'Basel-Stadt', 212, 1),
(3429, 'Bern', 212, 1),
(3430, 'Canton Ticino', 212, 1),
(3431, 'Fribourg', 212, 1),
(3432, 'Geneve', 212, 1),
(3433, 'Glarus', 212, 1),
(3434, 'Graubunden', 212, 1),
(3435, 'Heerbrugg', 212, 1),
(3436, 'Jura', 212, 1),
(3437, 'Kanton Aargau', 212, 1),
(3438, 'Luzern', 212, 1),
(3439, 'Morbio Inferiore', 212, 1),
(3440, 'Muhen', 212, 1),
(3441, 'Neuchatel', 212, 1),
(3442, 'Nidwalden', 212, 1),
(3443, 'Obwalden', 212, 1),
(3444, 'Sankt Gallen', 212, 1),
(3445, 'Schaffhausen', 212, 1),
(3446, 'Schwyz', 212, 1),
(3447, 'Solothurn', 212, 1),
(3448, 'Thurgau', 212, 1),
(3449, 'Ticino', 212, 1),
(3450, 'Uri', 212, 1),
(3451, 'Valais', 212, 1),
(3452, 'Vaud', 212, 1),
(3453, 'Vauffelin', 212, 1),
(3454, 'Zug', 212, 1),
(3455, 'Zurich', 212, 1),
(3456, 'Aleppo', 213, 1),
(3457, 'Dar\'a', 213, 1),
(3458, 'Dayr-az-Zawr', 213, 1),
(3459, 'Dimashq', 213, 1),
(3460, 'Halab', 213, 1),
(3461, 'Hamah', 213, 1),
(3462, 'Hims', 213, 1),
(3463, 'Idlib', 213, 1),
(3464, 'Madinat Dimashq', 213, 1),
(3465, 'Tartus', 213, 1),
(3466, 'al-Hasakah', 213, 1),
(3467, 'al-Ladhiqiyah', 213, 1),
(3468, 'al-Qunaytirah', 213, 1),
(3469, 'ar-Raqqah', 213, 1),
(3470, 'as-Suwayda', 213, 1),
(3471, 'Changhua County', 214, 1),
(3472, 'Chiayi County', 214, 1),
(3473, 'Chiayi City', 214, 1),
(3474, 'Taipei City', 214, 1),
(3475, 'Hsinchu County', 214, 1),
(3476, 'Hsinchu City', 214, 1),
(3477, 'Hualien County', 214, 1),
(3480, 'Kaohsiung City', 214, 1),
(3481, 'Keelung City', 214, 1),
(3482, 'Kinmen County', 214, 1),
(3483, 'Miaoli County', 214, 1),
(3484, 'Nantou County', 214, 1),
(3486, 'Penghu County', 214, 1),
(3487, 'Pingtung County', 214, 1),
(3488, 'Taichung City', 214, 1),
(3492, 'Tainan City', 214, 1),
(3493, 'New Taipei City', 214, 1),
(3495, 'Taitung County', 214, 1),
(3496, 'Taoyuan City', 214, 1),
(3497, 'Yilan County', 214, 1),
(3498, 'YunLin County', 214, 1),
(3500, 'Dushanbe', 215, 1),
(3501, 'Gorno-Badakhshan', 215, 1),
(3502, 'Karotegin', 215, 1),
(3503, 'Khatlon', 215, 1),
(3504, 'Sughd', 215, 1),
(3505, 'Arusha', 216, 1),
(3506, 'Dar es Salaam', 216, 1),
(3507, 'Dodoma', 216, 1),
(3508, 'Iringa', 216, 1),
(3509, 'Kagera', 216, 1),
(3510, 'Kigoma', 216, 1),
(3511, 'Kilimanjaro', 216, 1),
(3512, 'Lindi', 216, 1),
(3513, 'Mara', 216, 1),
(3514, 'Mbeya', 216, 1),
(3515, 'Morogoro', 216, 1),
(3516, 'Mtwara', 216, 1),
(3517, 'Mwanza', 216, 1),
(3518, 'Pwani', 216, 1),
(3519, 'Rukwa', 216, 1),
(3520, 'Ruvuma', 216, 1),
(3521, 'Shinyanga', 216, 1),
(3522, 'Singida', 216, 1),
(3523, 'Tabora', 216, 1),
(3524, 'Tanga', 216, 1),
(3525, 'Zanzibar and Pemba', 216, 1),
(3526, 'Amnat Charoen', 217, 1),
(3527, 'Ang Thong', 217, 1),
(3528, 'Bangkok', 217, 1),
(3529, 'Buri Ram', 217, 1),
(3530, 'Chachoengsao', 217, 1),
(3531, 'Chai Nat', 217, 1),
(3532, 'Chaiyaphum', 217, 1),
(3533, 'Changwat Chaiyaphum', 217, 1),
(3534, 'Chanthaburi', 217, 1),
(3535, 'Chiang Mai', 217, 1),
(3536, 'Chiang Rai', 217, 1),
(3537, 'Chon Buri', 217, 1),
(3538, 'Chumphon', 217, 1),
(3539, 'Kalasin', 217, 1),
(3540, 'Kamphaeng Phet', 217, 1),
(3541, 'Kanchanaburi', 217, 1),
(3542, 'Khon Kaen', 217, 1),
(3543, 'Krabi', 217, 1),
(3544, 'Krung Thep', 217, 1),
(3545, 'Lampang', 217, 1),
(3546, 'Lamphun', 217, 1),
(3547, 'Loei', 217, 1),
(3548, 'Lop Buri', 217, 1),
(3549, 'Mae Hong Son', 217, 1),
(3550, 'Maha Sarakham', 217, 1),
(3551, 'Mukdahan', 217, 1),
(3552, 'Nakhon Nayok', 217, 1),
(3553, 'Nakhon Pathom', 217, 1),
(3554, 'Nakhon Phanom', 217, 1),
(3555, 'Nakhon Ratchasima', 217, 1),
(3556, 'Nakhon Sawan', 217, 1),
(3557, 'Nakhon Si Thammarat', 217, 1),
(3558, 'Nan', 217, 1),
(3559, 'Narathiwat', 217, 1),
(3560, 'Nong Bua Lam Phu', 217, 1),
(3561, 'Nong Khai', 217, 1),
(3562, 'Nonthaburi', 217, 1),
(3563, 'Pathum Thani', 217, 1),
(3564, 'Pattani', 217, 1),
(3565, 'Phangnga', 217, 1),
(3566, 'Phatthalung', 217, 1),
(3567, 'Phayao', 217, 1),
(3568, 'Phetchabun', 217, 1),
(3569, 'Phetchaburi', 217, 1),
(3570, 'Phichit', 217, 1),
(3571, 'Phitsanulok', 217, 1),
(3572, 'Phra Nakhon Si Ayutthaya', 217, 1),
(3573, 'Phrae', 217, 1),
(3574, 'Phuket', 217, 1),
(3575, 'Prachin Buri', 217, 1),
(3576, 'Prachuap Khiri Khan', 217, 1),
(3577, 'Ranong', 217, 1),
(3578, 'Ratchaburi', 217, 1),
(3579, 'Rayong', 217, 1),
(3580, 'Roi Et', 217, 1),
(3581, 'Sa Kaeo', 217, 1),
(3582, 'Sakon Nakhon', 217, 1),
(3583, 'Samut Prakan', 217, 1),
(3584, 'Samut Sakhon', 217, 1),
(3585, 'Samut Songkhran', 217, 1),
(3586, 'Saraburi', 217, 1),
(3587, 'Satun', 217, 1),
(3588, 'Si Sa Ket', 217, 1),
(3589, 'Sing Buri', 217, 1),
(3590, 'Songkhla', 217, 1),
(3591, 'Sukhothai', 217, 1),
(3592, 'Suphan Buri', 217, 1),
(3593, 'Surat Thani', 217, 1),
(3594, 'Surin', 217, 1),
(3595, 'Tak', 217, 1),
(3596, 'Trang', 217, 1),
(3597, 'Trat', 217, 1),
(3598, 'Ubon Ratchathani', 217, 1),
(3599, 'Udon Thani', 217, 1),
(3600, 'Uthai Thani', 217, 1),
(3601, 'Uttaradit', 217, 1),
(3602, 'Yala', 217, 1),
(3603, 'Yasothon', 217, 1),
(3604, 'Centre', 218, 1),
(3605, 'Kara', 218, 1),
(3606, 'Maritime', 218, 1),
(3607, 'Plateaux', 218, 1),
(3608, 'Savanes', 218, 1),
(3609, 'Atafu', 219, 1),
(3610, 'Fakaofo', 219, 1),
(3611, 'Nukunonu', 219, 1),
(3612, 'Eua', 220, 1),
(3613, 'Ha\'apai', 220, 1),
(3614, 'Niuas', 220, 1),
(3615, 'Tongatapu', 220, 1),
(3616, 'Vava\'u', 220, 1),
(3617, 'Arima-Tunapuna-Piarco', 221, 1),
(3618, 'Caroni', 221, 1),
(3619, 'Chaguanas', 221, 1),
(3620, 'Couva-Tabaquite-Talparo', 221, 1),
(3621, 'Diego Martin', 221, 1),
(3622, 'Glencoe', 221, 1),
(3623, 'Penal Debe', 221, 1),
(3624, 'Point Fortin', 221, 1),
(3625, 'Port of Spain', 221, 1),
(3626, 'Princes Town', 221, 1),
(3627, 'Saint George', 221, 1),
(3628, 'San Fernando', 221, 1),
(3629, 'San Juan', 221, 1),
(3630, 'Sangre Grande', 221, 1),
(3631, 'Siparia', 221, 1),
(3632, 'Tobago', 221, 1),
(3633, 'Aryanah', 222, 1),
(3634, 'Bajah', 222, 1),
(3635, 'Bin \'Arus', 222, 1),
(3636, 'Binzart', 222, 1),
(3637, 'Gouvernorat de Ariana', 222, 1),
(3638, 'Gouvernorat de Nabeul', 222, 1),
(3639, 'Gouvernorat de Sousse', 222, 1),
(3640, 'Hammamet Yasmine', 222, 1),
(3641, 'Jundubah', 222, 1),
(3642, 'Madaniyin', 222, 1),
(3643, 'Manubah', 222, 1),
(3644, 'Monastir', 222, 1),
(3645, 'Nabul', 222, 1),
(3646, 'Qabis', 222, 1),
(3647, 'Qafsah', 222, 1),
(3648, 'Qibili', 222, 1),
(3649, 'Safaqis', 222, 1),
(3650, 'Sfax', 222, 1),
(3651, 'Sidi Bu Zayd', 222, 1),
(3652, 'Silyanah', 222, 1),
(3653, 'Susah', 222, 1),
(3654, 'Tatawin', 222, 1),
(3655, 'Tawzar', 222, 1),
(3656, 'Tunis', 222, 1),
(3657, 'Zaghwan', 222, 1),
(3658, 'al-Kaf', 222, 1),
(3659, 'al-Mahdiyah', 222, 1),
(3660, 'al-Munastir', 222, 1),
(3661, 'al-Qasrayn', 222, 1),
(3662, 'al-Qayrawan', 222, 1),
(3663, 'Adana', 223, 1),
(3664, 'Adiyaman', 223, 1),
(3665, 'Afyon', 223, 1),
(3666, 'Agri', 223, 1),
(3667, 'Aksaray', 223, 1),
(3668, 'Amasya', 223, 1),
(3669, 'Ankara', 223, 1),
(3670, 'Antalya', 223, 1),
(3671, 'Ardahan', 223, 1),
(3672, 'Artvin', 223, 1),
(3673, 'Aydin', 223, 1),
(3674, 'Balikesir', 223, 1),
(3675, 'Bartin', 223, 1),
(3676, 'Batman', 223, 1),
(3677, 'Bayburt', 223, 1),
(3678, 'Bilecik', 223, 1),
(3679, 'Bingol', 223, 1),
(3680, 'Bitlis', 223, 1),
(3681, 'Bolu', 223, 1),
(3682, 'Burdur', 223, 1),
(3683, 'Bursa', 223, 1),
(3684, 'Canakkale', 223, 1),
(3685, 'Cankiri', 223, 1),
(3686, 'Corum', 223, 1),
(3687, 'Denizli', 223, 1),
(3688, 'Diyarbakir', 223, 1),
(3689, 'Duzce', 223, 1),
(3690, 'Edirne', 223, 1),
(3691, 'Elazig', 223, 1),
(3692, 'Erzincan', 223, 1),
(3693, 'Erzurum', 223, 1),
(3694, 'Eskisehir', 223, 1),
(3695, 'Gaziantep', 223, 1),
(3696, 'Giresun', 223, 1),
(3697, 'Gumushane', 223, 1),
(3698, 'Hakkari', 223, 1),
(3699, 'Hatay', 223, 1),
(3700, 'Icel', 223, 1),
(3701, 'Igdir', 223, 1),
(3702, 'Isparta', 223, 1),
(3703, 'Istanbul', 223, 1),
(3704, 'Izmir', 223, 1),
(3705, 'Kahramanmaras', 223, 1),
(3706, 'Karabuk', 223, 1),
(3707, 'Karaman', 223, 1),
(3708, 'Kars', 223, 1),
(3709, 'Karsiyaka', 223, 1),
(3710, 'Kastamonu', 223, 1),
(3711, 'Kayseri', 223, 1),
(3712, 'Kilis', 223, 1),
(3713, 'Kirikkale', 223, 1),
(3714, 'Kirklareli', 223, 1),
(3715, 'Kirsehir', 223, 1),
(3716, 'Kocaeli', 223, 1),
(3717, 'Konya', 223, 1),
(3718, 'Kutahya', 223, 1),
(3719, 'Lefkosa', 223, 1),
(3720, 'Malatya', 223, 1),
(3721, 'Manisa', 223, 1),
(3722, 'Mardin', 223, 1),
(3723, 'Mugla', 223, 1),
(3724, 'Mus', 223, 1),
(3725, 'Nevsehir', 223, 1),
(3726, 'Nigde', 223, 1),
(3727, 'Ordu', 223, 1),
(3728, 'Osmaniye', 223, 1),
(3729, 'Rize', 223, 1),
(3730, 'Sakarya', 223, 1),
(3731, 'Samsun', 223, 1),
(3732, 'Sanliurfa', 223, 1),
(3733, 'Siirt', 223, 1),
(3734, 'Sinop', 223, 1),
(3735, 'Sirnak', 223, 1),
(3736, 'Sivas', 223, 1),
(3737, 'Tekirdag', 223, 1),
(3738, 'Tokat', 223, 1),
(3739, 'Trabzon', 223, 1),
(3740, 'Tunceli', 223, 1),
(3741, 'Usak', 223, 1),
(3742, 'Van', 223, 1),
(3743, 'Yalova', 223, 1),
(3744, 'Yozgat', 223, 1),
(3745, 'Zonguldak', 223, 1),
(3746, 'Ahal', 224, 1),
(3747, 'Asgabat', 224, 1),
(3748, 'Balkan', 224, 1),
(3749, 'Dasoguz', 224, 1),
(3750, 'Lebap', 224, 1),
(3751, 'Mari', 224, 1),
(3752, 'Grand Turk', 225, 1),
(3753, 'South Caicos and East Caicos', 225, 1),
(3754, 'Funafuti', 226, 1),
(3755, 'Nanumanga', 226, 1),
(3756, 'Nanumea', 226, 1),
(3757, 'Niutao', 226, 1),
(3758, 'Nui', 226, 1),
(3759, 'Nukufetau', 226, 1),
(3760, 'Nukulaelae', 226, 1),
(3761, 'Vaitupu', 226, 1),
(3762, 'Central', 227, 1),
(3763, 'Eastern', 227, 1),
(3764, 'Northern', 227, 1),
(3765, 'Western', 227, 1),
(3766, 'Cherkas\'ka', 228, 1),
(3767, 'Chernihivs\'ka', 228, 1),
(3768, 'Chernivets\'ka', 228, 1),
(3769, 'Crimea', 228, 1),
(3770, 'Dnipropetrovska', 228, 1),
(3771, 'Donets\'ka', 228, 1),
(3772, 'Ivano-Frankivs\'ka', 228, 1),
(3773, 'Kharkiv', 228, 1),
(3774, 'Kharkov', 228, 1),
(3775, 'Khersonska', 228, 1),
(3776, 'Khmel\'nyts\'ka', 228, 1),
(3777, 'Kirovohrad', 228, 1),
(3778, 'Krym', 228, 1),
(3779, 'Kyyiv', 228, 1),
(3780, 'Kyyivs\'ka', 228, 1),
(3781, 'L\'vivs\'ka', 228, 1),
(3782, 'Luhans\'ka', 228, 1),
(3783, 'Mykolayivs\'ka', 228, 1),
(3784, 'Odes\'ka', 228, 1),
(3785, 'Odessa', 228, 1),
(3786, 'Poltavs\'ka', 228, 1),
(3787, 'Rivnens\'ka', 228, 1),
(3788, 'Sevastopol\'', 228, 1),
(3789, 'Sums\'ka', 228, 1),
(3790, 'Ternopil\'s\'ka', 228, 1),
(3791, 'Volyns\'ka', 228, 1),
(3792, 'Vynnyts\'ka', 228, 1),
(3793, 'Zakarpats\'ka', 228, 1),
(3794, 'Zaporizhia', 228, 1),
(3795, 'Zhytomyrs\'ka', 228, 1),
(3796, 'Abu Zabi', 229, 1),
(3797, 'Ajman', 229, 1),
(3798, 'Dubai', 229, 1),
(3799, 'Ras al-Khaymah', 229, 1),
(3800, 'Sharjah', 229, 1),
(3801, 'Sharjha', 229, 1),
(3802, 'Umm al Qaywayn', 229, 1),
(3803, 'al-Fujayrah', 229, 1),
(3804, 'ash-Shariqah', 229, 1),
(3805, 'Aberdeen', 230, 1),
(3806, 'Aberdeenshire', 230, 1),
(3807, 'Argyll', 230, 1),
(3808, 'Armagh', 230, 1),
(3809, 'Bedfordshire', 230, 1),
(3810, 'Belfast', 230, 1),
(3811, 'Berkshire', 230, 1),
(3812, 'Birmingham', 230, 1),
(3813, 'Brechin', 230, 1),
(3814, 'Bridgnorth', 230, 1),
(3815, 'Bristol', 230, 1),
(3816, 'Buckinghamshire', 230, 1),
(3817, 'Cambridge', 230, 1),
(3818, 'Cambridgeshire', 230, 1),
(3819, 'Channel Islands', 230, 1),
(3820, 'Cheshire', 230, 1),
(3821, 'Cleveland', 230, 1),
(3822, 'Co Fermanagh', 230, 1),
(3823, 'Conwy', 230, 1);
INSERT INTO `states` (`id`, `name`, `country_id`, `status`) VALUES
(3824, 'Cornwall', 230, 1),
(3825, 'Coventry', 230, 1),
(3826, 'Craven Arms', 230, 1),
(3827, 'Cumbria', 230, 1),
(3828, 'Denbighshire', 230, 1),
(3829, 'Derby', 230, 1),
(3830, 'Derbyshire', 230, 1),
(3831, 'Devon', 230, 1),
(3832, 'Dial Code Dungannon', 230, 1),
(3833, 'Didcot', 230, 1),
(3834, 'Dorset', 230, 1),
(3835, 'Dunbartonshire', 230, 1),
(3836, 'Durham', 230, 1),
(3837, 'East Dunbartonshire', 230, 1),
(3838, 'East Lothian', 230, 1),
(3839, 'East Midlands', 230, 1),
(3840, 'East Sussex', 230, 1),
(3841, 'East Yorkshire', 230, 1),
(3842, 'England', 230, 1),
(3843, 'Essex', 230, 1),
(3844, 'Fermanagh', 230, 1),
(3845, 'Fife', 230, 1),
(3846, 'Flintshire', 230, 1),
(3847, 'Fulham', 230, 1),
(3848, 'Gainsborough', 230, 1),
(3849, 'Glocestershire', 230, 1),
(3850, 'Gwent', 230, 1),
(3851, 'Hampshire', 230, 1),
(3852, 'Hants', 230, 1),
(3853, 'Herefordshire', 230, 1),
(3854, 'Hertfordshire', 230, 1),
(3855, 'Ireland', 230, 1),
(3856, 'Isle Of Man', 230, 1),
(3857, 'Isle of Wight', 230, 1),
(3858, 'Kenford', 230, 1),
(3859, 'Kent', 230, 1),
(3860, 'Kilmarnock', 230, 1),
(3861, 'Lanarkshire', 230, 1),
(3862, 'Lancashire', 230, 1),
(3863, 'Leicestershire', 230, 1),
(3864, 'Lincolnshire', 230, 1),
(3865, 'Llanymynech', 230, 1),
(3866, 'London', 230, 1),
(3867, 'Ludlow', 230, 1),
(3868, 'Manchester', 230, 1),
(3869, 'Mayfair', 230, 1),
(3870, 'Merseyside', 230, 1),
(3871, 'Mid Glamorgan', 230, 1),
(3872, 'Middlesex', 230, 1),
(3873, 'Mildenhall', 230, 1),
(3874, 'Monmouthshire', 230, 1),
(3875, 'Newton Stewart', 230, 1),
(3876, 'Norfolk', 230, 1),
(3877, 'North Humberside', 230, 1),
(3878, 'North Yorkshire', 230, 1),
(3879, 'Northamptonshire', 230, 1),
(3880, 'Northants', 230, 1),
(3881, 'Northern Ireland', 230, 1),
(3882, 'Northumberland', 230, 1),
(3883, 'Nottinghamshire', 230, 1),
(3884, 'Oxford', 230, 1),
(3885, 'Powys', 230, 1),
(3886, 'Roos-shire', 230, 1),
(3887, 'SUSSEX', 230, 1),
(3888, 'Sark', 230, 1),
(3889, 'Scotland', 230, 1),
(3890, 'Scottish Borders', 230, 1),
(3891, 'Shropshire', 230, 1),
(3892, 'Somerset', 230, 1),
(3893, 'South Glamorgan', 230, 1),
(3894, 'South Wales', 230, 1),
(3895, 'South Yorkshire', 230, 1),
(3896, 'Southwell', 230, 1),
(3897, 'Staffordshire', 230, 1),
(3898, 'Strabane', 230, 1),
(3899, 'Suffolk', 230, 1),
(3900, 'Surrey', 230, 1),
(3901, 'Sussex', 230, 1),
(3902, 'Twickenham', 230, 1),
(3903, 'Tyne and Wear', 230, 1),
(3904, 'Tyrone', 230, 1),
(3905, 'Utah', 230, 1),
(3906, 'Wales', 230, 1),
(3907, 'Warwickshire', 230, 1),
(3908, 'West Lothian', 230, 1),
(3909, 'West Midlands', 230, 1),
(3910, 'West Sussex', 230, 1),
(3911, 'West Yorkshire', 230, 1),
(3912, 'Whissendine', 230, 1),
(3913, 'Wiltshire', 230, 1),
(3914, 'Wokingham', 230, 1),
(3915, 'Worcestershire', 230, 1),
(3916, 'Wrexham', 230, 1),
(3917, 'Wurttemberg', 230, 1),
(3918, 'Yorkshire', 230, 1),
(3919, 'Alabama', 231, 1),
(3920, 'Alaska', 231, 1),
(3921, 'Arizona', 231, 1),
(3922, 'Arkansas', 231, 1),
(3923, 'Byram', 231, 1),
(3924, 'California', 231, 1),
(3925, 'Cokato', 231, 1),
(3926, 'Colorado', 231, 1),
(3927, 'Connecticut', 231, 1),
(3928, 'Delaware', 231, 1),
(3929, 'District of Columbia', 231, 1),
(3930, 'Florida', 231, 1),
(3931, 'Georgia', 231, 1),
(3932, 'Hawaii', 231, 1),
(3933, 'Idaho', 231, 1),
(3934, 'Illinois', 231, 1),
(3935, 'Indiana', 231, 1),
(3936, 'Iowa', 231, 1),
(3937, 'Kansas', 231, 1),
(3938, 'Kentucky', 231, 1),
(3939, 'Louisiana', 231, 1),
(3940, 'Lowa', 231, 1),
(3941, 'Maine', 231, 1),
(3942, 'Maryland', 231, 1),
(3943, 'Massachusetts', 231, 1),
(3944, 'Medfield', 231, 1),
(3945, 'Michigan', 231, 1),
(3946, 'Minnesota', 231, 1),
(3947, 'Mississippi', 231, 1),
(3948, 'Missouri', 231, 1),
(3949, 'Montana', 231, 1),
(3950, 'Nebraska', 231, 1),
(3951, 'Nevada', 231, 1),
(3952, 'New Hampshire', 231, 1),
(3953, 'New Jersey', 231, 1),
(3954, 'New Jersy', 231, 1),
(3955, 'New Mexico', 231, 1),
(3956, 'New York', 231, 1),
(3957, 'North Carolina', 231, 1),
(3958, 'North Dakota', 231, 1),
(3959, 'Ohio', 231, 1),
(3960, 'Oklahoma', 231, 1),
(3961, 'Ontario', 231, 1),
(3962, 'Oregon', 231, 1),
(3963, 'Pennsylvania', 231, 1),
(3964, 'Ramey', 231, 1),
(3965, 'Rhode Island', 231, 1),
(3966, 'South Carolina', 231, 1),
(3967, 'South Dakota', 231, 1),
(3968, 'Sublimity', 231, 1),
(3969, 'Tennessee', 231, 1),
(3970, 'Texas', 231, 1),
(3971, 'Trimble', 231, 1),
(3972, 'Utah', 231, 1),
(3973, 'Vermont', 231, 1),
(3974, 'Virginia', 231, 1),
(3975, 'Washington', 231, 1),
(3976, 'West Virginia', 231, 1),
(3977, 'Wisconsin', 231, 1),
(3978, 'Wyoming', 231, 1),
(3979, 'United States Minor Outlying I', 232, 1),
(3980, 'Artigas', 233, 1),
(3981, 'Canelones', 233, 1),
(3982, 'Cerro Largo', 233, 1),
(3983, 'Colonia', 233, 1),
(3984, 'Durazno', 233, 1),
(3985, 'FLorida', 233, 1),
(3986, 'Flores', 233, 1),
(3987, 'Lavalleja', 233, 1),
(3988, 'Maldonado', 233, 1),
(3989, 'Montevideo', 233, 1),
(3990, 'Paysandu', 233, 1),
(3991, 'Rio Negro', 233, 1),
(3992, 'Rivera', 233, 1),
(3993, 'Rocha', 233, 1),
(3994, 'Salto', 233, 1),
(3995, 'San Jose', 233, 1),
(3996, 'Soriano', 233, 1),
(3997, 'Tacuarembo', 233, 1),
(3998, 'Treinta y Tres', 233, 1),
(3999, 'Andijon', 234, 1),
(4000, 'Buhoro', 234, 1),
(4001, 'Buxoro Viloyati', 234, 1),
(4002, 'Cizah', 234, 1),
(4003, 'Fargona', 234, 1),
(4004, 'Horazm', 234, 1),
(4005, 'Kaskadar', 234, 1),
(4006, 'Korakalpogiston', 234, 1),
(4007, 'Namangan', 234, 1),
(4008, 'Navoi', 234, 1),
(4009, 'Samarkand', 234, 1),
(4010, 'Sirdare', 234, 1),
(4011, 'Surhondar', 234, 1),
(4012, 'Toskent', 234, 1),
(4013, 'Malampa', 235, 1),
(4014, 'Penama', 235, 1),
(4015, 'Sanma', 235, 1),
(4016, 'Shefa', 235, 1),
(4017, 'Tafea', 235, 1),
(4018, 'Torba', 235, 1),
(4019, 'Vatican City State (Holy See)', 236, 1),
(4020, 'Amazonas', 237, 1),
(4021, 'Anzoategui', 237, 1),
(4022, 'Apure', 237, 1),
(4023, 'Aragua', 237, 1),
(4024, 'Barinas', 237, 1),
(4025, 'Bolivar', 237, 1),
(4026, 'Carabobo', 237, 1),
(4027, 'Cojedes', 237, 1),
(4028, 'Delta Amacuro', 237, 1),
(4029, 'Distrito Federal', 237, 1),
(4030, 'Falcon', 237, 1),
(4031, 'Guarico', 237, 1),
(4032, 'Lara', 237, 1),
(4033, 'Merida', 237, 1),
(4034, 'Miranda', 237, 1),
(4035, 'Monagas', 237, 1),
(4036, 'Nueva Esparta', 237, 1),
(4037, 'Portuguesa', 237, 1),
(4038, 'Sucre', 237, 1),
(4039, 'Tachira', 237, 1),
(4040, 'Trujillo', 237, 1),
(4041, 'Vargas', 237, 1),
(4042, 'Yaracuy', 237, 1),
(4043, 'Zulia', 237, 1),
(4044, 'Bac Giang', 238, 1),
(4045, 'Binh Dinh', 238, 1),
(4046, 'Binh Duong', 238, 1),
(4047, 'Da Nang', 238, 1),
(4048, 'Dong Bang Song Cuu Long', 238, 1),
(4049, 'Dong Bang Song Hong', 238, 1),
(4050, 'Dong Nai', 238, 1),
(4051, 'Dong Nam Bo', 238, 1),
(4052, 'Duyen Hai Mien Trung', 238, 1),
(4053, 'Hanoi', 238, 1),
(4054, 'Hung Yen', 238, 1),
(4055, 'Khu Bon Cu', 238, 1),
(4056, 'Long An', 238, 1),
(4057, 'Mien Nui Va Trung Du', 238, 1),
(4058, 'Thai Nguyen', 238, 1),
(4059, 'Thanh Pho Ho Chi Minh', 238, 1),
(4060, 'Thu Do Ha Noi', 238, 1),
(4061, 'Tinh Can Tho', 238, 1),
(4062, 'Tinh Da Nang', 238, 1),
(4063, 'Tinh Gia Lai', 238, 1),
(4064, 'Anegada', 239, 1),
(4065, 'Jost van Dyke', 239, 1),
(4066, 'Tortola', 239, 1),
(4067, 'Saint Croix', 240, 1),
(4068, 'Saint John', 240, 1),
(4069, 'Saint Thomas', 240, 1),
(4070, 'Alo', 241, 1),
(4071, 'Singave', 241, 1),
(4072, 'Wallis', 241, 1),
(4073, 'Bu Jaydur', 242, 1),
(4074, 'Wad-adh-Dhahab', 242, 1),
(4075, 'al-\'Ayun', 242, 1),
(4076, 'as-Samarah', 242, 1),
(4077, '\'Adan', 243, 1),
(4078, 'Abyan', 243, 1),
(4079, 'Dhamar', 243, 1),
(4080, 'Hadramaut', 243, 1),
(4081, 'Hajjah', 243, 1),
(4082, 'Hudaydah', 243, 1),
(4083, 'Ibb', 243, 1),
(4084, 'Lahij', 243, 1),
(4085, 'Ma\'rib', 243, 1),
(4086, 'Madinat San\'a', 243, 1),
(4087, 'Sa\'dah', 243, 1),
(4088, 'Sana', 243, 1),
(4089, 'Shabwah', 243, 1),
(4090, 'Ta\'izz', 243, 1),
(4091, 'al-Bayda', 243, 1),
(4092, 'al-Hudaydah', 243, 1),
(4093, 'al-Jawf', 243, 1),
(4094, 'al-Mahrah', 243, 1),
(4095, 'al-Mahwit', 243, 1),
(4096, 'Central Serbia', 244, 1),
(4097, 'Kosovo and Metohija', 244, 1),
(4098, 'Montenegro', 244, 1),
(4099, 'Republic of Serbia', 244, 1),
(4100, 'Serbia', 244, 1),
(4101, 'Vojvodina', 244, 1),
(4102, 'Central', 245, 1),
(4103, 'Copperbelt', 245, 1),
(4104, 'Eastern', 245, 1),
(4105, 'Luapala', 245, 1),
(4106, 'Lusaka', 245, 1),
(4107, 'North-Western', 245, 1),
(4108, 'Northern', 245, 1),
(4109, 'Southern', 245, 1),
(4110, 'Western', 245, 1),
(4111, 'Bulawayo', 246, 1),
(4112, 'Harare', 246, 1),
(4113, 'Manicaland', 246, 1),
(4114, 'Mashonaland Central', 246, 1),
(4115, 'Mashonaland East', 246, 1),
(4116, 'Mashonaland West', 246, 1),
(4117, 'Masvingo', 246, 1),
(4118, 'Matabeleland North', 246, 1),
(4119, 'Matabeleland South', 246, 1),
(4120, 'Midlands', 246, 1),
(4121, 'Lienchiang County', 214, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_escort`
--

CREATE TABLE `subscription_escort` (
  `subscription_id` int(11) NOT NULL,
  `escort_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `expiry_date` date NOT NULL,
  `subscription_status` int(11) NOT NULL DEFAULT '1' COMMENT '0=Not subscribe,1=Subscribe	'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription_escort`
--

INSERT INTO `subscription_escort` (`subscription_id`, `escort_id`, `plan_id`, `created_at`, `expiry_date`, `subscription_status`) VALUES
(1, 1, 2, '2019-11-26 17:21:22', '2019-12-03', 1),
(2, 3, 2, '2019-12-02 13:24:51', '2020-01-11', 1),
(3, 6, 4, '2019-12-02 14:56:42', '2020-12-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plan`
--

CREATE TABLE `subscription_plan` (
  `plan_id` int(11) NOT NULL,
  `name` varchar(555) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock , 2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription_plan`
--

INSERT INTO `subscription_plan` (`plan_id`, `name`, `type`, `count`, `amount`, `status`) VALUES
(1, '3 days', 'day', 3, 14.99, 1),
(2, '1 week', 'week', 1, 24.99, 1),
(3, '1 month', 'month', 1, 39.99, 1),
(4, '1 year', 'year', 1, 149.99, 1),
(5, '4 1111days', 'day', 4, 200, 1),
(6, '10 days', 'day', 10, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plan_user`
--

CREATE TABLE `subscription_plan_user` (
  `plan_id` int(11) NOT NULL,
  `name` varchar(555) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock , 2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription_plan_user`
--

INSERT INTO `subscription_plan_user` (`plan_id`, `name`, `type`, `count`, `amount`, `status`) VALUES
(1, '4 days', 'day', 3, 14.99, 1),
(2, '1 week', 'week', 1, 24.99, 1),
(3, '1 month', 'month', 1, 39.99, 1),
(4, '1 year', 'year', 1, 149.99, 1),
(5, '4 2days', 'day', 4, 200, 1),
(6, '25 days', 'day', 25, 30, 1),
(7, '4 dyas', 'day', 4, 200, 1),
(8, '661 days', 'day', 6, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_user`
--

CREATE TABLE `subscription_user` (
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `expiry_date` date NOT NULL,
  `subscription_status` int(11) NOT NULL DEFAULT '1' COMMENT '0=Not subscribe,1=Subscribe	'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription_user`
--

INSERT INTO `subscription_user` (`subscription_id`, `user_id`, `plan_id`, `created_at`, `expiry_date`, `subscription_status`) VALUES
(1, 1, 1, '2019-11-26 18:42:05', '2020-01-03', 1),
(2, 2, 4, '2019-11-28 12:07:33', '2023-01-28', 1),
(3, 5, 1, '2019-12-01 19:26:44', '2019-12-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `escort_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `comment`, `escort_id`) VALUES
(1, 'test message by escort', 1);

-- --------------------------------------------------------

--
-- Table structure for table `terms_condition_tbl`
--

CREATE TABLE `terms_condition_tbl` (
  `id` int(11) NOT NULL,
  `info` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms_condition_tbl`
--

INSERT INTO `terms_condition_tbl` (`id`, `info`) VALUES
(1, '<p><strong>SeductX Terms and Conditions of Use (users)</strong></p>\r\n\r\n<p>PLEASE READ THE TERMS AND CONDITIONS BEFORE USING SeductX.</p>\r\n\r\n<p>These Terms govern the use of the Site, located at Uniform Resource Locator &nbsp; &nbsp;</p>\r\n\r\n<p>, and form a binding contractual agreement between you, the User of the</p>\r\n\r\n<p>Site, and us, COMPANY NAME, CITY, REGISTRATION NUMBER.</p>\r\n\r\n<p>By using, viewing or browsing the Site, the User agrees to have had the opportunity and chance</p>\r\n\r\n<p>to read and understand these Terms, and they agree to be bound by these Terms. The User</p>\r\n\r\n<p>acknowledges and agrees that these Terms incorporate the Privacy Policy, Advertiser Terms,</p>\r\n\r\n<p>and the Replacement and Refund Policy of this Site.</p>\r\n\r\n<p>The User warrants that they are 18 years or older, and that they are legally capable of entering into</p>\r\n\r\n<p>these Terms. The use of the Site by minors is not allowed. If the User does not agree to these</p>\r\n\r\n<p>Terms, they must not access or use the Site in any way.</p>\r\n\r\n<p><strong>Accessing the Site</strong></p>\r\n\r\n<p>The User agrees to understand that SeductX does everything in its power to make the Site</p>\r\n\r\n<p>available. Despite our efforts, temporary interruptions to the Site may occur, caused by software</p>\r\n\r\n<p>updates, hardware malfunctions or other problems. SeductX shall never be liable to any person</p>\r\n\r\n<p>for any loss or damage incurred, caused by such temporary interruptions.</p>\r\n\r\n<p>All content available on the Site is provided &lsquo;as is&rsquo; and &lsquo;as available&rsquo;. Any material on the Site</p>\r\n\r\n<p>may be out of date at any given them, and SeductX is under no obligation to update such</p>\r\n\r\n<p>material. Content is provided without warranties or conditions of any kind. The User uses the Site</p>\r\n\r\n<p>at their own risk. SeductX has the right to withdraw or amend content on the Site or content</p>\r\n\r\n<p>provided through the Site without notice. Some parts of the website may be restricted from time</p>\r\n\r\n<p>to time.</p>\r\n\r\n<p><strong>Our Services</strong></p>\r\n\r\n<p>SeductX provides an online platform for the publication and display of advertising&nbsp;</p>\r\n\r\n<p>of social escort services. SeductX does not become a party to any communications, posts,</p>\r\n\r\n<p>promises, proposals, resulting contracts or transactions entered into by users and the advertisers</p>\r\n\r\n<p>on the Site. SeductX is not responsible for the performance of resulting contracts or transactions</p>\r\n\r\n<p>between the User and Advertisers on the Site.</p>\r\n\r\n<p>Users need to undertake their own independent due diligence prior to agreeing on a contract with</p>\r\n\r\n<p>an advertiser. SeductX can&rsquo;t ensure or guarantee that an advertiser will complete a contract or</p>\r\n\r\n<p>transaction, or that the advertiser will fulfil the contract as advertised. Always ensure that safety</p>\r\n\r\n<p>procedures are implemented whilst dealing with advertisers.</p>\r\n\r\n<p>The User hereby releases SeductX, the Site, and its affiliates, officers, directors, agents,</p>\r\n\r\n<p>subsidiaries, joint venturers, and employees, from any claims, demands and damages (actual</p>\r\n\r\n<p>and consequential) of every kind and nature, known and unknown, arising out of or in any way</p>\r\n\r\n<p>connected with any dispute you may have with any advertisers on the Site, whether it be at law</p>\r\n\r\n<p>or in equity. This includes refunds.</p>\r\n\r\n<p><strong>Members Only</strong></p>\r\n\r\n<p>Subject to payment of the subscription fee, for a period of days from the date of the receipt of</p>\r\n\r\n<p>payment by SeductX, you will be granted access to Members Only sections of the Site.</p>\r\n\r\n<p>Your access to and use of the Members Only are subject to these Terms.</p>\r\n\r\n<p>The subscription fee is inclusive of GST. SeductX reserves the right to update its subscription</p>\r\n\r\n<p>fees from time to time and in its sole discretion. We will notify users of any changes to our</p>\r\n\r\n<p>subscription fees 14 days before we roll out updates by posting it on the Site or by sending a</p>\r\n\r\n<p>communication to any address (email or otherwise) that we have for users in our records.</p>\r\n\r\n<p>Any payments are made through the relevant payment gateways. SeductX is not responsible or</p>\r\n\r\n<p>has any control over any third party payment gateways. You acknowledge and agree that</p>\r\n\r\n<p>SeductX will not be liable for any loss or damage arising out of their use of a third party payment</p>\r\n\r\n<p>gateway. SeductX advises that you should read and understand the terms and conditions of any</p>\r\n\r\n<p>third party payment gateway prior to using them.</p>\r\n\r\n<p><strong>The User</strong></p>\r\n\r\n<p>The User visits, searches and browses the Site at their own risk. The Site is a directory only and</p>\r\n\r\n<p>Users should satisfy themselves as to the accuracy of the legitimacy and qualification of the</p>\r\n\r\n<p>Advertiser. SeductX will not be responsible for any money lost by Users in respect to</p>\r\n\r\n<p>transactions instigated through advertisements on the Site.</p>\r\n\r\n<p>The User consents to receiving email messages from SeductX. SeductX recommends only using</p>\r\n\r\n<p>personal email addresses and personal computers.</p>\r\n\r\n<p>The User agrees not to reproduce, adapt, upload or link to any material on the Site without prior</p>\r\n\r\n<p>consent of SeductX, or the relevant third party website owner(s). This includes saving clips from</p>\r\n\r\n<p>the Site or any other media. Every User complies with their obligations under these Terms and</p>\r\n\r\n<p>Conditions.</p>\r\n\r\n<p>The User acknowledges and agrees that they are responsible for their own conduct while using</p>\r\n\r\n<p>the Site and for any consequences arising from such use of the Site. They agree to only use the</p>\r\n\r\n<p>Site for purposes that are legal, proper, and in accordance with these Terms.</p>\r\n\r\n<p>The User will not use the Website for any illegal activities or any activities which are likely to</p>\r\n\r\n<p>cause loss, cost or damage to SeductX. The User will also not interfere with or disrupt the access</p>\r\n\r\n<p>of other Users of the Site in any way.</p>\r\n\r\n<p>The User discharges SeductX from all liability for damages or loss of any kind arising out of use,</p>\r\n\r\n<p>reference to, or reliance on any advertisements contained on the Site or transactions that are</p>\r\n\r\n<p>instigated because of such advertisements or use of the Site.</p>\r\n\r\n<p>You must notify us of any conduct that you regard to be prohibited conduct or use under these</p>\r\n\r\n<p>Terms by emailing us at ADMIN EMAIL. SeductX reserves the right to undertake any remedial</p>\r\n\r\n<p>action, e.g. editing, retracting or deleting any content or advertising content or suspension and</p>\r\n\r\n<p>termination of access to the Site.</p>\r\n\r\n<p><strong>Disclaimer</strong></p>\r\n\r\n<p>This disclaimer of liability applies to any damages, injury or death caused by any failure of</p>\r\n\r\n<p>performance, error, omission, interruption, deletion, defect, delay in operation or transmission,</p>\r\n\r\n<p>computer virus, communication line failure, theft, or destruction or unauthorized access or,</p>\r\n\r\n<p>alteration of or use of record in connection with the use or operation of the Site, whether for</p>\r\n\r\n<p>breach of contract, tortious behaviour, negligence or any other cause of action.</p>\r\n\r\n<p>SeductX make no representations or warranties of any kind, express or implied, about the</p>\r\n\r\n<p>completeness, accuracy, reliability, suitability or availability with respect to the Site or the content,</p>\r\n\r\n<p>including any Advertiser Content, contained on the Site for any purpose. Any reliance you place</p>\r\n\r\n<p>on such information is therefore strictly at your own risk.</p>\r\n\r\n<p><strong>SeductX Intellectual Property</strong></p>\r\n\r\n<p>SeductX owns or holds a licence to all intellectual property rights in the Site (text, graphics,</p>\r\n\r\n<p>logos, icons, sound recordings and software, and trademarks) excluding Advertiser Content.</p>\r\n\r\n<p>Nothing in these Terms constitutes a transfer of any intellectual property rights from SeductX to</p>\r\n\r\n<p>you.</p>\r\n\r\n<p>You must not adapt, reproduce, store, distribute, print, display, perform, publish or create</p>\r\n\r\n<p>derivative works from any part of this Site or commercialise any information, products or services</p>\r\n\r\n<p>obtained from any part of the Site without SeductX&rsquo; prior written consent.</p>\r\n\r\n<p>You are permitted to use the Site only as authorised by us. As a user, you are granted a limited,</p>\r\n\r\n<p>non-exclusive, revocable, non-transferable right to use the Site to view and download content</p>\r\n\r\n<p>subject to these Terms.</p>\r\n\r\n<p>You must not use any of our intellectual property:</p>\r\n\r\n<p>in or as the whole or part of your own trademarks;</p>\r\n\r\n<p>in connection with activities, products or services which are not ours;</p>\r\n\r\n<p>in a manner which may be confusing, misleading or deceptive; or</p>\r\n\r\n<p>in a manner that disparages us or our information, products or services (including this Site).</p>\r\n\r\n<p>Unless expressly stated, all persons, third party trademarks and images of third-party products,</p>\r\n\r\n<p>services or locations on the Site are in no way associated, linked or affiliated with SeductX and you should not rely on the existence of such a connection. Where a trademark or</p>\r\n\r\n<p>brand name is used, it is used solely to describe or identify products or services.</p>\r\n\r\n<p><strong>Advertiser Content</strong></p>\r\n\r\n<p>The Site publishes and displays advertisements for services provided by advertisers (Advertiser</p>\r\n\r\n<p>Content). Any information or content made available by these advertisers are those of the</p>\r\n\r\n<p>respective advertiser(s) and not of SeductX. SeductX do not endorse any Advertiser Content</p>\r\n\r\n<p>appearing on the Site nor are we responsible for the accuracy or reliability of any opinion, advice,</p>\r\n\r\n<p>information or statements made on Advertiser Content available on the Site.</p>\r\n\r\n<p>While SeductX uses all reasonable endeavours to moderate Advertiser Content, We cannot confirm or verify and therefore cannot guarantee that any Advertiser Content is</p>\r\n\r\n<p>accurate or error-free.</p>\r\n\r\n<p>Third Party Websites</p>\r\n\r\n<p>The Site may link to other websites, services or resources on the Internet, and other websites,</p>\r\n\r\n<p>services or resources may contain links to the Site, for example website traffic monitoring or</p>\r\n\r\n<p>payment processing. These websites are not under our control and are not maintained by</p>\r\n\r\n<p>SeductX. We are not responsible for the content of those websites.</p>\r\n\r\n<p>We only provide links to external websites as a convenience, and the inclusion of such a link to</p>\r\n\r\n<p>external websites do not imply our endorsement of those websites. You acknowledge and agree</p>\r\n\r\n<p>that when you access other websites on the Internet, you do so at your own risk.</p>\r\n\r\n<p>We make no representation about any other website you access through this one. Please</p>\r\n\r\n<p>understand other websites are independent from our sites so we do not accept responsibility for</p>\r\n\r\n<p>such websites.</p>\r\n\r\n<p><strong>Limitation of Liability and Indemnity</strong></p>\r\n\r\n<p>You agree that we shall not be liable for any damages suffered as a result of using the Site,</p>\r\n\r\n<p>copying, distributing, or downloading content (including Advertiser Content) from the Site. In no</p>\r\n\r\n<p>event shall we be liable for any indirect, punitive, special, incidental or consequential damages</p>\r\n\r\n<p>(including loss of business, revenue, profits, use, privacy, data, goodwill or other economic</p>\r\n\r\n<p>advantage) however it arises, whether for breach of contract or in tort, even if it has been</p>\r\n\r\n<p>previously advised of the possibility of such damage.</p>\r\n\r\n<p>We do not endorse any Advertiser Content and expressly disclaim any and all liability in</p>\r\n\r\n<p>connection with them. We do not confirm and verify Advertiser Content. SeductX is never liable</p>\r\n\r\n<p>to any claims based on Advertiser Content.</p>\r\n\r\n<p>You have sole responsibility for adequate security protection and backup of data and/or</p>\r\n\r\n<p>equipment used in connection with your usage of the Site and will not make a claim against</p>\r\n\r\n<p>SeductX for lost data, re-run time, inaccurate instruction, work delays or lost profits resulting from</p>\r\n\r\n<p>the use of the Site.</p>\r\n\r\n<p>As a condition of your access to and use of the Site, you agree to defend, hold harmless, and</p>\r\n\r\n<p>indemnify SeductX and its successors and assigns for all damages, costs, expenses and other</p>\r\n\r\n<p>liabilities, including but not limited to legal fees and expenses, relating to any claim arising out of</p>\r\n\r\n<p>or related to:</p>\r\n\r\n<p>your access to and use of the Site, including any payment obligations incurred through the use of</p>\r\n\r\n<p>the Site; or your breach of these Terms and any applicable law or the rights of another person or</p>\r\n\r\n<p>party; any breach of contract or other claims made between users and advertisers; or any liability</p>\r\n\r\n<p>arising from the tax treatment of payments or any portion thereof. This indemnification survives</p>\r\n\r\n<p>the expiration or termination of these Terms.</p>\r\n\r\n<p>To the extent permitted by law, any condition or warranty which would otherwise be implied into</p>\r\n\r\n<p>these Terms are excluded. Where legislation implies any condition or warranty, and that</p>\r\n\r\n<p>legislation prohibits us from excluding or modifying the application of, or our liability under, any</p>\r\n\r\n<p>such condition or warranty, that condition or warranty will be deemed included.</p>\r\n\r\n<p><strong>Termination</strong></p>\r\n\r\n<p>SeductX may terminate or suspend the User&rsquo;s access to the Site at any time without notice.</p>\r\n\r\n<p>SeductX is not liable to the User or any third party for any claims or damages arising out of any</p>\r\n\r\n<p>account termination or account suspension or any other actions taken in connection with these</p>\r\n\r\n<p>Terms.</p>\r\n\r\n<p>If applicable law requires us to provide notice of termination or cancellation, we may give prior or</p>\r\n\r\n<p>subsequent notice by posting it on the Site or by sending a communication to any address (email</p>\r\n\r\n<p>or otherwise) that we have for you in our records.</p>\r\n\r\n<p>Violations of these Terms may be prosecuted to the fullest extent of the law and may result in</p>\r\n\r\n<p>additional penalties and sanctions.</p>\r\n\r\n<p><strong>Governing Law</strong></p>\r\n\r\n<p>These Terms are governed by the laws in force in The Netherlands. Any disputes arising from or</p>\r\n\r\n<p>in relation to the use of the Site or the Terms shall be subject to the jurisdiction of the competent</p>\r\n\r\n<p>court in Amsterdam, The Netherlands.</p>\r\n\r\n<p><strong>General</strong></p>\r\n\r\n<p>SeductX accepts no liability for any failure to comply with these Terms and Conditions where</p>\r\n\r\n<p>such failure is due to circumstances beyond our reasonable control. If SeductX waives any rights</p>\r\n\r\n<p>on one occasion, this does not mean that those rights will automatically be waived on any other</p>\r\n\r\n<p>occasion.</p>\r\n\r\n<p>If any of these Terms are held to be invalid or illegal for any reason, the remaining Terms shall</p>\r\n\r\n<p>nevertheless, continue in force.</p>\r\n\r\n<p>These Terms, and the documents expressly referred to in them, constitute the entire agreement</p>\r\n\r\n<p>between you and SeductX, and supersede all previous discussions, correspondence,</p>\r\n\r\n<p>negotiations, previous arrangements, understanding or agreement between us relating to the</p>\r\n\r\n<p>Site.</p>\r\n\r\n<p>The User and SeductX acknowledge that, in entering into these Terms, neither of them relies on,</p>\r\n\r\n<p>and subsequently will have any remedies for, any representation or warranty that is not set out in</p>\r\n\r\n<p>these Terms. SeductX may assign or sublicense their rights or obligations under these Terms at</p>\r\n\r\n<p>any time without obtaining the User&rsquo;s consent.</p>\r\n\r\n<p>Updates to these Terms</p>\r\n\r\n<p>SeductX reserves the right to amend these Terms from time to time at their sole discretion.</p>\r\n\r\n<p>Notification of the changes to these Terms will be posted on the Site and will be effective</p>\r\n\r\n<p>immediately, unless expressed otherwise.</p>\r\n\r\n<p>The User is responsible to periodically check these Terms for any changes. If the User does not</p>\r\n\r\n<p>agree to changes in these Terms, they must immediately cease using the Site. The User&rsquo;s</p>\r\n\r\n<p>continued use of the Site will be deemed as their acceptance of such changes.</p>\r\n\r\n<p>LAST UPDATE THE TERMS &amp; CONDITIONS: August 4th 2019</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `deviceToken` varchar(555) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `avg_rating` float NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `mobile_verify` int(11) NOT NULL COMMENT '0 - unverify ,1 - verify ',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock , 2 -block '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `deviceToken`, `password`, `reset_code`, `country_code`, `phone_number`, `avg_rating`, `latitude`, `longitude`, `token`, `created_at`, `mobile_verify`, `status`) VALUES
(1, 'amit', 'user', 'user@mailinator.com', 'cMiR8-p7Z20:APA91bHlhqakxEIxRW5DLrQhpX1ovSSdKYg7Za23RtJA6i_m6z_3QTAUKi1NDCob1O1vjZ_hcgEvPjRf6GszNizG-2zpCF5Z_7tAoM-Mk-F-OK0l3aaciIBfYFQmrR9XLlYyxOsb5VKD', 'e10adc3949ba59abbe56e057f20f883e', '', '101', '8319846729', 3, '22.724355', '75.88389440000003', '', '2019-11-26 17:23:36', 1, 1),
(2, 'rajiv', 'user', 'rajiv@mailinator.com', '', 'e10adc3949ba59abbe56e057f20f883e', '', '101', '22222343324', 0, '22.7532848', '75.89369620000002', '', '2019-11-27 14:01:32', 1, 1),
(3, 'kabir', 'user', 'kabir@mailinator.com', 'fJbXEcrtjFs:APA91bEwKqrLXqqY4SAUsgQ_qBF2GTaxwwPRFwo4Wri9lZbPyaIDnZ788A299Z3tF_0tSb9chbu93WKQbX60ObePynJtRJSjxJDWlCB_ql1Z7LfzmEW484JitX-d1U9wybKJEC5WOgjr', 'e10adc3949ba59abbe56e057f20f883e', '', '101', '4354345345345', 0, '12.975596', '77.53538809999998', '', '2019-11-28 12:45:29', 1, 1),
(4, 'jensberh', 'man', 'jens@mailinator.com', '', 'e10adc3949ba59abbe56e057f20f883e', '', '101', '89568956885', 0, '22.7195687', '75.85772580000003', '', '2019-11-29 17:39:32', 1, 1),
(5, 'Luke', 'Dunshea', 'dunshea.luke@gmail.com', 'dgdU3mcZ7wg:APA91bFRLbFGvKRXChRfdyQeeHGfCozt0LVbHNAhWLTu-NDIbVdkSbZ_f4Ck58igjUCOIY5IPM47tPhSq5PqLpdfZ-rPGdKsFKFz3R_TTgZbAgcxt1V0wSwyp4QTTU-C3qK-2suuftsI', 'be3c7e93261b294853dc313c62dcaa1e', '', '13', '0499987599', 0, '-33.8688197', '151.20929550000005', '889073326', '2019-11-30 21:09:25', 1, 1),
(6, 'rajiv@mailinator.com', '123456', 'rajiv23@mailinator.com', '', 'e10adc3949ba59abbe56e057f20f883e', '', '101', '789789789', 0, '22.7195687', '75.85772580000003', '', '2019-12-02 11:37:34', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `waise_size`
--

CREATE TABLE `waise_size` (
  `waise_size_id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 - unblock,2 -block'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waise_size`
--

INSERT INTO `waise_size` (`waise_size_id`, `size`, `status`) VALUES
(1, 20, 1),
(2, 22, 1),
(3, 24, 1),
(4, 26, 1),
(5, 28, 1),
(6, 30, 1),
(7, 32, 1),
(8, 34, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `body_type`
--
ALTER TABLE `body_type`
  ADD PRIMARY KEY (`body_type_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `bust_size`
--
ALTER TABLE `bust_size`
  ADD PRIMARY KEY (`bust_size_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chinese`
--
ALTER TABLE `chinese`
  ADD PRIMARY KEY (`chinese_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cup_size`
--
ALTER TABLE `cup_size`
  ADD PRIMARY KEY (`cup_size_id`);

--
-- Indexes for table `english`
--
ALTER TABLE `english`
  ADD PRIMARY KEY (`english_id`);

--
-- Indexes for table `escort`
--
ALTER TABLE `escort`
  ADD PRIMARY KEY (`escort_id`);

--
-- Indexes for table `escort_additional_service`
--
ALTER TABLE `escort_additional_service`
  ADD PRIMARY KEY (`escort_additional_service_id`);

--
-- Indexes for table `escort_follow`
--
ALTER TABLE `escort_follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `escort_rate`
--
ALTER TABLE `escort_rate`
  ADD PRIMARY KEY (`escort_rate_id`);

--
-- Indexes for table `faq_tbl`
--
ALTER TABLE `faq_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `hip_size`
--
ALTER TABLE `hip_size`
  ADD PRIMARY KEY (`hip_size_id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`hour_id`);

--
-- Indexes for table `japanese`
--
ALTER TABLE `japanese`
  ADD PRIMARY KEY (`japanese_id`);

--
-- Indexes for table `korean`
--
ALTER TABLE `korean`
  ADD PRIMARY KEY (`korean_id`);

--
-- Indexes for table `notification_tbl`
--
ALTER TABLE `notification_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_escort`
--
ALTER TABLE `payment_escort`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment_user`
--
ALTER TABLE `payment_user`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `privacy_policy_tbl`
--
ALTER TABLE `privacy_policy_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_escort`
--
ALTER TABLE `rating_escort`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `rating_user`
--
ALTER TABLE `rating_user`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`services_id`);

--
-- Indexes for table `service_price`
--
ALTER TABLE `service_price`
  ADD PRIMARY KEY (`service_price_id`);

--
-- Indexes for table `shots`
--
ALTER TABLE `shots`
  ADD PRIMARY KEY (`shot_id`);

--
-- Indexes for table `shots_price`
--
ALTER TABLE `shots_price`
  ADD PRIMARY KEY (`shots_price_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_escort`
--
ALTER TABLE `subscription_escort`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `subscription_plan`
--
ALTER TABLE `subscription_plan`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `subscription_plan_user`
--
ALTER TABLE `subscription_plan_user`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `subscription_user`
--
ALTER TABLE `subscription_user`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_condition_tbl`
--
ALTER TABLE `terms_condition_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `waise_size`
--
ALTER TABLE `waise_size`
  ADD PRIMARY KEY (`waise_size_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `body_type`
--
ALTER TABLE `body_type`
  MODIFY `body_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bust_size`
--
ALTER TABLE `bust_size`
  MODIFY `bust_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `chinese`
--
ALTER TABLE `chinese`
  MODIFY `chinese_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cup_size`
--
ALTER TABLE `cup_size`
  MODIFY `cup_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `english`
--
ALTER TABLE `english`
  MODIFY `english_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `escort`
--
ALTER TABLE `escort`
  MODIFY `escort_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `escort_additional_service`
--
ALTER TABLE `escort_additional_service`
  MODIFY `escort_additional_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `escort_follow`
--
ALTER TABLE `escort_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `escort_rate`
--
ALTER TABLE `escort_rate`
  MODIFY `escort_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `faq_tbl`
--
ALTER TABLE `faq_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hip_size`
--
ALTER TABLE `hip_size`
  MODIFY `hip_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `hour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `japanese`
--
ALTER TABLE `japanese`
  MODIFY `japanese_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `korean`
--
ALTER TABLE `korean`
  MODIFY `korean_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notification_tbl`
--
ALTER TABLE `notification_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `payment_escort`
--
ALTER TABLE `payment_escort`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_user`
--
ALTER TABLE `payment_user`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `privacy_policy_tbl`
--
ALTER TABLE `privacy_policy_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating_escort`
--
ALTER TABLE `rating_escort`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rating_user`
--
ALTER TABLE `rating_user`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `services_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_price`
--
ALTER TABLE `service_price`
  MODIFY `service_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shots`
--
ALTER TABLE `shots`
  MODIFY `shot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `shots_price`
--
ALTER TABLE `shots_price`
  MODIFY `shots_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4122;

--
-- AUTO_INCREMENT for table `subscription_escort`
--
ALTER TABLE `subscription_escort`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscription_plan`
--
ALTER TABLE `subscription_plan`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscription_plan_user`
--
ALTER TABLE `subscription_plan_user`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscription_user`
--
ALTER TABLE `subscription_user`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms_condition_tbl`
--
ALTER TABLE `terms_condition_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `waise_size`
--
ALTER TABLE `waise_size`
  MODIFY `waise_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
