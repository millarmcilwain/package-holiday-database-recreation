-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 30, 2022 at 12:10 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_jet2_holidays`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `BuildingNumber` int(11) NOT NULL,
  `BuildingName` varchar(255) NOT NULL,
  `AddressLine1` varchar(255) NOT NULL,
  `AddressLine2` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Postcode` varchar(255) NOT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressID`, `BuildingNumber`, `BuildingName`, `AddressLine1`, `AddressLine2`, `City`, `Postcode`, `CountryID`) VALUES
(1, 9, 'Villa Pattiera', 'Trumbicev', '', 'Cavtat', '20210', 2),
(2, 24, 'Dubrovnik Airport', 'Dobrota', '', 'Čilipi', '20213', 2),
(3, 0, 'Belfast Internation Airport', 'Airport Road', 'Crumlin', 'Belfast', 'BT29 4AB', 5),
(4, 14, '', 'Green Lane', '', 'Ilford', 'IG1 1YL', 5),
(5, 0, 'Hotel Astarea', 'Šetalište Marka Marojice', '', 'Milni', '20207', 2),
(6, 450, 'Titanic Mardan Palace', 'Kundu Mah', 'Yaşar Sobutay Bul', 'Antalya', '07112', 4),
(7, 924, '', 'Dexter Park', '', 'Engel', 'HX3 5FB', 5),
(12, 0, 'Leeds Bradford Airport', 'Whitehouse Lane', 'Yeadon', 'Leeds', 'LS19 7TU', 5),
(13, 0, 'London Stansted', 'Bassingbourn Road', 'Stansted', 'London', 'CM24 1QW', 5),
(14, 0, 'Newcastle International Airport', 'Woolsington', '', 'Newcastle upon Tyne', 'NE13 8BZ', 5),
(15, 0, 'East Midlands Airport', 'Castle Donington', '', 'Derby', 'DE74 2SA', 5),
(61, 84, '', 'Woodview Road', '', 'Belfast', 'BT93 3FD', 5),
(62, 84, '', 'Woodview Road', '', 'Belfast', 'BT93 3FD', 5),
(63, 84, '', 'Woodview Road', '', 'Belfast', 'BT93 3FD', 5),
(78, 3, 'Side Star Elegance', 'Süleyman Demirel Blv', '', 'Side', '07330', 4),
(79, 358, 'Concorde De Luxe', 'Tesisler Cd', '', 'Güzeloba', '07980', 4),
(83, 84, '', 'HADLEY AVENUE', '', 'Belfast', 'BT93 3FD', 5),
(84, 84, '', 'HADLEY AVENUE', '', 'Belfast', 'BT93 3FD', 5),
(104, 84, '', 'HADLEY AVENUE', '', 'BELFAST', 'BT93 3FD', 5),
(116, 84, '', 'GREEN STREET', '', 'BELFAST', 'BT12 4FS', 5),
(118, 81, '', 'RED STREET', '', 'BELFAST', 'BT13 5FS', 5);

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `AirportID` int(11) NOT NULL,
  `AirportName` varchar(255) NOT NULL,
  `AirportCode` varchar(255) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `AreaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`AirportID`, `AirportName`, `AirportCode`, `AddressID`, `AreaID`) VALUES
(1, 'Belfast International Airport', 'BFS', 3, 5),
(2, 'Dubrovnik Airport', 'DBV', 2, 1),
(3, 'East Midlands Airport', 'EMA', 15, 8),
(4, 'Newcastle International Airport', 'NCL', 14, 6),
(5, 'Leeds Bradford', 'LBA', 12, 3),
(6, 'London Stansted', 'STN', 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `AreaID` int(11) NOT NULL,
  `AreaName` varchar(255) NOT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`AreaID`, `AreaName`, `CountryID`) VALUES
(1, 'Dubrovnik', 2),
(2, 'Crete (Heraklion Area)', 1),
(3, 'Rhodes', 1),
(4, 'Zante', 1),
(5, 'Belfast', 3),
(6, 'Faro City', 3),
(7, 'Antalya Area', 4),
(8, 'Dalaman Area', 4);

-- --------------------------------------------------------

--
-- Table structure for table `board_type`
--

CREATE TABLE `board_type` (
  `BoardTypeID` int(11) NOT NULL,
  `BoardType` varchar(255) NOT NULL,
  `BoardDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `board_type`
--

INSERT INTO `board_type` (`BoardTypeID`, `BoardType`, `BoardDescription`) VALUES
(1, 'Full Board', 'Bed Breakfast Packed Lunch Dinner'),
(2, 'Half Board', 'Bed Breakfast Dinner'),
(3, 'Bed and Breakfast', 'Bed Breakfast');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `BookingReference` varchar(255) NOT NULL,
  `BookingMadeDate` date NOT NULL,
  `BookingStartDate` date NOT NULL,
  `HolidayDurationDays` int(11) NOT NULL,
  `BookingTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AmountPaid` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `RemainderToPay` decimal(10,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `BookingReference`, `BookingMadeDate`, `BookingStartDate`, `HolidayDurationDays`, `BookingTimestamp`, `AmountPaid`, `Total`, `RemainderToPay`, `CurrencyID`) VALUES
(21, 'XLG44343', '2023-05-29', '2023-06-05', 1, '2022-11-26 15:02:13', '800.00', '5960.00', '5160.00', 1),
(33, 'XVXFG433', '2023-05-29', '2023-06-03', 1, '2022-11-27 23:54:32', '800.00', '5627.32', '4827.32', 1),
(35, 'FFA34524', '2023-05-29', '2023-06-03', 1, '2022-11-28 00:05:15', '1200.00', '5627.32', '4427.32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking_flight`
--

CREATE TABLE `booking_flight` (
  `BookingFlightID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_flight`
--

INSERT INTO `booking_flight` (`BookingFlightID`, `BookingID`, `FlightID`) VALUES
(17, 21, 2),
(18, 21, 2),
(19, 21, 2),
(20, 21, 2),
(21, 21, 3),
(22, 21, 3),
(23, 21, 3),
(24, 21, 3),
(65, 33, 2),
(66, 33, 2),
(67, 33, 2),
(68, 33, 2),
(69, 33, 3),
(70, 33, 3),
(71, 33, 3),
(72, 33, 3),
(81, 35, 2),
(82, 35, 2),
(83, 35, 2),
(84, 35, 2),
(85, 35, 3),
(86, 35, 3),
(87, 35, 3),
(88, 35, 3);

-- --------------------------------------------------------

--
-- Table structure for table `booking_line_item`
--

CREATE TABLE `booking_line_item` (
  `BookingLineItemID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `ItemDescription` text NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `BookingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_line_item`
--

INSERT INTO `booking_line_item` (`BookingLineItemID`, `ItemName`, `ItemDescription`, `CurrencyID`, `Price`, `BookingID`) VALUES
(37, 'Double Villa Pattiera', '', 1, '576.00', 21),
(38, 'Double Villa Pattiera', '', 1, '620.98', 21),
(39, 'Double Villa Pattiera', '', 1, '620.98', 21),
(40, 'Twin Villa Pattiera', '', 1, '495.00', 21),
(41, 'Twin Villa Pattiera', '', 1, '495.00', 21),
(42, 'Twin Villa Pattiera', '', 1, '495.00', 21),
(43, 'BFS - DBV DIRECT', '', 1, '359.98', 21),
(44, 'BFS - DBV DIRECT', '', 1, '359.98', 21),
(45, 'BFS - DBV DIRECT', '', 1, '359.98', 21),
(46, 'BFS - DBV DIRECT', '', 1, '359.98', 21),
(47, 'DBV - BFS DIRECT', '', 1, '304.28', 21),
(48, 'DBV - BFS DIRECT', '', 1, '304.28', 21),
(49, 'DBV - BFS DIRECT', '', 1, '304.28', 21),
(50, 'DBV - BFS DIRECT', '', 1, '304.28', 21),
(132, 'Double Villa Pattiera', '', 1, '449.98', 33),
(133, 'Double Villa Pattiera', '', 1, '521.98', 33),
(134, 'Double Villa Pattiera', '', 1, '521.98', 33),
(135, 'Twin Villa Pattiera', '', 1, '503.98', 33),
(136, 'Twin Villa Pattiera', '', 1, '503.98', 33),
(137, 'Twin Villa Pattiera', '', 1, '539.98', 33),
(138, 'BFS - DBV DIRECT', '', 1, '359.98', 33),
(139, 'BFS - DBV DIRECT', '', 1, '359.98', 33),
(140, 'BFS - DBV DIRECT', '', 1, '359.98', 33),
(141, 'BFS - DBV DIRECT', '', 1, '359.98', 33),
(142, 'DBV - BFS DIRECT', '', 1, '286.38', 33),
(143, 'DBV - BFS DIRECT', '', 1, '286.38', 33),
(144, 'DBV - BFS DIRECT', '', 1, '286.38', 33),
(145, 'DBV - BFS DIRECT', '', 1, '286.38', 33),
(160, 'Double Villa Pattiera', '', 1, '449.98', 35),
(161, 'Double Villa Pattiera', '', 1, '521.98', 35),
(162, 'Double Villa Pattiera', '', 1, '521.98', 35),
(163, 'Twin Villa Pattiera', '', 1, '503.98', 35),
(164, 'Twin Villa Pattiera', '', 1, '503.98', 35),
(165, 'Twin Villa Pattiera', '', 1, '539.98', 35),
(166, 'BFS - DBV DIRECT', '', 1, '359.98', 35),
(167, 'BFS - DBV DIRECT', '', 1, '359.98', 35),
(168, 'BFS - DBV DIRECT', '', 1, '359.98', 35),
(169, 'BFS - DBV DIRECT', '', 1, '359.98', 35),
(170, 'DBV - BFS DIRECT', '', 1, '286.38', 35),
(171, 'DBV - BFS DIRECT', '', 1, '286.38', 35),
(172, 'DBV - BFS DIRECT', '', 1, '286.38', 35),
(173, 'DBV - BFS DIRECT', '', 1, '286.38', 35);

-- --------------------------------------------------------

--
-- Table structure for table `booking_passenger`
--

CREATE TABLE `booking_passenger` (
  `PassengerBookingID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_passenger`
--

INSERT INTO `booking_passenger` (`PassengerBookingID`, `PassengerID`, `BookingID`) VALUES
(354, 81, 21),
(355, 82, 21),
(356, 83, 21),
(357, 84, 21),
(402, 129, 33),
(403, 130, 33),
(404, 131, 33),
(405, 132, 33),
(410, 137, 35),
(411, 138, 35),
(412, 139, 35),
(413, 140, 35);

-- --------------------------------------------------------

--
-- Table structure for table `booking_resort_room`
--

CREATE TABLE `booking_resort_room` (
  `BookingResortRoomID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `ResortRoomID` int(11) NOT NULL,
  `CheckInDate` date NOT NULL,
  `CheckOutDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_resort_room`
--

INSERT INTO `booking_resort_room` (`BookingResortRoomID`, `BookingID`, `ResortRoomID`, `CheckInDate`, `CheckOutDate`) VALUES
(32, 21, 14, '2023-06-03', '2023-06-19'),
(35, 21, 7, '2023-06-03', '2023-06-28');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `CountryID` int(11) NOT NULL,
  `CountryName` varchar(255) NOT NULL,
  `CountryISO` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`CountryID`, `CountryName`, `CountryISO`) VALUES
(1, 'Greece', 'GR'),
(2, 'Croatia', 'HR'),
(3, 'Portugal', 'PT'),
(4, 'Turkey', 'TR'),
(5, 'United Kingdom', 'GB');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `CurrencyID` int(11) NOT NULL,
  `CurrencyType` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`CurrencyID`, `CurrencyType`) VALUES
(1, '£'),
(2, '$'),
(3, '€');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerReference` varchar(255) NOT NULL,
  `PersonDetailsID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `CustomerEmailAddress` varchar(255) NOT NULL,
  `CustomerMobileNumber` varchar(255) NOT NULL,
  `CustomerHomeNumber` varchar(255) NOT NULL,
  `ResortEmergencyNumber` varchar(255) NOT NULL,
  `ResortEmergencyEmail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerReference`, `PersonDetailsID`, `AddressID`, `CustomerEmailAddress`, `CustomerMobileNumber`, `CustomerHomeNumber`, `ResortEmergencyNumber`, `ResortEmergencyEmail`) VALUES
(20, 'UF93GHJX', 104, 104, 'HAYMANEILEEN@OUTLOOK.COM', '07897877324', '', '07834722633', 'HAYMANEILEEN@OUTLOOK.COM'),
(32, 'UF93GHJX', 164, 116, 'GRACEBROWN@OUTLOOK.COM', '07853677324', '', '07853677324', 'GRACEBROWN@OUTLOOK.COM'),
(34, 'UF93GHJX', 174, 118, 'ELSASANDWELL@OUTLOOK.COM', '07643677324', '', '07643677324', 'ELSASANDWELL@OUTLOOK.COM');

-- --------------------------------------------------------

--
-- Table structure for table `customer_booking`
--

CREATE TABLE `customer_booking` (
  `CustomerBookingID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_booking`
--

INSERT INTO `customer_booking` (`CustomerBookingID`, `CustomerID`, `BookingID`) VALUES
(20, 20, 21),
(32, 32, 33),
(34, 34, 35);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `FlightID` int(11) NOT NULL,
  `FlightName` varchar(255) NOT NULL,
  `FlightDepartAirportID` int(11) NOT NULL,
  `FlightArriveAirportID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`FlightID`, `FlightName`, `FlightDepartAirportID`, `FlightArriveAirportID`) VALUES
(2, 'BFS - DBV DIRECT', 1, 2),
(3, 'DBV - BFS DIRECT', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flight_price`
--

CREATE TABLE `flight_price` (
  `FlightPriceID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `FlightPrice` decimal(10,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `FlightDepartDate` date NOT NULL,
  `FlightDepartTime` time NOT NULL,
  `FlightArriveDate` date NOT NULL,
  `FlightArriveTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight_price`
--

INSERT INTO `flight_price` (`FlightPriceID`, `FlightID`, `FlightPrice`, `CurrencyID`, `FlightDepartDate`, `FlightDepartTime`, `FlightArriveDate`, `FlightArriveTime`) VALUES
(2, 2, '99.99', 1, '2023-11-06', '06:30:00', '2023-11-06', '08:30:00'),
(3, 3, '147.99', 1, '2023-11-06', '14:40:00', '2023-11-06', '16:40:00'),
(4, 2, '99.99', 1, '2022-12-01', '09:00:00', '2022-12-01', '11:00:00'),
(5, 3, '152.99', 1, '2022-12-15', '16:45:00', '2022-12-15', '18:45:00'),
(6, 2, '134.99', 1, '2022-12-01', '14:00:00', '2022-12-01', '16:00:00'),
(7, 2, '63.99', 1, '2022-12-01', '04:00:00', '2022-12-01', '06:30:00'),
(8, 2, '178.99', 1, '2023-06-01', '19:00:00', '2023-06-01', '21:00:00'),
(9, 3, '184.99', 1, '2023-06-15', '16:00:00', '2023-06-15', '18:00:00'),
(10, 2, '189.99', 1, '2023-05-06', '11:00:00', '2023-05-01', '13:00:00'),
(13, 2, '199.99', 1, '2023-06-03', '11:00:00', '2023-06-03', '13:00:00'),
(14, 2, '159.99', 1, '2023-06-03', '09:00:00', '2023-06-03', '11:00:00'),
(15, 2, '167.99', 1, '2023-06-03', '16:00:00', '2023-06-03', '18:00:00'),
(16, 2, '122.99', 1, '2023-06-03', '21:00:00', '2023-06-03', '23:00:00'),
(17, 3, '178.99', 1, '2023-06-18', '09:00:00', '2023-06-18', '11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `holiday_duration_days`
--

CREATE TABLE `holiday_duration_days` (
  `HolidayDurationID` int(11) NOT NULL,
  `HolidayDuration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holiday_duration_days`
--

INSERT INTO `holiday_duration_days` (`HolidayDurationID`, `HolidayDuration`) VALUES
(1, 7),
(2, 14),
(3, 18),
(4, 25),
(5, 28);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `ImageID` int(11) NOT NULL,
  `ImageName` text NOT NULL,
  `ImagePath` varchar(255) NOT NULL,
  `ImageDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`ImageID`, `ImageName`, `ImagePath`, `ImageDescription`) VALUES
(1, 'No Image Avaliable', 'No Image Path', ''),
(2, 'Villa Pattiera Front Door', 'https://', 'A shot of the front of Villa Pattiera'),
(3, 'Villa Patteria Twin Room', 'https://', ''),
(4, 'Villa Pattiera Single Room', 'https://', '');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `PassengerID` int(11) NOT NULL,
  `PersonDetailsID` int(11) NOT NULL,
  `IsLeadPassenger` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`PassengerID`, `PersonDetailsID`, `IsLeadPassenger`) VALUES
(81, 100, 0),
(82, 101, 1),
(83, 102, 0),
(84, 103, 0),
(129, 160, 0),
(130, 161, 1),
(131, 162, 0),
(132, 163, 0),
(137, 170, 0),
(138, 171, 1),
(139, 172, 0),
(140, 173, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `PaymentDetailsID` int(11) NOT NULL,
  `CardHolderName` varchar(255) NOT NULL,
  `CardLongNumber` varbinary(255) NOT NULL,
  `CardValidFrom` date NOT NULL,
  `CardValidUntil` date NOT NULL,
  `PaymentProviderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`PaymentDetailsID`, `CardHolderName`, `CardLongNumber`, `CardValidFrom`, `CardValidUntil`, `PaymentProviderID`, `CustomerID`) VALUES
(21, 'MRS ELSA SANDWELL', 0xbda044bf1589fbd6f1a23eaf29d82fa1e8458bd66e710b14dc4dac96b6ad1dd1, '2019-10-08', '2028-10-08', 1, 34);

-- --------------------------------------------------------

--
-- Table structure for table `payment_provider`
--

CREATE TABLE `payment_provider` (
  `PaymentProviderID` int(11) NOT NULL,
  `PaymentProvider` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_provider`
--

INSERT INTO `payment_provider` (`PaymentProviderID`, `PaymentProvider`) VALUES
(1, 'MasterCard'),
(2, 'Visa'),
(3, 'Paypal'),
(4, 'Maestro');

-- --------------------------------------------------------

--
-- Table structure for table `person_details`
--

CREATE TABLE `person_details` (
  `PersonDetailsID` int(11) NOT NULL,
  `PersonTitleID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person_details`
--

INSERT INTO `person_details` (`PersonDetailsID`, `PersonTitleID`, `FirstName`, `LastName`, `DateOfBirth`) VALUES
(100, 1, 'SAMUEL', 'HAYMAN', '1982-04-21'),
(101, 2, 'SUSAN', 'HAYMAN', '1988-05-01'),
(102, 4, 'ELAINE', 'HAYMAN', '1999-01-22'),
(103, 4, 'MARY', 'HAYMAN', '2000-01-02'),
(104, 2, 'EILEEN', 'HAYMAN', '1962-01-09'),
(160, 1, 'JOHN', 'BROWN', '1981-04-21'),
(161, 2, 'HELEN', 'BROWN', '1983-05-01'),
(162, 4, 'JESSICA', 'BROWN', '1999-01-22'),
(163, 4, 'LUCY', 'BROWN', '2000-01-02'),
(164, 2, 'GRACE', 'BROWN', '1961-01-09'),
(170, 1, 'JAMES', 'SANDWELL', '1981-04-21'),
(171, 2, 'SARAH', 'SANDWELL', '1983-05-01'),
(172, 4, 'LAURA', 'SANDWELL', '1999-01-22'),
(173, 4, 'REBECCA', 'SANDWELL', '2000-01-02'),
(174, 2, 'ELSA', 'SANDWELL', '1961-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `person_title`
--

CREATE TABLE `person_title` (
  `PersonTitleID` int(11) NOT NULL,
  `PersonTitle` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person_title`
--

INSERT INTO `person_title` (`PersonTitleID`, `PersonTitle`) VALUES
(1, 'Mr'),
(2, 'Mrs'),
(3, 'Master'),
(4, 'Miss');

-- --------------------------------------------------------

--
-- Table structure for table `price_adjustments`
--

CREATE TABLE `price_adjustments` (
  `PriceAdjustmentsID` int(11) NOT NULL,
  `DayThreshold` int(11) NOT NULL,
  `PercentageIncrease` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_adjustments`
--

INSERT INTO `price_adjustments` (`PriceAdjustmentsID`, `DayThreshold`, `PercentageIncrease`) VALUES
(1, 182, '0.00'),
(2, 91, '20.00'),
(5, 42, '40.00'),
(6, 28, '50.00'),
(7, 14, '60.00'),
(8, 7, '70.00'),
(9, 4, '80.00'),
(10, 2, '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `resort`
--

CREATE TABLE `resort` (
  `ResortID` int(11) NOT NULL,
  `ResortName` varchar(255) NOT NULL,
  `ResortDescription` text NOT NULL,
  `AddressID` int(11) NOT NULL,
  `Jet2Rating` int(11) NOT NULL,
  `TripAdvisorRating` varchar(255) NOT NULL,
  `AreaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resort`
--

INSERT INTO `resort` (`ResortID`, `ResortName`, `ResortDescription`, `AddressID`, `Jet2Rating`, `TripAdvisorRating`, `AreaID`) VALUES
(1, 'Villa Pattiera', '4 star family run boutique hotel', 1, 4, 'https://trip-advisor-rating', 1),
(2, 'Hotel Astarea', 'Boasting traditional decor, tucked between sea and mountains ', 5, 4, 'https://trip-advisor-rating', 1),
(3, 'Titanic Mardan Palace', 'Offering a truly indulgent stay', 6, 5, 'https://trip-advisor-rating', 7);

-- --------------------------------------------------------

--
-- Table structure for table `resort_facility`
--

CREATE TABLE `resort_facility` (
  `ResortFacilityID` int(11) NOT NULL,
  `ResortFacility` varchar(255) NOT NULL,
  `ResortFacilityDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resort_facility`
--

INSERT INTO `resort_facility` (`ResortFacilityID`, `ResortFacility`, `ResortFacilityDescription`) VALUES
(1, 'Central Location', ''),
(2, 'Traditional Charm', ''),
(3, 'Close to beach', '');

-- --------------------------------------------------------

--
-- Table structure for table `resort_image`
--

CREATE TABLE `resort_image` (
  `ResortImageID` int(11) NOT NULL,
  `ResortID` int(11) NOT NULL,
  `ImageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resort_image`
--

INSERT INTO `resort_image` (`ResortImageID`, `ResortID`, `ImageID`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `resort_resort_facilities`
--

CREATE TABLE `resort_resort_facilities` (
  `ResortResortFacilities` int(11) NOT NULL,
  `ResortID` int(11) NOT NULL,
  `ResortFacilitiesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resort_resort_facilities`
--

INSERT INTO `resort_resort_facilities` (`ResortResortFacilities`, `ResortID`, `ResortFacilitiesID`) VALUES
(1, 1, 3),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `resort_room`
--

CREATE TABLE `resort_room` (
  `ResortRoomID` int(11) NOT NULL,
  `HotelRoomName` varchar(255) NOT NULL,
  `RoomTypeID` int(11) NOT NULL,
  `ResortID` int(11) NOT NULL,
  `ResortRoomNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resort_room`
--

INSERT INTO `resort_room` (`ResortRoomID`, `HotelRoomName`, `RoomTypeID`, `ResortID`, `ResortRoomNumber`) VALUES
(1, 'Twin Villa Pattiera', 2, 1, 'One'),
(2, 'Twin Astarea', 2, 2, 'One'),
(3, 'Suite Villa Pattiera', 4, 1, 'One'),
(4, 'Double Villa Pattiera', 3, 1, 'One'),
(5, 'Single Titanic Mardan', 1, 3, 'One'),
(6, 'Single Villa Pattiera', 1, 1, 'One'),
(7, 'Twin Villa Pattiera', 2, 1, 'Two'),
(8, 'Single Villa Pattiera', 1, 1, 'Two'),
(9, 'Twin Villa Pattiera', 2, 1, 'Three'),
(10, 'Twin Villa Pattiera', 2, 1, 'Four'),
(11, 'Twin Villa Pattiera', 2, 1, 'Five'),
(12, 'Twin Villa Pattiera', 2, 1, 'Six'),
(13, 'Twin Villa Pattiera', 2, 1, 'Seven'),
(14, 'Twin Villa Pattiera', 2, 1, 'Eight'),
(15, 'Twin Villa Pattiera', 2, 1, 'Nine'),
(16, 'Twin Villa Pattiera', 2, 1, 'Ten'),
(17, 'Double Villa Pattiera', 3, 1, 'Three'),
(18, 'Double Villa Pattiera', 3, 1, 'Four'),
(19, 'Double Villa Pattiera', 3, 1, 'Five'),
(20, 'Double Villa Pattiera', 3, 1, 'Six'),
(21, 'Double Villa Pattiera', 3, 1, 'Seven'),
(22, 'Double Villa Pattiera', 3, 1, 'Eight'),
(23, 'Double Villa Pattiera', 3, 1, 'Nine'),
(24, 'Double Villa Pattiera', 3, 1, 'Ten'),
(25, 'Single Astarea', 1, 2, 'One'),
(26, 'Single Astarea', 1, 2, 'Two'),
(27, 'Single Astarea', 1, 2, 'Three'),
(28, 'Single Astarea', 1, 2, 'Four'),
(29, 'Suite Astarea', 4, 2, 'One'),
(30, 'Suite Astarea', 4, 2, 'Two');

-- --------------------------------------------------------

--
-- Table structure for table `resort_room_board_type`
--

CREATE TABLE `resort_room_board_type` (
  `ResortRoomBoardTypeID` int(11) NOT NULL,
  `ResortRoomID` int(11) NOT NULL,
  `BoardTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resort_room_board_type`
--

INSERT INTO `resort_room_board_type` (`ResortRoomBoardTypeID`, `ResortRoomID`, `BoardTypeID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 4, 1),
(4, 2, 1),
(5, 6, 2),
(6, 24, 3),
(7, 21, 3);

-- --------------------------------------------------------

--
-- Table structure for table `room_amenities`
--

CREATE TABLE `room_amenities` (
  `RoomAmenitiesID` int(11) NOT NULL,
  `AmenityType` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_amenities`
--

INSERT INTO `room_amenities` (`RoomAmenitiesID`, `AmenityType`) VALUES
(1, 'Wi-Fi'),
(2, 'Kettle'),
(3, 'Television'),
(4, 'Balcony');

-- --------------------------------------------------------

--
-- Table structure for table `room_price`
--

CREATE TABLE `room_price` (
  `RoomPriceID` int(11) NOT NULL,
  `PricePerNight` decimal(10,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `ValidFrom` date NOT NULL,
  `ValidUntil` date NOT NULL,
  `ResortRoomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_price`
--

INSERT INTO `room_price` (`RoomPriceID`, `PricePerNight`, `CurrencyID`, `ValidFrom`, `ValidUntil`, `ResortRoomID`) VALUES
(15, '249.99', 1, '2023-05-24', '2023-06-04', 4),
(16, '289.99', 1, '2023-06-04', '2023-06-14', 4),
(17, '279.99', 1, '2023-05-26', '2023-06-05', 1),
(18, '299.99', 1, '2023-06-05', '2023-06-22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `RoomTypeID` int(11) NOT NULL,
  `RoomTypeName` varchar(255) NOT NULL,
  `MaxSleep` int(11) NOT NULL,
  `RoomTypeDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`RoomTypeID`, `RoomTypeName`, `MaxSleep`, `RoomTypeDescription`) VALUES
(1, 'Single', 2, 'Small room with double bed'),
(2, 'Twin', 2, 'Small room with two single beds'),
(3, 'Double', 4, 'Room with two double beds'),
(4, 'Suite', 2, 'Room suited for longer stays');

-- --------------------------------------------------------

--
-- Table structure for table `room_type_image`
--

CREATE TABLE `room_type_image` (
  `ResortRoomImageID` int(11) NOT NULL,
  `RoomTypeID` int(11) NOT NULL,
  `ImageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_type_image`
--

INSERT INTO `room_type_image` (`ResortRoomImageID`, `RoomTypeID`, `ImageID`) VALUES
(1, 2, 3),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `room_type_room_amenities`
--

CREATE TABLE `room_type_room_amenities` (
  `RoomTypeRoomAmenitiesID` int(11) NOT NULL,
  `RoomTypeID` int(11) NOT NULL,
  `RoomAmentiesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_type_room_amenities`
--

INSERT INTO `room_type_room_amenities` (`RoomTypeRoomAmenitiesID`, `RoomTypeID`, `RoomAmentiesID`) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `star_rating_system`
--

CREATE TABLE `star_rating_system` (
  `StarRatingSystemID` int(11) NOT NULL,
  `StarRating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `star_rating_system`
--

INSERT INTO `star_rating_system` (`StarRatingSystemID`, `StarRating`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `UserAccountID` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `UserPassword` varbinary(255) NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`UserAccountID`, `UserName`, `UserPassword`, `CustomerID`) VALUES
(1, 'userNameTest', 0x32306464616332646461636631303937306137616366313638353665363439376235613736666631383230363731, 34);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_address_CountryID` (`CountryID`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`AirportID`),
  ADD KEY `FK_airport_AddressID` (`AddressID`),
  ADD KEY `FK_airport_AreaID` (`AreaID`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`AreaID`),
  ADD KEY `FK_area_CountryID` (`CountryID`);

--
-- Indexes for table `board_type`
--
ALTER TABLE `board_type`
  ADD PRIMARY KEY (`BoardTypeID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `FK_booking_HolidayDurationDaysID` (`HolidayDurationDays`),
  ADD KEY `FK_booking_CurrencyID` (`CurrencyID`);

--
-- Indexes for table `booking_flight`
--
ALTER TABLE `booking_flight`
  ADD PRIMARY KEY (`BookingFlightID`),
  ADD KEY `FK_flight_booking_BookingID` (`BookingID`),
  ADD KEY `FK_booking_flight_FlightID` (`FlightID`);

--
-- Indexes for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD PRIMARY KEY (`BookingLineItemID`),
  ADD KEY `FK_booking_line_item_BookingID` (`BookingID`),
  ADD KEY `FK_booking_line_item_CurrencyID` (`CurrencyID`);

--
-- Indexes for table `booking_passenger`
--
ALTER TABLE `booking_passenger`
  ADD PRIMARY KEY (`PassengerBookingID`),
  ADD KEY `FK_passenger_booking_BookingID` (`BookingID`),
  ADD KEY `FK_booking_passenger_PassengerID` (`PassengerID`);

--
-- Indexes for table `booking_resort_room`
--
ALTER TABLE `booking_resort_room`
  ADD PRIMARY KEY (`BookingResortRoomID`),
  ADD KEY `FK_booking_resort_room_ResortRoomID` (`ResortRoomID`),
  ADD KEY `FK_booking_resort_room_BookingID` (`BookingID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryID`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`CurrencyID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `FK_customer_AddressID` (`AddressID`),
  ADD KEY `FK_customer_PersonDetailsID` (`PersonDetailsID`);

--
-- Indexes for table `customer_booking`
--
ALTER TABLE `customer_booking`
  ADD PRIMARY KEY (`CustomerBookingID`),
  ADD KEY `FK_customer_booking_CustomerID` (`CustomerID`),
  ADD KEY `FK_customer_booking_BookingID` (`BookingID`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `FK_flight_ArriveAirportID` (`FlightArriveAirportID`),
  ADD KEY `FK_flight_DepartAirportID` (`FlightDepartAirportID`);

--
-- Indexes for table `flight_price`
--
ALTER TABLE `flight_price`
  ADD PRIMARY KEY (`FlightPriceID`),
  ADD KEY `FK_flight_price_FlightID` (`FlightID`),
  ADD KEY `FK_flight_price_CurrencyID` (`CurrencyID`);

--
-- Indexes for table `holiday_duration_days`
--
ALTER TABLE `holiday_duration_days`
  ADD PRIMARY KEY (`HolidayDurationID`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ImageID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PassengerID`),
  ADD KEY `FK_passenger_PersonDetailsID` (`PersonDetailsID`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`PaymentDetailsID`),
  ADD KEY `FK_payment_details_PaymentProviderID` (`PaymentProviderID`),
  ADD KEY `FK_payment_details_CustomerID` (`CustomerID`);

--
-- Indexes for table `payment_provider`
--
ALTER TABLE `payment_provider`
  ADD PRIMARY KEY (`PaymentProviderID`);

--
-- Indexes for table `person_details`
--
ALTER TABLE `person_details`
  ADD PRIMARY KEY (`PersonDetailsID`),
  ADD KEY `FK_person_details_PersonTitleID` (`PersonTitleID`);

--
-- Indexes for table `person_title`
--
ALTER TABLE `person_title`
  ADD PRIMARY KEY (`PersonTitleID`);

--
-- Indexes for table `price_adjustments`
--
ALTER TABLE `price_adjustments`
  ADD PRIMARY KEY (`PriceAdjustmentsID`);

--
-- Indexes for table `resort`
--
ALTER TABLE `resort`
  ADD PRIMARY KEY (`ResortID`),
  ADD KEY `FK_resort_AddressID` (`AddressID`),
  ADD KEY `FK_resort_StarRatingSystemID` (`Jet2Rating`),
  ADD KEY `FK_resort_AreaID` (`AreaID`);

--
-- Indexes for table `resort_facility`
--
ALTER TABLE `resort_facility`
  ADD PRIMARY KEY (`ResortFacilityID`);

--
-- Indexes for table `resort_image`
--
ALTER TABLE `resort_image`
  ADD PRIMARY KEY (`ResortImageID`),
  ADD KEY `FK_resort_image_ResortID` (`ResortID`),
  ADD KEY `FK_resort_image_ImageID` (`ImageID`);

--
-- Indexes for table `resort_resort_facilities`
--
ALTER TABLE `resort_resort_facilities`
  ADD PRIMARY KEY (`ResortResortFacilities`),
  ADD KEY `FK_resort_resort_facilities_ResortID` (`ResortID`),
  ADD KEY `FK_resort_resort_facilities_ResortFacilityID` (`ResortFacilitiesID`);

--
-- Indexes for table `resort_room`
--
ALTER TABLE `resort_room`
  ADD PRIMARY KEY (`ResortRoomID`),
  ADD KEY `FK_resort_room_ResortID` (`ResortID`),
  ADD KEY `FK_resort_room_RoomTypeID` (`RoomTypeID`);

--
-- Indexes for table `resort_room_board_type`
--
ALTER TABLE `resort_room_board_type`
  ADD PRIMARY KEY (`ResortRoomBoardTypeID`),
  ADD KEY `FK_resort_room_board_type_ResortRoomID` (`ResortRoomID`),
  ADD KEY `FK_resort_room_board_type_BoardTypeID` (`BoardTypeID`);

--
-- Indexes for table `room_amenities`
--
ALTER TABLE `room_amenities`
  ADD PRIMARY KEY (`RoomAmenitiesID`);

--
-- Indexes for table `room_price`
--
ALTER TABLE `room_price`
  ADD PRIMARY KEY (`RoomPriceID`),
  ADD KEY `FK_room_price_ResortRoomID` (`ResortRoomID`),
  ADD KEY `FK_room_price_CurrencyID` (`CurrencyID`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`RoomTypeID`);

--
-- Indexes for table `room_type_image`
--
ALTER TABLE `room_type_image`
  ADD PRIMARY KEY (`ResortRoomImageID`),
  ADD KEY `FK_room_type_image_ImageID` (`ImageID`),
  ADD KEY `FK_room__type_image_RoomTypeID` (`RoomTypeID`);

--
-- Indexes for table `room_type_room_amenities`
--
ALTER TABLE `room_type_room_amenities`
  ADD PRIMARY KEY (`RoomTypeRoomAmenitiesID`),
  ADD KEY `FK_resort_room_room_amenities_RoomAmenitiesID` (`RoomAmentiesID`),
  ADD KEY `FK_resort_room_room_amenities_RoomTypeID` (`RoomTypeID`);

--
-- Indexes for table `star_rating_system`
--
ALTER TABLE `star_rating_system`
  ADD PRIMARY KEY (`StarRatingSystemID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`UserAccountID`),
  ADD KEY `FK_user_account_CustomerID` (`CustomerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `AirportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `AreaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `board_type`
--
ALTER TABLE `board_type`
  MODIFY `BoardTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `booking_flight`
--
ALTER TABLE `booking_flight`
  MODIFY `BookingFlightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  MODIFY `BookingLineItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `booking_passenger`
--
ALTER TABLE `booking_passenger`
  MODIFY `PassengerBookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

--
-- AUTO_INCREMENT for table `booking_resort_room`
--
ALTER TABLE `booking_resort_room`
  MODIFY `BookingResortRoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `customer_booking`
--
ALTER TABLE `customer_booking`
  MODIFY `CustomerBookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flight_price`
--
ALTER TABLE `flight_price`
  MODIFY `FlightPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `holiday_duration_days`
--
ALTER TABLE `holiday_duration_days`
  MODIFY `HolidayDurationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `ImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `PassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `PaymentDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payment_provider`
--
ALTER TABLE `payment_provider`
  MODIFY `PaymentProviderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `person_details`
--
ALTER TABLE `person_details`
  MODIFY `PersonDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `person_title`
--
ALTER TABLE `person_title`
  MODIFY `PersonTitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `price_adjustments`
--
ALTER TABLE `price_adjustments`
  MODIFY `PriceAdjustmentsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `resort`
--
ALTER TABLE `resort`
  MODIFY `ResortID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resort_facility`
--
ALTER TABLE `resort_facility`
  MODIFY `ResortFacilityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resort_image`
--
ALTER TABLE `resort_image`
  MODIFY `ResortImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resort_resort_facilities`
--
ALTER TABLE `resort_resort_facilities`
  MODIFY `ResortResortFacilities` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resort_room`
--
ALTER TABLE `resort_room`
  MODIFY `ResortRoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `resort_room_board_type`
--
ALTER TABLE `resort_room_board_type`
  MODIFY `ResortRoomBoardTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room_amenities`
--
ALTER TABLE `room_amenities`
  MODIFY `RoomAmenitiesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_price`
--
ALTER TABLE `room_price`
  MODIFY `RoomPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `RoomTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_type_image`
--
ALTER TABLE `room_type_image`
  MODIFY `ResortRoomImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_type_room_amenities`
--
ALTER TABLE `room_type_room_amenities`
  MODIFY `RoomTypeRoomAmenitiesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `star_rating_system`
--
ALTER TABLE `star_rating_system`
  MODIFY `StarRatingSystemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `UserAccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_address_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`);

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `FK_airport_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_airport_AreaID` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`);

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `FK_area_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_booking_CurrencyID` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_booking_HolidayDurationDaysID` FOREIGN KEY (`HolidayDurationDays`) REFERENCES `holiday_duration_days` (`HolidayDurationID`);

--
-- Constraints for table `booking_flight`
--
ALTER TABLE `booking_flight`
  ADD CONSTRAINT `FK_booking_flight_FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`),
  ADD CONSTRAINT `FK_flight_booking_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`);

--
-- Constraints for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD CONSTRAINT `FK_booking_line_item_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `FK_booking_line_item_CurrencyID` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`);

--
-- Constraints for table `booking_passenger`
--
ALTER TABLE `booking_passenger`
  ADD CONSTRAINT `FK_booking_passenger_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  ADD CONSTRAINT `FK_passenger_booking_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`);

--
-- Constraints for table `booking_resort_room`
--
ALTER TABLE `booking_resort_room`
  ADD CONSTRAINT `FK_booking_resort_room_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `FK_booking_resort_room_ResortRoomID` FOREIGN KEY (`ResortRoomID`) REFERENCES `resort_room` (`ResortRoomID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_customer_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_customer_PersonDetailsID` FOREIGN KEY (`PersonDetailsID`) REFERENCES `person_details` (`PersonDetailsID`);

--
-- Constraints for table `customer_booking`
--
ALTER TABLE `customer_booking`
  ADD CONSTRAINT `FK_customer_booking_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `FK_customer_booking_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FK_flight_ArriveAirportID` FOREIGN KEY (`FlightArriveAirportID`) REFERENCES `airport` (`AirportID`),
  ADD CONSTRAINT `FK_flight_DepartAirportID` FOREIGN KEY (`FlightDepartAirportID`) REFERENCES `airport` (`AirportID`);

--
-- Constraints for table `flight_price`
--
ALTER TABLE `flight_price`
  ADD CONSTRAINT `FK_flight_price_CurrencyID` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_flight_price_FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`);

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `FK_passenger_PersonDetailsID` FOREIGN KEY (`PersonDetailsID`) REFERENCES `person_details` (`PersonDetailsID`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `FK_payment_details_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `FK_payment_details_PaymentProviderID` FOREIGN KEY (`PaymentProviderID`) REFERENCES `payment_provider` (`PaymentProviderID`);

--
-- Constraints for table `person_details`
--
ALTER TABLE `person_details`
  ADD CONSTRAINT `FK_person_details_PersonTitleID` FOREIGN KEY (`PersonTitleID`) REFERENCES `person_title` (`PersonTitleID`);

--
-- Constraints for table `resort`
--
ALTER TABLE `resort`
  ADD CONSTRAINT `FK_resort_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_resort_AreaID` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`),
  ADD CONSTRAINT `FK_resort_StarRatingSystemID` FOREIGN KEY (`Jet2Rating`) REFERENCES `star_rating_system` (`StarRatingSystemID`);

--
-- Constraints for table `resort_image`
--
ALTER TABLE `resort_image`
  ADD CONSTRAINT `FK_resort_image_ImageID` FOREIGN KEY (`ImageID`) REFERENCES `image` (`ImageID`),
  ADD CONSTRAINT `FK_resort_image_ResortID` FOREIGN KEY (`ResortID`) REFERENCES `resort` (`ResortID`);

--
-- Constraints for table `resort_resort_facilities`
--
ALTER TABLE `resort_resort_facilities`
  ADD CONSTRAINT `FK_resort_resort_facilities_ResortFacilityID` FOREIGN KEY (`ResortFacilitiesID`) REFERENCES `resort_facility` (`ResortFacilityID`),
  ADD CONSTRAINT `FK_resort_resort_facilities_ResortID` FOREIGN KEY (`ResortID`) REFERENCES `resort` (`ResortID`);

--
-- Constraints for table `resort_room`
--
ALTER TABLE `resort_room`
  ADD CONSTRAINT `FK_resort_room_ResortID` FOREIGN KEY (`ResortID`) REFERENCES `resort` (`ResortID`),
  ADD CONSTRAINT `FK_resort_room_RoomTypeID` FOREIGN KEY (`RoomTypeID`) REFERENCES `room_type` (`RoomTypeID`);

--
-- Constraints for table `resort_room_board_type`
--
ALTER TABLE `resort_room_board_type`
  ADD CONSTRAINT `FK_resort_room_board_type_BoardTypeID` FOREIGN KEY (`BoardTypeID`) REFERENCES `board_type` (`BoardTypeID`),
  ADD CONSTRAINT `FK_resort_room_board_type_ResortRoomID` FOREIGN KEY (`ResortRoomID`) REFERENCES `resort_room` (`ResortRoomID`);

--
-- Constraints for table `room_price`
--
ALTER TABLE `room_price`
  ADD CONSTRAINT `FK_room_price_CurrencyID` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_room_price_ResortRoomID` FOREIGN KEY (`ResortRoomID`) REFERENCES `resort_room` (`ResortRoomID`);

--
-- Constraints for table `room_type_image`
--
ALTER TABLE `room_type_image`
  ADD CONSTRAINT `FK_room__type_image_RoomTypeID` FOREIGN KEY (`RoomTypeID`) REFERENCES `room_type` (`RoomTypeID`),
  ADD CONSTRAINT `FK_room_type_image_ImageID` FOREIGN KEY (`ImageID`) REFERENCES `image` (`ImageID`);

--
-- Constraints for table `room_type_room_amenities`
--
ALTER TABLE `room_type_room_amenities`
  ADD CONSTRAINT `FK_resort_room_room_amenities_RoomAmenitiesID` FOREIGN KEY (`RoomAmentiesID`) REFERENCES `room_amenities` (`RoomAmenitiesID`),
  ADD CONSTRAINT `FK_resort_room_room_amenities_RoomTypeID` FOREIGN KEY (`RoomTypeID`) REFERENCES `room_type` (`RoomTypeID`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `FK_user_account_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
