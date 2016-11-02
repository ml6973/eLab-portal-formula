-- MySQL dump 10.16  Distrib 10.1.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: eLab_ss
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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

DROP DATABASE if EXISTS eLab_ss;
CREATE DATABASE eLab_ss;
USE eLab_ss;

--
-- Table structure for table `oci_access_collection_membership`
--

DROP TABLE IF EXISTS `oci_access_collection_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_access_collection_membership` (
  `user_guid` int(11) NOT NULL,
  `access_collection_id` int(11) NOT NULL,
  PRIMARY KEY (`user_guid`,`access_collection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_access_collection_membership`
--

LOCK TABLES `oci_access_collection_membership` WRITE;
/*!40000 ALTER TABLE `oci_access_collection_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_access_collection_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_access_collections`
--

DROP TABLE IF EXISTS `oci_access_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_access_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `site_guid` (`site_guid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_access_collections`
--

LOCK TABLES `oci_access_collections` WRITE;
/*!40000 ALTER TABLE `oci_access_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_access_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_annotations`
--

DROP TABLE IF EXISTS `oci_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name_id` (`name_id`),
  KEY `value_id` (`value_id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_annotations`
--

LOCK TABLES `oci_annotations` WRITE;
/*!40000 ALTER TABLE `oci_annotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_annotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_api_users`
--

DROP TABLE IF EXISTS `oci_api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_guid` bigint(20) unsigned DEFAULT NULL,
  `api_key` varchar(40) DEFAULT NULL,
  `secret` varchar(40) NOT NULL,
  `active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_api_users`
--

LOCK TABLES `oci_api_users` WRITE;
/*!40000 ALTER TABLE `oci_api_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_api_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_config`
--

DROP TABLE IF EXISTS `oci_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_config` (
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `site_guid` int(11) NOT NULL,
  PRIMARY KEY (`name`,`site_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_config`
--

LOCK TABLES `oci_config` WRITE;
/*!40000 ALTER TABLE `oci_config` DISABLE KEYS */;
INSERT INTO `oci_config` VALUES ('view','s:7:\"default\";',1),('language','s:2:\"en\";',1),('default_access','s:1:\"0\";',1),('allow_registration','b:1;',1),('walled_garden','b:0;',1),('allow_user_default_access','s:0:\"\";',1),('default_limit','i:10;',1),('search_ft_min_word_len','s:1:\"4\";',1),('search_ft_max_word_len','s:2:\"84\";',1);
/*!40000 ALTER TABLE `oci_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_datalists`
--

DROP TABLE IF EXISTS `oci_datalists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_datalists` (
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_datalists`
--

LOCK TABLES `oci_datalists` WRITE;
/*!40000 ALTER TABLE `oci_datalists` DISABLE KEYS */;
INSERT INTO `oci_datalists` VALUES ('installed','1473791407'),('dataroot','{{ data_root }}'),('default_site','1'),('version','2015062900'),('simplecache_enabled','1'),('system_cache_enabled','1'),('simplecache_lastupdate','1473791407'),('processed_upgrades','a:1:{i:0;s:56:\"2015062900-1.11.2-discussion_plugin-e28c7afa4f5f24ec.php\";}'),('admin_registered','1'),('path','{{ html_path }}'),('__site_secret__','zS60tZPPWgDoro9aDWIjMYJcTMqM1WZb');
/*!40000 ALTER TABLE `oci_datalists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_entities`
--

DROP TABLE IF EXISTS `oci_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_entities` (
  `guid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` int(11) DEFAULT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL,
  `container_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) NOT NULL,
  `last_action` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`guid`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `owner_guid` (`owner_guid`),
  KEY `site_guid` (`site_guid`),
  KEY `container_guid` (`container_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `time_updated` (`time_updated`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_entities`
--

LOCK TABLES `oci_entities` WRITE;
/*!40000 ALTER TABLE `oci_entities` DISABLE KEYS */;
INSERT INTO `oci_entities` VALUES (1,'site',0,0,1,0,2,1473791407,1473791407,1473791407,'yes'),(2,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(3,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(4,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(5,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(6,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(7,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(8,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(9,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(10,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(11,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(12,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(13,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(14,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(15,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(16,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(17,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(18,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(19,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(20,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(21,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(22,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(23,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(24,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(25,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(26,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(27,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(28,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(29,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(30,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(31,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(32,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(33,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(34,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(35,'object',1,1,1,1,2,1473791407,1473791407,1473791407,'yes'),(36,'user',0,0,1,0,2,1473791589,1473791589,1473791589,'yes'),(37,'object',3,36,1,36,0,1473791589,1473791589,1473791589,'yes'),(38,'object',3,36,1,36,0,1473791589,1473791589,1473791589,'yes'),(39,'object',3,36,1,36,0,1473791589,1473791589,1473791589,'yes'),(40,'object',3,36,1,36,0,1473791589,1473791589,1473791589,'yes'),(41,'object',3,36,1,36,0,1473791589,1473791589,1473791589,'yes');
/*!40000 ALTER TABLE `oci_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_entity_relationships`
--

DROP TABLE IF EXISTS `oci_entity_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_entity_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid_one` bigint(20) unsigned NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `guid_two` bigint(20) unsigned NOT NULL,
  `time_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_one` (`guid_one`,`relationship`,`guid_two`),
  KEY `relationship` (`relationship`),
  KEY `guid_two` (`guid_two`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_entity_relationships`
--

LOCK TABLES `oci_entity_relationships` WRITE;
/*!40000 ALTER TABLE `oci_entity_relationships` DISABLE KEYS */;
INSERT INTO `oci_entity_relationships` VALUES (1,2,'active_plugin',1,1473791407),(2,3,'active_plugin',1,1473791407),(3,4,'active_plugin',1,1473791407),(4,5,'active_plugin',1,1473791407),(5,10,'active_plugin',1,1473791407),(6,13,'active_plugin',1,1473791407),(7,14,'active_plugin',1,1473791407),(8,15,'active_plugin',1,1473791407),(9,16,'active_plugin',1,1473791407),(10,17,'active_plugin',1,1473791407),(11,19,'active_plugin',1,1473791407),(12,20,'active_plugin',1,1473791407),(13,21,'active_plugin',1,1473791407),(14,22,'active_plugin',1,1473791407),(15,23,'active_plugin',1,1473791407),(16,24,'active_plugin',1,1473791407),(17,25,'active_plugin',1,1473791407),(18,26,'active_plugin',1,1473791407),(19,27,'active_plugin',1,1473791407),(20,28,'active_plugin',1,1473791407),(21,29,'active_plugin',1,1473791407),(22,32,'active_plugin',1,1473791407),(23,34,'active_plugin',1,1473791407),(24,36,'member_of_site',1,1473791589);
/*!40000 ALTER TABLE `oci_entity_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_entity_subtypes`
--

DROP TABLE IF EXISTS `oci_entity_subtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_entity_subtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`subtype`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_entity_subtypes`
--

LOCK TABLES `oci_entity_subtypes` WRITE;
/*!40000 ALTER TABLE `oci_entity_subtypes` DISABLE KEYS */;
INSERT INTO `oci_entity_subtypes` VALUES (1,'object','plugin','ElggPlugin'),(2,'object','file','ElggFile'),(3,'object','widget','ElggWidget'),(4,'object','comment','ElggComment'),(5,'object','elgg_upgrade','ElggUpgrade'),(6,'object','blog','ElggBlog'),(7,'object','discussion_reply','ElggDiscussionReply'),(8,'object','thewire','ElggWire');
/*!40000 ALTER TABLE `oci_entity_subtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_geocode_cache`
--

DROP TABLE IF EXISTS `oci_geocode_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_geocode_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(128) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `long` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_geocode_cache`
--

LOCK TABLES `oci_geocode_cache` WRITE;
/*!40000 ALTER TABLE `oci_geocode_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_geocode_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_groups_entity`
--

DROP TABLE IF EXISTS `oci_groups_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_groups_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `name` (`name`(50)),
  KEY `description` (`description`(50)),
  FULLTEXT KEY `name_2` (`name`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_groups_entity`
--

LOCK TABLES `oci_groups_entity` WRITE;
/*!40000 ALTER TABLE `oci_groups_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_groups_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_hmac_cache`
--

DROP TABLE IF EXISTS `oci_hmac_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_hmac_cache` (
  `hmac` varchar(255) NOT NULL,
  `ts` int(11) NOT NULL,
  PRIMARY KEY (`hmac`),
  KEY `ts` (`ts`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_hmac_cache`
--

LOCK TABLES `oci_hmac_cache` WRITE;
/*!40000 ALTER TABLE `oci_hmac_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_hmac_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_metadata`
--

DROP TABLE IF EXISTS `oci_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name_id` (`name_id`),
  KEY `value_id` (`value_id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_metadata`
--

LOCK TABLES `oci_metadata` WRITE;
/*!40000 ALTER TABLE `oci_metadata` DISABLE KEYS */;
INSERT INTO `oci_metadata` VALUES (1,1,1,14,'text',36,2,1473791407,'yes'),(2,36,3,4,'text',36,2,1473791589,'yes'),(3,36,5,4,'text',0,2,1473791589,'yes'),(4,36,6,7,'text',0,2,1473791589,'yes');
/*!40000 ALTER TABLE `oci_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_metastrings`
--

DROP TABLE IF EXISTS `oci_metastrings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_metastrings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string` (`string`(50))
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_metastrings`
--

LOCK TABLES `oci_metastrings` WRITE;
/*!40000 ALTER TABLE `oci_metastrings` DISABLE KEYS */;
INSERT INTO `oci_metastrings` VALUES (1,'email'),(2,''),(3,'notification:method:email'),(4,'1'),(5,'validated'),(6,'validated_method'),(7,'admin_user'),(8,'toId'),(9,'36'),(10,'readYet'),(11,'0'),(14, '{{ smtp_username }}');
/*!40000 ALTER TABLE `oci_metastrings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_objects_entity`
--

DROP TABLE IF EXISTS `oci_objects_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_objects_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`guid`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_objects_entity`
--

LOCK TABLES `oci_objects_entity` WRITE;
/*!40000 ALTER TABLE `oci_objects_entity` DISABLE KEYS */;
INSERT INTO `oci_objects_entity` VALUES (2,'aalborg_theme',''),(3,'blog',''),(4,'bookmarks',''),(5,'ckeditor',''),(6,'custom_index',''),(7,'dashboard',''),(8,'developers',''),(9,'diagnostics',''),(10,'discussions',''),(11,'embed',''),(12,'externalpages',''),(13,'file',''),(14,'garbagecollector',''),(15,'groups',''),(16,'htmlawed',''),(17,'invitefriends',''),(18,'legacy_urls',''),(19,'likes',''),(20,'logbrowser',''),(21,'logrotate',''),(22,'members',''),(23,'messageboard',''),(24,'messages',''),(25,'notifications',''),(26,'pages',''),(27,'profile',''),(28,'reportedcontent',''),(29,'search',''),(30,'site_notifications',''),(31,'tagcloud',''),(32,'thewire',''),(33,'twitter_api',''),(34,'uservalidationbyemail',''),(35,'web_services',''),(37,'',''),(38,'',''),(39,'',''),(40,'',''),(41,'','');
/*!40000 ALTER TABLE `oci_objects_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_private_settings`
--

DROP TABLE IF EXISTS `oci_private_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_private_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_guid` (`entity_guid`,`name`),
  KEY `name` (`name`),
  KEY `value` (`value`(50))
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_private_settings`
--

LOCK TABLES `oci_private_settings` WRITE;
/*!40000 ALTER TABLE `oci_private_settings` DISABLE KEYS */;
INSERT INTO `oci_private_settings` VALUES (1,2,'elgg:internal:priority','34'),(2,3,'elgg:internal:priority','1'),(3,4,'elgg:internal:priority','2'),(4,5,'elgg:internal:priority','3'),(5,6,'elgg:internal:priority','4'),(6,7,'elgg:internal:priority','5'),(7,8,'elgg:internal:priority','6'),(8,9,'elgg:internal:priority','7'),(9,10,'elgg:internal:priority','8'),(10,11,'elgg:internal:priority','9'),(11,12,'elgg:internal:priority','10'),(12,13,'elgg:internal:priority','11'),(13,14,'elgg:internal:priority','12'),(14,15,'elgg:internal:priority','13'),(15,16,'elgg:internal:priority','14'),(16,17,'elgg:internal:priority','15'),(17,18,'elgg:internal:priority','16'),(18,19,'elgg:internal:priority','17'),(19,20,'elgg:internal:priority','18'),(20,21,'elgg:internal:priority','19'),(21,22,'elgg:internal:priority','20'),(22,23,'elgg:internal:priority','21'),(23,24,'elgg:internal:priority','22'),(24,25,'elgg:internal:priority','23'),(25,26,'elgg:internal:priority','24'),(26,27,'elgg:internal:priority','25'),(27,28,'elgg:internal:priority','26'),(28,29,'elgg:internal:priority','27'),(29,30,'elgg:internal:priority','28'),(30,31,'elgg:internal:priority','29'),(31,32,'elgg:internal:priority','30'),(32,33,'elgg:internal:priority','31'),(33,34,'elgg:internal:priority','32'),(34,35,'elgg:internal:priority','33'),(35,32,'limit','140'),(36,37,'handler','control_panel'),(37,37,'context','admin'),(38,37,'column','1'),(39,37,'order','0'),(40,38,'handler','admin_welcome'),(41,38,'context','admin'),(42,38,'order','10'),(43,38,'column','1'),(44,39,'handler','online_users'),(45,39,'context','admin'),(46,39,'column','2'),(47,39,'order','0'),(48,40,'handler','new_users'),(49,40,'context','admin'),(50,40,'order','10'),(51,40,'column','2'),(52,41,'handler','content_stats'),(53,41,'context','admin'),(54,41,'order','20'),(55,41,'column','2');
/*!40000 ALTER TABLE `oci_private_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_queue`
--

DROP TABLE IF EXISTS `oci_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `data` mediumblob NOT NULL,
  `timestamp` int(11) NOT NULL,
  `worker` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `retrieve` (`timestamp`,`worker`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_queue`
--

LOCK TABLES `oci_queue` WRITE;
/*!40000 ALTER TABLE `oci_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_river`
--

DROP TABLE IF EXISTS `oci_river`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_river` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL,
  `subtype` varchar(32) NOT NULL,
  `action_type` varchar(32) NOT NULL,
  `access_id` int(11) NOT NULL,
  `view` text NOT NULL,
  `subject_guid` int(11) NOT NULL,
  `object_guid` int(11) NOT NULL,
  `target_guid` int(11) NOT NULL,
  `annotation_id` int(11) NOT NULL,
  `posted` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `action_type` (`action_type`),
  KEY `access_id` (`access_id`),
  KEY `subject_guid` (`subject_guid`),
  KEY `object_guid` (`object_guid`),
  KEY `target_guid` (`target_guid`),
  KEY `annotation_id` (`annotation_id`),
  KEY `posted` (`posted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_river`
--

LOCK TABLES `oci_river` WRITE;
/*!40000 ALTER TABLE `oci_river` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_river` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_sites_entity`
--

DROP TABLE IF EXISTS `oci_sites_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_sites_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `url` (`url`),
  FULLTEXT KEY `name` (`name`,`description`,`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_sites_entity`
--

LOCK TABLES `oci_sites_entity` WRITE;
/*!40000 ALTER TABLE `oci_sites_entity` DISABLE KEYS */;
INSERT INTO `oci_sites_entity` VALUES (1,'eLab','','http://{{  grains['public_ip'] }}/sites/eLab-ss/');
/*!40000 ALTER TABLE `oci_sites_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_system_log`
--

DROP TABLE IF EXISTS `oci_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `object_class` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `object_subtype` varchar(50) NOT NULL,
  `event` varchar(50) NOT NULL,
  `performed_by_guid` int(11) NOT NULL,
  `owner_guid` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `time_created` int(11) NOT NULL,
  `ip_address` varchar(46) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_class` (`object_class`),
  KEY `object_type` (`object_type`),
  KEY `object_subtype` (`object_subtype`),
  KEY `event` (`event`),
  KEY `performed_by_guid` (`performed_by_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `river_key` (`object_type`,`object_subtype`,`event`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_system_log`
--

LOCK TABLES `oci_system_log` WRITE;
/*!40000 ALTER TABLE `oci_system_log` DISABLE KEYS */;
INSERT INTO `oci_system_log` VALUES (1,2,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(2,3,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(3,4,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(4,5,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(5,6,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(6,7,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(7,8,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(8,9,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(9,10,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(10,11,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(11,12,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(12,13,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(13,14,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(14,15,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(15,16,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(16,17,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(17,18,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(18,19,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(19,20,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(20,21,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(21,22,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(22,23,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(23,24,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(24,25,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(25,26,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(26,27,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(27,28,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(28,29,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(29,30,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(30,31,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(31,32,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(32,33,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(33,34,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(34,35,'ElggPlugin','object','plugin','create',0,1,2,'yes',1473791407,'129.115.3.100'),(35,1,'ElggRelationship','relationship','active_plugin','create',0,0,2,'yes',1473791407,'129.115.3.100'),(36,36,'ElggUser','user','','create',0,0,2,'yes',1473791589,'129.115.3.100'),(37,24,'ElggRelationship','relationship','member_of_site','create',0,0,2,'yes',1473791589,'129.115.3.100'),(38,2,'ElggMetadata','metadata','notification:method:email','create',0,36,2,'yes',1473791589,'129.115.3.100'),(39,36,'ElggUser','user','','make_admin',0,0,2,'yes',1473791589,'129.115.3.100'),(40,37,'ElggWidget','object','widget','create',0,36,2,'yes',1473791589,'129.115.3.100'),(41,38,'ElggWidget','object','widget','create',0,36,2,'yes',1473791589,'129.115.3.100'),(42,39,'ElggWidget','object','widget','create',0,36,2,'yes',1473791589,'129.115.3.100'),(43,40,'ElggWidget','object','widget','create',0,36,2,'yes',1473791589,'129.115.3.100'),(44,41,'ElggWidget','object','widget','create',0,36,2,'yes',1473791589,'129.115.3.100'),(45,3,'ElggMetadata','metadata','validated','create',0,0,2,'yes',1473791589,'129.115.3.100'),(46,4,'ElggMetadata','metadata','validated_method','create',0,0,2,'yes',1473791589,'129.115.3.100'),(47,36,'ElggUser','user','','login:before',0,0,2,'yes',1473791589,'129.115.3.100'),(48,36,'ElggUser','user','','login',36,0,2,'yes',1473791589,'129.115.3.100'),(49,36,'ElggUser','user','','login:after',36,0,2,'yes',1473791589,'129.115.3.100');
/*!40000 ALTER TABLE `oci_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_users_apisessions`
--

DROP TABLE IF EXISTS `oci_users_apisessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_users_apisessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL,
  `token` varchar(40) DEFAULT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_guid` (`user_guid`,`site_guid`),
  KEY `token` (`token`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_users_apisessions`
--

LOCK TABLES `oci_users_apisessions` WRITE;
/*!40000 ALTER TABLE `oci_users_apisessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_users_apisessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_users_entity`
--

DROP TABLE IF EXISTS `oci_users_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_users_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `username` varchar(128) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT 'Legacy password hashes',
  `salt` varchar(8) NOT NULL DEFAULT '' COMMENT 'Legacy password salts',
  `password_hash` varchar(255) NOT NULL DEFAULT '',
  `email` text NOT NULL,
  `language` varchar(6) NOT NULL DEFAULT '',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `admin` enum('yes','no') NOT NULL DEFAULT 'no',
  `last_action` int(11) NOT NULL DEFAULT '0',
  `prev_last_action` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `prev_last_login` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `email` (`email`(50)),
  KEY `last_action` (`last_action`),
  KEY `last_login` (`last_login`),
  KEY `admin` (`admin`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `name_2` (`name`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_users_entity`
--

LOCK TABLES `oci_users_entity` WRITE;
/*!40000 ALTER TABLE `oci_users_entity` DISABLE KEYS */;
INSERT INTO `oci_users_entity` VALUES (36,'Administrator','admin','','','$2y$10$zF81NhBXIkCO.HcXPIpLROBPtqv5wQ0BVPZZ8kzjJ1QyGUa4jn49W','admin@gdail.com','en','no','yes',1473791596,1473791596,1473791589,0);
/*!40000 ALTER TABLE `oci_users_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_users_remember_me_cookies`
--

DROP TABLE IF EXISTS `oci_users_remember_me_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_users_remember_me_cookies` (
  `code` varchar(32) NOT NULL,
  `guid` bigint(20) unsigned NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY (`code`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_users_remember_me_cookies`
--

LOCK TABLES `oci_users_remember_me_cookies` WRITE;
/*!40000 ALTER TABLE `oci_users_remember_me_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `oci_users_remember_me_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oci_users_sessions`
--

DROP TABLE IF EXISTS `oci_users_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oci_users_sessions` (
  `session` varchar(255) NOT NULL,
  `ts` int(11) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob,
  PRIMARY KEY (`session`),
  KEY `ts` (`ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oci_users_sessions`
--

LOCK TABLES `oci_users_sessions` WRITE;
/*!40000 ALTER TABLE `oci_users_sessions` DISABLE KEYS */;
INSERT INTO `oci_users_sessions` VALUES ('o397j39iajt8lsjbdm1i8b1cj1',1473791597,'_sf2_attributes|a:3:{s:4:\"guid\";i:36;s:3:\"msg\";a:0:{}s:14:\"__elgg_session\";s:22:\"yc-rsxy8ND_31qBi7KJJxc\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1473791596;s:1:\"c\";i:1473791589;s:1:\"l\";s:1:\"0\";}');
/*!40000 ALTER TABLE `oci_users_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-14 16:45:47

