-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: 14schema
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('adminUser1','adminPassWord!');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `endUsers`
--

DROP TABLE IF EXISTS `endUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endUsers` (
  `email` varchar(100) NOT NULL,
  `userID` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `idx_endUsers_userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endUsers`
--

LOCK TABLES `endUsers` WRITE;
/*!40000 ALTER TABLE `endUsers` DISABLE KEYS */;
INSERT INTO `endUsers` VALUES ('jawad','123yh','ggg'),('jawadjamal311@gmail.com','jawad311','12345'),('Jhabduom','ghh','ggg'),('testUser1','testUser1','testPassword');
/*!40000 ALTER TABLE `endUsers` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `clothing`
--

DROP TABLE IF EXISTS `clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing` (
  `itemID` int NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `size` varchar(30) DEFAULT NULL,
  `style` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  UNIQUE KEY `idx_clothing_itemID` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing`
--

LOCK TABLES `clothing` WRITE;
/*!40000 ALTER TABLE `clothing` DISABLE KEYS */;
INSERT INTO `clothing` VALUES (-2066274217,'Hat','nike','small','slimFit','black'),(-1964153035,'Shirt','puma','large','wide','brown'),(-1911093987,'Hat','nike','small','slimFit','black'),(-1910914602,'Shoe','adidas','large','short','blue'),(-1442774572,'Hat','underArmor','small','slimFit','black'),(-1060396637,'Shoe','puma','large','wide','brown'),(-591610510,'Shoe','nike','small','slimFit','black'),(-106274294,'Shoe','puma','small','slimFit','black'),(88686168,'Shirt','underArmor','extraLarge','short','blue'),(317885917,'Shoe','nike','small','slimFit','black'),(434498392,'Hat','underArmor','extraLarge','wide','white'),(471274652,'Hat','nike','small','slimFit','black'),(709287400,'Hat','nike','small','slimFit','black'),(757498559,'Shoe','adidas','extraLarge','slimFit','black'),(937773540,'Hat','nike','small','slimFit','black'),(1014070956,'Shirt','underArmor','extraLarge','short','blue'),(1310051555,'Shirt','puma','large','slimFit','white'),(1503965368,'Shoe','nike','small','slimFit','black'),(1813338527,'Hat','nike','small','slimFit','black'),(1948908767,'Shoe','adidas','small','slimFit','blue'),(2054048145,'Shoe','nike','small','slimFit','black'),(2074029325,'Hat','nike','small','slimFit','black');
/*!40000 ALTER TABLE `clothing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions`
--

DROP TABLE IF EXISTS `auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions` (
  `aucID` int NOT NULL,
  `userID` varchar(30) DEFAULT NULL,
  `closeDateTime` datetime DEFAULT NULL,
  `secretMin` int DEFAULT NULL,
  `itemID` int DEFAULT NULL,
  `currMaxBid` int DEFAULT NULL,
  PRIMARY KEY (`aucID`),
  UNIQUE KEY `idx_auctions_aucID` (`aucID`),
  KEY `auctions_ibfk_1` (`userID`),
  KEY `auctions_ibfk_2` (`itemID`),
  CONSTRAINT `auctions_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `endUsers` (`userID`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `auctions_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `clothing` (`itemID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions`
--

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;
INSERT INTO `auctions` VALUES (-1819823189,'jawad311','2022-04-23 19:34:00',NULL,NULL,NULL),(-1483829706,'jawad311','2022-04-23 19:34:00',NULL,NULL,NULL),(-1464613124,'123yh','2022-04-30 16:32:00',3,2054048145,22),(-1037506744,'jawad311','2022-04-30 15:26:00',5,88686168,74),(-995239534,'testUser1','2022-05-07 16:09:00',56,-1964153035,134),(-958036972,'jawad311','2022-06-30 16:09:00',2,2074029325,113),(-892681707,'jawad311','2022-05-07 23:07:00',444,NULL,NULL),(-860938973,'jawad311','2022-04-23 23:06:00',5,NULL,NULL),(-655081977,'jawad311','2022-04-16 23:30:00',840,434498392,NULL),(-599444719,'jawad311','2022-03-29 17:40:00',2,1813338527,136),(-597686828,'jawad311','2022-04-23 23:41:00',56,937773540,NULL),(-522183271,'123yh','2022-04-30 16:44:00',3,1310051555,957),(-455061862,'jawad311','2022-04-15 23:16:00',66,NULL,NULL),(-239318041,'jawad311','2022-06-04 23:22:00',15,-1910914602,NULL),(184529511,'jawad311','2022-04-30 15:41:00',5,-1060396637,81),(366989549,'jawad311','2022-12-20 17:21:00',1,-591610510,5),(615865936,'jawad311','2022-05-06 16:06:00',4,1948908767,13),(657620590,'jawad311','2022-04-23 23:03:00',2828,NULL,NULL),(722410847,'jawad311','2022-04-15 23:18:00',1,NULL,NULL),(749709123,'jawad311','2022-04-16 23:13:00',555,NULL,NULL),(755624883,'jawad311','2022-07-09 16:13:00',1,317885917,99),(861830763,'jawad311','2022-05-31 15:56:00',1,757498559,208),(881650025,'jawad311','2022-05-07 15:47:00',1,-1442774572,339),(955750802,'jawad311','2022-05-05 23:42:00',45,709287400,221),(1067261036,'jawad311','2022-05-07 16:04:00',1,-106274294,9498),(1387819521,'jawad311','2022-04-23 23:41:00',56,471274652,NULL),(1499754448,'jawad311','2022-04-14 12:45:00',1,-1911093987,4),(1654825518,'jawad311','2022-09-10 17:10:00',1,1503965368,14),(1710033873,'jawad311','2022-04-22 16:40:00',1,-2066274217,632);
/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `bidID` int NOT NULL,
  `aucID` int DEFAULT NULL,
  `userID` varchar(30) DEFAULT NULL,
  `upperLim` int DEFAULT NULL,
  `increment` int DEFAULT NULL,
  `bidAmt` int DEFAULT NULL,
  `boolVal` tinyint DEFAULT NULL,
  PRIMARY KEY (`bidID`),
  KEY `aucID` (`aucID`),
  KEY `userID` (`userID`),
  CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`aucID`) REFERENCES `auctions` (`aucID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (-844859143,-995239534,'testUser1',200,56,134,0),(827235791,-995239534,'testUser1',0,0,78,1),(1001896275,-995239534,'testUser1',200,56,76,1);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `customerReps`
--

DROP TABLE IF EXISTS `customerReps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerReps` (
  `repID` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`repID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerReps`
--

LOCK TABLES `customerReps` WRITE;
/*!40000 ALTER TABLE `customerReps` DISABLE KEYS */;
INSERT INTO `customerReps` VALUES ("rep1","rep");
/*!40000 ALTER TABLE `customerReps` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `MessageBoard`
--

DROP TABLE IF EXISTS `MessageBoard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MessageBoard` (
  `MessageID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(30) NOT NULL,
  `TimeStamp` date DEFAULT NULL,
  `Message` varchar(255) NOT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MessageBoard`
--

LOCK TABLES `MessageBoard` WRITE;
/*!40000 ALTER TABLE `MessageBoard` DISABLE KEYS */;
INSERT INTO `MessageBoard` VALUES (1,'User1','2022-04-23','hello i am having trouble logining in'),(2,'User2','2022-04-23','Chat');
/*!40000 ALTER TABLE `MessageBoard` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `customerReps`
--

DROP TABLE IF EXISTS `MessageBoardReplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MessageBoardReplies` (
  `MessageIDReply` int NOT NULL AUTO_INCREMENT,
  `repID` varchar(30) NOT NULL,
  `TimeStamp` date DEFAULT NULL,
  `MessageReply` varchar(255) NOT NULL,
  `OriginalQuestionID` int NOT NULL,
  PRIMARY KEY (`MessageIDReply`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerReps`
--

LOCK TABLES `MessageBoardReplies` WRITE;
/*!40000 ALTER TABLE `MessageBoardReplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `MessageBoardReplies` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-23 16:16:53
