-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2022 at 08:48 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dairyproduction`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CustomerID` int(11) NOT NULL,
  `ProductName` varchar(20) NOT NULL,
  `OrderQuantity` int(11) NOT NULL DEFAULT 1,
  `OrderPrice` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`CustomerID`, `ProductName`, `OrderQuantity`, `OrderPrice`, `OrderID`) VALUES
(1, 'Ghee\r\n', 4, 4000, 35),
(1, 'Ghee\r\n', 1, 4000, 37),
(1, 'Ghee\r\n', 1, 4000, 38),
(1, 'Ghee\r\n', 2, 4000, 39),
(1, 'Ghee\r\n', 1, 4000, 40),
(1, 'Ghee\r\n', 1, 4000, 41),
(1, 'Ghee\r\n', 1, 4000, 42),
(1, 'Ghee\r\n', 1, 4000, 43),
(1, 'Ghee\r\n', 1, 4000, 44),
(1, 'Ghee\r\n', 1, 4000, 45);

-- --------------------------------------------------------

--
-- Table structure for table `productstable`
--

CREATE TABLE `productstable` (
  `ProductName` varchar(20) NOT NULL,
  `ProductQuantity` int(11) DEFAULT NULL,
  `ProductType` varchar(20) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Likes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productstable`
--

INSERT INTO `productstable` (`ProductName`, `ProductQuantity`, `ProductType`, `UnitPrice`, `Description`, `Image`, `Likes`) VALUES
('Ghee', NULL, 'Long-term', 4000, 'Awesomeness Just', 'ghee.jpg', 0),
('icecream', NULL, 'Long-term', 2000, 'so yummy', 'IceCream.jpg', 0),
('PowderedMilk', NULL, 'Long-term', 5000, 'good quality product', 'POWDERD.jpg', 0),
('Yoghout', NULL, 'Long-term', 6500, 'Awesomeness Just', 'strawberryyoghurt.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `OrderID` int(11) NOT NULL,
  `ProductName` varchar(20) NOT NULL,
  `OrderQuantity` int(11) NOT NULL,
  `SalesTotal` int(11) NOT NULL,
  `SalesID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`OrderID`, `ProductName`, `OrderQuantity`, `SalesTotal`, `SalesID`, `CustomerID`) VALUES
(23, 'icecream\r\n', 1, 888, 8, 1),
(24, 'PowderedMilk\r\n', 1, 245, 9, 1),
(26, 'PowderedMilk\r\n', 1, 245, 10, 1),
(27, 'Yoghout\r\n', 1, 700, 11, 1),
(28, 'Yoghout\r\n', 1, 700, 12, 1),
(29, 'Ghee\r\n', 1, 455, 13, 1),
(30, 'icecream\r\n', 1, 44555, 14, 1),
(32, 'PowderedMilk\r\n', 1, 5000, 15, 1),
(33, 'PowderedMilk\r\n', 1, 5000, 16, 1),
(33, 'PowderedMilk\r\n', 1, 5000, 17, 1),
(34, 'Ghee\r\n', 4, 1820, 18, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `productstable`
--
ALTER TABLE `productstable`
  ADD PRIMARY KEY (`ProductName`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SalesID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SalesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
