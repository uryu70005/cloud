-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dbmain
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `xe_action_forward`
--

DROP TABLE IF EXISTS `xe_action_forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_action_forward` (
  `act` varchar(80) NOT NULL,
  `module` varchar(60) NOT NULL,
  `type` varchar(15) NOT NULL,
  UNIQUE KEY `idx_foward` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_action_forward`
--

LOCK TABLES `xe_action_forward` WRITE;
/*!40000 ALTER TABLE `xe_action_forward` DISABLE KEYS */;
INSERT INTO `xe_action_forward` VALUES ('rss','rss','view'),('atom','rss','view'),('IS','integration_search','view');
/*!40000 ALTER TABLE `xe_action_forward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_addons`
--

DROP TABLE IF EXISTS `xe_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_addons` (
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `is_fixed` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`addon`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_addons`
--

LOCK TABLES `xe_addons` WRITE;
/*!40000 ALTER TABLE `xe_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_addons_site`
--

DROP TABLE IF EXISTS `xe_addons_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_addons_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_addon_site` (`site_srl`,`addon`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_addons_site`
--

LOCK TABLES `xe_addons_site` WRITE;
/*!40000 ALTER TABLE `xe_addons_site` DISABLE KEYS */;
INSERT INTO `xe_addons_site` VALUES (0,'autolink','Y','N',NULL,'20230522031435'),(0,'member_communication','Y','N',NULL,'20230522031435'),(0,'member_extra_info','Y','N',NULL,'20230522031435'),(0,'resize_image','Y','N',NULL,'20230522031435');
/*!40000 ALTER TABLE `xe_addons_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_admin_favorite`
--

DROP TABLE IF EXISTS `xe_admin_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_admin_favorite` (
  `admin_favorite_srl` bigint(11) NOT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_favorite_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_admin_favorite`
--

LOCK TABLES `xe_admin_favorite` WRITE;
/*!40000 ALTER TABLE `xe_admin_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_admin_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_admin_log`
--

DROP TABLE IF EXISTS `xe_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_admin_log` (
  `ipaddress` varchar(100) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `act` varchar(100) DEFAULT NULL,
  `request_vars` text,
  KEY `idx_admin_ip` (`ipaddress`),
  KEY `idx_admin_date` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_admin_log`
--

LOCK TABLES `xe_admin_log` WRITE;
/*!40000 ALTER TABLE `xe_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_ai_installed_packages`
--

DROP TABLE IF EXISTS `xe_ai_installed_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_ai_installed_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  `current_version` varchar(255) DEFAULT NULL,
  `need_update` char(1) DEFAULT 'N',
  KEY `idx_package_srl` (`package_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_ai_installed_packages`
--

LOCK TABLES `xe_ai_installed_packages` WRITE;
/*!40000 ALTER TABLE `xe_ai_installed_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_ai_installed_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_ai_remote_categories`
--

DROP TABLE IF EXISTS `xe_ai_remote_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_ai_remote_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`category_srl`),
  KEY `idx_parent_srl` (`parent_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_ai_remote_categories`
--

LOCK TABLES `xe_ai_remote_categories` WRITE;
/*!40000 ALTER TABLE `xe_ai_remote_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_ai_remote_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_autoinstall_packages`
--

DROP TABLE IF EXISTS `xe_autoinstall_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_autoinstall_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) DEFAULT '0',
  `path` varchar(250) NOT NULL,
  `have_instance` char(1) NOT NULL DEFAULT 'N',
  `updatedate` varchar(14) DEFAULT NULL,
  `latest_item_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  UNIQUE KEY `unique_path` (`path`),
  KEY `idx_package_srl` (`package_srl`),
  KEY `idx_category_srl` (`category_srl`),
  KEY `idx_regdate` (`updatedate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_autoinstall_packages`
--

LOCK TABLES `xe_autoinstall_packages` WRITE;
/*!40000 ALTER TABLE `xe_autoinstall_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_autoinstall_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comment_declared`
--

DROP TABLE IF EXISTS `xe_comment_declared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comment_declared` (
  `comment_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_srl`),
  KEY `idx_declared_count` (`declared_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comment_declared`
--

LOCK TABLES `xe_comment_declared` WRITE;
/*!40000 ALTER TABLE `xe_comment_declared` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comment_declared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comment_declared_log`
--

DROP TABLE IF EXISTS `xe_comment_declared_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comment_declared_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_comment_srl` (`comment_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comment_declared_log`
--

LOCK TABLES `xe_comment_declared_log` WRITE;
/*!40000 ALTER TABLE `xe_comment_declared_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comment_declared_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comment_voted_log`
--

DROP TABLE IF EXISTS `xe_comment_voted_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comment_voted_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL,
  KEY `idx_comment_srl` (`comment_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comment_voted_log`
--

LOCK TABLES `xe_comment_voted_log` WRITE;
/*!40000 ALTER TABLE `xe_comment_voted_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comment_voted_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comments`
--

DROP TABLE IF EXISTS `xe_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comments` (
  `comment_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `is_secret` char(1) NOT NULL DEFAULT 'N',
  `content` longtext NOT NULL,
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `status` bigint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`comment_srl`),
  UNIQUE KEY `idx_module_list_order` (`module_srl`,`list_order`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_parent_srl` (`parent_srl`),
  KEY `idx_voted_count` (`voted_count`),
  KEY `idx_blamed_count` (`blamed_count`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_uploaded_count` (`uploaded_count`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_list_order` (`list_order`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comments`
--

LOCK TABLES `xe_comments` WRITE;
/*!40000 ALTER TABLE `xe_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comments_list`
--

DROP TABLE IF EXISTS `xe_comments_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comments_list` (
  `comment_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `head` bigint(11) NOT NULL DEFAULT '0',
  `arrange` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `depth` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_srl`),
  KEY `idx_list` (`document_srl`,`head`,`arrange`),
  KEY `idx_date` (`module_srl`,`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comments_list`
--

LOCK TABLES `xe_comments_list` WRITE;
/*!40000 ALTER TABLE `xe_comments_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comments_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_counter_log`
--

DROP TABLE IF EXISTS `xe_counter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_counter_log` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `user_agent` varchar(250) DEFAULT NULL,
  KEY `idx_site_counter_log` (`site_srl`,`ipaddress`),
  KEY `idx_counter_log` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_counter_log`
--

LOCK TABLES `xe_counter_log` WRITE;
/*!40000 ALTER TABLE `xe_counter_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_counter_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_counter_site_status`
--

DROP TABLE IF EXISTS `xe_counter_site_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_counter_site_status` (
  `site_srl` bigint(11) NOT NULL,
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0',
  UNIQUE KEY `site_status` (`site_srl`,`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_counter_site_status`
--

LOCK TABLES `xe_counter_site_status` WRITE;
/*!40000 ALTER TABLE `xe_counter_site_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_counter_site_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_counter_status`
--

DROP TABLE IF EXISTS `xe_counter_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_counter_status` (
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0',
  PRIMARY KEY (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_counter_status`
--

LOCK TABLES `xe_counter_status` WRITE;
/*!40000 ALTER TABLE `xe_counter_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_counter_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_aliases`
--

DROP TABLE IF EXISTS `xe_document_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_aliases` (
  `alias_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `alias_title` varchar(250) NOT NULL,
  PRIMARY KEY (`alias_srl`),
  UNIQUE KEY `idx_module_title` (`module_srl`,`alias_title`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_alias_title` (`alias_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_aliases`
--

LOCK TABLES `xe_document_aliases` WRITE;
/*!40000 ALTER TABLE `xe_document_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_categories`
--

DROP TABLE IF EXISTS `xe_document_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `expand` char(1) DEFAULT 'N',
  `document_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  `group_srls` text,
  `color` varchar(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_categories`
--

LOCK TABLES `xe_document_categories` WRITE;
/*!40000 ALTER TABLE `xe_document_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_declared`
--

DROP TABLE IF EXISTS `xe_document_declared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_declared` (
  `document_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_srl`),
  KEY `idx_declared_count` (`declared_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_declared`
--

LOCK TABLES `xe_document_declared` WRITE;
/*!40000 ALTER TABLE `xe_document_declared` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_declared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_declared_log`
--

DROP TABLE IF EXISTS `xe_document_declared_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_declared_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_declared_log`
--

LOCK TABLES `xe_document_declared_log` WRITE;
/*!40000 ALTER TABLE `xe_document_declared_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_declared_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_extra_keys`
--

DROP TABLE IF EXISTS `xe_document_extra_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_extra_keys` (
  `module_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `var_name` varchar(250) NOT NULL,
  `var_type` varchar(50) NOT NULL,
  `var_is_required` char(1) NOT NULL DEFAULT 'N',
  `var_search` char(1) NOT NULL DEFAULT 'N',
  `var_default` text,
  `var_desc` text,
  `eid` varchar(40) DEFAULT NULL,
  UNIQUE KEY `unique_module_keys` (`module_srl`,`var_idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_extra_keys`
--

LOCK TABLES `xe_document_extra_keys` WRITE;
/*!40000 ALTER TABLE `xe_document_extra_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_extra_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_extra_vars`
--

DROP TABLE IF EXISTS `xe_document_extra_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` longtext,
  `eid` varchar(40) DEFAULT NULL,
  UNIQUE KEY `unique_extra_vars` (`module_srl`,`document_srl`,`var_idx`,`lang_code`),
  KEY `idx_document_list_order` (`document_srl`,`module_srl`,`var_idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_extra_vars`
--

LOCK TABLES `xe_document_extra_vars` WRITE;
/*!40000 ALTER TABLE `xe_document_extra_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_extra_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_histories`
--

DROP TABLE IF EXISTS `xe_document_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_histories` (
  `history_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `content` longtext,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  PRIMARY KEY (`history_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_ipaddress` (`ipaddress`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_histories`
--

LOCK TABLES `xe_document_histories` WRITE;
/*!40000 ALTER TABLE `xe_document_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_readed_log`
--

DROP TABLE IF EXISTS `xe_document_readed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_readed_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_readed_log`
--

LOCK TABLES `xe_document_readed_log` WRITE;
/*!40000 ALTER TABLE `xe_document_readed_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_readed_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_trash`
--

DROP TABLE IF EXISTS `xe_document_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_trash` (
  `trash_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `trash_date` varchar(14) DEFAULT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  PRIMARY KEY (`trash_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_trash_date` (`trash_date`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_member_srl` (`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_trash`
--

LOCK TABLES `xe_document_trash` WRITE;
/*!40000 ALTER TABLE `xe_document_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_voted_log`
--

DROP TABLE IF EXISTS `xe_document_voted_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_voted_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_voted_log`
--

LOCK TABLES `xe_document_voted_log` WRITE;
/*!40000 ALTER TABLE `xe_document_voted_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_voted_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_documents`
--

DROP TABLE IF EXISTS `xe_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_documents` (
  `document_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(10) NOT NULL DEFAULT '',
  `is_notice` char(1) NOT NULL DEFAULT 'N',
  `title` varchar(250) DEFAULT NULL,
  `title_bold` char(1) NOT NULL DEFAULT 'N',
  `title_color` varchar(7) DEFAULT NULL,
  `content` longtext NOT NULL,
  `readed_count` bigint(11) NOT NULL DEFAULT '0',
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `comment_count` bigint(11) NOT NULL DEFAULT '0',
  `trackback_count` bigint(11) NOT NULL DEFAULT '0',
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `tags` text,
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `last_updater` varchar(80) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `update_order` bigint(11) NOT NULL,
  `allow_trackback` char(1) NOT NULL DEFAULT 'Y',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `status` varchar(20) DEFAULT 'PUBLIC',
  `comment_status` varchar(20) DEFAULT 'ALLOW',
  PRIMARY KEY (`document_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_category_srl` (`category_srl`),
  KEY `idx_is_notice` (`is_notice`),
  KEY `idx_readed_count` (`readed_count`),
  KEY `idx_voted_count` (`voted_count`),
  KEY `idx_blamed_count` (`blamed_count`),
  KEY `idx_comment_count` (`comment_count`),
  KEY `idx_trackback_count` (`trackback_count`),
  KEY `idx_uploaded_count` (`uploaded_count`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_list_order` (`list_order`),
  KEY `idx_update_order` (`update_order`),
  KEY `idx_module_list_order` (`module_srl`,`list_order`),
  KEY `idx_module_update_order` (`module_srl`,`update_order`),
  KEY `idx_module_readed_count` (`module_srl`,`readed_count`),
  KEY `idx_module_voted_count` (`module_srl`,`voted_count`),
  KEY `idx_module_notice` (`module_srl`,`is_notice`),
  KEY `idx_module_document_srl` (`module_srl`,`document_srl`),
  KEY `idx_module_blamed_count` (`module_srl`,`blamed_count`),
  KEY `idx_module_status` (`module_srl`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_documents`
--

LOCK TABLES `xe_documents` WRITE;
/*!40000 ALTER TABLE `xe_documents` DISABLE KEYS */;
INSERT INTO `xe_documents` VALUES (90,65,0,'ko','N','Welcome XE','N','N','<link rel=\"stylesheet\" href=\"./layouts/xedition/css/welcome.css\" />\n<div class=\"welcomeXE\">\n	<section class=\"intro\">\n		<span class=\"noti\">WELCOME TO</span>\n		<h1 class=\"tit\">WELCOME TO XPRESSENGINE</h1>\n		<P class=\"cont\">XpressEngine은 자유로운 웹 콘텐츠 발행을 돕는 CMS입니다.<br />간편한 설치와 다양한 추가 프로그램을 활용하여<br /> 자신만의 웹페이지를 쉽고 빠르게 만들 수 있습니다.</P>\n		<a href=\"/xe/index.php?module=admin\" target=\"_blank\" class=\"btn_start\">XE 시작하기</a>\n	</section>\n</div>\n',0,0,0,0,0,0,NULL,'admin','admin','admin',4,'uryu70005@naver.com','',NULL,'N;','20230522031436','20230522031436',NULL,'192.168.10.129',-90,-90,'N','N','PUBLIC','DENY'),(91,65,0,'ko','N','Welcome mobile XE','N','N','<link rel=\"stylesheet\" href=\"./layouts/xedition/css/welcome.css\" />\n<div class=\"welcomeXE\">\n	<section class=\"intro\">\n		<span class=\"noti\">WELCOME TO</span>\n		<h1 class=\"tit\">WELCOME TO XPRESSENGINE</h1>\n		<P class=\"cont\">XpressEngine은 자유로운 웹 콘텐츠 발행을 돕는 CMS입니다.<br />간편한 설치와 다양한 추가 프로그램을 활용하여<br /> 자신만의 웹페이지를 쉽고 빠르게 만들 수 있습니다.</P>\n		<a href=\"/xe/index.php?module=admin\" target=\"_blank\" class=\"btn_start\">XE 시작하기</a>\n	</section>\n</div>\n',0,0,0,0,0,0,NULL,'admin','admin','admin',4,'uryu70005@naver.com','',NULL,'N;','20230522031436','20230522031436',NULL,'192.168.10.129',-91,-91,'N','N','PUBLIC','DENY'),(92,65,0,'ko','N','XEIcon (1)','N','N','<section class=\"main_title fixedwidth\">\n	<h1>Beautiful iconic font &amp; CSS toolkit</h1>\n	<p>\n		XEIcon은 웹사이트 제작에 최적화된 백터 그래픽 아이콘 툴킷입니다.<br />\n		한국 웹서비스 문화에 적합한 디자인과 카테고리를 고려하여 제작되었습니다.<br />\n		XEIcon으로 아름답고 직관적인 웹페이지를 만들어보세요!<br />\n	</p>\n</section>\n',0,0,0,0,0,0,NULL,'admin','admin','admin',4,'uryu70005@naver.com','',NULL,'N;','20230522031436','20230522031436',NULL,'192.168.10.129',-92,-92,'N','N','PUBLIC','DENY'),(93,65,0,'ko','N','XEIcon (2)','N','N','<section class=\"feature fixedwidth\">\n	<div class=\"tit\"><h1>FEATURE</h1></div>\n	<ul>\n	<li>\n		<div class=\"ico\"><i class=\"xi-cube\"></i></div>\n		<h2>한개의 폰트, 680개의 아이콘</h2>\n		<p>웹 콘텐츠의 목적에 맞는 아이콘을 다양한 구성에서 찾아볼 수 있습니다.<br /><a href=\"https://xpressengine.github.io/XEIcon/library_common.html\" target=\"_blank\">라이브러리</a>에서 필요한 아이콘을 찾아보세요!</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-sitemap\"></i></div>\n		<h2>호환성</h2>\n		<p>XEIcon은 자바스크립트 없이 구현됩니다. <br />또한 다양한 브라우저에서도 동일한 뷰로 웹 페이지를 노출합니다.</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-layout-top-left\"></i></div>\n		<h2>최적화</h2>\n		<p>XpressEngine 뿐 아니라, 다양한 프레임워크에서 동일하게 구현됩니다. 여러 환경에서 자유롭게 이용해보세요!</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-arrows-alt\"></i></div>\n		<h2>확장성</h2>\n		<p>백터 아이콘으로 만들어진 XEIcon은 어떤 크기로도 확장이 가능하며 높은 해상도의 화면에서도 선명한 형태를 유지합니다.</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-pen\"></i></div>\n		<h2>자유로운 변형</h2>\n		<p>CSS를 통해 아이콘의 색상, 크기 등을 손쉽게 변형할 수 있습니다. <a href=\"https://xpressengine.github.io/XEIcon/examples.html\" target=\"_blank\">LESS SASS</a>로 더 넓어진 활용 범위를 확인하세요!</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-present\"></i></div>\n		<h2>오픈소스</h2>\n		<p>XEIcon은 OFL 라이선스를 따르는 오픈소스로 모든 사용자에게 무료로 제공됩니다. <a href=\"https://xpressengine.github.io/XEIcon/license.html\" target=\"_blank\">라이선스</a>를 확인해 보세요!</p>\n	</li>\n	</ul>\n</section>\n',0,0,0,0,0,0,NULL,'admin','admin','admin',4,'uryu70005@naver.com','',NULL,'N;','20230522031436','20230522031436',NULL,'192.168.10.129',-93,-93,'N','N','PUBLIC','DENY'),(94,65,0,'ko','N','XEIcon (3)','N','N','<section class=\"get_started\">\n	<div class=\"fixedwidth\">\n		<div class=\"tit\"><h1>GET STARTED</h1></div>\n		<p class=\"cont\">XEIcon 사용과 설치 방법은 매우 간단합니다. 자세한 사용방법을 <a href=\"http://xpressengine.github.io/XEIcon/\">XEIcon 공식사이트</a>에서 확인해보세요!</p>\n		<ul>\n			<li>\n				<h2>최신버전 다운로드</h2>\n				<p>가장 최신버전 구성을 압축파일로<br />다운로드 받아볼 수 있습니다.</p>\n				<a href=\"https://github.com/xpressengine/XEIcon/archive/master.zip\"><i class=\"xeicon xi-download\"></i> Download</a>\n			</li>\n			<li>\n				<h2>Git 저장소 복제</h2>\n				<p>Github에서 로컬 저장소로 복제하여 사용할 수 있습니다.</p>\n				<a href=\"https://xpressengine.github.io/XEIcon/started.html#installation\" target=\"_blank\"><i class=\"xeicon xi-arrow-right\"></i> check out</a>\n			</li>\n			<li>\n				<h2>CDN by jsDelivr</h2>\n				<p>한줄의 코드만 작성하면 다운로드 없이 XEIcon을 사용할 수 있습니다.</p>\n				<a href=\"https://xpressengine.github.io/XEIcon/started.html#cdn\" target=\"_blank\"><i class=\"xeicon xi-arrow-right\"></i> check out</a>\n			</li>\n			<li>\n				<h2>Install with Bower</h2>\n				<p>Bower 서비스에서 XEIcon 패키지를 바로 설치할 수 있습니다.</p>\n				<a href=\"https://xpressengine.github.io/XEIcon/started.html#bower\"><i class=\"xeicon xi-arrow-right\"></i> check out</a>\n			</li>\n		</ul>\n	</div>\n</section>\n',0,0,0,0,0,0,NULL,'admin','admin','admin',4,'uryu70005@naver.com','',NULL,'N;','20230522031436','20230522031436',NULL,'192.168.10.129',-94,-94,'N','N','PUBLIC','DENY'),(95,65,0,'ko','N','XEIcon (4)','N','N','<section class=\"contribution fixedwidth\">\n	<div class=\"tit\"><h1>CONTRIBUTION</h1></div>\n	<p class=\"cont\">새로운 아이콘 요청이나 XEICON에 대한 제안이 있다면 자유롭게 이야기해주세요!<br />앞으로의 이야기들을 함께 만들어갈 third party 참여 또한 환영합니다.</p>\n	<a href=\"https://github.com/xpressengine/XEIcon\" target=\"_blank\" class=\"btn_github\">github</a>\n</section>\n',0,0,0,0,0,0,NULL,'admin','admin','admin',4,'uryu70005@naver.com','',NULL,'N;','20230522031436','20230522031436',NULL,'192.168.10.129',-95,-95,'N','N','PUBLIC','DENY');
/*!40000 ALTER TABLE `xe_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_editor_autosave`
--

DROP TABLE IF EXISTS `xe_editor_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_editor_autosave` (
  `member_srl` bigint(11) DEFAULT '0',
  `ipaddress` varchar(128) DEFAULT NULL,
  `module_srl` bigint(11) DEFAULT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `content` longtext NOT NULL,
  `certify_key` varchar(100) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_certify_key` (`certify_key`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_editor_autosave`
--

LOCK TABLES `xe_editor_autosave` WRITE;
/*!40000 ALTER TABLE `xe_editor_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_editor_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_editor_components`
--

DROP TABLE IF EXISTS `xe_editor_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_editor_components` (
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`component_name`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_editor_components`
--

LOCK TABLES `xe_editor_components` WRITE;
/*!40000 ALTER TABLE `xe_editor_components` DISABLE KEYS */;
INSERT INTO `xe_editor_components` VALUES ('colorpicker_text','Y',NULL,41),('colorpicker_bg','Y',NULL,43),('emoticon','Y',NULL,45),('url_link','Y',NULL,47),('image_link','Y',NULL,49),('multimedia_link','Y',NULL,51),('quotation','Y',NULL,53),('table_maker','Y',NULL,55),('poll_maker','Y',NULL,57),('image_gallery','Y',NULL,59);
/*!40000 ALTER TABLE `xe_editor_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_editor_components_site`
--

DROP TABLE IF EXISTS `xe_editor_components_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_editor_components_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  UNIQUE KEY `unique_component_site` (`site_srl`,`component_name`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_editor_components_site`
--

LOCK TABLES `xe_editor_components_site` WRITE;
/*!40000 ALTER TABLE `xe_editor_components_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_editor_components_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_files`
--

DROP TABLE IF EXISTS `xe_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_files` (
  `file_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL DEFAULT '0',
  `upload_target_type` char(3) DEFAULT NULL,
  `sid` varchar(60) DEFAULT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `download_count` bigint(11) NOT NULL DEFAULT '0',
  `direct_download` char(1) NOT NULL DEFAULT 'N',
  `source_filename` varchar(250) DEFAULT NULL,
  `uploaded_filename` varchar(250) DEFAULT NULL,
  `file_size` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `isvalid` char(1) DEFAULT 'N',
  `cover_image` char(1) NOT NULL DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  PRIMARY KEY (`file_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_upload_target_type` (`upload_target_type`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_download_count` (`download_count`),
  KEY `idx_file_size` (`file_size`),
  KEY `idx_is_valid` (`isvalid`),
  KEY `idx_list_order` (`cover_image`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_ipaddress` (`ipaddress`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_files`
--

LOCK TABLES `xe_files` WRITE;
/*!40000 ALTER TABLE `xe_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_lang`
--

DROP TABLE IF EXISTS `xe_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_lang` (
  `site_srl` bigint(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` text,
  KEY `idx_lang` (`site_srl`,`name`,`lang_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_lang`
--

LOCK TABLES `xe_lang` WRITE;
/*!40000 ALTER TABLE `xe_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_layouts`
--

DROP TABLE IF EXISTS `xe_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_layouts` (
  `layout_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `layout` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `extra_vars` text,
  `layout_path` varchar(250) DEFAULT NULL,
  `module_srl` bigint(12) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `layout_type` char(1) DEFAULT 'P',
  PRIMARY KEY (`layout_srl`),
  KEY `menu_site_srl` (`site_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_layouts`
--

LOCK TABLES `xe_layouts` WRITE;
/*!40000 ALTER TABLE `xe_layouts` DISABLE KEYS */;
INSERT INTO `xe_layouts` VALUES (88,0,'xedition','XEDITION','O:8:\"stdClass\":3:{s:3:\"GNB\";i:64;s:3:\"UNB\";i:75;s:3:\"FNB\";i:78;}',NULL,0,'20230522031436','P'),(89,0,'default','welcome_mobile_layout','O:8:\"stdClass\":4:{s:3:\"GNB\";i:64;s:3:\"UNB\";i:75;s:3:\"FNB\";i:78;s:9:\"main_menu\";i:64;}',NULL,0,'20230522031436','M');
/*!40000 ALTER TABLE `xe_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member`
--

DROP TABLE IF EXISTS `xe_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member` (
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email_id` varchar(80) NOT NULL,
  `email_host` varchar(160) DEFAULT NULL,
  `user_name` varchar(40) NOT NULL,
  `nick_name` varchar(40) NOT NULL,
  `find_account_question` bigint(11) DEFAULT NULL,
  `find_account_answer` varchar(250) DEFAULT NULL,
  `homepage` varchar(250) DEFAULT NULL,
  `blog` varchar(250) DEFAULT NULL,
  `birthday` char(8) DEFAULT NULL,
  `allow_mailing` char(1) NOT NULL DEFAULT 'Y',
  `allow_message` char(1) NOT NULL DEFAULT 'Y',
  `denied` char(1) DEFAULT 'N',
  `limit_date` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_login` varchar(14) DEFAULT NULL,
  `change_password_date` varchar(14) DEFAULT NULL,
  `is_admin` char(1) DEFAULT 'N',
  `description` text,
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`member_srl`),
  UNIQUE KEY `unique_user_id` (`user_id`),
  UNIQUE KEY `unique_email_address` (`email_address`),
  UNIQUE KEY `unique_nick_name` (`nick_name`),
  KEY `idx_email_host` (`email_host`),
  KEY `idx_allow_mailing` (`allow_mailing`),
  KEY `idx_is_denied` (`denied`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_login` (`last_login`),
  KEY `idx_is_admin` (`is_admin`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member`
--

LOCK TABLES `xe_member` WRITE;
/*!40000 ALTER TABLE `xe_member` DISABLE KEYS */;
INSERT INTO `xe_member` VALUES (4,'admin','uryu70005@naver.com','sha256:0008192:RlLBASGjGcIc:h2YQ5jF9E6q0kwbivGV6sRLx13H27WE0','uryu70005','naver.com','admin','admin',NULL,NULL,'','',NULL,'N','Y','N',NULL,'20230522031434','20230522031434','20230522031434','Y',NULL,NULL,-4),(129,'t129','1@naver.com','sha256:0008192:FQNBwqAzcxG8:Nij4oss3egWZ1GgvdchkWaXGyHxSRBBm','1','naver.com','129','a',NULL,NULL,'','',NULL,'N','Y','N','','20230522043232','20230522043232','20230522043232','N','','O:8:\"stdClass\":1:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";}',-129),(130,'t130','2@naver.com','sha256:0008192:Uvq9Kwx2hwZi:+yIyJH/ZCAgHBhq4QmaeDRcot7L6NslW','2','naver.com','130','b',NULL,NULL,'','',NULL,'N','Y','N','','20230522043250','20230522043250','20230522043250','N','','O:8:\"stdClass\":1:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";}',-130),(131,'t131','3@naver.com','sha256:0008192:9PIxLre4QfYK:uorx0am/LOO4JfORTmlCuTZoUeaq02Jx','3','naver.com','131','c',NULL,NULL,'','',NULL,'N','Y','N','','20230522043306','20230522043306','20230522043306','N','','O:8:\"stdClass\":1:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";}',-131);
/*!40000 ALTER TABLE `xe_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_auth_mail`
--

DROP TABLE IF EXISTS `xe_member_auth_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_auth_mail` (
  `auth_key` varchar(60) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `new_password` varchar(80) NOT NULL,
  `is_register` char(1) DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_key` (`auth_key`,`member_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_auth_mail`
--

LOCK TABLES `xe_member_auth_mail` WRITE;
/*!40000 ALTER TABLE `xe_member_auth_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_auth_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_autologin`
--

DROP TABLE IF EXISTS `xe_member_autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_autologin` (
  `autologin_key` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  UNIQUE KEY `unique_key` (`autologin_key`,`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_autologin`
--

LOCK TABLES `xe_member_autologin` WRITE;
/*!40000 ALTER TABLE `xe_member_autologin` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_autologin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_count_history`
--

DROP TABLE IF EXISTS `xe_member_count_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_count_history` (
  `member_srl` bigint(11) NOT NULL,
  `content` longtext NOT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`member_srl`),
  KEY `idx_last_update` (`last_update`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_count_history`
--

LOCK TABLES `xe_member_count_history` WRITE;
/*!40000 ALTER TABLE `xe_member_count_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_count_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_denied_nick_name`
--

DROP TABLE IF EXISTS `xe_member_denied_nick_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_denied_nick_name` (
  `nick_name` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`nick_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_denied_nick_name`
--

LOCK TABLES `xe_member_denied_nick_name` WRITE;
/*!40000 ALTER TABLE `xe_member_denied_nick_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_denied_nick_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_denied_user_id`
--

DROP TABLE IF EXISTS `xe_member_denied_user_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_denied_user_id` (
  `user_id` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_denied_user_id`
--

LOCK TABLES `xe_member_denied_user_id` WRITE;
/*!40000 ALTER TABLE `xe_member_denied_user_id` DISABLE KEYS */;
INSERT INTO `xe_member_denied_user_id` VALUES ('addon','20230522031434','',-5),('admin','20230522031434','',-6),('adminlogging','20230522031434','',-7),('autoinstall','20230522031434','',-8),('board','20230522031434','',-9),('comment','20230522031434','',-10),('communication','20230522031434','',-11),('counter','20230522031434','',-12),('document','20230522031434','',-13),('editor','20230522031434','',-14),('file','20230522031434','',-15),('importer','20230522031434','',-16),('install','20230522031434','',-17),('integration_search','20230522031434','',-18),('krzip','20230522031434','',-19),('layout','20230522031434','',-20),('member','20230522031434','',-21),('menu','20230522031434','',-22),('message','20230522031434','',-23),('module','20230522031434','',-24),('page','20230522031434','',-25),('point','20230522031434','',-26),('poll','20230522031434','',-27),('rss','20230522031434','',-28),('seo','20230522031434','',-29),('session','20230522031434','',-30),('spamfilter','20230522031434','',-31),('tag','20230522031434','',-32),('trash','20230522031434','',-33),('widget','20230522031434','',-34),('www','20230522031434','',-35),('root','20230522031434','',-36),('administrator','20230522031434','',-37),('telnet','20230522031434','',-38),('ftp','20230522031434','',-39),('http','20230522031434','',-40);
/*!40000 ALTER TABLE `xe_member_denied_user_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_friend`
--

DROP TABLE IF EXISTS `xe_member_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_friend` (
  `friend_srl` bigint(11) NOT NULL,
  `friend_group_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `target_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`friend_srl`),
  KEY `idx_friend_group_srl` (`friend_group_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_target_srl` (`target_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_friend`
--

LOCK TABLES `xe_member_friend` WRITE;
/*!40000 ALTER TABLE `xe_member_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_friend_group`
--

DROP TABLE IF EXISTS `xe_member_friend_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_friend_group` (
  `friend_group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`friend_group_srl`),
  KEY `index_owner_member_srl` (`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_friend_group`
--

LOCK TABLES `xe_member_friend_group` WRITE;
/*!40000 ALTER TABLE `xe_member_friend_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_friend_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_group`
--

DROP TABLE IF EXISTS `xe_member_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_group` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `is_default` char(1) DEFAULT 'N',
  `is_admin` char(1) DEFAULT 'N',
  `image_mark` text,
  `description` text,
  PRIMARY KEY (`group_srl`),
  UNIQUE KEY `idx_site_title` (`site_srl`,`title`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_group`
--

LOCK TABLES `xe_member_group` WRITE;
/*!40000 ALTER TABLE `xe_member_group` DISABLE KEYS */;
INSERT INTO `xe_member_group` VALUES (0,1,1,'관리그룹','20230522031434','N','Y','',''),(0,2,2,'준회원','20230522031434','Y','N','',''),(0,3,3,'정회원','20230522031434','N','N','','');
/*!40000 ALTER TABLE `xe_member_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_group_member`
--

DROP TABLE IF EXISTS `xe_member_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_group_member` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_site_srl` (`site_srl`),
  KEY `idx_group_member` (`group_srl`,`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_group_member`
--

LOCK TABLES `xe_member_group_member` WRITE;
/*!40000 ALTER TABLE `xe_member_group_member` DISABLE KEYS */;
INSERT INTO `xe_member_group_member` VALUES (0,1,4,'20230522031434'),(0,2,129,'20230522043232'),(0,2,130,'20230522043250'),(0,2,131,'20230522043306');
/*!40000 ALTER TABLE `xe_member_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_join_form`
--

DROP TABLE IF EXISTS `xe_member_join_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_join_form` (
  `member_join_form_srl` bigint(11) NOT NULL,
  `column_type` varchar(60) NOT NULL,
  `column_name` varchar(60) NOT NULL,
  `column_title` varchar(60) NOT NULL,
  `required` char(1) NOT NULL DEFAULT 'N',
  `default_value` text,
  `is_active` char(1) DEFAULT 'Y',
  `description` text,
  `list_order` bigint(11) NOT NULL DEFAULT '1',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`member_join_form_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_join_form`
--

LOCK TABLES `xe_member_join_form` WRITE;
/*!40000 ALTER TABLE `xe_member_join_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_join_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_login_count`
--

DROP TABLE IF EXISTS `xe_member_login_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_login_count` (
  `ipaddress` varchar(128) NOT NULL,
  `count` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_login_count`
--

LOCK TABLES `xe_member_login_count` WRITE;
/*!40000 ALTER TABLE `xe_member_login_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_login_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_message`
--

DROP TABLE IF EXISTS `xe_member_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_message` (
  `message_srl` bigint(11) NOT NULL,
  `related_srl` bigint(11) NOT NULL,
  `sender_srl` bigint(11) NOT NULL,
  `receiver_srl` bigint(11) NOT NULL,
  `message_type` char(1) NOT NULL DEFAULT 'S',
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `readed` char(1) NOT NULL DEFAULT 'N',
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `readed_date` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`message_srl`),
  KEY `idx_related_srl` (`related_srl`),
  KEY `idx_sender_srl` (`sender_srl`),
  KEY `idx_receiver_srl` (`receiver_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_message`
--

LOCK TABLES `xe_member_message` WRITE;
/*!40000 ALTER TABLE `xe_member_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_scrap`
--

DROP TABLE IF EXISTS `xe_member_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_scrap` (
  `member_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `target_member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  UNIQUE KEY `unique_scrap` (`member_srl`,`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_scrap`
--

LOCK TABLES `xe_member_scrap` WRITE;
/*!40000 ALTER TABLE `xe_member_scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_menu`
--

DROP TABLE IF EXISTS `xe_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_menu` (
  `menu_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`menu_srl`),
  KEY `menu_site_srl` (`site_srl`),
  KEY `idx_title` (`title`),
  KEY `idx_listorder` (`listorder`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_menu`
--

LOCK TABLES `xe_menu` WRITE;
/*!40000 ALTER TABLE `xe_menu` DISABLE KEYS */;
INSERT INTO `xe_menu` VALUES (64,0,'Main menu',-64,'20230522031435'),(75,0,'Utility menu',-75,'20230522031435'),(78,0,'Footer Menu',-78,'20230522031435'),(96,0,'__ADMINMENU_V17__',-96,'20230522043119');
/*!40000 ALTER TABLE `xe_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_menu_item`
--

DROP TABLE IF EXISTS `xe_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_menu_item` (
  `menu_item_srl` bigint(12) NOT NULL,
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `menu_srl` bigint(12) NOT NULL,
  `name` text,
  `desc` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `is_shortcut` char(1) DEFAULT 'N',
  `open_window` char(1) DEFAULT 'N',
  `expand` char(1) DEFAULT 'N',
  `normal_btn` varchar(255) DEFAULT NULL,
  `hover_btn` varchar(255) DEFAULT NULL,
  `active_btn` varchar(255) DEFAULT NULL,
  `group_srls` text,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`menu_item_srl`),
  KEY `idx_menu_srl` (`menu_srl`),
  KEY `idx_listorder` (`listorder`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_menu_item`
--

LOCK TABLES `xe_menu_item` WRITE;
/*!40000 ALTER TABLE `xe_menu_item` DISABLE KEYS */;
INSERT INTO `xe_menu_item` VALUES (66,0,64,'Welcome Page','','index','N','N','N',NULL,NULL,NULL,NULL,-66,'20230522031435'),(68,0,64,'Board','','board','N','N','N',NULL,NULL,NULL,NULL,-68,'20230522031435'),(69,68,64,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-69,'20230522031435'),(70,69,64,'SAMPLE 1-1','','#','Y','N','N',NULL,NULL,NULL,NULL,-70,'20230522031435'),(71,68,64,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-71,'20230522031435'),(72,68,64,'SAMPLE 3','','#','Y','N','N',NULL,NULL,NULL,NULL,-72,'20230522031435'),(74,0,64,'XEIcon','','xeicon','N','N','N',NULL,NULL,NULL,NULL,-74,'20230522031435'),(76,0,75,'XE Official Site','','http://www.xpressengine.com','Y','N','N',NULL,NULL,NULL,NULL,-76,'20230522031435'),(77,0,75,'GitHub','','https://github.com/xpressengine','Y','N','N',NULL,NULL,NULL,NULL,-77,'20230522031435'),(79,0,78,'Welcome Page','','#','Y','N','N',NULL,NULL,NULL,NULL,-79,'20230522031435'),(80,79,78,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-80,'20230522031435'),(81,79,78,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-81,'20230522031435'),(82,79,78,'SAMPLE 3','','#','Y','N','N',NULL,NULL,NULL,NULL,-82,'20230522031435'),(83,0,78,'Board','','#','Y','N','N',NULL,NULL,NULL,NULL,-83,'20230522031435'),(84,83,78,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-84,'20230522031436'),(85,83,78,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-85,'20230522031436'),(86,0,78,'XEIcon','','#','Y','N','N',NULL,NULL,NULL,NULL,-86,'20230522031436'),(87,86,78,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-87,'20230522031436'),(97,0,96,'{$lang->menu_gnb[\'dashboard\']}',NULL,'index.php?module=admin','N','N','N',NULL,NULL,NULL,NULL,-97,'20230522043119'),(98,0,96,'{$lang->menu_gnb[\'menu\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-98,'20230522043119'),(99,0,96,'{$lang->menu_gnb[\'user\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-99,'20230522043119'),(100,0,96,'{$lang->menu_gnb[\'content\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-100,'20230522043119'),(101,0,96,'{$lang->menu_gnb[\'configuration\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-101,'20230522043119'),(102,0,96,'{$lang->menu_gnb[\'advanced\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-102,'20230522043119'),(103,98,96,'{$lang->menu_gnb_sub[\'siteMap\']}',NULL,'index.php?module=admin&act=dispMenuAdminSiteMap','N','N','N','','','','1',-103,'20230522043119'),(104,98,96,'{$lang->menu_gnb_sub[\'siteDesign\']}',NULL,'index.php?module=admin&act=dispMenuAdminSiteDesign','N','N','N','','','','1',-104,'20230522043119'),(105,99,96,'{$lang->menu_gnb_sub[\'userList\']}',NULL,'index.php?module=admin&act=dispMemberAdminList','N','N','N','','','','1',-105,'20230522043119'),(106,99,96,'{$lang->menu_gnb_sub[\'userSetting\']}',NULL,'index.php?module=admin&act=dispMemberAdminConfig','N','N','N','','','','1',-106,'20230522043119'),(107,99,96,'{$lang->menu_gnb_sub[\'userGroup\']}',NULL,'index.php?module=admin&act=dispMemberAdminGroupList','N','N','N','','','','1',-107,'20230522043119'),(108,100,96,'{$lang->menu_gnb_sub[\'document\']}',NULL,'index.php?module=admin&act=dispDocumentAdminList','N','N','N','','','','1',-108,'20230522043119'),(109,100,96,'{$lang->menu_gnb_sub[\'comment\']}',NULL,'index.php?module=admin&act=dispCommentAdminList','N','N','N','','','','1',-109,'20230522043119'),(110,100,96,'{$lang->menu_gnb_sub[\'file\']}',NULL,'index.php?module=admin&act=dispFileAdminList','N','N','N','','','','1',-110,'20230522043119'),(111,100,96,'{$lang->menu_gnb_sub[\'poll\']}',NULL,'index.php?module=admin&act=dispPollAdminList','N','N','N','','','','1',-111,'20230522043119'),(112,100,96,'{$lang->menu_gnb_sub[\'rss\']}',NULL,'index.php?module=admin&act=dispRssAdminIndex','N','N','N','','','','1',-112,'20230522043119'),(113,100,96,'{$lang->menu_gnb_sub[\'multilingual\']}',NULL,'index.php?module=admin&act=dispModuleAdminLangcode','N','N','N','','','','1',-113,'20230522043119'),(114,100,96,'{$lang->menu_gnb_sub[\'importer\']}',NULL,'index.php?module=admin&act=dispImporterAdminImportForm','N','N','N','','','','1',-114,'20230522043119'),(115,100,96,'{$lang->menu_gnb_sub[\'trash\']}',NULL,'index.php?module=admin&act=dispTrashAdminList','N','N','N','','','','1',-115,'20230522043119'),(116,102,96,'{$lang->menu_gnb_sub[\'easyInstall\']}',NULL,'index.php?module=admin&act=dispAutoinstallAdminIndex','N','N','N','','','','1',-116,'20230522043119'),(117,102,96,'{$lang->menu_gnb_sub[\'installedLayout\']}',NULL,'index.php?module=admin&act=dispLayoutAdminInstalledList','N','N','N','','','','1',-117,'20230522043119'),(118,102,96,'{$lang->menu_gnb_sub[\'installedModule\']}',NULL,'index.php?module=admin&act=dispModuleAdminContent','N','N','N','','','','1',-118,'20230522043119'),(119,102,96,'{$lang->menu_gnb_sub[\'installedWidget\']}',NULL,'index.php?module=admin&act=dispWidgetAdminDownloadedList','N','N','N','','','','1',-119,'20230522043119'),(120,102,96,'{$lang->menu_gnb_sub[\'installedAddon\']}',NULL,'index.php?module=admin&act=dispAddonAdminIndex','N','N','N','','','','1',-120,'20230522043119'),(121,102,96,'{$lang->menu_gnb_sub[\'editor\']}',NULL,'index.php?module=admin&act=dispEditorAdminIndex','N','N','N','','','','1',-121,'20230522043119'),(122,100,96,'{$lang->menu_gnb_sub[\'spamFilter\']}',NULL,'index.php?module=admin&act=dispSpamfilterAdminDeniedIPList','N','N','N','','','','1',-122,'20230522043119'),(123,101,96,'{$lang->menu_gnb_sub[\'adminConfigurationGeneral\']}',NULL,'index.php?module=admin&act=dispAdminConfigGeneral','N','N','N','','','','1',-123,'20230522043119'),(124,101,96,'{$lang->menu_gnb_sub[\'adminConfigurationFtp\']}',NULL,'index.php?module=admin&act=dispAdminConfigFtp','N','N','N','','','','1',-124,'20230522043119'),(125,101,96,'{$lang->menu_gnb_sub[\'adminMenuSetup\']}',NULL,'index.php?module=admin&act=dispAdminSetup','N','N','N','','','','1',-125,'20230522043119'),(126,101,96,'{$lang->menu_gnb_sub[\'fileUpload\']}',NULL,'index.php?module=admin&act=dispFileAdminConfig','N','N','N','','','','1',-126,'20230522043119'),(127,101,96,'{$lang->menu_gnb_sub[\'filebox\']}',NULL,'index.php?module=admin&act=dispModuleAdminFileBox','N','N','N','','','','1',-127,'20230522043119'),(128,99,96,'{$lang->menu_gnb_sub[\'point\']}',NULL,'index.php?module=admin&act=dispPointAdminConfig','N','N','N','','','','1',-128,'20230522043119');
/*!40000 ALTER TABLE `xe_menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_menu_layout`
--

DROP TABLE IF EXISTS `xe_menu_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_menu_layout` (
  `menu_srl` bigint(12) NOT NULL,
  `layout_srl` bigint(12) NOT NULL,
  PRIMARY KEY (`menu_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_menu_layout`
--

LOCK TABLES `xe_menu_layout` WRITE;
/*!40000 ALTER TABLE `xe_menu_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_menu_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_admins`
--

DROP TABLE IF EXISTS `xe_module_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_admins` (
  `module_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_module_admin` (`module_srl`,`member_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_admins`
--

LOCK TABLES `xe_module_admins` WRITE;
/*!40000 ALTER TABLE `xe_module_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_categories`
--

DROP TABLE IF EXISTS `xe_module_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_categories` (
  `module_category_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_category_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_categories`
--

LOCK TABLES `xe_module_categories` WRITE;
/*!40000 ALTER TABLE `xe_module_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_config`
--

DROP TABLE IF EXISTS `xe_module_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_config` (
  `module` varchar(250) NOT NULL,
  `site_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_config`
--

LOCK TABLES `xe_module_config` WRITE;
/*!40000 ALTER TABLE `xe_module_config` DISABLE KEYS */;
INSERT INTO `xe_module_config` VALUES ('comment',0,'N;','20230522031434'),('editor',0,'N;','20230522031434'),('file',0,'O:8:\"stdClass\":3:{s:16:\"allowed_filesize\";s:1:\"2\";s:19:\"allowed_attach_size\";s:1:\"2\";s:17:\"allowed_filetypes\";s:3:\"*.*\";}','20230522031434'),('layout',0,'N;','20230522031434'),('point',0,'O:8:\"stdClass\":22:{s:11:\"able_module\";s:1:\"N\";s:9:\"max_level\";i:30;s:10:\"level_step\";a:30:{i:1;i:90;i:2;i:360;i:3;i:810;i:4;i:1440;i:5;i:2250;i:6;i:3240;i:7;i:4410;i:8;i:5760;i:9;i:7290;i:10;i:9000;i:11;i:10890;i:12;i:12960;i:13;i:15210;i:14;i:17640;i:15;i:20250;i:16;i:23040;i:17;i:26010;i:18;i:29160;i:19;i:32490;i:20;i:36000;i:21;i:39690;i:22;i:43560;i:23;i:47610;i:24;i:51840;i:25;i:56250;i:26;i:60840;i:27;i:65610;i:28;i:70560;i:29;i:75690;i:30;i:81000;}s:12:\"signup_point\";i:10;s:11:\"login_point\";i:5;s:10:\"point_name\";s:5:\"point\";s:10:\"level_icon\";s:7:\"default\";s:16:\"disable_download\";b:0;s:15:\"insert_document\";i:10;s:19:\"insert_document_act\";s:23:\"procBoardInsertDocument\";s:19:\"delete_document_act\";s:23:\"procBoardDeleteDocument\";s:14:\"insert_comment\";i:5;s:18:\"insert_comment_act\";s:44:\"procBoardInsertComment,procBlogInsertComment\";s:18:\"delete_comment_act\";s:44:\"procBoardDeleteComment,procBlogDeleteComment\";s:11:\"upload_file\";i:5;s:15:\"upload_file_act\";s:14:\"procFileUpload\";s:15:\"delete_file_act\";s:14:\"procFileDelete\";s:13:\"download_file\";i:-5;s:17:\"download_file_act\";s:16:\"procFileDownload\";s:13:\"read_document\";i:0;s:5:\"voted\";i:0;s:6:\"blamed\";i:0;}','20230522031434'),('rss',0,'N;','20230522031434'),('module',0,'O:8:\"stdClass\":1:{s:18:\"isUpdateFixedValue\";b:1;}','20230522031434'),('autoinstall',0,'O:8:\"stdClass\":1:{s:14:\"downloadServer\";s:33:\"http://download.xpressengine.com/\";}','20230522031434'),('poll',0,'O:8:\"stdClass\":2:{s:4:\"skin\";s:7:\"default\";s:8:\"colorset\";s:6:\"normal\";}','20230522031434'),('member',0,'O:8:\"stdClass\":19:{s:11:\"enable_join\";s:1:\"Y\";s:13:\"enable_openid\";s:1:\"N\";s:16:\"enable_auth_mail\";s:1:\"N\";s:10:\"image_name\";s:1:\"Y\";s:10:\"image_mark\";s:1:\"Y\";s:13:\"profile_image\";s:1:\"Y\";s:20:\"image_name_max_width\";s:2:\"90\";s:21:\"image_name_max_height\";s:2:\"20\";s:20:\"image_mark_max_width\";s:2:\"20\";s:21:\"image_mark_max_height\";s:2:\"20\";s:23:\"profile_image_max_width\";s:2:\"90\";s:24:\"profile_image_max_height\";s:2:\"90\";s:16:\"group_image_mark\";s:1:\"N\";s:17:\"password_strength\";s:6:\"normal\";s:26:\"password_hashing_algorithm\";s:6:\"pbkdf2\";s:28:\"password_hashing_work_factor\";i:8;s:29:\"password_hashing_auto_upgrade\";s:1:\"Y\";s:10:\"signupForm\";a:13:{i:0;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:13:\"email_address\";s:5:\"title\";s:13:\"email_address\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:1;}i:1;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:7:\"user_id\";s:5:\"title\";s:7:\"user_id\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:2;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"password\";s:5:\"title\";s:8:\"password\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;}i:3;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"user_name\";s:5:\"title\";s:9:\"user_name\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:4;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"nick_name\";s:5:\"title\";s:9:\"nick_name\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:5;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:21:\"find_account_question\";s:5:\"title\";s:21:\"find_account_question\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;}i:6;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"homepage\";s:5:\"title\";s:8:\"homepage\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:7;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:4:\"blog\";s:5:\"title\";s:4:\"blog\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:8;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"birthday\";s:5:\"title\";s:8:\"birthday\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:9;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"signature\";s:5:\"title\";s:9:\"signature\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;}i:10;O:8:\"stdClass\":11:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:13:\"profile_image\";s:5:\"title\";s:13:\"profile_image\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;s:9:\"max_width\";N;s:10:\"max_height\";N;}i:11;O:8:\"stdClass\":11:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:10:\"image_name\";s:5:\"title\";s:10:\"image_name\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;s:9:\"max_width\";N;s:10:\"max_height\";N;}i:12;O:8:\"stdClass\":11:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:10:\"image_mark\";s:5:\"title\";s:10:\"image_mark\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;s:9:\"max_width\";N;s:10:\"max_height\";N;}}s:10:\"identifier\";s:13:\"email_address\";}','20230522031434');
/*!40000 ALTER TABLE `xe_module_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_extend`
--

DROP TABLE IF EXISTS `xe_module_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_extend` (
  `parent_module` varchar(80) NOT NULL,
  `extend_module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `kind` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_extend`
--

LOCK TABLES `xe_module_extend` WRITE;
/*!40000 ALTER TABLE `xe_module_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_extra_vars`
--

DROP TABLE IF EXISTS `xe_module_extra_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_vars` (`module_srl`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_extra_vars`
--

LOCK TABLES `xe_module_extra_vars` WRITE;
/*!40000 ALTER TABLE `xe_module_extra_vars` DISABLE KEYS */;
INSERT INTO `xe_module_extra_vars` VALUES (65,'regdate','20230522031435'),(73,'regdate','20230522031435'),(65,'page_type','WIDGET'),(73,'page_type','WIDGET');
/*!40000 ALTER TABLE `xe_module_extra_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_filebox`
--

DROP TABLE IF EXISTS `xe_module_filebox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_filebox` (
  `module_filebox_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `fileextension` varchar(4) NOT NULL,
  `filesize` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_filebox_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_fileextension` (`fileextension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_filebox`
--

LOCK TABLES `xe_module_filebox` WRITE;
/*!40000 ALTER TABLE `xe_module_filebox` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_filebox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_grants`
--

DROP TABLE IF EXISTS `xe_module_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_grants` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `group_srl` bigint(11) NOT NULL,
  UNIQUE KEY `unique_module` (`module_srl`,`name`,`group_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_grants`
--

LOCK TABLES `xe_module_grants` WRITE;
/*!40000 ALTER TABLE `xe_module_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_locks`
--

DROP TABLE IF EXISTS `xe_module_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_locks` (
  `lock_name` varchar(40) NOT NULL,
  `deadline` varchar(14) DEFAULT NULL,
  `member_srl` bigint(11) DEFAULT NULL,
  UNIQUE KEY `unique_lock_name` (`lock_name`),
  KEY `idx_deadline` (`deadline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_locks`
--

LOCK TABLES `xe_module_locks` WRITE;
/*!40000 ALTER TABLE `xe_module_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_mobile_skins`
--

DROP TABLE IF EXISTS `xe_module_mobile_skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_mobile_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_mobile_skins` (`module_srl`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_mobile_skins`
--

LOCK TABLES `xe_module_mobile_skins` WRITE;
/*!40000 ALTER TABLE `xe_module_mobile_skins` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_mobile_skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_part_config`
--

DROP TABLE IF EXISTS `xe_module_part_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_part_config` (
  `module` varchar(250) NOT NULL,
  `module_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_module_part_config` (`module`,`module_srl`),
  KEY `idx_module_part_config` (`module`,`module_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_part_config`
--

LOCK TABLES `xe_module_part_config` WRITE;
/*!40000 ALTER TABLE `xe_module_part_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_part_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_skins`
--

DROP TABLE IF EXISTS `xe_module_skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_skins` (`module_srl`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_skins`
--

LOCK TABLES `xe_module_skins` WRITE;
/*!40000 ALTER TABLE `xe_module_skins` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_trigger`
--

DROP TABLE IF EXISTS `xe_module_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_trigger` (
  `trigger_name` varchar(80) NOT NULL,
  `called_position` varchar(15) NOT NULL,
  `module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `called_method` varchar(80) NOT NULL,
  UNIQUE KEY `idx_trigger` (`trigger_name`,`called_position`,`module`,`type`,`called_method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_trigger`
--

LOCK TABLES `xe_module_trigger` WRITE;
/*!40000 ALTER TABLE `xe_module_trigger` DISABLE KEYS */;
INSERT INTO `xe_module_trigger` VALUES ('comment.deleteComment','after','file','controller','triggerCommentDeleteAttached'),('comment.deleteComment','after','poll','controller','triggerDeleteCommentPoll'),('comment.getCommentMenu','after','member','controller','triggerGetCommentMenu'),('comment.insertComment','after','file','controller','triggerCommentAttachFiles'),('comment.insertComment','after','poll','controller','triggerInsertCommentPoll'),('comment.insertComment','before','file','controller','triggerCommentCheckAttached'),('comment.insertComment','before','spamfilter','controller','triggerInsertComment'),('comment.updateComment','after','file','controller','triggerCommentAttachFiles'),('comment.updateComment','after','poll','controller','triggerUpdateCommentPoll'),('comment.updateComment','before','file','controller','triggerCommentCheckAttached'),('comment.updateComment','before','spamfilter','controller','triggerInsertComment'),('communication.sendMessage','before','spamfilter','controller','triggerSendMessage'),('display','before','editor','controller','triggerEditorComponentCompile'),('display','before','seo','controller','triggerBeforeDisplay'),('display','before','widget','controller','triggerWidgetCompile'),('document.deleteDocument','after','comment','controller','triggerDeleteDocumentComments'),('document.deleteDocument','after','file','controller','triggerDeleteAttached'),('document.deleteDocument','after','poll','controller','triggerDeleteDocumentPoll'),('document.deleteDocument','after','seo','controller','triggerAfterDocumentDeleteDocument'),('document.deleteDocument','after','tag','controller','triggerDeleteTag'),('document.getDocumentMenu','after','member','controller','triggerGetDocumentMenu'),('document.insertDocument','after','editor','controller','triggerDeleteSavedDoc'),('document.insertDocument','after','file','controller','triggerAttachFiles'),('document.insertDocument','after','poll','controller','triggerInsertDocumentPoll'),('document.insertDocument','after','tag','controller','triggerInsertTag'),('document.insertDocument','before','file','controller','triggerCheckAttached'),('document.insertDocument','before','spamfilter','controller','triggerInsertDocument'),('document.insertDocument','before','tag','controller','triggerArrangeTag'),('document.updateDocument','after','editor','controller','triggerDeleteSavedDoc'),('document.updateDocument','after','file','controller','triggerAttachFiles'),('document.updateDocument','after','poll','controller','triggerUpdateDocumentPoll'),('document.updateDocument','after','seo','controller','triggerAfterDocumentUpdateDocument'),('document.updateDocument','after','tag','controller','triggerInsertTag'),('document.updateDocument','before','file','controller','triggerCheckAttached'),('document.updateDocument','before','spamfilter','controller','triggerInsertDocument'),('document.updateDocument','before','tag','controller','triggerArrangeTag'),('editor.deleteSavedDoc','after','file','controller','triggerDeleteAttached'),('file.deleteFile','after','seo','controller','triggerAfterFileDeleteFile'),('member.getMemberMenu','after','board','controller','triggerMemberMenu'),('menu.getModuleListInSitemap','after','board','model','triggerModuleListInSitemap'),('module.deleteModule','after','comment','controller','triggerDeleteModuleComments'),('module.deleteModule','after','document','controller','triggerDeleteModuleDocuments'),('module.deleteModule','after','file','controller','triggerDeleteModuleFiles'),('module.deleteModule','after','tag','controller','triggerDeleteModuleTags'),('module.dispAdditionSetup','before','comment','view','triggerDispCommentAdditionSetup'),('module.dispAdditionSetup','before','document','view','triggerDispDocumentAdditionSetup'),('module.dispAdditionSetup','before','editor','view','triggerDispEditorAdditionSetup'),('module.dispAdditionSetup','before','file','view','triggerDispFileAdditionSetup'),('module.dispAdditionSetup','before','rss','view','triggerDispRssAdditionSetup'),('module.dispAdditionSetup','before','seo','view','triggerDispSeoAdditionSetup'),('module.procModuleAdminCopyModule','after','comment','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','document','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','document','controller','triggerCopyModuleExtraKeys'),('module.procModuleAdminCopyModule','after','editor','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','file','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','rss','controller','triggerCopyModule'),('moduleHandler.proc','after','rss','controller','triggerRssUrlInsert'),('trackback.insertTrackback','before','spamfilter','controller','triggerInsertTrackback');
/*!40000 ALTER TABLE `xe_module_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_update`
--

DROP TABLE IF EXISTS `xe_module_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_update` (
  `update_id` varchar(250) NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_update`
--

LOCK TABLES `xe_module_update` WRITE;
/*!40000 ALTER TABLE `xe_module_update` DISABLE KEYS */;
INSERT INTO `xe_module_update` VALUES ('addon.1.11.6.updated'),('admin.1.11.6.updated'),('autoinstall.1.11.6.updated'),('board.1.11.6.updated'),('comment.1.11.6.updated'),('communication.1.11.6.updated'),('counter.1.11.6.updated'),('document.1.11.6.updated'),('editor.1.11.6.updated'),('file.1.11.6.updated'),('integration_search.1.11.6.updated'),('layout.1.11.6.updated'),('member.1.11.6.updated'),('member.1.8.43.recreate_signup_ruleset'),('menu.1.11.6.updated'),('message.1.11.6.updated'),('module.1.11.6.updated'),('page.1.11.6.updated'),('poll.1.11.6.updated'),('rss.1.11.6.updated'),('session.1.11.6.updated'),('spamfilter.1.11.6.updated'),('tag.1.11.6.updated'),('widget.1.11.6.updated');
/*!40000 ALTER TABLE `xe_module_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_modules`
--

DROP TABLE IF EXISTS `xe_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_modules` (
  `module_srl` bigint(11) NOT NULL,
  `module` varchar(80) NOT NULL,
  `module_category_srl` bigint(11) DEFAULT '0',
  `layout_srl` bigint(11) DEFAULT '0',
  `use_mobile` char(1) DEFAULT 'N',
  `mlayout_srl` bigint(11) DEFAULT '0',
  `menu_srl` bigint(11) DEFAULT '0',
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `mid` varchar(40) NOT NULL,
  `is_skin_fix` char(1) NOT NULL DEFAULT 'Y',
  `skin` varchar(250) DEFAULT NULL,
  `is_mskin_fix` char(1) NOT NULL DEFAULT 'Y',
  `mskin` varchar(250) DEFAULT NULL,
  `browser_title` varchar(250) NOT NULL,
  `description` text,
  `is_default` char(1) NOT NULL DEFAULT 'N',
  `content` longtext,
  `mcontent` longtext,
  `open_rss` char(1) NOT NULL DEFAULT 'Y',
  `header_text` text,
  `footer_text` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_srl`),
  UNIQUE KEY `idx_site_mid` (`site_srl`,`mid`),
  KEY `idx_module` (`module`),
  KEY `idx_module_category` (`module_category_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_modules`
--

LOCK TABLES `xe_modules` WRITE;
/*!40000 ALTER TABLE `xe_modules` DISABLE KEYS */;
INSERT INTO `xe_modules` VALUES (65,'page',0,-1,'Y',-1,64,0,'index','N','/USE_DEFAULT/','N','/USE_DEFAULT/','Welcome Page','','N','<img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"width: 100%; float: left;\" body=\"\" document_srl=\"90\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\"  />','<img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"width: 100%; float: left;\" body=\"\" document_srl=\"91\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\"  />','Y','','','20230522031435'),(67,'board',0,-1,'Y',-1,64,0,'board','N',NULL,'N',NULL,'Board',NULL,'N',NULL,NULL,'Y',NULL,NULL,'20230522031435'),(73,'page',0,-1,'Y',-1,64,0,'xeicon','N','/USE_DEFAULT/','N','/USE_DEFAULT/','XEIcon','','N','<div widget=\"widgetBox\" style=\"float:left;width:100%;\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" css_class=\"XEicon\" ><div><div><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"92\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"93\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"94\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"95\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /></div></div></div>',NULL,'Y','','','20230522031435');
/*!40000 ALTER TABLE `xe_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_point`
--

DROP TABLE IF EXISTS `xe_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_point` (
  `member_srl` bigint(11) NOT NULL,
  `point` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_srl`),
  KEY `idx_point` (`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_point`
--

LOCK TABLES `xe_point` WRITE;
/*!40000 ALTER TABLE `xe_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll`
--

DROP TABLE IF EXISTS `xe_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll` (
  `poll_srl` bigint(11) NOT NULL,
  `stop_date` varchar(14) DEFAULT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `poll_count` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`poll_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll`
--

LOCK TABLES `xe_poll` WRITE;
/*!40000 ALTER TABLE `xe_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll_item`
--

DROP TABLE IF EXISTS `xe_poll_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll_item` (
  `poll_item_srl` bigint(11) NOT NULL,
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `poll_count` bigint(11) NOT NULL,
  PRIMARY KEY (`poll_item_srl`),
  KEY `index_poll_srl` (`poll_srl`),
  KEY `idx_poll_index_srl` (`poll_index_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll_item`
--

LOCK TABLES `xe_poll_item` WRITE;
/*!40000 ALTER TABLE `xe_poll_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll_log`
--

DROP TABLE IF EXISTS `xe_poll_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll_log` (
  `poll_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_poll_srl` (`poll_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll_log`
--

LOCK TABLES `xe_poll_log` WRITE;
/*!40000 ALTER TABLE `xe_poll_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll_title`
--

DROP TABLE IF EXISTS `xe_poll_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll_title` (
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `checkcount` bigint(11) NOT NULL DEFAULT '1',
  `poll_count` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  KEY `idx_poll_srl` (`poll_srl`,`poll_index_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll_title`
--

LOCK TABLES `xe_poll_title` WRITE;
/*!40000 ALTER TABLE `xe_poll_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_sequence`
--

DROP TABLE IF EXISTS `xe_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_sequence` (
  `seq` bigint(64) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_sequence`
--

LOCK TABLES `xe_sequence` WRITE;
/*!40000 ALTER TABLE `xe_sequence` DISABLE KEYS */;
INSERT INTO `xe_sequence` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129),(130),(131);
/*!40000 ALTER TABLE `xe_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_session`
--

DROP TABLE IF EXISTS `xe_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_session` (
  `session_key` varchar(255) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `expired` varchar(14) DEFAULT NULL,
  `val` longtext,
  `ipaddress` varchar(128) NOT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `cur_mid` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`session_key`),
  KEY `idx_session_member_srl` (`member_srl`),
  KEY `idx_session_expired` (`expired`),
  KEY `idx_session_update` (`last_update`),
  KEY `idx_session_cur_mid` (`cur_mid`),
  KEY `idx_session_update_mid` (`member_srl`,`last_update`,`cur_mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_session`
--

LOCK TABLES `xe_session` WRITE;
/*!40000 ALTER TABLE `xe_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_site_admin`
--

DROP TABLE IF EXISTS `xe_site_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_site_admin` (
  `site_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `idx_site_admin` (`site_srl`,`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_site_admin`
--

LOCK TABLES `xe_site_admin` WRITE;
/*!40000 ALTER TABLE `xe_site_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_site_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_sites`
--

DROP TABLE IF EXISTS `xe_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_sites` (
  `site_srl` bigint(11) NOT NULL,
  `index_module_srl` bigint(11) DEFAULT '0',
  `domain` varchar(255) NOT NULL,
  `default_language` varchar(255) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`site_srl`),
  UNIQUE KEY `unique_domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_sites`
--

LOCK TABLES `xe_sites` WRITE;
/*!40000 ALTER TABLE `xe_sites` DISABLE KEYS */;
INSERT INTO `xe_sites` VALUES (0,65,'ns.gusiya.com/xe/','ko','20230522031434');
/*!40000 ALTER TABLE `xe_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_spamfilter_denied_ip`
--

DROP TABLE IF EXISTS `xe_spamfilter_denied_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_spamfilter_denied_ip` (
  `ipaddress` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_spamfilter_denied_ip`
--

LOCK TABLES `xe_spamfilter_denied_ip` WRITE;
/*!40000 ALTER TABLE `xe_spamfilter_denied_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_spamfilter_denied_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_spamfilter_denied_word`
--

DROP TABLE IF EXISTS `xe_spamfilter_denied_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_spamfilter_denied_word` (
  `word` varchar(250) NOT NULL,
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `latest_hit` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`word`),
  KEY `idx_hit` (`hit`),
  KEY `idx_latest_hit` (`latest_hit`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_spamfilter_denied_word`
--

LOCK TABLES `xe_spamfilter_denied_word` WRITE;
/*!40000 ALTER TABLE `xe_spamfilter_denied_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_spamfilter_denied_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_spamfilter_log`
--

DROP TABLE IF EXISTS `xe_spamfilter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_spamfilter_log` (
  `spamfilter_log_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`spamfilter_log_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_spamfilter_log`
--

LOCK TABLES `xe_spamfilter_log` WRITE;
/*!40000 ALTER TABLE `xe_spamfilter_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_spamfilter_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_tags`
--

DROP TABLE IF EXISTS `xe_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_tags` (
  `tag_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `tag` varchar(240) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`tag_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_tag` (`document_srl`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_tags`
--

LOCK TABLES `xe_tags` WRITE;
/*!40000 ALTER TABLE `xe_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_trash`
--

DROP TABLE IF EXISTS `xe_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_trash` (
  `trash_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `origin_module` varchar(250) NOT NULL DEFAULT 'document',
  `serialized_object` longtext NOT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `remover_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`trash_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_trash`
--

LOCK TABLES `xe_trash` WRITE;
/*!40000 ALTER TABLE `xe_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_trash` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 14:03:09
