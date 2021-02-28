-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 18, 2020 at 12:00 PM
-- Server version: 10.3.22-MariaDB-1ubuntu1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkingallotment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
use tablebooking;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `password`) VALUES
(1001, 'abc@123');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `bookingid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `vehicle_no` varchar(50) NOT NULL,
  `locationid` int(8) DEFAULT NULL,
  `slotid` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(20) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `paid` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bookingid`, `email`, `vehicle_type`, `vehicle_no`, `locationid`, `slotid`, `date`, `time`, `duration`, `cost`, `paid`) VALUES
(22, 'test05@gmail.com', 'Four Seater', 'test05 family', 1, '1slot1', '12-7-2020', '11:45', '2', '60', 1),
(23, 'test1@gmail.com', 'Multi Seater', 'test1 family', 1, '1slot2', '12-7-2020', '12:58', '2', '60', 1),
(25, 'test05@gmail.com', 'Four Seater', 'test05 family', 2, '2slot2', '13-7-2020', '11:09', '24', '720', 1),
(27, 'test1@gmail.com', 'Two Seater', 'test1 family', 2, '2slot2', '16-7-2020', '14:28', '1', '30', 1),
(28, 'susan@gmail.com', 'Two Wheeler', 'Susan family', 1, '1slot1', '18-7-2020', '20:51', '9', '90', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `locationid` int(8) UNSIGNED NOT NULL,
  `location_name` varchar(80) NOT NULL,
  `area` varchar(100) NOT NULL,
  `slots` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`locationid`, `location_name`, `area`, `slots`) VALUES
(1, 'The Residency', ' No 1076, Avinashi Road, Coimbatore Central, Coimbatore - 641018', 3),
(2, 'Shree Anandhaas', 'No 178, Pollachi Main Road, Sundarapuram, Coimbatore - 641024', 2),
(27, 'Junior Kuppanna', 'No 177, Sarojini Street, Ram Nagar, Coimbatore - 641009', 2),
(28, ' Hari Bhavanam', 'No 64 Eskepi Premises, Balasundaram Road RTO Office Road, Coimbatore Central, Coimbatore - 641018', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `slotid` varchar(20) NOT NULL,
  `locationid` int(8) NOT NULL,
  `slotno` varchar(20) NOT NULL,
  `status` int(8) NOT NULL,
  `time` varchar(20) NOT NULL,
  `duration` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`slotid`, `locationid`, `slotno`, `status`, `time`, `duration`) VALUES
('1slot1', 1, 'Slot 1', 0, '0', 0),
('1slot2', 1, 'Slot 2', 0, '0', 0),
('1slot3', 1, 'Slot 3', 0, '0', 0),
('27slot1', 27, 'Slot 1', 0, '0', 0),
('27slot2', 27, 'Slot 2', 0, '0', 0),
('28slot1', 28, 'Slot 1', 0, '0', 0),
('2slot1', 2, 'Slot 1', 0, '0', 0),
('2slot2', 2, 'Slot 2', 0, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `mobno` varchar(15) NOT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `fullname`, `mobno`, `password`) VALUES
('susan@gmail.com', 'Susan', '08428616811', '111'),
('test01@gmail.com', 'test01', '1234567890', 'abc'),
('test05@gmail.com', 'test5', '1234567890', 'xyz'),
('test1@gmail.com', 'test1', '1234567890', '123');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicleid` int(8) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `cost` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicleid`, `vehicle_type`, `cost`) VALUES
(4, 'Two Seater', '0'),
(5, 'Four Seater', '0'),
(7, 'Two Seater(A/C)', '10'),
(8, 'Four Seater(A/C)', '20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bookingid`),
  ADD KEY `fk_email` (`email`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`locationid`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`slotid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `locationid` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicleid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`);
COMMIT;

-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
