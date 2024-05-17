-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: bank_db
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_data`
--

DROP TABLE IF EXISTS `accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_data` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_number` int NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `account_type` enum('savings','current') NOT NULL,
  `total_balance` decimal(10,2) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_data`
--

LOCK TABLES `accounts_data` WRITE;
/*!40000 ALTER TABLE `accounts_data` DISABLE KEYS */;
INSERT INTO `accounts_data` VALUES (1,24040001,'John Doe','john@example.com','123-456-7890','savings',400.99,'123 Main St, City','2024-04-23 21:04:56'),(2,24040002,'Jane Smith','jane@example.com','987-654-3210','current',11191.74,'456 Elm St, Town','2024-04-23 21:04:56'),(3,24040003,'Michael Johnson','michael@example.com','111-222-3333','savings',8139.98,'789 Oak St, Village','2024-04-23 21:04:56'),(4,24040004,'Emily Brown','emily@example.com','444-555-6666','current',5000.00,'321 Pine St, Hamlet','2024-04-23 21:04:56'),(5,24040005,'David Lee','david@example.com','777-888-9999','savings',2255.01,'654 Birch St, Borough','2024-04-23 21:04:56'),(6,24040006,'Sarah Wilson','sarah@example.com','222-333-4444','current',15000.00,'987 Maple St, Township','2024-04-23 21:04:56'),(7,24040007,'Matthew Taylor','matthew@example.com','555-666-7777','savings',6000.00,'741 Cedar St, County','2024-04-23 21:04:56'),(8,24040008,'Emma Martinez','emma@example.com','999-888-7777','current',20000.00,'852 Walnut St, State','2024-04-23 21:04:56'),(9,24040009,'Olivia Garcia','olivia@example.com','333-222-1111','savings',9000.00,'369 Pineapple St, Country','2024-04-23 21:04:56'),(10,24040010,'Daniel Rodriguez','daniel@example.com','666-777-8888','current',18021.00,'159 Cherry St, Kingdom','2024-04-23 21:04:56'),(11,47520275,'ahmed','md.ahmed.rahmani@gmail.com','07719602323','current',1500.00,'10 Eldon Road','2024-04-23 22:05:50'),(12,32657833,'M. Ahmed Rahmani','rahmani.ahmed.2104@gmail.com','07719602323','savings',47082.00,'10 Eldon Road','2024-04-23 22:10:02'),(13,81965978,'ali','rahmani.ali.2104@gmail.com','07719602326','savings',100.00,'uk','2024-04-23 22:11:56'),(16,24040100,'Samreen Rahmani','md.ahmed.rahmani@gmail.com','09032763435','savings',2381.00,'ASAD BABA NAGAR, KISHAN BAGH, BAHADURPURA','2024-04-29 07:42:27'),(20,24050932,'','','','savings',0.00,'','2024-05-08 08:52:22'),(21,24059464,'','','','savings',0.00,'','2024-05-08 09:38:14'),(22,24053880,'abc','abc','789','savings',0.00,'bghg','2024-05-08 09:44:54'),(23,24057057,'saleem ali','saleem@gmail.com','07868909090','current',2650.00,'London','2024-05-08 10:00:00'),(24,24058071,'Mohammed Ali','ali@ucb.co.uk','07823782390','savings',100.00,'London','2024-05-08 10:10:47'),(25,24055396,'Charlie Wilson','wilson.charlie@gmail.com','07861234569','current',9000.00,'Scotland','2024-05-08 10:29:30'),(26,24052266,'Mohammed Ahmed Rahmani','Ahmed@ucb.ac.uk','08978987676','current',15000.00,'Birmingham','2024-05-08 10:54:57');
/*!40000 ALTER TABLE `accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `employee_id` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_role` varchar(255) NOT NULL,
  `employee_username` varchar(255) NOT NULL,
  `employee_password` varchar(255) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES ('emp001','Alice Anderson','Manager','alice','password1'),('emp002','Bob Baker','Teller','bob','password2'),('emp003','Charlie Clark','Accountant','charlie','password3'),('emp004','David Davis','Customer Service','david','password4'),('emp005','Emma Evans','Security','emma','password5');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_number` int NOT NULL,
  `date_time` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` enum('deposit','withdrawal','txn_fee','txn_fd.sent','txn_fd.rcvd') NOT NULL,
  `transaction_details` text,
  PRIMARY KEY (`transaction_id`),
  KEY `account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (7,24040001,'2024-04-24 10:00:00',500.00,'deposit','Deposit from customer'),(8,24040002,'2024-04-24 11:30:00',200.00,'withdrawal','ATM withdrawal'),(9,24040001,'2024-04-24 10:00:00',500.00,'deposit','Deposit from customer'),(10,24040002,'2024-04-24 11:30:00',200.00,'withdrawal','ATM withdrawal'),(11,32657833,'2024-04-24 07:37:38',10.00,'deposit','Family'),(17,32657833,'2024-04-24 09:04:29',2000.00,'deposit','abc'),(18,32657833,'2024-04-24 09:18:45',-123.11,'withdrawal','payment'),(19,32657833,'2024-04-24 09:19:10',10000.00,'deposit','save'),(20,32657833,'2024-04-24 09:41:47',-2000.00,'withdrawal','party'),(23,32657833,'2024-04-24 10:57:30',-100.00,'withdrawal','uni'),(24,32657833,'2024-04-24 11:10:08',-10.00,'withdrawal','shop'),(25,32657833,'2024-04-24 11:10:37',-1100.00,'withdrawal','market'),(26,32657833,'2024-04-24 11:10:37',-2.00,'txn_fee','Withdrawal fee'),(27,32657833,'2024-04-24 11:13:18',-2000.00,'withdrawal','ali_loan'),(28,32657833,'2024-04-24 11:13:18',-10.00,'txn_fee','Withdrawal fee'),(29,32657833,'2024-04-24 13:20:13',-100.00,'withdrawal','sans,ja'),(30,32657833,'2024-04-26 12:04:04',-10000.00,'withdrawal','Sent to 24040001'),(31,24040001,'2024-04-26 12:04:04',10000.00,'deposit','Received from 32657833'),(32,32657833,'2024-04-26 12:18:39',-150.00,'txn_fd.sent','Sent to 24040001'),(33,24040001,'2024-04-26 12:18:39',150.00,'txn_fd.rcvd','Received from 32657833'),(34,32657833,'2024-04-26 13:00:52',-101.00,'txn_fd.sent','Sent to 24040001'),(35,24040001,'2024-04-26 13:00:52',101.00,'txn_fd.rcvd','Received from 32657833'),(36,24040001,'2024-04-26 13:10:15',-120.00,'txn_fd.sent','Sent to 24040002'),(37,24040002,'2024-04-26 13:10:15',120.00,'txn_fd.rcvd','Received from 24040001'),(38,32657833,'2024-04-26 17:29:43',-1901.00,'txn_fd.sent','Funds sent'),(39,24040001,'2024-04-26 17:29:43',1901.00,'txn_fd.rcvd','Funds received'),(40,24040002,'2024-04-26 17:33:36',-120.00,'txn_fd.sent','Funds sent'),(41,24040001,'2024-04-26 17:33:36',120.00,'txn_fd.rcvd','Funds received'),(42,24040001,'2024-04-26 17:37:34',-1150.00,'txn_fd.sent','Funds sent'),(43,24040002,'2024-04-26 17:37:34',1150.00,'txn_fd.rcvd','Funds received'),(44,24040001,'2024-04-26 17:55:55',-1250.00,'txn_fd.sent','Funds sent to 24040002'),(45,24040002,'2024-04-26 17:55:55',1250.00,'txn_fd.rcvd','Funds received from 24040001'),(46,24040001,'2024-04-26 18:02:21',-185.00,'txn_fd.sent','Funds sent to 24040002'),(47,24040002,'2024-04-26 18:02:21',185.00,'txn_fd.rcvd','Funds received from 24040001'),(48,32657833,'2024-04-26 18:19:03',-1024.00,'txn_fd.sent','Funds sent to 24040001'),(49,24040001,'2024-04-26 18:19:03',1024.00,'txn_fd.rcvd','Funds received from 32657833'),(50,32657833,'2024-04-26 18:21:16',-143.00,'txn_fd.sent','Funds sent to 24040001'),(51,24040001,'2024-04-26 18:21:16',143.00,'txn_fd.rcvd','Funds received from 32657833'),(52,32657833,'2024-04-26 18:24:58',-121.00,'txn_fd.sent','Funds sent to 24040001'),(53,24040001,'2024-04-26 18:24:58',121.00,'txn_fd.rcvd','Funds received from 32657833'),(54,32657833,'2024-04-26 18:28:13',-300.00,'txn_fd.sent','Funds sent to 24040001'),(55,24040001,'2024-04-26 18:28:13',300.00,'txn_fd.rcvd','Funds received from 32657833'),(56,32657833,'2024-04-26 18:28:39',-300.00,'txn_fd.sent','Funds sent to 24040001'),(57,24040001,'2024-04-26 18:28:39',300.00,'txn_fd.rcvd','Funds received from 32657833'),(58,32657833,'2024-04-26 18:33:35',-15.00,'txn_fd.sent','Funds sent to 24040001'),(59,24040001,'2024-04-26 18:33:35',15.00,'txn_fd.rcvd','Funds received from 32657833'),(60,32657833,'2024-04-26 18:35:59',-1001.00,'txn_fd.sent','Funds sent to 24040001'),(61,24040001,'2024-04-26 18:35:59',1001.00,'txn_fd.rcvd','Funds received from 32657833'),(62,32657833,'2024-04-26 18:56:42',-1.00,'withdrawal','Funds sent to 24040001'),(63,24040001,'2024-04-26 18:56:42',1.00,'deposit','Funds received from 32657833'),(64,24040001,'2024-04-26 19:16:27',-1.00,'withdrawal','Funds sent to 32657833'),(65,32657833,'2024-04-26 19:16:27',1.00,'deposit','Funds received from 24040001'),(66,24040001,'2024-04-26 19:18:12',-1000.00,'withdrawal','Funds sent to 32657833'),(67,32657833,'2024-04-26 19:18:12',1000.00,'deposit','Funds received from 24040001'),(68,24040001,'2024-04-26 19:27:16',-126.00,'withdrawal','Funds sent to 24040002'),(69,24040002,'2024-04-26 19:27:16',126.00,'deposit','Funds received from 24040001'),(70,24040002,'2024-04-26 19:33:34',-149.00,'withdrawal','Funds sent to 24040001'),(71,24040001,'2024-04-26 19:33:34',149.00,'deposit','Funds received from 24040002'),(72,24040001,'2024-04-26 19:35:57',-189.00,'withdrawal','Funds sent to 24040002'),(73,24040002,'2024-04-26 19:35:57',189.00,'deposit','Funds received from 24040001'),(74,24040002,'2024-04-26 19:45:14',-1200.00,'txn_fd.sent','Funds sent to 24040001'),(75,24040001,'2024-04-26 19:45:14',1200.00,'txn_fd.rcvd','Funds received from 24040002'),(76,24040001,'2024-04-26 19:50:52',-1111.00,'txn_fd.sent','Funds sent to 24040002'),(77,24040002,'2024-04-26 19:50:52',1111.00,'txn_fd.rcvd','Funds received from 24040001'),(78,24040001,'2024-04-29 09:10:42',1234.00,'deposit',NULL),(79,32657833,'2024-04-29 09:42:54',129.00,'withdrawal',NULL),(80,32657833,'2024-04-29 09:43:02',129.00,'withdrawal',NULL),(81,32657833,'2024-04-29 09:43:12',1.00,'deposit',NULL),(82,32657833,'2024-04-29 09:43:38',1234.00,'deposit',NULL),(83,24040001,'2024-04-29 09:45:01',1000.00,'deposit',NULL),(84,24040001,'2024-04-29 09:45:11',560.00,'withdrawal',NULL),(85,24040002,'2024-04-29 21:48:27',-10.01,'withdrawal','Withdrawal of funds'),(86,24040002,'2024-04-29 21:49:07',-51.01,'withdrawal','Withdrawal of funds'),(87,24040002,'2024-04-29 21:55:58',-100.01,'withdrawal','Withdrawal of funds'),(88,24040002,'2024-04-30 11:09:10',-100.00,'withdrawal','md.ahmed.rahmani@gmail.com'),(89,24040002,'2024-04-30 11:09:27',-1050.00,'withdrawal','md'),(90,24040002,'2024-04-30 11:09:27',-1.00,'txn_fee','Withdrawal fee'),(91,24040002,'2024-04-30 11:10:35',-6000.01,'withdrawal','pay'),(92,24040002,'2024-04-30 11:10:35',-10.00,'txn_fee','Withdrawal fee'),(93,24040002,'2024-04-30 11:14:05',-1110.01,'withdrawal','vvv'),(94,24040002,'2024-04-30 11:14:05',-2.20,'txn_fee','Withdrawal fee'),(95,24040002,'2024-04-30 11:14:39',-110.01,'withdrawal','vvv'),(96,32657833,'2024-04-30 11:15:34',-2000.00,'withdrawal','go'),(97,32657833,'2024-04-30 11:15:34',-10.00,'txn_fee','Withdrawal fee'),(98,32657833,'2024-04-30 11:37:25',-0.89,'withdrawal',''),(99,24040001,'2024-04-30 12:56:42',-5000.00,'withdrawal','fee'),(100,24040001,'2024-04-30 12:56:42',-10.00,'txn_fee','Withdrawal fee'),(101,24040001,'2024-04-30 13:08:37',19.20,'deposit','save-up'),(102,24040100,'2024-04-30 13:10:44',2001.00,'deposit','good work'),(103,24040010,'2024-04-30 13:11:16',21.00,'deposit','help'),(104,24040001,'2024-04-30 13:56:24',-4326.00,'txn_fd.sent','Funds sent to 24040002'),(105,24040002,'2024-04-30 13:56:24',4326.00,'txn_fd.rcvd','Funds received from 24040001'),(106,24040001,'2024-04-30 13:56:51',10000.00,'deposit',''),(107,24040001,'2024-04-30 13:57:12',-1000.00,'txn_fd.sent','Funds sent to 24040001'),(108,24040001,'2024-04-30 13:57:12',1000.00,'txn_fd.rcvd','Funds received from 24040001'),(109,24040001,'2024-04-30 14:08:50',-1.00,'txn_fd.sent','Funds sent to 24040001'),(110,24040001,'2024-04-30 14:08:50',1.00,'txn_fd.rcvd','Funds received from 24040001'),(111,24040001,'2024-04-30 14:22:29',-70.00,'txn_fd.sent','Funds sent to 24040001'),(112,24040001,'2024-04-30 14:22:29',70.00,'txn_fd.rcvd','Funds received from 24040001'),(113,24040001,'2024-04-30 14:25:44',-70.00,'txn_fd.sent','Funds sent to 24040001'),(114,24040001,'2024-04-30 14:25:44',70.00,'txn_fd.rcvd','Funds received from 24040001'),(115,24040001,'2024-04-30 14:32:25',-1.00,'txn_fd.sent','Funds sent to 24040001'),(116,24040001,'2024-04-30 14:32:25',1.00,'txn_fd.rcvd','Funds received from 24040001'),(117,24040001,'2024-04-30 14:33:16',-786.00,'txn_fd.sent','Funds sent to 24040001'),(118,24040001,'2024-04-30 14:33:16',786.00,'txn_fd.rcvd','Funds received from 24040001'),(119,24040001,'2024-04-30 14:44:17',-1200.00,'txn_fd.sent','Funds sent to 24040001'),(120,24040001,'2024-04-30 14:44:17',1200.00,'txn_fd.rcvd','Funds received from 24040001'),(121,24040001,'2024-04-30 14:46:43',-1200.00,'txn_fd.sent','Funds sent to 24040001'),(122,24040001,'2024-04-30 14:46:43',1200.00,'txn_fd.rcvd','Funds received from 24040001'),(123,24040001,'2024-04-30 14:47:00',-1200.00,'txn_fd.sent','Funds sent to 24040002'),(124,24040002,'2024-04-30 14:47:00',1200.00,'txn_fd.rcvd','Funds received from 24040001'),(125,24040001,'2024-04-30 14:47:01',-1200.00,'txn_fd.sent','Funds sent to 24040002'),(126,24040002,'2024-04-30 14:47:01',1200.00,'txn_fd.rcvd','Funds received from 24040001'),(127,24040001,'2024-04-30 14:47:15',-1200.00,'txn_fd.sent','Funds sent to 24040002'),(128,24040002,'2024-04-30 14:47:15',1200.00,'txn_fd.rcvd','Funds received from 24040001'),(129,24040001,'2024-04-30 14:47:21',-1200.00,'txn_fd.sent','Funds sent to 24040001'),(130,24040001,'2024-04-30 14:47:21',1200.00,'txn_fd.rcvd','Funds received from 24040001'),(131,24040002,'2024-04-30 14:48:14',-123.00,'txn_fd.sent','Funds sent to 24040002'),(132,24040002,'2024-04-30 14:48:14',123.00,'txn_fd.rcvd','Funds received from 24040002'),(133,24040002,'2024-04-30 14:52:16',-5.00,'txn_fd.sent','Funds sent to 24040001'),(134,24040001,'2024-04-30 14:52:16',5.00,'txn_fd.rcvd','Funds received from 24040002'),(135,24040002,'2024-04-30 14:52:40',-34.00,'txn_fd.sent','Funds sent to 24040002'),(136,24040002,'2024-04-30 14:52:40',34.00,'txn_fd.rcvd','Funds received from 24040002'),(137,24040001,'2024-04-30 15:01:19',-1.00,'txn_fd.sent','Funds sent to 24040001'),(138,24040001,'2024-04-30 15:01:19',1.00,'txn_fd.rcvd','Funds received from 24040001'),(139,24040001,'2024-04-30 15:10:03',-1456.00,'txn_fd.sent','Funds sent to 24040001'),(140,24040001,'2024-04-30 15:10:03',1456.00,'txn_fd.rcvd','Funds received from 24040001'),(141,24040001,'2024-04-30 15:19:05',-1.00,'txn_fd.sent','Funds sent to 24040001'),(142,24040001,'2024-04-30 15:19:05',1.00,'txn_fd.rcvd','Funds received from 24040001'),(143,24040001,'2024-04-30 15:40:16',-1.00,'txn_fd.sent','Funds sent to 24040001'),(144,24040001,'2024-04-30 15:40:16',1.00,'txn_fd.rcvd','Funds received from 24040001'),(145,24040001,'2024-04-30 15:43:27',-1.00,'txn_fd.sent','Funds sent to 24040001'),(146,24040001,'2024-04-30 15:43:27',1.00,'txn_fd.rcvd','Funds received from 24040001'),(147,24040002,'2024-04-30 16:16:03',-1000.00,'txn_fd.sent','Funds sent to 24040003'),(148,24040003,'2024-04-30 16:16:03',1000.00,'txn_fd.rcvd','Funds received from 24040002'),(149,24040001,'2024-05-01 05:44:30',1.00,'deposit','24040001'),(150,32657833,'2024-05-01 05:50:23',-1.00,'txn_fd.sent','Funds sent to 24040001'),(151,24040001,'2024-05-01 05:50:23',1.00,'txn_fd.rcvd','Funds received from 32657833'),(152,24040001,'2024-05-01 05:52:25',-6000.00,'withdrawal','abc'),(153,24040001,'2024-05-01 05:52:25',-10.00,'txn_fee','Withdrawal fee'),(154,47520275,'2024-05-01 05:54:42',1000.00,'deposit','save'),(155,24040002,'2024-05-01 06:01:49',32.00,'deposit','test'),(156,24040001,'2024-05-01 07:03:13',50.00,'deposit','pay'),(157,24040001,'2024-05-01 07:03:15',50.00,'deposit','pay'),(158,24050932,'2024-05-08 08:52:22',0.00,'deposit','initial deposit'),(159,24059464,'2024-05-08 09:38:14',0.00,'deposit','initial deposit'),(160,24053880,'2024-05-08 09:44:54',0.00,'deposit','initial deposit'),(161,24057057,'2024-05-08 10:00:00',2650.00,'deposit','initial deposit'),(162,24058071,'2024-05-08 10:10:47',100.00,'deposit','initial deposit'),(163,24055396,'2024-05-08 10:29:30',9000.00,'deposit','initial deposit'),(164,24052266,'2024-05-08 10:54:57',15000.00,'deposit','initial deposit'),(165,24040002,'2024-05-08 15:33:36',70.00,'withdrawal','Withdrawal from ATM'),(166,24040002,'2024-05-08 15:34:38',70.00,'withdrawal','Withdrawal from ATM'),(167,24040003,'2024-05-08 15:34:58',110.01,'withdrawal','Withdrawal from ATM'),(168,24040003,'2024-05-08 15:36:35',110.01,'withdrawal','Withdrawal from ATM'),(169,24040001,'2024-05-08 15:37:13',7.20,'withdrawal','Withdrawal from ATM'),(170,24040001,'2024-05-08 15:38:24',90.00,'withdrawal','Withdrawal from ATM'),(171,24040001,'2024-05-08 15:39:20',10.00,'withdrawal','Withdrawal from ATM'),(172,24040001,'2024-05-08 15:42:33',11.00,'withdrawal','Withdrawal from ATM'),(173,24040001,'2024-05-08 15:49:38',21.00,'withdrawal','Withdrawal from ATM'),(174,24040001,'2024-05-08 15:52:09',31.00,'withdrawal','Withdrawal from ATM'),(175,24040001,'2024-05-08 15:53:18',41.00,'withdrawal','Withdrawal from ATM'),(176,24040001,'2024-05-08 15:54:30',61.00,'withdrawal','Withdrawal from ATM'),(177,24040003,'2024-05-08 16:26:10',2040.00,'withdrawal','Withdrawal from ATM'),(178,24040004,'2024-05-08 16:50:29',6120.00,'withdrawal','Withdrawal from ATM'),(179,24040004,'2024-05-08 16:53:38',600.00,'withdrawal','Withdrawal from ATM'),(180,24040005,'2024-05-08 17:00:22',1224.00,'withdrawal','Withdrawal from ATM'),(181,24040005,'2024-05-08 17:02:39',1122.00,'withdrawal','Withdrawal from ATM'),(182,24040005,'2024-05-08 17:14:10',1000.01,'deposit','Deposit to account'),(183,24040005,'2024-05-08 17:16:47',200.00,'deposit','Deposit to account'),(184,24040005,'2024-05-08 17:17:57',2300.00,'deposit','Deposit to account'),(185,24040005,'2024-05-08 17:20:07',2100.00,'deposit','Deposit to account'),(186,24040005,'2024-05-08 17:20:50',20.00,'deposit','Deposit to account'),(187,24040005,'2024-05-08 17:21:15',10.00,'deposit','Deposit to account'),(188,24040005,'2024-05-08 17:22:05',95.00,'deposit','Deposit to account'),(189,24040005,'2024-05-08 17:22:24',90.00,'deposit','Deposit to account'),(190,24040005,'2024-05-08 17:23:25',100.00,'deposit','Deposit to account'),(191,24040005,'2024-05-08 17:24:07',5100.00,'withdrawal','Withdrawal from ATM'),(192,24040004,'2024-05-08 18:36:32',-280.00,'txn_fd.sent','Transferred to 24040001'),(193,24040001,'2024-05-08 18:36:32',280.00,'txn_fd.rcvd','Received from 24040004'),(194,24040001,'2024-05-14 16:11:31',1.00,'deposit',''),(195,24040003,'2024-05-14 16:56:36',2000.00,'deposit','Deposit to account'),(196,24040003,'2024-05-14 16:56:58',300.00,'withdrawal','Withdrawal from ATM'),(197,32657833,'2024-05-15 06:22:45',1.00,'deposit','rahmani'),(198,32657833,'2024-05-15 07:08:07',60.00,'deposit','fun'),(199,32657833,'2024-05-15 09:08:18',-3000.00,'txn_fd.sent','Transferred to 24040001'),(200,24040001,'2024-05-15 09:08:18',3000.00,'txn_fd.rcvd','Received from 32657833'),(201,24040001,'2024-05-15 15:11:26',4000.00,'deposit','Deposit to account'),(202,24040001,'2024-05-15 15:11:34',400.00,'withdrawal','Withdrawal from ATM'),(203,24040001,'2024-05-15 15:11:52',6120.00,'withdrawal','Withdrawal from ATM'),(204,24040001,'2024-05-15 15:12:08',100.00,'withdrawal','Withdrawal from ATM'),(205,24040001,'2024-05-15 15:12:29',-6.00,'txn_fd.sent','Transferred to 24040002'),(206,24040002,'2024-05-15 15:12:29',6.00,'txn_fd.rcvd','Received from 24040001'),(207,24040001,'2024-05-16 00:29:28',0.01,'withdrawal','Withdrawal from ATM'),(208,24040001,'2024-05-16 00:30:20',20.00,'withdrawal','Withdrawal from ATM'),(209,24040001,'2024-05-16 00:31:53',100.00,'deposit','Deposit to account'),(210,24040001,'2024-05-16 00:33:56',-100.00,'txn_fd.sent','Transferred to 24040001'),(211,24040001,'2024-05-16 00:33:56',100.00,'txn_fd.rcvd','Received from 24040001'),(212,24040001,'2024-05-16 01:13:11',1000.00,'deposit','Deposit to account'),(213,24040001,'2024-05-16 01:15:21',1224.00,'withdrawal','Withdrawal from ATM'),(214,24040001,'2024-05-16 01:17:30',-15.00,'txn_fd.sent','Transferred to 24040002'),(215,24040002,'2024-05-16 01:17:30',15.00,'txn_fd.rcvd','Received from 24040001');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 20:43:36
