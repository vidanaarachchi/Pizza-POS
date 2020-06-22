-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2019 at 10:02 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spdm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `User_Name` varchar(20) DEFAULT NULL,
  `Pass_Word` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`User_Name`, `Pass_Word`) VALUES
('cb007873', 'cb007873');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(10) NOT NULL,
  `F_Name` varchar(20) DEFAULT NULL,
  `L_Name` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `F_Name`, `L_Name`, `DOB`) VALUES
(21, 'Naveen', 'Vidanaarachchi', '2012-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `customerorder`
--

CREATE TABLE `customerorder` (
  `Order_No` int(8) NOT NULL,
  `Order_TakerID` int(5) NOT NULL,
  `Cus_Info` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `DP_ID` int(10) NOT NULL,
  `Customer_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryperson`
--

CREATE TABLE `deliveryperson` (
  `DP_ID` int(10) NOT NULL,
  `DP_Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `FI_ID` smallint(5) NOT NULL,
  `Pasta_Dish` varchar(12) DEFAULT NULL,
  `Beverege` varchar(12) DEFAULT NULL,
  `Starter` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loyalcustomer`
--

CREATE TABLE `loyalcustomer` (
  `Lo_Cus_ID` int(8) NOT NULL,
  `Customer_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `Menu_ID` smallint(5) NOT NULL,
  `Menu_Type` varchar(12) DEFAULT NULL,
  `FI_ID` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Pizza_Type` varchar(20) DEFAULT NULL,
  `Pasta` varchar(10) DEFAULT NULL,
  `Beverage` varchar(25) DEFAULT NULL,
  `Starter` varchar(25) DEFAULT NULL,
  `Customer_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Pizza_Type`, `Pasta`, `Beverage`, `Starter`, `Customer_ID`) VALUES
('Traditional Italiano', 'Cheese', 'Pepsi', 'Item 1', 21);

-- --------------------------------------------------------

--
-- Table structure for table `ordertaker`
--

CREATE TABLE `ordertaker` (
  `Order_TakerID` int(5) NOT NULL,
  `Order_ID` int(10) DEFAULT NULL,
  `Order_Type` varchar(12) DEFAULT NULL,
  `Customer_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertaker`
--

INSERT INTO `ordertaker` (`Order_TakerID`, `Order_ID`, `Order_Type`, `Customer_ID`) VALUES
(31, 41, 'Take Away', 21);

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `Pizza_ID` int(3) NOT NULL,
  `Pizza_Type` varchar(15) DEFAULT NULL,
  `Pizza_Sizes` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `topping`
--

CREATE TABLE `topping` (
  `Topping_ID` smallint(3) NOT NULL,
  `Topping_Type` varchar(13) DEFAULT NULL,
  `Pizza_ID` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Pass_Word`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD PRIMARY KEY (`Order_No`,`Order_TakerID`),
  ADD KEY `Order_TakerID` (`Order_TakerID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`DP_ID`,`Customer_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  ADD PRIMARY KEY (`DP_ID`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`FI_ID`);

--
-- Indexes for table `loyalcustomer`
--
ALTER TABLE `loyalcustomer`
  ADD PRIMARY KEY (`Lo_Cus_ID`,`Customer_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Menu_ID`),
  ADD KEY `FI_ID` (`FI_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `ordertaker`
--
ALTER TABLE `ordertaker`
  ADD PRIMARY KEY (`Order_TakerID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`Pizza_ID`);

--
-- Indexes for table `topping`
--
ALTER TABLE `topping`
  ADD PRIMARY KEY (`Topping_ID`),
  ADD KEY `Pizza_ID` (`Pizza_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD CONSTRAINT `customerorder_ibfk_1` FOREIGN KEY (`Order_TakerID`) REFERENCES `ordertaker` (`Order_TakerID`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`DP_ID`) REFERENCES `deliveryperson` (`DP_ID`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `loyalcustomer`
--
ALTER TABLE `loyalcustomer`
  ADD CONSTRAINT `loyalcustomer_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`FI_ID`) REFERENCES `foods` (`FI_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `ordertaker`
--
ALTER TABLE `ordertaker`
  ADD CONSTRAINT `ordertaker_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `topping`
--
ALTER TABLE `topping`
  ADD CONSTRAINT `topping_ibfk_1` FOREIGN KEY (`Pizza_ID`) REFERENCES `pizza` (`Pizza_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
