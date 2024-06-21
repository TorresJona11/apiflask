-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: apiflask
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (2,'Jonathan vasquez','1234567890','jonathanrubenacp2015@gmail.com'),(3,'John Doe','1234567890','john.doe@example.com'),(4,'Jane Smith','0987654321','jane.smith@example.com'),(5,'Michael Johnson','2345678901','michael.johnson@example.com'),(6,'Emily Davis','3456789012','emily.davis@example.com'),(7,'Christopher Brown','4567890123','christopher.brown@example.com'),(8,'Amanda Wilson','5678901234','amanda.wilson@example.com'),(9,'Joshua Martinez','6789012345','joshua.martinez@example.com'),(10,'Olivia Anderson','7890123456','olivia.anderson@example.com'),(11,'Daniel Thomas','8901234567','daniel.thomas@example.com'),(12,'Sophia Taylor','9012345678','sophia.taylor@example.com'),(13,'David Moore','0123456789','david.moore@example.com'),(14,'Emma Jackson','1123456789','emma.jackson@example.com'),(15,'James White','2123456789','james.white@example.com'),(16,'Isabella Harris','3123456789','isabella.harris@example.com'),(17,'Benjamin Clark','4123456789','benjamin.clark@example.com'),(18,'Mia Lewis','5123456789','mia.lewis@example.com'),(19,'Alexander Lee','6123456789','alexander.lee@example.com'),(20,'Charlotte Walker','7123456789','charlotte.walker@example.com'),(21,'Matthew Hall','8123456789','matthew.hall@example.com'),(22,'Abigail Allen','9123456789','abigail.allen@example.com'),(23,'Joseph Young','1023456789','joseph.young@example.com'),(24,'Chloe Hernandez','2023456789','chloe.hernandez@example.com'),(25,'Samuel King','3023456789','samuel.king@example.com'),(26,'Avery Wright','4023456789','avery.wright@example.com'),(27,'Anthony Lopez','5023456789','anthony.lopez@example.com');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21  0:34:00
