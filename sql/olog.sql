-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb7u1

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
-- Current Database: `olog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `olog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `olog`;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `state` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `attributes_property_id_fk` (`property_id`),
  CONSTRAINT `attributes_property_id_fk` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,1,'TimeBeamLost','Active'),(2,1,'Area','Active'),(3,1,'TimeOccoured','Active'),(4,1,'LogIds','Active'),(5,1,'System','Active'),(6,1,'Device','Active'),(7,1,'Contact','Active'),(8,1,'TimeBeamRestored','Active'),(9,1,'BeamState','Active'),(10,1,'Assign','Active'),(11,1,'TimeCleared','Active');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,'2016-03-27 09:04:58'),(2,'2016-03-27 09:34:28'),(3,'2016-03-27 09:34:44'),(4,'2016-03-27 09:47:48'),(5,'2016-03-29 01:37:20'),(6,'2016-03-30 20:40:20'),(7,'2016-03-30 21:39:18'),(8,'2016-03-30 21:48:50'),(9,'2016-05-09 11:28:52'),(10,'2017-01-23 13:39:55'),(11,'2017-02-20 10:51:47'),(12,'2017-02-20 11:03:42'),(13,'2017-02-20 11:05:40'),(14,'2017-02-20 11:10:25'),(15,'2017-02-20 11:12:35'),(16,'2017-02-20 11:13:40'),(17,'2017-02-20 11:16:57'),(18,'2017-02-20 11:37:54'),(19,'2017-02-20 11:41:31'),(20,'2017-02-20 11:43:17'),(21,'2017-02-20 11:43:35');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logbooks`
--

DROP TABLE IF EXISTS `logbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logbooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `is_tag` int(1) unsigned NOT NULL DEFAULT '0',
  `owner` varchar(45) DEFAULT NULL,
  `state` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logbooks`
--

LOCK TABLES `logbooks` WRITE;
/*!40000 ALTER TABLE `logbooks` DISABLE KEYS */;
INSERT INTO `logbooks` VALUES (1,'Operations',0,NULL,'Active'),(2,'Electronics Maintenance',0,NULL,'Active'),(3,'Mechanical Technicians',0,NULL,'Active'),(4,'LOTO',0,NULL,'Active'),(5,'Inverpower Power Supplies',1,NULL,'Active'),(6,'RF Area',1,NULL,'Active'),(7,'Kicker',1,NULL,'Active'),(8,'Bumps',1,NULL,'Active'),(9,'Septums',1,NULL,'Active'),(10,'Large Power Supplies',1,NULL,'Active'),(11,'Timing Systems',1,NULL,'Active'),(12,'Test',0,'test','Inactive'),(13,'Test2',0,'olog-user','Inactive');
/*!40000 ALTER TABLE `logbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `modified` datetime NOT NULL,
  `source` varchar(80) NOT NULL DEFAULT '',
  `owner` varchar(32) NOT NULL,
  `description` mediumtext NOT NULL,
  `md5entry` varchar(32) NOT NULL DEFAULT '',
  `state` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `level` enum('Info','Problem','Request','Suggestion','Urgent') NOT NULL DEFAULT 'Info',
  `entry_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id_fk` (`entry_id`),
  CONSTRAINT `entry_id_fk` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'2016-03-27 09:04:58','127.0.0.1','olog-user','Creating the first simple entry.\nInstructions for creating log entries\nusername: olog-user\npassword: 1234\n\n?????','','Active','Info',1),(2,'2016-03-27 09:34:28','127.0.0.1','olog-user','Current Alarms\nXF:31IDA-OP{Tbl-Ax:X1}Mtr\nPV                      : XF:31IDA-OP{Tbl-Ax:X1}Mtr\nAlarm Time              : 2016/03/19 11:49:06.000 (Time since event: 189:33:00)\nAlarm Severity/Message  : UNDEFINED/Disconnected\nAlarm Value             : \nCurrent Severity/Message: OK/NO_ALARM\n\n','','Active','Info',2),(3,'2016-03-27 09:34:44','127.0.0.1','olog-user','Data Browser Plot\nSee attached Data Browser plot','','Active','Info',3),(4,'2016-03-27 09:47:48','127.0.0.1','olog-user','Data Browser Plot with configuration file','','Inactive','Info',4),(5,'2016-03-27 10:00:35','127.0.0.1','olog-user','Data Browser Plot with configuration file\n\nEdit: fixing the plot config file with the correct datasources','','Active','Info',4),(6,'2016-03-29 01:37:20','127.0.0.1','olog-user','Motor 1 was moved from 0 to 5\nData Browser Plot\nSee attached Data Browser plot','','Active','Info',5),(7,'2016-03-30 20:40:20','127.0.0.1','olog-user','?????','','Active','Info',6),(8,'2016-03-30 21:39:18','127.0.0.1','olog-user','Plot with context\nData Browser Plot\nSee attached Data Browser plot','','Active','Info',7),(9,'2016-03-30 21:48:50','0:0:0:0:0:0:0:1','olog-user','This is an entry from the webclient','','Active','Info',8),(10,'2016-05-09 11:28:52','127.0.0.1','olog-user','Data Browser Plot\nSee attached Data Browser plot\nAdding text','','Active','Info',9),(11,'2017-01-23 13:39:55','130.199.219.79','olog-user','Save, Set & Restore\n[masarService/SR] SR_All_20140421\nTime: 2017 Jan 19 10:48:40\nComment: zzz-second','','Active','Info',10),(12,'2017-02-20 10:51:47','130.199.219.79','olog-user','ssss\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',11),(13,'2017-02-20 11:03:42','130.199.219.79','olog-user','aaaa\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',12),(14,'2017-02-20 11:05:40','130.199.219.79','olog-user','sss	\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',13),(15,'2017-02-20 11:10:25','130.199.219.79','olog-user','ss\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',14),(16,'2017-02-20 11:12:35','130.199.219.79','olog-user','s\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',15),(17,'2017-02-20 11:13:40','130.199.219.79','olog-user','s\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',16),(18,'2017-02-20 11:16:57','130.199.219.79','olog-user','s	\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',17),(19,'2017-02-20 11:37:54','130.199.219.79','olog-user','s\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',18),(20,'2017-02-20 11:41:31','130.199.219.79','olog-user','a\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',19),(21,'2017-02-20 11:43:17','130.199.219.79','olog-user','dd\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',20),(22,'2017-02-20 11:43:35','130.199.219.79','olog-user','d	\n\nCause:\nnull\n\nRepair:\nnull\n\nCorrective:\nnull','','Active','Problem',21);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_attributes`
--

DROP TABLE IF EXISTS `logs_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(11) unsigned NOT NULL,
  `attribute_id` int(11) unsigned NOT NULL,
  `value` varchar(200) NOT NULL,
  `grouping_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_attributes_attribute_id_fk` (`attribute_id`),
  KEY `logs_attributes_log_id_fk` (`log_id`),
  CONSTRAINT `logs_attributes_attribute_id_fk` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `logs_attributes_log_id_fk` FOREIGN KEY (`log_id`) REFERENCES `logs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_attributes`
--

LOCK TABLES `logs_attributes` WRITE;
/*!40000 ALTER TABLE `logs_attributes` DISABLE KEYS */;
INSERT INTO `logs_attributes` VALUES (1,13,9,'False',0),(2,13,2,'Global',0),(3,13,7,'Kunal Shroff<shroffk@bnl.gov>',0),(4,13,10,'Controls',0),(5,13,6,'M01',0),(6,13,3,'2017-02-20T16:03:21.261Z',0),(7,13,5,'Diagnostics',0),(8,14,6,'M01',0),(9,14,2,'Global',0),(10,14,7,'Kunal Shroff<shroffk@bnl.gov>',0),(11,14,9,'False',0),(12,14,3,'2017-02-20T16:05:14.405Z',0),(13,14,5,'Diagnostics',0),(14,14,10,'Controls',0),(15,15,10,'Controls',0),(16,15,5,'Diagnostics',0),(17,15,2,'Global',0),(18,15,6,'M01',0),(19,15,7,'Kunal Shroff<shroffk@bnl.gov>',0),(20,15,9,'False',0),(21,15,3,'2017-02-20T16:10:00.560Z',0),(22,16,7,'Kunal Shroff<shroffk@bnl.gov>',0),(23,16,5,'Diagnostics',0),(24,16,10,'Controls',0),(25,16,3,'2017-02-20T16:09:59.126Z',0),(26,16,9,'False',0),(27,16,2,'Global',0),(28,16,6,'M01',0),(29,17,3,'2017-02-20T16:09:59.126Z',0),(30,17,5,'Diagnostics',0),(31,17,2,'Global',0),(32,17,6,'M01',0),(33,17,9,'False',0),(34,17,10,'Controls',0),(35,17,7,'Kunal Shroff<shroffk@bnl.gov>',0),(36,18,6,'M01',0),(37,18,7,'Kunal Shroff<shroffk@bnl.gov>',0),(38,18,10,'Controls',0),(39,18,3,'2017-02-20T16:16:47.329Z',0),(40,18,5,'Diagnostics',0),(41,18,9,'False',0),(42,18,2,'Global',0),(43,19,2,'Global',0),(44,19,9,'False',0),(45,19,3,'2017-02-20T16:37:41.962Z',0),(46,19,10,'Controls',0),(47,19,5,'Diagnostics',0),(48,19,6,'M01',0),(49,19,7,'Kunal Shroff<shroffk@bnl.gov>',0),(50,20,3,'2017-02-20T16:41:23.283Z',0),(51,20,6,'M01',0),(52,20,5,'Diagnostics',0),(53,20,9,'False',0),(54,20,2,'Global',0),(55,20,7,'Kunal Shroff<shroffk@bnl.gov>',0),(56,20,10,'Controls',0),(57,21,9,'False',0),(58,21,2,'Global',0),(59,21,6,'M01',0),(60,21,3,'2017-02-20T16:43:07.949Z',0),(61,21,10,'Operations',0),(62,21,5,'Diagnostics',0),(63,21,7,'Reid Smith<smithr@bnl.gov>',0),(64,22,3,'2017-02-20T16:43:23.408Z',0),(65,22,2,'Global',0),(66,22,5,'Diagnostics',0),(67,22,10,'Controls',0),(68,22,6,'M01',0),(69,22,9,'False',0),(70,22,7,'Kunal Shroff<shroffk@bnl.gov>',0);
/*!40000 ALTER TABLE `logs_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_logbooks`
--

DROP TABLE IF EXISTS `logs_logbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_logbooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(11) unsigned NOT NULL,
  `logbook_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_id_fk` (`log_id`),
  KEY `logbook_id_fk` (`logbook_id`) USING BTREE,
  CONSTRAINT `logbook_id_fk` FOREIGN KEY (`logbook_id`) REFERENCES `logbooks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `log_id_fk` FOREIGN KEY (`log_id`) REFERENCES `logs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_logbooks`
--

LOCK TABLES `logs_logbooks` WRITE;
/*!40000 ALTER TABLE `logs_logbooks` DISABLE KEYS */;
INSERT INTO `logs_logbooks` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1);
/*!40000 ALTER TABLE `logs_logbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `state` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'fault','Active');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`),
  KEY `schema_version_vr_idx` (`version_rank`),
  KEY `schema_version_ir_idx` (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` VALUES (1,1,'1.00','Base version','INIT','Base version',NULL,'olog','2016-03-24 21:14:05',0,1),(2,2,'2.00','ALTER logbooks status to state','SQL','V2.00__ALTER_logbooks_status_to_state.sql',-1775352058,'olog','2016-03-24 21:14:05',100,1),(3,3,'2.01','ALTER logs status to state','SQL','V2.01__ALTER_logs_status_to_state.sql',104011789,'olog','2016-03-24 21:14:05',33,1),(4,4,'2.02','ALTER properties status to state','SQL','V2.02__ALTER_properties_status_to_state.sql',-680189563,'olog','2016-03-24 21:14:05',110,1),(5,5,'2.03','ALTER attributes status to state','SQL','V2.03__ALTER_attributes_status_to_state.sql',-207252449,'olog','2016-03-24 21:14:05',93,1),(6,6,'2.04','ALTER logs logbooks drop columns','SQL','V2.04__ALTER_logs_logbooks_drop_columns.sql',-2067581210,'olog','2016-03-24 21:14:05',105,1),(7,7,'2.05','CREATE entries','SQL','V2.05__CREATE_entries.sql',-16098960,'olog','2016-03-24 21:14:05',48,1),(8,8,'2.06','ALTER logs md5recent','SQL','V2.06__ALTER_logs_md5recent.sql',-1367573323,'olog','2016-03-24 21:14:05',50,1),(9,9,'2.07','DROP statuses','SQL','V2.07__DROP_statuses.sql',-1470090610,'olog','2016-03-24 21:14:06',18,1),(10,10,'2.08','ALTER logs level to ENUM','SQL','V2.08__ALTER_logs_level_to_ENUM.sql',-308002669,'olog','2016-03-24 21:14:06',127,1),(11,11,'2.09','DROP levels','SQL','V2.09__DROP_levels.sql',-352522219,'olog','2016-03-24 21:14:06',23,1),(12,12,'2.10','ALTER logs','SQL','V2.10__ALTER_logs.sql',-16433912,'olog','2016-03-24 21:14:06',127,1),(13,13,'2.11','ALTER fix all fkeys','SQL','V2.11__ALTER_fix_all_fkeys.sql',-340063373,'olog','2016-03-24 21:14:07',615,1);
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `webhook` varchar(250) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_tag_id_fk` (`tag_id`),
  CONSTRAINT `subscriptions_tag_id_fk` FOREIGN KEY (`tag_id`) REFERENCES `logbooks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28 17:55:07
