-- MySQL dump 10.13  Distrib 5.7.30, for osx10.12 (x86_64)
--
-- Host: localhost    Database: crafthappylittledinosaurs
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (4,1,1,1,'HLD_newbanner_v1.jpg','image',2880,1149,284790,NULL,NULL,NULL,'2020-12-19 22:12:14','2020-12-19 22:12:14','2020-12-19 22:12:14','b639c041-a463-4b08-be4a-cc1048b792f1'),(5,1,1,1,'Other_Game-Box_1000x1000_LU.jpg','image',1000,1000,96930,NULL,NULL,NULL,'2020-12-19 22:12:15','2020-12-19 22:12:15','2020-12-19 22:12:15','50a8bbbd-82ed-48c0-bb1b-09d9d0b5e361'),(6,1,1,1,'Other_Game-Box_1000x1000_UU.jpg','image',1000,1000,72138,NULL,NULL,NULL,'2020-12-19 22:12:15','2020-12-19 22:12:15','2020-12-19 22:12:15','947ac182-c6ab-44cf-a828-9e76385d5522'),(7,1,1,1,'Other_Game-Box_1000x1000-HTS.jpg','image',1000,1000,109334,NULL,NULL,NULL,'2020-12-19 22:12:16','2020-12-19 22:12:16','2020-12-19 22:12:16','e5fa50e6-a2da-4e6d-b09c-dfbb82d8eb54'),(8,1,1,1,'Take-a-Closer-Look-cards_Disaster_v1.jpg','image',2880,1363,324386,NULL,NULL,NULL,'2020-12-19 22:12:17','2020-12-19 22:12:18','2020-12-19 22:12:18','8c31b05d-22d0-48e8-ba4f-0cfb2a0c162b'),(9,1,1,1,'Take-a-Closer-Look-cards_Instant.jpg','image',2880,1363,261461,NULL,NULL,NULL,'2020-12-19 22:12:19','2020-12-19 22:12:19','2020-12-19 22:12:19','bd656d72-ccc0-4940-b3df-7c27e3051cd6'),(10,1,1,1,'HLD_Exclusive-Box.png','image',600,600,302699,NULL,NULL,NULL,'2020-12-19 22:12:20','2020-12-19 22:12:20','2020-12-19 22:12:20','f31b9d4d-a12e-4147-beb3-fde753fbcf75'),(11,1,1,1,'HLD_Whats-in-the-Box_Base_v1.png','image',1200,630,805682,NULL,NULL,NULL,'2020-12-19 22:12:21','2020-12-19 22:12:21','2020-12-19 22:12:21','abf449ea-acff-4a58-925b-45aea1532d97'),(12,1,1,1,'HLD_Whats-in-the-Box_Expansion_v1.png','image',1200,630,601797,NULL,NULL,NULL,'2020-12-19 22:12:22','2020-12-19 22:12:23','2020-12-19 22:12:23','96720202-d740-44a2-8b04-a897675d5ab5'),(13,1,1,1,'Project-Timeline.png','image',1200,613,263585,NULL,NULL,NULL,'2020-12-19 22:12:23','2020-12-19 22:12:24','2020-12-19 22:12:24','a67ed27d-71b3-467b-8ded-58b037c05a39'),(14,1,1,1,'spacer.png','image',1678,943,831408,NULL,NULL,NULL,'2020-12-19 22:12:26','2020-12-19 22:12:26','2020-12-19 22:12:26','756fde58-5497-47c6-bf96-3cf3d31b2d39'),(15,1,1,1,'Take-a-Closer-Look-Meeples.png','image',1200,315,157508,NULL,NULL,NULL,'2020-12-19 22:12:26','2020-12-19 22:12:26','2020-12-19 22:12:26','172f426d-1555-423f-bf96-014fb7f78e02'),(16,1,1,1,'Take-a-Closer-Look-point.png','image',1200,568,521187,NULL,NULL,NULL,'2020-12-19 22:12:27','2020-12-19 22:12:28','2020-12-19 22:12:28','244c2ddd-7ba1-4e20-9832-61ae28c2aa23'),(17,1,1,1,'unstablegames-logo-new.svg','image',300,58,6889,NULL,NULL,NULL,'2020-12-19 22:12:28','2020-12-19 22:12:28','2020-12-19 22:12:28','b3a9ba43-c8ed-4772-8b33-3899d9ac851e'),(18,2,4,1,'Add-ons_Bronto-Socks.jpg','image',400,320,85750,NULL,NULL,NULL,'2020-12-19 22:14:41','2020-12-19 22:14:41','2020-12-19 22:14:41','a3727e9e-9a9a-42a1-8e69-c34339662099'),(19,2,4,1,'Add-ons_HLD-Socks.jpg','image',400,320,88787,NULL,NULL,NULL,'2020-12-19 22:14:41','2020-12-19 22:14:41','2020-12-19 22:14:41','de84165e-3ddb-40cf-b816-c59e71777078'),(20,2,4,1,'Add-ons-Bad-Day-Bronot-Shirt.jpg','image',400,320,49961,NULL,NULL,NULL,'2020-12-19 22:14:42','2020-12-19 22:14:42','2020-12-19 22:14:42','432a1b2a-e008-41bc-b9e6-d04e03684781'),(21,2,4,1,'Add-ons-Base-Game.jpg','image',400,320,70828,NULL,NULL,NULL,'2020-12-19 22:14:42','2020-12-19 22:14:42','2020-12-19 22:14:42','d8285d47-ca2f-4258-b658-c6e668ab09ea'),(22,2,4,1,'Add-ons-Crushed-Dino-Shirt.jpg','image',400,320,59592,NULL,NULL,NULL,'2020-12-19 22:14:42','2020-12-19 22:14:42','2020-12-19 22:14:42','db892f2c-718f-4fa4-b50f-feb3b07cbb50'),(23,2,4,1,'Add-ons-Expansion.jpg','image',400,320,67496,NULL,NULL,NULL,'2020-12-19 22:14:43','2020-12-19 22:14:43','2020-12-19 22:14:43','c6595659-1b13-46c1-beb0-6180deff7361'),(24,2,4,1,'Add-ons-Nervous-Rex-Shirt.jpg','image',400,320,58425,NULL,NULL,NULL,'2020-12-19 22:14:43','2020-12-19 22:14:43','2020-12-19 22:14:43','4a7f2b5b-f832-4820-b48c-c98e6c312e0d'),(25,2,4,1,'Add-ons-Stego-Plushie.jpg','image',400,320,60166,NULL,NULL,NULL,'2020-12-19 22:14:44','2020-12-19 22:14:44','2020-12-19 22:14:44','1e0e2e46-2e0c-4769-bd53-91cd5dd744af'),(26,2,4,1,'Add-ons-Stego-Shirt.jpg','image',400,320,53195,NULL,NULL,NULL,'2020-12-19 22:14:44','2020-12-19 22:14:44','2020-12-19 22:14:44','86c61ed5-42a0-4477-a301-2903f62d3181'),(27,2,4,1,'featured.jpg','image',600,600,46965,NULL,NULL,NULL,'2020-12-19 22:14:45','2020-12-19 22:14:45','2020-12-19 22:14:45','4417b09f-9c3a-4f58-8a8a-e135bce83360');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransforms_name_idx` (`name`),
  KEY `assettransforms_handle_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (2,1,'title','2020-12-19 22:10:18',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,1,'2020-12-19 22:20:32',0,1),(2,1,4,'2020-12-21 18:27:34',0,1),(2,1,10,'2020-12-20 21:07:14',0,1),(2,1,13,'2020-12-21 18:27:18',0,1),(2,1,19,'2020-12-21 18:28:43',0,1),(2,1,24,'2020-12-21 15:11:48',0,1),(2,1,25,'2020-12-21 15:58:18',0,1),(2,1,30,'2020-12-21 15:13:10',0,1),(2,1,31,'2020-12-21 15:13:28',0,1),(2,1,35,'2020-12-21 16:07:59',0,1),(2,1,36,'2020-12-21 16:07:59',0,1),(3,1,44,'2020-12-21 19:39:21',0,1),(3,1,45,'2020-12-21 19:35:21',0,1),(3,1,46,'2020-12-21 19:39:21',0,1),(3,1,47,'2020-12-21 19:35:21',0,1),(3,1,48,'2020-12-21 19:39:21',0,1),(3,1,49,'2020-12-21 19:41:12',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_shopItemName` text,
  `field_otherGamesTitle` text,
  `field_featuredAddOnTitle` text,
  `field_featuredAddOnArticle` text,
  `field_featuredAddOnDescription` text,
  `field_featuredAddOnCtaText` text,
  `field_shopItemsTitle` text,
  `field_priceTag` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2020-12-19 12:20:24','2020-12-19 12:20:24','421d07fc-6a03-4bc1-9828-b03e403c79a7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,'Happy Little Dinosaurs!','2020-12-19 22:02:59','2020-12-21 18:28:43','bea374d4-d19a-4b05-9b80-a990688ebc31',NULL,'OTHER GAMES',NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,'Shop','2020-12-19 22:03:21','2020-12-21 19:41:12','31d8f12d-7d6e-4cf1-be3a-606429186d75',NULL,NULL,'REVERSIBLE STEGO PLUSHIE','FEATURED ADD-ON','A cancer diagnosis brings out different emotions in patients, families, friends, and caregivers. This plushie supports those on a cancer journey and can help you express your emotions! For each purchase of this plushie, we will donate $5 to the American Cancer Society to support their mission to free the world from cancer.','PREORDER NOW','SHOP ITEMS',NULL),(4,4,1,'HLD newbanner v1','2020-12-19 22:12:13','2020-12-19 22:12:13','299bdb55-c0a3-41dc-af80-6d3fa995b857',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'Other Game Box 1000x1000 LU','2020-12-19 22:12:14','2020-12-19 22:12:14','1f1d60d0-9bd5-4f9f-b7d0-0cc4577bb711',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,6,1,'Other Game Box 1000x1000 UU','2020-12-19 22:12:15','2020-12-19 22:12:15','494f683a-0846-4402-858d-0fedd331f618',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,7,1,'Other Game Box 1000x1000 HTS','2020-12-19 22:12:16','2020-12-19 22:12:16','fee7cff7-cde6-44a1-ab4c-622b19e7e353',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,8,1,'Take a Closer Look cards Disaster v1','2020-12-19 22:12:16','2020-12-19 22:12:16','fe77db6e-27e7-4c8d-8fb6-2384b7868daa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,9,1,'Take a Closer Look cards Instant','2020-12-19 22:12:18','2020-12-19 22:12:18','96af7a4d-10f8-4ce0-8d80-91f45d709299',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,10,1,'HLD Exclusive Box','2020-12-19 22:12:19','2020-12-19 22:12:19','c413fdfa-74d5-4691-9b2f-bf80363b70b6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,11,1,'HLD Whats in the Box Base v1','2020-12-19 22:12:20','2020-12-19 22:12:20','9055315b-f7b7-47e5-b0fb-665995f3eeab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,12,1,'HLD Whats in the Box Expansion v1','2020-12-19 22:12:22','2020-12-19 22:12:22','33d0d2c5-26dd-48e7-a384-64dac7267eb5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,13,1,'Project Timeline','2020-12-19 22:12:23','2020-12-19 22:12:23','2b85610f-0332-49e9-bf13-d72ea18d60ce',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,14,1,'Spacer','2020-12-19 22:12:24','2020-12-19 22:12:24','3b02f2a4-7271-4b2f-b4b4-89b64060ba82',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,15,1,'Take a Closer Look Meeples','2020-12-19 22:12:26','2020-12-19 22:12:26','60d383ab-7e98-4ff6-96e5-a4e0f52b0ada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,16,1,'Take a Closer Look point','2020-12-19 22:12:27','2020-12-19 22:12:27','35b62afa-f454-4c95-a4d6-4b505633f821',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,17,1,'Unstablegames logo new','2020-12-19 22:12:28','2020-12-19 22:12:28','b6fde645-df81-4519-be6e-623e67d245ef',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,18,1,'Add ons Bronto Socks','2020-12-19 22:14:41','2020-12-19 22:14:41','8e40df2b-a18b-4161-b74d-904e829a19d6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,19,1,'Add ons HLD Socks','2020-12-19 22:14:41','2020-12-19 22:14:41','c6c2085b-4f3d-418f-87b7-3732e8cf64a1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,20,1,'Add ons Bad Day Bronot Shirt','2020-12-19 22:14:42','2020-12-19 22:14:42','5e47dbaf-e445-4770-b1b3-f78dbe75bf16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,21,1,'Add ons Base Game','2020-12-19 22:14:42','2020-12-19 22:14:42','1aed2425-f65f-4625-92d4-66f08ae6f981',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,22,1,'Add ons Crushed Dino Shirt','2020-12-19 22:14:42','2020-12-19 22:14:42','74b93865-7014-4976-8a47-90c83a5cf07a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,23,1,'Add ons Expansion','2020-12-19 22:14:43','2020-12-19 22:14:43','ab96e624-03b8-48f0-98ef-736b2a2aaf3e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,24,1,'Add ons Nervous Rex Shirt','2020-12-19 22:14:43','2020-12-19 22:14:43','aa3f457d-1a6f-4c9f-9c41-5463f6157802',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,25,1,'Add ons Stego Plushie','2020-12-19 22:14:44','2020-12-19 22:14:44','5149f3b5-e33c-4de2-a3f1-f407594968be',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,26,1,'Add ons Stego Shirt','2020-12-19 22:14:44','2020-12-19 22:14:44','80e7c382-75e8-4c78-a296-830e6367d5e0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,27,1,'Featured','2020-12-19 22:14:44','2020-12-19 22:14:44','42b61e79-3447-442b-8266-912526addcbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,29,1,'test1','2020-12-20 19:17:35','2020-12-20 19:17:35','cb6c1210-411d-44f6-bdfb-72932ae8e634','test1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,30,1,'test1','2020-12-20 19:17:35','2020-12-20 19:17:35','12dafb81-53e9-48c0-9120-7f21e0910aec','test1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,32,1,'test2','2020-12-20 19:17:42','2020-12-20 19:17:42','66beab2c-e57a-4eb9-97e0-617813d465da','test2',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,33,1,'test2','2020-12-20 19:17:42','2020-12-20 19:17:42','baa9bebb-b295-40d8-a31c-aafb368333bc','test2',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,35,1,'laatste test','2020-12-20 19:17:55','2020-12-20 19:17:55','dd68744e-a192-4beb-983a-8a9939aac0b4','final test',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,36,1,'laatste test','2020-12-20 19:17:55','2020-12-20 19:17:55','a84d0334-571f-4e1b-9789-72ecdadd5bb2','final test',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,37,1,NULL,'2020-12-20 20:44:31','2020-12-20 20:45:56','c7cdf852-756a-4a36-9794-83d19ea9ac60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,52,1,'Happy Little Dinosaurs Base Game','2020-12-21 19:50:19','2020-12-21 19:50:22','cafc3e7a-6c4b-4de8-a304-c316c1e0fcaa','Happy Little Dinosaurs Base Game',NULL,NULL,NULL,NULL,NULL,NULL,'15'),(40,53,1,'Happy Little Dinosaurs Base Game','2020-12-21 19:50:19','2020-12-21 19:50:19','9fca4ec8-7dbb-430a-a07a-98092a7f6131','Happy Little Dinosaurs Base Game',NULL,NULL,NULL,NULL,NULL,NULL,'15'),(41,54,1,'Happy Little Dinosaurs Base Game','2020-12-21 19:50:22','2020-12-21 19:50:22','1fcb3cee-6e5a-4843-924c-995da28a0372','Happy Little Dinosaurs Base Game',NULL,NULL,NULL,NULL,NULL,NULL,'15'),(43,56,1,'Happy Little Dinosaurs 5-6 Player Expansion','2020-12-21 19:50:54','2020-12-21 19:50:54','33796c93-d521-43c9-aea1-a6bd89a530d7','Happy Little Dinosaurs 5-6 Player Expansion',NULL,NULL,NULL,NULL,NULL,NULL,'15'),(44,57,1,'Happy Little Dinosaurs 5-6 Player Expansion','2020-12-21 19:50:54','2020-12-21 19:50:54','4a0dce66-aeec-4c20-8eb9-79120b2848db','Happy Little Dinosaurs 5-6 Player Expansion',NULL,NULL,NULL,NULL,NULL,NULL,'15'),(46,59,1,'Smile, It\'s Almost Over T-Shirt','2020-12-21 19:51:22','2020-12-21 19:51:22','671bd44a-4862-43e8-9baa-983e3320fb42','Smile, It\'s Almost Over T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(47,60,1,'Smile, It\'s Almost Over T-Shirt','2020-12-21 19:51:22','2020-12-21 19:51:22','f686bdd2-2154-4469-a513-5f084fe69353','Smile, It\'s Almost Over T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(49,62,1,'Nervous Rex T-Shirt','2020-12-21 19:51:44','2020-12-21 19:51:44','d5dbc19b-d701-4ea8-8ff4-9a7b610cb136','Nervous Rex T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(50,63,1,'Nervous Rex T-Shirt','2020-12-21 19:51:44','2020-12-21 19:51:44','bb490aef-4ff2-419e-a51a-f182cdebf656','Nervous Rex T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(52,65,1,'Crushed Dino T-Shirt','2020-12-21 19:52:06','2020-12-21 19:52:06','93177d85-6cfc-4f26-afd8-c7e7654208f3','Crushed Dino T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(53,66,1,'Crushed Dino T-Shirt','2020-12-21 19:52:06','2020-12-21 19:52:06','27f162d8-1fa1-48db-bcb6-957896c60533','Crushed Dino T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(55,68,1,'Bad Day Bronto T-Shirt','2020-12-21 19:52:25','2020-12-21 19:52:25','00103bec-5094-41bb-af8e-2fb702379dbf','Bad Day Bronto T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(56,69,1,'Bad Day Bronto T-Shirt','2020-12-21 19:52:25','2020-12-21 19:52:25','8b00d299-0cf5-4373-8f49-ab2281c750ed','Bad Day Bronto T-Shirt',NULL,NULL,NULL,NULL,NULL,NULL,'24'),(58,71,1,'Reversible Stego Plushi','2020-12-21 19:52:47','2020-12-21 19:52:47','89f553dc-b0c4-460a-be72-54af4c2af476','Reversible Stego Plushi',NULL,NULL,NULL,NULL,NULL,NULL,'15'),(59,72,1,'Reversible Stego Plushi','2020-12-21 19:52:48','2020-12-21 19:52:48','cffb736c-4a17-4ac2-a1bb-1305f776f975','Reversible Stego Plushi',NULL,NULL,NULL,NULL,NULL,NULL,'15'),(61,74,1,'Happy Little Dinosaur Socks','2020-12-21 19:53:06','2020-12-21 19:53:06','80e5db3f-e496-41a1-9f83-123b114938d1','Happy Little Dinosaur Socks',NULL,NULL,NULL,NULL,NULL,NULL,'10'),(62,75,1,'Happy Little Dinosaur Socks','2020-12-21 19:53:06','2020-12-21 19:53:06','c7672e0e-eea9-4068-8c17-159f2793cbc3','Happy Little Dinosaur Socks',NULL,NULL,NULL,NULL,NULL,NULL,'10'),(64,77,1,'Bad Day Bronto Socks','2020-12-21 19:53:22','2020-12-21 19:53:22','4c829acc-3378-4dae-ba78-c3345f89e1d3','Bad Day Bronto Socks',NULL,NULL,NULL,NULL,NULL,NULL,'10'),(65,78,1,'Bad Day Bronto Socks','2020-12-21 19:53:22','2020-12-21 19:53:22','8e672c35-cc35-4a25-b893-381058da7370','Bad Day Bronto Socks',NULL,NULL,NULL,NULL,NULL,NULL,'10');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
INSERT INTO `deprecationerrors` VALUES (1,'ElementQuery::getIterator()','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig:5','2020-12-21 19:53:59','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig',5,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":569,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/storage/runtime/compiled_templates/5d/5da73025fa2b74fc0c6de6feb27e15908d9827c6e983636960beb83fb6bdfe60.php\",\"line\":49,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"includes/shop/shopItem\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-12-21 19:53:59','2020-12-21 19:53:59','5f96e9ec-c9a6-4094-a886-cc9f15ecfaf5'),(3,'ElementQuery::last()','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig:1','2020-12-21 19:59:43','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig',1,'The `last()` function used to query for elements is now deprecated. Use `inReverse().one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1890,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::last()\\\", \\\"The `last()` function used to query for elements is now deprecat...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1499,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"last\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"last\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/storage/runtime/compiled_templates/5d/5da73025fa2b74fc0c6de6feb27e15908d9827c6e983636960beb83fb6bdfe60.php\",\"line\":38,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"last\\\", ...\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"includes/shop/shopItem\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-12-21 19:59:43','2020-12-21 19:59:43','55f8bdb3-e668-4e1a-aa46-2a37fce37d31'),(4,'ElementQuery::first()','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig:1','2020-12-21 19:59:47','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig',1,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1875,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1499,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/storage/runtime/compiled_templates/5d/5da73025fa2b74fc0c6de6feb27e15908d9827c6e983636960beb83fb6bdfe60.php\",\"line\":38,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"includes/shop/shopItem\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-12-21 19:59:47','2020-12-21 19:59:47','89b4ec5c-9f50-4788-b22e-11eae1ff58a4'),(5,'ElementQuery::getIterator()','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig:7','2020-12-21 20:02:36','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig',7,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":569,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/storage/runtime/compiled_templates/5d/5da73025fa2b74fc0c6de6feb27e15908d9827c6e983636960beb83fb6bdfe60.php\",\"line\":45,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"includes/shop/shopItem\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-12-21 20:02:36','2020-12-21 20:02:36','474f310e-3a92-4020-84a3-523ae76d82dd'),(8,'ElementQuery::getIterator()','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig:10','2020-12-21 20:04:03','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig',10,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":569,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/storage/runtime/compiled_templates/5d/5da73025fa2b74fc0c6de6feb27e15908d9827c6e983636960beb83fb6bdfe60.php\",\"line\":45,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"includes/shop/shopItem\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\", ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\", ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-12-21 20:04:03','2020-12-21 20:04:03','0b240cce-28a9-452d-b66b-33c525155d07'),(10,'ElementQuery::getIterator()','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig:15','2020-12-21 20:05:21','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig',15,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":569,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/storage/runtime/compiled_templates/5d/5da73025fa2b74fc0c6de6feb27e15908d9827c6e983636960beb83fb6bdfe60.php\",\"line\":59,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"includes/shop/shopItem\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"limit\\\" => \\\"2\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-12-21 20:05:22','2020-12-21 20:05:22','fc265294-8bc2-4902-8b68-7b2d9b159cda'),(12,'ElementQuery::getIterator()','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig:13','2020-12-21 20:36:48','/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/templates/includes/shop/shopItem.twig',13,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":569,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/storage/runtime/compiled_templates/5d/5da73025fa2b74fc0c6de6feb27e15908d9827c6e983636960beb83fb6bdfe60.php\",\"line\":54,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_0cb8f6173b94d1ea20767a88dc44cbf66f5325e10934281dddc56ccb5354bdf7\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"includes/shop/shopItem\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"includes/shop/shopItem\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"skip\\\" => \\\"0\\\", ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"skip\\\" => \\\"0\\\", ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"skip\\\" => \\\"0\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"skip\\\" => \\\"0\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"includes/shop/shopItem\\\", \\\"p\\\" => \\\"api/shopitems\\\", \\\"skip\\\" => \\\"0\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/jochenpanjaer/JP Graphics/Web development/Projects/craft-happylittledinosaurs/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-12-21 20:36:48','2020-12-21 20:36:48','db3f29bf-cfae-4d98-afc0-283235c87ef7');
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-12-19 12:20:24','2020-12-19 12:20:24',NULL,'61e5694c-0e87-4cf8-85b4-e404cb12b7dc'),(2,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-12-19 22:02:59','2020-12-21 18:28:43',NULL,'82bc2927-66ae-4953-a28f-fd4e7e50c63a'),(3,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2020-12-19 22:03:21','2020-12-21 19:41:12',NULL,'2198dcea-0c06-47cd-accc-6f44e9b0b639'),(4,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:13','2020-12-19 22:12:13',NULL,'08956171-4bbe-4657-8eb5-fef8135f4cc7'),(5,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:14','2020-12-19 22:12:14',NULL,'1a0f74d6-36c9-4fe7-a8b6-e4b7290cf539'),(6,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:15','2020-12-19 22:12:15',NULL,'a946d9a5-9d76-42f9-9387-1ccfd76445aa'),(7,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:16','2020-12-19 22:12:16',NULL,'98e49f2d-a7fa-494c-81b9-db702898fe91'),(8,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:16','2020-12-19 22:12:16',NULL,'e101e607-76fe-4d95-a628-c98eec02030b'),(9,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:18','2020-12-19 22:12:18',NULL,'55c5548f-7e26-4ae7-b225-0e5603460156'),(10,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:19','2020-12-19 22:12:19',NULL,'2bdc4eca-2251-4900-865e-32681f07fcc3'),(11,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:20','2020-12-19 22:12:20',NULL,'1e0002a1-c2c2-4b87-bb9d-cdee4d08a500'),(12,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:22','2020-12-19 22:12:22',NULL,'de887ba1-dec7-487f-8200-39fc72c60b79'),(13,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:23','2020-12-19 22:12:23',NULL,'9f92047c-1958-41f3-859b-29d461267c35'),(14,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:24','2020-12-19 22:12:24',NULL,'37661d94-1269-492e-a2f9-dd8ba20d8f01'),(15,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:26','2020-12-19 22:12:26',NULL,'0128e746-b367-4ac9-9db7-02f3ece25202'),(16,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:27','2020-12-19 22:12:27',NULL,'ed1362bb-46a3-48d2-b1f0-56cb9e740982'),(17,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2020-12-19 22:12:28','2020-12-19 22:12:28',NULL,'2e316cb6-7083-4406-99b8-23bd54acbee2'),(18,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:41','2020-12-19 22:14:41',NULL,'5a020e33-4560-408e-b68b-b13c4521f271'),(19,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:41','2020-12-19 22:14:41',NULL,'817b61d8-32df-4ad1-ac51-2fa54544a2a8'),(20,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:42','2020-12-19 22:14:42',NULL,'d0c6b01e-af22-4d37-8a93-defd5a5f64f8'),(21,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:42','2020-12-19 22:14:42',NULL,'712816c8-7024-46da-bec1-2343cea4ed14'),(22,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:42','2020-12-19 22:14:42',NULL,'8caf25a7-0d66-4290-9aad-1efae99523c2'),(23,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:43','2020-12-19 22:14:43',NULL,'714ac063-52f4-477e-a06f-8f61c7254570'),(24,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:43','2020-12-19 22:14:43',NULL,'e8996c69-57be-4929-8e61-d70dc05c6ab0'),(25,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:44','2020-12-19 22:14:44',NULL,'166ea7b5-1b9c-4854-9fcf-13c5bbb4cdaf'),(26,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:44','2020-12-19 22:14:44',NULL,'7e777f7c-04cc-40c3-aaed-8187dcecc246'),(27,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-19 22:14:44','2020-12-19 22:14:44',NULL,'2f5f2c00-a669-4ad6-8115-e4035513b2b3'),(29,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-20 19:17:35','2020-12-20 19:17:35','2020-12-20 21:04:24','4aae56fd-de3f-4fa2-be24-6e69d9b9934f'),(30,NULL,1,5,'craft\\elements\\Entry',1,0,'2020-12-20 19:17:35','2020-12-20 19:17:35','2020-12-20 21:04:24','935952ce-cb8e-4846-81ff-1b98b654e673'),(32,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-20 19:17:42','2020-12-20 19:17:42','2020-12-20 21:04:24','232e0a55-c7ae-4767-87cb-e9219632b8b5'),(33,NULL,2,5,'craft\\elements\\Entry',1,0,'2020-12-20 19:17:42','2020-12-20 19:17:42','2020-12-20 21:04:24','ad7112d3-f0b2-45be-8d2a-3ef5b1662ef8'),(35,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-20 19:17:55','2020-12-20 19:17:55','2020-12-20 21:04:24','8d525517-0e0c-4ef4-b302-d22552cb4e38'),(36,NULL,3,5,'craft\\elements\\Entry',1,0,'2020-12-20 19:17:55','2020-12-20 19:17:55','2020-12-20 21:04:24','d2b52f99-5add-463d-bf95-d7d15b2cd551'),(37,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2020-12-20 20:44:31','2020-12-20 20:45:56',NULL,'d8506888-7b66-4b28-a8f2-2ce6767d6144'),(38,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2020-12-20 21:07:14','2020-12-21 18:27:34',NULL,'8084372d-2c11-4755-b353-7d450c0e455d'),(39,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2020-12-20 21:07:14','2020-12-20 21:07:14',NULL,'c95f2365-ecd2-4c1b-8595-e20d0c66883a'),(40,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:09:59','2020-12-21 18:27:18',NULL,'0606002a-e1f0-4e5e-a0c4-512805a12639'),(41,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:11:48','2020-12-21 18:28:43',NULL,'9a4c1d9e-4b6e-4271-b6bd-3916028a1bd9'),(42,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:11:48','2020-12-21 18:28:43',NULL,'e93fcfbc-4772-447b-85fd-3e718970823c'),(43,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:13:09','2020-12-21 15:13:09',NULL,'37fb0071-9004-4569-9416-485a0446cb54'),(44,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:13:09','2020-12-21 15:58:18',NULL,'4cbcfbda-eeec-4254-9b74-4a8065a70e29'),(45,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:13:09','2020-12-21 15:13:09',NULL,'595aa472-ac60-456f-9312-f8f502a5bec9'),(46,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:13:09','2020-12-21 15:13:09',NULL,'770e6d87-825e-4898-a894-5d5ad1f96b28'),(47,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 15:13:28','2020-12-21 15:13:28',NULL,'00c4e9a1-351e-46f9-98bc-6e5bed2f1cad'),(48,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 16:07:59','2020-12-21 16:07:59',NULL,'8fe213bc-68fc-4dff-8c7a-2d8e995dd7d7'),(49,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 16:07:59','2020-12-21 16:07:59',NULL,'e0c876a1-9675-4f17-b65b-744cfaf6a6e8'),(50,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2020-12-21 16:07:59','2020-12-21 16:07:59',NULL,'e090f075-90b6-43db-a641-ac250676511f'),(52,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:50:19','2020-12-21 19:50:22',NULL,'f716d95c-9d7e-4184-9d6a-033ba713bd92'),(53,NULL,4,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:50:19','2020-12-21 19:50:19',NULL,'aa54fe16-b846-41ea-83dc-3625930e9c97'),(54,NULL,5,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:50:22','2020-12-21 19:50:22',NULL,'a2bf4a41-df57-4fd1-8d45-9195a5f9d70c'),(56,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:50:54','2020-12-21 19:50:54',NULL,'7d354732-b6fa-4b41-8ff8-92dbba31456b'),(57,NULL,6,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:50:54','2020-12-21 19:50:54',NULL,'939fb82a-de5e-4ed1-9641-12a2fa4594d0'),(59,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:51:22','2020-12-21 19:51:22',NULL,'826f626c-8c0f-41dd-9fa9-78dc7cbcfb9e'),(60,NULL,7,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:51:22','2020-12-21 19:51:22',NULL,'00db358f-c935-4ca4-a6d3-9f6c88cd2dda'),(62,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:51:44','2020-12-21 19:51:44',NULL,'3aabf413-3b8b-41f5-bd9a-6c55ea5e9c9b'),(63,NULL,8,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:51:44','2020-12-21 19:51:44',NULL,'3161730d-31e3-4217-a30a-9c355eacf996'),(65,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:52:06','2020-12-21 19:52:06',NULL,'647a6134-a201-48e9-93d1-d96b0b5eb71b'),(66,NULL,9,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:52:06','2020-12-21 19:52:06',NULL,'275384ff-b835-4a87-a17f-a594ee06623d'),(68,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:52:25','2020-12-21 19:52:25',NULL,'4a127e0b-d211-4c1b-9e9e-93b063274656'),(69,NULL,10,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:52:25','2020-12-21 19:52:25',NULL,'c3ec3f8a-125d-4062-bd1a-19fd352937e6'),(71,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:52:47','2020-12-21 19:52:47',NULL,'6482ef64-1cce-471b-a887-0e22c77a88d0'),(72,NULL,11,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:52:47','2020-12-21 19:52:47',NULL,'bd87917b-f207-4af1-bab0-d23e097c7c17'),(74,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:53:06','2020-12-21 19:53:06',NULL,'a49903e7-3687-4c73-9928-8d415893a185'),(75,NULL,12,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:53:06','2020-12-21 19:53:06',NULL,'7cf81499-35ca-4524-b774-b849c46f4b7b'),(77,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:53:22','2020-12-21 19:53:22',NULL,'dda01e6e-cd35-4a4c-ae22-bbdf4c96b6d3'),(78,NULL,13,5,'craft\\elements\\Entry',1,0,'2020-12-21 19:53:22','2020-12-21 19:53:22',NULL,'ae5d96dc-03b0-4341-959a-265bbbf7c7bf');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-12-19 12:20:24','2020-12-19 12:20:24','bad182e8-bc7a-4c4c-8efd-59ef02e85e88'),(2,2,1,'home','__home__',1,'2020-12-19 22:02:59','2020-12-19 22:02:59','cf063f85-a440-4815-be31-7b1102bb2764'),(3,3,1,'shop','shop',1,'2020-12-19 22:03:21','2020-12-19 22:03:21','b80bed48-2bb9-4da7-b12a-24c494100cb7'),(4,4,1,NULL,NULL,1,'2020-12-19 22:12:13','2020-12-19 22:12:13','1d6ed76f-fee4-49f0-8186-fa8d27adcf6f'),(5,5,1,NULL,NULL,1,'2020-12-19 22:12:14','2020-12-19 22:12:14','3962ef21-4d78-425a-8d30-744d10b0b949'),(6,6,1,NULL,NULL,1,'2020-12-19 22:12:15','2020-12-19 22:12:15','79da1bac-ae31-4032-9e41-2b2079c4b75b'),(7,7,1,NULL,NULL,1,'2020-12-19 22:12:16','2020-12-19 22:12:16','3f83dc66-b705-4623-9df0-3ba32bbe6c95'),(8,8,1,NULL,NULL,1,'2020-12-19 22:12:16','2020-12-19 22:12:16','8660e13b-0cb7-4c60-a10c-d345a62d754d'),(9,9,1,NULL,NULL,1,'2020-12-19 22:12:18','2020-12-19 22:12:18','525aa7b9-ed2c-4753-af27-3eaad729125e'),(10,10,1,NULL,NULL,1,'2020-12-19 22:12:19','2020-12-19 22:12:19','43a6914c-f9b7-43b6-b00b-ff793a3a484b'),(11,11,1,NULL,NULL,1,'2020-12-19 22:12:20','2020-12-19 22:12:20','4079e3ea-eb69-4538-9f34-77222c58721f'),(12,12,1,NULL,NULL,1,'2020-12-19 22:12:22','2020-12-19 22:12:22','57934527-dad0-4002-81a8-3f3afed886ab'),(13,13,1,NULL,NULL,1,'2020-12-19 22:12:23','2020-12-19 22:12:23','b47c01c3-44ba-4fa5-be22-e8aca0a881c2'),(14,14,1,NULL,NULL,1,'2020-12-19 22:12:24','2020-12-19 22:12:24','2b45f473-3556-4575-8181-f37e01f27e54'),(15,15,1,NULL,NULL,1,'2020-12-19 22:12:26','2020-12-19 22:12:26','0913e6a4-eb12-4bb7-b0d9-3ab4998a6872'),(16,16,1,NULL,NULL,1,'2020-12-19 22:12:27','2020-12-19 22:12:27','8a8433a8-a1b6-45f2-9a05-e8a4d66666f9'),(17,17,1,NULL,NULL,1,'2020-12-19 22:12:28','2020-12-19 22:12:28','f76630f7-c156-4b81-9e25-601e3572bd20'),(18,18,1,NULL,NULL,1,'2020-12-19 22:14:41','2020-12-19 22:14:41','79e792b5-a235-4d49-8eed-efa3a5fc6ceb'),(19,19,1,NULL,NULL,1,'2020-12-19 22:14:41','2020-12-19 22:14:41','e14dbc37-dac4-4da4-a9b0-17a6b585d4f3'),(20,20,1,NULL,NULL,1,'2020-12-19 22:14:42','2020-12-19 22:14:42','67e61c9f-38c1-4dfd-acdc-a51df7d1e944'),(21,21,1,NULL,NULL,1,'2020-12-19 22:14:42','2020-12-19 22:14:42','bb2a8ee4-b809-40b6-90be-178879cc0aa0'),(22,22,1,NULL,NULL,1,'2020-12-19 22:14:42','2020-12-19 22:14:42','d9158759-47e9-40fa-9bfe-c2285ac763e1'),(23,23,1,NULL,NULL,1,'2020-12-19 22:14:43','2020-12-19 22:14:43','2f93d567-2a2b-4e68-8907-dffc64222289'),(24,24,1,NULL,NULL,1,'2020-12-19 22:14:43','2020-12-19 22:14:43','2029f997-3f12-46f6-b42b-ee29e5d6f969'),(25,25,1,NULL,NULL,1,'2020-12-19 22:14:44','2020-12-19 22:14:44','aa527d7a-b885-4cc6-b995-c52c0f44ef3f'),(26,26,1,NULL,NULL,1,'2020-12-19 22:14:44','2020-12-19 22:14:44','983bfb0d-952f-4906-be66-1a5976b5bc97'),(27,27,1,NULL,NULL,1,'2020-12-19 22:14:44','2020-12-19 22:14:44','f01be161-31cc-4d88-91e5-b86cbae871fb'),(29,29,1,'test1',NULL,1,'2020-12-20 19:17:35','2020-12-20 19:17:35','4ccade90-faf0-46b0-9db1-d8b76692504f'),(30,30,1,'test1',NULL,1,'2020-12-20 19:17:35','2020-12-20 19:17:35','5e48e973-bb54-485d-b173-12feeb29f4db'),(32,32,1,'test2',NULL,1,'2020-12-20 19:17:42','2020-12-20 19:17:42','afa28396-89fe-4d63-a53c-ce4ea43f799b'),(33,33,1,'test2',NULL,1,'2020-12-20 19:17:42','2020-12-20 19:17:42','aa8cd8b7-2b4a-4cbd-84a2-33f78a6c012e'),(35,35,1,'laatste-test',NULL,1,'2020-12-20 19:17:55','2020-12-20 19:17:55','e9282b63-99e9-4c9c-9985-12d3c05ef4d9'),(36,36,1,'laatste-test',NULL,1,'2020-12-20 19:17:55','2020-12-20 19:17:55','abc31f0a-0312-46ea-8b8d-0efdf4a29120'),(37,37,1,NULL,NULL,1,'2020-12-20 20:44:31','2020-12-20 20:44:31','4f182ba2-3db7-4ad9-b0bc-6ea8ddc4d382'),(38,38,1,NULL,NULL,1,'2020-12-20 21:07:14','2020-12-20 21:07:14','ce73caf8-bab1-49bc-85e5-6ae6fc2f440e'),(39,39,1,NULL,NULL,1,'2020-12-20 21:07:14','2020-12-20 21:07:14','1c75877e-8ce9-45c0-a92b-efd697278c44'),(40,40,1,NULL,NULL,1,'2020-12-21 15:09:59','2020-12-21 15:09:59','59d789fb-7df0-4506-8006-997aadfc3965'),(41,41,1,NULL,NULL,1,'2020-12-21 15:11:48','2020-12-21 15:11:48','da39b69c-c323-4e3b-b651-275c85711589'),(42,42,1,NULL,NULL,1,'2020-12-21 15:11:48','2020-12-21 15:11:48','a6285039-734a-433e-a571-3e71996d769b'),(43,43,1,NULL,NULL,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','e0ab80f0-cbbb-4859-9fd1-6974e5f7a99f'),(44,44,1,NULL,NULL,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','ce22a152-2456-474e-9f55-f6f666e38e08'),(45,45,1,NULL,NULL,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','f408b4e0-66ab-4eb2-b748-dfc0b51fa8e8'),(46,46,1,NULL,NULL,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','0acb8e02-5358-425c-ab60-0c2961a3e05c'),(47,47,1,NULL,NULL,1,'2020-12-21 15:13:28','2020-12-21 15:13:28','c1376e1e-3f54-406e-b2f5-4e6ecda5f648'),(48,48,1,NULL,NULL,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','439f4562-5fed-45ad-bdf7-fd90500d75e7'),(49,49,1,NULL,NULL,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','3e870eb1-f899-4231-a745-a2078fe5e36c'),(50,50,1,NULL,NULL,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','56e04df0-de76-43fa-86fc-7074e1bd64ff'),(52,52,1,'happy-little-dinosaurs-base-game',NULL,1,'2020-12-21 19:50:19','2020-12-21 19:50:19','5d8679cf-783f-40a4-850d-fb0362b77164'),(53,53,1,'happy-little-dinosaurs-base-game',NULL,1,'2020-12-21 19:50:19','2020-12-21 19:50:19','294f1fdb-e5af-4962-8ac7-234ed91a9976'),(54,54,1,'happy-little-dinosaurs-base-game',NULL,1,'2020-12-21 19:50:22','2020-12-21 19:50:22','152196dc-bffd-4fcd-b3e4-018a571a0085'),(56,56,1,'happy-little-dinosaurs-5-6-player-expansion',NULL,1,'2020-12-21 19:50:54','2020-12-21 19:50:54','f524549b-721e-42c4-9094-f1f2ed841397'),(57,57,1,'happy-little-dinosaurs-5-6-player-expansion',NULL,1,'2020-12-21 19:50:54','2020-12-21 19:50:54','d1f6f969-dd56-43ed-b5e8-23c360d4f8a1'),(59,59,1,'smile-its-almost-over-t-shirt',NULL,1,'2020-12-21 19:51:22','2020-12-21 19:51:22','c7a250b4-a638-430c-b36f-b01b39e9f528'),(60,60,1,'smile-its-almost-over-t-shirt',NULL,1,'2020-12-21 19:51:22','2020-12-21 19:51:22','3e8b7bd9-5f80-4400-a162-dbbe343d161b'),(62,62,1,'nervous-rex-t-shirt',NULL,1,'2020-12-21 19:51:44','2020-12-21 19:51:44','11fcfbd3-8811-408b-ba9b-ebdd43e14adc'),(63,63,1,'nervous-rex-t-shirt',NULL,1,'2020-12-21 19:51:44','2020-12-21 19:51:44','353213ca-59ec-4bc4-b798-27620129eacd'),(65,65,1,'crushed-dino-t-shirt',NULL,1,'2020-12-21 19:52:06','2020-12-21 19:52:06','bafacc77-f419-44b4-ae2f-4e03bf91b711'),(66,66,1,'crushed-dino-t-shirt',NULL,1,'2020-12-21 19:52:06','2020-12-21 19:52:06','4c9104dd-6b56-4389-baa7-9ec6b797b887'),(68,68,1,'bad-day-bronto-t-shirt',NULL,1,'2020-12-21 19:52:25','2020-12-21 19:52:25','f500123c-085f-4260-9c61-2e0c39620b62'),(69,69,1,'bad-day-bronto-t-shirt',NULL,1,'2020-12-21 19:52:25','2020-12-21 19:52:25','c524790e-7dd1-4d3b-9243-dd6aff3011c7'),(71,71,1,'reversible-stego-plushi',NULL,1,'2020-12-21 19:52:47','2020-12-21 19:52:47','25550912-80c8-47f4-a7b2-98811eab2fa8'),(72,72,1,'reversible-stego-plushi',NULL,1,'2020-12-21 19:52:48','2020-12-21 19:52:48','a760d7d0-ec53-4fb6-81a3-aa658193c4f5'),(74,74,1,'happy-little-dinosaur-socks',NULL,1,'2020-12-21 19:53:06','2020-12-21 19:53:06','673fc8f6-e58d-423f-97ec-ec54392e0478'),(75,75,1,'happy-little-dinosaur-socks',NULL,1,'2020-12-21 19:53:06','2020-12-21 19:53:06','58c25c64-9b41-4a26-be5f-96a659709210'),(77,77,1,'bad-day-bronto-socks',NULL,1,'2020-12-21 19:53:22','2020-12-21 19:53:22','92612ef0-d14c-4f64-b4ff-f4596e10927d'),(78,78,1,'bad-day-bronto-socks',NULL,1,'2020-12-21 19:53:22','2020-12-21 19:53:22','aeabd347-5850-4ec2-959a-917c5f2e6523');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2020-12-19 22:02:00',NULL,NULL,'2020-12-19 22:02:59','2020-12-19 22:02:59','f6ad8ac2-5e72-4728-8d81-7e5b775bfb81'),(3,2,NULL,2,NULL,'2020-12-19 22:03:00',NULL,NULL,'2020-12-19 22:03:21','2020-12-19 22:03:21','3773cda6-304b-48e9-beaa-8b587bdeddc0'),(29,3,NULL,3,1,'2020-12-20 19:17:00',NULL,0,'2020-12-20 19:17:35','2020-12-20 19:17:35','7ad81176-ec2f-47a9-86e5-27b29c043309'),(30,3,NULL,3,1,'2020-12-20 19:17:00',NULL,NULL,'2020-12-20 19:17:35','2020-12-20 19:17:35','b7b1f8f7-23ed-4c0c-bdf7-1233318e5631'),(32,3,NULL,3,1,'2020-12-20 19:17:00',NULL,0,'2020-12-20 19:17:42','2020-12-20 19:17:42','1efb2f53-b292-453e-a7be-130902da901e'),(33,3,NULL,3,1,'2020-12-20 19:17:00',NULL,NULL,'2020-12-20 19:17:42','2020-12-20 19:17:42','74de1d27-f853-45f1-80f3-bce61c947645'),(35,3,NULL,3,1,'2020-12-20 19:17:00',NULL,0,'2020-12-20 19:17:55','2020-12-20 19:17:55','19830436-13da-4016-8795-1bca3dad6df4'),(36,3,NULL,3,1,'2020-12-20 19:17:00',NULL,NULL,'2020-12-20 19:17:55','2020-12-20 19:17:55','9d7a2dc8-844a-43a2-980a-893ef9c5f3f4'),(52,3,NULL,3,1,'2020-12-21 19:49:00',NULL,NULL,'2020-12-21 19:50:19','2020-12-21 19:50:19','3c1369ce-e46a-444a-9d12-015c49bee788'),(53,3,NULL,3,1,'2020-12-21 19:49:00',NULL,NULL,'2020-12-21 19:50:19','2020-12-21 19:50:19','6299464c-b48d-4ac8-b540-9585e904c778'),(54,3,NULL,3,1,'2020-12-21 19:49:00',NULL,NULL,'2020-12-21 19:50:22','2020-12-21 19:50:22','9b77404f-6a58-443b-99ed-e7c91d57bf66'),(56,3,NULL,3,1,'2020-12-21 19:50:00',NULL,NULL,'2020-12-21 19:50:54','2020-12-21 19:50:54','2e335c18-0270-477c-85be-16f005ae1597'),(57,3,NULL,3,1,'2020-12-21 19:50:00',NULL,NULL,'2020-12-21 19:50:54','2020-12-21 19:50:54','b3514c85-3414-4670-b9cf-6859be65cc51'),(59,3,NULL,3,1,'2020-12-21 19:51:00',NULL,NULL,'2020-12-21 19:51:22','2020-12-21 19:51:22','3c6e5b0c-51ef-40bf-88db-87a505353228'),(60,3,NULL,3,1,'2020-12-21 19:51:00',NULL,NULL,'2020-12-21 19:51:22','2020-12-21 19:51:22','319c19a9-9723-4974-88ce-548f270aae62'),(62,3,NULL,3,1,'2020-12-21 19:51:00',NULL,NULL,'2020-12-21 19:51:44','2020-12-21 19:51:44','fc1575c3-99b2-49dc-bc09-97af4d68ae90'),(63,3,NULL,3,1,'2020-12-21 19:51:00',NULL,NULL,'2020-12-21 19:51:44','2020-12-21 19:51:44','cb5e75dd-1cfb-4098-8221-616667fce9f0'),(65,3,NULL,3,1,'2020-12-21 19:51:00',NULL,NULL,'2020-12-21 19:52:06','2020-12-21 19:52:06','0dba8f19-7c90-46f8-b059-cce131580fad'),(66,3,NULL,3,1,'2020-12-21 19:51:00',NULL,NULL,'2020-12-21 19:52:06','2020-12-21 19:52:06','39196378-02fb-46bd-880e-73172c7e4c2b'),(68,3,NULL,3,1,'2020-12-21 19:52:00',NULL,NULL,'2020-12-21 19:52:25','2020-12-21 19:52:25','cdfdd918-2abe-419d-9446-4850e29cd1f5'),(69,3,NULL,3,1,'2020-12-21 19:52:00',NULL,NULL,'2020-12-21 19:52:25','2020-12-21 19:52:25','63041e85-40f1-49fe-b8bc-540a5b9f2421'),(71,3,NULL,3,1,'2020-12-21 19:52:00',NULL,NULL,'2020-12-21 19:52:47','2020-12-21 19:52:47','b1b3ab44-58f2-4edf-9ea0-200679cfd4dd'),(72,3,NULL,3,1,'2020-12-21 19:52:00',NULL,NULL,'2020-12-21 19:52:48','2020-12-21 19:52:48','81a365c6-9d2f-4cc3-8e4b-d46f8f5ed96b'),(74,3,NULL,3,1,'2020-12-21 19:52:00',NULL,NULL,'2020-12-21 19:53:06','2020-12-21 19:53:06','be99f464-96a6-4635-b6d2-60dd76f9fd48'),(75,3,NULL,3,1,'2020-12-21 19:52:00',NULL,NULL,'2020-12-21 19:53:06','2020-12-21 19:53:06','6c117786-a162-436b-89b2-5d039fa0d235'),(77,3,NULL,3,1,'2020-12-21 19:53:00',NULL,NULL,'2020-12-21 19:53:22','2020-12-21 19:53:22','25d2fba5-fbd7-4dd3-bde8-9c524d119b19'),(78,3,NULL,3,1,'2020-12-21 19:53:00',NULL,NULL,'2020-12-21 19:53:22','2020-12-21 19:53:22','9c07ff88-4aec-4222-bdb6-811eb4961e51');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',1,'site',NULL,'{section.name|raw}',1,'2020-12-19 22:02:59','2020-12-19 22:09:13',NULL,'0b78803e-d19b-4bb5-b116-44071013c23f'),(2,2,2,'Shop','shop',0,'site',NULL,'{section.name|raw}',1,'2020-12-19 22:03:21','2020-12-19 22:03:21',NULL,'d63213ff-29d6-4652-978f-33ba52c0d6ab'),(3,3,5,'Shop Item','shopItem',1,'site',NULL,NULL,1,'2020-12-20 19:15:50','2020-12-20 19:15:50',NULL,'9e13f8c0-be0a-4ae0-93c0-1e36dd4da564');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldgroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2020-12-19 12:20:24','2020-12-19 12:20:24','ea7b6f89-efe1-41a4-91f4-b71958991fa3'),(2,'home','2020-12-19 22:15:34','2020-12-19 22:15:34','224285f8-6c4e-4c27-a6d6-0de6b628ee60'),(3,'shop','2020-12-19 22:15:37','2020-12-19 22:15:37','bfc9c07c-7d33-484e-b559-1eb1dac8b00a'),(4,'shopItem','2020-12-20 19:16:34','2020-12-20 19:16:34','f6daf363-3490-4a78-8d3b-75915a9d7d1a');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (3,6,11,3,0,0,'2020-12-20 20:45:37','2020-12-20 20:45:37','df6f93f6-4087-4346-9b0e-5fe73feac4fc'),(14,8,14,11,0,0,'2020-12-20 21:03:30','2020-12-20 21:03:30','f9ab60c9-2c24-4c7b-ae2e-a6c7fdb894a2'),(15,8,14,12,0,1,'2020-12-20 21:03:30','2020-12-20 21:03:30','275fcfc6-7e37-48bd-bfe4-6c6ca2c2d604'),(79,13,35,38,0,0,'2020-12-21 16:05:33','2020-12-21 16:05:33','5c83f1bc-00df-482b-88cc-c583df0f7653'),(80,13,35,40,0,1,'2020-12-21 16:05:33','2020-12-21 16:05:33','d4a9ffc0-2698-4437-8ba0-6e93398811b6'),(81,13,35,39,0,2,'2020-12-21 16:05:33','2020-12-21 16:05:33','67a845f3-09f2-44df-bf0c-83b797fc0321'),(82,13,35,37,0,3,'2020-12-21 16:05:33','2020-12-21 16:05:33','247a961f-1637-44f6-9d88-afaf95d3e13c'),(83,1,36,1,0,1,'2020-12-21 16:05:59','2020-12-21 16:05:59','8654f537-ecc5-4b33-a294-35b4042dc582'),(84,1,37,4,0,0,'2020-12-21 16:05:59','2020-12-21 16:05:59','bb5c2478-92a1-4777-9a67-093f55bfc23b'),(85,1,37,10,0,1,'2020-12-21 16:05:59','2020-12-21 16:05:59','fb9ff8fb-b989-4c20-9e69-139ed9899f8f'),(86,1,38,13,0,0,'2020-12-21 16:05:59','2020-12-21 16:05:59','edd122a6-dd50-4dc7-bdd6-8a13d2d5935b'),(87,1,39,19,0,0,'2020-12-21 16:05:59','2020-12-21 16:05:59','4a39e6e6-0483-4623-8a4e-7bd905fcdedd'),(88,1,39,24,0,1,'2020-12-21 16:05:59','2020-12-21 16:05:59','ebfb1499-8d2c-40f1-bfed-d73fe1fc7344'),(89,1,40,25,0,0,'2020-12-21 16:05:59','2020-12-21 16:05:59','b4d89ef8-1102-4f73-89a2-f39611c3c1de'),(90,1,40,30,0,1,'2020-12-21 16:05:59','2020-12-21 16:05:59','421be720-1130-43a1-9985-17791bf7eafa'),(91,1,41,31,0,0,'2020-12-21 16:05:59','2020-12-21 16:05:59','ea65ee99-752e-4c81-a2e4-d6496249f703'),(92,1,42,35,0,0,'2020-12-21 16:05:59','2020-12-21 16:05:59','c58ebdae-db81-4471-82cd-65c5b70490c3'),(93,1,42,36,0,1,'2020-12-21 16:05:59','2020-12-21 16:05:59','967f7bbc-de59-4b96-ae3f-27a6f0f2cbe3'),(105,12,45,34,0,0,'2020-12-21 18:21:27','2020-12-21 18:21:27','b74ef5f3-6835-41ea-a1aa-4bb84c715d27'),(106,12,45,33,0,1,'2020-12-21 18:21:27','2020-12-21 18:21:27','120c72af-ee80-4d8b-9407-087cb4006191'),(107,12,45,32,0,2,'2020-12-21 18:21:27','2020-12-21 18:21:27','8e9f73d2-1228-4c1f-9fa9-34cbfa9eb03a'),(108,11,46,26,0,0,'2020-12-21 18:22:04','2020-12-21 18:22:04','d4d254f3-124e-4874-a8c0-eec701c60d46'),(109,11,46,29,0,1,'2020-12-21 18:22:04','2020-12-21 18:22:04','f29ad2cc-1530-433f-aace-b0190c76686e'),(110,11,46,27,0,2,'2020-12-21 18:22:04','2020-12-21 18:22:04','f21ecf37-29a2-4c90-bcbc-ab49bd9d076c'),(111,11,46,28,0,3,'2020-12-21 18:22:04','2020-12-21 18:22:04','2351a6ee-4943-49d8-b05e-09541f80c9c7'),(122,9,49,17,0,0,'2020-12-21 18:29:28','2020-12-21 18:29:28','9d4458e9-6f68-4c35-9a15-d866fab9e98a'),(123,9,49,14,0,1,'2020-12-21 18:29:28','2020-12-21 18:29:28','a712661a-ce31-4260-92bf-7445cd0ea337'),(124,9,49,43,0,2,'2020-12-21 18:29:28','2020-12-21 18:29:28','c21c0081-8f65-42f5-a59c-2bdd6d3ee625'),(125,7,50,8,0,0,'2020-12-21 18:29:44','2020-12-21 18:29:44','c45ef68c-52d4-4073-b994-b9d28ac1890a'),(126,7,50,6,0,1,'2020-12-21 18:29:44','2020-12-21 18:29:44','aa3ed7bb-898a-4982-966f-f9a2762106b7'),(127,7,50,5,0,2,'2020-12-21 18:29:44','2020-12-21 18:29:44','9c536d0a-b49c-4da3-ad46-f7fe2ed9d081'),(128,7,50,42,0,3,'2020-12-21 18:29:44','2020-12-21 18:29:44','9961ab60-91e6-4a4f-8500-286cc8390032'),(129,7,50,7,0,4,'2020-12-21 18:29:44','2020-12-21 18:29:44','f43a456d-1243-48e8-8857-2fbae3bd7f1a'),(130,10,51,22,0,0,'2020-12-21 18:30:11','2020-12-21 18:30:11','e68f37c1-f6d4-4965-9011-b4bf197a5865'),(131,10,51,21,0,1,'2020-12-21 18:30:11','2020-12-21 18:30:11','8d7f6f77-4324-40b2-8b74-d4330f0b6b0b'),(132,10,51,23,0,2,'2020-12-21 18:30:11','2020-12-21 18:30:11','b34ce5f5-e81d-467f-8b3e-f0f79c75d2a3'),(133,10,51,41,0,3,'2020-12-21 18:30:11','2020-12-21 18:30:11','d26276f5-8928-4ad5-a8d2-f3233730139b'),(139,2,55,46,0,0,'2020-12-21 19:40:38','2020-12-21 19:40:38','c516242a-16f3-44c2-b4f0-a3c6e9f3370a'),(140,2,55,45,0,1,'2020-12-21 19:40:38','2020-12-21 19:40:38','3fa28886-3b92-4cba-8a57-11da8c3bed07'),(141,2,55,44,0,2,'2020-12-21 19:40:38','2020-12-21 19:40:38','26715633-bb16-4866-a1f8-081dd66097cb'),(142,2,55,47,0,3,'2020-12-21 19:40:38','2020-12-21 19:40:38','978844c5-fb15-4cd3-8230-1d32e31b7b15'),(143,2,55,48,0,4,'2020-12-21 19:40:38','2020-12-21 19:40:38','4b9f613a-064b-4f20-b629-ba5cc1cab557'),(144,2,56,49,0,0,'2020-12-21 19:40:38','2020-12-21 19:40:38','650535fe-65ab-4770-a6fb-28c3053fed99'),(145,5,57,2,0,1,'2020-12-21 19:45:12','2020-12-21 19:45:12','86accae0-1a0d-4380-97a1-e7f6698619da'),(146,5,57,50,0,2,'2020-12-21 19:45:12','2020-12-21 19:45:12','00593d5e-a45f-4876-ba85-69f0548ddf22'),(147,5,57,51,0,3,'2020-12-21 19:45:12','2020-12-21 19:45:12','3cc91d75-2251-46f8-914c-d92a4c1d0c9f');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2020-12-19 22:02:59','2020-12-19 22:02:59',NULL,'dfec4635-29df-4002-874c-a1c5fc415887'),(2,'craft\\elements\\Entry','2020-12-19 22:03:21','2020-12-19 22:03:21',NULL,'9022f2dc-2d63-4c6e-a3e0-84565e754627'),(3,'craft\\elements\\Asset','2020-12-19 22:11:26','2020-12-19 22:11:26',NULL,'d7c986d8-017c-416e-95d5-3209cbffa8cb'),(4,'craft\\elements\\Asset','2020-12-19 22:14:28','2020-12-19 22:14:28',NULL,'2f66ebad-f69b-4448-99db-4997826f87f2'),(5,'craft\\elements\\Entry','2020-12-20 19:15:50','2020-12-20 19:15:50',NULL,'cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217'),(6,'craft\\elements\\GlobalSet','2020-12-20 20:45:37','2020-12-20 20:45:37',NULL,'7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f'),(7,'craft\\elements\\MatrixBlock','2020-12-20 20:58:05','2020-12-20 20:58:05',NULL,'f5ba1a89-63e8-4c85-806b-037f2cfe77b8'),(8,'craft\\elements\\MatrixBlock','2020-12-20 21:03:30','2020-12-20 21:03:30',NULL,'668bcdd3-af06-4bfc-b006-701a4aa8e248'),(9,'craft\\elements\\MatrixBlock','2020-12-21 15:01:14','2020-12-21 15:01:14',NULL,'dca37def-ec6f-48dc-ad3d-1d59ac0e5a09'),(10,'craft\\elements\\MatrixBlock','2020-12-21 15:03:48','2020-12-21 15:03:48',NULL,'ad543913-a697-4a95-a0f5-af79cbb1953f'),(11,'craft\\elements\\MatrixBlock','2020-12-21 15:05:23','2020-12-21 15:05:23',NULL,'5f56b260-cfb3-410d-9d48-d521d2abe570'),(12,'craft\\elements\\MatrixBlock','2020-12-21 15:06:38','2020-12-21 15:06:38',NULL,'9d58aae7-3c30-49e1-8aff-a5563dbc6b3a'),(13,'craft\\elements\\MatrixBlock','2020-12-21 16:05:33','2020-12-21 16:05:33',NULL,'3f200807-1bde-4f2d-b592-53a3d9b176a2');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (7,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2020-12-19 22:19:11','2020-12-19 22:19:11','329edaae-0042-46e3-a904-dcb47c91d32b'),(8,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2020-12-19 22:19:19','2020-12-19 22:19:19','5c97ee4b-cc05-40c5-9292-59d4bfe8fdd3'),(11,6,'Data','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"47f80b4f-c8bc-454a-87bc-ab29f2f6305c\"}]',1,'2020-12-20 20:45:37','2020-12-20 20:45:37','ca9aa37b-5a88-45bf-8a3d-74acfd7a63c0'),(14,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d32f7b6d-2688-42c8-a568-32c48c01de9d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e9593c4e-5f13-427a-812b-96c704d1badb\"}]',1,'2020-12-20 21:03:30','2020-12-20 21:03:30','bf91a41f-9f62-4328-96e8-b5487257de53'),(35,13,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"aeead7a5-9278-4930-a2ba-e6693a7b0bfa\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d270122d-0c80-4661-8b31-916c0206e6f2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d1801c45-b36c-4109-8017-8a4cc7d07490\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1b556fef-b861-4c40-a115-21cf20069af4\"}]',1,'2020-12-21 16:05:33','2020-12-21 16:05:33','ae5defa5-d7b6-4153-9d93-6fa02ec58cee'),(36,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ba152a31-97b9-4f25-a554-2d7298bdd447\"}]',1,'2020-12-21 16:05:59','2020-12-21 16:05:59','0470a0f7-cce3-4de2-bfaf-71174d0a1267'),(37,1,'Section-CallToAction','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"955df9cb-053f-4443-b5ae-1e2f73d2ad7c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e\"}]',2,'2020-12-21 16:05:59','2020-12-21 16:05:59','b854c703-eeff-4b4b-b3b7-49e2d7f8e072'),(38,1,'Section-Bundle','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1741b25b-a9e6-452a-9bc8-068f511877e2\"}]',3,'2020-12-21 16:05:59','2020-12-21 16:05:59','146fc457-7513-4ce0-ac73-3c59ebe82b81'),(39,1,'Section-WhatsInTheBox','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"70d771ca-07a3-4890-9fec-cb3cadc49158\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"249ef0ae-da23-4a87-a954-c81208b52b07\"}]',4,'2020-12-21 16:05:59','2020-12-21 16:05:59','2b527ba7-770d-409f-b02d-dc81f45d2d0e'),(40,1,'Section-TakeACloserLook','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"46e5c776-0d54-48f3-810c-b39d129fa37b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"77462a97-50df-448d-8d7d-0135e9525f4e\"}]',5,'2020-12-21 16:05:59','2020-12-21 16:05:59','8190cf0a-2051-4085-a5e3-e0bd08e781df'),(41,1,'Section-Story','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"57a42f69-564f-4d11-b2e9-8285220eab31\"}]',6,'2020-12-21 16:05:59','2020-12-21 16:05:59','2afb4366-783e-4c9a-8bc2-83a1867a9745'),(42,1,'Section-OtherGames','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"07422314-46fd-4675-bdbd-63c80fb2ba29\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"21ae595a-9db9-41ae-b5a7-29d345580411\"}]',7,'2020-12-21 16:05:59','2020-12-21 16:05:59','6ef9bc72-89c5-41ab-add8-01248f184b7d'),(45,12,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b7e1da54-a49e-4209-b56a-becb90315f25\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3dddc70c-404a-4dcf-bf22-f2d8fda2aa34\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"216a5716-d459-4f74-bc80-57e612e4bc9c\"}]',1,'2020-12-21 18:21:27','2020-12-21 18:21:27','6defcba3-ccb2-49cb-be13-fa905d3b5302'),(46,11,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3f29eae5-c9a0-4743-adb0-d6dc2196d5be\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bce818e2-ea07-486b-87a9-155ccf9f94cb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7630d272-f37b-4501-b321-91b966f23598\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b8fb40e0-291e-4c47-83d9-2c4017fb6e28\"}]',1,'2020-12-21 18:22:04','2020-12-21 18:22:04','95145b4e-0d5f-4b27-89e7-758cc582303f'),(49,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"88b2ad21-520b-40c8-b4ee-1a555b199bfe\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6d088e42-73c2-41aa-bc0f-11f3547c644a\"}]',1,'2020-12-21 18:29:28','2020-12-21 18:29:28','6e4545ab-5357-48f2-b6e0-2a6564023aa4'),(50,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"76b4d5bd-0390-4001-b710-b710383bb384\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"53db0ca1-774e-4767-96d5-e2add7049d92\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"41136c62-0b75-4b68-8d37-9fd60e8fc48f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5d5a9585-088e-4742-af9f-dfa079740ad5\"}]',1,'2020-12-21 18:29:44','2020-12-21 18:29:44','a21a5317-7368-4444-8cf9-dd31189de500'),(51,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c53bcde-78ac-4576-8a50-06f28dfd2431\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"43dee225-a3e4-4faa-8f23-d76ece35e529\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ae8bb340-48e5-44ca-961a-5e4e6d0e0506\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d69e9126-ea8b-4a8b-8b29-290b07c30e50\"}]',1,'2020-12-21 18:30:11','2020-12-21 18:30:11','7250d97b-7897-458d-aaa0-39545f0ac5b9'),(54,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2020-12-21 19:40:38','2020-12-21 19:40:38','e42a8365-306a-49e5-a479-d3368effd1b8'),(55,2,'Featured','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4bfff36a-cda0-4893-a923-776c0658041d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"122907c1-4e91-4621-b94c-c494900723b9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"109682cb-163b-4fba-8b09-1978b39c3272\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3501ae42-8ea8-4828-810e-45548120e746\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b76537e-99d1-42d2-ba7b-47829805858a\"}]',2,'2020-12-21 19:40:38','2020-12-21 19:40:38','91aebe6a-00fe-4e6d-84d6-ea0ff597569d'),(56,2,'Shop Items','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4b6aad40-58d7-42aa-ae23-0e68e5ffb884\"}]',3,'2020-12-21 19:40:38','2020-12-21 19:40:38','85ab24e5-a03d-46f3-96e7-cebb4cc0e4a3'),(57,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c0290c04-835e-4a8f-ba87-cf95d08665a6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e4f4d335-9e0e-4e7d-91d6-38a9624b8d38\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"408b73a9-aec2-47a6-b810-72bbe7b66a4a\"}]',1,'2020-12-21 19:45:12','2020-12-21 19:45:12','d3a91c92-8973-411f-b63d-bdeb309ab7e0');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fields_handle_context_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,2,'Banner','banner','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2020-12-19 22:16:13','2020-12-19 22:16:13','ba152a31-97b9-4f25-a554-2d7298bdd447'),(2,4,'Shop Item Name','shopItemName','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-20 19:16:59','2020-12-20 19:16:59','c0290c04-835e-4a8f-ba87-cf95d08665a6'),(3,1,'Main Logo Image','mainLogoImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-20 20:45:03','2020-12-20 20:45:03','47f80b4f-c8bc-454a-87bc-ab29f2f6305c'),(4,2,'Cta Description','ctaDescription','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_ctadescription}}\",\"maxBlocks\":\"1\",\"minBlocks\":\"1\",\"propagationMethod\":\"all\"}','2020-12-20 20:58:05','2020-12-21 18:21:04','955df9cb-053f-4443-b5ae-1e2f73d2ad7c'),(5,NULL,'description','description','matrixBlockType:0948f0e7-6c86-45db-b5cd-8531a7228a98','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-20 20:58:05','2020-12-20 20:58:05','41136c62-0b75-4b68-8d37-9fd60e8fc48f'),(6,NULL,'Title','descriptionTitle','matrixBlockType:0948f0e7-6c86-45db-b5cd-8531a7228a98','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-20 20:58:05','2020-12-20 20:58:05','53db0ca1-774e-4767-96d5-e2add7049d92'),(7,NULL,'button','button','matrixBlockType:0948f0e7-6c86-45db-b5cd-8531a7228a98','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-20 20:58:05','2020-12-20 20:58:05','5d5a9585-088e-4742-af9f-dfa079740ad5'),(8,NULL,'image','image','matrixBlockType:0948f0e7-6c86-45db-b5cd-8531a7228a98','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-20 20:58:05','2020-12-20 21:02:16','76b4d5bd-0390-4001-b710-b710383bb384'),(10,2,'Cta Preorder','ctaPreorder','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_ctapreorder}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-12-20 21:03:30','2020-12-20 21:03:30','22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e'),(11,NULL,'description','description','matrixBlockType:156517b3-409e-41ae-a1a7-8a748a5a7a07','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-20 21:03:30','2020-12-20 21:03:30','d32f7b6d-2688-42c8-a568-32c48c01de9d'),(12,NULL,'Preorder Url','preorderUrl','matrixBlockType:156517b3-409e-41ae-a1a7-8a748a5a7a07','',0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":\"255\",\"placeholder\":\"\"}','2020-12-20 21:03:30','2020-12-20 21:03:30','e9593c4e-5f13-427a-812b-96c704d1badb'),(13,2,'Bundle','bundle','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_bundle}}\",\"maxBlocks\":\"1\",\"minBlocks\":\"1\",\"propagationMethod\":\"all\"}','2020-12-21 15:01:14','2020-12-21 15:17:35','1741b25b-a9e6-452a-9bc8-068f511877e2'),(14,NULL,'matrixSubtitle','matrixSubtitle','matrixBlockType:5e307679-3009-4d6b-8107-b819fb617563','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:01:14','2020-12-21 15:22:04','88b2ad21-520b-40c8-b4ee-1a555b199bfe'),(17,NULL,'matrixTitle','matrixTitle','matrixBlockType:5e307679-3009-4d6b-8107-b819fb617563','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:01:14','2020-12-21 15:22:04','b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d'),(19,2,'Whats In The Box','whatsInTheBox','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_whatsinthebox}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-12-21 15:03:47','2020-12-21 15:37:41','70d771ca-07a3-4890-9fec-cb3cadc49158'),(21,NULL,'subtitle','subtitle','matrixBlockType:5f140596-d000-45ec-bd1c-4d0ba98e7753','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:03:48','2020-12-21 15:03:48','43dee225-a3e4-4faa-8f23-d76ece35e529'),(22,NULL,'Section Title','sectionTitle','matrixBlockType:5f140596-d000-45ec-bd1c-4d0ba98e7753','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:03:48','2020-12-21 15:43:06','7c53bcde-78ac-4576-8a50-06f28dfd2431'),(23,NULL,'image','image','matrixBlockType:5f140596-d000-45ec-bd1c-4d0ba98e7753','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-21 15:03:48','2020-12-21 15:37:41','ae8bb340-48e5-44ca-961a-5e4e6d0e0506'),(24,2,'Dividing Banner','dividingBanner','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-21 15:04:13','2020-12-21 15:04:13','249ef0ae-da23-4a87-a954-c81208b52b07'),(25,2,'Take A Closer Look','takeACloserLook','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_takeacloserlook}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-12-21 15:05:22','2020-12-21 15:05:22','46e5c776-0d54-48f3-810c-b39d129fa37b'),(26,NULL,'Section Title','sectionTitle','matrixBlockType:6920e130-53b8-4e22-af21-3578afde06b7','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:05:23','2020-12-21 15:54:47','3f29eae5-c9a0-4743-adb0-d6dc2196d5be'),(27,NULL,'Card Name','cardName','matrixBlockType:6920e130-53b8-4e22-af21-3578afde06b7','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:05:23','2020-12-21 15:05:23','7630d272-f37b-4501-b321-91b966f23598'),(28,NULL,'Card Description','cardDescription','matrixBlockType:6920e130-53b8-4e22-af21-3578afde06b7','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:05:23','2020-12-21 15:05:23','b8fb40e0-291e-4c47-83d9-2c4017fb6e28'),(29,NULL,'Image','image','matrixBlockType:6920e130-53b8-4e22-af21-3578afde06b7','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-21 15:05:23','2020-12-21 15:54:47','bce818e2-ea07-486b-87a9-155ccf9f94cb'),(30,2,'Project Timeline','projectTimeline','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-21 15:05:45','2020-12-21 15:05:45','77462a97-50df-448d-8d7d-0135e9525f4e'),(31,2,'Our Story','ourStory','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_ourstory}}\",\"maxBlocks\":\"1\",\"minBlocks\":\"1\",\"propagationMethod\":\"all\"}','2020-12-21 15:06:38','2020-12-21 18:21:27','57a42f69-564f-4d11-b2e9-8285220eab31'),(32,NULL,'elementParagraph2','elementparagraph2','matrixBlockType:c09dc7f2-c2bb-43d0-8046-f0b869923634','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:06:38','2020-12-21 15:06:38','216a5716-d459-4f74-bc80-57e612e4bc9c'),(33,NULL,'elementParagraph1','elementparagraph1','matrixBlockType:c09dc7f2-c2bb-43d0-8046-f0b869923634','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:06:38','2020-12-21 15:06:38','3dddc70c-404a-4dcf-bf22-f2d8fda2aa34'),(34,NULL,'elementTitle','elementtitle','matrixBlockType:c09dc7f2-c2bb-43d0-8046-f0b869923634','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 15:06:38','2020-12-21 15:06:38','b7e1da54-a49e-4209-b56a-becb90315f25'),(35,2,'Other Games Title','otherGamesTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 16:04:29','2020-12-21 16:04:29','07422314-46fd-4675-bdbd-63c80fb2ba29'),(36,2,'Other Games','otherGames','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_othergames}}\",\"maxBlocks\":\"4\",\"minBlocks\":\"1\",\"propagationMethod\":\"all\"}','2020-12-21 16:05:33','2020-12-21 16:05:33','21ae595a-9db9-41ae-b5a7-29d345580411'),(37,NULL,'image','image','matrixBlockType:5272c575-d5c8-460e-84ec-a37d5d214610','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-21 16:05:33','2020-12-21 16:05:33','1b556fef-b861-4c40-a115-21cf20069af4'),(38,NULL,'Game Title','gameTitle','matrixBlockType:5272c575-d5c8-460e-84ec-a37d5d214610','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 16:05:33','2020-12-21 16:05:33','aeead7a5-9278-4930-a2ba-e6693a7b0bfa'),(39,NULL,'Buy Text','buyText','matrixBlockType:5272c575-d5c8-460e-84ec-a37d5d214610','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 16:05:33','2020-12-21 16:05:33','d1801c45-b36c-4109-8017-8a4cc7d07490'),(40,NULL,'Game Description','gameDescription','matrixBlockType:5272c575-d5c8-460e-84ec-a37d5d214610','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 16:05:33','2020-12-21 16:05:33','d270122d-0c80-4661-8b31-916c0206e6f2'),(41,NULL,'Items Summary','itemsSummary','matrixBlockType:5f140596-d000-45ec-bd1c-4d0ba98e7753','',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Value\",\"handle\":\"value\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"maxRows\":\"\",\"minRows\":\"\"}','2020-12-21 18:14:48','2020-12-21 18:28:01','d69e9126-ea8b-4a8b-8b29-290b07c30e50'),(42,NULL,'Fixed List','fixedList','matrixBlockType:0948f0e7-6c86-45db-b5cd-8531a7228a98','',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Value\",\"handle\":\"value\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"maxRows\":\"\",\"minRows\":\"\"}','2020-12-21 18:21:04','2020-12-21 18:21:04','e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7'),(43,NULL,'Table Data','tableData','matrixBlockType:5e307679-3009-4d6b-8107-b819fb617563','',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Row Data\",\"handle\":\"rowData\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Standard Edition\",\"handle\":\"standardEdition\",\"width\":\"\",\"type\":\"singleline\"},\"col3\":{\"heading\":\"Exclusive Edition\",\"handle\":\"exclusiveEdition\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\",\"col3\":\"\"}],\"maxRows\":\"\",\"minRows\":\"\"}','2020-12-21 18:23:36','2020-12-21 18:23:36','6d088e42-73c2-41aa-bc0f-11f3547c644a'),(44,3,'Featured Add-On Title','featuredAddOnTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 19:33:09','2020-12-21 19:33:09','109682cb-163b-4fba-8b09-1978b39c3272'),(45,3,'Featured Add-On Image','featuredAddOnImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:77b802d6-cf66-4f9e-934a-0a6a18fc45ee\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-21 19:33:37','2020-12-21 19:33:37','122907c1-4e91-4621-b94c-c494900723b9'),(46,3,'Featured Add-On Article','featuredAddOnArticle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 19:33:57','2020-12-21 19:33:57','4bfff36a-cda0-4893-a923-776c0658041d'),(47,3,'Featured Add-On Description','featuredAddOnDescription','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 19:34:05','2020-12-21 19:34:05','3501ae42-8ea8-4828-810e-45548120e746'),(48,3,'Featured Add-On CTA Text','featuredAddOnCtaText','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 19:34:13','2020-12-21 19:34:13','7b76537e-99d1-42d2-ba7b-47829805858a'),(49,3,'Shop Items Title','shopItemsTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 19:39:59','2020-12-21 19:39:59','4b6aad40-58d7-42aa-ae23-0e68e5ffb884'),(50,4,'Image','image','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:77b802d6-cf66-4f9e-934a-0a6a18fc45ee\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-21 19:43:33','2020-12-21 19:43:33','e4f4d335-9e0e-4e7d-91d6-38a9624b8d38'),(51,4,'Price Tag','priceTag','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-21 19:43:58','2020-12-21 19:43:58','408b73a9-aec2-47a6-b810-72bbe7b66a4a');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (37,'Main Logo','mainLogo',6,'2020-12-20 20:44:31','2020-12-20 20:45:37','d8506888-7b66-4b28-a8f2-2ce6767d6144');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.5.17.1','3.5.13',0,'ysothwnixtsq','fdekykcljcor','2020-12-19 12:20:24','2020-12-21 19:47:56','9bbb4263-2e81-4a49-ae85-72980c44f4f6');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (38,2,4,1,1,NULL,'2020-12-20 21:07:14','2020-12-20 21:07:14','eac6e03d-8831-4348-918b-e59ccc05e63e'),(39,2,10,2,1,NULL,'2020-12-20 21:07:14','2020-12-20 21:07:14','bfd56ee3-eeca-49d6-b804-1a34c9dd6936'),(40,2,13,3,1,NULL,'2020-12-21 15:09:59','2020-12-21 15:09:59','5e46d317-a34f-4162-aaf1-9acfdea2d266'),(41,2,19,4,1,NULL,'2020-12-21 15:11:48','2020-12-21 15:11:48','41d401b1-4978-4f99-8a9e-73214c4090ff'),(42,2,19,4,2,NULL,'2020-12-21 15:11:48','2020-12-21 15:11:48','59051f43-7fc9-4958-977e-f22639cb735a'),(43,2,25,5,1,NULL,'2020-12-21 15:13:09','2020-12-21 15:13:09','ee53b415-6b0c-445a-a653-ea9e40a726b0'),(44,2,25,5,2,NULL,'2020-12-21 15:13:09','2020-12-21 15:13:09','0d82591a-3747-405d-aadd-02086fb3a6b8'),(45,2,25,5,3,NULL,'2020-12-21 15:13:09','2020-12-21 15:13:09','0a0d7dcd-ad11-4349-8c76-5b3fa443f7e4'),(46,2,25,5,4,NULL,'2020-12-21 15:13:09','2020-12-21 15:13:09','6b1d0835-65d4-40c8-99dd-2125907222a6'),(47,2,31,6,1,NULL,'2020-12-21 15:13:28','2020-12-21 15:13:28','e16449e1-8809-42f5-8fd2-9f59dc8bf340'),(48,2,36,7,1,NULL,'2020-12-21 16:07:59','2020-12-21 16:07:59','60ff942b-42b1-4dd0-914a-b45faad616f9'),(49,2,36,7,2,NULL,'2020-12-21 16:07:59','2020-12-21 16:07:59','b9b8ad6a-4f9e-43d1-ae6e-451b8224d697'),(50,2,36,7,3,NULL,'2020-12-21 16:07:59','2020-12-21 16:07:59','835b3876-0c39-4072-a076-9dbf62be6c55');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,4,7,'element','element',1,'2020-12-20 20:58:05','2020-12-20 20:58:05','0948f0e7-6c86-45db-b5cd-8531a7228a98'),(2,10,8,'element','element',1,'2020-12-20 21:03:30','2020-12-20 21:03:30','156517b3-409e-41ae-a1a7-8a748a5a7a07'),(3,13,9,'element','element',1,'2020-12-21 15:01:15','2020-12-21 15:01:15','5e307679-3009-4d6b-8107-b819fb617563'),(4,19,10,'Section block','sectionBlock',1,'2020-12-21 15:03:48','2020-12-21 15:03:48','5f140596-d000-45ec-bd1c-4d0ba98e7753'),(5,25,11,'sectionBlock','sectionblock',1,'2020-12-21 15:05:23','2020-12-21 15:05:23','6920e130-53b8-4e22-af21-3578afde06b7'),(6,31,12,'element','element',1,'2020-12-21 15:06:38','2020-12-21 15:06:38','c09dc7f2-c2bb-43d0-8046-f0b869923634'),(7,36,13,'element','element',1,'2020-12-21 16:05:33','2020-12-21 16:05:33','5272c575-d5c8-460e-84ec-a37d5d214610');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_bundle`
--

DROP TABLE IF EXISTS `matrixcontent_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_bundle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_element_matrixSubtitle` text,
  `field_element_matrixTitle` text,
  `field_element_tableData` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_bundle_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_bundle_siteId_idx` (`siteId`),
  CONSTRAINT `matrixcontent_bundle_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_bundle_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_bundle`
--

LOCK TABLES `matrixcontent_bundle` WRITE;
/*!40000 ALTER TABLE `matrixcontent_bundle` DISABLE KEYS */;
INSERT INTO `matrixcontent_bundle` VALUES (1,40,1,'2020-12-21 15:09:59','2020-12-21 18:27:18','11954465-00df-4e41-987a-ffae1acf8714','ALL BUNDLES COMPARED IN A NEAT TABLE BELOW','HAPPY LITTLE DINOSAURS EXCLUSIVE BUNDLE','[{\"col1\":\"\",\"col2\":\"STANDARD EDITION;$20\",\"col3\":\"EXCLUSIVE EDITION;$35\"},{\"col1\":\"# of Players\",\"col2\":\"2-4\",\"col3\":\"2-6\"},{\"col1\":\"# of Cards\",\"col2\":\"97\",\"col3\":\"147\"},{\"col1\":\"# of Meeples\",\"col2\":\"4\",\"col3\":\"6\"},{\"col1\":\"# of Player Boards\",\"col2\":\"4\",\"col3\":\"6\"},{\"col1\":\"# of Exclusive Cards\",\"col2\":\"0\",\"col3\":\"5\"},{\"col1\":\"Preorder Exclusive Box\",\"col2\":\"N\",\"col3\":\"Y\"},{\"col1\":\"Includes Expansion Cards\",\"col2\":\"N\",\"col3\":\"Y\"}]');
/*!40000 ALTER TABLE `matrixcontent_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_ctadescription`
--

DROP TABLE IF EXISTS `matrixcontent_ctadescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_ctadescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_element_description` text,
  `field_element_descriptionTitle` text,
  `field_element_button` text,
  `field_element_fixedList` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_ctadescription_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_ctadescription_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_ctadescription_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_ctadescription_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_ctadescription`
--

LOCK TABLES `matrixcontent_ctadescription` WRITE;
/*!40000 ALTER TABLE `matrixcontent_ctadescription` DISABLE KEYS */;
INSERT INTO `matrixcontent_ctadescription` VALUES (1,38,1,'2020-12-20 21:07:14','2020-12-21 18:27:34','5517dd2e-39d8-48df-8249-5fbb7dd7ce36','Lately, it feels like we’re all just dinosaurs trying to avoid the falling meteors. In this game, you’ll try to dodge all of life’s little disasters. You might fall into a pit of hot lava or get ghosted by your dino date, but the dino who survives it all wins the game!','HAPPY LITTLE DINOSAURS EXCLUSIVE EDITION','Visit shop','[{\"col1\":\"2-6 players\"},{\"col1\":\"30-60 minutes play time\"},{\"col1\":\"Ages 8+\"},{\"col1\":\"Includes all 147 cards\"},{\"col1\":\"6 Dinosaur player boards and 6 Dinosaur meeples from the Happy Little Dinosaurs Base Game and 5-6 player expansion pack\"},{\"col1\":\"Includes 5 additional preorder exclusive cards\"},{\"col1\":\"Everything comes in a preorder exclusive box\"}]');
/*!40000 ALTER TABLE `matrixcontent_ctadescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_ctapreorder`
--

DROP TABLE IF EXISTS `matrixcontent_ctapreorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_ctapreorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_element_description` text,
  `field_element_preorderUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_ctapreorder_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_ctapreorder_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_ctapreorder_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_ctapreorder_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_ctapreorder`
--

LOCK TABLES `matrixcontent_ctapreorder` WRITE;
/*!40000 ALTER TABLE `matrixcontent_ctapreorder` DISABLE KEYS */;
INSERT INTO `matrixcontent_ctapreorder` VALUES (1,39,1,'2020-12-20 21:07:14','2020-12-20 21:07:14','f3b5a15c-713a-4211-bcc7-8650ff357f05','In this game, you are a Dinosaur, and life repeatedly tries to punch you in the face...you know, just like your real life. But if you thought your life was hard, buckle up. The dino world is full of tar pits, killer squirrels, and really bad haircuts, not to mention the looming threat of extinction. The goal of the game is to survive all of life\'s little disasters and be the first Dinosaur to reach 50 points. You can also win if you\'re the last Dinosaur standing...so...if all of your friends are dead.','https://www.youtube.com/embed/r-gABuRlsTI');
/*!40000 ALTER TABLE `matrixcontent_ctapreorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_othergames`
--

DROP TABLE IF EXISTS `matrixcontent_othergames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_othergames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_element_gameTitle` text,
  `field_element_buyText` text,
  `field_element_gameDescription` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_othergames_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_othergames_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_othergames_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_othergames_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_othergames`
--

LOCK TABLES `matrixcontent_othergames` WRITE;
/*!40000 ALTER TABLE `matrixcontent_othergames` DISABLE KEYS */;
INSERT INTO `matrixcontent_othergames` VALUES (1,48,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','e744af95-a546-4596-bd55-8fea8424e11e','UNSTABLE UNICORNS','BUY NOW','Build a Unicorn army. Betray your friends. Unicorns are your friends now.'),(2,49,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','aff9124a-37a8-4f5a-8384-74451f72db4c','LLAMAS UNLEASHED','BUY NOW','More llama puns, you said! We herd you.'),(3,50,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','fb741a87-4810-4fe4-8bb6-334eae86696a','HERE TO SLAY','PREORDER','A strategic card game. A role-playing adventure. A dangerous new world.');
/*!40000 ALTER TABLE `matrixcontent_othergames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_ourstory`
--

DROP TABLE IF EXISTS `matrixcontent_ourstory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_ourstory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_element_elementparagraph2` text,
  `field_element_elementparagraph1` text,
  `field_element_elementtitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_ourstory_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_ourstory_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_ourstory_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_ourstory_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_ourstory`
--

LOCK TABLES `matrixcontent_ourstory` WRITE;
/*!40000 ALTER TABLE `matrixcontent_ourstory` DISABLE KEYS */;
INSERT INTO `matrixcontent_ourstory` VALUES (1,47,1,'2020-12-21 15:13:28','2020-12-21 15:13:28','ac7c24e2-bf7b-4bff-9fe1-67f3ced1d353','While our games can be brutal and vicious, we actually create them to bring people together. After all, the strongest friendships begin with good, old-fashioned power struggles during game night. Our games are created to be accessible and easy-to learn for new players, but complex enough to keep seasoned veterans intrigued for years to come.','We launched our first game, Unstable Unicorns, in 2017 and have been obsessed with making games ever since. All of our games are created by a team of in-house game developers and artists who pride themselves on making games that walk the line between adorable and diabolical. Keep an eye out for jokes and easter eggs as you play, and you may find some delightful details.','OUR STORY');
/*!40000 ALTER TABLE `matrixcontent_ourstory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_takeacloserlook`
--

DROP TABLE IF EXISTS `matrixcontent_takeacloserlook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_takeacloserlook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_sectionblock_sectionTitle` text,
  `field_sectionblock_cardName` text,
  `field_sectionblock_cardDescription` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_takeacloserlook_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_takeacloserlook_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_takeacloserlook_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_takeacloserlook_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_takeacloserlook`
--

LOCK TABLES `matrixcontent_takeacloserlook` WRITE;
/*!40000 ALTER TABLE `matrixcontent_takeacloserlook` DISABLE KEYS */;
INSERT INTO `matrixcontent_takeacloserlook` VALUES (1,43,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','0adc6098-26b8-4f39-a159-66699bca8532','TAKE A CLOSER LOOK','DISASTER CARDS','In Happy Little Dinosaurs, you will work to avoid all of life’s little disasters and laugh as they happen to your friends. If you collect 3 Disaster cards of the same type OR 3 different types of Disaster cards, you will be out of the game.'),(2,44,1,'2020-12-21 15:13:09','2020-12-21 15:58:18','934362bc-c82e-438b-9760-2a04343e022b',NULL,'POINT CARDS','Point cards feature weapons, trinkets, and good luck charms that you use to collect points and avoid disasters. Each card has a point value between 0 and 9 that you will use when scoring a round.'),(3,45,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','919315d1-103d-4de9-9a97-706220643bd5',NULL,'INSTANT CARDS','You can use Instant cards at different points during the game to tip the odds in your favor or save your Dinosaur from certain death.'),(4,46,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','a99a49c8-6638-4877-9207-49e3aafb25bc',NULL,'MEEPLES','You\'ll move your Dinosaur meeple along the Excape Route on your player board to track your score.');
/*!40000 ALTER TABLE `matrixcontent_takeacloserlook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_whatsinthebox`
--

DROP TABLE IF EXISTS `matrixcontent_whatsinthebox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_whatsinthebox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_sectionBlock_subtitle` text,
  `field_sectionBlock_sectionTitle` text,
  `field_sectionBlock_itemsSummary` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_whatsinthebox_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_whatsinthebox_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_whatsinthebox_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_whatsinthebox_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_whatsinthebox`
--

LOCK TABLES `matrixcontent_whatsinthebox` WRITE;
/*!40000 ALTER TABLE `matrixcontent_whatsinthebox` DISABLE KEYS */;
INSERT INTO `matrixcontent_whatsinthebox` VALUES (1,41,1,'2020-12-21 15:11:48','2020-12-21 18:28:43','9d873c20-f6fb-4810-91de-075c0e930ab7','HAPPY LITTLE DINOSAURS STANDARD EDITION BASE GAME INCLUDES:','WHAT\'S IN THE BOX?','[{\"col1\":\"97 cards\"},{\"col1\":\"4 dinosaur player boards\"},{\"col1\":\"4 dinosaur meeples\"},{\"col1\":\"1 rule book\"}]'),(2,42,1,'2020-12-21 15:11:48','2020-12-21 18:28:43','65367fb7-a466-4860-98f3-04a26f0ed872','HAPPY LITTLE DINOSAURS 5-6 PLAYER EXPANSION PACK INCLUDES:',NULL,'[{\"col1\":\"50 cards\"},{\"col1\":\"2 dinosaur player boards\"},{\"col1\":\"2 dinosaur meeples\"},{\"col1\":\"1 rule book\"}]');
/*!40000 ALTER TABLE `matrixcontent_whatsinthebox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','e7759d8e-865c-4121-bfba-3a867c6e6e63'),(2,'craft','m150403_183908_migrations_table_changes','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','e8a358f0-62be-45be-af8c-7be23ef0de90'),(3,'craft','m150403_184247_plugins_table_changes','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','474fc456-e97a-4c66-88a6-762c96d7899a'),(4,'craft','m150403_184533_field_version','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','b73d4fb4-83e4-44a0-a96e-5b61eb9ac5e9'),(5,'craft','m150403_184729_type_columns','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','47f06786-0022-4043-94f1-2cab2de8f38e'),(6,'craft','m150403_185142_volumes','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','942873e7-7573-42ac-bda7-ec99bc7edd2d'),(7,'craft','m150428_231346_userpreferences','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','8970e4de-c0da-494d-bc1c-a3574949cebd'),(8,'craft','m150519_150900_fieldversion_conversion','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','d63735dd-56e8-4c64-a94e-aad78da1a63c'),(9,'craft','m150617_213829_update_email_settings','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','b8d3ec7a-5ed8-4978-9313-b89aa3370748'),(10,'craft','m150721_124739_templatecachequeries','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','236f5e65-305f-478f-98b1-0a64f69b3d6c'),(11,'craft','m150724_140822_adjust_quality_settings','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','30dd6b2f-3476-4e47-add3-da351f1f5d6e'),(12,'craft','m150815_133521_last_login_attempt_ip','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','adb7353b-b614-4d8e-a91e-010abaa2a00f'),(13,'craft','m151002_095935_volume_cache_settings','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','7867505f-d2ad-479e-9d25-fc2a3bd48342'),(14,'craft','m151005_142750_volume_s3_storage_settings','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','a365d3f3-e47b-4dfa-a904-5b59050b4d0a'),(15,'craft','m151016_133600_delete_asset_thumbnails','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','8790432b-f37b-4b2d-8e81-568c6de9f0cb'),(16,'craft','m151209_000000_move_logo','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','a4b352e8-437e-4574-bb90-80d3431fcd2a'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','a12f5de5-acc8-408e-9d6c-5cb0de995b77'),(18,'craft','m151215_000000_rename_asset_permissions','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','c11f59d1-a080-4b79-9aad-07cc1e30676f'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','0e5584dc-72d6-4de3-aafe-f50dfb831899'),(20,'craft','m160708_185142_volume_hasUrls_setting','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','3b71d2d2-056c-4fce-8c1a-a29ede0d9cde'),(21,'craft','m160714_000000_increase_max_asset_filesize','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','0e633d22-cb57-4958-ac57-75bdf2d70694'),(22,'craft','m160727_194637_column_cleanup','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','0eb7377c-1fec-4608-886a-3459e2255caf'),(23,'craft','m160804_110002_userphotos_to_assets','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','efc51edb-1b9f-4144-bc8b-55074baa6569'),(24,'craft','m160807_144858_sites','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','3c8f7e4f-aae4-4d12-a70a-ecaa4007949d'),(25,'craft','m160829_000000_pending_user_content_cleanup','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','b6466c14-eab3-4cd7-ab1f-98691b2da9fe'),(26,'craft','m160830_000000_asset_index_uri_increase','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','c322c0fa-6525-41eb-ad96-bd26f7b21ad5'),(27,'craft','m160912_230520_require_entry_type_id','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','c572b98f-82bd-4953-9681-d48053731590'),(28,'craft','m160913_134730_require_matrix_block_type_id','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','e1d2d81a-3bdf-43ca-a154-536d1100f50d'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','2c4ef5f3-7b59-4218-8615-a656bffa6ad3'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','bb370787-a175-40b5-b726-140df1a99059'),(31,'craft','m160925_113941_route_uri_parts','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','72388f08-6004-4793-afd8-781a8877ac9c'),(32,'craft','m161006_205918_schemaVersion_not_null','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','98cc55e2-4020-4fc4-ac6b-c0b5b9f09df3'),(33,'craft','m161007_130653_update_email_settings','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','9cca3cc2-b29e-452a-a396-764c614b0c65'),(34,'craft','m161013_175052_newParentId','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','0091fdb1-477a-4193-874c-bbf20f8cd34b'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','ef1ee8f9-04df-4e7c-96de-b6edd8f375e1'),(36,'craft','m161021_182140_rename_get_help_widget','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','54d3b764-46de-4a4f-aa56-797078563b9e'),(37,'craft','m161025_000000_fix_char_columns','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','f7116d0a-21b2-4606-a2ed-50d97258f06c'),(38,'craft','m161029_124145_email_message_languages','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','56a42e23-7c7f-4c86-99ac-b7a91349bbd0'),(39,'craft','m161108_000000_new_version_format','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','e6613bb0-244b-4aea-b55c-1168287ba319'),(40,'craft','m161109_000000_index_shuffle','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','323c3f09-f6ee-4157-a9aa-001afbff4adb'),(41,'craft','m161122_185500_no_craft_app','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','584be8d6-e6c8-45c4-9a72-efc882d45948'),(42,'craft','m161125_150752_clear_urlmanager_cache','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','5480c612-d197-4b3e-a9af-e0908e7f583d'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-19 12:20:24','47129127-71bd-4023-9ee1-567bd59e4af5'),(44,'craft','m170114_161144_udates_permission','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','4eda1862-2529-4a65-9181-11d8b450a957'),(45,'craft','m170120_000000_schema_cleanup','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','5ca3ff09-37b3-4f93-90dd-b831cb8deabc'),(46,'craft','m170126_000000_assets_focal_point','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','547b225c-c6ed-4f06-bc65-881e48bf710a'),(47,'craft','m170206_142126_system_name','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','fc9c9391-263e-4a70-9c8a-aae3b26a345a'),(48,'craft','m170217_044740_category_branch_limits','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','9a4babf5-c383-452b-9233-60274ef6b714'),(49,'craft','m170217_120224_asset_indexing_columns','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','9bcae759-a202-4541-9ca3-84358830b3ea'),(50,'craft','m170223_224012_plain_text_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','fd34b877-5673-4537-abdb-dbc2ae094c58'),(51,'craft','m170227_120814_focal_point_percentage','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','892e6353-028d-4525-ba40-97627c4f269d'),(52,'craft','m170228_171113_system_messages','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e6dc7225-04ed-45e3-b2c1-7ef029c37129'),(53,'craft','m170303_140500_asset_field_source_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','d1ffb7d6-cf80-4501-af18-cd7a162e30c8'),(54,'craft','m170306_150500_asset_temporary_uploads','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0043fb6c-2563-4aef-ab38-330cbe0879f1'),(55,'craft','m170523_190652_element_field_layout_ids','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','fc4cd487-5357-450f-903f-efd8af514476'),(56,'craft','m170621_195237_format_plugin_handles','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','059f01a9-3eb8-4a4b-be52-79e4317eec0f'),(57,'craft','m170630_161027_deprecation_line_nullable','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','bcfa5768-820d-4539-bba6-511d7d604a3d'),(58,'craft','m170630_161028_deprecation_changes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','5dd2a753-ab1d-45a5-a0d2-d2ada05026dd'),(59,'craft','m170703_181539_plugins_table_tweaks','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','1b5a67c9-f34c-483e-a0a7-b7a07e45a54d'),(60,'craft','m170704_134916_sites_tables','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','58e0eee9-3dd9-473d-88cc-a5eb09856de1'),(61,'craft','m170706_183216_rename_sequences','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','3f4ec58b-239e-41d7-b8a8-f26126544ef5'),(62,'craft','m170707_094758_delete_compiled_traits','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','a56e0950-b954-4152-a347-4d773b5bca90'),(63,'craft','m170731_190138_drop_asset_packagist','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','4284583b-7f05-45f5-950a-1ab48657c947'),(64,'craft','m170810_201318_create_queue_table','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','de991c5f-1f6f-4842-94a7-44e3b16bbb1e'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','890b0bf2-201f-4a39-a9ad-f30bb162499d'),(66,'craft','m170914_204621_asset_cache_shuffle','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','a04f5903-e1e9-4719-b04b-2e0aea85a918'),(67,'craft','m171011_214115_site_groups','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','127b6cfc-e0d9-4098-b41e-3d0395391651'),(68,'craft','m171012_151440_primary_site','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','8c753868-508c-4b0e-bab2-29b60938c613'),(69,'craft','m171013_142500_transform_interlace','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','d6b7c09a-759d-493c-976e-d6c8bdb55d01'),(70,'craft','m171016_092553_drop_position_select','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','71930ef1-b937-49cc-a722-f9746323d499'),(71,'craft','m171016_221244_less_strict_translation_method','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','a278aff8-7bb0-40d0-9857-3405bd2c5a4c'),(72,'craft','m171107_000000_assign_group_permissions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','fdf7b114-df4b-4d30-a8c2-959cfa535976'),(73,'craft','m171117_000001_templatecache_index_tune','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','47186c15-364e-4c7e-9f74-2461f97a34ed'),(74,'craft','m171126_105927_disabled_plugins','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','12a2b89d-5d16-4c71-a1f4-48e856e031bc'),(75,'craft','m171130_214407_craftidtokens_table','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','c8d258a6-53fa-4c0b-af98-96826138ee80'),(76,'craft','m171202_004225_update_email_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','4db675a4-393e-4676-a2aa-61fe41677c1b'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','c96fd646-c012-4e45-a850-9251bae6024b'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','274f745d-6b1d-4d56-b0e1-a4b576317295'),(79,'craft','m171218_143135_longtext_query_column','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','868b98a4-0e8d-4a67-93b4-a9a6b9c41bcb'),(80,'craft','m171231_055546_environment_variables_to_aliases','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','6c26fe91-1a1d-4799-ab18-5fb921ca23f9'),(81,'craft','m180113_153740_drop_users_archived_column','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','13e45db7-dbe4-4248-9307-9fb073459e72'),(82,'craft','m180122_213433_propagate_entries_setting','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','9f5fc720-f585-40f9-9878-ae319d5632b5'),(83,'craft','m180124_230459_fix_propagate_entries_values','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0676f160-fb6b-4dbb-8155-83ecd3195e69'),(84,'craft','m180128_235202_set_tag_slugs','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','1619c004-591d-42c9-afdc-79607d4c20fc'),(85,'craft','m180202_185551_fix_focal_points','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0b93ad58-6065-4755-9ca1-df598cbbbf10'),(86,'craft','m180217_172123_tiny_ints','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','91dc51b3-5955-40f2-b861-6112b6d80843'),(87,'craft','m180321_233505_small_ints','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','bdcf3cc9-f41e-4533-9c06-26b3deab0389'),(88,'craft','m180328_115523_new_license_key_statuses','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','86e1941e-b3e1-45ec-b5d4-c86b7357f0ca'),(89,'craft','m180404_182320_edition_changes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0cb2d1a4-f79e-4aa3-a81d-e631e5cf5488'),(90,'craft','m180411_102218_fix_db_routes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','05ac4b8c-551b-4f64-a078-c4f95c0077e3'),(91,'craft','m180416_205628_resourcepaths_table','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','34f16eda-bafc-459c-85bd-b13bb2810e63'),(92,'craft','m180418_205713_widget_cleanup','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e690cbb4-13ae-4950-8720-42462ac1549c'),(93,'craft','m180425_203349_searchable_fields','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e8c0a976-b2f7-476b-a46f-8af3cc0db908'),(94,'craft','m180516_153000_uids_in_field_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','98e49921-fc84-4f4c-9de8-a21780ef5fbf'),(95,'craft','m180517_173000_user_photo_volume_to_uid','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','f3887b64-733c-4f0a-b19b-dd058afa841a'),(96,'craft','m180518_173000_permissions_to_uid','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','158ccf0a-c227-481e-9e3b-f07785dd9970'),(97,'craft','m180520_173000_matrix_context_to_uids','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','ff7484ca-97ec-4bbf-b34a-dee1d55850c0'),(98,'craft','m180521_172900_project_config_table','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','ac3528f6-7430-4870-aeaa-7d4206fc2a56'),(99,'craft','m180521_173000_initial_yml_and_snapshot','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','92d42677-c57a-44b4-9585-ba9f942303c4'),(100,'craft','m180731_162030_soft_delete_sites','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','cf091da1-7ebc-4093-8159-0e2dae3e273d'),(101,'craft','m180810_214427_soft_delete_field_layouts','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','6efc5e47-2364-426d-b17c-7e7d3c19d87e'),(102,'craft','m180810_214439_soft_delete_elements','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','44b3d118-5ac2-406a-aea0-8c047de7ae46'),(103,'craft','m180824_193422_case_sensitivity_fixes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','eadd3f41-193f-4912-a58f-7546fd05218f'),(104,'craft','m180901_151639_fix_matrixcontent_tables','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0bbc0da5-536f-4075-9305-f13994cb3f7e'),(105,'craft','m180904_112109_permission_changes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','8bd8a202-b267-4218-9de9-7c7750c66ddb'),(106,'craft','m180910_142030_soft_delete_sitegroups','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','95a39398-8ac4-42b7-8fc1-000d9e8decee'),(107,'craft','m181011_160000_soft_delete_asset_support','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','67adaa69-8dd2-4f78-a3bd-0f335ceb8690'),(108,'craft','m181016_183648_set_default_user_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','32f60fbe-232c-4c74-a87c-0ac6afd0d328'),(109,'craft','m181017_225222_system_config_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','c469019f-dc64-4058-91f4-35b29ab25def'),(110,'craft','m181018_222343_drop_userpermissions_from_config','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','c083d46f-07bb-45cb-a187-5365744ca0cd'),(111,'craft','m181029_130000_add_transforms_routes_to_config','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','4c826c10-9a52-4118-afb1-586b14486d32'),(112,'craft','m181112_203955_sequences_table','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','a8772c72-c6be-4aae-84cd-c7db6078054e'),(113,'craft','m181121_001712_cleanup_field_configs','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','6a5da9a3-b802-444a-b77b-fffd7a7263e2'),(114,'craft','m181128_193942_fix_project_config','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','d60426f8-6bec-401b-afc8-a7afe0ae1c69'),(115,'craft','m181130_143040_fix_schema_version','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','7d8917a9-5499-4897-b3f8-e509f319dd2b'),(116,'craft','m181211_143040_fix_entry_type_uids','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','31df6ae3-267a-4019-a703-79a98a1a6695'),(117,'craft','m181217_153000_fix_structure_uids','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','487ebc84-3b61-4e14-8279-3ef4dca188e9'),(118,'craft','m190104_152725_store_licensed_plugin_editions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','25ba6cc7-9c56-46cb-b6df-049bfaa7a16f'),(119,'craft','m190108_110000_cleanup_project_config','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','bc897599-229d-472a-a3e1-5e42b8b5d014'),(120,'craft','m190108_113000_asset_field_setting_change','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','05933569-a553-433d-9553-a53263a4ff71'),(121,'craft','m190109_172845_fix_colspan','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','ba933c55-6b82-47a4-9c3a-9c793795f8e7'),(122,'craft','m190110_150000_prune_nonexisting_sites','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','8d454ce5-d0ec-420b-9589-653609373b67'),(123,'craft','m190110_214819_soft_delete_volumes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','c593e24d-d9fc-4081-a906-662e50b1f3cf'),(124,'craft','m190112_124737_fix_user_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','ccc14eeb-1ada-4082-a5c2-21ba6257f47f'),(125,'craft','m190112_131225_fix_field_layouts','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0598f8d6-8c5b-4611-bfa2-681d2eb7a4cd'),(126,'craft','m190112_201010_more_soft_deletes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','548b4335-1448-42da-8d62-802b2ceff4aa'),(127,'craft','m190114_143000_more_asset_field_setting_changes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','6656bae8-da60-4b8f-96b7-0a2016ec4c8a'),(128,'craft','m190121_120000_rich_text_config_setting','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','3adc60a8-1437-417a-b133-4edf27201670'),(129,'craft','m190125_191628_fix_email_transport_password','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e09baadb-cfd8-4e51-bb32-9eedda8d0169'),(130,'craft','m190128_181422_cleanup_volume_folders','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','10e4d4b7-5997-40d8-8a91-d5cc44a82d9d'),(131,'craft','m190205_140000_fix_asset_soft_delete_index','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','61d810dc-3180-40c7-98ac-b10ecf4e2c23'),(132,'craft','m190218_143000_element_index_settings_uid','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','b201fcf4-35de-42cd-90c2-4a29696d7b83'),(133,'craft','m190312_152740_element_revisions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','7ac967ea-f260-431c-aba5-802c54822ad8'),(134,'craft','m190327_235137_propagation_method','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0f894403-87ae-4c64-a49c-d6481475ca0a'),(135,'craft','m190401_223843_drop_old_indexes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','6c07b8df-00f6-4d6b-9f88-425b7177ae7f'),(136,'craft','m190416_014525_drop_unique_global_indexes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e05e5ca5-cdfd-46dc-8dee-e561bafd16cf'),(137,'craft','m190417_085010_add_image_editor_permissions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','2ef99403-973f-4625-9bfc-5b7a8e0f6552'),(138,'craft','m190502_122019_store_default_user_group_uid','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0aa4de46-d707-47c9-8265-3391b4f1d2a3'),(139,'craft','m190504_150349_preview_targets','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','051f9f86-36ec-49ae-9741-9976860e8876'),(140,'craft','m190516_184711_job_progress_label','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','85724423-b8e8-4113-998e-e9a966268df6'),(141,'craft','m190523_190303_optional_revision_creators','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','a57a4d50-59f2-4424-9d47-405809a771ed'),(142,'craft','m190529_204501_fix_duplicate_uids','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','9fbe2d9e-ecc5-494a-b080-8167e49b2575'),(143,'craft','m190605_223807_unsaved_drafts','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0943cb96-0b4d-49ee-8b5a-b4f6d8bc0814'),(144,'craft','m190607_230042_entry_revision_error_tables','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','9818b860-7b04-47bd-b66a-4869227001c0'),(145,'craft','m190608_033429_drop_elements_uid_idx','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','61dcb6a6-936f-45f0-a234-815ada998aa7'),(146,'craft','m190617_164400_add_gqlschemas_table','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','215f5664-7143-4cc4-99a9-f956c2e5b68f'),(147,'craft','m190624_234204_matrix_propagation_method','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','6a623b28-05e2-461f-8611-f74e205b4cc7'),(148,'craft','m190711_153020_drop_snapshots','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','06a936c8-133b-42b8-b127-a1c2470efd40'),(149,'craft','m190712_195914_no_draft_revisions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e36b13f0-7404-4661-a255-53359a0acb1c'),(150,'craft','m190723_140314_fix_preview_targets_column','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e6900432-807d-443d-9a0c-a94f9fc039cb'),(151,'craft','m190820_003519_flush_compiled_templates','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','629ee756-a8e2-4766-b67f-350db25c4a49'),(152,'craft','m190823_020339_optional_draft_creators','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','5b978d4d-73e6-41ff-8a76-f4de7fb3fe0c'),(153,'craft','m190913_152146_update_preview_targets','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','89f6e97f-c18e-42fb-9fe3-ebcf8ae9a033'),(154,'craft','m191107_122000_add_gql_project_config_support','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','593e6b12-c459-4e8a-b3e4-a5ecc2104511'),(155,'craft','m191204_085100_pack_savable_component_settings','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','3d9848f8-bbf8-48f4-948d-40823f8ae79a'),(156,'craft','m191206_001148_change_tracking','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','31a2a8f2-4224-452f-af07-7391f146e08a'),(157,'craft','m191216_191635_asset_upload_tracking','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','740f4036-e1b6-4cb1-83ef-cff0ee684bcf'),(158,'craft','m191222_002848_peer_asset_permissions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','b1267daf-2a4e-4f1c-be00-1c9f64fce337'),(159,'craft','m200127_172522_queue_channels','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','aead69c0-769a-4435-9591-36e1850c5b4c'),(160,'craft','m200211_175048_truncate_element_query_cache','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','228462a7-bc78-4942-9deb-2a980f811ec2'),(161,'craft','m200213_172522_new_elements_index','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','26a75a4c-1f0e-4700-a5ad-ac5cff538059'),(162,'craft','m200228_195211_long_deprecation_messages','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','632c0129-9b33-45a1-b190-83f63ddc63ea'),(163,'craft','m200306_054652_disabled_sites','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','052f45b5-a376-4a6c-834e-6c670f2dd61e'),(164,'craft','m200522_191453_clear_template_caches','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0e9fcfba-dad6-4b4e-8787-c35cea1d498e'),(165,'craft','m200606_231117_migration_tracks','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','5e4569ee-0b1e-4a93-b557-90290e725a94'),(166,'craft','m200619_215137_title_translation_method','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','7c38a63f-c123-4666-bf85-3b2a96b633da'),(167,'craft','m200620_005028_user_group_descriptions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','ac0fdfe2-98eb-45cf-8b8f-306c2f75d1ab'),(168,'craft','m200620_230205_field_layout_changes','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','c35a49c5-30d0-4290-9948-a629d96a8284'),(169,'craft','m200625_131100_move_entrytypes_to_top_project_config','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0a04acf5-7efb-478e-a44c-21af52b00b54'),(170,'craft','m200629_112700_remove_project_config_legacy_files','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','ac2dd634-c566-49fa-8e6d-ec1c9539c0dc'),(171,'craft','m200630_183000_drop_configmap','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','79de9ee5-360f-4e3b-a863-80f6747cfc52'),(172,'craft','m200715_113400_transform_index_error_flag','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','0f6e73bd-b703-44f9-9801-05aabe0caf68'),(173,'craft','m200716_110900_replace_file_asset_permissions','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','39023fa4-a3ae-4dda-a400-ee7924fb66cf'),(174,'craft','m200716_153800_public_token_settings_in_project_config','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','e29bf7c6-b043-4774-b9da-9f61ff28f934'),(175,'craft','m200720_175543_drop_unique_constraints','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','c58acca8-f5fa-44f0-b0b3-ddaf1252ca0e'),(176,'craft','m200825_051217_project_config_version','2020-12-19 12:20:25','2020-12-19 12:20:25','2020-12-19 12:20:25','9d5c2e29-a3d6-46b1-979d-12ddc6544cab');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1608580076'),('email.fromEmail','\"jochen.panjaer@telenet.be\"'),('email.fromName','\"happylittledinosaurs\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.autocapitalize','true'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.autocomplete','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.autocorrect','true'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.class','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.disabled','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.id','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.max','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.min','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.name','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.orientation','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.placeholder','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.readonly','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.requirable','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.size','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.step','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.title','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.0.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.fieldUid','\"ba152a31-97b9-4f25-a554-2d7298bdd447\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.elements.1.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.name','\"Content\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.0.sortOrder','1'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.fieldUid','\"955df9cb-053f-4443-b5ae-1e2f73d2ad7c\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.0.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.fieldUid','\"22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.elements.1.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.name','\"Section-CallToAction\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.1.sortOrder','2'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.fieldUid','\"1741b25b-a9e6-452a-9bc8-068f511877e2\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.elements.0.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.name','\"Section-Bundle\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.2.sortOrder','3'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.fieldUid','\"70d771ca-07a3-4890-9fec-cb3cadc49158\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.0.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.fieldUid','\"249ef0ae-da23-4a87-a954-c81208b52b07\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.elements.1.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.name','\"Section-WhatsInTheBox\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.3.sortOrder','4'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.fieldUid','\"46e5c776-0d54-48f3-810c-b39d129fa37b\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.0.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.fieldUid','\"77462a97-50df-448d-8d7d-0135e9525f4e\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.elements.1.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.name','\"Section-TakeACloserLook\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.4.sortOrder','5'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.fieldUid','\"57a42f69-564f-4d11-b2e9-8285220eab31\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.elements.0.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.name','\"Section-Story\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.5.sortOrder','6'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.fieldUid','\"07422314-46fd-4675-bdbd-63c80fb2ba29\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.0.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.fieldUid','\"21ae595a-9db9-41ae-b5a7-29d345580411\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.instructions','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.label','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.required','false'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.tip','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.warning','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.elements.1.width','100'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.name','\"Section-OtherGames\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.fieldLayouts.dfec4635-29df-4002-874c-a1c5fc415887.tabs.6.sortOrder','7'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.handle','\"home\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.hasTitleField','true'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.name','\"Home\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.section','\"d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.sortOrder','1'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.titleFormat','\"{section.name|raw}\"'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.titleTranslationKeyFormat','null'),('entryTypes.0b78803e-d19b-4bb5-b116-44071013c23f.titleTranslationMethod','\"site\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.autocapitalize','true'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.autocomplete','false'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.autocorrect','true'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.class','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.disabled','false'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.id','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.instructions','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.label','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.max','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.min','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.name','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.orientation','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.placeholder','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.readonly','false'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.requirable','false'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.size','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.step','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.tip','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.title','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.warning','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.0.width','100'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.fieldUid','\"c0290c04-835e-4a8f-ba87-cf95d08665a6\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.instructions','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.label','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.required','false'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.tip','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.warning','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.1.width','100'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.fieldUid','\"e4f4d335-9e0e-4e7d-91d6-38a9624b8d38\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.instructions','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.label','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.required','false'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.tip','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.warning','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.2.width','100'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.fieldUid','\"408b73a9-aec2-47a6-b810-72bbe7b66a4a\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.instructions','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.label','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.required','false'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.tip','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.warning','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.elements.3.width','100'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.name','\"Content\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.fieldLayouts.cd9f7b5f-8eb3-46cf-b08e-9e6a23d69217.tabs.0.sortOrder','1'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.handle','\"shopItem\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.hasTitleField','true'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.name','\"Shop Item\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.section','\"1998bdee-5e97-4233-863b-2a8db2a9239c\"'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.sortOrder','1'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.titleFormat','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.titleTranslationKeyFormat','null'),('entryTypes.9e13f8c0-be0a-4ae0-93c0-1e36dd4da564.titleTranslationMethod','\"site\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.autocapitalize','true'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.autocomplete','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.autocorrect','true'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.class','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.disabled','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.id','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.instructions','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.label','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.max','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.min','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.name','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.orientation','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.placeholder','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.readonly','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.requirable','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.size','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.step','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.tip','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.title','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.warning','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.elements.0.width','100'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.name','\"Content\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.0.sortOrder','1'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.fieldUid','\"4bfff36a-cda0-4893-a923-776c0658041d\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.instructions','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.label','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.required','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.tip','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.warning','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.0.width','100'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.fieldUid','\"122907c1-4e91-4621-b94c-c494900723b9\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.instructions','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.label','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.required','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.tip','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.warning','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.1.width','100'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.fieldUid','\"109682cb-163b-4fba-8b09-1978b39c3272\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.instructions','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.label','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.required','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.tip','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.warning','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.2.width','100'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.fieldUid','\"3501ae42-8ea8-4828-810e-45548120e746\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.instructions','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.label','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.required','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.tip','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.warning','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.3.width','100'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.fieldUid','\"7b76537e-99d1-42d2-ba7b-47829805858a\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.instructions','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.label','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.required','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.tip','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.warning','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.elements.4.width','100'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.name','\"Featured\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.1.sortOrder','2'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.fieldUid','\"4b6aad40-58d7-42aa-ae23-0e68e5ffb884\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.instructions','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.label','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.required','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.tip','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.warning','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.elements.0.width','100'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.name','\"Shop Items\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.fieldLayouts.9022f2dc-2d63-4c6e-a3e0-84565e754627.tabs.2.sortOrder','3'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.handle','\"shop\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.hasTitleField','false'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.name','\"Shop\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.section','\"43560bcb-1bcd-4cf8-bb33-49fe9b287cc4\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.sortOrder','1'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.titleFormat','\"{section.name|raw}\"'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.titleTranslationKeyFormat','null'),('entryTypes.d63213ff-29d6-4652-978f-33ba52c0d6ab.titleTranslationMethod','\"site\"'),('fieldGroups.224285f8-6c4e-4c27-a6d6-0de6b628ee60.name','\"home\"'),('fieldGroups.bfc9c07c-7d33-484e-b559-1eb1dac8b00a.name','\"shop\"'),('fieldGroups.ea7b6f89-efe1-41a4-91f4-b71958991fa3.name','\"Common\"'),('fieldGroups.f6daf363-3490-4a78-8d3b-75915a9d7d1a.name','\"shopItem\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.contentColumnType','\"text\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.handle','\"otherGamesTitle\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.instructions','\"\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.name','\"Other Games Title\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.searchable','false'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.byteLimit','null'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.charLimit','null'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.code','\"\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.columnType','null'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.initialRows','\"4\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.multiline','\"\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.placeholder','\"\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.settings.uiMode','\"normal\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.translationKeyFormat','null'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.translationMethod','\"none\"'),('fields.07422314-46fd-4675-bdbd-63c80fb2ba29.type','\"craft\\\\fields\\\\PlainText\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.contentColumnType','\"text\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.fieldGroup','\"bfc9c07c-7d33-484e-b559-1eb1dac8b00a\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.handle','\"featuredAddOnTitle\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.instructions','\"\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.name','\"Featured Add-On Title\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.searchable','false'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.byteLimit','null'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.charLimit','null'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.code','\"\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.columnType','null'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.initialRows','\"4\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.multiline','\"\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.placeholder','\"\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.settings.uiMode','\"normal\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.translationKeyFormat','null'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.translationMethod','\"none\"'),('fields.109682cb-163b-4fba-8b09-1978b39c3272.type','\"craft\\\\fields\\\\PlainText\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.contentColumnType','\"string\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.fieldGroup','\"bfc9c07c-7d33-484e-b559-1eb1dac8b00a\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.handle','\"featuredAddOnImage\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.instructions','\"\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.name','\"Featured Add-On Image\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.searchable','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.allowedKinds','null'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.allowSelfRelations','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.allowUploads','true'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.defaultUploadLocationSubpath','\"\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.limit','\"1\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.localizeRelations','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.previewMode','\"full\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.restrictFiles','\"\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.selectionLabel','\"\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.showSiteMenu','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.showUnpermittedFiles','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.showUnpermittedVolumes','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.singleUploadLocationSubpath','\"\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.source','null'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.sources.0','\"volume:77b802d6-cf66-4f9e-934a-0a6a18fc45ee\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.targetSiteId','null'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.useSingleFolder','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.validateRelatedElements','false'),('fields.122907c1-4e91-4621-b94c-c494900723b9.settings.viewMode','\"list\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.translationKeyFormat','null'),('fields.122907c1-4e91-4621-b94c-c494900723b9.translationMethod','\"site\"'),('fields.122907c1-4e91-4621-b94c-c494900723b9.type','\"craft\\\\fields\\\\Assets\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.contentColumnType','\"string\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.handle','\"bundle\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.instructions','\"\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.name','\"Bundle\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.searchable','false'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.settings.contentTable','\"{{%matrixcontent_bundle}}\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.settings.maxBlocks','\"1\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.settings.minBlocks','\"1\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.settings.propagationMethod','\"all\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.translationKeyFormat','null'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.translationMethod','\"site\"'),('fields.1741b25b-a9e6-452a-9bc8-068f511877e2.type','\"craft\\\\fields\\\\Matrix\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.contentColumnType','\"string\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.handle','\"otherGames\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.instructions','\"\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.name','\"Other Games\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.searchable','false'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.settings.contentTable','\"{{%matrixcontent_othergames}}\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.settings.maxBlocks','\"4\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.settings.minBlocks','\"1\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.settings.propagationMethod','\"all\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.translationKeyFormat','null'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.translationMethod','\"site\"'),('fields.21ae595a-9db9-41ae-b5a7-29d345580411.type','\"craft\\\\fields\\\\Matrix\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.contentColumnType','\"string\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.handle','\"ctaPreorder\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.instructions','\"\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.name','\"Cta Preorder\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.searchable','false'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.settings.contentTable','\"{{%matrixcontent_ctapreorder}}\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.settings.maxBlocks','\"\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.settings.minBlocks','\"\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.settings.propagationMethod','\"all\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.translationKeyFormat','null'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.translationMethod','\"site\"'),('fields.22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e.type','\"craft\\\\fields\\\\Matrix\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.contentColumnType','\"string\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.handle','\"dividingBanner\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.instructions','\"\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.name','\"Dividing Banner\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.searchable','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.allowedKinds','null'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.allowSelfRelations','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.allowUploads','true'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.defaultUploadLocationSubpath','\"\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.limit','\"1\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.localizeRelations','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.previewMode','\"full\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.restrictFiles','\"\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.selectionLabel','\"\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.showSiteMenu','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.showUnpermittedFiles','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.showUnpermittedVolumes','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.singleUploadLocationSubpath','\"\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.source','null'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.sources.0','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.targetSiteId','null'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.useSingleFolder','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.validateRelatedElements','false'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.settings.viewMode','\"list\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.translationKeyFormat','null'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.translationMethod','\"site\"'),('fields.249ef0ae-da23-4a87-a954-c81208b52b07.type','\"craft\\\\fields\\\\Assets\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.contentColumnType','\"text\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.fieldGroup','\"bfc9c07c-7d33-484e-b559-1eb1dac8b00a\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.handle','\"featuredAddOnDescription\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.instructions','\"\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.name','\"Featured Add-On Description\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.searchable','false'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.byteLimit','null'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.charLimit','null'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.code','\"\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.columnType','null'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.initialRows','\"4\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.multiline','\"\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.placeholder','\"\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.settings.uiMode','\"normal\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.translationKeyFormat','null'),('fields.3501ae42-8ea8-4828-810e-45548120e746.translationMethod','\"none\"'),('fields.3501ae42-8ea8-4828-810e-45548120e746.type','\"craft\\\\fields\\\\PlainText\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.contentColumnType','\"text\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.fieldGroup','\"f6daf363-3490-4a78-8d3b-75915a9d7d1a\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.handle','\"priceTag\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.instructions','\"\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.name','\"Price Tag\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.searchable','false'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.byteLimit','null'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.charLimit','null'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.code','\"\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.columnType','null'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.initialRows','\"4\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.multiline','\"\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.placeholder','\"\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.settings.uiMode','\"normal\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.translationKeyFormat','null'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.translationMethod','\"none\"'),('fields.408b73a9-aec2-47a6-b810-72bbe7b66a4a.type','\"craft\\\\fields\\\\PlainText\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.contentColumnType','\"string\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.handle','\"takeACloserLook\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.instructions','\"\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.name','\"Take A Closer Look\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.searchable','false'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.settings.contentTable','\"{{%matrixcontent_takeacloserlook}}\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.settings.maxBlocks','\"\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.settings.minBlocks','\"\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.settings.propagationMethod','\"all\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.translationKeyFormat','null'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.translationMethod','\"site\"'),('fields.46e5c776-0d54-48f3-810c-b39d129fa37b.type','\"craft\\\\fields\\\\Matrix\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.contentColumnType','\"string\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.fieldGroup','\"ea7b6f89-efe1-41a4-91f4-b71958991fa3\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.handle','\"mainLogoImage\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.instructions','\"\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.name','\"Main Logo Image\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.searchable','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.allowedKinds','null'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.allowSelfRelations','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.allowUploads','true'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.defaultUploadLocationSubpath','\"\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.limit','\"1\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.localizeRelations','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.previewMode','\"full\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.restrictFiles','\"\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.selectionLabel','\"\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.showSiteMenu','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.showUnpermittedFiles','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.showUnpermittedVolumes','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.singleUploadLocationSubpath','\"\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.source','null'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.sources.0','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.targetSiteId','null'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.useSingleFolder','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.validateRelatedElements','false'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.settings.viewMode','\"list\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.translationKeyFormat','null'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.translationMethod','\"site\"'),('fields.47f80b4f-c8bc-454a-87bc-ab29f2f6305c.type','\"craft\\\\fields\\\\Assets\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.contentColumnType','\"text\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.fieldGroup','\"bfc9c07c-7d33-484e-b559-1eb1dac8b00a\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.handle','\"shopItemsTitle\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.instructions','\"\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.name','\"Shop Items Title\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.searchable','false'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.byteLimit','null'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.charLimit','null'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.code','\"\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.columnType','null'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.initialRows','\"4\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.multiline','\"\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.placeholder','\"\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.settings.uiMode','\"normal\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.translationKeyFormat','null'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.translationMethod','\"none\"'),('fields.4b6aad40-58d7-42aa-ae23-0e68e5ffb884.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.contentColumnType','\"text\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.fieldGroup','\"bfc9c07c-7d33-484e-b559-1eb1dac8b00a\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.handle','\"featuredAddOnArticle\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.instructions','\"\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.name','\"Featured Add-On Article\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.searchable','false'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.byteLimit','null'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.charLimit','null'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.code','\"\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.columnType','null'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.initialRows','\"4\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.multiline','\"\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.placeholder','\"\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.settings.uiMode','\"normal\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.translationKeyFormat','null'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.translationMethod','\"none\"'),('fields.4bfff36a-cda0-4893-a923-776c0658041d.type','\"craft\\\\fields\\\\PlainText\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.contentColumnType','\"string\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.handle','\"ourStory\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.instructions','\"\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.name','\"Our Story\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.searchable','false'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.settings.contentTable','\"{{%matrixcontent_ourstory}}\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.settings.maxBlocks','\"1\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.settings.minBlocks','\"1\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.settings.propagationMethod','\"all\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.translationKeyFormat','null'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.translationMethod','\"site\"'),('fields.57a42f69-564f-4d11-b2e9-8285220eab31.type','\"craft\\\\fields\\\\Matrix\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.contentColumnType','\"string\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.handle','\"whatsInTheBox\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.instructions','\"\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.name','\"Whats In The Box\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.searchable','false'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.settings.contentTable','\"{{%matrixcontent_whatsinthebox}}\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.settings.maxBlocks','\"\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.settings.minBlocks','\"\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.settings.propagationMethod','\"all\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.translationKeyFormat','null'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.translationMethod','\"site\"'),('fields.70d771ca-07a3-4890-9fec-cb3cadc49158.type','\"craft\\\\fields\\\\Matrix\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.contentColumnType','\"string\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.handle','\"projectTimeline\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.instructions','\"\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.name','\"Project Timeline\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.searchable','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.allowedKinds','null'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.allowSelfRelations','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.allowUploads','true'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.defaultUploadLocationSubpath','\"\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.limit','\"1\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.localizeRelations','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.previewMode','\"full\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.restrictFiles','\"\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.selectionLabel','\"\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.showSiteMenu','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.showUnpermittedFiles','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.showUnpermittedVolumes','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.singleUploadLocationSubpath','\"\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.source','null'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.sources.0','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.targetSiteId','null'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.useSingleFolder','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.validateRelatedElements','false'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.settings.viewMode','\"list\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.translationKeyFormat','null'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.translationMethod','\"site\"'),('fields.77462a97-50df-448d-8d7d-0135e9525f4e.type','\"craft\\\\fields\\\\Assets\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.contentColumnType','\"text\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.fieldGroup','\"bfc9c07c-7d33-484e-b559-1eb1dac8b00a\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.handle','\"featuredAddOnCtaText\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.instructions','\"\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.name','\"Featured Add-On CTA Text\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.searchable','false'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.byteLimit','null'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.charLimit','null'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.code','\"\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.columnType','null'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.initialRows','\"4\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.multiline','\"\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.placeholder','\"\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.settings.uiMode','\"normal\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.translationKeyFormat','null'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.translationMethod','\"none\"'),('fields.7b76537e-99d1-42d2-ba7b-47829805858a.type','\"craft\\\\fields\\\\PlainText\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.contentColumnType','\"string\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.handle','\"ctaDescription\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.instructions','\"\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.name','\"Cta Description\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.searchable','false'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.settings.contentTable','\"{{%matrixcontent_ctadescription}}\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.settings.maxBlocks','\"1\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.settings.minBlocks','\"1\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.settings.propagationMethod','\"all\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.translationKeyFormat','null'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.translationMethod','\"site\"'),('fields.955df9cb-053f-4443-b5ae-1e2f73d2ad7c.type','\"craft\\\\fields\\\\Matrix\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.contentColumnType','\"string\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.fieldGroup','\"224285f8-6c4e-4c27-a6d6-0de6b628ee60\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.handle','\"banner\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.instructions','\"\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.name','\"Banner\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.searchable','false'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.allowedKinds','null'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.allowSelfRelations','false'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.allowUploads','true'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.defaultUploadLocationSubpath','\"\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.limit','\"1\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.localizeRelations','false'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.previewMode','\"full\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.restrictFiles','\"\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.selectionLabel','\"\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.showSiteMenu','false'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.showUnpermittedFiles','false'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.showUnpermittedVolumes','false'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.singleUploadLocationSubpath','\"\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.source','null'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.sources','\"*\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.targetSiteId','null'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.useSingleFolder','true'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.validateRelatedElements','false'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.settings.viewMode','\"large\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.translationKeyFormat','null'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.translationMethod','\"site\"'),('fields.ba152a31-97b9-4f25-a554-2d7298bdd447.type','\"craft\\\\fields\\\\Assets\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.contentColumnType','\"text\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.fieldGroup','\"f6daf363-3490-4a78-8d3b-75915a9d7d1a\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.handle','\"shopItemName\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.instructions','\"\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.name','\"Shop Item Name\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.searchable','false'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.byteLimit','null'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.charLimit','null'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.code','\"\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.columnType','null'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.initialRows','\"4\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.multiline','\"\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.placeholder','\"\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.settings.uiMode','\"normal\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.translationKeyFormat','null'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.translationMethod','\"none\"'),('fields.c0290c04-835e-4a8f-ba87-cf95d08665a6.type','\"craft\\\\fields\\\\PlainText\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.contentColumnType','\"string\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.fieldGroup','\"f6daf363-3490-4a78-8d3b-75915a9d7d1a\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.handle','\"image\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.instructions','\"\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.name','\"Image\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.searchable','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.allowedKinds','null'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.allowSelfRelations','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.allowUploads','true'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.defaultUploadLocationSubpath','\"\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.limit','\"1\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.localizeRelations','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.previewMode','\"full\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.restrictFiles','\"\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.selectionLabel','\"\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.showSiteMenu','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.showUnpermittedFiles','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.showUnpermittedVolumes','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.singleUploadLocationSubpath','\"\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.source','null'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.sources.0','\"volume:77b802d6-cf66-4f9e-934a-0a6a18fc45ee\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.targetSiteId','null'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.useSingleFolder','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.validateRelatedElements','false'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.settings.viewMode','\"list\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.translationKeyFormat','null'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.translationMethod','\"site\"'),('fields.e4f4d335-9e0e-4e7d-91d6-38a9624b8d38.type','\"craft\\\\fields\\\\Assets\"'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.fieldUid','\"47f80b4f-c8bc-454a-87bc-ab29f2f6305c\"'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.instructions','null'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.label','null'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.required','false'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.tip','null'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.warning','null'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.elements.0.width','100'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.name','\"Data\"'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.fieldLayouts.7d353f94-d1ea-41d6-b0c1-ce0fc3cc948f.tabs.0.sortOrder','1'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.handle','\"mainLogo\"'),('globalSets.d8506888-7b66-4b28-a8f2-2ce6767d6144.name','\"Main Logo\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.field','\"955df9cb-053f-4443-b5ae-1e2f73d2ad7c\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.fieldUid','\"76b4d5bd-0390-4001-b710-b710383bb384\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.label','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.required','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.tip','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.warning','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.0.width','100'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.fieldUid','\"53db0ca1-774e-4767-96d5-e2add7049d92\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.label','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.required','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.tip','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.warning','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.1.width','100'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.fieldUid','\"41136c62-0b75-4b68-8d37-9fd60e8fc48f\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.label','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.required','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.tip','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.warning','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.2.width','100'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.fieldUid','\"e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.label','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.required','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.tip','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.warning','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.3.width','100'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.fieldUid','\"5d5a9585-088e-4742-af9f-dfa079740ad5\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.label','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.required','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.tip','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.warning','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.elements.4.width','100'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.name','\"Content\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fieldLayouts.f5ba1a89-63e8-4c85-806b-037f2cfe77b8.tabs.0.sortOrder','1'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.contentColumnType','\"text\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.fieldGroup','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.handle','\"description\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.instructions','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.name','\"description\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.searchable','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.byteLimit','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.charLimit','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.code','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.columnType','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.initialRows','\"4\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.multiline','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.placeholder','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.settings.uiMode','\"normal\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.translationKeyFormat','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.translationMethod','\"none\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.41136c62-0b75-4b68-8d37-9fd60e8fc48f.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.contentColumnType','\"text\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.fieldGroup','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.handle','\"descriptionTitle\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.instructions','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.name','\"Title\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.searchable','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.byteLimit','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.charLimit','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.code','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.columnType','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.initialRows','\"4\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.multiline','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.placeholder','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.settings.uiMode','\"normal\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.translationKeyFormat','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.translationMethod','\"none\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.53db0ca1-774e-4767-96d5-e2add7049d92.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.contentColumnType','\"text\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.fieldGroup','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.handle','\"button\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.instructions','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.name','\"button\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.searchable','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.byteLimit','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.charLimit','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.code','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.columnType','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.initialRows','\"4\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.multiline','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.placeholder','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.settings.uiMode','\"normal\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.translationKeyFormat','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.translationMethod','\"none\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.5d5a9585-088e-4742-af9f-dfa079740ad5.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.contentColumnType','\"string\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.fieldGroup','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.handle','\"image\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.instructions','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.name','\"image\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.searchable','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.allowedKinds','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.allowSelfRelations','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.allowUploads','true'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.limit','\"1\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.localizeRelations','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.previewMode','\"full\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.restrictFiles','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.selectionLabel','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.showSiteMenu','true'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.showUnpermittedFiles','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.source','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.sources.0','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.targetSiteId','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.useSingleFolder','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.validateRelatedElements','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.settings.viewMode','\"list\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.translationKeyFormat','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.translationMethod','\"site\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.76b4d5bd-0390-4001-b710-b710383bb384.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.contentColumnType','\"text\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.fieldGroup','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.handle','\"fixedList\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.instructions','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.name','\"Fixed List\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.searchable','false'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.addRowLabel','\"Add a row\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Value\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.1.1','\"value\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.columnType','\"text\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.defaults.0.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.defaults.0.__assoc__.0.1','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.maxRows','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.settings.minRows','\"\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.translationKeyFormat','null'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.translationMethod','\"none\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.fields.e9d4e4e8-9aab-4636-9df3-3ddbaabe7de7.type','\"craft\\\\fields\\\\Table\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.handle','\"element\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.name','\"element\"'),('matrixBlockTypes.0948f0e7-6c86-45db-b5cd-8531a7228a98.sortOrder','1'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.field','\"22d61bd7-d84f-4b0a-b2ae-8b0eb87fa71e\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.fieldUid','\"d32f7b6d-2688-42c8-a568-32c48c01de9d\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.label','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.required','false'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.tip','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.warning','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.0.width','100'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.fieldUid','\"e9593c4e-5f13-427a-812b-96c704d1badb\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.label','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.required','false'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.tip','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.warning','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.elements.1.width','100'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.name','\"Content\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fieldLayouts.668bcdd3-af06-4bfc-b006-701a4aa8e248.tabs.0.sortOrder','1'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.contentColumnType','\"text\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.fieldGroup','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.handle','\"description\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.instructions','\"\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.name','\"description\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.searchable','false'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.byteLimit','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.charLimit','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.code','\"\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.columnType','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.initialRows','\"4\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.multiline','\"\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.placeholder','\"\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.settings.uiMode','\"normal\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.translationKeyFormat','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.translationMethod','\"none\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.d32f7b6d-2688-42c8-a568-32c48c01de9d.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.contentColumnType','\"string(255)\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.fieldGroup','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.handle','\"preorderUrl\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.instructions','\"\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.name','\"Preorder Url\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.searchable','false'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.settings.maxLength','\"255\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.settings.placeholder','\"\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.translationKeyFormat','null'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.translationMethod','\"none\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.fields.e9593c4e-5f13-427a-812b-96c704d1badb.type','\"craft\\\\fields\\\\Url\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.handle','\"element\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.name','\"element\"'),('matrixBlockTypes.156517b3-409e-41ae-a1a7-8a748a5a7a07.sortOrder','1'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.field','\"21ae595a-9db9-41ae-b5a7-29d345580411\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.fieldUid','\"aeead7a5-9278-4930-a2ba-e6693a7b0bfa\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.label','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.required','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.tip','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.warning','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.0.width','100'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.fieldUid','\"d270122d-0c80-4661-8b31-916c0206e6f2\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.label','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.required','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.tip','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.warning','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.1.width','100'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.fieldUid','\"d1801c45-b36c-4109-8017-8a4cc7d07490\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.label','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.required','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.tip','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.warning','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.2.width','100'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.fieldUid','\"1b556fef-b861-4c40-a115-21cf20069af4\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.label','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.required','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.tip','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.warning','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.elements.3.width','100'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.name','\"Content\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fieldLayouts.3f200807-1bde-4f2d-b592-53a3d9b176a2.tabs.0.sortOrder','1'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.contentColumnType','\"string\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.fieldGroup','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.handle','\"image\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.instructions','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.name','\"image\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.searchable','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.allowedKinds','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.allowSelfRelations','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.allowUploads','true'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.limit','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.localizeRelations','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.previewMode','\"full\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.restrictFiles','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.selectionLabel','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.showSiteMenu','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.showUnpermittedFiles','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.source','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.sources.0','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.targetSiteId','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.useSingleFolder','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.validateRelatedElements','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.settings.viewMode','\"list\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.translationKeyFormat','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.translationMethod','\"site\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.1b556fef-b861-4c40-a115-21cf20069af4.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.contentColumnType','\"text\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.fieldGroup','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.handle','\"gameTitle\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.instructions','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.name','\"Game Title\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.searchable','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.byteLimit','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.charLimit','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.code','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.columnType','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.initialRows','\"4\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.multiline','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.placeholder','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.settings.uiMode','\"normal\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.translationKeyFormat','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.translationMethod','\"none\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.aeead7a5-9278-4930-a2ba-e6693a7b0bfa.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.contentColumnType','\"text\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.fieldGroup','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.handle','\"buyText\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.instructions','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.name','\"Buy Text\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.searchable','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.byteLimit','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.charLimit','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.code','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.columnType','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.initialRows','\"4\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.multiline','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.placeholder','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.settings.uiMode','\"normal\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.translationKeyFormat','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.translationMethod','\"none\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d1801c45-b36c-4109-8017-8a4cc7d07490.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.contentColumnType','\"text\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.fieldGroup','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.handle','\"gameDescription\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.instructions','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.name','\"Game Description\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.searchable','false'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.byteLimit','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.charLimit','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.code','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.columnType','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.initialRows','\"4\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.multiline','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.placeholder','\"\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.settings.uiMode','\"normal\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.translationKeyFormat','null'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.translationMethod','\"none\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.fields.d270122d-0c80-4661-8b31-916c0206e6f2.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.handle','\"element\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.name','\"element\"'),('matrixBlockTypes.5272c575-d5c8-460e-84ec-a37d5d214610.sortOrder','1'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.field','\"1741b25b-a9e6-452a-9bc8-068f511877e2\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.fieldUid','\"b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.label','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.required','false'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.tip','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.warning','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.0.width','100'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.fieldUid','\"88b2ad21-520b-40c8-b4ee-1a555b199bfe\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.label','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.required','false'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.tip','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.warning','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.1.width','100'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.fieldUid','\"6d088e42-73c2-41aa-bc0f-11f3547c644a\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.label','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.required','false'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.tip','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.warning','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.elements.2.width','100'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.name','\"Content\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fieldLayouts.dca37def-ec6f-48dc-ad3d-1d59ac0e5a09.tabs.0.sortOrder','1'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.contentColumnType','\"text\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.fieldGroup','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.handle','\"tableData\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.instructions','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.name','\"Table Data\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.searchable','false'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.addRowLabel','\"Add a row\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Row Data\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.1.1','\"rowData\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.0','\"col2\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Standard Edition\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.1.1','\"standardEdition\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.0','\"col3\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.0.0','\"heading\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.0.1','\"Exclusive Edition\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.1.0','\"handle\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.1.1','\"exclusiveEdition\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.2.0','\"width\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.3.0','\"type\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columns.__assoc__.2.1.__assoc__.3.1','\"singleline\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.columnType','\"text\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.defaults.0.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.defaults.0.__assoc__.0.1','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.defaults.0.__assoc__.1.0','\"col2\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.defaults.0.__assoc__.1.1','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.defaults.0.__assoc__.2.0','\"col3\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.defaults.0.__assoc__.2.1','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.maxRows','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.settings.minRows','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.translationKeyFormat','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.translationMethod','\"none\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.6d088e42-73c2-41aa-bc0f-11f3547c644a.type','\"craft\\\\fields\\\\Table\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.contentColumnType','\"text\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.fieldGroup','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.handle','\"matrixSubtitle\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.instructions','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.name','\"matrixSubtitle\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.searchable','false'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.byteLimit','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.charLimit','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.code','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.columnType','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.initialRows','\"4\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.multiline','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.placeholder','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.settings.uiMode','\"normal\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.translationKeyFormat','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.translationMethod','\"none\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.88b2ad21-520b-40c8-b4ee-1a555b199bfe.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.contentColumnType','\"text\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.fieldGroup','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.handle','\"matrixTitle\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.instructions','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.name','\"matrixTitle\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.searchable','false'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.byteLimit','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.charLimit','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.code','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.columnType','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.initialRows','\"4\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.multiline','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.placeholder','\"\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.settings.uiMode','\"normal\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.translationKeyFormat','null'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.translationMethod','\"none\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.fields.b24d36e9-8a37-41d5-b9d1-6521dc2e0b2d.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.handle','\"element\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.name','\"element\"'),('matrixBlockTypes.5e307679-3009-4d6b-8107-b819fb617563.sortOrder','1'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.field','\"70d771ca-07a3-4890-9fec-cb3cadc49158\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.fieldUid','\"7c53bcde-78ac-4576-8a50-06f28dfd2431\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.label','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.required','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.tip','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.warning','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.0.width','100'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.fieldUid','\"43dee225-a3e4-4faa-8f23-d76ece35e529\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.label','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.required','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.tip','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.warning','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.1.width','100'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.fieldUid','\"ae8bb340-48e5-44ca-961a-5e4e6d0e0506\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.label','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.required','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.tip','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.warning','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.2.width','100'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.fieldUid','\"d69e9126-ea8b-4a8b-8b29-290b07c30e50\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.label','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.required','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.tip','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.warning','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.elements.3.width','100'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.name','\"Content\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fieldLayouts.ad543913-a697-4a95-a0f5-af79cbb1953f.tabs.0.sortOrder','1'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.contentColumnType','\"text\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.fieldGroup','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.handle','\"subtitle\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.instructions','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.name','\"subtitle\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.searchable','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.byteLimit','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.charLimit','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.code','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.columnType','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.initialRows','\"4\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.multiline','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.placeholder','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.settings.uiMode','\"normal\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.translationKeyFormat','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.translationMethod','\"none\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.43dee225-a3e4-4faa-8f23-d76ece35e529.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.contentColumnType','\"text\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.fieldGroup','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.handle','\"sectionTitle\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.instructions','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.name','\"Section Title\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.searchable','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.byteLimit','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.charLimit','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.code','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.columnType','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.initialRows','\"4\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.multiline','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.placeholder','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.settings.uiMode','\"normal\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.translationKeyFormat','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.translationMethod','\"none\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.7c53bcde-78ac-4576-8a50-06f28dfd2431.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.contentColumnType','\"string\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.fieldGroup','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.handle','\"image\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.instructions','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.name','\"image\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.searchable','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.allowedKinds','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.allowSelfRelations','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.allowUploads','true'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.limit','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.localizeRelations','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.previewMode','\"full\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.restrictFiles','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.selectionLabel','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.showSiteMenu','true'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.showUnpermittedFiles','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.source','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.sources.0','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.targetSiteId','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.useSingleFolder','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.validateRelatedElements','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.settings.viewMode','\"list\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.translationKeyFormat','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.translationMethod','\"site\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.ae8bb340-48e5-44ca-961a-5e4e6d0e0506.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.contentColumnType','\"text\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.fieldGroup','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.handle','\"itemsSummary\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.instructions','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.name','\"Items Summary\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.searchable','false'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.addRowLabel','\"Add a row\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Value\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.1.1','\"value\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.columnType','\"text\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.defaults.0.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.defaults.0.__assoc__.0.1','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.maxRows','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.settings.minRows','\"\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.translationKeyFormat','null'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.translationMethod','\"none\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.fields.d69e9126-ea8b-4a8b-8b29-290b07c30e50.type','\"craft\\\\fields\\\\Table\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.handle','\"sectionBlock\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.name','\"Section block\"'),('matrixBlockTypes.5f140596-d000-45ec-bd1c-4d0ba98e7753.sortOrder','1'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.field','\"46e5c776-0d54-48f3-810c-b39d129fa37b\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.fieldUid','\"3f29eae5-c9a0-4743-adb0-d6dc2196d5be\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.label','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.required','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.tip','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.warning','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.0.width','100'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.fieldUid','\"bce818e2-ea07-486b-87a9-155ccf9f94cb\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.label','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.required','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.tip','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.warning','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.1.width','100'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.fieldUid','\"7630d272-f37b-4501-b321-91b966f23598\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.label','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.required','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.tip','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.warning','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.2.width','100'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.fieldUid','\"b8fb40e0-291e-4c47-83d9-2c4017fb6e28\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.label','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.required','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.tip','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.warning','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.elements.3.width','100'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.name','\"Content\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fieldLayouts.5f56b260-cfb3-410d-9d48-d521d2abe570.tabs.0.sortOrder','1'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.contentColumnType','\"text\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.fieldGroup','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.handle','\"sectionTitle\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.instructions','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.name','\"Section Title\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.searchable','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.byteLimit','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.charLimit','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.code','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.columnType','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.initialRows','\"4\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.multiline','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.placeholder','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.settings.uiMode','\"normal\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.translationKeyFormat','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.translationMethod','\"none\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.3f29eae5-c9a0-4743-adb0-d6dc2196d5be.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.contentColumnType','\"text\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.fieldGroup','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.handle','\"cardName\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.instructions','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.name','\"Card Name\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.searchable','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.byteLimit','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.charLimit','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.code','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.columnType','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.initialRows','\"4\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.multiline','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.placeholder','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.settings.uiMode','\"normal\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.translationKeyFormat','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.translationMethod','\"none\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.7630d272-f37b-4501-b321-91b966f23598.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.contentColumnType','\"text\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.fieldGroup','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.handle','\"cardDescription\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.instructions','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.name','\"Card Description\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.searchable','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.byteLimit','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.charLimit','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.code','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.columnType','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.initialRows','\"4\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.multiline','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.placeholder','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.settings.uiMode','\"normal\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.translationKeyFormat','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.translationMethod','\"none\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.b8fb40e0-291e-4c47-83d9-2c4017fb6e28.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.contentColumnType','\"string\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.fieldGroup','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.handle','\"image\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.instructions','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.name','\"Image\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.searchable','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.allowedKinds','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.allowSelfRelations','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.allowUploads','true'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.defaultUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.limit','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.localizeRelations','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.previewMode','\"full\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.restrictFiles','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.selectionLabel','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.showSiteMenu','true'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.showUnpermittedFiles','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.singleUploadLocationSource','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.source','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.sources.0','\"volume:0e21ada9-6821-44c5-bc22-69e56704adcb\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.targetSiteId','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.useSingleFolder','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.validateRelatedElements','false'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.settings.viewMode','\"list\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.translationKeyFormat','null'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.translationMethod','\"site\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.fields.bce818e2-ea07-486b-87a9-155ccf9f94cb.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.handle','\"sectionblock\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.name','\"sectionBlock\"'),('matrixBlockTypes.6920e130-53b8-4e22-af21-3578afde06b7.sortOrder','1'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.field','\"57a42f69-564f-4d11-b2e9-8285220eab31\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.fieldUid','\"b7e1da54-a49e-4209-b56a-becb90315f25\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.label','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.required','false'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.tip','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.warning','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.0.width','100'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.fieldUid','\"3dddc70c-404a-4dcf-bf22-f2d8fda2aa34\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.label','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.required','false'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.tip','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.warning','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.1.width','100'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.fieldUid','\"216a5716-d459-4f74-bc80-57e612e4bc9c\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.label','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.required','false'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.tip','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.warning','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.elements.2.width','100'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.name','\"Content\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fieldLayouts.9d58aae7-3c30-49e1-8aff-a5563dbc6b3a.tabs.0.sortOrder','1'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.contentColumnType','\"text\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.fieldGroup','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.handle','\"elementparagraph2\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.instructions','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.name','\"elementParagraph2\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.searchable','false'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.byteLimit','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.charLimit','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.code','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.columnType','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.initialRows','\"4\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.multiline','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.placeholder','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.settings.uiMode','\"normal\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.translationKeyFormat','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.translationMethod','\"none\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.216a5716-d459-4f74-bc80-57e612e4bc9c.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.contentColumnType','\"text\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.fieldGroup','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.handle','\"elementparagraph1\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.instructions','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.name','\"elementParagraph1\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.searchable','false'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.byteLimit','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.charLimit','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.code','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.columnType','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.initialRows','\"4\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.multiline','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.placeholder','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.settings.uiMode','\"normal\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.translationKeyFormat','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.translationMethod','\"none\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.3dddc70c-404a-4dcf-bf22-f2d8fda2aa34.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.contentColumnType','\"text\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.fieldGroup','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.handle','\"elementtitle\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.instructions','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.name','\"elementTitle\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.searchable','false'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.byteLimit','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.charLimit','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.code','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.columnType','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.initialRows','\"4\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.multiline','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.placeholder','\"\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.settings.uiMode','\"normal\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.translationKeyFormat','null'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.translationMethod','\"none\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.fields.b7e1da54-a49e-4209-b56a-becb90315f25.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.handle','\"element\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.name','\"element\"'),('matrixBlockTypes.c09dc7f2-c2bb-43d0-8046-f0b869923634.sortOrder','1'),('routes.56602306-85c7-47d5-a2c6-8f6f9287a823.siteUid','null'),('routes.56602306-85c7-47d5-a2c6-8f6f9287a823.sortOrder','1'),('routes.56602306-85c7-47d5-a2c6-8f6f9287a823.template','\"includes/shop/shopItem\"'),('routes.56602306-85c7-47d5-a2c6-8f6f9287a823.uriParts.0','\"api/shopitems\"'),('routes.56602306-85c7-47d5-a2c6-8f6f9287a823.uriPattern','\"api/shopitems\"'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.enableVersioning','true'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.handle','\"shopItem\"'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.name','\"Shop Item\"'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.propagationMethod','\"all\"'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.enabledByDefault','true'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.hasUrls','false'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.template','null'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.uriFormat','null'),('sections.1998bdee-5e97-4233-863b-2a8db2a9239c.type','\"channel\"'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.enableVersioning','false'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.handle','\"shop\"'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.name','\"Shop\"'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.propagationMethod','\"all\"'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.enabledByDefault','true'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.hasUrls','true'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.template','\"pages/shop\"'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.uriFormat','\"shop\"'),('sections.43560bcb-1bcd-4cf8-bb33-49fe9b287cc4.type','\"single\"'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.enableVersioning','false'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.handle','\"home\"'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.name','\"Home\"'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.propagationMethod','\"all\"'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.enabledByDefault','true'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.hasUrls','true'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.template','\"index\"'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.siteSettings.f6550cfc-77a6-4397-8d0e-2c7b512698a3.uriFormat','\"__home__\"'),('sections.d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c.type','\"single\"'),('siteGroups.7e4462d2-f815-46e1-af99-96a372132d52.name','\"happylittledinosaurs\"'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.handle','\"default\"'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.hasUrls','true'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.language','\"en-US\"'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.name','\"happylittledinosaurs\"'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.primary','true'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.siteGroup','\"7e4462d2-f815-46e1-af99-96a372132d52\"'),('sites.f6550cfc-77a6-4397-8d0e-2c7b512698a3.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"happylittledinosaurs\"'),('system.schemaVersion','\"3.5.13\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.autocapitalize','true'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.autocomplete','false'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.autocorrect','true'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.class','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.disabled','false'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.id','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.instructions','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.label','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.max','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.min','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.name','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.orientation','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.placeholder','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.readonly','false'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.requirable','false'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.size','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.step','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.tip','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.title','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.warning','null'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.elements.0.width','100'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.name','\"Content\"'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.fieldLayouts.d7c986d8-017c-416e-95d5-3209cbffa8cb.tabs.0.sortOrder','1'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.handle','\"uploads\"'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.hasUrls','true'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.name','\"Uploads\"'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.settings.path','\"@webroot/assets/uploads\"'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.sortOrder','1'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.type','\"craft\\\\volumes\\\\Local\"'),('volumes.0e21ada9-6821-44c5-bc22-69e56704adcb.url','\"@web/assets/uploads\"'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.autocapitalize','true'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.autocomplete','false'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.autocorrect','true'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.class','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.disabled','false'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.id','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.instructions','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.label','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.max','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.min','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.name','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.orientation','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.placeholder','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.readonly','false'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.requirable','false'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.size','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.step','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.tip','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.title','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.warning','null'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.elements.0.width','100'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.name','\"Content\"'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.fieldLayouts.2f66ebad-f69b-4448-99db-4997826f87f2.tabs.0.sortOrder','1'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.handle','\"shop\"'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.hasUrls','true'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.name','\"Shop\"'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.settings.path','\"@webroot/assets/uploads/shop\"'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.sortOrder','2'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.type','\"craft\\\\volumes\\\\Local\"'),('volumes.77b802d6-cf66-4f9e-934a-0a6a18fc45ee.url','\"@web/assets/uploads/shop\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (4,1,2,NULL,4,1,'2020-12-19 22:20:31','2020-12-19 22:20:31','5e7aea6f-e404-4874-82e7-2f2850ccfd0e'),(5,3,37,NULL,17,1,'2020-12-20 20:45:56','2020-12-20 20:45:56','b5b702c8-be57-4866-977b-0e0888c04a8c'),(6,8,38,NULL,10,1,'2020-12-20 21:07:14','2020-12-20 21:07:14','9c28601a-1583-4a6a-8df1-87ae258d58f0'),(7,24,2,NULL,14,1,'2020-12-21 15:11:48','2020-12-21 15:11:48','17e47fd5-bfdb-4e60-a4ae-9fea042737d4'),(8,23,41,NULL,11,1,'2020-12-21 15:11:48','2020-12-21 15:11:48','c40c4a84-f66a-485a-94c3-d1dcfc7caf01'),(9,23,42,NULL,12,1,'2020-12-21 15:11:48','2020-12-21 15:11:48','758de00a-31e9-4242-9404-259d09ab0c7e'),(10,30,2,NULL,13,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','9c9ba867-8d3f-4d86-aa07-57fb5a777fa4'),(11,29,43,NULL,8,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','353d0ca1-b1bf-401c-b902-bcb36349428b'),(13,29,45,NULL,9,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','b9010904-fb91-42a1-9238-44c243d50ca9'),(14,29,46,NULL,15,1,'2020-12-21 15:13:09','2020-12-21 15:13:09','f4c09104-4c61-46be-b816-807c58a0ee7e'),(15,29,44,NULL,16,1,'2020-12-21 15:58:14','2020-12-21 15:58:14','71910236-ab81-47f8-94e6-9e0288d8b4cd'),(16,37,48,NULL,6,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','4b0c3b94-7749-415e-b1f4-bcd949edcae4'),(17,37,49,NULL,5,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','22e15453-2613-4440-a18a-de96e99b23de'),(18,37,50,NULL,7,1,'2020-12-21 16:07:59','2020-12-21 16:07:59','7f16471c-aa4c-4b76-97b7-884e0ce0f2de'),(19,45,3,NULL,27,1,'2020-12-21 19:35:21','2020-12-21 19:35:21','7211693f-bdcd-437c-ab7d-a43f24bdd20e'),(21,50,52,NULL,21,1,'2020-12-21 19:50:19','2020-12-21 19:50:19','2c9b6218-8965-453f-84b9-118ec78d0353'),(22,50,53,NULL,21,1,'2020-12-21 19:50:19','2020-12-21 19:50:19','0acf4f52-319d-4237-881d-353f9a74e0b0'),(23,50,54,NULL,21,1,'2020-12-21 19:50:22','2020-12-21 19:50:22','d0720bd9-c349-4ee7-bcd6-45144e453a03'),(25,50,56,NULL,23,1,'2020-12-21 19:50:54','2020-12-21 19:50:54','1f858af2-6efb-4e8b-92fb-2f89fc17b48f'),(26,50,57,NULL,23,1,'2020-12-21 19:50:54','2020-12-21 19:50:54','b9798864-7832-47ee-bf8f-37395ec8443c'),(28,50,59,NULL,26,1,'2020-12-21 19:51:22','2020-12-21 19:51:22','3cb93fbc-46b7-41a2-a315-e2efeb28d630'),(29,50,60,NULL,26,1,'2020-12-21 19:51:22','2020-12-21 19:51:22','fb02e0b6-ad55-49bd-b396-b47ee9e66542'),(31,50,62,NULL,24,1,'2020-12-21 19:51:44','2020-12-21 19:51:44','605560e1-8203-418c-8819-38ea53f47788'),(32,50,63,NULL,24,1,'2020-12-21 19:51:44','2020-12-21 19:51:44','9593d3f2-ab28-4d45-b503-9053fb9031d3'),(34,50,65,NULL,22,1,'2020-12-21 19:52:06','2020-12-21 19:52:06','134e5dc6-bc01-48cd-bdb4-8455f276fd25'),(35,50,66,NULL,22,1,'2020-12-21 19:52:06','2020-12-21 19:52:06','9244d2a7-fb4a-433c-a14e-fda589277aee'),(37,50,68,NULL,20,1,'2020-12-21 19:52:25','2020-12-21 19:52:25','8d3d5073-1c93-4e8e-94e2-26226f537606'),(38,50,69,NULL,20,1,'2020-12-21 19:52:25','2020-12-21 19:52:25','366922cf-0bc8-41ca-b403-5c7c9c7c765a'),(40,50,71,NULL,25,1,'2020-12-21 19:52:47','2020-12-21 19:52:47','9a6a4589-9627-42c3-a96a-a1530e10ce60'),(41,50,72,NULL,25,1,'2020-12-21 19:52:48','2020-12-21 19:52:48','d1b6ea98-7569-414d-a09c-0a0bf9ce0aeb'),(43,50,74,NULL,19,1,'2020-12-21 19:53:06','2020-12-21 19:53:06','073ffe35-1020-408a-8909-9c17ad4ea082'),(44,50,75,NULL,19,1,'2020-12-21 19:53:06','2020-12-21 19:53:06','07b74943-294e-4991-a89d-0d5ed2566519'),(46,50,77,NULL,18,1,'2020-12-21 19:53:22','2020-12-21 19:53:22','8876e6da-2a3f-478d-84f6-5483d874287d'),(47,50,78,NULL,18,1,'2020-12-21 19:53:22','2020-12-21 19:53:22','5319efc0-00ee-452e-9fa9-b24cb93a2b83');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('10ef45b8','@lib/velocity'),('15bce4d4','@craft/web/assets/dashboard/dist'),('160b2c5','@bower/jquery/dist'),('1646efdf','@lib/jquery.payment'),('1beeb74a','@bower/jquery/dist'),('241fb298','@craft/web/assets/dashboard/dist'),('2a3f0a28','@craft/web/assets/deprecationerrors/dist'),('2ef01930','@lib/element-resize-detector'),('347e1cbf','@lib/element-resize-detector'),('351a26d4','@craft/web/assets/editentry/dist'),('44c8db92','@lib/jquery-ui'),('4e1f9bdb','@lib/axios'),('53eaff5b','@craft/web/assets/craftsupport/dist'),('54919e54','@lib/axios'),('5bec4896','@craft/web/assets/login/dist'),('5d5c9453','@craft/web/assets/feed/dist'),('5e46de1d','@lib/jquery-ui'),('6249a917','@craft/web/assets/craftsupport/dist'),('6366076','@craft/web/assets/routes/dist'),('63f438ae','@lib/vue'),('6a4f1eda','@craft/web/assets/login/dist'),('6cffc21f','@craft/web/assets/feed/dist'),('715b39e0','@craft/web/assets/plugins/dist'),('778265f2','@craft/web/assets/editsection/dist'),('830fb524','@lib/iframe-resizer'),('836fae13','@lib/d3'),('8569be45','@craft/web/assets/utilities/dist'),('8a6eb280','@lib/jquery-touch-events'),('8dca8e42','@lib/picturefill'),('8fac8a33','@lib/fileupload'),('90e0b70f','@lib/jquery-touch-events'),('9266bd86','@lib/prismjs'),('94f2f20a','@craft/web/assets/fields/dist'),('95228fbc','@lib/fileupload'),('97448bcd','@lib/picturefill'),('9981b0ab','@lib/iframe-resizer'),('99e1ab9c','@lib/d3'),('9ddc0adf','@craft/web/assets/admintable/dist'),('a5946dab','@lib/fabric'),('a614037','@lib/velocity'),('a7607b8','@craft/web/assets/matrixsettings/dist'),('aa5cbc1a','@lib/garnishjs'),('b0d2b995','@lib/garnishjs'),('b4cae809','@craft/web/assets/utilities/dist'),('bc113c70','@craft/web/assets/matrix/dist'),('bce0407f','@craft/web/assets/tablesettings/dist'),('bf1a6824','@lib/fabric'),('c01704da','@lib/datepicker-i18n'),('c33aa649','@lib/selectize'),('c5e55f1e','@craft/web/assets/updateswidget/dist'),('c956e2c3','@lib/xregexp'),('cafc4b3c','@craft/web/assets/recententries/dist'),('cc8ea50','@lib/jquery.payment'),('d2e7dd59','@craft/web/assets/installer/dist'),('d3d8e74c','@lib/xregexp'),('d9b4a3c6','@lib/selectize'),('da990155','@lib/datepicker-i18n'),('df9b868f','@craft/web/assets/cp/dist'),('e3448b15','@craft/web/assets/installer/dist'),('e743e0be','@craft/web/assets/pluginstore/dist'),('ee38d0c3','@craft/web/assets/cp/dist'),('f4460952','@craft/web/assets/updateswidget/dist'),('f6a9bab6','@lib/timepicker'),('f9052a0b','@craft/web/assets/fieldsettings/dist'),('fb5f1d70','@craft/web/assets/recententries/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,29,1,1,NULL),(2,32,1,1,NULL),(3,35,1,1,NULL),(4,52,1,1,NULL),(5,52,1,2,''),(6,56,1,1,NULL),(7,59,1,1,NULL),(8,62,1,1,NULL),(9,65,1,1,NULL),(10,68,1,1,NULL),(11,71,1,1,NULL),(12,74,1,1,NULL),(13,77,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' jochen panjaer telenet be '),(1,'slug',0,1,''),(2,'title',0,1,' happy little dinosaurs '),(3,'slug',0,1,' shop '),(2,'slug',0,1,' home '),(4,'filename',0,1,' hld newbanner v1 jpg '),(4,'extension',0,1,' jpg '),(4,'kind',0,1,' image '),(4,'slug',0,1,''),(4,'title',0,1,' hld newbanner v1 '),(5,'filename',0,1,' other game box 1000x1000 lu jpg '),(5,'extension',0,1,' jpg '),(5,'kind',0,1,' image '),(5,'slug',0,1,''),(5,'title',0,1,' other game box 1000x1000 lu '),(6,'filename',0,1,' other game box 1000x1000 uu jpg '),(6,'extension',0,1,' jpg '),(6,'kind',0,1,' image '),(6,'slug',0,1,''),(6,'title',0,1,' other game box 1000x1000 uu '),(7,'filename',0,1,' other game box 1000x1000 hts jpg '),(7,'extension',0,1,' jpg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' other game box 1000x1000 hts '),(8,'filename',0,1,' take a closer look cards disaster v1 jpg '),(8,'extension',0,1,' jpg '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' take a closer look cards disaster v1 '),(9,'filename',0,1,' take a closer look cards instant jpg '),(9,'extension',0,1,' jpg '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'title',0,1,' take a closer look cards instant '),(10,'filename',0,1,' hld exclusive box png '),(10,'extension',0,1,' png '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' hld exclusive box '),(11,'filename',0,1,' hld whats in the box base v1 png '),(11,'extension',0,1,' png '),(11,'kind',0,1,' image '),(11,'slug',0,1,''),(11,'title',0,1,' hld whats in the box base v1 '),(12,'filename',0,1,' hld whats in the box expansion v1 png '),(12,'extension',0,1,' png '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' hld whats in the box expansion v1 '),(13,'filename',0,1,' project timeline png '),(13,'extension',0,1,' png '),(13,'kind',0,1,' image '),(13,'slug',0,1,''),(13,'title',0,1,' project timeline '),(14,'filename',0,1,' spacer png '),(14,'extension',0,1,' png '),(14,'kind',0,1,' image '),(14,'slug',0,1,''),(14,'title',0,1,' spacer '),(15,'filename',0,1,' take a closer look meeples png '),(15,'extension',0,1,' png '),(15,'kind',0,1,' image '),(15,'slug',0,1,''),(15,'title',0,1,' take a closer look meeples '),(16,'filename',0,1,' take a closer look point png '),(16,'extension',0,1,' png '),(16,'kind',0,1,' image '),(16,'slug',0,1,''),(16,'title',0,1,' take a closer look point '),(17,'filename',0,1,' unstablegames logo new svg '),(17,'extension',0,1,' svg '),(17,'kind',0,1,' image '),(17,'slug',0,1,''),(17,'title',0,1,' unstablegames logo new '),(18,'filename',0,1,' add ons bronto socks jpg '),(18,'extension',0,1,' jpg '),(18,'kind',0,1,' image '),(18,'slug',0,1,''),(18,'title',0,1,' add ons bronto socks '),(19,'filename',0,1,' add ons hld socks jpg '),(19,'extension',0,1,' jpg '),(19,'kind',0,1,' image '),(19,'slug',0,1,''),(19,'title',0,1,' add ons hld socks '),(20,'filename',0,1,' add ons bad day bronot shirt jpg '),(20,'extension',0,1,' jpg '),(20,'kind',0,1,' image '),(20,'slug',0,1,''),(20,'title',0,1,' add ons bad day bronot shirt '),(21,'filename',0,1,' add ons base game jpg '),(21,'extension',0,1,' jpg '),(21,'kind',0,1,' image '),(21,'slug',0,1,''),(21,'title',0,1,' add ons base game '),(22,'filename',0,1,' add ons crushed dino shirt jpg '),(22,'extension',0,1,' jpg '),(22,'kind',0,1,' image '),(22,'slug',0,1,''),(22,'title',0,1,' add ons crushed dino shirt '),(23,'filename',0,1,' add ons expansion jpg '),(23,'extension',0,1,' jpg '),(23,'kind',0,1,' image '),(23,'slug',0,1,''),(23,'title',0,1,' add ons expansion '),(24,'filename',0,1,' add ons nervous rex shirt jpg '),(24,'extension',0,1,' jpg '),(24,'kind',0,1,' image '),(24,'slug',0,1,''),(24,'title',0,1,' add ons nervous rex shirt '),(25,'filename',0,1,' add ons stego plushie jpg '),(25,'extension',0,1,' jpg '),(25,'kind',0,1,' image '),(25,'slug',0,1,''),(25,'title',0,1,' add ons stego plushie '),(26,'filename',0,1,' add ons stego shirt jpg '),(26,'extension',0,1,' jpg '),(26,'kind',0,1,' image '),(26,'slug',0,1,''),(26,'title',0,1,' add ons stego shirt '),(27,'filename',0,1,' featured jpg '),(27,'extension',0,1,' jpg '),(27,'kind',0,1,' image '),(27,'slug',0,1,''),(27,'title',0,1,' featured '),(29,'slug',0,1,' test1 '),(29,'title',0,1,' test1 '),(32,'slug',0,1,' test2 '),(32,'title',0,1,' test2 '),(35,'slug',0,1,' laatste test '),(35,'title',0,1,' laatste test '),(37,'slug',0,1,''),(38,'slug',0,1,''),(39,'slug',0,1,''),(40,'slug',0,1,''),(41,'slug',0,1,''),(42,'slug',0,1,''),(43,'slug',0,1,''),(44,'slug',0,1,''),(45,'slug',0,1,''),(46,'slug',0,1,''),(47,'slug',0,1,''),(48,'slug',0,1,''),(49,'slug',0,1,''),(50,'slug',0,1,''),(3,'title',0,1,' shop '),(52,'title',0,1,' happy little dinosaurs base game '),(52,'slug',0,1,' happy little dinosaurs base game '),(56,'slug',0,1,' happy little dinosaurs 5 6 player expansion '),(56,'title',0,1,' happy little dinosaurs 5 6 player expansion '),(59,'slug',0,1,' smile its almost over t shirt '),(59,'title',0,1,' smile its almost over t shirt '),(62,'slug',0,1,' nervous rex t shirt '),(62,'title',0,1,' nervous rex t shirt '),(65,'slug',0,1,' crushed dino t shirt '),(65,'title',0,1,' crushed dino t shirt '),(68,'slug',0,1,' bad day bronto t shirt '),(68,'title',0,1,' bad day bronto t shirt '),(71,'slug',0,1,' reversible stego plushi '),(71,'title',0,1,' reversible stego plushi '),(74,'slug',0,1,' happy little dinosaur socks '),(74,'title',0,1,' happy little dinosaur socks '),(77,'slug',0,1,' bad day bronto socks '),(77,'title',0,1,' bad day bronto socks ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',0,'all',NULL,'2020-12-19 22:02:59','2020-12-19 22:02:59',NULL,'d10f9ca7-7a6d-41fb-8d7a-50a8f1f93c4c'),(2,NULL,'Shop','shop','single',0,'all',NULL,'2020-12-19 22:03:21','2020-12-19 22:03:21',NULL,'43560bcb-1bcd-4cf8-bb33-49fe9b287cc4'),(3,NULL,'Shop Item','shopItem','channel',1,'all',NULL,'2020-12-20 19:15:50','2020-12-20 19:15:50',NULL,'1998bdee-5e97-4233-863b-2a8db2a9239c');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index',1,'2020-12-19 22:02:59','2020-12-19 22:02:59','31592e3b-ceba-4fc9-a761-8c1e3a9df9db'),(2,2,1,1,'shop','pages/shop',1,'2020-12-19 22:03:21','2020-12-19 22:03:21','fe62cc70-be1d-439d-bdc3-3a83d2e19137'),(3,3,1,0,NULL,NULL,1,'2020-12-20 19:15:50','2020-12-20 19:15:50','2554b640-0259-4aae-945f-87bab437afcb');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'oQ_TeIsYehfAkik93SJiGoh9s0uwRM2UXmHdomCv5XTMySFSoKKjjqVPouVe89weqr5KZbwckqTX7-hfzMuA1Vf5qfT_SaF-AHfO','2020-12-19 12:23:07','2020-12-19 13:02:02','97dc5058-2aec-46e8-a8ae-1571ce9eb347'),(2,1,'bnwVKUAuVi_lBPQdWvwXA5Yb-DCjS3lALzLNUdAr5xYlkv8TIG8fEJYqGpOz79d6qbF6BTpGyeK9YBTznhufXzhbYHofh2xwTH2c','2020-12-19 22:02:40','2020-12-19 22:23:56','f99fc8fd-0f8e-440f-a036-bb5d71c1c9bc'),(3,1,'P85HBfsSsLwPSgqlE3yUERyDTe-SJ8Imo_v6r-A8i2ItFd6dG23LJuXCC9iVg3k1IPhYVG2_rfwtRtxNRG9YO2wREXoDcKM9-X6M','2020-12-20 19:13:19','2020-12-20 21:18:42','d91e49db-a9dc-493e-af2f-5f30f4b000e9'),(5,1,'9y4vgEwyDFpIyecGMyadzSuzfORxrUGN-zFh4k2iacr5gEc5TQQijV61QQLeE3ouCqusK6TZtjMPE7d1ydP5Mk7zOT_RqFTuCFiv','2020-12-21 14:57:25','2020-12-21 16:11:06','f50d3870-24cb-4562-a89a-134350b738f0'),(6,1,'Nu3PXHZ6044wcBrpzA71p2BpY-7iRuJGMAdBkm25KnnML7CPxlg0pw7n_wMASYTFoKqR3zgC-2cYlpBoAlmTjh3HbPBMFwbebSDT','2020-12-21 18:12:12','2020-12-21 20:57:34','38ee867b-7bf7-485b-9676-2a7418ad28cf');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'happylittledinosaurs','2020-12-19 12:20:24','2020-12-19 12:20:24',NULL,'7e4462d2-f815-46e1-af99-96a372132d52');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'happylittledinosaurs','default','en-US',1,'$PRIMARY_SITE_URL',1,'2020-12-19 12:20:24','2020-12-19 12:20:24',NULL,'f6550cfc-77a6-4397-8d0e-2c7b512698a3');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usergroups_handle_idx` (`handle`),
  KEY `usergroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,'jochen.panjaer@telenet.be','$2y$13$i7O3uZhk1Nno/99lT.g0aeSDcNP.wLXF/mQ0rQDesPKnixm.03TBC',1,0,0,0,'2020-12-21 18:12:13',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2020-12-19 12:20:24','2020-12-19 12:20:24','2020-12-21 18:12:13','9f50efb8-5946-4688-b23d-e0cab1923234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Uploads','','2020-12-19 22:11:26','2020-12-19 22:11:26','a98a5297-b027-4ec8-97f9-cd5e4b1cc181'),(2,NULL,NULL,'Temporary source',NULL,'2020-12-19 22:11:34','2020-12-19 22:11:34','fec3319a-4ac4-4a16-b4fe-e0fb82269315'),(3,2,NULL,'user_1','user_1/','2020-12-19 22:11:34','2020-12-19 22:11:34','ecd0661f-d65e-49f5-a7f0-93fa69ea8373'),(4,NULL,2,'Shop','','2020-12-19 22:14:28','2020-12-19 22:14:28','325df302-6fbb-43e0-8493-42fcf9c2893a');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,3,'Uploads','uploads','craft\\volumes\\Local',1,'@web/assets/uploads','{\"path\":\"@webroot/assets/uploads\"}',1,'2020-12-19 22:11:26','2020-12-19 22:19:11',NULL,'0e21ada9-6821-44c5-bc22-69e56704adcb'),(2,4,'Shop','shop','craft\\volumes\\Local',1,'@web/assets/uploads/shop','{\"path\":\"@webroot/assets/uploads/shop\"}',2,'2020-12-19 22:14:28','2020-12-19 22:19:19',NULL,'77b802d6-cf66-4f9e-934a-0a6a18fc45ee');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2020-12-19 12:23:14','2020-12-19 12:23:14','8cbc673d-a583-4fc6-be20-ccd98fe716cc'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-12-19 12:23:14','2020-12-19 12:23:14','f15b45ff-e033-4f50-9e6a-f820814101bd'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-12-19 12:23:14','2020-12-19 12:23:14','664b42ea-52b4-43a3-b482-9cc83c283c2a'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-12-19 12:23:14','2020-12-19 12:23:14','2b5caa0d-434e-467b-8228-d2f064709b19');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-21 22:00:42
