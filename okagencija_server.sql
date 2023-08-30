-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2023 at 02:05 PM
-- Server version: 10.5.21-MariaDB-log
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `okagencija_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `Deposits`
--

CREATE TABLE `Deposits` (
  `id` int(11) NOT NULL,
  `deposit_name` varchar(255) NOT NULL,
  `deposit_amount` float NOT NULL,
  `deposit_date` datetime NOT NULL,
  `deposit_money_transfer_type` varchar(255) NOT NULL,
  `deposit_money_currencie` varchar(255) NOT NULL,
  `deposit_status` tinyint(1) NOT NULL DEFAULT 0,
  `deposit_client_wallet` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Deposits`
--

INSERT INTO `Deposits` (`id`, `deposit_name`, `deposit_amount`, `deposit_date`, `deposit_money_transfer_type`, `deposit_money_currencie`, `deposit_status`, `deposit_client_wallet`, `createdAt`, `updatedAt`, `userId`, `client_id`) VALUES
(1, 'Conservative', 1, '2023-06-19 13:22:53', '$', 'bank transfer', 0, '213421341234', '2023-06-19 13:22:53', '2023-06-19 13:22:53', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deposit_packages`
--

CREATE TABLE `deposit_packages` (
  `id` int(11) NOT NULL,
  `deposit_name` varchar(255) NOT NULL,
  `deposit_value` float NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deposit_packages`
--

INSERT INTO `deposit_packages` (`id`, `deposit_name`, `deposit_value`, `createdAt`, `updatedAt`) VALUES
(2, 'aggressive', 20000, '2023-05-24 04:49:54', '2023-05-24 04:49:54'),
(3, 'Conservative', 1000, '2023-05-24 04:50:43', '2023-05-24 04:50:43'),
(4, 'Moderate', 10000, '2023-05-24 04:50:53', '2023-05-24 04:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `News`
--

CREATE TABLE `News` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `News`
--

INSERT INTO `News` (`id`, `title`, `content`, `image`, `createdAt`, `updatedAt`) VALUES
(2, 'Nova blagovna znamka - Future Insight', 'Z majem 2023 smo ustanovili novo blagovno znamko,  s katero se bomo predstavljali na Adriatic regiji. Future Insight, ki je sestavljen iz 3 partnerjev. Mark Kalin, Žiga Papež ter Klemen Ogorevc. ', '/public/reports/1687175862577-future insight pop.png', '2023-06-19 11:57:51', '2023-06-19 11:57:51'),
(5, 'Nova Spletna pisarna - Junij 2023', 'Za lažji pregled stanja in komunikacijo z strankami smo izdali novi backoffice', '/public/reports/1687179162820-Screenshot 2021-07-16 at 11.42.36.png', '2023-06-19 12:52:42', '2023-06-19 12:52:42');

-- --------------------------------------------------------

--
-- Table structure for table `Payouts`
--

CREATE TABLE `Payouts` (
  `id` int(11) NOT NULL,
  `payout_detail` varchar(255) NOT NULL,
  `payout_value` float NOT NULL,
  `payout_date` datetime NOT NULL,
  `payout_status` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Portfolios`
--

CREATE TABLE `Portfolios` (
  `id` int(11) NOT NULL,
  `portfolio_profit` int(11) DEFAULT NULL,
  `portfolio_capital` int(11) DEFAULT NULL,
  `portfolio_start_balance` int(11) DEFAULT NULL,
  `portfolio_current_balance` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Portfolios`
--

INSERT INTO `Portfolios` (`id`, `portfolio_profit`, `portfolio_capital`, `portfolio_start_balance`, `portfolio_current_balance`, `createdAt`, `updatedAt`, `userId`) VALUES
(25, 0, 0, 0, 0, '2023-06-15 18:08:57', '2023-06-15 18:08:57', 12),
(26, 0, 0, 0, 0, '2023-06-15 18:09:03', '2023-06-15 18:09:03', 11),
(27, 0, 0, 0, 0, '2023-06-15 18:09:19', '2023-06-15 18:09:19', 9),
(28, 0, 0, 0, 0, '2023-06-15 18:09:22', '2023-06-15 18:09:22', 7),
(30, 0, 0, 0, 0, '2023-06-15 18:09:33', '2023-06-15 18:09:33', 6),
(31, 0, 0, 0, 0, '2023-06-15 18:09:36', '2023-06-15 18:09:36', 5),
(32, 0, 0, 0, 0, '2023-06-15 18:09:38', '2023-06-15 18:09:38', 4),
(33, 0, 0, 0, 0, '2023-06-15 18:09:41', '2023-06-15 18:09:41', 3),
(34, 0, 0, 0, 0, '2023-06-15 18:09:43', '2023-06-15 18:09:43', 2),
(35, 0, 0, 0, 0, '2023-06-15 18:09:46', '2023-06-15 18:09:46', 1),
(36, 9000, 10000, 10000, 15000, '2023-06-19 11:53:32', '2023-06-19 13:00:44', 15);

-- --------------------------------------------------------

--
-- Table structure for table `Profits`
--

CREATE TABLE `Profits` (
  `id` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Profits`
--

INSERT INTO `Profits` (`id`, `capital`, `profit`, `month`, `year`, `createdAt`, `updatedAt`, `userId`) VALUES
(2, 190, 120, 'jan', '2022', '2023-06-17 10:38:41', '2023-06-17 10:38:41', 1),
(3, 800, 900, 'feb', '2022', '2023-06-17 10:38:58', '2023-06-17 10:38:58', 1),
(4, 1000, 1200, 'mar', '2022', '2023-06-17 10:39:17', '2023-06-17 10:39:17', 1),
(5, 400, 350, 'apr', '2022', '2023-06-17 12:12:11', '2023-06-17 12:12:11', 1),
(7, 400, 600, 'may', '2022', '2023-06-17 12:12:57', '2023-06-17 12:12:57', 1),
(9, 400, 900, 'jun', '2022', '2023-06-17 12:14:11', '2023-06-17 12:14:11', 1),
(10, 200, 100, 'jul', '2022', '2023-06-17 12:14:28', '2023-06-17 12:14:28', 1),
(11, 300, 500, 'aug', '2022', '2023-06-17 12:17:20', '2023-06-17 12:17:20', 1),
(12, 300, 500, 'sep', '2022', '2023-06-17 12:17:34', '2023-06-17 12:17:34', 1),
(13, 200, 550, 'nov', '2022', '2023-06-17 12:17:47', '2023-06-17 12:17:47', 1),
(14, 200, 150, 'dec', '2022', '2023-06-17 12:18:11', '2023-06-17 12:18:11', 1),
(15, 120, 120, 'apr', '2021', '2023-06-18 11:35:11', '2023-06-18 11:35:11', 2),
(16, 10000, 15000, 'jun', '2023', '2023-06-19 11:55:25', '2023-06-19 11:55:25', 15),
(17, 1000, 15000, 'jun', '2023', '2023-06-19 12:09:29', '2023-06-19 12:09:29', 15),
(18, 10000, 15000, 'may', '2023', '2023-06-19 12:53:10', '2023-06-19 12:53:10', 15),
(19, 10000, 12000, 'feb', '2023', '2023-06-19 13:00:03', '2023-06-19 13:00:03', 15),
(20, 10000, 13000, 'mar', '2023', '2023-06-19 13:00:13', '2023-06-19 13:00:13', 15),
(21, 10000, 14000, 'apr', '2023', '2023-06-19 13:00:19', '2023-06-19 13:00:19', 15),
(22, 10000, 15000, 'jun', '2023', '2023-06-19 13:00:32', '2023-06-19 13:00:32', 15),
(23, 10000, 9000, 'dec', '2022', '2023-06-19 13:00:44', '2023-06-19 13:00:44', 15);

-- --------------------------------------------------------

--
-- Table structure for table `refferals`
--

CREATE TABLE `refferals` (
  `id` int(11) NOT NULL,
  `sponsor_username` varchar(255) NOT NULL,
  `sponsor_fullname` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `refferals`
--

INSERT INTO `refferals` (`id`, `sponsor_username`, `sponsor_fullname`, `createdAt`, `updatedAt`, `client_id`) VALUES
(1, 'sponsor1', 'sponsor number one', '2023-05-14 19:53:21', '2023-05-14 19:53:21', 1),
(2, 'sponsor 2', 'sponsor number two', '2023-05-16 09:43:49', '2023-05-16 09:43:49', 1),
(3, 'spnsor 3', 'sponsor number three', '2023-05-16 09:46:33', '2023-05-16 09:46:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Reports`
--

CREATE TABLE `Reports` (
  `id` int(11) NOT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  `report_file` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Reports`
--

INSERT INTO `Reports` (`id`, `report_name`, `report_file`, `createdAt`, `updatedAt`, `userId`) VALUES
(1, 'Poro?ilo OK Agencija_Maj 2023', '/public/reports/1687176278934-okag_porocilo_brankocrv_maj23.pdf', '2023-06-19 12:04:49', '2023-06-19 12:04:49', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `id` int(11) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`id`, `file`, `type`, `createdAt`, `updatedAt`) VALUES
(1, '/public/reports/1687176109342-Izjava o omejitvi odgovornosti- SLO.pdf', 'legal', '2023-06-19 12:02:02', '2023-06-19 12:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `revenue_share` varchar(255) DEFAULT NULL,
  `comission_earned` int(11) DEFAULT 0,
  `isAdmin` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `revenue_share`, `comission_earned`, `isAdmin`, `createdAt`, `updatedAt`, `userId`) VALUES
(1, 'med.khairallah', 'med.khairallah3@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:06:48', '2023-06-19 13:48:41', NULL),
(2, 'test1', 'test1@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:24:35', '2023-05-12 20:24:35', NULL),
(3, 'test2', 'test2@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:24:40', '2023-05-12 20:24:40', NULL),
(4, 'test3', 'test3@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:24:48', '2023-05-12 20:24:48', NULL),
(5, 'test4', 'test4@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:24:52', '2023-05-12 20:24:52', NULL),
(6, 'test5', 'test5@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:24:57', '2023-05-12 20:24:57', NULL),
(7, 'test6', 'test6@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:25:02', '2023-05-12 20:25:02', NULL),
(9, 'test7', 'test7@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:25:07', '2023-05-12 20:25:07', NULL),
(11, 'test8', 'test8@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:25:14', '2023-05-12 20:25:14', NULL),
(12, 'test9', 'test9@gmail.com', '123456', NULL, 0, 0, '2023-05-12 20:25:19', '2023-05-12 20:25:19', NULL),
(14, 'admin', 'admin@gmail.com', '123456', NULL, 0, 1, '2023-05-16 08:28:35', '2023-05-16 08:28:35', NULL),
(15, 'denisogorevc', 'ogorevc.denis@gmail.com', 'pokora', '5%', 1200, 0, '2023-06-19 11:53:31', '2023-06-19 13:01:25', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Deposits`
--
ALTER TABLE `Deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `deposit_packages`
--
ALTER TABLE `deposit_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Payouts`
--
ALTER TABLE `Payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `Portfolios`
--
ALTER TABLE `Portfolios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `Profits`
--
ALTER TABLE `Profits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `refferals`
--
ALTER TABLE `refferals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `Reports`
--
ALTER TABLE `Reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Deposits`
--
ALTER TABLE `Deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposit_packages`
--
ALTER TABLE `deposit_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `News`
--
ALTER TABLE `News`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Payouts`
--
ALTER TABLE `Payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Portfolios`
--
ALTER TABLE `Portfolios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `Profits`
--
ALTER TABLE `Profits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `refferals`
--
ALTER TABLE `refferals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Reports`
--
ALTER TABLE `Reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Deposits`
--
ALTER TABLE `Deposits`
  ADD CONSTRAINT `Deposits_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Deposits_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Payouts`
--
ALTER TABLE `Payouts`
  ADD CONSTRAINT `Payouts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Payouts_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Portfolios`
--
ALTER TABLE `Portfolios`
  ADD CONSTRAINT `Portfolios_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Profits`
--
ALTER TABLE `Profits`
  ADD CONSTRAINT `Profits_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refferals`
--
ALTER TABLE `refferals`
  ADD CONSTRAINT `refferals_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Reports`
--
ALTER TABLE `Reports`
  ADD CONSTRAINT `Reports_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
