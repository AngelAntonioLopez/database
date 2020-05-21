CREATE DATABASE  IF NOT EXISTS `mi_minimarket_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mi_minimarket_db`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mi_minimarket_db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `address_db`
--

DROP TABLE IF EXISTS `address_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_db` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `calle_address` varchar(45) NOT NULL,
  `casa_address` varchar(45) NOT NULL,
  `lugar_address` varchar(45) NOT NULL,
  `ubicacion_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_db`
--

LOCK TABLES `address_db` WRITE;
/*!40000 ALTER TABLE `address_db` DISABLE KEYS */;
INSERT INTO `address_db` VALUES (1,'3° Calle oriente','2-4A','Lourdes Colón',NULL);
/*!40000 ALTER TABLE `address_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_db`
--

DROP TABLE IF EXISTS `bill_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_db` (
  `idbill_db` int(11) NOT NULL AUTO_INCREMENT,
  `bill_client` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_dbcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idbill_db`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_db`
--

LOCK TABLES `bill_db` WRITE;
/*!40000 ALTER TABLE `bill_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_details_db`
--

DROP TABLE IF EXISTS `bill_details_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_details_db` (
  `id_details` int(11) NOT NULL AUTO_INCREMENT,
  `details_bill` int(11) NOT NULL,
  `details_product` int(11) NOT NULL,
  `details_amount` int(11) NOT NULL,
  PRIMARY KEY (`id_details`),
  KEY `fk_bill_details_db_bill_db1_idx` (`details_bill`),
  KEY `fk_bill_details_db_product_db1_idx` (`details_product`),
  CONSTRAINT `fk_bill_details_db_bill_db1` FOREIGN KEY (`details_bill`) REFERENCES `bill_db` (`idbill_db`),
  CONSTRAINT `fk_bill_details_db_product_db1` FOREIGN KEY (`details_product`) REFERENCES `product_db` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_details_db`
--

LOCK TABLES `bill_details_db` WRITE;
/*!40000 ALTER TABLE `bill_details_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_details_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_db`
--

DROP TABLE IF EXISTS `category_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_db` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_db`
--

LOCK TABLES `category_db` WRITE;
/*!40000 ALTER TABLE `category_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_join`
--

DROP TABLE IF EXISTS `product_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_join` (
  `id_product_category_join` int(11) NOT NULL AUTO_INCREMENT,
  `id_p` int(11) NOT NULL,
  `id_c` int(11) NOT NULL,
  PRIMARY KEY (`id_product_category_join`),
  KEY `fk_product_category_join_product_db1_idx` (`id_p`),
  KEY `fk_product_category_join_category_db1_idx` (`id_c`),
  CONSTRAINT `fk_product_category_join_category_db1` FOREIGN KEY (`id_c`) REFERENCES `category_db` (`id_category`),
  CONSTRAINT `fk_product_category_join_product_db1` FOREIGN KEY (`id_p`) REFERENCES `product_db` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_join`
--

LOCK TABLES `product_category_join` WRITE;
/*!40000 ALTER TABLE `product_category_join` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_db`
--

DROP TABLE IF EXISTS `product_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_db` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_description` text NOT NULL,
  `product_img` blob NOT NULL,
  `product_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `product_code` varchar(15) NOT NULL,
  `product_price` double(12,2) NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_db`
--

LOCK TABLES `product_db` WRITE;
/*!40000 ALTER TABLE `product_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_imgs_db`
--

DROP TABLE IF EXISTS `product_imgs_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_imgs_db` (
  `idproduct_imgs_db` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `product_imgs_dbcol` blob NOT NULL,
  PRIMARY KEY (`idproduct_imgs_db`),
  KEY `fk_product_imgs_db_product_db1_idx` (`id_product`),
  CONSTRAINT `fk_product_imgs_db_product_db1` FOREIGN KEY (`id_product`) REFERENCES `product_db` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_imgs_db`
--

LOCK TABLES `product_imgs_db` WRITE;
/*!40000 ALTER TABLE `product_imgs_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_imgs_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_form_db`
--

DROP TABLE IF EXISTS `sell_form_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell_form_db` (
  `id_sell_form` int(11) NOT NULL AUTO_INCREMENT,
  `sell_form_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sell_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_form_db`
--

LOCK TABLES `sell_form_db` WRITE;
/*!40000 ALTER TABLE `sell_form_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_form_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address_join`
--

DROP TABLE IF EXISTS `user_address_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address_join` (
  `id_user_address_join` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  PRIMARY KEY (`id_user_address_join`),
  KEY `fk_user_adrees_join_user_db_idx` (`id_user`),
  KEY `fk_user_adrees_join_address_db1_idx` (`id_address`),
  CONSTRAINT `fk_address` FOREIGN KEY (`id_address`) REFERENCES `address_db` (`id_address`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user_db` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address_join`
--

LOCK TABLES `user_address_join` WRITE;
/*!40000 ALTER TABLE `user_address_join` DISABLE KEYS */;
INSERT INTO `user_address_join` VALUES (1,1,1);
/*!40000 ALTER TABLE `user_address_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_db`
--

DROP TABLE IF EXISTS `user_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_db` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_cellphone` varchar(9) NOT NULL,
  `user_nacimiento` date NOT NULL,
  `user_type` enum('user','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_db`
--

LOCK TABLES `user_db` WRITE;
/*!40000 ALTER TABLE `user_db` DISABLE KEYS */;
INSERT INTO `user_db` VALUES (1,'Angel Lopez','adiction','yelito1999@gmail.com','7263-0679','1999-02-27','admin');
/*!40000 ALTER TABLE `user_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mi_minimarket_db'
--

--
-- Dumping routines for database 'mi_minimarket_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20 23:08:48
