-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2026 at 05:04 PM
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
-- Database: `transplant_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `FindMatches` ()   BEGIN
    SELECT d.name AS donor, r.name AS recipient
    FROM Donor d
    JOIN Recipient r
    ON d.blood_group = r.blood_group
    AND d.organ = r.required_organ
    WHERE d.status = 'Available';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `available_donors`
-- (See below for the actual view)
--
CREATE TABLE `available_donors` (
`donor_id` int(11)
,`name` varchar(100)
,`age` int(11)
,`blood_group` varchar(5)
,`organ` varchar(50)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `donor_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL CHECK (`age` > 0),
  `blood_group` varchar(5) NOT NULL,
  `organ` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`donor_id`, `name`, `age`, `blood_group`, `organ`, `status`) VALUES
(1, 'Rahul Sharma', 30, 'O+', 'Kidney', 'Unavailable'),
(2, 'Anita Verma', 25, 'A+', 'Liver', 'Unavailable'),
(3, 'Vikram Singh', 40, 'B+', 'Heart', 'Unavailable'),
(4, 'Priya Nair', 28, 'AB+', 'Kidney', 'Unavailable'),
(5, 'Arjun Reddy', 35, 'O-', 'Liver', 'Unavailable'),
(6, 'Sneha Iyer', 22, 'A-', 'Kidney', 'Unavailable'),
(7, 'Karthik Rao', 45, 'B-', 'Heart', 'Available'),
(8, 'Neha Gupta', 32, 'O+', 'Liver', 'Available'),
(9, 'Rohit Mehta', 29, 'A+', 'Kidney', 'Available'),
(10, 'Pooja Das', 38, 'AB-', 'Heart', 'Available'),
(11, 'Manoj Kumar', 50, 'O+', 'Kidney', 'Available'),
(12, 'Divya Shetty', 27, 'B+', 'Liver', 'Available'),
(13, 'Sandeep Patil', 41, 'A+', 'Heart', 'Available'),
(14, 'Kavya Nair', 24, 'O-', 'Kidney', 'Available'),
(15, 'Amit Joshi', 36, 'B-', 'Liver', 'Available'),
(16, 'Shreya Kapoor', 31, 'AB+', 'Heart', 'Available'),
(17, 'Nikhil Jain', 34, 'O+', 'Kidney', 'Available'),
(18, 'Anjali Menon', 26, 'A-', 'Liver', 'Available'),
(19, 'Varun Khanna', 39, 'B+', 'Kidney', 'Available'),
(20, 'Megha Shah', 33, 'O+', 'Heart', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospital_id`, `name`, `location`) VALUES
(1, 'City Hospital', 'Bangalore'),
(2, 'Apollo Hospital', 'Chennai'),
(3, 'Fortis Hospital', 'Mumbai'),
(4, 'Manipal Hospital', 'Bangalore'),
(5, 'AIIMS', 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `matchtable`
--

CREATE TABLE `matchtable` (
  `match_id` int(11) NOT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `match_status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matchtable`
--

INSERT INTO `matchtable` (`match_id`, `donor_id`, `recipient_id`, `match_status`) VALUES
(1, 1, 1, 'Pending'),
(2, 2, 2, 'Pending'),
(3, 3, 3, 'Pending'),
(4, 4, 4, 'Pending'),
(5, 5, 5, 'Pending'),
(6, 6, 6, 'Pending'),
(7, 7, 7, 'Pending'),
(8, 8, 8, 'Pending'),
(9, 9, 9, 'Pending'),
(10, 10, 10, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL CHECK (`age` > 0),
  `blood_group` varchar(5) NOT NULL,
  `required_organ` varchar(50) NOT NULL,
  `urgency` varchar(20) DEFAULT NULL CHECK (`urgency` in ('Low','Medium','High')),
  `status` varchar(20) DEFAULT 'Waiting'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `name`, `age`, `blood_group`, `required_organ`, `urgency`, `status`) VALUES
(1, 'Kiran Kumar', 45, 'O+', 'Kidney', 'High', 'Completed'),
(2, 'Meera Nair', 35, 'A+', 'Liver', 'Medium', 'Completed'),
(3, 'Suresh Reddy', 50, 'B+', 'Heart', 'High', 'Completed'),
(4, 'Lakshmi Devi', 60, 'AB+', 'Kidney', 'Low', 'Completed'),
(5, 'Ramesh Gupta', 48, 'O-', 'Liver', 'High', 'Completed'),
(6, 'Anil Sharma', 55, 'A-', 'Kidney', 'Medium', 'Completed'),
(7, 'Sunita Rao', 42, 'B-', 'Heart', 'High', 'Waiting'),
(8, 'Deepak Verma', 37, 'O+', 'Liver', 'Low', 'Waiting'),
(9, 'Pallavi Joshi', 29, 'A+', 'Kidney', 'High', 'Waiting'),
(10, 'Gaurav Singh', 44, 'AB-', 'Heart', 'Medium', 'Waiting'),
(11, 'Harish Iyer', 52, 'O+', 'Kidney', 'High', 'Waiting'),
(12, 'Rekha Das', 39, 'B+', 'Liver', 'Low', 'Waiting'),
(13, 'Tarun Mehta', 46, 'A+', 'Heart', 'High', 'Waiting'),
(14, 'Nisha Kapoor', 33, 'O-', 'Kidney', 'Medium', 'Waiting'),
(15, 'Vijay Patil', 58, 'B-', 'Liver', 'High', 'Waiting'),
(16, 'Seema Shah', 41, 'AB+', 'Heart', 'Low', 'Waiting'),
(17, 'Ajay Jain', 47, 'O+', 'Kidney', 'High', 'Waiting'),
(18, 'Bhavna Menon', 36, 'A-', 'Liver', 'Medium', 'Waiting'),
(19, 'Kunal Khanna', 38, 'B+', 'Kidney', 'High', 'Waiting'),
(20, 'Ritu Agarwal', 43, 'O+', 'Heart', 'Medium', 'Waiting');

-- --------------------------------------------------------

--
-- Table structure for table `transplant`
--

CREATE TABLE `transplant` (
  `transplant_id` int(11) NOT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `transplant_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transplant`
--

INSERT INTO `transplant` (`transplant_id`, `donor_id`, `recipient_id`, `hospital_id`, `transplant_date`, `status`) VALUES
(1, 1, 1, 1, '2026-04-10', 'Completed'),
(2, 2, 2, 2, '2026-04-11', 'Completed'),
(3, 3, 3, 3, '2026-04-12', 'Completed'),
(4, 4, 4, 4, '2026-04-13', 'Scheduled'),
(5, 5, 5, 5, '2026-04-14', 'Scheduled'),
(6, 6, 6, 1, '2026-04-20', 'Completed');

--
-- Triggers `transplant`
--
DELIMITER $$
CREATE TRIGGER `after_transplant` AFTER INSERT ON `transplant` FOR EACH ROW BEGIN
    UPDATE Donor
    SET status = 'Unavailable'
    WHERE donor_id = NEW.donor_id;

    UPDATE Recipient
    SET status = 'Completed'
    WHERE recipient_id = NEW.recipient_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `available_donors`
--
DROP TABLE IF EXISTS `available_donors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `available_donors`  AS SELECT `donor`.`donor_id` AS `donor_id`, `donor`.`name` AS `name`, `donor`.`age` AS `age`, `donor`.`blood_group` AS `blood_group`, `donor`.`organ` AS `organ`, `donor`.`status` AS `status` FROM `donor` WHERE `donor`.`status` = 'Available' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `matchtable`
--
ALTER TABLE `matchtable`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `donor_id` (`donor_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `transplant`
--
ALTER TABLE `transplant`
  ADD PRIMARY KEY (`transplant_id`),
  ADD KEY `donor_id` (`donor_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `matchtable`
--
ALTER TABLE `matchtable`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transplant`
--
ALTER TABLE `transplant`
  MODIFY `transplant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matchtable`
--
ALTER TABLE `matchtable`
  ADD CONSTRAINT `matchtable_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matchtable_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`recipient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transplant`
--
ALTER TABLE `transplant`
  ADD CONSTRAINT `transplant_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transplant_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`recipient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transplant_ibfk_3` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
