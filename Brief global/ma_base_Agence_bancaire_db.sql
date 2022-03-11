-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: Agence_bancaire_db
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `Agence`
--

DROP TABLE IF EXISTS `Agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Agence` (
  `numero` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agence`
--

LOCK TABLES `Agence` WRITE;
/*!40000 ALTER TABLE `Agence` DISABLE KEYS */;
INSERT INTO `Agence` VALUES (1,'societe generale','marndjandafak',68246271),(2,'la tchadienne','marndjandafak',68246271),(3,'uba','gassi',68246271),(4,'ecobank','walia',68246271),(5,'bsic','goudji',68246271),(6,'beac','marndjandafak',68246271);
/*!40000 ALTER TABLE `Agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comptes`
--

DROP TABLE IF EXISTS `Comptes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comptes` (
  `numero_identification` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ouverture` date DEFAULT NULL,
  `type` varchar(200) NOT NULL,
  `telephone` int NOT NULL,
  `id_personne` int unsigned NOT NULL,
  `numero_agence` int unsigned NOT NULL,
  PRIMARY KEY (`numero_identification`),
  KEY `id_personne` (`id_personne`),
  KEY `numero_agence` (`numero_agence`),
  CONSTRAINT `Comptes_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `Personne` (`id`),
  CONSTRAINT `Comptes_ibfk_2` FOREIGN KEY (`numero_agence`) REFERENCES `Agence` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comptes`
--

LOCK TABLES `Comptes` WRITE;
/*!40000 ALTER TABLE `Comptes` DISABLE KEYS */;
INSERT INTO `Comptes` VALUES (1,'2022-01-06','le compte émettant',68246271,1,1),(2,'2022-05-06','le compte revevant l operation',98246271,2,2),(3,'2022-01-18','le compte émettant',65246271,3,3),(4,'2022-03-06','le compte revevant l operation',68246271,4,4),(5,'2022-04-06','le compte émettant',68246271,5,5),(6,'2022-11-06','le compte revevant l operation',68246271,6,6);
/*!40000 ALTER TABLE `Comptes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Opération`
--

DROP TABLE IF EXISTS `Opération`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Opération` (
  `numero_identification` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `lieu` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `num_ident_compte` int unsigned NOT NULL,
  `id_personne` int unsigned NOT NULL,
  PRIMARY KEY (`numero_identification`),
  KEY `num_ident_compte` (`num_ident_compte`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `Opération_ibfk_1` FOREIGN KEY (`num_ident_compte`) REFERENCES `Comptes` (`numero_identification`),
  CONSTRAINT `Opération_ibfk_2` FOREIGN KEY (`id_personne`) REFERENCES `Personne` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opération`
--

LOCK TABLES `Opération` WRITE;
/*!40000 ALTER TABLE `Opération` DISABLE KEYS */;
INSERT INTO `Opération` VALUES (1,'2022-01-01','goudji','retrait par carte bancaire',1,1),(2,'2022-02-01','marndjandafak','versement de salaire',2,2),(3,'2022-03-01','gassi','encaissement ou paiement de chèque',3,3),(4,'2022-04-01','goudji','virement de compte en compte',4,4),(5,'2022-05-01','walia','retrait par carte bancaire',5,5),(6,'2022-06-01','goudji','versement de salaire',6,6);
/*!40000 ALTER TABLE `Opération` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ouvrir`
--

DROP TABLE IF EXISTS `Ouvrir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ouvrir` (
  `reference` int unsigned NOT NULL AUTO_INCREMENT,
  `id_personne` int unsigned NOT NULL,
  `numero_agence` int unsigned NOT NULL,
  PRIMARY KEY (`reference`),
  KEY `id_personne` (`id_personne`),
  KEY `numero_agence` (`numero_agence`),
  CONSTRAINT `Ouvrir_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `Personne` (`id`),
  CONSTRAINT `Ouvrir_ibfk_2` FOREIGN KEY (`numero_agence`) REFERENCES `Agence` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ouvrir`
--

LOCK TABLES `Ouvrir` WRITE;
/*!40000 ALTER TABLE `Ouvrir` DISABLE KEYS */;
INSERT INTO `Ouvrir` VALUES (1,1,1),(2,2,2),(3,3,4),(4,5,5),(5,4,3),(6,6,6);
/*!40000 ALTER TABLE `Ouvrir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personne`
--

DROP TABLE IF EXISTS `Personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personne` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personne`
--

LOCK TABLES `Personne` WRITE;
/*!40000 ALTER TABLE `Personne` DISABLE KEYS */;
INSERT INTO `Personne` VALUES (1,'Cendrillon','marndjandafak',68246271),(2,'Liliane','marndjandafak',68246271),(3,'Millore','gassi',68246271),(4,'Olivia','walia',68246271),(5,'Gwladys','goudji',68246271),(6,'Sylvain','marndjandafak',68246271);
/*!40000 ALTER TABLE `Personne` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-04 23:33:27
