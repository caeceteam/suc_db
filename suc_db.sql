CREATE DATABASE  IF NOT EXISTS `suc_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `suc_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: suc_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

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
-- Dumping data for table `assistant`
--

LOCK TABLES `assistant` WRITE;
/*!40000 ALTER TABLE `assistant` DISABLE KEYS */;
/*!40000 ALTER TABLE `assistant` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diner`
--

LOCK TABLES `diner` WRITE;
/*!40000 ALTER TABLE `diner` DISABLE KEYS */;
INSERT INTO `diner` VALUES (1,'FUNDACION OBRAS DE SAN JOSE',0,'Rincon',675,NULL,NULL,-34.6169,-58.3984,'1227','49429910',NULL,'http://obrasdesanjose.org.ar/','abarreza@mailinator.com'),(2,'PARROQUIA NUESTRA SEñORA DEL VALLE',0,'AV. CORDOBA',3329,NULL,NULL,-34.5977,-58.4158,'1187','49631454',NULL,'https://www.facebook.com/parroquiadelvalleOK/','ldemanuel@mailinator.com'),(3,'PARROQUIA SAN JOSE DE FLORES',0,'RAMON FALCON',2453,NULL,NULL,-34.6301,-58.4652,'1406','46122629',NULL,NULL,'pmaron@mailinator.com'),(4,'PARROQUIA SANTA CATALINA',0,'PIEDRAS',1527,NULL,NULL,-34.6264,-58.3783,'1140','43078211/9843',NULL,NULL,'imazzone@mailinator.com'),(5,'PARROQUIA STA. ISABEL DE HUNGRIA',0,'SAN JOSE DE CALASANZ',1059,NULL,NULL,-34.6316,-58.4389,'1424','4923-3101',NULL,NULL,'iverne@mailinator.com'),(6,'LA CASA DEL JUBILADO',0,'BESARES',3933,NULL,NULL,-34.5515,-58.4879,'1430','4541-7949',NULL,NULL,'rfigueroa@mailinator.com'),(7,'COMEDOR REY JESUS (IGLESIA BAUTISTA DEL CENTRO)',0,'SANTIAGO DEL ESTERO',975,NULL,NULL,-34.6194,-58.3868,'1075','4304-3646',NULL,NULL,'mdaza@mailinator.com'),(8,'ASOC CIVIL DAVID (EN HACCORE)',0,'ECHEANDIA',6041,NULL,NULL,-34.6696,-58.4913,'1439','4601-6283',NULL,NULL,'ameza@mailinator.com'),(9,'COMEDOR FRUTILLITAS',0,'EVA PERON',6378,NULL,NULL,-34.6674,-58.495,'1439','15-4060-8100',NULL,NULL,'sduarte@mailinator.com'),(10,'LA VOLUNTAD DEL CIELO',0,'EVA PERON',6600,NULL,NULL,-34.669,-58.4968,'1439','4686-0278',NULL,NULL,'sescalada@mailinator.com');
/*!40000 ALTER TABLE `diner` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `dinerassistant`
--

LOCK TABLES `dinerassistant` WRITE;
/*!40000 ALTER TABLE `dinerassistant` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinerassistant` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `dinerfood`
--

LOCK TABLES `dinerfood` WRITE;
/*!40000 ALTER TABLE `dinerfood` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinerfood` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `dinerinput`
--

LOCK TABLES `dinerinput` WRITE;
/*!40000 ALTER TABLE `dinerinput` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinerinput` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `dinerphoto_ibfk_1` FOREIGN KEY (`idDiner`) REFERENCES `diner` (`idDiner`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinerphoto`
--

LOCK TABLES `dinerphoto` WRITE;
/*!40000 ALTER TABLE `dinerphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinerphoto` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `dinerrequest`
--

LOCK TABLES `dinerrequest` WRITE;
/*!40000 ALTER TABLE `dinerrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinerrequest` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `donationitem`
--

LOCK TABLES `donationitem` WRITE;
/*!40000 ALTER TABLE `donationitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `donationitem` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `eventphoto`
--

LOCK TABLES `eventphoto` WRITE;
/*!40000 ALTER TABLE `eventphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventphoto` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtype`
--

LOCK TABLES `foodtype` WRITE;
/*!40000 ALTER TABLE `foodtype` DISABLE KEYS */;
INSERT INTO `foodtype` VALUES (1,'FT-HA','Harinas','Harinas',1,0,0),(2,'FT-SEC','Secos','Alimentos deshidratados',0,0,0),(3,'FT-FRU','Frutas','Frutas',1,0,0),(4,'FT-VER','Verduras','Verduras',1,0,0),(5,'FT-CAR','Carnes','Carnes',1,0,0),(6,'FT-LAC','Lacteos','Lacteos',1,0,0),(7,'FT-SEM','Semillas','Semillas',0,0,0),(8,'FT-BE','Bebidas','Bebidas',0,0,0);
/*!40000 ALTER TABLE `foodtype` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inputtype`
--

LOCK TABLES `inputtype` WRITE;
/*!40000 ALTER TABLE `inputtype` DISABLE KEYS */;
INSERT INTO `inputtype` VALUES (1,'IT-UT','Utiles','Utiles'),(2,'IT-SEM','Semillas','Semillas'),(3,'IT-MOB','Mobiliario','Muebles'),(4,'IT-LI','Libros','Libros'),(5,'IT-RO','Ropa','Ropa'),(6,'IT-JU','Juguetes','Juguetes'),(7,'IT-INS','Instrumentos de cocina','Instrumentos de cocina'),(8,'IT-INST','Instrumentos de musica','Instrumentos de musica');
/*!40000 ALTER TABLE `inputtype` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `alias` (`alias`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'ARACELI','BARREZA DE BAENNINGER','abarreza@mailinator.com','49429910','1960-10-01',1,'dmEuqaRlRinE6tTMBZFla8URXsAJxyTlB3j0HnNoJmw=','abarreza','',NULL,NULL,NULL,NULL),(6,'LYDIA','DEMANUEL','ldemanuel@mailinator.com','49631454','1962-08-02',1,'VhLbIq46u9Lk7UTJZ85xuYEWFh52/tv6j591BeGd5pU=','ldemanuel','',NULL,NULL,NULL,NULL),(7,'PABLO','MARONETTI','pmaron@mailinator.com','46122629','1970-11-14',1,'dBCDE0CxBR1XEkvlzNFIqKZBAEoQ68lDRZVd7taf5T0=','pmaron','',NULL,NULL,NULL,NULL),(8,'ISABEL','MAZZONE','imazzone@mailinator.com','43078211','1955-12-24',1,'jgHwvrekX2UVG5xopwNGhR5W8XbTcleKvYi9z7VfSJA=','imazzone','',NULL,NULL,NULL,NULL),(9,'INES','VERNENGO','iverne@mailinator.com','4923-3101','1956-01-13',1,'hK8L1G/w6zaabKL0/oya5lRGFKylQjS8ZIlD144stmA=','iverne','',NULL,NULL,NULL,NULL),(10,'RENE','FIGUEROA','rfigueroa@mailinator.com','4541-7949','1956-02-13',1,'ITI41hzBJrB77Oscd60UopwSWpC/N49PXtoQvV9cddU=','rfigueroa','',NULL,NULL,NULL,NULL),(11,'MARIO','DAZA SEJAS','mdaza@mailinator.com','4304-3646','1956-02-13',1,'MFCs8LldckIeQP78PPrTyfAyYb16LH8sp4sPOB6frjo=','mdaza','',NULL,NULL,NULL,NULL),(12,'ABEL','MEZA','ameza@mailinator.com','4601-6283','1956-04-23',1,'ktGL0rGwIP5nd5s5U7vZbbOxooDpx69YFNc51TO2cGk=','ameza','',NULL,NULL,NULL,NULL),(13,'SILVANA CARINA','DUARTE','sduarte@mailinator.com','15-4060-8100','1956-04-23',1,'/CBuPfXT8wpOWPgrWDD7KAykIPor7KGBTlBhuo1Frjs=','sduarte','',NULL,NULL,NULL,NULL),(14,'SIXTA CIELO','ESCALADA','sescalada@mailinator.com','4686-0278','1956-04-23',1,'JcPFYn9SVaLp5WCR5TaCCUk+NTkLF91egc0OCX+j8Kg=','sescalada','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `userdiner_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdiner`
--

LOCK TABLES `userdiner` WRITE;
/*!40000 ALTER TABLE `userdiner` DISABLE KEYS */;
INSERT INTO `userdiner` VALUES (1,5,0),(2,6,0),(3,7,0),(4,8,0),(5,9,0),(6,10,0),(7,11,0),(8,12,0),(9,13,0),(10,14,0);
/*!40000 ALTER TABLE `userdiner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-21 18:27:53
