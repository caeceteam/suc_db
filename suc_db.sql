CREATE DATABASE  IF NOT EXISTS `suc_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `suc_db`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: suc_db
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assistant`
--

DROP TABLE IF EXISTS `assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assistant` (
  `idAssistant` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `bornDate` date NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `streetNumber` int(11) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(20) DEFAULT NULL,
  `zipCode` char(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `contactName` varchar(50) DEFAULT NULL,
  `scholarship` varchar(50) DEFAULT NULL,
  `eatAtOwnHouse` tinyint(1) DEFAULT NULL,
  `economicSituation` varchar(80) DEFAULT NULL,
  `celiac` tinyint(1) DEFAULT '0',
  `diabetic` tinyint(1) DEFAULT '0',
  `document` varchar(13) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`idAssistant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diner`
--

DROP TABLE IF EXISTS `diner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diner` (
  `idDiner` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `state` int(11) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `streetNumber` int(11) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(20) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `zipCode` varchar(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `description` longtext,
  `link` varchar(100) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`idDiner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dinerassistant`
--

DROP TABLE IF EXISTS `dinerassistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dinerassistant` (
  `idDiner` bigint(32) NOT NULL,
  `idAssistant` bigint(32) NOT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idDiner`,`idAssistant`),
  KEY `idAssistant_idx` (`idAssistant`),
  CONSTRAINT `dinerassistant_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`),
  CONSTRAINT `dinerassistant_ibfk_2` FOREIGN KEY (`idAssistant`) REFERENCES `assistant` (`idAssistant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dinerfood`
--

DROP TABLE IF EXISTS `dinerfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dinerfood` (
  `idDinerFood` bigint(32) NOT NULL AUTO_INCREMENT,
  `creationDate` date NOT NULL,
  `idDiner` bigint(32) NOT NULL,
  `idFoodType` bigint(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  `quantity` float DEFAULT NULL,
  `unity` varchar(5) DEFAULT NULL,
  `endingDate` date DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  PRIMARY KEY (`idDinerFood`),
  KEY `idFoodType_idx` (`idFoodType`),
  KEY `idDiner_idx` (`idDiner`),
  CONSTRAINT `dinerfood_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`),
  CONSTRAINT `dinerfood_ibfk_2` FOREIGN KEY (`idFoodType`) REFERENCES `foodtype` (`idFoodType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dinerinput`
--

DROP TABLE IF EXISTS `dinerinput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dinerinput` (
  `idDinerInput` bigint(32) NOT NULL AUTO_INCREMENT,
  `idDiner` bigint(32) NOT NULL,
  `idInputType` bigint(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `genderType` char(1) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`idDinerInput`),
  KEY `idInputType_idx` (`idInputType`),
  KEY `idDiner_idx` (`idDiner`),
  CONSTRAINT `dinerinput_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`),
  CONSTRAINT `dinerinput_ibfk_2` FOREIGN KEY (`idInputType`) REFERENCES `inputtype` (`idInputType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dinerphoto`
--

DROP TABLE IF EXISTS `dinerphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dinerphoto` (
  `idDiner` bigint(32) NOT NULL,
  `idPhoto` bigint(32) NOT NULL AUTO_INCREMENT,
  `url` longtext NOT NULL,
  PRIMARY KEY (`idPhoto`,`idDiner`),
  KEY `idDiner_idx` (`idDiner`),
  CONSTRAINT `dinerphoto_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dinerrequest`
--

DROP TABLE IF EXISTS `dinerrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dinerrequest` (
  `idDinerRequest` bigint(32) NOT NULL AUTO_INCREMENT,
  `idDiner` bigint(32) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `creationDate` date NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`idDinerRequest`),
  KEY `idDiner_idx` (`idDiner`),
  CONSTRAINT `dinerrequest_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donation` (
  `idDonation` bigint(32) NOT NULL AUTO_INCREMENT,
  `idUserSender` bigint(32) NOT NULL COMMENT 'Colaborador que realiza un donación',
  `idDinerReceiver` bigint(32) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext,
  `creationDate` datetime DEFAULT NULL,
  `status` int(3) NOT NULL,
  PRIMARY KEY (`idDonation`),
  KEY `idUserSender_idx` (`idUserSender`),
  KEY `idDinerReceiver_idx` (`idDinerReceiver`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`idUserSender`) REFERENCES `user` (`idUser`),
  CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`idDinerReceiver`) REFERENCES `diner` (`idDiner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donationitem`
--

DROP TABLE IF EXISTS `donationitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donationitem` (
  `idDonationItem` bigint(32) NOT NULL AUTO_INCREMENT,
  `idDonation` bigint(32) NOT NULL,
  `inputType` int(11) DEFAULT NULL,
  `foodType` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit` char(5) DEFAULT NULL,
  `description` varchar(80) NOT NULL,
  PRIMARY KEY (`idDonationItem`,`idDonation`),
  KEY `idDonation` (`idDonation`),
  CONSTRAINT `donationitem_ibfk_1` FOREIGN KEY (`idDonation`) REFERENCES `donation` (`idDonation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `idEvent` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `streetNumber` int(11) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(20) DEFAULT NULL,
  `zipCode` char(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `link` longtext,
  `description` longtext NOT NULL,
  `idDiner` bigint(32) NOT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `idDiner` (`idDiner`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventphoto`
--

DROP TABLE IF EXISTS `eventphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventphoto` (
  `idEvent` bigint(32) NOT NULL,
  `idPhoto` bigint(32) NOT NULL AUTO_INCREMENT,
  `url` longtext NOT NULL,
  PRIMARY KEY (`idEvent`,`idPhoto`),
  KEY `idPhoto_idx` (`idPhoto`),
  CONSTRAINT `eventphoto_ibfk_1` FOREIGN KEY (`idEvent`) REFERENCES `event` (`idEvent`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family` (
  `idFamily` bigint(32) NOT NULL AUTO_INCREMENT,
  `idAssistant` bigint(32) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idFamily`,`idAssistant`),
  KEY `idAssistant` (`idAssistant`),
  CONSTRAINT `family_ibfk_1` FOREIGN KEY (`idAssistant`) REFERENCES `assistant` (`idAssistant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foodtype`
--

DROP TABLE IF EXISTS `foodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodtype` (
  `idFoodType` bigint(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `perishable` tinyint(1) NOT NULL DEFAULT '0',
  `celiac` tinyint(1) NOT NULL DEFAULT '0',
  `diabetic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFoodType`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inputtype`
--

DROP TABLE IF EXISTS `inputtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inputtype` (
  `idInputType` bigint(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`idInputType`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `idNotification` bigint(32) NOT NULL AUTO_INCREMENT,
  `notificationType` int(11) NOT NULL,
  `notificationStatus` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext,
  `idUser` bigint(32) NOT NULL,
  PRIMARY KEY (`idNotification`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `bornDate` date DEFAULT NULL,
  `role` int(11) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `docNum` varchar(13) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `streetNumber` int(11) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userdiner`
--

DROP TABLE IF EXISTS `userdiner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdiner` (
  `idDiner` bigint(32) NOT NULL,
  `idUser` bigint(32) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idDiner`,`idUser`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `userdiner_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`),
  CONSTRAINT `userdiner_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-14 15:26:21
