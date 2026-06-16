-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: fuel_station
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerdetails` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `royaltyType` varchar(50) DEFAULT 'regular',
  PRIMARY KEY (`customerID`),
  KEY `userID` (`userID`),
  CONSTRAINT `customerdetails_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userdetails` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdetails`
--

LOCK TABLES `customerdetails` WRITE;
/*!40000 ALTER TABLE `customerdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empdetails`
--

DROP TABLE IF EXISTS `empdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empdetails` (
  `empID` int NOT NULL AUTO_INCREMENT,
  `empType` varchar(255) DEFAULT NULL,
  `userID` int NOT NULL,
  `mobileNum` int NOT NULL DEFAULT '0',
  `salary` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empID`),
  KEY `userID` (`userID`),
  CONSTRAINT `empdetails_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userdetails` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empdetails`
--

LOCK TABLES `empdetails` WRITE;
/*!40000 ALTER TABLE `empdetails` DISABLE KEYS */;
INSERT INTO `empdetails` VALUES (1,'admin',1,12345678,60000,'testAddress1'),(3,'fuelManager',3,123,60000,'test address'),(4,'serviceManager',2,123,50000,'test address');
/*!40000 ALTER TABLE `empdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuelinventory`
--

DROP TABLE IF EXISTS `fuelinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuelinventory` (
  `fuelID` int NOT NULL AUTO_INCREMENT,
  `fuelName` varchar(50) NOT NULL,
  `stockAmount` int NOT NULL,
  `pricePerUnit` decimal(10,2) NOT NULL,
  `lastUpdatedDate` varchar(50) NOT NULL,
  `fuelNumber` int NOT NULL,
  PRIMARY KEY (`fuelID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuelinventory`
--

LOCK TABLES `fuelinventory` WRITE;
/*!40000 ALTER TABLE `fuelinventory` DISABLE KEYS */;
INSERT INTO `fuelinventory` VALUES (1,'Petrol Octane 92	',12000,293.00,'2025-05-19',1),(2,'Petrol Octane 95	',15000,341.00,'2025-05-19',2),(3,'Lanka Auto Diesel	',2000,274.00,'2025-05-19',3),(4,'Lanka Super Diesel 4*	',1000,325.00,'2025-05-19',4),(5,'Kerosene',12000,178.00,'2025-05-19',5),(6,'Industrial Kerosene',1000,196.00,'2025-05-19',6);
/*!40000 ALTER TABLE `fuelinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanicdetails`
--

DROP TABLE IF EXISTS `mechanicdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mechanicdetails` (
  `mechanicID` int NOT NULL AUTO_INCREMENT,
  `mechanicName` varchar(100) NOT NULL,
  `mechanicContact` varchar(30) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  PRIMARY KEY (`mechanicID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanicdetails`
--

LOCK TABLES `mechanicdetails` WRITE;
/*!40000 ALTER TABLE `mechanicdetails` DISABLE KEYS */;
INSERT INTO `mechanicdetails` VALUES (1,'Mechanic 1','123','Mechanic 1','Mechanic 1'),(2,'Mechanic 2','123','Mechanic 2','Mechanic 2'),(3,'Mechanic 3','123','Mechanic 3','Mechanic 3'),(4,'Mechanic 4','123','Mechanic 4','Mechanic 4'),(5,'Mechanic 5','123','Mechanic 5','Mechanic 5');
/*!40000 ALTER TABLE `mechanicdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicebooking`
--

DROP TABLE IF EXISTS `servicebooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicebooking` (
  `bookingID` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(100) NOT NULL,
  `customerID` int NOT NULL,
  `contactNo` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `vehicleType` varchar(100) NOT NULL,
  `vehicleModel` varchar(100) NOT NULL,
  `numberPlate` varchar(100) NOT NULL,
  `service` varchar(100) NOT NULL,
  `pickup_Drop` varchar(100) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `lastServiceDate` varchar(45) DEFAULT NULL,
  `serviceDate` varchar(45) NOT NULL,
  `serviceTime` varchar(45) NOT NULL,
  `mechanicID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`bookingID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `servicebooking_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `userdetails` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicebooking`
--

LOCK TABLES `servicebooking` WRITE;
/*!40000 ALTER TABLE `servicebooking` DISABLE KEYS */;
INSERT INTO `servicebooking` VALUES (6,'test',4,'123','test@mail.com','car','test','test3','oil_change','yes','','2025-05-20','2025-05-20','07:21',3),(7,'test 5',10,'123','test@mail.com','car','test','test','','yes','','2025-05-20','','',2),(8,'test',4,'123','test@mail.com','car','test','test3','oil_change','no','','2025-05-20','2025-05-20','07:22',3);
/*!40000 ALTER TABLE `servicebooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceID` int NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(100) NOT NULL,
  `serviceType` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` varchar(30) NOT NULL,
  PRIMARY KEY (`serviceID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Car Wash','Cleaning','Test','123'),(2,'Battery Diagnostics','Diagnostics','test','30000'),(3,'Brake Pad Replacement','Repair','Brake Pad Replacement','40000'),(4,'Engine Health Check','Repair','Engine Health Check','20000'),(5,'Oil Change','Maintenance','Oil Change','20000');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdetails` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `userType` varchar(50) DEFAULT 'regular',
  `NIC` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails`
--

LOCK TABLES `userdetails` WRITE;
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT INTO `userdetails` VALUES (1,'admin1@gmail.com','admin1','Admin 1','admin1','employee','123v'),(2,'serviceManager1@gmail.com','serviceManager1','Service Manager 1','serviceManager1','employee','234v'),(3,'fuelManager1@gmail.com','fuelManager1','Fuel Manager 1','fuelManager1','employee','345v'),(4,'testUser1@gmail.com','testUser1','Test User 1','testUser1','regular','testUser1'),(5,'testUser2@gmail.com','testUser2','Test User 2','testUser2','youngDriver','testUser2'),(6,'testUser3@gmail.com','testUser3','Test User 3','testUser3','seniorServer','testUser3'),(7,'testUser4@gmail.com','testUser4','Test User 4','testUser4','youngDriver','testUser4'),(8,'testUser5@gmail.com','testUser5','Test User 5','testUser5','regular','testUser5'),(9,'fuelManager2@gmail.com','fuelManager2','Fuel Manager 2','fuelManager2','employee','fuelManager2'),(10,'testUser6@gmail.com','testUser6','test user 6','testUser6','regular','testUser6');
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `VehicleID` int NOT NULL AUTO_INCREMENT,
  `Owner_name` varchar(45) NOT NULL,
  `vType` varchar(45) NOT NULL,
  `Reg_num` varchar(45) NOT NULL,
  `Chassis` varchar(45) NOT NULL,
  `engine` varchar(45) NOT NULL,
  `fType` varchar(45) NOT NULL,
  `year` varchar(45) NOT NULL,
  `make` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `userID` int NOT NULL,
  PRIMARY KEY (`VehicleID`),
  UNIQUE KEY `Reg_num` (`Reg_num`),
  UNIQUE KEY `Chassis` (`Chassis`),
  UNIQUE KEY `engine` (`engine`),
  KEY `userID` (`userID`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userdetails` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
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

-- Dump completed on 2025-05-20  7:31:34
