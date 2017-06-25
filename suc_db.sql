-- create database suc_db

-- MySQL Script generated by MySQL Workbench
-- Sun Jun 11 19:41:20 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Suc_DB
-- -----------------------------------------------------
SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Province`
-- -----------------------------------------------------
 drop table province;

-- CREATE TABLE IF NOT EXISTS `Province` (
--     `idProvince` INT NOT NULL AUTO_INCREMENT,
--     `country` 	 VARCHAR(20) NULL DEFAULT 'Argentina',
--    `name` 		 VARCHAR(20) NULL,
--     PRIMARY KEY (`idProvince`))  
-- ENGINE=INNODB;

-- SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `City`
-- -----------------------------------------------------
drop table city;

-- CREATE TABLE IF NOT EXISTS `City` (
--    `idCity` 	 INT NOT NULL AUTO_INCREMENT,
--    `idProvince` INT NULL,
--    `name` 		 VARCHAR(50) NULL,
--    PRIMARY KEY (`idCity`),
--   FOREIGN KEY (idProvince) REFERENCES province (idProvince),
--    INDEX `idProvince_idx` (`idProvince` ASC))  
-- ENGINE=INNODB;

-- SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
-- drop table user; 

CREATE TABLE IF NOT EXISTS `User` (
  `idUser` 	 	 CHAR(50)    NOT NULL,
  `name` 	 	 VARCHAR(50) NOT NULL,
  `surname`  	 VARCHAR(50) NOT NULL,
  `mail` 	 	 VARCHAR(50) NULL,
  `phone` 	 	 VARCHAR(20) NULL,
  `state` 	 	 INT NULL,
  `bornDate` 	 DATE NULL,
  `role` 	 	 INT NULL,
  `pass` 	 	 VARCHAR(64) NULL,
  `docNum` 	 	 VARCHAR(13) NULL,
  `street` 	 	 VARCHAR(50) NULL,
  `streetNumber` INT NULL,
  `floor` 	 	 VARCHAR(10) NULL,
  `door` 	 	 VARCHAR(20) NULL,
-- `idCity` 	 	 INT NULL,
  PRIMARY KEY (`idUser`))
--  foreign key (idCity) references city (idCity),  
--  INDEX `idCity_idx` (`idCity` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Notification`
-- -----------------------------------------------------
-- drop table notification;

CREATE TABLE IF NOT EXISTS `Notification` (
  `idNotification` 	 	CHAR(50) NOT NULL,
  `notificationType` 	INT NULL,
  `notificationStatus`  INT NULL,
  `title` 			    VARCHAR(50) NULL,
  `description` 		LONGTEXT NULL,
  `idUser` 			    CHAR(50) NULL,
  PRIMARY KEY (`idNotification`),
  foreign key (idUser) references user (idUser),
  INDEX `idUser_idx` (`idUser` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Diner`
-- -----------------------------------------------------
-- Drop table diner;

CREATE TABLE IF NOT EXISTS `Diner` (
  `idDiner` 		CHAR(50) NOT NULL,
  `name` 			VARCHAR(80) NULL,
  `state` 		  	INT NULL,
  `street` 			VARCHAR(50) NULL,
  `streetNumber` 	INT NULL,
  `floor` 			VARCHAR(10) NULL,
  `door` 			VARCHAR(20) NULL,
  `latitude` 		FLOAT NULL,
  `longitude` 		FLOAT NULL,
  `zipCode` 		VARCHAR(5) NULL,
  `phone` 			VARCHAR(20) NULL,
  `description` 	LONGTEXT NULL,
  `link` 			VARCHAR(100) NULL,
  `mail` 			VARCHAR(50) NULL,
--  `idCity` 			INT NULL,
  PRIMARY KEY (`idDiner`))
 -- foreign key (idCity) references 
 -- (idCity), 
--  INDEX `idCity_idx` (`idCity` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Donation`
-- -----------------------------------------------------
-- drop table donation;

CREATE TABLE IF NOT EXISTS `Donation` (
  `idDonation` 		INT NOT NULL auto_increment,
  `idSender` 		CHAR(50) NULL COMMENT 'Colaborador que realiza un donación',
  `idReciever` 		CHAR(50) NULL,
  `title` 			CHAR(50) NULL,
  `description` 	LONGTEXT NULL,
  `startDate` 		DATE NULL,
  `endDate` 		DATE NULL,
  PRIMARY KEY (`idDonation`),
  FOREIGN KEY (idSender) 	REFERENCES User  (idUser),
  FOREIGN KEY (idReciever) 	REFERENCES Diner (idDiner),
  INDEX `idSender_idx` (`idSender`),
  INDEX `idReciever_idx` (`idReciever`))   	
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DonationItem`
-- -----------------------------------------------------
-- drop table donationitem; 

CREATE TABLE IF NOT EXISTS `DonationItem` (
  `idDonation` 	int NOT NULL,
  `item` 		INT NOT NULL,
  `inputType` 	INT NULL,
  `foodType` 	INT NULL,
  `quantity` 	FLOAT NOT NULL,
  `unit` 		CHAR(5) NOT NULL,
  PRIMARY KEY (`idDonation`, `item`),
  foreign key (idDonation) references Donation (idDonation) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Assistant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Assistant` (
  `idAssistant`   	  CHAR(50) NOT NULL,
  `name` 		  	  VARCHAR(50) NOT NULL,
  `surname` 	  	  VARCHAR(50) NOT NULL,
  `bornDate` 	  	  DATE NOT NULL,
  `street` 		  	  VARCHAR(50) NULL,
  `streetNumber`  	  INT NULL,
  `floor` 		  	  VARCHAR(10) NULL,
  `door` 		  	  VARCHAR(20) NULL,
  `zipCode` 	  	  CHAR(5) NULL,
--  `idCity` 		  	  INT NOT NULL,
  `state` 		  	  INT NULL,
  `phone` 		  	  VARCHAR(20) NULL,
  `contactName`   	  VARCHAR(50) NULL,
  `scholarship`   	  VARCHAR(50) NULL,
  `eatAtOwnHouse` 	  bool NULL,
  `economicSituation` VARCHAR(80) NULL,
  `celiac` 			  bool NULL default false,
  `diabetic` 		  bool NULL default false,
  `document` 		  VARCHAR(13) NULL,
  PRIMARY KEY (`idAssistant`))
--  foreign key (idCity) references city (idCity),
--  INDEX `idCity_idx` (`idCity` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Family`
-- -----------------------------------------------------
-- drop table family;

CREATE TABLE IF NOT EXISTS `Family` (
  `idFamily` 	INT NOT NULL auto_increment,
  `idAssistant` CHAR(50) NOT NULL,
  `Description` VARCHAR(100) NULL,
  PRIMARY KEY (`idFamily`, `idAssistant`),
  foreign key (idAssistant) references Assistant (idAssistant))
ENGINE = InnoDB;

SHOW WARNINGS;


-- -----------------------------------------------------
-- Table `Photo`
-- -----------------------------------------------------
-- drop table Photo;

CREATE TABLE IF NOT EXISTS `Photo` (
  `idDiner` Char(50) NOT NULL,
  `idPhoto` INT NOT NULL,
  `url` 	LONGTEXT NULL,
  PRIMARY KEY (`idPhoto`, `idDiner`),
  foreign key (idDiner) references diner (idDiner),
  INDEX `idDiner_idx` (`idDiner` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Event`
-- -----------------------------------------------------
-- drop table Event;

CREATE TABLE IF NOT EXISTS `Event` (
  `idEvent` 	 char(50) NOT NULL,
  `name` 		 varchar(50) NOT NULL,
  `street` 		 varchar(50) NULL,
  `streetNumber` INT NULL,
  `floor` 		 varchar(10) NULL,
  `door` 		 varchar(20) NULL,
  `zipCode` 	 CHAR(5) NULL,
--  `idCity` 		 INT NULL,
  `phone` 		 varchar(20) NULL,
  `date` 		 DATE NOT NULL,
  `link` 		 varchar(100) NULL,
  `description`  LONGTEXT  NOT NULL,
  `idDiner` 	 CHAR(50)  NOT NULL,
  PRIMARY KEY (`idEvent`),
  foreign key (idDiner) references diner (idDiner))
--  foreign key (idCity)  references city  (idCity),
--  INDEX `idDiner_idx` (`idDiner` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `FoodType`
-- -----------------------------------------------------
-- drop table FoodType;

CREATE TABLE IF NOT EXISTS `FoodType` (
  `idFoodType`  INT NOT NULL auto_increment,
  `code` 	    CHAR(10) NULL,
  `name`  	    VARCHAR(50) NULL,
  `description` LONGTEXT NULL,
  `perishable`  bool NULL default false,
  `celiac`      bool NULL default false,
  `diabetic`    bool NULL default false,
  PRIMARY KEY (`idFoodType`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DinerFood`
-- -----------------------------------------------------
-- drop table DinerFood;

CREATE TABLE IF NOT EXISTS `DinerFood` (
  `idDinerFood`    INT NOT NULL auto_increment,
  `creationDate`   DATE NOT NULL,
  `idDiner` 	   CHAR(50) NOT NULL,
  `idFoodType`     INT NULL,
  `name` 		   VARCHAR(50) NULL,
  `description`    LONGTEXT NULL,
  `quantity` 	   FLOAT NULL,
  `init` 		   CHAR(5) NULL,
  `endingDate` 	   DATE NULL,
  `expirationDate` DATE NULL,
  PRIMARY KEY (`idDinerFood`),
  foreign key (idDiner)    references diner    (idDiner),
  foreign key (idFoodType) references FoodType (idFoodType),  
  INDEX `idFoocdType_idx` (`idFoodType` ASC),
  INDEX `idDiner_idx` (`idDiner` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DinerRequest`
-- -----------------------------------------------------
-- drop table DinerRequest;

CREATE TABLE IF NOT EXISTS `DinerRequest` (
  `idDinerRequest`  CHAR(50) 	NOT NULL,
  `idDiner` 		CHAR(50) 	NOT NULL,
  `title` 			VARCHAR(50) NOT NULL,
  `description` 	LONGTEXT 	NOT NULL,
  `startDate` 		DATE 		NOT NULL ,
  `endDate` 		DATE 		NOT NULL,
  PRIMARY KEY (`idDinerRequest`),
  foreign key (idDiner) references diner (idDiner),
  INDEX `idDiner_idx` (`idDiner` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DinerRequestStatus`
-- -----------------------------------------------------
-- drop table DinerRequestStatus;

CREATE TABLE IF NOT EXISTS `DinerRequestStatus` (
    `idRequest` 	CHAR(50) NOT NULL,
    `idReceiver` 	CHAR(50) NOT NULL,
    `status`  	 	INT NULL,
    PRIMARY KEY (`idRequest` , `idReceiver`),
    FOREIGN KEY (idRequest)  REFERENCES DinerRequest (idDinerRequest),
    FOREIGN KEY (idReceiver) REFERENCES user (idUser),
    INDEX `idDinerRequest_idx` (`idRequest` ASC),
    INDEX `idReciver_idx` (`idReceiver` ASC)
)  ENGINE=INNODB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `UserDiner`
-- -----------------------------------------------------
-- drop table UserDiner;

CREATE TABLE IF NOT EXISTS `UserDiner` (
    `idDiner` 	CHAR(50) NOT NULL,
    `idUser` 	CHAR(50) NOT NULL,
    `active` 	BOOL NULL DEFAULT false,
    PRIMARY KEY (`idDiner` , `idUser`),
    FOREIGN KEY (idDiner) REFERENCES Diner (idDiner),
    FOREIGN KEY (idUser)  REFERENCES User  (idUser))
ENGINE=INNODB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DinerAssistant`
-- -----------------------------------------------------
-- drop table DinerAssistant;

CREATE TABLE IF NOT EXISTS `DinerAssistant` (
  `idDiner` 	CHAR(50) NOT NULL,
  `idAssistant` CHAR(50) NOT NULL,
  `active` 		bool default false,
  PRIMARY KEY (`idDiner`, `idAssistant`),
  foreign key (idDiner)     references Diner     (idDiner),
  foreign key (idAssistant) references Assistant (idAssistant),
  INDEX `idAssistant_idx` (`idAssistant` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EventPhoto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EventPhoto` (
    `idEvent` CHAR(50) NOT NULL,
    `idPhoto` INT NOT NULL,
    PRIMARY KEY (`idEvent` , `idPhoto`),
    FOREIGN KEY (idEvent) REFERENCES `event` (idEvent),
    FOREIGN KEY (idPhoto) REFERENCES photo (idPhoto),
    INDEX `idPhoto_idx` (`idPhoto` ASC)
)  ENGINE=INNODB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `InputType`
-- -----------------------------------------------------
-- drop table InputType;

CREATE TABLE IF NOT EXISTS `InputType` (
  `idInputType`  INT NOT NULL auto_increment,
  `code` 	     CHAR(10) NULL,
  `name`  	     VARCHAR(50) NULL,
  `description`  LONGTEXT NULL,
  PRIMARY KEY (`idInputType`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
