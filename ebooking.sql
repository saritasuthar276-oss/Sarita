-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2026 at 10:20 AM
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
-- Database: `ebooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `status`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`, `isActive`) VALUES
(1, 'Flight', 0, '2026-02-28 06:39:21', 1, '2026-02-28 06:39:21', NULL, 1),
(2, 'Train', 0, '2026-02-28 06:39:21', 1, '2026-02-28 06:39:21', NULL, 1),
(3, 'Bus', 0, '2026-02-28 06:39:21', 1, '2026-02-28 06:39:21', NULL, 1),
(4, 'Cab', 0, '2026-02-28 06:39:21', 1, '2026-02-28 06:39:21', NULL, 1),
(5, 'Movies', 0, '2026-02-28 06:39:21', 1, '2026-02-28 06:39:21', NULL, 1),
(6, 'Restaurant', 0, '2026-02-28 06:39:21', 1, '2026-02-28 06:39:21', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `state_id`, `city_name`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`, `isActive`) VALUES
(1, 1, 'Mumbai', '2026-02-28 06:33:51', 1, '2026-02-28 06:33:51', NULL, 1),
(2, 1, 'Pune', '2026-02-28 06:33:51', 1, '2026-02-28 06:33:51', NULL, 1),
(3, 2, 'Ahmedabad', '2026-02-28 06:33:51', 1, '2026-02-28 06:33:51', NULL, 1),
(4, 2, 'Surat', '2026-02-28 06:33:51', 1, '2026-02-28 06:33:51', NULL, 1),
(5, 3, 'Jaipur', '2026-02-28 06:33:51', 1, '2026-02-28 06:33:51', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `airline_name` varchar(100) NOT NULL,
  `flight_number` varchar(50) NOT NULL,
  `from_city_id` int(11) NOT NULL,
  `to_city_id` int(11) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `category_id`, `airline_name`, `flight_number`, `from_city_id`, `to_city_id`, `departure_time`, `arrival_time`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`, `isActive`) VALUES
(1, 1, 'IndiGo', '6E-203', 1, 2, '2026-03-01 06:30:00', '2026-03-01 08:45:00', '2026-02-28 06:29:02', 1, '2026-02-28 06:29:02', NULL, 1),
(2, 2, 'Air India', 'AI-101', 2, 3, '2026-03-01 09:00:00', '2026-03-01 11:30:00', '2026-02-28 06:29:02', 1, '2026-02-28 06:29:02', NULL, 1),
(3, 3, 'Vistara', 'UK-945', 1, 4, '2026-03-01 14:15:00', '2026-03-01 16:40:00', '2026-02-28 06:29:02', 1, '2026-02-28 06:29:02', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flight_booking`
--

CREATE TABLE `flight_booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `journey_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `booking_status` varchar(30) DEFAULT 'CONFIRMED',
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_cancellation`
--

CREATE TABLE `flight_cancellation` (
  `cancellation_id` int(11) NOT NULL,
  `flight_booking_id` int(11) DEFAULT NULL,
  `cancel_date` date DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `refund_status` varchar(50) DEFAULT NULL,
  `createdOn` datetime DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_passenger`
--

CREATE TABLE `flight_passenger` (
  `passenger_id` int(11) NOT NULL,
  `flight_booking_id` int(11) DEFAULT NULL,
  `passenger_name` varchar(150) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `id_proof` varchar(100) DEFAULT NULL,
  `createdOn` datetime DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_pricing`
--

CREATE TABLE `flight_pricing` (
  `pricing_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `seat_class` varchar(50) NOT NULL,
  `base_fare` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_refund`
--

CREATE TABLE `flight_refund` (
  `refund_id` int(11) NOT NULL,
  `cancellation_id` int(11) DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refund_date` date DEFAULT NULL,
  `refund_status` varchar(50) DEFAULT NULL,
  `createdOn` datetime DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_seat`
--

CREATE TABLE `flight_seat` (
  `seat_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `seat_class` varchar(50) NOT NULL,
  `seat_status` varchar(20) DEFAULT 'AVAILABLE',
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mst_admin`
--

CREATE TABLE `mst_admin` (
  `admin_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mst_admin`
--

INSERT INTO `mst_admin` (`admin_id`, `fname`, `lname`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Sakshi', 'Agrawal', 'sakshiagrawal@gmail.com', 'sakshi@123', '2026-02-28 06:00:35', '2026-02-28 06:00:35'),
(2, 'Sarita', 'Suthar', 'saritasuthar@gmail.com', 'sarita@123', '2026-02-28 06:00:35', '2026-02-28 06:00:35'),
(3, 'Jeel', 'Barot', 'jeelbarot@gmail.com', 'jeel@123', '2026-02-28 06:00:35', '2026-02-28 06:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `mst_users`
--

CREATE TABLE `mst_users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`, `isActive`) VALUES
(1, 'Maharashtra', '2026-02-28 06:32:18', 1, '2026-02-28 06:32:18', NULL, 1),
(2, 'Gujarat', '2026-02-28 06:32:18', 1, '2026-02-28 06:32:18', NULL, 1),
(3, 'Rajasthan', '2026-02-28 06:32:18', 1, '2026-02-28 06:32:18', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `train_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `train_name` varchar(100) DEFAULT NULL,
  `train_number` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`train_id`, `category_id`, `train_name`, `train_number`, `status`, `created_at`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`, `isActive`) VALUES
(1, 1, 'Rajdhani Express', '12951', 'Active', '2026-02-28 11:52:04', '2026-02-28 11:52:04', 1, NULL, NULL, 1),
(2, 2, 'Shatabdi Express', '12010', 'Active', '2026-02-28 11:52:04', '2026-02-28 11:52:04', 1, NULL, NULL, 1),
(3, 3, 'Garib Rath', '12909', 'Inactive', '2026-02-28 11:52:04', '2026-02-28 11:52:04', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `train_booking`
--

CREATE TABLE `train_booking` (
  `train_booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `train_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `booking_status` varchar(30) DEFAULT NULL,
  `booked_at` datetime DEFAULT current_timestamp(),
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train_cancellation`
--

CREATE TABLE `train_cancellation` (
  `cancellation_id` int(11) NOT NULL,
  `train_booking_id` int(11) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `refund_status` varchar(30) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train_coach`
--

CREATE TABLE `train_coach` (
  `coach_id` int(11) NOT NULL,
  `train_id` int(11) DEFAULT NULL,
  `coach_number` varchar(10) DEFAULT NULL,
  `coach_type` varchar(50) DEFAULT NULL,
  `total_seats` int(11) DEFAULT NULL,
  `available_seats` int(11) DEFAULT NULL,
  `coach_position` int(11) DEFAULT NULL,
  `seat_layout` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train_passenger`
--

CREATE TABLE `train_passenger` (
  `passenger_id` int(11) NOT NULL,
  `train_booking_id` int(11) DEFAULT NULL,
  `passenger_name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train_price`
--

CREATE TABLE `train_price` (
  `pricing_id` int(11) NOT NULL,
  `train_id` int(11) DEFAULT NULL,
  `coach_type` varchar(50) DEFAULT NULL,
  `base_fare` decimal(8,2) DEFAULT NULL,
  `tax_amount` decimal(8,2) DEFAULT NULL,
  `total_fare` decimal(8,2) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train_refund`
--

CREATE TABLE `train_refund` (
  `refund_id` int(11) NOT NULL,
  `cancellation_id` int(11) DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refund_date` date DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train_route`
--

CREATE TABLE `train_route` (
  `route_id` int(11) NOT NULL,
  `train_id` int(11) DEFAULT NULL,
  `from_city_id` int(11) DEFAULT NULL,
  `to_city_id` int(11) DEFAULT NULL,
  `distance_km` decimal(6,2) DEFAULT NULL,
  `travel_time` varchar(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train_seat`
--

CREATE TABLE `train_seat` (
  `seat_id` int(11) NOT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `seat_status` varchar(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indexes for table `flight_booking`
--
ALTER TABLE `flight_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `flight_cancellation`
--
ALTER TABLE `flight_cancellation`
  ADD PRIMARY KEY (`cancellation_id`);

--
-- Indexes for table `flight_passenger`
--
ALTER TABLE `flight_passenger`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `flight_pricing`
--
ALTER TABLE `flight_pricing`
  ADD PRIMARY KEY (`pricing_id`);

--
-- Indexes for table `flight_refund`
--
ALTER TABLE `flight_refund`
  ADD PRIMARY KEY (`refund_id`);

--
-- Indexes for table `flight_seat`
--
ALTER TABLE `flight_seat`
  ADD PRIMARY KEY (`seat_id`);

--
-- Indexes for table `mst_admin`
--
ALTER TABLE `mst_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `mst_users`
--
ALTER TABLE `mst_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`train_id`),
  ADD UNIQUE KEY `train_number` (`train_number`);

--
-- Indexes for table `train_booking`
--
ALTER TABLE `train_booking`
  ADD PRIMARY KEY (`train_booking_id`),
  ADD KEY `train_id` (`train_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `train_cancellation`
--
ALTER TABLE `train_cancellation`
  ADD PRIMARY KEY (`cancellation_id`),
  ADD KEY `train_booking_id` (`train_booking_id`);

--
-- Indexes for table `train_coach`
--
ALTER TABLE `train_coach`
  ADD PRIMARY KEY (`coach_id`),
  ADD KEY `train_id` (`train_id`);

--
-- Indexes for table `train_passenger`
--
ALTER TABLE `train_passenger`
  ADD PRIMARY KEY (`passenger_id`),
  ADD KEY `train_booking_id` (`train_booking_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- Indexes for table `train_price`
--
ALTER TABLE `train_price`
  ADD PRIMARY KEY (`pricing_id`),
  ADD KEY `train_id` (`train_id`);

--
-- Indexes for table `train_refund`
--
ALTER TABLE `train_refund`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `cancellation_id` (`cancellation_id`);

--
-- Indexes for table `train_route`
--
ALTER TABLE `train_route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `train_id` (`train_id`);

--
-- Indexes for table `train_seat`
--
ALTER TABLE `train_seat`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `coach_id` (`coach_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flight_booking`
--
ALTER TABLE `flight_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_cancellation`
--
ALTER TABLE `flight_cancellation`
  MODIFY `cancellation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_passenger`
--
ALTER TABLE `flight_passenger`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_pricing`
--
ALTER TABLE `flight_pricing`
  MODIFY `pricing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_refund`
--
ALTER TABLE `flight_refund`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_seat`
--
ALTER TABLE `flight_seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_admin`
--
ALTER TABLE `mst_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_users`
--
ALTER TABLE `mst_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `train_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `train_booking`
--
ALTER TABLE `train_booking`
  MODIFY `train_booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_cancellation`
--
ALTER TABLE `train_cancellation`
  MODIFY `cancellation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_coach`
--
ALTER TABLE `train_coach`
  MODIFY `coach_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_passenger`
--
ALTER TABLE `train_passenger`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_price`
--
ALTER TABLE `train_price`
  MODIFY `pricing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_refund`
--
ALTER TABLE `train_refund`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_route`
--
ALTER TABLE `train_route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_seat`
--
ALTER TABLE `train_seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `train_booking`
--
ALTER TABLE `train_booking`
  ADD CONSTRAINT `train_booking_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`),
  ADD CONSTRAINT `train_booking_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `train_route` (`route_id`);

--
-- Constraints for table `train_cancellation`
--
ALTER TABLE `train_cancellation`
  ADD CONSTRAINT `train_cancellation_ibfk_1` FOREIGN KEY (`train_booking_id`) REFERENCES `train_booking` (`train_booking_id`);

--
-- Constraints for table `train_coach`
--
ALTER TABLE `train_coach`
  ADD CONSTRAINT `train_coach_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`);

--
-- Constraints for table `train_passenger`
--
ALTER TABLE `train_passenger`
  ADD CONSTRAINT `train_passenger_ibfk_1` FOREIGN KEY (`train_booking_id`) REFERENCES `train_booking` (`train_booking_id`),
  ADD CONSTRAINT `train_passenger_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `train_seat` (`seat_id`);

--
-- Constraints for table `train_price`
--
ALTER TABLE `train_price`
  ADD CONSTRAINT `train_price_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`);

--
-- Constraints for table `train_refund`
--
ALTER TABLE `train_refund`
  ADD CONSTRAINT `train_refund_ibfk_1` FOREIGN KEY (`cancellation_id`) REFERENCES `train_cancellation` (`cancellation_id`);

--
-- Constraints for table `train_route`
--
ALTER TABLE `train_route`
  ADD CONSTRAINT `train_route_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`);

--
-- Constraints for table `train_seat`
--
ALTER TABLE `train_seat`
  ADD CONSTRAINT `train_seat_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `train_coach` (`coach_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
