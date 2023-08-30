-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: okagencija
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Deposits`
--

DROP TABLE IF EXISTS `Deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deposits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deposit_name` varchar(255) NOT NULL,
  `deposit_amount` float NOT NULL,
  `deposit_date` datetime NOT NULL,
  `deposit_money_transfer_type` varchar(255) DEFAULT 'credit card',
  `deposit_money_currencie` varchar(255) DEFAULT 'dollars',
  `deposit_status` tinyint(1) NOT NULL DEFAULT '0',
  `deposit_client_wallet` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `Deposits_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Deposits_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deposits`
--

LOCK TABLES `Deposits` WRITE;
/*!40000 ALTER TABLE `Deposits` DISABLE KEYS */;
INSERT INTO `Deposits` VALUES (1,'aggressive',12345,'2023-06-20 09:09:00','credit card','dollars',0,NULL,'2023-06-20 09:09:00','2023-06-20 09:09:00',NULL,1),(2,'aggressive',678,'2023-06-20 09:10:25','credit card','dollars',0,NULL,'2023-06-20 09:10:25','2023-06-20 09:10:25',NULL,2);
/*!40000 ALTER TABLE `Deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `News` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payouts`
--

DROP TABLE IF EXISTS `Payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payout_detail` varchar(255) NOT NULL,
  `payout_value` float NOT NULL,
  `payout_date` datetime NOT NULL,
  `payout_status` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `Payouts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Payouts_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payouts`
--

LOCK TABLES `Payouts` WRITE;
/*!40000 ALTER TABLE `Payouts` DISABLE KEYS */;
INSERT INTO `Payouts` VALUES (1,'Basic',12344,'2023-06-20 09:58:12',0,'2023-06-20 09:58:12','2023-06-20 09:58:12',NULL,1);
/*!40000 ALTER TABLE `Payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Portfolios`
--

DROP TABLE IF EXISTS `Portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portfolios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `portfolio_profit` int DEFAULT NULL,
  `portfolio_capital` int DEFAULT NULL,
  `portfolio_start_balance` int DEFAULT NULL,
  `portfolio_current_balance` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Portfolios_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Portfolios`
--

LOCK TABLES `Portfolios` WRITE;
/*!40000 ALTER TABLE `Portfolios` DISABLE KEYS */;
INSERT INTO `Portfolios` VALUES (24,123,123,1234,1234,'2023-06-15 18:08:43','2023-06-17 10:25:57',13),(25,0,0,0,0,'2023-06-15 18:08:57','2023-06-15 18:08:57',12),(26,0,0,0,0,'2023-06-15 18:09:03','2023-06-15 18:09:03',11),(27,0,0,0,0,'2023-06-15 18:09:19','2023-06-15 18:09:19',9),(28,0,0,0,0,'2023-06-15 18:09:22','2023-06-15 18:09:22',7),(30,0,0,0,0,'2023-06-15 18:09:33','2023-06-15 18:09:33',6),(31,0,0,0,0,'2023-06-15 18:09:36','2023-06-15 18:09:36',5),(32,0,0,0,0,'2023-06-15 18:09:38','2023-06-15 18:09:38',4),(33,0,0,0,0,'2023-06-15 18:09:41','2023-06-15 18:09:41',3),(34,120,120,500,600,'2023-06-15 18:09:43','2023-06-18 11:35:11',2),(35,120,1200,19000,23000,'2023-06-15 18:09:46','2023-06-23 19:48:03',1);
/*!40000 ALTER TABLE `Portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profits`
--

DROP TABLE IF EXISTS `Profits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `capital` int NOT NULL,
  `profit` int NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Profits_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profits`
--

LOCK TABLES `Profits` WRITE;
/*!40000 ALTER TABLE `Profits` DISABLE KEYS */;
INSERT INTO `Profits` VALUES (1,123,123,'oct','2022','2023-06-17 10:25:57','2023-06-17 10:25:57',13),(2,190,120,'jan','2022','2023-06-17 10:38:41','2023-06-17 10:38:41',1),(3,800,900,'feb','2022','2023-06-17 10:38:58','2023-06-17 10:38:58',1),(4,1000,1200,'mar','2022','2023-06-17 10:39:17','2023-06-17 10:39:17',1),(5,400,350,'apr','2022','2023-06-17 12:12:11','2023-06-17 12:12:11',1),(7,400,600,'may','2022','2023-06-17 12:12:57','2023-06-17 12:12:57',1),(9,400,900,'jun','2022','2023-06-17 12:14:11','2023-06-17 12:14:11',1),(10,200,100,'jul','2022','2023-06-17 12:14:28','2023-06-17 12:14:28',1),(11,300,500,'aug','2022','2023-06-17 12:17:20','2023-06-17 12:17:20',1),(12,300,500,'sep','2022','2023-06-17 12:17:34','2023-06-17 12:17:34',1),(13,200,550,'nov','2022','2023-06-17 12:17:47','2023-06-17 12:17:47',1),(14,200,150,'dec','2022','2023-06-17 12:18:11','2023-06-17 12:18:11',1),(15,120,120,'apr','2021','2023-06-18 11:35:11','2023-06-18 11:35:11',2),(16,1200,120,'nov','2022','2023-06-23 19:48:03','2023-06-23 19:48:03',1);
/*!40000 ALTER TABLE `Profits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reports`
--

DROP TABLE IF EXISTS `Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_name` varchar(255) DEFAULT NULL,
  `report_file` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Reports_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reports`
--

LOCK TABLES `Reports` WRITE;
/*!40000 ALTER TABLE `Reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_packages`
--

DROP TABLE IF EXISTS `deposit_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit_packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deposit_name` varchar(255) NOT NULL,
  `deposit_value` float NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_packages`
--

LOCK TABLES `deposit_packages` WRITE;
/*!40000 ALTER TABLE `deposit_packages` DISABLE KEYS */;
INSERT INTO `deposit_packages` VALUES (3,'Conservativess',1000,'2023-05-24 04:50:43','2023-06-20 12:02:01'),(4,'Moderate',10000,'2023-05-24 04:50:53','2023-05-24 04:50:53'),(5,'agressive',20000,'2023-06-20 10:03:05','2023-06-20 10:03:05');
/*!40000 ALTER TABLE `deposit_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refferals`
--

DROP TABLE IF EXISTS `refferals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refferals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sponsor_username` varchar(255) NOT NULL,
  `sponsor_fullname` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `refferals_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refferals`
--

LOCK TABLES `refferals` WRITE;
/*!40000 ALTER TABLE `refferals` DISABLE KEYS */;
INSERT INTO `refferals` VALUES (1,'sponsor1','sponsor number one','2023-05-14 19:53:21','2023-05-14 19:53:21',1),(2,'sponsor 2','sponsor number two','2023-05-16 09:43:49','2023-05-16 09:43:49',1),(3,'spnsor 3','sponsor number three','2023-05-16 09:46:33','2023-05-16 09:46:33',1);
/*!40000 ALTER TABLE `refferals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tools` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools`
--

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `revenue_share` varchar(255) DEFAULT NULL,
  `comission_earned` int DEFAULT '0',
  `isAdmin` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `userId` (`userId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'med.khairallah','med.khairallah3@gmail.com','123456',NULL,0,0,'2023-05-12 20:06:48','2023-05-12 20:06:48',NULL),(2,'test1','test1@gmail.com','123456',NULL,0,0,'2023-05-12 20:24:35','2023-05-12 20:24:35',NULL),(3,'test2','test2@gmail.com','123456',NULL,0,0,'2023-05-12 20:24:40','2023-05-12 20:24:40',NULL),(4,'test3','test3@gmail.com','123456',NULL,0,0,'2023-05-12 20:24:48','2023-05-12 20:24:48',NULL),(5,'test4','test4@gmail.com','123456',NULL,0,0,'2023-05-12 20:24:52','2023-05-12 20:24:52',NULL),(6,'test5','test5@gmail.com','123456',NULL,0,0,'2023-05-12 20:24:57','2023-05-12 20:24:57',NULL),(7,'test6','test6@gmail.com','123456',NULL,0,0,'2023-05-12 20:25:02','2023-05-12 20:25:02',NULL),(9,'test7','test7@gmail.com','123456',NULL,0,0,'2023-05-12 20:25:07','2023-05-12 20:25:07',NULL),(11,'test8','test8@gmail.com','123456',NULL,0,0,'2023-05-12 20:25:14','2023-05-12 20:25:14',NULL),(12,'test9','test9@gmail.com','123456',NULL,0,0,'2023-05-12 20:25:19','2023-05-12 20:25:19',NULL),(13,'test10','test10@gmail.com','123456',NULL,0,0,'2023-05-12 20:25:24','2023-05-12 20:25:24',NULL),(14,'admin','admin@gmail.com','123456',NULL,0,1,'2023-05-16 08:28:35','2023-05-16 08:28:35',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-24  6:31:14
