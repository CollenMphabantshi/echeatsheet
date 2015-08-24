-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 24, 2015 at 01:39 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `echeatsheet`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_mode`
--

CREATE TABLE IF NOT EXISTS `access_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_mode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `access_mode`
--


-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--


-- --------------------------------------------------------

--
-- Table structure for table `assesment`
--

CREATE TABLE IF NOT EXISTS `assesment` (
  `assesment_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `assesment_level` varchar(50) NOT NULL,
  `assesment_type` varchar(50) NOT NULL,
  `institution_name` varchar(100) NOT NULL,
  `file_hash` varchar(300) NOT NULL,
  `upload_date` varchar(50) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`assesment_id`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `assesment`
--


-- --------------------------------------------------------

--
-- Table structure for table `assesment_field`
--

CREATE TABLE IF NOT EXISTS `assesment_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `assesment_field`
--

INSERT INTO `assesment_field` (`id`, `name`) VALUES
(1, 'Engineering'),
(2, 'Information Technology'),
(3, 'Computer Science'),
(4, 'Mathematics'),
(5, 'Accounting'),
(6, 'Biological Science'),
(7, 'Geology');

-- --------------------------------------------------------

--
-- Table structure for table `assesment_level`
--

CREATE TABLE IF NOT EXISTS `assesment_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `assesment_level`
--

INSERT INTO `assesment_level` (`id`, `name`) VALUES
(1, '1st Year'),
(2, '2nd Year'),
(3, '3rd Year'),
(4, '4th Year'),
(5, '5th Year'),
(6, 'Honours'),
(7, 'Masters'),
(8, 'MBA'),
(9, 'PhD');

-- --------------------------------------------------------

--
-- Table structure for table `assesment_type`
--

CREATE TABLE IF NOT EXISTS `assesment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `assesment_class` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `assesment_type`
--

INSERT INTO `assesment_type` (`id`, `name`, `assesment_class`) VALUES
(1, 'Exam', 'exam'),
(2, 'Semester Test', 'semtest'),
(3, 'Class Test', 'classtest'),
(4, 'Practical Exam', 'pracexam'),
(5, 'Practical Test', 'practtest'),
(6, 'Practical', 'prac'),
(7, 'Tutorial Test', 'tutorialtest'),
(8, 'Tutorial', 'tutorial'),
(9, 'Class Notes', 'classnotes');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE IF NOT EXISTS `audit_log` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_uid` int(11) NOT NULL,
  `audit_date` date DEFAULT NULL,
  `audit_time` time DEFAULT NULL,
  `audit_action` text,
  `userID` varchar(50) NOT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `audit_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE IF NOT EXISTS `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `download_count` varchar(50) NOT NULL,
  `download_date` varchar(50) NOT NULL,
  `downloaderID` varchar(50) NOT NULL,
  `assesmentID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `downloaderID` (`downloaderID`),
  KEY `assesmentID` (`assesmentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloads`
--


-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE IF NOT EXISTS `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`id`, `name`, `country`) VALUES
(1, 'University of Pretoria', 'South Africa');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_date` varchar(50) NOT NULL,
  `uploadID` int(11) NOT NULL,
  `assesmentID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uploadID` (`uploadID`),
  KEY `assesmentID` (`assesmentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `uploads`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `institution_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `cell_number` varchar(10) NOT NULL,
  `user_level` varchar(100) DEFAULT NULL,
  `user_field` varchar(100) NOT NULL,
  `access_mode` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `surname`, `institution_name`, `email`, `password`, `cell_number`, `user_level`, `user_field`, `access_mode`) VALUES
('collen', 'mphabantshi', 'University of Pretoria', 'mickeybanchi@gmail.com', '8e95187ab6532a305cfbc832f123c90fe3faf0029506100ed1f65afea5c607a6', '0768288714', '1st Year', 'Engineering', 'Normal'),
('hh', 'mphabantshi', 'University of Pretoria', 'mickeybanchi2@gmail.com', '6d7ea56c87061068d7e475d3b4476d01f55c0efe67b9267dd3dcfc2ad75bde01', '0122365230', '1st Year', 'Engineering', 'Normal');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
