-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 14, 2023 at 07:10 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21136979_shopping_db`
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
(1, 1, 2, 'Nice Product ', 'Nice Product', 3.5, 'demo-image.jpg', '2023-08-12 17:57:04', NULL, NULL),
(2, 1, 2, 'Nice Product ', 'Nice Product', 3.5, 'demo-image.jpg', '2023-08-12 17:57:24', NULL, NULL),
(3, 1, 2, 'Nice Product ', 'Nice Product', 3.5, 'demo-image.jpg', '2023-08-13 12:32:45', NULL, NULL),
(4, 1, 2, 'Nice Product ', 'Nice Product', 3.5, 'demo-image.jpg', '2023-08-13 12:34:18', NULL, NULL),
(5, 2, 16, 'ssf', 'dsfsdf', 3, '', '2023-08-14 18:11:04', NULL, NULL),
(6, 2, 16, 'abc', 'trg', 4, '1692036940-bg.jpg', '2023-08-14 18:15:40', NULL, NULL),
(7, 1, 2, 'Nice Product ', 'Nice Product', 3.5, '1692037118-bg.jpg', '2023-08-14 18:18:38', NULL, NULL),
(8, 2, 16, 'dfd', 'dsfsdf', 4, '1692039926-bg.jpg', '2023-08-14 19:05:26', NULL, NULL);

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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `price`, `created`, `updated`, `deleted`) VALUES
(1, 1, 1, 480, 150, '2023-08-13 17:01:39', NULL, NULL),
(2, 16, 2, 1, 399, '2023-08-14 16:11:17', NULL, NULL),
(3, 16, 2, 1, 399, '2023-08-14 16:12:06', NULL, NULL),
(4, 16, 1, 1, 400, '2023-08-14 16:12:08', NULL, NULL),
(5, 16, 2, 1, 399, '2023-08-14 16:19:21', NULL, NULL),
(6, 16, 1, 1, 400, '2023-08-14 16:19:22', NULL, NULL),
(7, 16, 2, 1, 399, '2023-08-14 16:20:33', NULL, NULL),
(8, 16, 1, 1, 400, '2023-08-14 16:20:34', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `rating` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `rating`, `quantity`, `created`, `updated`, `deleted`) VALUES
(1, 'Table', 'Best table', 'demo-image.jpg', 400, 3.9, 37, '2023-08-11 01:40:13', '2023-08-14 16:20:34', NULL),
(2, 'Chair', 'Best chair', 'demo-image.jpg', 399, 3.9, 496, '2023-08-10 22:17:57', '2023-08-14 16:20:33', NULL),
(3, '1', '2', 'demo-image.jpg', 0, 3.9, 4, '0000-00-00 00:00:00', NULL, NULL),
(4, '1', '2', 'demo-image.jpg', 0, 3.9, 4, '0000-00-00 00:00:00', NULL, NULL),
(5, '1', '2', 'demo-image.jpg', 0, 3.9, 4, '0000-00-00 00:00:00', NULL, NULL),
(6, 'Hello', 'Nice', 'demo-image.jpg', 1000, 3.5, 10000, '0000-00-00 00:00:00', NULL, NULL),
(7, 'Hello', 'Nice', 'demo-image.jpg', 1000, 3.5, 10000, '2023-08-13 19:57:02', NULL, NULL);

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
(16, 'Piyush Admin11', 'piyush@mailer.com1', '$2y$10$u/LFphFNtr/6oClXvQ4a8.s.LJXKJCrjNyv4FO3GpA0NBSfHw7OkS', '9876543210', '123, Udaipur', '2023-08-13 02:25:22', '2023-08-14 19:06:37', NULL),
(18, 'Piyush Admin', 'piyush444@mailer.com1', '$2y$10$eE8acluW2jIn/xbbJSOH5.afHr1jLOM360/tZhIfAy9gu5/Z7umB.', '9876543210', '123, Udaipur', '2023-08-13 17:25:55', NULL, NULL),
(19, 'abc', 'user1@gmail.com', '$2y$10$7WilWbRP4ScDEP.C4.5fp.QQyNIxQrcEOdKKZdneLe1u/aGQG/5/G', '1233243', 'fdfsdgg', '2023-08-13 18:07:25', NULL, NULL),
(20, 'abc', 'abc@gmail.com', '$2y$10$kWno1CpYYSHCgM.WFwtgE.WYE2aebXBngLIz070K4jGhMhn3ab9qK', '1233243', 'fdfsdgg', '2023-08-13 18:21:40', NULL, NULL),
(22, 'abc', 'chandni@sodainmind.com', '$2y$10$OH9YvogewetBuCcZ22OKw.L3SyDNAtzt01ofjl1tEPl6mSVOtQt42', '1233243', 'fdfsdgg', '2023-08-14 15:33:23', NULL, NULL),
(25, 'abc111', '123@gmail.com', '$2y$10$Kg4TMVXZ9CNxR1yivhshbuF3BEs.6vL2ZrNgVmJGR.ZOiqecRjjBG', '1233243', 'fdfsdgg', '2023-08-14 15:38:52', NULL, NULL),
(26, 'abc1111', '1231@gmail.com', '$2y$10$MHmG/n9T27WxKUVkeRGc5u0G6pxsph/2I0qvWiVDlHDW/Lu/m6buK', '1233243', 'fdfsdgg', '2023-08-14 15:39:39', NULL, NULL),
(27, 'abcasd', 'asdsda@gmail.com', '$2y$10$.7zQt/cNCVjL1XZ2Tj4Sw.WAoT.xUAmQG/bkdETCyVXsvs6r8QnuK', '11111', 'fdfsdgg', '2023-08-14 15:40:54', NULL, NULL),
(28, 'Piyush Admin', 'piyush@mailer.com2', '$2y$10$wX7LLQl/X/b9AxeQqLMNGufQBiRZ0ug3QgQoL2w3VZ0PV0CKchyZS', '9876543210', '123, Udaipur', '2023-08-14 16:58:06', '2023-08-14 16:58:56', NULL),
(29, 'dhara', 'dhara@yopmail.com', '$2y$10$qVkVL1AJgoIi2tcrb3Zw6.3k8l2/QmQYmciZ/guUvnc8VCKZ5kgAi', 'q232', 'fdfsdgg', '2023-08-14 18:27:57', NULL, NULL),
(30, 'dhara', 'dhara@gmail.com', '$2y$10$eMmK8DMx8O0g5G3XOfcB..VmF0lH4V6klgEZLvn6qtd67lEDWF9zm', '123', 'fdfsdgg', '2023-08-14 18:30:06', NULL, NULL),
(31, 'abc', 'dsfsd', '$2y$10$94dnbIfHGkTdhvf1bSZFOe0B.42sb/.IKpqKi0Szqdix8JSH9Fe5G', '13323', 'fdfsdgg', '2023-08-14 18:34:10', NULL, NULL);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
