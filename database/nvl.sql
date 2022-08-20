-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2020 at 01:24 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nvl`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullName` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `role` varchar(100) NOT NULL,
  `creditPoint` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `fullName`, `phone`, `email`, `address`, `role`, `creditPoint`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 'nang', '$2a$10$T1vs8xnfDBKoT8.8VIY2wO3xD6VgL1yBdV7W43cLKdc6.GFPsb.sa', 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', 'ROLE_MEMBER', 3500, 1, '2020-04-12 04:34:14', '2020-05-29 12:49:51'),
(2, 'viet', '$2a$10$PwN16aPZxbMG8DfV1mo/neqV7csUV6f/MAEy1UQTY.ySN9ojBOHXK', 'Viet', '114', 'yudah169s@gmail.com', '115', 'ROLE_ADMIN', 1, 1, '2020-04-12 04:34:14', '2020-05-27 14:37:49'),
(3, 'long', '$2a$10$JWGILvd13lO5CaI958IHweppuZGZbbLiiPbBA6DZALEKC0ubxa1bC', 'Do Van Long', '0903746182', 'long@gmail.com', '', 'ROLE_MEMBER', 1, 1, '2020-04-12 04:34:14', '2020-04-17 07:07:54'),
(4, 'nam', '$2a$10$JWGILvd13lO5CaI958IHweppuZGZbbLiiPbBA6DZALEKC0ubxa1bC', 'Hai Nam', '874638209', 'nam@gmail.com', 'abc', 'ROLE_MEMBER', 0, 1, '2020-04-17 06:32:06', '2020-04-17 07:07:49'),
(5, 'son', '$2a$10$JWGILvd13lO5CaI958IHweppuZGZbbLiiPbBA6DZALEKC0ubxa1bC', 'Pham Thai Son', '0903746283', 'son@gmail.com', 'abc', 'ROLE_MEMBER', 0, 1, '2020-04-17 07:07:36', '2020-04-17 07:07:36'),
(6, 'Andy', '$2a$10$Ijs8n/jjrIgOMJpSC6oZJu8ikmBe7GR9SBz/b4sLTwmFiJocp9AAC', 'Andy Nguyen', '0905736234', 'andy_nguyen@gmail.com', '40 Tran Hung Dao Street, Ward 5, District 1, Ho Chi Minh City', 'ROLE_MEMBER', 0, 1, '2020-05-10 07:58:37', '2020-05-10 07:58:37'),
(7, 'namhai', '$2a$10$VGm9HmTuH5Xg5uwhGyVmG.TgNgrLbRGCTbAceN/qijJkTj803CmNC', 'Hai Nam A', '09037485732', 'nvl.test2020@gmail.com', 'Nam B Street', 'ROLE_MEMBER', 3500, 1, '2020-06-05 22:58:49', '2020-06-05 23:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 'Apple', 1, '2020-04-04 12:37:56', '2020-05-15 12:03:09'),
(2, 'Samsung', 1, '2020-04-04 12:37:56', '2020-04-14 14:44:52'),
(3, 'iJoy', 1, '2020-05-09 09:01:05', '2020-05-09 09:01:05'),
(4, 'Beats', 1, '2020-05-09 09:59:40', '2020-05-09 09:59:40'),
(5, 'Anker', 1, '2020-05-09 10:03:13', '2020-05-09 10:03:13'),
(6, 'Sony', 1, '2020-05-09 10:06:39', '2020-05-09 10:06:39'),
(7, 'Aukey', 1, '2020-05-09 10:09:12', '2020-05-09 10:09:12'),
(8, 'LG Electronics', 1, '2020-05-12 20:31:47', '2020-05-12 20:31:47'),
(9, 'Google', 1, '2020-05-12 20:35:03', '2020-05-12 20:35:03'),
(10, 'Xiaomi', 1, '2020-05-12 20:46:19', '2020-05-12 20:46:19'),
(11, 'Motorola', 1, '2020-05-12 20:55:37', '2020-05-12 20:55:37'),
(12, 'test update', 0, '2020-05-19 10:30:31', '2020-05-19 10:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 'Smart Phone', 1, '2020-04-05 05:11:49', '2020-04-21 17:17:17'),
(2, 'Accessory', 1, '2020-04-05 05:11:49', '2020-04-21 17:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `commend`
--

CREATE TABLE `commend` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commend`
--

INSERT INTO `commend` (`id`, `productId`, `accountId`, `rate`, `content`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 1, 1, 5, 'Very Good', 1, '2020-05-10 06:11:15', '2020-05-10 06:11:15'),
(2, 1, 1, 5, 'Very Good', 1, '2020-05-10 06:12:44', '2020-05-10 06:12:44'),
(4, 1, 2, 5, 'Suck!', 0, '2020-05-10 06:12:44', '2020-05-22 09:07:27'),
(5, 14, 1, 0, 'test 3', 1, '2020-05-27 15:47:04', '2020-05-27 15:47:09'),
(6, 14, 1, 5, 'dw', 1, '2020-05-27 15:47:40', '2020-05-27 15:47:44'),
(7, 21, 1, 5, 'abc', 0, '2020-05-29 19:49:29', '2020-05-29 19:49:29'),
(8, 21, 1, 5, 'abc', 0, '2020-05-29 19:51:29', '2020-05-29 19:51:29'),
(9, 17, 1, 5, 'abc', 0, '2020-05-29 19:55:49', '2020-05-29 19:55:49'),
(10, 17, 1, 5, 'abc', 0, '2020-05-29 19:57:04', '2020-05-29 19:57:04'),
(11, 13, 1, 5, 'testing', 0, '2020-05-29 20:08:49', '2020-05-29 20:08:49'),
(12, 13, 1, 3, 'a', 0, '2020-05-29 20:18:41', '2020-05-29 20:18:41'),
(13, 13, 1, 5, 'def', 0, '2020-05-29 20:28:03', '2020-05-29 20:28:03'),
(14, 13, 1, 3, 'vbn', 0, '2020-05-29 20:30:05', '2020-05-29 20:30:05'),
(15, 13, 1, 4, 'as', 0, '2020-05-29 20:41:02', '2020-05-29 20:41:02'),
(16, 13, 1, 4, 'd', 0, '2020-05-29 20:41:40', '2020-05-29 20:41:40'),
(17, 13, 1, 4, 'ag', 0, '2020-05-29 20:46:11', '2020-05-29 20:46:11'),
(18, 21, 7, 5, 'ABC', 1, '2020-06-05 23:31:38', '2020-06-05 23:32:07'),
(19, 21, 7, 2, 'Good', 1, '2020-06-05 23:32:21', '2020-06-05 23:32:36');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `destination` varchar(250) DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `orderId`, `type`, `destination`, `deliveryDate`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 1, 'Express', 'destination1', '2020-05-07', 'Scheduling', '2020-04-21 17:56:47', '2020-05-29 10:47:14'),
(2, 2, 'Express', 'destination2', '2020-04-27', 'Delivering', '2020-04-21 17:56:47', '2020-05-08 11:51:36'),
(3, 3, 'Express', 'dwwadsw', '2020-05-09', 'Received', '2020-05-09 14:13:34', '2020-05-15 20:34:16'),
(4, 4, 'Express', 'dwasdw', '2020-05-09', 'Canceled', '2020-05-09 14:25:41', '2020-05-15 20:34:27'),
(5, 5, 'Express', 'wdasdw', '2020-05-09', 'Scheduling', '2020-05-09 14:32:46', '2020-05-15 20:34:32'),
(6, 6, 'Express', 'dwads', '2020-05-09', 'Received', '2020-05-09 14:34:37', '2020-05-15 20:34:39'),
(7, 7, 'Normal', 'dwadw', '2020-05-09', 'Canceled', '2020-05-09 14:51:19', '2020-05-15 20:34:42'),
(8, 8, 'Express', 'dwasdw', '2020-05-09', 'Delivering', '2020-05-09 14:53:17', '2020-05-15 20:34:36'),
(9, 9, 'Normal', '1000/30 Nguyen Trai Street', '2020-05-29', 'Awaiting', '2020-05-29 08:59:08', '2020-05-29 08:59:08'),
(10, 10, 'Express', '205/10 Nguyen Kim Street, Ward 7, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 10:33:34', '2020-05-29 10:33:34'),
(11, 11, 'Normal', '20 Nguyen Dinh Chieu', '2020-05-29', 'Awaiting', '2020-05-29 12:12:24', '2020-05-29 12:12:24'),
(12, 12, 'Express', '20 Pham Hung', '2020-05-29', 'Awaiting', '2020-05-29 12:31:36', '2020-05-29 12:31:36'),
(13, 13, 'Normal', '200 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 12:38:49', '2020-05-29 12:38:49'),
(14, 14, 'Normal', '200 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 12:42:13', '2020-05-29 12:42:13'),
(15, 15, 'Normal', '200 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 12:48:20', '2020-05-29 12:48:20'),
(16, 16, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 12:52:41', '2020-05-29 12:52:41'),
(17, 17, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 13:20:23', '2020-05-29 13:20:23'),
(18, 18, 'Express', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 13:26:01', '2020-05-29 13:26:01'),
(19, 19, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 13:47:43', '2020-05-29 13:47:43'),
(20, 20, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 13:48:29', '2020-05-29 13:48:29'),
(21, 21, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 13:49:50', '2020-05-29 13:49:50'),
(22, 22, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 14:05:49', '2020-05-29 14:05:49'),
(23, 23, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 14:09:35', '2020-05-29 14:09:35'),
(24, 24, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-05-29', 'Awaiting', '2020-05-29 15:38:45', '2020-05-29 15:38:45'),
(25, 25, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-06-04', 'Awaiting', '2020-06-04 11:31:24', '2020-06-04 11:31:24'),
(26, 26, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-06-04', 'Awaiting', '2020-06-04 11:40:27', '2020-06-04 11:40:27'),
(27, 27, 'Express', 'abc Street ', '2020-06-06', 'Awaiting', '2020-06-05 22:41:52', '2020-06-05 22:41:52'),
(28, 28, 'Express', 'abc street', '2020-06-06', 'Awaiting', '2020-06-05 22:48:23', '2020-06-05 22:48:23'),
(29, 29, 'Normal', 'abc Street', '2020-06-06', 'Awaiting', '2020-06-05 22:54:25', '2020-06-05 22:54:25'),
(30, 30, 'Normal', 'Nam B Street', '2020-06-06', 'Awaiting', '2020-06-05 23:07:12', '2020-06-05 23:07:12'),
(31, 31, 'Normal', 'Nam B Street', '2020-06-06', 'Awaiting', '2020-06-05 23:13:13', '2020-06-05 23:13:13'),
(32, 32, 'Normal', 'Nam B Street', '2020-06-06', 'Awaiting', '2020-06-05 23:18:15', '2020-06-05 23:18:15'),
(33, 33, 'Normal', 'Nam B Street', '2020-06-06', 'Awaiting', '2020-06-05 23:28:15', '2020-06-05 23:28:15'),
(34, 34, 'Normal', '220 Ly Thuong Kiet Street, Ward 6, District 11, HCM City', '2020-06-06', 'Awaiting', '2020-06-06 01:08:33', '2020-06-06 01:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `exchange`
--

CREATE TABLE `exchange` (
  `id` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `voucherId` int(11) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exchange`
--

INSERT INTO `exchange` (`id`, `point`, `status`, `accountId`, `orderId`, `voucherId`, `createdDate`, `modifiedDate`) VALUES
(1, 2000, 1, 1, 1, 2, '2020-05-09 14:53:17', '2020-05-27 04:01:37'),
(2, NULL, 0, 1, 13, NULL, '2020-05-29 12:38:49', '2020-05-29 12:38:49'),
(3, 1000, 0, 1, 14, 1, '2020-05-29 12:42:13', '2020-05-29 12:42:13'),
(4, 2000, 0, 1, 15, 2, '2020-05-29 12:48:21', '2020-05-29 12:48:21'),
(5, 2000, 0, 1, 16, 2, '2020-05-29 12:52:41', '2020-05-29 12:52:41'),
(6, NULL, 0, 1, 17, NULL, '2020-05-29 13:20:23', '2020-05-29 13:20:23'),
(7, 2000, 0, 1, 18, 2, '2020-05-29 13:26:01', '2020-05-29 13:26:01'),
(8, 3000, 0, 1, 20, 3, '2020-05-29 13:48:29', '2020-05-29 13:48:29'),
(9, 3000, 0, 1, 21, 3, '2020-05-29 13:49:50', '2020-05-29 13:49:50'),
(10, 2000, 0, 1, 22, 2, '2020-05-29 14:05:49', '2020-05-29 14:05:49'),
(11, 1000, 0, 1, 25, 1, '2020-06-04 11:31:24', '2020-06-04 11:31:24'),
(12, 3000, 0, 7, 30, 3, '2020-06-05 23:07:12', '2020-06-05 23:07:12'),
(13, 3000, 0, 7, 31, 3, '2020-06-05 23:13:13', '2020-06-05 23:13:13'),
(14, 3000, 0, 7, 32, 3, '2020-06-05 23:18:15', '2020-06-05 23:18:15'),
(15, 2000, 0, 7, 33, 2, '2020-06-05 23:28:15', '2020-06-05 23:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `new`
--

CREATE TABLE `new` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new`
--

INSERT INTO `new` (`id`, `title`, `content`, `photo`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 'test', 'test', 'test', 1, '2020-04-24 07:24:45', '2020-04-24 07:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  `customerName` varchar(250) DEFAULT NULL,
  `customerPhone` varchar(250) DEFAULT NULL,
  `customerEmail` varchar(250) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `code`, `status`, `accountId`, `customerName`, `customerPhone`, `customerEmail`, `createdDate`, `modifiedDate`) VALUES
(1, 'abcd11', 'Canceled', 1, 'Nang', '123\r\n', '123@gmail.com', '2020-04-21 17:58:06', '2020-05-14 18:25:44'),
(2, 'abcd12', 'Packed', 2, 'Viet', '456', 'viet@gmail.com', '2020-04-22 17:58:06', '2020-05-10 07:42:08'),
(3, 'o7Jek3', 'Canceled', 5, 'Nang', '123', '123@gmail.com', '2020-05-09 14:13:34', '2020-05-10 07:42:19'),
(4, 'Tm6Cr4', 'Accepted', NULL, 'dwasd', 'dwads', 'dwad@gmail.com', '2020-05-09 14:25:40', '2020-06-05 15:45:35'),
(5, 'BUpNB5', 'Accepted', NULL, 'dwas', 'dwasd', 'asd@gmail.com', '2020-05-09 14:32:46', '2020-05-12 12:48:14'),
(6, 'Og5IA6', 'Awaiting', NULL, 'dwa', 'dwasd', 'dwas@gmail.com', '2020-05-09 14:34:33', '2020-05-12 12:48:16'),
(7, 'pPEGs7', 'Awaiting', NULL, 'dwads', 'dwasd', 'dwad@gmail.com', '2020-05-09 14:51:19', '2020-05-12 12:48:23'),
(8, 'A3NO08', 'Awaiting', NULL, 'cszcx', 'dwas', 'dwasd@gmail.com', '2020-05-09 14:53:17', '2020-05-12 12:48:25'),
(9, 'JGwox9', 'Accepted', NULL, 'Jackie Phan', '09037463823', 'jackie.phan@gmail.com', '2020-05-29 08:59:07', '2020-06-05 15:54:13'),
(10, 'PItBB10', 'Accepted', 1, 'Tran Nghe Nang Update', '0904387262', 'nang@gmail.com', '2020-05-29 10:33:34', '2020-06-05 14:49:36'),
(11, 'wqfc511', 'Awaiting', NULL, 'Mandy Ly', '0903746283', 'mandy.ly@gmail.com', '2020-05-29 12:12:24', '2020-05-29 12:12:24'),
(12, 'wzh3f12', 'Accepted', NULL, 'Mandy Ly', '0904756283', 'mandy.ly@gmail.com', '2020-05-29 12:31:36', '2020-06-05 14:50:04'),
(13, 'Rtfjv13', 'Awaiting', 1, 'Tran Nghe Nang Update', '0904387262', 'nang@gmail.com', '2020-05-29 12:38:49', '2020-05-29 12:38:49'),
(14, '6Js4O14', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 12:42:13', '2020-05-29 12:42:13'),
(15, 'oHpYW15', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 12:48:20', '2020-05-29 12:48:20'),
(16, 'gAMBq16', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 12:52:41', '2020-05-29 12:52:41'),
(17, 'vEAt417', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 13:20:23', '2020-05-29 13:20:23'),
(18, '4nKtF18', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 13:26:01', '2020-05-29 13:26:01'),
(19, '97X5a19', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 13:47:43', '2020-05-29 13:47:43'),
(20, 'VwhcL20', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 13:48:29', '2020-05-29 13:48:29'),
(21, '3Hotm21', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 13:49:50', '2020-05-29 13:49:50'),
(22, 'RhKdT22', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 14:05:49', '2020-05-29 14:05:49'),
(23, 'FRcJ723', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 14:09:35', '2020-05-29 14:09:35'),
(24, 'EMKQr24', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-05-29 15:38:45', '2020-05-29 15:38:45'),
(25, 'mKaDz25', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-06-04 11:31:24', '2020-06-04 11:31:24'),
(26, 'wWu6026', 'Awaiting', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-06-04 11:40:27', '2020-06-04 11:40:27'),
(27, 'BP8qt27', 'Awaiting', NULL, 'Nguyen Van A', '0904637284', 'nguyen.a@gmail.com', '2020-06-05 22:41:51', '2020-06-05 22:41:51'),
(28, '71hwx28', 'Accepted', NULL, 'Nguyen A', '0903647382', 'nguyen.a@gmail.com', '2020-06-05 22:48:23', '2020-06-05 22:56:13'),
(29, 'H5RpM29', 'Awaiting', NULL, 'Nguyen A', '0903746382', 'nguyen.a@gmail.com', '2020-06-05 22:54:25', '2020-06-05 22:54:25'),
(30, 'KyKbt30', 'Awaiting', 7, 'Hai Nam A', '09037485732', 'nvl.test2020@gmail.com', '2020-06-05 23:07:12', '2020-06-05 23:07:12'),
(31, 'cLBf631', 'Awaiting', 7, 'Hai Nam A', '09037485732', 'nvl.test2020@gmail.com', '2020-06-05 23:13:13', '2020-06-05 23:13:13'),
(32, 'uvnIg32', 'Accepted', 7, 'Hai Nam A', '09037485732', 'nvl.test2020@gmail.com', '2020-06-05 23:18:15', '2020-06-05 23:25:46'),
(33, 'nFjur33', 'Accepted', 7, 'Hai Nam A', '09037485732', 'nvl.test2020@gmail.com', '2020-06-05 23:28:15', '2020-06-05 23:41:47'),
(34, 'uwO9D34', 'Accepted', 1, 'Tran Nghe Nang', '0904387262', 'nang@gmail.com', '2020-06-06 01:08:33', '2020-06-06 01:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`orderId`, `productId`, `price`, `quantity`, `status`) VALUES
(1, 1, 1.385, 4, 1),
(1, 3, 1.385, 1, 1),
(2, 1, 1.385, 2, 1),
(2, 4, 1.699, 4, 1),
(3, 15, 5, 1, 1),
(4, 6, 4, 1, 1),
(5, 13, 5, 2, 1),
(6, 2, 6, 2, 1),
(7, 1, 1.385, 3, 1),
(8, 2, 1.699, 1, 1),
(9, 11, 39.999, 2, 1),
(10, 11, 39.999, 2, 1),
(11, 4, 19.995, 2, 1),
(12, 20, 12.4, 2, 1),
(13, 11, 39.999, 1, 1),
(14, 11, 39.999, 1, 1),
(15, 20, 12.4, 1, 1),
(16, 4, 19.995, 3, 1),
(17, 5, 5.337, 4, 1),
(18, 21, 17.599, 2, 1),
(19, 12, 36.188, 2, 1),
(20, 2, 1.699, 2, 1),
(21, 1, 1.2465, 2, 1),
(22, 2, 1.699, 2, 1),
(22, 5, 5.337, 2, 1),
(23, 16, 31.298, 1, 1),
(24, 17, 63.597, 1, 1),
(25, 6, 5, 1, 1),
(26, 7, 2.89, 2, 1),
(27, 4, 20, 3, 1),
(28, 1, 1.39, 1, 1),
(28, 5, 5.34, 1, 1),
(29, 7, 2.89, 1, 1),
(30, 21, 17.6, 2, 1),
(31, 4, 20, 1, 1),
(32, 21, 17.6, 2, 1),
(33, 2, 1.7, 2, 1),
(34, 2, 1.7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `paypalCustomer` varchar(250) DEFAULT NULL,
  `paypalGross` double DEFAULT NULL,
  `paypalFee` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `orderId`, `price`, `method`, `paypalCustomer`, `paypalGross`, `paypalFee`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 1, 4.5, 'Pay At Home', NULL, NULL, NULL, 1, '2020-04-21 17:54:25', '2020-05-10 06:38:05'),
(2, 2, 5.5, 'Pay At Home', NULL, NULL, NULL, 1, '2020-04-21 17:54:25', '2020-05-10 06:38:08'),
(3, 7, 3.7395, 'Pay At Home', NULL, NULL, NULL, 1, '2020-05-09 14:51:19', '2020-05-09 14:51:19'),
(4, 8, 1.36, 'Pay At Home', NULL, NULL, NULL, 1, '2020-05-09 14:53:17', '2020-05-09 14:53:17'),
(5, 3, 3, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-10 06:42:03', '2020-05-10 06:42:03'),
(6, 4, 4, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-10 06:42:03', '2020-05-10 06:42:03'),
(7, 5, 5, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-10 06:42:03', '2020-05-10 06:42:03'),
(8, 6, 4, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-10 06:42:03', '2020-05-10 06:42:03'),
(9, 9, 79.998, 'Pay by paypal', NULL, NULL, NULL, 1, '2020-05-29 08:59:10', '2020-05-29 08:59:10'),
(10, 10, 64, 'Pay by paypal', NULL, NULL, NULL, 1, '2020-05-29 10:33:34', '2020-05-29 10:33:34'),
(11, 11, 39.99, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-29 12:12:24', '2020-05-29 12:12:24'),
(12, 12, 24.8, 'Pay by paypal', 'John Doe', 24, 1, 1, '2020-05-29 12:31:36', '2020-05-29 12:32:45'),
(13, 13, 39.999, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-29 12:38:49', '2020-05-29 12:38:49'),
(14, 14, 36, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-29 12:42:13', '2020-05-29 12:42:13'),
(15, 15, 9.92, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-29 12:48:20', '2020-05-29 12:48:20'),
(16, 16, 47.99, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-29 12:52:41', '2020-05-29 12:52:41'),
(17, 17, 21.348, 'Pay by paypal', 'John Doe', 20, 0.88, 1, '2020-05-29 13:20:23', '2020-05-29 13:21:24'),
(18, 18, 28.16, 'Pay by paypal', 'John Doe', 28, 1.11, 1, '2020-05-29 13:26:01', '2020-05-29 13:27:14'),
(19, 19, 72.376, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-29 13:47:43', '2020-05-29 13:47:43'),
(20, 20, 2.38, 'Pay at home', NULL, NULL, NULL, 1, '2020-05-29 13:48:29', '2020-05-29 13:48:29'),
(21, 21, 1.75, 'Pay by paypal', 'John Doe', 2, 0.36, 1, '2020-05-29 13:49:50', '2020-05-29 13:51:10'),
(22, 22, 11.26, 'Pay by paypal', NULL, NULL, NULL, 1, '2020-05-29 14:05:49', '2020-05-29 14:05:49'),
(23, 23, 31.298, 'Pay by paypal', 'John Doe', 31, 1.2, 1, '2020-05-29 14:09:35', '2020-05-29 14:12:55'),
(24, 24, 63.597, 'Pay by paypal', 'John Doe', 64, 2.16, 1, '2020-05-29 15:38:45', '2020-05-29 15:39:36'),
(25, 25, 0.5, 'Pay at home', NULL, NULL, NULL, 0, '2020-06-04 11:31:24', '2020-06-04 11:31:24'),
(26, 26, 2.89, 'Pay at home', NULL, NULL, NULL, 0, '2020-06-04 11:40:27', '2020-06-04 11:40:27'),
(27, 27, 60, 'Pay at home', NULL, NULL, NULL, 0, '2020-06-05 22:41:52', '2020-06-05 22:41:52'),
(28, 28, 6.7299999999999995, 'Pay by paypal', 'John Doe', 6, 0.47, 1, '2020-06-05 22:48:23', '2020-06-05 22:49:35'),
(29, 29, 2.89, 'Pay at home', NULL, NULL, NULL, 0, '2020-06-05 22:54:25', '2020-06-05 22:54:25'),
(30, 30, 34.03, 'Pay at home', NULL, NULL, NULL, 0, '2020-06-05 23:07:12', '2020-06-05 23:07:12'),
(31, 31, 19.33, 'Pay at home', NULL, NULL, NULL, 0, '2020-06-05 23:13:13', '2020-06-05 23:13:13'),
(32, 32, 24.64, 'Pay at home', NULL, NULL, NULL, 1, '2020-06-05 23:18:15', '2020-06-05 23:25:46'),
(33, 33, 2.72, 'Pay by paypal', 'John Doe', 2, 0.36, 1, '2020-06-05 23:28:15', '2020-06-05 23:29:11'),
(34, 34, 1.7, 'Pay at home', NULL, NULL, NULL, 1, '2020-06-06 01:08:33', '2020-06-06 01:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `productId` int(11) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `photo`, `status`, `productId`, `createdDate`, `modifiedDate`) VALUES
(1, '1_front.jpg', 1, 1, '2020-05-09 09:53:22', '2020-05-09 09:53:44'),
(2, '1_rear.jpg', 1, 1, '2020-05-09 09:53:22', '2020-05-09 09:53:46'),
(3, '1_back.jpg', 1, 1, '2020-05-09 09:53:22', '2020-05-09 09:53:49'),
(4, '2_front.jpg', 1, 2, '2020-05-09 09:53:22', '2020-05-09 09:53:44'),
(5, '2_rear.jpg', 1, 2, '2020-05-09 09:53:22', '2020-05-09 09:53:46'),
(6, '2_back.jpg', 1, 2, '2020-05-09 09:53:22', '2020-05-09 09:53:49'),
(7, '3_front.jpg', 1, 3, '2020-05-09 09:57:29', '2020-05-09 09:57:29'),
(8, '3_rear.jpg', 1, 3, '2020-05-09 09:57:29', '2020-05-09 09:57:29'),
(9, '3_back.jpg', 1, 3, '2020-05-09 09:57:29', '2020-05-09 09:57:29'),
(10, '4_front.jpg', 1, 4, '2020-05-09 10:00:51', '2020-05-09 10:00:51'),
(11, '4_rear.jpg', 1, 4, '2020-05-09 10:00:51', '2020-05-09 10:00:51'),
(12, '4_back.jpg', 1, 4, '2020-05-09 10:00:51', '2020-05-09 10:00:51'),
(13, '5_front.jpg', 1, 5, '2020-05-09 10:02:38', '2020-05-09 10:02:38'),
(14, '5_rear.jpg', 1, 5, '2020-05-09 10:02:38', '2020-05-09 10:02:38'),
(15, '5_back.jpg', 1, 5, '2020-05-09 10:02:38', '2020-05-09 10:02:38'),
(16, '6_front.jpg', 1, 6, '2020-05-09 10:04:46', '2020-05-09 10:04:46'),
(17, '6_rear.jpg', 1, 6, '2020-05-09 10:04:46', '2020-05-09 10:04:46'),
(18, '6_back.jpg', 1, 6, '2020-05-09 10:04:46', '2020-05-09 10:04:46'),
(19, '7_front.jpg', 1, 7, '2020-05-09 10:06:11', '2020-05-09 10:06:11'),
(20, '7_rear.jpg', 1, 7, '2020-05-09 10:06:11', '2020-05-09 10:06:11'),
(21, '7_back.jpg', 1, 7, '2020-05-09 10:06:11', '2020-05-09 10:06:11'),
(22, '8_front.jpg', 1, 8, '2020-05-09 10:07:36', '2020-05-09 10:07:36'),
(23, '8_rear.jpg', 1, 8, '2020-05-09 10:07:36', '2020-05-09 10:07:36'),
(24, '8_back.jpg', 1, 8, '2020-05-09 10:07:36', '2020-05-09 10:07:36'),
(25, '9_front.jpg', 1, 9, '2020-05-09 10:08:52', '2020-05-09 10:08:52'),
(26, '9_rear.jpg', 1, 9, '2020-05-09 10:08:52', '2020-05-09 10:08:52'),
(27, '9_back.jpg', 1, 9, '2020-05-09 10:08:52', '2020-05-09 10:08:52'),
(28, '10_front.jpg', 1, 10, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(29, '10_rear.jpg', 1, 10, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(30, '10_back.jpg', 1, 10, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(31, '21_front.jpg', 1, 21, '2020-05-12 13:36:39', '2020-05-12 13:36:39'),
(32, '21_rear.jpg', 1, 21, '2020-05-12 13:36:39', '2020-05-12 13:36:39'),
(33, '21_back.jpg', 1, 21, '2020-05-12 13:36:39', '2020-05-12 13:36:39'),
(34, '11_front.jpg', 1, 11, '2020-05-09 09:53:22', '2020-05-09 09:53:44'),
(35, '11_rear.jpg', 1, 11, '2020-05-09 09:53:22', '2020-05-09 09:53:46'),
(36, '11_back.jpg', 1, 11, '2020-05-09 09:53:22', '2020-05-09 09:53:49'),
(37, '12_front.jpg', 1, 12, '2020-05-09 09:53:22', '2020-05-09 09:53:44'),
(38, '12_rear.jpg', 1, 12, '2020-05-09 09:53:22', '2020-05-09 09:53:46'),
(39, '12_back.jpg', 1, 12, '2020-05-09 09:53:22', '2020-05-09 09:53:49'),
(40, '13_front.jpg', 1, 13, '2020-05-09 09:57:29', '2020-05-09 09:57:29'),
(41, '13_rear.jpg', 1, 13, '2020-05-09 09:57:29', '2020-05-09 09:57:29'),
(42, '13_back.jpg', 1, 13, '2020-05-09 09:57:29', '2020-05-09 09:57:29'),
(43, '14_front.jpg', 1, 14, '2020-05-09 10:00:51', '2020-05-09 10:00:51'),
(44, '14_rear.jpg', 1, 14, '2020-05-09 10:00:51', '2020-05-09 10:00:51'),
(45, '14_back.jpg', 1, 14, '2020-05-09 10:00:51', '2020-05-09 10:00:51'),
(46, '15_front.jpg', 1, 15, '2020-05-09 10:02:38', '2020-05-12 21:54:43'),
(47, '15_rear.jpg', 1, 15, '2020-05-09 10:02:38', '2020-05-09 10:02:38'),
(48, '15_back.jpg', 1, 15, '2020-05-09 10:02:38', '2020-05-09 10:02:38'),
(49, '16_front.jpg', 1, 16, '2020-05-09 10:04:46', '2020-05-09 10:04:46'),
(50, '16_rear.jpg', 1, 16, '2020-05-09 10:04:46', '2020-05-09 10:04:46'),
(51, '16_back.jpg', 1, 16, '2020-05-09 10:04:46', '2020-05-09 10:04:46'),
(52, '17_front.jpg', 1, 17, '2020-05-09 10:06:11', '2020-05-09 10:06:11'),
(53, '17_rear.jpg', 1, 17, '2020-05-09 10:06:11', '2020-05-09 10:06:11'),
(54, '17_back.jpg', 1, 17, '2020-05-09 10:06:11', '2020-05-09 10:06:11'),
(55, '18_front.jpg', 1, 18, '2020-05-09 10:07:36', '2020-05-09 10:07:36'),
(56, '18_rear.jpg', 1, 18, '2020-05-09 10:07:36', '2020-05-09 10:07:36'),
(57, '18_back.jpg', 1, 18, '2020-05-09 10:07:36', '2020-05-09 10:07:36'),
(58, '19_front.jpg', 1, 19, '2020-05-09 10:08:52', '2020-05-09 10:08:52'),
(59, '19_rear.jpg', 1, 19, '2020-05-09 10:08:52', '2020-05-09 10:08:52'),
(60, '19_back.jpg', 1, 19, '2020-05-09 10:08:52', '2020-05-09 10:08:52'),
(61, '20_front.jpg', 1, 20, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(62, '20_rear.jpg', 1, 20, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(63, '20_back.jpg', 1, 20, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(64, '22_front.jpg', 1, 22, '2020-05-12 20:47:58', '2020-05-12 20:47:58'),
(65, '22_rear.jpg', 1, 22, '2020-05-12 20:47:58', '2020-05-12 20:47:58'),
(66, '22_back.jpg', 1, 22, '2020-05-12 20:47:58', '2020-05-12 20:47:58'),
(67, '23_frontnull', 1, 23, '2020-06-05 23:46:57', '2020-06-05 23:46:57'),
(68, '23_rearnull', 1, 23, '2020-06-05 23:46:57', '2020-06-05 23:46:57'),
(69, '23_backnull', 1, 23, '2020-06-05 23:46:57', '2020-06-05 23:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `productId` int(11) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id`, `price`, `status`, `productId`, `createdDate`, `modifiedDate`) VALUES
(1, 1.385, 0, 1, '2020-05-09 09:46:44', '2020-05-09 09:50:50'),
(2, 1.385, 1, 1, '2020-05-09 09:50:50', '2020-05-09 09:50:50'),
(3, 1.699, 0, 2, '2020-05-09 09:53:22', '2020-05-09 09:57:50'),
(4, 2.366, 1, 3, '2020-05-09 09:57:29', '2020-05-09 09:57:29'),
(5, 1.699, 1, 2, '2020-05-09 09:57:50', '2020-05-09 09:57:50'),
(6, 19.995, 1, 4, '2020-05-09 10:00:51', '2020-05-09 10:00:51'),
(7, 5.337, 1, 5, '2020-05-09 10:02:38', '2020-05-09 10:02:38'),
(8, 7.999, 0, 6, '2020-05-09 10:04:46', '2020-05-27 14:15:21'),
(9, 2.89, 1, 7, '2020-05-09 10:06:11', '2020-05-09 10:06:11'),
(10, 3.092, 1, 8, '2020-05-09 10:07:36', '2020-05-09 10:07:36'),
(11, 38, 1, 9, '2020-05-09 10:08:52', '2020-05-09 10:08:52'),
(12, 2.999, 1, 10, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(13, 5, 0, 11, '2020-04-04 22:28:41', '2020-05-12 20:34:35'),
(14, 4.5, 0, 12, '2020-04-04 22:28:41', '2020-05-12 20:36:51'),
(15, 5, 0, 13, '2020-04-04 22:28:41', '2020-05-09 15:45:19'),
(16, 4.5, 0, 14, '2020-04-04 22:28:41', '2020-05-12 21:41:29'),
(17, 5.5, 0, 15, '2020-04-04 22:28:41', '2020-05-12 22:00:56'),
(18, 3, 1, 16, '2020-04-04 22:28:41', '2020-05-29 14:35:07'),
(19, 1, 0, 17, '2020-05-04 22:28:41', '2020-05-12 21:19:22'),
(20, 2, 0, 18, '2020-05-04 22:28:41', '2020-05-12 21:01:17'),
(21, 3, 0, 19, '2020-05-04 22:28:41', '2020-05-12 21:21:30'),
(22, 4, 0, 13, '2020-05-04 14:47:50', '2020-05-12 20:45:45'),
(23, 9, 0, 20, '2020-05-04 17:37:51', '2020-05-12 21:03:24'),
(24, 17.599, 1, 21, '2020-05-12 13:36:39', '2020-05-12 13:36:39'),
(25, 39.999, 1, 11, '2020-05-12 20:34:35', '2020-05-12 20:34:35'),
(26, 36.188, 1, 12, '2020-05-12 20:36:51', '2020-05-12 20:36:51'),
(27, 40.045, 0, 13, '2020-05-12 20:45:45', '2020-06-05 23:45:03'),
(28, 20.085, 1, 22, '2020-05-12 20:47:58', '2020-05-12 20:47:58'),
(29, 31.298, 1, 16, '2020-05-12 20:58:03', '2020-05-12 20:58:03'),
(30, 74.341, 1, 18, '2020-05-12 21:01:17', '2020-05-12 21:01:17'),
(31, 12.4, 1, 20, '2020-05-12 21:03:24', '2020-05-12 21:03:24'),
(32, 63.597, 1, 17, '2020-05-12 21:19:22', '2020-05-12 21:19:22'),
(33, 109.999, 1, 19, '2020-05-12 21:21:30', '2020-05-12 21:21:30'),
(34, 19.23, 1, 14, '2020-05-12 21:41:29', '2020-05-12 21:41:29'),
(35, 4.599, 1, 15, '2020-05-12 22:00:56', '2020-05-12 22:00:56'),
(36, 4.999, 1, 6, '2020-05-27 14:15:21', '2020-05-27 14:15:21'),
(37, 40.04, 1, 13, '2020-06-05 23:45:03', '2020-06-05 23:45:03'),
(38, 0, 0, 23, '2020-06-05 23:46:57', '2020-06-05 23:47:42'),
(39, 100, 1, 23, '2020-06-05 23:47:42', '2020-06-05 23:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `description` text,
  `rate` tinyint(4) DEFAULT NULL,
  `configuration` text,
  `status` tinyint(1) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `quantity`, `photo`, `description`, `rate`, `configuration`, `status`, `categoryId`, `brandId`, `createdDate`, `modifiedDate`) VALUES
(1, 'Apple EarPods', 50, '1_front.jpg', 'with Lightning Connector - White', 2, 'Unlike traditional, circular earbuds, the design of the EarPods is defined by the geometry of the ear Which makes them more comfortable for more people than any other earbud-style headphones.\r\nThe speakers inside the EarPods have been engineered to maximize sound output and minimize sound loss, which means you get high-quality audio.\r\nThe EarPods with Lightning Connector also include a built-in remote that lets you adjust the volume, control the playback of music and video, and answer or end calls with a pinch of the cord.\r\nWorks with all devices that have a Lightning connector and support iOS 10 or later, including iPod touch, iPad, and iPhone.', 1, 2, 1, '2020-05-09 09:46:44', '2020-05-29 12:19:13'),
(2, 'iJoy Wireless Headphones', 48, '2_front.jpg', 'Bluetooth Over Ear Headphones Foldable Headset with Mic (Stealth)', 3, 'Deep, accurate bass response, extended frequency range, rechargeable.\r\n5-Button control, including play/pause/answer/hang-up, equalizer, next track/volume up, previous track/volume down.\r\nEar cups fit around ears to help isolate Audio, foldable design for easy carry, noise canceling design.\r\nMicro SD card plug-in, built in radio receiver, built in mic for hands free calling.\r\nNew: 6 months!! Exchange warranty! If your headset breaks or is damaged for any reason, pranks will provide you with a free replacement!.', 1, 2, 3, '2020-05-09 09:53:22', '2020-06-06 01:16:02'),
(3, 'Apple AirPods', 50, '3_front.jpg', 'with Charging Case', 2, 'Automatically on, automatically connected.\r\nEasy setup for all your Apple devices.\r\nQuick access to Siri by saying ?Hey Siri?.\r\nDouble-tap to play or skip forward.\r\nNew Apple H1 headphone chip delivers faster wireless connection to your devices.\r\nCharges quickly in the case.\r\nCase can be charged using the Lightning connector.', 1, 2, 1, '2020-05-09 09:57:29', '2020-05-10 04:58:31'),
(4, 'Beats Wireless On-Ear Headphones', 50, '4_front.jpg', 'Apple W1 Headphone Chip, Class 1 Bluetooth, 40 Hours of Listening Time - Club Red (Latest Model)', 5, 'High-performance wireless Bluetooth headphones in club red.\r\nFeatures the Apple W1 chip and Class 1 wireless Bluetooth connectivity.\r\nWith up to 40 hours of battery life, Beats Solo3 wireless is your perfect everyday headphone.\r\nCompatible with iOS and Android devices.\r\nWith Fast Fuel, 5 minutes of charging gives you 3 hours of playback when battery is low.\r\nAdjustable fit with comfort-cushioned ear cups made for everyday use.\r\nSleek, streamlined design that?s durable and foldable to go everywhere you do.', 1, 2, 4, '2020-05-09 10:00:51', '2020-05-10 06:27:56'),
(5, 'Apple AirPods Pro', 50, '5_front.jpg', '', 2, 'Active noise cancellation for immersive sound.\r\nTransparency mode for hearing and connecting with the world around you.\r\nThree sizes of soft, tapered silicone tips for a customizable fit.\r\nSweat and water resistant.\r\nAdaptive EQ automatically tunes music to the shape of your ear.\r\nEasy setup for all your Apple devices.\r\nQuick access to Siri by saying ?Hey Siri?.\r\nThe Wireless Charging Case delivers more than 24 hours of battery life.', 1, 2, 1, '2020-05-09 10:02:38', '2020-05-10 04:58:57'),
(6, 'Anker  Air 2 Wireless Earbuds', 50, '6_front.jpg', 'Diamond Coated Drivers, Bluetooth Earphones, 4 Mics, Noise Reduction, 28H Playtime, HearID, Bluetooth 5, Wireless Charging, for Calls, Home Office', 5, 'Diamond-Enhanced Sound: Liberty Air 2 wireless earphones take advantage of the ultra-light, yet rigid structure of diamonds to create a driver dome that maintains its rigidity, even when vibrating at high frequencies. The diamond drivers increase the sound frequency bandwidth by 15% and deliver 2? the amount of bass.\r\nPerfect for Home Offices: Each earbud is equipped with two microphones and cVc 8.0 noise reduction technology. Environmental noises are reduced by 60%, while 95% of your voice is retained so you sound louder and clearer on the other end.\r\nUp to 28 Hours of Playtime*: A single charge gives you a full 7 hours of listening, while the charging case extends it to 28 hours of playtime. And when the case needs a power boost, simply set it down on a wireless charger.\r\nHearID Technology: Take the test to create a custom set of EQ settings that are optimized for your ears. HearID maps your hearing sensitivity at multiple frequencies and intelligently analyzes the results to give you a truly personalized listening experience.\r\nOne-Step Pairing and Bluetooth 5.0 Connectivity: Liberty Air 2 wireless earphones use Bluetooth 5.0 for a fast, strong, and ultra-stable connection.', 1, 2, 5, '2020-05-09 10:04:46', '2020-05-10 06:28:30'),
(7, 'Bluetooth Headphones', 40, '7_front.jpg', 'Soundcore Sport Air Wireless Workout Earphones by Anker, 12mm Driver, IPX7 Waterproof, SweatGuard Technology, 10H Playtime, Comfortable Magnetic Bluetooth Earbuds for Sports, Gym', 4, 'Pounding bass: 12 mm Composite drivers transform your music into a workout-fueling, bass-driven soundtrack.\r\nSweat proof: Push your workout to the limit with zero hesitation thanks to IPX7 water resistance and Sweat Guard technology.\r\nEngineered for comfort: secure-fit, ergonomic design, and controlled entirely from the right earbud; zero rubbing or pulling from an in-line remote.\r\nHuge Stamina: get 10 hours of playtime. That?s over a week of gym sessions from a single charge.\r\nHands-free calls: built-in microphone for clear call quality.', 1, 2, 5, '2020-05-09 10:06:11', '2020-05-10 04:58:23'),
(8, 'Sony Earbud Headphones/Headset', 30, '8_front.jpg', 'with mic for phone call, Black', 5, '12 millimeter dome type driver units deliver powerful deep bass. Connectivity Technology: Wired\r\nIntegrated microphone and smartphone playback control.\r\nHybrid silicone earbuds for secure, comfortable fit.\r\nHigh energy neodymium magnets for powerful sound.\r\nTangle free, Y type flat cord with slider. Capacity 100 mW. Diaphragm:PET.\r\nLightweight for ultimate music mobility. 0.47 in neodymium drivers for powerful, balanced sound.', 1, 2, 6, '2020-05-09 10:07:36', '2020-05-10 06:28:46'),
(9, 'Sony Noisy Cancelling Headphones', 20, '9_front.jpg', 'Black, medium', 4, 'Over ear, Noise isolating Headphones. Connectivity Technology: Wired\r\n30mm Neodymium Driver. 110 dB/mW ? Power off, 115 dB/mW ? Power on\r\nUp To 80 Hours Of Battery Life.\r\nFrequency response:10 22,000 Hz.\r\nImpedance (Ohm) Power ON 220 ohm, OFF 45 ohm (at 1 kHz).Cord Length:3.94 ft.', 1, 2, 6, '2020-05-09 10:08:52', '2020-05-10 06:29:07'),
(10, 'Wireless Earbuds', 10, '10_front.jpg', 'Bluetooth 5.0 Headphones TWS Stereo Wireless Earphones Sweatproof Bluetooth Earbuds 90H Playtime in-Ear Headset Earphones with 2000mAh Charging Case Built-in Mic Deep Bass for Sports', 0, 'TWS Technology& Noice Reducation Wireless Earbuds&#12305;Bluetooth 5.0 and lossless HD rendering technology that produce incredible sound quality with deep bass and ensure your great experience with fast, stable and efficient transmission. High Quality Bluetooth Chip which will proivde wonderful noice reduction, you will be immersed in your Music World. ( Keep the range within 33ft)\r\n&#12304;One Step Pairing & Build-in Mic Bluetooth Headphones&#12305;D2 wireless Bluetooth earbuds are one-step pairing and it will automatically connect to its memorized phone when power on next time. With the built-in mic, you can answer your phone with one click on the ear bud.\r\n&#12304;90H Playtime Wireless Earphones with Charging Case&#12305;Built-in 2000mAh rechargeable battery charging case, wireless earbuds can play for 4-5 hours on a single charge, portalbe charging case can recharge the earbuds 18 times after a single full charge, provide total 90 hours playback. It can be charged automatically once put earbuds in the charging case.', 1, 2, 7, '2020-05-09 10:10:20', '2020-05-09 10:10:20'),
(11, 'LG G8 ThinQ', 10, '11_front.jpg', 'Interact with this LG G8 ThinQ with Alexa Hands-Free using touchless commands. Simply say ?Alexa? to play music, hear the news or check the weather wherever you are. Just ask- and Alexa will respond instantly. The LG G8 ThinQ comes with 6.1\" QHD+ OLED(3120 x 1440) FullVision display for vibrant viewing, 16.0MP + 12.0MP dual rear-camera setup with OIS+ and Dual PDAF to capture capture sharp images quickly with less blur, 8.0MP front-facing camera with Story Shot & Makeup Pro, Qualcomm Snapdragon 845 octa-core processor up to 2.8 GHz, and much more. The slender design of this LG G8 ThinQ smartphone provides a sleek look and easily fits in a pocket.', 0, 'Android, 8.0 mp,6.1 inch,3500mah,16.0mp + 12.0mp,6gb,Oled,1920 x 1080 pixel', 1, 1, 8, '2020-04-04 22:19:56', '2020-05-12 20:34:35'),
(12, 'Google Pixel 3a', 5, '12_front.jpg', 'Capture stunning photos with features like night sight, portrait mode, and HDR+. Save every photo with free, unlimited storage at high quality through Google photos [1]. The Google assistant is the easiest way to get things done ? including screening calls.[2] Fast Charging battery delivers up to 7 hours of use with just a 15-minute charge.[3] Comes with 3 years of OS and security updates] and the custom-built Titan M chip.[5] Switch seamlessly and keep all your stuff [6]. Plus your favorite Google apps are built in.', 3, 'Android,8.0 mp,5.6 inch,3900mah,16.0mp + 12.0mp,6gb,LCD,1920 x 1080 pixel', 1, 1, 9, '2020-04-04 22:19:56', '2020-05-12 20:36:51'),
(13, 'iPhone 7', 7, '13_front.jpg', 'Locked to the GSM network and only compatible with GSM carriers like AT&T, T-Mobile and Metro. Will not work with Sprint, Verizon, US Cellular or Cricket. The device does not come with headphones or a SIM card. It does include a charger and charging cable that may be generic, in which case it will be UL or Mfi (Made for iPhone) Certified. Inspected and guaranteed to have minimal cosmetic damage, which is not noticeable when the device is held at arms length. Successfully passed a full diagnostic test which ensures like-new functionality and removal of any prior-user personal information. Tested for battery health and guaranteed to have a minimum battery capacity of 80%.', 4, 'IOS,8.0 mp,4.7 inch,1900mah,12.0mp,3gb,Retina,1920 x 1080 pixel', 1, 1, 1, '2020-04-04 22:19:56', '2020-05-12 20:45:45'),
(14, 'Samsung Galaxy J7', 10, '14_front.jpg', 'Samsung Galaxy J7 smartphone was launched in June 2015. The phone comes with a 5.50-inch touchscreen display with a resolution of 720x1280 pixels and an aspect ratio of 16:9. Samsung Galaxy J7 is powered by a 1.5GHz octa-core Samsung Exynos 7 Octa 7580 processor. It comes with 1.5GB of RAM.', 0, 'Android,13 mp,5.5 inch,3600 mAh,13 mp,3 GB,Super AMOLED,1280 x 720 pixels', 1, 1, 2, '2020-04-11 21:22:31', '2020-05-12 21:41:29'),
(15, 'Portable Charger Anker PowerCore 20100mAh', 10, '15_front.jpg', 'Ultra High Capacity Power Bank with 4.8A Output and PowerIQ Technology, External Battery Pack for iPhone, iPad & Samsung Galaxy & More (Black)', 3, 'The Anker Advantage:Join the 50 million+ powered by our leading technology.\r\nUltra-High Capacity:Weighs as little as a can of soup (12.5 oz) yet charges the iPhone 8 almost seven times, the Galaxy S8 five times or the iPad mini 4 twice.\r\nHigh-Speed Charging: PowerIQ and VoltageBoost combine to deliver the fastest possible charge(does not support Qualcomm Quick Charge). Recharges itself in 10 hours with a 2 amp charger, phone chargers (generally 1 amp) may take up to 20 hours.\r\nCertified Safe: Anker\'s MultiProtect safety system ensures complete protection for you and your devices.\r\nWhat You Get: Anker PowerCore 20100 Portable Charger, Micro USB cable, travel pouch, welcome guide, Lightning cable for iPhone / iPad sold separately.\r\n', 1, 2, 5, '2020-04-22 05:25:59', '2020-05-12 22:00:56'),
(16, 'Motorola One Hyper', 30, '16_front.jpg', 'Hi-res detail low-light brilliance. Capture incredibly detailed, high-resolution 64 MP photos and 32 MP selfies in any light, with Quad Pixel technology and Night Vision. Ultra-high res clarity The 64 MP ultra-high-resolution sensor delivers crisp detail and color accuracy in every shot?even if you crop and enlarge. Thanks to laser autofocus technology, optimized to work in the dark, your camera instantly focuses on careful precision to deliver bright, vivid results...day or night. Make every pixel pop Say hello to crystal-clear selfies with the reimagined selfie cam. Concealed behind the display, the 32 MP high-resolution camera pops up in less than a second. Go ahead, seize the selfie! 4x light sensitivity Both the main camera and pop-up selfie cam feature Quad Pixel technology. By combining four pixels into one, it increases the camera light sensitivity which decreases visual noise caused by low-light conditions. The result? Brighter, more brilliant photos in any setting. Uninterrupted view Motorola one hyper is designed inside and out to give you a viewing experience that will make you forget you\'re even watching on a phone. With the pop-up selfie cam discreetly hidden behind the display, you\'ve got a 6.5\" Total Vision Full HD+ screen. Extra space combined with ultra-narrow bezels means you can immerse yourself in content anywhere, anytime.', 4, 'Android,32 mp,6.5 inch,4000mah,64mp + 8mp,4gb,IPS LCD,1080 x 2340 pixel', 1, 1, 11, '2020-05-04 10:00:00', '2020-05-12 20:58:03'),
(17, 'iPhone 11', 11, '17_front.jpg', 'Just the right amount of everything. A new dual&#8209;camera system captures more of what you see and love. The fastest chip ever in a smartphone and all&#8209;day battery life let you do more and charge less. And the highest&#8209;quality video in a smartphone, so your memories look better than ever.', 5, 'IOS,32 mp,6.1 inch,3110mah,Dual 12,4gb,IPS LCD,828 x 1792 pixel', 1, 1, 1, '2020-05-04 14:27:54', '2020-05-12 21:19:22'),
(18, 'Samsung Galaxy S10', 30, '18_front.jpg', 'The next generation Samsung Galaxy S10 is as powerful, intelligent and intuitive as you are, providing endless possibilities and next- level power in performance, productivity, creation and design. Known as the Da Vinci of smartphones, the Galaxy S10 features pro lenses to capture stunning photos and the S-Pen to easily create content and utilize your smartphone?s full capabilities. Get more from your S10 with all new creative features such as Single Take AI, Pro Video, and more. Advanced low light technology in the pro lenses gives you the ability to shoot with long exposure-style captures so your content features striking light trails. Capture video and multiple types of images with one tap of the shutter button and then easily and quickly share more, quicker. The Galaxy S10 features a powerful processor, intelligent power and a long-lasting battery that learns your habits and adapts to your screen usage in order to optimize power and performance. With Unlocked by Samsung, you get to choose the carrier, data plan, services, features and apps you want.', 0, 'Android,10 mp,6.1 inch,3400mah,12mp + 12mp + 16mp,8gb,Dynamic AMOLED,1440 x 3040 pixel', 1, 1, 2, '2020-05-04 14:38:43', '2020-05-12 21:01:17'),
(19, 'Samsung Galaxy Note 10+', 4, '19_front.jpg', 'Fast charging, long lasting intelligent power and super speed processing outlast whatever you throw at Note 10 plus S pen?s newest Evolution gives you the power of air gestures, a remote shutter and playlist button and handwriting to text, all in One Magic wand With a full set of Pro lenses, super stabilization, live video bokeh and precision audio recording, Note 10+ is a studio in your pocket Note 10?s nearly bezel less Infinity display gives an immersive, cinematic quality to whatever you?re viewing.', 5, 'Android,10 mp,6.8 inch,4300mah,12mp + 12mp + 16mp,12gb,Dynamic AMOLED,1440 x 3040 pixel', 1, 1, 2, '2020-05-04 14:47:50', '2020-05-12 21:21:30'),
(20, 'Samsung Galaxy A10', 9, '20_front.jpg', 'Ready, Action, Immerse. Get a vivid viewing experience with the next-gen Infinity-V Display. Ready, Action, Shoot. Capture stunning shots and stand out with 13MP Rear + 5MP Front Camera. Ready, Action, Go. Run multiple apps without missing a beat on this powerful multi-tasker. HSDPA 850 / 900 / 1900 / 2100 - LTE band 1(2100), 2(1900), 3(1800), 5(850), 7(2600), 8(900), 20(800), 38(2600), 40(2300), 41(2500) - Dual SIM (Nano-SIM, dual stand-by). International Model Compatible with Most GSM Carriers like T-Mobile, AT&T, MetroPCS, etc. HSDPA 850 / 900 / 1900 / 2100 - LTE band 1(2100), 2(1900), 3(1800), 5(850), 7(2600), 8(900), 20(800), 38(2600), 40(2300), 41(2500) - Dual SIM (Nano-SIM, dual stand-by)(6.2\") HD+ Infinity-V 720 x 1520 pixels, 19:9 ratio (~271 ppi density) - Front glass, plastic body32GB ROM + 2GB RAM - microSD, up to 512 GB - Android Pie Samsung One UI - Exynos 7884 Octa-Core - Non-removable Li-Ion 3400 mAh batteryUnlocked cell phones are compatible with GSM carriers such as AT&T and T-Mobile, but will NOT work with CDMA carriers such as Verizon and Sprint.', 5, 'Android,5 mp,6.2 inch,3400mah,13mp,2gb,IPS LCD,720 x 1520 pixel', 1, 1, 2, '2020-05-04 17:37:51', '2020-05-12 21:03:24'),
(21, 'Samsung Galaxy A20S', 30, '21_front.jpg', 'Galaxy A20s, A big display for big fun When you\'re traveling through new worlds, vlogs, and games, Galaxy A20s\'s bigger screen makes for a better view. Its 6.5-inch Infinity-V display stretches from edge to edge, taking your everyday experiences from good to amazing. A glossy back that\'s comfortable to hold A phone with a glossy back and smooth curves, fits just right in your hand for a comfortable grip you\'ll feel right away. Triple camera so every shot stands out The triple camera makes your moments feel special with the 13MP, 5MP Depth Camera, and 8MP Ultra Wide Camera. The Depth Camera spotlights your subject, while the Ultra Wide Camera fits in 120-degrees worth of memories. Ultra-Wide Camera for a greater perspective The 77-degree Wide-angle and 120-degree Ultra Wide-angle let you capture what you see, so you won\'t miss the moment from where you stand. A camera that makes your subjects stand apart The 5MP Depth Camera lets you adjust the depth of field before and after you nail the shot.', 4, 'Android,8.0 mp,6.5 inch,4000mah,13.0 mp + 8.0 mp + 5.0 mp,3gb,IPS LCD,1920 x 1080 pixel', 1, 1, 2, '2020-05-12 13:36:39', '2020-06-05 23:32:36'),
(22, 'Xiaomi Redmi Note 8', 16, '22_front.jpg', 'Xiaomi Redmi Note 8 smartphone runs on Android v9.0 (Pie) operating system. The phone is powered by Octa core (2 GHz, Quad core, Kryo 260 + 1.8 GHz, Quad core, Kryo 260) processor. It runs on the Qualcomm Snapdragon 665 Chipset. It has 4 GB RAM and 64 GB internal storage.', 0, 'Android,13 mp,6.3 inch,4000mah,48mp + 8mp + 2mp + 2mp,4gb,IPS LCD,1080 ? 2340 pixel', 1, 1, 10, '2020-05-12 20:47:58', '2020-05-12 20:47:58'),
(23, 'dwadw', 0, '23_frontnull', '', 0, 'dwa,dwadw,sefsdf,324re,fesdfe,fesdfe,sefd,sefdes', 1, 1, 1, '2020-06-05 23:46:57', '2020-06-05 23:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `description` text NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `name`, `price`, `description`, `startDate`, `endDate`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 'Black Friday Big Sales', 30, 'Black Friday Big Sales, all the products sale up to 30%. from Monday, April 6th 2020 to Sunday, April 12th 2020', '2020-04-05', '2020-06-30', 1, '2020-04-06 04:11:40', '2020-06-05 23:36:41'),
(2, 'test update', 20, 'test', '2020-05-16', '2020-05-30', 1, '2020-05-17 09:44:55', '2020-05-19 11:17:21'),
(3, 'test 2', 10, 'test 2', '2020-05-19', '2020-05-30', 1, '2020-05-19 11:09:01', '2020-05-27 15:56:40'),
(4, 'test 1', 5, 'test 1', '2020-04-07', '2020-05-07', 1, '2020-05-25 13:19:57', '2020-05-25 13:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_detail`
--

CREATE TABLE `promotion_detail` (
  `promotionId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promotion_detail`
--

INSERT INTO `promotion_detail` (`promotionId`, `productId`, `status`) VALUES
(1, 1, 1),
(1, 4, 1),
(1, 10, 1),
(1, 13, 1),
(1, 15, 1),
(1, 16, 1),
(1, 17, 1),
(1, 19, 1),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `point` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `price`, `point`, `status`, `createdDate`, `modifiedDate`) VALUES
(1, 10, 1000, 1, '2020-05-09 14:19:55', '2020-05-20 04:08:06'),
(2, 20, 2000, 1, '2020-05-09 14:19:55', '2020-05-25 15:04:33'),
(3, 30, 3000, 1, '2020-05-18 20:50:08', '2020-05-18 20:50:08'),
(4, 5, 500, 1, '2020-05-20 03:15:12', '2020-05-20 03:15:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commend`
--
ALTER TABLE `commend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`,`accountId`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `exchange`
--
ALTER TABLE `exchange`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`,`voucherId`),
  ADD KEY `vourcherId` (`voucherId`) USING BTREE,
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `new`
--
ALTER TABLE `new`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`) USING BTREE,
  ADD KEY `accountId` (`accountId`) USING BTREE;

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orderId`,`productId`),
  ADD KEY `orderId` (`orderId`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`,`brandId`),
  ADD KEY `brandId` (`brandId`) USING BTREE;

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_detail`
--
ALTER TABLE `promotion_detail`
  ADD PRIMARY KEY (`promotionId`,`productId`),
  ADD KEY `promotionId` (`promotionId`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commend`
--
ALTER TABLE `commend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `exchange`
--
ALTER TABLE `exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `new`
--
ALTER TABLE `new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commend`
--
ALTER TABLE `commend`
  ADD CONSTRAINT `commend_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `commend_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`);

--
-- Constraints for table `exchange`
--
ALTER TABLE `exchange`
  ADD CONSTRAINT `exchange_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `exchange_ibfk_2` FOREIGN KEY (`voucherId`) REFERENCES `voucher` (`id`),
  ADD CONSTRAINT `exchange_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`);

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`);

--
-- Constraints for table `promotion_detail`
--
ALTER TABLE `promotion_detail`
  ADD CONSTRAINT `promotion_detail_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `promotion_detail_ibfk_2` FOREIGN KEY (`promotionId`) REFERENCES `promotion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
