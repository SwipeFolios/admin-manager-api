-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (arm64)
--
-- Host: localhost    Database: adminapi
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `employers`
--

DROP TABLE IF EXISTS `employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employers` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_user` varchar(255) NOT NULL,
  `employee_email` varchar(255) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employers`
--

LOCK TABLES `employers` WRITE;
/*!40000 ALTER TABLE `employers` DISABLE KEYS */;
INSERT INTO `employers` VALUES 
(5,'Sadra','mr.msa@notsafe.shop'),
(6,'Amir','osb0rn3@notsafe.shop');
/*!40000 ALTER TABLE `employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_ip` varchar(255) NOT NULL,
  `log_text` varchar(255) NOT NULL,
  `log_time` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES 
(5,'43.106.230.3','Signin to panel.','2022-08-05'),
(6,'43.106.230.3','Send request to see employers.','2022-08-05'),
(7,'43.106.230.3','Send request to see logs.','2022-08-05'),
(8,'43.106.230.3','Logout.','2022-08-05');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `task_deadline` varchar(255) NOT NULL,
  `task_authors` varchar(255) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES 
(8,'test','2022-08-09','[2]'),
(6,'Task 2','2022-09-07','[1]'),
(7,'test','2022-08-09','[2]'),
(9,'test','2022-08-09','[2]'),
(14,'hello','2022-09-02','[]');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES 
(1,'dbda81c9ae1a674d476b09b92862cee2'),
(2,'70d3639b5a5b095284aecac621a12a08'),
(3,'eb4329fc615856489dd1248e2855b48f'),
(4,'227adbf97c85f2d47a839398f5980591'),
(5,'02eef19a57d2910f30b3fba76d783a84'),
(6,'f648b07a5b1fe0ba895f9a5bbbd5091a'),
(7,'4451b08d66dc7fbd96892846f35d2773'),
(8,'d2a072db1ea0265ff3ac959a9c9f155f'),
(9,'7d6fee58215a4cdf9592ec5156bab8ee'),
(10,'dae7fb376a67c44c3013fd63998bc8b8'),
(11,'5b6a4693d100b1c77821e4fc43eaeb20'),
(12,'4c981bdca4f8e53224f3fee67626bf41'),
(13,'6bf99220c744edd6868e6795365b7410'),
(14,'846e933d7450beb0ce58e901f4cfe801'),
(15,'14afc6568d502971713e602e81d81b15'),
(16,'f9ce76c77e062431db070fb67190ca42'),
(17,'4e44fe3411b0920ddd52cc231c8b2484'),
(18,'2b7718a833fbfc3fc45a61c2037d9197'),
(19,'58159057f7a28ecf7a935cfbb68a8c3d'),
(20,'645644f9676b6be1dceea50d266bfd34'),
(21,'661d81df146a7a7d0c1be88f2965066e');


/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-27 16:21:17