-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 30, 2023 at 04:52 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinevoting`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
CREATE TABLE IF NOT EXISTS `candidates` (
  `candidateid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `admno` varchar(30) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '1',
  `symbol` varchar(100) DEFAULT NULL,
  `std_un` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`candidateid`),
  UNIQUE KEY `symbol` (`symbol`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`candidateid`, `cid`, `admno`, `status`, `symbol`, `std_un`) VALUES
(1, 2, '20RR079', '1', '20RR0792.png', NULL),
(2, 1, '20RR137', '1', '20RR1371.png', NULL),
(3, 5, '20RR079', '1', '20RR0795.png', NULL),
(4, 5, '20RR137', '1', '20RR1375.png', NULL),
(5, 6, '20RR079', '1', '20RR0796.png', NULL),
(6, 6, '20RR137', '1', '20RR1376.png', NULL),
(7, 7, '20RR079', '1', '20RR0797.png', NULL),
(8, 8, '20RR137', '1', '20RR1378.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
CREATE TABLE IF NOT EXISTS `complaints` (
  `cmpid` int NOT NULL AUTO_INCREMENT,
  `time` timestamp(5) NOT NULL DEFAULT CURRENT_TIMESTAMP(5),
  `email` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` varchar(10) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `reply` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  PRIMARY KEY (`cmpid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`cmpid`, `time`, `email`, `title`, `content`, `status`, `reply`) VALUES
(1, '2023-07-30 09:28:28.01338', '20rr079@vjcet.org', 'IEEE election', 'a bit slow', '1', 'we will work on it'),
(2, '2023-08-07 03:49:50.41218', '20rr079@vjcet.org', 'IEEE Election', 'Verificati', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
CREATE TABLE IF NOT EXISTS `contest` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `starttime` varchar(10) NOT NULL,
  `endtime` varchar(10) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '1',
  `designation` varchar(30) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contest`
--

INSERT INTO `contest` (`cid`, `name`, `date`, `starttime`, `endtime`, `status`, `designation`) VALUES
(1, 'College Election', '2023-07-30', ' 10', '17', '2', 'Chairperson'),
(2, 'Class Election', '2023-08-18', ' 12', '16', '1', 'Class Representative'),
(8, 'College Election', '2023-08-12', ' 8', '15', '1', 'Chairman'),
(4, 'IEEE Execom', '2023-06-30', ' 10', '16', '1', 'NSS Chair'),
(5, 'College Election', '2023-08-09', ' 9', '17', '1', 'Chairman'),
(6, 'College Election', '2023-08-09', ' 10', '17', '1', 'Vice Chairman'),
(7, 'NSS Election', '2023-08-08', ' 9', '16', '1', 'NSS Chair');

-- --------------------------------------------------------

--
-- Table structure for table `electoralroll`
--

DROP TABLE IF EXISTS `electoralroll`;
CREATE TABLE IF NOT EXISTS `electoralroll` (
  `er_id` int NOT NULL AUTO_INCREMENT,
  `admno` varchar(10) NOT NULL,
  `cid` int NOT NULL,
  `candidateid` int DEFAULT '0',
  `votingtime` time(5) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`er_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electoralroll`
--

INSERT INTO `electoralroll` (`er_id`, `admno`, `cid`, `candidateid`, `votingtime`, `status`) VALUES
(1, '20RR137', 2, 0, NULL, NULL),
(2, '20RR079', 2, 0, NULL, NULL),
(3, '20RR137', 1, 0, NULL, NULL),
(4, '20RR079', 1, 2, NULL, NULL),
(5, '20RR137', 5, 0, NULL, NULL),
(6, '20RR079', 5, 0, NULL, NULL),
(7, '20RR079', 6, 0, NULL, NULL),
(8, '20RR137', 6, 6, NULL, NULL),
(9, '20RR079', 7, 7, NULL, NULL),
(11, '20RR288', 5, 0, NULL, NULL),
(12, '20RR137', 8, 0, NULL, NULL),
(13, '20RR215', 8, 0, NULL, NULL),
(14, '20RR288', 8, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `usertype` varchar(2) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `status`, `usertype`) VALUES
('admin@vjcet.org', 'admin123', '1', '0'),
('20rr079@vjcet.org', 'ananya@vjcet', '-2', '1'),
('20rr137@vjcet.org', 'eeva@vjcet', '1', '1'),
('20rr155@vjcet.org', 'sona@vjcet', '-1', '1'),
('20rr187@vjcet.org', 'gishna@vjcet.org', '0', '1'),
('20rr288@vjcet.org', 'abhaya@vjcet', '1', '1'),
('20rr215@vjcet.org', 'gopika@vjcet', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `stdid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `admno` varchar(10) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(7) NOT NULL,
  `rollno` int NOT NULL,
  `semester` varchar(5) NOT NULL,
  `branch` varchar(10) NOT NULL,
  `course` varchar(10) NOT NULL,
  `phn` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `pincode` int NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `admno` (`admno`),
  UNIQUE KEY `stdid` (`stdid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`stdid`, `email`, `admno`, `fname`, `lname`, `dob`, `gender`, `rollno`, `semester`, `branch`, `course`, `phn`, `address`, `state`, `district`, `city`, `pincode`) VALUES
(1, '20rr079@vjcet.org', '20RR079', 'Ananya', 'S', '2002-01-22', 'female', 12, 'S6', 'CSE', 'BTech', '6282273841', 'Mudavoor', 'Kerala', 'Ernakulam', 'Muvattupuzha', 686669),
(3, '20rr137@vjcet.org', '20RR137', 'EEVA', 'E P', '2003-03-21', 'female', 27, 'S6', 'CSE', 'BTech', '0628253268', 'Puthankurush', 'Kerala', 'Ernakulam ', 'Kothamangalam', 686692),
(4, '20rr155@vjcet.org', '20RR155', 'sona', 'xavier', '2002-02-12', 'female', 57, 'S6', 'CSE', 'BTech', '9847723817', 'kochumuttom', 'Kerala', 'Ernakulam ', 'Muvattupuzha ', 768688),
(5, '20rr187@vjcet.org', '20RR187', 'Gishna', 'Biju', '2002-02-17', 'female', 30, 'S6', 'CSE', 'BTech', '7902891702', 'Avoly', 'Kerala', 'Ernakulam ', 'Muvattupuzha', 686670),
(7, '20rr288@vjcet.org', '20RR288', 'Abhaya ', 'Pathrose', '2002-10-10', 'female', 2, 's6', 'CSE', 'BTech', '7655777777', 'Puthankurush', 'Kerala', 'Ernakulam ', 'Kothamangalam', 686692),
(8, '20rr215@vjcet.org', '20RR215', 'gopika', 'shine', '2002-06-04', 'female', 31, 'S6', 'CSE', 'BTech', '8590935349', 'thffj', 'Kerala', 'Ernakulam ', 'Thrissur', 680307);

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
CREATE TABLE IF NOT EXISTS `time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`id`, `data`) VALUES
(1, '00:00'),
(2, '01:00'),
(3, '02:00'),
(4, '03:00'),
(5, '04:00'),
(6, '05:00'),
(7, '06:00'),
(8, '07:00'),
(9, '08:00'),
(10, '09:00'),
(11, '10:00'),
(12, '11:00'),
(13, '12:00'),
(14, '13:00'),
(15, '14:00'),
(16, '15:00'),
(17, '16:00'),
(18, '17:00'),
(19, '18:00'),
(20, '19:00'),
(21, '20:00'),
(22, '21:00'),
(23, '22:00'),
(24, '23:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
