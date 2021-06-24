CREATE DATABASE  IF NOT EXISTS `progettogruppo2` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `progettogruppo2`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: progettogruppo2
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `animale`
--

DROP TABLE IF EXISTS `animale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animale` (
  `Cliente` varchar(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Specie` varchar(45) NOT NULL,
  `Razza` varchar(45) NOT NULL,
  PRIMARY KEY (`Cliente`,`Nome`),
  CONSTRAINT `fk_Animale_cliente1` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animale`
--

LOCK TABLES `animale` WRITE;
/*!40000 ALTER TABLE `animale` DISABLE KEYS */;
INSERT INTO `animale` VALUES ('mblrto97s98d023f','Charlie','Cane','Chihuahua'),('mblrto97s98d023f','Tuc','Amphiprion','Pesce pagliaccia');
/*!40000 ALTER TABLE `animale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animaleordinabile`
--

DROP TABLE IF EXISTS `animaleordinabile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animaleordinabile` (
  `NumeroIdentificativo` int NOT NULL AUTO_INCREMENT,
  `Specie` varchar(45) NOT NULL,
  `Razza` varchar(45) NOT NULL,
  `Colore` varchar(45) NOT NULL,
  `Eta` int NOT NULL,
  `Sesso` varchar(1) NOT NULL,
  `Peso` decimal(10,0) NOT NULL,
  `Altezza` decimal(10,0) NOT NULL,
  `Fornitore` varchar(11) NOT NULL,
  PRIMARY KEY (`NumeroIdentificativo`),
  KEY `fk_animaleordinabile_fornitore1_idx` (`Fornitore`),
  CONSTRAINT `fk_animaleordinabile_fornitore1` FOREIGN KEY (`Fornitore`) REFERENCES `fornitore` (`PartitaIVA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animaleordinabile`
--

LOCK TABLES `animaleordinabile` WRITE;
/*!40000 ALTER TABLE `animaleordinabile` DISABLE KEYS */;
INSERT INTO `animaleordinabile` VALUES (1,'Cane','Labrador','Rosso',2,'M',30,120,'56478963251'),(2,'Tartaruga','Azzannatrice','Verde militare',5,'F',25,40,'56478963251'),(3,'Criceto','Russo','Arancione',1,'M',1,8,'56478963251'),(4,'Papagallo','Cacatua','Bianco',1,'F',2,30,'56478963251');
/*!40000 ALTER TABLE `animaleordinabile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animalevisitato`
--

DROP TABLE IF EXISTS `animalevisitato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animalevisitato` (
  `NumeroMicrochip` varchar(20) NOT NULL,
  `NumeroLibretto` int NOT NULL,
  `NumeroPedigree` int DEFAULT NULL,
  `NumeroCartella` int NOT NULL AUTO_INCREMENT,
  `Patologie` varchar(150) DEFAULT NULL,
  `Peso` decimal(10,0) NOT NULL,
  `Altezza` decimal(10,0) NOT NULL,
  `Colore` varchar(45) NOT NULL,
  `Cliente` varchar(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`Cliente`,`Nome`),
  UNIQUE KEY `NumeroMicrochip_UNIQUE` (`NumeroMicrochip`),
  UNIQUE KEY `NumeroLibretto_UNIQUE` (`NumeroLibretto`),
  UNIQUE KEY `NumeroCartella_UNIQUE` (`NumeroCartella`),
  UNIQUE KEY `NumeroPedigree_UNIQUE` (`NumeroPedigree`),
  CONSTRAINT `fk_animalevisitato_Animale1` FOREIGN KEY (`Cliente`, `Nome`) REFERENCES `animale` (`Cliente`, `Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animalevisitato`
--

LOCK TABLES `animalevisitato` WRITE;
/*!40000 ALTER TABLE `animalevisitato` DISABLE KEYS */;
INSERT INTO `animalevisitato` VALUES ('2012165',1541132165,16513065,1,'Epilessia',3,30,'Marrone','mblrto97s98d023f','Charlie');
/*!40000 ALTER TABLE `animalevisitato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cartella veterinaria`
--

DROP TABLE IF EXISTS `cartella veterinaria`;
/*!50001 DROP VIEW IF EXISTS `cartella veterinaria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cartella veterinaria` AS SELECT 
 1 AS `SpecieAccolta`,
 1 AS `Disponibili`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CodiceFiscale` varchar(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Mail` varchar(45) NOT NULL,
  `NumeroDocumento` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CodiceFiscale`),
  UNIQUE KEY `Telefono_UNIQUE` (`Telefono`),
  UNIQUE KEY `Mail_UNIQUE` (`Mail`),
  KEY `fk_cliente_clientespeciale1_idx` (`NumeroDocumento`),
  CONSTRAINT `fk_cliente_clientespeciale1` FOREIGN KEY (`NumeroDocumento`) REFERENCES `clientespeciale` (`NumeroDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('mblrto97s98d023f','Carlo','Conti','+396574832121','carletto@hotmail.it',NULL),('rtsedf45t98v234d','Peppa','Pig','+394435647823','lapeppa@gmail.com','AX45637287');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientespeciale`
--

DROP TABLE IF EXISTS `clientespeciale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientespeciale` (
  `NumeroDocumento` varchar(15) NOT NULL,
  `DataEmissione` date NOT NULL,
  `LuogoEmissione` varchar(45) NOT NULL,
  `DataScadenza` date NOT NULL,
  `DataNascita` date NOT NULL,
  `LuogoNascita` varchar(45) NOT NULL,
  `EstremiCarta` varchar(45) NOT NULL,
  `Credenziali` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NumeroDocumento`),
  UNIQUE KEY `EstremiCarta_UNIQUE` (`EstremiCarta`),
  UNIQUE KEY `Credenziali_UNIQUE` (`Credenziali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientespeciale`
--

LOCK TABLES `clientespeciale` WRITE;
/*!40000 ALTER TABLE `clientespeciale` DISABLE KEYS */;
INSERT INTO `clientespeciale` VALUES ('AX45637287','2020-01-01','Roma','2030-08-07','1995-08-07','Avellino','354648394843','laPEPPA95, georginofratellino');
/*!40000 ALTER TABLE `clientespeciale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composizione`
--

DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composizione` (
  `Quantita` int NOT NULL,
  `Prezzo` decimal(10,0) NOT NULL,
  `PercentualeIVA` int NOT NULL,
  `Sconto` decimal(10,0) DEFAULT NULL,
  `CodiceABarre` int NOT NULL,
  `NumeroFattura` int NOT NULL,
  `Fornitore` varchar(11) NOT NULL,
  PRIMARY KEY (`CodiceABarre`,`NumeroFattura`,`Fornitore`),
  KEY `fk_composizione_fatturaricevuta1_idx` (`NumeroFattura`,`Fornitore`),
  CONSTRAINT `fk_composizione_fatturaricevuta1` FOREIGN KEY (`NumeroFattura`, `Fornitore`) REFERENCES `fatturaricevuta` (`NumeroFattura`, `Fornitore`),
  CONSTRAINT `fk_composizione_materialediconsumo1` FOREIGN KEY (`CodiceABarre`) REFERENCES `materialediconsumo` (`CodiceABarre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
INSERT INTO `composizione` VALUES (20,10,4,1,123,1,'74584125369'),(20,10,4,1,123,2,'74584125369'),(100,3,22,NULL,456,1,'12365478963'),(50,1,4,10,789,1,'74584125369');
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `disponibilità rifugio`
--

DROP TABLE IF EXISTS `disponibilità rifugio`;
/*!50001 DROP VIEW IF EXISTS `disponibilità rifugio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disponibilità rifugio` AS SELECT 
 1 AS `SpecieAccolta`,
 1 AS `Disponibili`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fatturaemessa`
--

DROP TABLE IF EXISTS `fatturaemessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatturaemessa` (
  `NumeroFattura` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `MetodoPagamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NumeroFattura`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatturaemessa`
--

LOCK TABLES `fatturaemessa` WRITE;
/*!40000 ALTER TABLE `fatturaemessa` DISABLE KEYS */;
INSERT INTO `fatturaemessa` VALUES (1,'2020-06-01','Contanti'),(2,'2020-07-01','Contanti');
/*!40000 ALTER TABLE `fatturaemessa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatturaricevuta`
--

DROP TABLE IF EXISTS `fatturaricevuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatturaricevuta` (
  `NumeroFattura` int NOT NULL,
  `Data` date NOT NULL,
  `Imponibile` decimal(10,0) NOT NULL,
  `IVA` decimal(10,0) NOT NULL,
  `MetodoPagamento` varchar(45) DEFAULT NULL,
  `DataPagamento` date DEFAULT NULL,
  `Fornitore` varchar(11) NOT NULL,
  PRIMARY KEY (`NumeroFattura`,`Fornitore`),
  KEY `fk_fatturaricevuta_fornitore1_idx` (`Fornitore`),
  CONSTRAINT `fk_fatturaricevuta_fornitore1` FOREIGN KEY (`Fornitore`) REFERENCES `fornitore` (`PartitaIVA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatturaricevuta`
--

LOCK TABLES `fatturaricevuta` WRITE;
/*!40000 ALTER TABLE `fatturaricevuta` DISABLE KEYS */;
INSERT INTO `fatturaricevuta` VALUES (1,'2020-09-01',50,7,NULL,NULL,'12365478963'),(1,'2020-06-01',100,10,'Contanti','2020-06-02','74584125369'),(2,'2020-06-08',200,24,NULL,NULL,'74584125369');
/*!40000 ALTER TABLE `fatturaricevuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitore` (
  `PartitaIVA` varchar(11) NOT NULL,
  `DenominazioneSociale` varchar(45) NOT NULL,
  `NumeroTelefono` varchar(15) NOT NULL COMMENT 'Numero di telefono con prefisso internazionale',
  `Mail` varchar(45) NOT NULL,
  `Luogo` varchar(45) NOT NULL,
  PRIMARY KEY (`PartitaIVA`),
  UNIQUE KEY `NumeroTelefono_UNIQUE` (`NumeroTelefono`),
  UNIQUE KEY `Mail_UNIQUE` (`Mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
INSERT INTO `fornitore` VALUES ('12365478963','Carta & Co.','+398876543456','cartina@gmail.com','Latina'),('56478963251','Zoolandia','+392345437866','zoolandia@info.com','Matera'),('74584125369','VetSanitary s.r.l.','+395647820919','vetsanitary@libero.itq','Napoli');
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `giacenza`
--

DROP TABLE IF EXISTS `giacenza`;
/*!50001 DROP VIEW IF EXISTS `giacenza`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `giacenza` AS SELECT 
 1 AS `Descrizione`,
 1 AS `Giacenze`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `materialediconsumo`
--

DROP TABLE IF EXISTS `materialediconsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialediconsumo` (
  `CodiceABarre` int NOT NULL,
  `Descrizione` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Breve descrizione del materiale di consumo',
  `PosizioneAScaffale` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CodiceABarre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialediconsumo`
--

LOCK TABLES `materialediconsumo` WRITE;
/*!40000 ALTER TABLE `materialediconsumo` DISABLE KEYS */;
INSERT INTO `materialediconsumo` VALUES (123,'Bisturi','A10'),(456,'Carta A4','B22'),(789,'Garza','B10');
/*!40000 ALTER TABLE `materialediconsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordineanimale`
--

DROP TABLE IF EXISTS `ordineanimale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordineanimale` (
  `NumeroOrdine` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Prezzo` decimal(10,0) NOT NULL,
  `MezzoPagamento` varchar(45) NOT NULL,
  `Cliente` varchar(15) NOT NULL,
  `Animale` int NOT NULL,
  PRIMARY KEY (`NumeroOrdine`),
  KEY `fk_OrdineAnimale_AnimaleOrdinabile1_idx` (`Animale`),
  KEY `fk_ordineanimale_clientespeciale1_idx` (`Cliente`),
  CONSTRAINT `fk_ordineanimale_animaleordinabile1` FOREIGN KEY (`Animale`) REFERENCES `animaleordinabile` (`NumeroIdentificativo`),
  CONSTRAINT `fk_ordineanimale_clientespeciale1` FOREIGN KEY (`Cliente`) REFERENCES `clientespeciale` (`NumeroDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordineanimale`
--

LOCK TABLES `ordineanimale` WRITE;
/*!40000 ALTER TABLE `ordineanimale` DISABLE KEYS */;
INSERT INTO `ordineanimale` VALUES (1,'2020-06-01',30,'Bonifico','AX45637287',3);
/*!40000 ALTER TABLE `ordineanimale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazionerifugio`
--

DROP TABLE IF EXISTS `prenotazionerifugio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazionerifugio` (
  `NumeroPrenotazione` int NOT NULL AUTO_INCREMENT,
  `CheckIn` date NOT NULL,
  `CheckOut` date NOT NULL,
  `Prezzo` decimal(10,0) NOT NULL,
  `Necessita` varchar(150) DEFAULT NULL,
  `NumeroBox` int NOT NULL,
  `Fattura` int DEFAULT NULL,
  `Cliente` varchar(16) NOT NULL,
  `Animale` varchar(45) NOT NULL,
  PRIMARY KEY (`NumeroPrenotazione`),
  KEY `fk_PrenotazioneRifugio_FatturaEmessa1_idx` (`Fattura`),
  KEY `fk_prenotazionerifugio_rifugio1_idx` (`NumeroBox`),
  KEY `fk_prenotazionerifugio_Animale1_idx` (`Cliente`,`Animale`),
  CONSTRAINT `fk_prenotazionerifugio_Animale1` FOREIGN KEY (`Cliente`, `Animale`) REFERENCES `animale` (`Cliente`, `Nome`),
  CONSTRAINT `fk_prenotazionerifugio_fatturaemessa1` FOREIGN KEY (`Fattura`) REFERENCES `fatturaemessa` (`NumeroFattura`),
  CONSTRAINT `fk_prenotazionerifugio_rifugio1` FOREIGN KEY (`NumeroBox`) REFERENCES `rifugio` (`NumeroBox`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazionerifugio`
--

LOCK TABLES `prenotazionerifugio` WRITE;
/*!40000 ALTER TABLE `prenotazionerifugio` DISABLE KEYS */;
INSERT INTO `prenotazionerifugio` VALUES (1,'2020-06-05','2020-06-15',300,'Mangia solo i croccantini Special al gusto salmone',3,NULL,'mblrto97s98d023f','Charlie');
/*!40000 ALTER TABLE `prenotazionerifugio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazioneservizio`
--

DROP TABLE IF EXISTS `prenotazioneservizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazioneservizio` (
  `NumeroPrenotazione` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Ora` time NOT NULL,
  `TipologiaTrattamento` varchar(45) NOT NULL,
  `Prezzo` decimal(10,0) NOT NULL,
  `Cliente` varchar(16) NOT NULL,
  PRIMARY KEY (`NumeroPrenotazione`),
  KEY `fk_prenotazioneservizio_cliente1_idx` (`Cliente`),
  CONSTRAINT `fk_prenotazioneservizio_cliente1` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazioneservizio`
--

LOCK TABLES `prenotazioneservizio` WRITE;
/*!40000 ALTER TABLE `prenotazioneservizio` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenotazioneservizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rifugio`
--

DROP TABLE IF EXISTS `rifugio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rifugio` (
  `NumeroBox` int NOT NULL AUTO_INCREMENT,
  `SpecieAccolta` varchar(45) NOT NULL,
  PRIMARY KEY (`NumeroBox`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rifugio`
--

LOCK TABLES `rifugio` WRITE;
/*!40000 ALTER TABLE `rifugio` DISABLE KEYS */;
INSERT INTO `rifugio` VALUES (1,'Cane'),(2,'Cane'),(3,'Cane'),(4,'Gatto'),(5,'Gatto'),(6,'Pappagallo'),(7,'Pesce rosso'),(8,'Tartaruga'),(9,'Tartaruga'),(10,'Criceto'),(11,'Criceto'),(12,'Criceto');
/*!40000 ALTER TABLE `rifugio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storicovisite`
--

DROP TABLE IF EXISTS `storicovisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storicovisite` (
  `Data` date NOT NULL,
  `TipologiaServizio` varchar(45) NOT NULL,
  `Note` varchar(150) DEFAULT NULL,
  `Prezzo` decimal(10,0) NOT NULL,
  `Fattura` int NOT NULL,
  `Cliente` varchar(16) NOT NULL,
  `Animale` varchar(45) NOT NULL,
  PRIMARY KEY (`Data`,`Cliente`,`Animale`),
  KEY `fk_StoricoVisite_FatturaEmessa1_idx` (`Fattura`),
  KEY `fk_storicovisite_animalevisitato1_idx` (`Cliente`,`Animale`),
  CONSTRAINT `fk_storicovisite_animalevisitato1` FOREIGN KEY (`Cliente`, `Animale`) REFERENCES `animalevisitato` (`Cliente`, `Nome`),
  CONSTRAINT `fk_storicovisite_fatturaemessa1` FOREIGN KEY (`Fattura`) REFERENCES `fatturaemessa` (`NumeroFattura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storicovisite`
--

LOCK TABLES `storicovisite` WRITE;
/*!40000 ALTER TABLE `storicovisite` DISABLE KEYS */;
INSERT INTO `storicovisite` VALUES ('2020-06-01','Sverminazione',NULL,12,1,'mblrto97s98d023f','Charlie'),('2020-08-01','Vaccino rabbia',NULL,30,2,'mblrto97s98d023f','Charlie');
/*!40000 ALTER TABLE `storicovisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uscitamateriale`
--

DROP TABLE IF EXISTS `uscitamateriale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uscitamateriale` (
  `Codiceuscita` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `QuantitaUscita` int NOT NULL,
  `Destinazione` varchar(45) NOT NULL,
  `CodiceMateriale` int NOT NULL,
  PRIMARY KEY (`Codiceuscita`),
  KEY `fk_UscitaMateriale_MaterialeDiConsumo_idx` (`CodiceMateriale`),
  CONSTRAINT `fk_uscitamateriale_materialediconsumo` FOREIGN KEY (`CodiceMateriale`) REFERENCES `materialediconsumo` (`CodiceABarre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uscitamateriale`
--

LOCK TABLES `uscitamateriale` WRITE;
/*!40000 ALTER TABLE `uscitamateriale` DISABLE KEYS */;
INSERT INTO `uscitamateriale` VALUES (1,'2020-06-05',10,'Veterinaria',123),(2,'2020-06-09',5,'Veterinaria',123),(3,'2020-06-10',12,'Segreteria',456);
/*!40000 ALTER TABLE `uscitamateriale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendita`
--

DROP TABLE IF EXISTS `vendita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendita` (
  `Data` date NOT NULL,
  `NumeroContratto` int NOT NULL,
  `NumeroPassaggio` int NOT NULL,
  `NumeroOrdine` int NOT NULL,
  PRIMARY KEY (`NumeroOrdine`),
  CONSTRAINT `fk_vendita_ordineanimale1` FOREIGN KEY (`NumeroOrdine`) REFERENCES `ordineanimale` (`NumeroOrdine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendita`
--

LOCK TABLES `vendita` WRITE;
/*!40000 ALTER TABLE `vendita` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `CodiceFiscale` varchar(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Mail` varchar(45) NOT NULL,
  `Credenziali` varchar(45) NOT NULL,
  PRIMARY KEY (`CodiceFiscale`),
  UNIQUE KEY `Telefono_UNIQUE` (`Telefono`),
  UNIQUE KEY `Mail_UNIQUE` (`Mail`),
  UNIQUE KEY `Credenziali_UNIQUE` (`Credenziali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES ('vbndfr78e45d345f','Veronica','Defrancesco','+392234854324','VeronicDef@gmail.com','Vetveronica78'),('ytueoi89e08f098r','Antonio','Mafrici','+393487547234','mafricino@yahoo.it','Antonino89');
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `Veterinario` varchar(16) NOT NULL,
  `Data` date NOT NULL,
  `Cliente` varchar(16) NOT NULL,
  `Animale` varchar(45) NOT NULL,
  PRIMARY KEY (`Veterinario`,`Data`,`Cliente`,`Animale`),
  KEY `fk_visita_veterinario1_idx` (`Veterinario`),
  KEY `fk_visita_storicovisite1_idx` (`Data`,`Cliente`,`Animale`),
  CONSTRAINT `fk_visita_storicovisite1` FOREIGN KEY (`Data`, `Cliente`, `Animale`) REFERENCES `storicovisite` (`Data`, `Cliente`, `Animale`),
  CONSTRAINT `fk_visita_veterinario1` FOREIGN KEY (`Veterinario`) REFERENCES `veterinario` (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES ('vbndfr78e45d345f','2020-06-01','mblrto97s98d023f','Charlie'),('vbndfr78e45d345f','2020-08-01','mblrto97s98d023f','Charlie'),('ytueoi89e08f098r','2020-08-01','mblrto97s98d023f','Charlie');
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cartella veterinaria`
--

/*!50001 DROP VIEW IF EXISTS `cartella veterinaria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cartella veterinaria` AS select `rifugio`.`SpecieAccolta` AS `SpecieAccolta`,count(`rifugio`.`SpecieAccolta`) AS `Disponibili` from `rifugio` where `rifugio`.`NumeroBox` in (select `pr`.`NumeroBox` from (`prenotazionerifugio` `pr` left join `rifugio` `ri` on((`pr`.`NumeroBox` = `ri`.`NumeroBox`))) where (('2020/06/09' between `pr`.`CheckIn` and `pr`.`CheckOut`) or ('2020/06/20' between `pr`.`CheckIn` and `pr`.`CheckOut`) or ((`pr`.`CheckIn` between '2020/06/09' and '2020/06/20') and (`pr`.`CheckOut` between '2020/06/09' and '2020/06/20')))) is false group by `rifugio`.`SpecieAccolta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `disponibilità rifugio`
--

/*!50001 DROP VIEW IF EXISTS `disponibilità rifugio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disponibilità rifugio` AS select `rifugio`.`SpecieAccolta` AS `SpecieAccolta`,count(`rifugio`.`SpecieAccolta`) AS `Disponibili` from `rifugio` where `rifugio`.`NumeroBox` in (select `pr`.`NumeroBox` from (`prenotazionerifugio` `pr` left join `rifugio` `ri` on((`pr`.`NumeroBox` = `ri`.`NumeroBox`))) where (('2020/06/04' between `pr`.`CheckIn` and `pr`.`CheckOut`) or ('2020/06/25' between `pr`.`CheckIn` and `pr`.`CheckOut`))) is false group by `rifugio`.`SpecieAccolta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `giacenza`
--

/*!50001 DROP VIEW IF EXISTS `giacenza`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `giacenza` AS select `tab1`.`Descrizione` AS `Descrizione`,(`tab1`.`Entrate` - ifnull(`tab2`.`Uscite`,0)) AS `Giacenze` from ((select `m`.`Descrizione` AS `Descrizione`,sum(`c`.`Quantita`) AS `Entrate` from (`materialediconsumo` `m` join `composizione` `c` on((`m`.`CodiceABarre` = `c`.`CodiceABarre`))) group by `c`.`CodiceABarre`) `tab1` left join (select `m`.`Descrizione` AS `Descrizione`,sum(`u`.`QuantitaUscita`) AS `Uscite` from (`materialediconsumo` `m` join `uscitamateriale` `u` on((`m`.`CodiceABarre` = `u`.`CodiceMateriale`))) group by `u`.`CodiceMateriale`) `tab2` on((`tab1`.`Descrizione` = `tab2`.`Descrizione`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-11  9:49:48
