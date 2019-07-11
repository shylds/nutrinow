CREATE DATABASE  IF NOT EXISTS `teste` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `teste`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: teste
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `cardapio`
--

DROP TABLE IF EXISTS `cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardapio` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_lanche1` varchar(100) DEFAULT NULL,
  `car_lanche2` varchar(100) DEFAULT NULL,
  `car_colacao` varchar(100) DEFAULT NULL,
  `car_jantar` varchar(100) DEFAULT NULL,
  `car_almoco` varchar(100) DEFAULT NULL,
  `car_desjejum` varchar(100) DEFAULT NULL,
  `lis_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `lis_id` (`lis_id`),
  CONSTRAINT `cardapio_ibfk_1` FOREIGN KEY (`lis_id`) REFERENCES `lista_equivalente` (`lis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardapio`
--

LOCK TABLES `cardapio` WRITE;
/*!40000 ALTER TABLE `cardapio` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_tipo` varchar(10) DEFAULT NULL,
  `con_horaInicio` time DEFAULT NULL,
  `con_horaFim` time DEFAULT NULL,
  `con_motivoConsulta` varchar(30) DEFAULT NULL,
  `con_dataRet` date DEFAULT NULL,
  `con_dataConsu` date DEFAULT NULL,
  `pac_cpf` varchar(11) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`con_id`),
  KEY `pac_cpf` (`pac_cpf`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`pac_cpf`) REFERENCES `paciente` (`pac_cpf`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `prontuario` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_equivalente`
--

DROP TABLE IF EXISTS `lista_equivalente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_equivalente` (
  `lis_id` int(11) NOT NULL AUTO_INCREMENT,
  `lis_nome` varchar(50) DEFAULT NULL,
  `lis_tipo` varchar(50) DEFAULT NULL,
  `lis_qtde` varchar(4) DEFAULT NULL,
  `lis_descricao` varchar(50) DEFAULT NULL,
  `lis_restricao` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`lis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_equivalente`
--

LOCK TABLES `lista_equivalente` WRITE;
/*!40000 ALTER TABLE `lista_equivalente` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_equivalente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionista`
--

DROP TABLE IF EXISTS `nutricionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionista` (
  `nut_crn` varchar(9) DEFAULT NULL,
  `nut_cpf` varchar(14) NOT NULL,
  `nut_nome` varchar(60) DEFAULT NULL,
  `nut_sexo` enum('M','F') DEFAULT NULL,
  `nut_email` varchar(100) DEFAULT NULL,
  `nut_telefone` varchar(14) DEFAULT NULL,
  `nut_cel1` varchar(15) DEFAULT NULL,
  `nut_dataNasc` date DEFAULT NULL,
  `nut_latitude` double DEFAULT NULL,
  `nut_longitude` double DEFAULT NULL,
  `nut_rua` varchar(50) DEFAULT NULL,
  `nut_cidade` varchar(50) DEFAULT NULL,
  `nut_bairro` varchar(20) DEFAULT NULL,
  `nut_numero` varchar(5) DEFAULT NULL,
  `nut_comple` varchar(30) DEFAULT NULL,
  `nut_usuario` varchar(40) DEFAULT NULL,
  `nut_senha` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`nut_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionista`
--

LOCK TABLES `nutricionista` WRITE;
/*!40000 ALTER TABLE `nutricionista` DISABLE KEYS */;
INSERT INTO `nutricionista` VALUES (NULL,'121.121.798-11','Joselito','M','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-23.690864,-46.562573,NULL,'sao bernardo do campo',NULL,NULL,NULL,'Joselito','3252'),(NULL,'122.122.798-11','João Carlos','M','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-23.700248,-46.547549,NULL,'são bernardo do campo',NULL,NULL,NULL,'João','3252'),(NULL,'333.222.798-11','Maria silva','F','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-23.651218,-46.533748,NULL,'santo andre',NULL,NULL,NULL,'maria','3214'),(NULL,'406.238.798-11','Joana ilva','F','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-7.094825,-34.863985,NULL,'joao Pessoa',NULL,NULL,NULL,'Joana','1234'),(NULL,'444.777.798-11','Jose alves','M','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-23.649558,-46.537878,NULL,'santo andre',NULL,NULL,NULL,'jose','6543'),(NULL,'544.544.798-11','Cacique kurumin','M','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-23.700248,-46.547549,NULL,'Mauá',NULL,NULL,NULL,'kurumin','5454'),(NULL,'666.666.798-11','Carlos Alexandre','M','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-23.659254,-46.535197,NULL,'santo andré',NULL,NULL,NULL,'Carlos','4884'),(NULL,'888.666.798-11','Larissa Manuela','M','@gmail.com','(11)5655-8976','(11)95544-0223',NULL,-23.638903,-46.519149,NULL,'santo andré',NULL,NULL,NULL,'Larissa','4884');
/*!40000 ALTER TABLE `nutricionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `pac_cpf` varchar(14) NOT NULL,
  `pac_nome` varchar(60) NOT NULL,
  `pac_rg` varchar(13) DEFAULT NULL,
  `pac_sexo` enum('M','F') DEFAULT NULL,
  `pac_estadoCivil` varchar(15) DEFAULT NULL,
  `pac_profissao` varchar(60) DEFAULT NULL,
  `pac_email` varchar(100) DEFAULT NULL,
  `pac_telefone` varchar(14) DEFAULT NULL,
  `pac_cel1` varchar(15) DEFAULT NULL,
  `pac_cel2` varchar(15) DEFAULT NULL,
  `pac_dataNasc` date DEFAULT NULL,
  `nut_latidude` decimal(15,10) DEFAULT NULL,
  `nut_longitude` decimal(15,10) DEFAULT NULL,
  `nut_cpf` varchar(14) DEFAULT NULL,
  `pac_rua` varchar(50) DEFAULT NULL,
  `pac_cidade` varchar(50) DEFAULT NULL,
  `pac_bairro` varchar(20) DEFAULT NULL,
  `pac_numero` varchar(5) DEFAULT NULL,
  `pac_comple` varchar(30) DEFAULT NULL,
  `pac_objetivos` varchar(50) DEFAULT NULL,
  `pac_usuario` varchar(40) DEFAULT NULL,
  `pac_senha` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`pac_cpf`),
  KEY `nut_cpf` (`nut_cpf`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`nut_cpf`) REFERENCES `nutricionista` (`nut_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_alimentar`
--

DROP TABLE IF EXISTS `plano_alimentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_alimentar` (
  `pla_id` int(11) NOT NULL AUTO_INCREMENT,
  `pla_plano` tinyint(4) DEFAULT NULL,
  `pla_dataTerm` date DEFAULT NULL,
  `pla_situacao` varchar(2) DEFAULT NULL,
  `pla_dataInicio` date DEFAULT NULL,
  `pla_anotacoes` varchar(200) DEFAULT NULL,
  `pac_cpf` varchar(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pla_id`),
  KEY `pac_cpf` (`pac_cpf`),
  KEY `car_id` (`car_id`),
  KEY `con_id` (`con_id`),
  CONSTRAINT `plano_alimentar_ibfk_1` FOREIGN KEY (`pac_cpf`) REFERENCES `paciente` (`pac_cpf`),
  CONSTRAINT `plano_alimentar_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cardapio` (`car_id`),
  CONSTRAINT `plano_alimentar_ibfk_3` FOREIGN KEY (`con_id`) REFERENCES `consulta` (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_alimentar`
--

LOCK TABLES `plano_alimentar` WRITE;
/*!40000 ALTER TABLE `plano_alimentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano_alimentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prontuario`
--

DROP TABLE IF EXISTS `prontuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prontuario` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_gestante` varchar(1) DEFAULT NULL,
  `pro_ig` varchar(6) DEFAULT NULL,
  `pro_dum` varchar(6) DEFAULT NULL,
  `pro_dpp` varchar(6) DEFAULT NULL,
  `pro_pesoPreGes` decimal(5,2) DEFAULT NULL,
  `pro_ganhoPesoReco` decimal(3,2) DEFAULT NULL,
  `pro_hemoglobina` varchar(7) DEFAULT NULL,
  `pro_triglicerideos` varchar(7) DEFAULT NULL,
  `pro_colesterolTotal` varchar(7) DEFAULT NULL,
  `pro_ldl` varchar(7) DEFAULT NULL,
  `pro_hdl` varchar(7) DEFAULT NULL,
  `pro_vldl` varchar(7) DEFAULT NULL,
  `pro_glicemiaJejum` varchar(7) DEFAULT NULL,
  `pro_glicemiaPandrial` varchar(7) DEFAULT NULL,
  `pro_pressaoArterial` varchar(7) DEFAULT NULL,
  `pro_leucocitos` varchar(7) DEFAULT NULL,
  `pro_ureia` varchar(7) DEFAULT NULL,
  `pro_creatina` varchar(7) DEFAULT NULL,
  `pro_albumina` varchar(7) DEFAULT NULL,
  `pro_dm` varchar(1) DEFAULT NULL,
  `pro_has` varchar(1) DEFAULT NULL,
  `pro_gastrite` varchar(1) DEFAULT NULL,
  `pro_anemia` varchar(1) DEFAULT NULL,
  `pro_avc` varchar(1) DEFAULT NULL,
  `pro_iam` varchar(1) DEFAULT NULL,
  `pro_obesidade` varchar(1) DEFAULT NULL,
  `pro_cancer` varchar(1) DEFAULT NULL,
  `pro_outras` varchar(30) DEFAULT NULL,
  `pro_medicamentos` varchar(1) DEFAULT NULL,
  `pro_qualMed` varchar(20) DEFAULT NULL,
  `pro_suplementos` varchar(1) DEFAULT NULL,
  `pro_qualSuple` varchar(20) DEFAULT NULL,
  `pro_disfagia` varchar(1) DEFAULT NULL,
  `pro_odinofagia` varchar(1) DEFAULT NULL,
  `pro_dispepsia` varchar(1) DEFAULT NULL,
  `pro_pirose` varchar(1) DEFAULT NULL,
  `pro_refluxo` varchar(1) DEFAULT NULL,
  `pro_nausea` varchar(1) DEFAULT NULL,
  `pro_vomito` varchar(1) DEFAULT NULL,
  `pro_flatulencias` varchar(1) DEFAULT NULL,
  `pro_habitoIntestinal` varchar(1) DEFAULT NULL,
  `pro_ritimo` varchar(1) DEFAULT NULL,
  `pro_tabagismo` varchar(1) DEFAULT NULL,
  `pro_frequenciaTabagismo` varchar(15) DEFAULT NULL,
  `pro_etilismo` varchar(1) DEFAULT NULL,
  `pro_frequenciaEtilismo` varchar(15) DEFAULT NULL,
  `pro_horasSono` tinyint(4) DEFAULT NULL,
  `pro_atividadeFisica` varchar(1) DEFAULT NULL,
  `pro_modalidade` varchar(15) DEFAULT NULL,
  `pro_frequenciaAtivFisi` varchar(15) DEFAULT NULL,
  `pro_apetiteAtual` varchar(10) DEFAULT NULL,
  `pro_motivoApetiAtual` varchar(30) DEFAULT NULL,
  `pro_numRefeicoes` tinyint(4) DEFAULT NULL,
  `pro_liquidosRefeicoes` varchar(1) DEFAULT NULL,
  `pro_aversao` varchar(1) DEFAULT NULL,
  `pro_especificarAversao` varchar(25) DEFAULT NULL,
  `pro_alergia` varchar(1) DEFAULT NULL,
  `pro_especificarAlergia` varchar(25) DEFAULT NULL,
  `pro_intolerancia` varchar(1) DEFAULT NULL,
  `pro_especificarIntolerancia` varchar(25) DEFAULT NULL,
  `pro_ingestaoAgua` decimal(3,1) DEFAULT NULL,
  `pro_Preferencia` varchar(20) DEFAULT NULL,
  `pro_ingestaoNaCi` varchar(8) DEFAULT NULL,
  `pro_ingestaoAcucar` varchar(8) DEFAULT NULL,
  `pro_peso` decimal(5,2) DEFAULT NULL,
  `pro_altura` decimal(3,2) DEFAULT NULL,
  `pro_imc` decimal(4,2) DEFAULT NULL,
  `pro_classificacao` varchar(15) DEFAULT NULL,
  `pro_ptMinimo` decimal(5,2) DEFAULT NULL,
  `pro_ptMedio` decimal(5,2) DEFAULT NULL,
  `pro_ptMaximo` decimal(5,2) DEFAULT NULL,
  `pro_pesoDesejavel` decimal(5,2) DEFAULT NULL,
  `pro_anotacao` text,
  `pro_lado` varchar(7) DEFAULT NULL,
  `pro_pct` tinyint(4) DEFAULT NULL,
  `pro_pcs` tinyint(4) DEFAULT NULL,
  `pro_pcb` tinyint(4) DEFAULT NULL,
  `pro_pcam` tinyint(4) DEFAULT NULL,
  `pro_pcsi` tinyint(4) DEFAULT NULL,
  `pro_pca` tinyint(4) DEFAULT NULL,
  `pro_pcp` decimal(3,1) DEFAULT NULL,
  `pro_pccD` decimal(3,1) DEFAULT NULL,
  `pro_pccE` decimal(3,1) DEFAULT NULL,
  `pro_cQuadril` decimal(3,1) DEFAULT NULL,
  `pro_punho` decimal(3,1) DEFAULT NULL,
  `pro_bracoD` decimal(3,1) DEFAULT NULL,
  `pro_bracoE` decimal(3,1) DEFAULT NULL,
  `pro_cCintura` decimal(3,1) DEFAULT NULL,
  `pro_cAbdominal` decimal(3,1) DEFAULT NULL,
  `pro_cPanturrilhaD` decimal(3,1) DEFAULT NULL,
  `pro_cPanturrilhaE` decimal(3,1) DEFAULT NULL,
  `pro_ganhoPeso` varchar(1) DEFAULT NULL,
  `pro_qtdeGanhoPeso` decimal(4,2) DEFAULT NULL,
  `pro_perdaPeso` varchar(1) DEFAULT NULL,
  `pro_qtdePerdaPeso` decimal(4,2) DEFAULT NULL,
  `pro_gorduraCorporal` float DEFAULT NULL,
  `pro_classifGordura` varchar(25) DEFAULT NULL,
  `pro_massaMagra` decimal(4,2) DEFAULT NULL,
  `pro_massaGorda` float(4,2) DEFAULT NULL,
  `pro_vet` decimal(7,2) DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `con_id` (`con_id`),
  CONSTRAINT `prontuario_ibfk_1` FOREIGN KEY (`con_id`) REFERENCES `consulta` (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prontuario`
--

LOCK TABLES `prontuario` WRITE;
/*!40000 ALTER TABLE `prontuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `prontuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-30 21:31:03
