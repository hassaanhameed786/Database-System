-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 06, 2021 at 12:09 AM
-- Server version: 5.7.35-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Electricity_Consumption`
--

-- --------------------------------------------------------

--
-- Table structure for table `Average_spot_prices`
--

CREATE TABLE `Average_spot_prices` (
  `id` decimal(10,0) NOT NULL,
  `year` date NOT NULL,
  `region` tinytext NOT NULL,
  `price` decimal(30,0) NOT NULL,
  `quarter` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Change_Genration_capacity`
--

CREATE TABLE `Change_Genration_capacity` (
  `id` decimal(10,0) NOT NULL,
  `year` date NOT NULL,
  `region` tinytext NOT NULL,
  `percent_change` decimal(20,0) NOT NULL,
  `quarter` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Electicity_consumption`
--

CREATE TABLE `Electicity_consumption` (
  `id` decimal(10,0) NOT NULL,
  `year` date NOT NULL,
  `month` tinytext NOT NULL,
  `state` tinytext NOT NULL,
  `consumption` decimal(10,0) NOT NULL,
  `quarter` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Generation_Capacity`
--

CREATE TABLE `Generation_Capacity` (
  `id` decimal(10,0) NOT NULL,
  `year` date NOT NULL,
  `NEM_Capacity` decimal(30,0) NOT NULL,
  `NEM_Demand` decimal(10,0) NOT NULL,
  `NEM_Forecast_Demand` decimal(10,0) NOT NULL,
  `Quarter` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Seasonal_Demand`
--

CREATE TABLE `Seasonal_Demand` (
  `id` decimal(10,0) NOT NULL,
  `year` date NOT NULL,
  `period` tinytext NOT NULL,
  `state` tinytext NOT NULL,
  `consumption` decimal(10,0) NOT NULL,
  `qaurter` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Solar_Generation_Capacity`
--

CREATE TABLE `Solar_Generation_Capacity` (
  `id` decimal(10,0) NOT NULL,
  `year` date NOT NULL,
  `region` tinytext NOT NULL,
  `wind` decimal(30,0) NOT NULL,
  `grid_scale_solar` decimal(10,0) NOT NULL,
  `quarter` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Average_spot_prices`
--
ALTER TABLE `Average_spot_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Change_Genration_capacity`
--
ALTER TABLE `Change_Genration_capacity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Electicity_consumption`
--
ALTER TABLE `Electicity_consumption`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Generation_Capacity`
--
ALTER TABLE `Generation_Capacity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Seasonal_Demand`
--
ALTER TABLE `Seasonal_Demand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Solar_Generation_Capacity`
--
ALTER TABLE `Solar_Generation_Capacity`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
