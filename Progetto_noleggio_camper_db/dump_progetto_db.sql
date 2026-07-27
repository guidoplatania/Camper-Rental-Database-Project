CREATE DATABASE  IF NOT EXISTS `noleggi_camper_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `noleggi_camper_db`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: noleggi_camper_db
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

-- SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '97d624bc-1106-11f1-ab47-0a0027000010:1-237';

--
-- Table structure for table `azienda`
--

DROP TABLE IF EXISTS `azienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `azienda` (
  `id_azienda` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sede` varchar(45) NOT NULL,
  `via` varchar(45) NOT NULL,
  `civico` int NOT NULL,
  `p_iva` varchar(11) NOT NULL,
  PRIMARY KEY (`id_azienda`),
  UNIQUE KEY `id_azienda_UNIQUE` (`id_azienda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `azienda`
--

LOCK TABLES `azienda` WRITE;
/*!40000 ALTER TABLE `azienda` DISABLE KEYS */;
INSERT INTO `azienda` VALUES (1,'Concessionaria Gruppo Grasso','Randazzo','Giunta ',1,'12345678910');
/*!40000 ALTER TABLE `azienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camper`
--

DROP TABLE IF EXISTS `camper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camper` (
  `id_camper` int NOT NULL AUTO_INCREMENT,
  `targa` varchar(7) NOT NULL,
  `numero_cellula` varchar(17) NOT NULL,
  `codice_telaio` varchar(10) NOT NULL,
  `marchio` varchar(45) NOT NULL,
  `modello` varchar(45) NOT NULL,
  `numero_posti` int NOT NULL,
  `anno_produzione` year NOT NULL,
  `stato` enum('Disponibile','In manutenzione') NOT NULL DEFAULT 'Disponibile',
  `peso` int NOT NULL,
  `tipo` enum('Autocaravan','Campervan') NOT NULL,
  `postiLetto_mansarda` int DEFAULT NULL,
  `volume_garage` int DEFAULT NULL,
  `tettoAlzabile` tinyint DEFAULT '0',
  `portellone_apribile` tinyint DEFAULT '0',
  `id_azienda` int NOT NULL,
  PRIMARY KEY (`id_camper`),
  UNIQUE KEY `id_camper_UNIQUE` (`id_camper`),
  UNIQUE KEY `targa_UNIQUE` (`targa`),
  UNIQUE KEY `numero_cellula_UNIQUE` (`numero_cellula`),
  UNIQUE KEY `codice_telaio_UNIQUE` (`codice_telaio`),
  KEY `id_azienda_idx` (`id_azienda`),
  CONSTRAINT `fk_camper_azienda` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id_azienda`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camper`
--

LOCK TABLES `camper` WRITE;
/*!40000 ALTER TABLE `camper` DISABLE KEYS */;
INSERT INTO `camper` VALUES (1,'AB123CD','PLAHBHF64738294','AQSXYT6729','Challenger','Genesis 52',5,2013,'Disponibile',2721,'Autocaravan',2,10,0,0,1),(2,'CD357PL','HSTR210PLGHS','QURLV1620','Pilote','Essential G600',4,2019,'Disponibile',3850,'Autocaravan',2,15,0,0,1),(3,'EF874QW','SJDRN712409WLMGDB','CBGPG19023','Sunlight','T66',5,2016,'In manutenzione',3700,'Autocaravan',2,7,0,0,1),(4,'PC643SW','VCMAG52819350LAVD','FTVZZ81125','Malibu','Van Relax 640',4,2018,'Disponibile',2100,'Campervan',NULL,NULL,1,1,1),(5,'MU290QA','LKDGST638913BFCSA','SLABW27183','Rollerteam','Livingstone 5 sport',4,2012,'Disponibile',2356,'Campervan',NULL,NULL,1,1,1),(6,'VE325KO','CZXMLAGF63812TE','ALIXT78390','Carthago','C-tourer T-145',5,2017,'Disponibile',3190,'Autocaravan',2,12,0,0,1),(7,'ZX564WB','ABCFRTYH46173ML','AZXSD12378','Elnagh','Elnagh E-van 2',4,2010,'Disponibile',2987,'Campervan',NULL,NULL,0,1,1),(8,'BH908SJ','QQALPBNDR5328FR','MXNGHV6483','Weinsberg','Carabus 540',4,2011,'In manutenzione',3219,'Campervan',NULL,NULL,0,1,1),(9,'LG316XC','MZHVRTDG364HFG57A','MJNGQ53627','Challenger','C 394 Ga',5,2019,'Disponibile',3581,'Autocaravan',2,10,0,0,1),(10,'OU271QA','MLVGDTFH4536YHGVQ','MHVDT56190','Laika','x700',5,2013,'In manutenzione',3219,'Autocaravan',2,11,0,0,1);
/*!40000 ALTER TABLE `camper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_nascita` date NOT NULL,
  `tipo_patente` varchar(2) NOT NULL,
  `CF` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente_UNIQUE` (`id_cliente`),
  UNIQUE KEY `CF_UNIQUE` (`CF`),
  UNIQUE KEY `e-mail_UNIQUE` (`email`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Guido','Platania','2004-09-01','B','pltgdu04p01b202c','guidoplat1904@gmail.com','3385112506'),(2,'Francesco','Ciancio Todaro','2000-02-07','C','frctdr07p02b282c','francescomaniace@gmail.com','3891148327'),(3,'Christian','La piana','2001-05-11','B','cstlpn01b11b101c','lapis@gmail.com','3281139457'),(4,'Salavatore','Polinomio','1999-07-25','C','slvplm01n25c123e','salvopoli@gmail.com','393103288'),(5,'Giorgio','Caggegi','2004-06-07','C','cgigrg02p07q202c','ture@gmail.com','3389523631');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutenzione`
--

DROP TABLE IF EXISTS `manutenzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutenzione` (
  `id_manutenzione` int NOT NULL AUTO_INCREMENT,
  `durata` int DEFAULT NULL,
  `tipo` enum('Elettrica','Meccanica','Interna','Impianto Idrico','Carrozzeria') NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `descrizione` varchar(300) DEFAULT NULL,
  `urgenza` enum('Basso','Medio','Alto') NOT NULL,
  `id_camper` int NOT NULL,
  PRIMARY KEY (`id_manutenzione`),
  UNIQUE KEY `id_manutenzione_UNIQUE` (`id_manutenzione`),
  KEY `id_camper_idx` (`id_camper`),
  CONSTRAINT `fk_manutenzione_camper` FOREIGN KEY (`id_camper`) REFERENCES `camper` (`id_camper`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutenzione`
--

LOCK TABLES `manutenzione` WRITE;
/*!40000 ALTER TABLE `manutenzione` DISABLE KEYS */;
INSERT INTO `manutenzione` VALUES (1,2,'Elettrica',120.00,'Problema dell\'impianto elettrico interno del camper','Basso',3),(2,4,'Meccanica',240.00,'Problema al motore','Alto',8),(3,6,'Carrozzeria',450.00,'Sostituzione del paraurti','Medio',10);
/*!40000 ALTER TABLE `manutenzione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `manutenzione_AFTER_INSERT` AFTER INSERT ON `manutenzione` FOR EACH ROW BEGIN
	UPDATE camper
    SET stato = 'In manutenzione'
    WHERE id_camper = NEW.id_camper;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `manutenzione_AFTER_DELETE` AFTER DELETE ON `manutenzione` FOR EACH ROW BEGIN
	UPDATE camper 
    SET stato = 'Disponibile'
    WHERE id_camper = OLD.id_camper;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `noleggio`
--

DROP TABLE IF EXISTS `noleggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noleggio` (
  `id_noleggio` int NOT NULL AUTO_INCREMENT,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `tariffa_giornaliera` decimal(10,2) NOT NULL,
  `caparra` decimal(10,2) DEFAULT NULL,
  `cauzione` decimal(10,2) DEFAULT NULL,
  `costi_extra` decimal(10,2) DEFAULT NULL,
  `chilometraggio` int DEFAULT NULL,
  `costo_totale` decimal(10,2) DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `id_camper` int NOT NULL,
  `id_azienda` int NOT NULL,
  PRIMARY KEY (`id_noleggio`),
  UNIQUE KEY `id_noleggio_UNIQUE` (`id_noleggio`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_camper_idx` (`id_camper`),
  KEY `id_azienda_idx` (`id_azienda`),
  CONSTRAINT `fk_noleggio_azienda` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id_azienda`),
  CONSTRAINT `fk_noleggio_camper` FOREIGN KEY (`id_camper`) REFERENCES `camper` (`id_camper`),
  CONSTRAINT `fk_noleggio_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noleggio`
--

LOCK TABLES `noleggio` WRITE;
/*!40000 ALTER TABLE `noleggio` DISABLE KEYS */;
INSERT INTO `noleggio` VALUES (1,'2026-03-02','2026-03-08',80.00,150.00,200.00,35.00,500,865.00,1,4,1),(2,'2026-03-05','2026-03-10',95.00,180.00,220.00,20.00,800,895.00,2,9,1),(3,'2026-03-20','2026-03-29',120.00,200.00,250.00,45.00,900,1575.00,4,2,1),(4,'2026-02-28','2026-03-10',50.00,100.00,150.00,15.00,550,865.00,3,5,1),(5,'2026-04-03','2026-04-07',55.00,130.00,150.00,50.00,500,550.00,5,6,1),(6,'2026-04-07','2026-04-11',60.00,100.00,200.00,25.00,450,565.00,4,9,1),(7,'2026-06-25','2026-07-01',65.00,150.00,120.00,40.00,700,700.00,1,1,1),(8,'2026-05-22','2026-05-28',50.00,100.00,150.00,20.00,300,570.00,1,7,1),(9,'2026-03-30','2026-04-05',100.00,200.00,250.00,30.00,400,1080.00,2,2,1);
/*!40000 ALTER TABLE `noleggio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `noleggio_BEFORE_INSERT` BEFORE INSERT ON `noleggio` FOR EACH ROW BEGIN

DECLARE peso_camper INT;
DECLARE tipo_p varchar(2);
DECLARE eta INT;
DECLARE state VARCHAR(20);
DECLARE date_sovrapposte INT;

SELECT peso INTO peso_camper
FROM camper
WHERE id_camper = NEW.id_camper;

SELECT tipo_patente INTO tipo_p
FROM cliente
WHERE id_cliente = NEW.id_cliente;

SELECT TIMESTAMPDIFF(YEAR, data_nascita, CURDATE()) INTO eta
FROM cliente
WHERE id_cliente = NEW.id_cliente;

SELECT stato INTO state
FROM camper
WHERE id_camper = NEW.id_camper;

SELECT COUNT(*) INTO date_sovrapposte
FROM noleggio
WHERE id_camper = NEW.id_camper AND NEW.data_inizio <= data_fine AND NEW.data_fine >= data_inizio;



	
    -- Controllo l'eta e il tipo di patente in base al peso del camper 
	IF peso_camper > 0 AND peso_camper <= 3500 THEN
		IF eta < 18 OR tipo_p != 'B' THEN
			SIGNAL SQLSTATE '45000'
            SET message_text = 'Errore, per i camper di peso fino a 3500kg il cliente deve avere almeno 18 e il tipo di patente B';
		END IF;
	ELSE 
		IF eta < 21 OR tipo_p != 'C' THEN
			SIGNAL SQLSTATE '45000'
            SET message_text = 'Errore, per i camper di peso maggiore a 3500kg il cliente deve avere almeno 21 anni e la patente di tipo C';
		END IF;
	END IF;
    
    
    -- La data di inizio deve essere prima della data di fine
    IF NEW.data_inizio > NEW.data_fine THEN
    SIGNAL SQLSTATE '45000'
    SET message_text = 'Errore, la data di inizio deve venire prima della data di fine';
    END IF;
    
    -- Il camper deve essere disponibile
    IF state != 'disponibile' THEN
		SIGNAL SQLSTATE '45000'
        SET message_text = "Errore, il camper non è disponibile per il noleggio";
    END IF;
    
    
    -- Controllo se il camper è gia prenotato per delle specifiche date
    IF date_sovrapposte > 0 THEN
		SIGNAL SQLSTATE '45000'
        SET message_text = 'Errore, il camper è gia occupato nelle date selezionate';
	END IF;
    
    
    
    -- Calcolo il costo totale
    SET NEW.costo_totale = (NEW.tariffa_giornaliera * datediff(NEW.data_fine, NEW.data_inizio)) + NEW.cauzione + NEW.caparra + NEW.costi_extra;
    
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `noleggio_AFTER_DELETE` AFTER DELETE ON `noleggio` FOR EACH ROW BEGIN
	UPDATE camper
    SET stato = 'Disponibile'
    WHERE id_camper = OLD.id_camper;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `metodo` enum('Carta','Contanti') NOT NULL,
  `stato_pagamento` enum('Completato','Non completato') DEFAULT 'Non completato',
  `data` date NOT NULL,
  `importo` decimal(10,2) NOT NULL,
  `id_noleggio` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  UNIQUE KEY `id_pagamento_UNIQUE` (`id_pagamento`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_noleggio_idx` (`id_noleggio`),
  CONSTRAINT `fk_pagamento_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pagamento_noleggio` FOREIGN KEY (`id_noleggio`) REFERENCES `noleggio` (`id_noleggio`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'Carta','Completato','2026-03-01',865.00,1,1),(2,'Carta','Non completato','2026-03-03',700.00,2,2),(3,'Contanti','Non completato','2026-03-17',1000.00,3,4),(4,'Carta','Completato','2026-02-25',865.00,4,3),(5,'Carta','Completato','2026-03-30',550.00,5,5);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagamento_BEFORE_INSERT` BEFORE INSERT ON `pagamento` FOR EACH ROW BEGIN
	DECLARE importo_noleggio DECIMAL(10,2);
    
    SELECT costo_totale INTO importo_noleggio
    FROM noleggio
    WHERE id_noleggio = NEW.id_noleggio;
    
  
    IF NEW.importo < importo_noleggio THEN
		SET NEW.stato_pagamento = 'Non completato';
	ELSE 
		SET NEW.stato_pagamento = 'Completato';

	END iF;
    
    
    
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'noleggi_camper_db'
--

--
-- Dumping routines for database 'noleggi_camper_db'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-26  0:20:50
