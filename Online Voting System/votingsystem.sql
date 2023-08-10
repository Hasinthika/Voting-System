-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 09:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `votingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `candidate_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(6) NOT NULL,
  `telephone_number` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `election_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`candidate_id`, `user_name`, `password`, `telephone_number`, `age`, `election_id`) VALUES
(1, 'Paul Evans', '12345', '0787538812', 44, 10001),
(2, 'Robot Nickson', '123422', '0786538812', 40, 10002),
(3, 'John Camaron', '22345', '0712535812', 34, 10003);

-- --------------------------------------------------------

--
-- Table structure for table `election`
--

CREATE TABLE `election` (
  `election_id` int(5) NOT NULL,
  `title` varchar(25) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `election`
--

INSERT INTO `election` (`election_id`, `title`, `start_date`, `end_date`, `description`) VALUES
(10001, 'Local Assembly Election', '2023-05-01', '2023-05-01', 'uytuyghbj,ksurytl\r\nuytuiehguieo'),
(10002, 'Provincial Council Electi', '2023-08-09', '2023-08-09', 'nhgtfrdeswasedrftyuiolkmnbv'),
(10003, 'Presidential Council Elec', '2024-08-09', '2024-08-09', 'mhyureswev\r\nbvfde\r\nbjuiourdcv\r\nmkiuytrewsxcvbnk');

-- --------------------------------------------------------

--
-- Table structure for table `election_commision`
--

CREATE TABLE `election_commision` (
  `election_commision_id` int(5) NOT NULL,
  `email` varchar(25) NOT NULL,
  `telephone_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `election_commision`
--

INSERT INTO `election_commision` (`election_commision_id`, `email`, `telephone_number`) VALUES
(1, 'srilankaelection@gmail.co', 112295488);

-- --------------------------------------------------------

--
-- Table structure for table `voter`
--

CREATE TABLE `voter` (
  `voter_id` int(5) NOT NULL,
  `type` varchar(25) NOT NULL,
  `election_communication_id` int(5) NOT NULL,
  `candidate_id` int(5) NOT NULL,
  `admin_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voter`
--

INSERT INTO `voter` (`voter_id`, `type`, `election_communication_id`, `candidate_id`, `admin_id`) VALUES
(1, 'Local Assembly Election', 1, 1, 1),
(2, 'Local Assembly Election', 1, 2, 1),
(3, 'Provincial Council Electi', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `voter_record`
--

CREATE TABLE `voter_record` (
  `record_id` int(11) NOT NULL,
  `citizenship_id` varchar(30) NOT NULL,
  `gender` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voter_record`
--

INSERT INTO `voter_record` (`record_id`, `citizenship_id`, `gender`) VALUES
(1, '20034568971', 'Male'),
(2, '19934568971', 'Male'),
(3, '19734568971', 'Male'),
(4, '19984568971', 'Female'),
(5, '19984568971', 'Male'),
(6, '19984568971', 'Female'),
(7, '19984568971', 'Femlae'),
(8, '19984568971', 'Male'),
(9, '20034568971', 'Male'),
(10, '19734568971', 'Prefer not to say'),
(11, '19984568971', 'Male'),
(12, '19734568971', 'Female'),
(13, '20034568971', 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`candidate_id`),
  ADD KEY `election_id` (`election_id`);

--
-- Indexes for table `election`
--
ALTER TABLE `election`
  ADD PRIMARY KEY (`election_id`);

--
-- Indexes for table `election_commision`
--
ALTER TABLE `election_commision`
  ADD PRIMARY KEY (`election_commision_id`);

--
-- Indexes for table `voter`
--
ALTER TABLE `voter`
  ADD PRIMARY KEY (`voter_id`);

--
-- Indexes for table `voter_record`
--
ALTER TABLE `voter_record`
  ADD PRIMARY KEY (`record_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `candidate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `voter_record`
--
ALTER TABLE `voter_record`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `voter`
--
ALTER TABLE `voter`
  ADD CONSTRAINT `voter_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`),
  ADD CONSTRAINT `voter_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
