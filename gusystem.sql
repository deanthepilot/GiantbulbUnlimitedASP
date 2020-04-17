-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2020 at 12:30 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gusystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `firstName`, `lastName`) VALUES
(1, 'Jeremy', 'Rodriguez'),
(2, 'Neave', 'Tyson'),
(3, 'Waqas', 'Gonzales'),
(4, 'Cassidy', 'Dolan'),
(5, 'Ammarah', 'Duran'),
(6, 'Bethanie', 'Sexton'),
(7, 'Safiyah', 'Ballard'),
(8, 'Shae', 'Timms'),
(9, 'Willis', 'Kearns'),
(10, 'Paige', 'Frazier'),
(11, 'Inaaya', 'Medina'),
(12, 'Lesley', 'Glover'),
(13, 'Emilia', 'Shannon'),
(14, 'Junaid', 'Stout'),
(15, 'Darcie', 'North'),
(16, 'Alessandra', 'Harrington'),
(17, 'Fynley', 'Faulkner'),
(18, 'Chandler', 'Cisenros'),
(19, 'Hasnain', 'Salt'),
(20, 'Kailan', 'Dale');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `inquiryID` int(11) NOT NULL,
  `inquiryName` varchar(255) NOT NULL,
  `inquiryEmail` varchar(255) NOT NULL,
  `inquiryPhone` bigint(20) NOT NULL,
  `inquiryPrice` varchar(64) NOT NULL,
  `inquiryMsg` varchar(500) NOT NULL,
  `employeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`inquiryID`, `inquiryName`, `inquiryEmail`, `inquiryPhone`, `inquiryPrice`, `inquiryMsg`, `employeeID`) VALUES
(1, 'Tiah', 'tiahb@gmail.com', 4966490074, '200-300', 'Lorem ipsum dolor sit amet', 4),
(2, 'Tymon', 'tymonc@gmail.com', 6422191218, '100-200', 'Lorem ipsum dolor sit amet', 4),
(3, 'Orlando', 'orlandof@gmail.com', 6649527423, '200-300', 'Lorem ipsum dolor sit amet', 4),
(4, 'Harlee', 'harleeo@gmail.com', 8407674410, '300-400', 'Lorem ipsum dolor sit amet', 4),
(5, 'Preston', 'prestone@gmail.com', 4508683461, '300-400', 'Lorem ipsum dolor sit amet', 4),
(6, 'Louise', 'louisel@gmail.com', 7133921980, '100-200', 'Lorem ipsum dolor sit amet', 4),
(7, 'Krystal', 'krystalg@gmail.com', 3134511761, '500-600', 'Lorem ipsum dolor sit amet', 4),
(8, 'Ritchie', 'ritchieb@gmail.com', 5887322135, '800-900', 'Lorem ipsum dolor sit amet', 4),
(9, 'Mayur', 'mayurs@gmail.com', 9347617135, '100-200', 'Lorem ipsum dolor sit amet', 4),
(10, 'Yaseen', 'yaseenm@gmail.com', 4886017988, '200-300', 'Lorem ipsum dolor sit amet', 4),
(11, 'Scarlett', 'scarletth@gmail.com', 6325293570, '900-1000', 'Lorem ipsum dolor sit amet', 4),
(12, 'Berat', 'berath@gmail.com', 4478407983, '200-300', 'Lorem ipsum dolor sit amet', 4),
(13, 'Rian', 'rianw@gmail.com', 5248999476, '500-600', 'Lorem ipsum dolor sit amet', 4),
(14, 'Petra', 'petraz@gmail.com', 6287560769, '600-700', 'Lorem ipsum dolor sit amet', 4),
(15, 'Lexi', 'lexip@gmail.com', 5653634044, '700-800', 'Lorem ipsum dolor sit amet', 4),
(16, 'Viktoria', 'viktoriam@gmail.com', 5653374368, '900-1000', 'Lorem ipsum dolor sit amet', 4),
(17, 'Madeline', 'madelinep@gmail.com', 4598360433, '200-300', 'Lorem ipsum dolor sit amet', 4),
(18, 'Davey', 'daveye@gmail.com', 3646084659, '100-200', 'Lorem ipsum dolor sit amet', 4),
(19, 'Arwa', 'arwak@gmail.com', 5908242223, '400-500', 'Lorem ipsum dolor sit amet', 4),
(20, 'Shelby', 'shelbyp@gmail.com', 4474168773, '200-300', 'Lorem ipsum dolor sit amet', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`inquiryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `inquiryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
