-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2022 at 02:36 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `groupdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductLineID` int(11) NOT NULL,
  `ProductName` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductLineID`, `ProductName`) VALUES
(1, 'Ghee'),
(2, 'Ice Cream'),
(3, 'Powdered Milk'),
(4, 'Yoghurt');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`first_name`, `last_name`, `user_name`, `email`, `password`) VALUES
('Kambuugu', 'Musa', 'Musa', 'abc@gmail.com', 'musa');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` varchar(12) NOT NULL,
  `Date` date NOT NULL,
  `ProductLineID` int(3) NOT NULL,
  `Sale` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `Date`, `ProductLineID`, `Sale`) VALUES
('S1', '2022-07-01', 1, 200),
('s2', '2022-08-03', 1, 140),
('S4', '2022-08-02', 2, 45),
('S34', '2022-07-03', 2, 25),
('s33', '2022-07-03', 3, 25),
('S7', '2022-08-05', 3, 234),
('S67', '2022-07-08', 4, 345),
('S435', '2022-07-21', 4, 23),
('S234', '2022-08-08', 1, 43),
('S23', '2022-08-02', 1, 24),
('S12', '2022-07-09', 1, 23),
('S55', '2022-07-04', 1, 345),
('S67', '2022-07-04', 2, 12),
('S77', '2022-07-03', 2, 10),
('S45', '2022-08-02', 2, 78),
('S889', '2022-08-01', 2, 456),
('S90', '2022-08-01', 3, 78),
('S567', '2022-07-03', 3, 44),
('S23', '2022-08-01', 4, 78),
('S14', '2022-07-14', 4, 46);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Age` varchar(3) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `productLineID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `first_name`, `last_name`, `Email`, `Contact`, `Age`, `Gender`, `productLineID`) VALUES
(6, 'Kwagalakwe', 'Ethel', 'kwagalaethel14@gmail.com', '0759272887', '21', 'Female', 1),
(7, 'Mazima', 'Titus', 'dharyahaetso@gmail.com', '0789456664', '25', 'Male', 1),
(8, 'Mubito', 'Edward', 'kwagalaethel14@gmail.com', '0789456664', '21', 'Male', 1),
(10, 'Kitembe', 'Eddy', 'Eddy@gmail.com', '0764321876', '32', 'Male', 1),
(11, 'Konga', 'Siyeye', 'Konga@gmail.com', '0745678934', '43', 'Female', 2),
(12, 'Mutyo', 'Esther', 'Esther@gmail.com', '0756434532', '23', 'Female', 2),
(13, 'Sedegaye', 'Rollland', 'Rolls@gmail.com', '0777754321', '21', 'Male', 2),
(14, 'Kembabazi', 'Emmanuella', 'Emma@gmail.com', '0784567894', '24', 'Female', 2),
(15, 'Sebintu', 'Klinton', 'Klin@gmail.com', '0789653456', '25', 'Male', 2),
(16, 'Kamba', 'Hussein', 'Kamba@gmail.com', '0723456781', '23', 'Male', 2),
(17, 'Nabanja', 'Bridget', 'Nabanja@gmail.com', '0786954332', '22', 'Female', 2),
(18, 'Kyolaba', 'Grace', 'Grace@gmail.com', '0756435556', '24', 'Female', 2),
(19, 'Badiru', 'Kyigundu', 'Kyigundu@gmail.com', '0789221123', '34', 'Male', 2),
(20, 'Namiro', 'Sarah', 'Namzy@gmail.com', '0788995432', '26', 'Female', 2),
(21, 'Mezas', 'Sharwama', 'sharwama@gmail.com', '07211167845', '19', 'Male', 2),
(22, 'Shanti', 'Uhuru', 'Ushanti@gmail.com', '0789654321', '32', 'Female', 2),
(23, 'Lulu', 'Meza', 'Meza@yahoo.com', '072223455', '31', 'Male', 3),
(24, 'Musaazi', 'Fred', 'Freds@gmail.com', '079999654', '29', 'Male', 3),
(25, 'Kakembo', 'Victor', 'Victor@gmail.com', '0788876691', '29', 'Male', 3),
(26, 'Tino', 'Tracy', 'Tino@yahoo,com', '0777785544', '27', 'Female', 3),
(30, 'Jovita', 'Ursla', 'Ursla@gmail.com', '0776543212', '21', 'Female', 3),
(31, 'Kato', 'Moses', 'Mos@gmail.com', '0789546327', '25', 'Male', 3),
(32, 'Hajji', 'Nasser', 'Hajji@gmail.com', '0764539876', '25', 'Male', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductLineID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
