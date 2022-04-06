-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Vehicle_Showroom
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(50) DEFAULT NULL,
  `Age` int(11) NOT NULL,
  `Customer_Email` varchar(50) DEFAULT NULL,
  `Phone_No` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Customer_Email` (`Customer_Email`),
  UNIQUE KEY `Phone_No` (`Phone_No`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Raju_Sharma',21,'rajusharma01@gmail.com',88481731),(2,'Sumiran_Dahal',23,'sumirandahal02@gmail.com',88471341),(3,'Binod_Adhikari',25,'binodadhikari03@gmail.com',88371431),(4,'Prakriti_Adhikari',22,'prakritiadhikari04@gmail.com',88491537),(5,'Dipen_Budhathoki',26,'dipenbudhathoki05@gmail.com',88481734);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealer`
--

DROP TABLE IF EXISTS `dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer` (
  `DealerID` varchar(50) NOT NULL,
  `Dealer_Name` varchar(50) DEFAULT NULL,
  `Dealer_Address` varchar(50) DEFAULT NULL,
  `Dealer_Phone` int(11) DEFAULT NULL,
  `ManagerID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DealerID`),
  UNIQUE KEY `Dealer_Phone` (`Dealer_Phone`),
  KEY `ManagerID` (`ManagerID`),
  CONSTRAINT `dealer_ibfk_1` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer`
--

LOCK TABLES `dealer` WRITE;
/*!40000 ALTER TABLE `dealer` DISABLE KEYS */;
INSERT INTO `dealer` VALUES ('D1','Pratik_Dhungel','Kathmandu',8848546,'M1'),('D2','Prasanna_Subedi','Lalitpur',8847654,'M2'),('D3','Regan_Poudel','Bhaktapur',8857653,'M3'),('D4','Sailesh_Dahal','Dhulikhel',8867456,'M4'),('D5','Rajat_Sharma','Jhapa',8878435,'M5');
/*!40000 ALTER TABLE `dealer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `ManagerID` varchar(50) NOT NULL,
  `Manager_Name` varchar(50) DEFAULT NULL,
  `Manager_Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ManagerID`),
  UNIQUE KEY `Manager_Email` (`Manager_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('M1','Keshab_Budhathoki','keshabbudhathoki@gmail.com'),('M2','Girish_Dangal','girishdangal@gmail.com'),('M3','Meghraj_Adhikari','meghrajadhikari@gmail.com'),('M4','Prakash_Subedi','prakashsubedi@gmail.com'),('M5','Lekhnath_Khatiwada','lekhnathkhatiwada@gmail.com');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptionist` (
  `ReceptionistID` varchar(50) NOT NULL,
  `Receptionist_Name` varchar(50) DEFAULT NULL,
  `Receptionist_Email` varchar(50) DEFAULT NULL,
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ReceptionistID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
INSERT INTO `receptionist` VALUES ('R1','Ranjana_Kafle','ranjanakafle@gmail.com',1),('R2','Samiksha_Karki','samikshakarki@gmail.com',2),('R3','Barsha_Subedi','barshasubedi@gmail.com',3),('R4','Rejina_Dhakal','rejinadhakal@gmail.com',4),('R5','Biplove_Nepal','biplovenepal@gmail.com',5);
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesman` (
  `SalesmanID` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone_No` int(11) DEFAULT NULL,
  `VehicleID` varchar(50) DEFAULT NULL,
  `DealerID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SalesmanID`),
  UNIQUE KEY `Phone_No` (`Phone_No`),
  KEY `VehicleID` (`VehicleID`),
  KEY `DealerID` (`DealerID`),
  CONSTRAINT `salesman_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`),
  CONSTRAINT `salesman_ibfk_2` FOREIGN KEY (`DealerID`) REFERENCES `dealer` (`DealerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO `salesman` VALUES ('S1','Rahul_Sharma','Jhapa',8714350,'V1','D1'),('S2','Suman_Subedi','Morang',8654300,'V2','D2'),('S3','Manish_Adhikari','Pokhara',8634561,'V3','D3'),('S4','Nimesh_Khatiwada','Kathmandu',8934231,'V4','D4'),('S5','Biplop_Giri','Illam',8432561,'V5','D5');
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `VehicleID` varchar(50) NOT NULL,
  `Vehicle_Name` varchar(50) DEFAULT NULL,
  `Mileage` int(11) DEFAULT NULL,
  `Manufacture_Company` varchar(50) DEFAULT NULL,
  `Manufactured_Date` date DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`VehicleID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('V1','Honda_Shine',55,'Honda','2019-05-14','Bike',1),('V2','Pulsar_150',50,'Bajaj','2020-01-10','Bike',2),('V3','Ford_Figo',19,'Ford','2020-02-16','Car',3),('V4','Datsun_Redigo',22,'Datsun','2020-06-17','Car',4),('V5','Nissan_Magnite',20,'Nissan','2021-03-15','Car',5);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26  2:29:20
