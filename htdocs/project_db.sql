-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 06:02 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(5) NOT NULL,
  `inventory_space` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Seller_id` int(11) NOT NULL,
  `order_total` int(11) NOT NULL,
  `order_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(5) NOT NULL,
  `Seller_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_manufacture` varchar(50) NOT NULL,
  `product_price` int(5) NOT NULL,
  `product_image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `Seller_id`, `product_name`, `product_manufacture`, `product_price`, `product_image`) VALUES
(1, 3, 'Mouse', 'Logitech', 100, ''),
(2, 3, 'RTX 3090', 'Nvidia', 4000, ''),
(3, 3, 'RTX 4090', 'Nvidia', 5000, ''),
(4, 1, 'Mouse', 'Razer', 80, ''),
(5, 3, 'Chair', 'SecretLab', 450, ''),
(6, 1, 'Headset', 'Turtle Beach', 180, ''),
(7, 1, 'KeyBoard', 'Logitech', 100, '');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `Seller_id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password_hash` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`Seller_id`, `fname`, `lname`, `username`, `password_hash`) VALUES
(1, 'Sel', 'S', 'Seller', '$2y$10$1GERrFYVIgPEZGG0dUTREenJqUI54yIHSI.Pg0q71cm/1JmWWD5l.'),
(2, 'AS', 'SA', 'ASS912', '$2y$10$jSQUCDeELu2MzaWx2fe0feGfLs2Lj3uqit.oJ5vkF3v1XlHSeTJM2'),
(3, 'Dam', 'Visa', 'Dami', '$2y$10$S3PT2ei.WOLT9bU3OeVTcuUWt23UFfIBwHI.I9gbF5OEHmGjfhG2a');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password_hash` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fname`, `lname`, `username`, `address`, `password_hash`) VALUES
(10, 'Test', 'T', 'Tester', '', '$2y$10$HzYM7ENugBnw0triFUD/2.hdTfrALOAIXG.XyPcNJoico5OqpsQ6.'),
(11, 'Damiano', 'Visalli', 'Dam', '', '$2y$10$3BXWullbiZIu2nShacPAzOYJdBOitREQd2MWZP8Sw11SPAaCq6yDq'),
(12, 'Bob', 'Bob', 'Bobby', '', '$2y$10$TOvN1dBSWkFHfu3Fm96jy.AKGyYNL8i44l9R1JXpYKslvWJ4QJNve');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_FK` (`product_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id_FK` (`user_id`),
  ADD KEY `sellerOnOrder_id_FK` (`Seller_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_id_fk` (`Seller_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`Seller_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `Seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `product_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `sellerOnOrder_id_FK` FOREIGN KEY (`Seller_id`) REFERENCES `seller` (`Seller_id`),
  ADD CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `seller_id_fk` FOREIGN KEY (`Seller_id`) REFERENCES `seller` (`Seller_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
