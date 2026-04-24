/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lorcana_market_manager
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `lorcana_market_manager`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lorcana_market_manager` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `lorcana_market_manager`;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `ink_color` varchar(30) NOT NULL,
  `rarity` varchar(30) NOT NULL,
  `card_type` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL CHECK (`cost` >= 0),
  `card_number` int(11) NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `fk_cards_sets` (`set_id`),
  CONSTRAINT `fk_cards_sets` FOREIGN KEY (`set_id`) REFERENCES `sets` (`set_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cards` VALUES
(1,1,'Ariel - Spectacular Singer','Amber','Super Rare','Character',5,18),
(2,1,'Elsa - Snow Queen','Amethyst','Legendary','Character',8,42),
(3,1,'Tinker Bell - Giant Fairy','Steel','Legendary','Character',6,191),
(4,2,'Beast - Tragic Hero','Steel','Legendary','Character',5,207),
(5,2,'Cinderella - Ballroom Sensation','Amber','Rare','Character',2,13),
(6,2,'Madam Mim - Fox','Amethyst','Rare','Character',3,51),
(7,3,'Jafar - Striking Illusionist','Amethyst','Super Rare','Character',4,61),
(8,3,'Robin Hood - Champion of Sherwood','Steel','Legendary','Character',6,210),
(9,3,'Ursula - Deceiver','Ruby','Rare','Character',4,129);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact_type` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`contact_type` in ('Customer','Supplier','Both'))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `contacts` VALUES
(1,'Sevilla TCG Store','Supplier','+34 600111222','orders@sevillatcg.com','Seville'),
(2,'Ana Ruiz','Customer','+34 611223344','ana.ruiz@email.com','Seville'),
(3,'Card Vault Madrid','Supplier','+34 622334455','sales@cardvault.es','Madrid'),
(4,'Luis Romero','Both','+34 633445566','luis.romero@email.com','Cordoba'),
(5,'Marta Gil','Customer','+34 644556677','marta.gil@email.com','Malaga');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `copies`
--

DROP TABLE IF EXISTS `copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `copies` (
  `copy_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `card_condition` varchar(30) NOT NULL,
  `foil` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(30) NOT NULL DEFAULT 'English',
  `purchase_price` decimal(10,2) NOT NULL CHECK (`purchase_price` >= 0),
  `available` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`copy_id`),
  KEY `fk_copies_cards` (`card_id`),
  CONSTRAINT `fk_copies_cards` FOREIGN KEY (`card_id`) REFERENCES `cards` (`card_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copies`
--

LOCK TABLES `copies` WRITE;
/*!40000 ALTER TABLE `copies` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `copies` VALUES
(1,1,'Near Mint',0,'English',6.50,1),
(2,1,'Near Mint',1,'English',11.00,1),
(3,2,'Excellent',0,'English',14.00,1),
(4,3,'Near Mint',0,'Spanish',18.50,1),
(5,4,'Near Mint',0,'English',22.00,1),
(6,5,'Good',0,'English',2.20,1),
(7,6,'Near Mint',0,'Spanish',3.80,1),
(8,7,'Excellent',1,'English',7.90,1),
(9,8,'Near Mint',0,'English',24.00,1),
(10,9,'Good',0,'English',4.10,1);
/*!40000 ALTER TABLE `copies` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sets`
--

DROP TABLE IF EXISTS `sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sets` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`set_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sets`
--

LOCK TABLES `sets` WRITE;
/*!40000 ALTER TABLE `sets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sets` VALUES
(1,'The First Chapter','TFC','2023-08-18'),
(2,'Rise of the Floodborn','ROF','2023-11-17'),
(3,'Into the Inklands','ITI','2024-02-23');
/*!40000 ALTER TABLE `sets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_details` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `copy_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL CHECK (`unit_price` >= 0),
  `quantity` int(11) NOT NULL DEFAULT 1 CHECK (`quantity` > 0),
  PRIMARY KEY (`detail_id`),
  KEY `fk_transaction_details_transactions` (`transaction_id`),
  KEY `fk_transaction_details_copies` (`copy_id`),
  CONSTRAINT `fk_transaction_details_copies` FOREIGN KEY (`copy_id`) REFERENCES `copies` (`copy_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_details_transactions` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `transaction_details` VALUES
(1,1,1,6.50,1),
(2,1,5,22.00,1),
(3,1,6,3.20,1),
(4,2,9,24.00,1),
(5,3,2,12.00,1),
(6,4,4,18.50,1),
(7,5,10,4.10,1);
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `transaction_type` varchar(20) NOT NULL,
  `transaction_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL CHECK (`total_amount` >= 0),
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_transactions_contacts` (`contact_id`),
  CONSTRAINT `fk_transactions_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`) ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`transaction_type` in ('Purchase','Sale'))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `transactions` VALUES
(1,1,'Purchase','2026-04-10',31.70,'Initial stock purchase from local supplier'),
(2,3,'Purchase','2026-04-12',24.00,'Single high-value card purchase'),
(3,2,'Sale','2026-04-15',12.00,'Sold one foil copy'),
(4,4,'Sale','2026-04-18',18.50,'Trade fair weekend sale'),
(5,5,'Sale','2026-04-20',4.10,'Low-value single card sale');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-24 14:58:28
