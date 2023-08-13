-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2023 at 10:34 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `rating` float NOT NULL,
  `imagelink` varchar(100) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `title`, `description`, `rating`, `imagelink`, `created`, `updated`, `deleted`) VALUES
(1, 1, 2, 'Nice Product ', 'Nice Product', 3.5, '1691843224-photo-1587053522141-7baa3a8ce67a.jpg', '2023-08-12 17:57:04', NULL, NULL),
(2, 1, 2, 'Nice Product ', 'Nice Product', 3.5, '1691843244-photo-1587053522141-7baa3a8ce67a.jpg', '2023-08-12 17:57:24', NULL, NULL),
(3, 1, 2, 'Nice Product ', 'Nice Product', 3.5, '', '2023-08-13 12:32:45', NULL, NULL),
(4, 1, 2, 'Nice Product ', 'Nice Product', 3.5, '1691910258-', '2023-08-13 12:34:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `link` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `link`, `price`, `quantity`, `created`, `updated`, `deleted`) VALUES
(1, 'Table', 'Best table', '123', 400, 520, '2023-08-11 01:40:13', '2023-08-13 13:58:43', NULL),
(2, 'Chair', 'Best chair', '123', 399, 500, '2023-08-10 22:17:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`, `updated`, `deleted`) VALUES
(1, 'mail 11', 'mail2@123.com1', '$2y$10$lU8l72EjLgVG8OdVQ21sHuFwDHrHHUT21AIRCLbO9vw', '9876543210', 'qwe qwe qwe', '2023-08-11 01:51:16', NULL, NULL),
(2, 'mail 11', 'mail2@123.comas', '$2y$10$4TYOKv0i5M9Hi1piqqOwxerHMmxYnFoA4rwlnAksdou', '9876543210', 'qwe qwe qwe', '2023-08-11 02:06:55', NULL, NULL),
(3, 'mail', 'mail@123.com', '$2y$10$mJyrOH6xRiiktftfhMx2y.QP7ClCGibBc1tIHe.rnW2', '9782970701', '123, Udaipur, Rajasthan 313001', '2023-08-11 02:09:39', NULL, NULL),
(4, 'mail', 'mail1@123.com', '$2y$10$yFMHnuL8mNooL7p9KAqhXe.Oq/vhsswXPf38el3eDVE', '123456', '123, asd iopasd', '2023-08-11 02:13:06', NULL, NULL),
(5, 'q', 'sdada1', '$2y$10$w45f97NqCuDhzqo.38JQ4uO4eSASpRcu5OSdj1k5hQg', '9876543210', 'asdasd', '2023-08-11 02:16:45', '2023-08-13 01:48:49', NULL),
(7, 'mail 11', 'mail2@123.coman', '$2y$10$x9LRgbaNhvHWxF5mzeR4buvFr1ebCJHt8GqZ08m7bZD', '9876543210', 'qwe qwe qwe', '2023-08-13 01:44:15', NULL, NULL),
(9, 'mail 11', 'mail2@123.coman1', '$2y$10$Bk4upTxcwqxpJ6X93La6d.aC16USuHmEpF/GYdzGF.F', '9876543210', 'qwe qwe qwe', '2023-08-13 01:44:38', NULL, NULL),
(10, 'mail 11', 'mail2@123.coman2', '$2y$10$f8/n4Na7ugIkPky5IsPCTe0E3ImQca/qnGYE7CED6GI', '9876543210', 'qwe qwe qwe', '2023-08-13 01:44:55', NULL, NULL),
(12, 'mail 11', 'mail2@123.com2', '$2y$10$SDRteKDkuVV24S6vO9YI/uRRFJccyVjSAarF.FdJdZA', '9876543210', 'qwe qwe qwe', '2023-08-13 01:45:18', NULL, NULL),
(14, 'q', 'sdada', '$2y$10$1N5fOSz7MEYCo9iE4g.YFek/pCAOPGH8AFLeJd3HwuQ', '9876543210', 'asdasd', '2023-08-13 01:47:09', NULL, NULL),
(15, 'Piyush Admin', 'piyush@mailer.com', '$2y$10$BiQ3j78.1CMqq/1yCPjaIObIdY53KS8OrA0Y86uWwGw', '9876543210', '123, Udaipur', '2023-08-13 02:13:09', NULL, NULL),
(16, 'Piyush Admin', 'piyush@mailer.com1', '$2y$10$S2eVG5/w3gPsgawDqQBvZemmGpe8lcAfHbrfQ2XvrFL84M8PtAUxy', '9876543210', '123, Udaipur', '2023-08-13 02:25:22', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users` (`user_id`),
  ADD KEY `product` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
