-- MySQL dump 10.13  Distrib 8.0.18, for osx10.15 (x86_64)
--
-- Host: localhost    Database: VideoSummarizer
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add profile',7,'add_profile'),(26,'Can change profile',7,'change_profile'),(27,'Can delete profile',7,'delete_profile'),(28,'Can view profile',7,'view_profile'),(29,'Can add video',8,'add_video'),(30,'Can change video',8,'change_video'),(31,'Can delete video',8,'delete_video'),(32,'Can view video',8,'view_video'),(33,'Can add split',9,'add_split'),(34,'Can change split',9,'change_split'),(35,'Can delete split',9,'delete_split'),(36,'Can view split',9,'view_split'),(37,'Can add video split',10,'add_videosplit'),(38,'Can change video split',10,'change_videosplit'),(39,'Can delete video split',10,'delete_videosplit'),(40,'Can view video split',10,'view_videosplit'),(41,'Can add split transcript',11,'add_splittranscript'),(42,'Can change split transcript',11,'change_splittranscript'),(43,'Can delete split transcript',11,'delete_splittranscript'),(44,'Can view split transcript',11,'view_splittranscript'),(45,'Can add split speech',12,'add_splitspeech'),(46,'Can change split speech',12,'change_splitspeech'),(47,'Can delete split speech',12,'delete_splitspeech'),(48,'Can view split speech',12,'view_splitspeech'),(49,'Can add split summary',13,'add_splitsummary'),(50,'Can change split summary',13,'change_splitsummary'),(51,'Can delete split summary',13,'delete_splitsummary'),(52,'Can view split summary',13,'view_splitsummary'),(53,'Can add split tag',14,'add_splittag'),(54,'Can change split tag',14,'change_splittag'),(55,'Can delete split tag',14,'delete_splittag'),(56,'Can view split tag',14,'view_splittag');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$zruu23zO2yo5$aAqxk1U46T5wPcDWUiaXIqAQdrkrB30pEo7gEFQ+L14=','2020-04-27 05:23:16.675424',1,'admin','','','shashankcalmbuddy@gmail.com',1,1,'2020-04-27 02:09:41.322853'),(2,'pbkdf2_sha256$180000$wQgPj3zeTeXN$/kKpZyMpCwaVWEaV5xiHS7mY+vsfKStkvYD236qsVMc=','2020-04-27 05:47:37.831487',0,'abc','','','abc@gmail.com',0,1,'2020-04-27 02:10:32.509152');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'summarize','profile'),(9,'summarize','split'),(12,'summarize','splitspeech'),(13,'summarize','splitsummary'),(14,'summarize','splittag'),(11,'summarize','splittranscript'),(8,'summarize','video'),(10,'summarize','videosplit');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-27 02:08:48.360639'),(2,'auth','0001_initial','2020-04-27 02:08:48.420455'),(3,'admin','0001_initial','2020-04-27 02:08:48.567360'),(4,'admin','0002_logentry_remove_auto_add','2020-04-27 02:08:48.609729'),(5,'admin','0003_logentry_add_action_flag_choices','2020-04-27 02:08:48.617432'),(6,'contenttypes','0002_remove_content_type_name','2020-04-27 02:08:48.661369'),(7,'auth','0002_alter_permission_name_max_length','2020-04-27 02:08:48.682031'),(8,'auth','0003_alter_user_email_max_length','2020-04-27 02:08:48.701915'),(9,'auth','0004_alter_user_username_opts','2020-04-27 02:08:48.708669'),(10,'auth','0005_alter_user_last_login_null','2020-04-27 02:08:48.732040'),(11,'auth','0006_require_contenttypes_0002','2020-04-27 02:08:48.733603'),(12,'auth','0007_alter_validators_add_error_messages','2020-04-27 02:08:48.741275'),(13,'auth','0008_alter_user_username_max_length','2020-04-27 02:08:48.771707'),(14,'auth','0009_alter_user_last_name_max_length','2020-04-27 02:08:48.796987'),(15,'auth','0010_alter_group_name_max_length','2020-04-27 02:08:48.811637'),(16,'auth','0011_update_proxy_permissions','2020-04-27 02:08:48.821377'),(17,'sessions','0001_initial','2020-04-27 02:08:48.831048'),(18,'summarize','0001_initial','2020-04-27 02:09:24.825742');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3avx19dm40o952mmpkmr7hrcex4ospgq','YWFmMmMyNmIwM2NiNTMwNzZiZWQ1MzcwNDk5YTU2Mjc0MjhmODg2ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjVmYjU4YTRjNDUyZDAzZDU4MjhlODQ2ZjhjYWU1YTYwMWYxZmZjIn0=','2020-05-11 05:47:37.839999');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_profile`
--

DROP TABLE IF EXISTS `summarize_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_confirmed` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `summarize_profile_user_id_dd93cbba_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_profile`
--

LOCK TABLES `summarize_profile` WRITE;
/*!40000 ALTER TABLE `summarize_profile` DISABLE KEYS */;
INSERT INTO `summarize_profile` VALUES (1,0,'',1),(2,1,'abc@gmail.com',2);
/*!40000 ALTER TABLE `summarize_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_split`
--

DROP TABLE IF EXISTS `summarize_split`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_split` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SplitPath` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_split`
--

LOCK TABLES `summarize_split` WRITE;
/*!40000 ALTER TABLE `summarize_split` DISABLE KEYS */;
INSERT INTO `summarize_split` VALUES (1,'videos/5eriZbqE18N1Tsz2GJwwMactLOicvvDulJX5LO4yEwc.mp4'),(2,'videos/XvaaV8V4h0IQtunGS9mrji1nF55lcBQ2R6iOfIsertc.mp4'),(3,'videos/OengHYgUv_AIbJoiOVghaKBA6wE-5d-cfJJuqIKVwXI.mp4'),(4,'videos/8q96olrZPWiode0vZ6JT0rFjfW4A04WFNbZsN6GrQoI.mp4'),(5,'videos/htsLGOrPQZPg9TWqjt8yWm8qus3-4jz_65fu8VE4cv4.mp4'),(6,'videos/lP6NBrEZv4OXmxlyqYZMvIJeS0fgADfBKxg4nikVGKg.mp4'),(7,'videos/aVt5iopLb3jl0xp73hHP0skiAqoz6D3mzx60VWoIhM8.mp4'),(8,'videos/APjtj31OXGm46Mg1m9Hg0-y_p1hVjvbPHuUHG8r-02A.mp4'),(9,'videos/MlUhJWNYdCouOLWGPc2drkl_tb9yskHE6IwZsgsHZbY.mp4'),(10,'videos/3kdNOMirnOkqK0Sp7_13Kpyb21jAYp1fd3fZDdxOzVU.mp4'),(11,'videos/W31h5MKbZV2vif8Vu5wgEQdFzvBtHFraTnOr0QWi06o.mp4');
/*!40000 ALTER TABLE `summarize_split` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_splitspeech`
--

DROP TABLE IF EXISTS `summarize_splitspeech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_splitspeech` (
  `SplitID_id` int NOT NULL,
  `SpeechPath` longtext NOT NULL,
  PRIMARY KEY (`SplitID_id`),
  CONSTRAINT `summarize_splitspeech_SplitID_id_7c8f24a4_fk_summarize_split_id` FOREIGN KEY (`SplitID_id`) REFERENCES `summarize_split` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_splitspeech`
--

LOCK TABLES `summarize_splitspeech` WRITE;
/*!40000 ALTER TABLE `summarize_splitspeech` DISABLE KEYS */;
INSERT INTO `summarize_splitspeech` VALUES (1,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/5eriZbqE18N1Tsz2GJwwMactLOicvvDulJX5LO4yEwc.wav'),(2,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/XvaaV8V4h0IQtunGS9mrji1nF55lcBQ2R6iOfIsertc.wav'),(3,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/OengHYgUv_AIbJoiOVghaKBA6wE-5d-cfJJuqIKVwXI.wav'),(4,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/8q96olrZPWiode0vZ6JT0rFjfW4A04WFNbZsN6GrQoI.wav'),(5,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/htsLGOrPQZPg9TWqjt8yWm8qus3-4jz_65fu8VE4cv4.wav'),(6,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/lP6NBrEZv4OXmxlyqYZMvIJeS0fgADfBKxg4nikVGKg.wav'),(7,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/aVt5iopLb3jl0xp73hHP0skiAqoz6D3mzx60VWoIhM8.wav'),(8,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/APjtj31OXGm46Mg1m9Hg0-y_p1hVjvbPHuUHG8r-02A.wav'),(9,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/MlUhJWNYdCouOLWGPc2drkl_tb9yskHE6IwZsgsHZbY.wav'),(10,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/3kdNOMirnOkqK0Sp7_13Kpyb21jAYp1fd3fZDdxOzVU.wav'),(11,'/Users/shashanks./college/semester-8/Software-Engineering/project/v1/SWEProject/videoSummarizer/summarize/../media/audio/W31h5MKbZV2vif8Vu5wgEQdFzvBtHFraTnOr0QWi06o.wav');
/*!40000 ALTER TABLE `summarize_splitspeech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_splitsummary`
--

DROP TABLE IF EXISTS `summarize_splitsummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_splitsummary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Summary` longtext NOT NULL,
  `SplitID_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `summarize_splitsummary_SplitID_id_1fe4286f_fk_summarize_split_id` (`SplitID_id`),
  CONSTRAINT `summarize_splitsummary_SplitID_id_1fe4286f_fk_summarize_split_id` FOREIGN KEY (`SplitID_id`) REFERENCES `summarize_split` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_splitsummary`
--

LOCK TABLES `summarize_splitsummary` WRITE;
/*!40000 ALTER TABLE `summarize_splitsummary` DISABLE KEYS */;
INSERT INTO `summarize_splitsummary` VALUES (1,'They\'re like the pipelines were a little bit more complex than that.',4),(2,'The first major adjustment for depreciation and amortization expenses which are non-cash expenses.',5),(3,'What\'s 2.12 billion dollars, which is added back and foot.',5),(4,'Some of a company\'s operating expenses may not have been in cash.',5),(5,'Of course, none of which are related to its operations.',5),(6,'The impact of these items must be removed from the net income Amazon had 0.25 billion dollars in such expenses net of any income as the operations operating income being greater than any non-operating expenses.',5),(7,'The number would have to be subtracted from net income as the income net of expenses are not related to operations.',5),(8,'It\'s from stock-based compensation add up to a positive 8.78 billion dollars.',6),(9,'Dickies in inventory must be added to the net income for all other types of operations related current assets.',6),(10,'For example, if accounts receivable increases the notes that the company has not received cash for at least some of it since so that revenue and the net income overstate how much cash the company has Amazon saw an increase of 1.76 billion dollars in his account receivable between 2014 and 2015 subtracted from net income on the statement of cash flows operations related current liabilities increase in current liabilities must be added to net income and decreases must be subtracted from net income has that the company still has not paid some of his suppliers for products and services that the supplies already provided.',6),(11,'How would the cost of these products and services are subtracted from revenues while calculating net income increases Amazon\'s accounts payable increased by 4.29 billion dollars between 2014 and 2015 and this is added to net income expenses also increase between 2014 and 2015 from revenues on the income statement, but still not pay so these also need to be added to net income on the statement of cash flows Amazon\'s accrued expenses increased by 0.91 billion dollars between 2014 and 2015 may also pay a company in advance Forest products and services revenues on the balance sheet reported on the income statement only when the company delivers its products and services.',6),(12,'This adds up to a total of 2.54 billion dollars adding this to the net income of 0.60 billion dollars and the early I just went for non-cash expenses and non operations related expenses of 8.78 billion dollars gives Amazon and net cash flow from operating activities of 11.9 to billion dollars during 2015.',6),(13,'We make judgments like this and to think about that question.',7),(14,'I in the universe that\'s a kind of Paradigm objective judgment.',7),(15,'So if the statement said in Britain, it\'s true that said America is false.',8),(16,'So you could say the statement when was driving.',8),(17,'So the first statement is true for me in the second statements true for you.',8),(18,'That\'s the subject of this idea the subjects.',9),(19,'Where is another person saying polygamy is morally dubious.',9),(20,'I\'m expressing my feelings for polygamy.',9),(21,'The first question is are our moral judgments of sorts of things that can be true or false or are they mere opinions?',10),(22,'The second question is if they aren\'t the sort of things do come true or false what makes them true or false.',10),(23,'Another question is if they are true are they objected we true who discuss three views about these questions are about the status of the first of you is objectivism.',10),(24,'The idea behind emotivism is that no are more customers are not the sort some things that can be true or false.',10),(25,'So this week I wanted to highlight on that.',11),(26,'We have several example project ideas as a pin post on Piazza.',11),(27,'So check out this pin post on Piazza.',11);
/*!40000 ALTER TABLE `summarize_splitsummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_splittag`
--

DROP TABLE IF EXISTS `summarize_splittag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_splittag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tag` longtext NOT NULL,
  `SplitID_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `summarize_splittag_SplitID_id_1f4073a5_fk_summarize_split_id` (`SplitID_id`),
  CONSTRAINT `summarize_splittag_SplitID_id_1f4073a5_fk_summarize_split_id` FOREIGN KEY (`SplitID_id`) REFERENCES `summarize_split` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_splittag`
--

LOCK TABLES `summarize_splittag` WRITE;
/*!40000 ALTER TABLE `summarize_splittag` DISABLE KEYS */;
INSERT INTO `summarize_splittag` VALUES (1,'production function tax',3),(2,'make some prediction',3),(3,'tax which cakes',3),(4,'case of image',3),(5,'image classification',3),(6,'production function',3),(7,'weight matrix',3),(8,'loss function',3),(9,'function tax',3),(10,'note',3),(11,'oriented gradients concatenate',4),(12,'image classification pipeline',4),(13,'histogram oriented gradients',4),(14,'tucson linear classifier',4),(15,'beast feature extractors',4),(16,'bunch of pictures',4),(17,'hits a histogram',4),(18,'lane in tucson',4),(19,'words or hits',4),(20,'bag of words',4),(21,'investing and financing',5),(22,'amazon net income',5),(23,'net income amazon',5),(24,'amazon cash flow',5),(25,'financing activities',5),(26,'operating activities',5),(27,'billion dollars',5),(28,'cash flows',5),(29,'net income',5),(30,'amazon net',5),(31,'operations related current',6),(32,'current liabilities amazon',6),(33,'income increases amazon',6),(34,'related current assets',6),(35,'net income increases',6),(36,'net income amazon',6),(37,'operations related',6),(38,'income statement',6),(39,'billion dollars',6),(40,'related current',6),(41,'paradigm objective judgment',7),(42,'polygamy is morally',7),(43,'status of morality',7),(44,'true or false',7),(45,'objective judgment',7),(46,'objectively true',7),(47,'moral judgments',7),(48,'morally dubious',7),(49,'earth rotates',7),(50,'questions',7),(51,'relative british driving',8),(52,'true relative british',8),(53,'spanish and american',8),(54,'true or false',8),(55,'statements true',8),(56,'false relative',8),(57,'true relative',8),(58,'american law',8),(59,'britain',8),(60,'morally',8),(61,'polygamy is morally',9),(62,'true or false',9),(63,'morally dubious',9),(64,'moral judgments',9),(65,'basic idea',9),(66,'disagreement',9),(67,'relativism',9),(68,'feelings',9),(69,'culture',9),(70,'person',9),(71,'goodness of charity',10),(72,'sorts of things',10),(73,'true or false',10),(74,'objectively true',10),(75,'moral judgments',10),(76,'false relative',10),(77,'questions',10),(78,'emotivism',10),(79,'question',10),(80,'status',10),(81,'community or affiliated',11),(82,'affiliated to stanford',11),(83,'wanted to highlight',11),(84,'post on piazza',11),(85,'week i wanted',11),(86,'stanford community',11),(87,'project ideas',11),(88,'pin post',11),(89,'projects',11),(90,'work',11);
/*!40000 ALTER TABLE `summarize_splittag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_splittranscript`
--

DROP TABLE IF EXISTS `summarize_splittranscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_splittranscript` (
  `SplitID_id` int NOT NULL,
  `Transcript` longtext NOT NULL,
  PRIMARY KEY (`SplitID_id`),
  CONSTRAINT `summarize_splittrans_SplitID_id_0623fd51_fk_summarize` FOREIGN KEY (`SplitID_id`) REFERENCES `summarize_split` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_splittranscript`
--

LOCK TABLES `summarize_splittranscript` WRITE;
/*!40000 ALTER TABLE `summarize_splittranscript` DISABLE KEYS */;
INSERT INTO `summarize_splittranscript` VALUES (1,'So that\'s linear regression with braids in the front. If you\'ve seen at Vons linear algebra, befall those of you who have taken the Carlton you at all. You might know that there exists a solution for numerically solving for the minimum of the cost function J without needing to use an iterative algorithm, like raising the send Legends close. We\'ll talk about that method as well that just solve for the minimum of the cops on him gay without needing any of this multiple-step in the sense that other methods is called the normal equations methods and the scale betta two larger than says then that normal equation method, and now that we know about being then we\'ll be able to use it in lots of different content, then we\'ll use it and lots of different machine there any problems as well.So congrats on learning about your first machine learning algorithm will later have exercises in which we lost you to implement didn\'t attend. And how do you say he doesn\'t work for yourself? But before that I first want to tell you in the next of the video the first one to tell you about a generalization of the gradient descent algorithm, they\'ll make it much more powerful and I guess I\'ll tell you about that in the next'),(2,'Maps of 0 and some other quantity is often referred to as some type of hinge loss and this name comes from the the shape of the graph when you go and plot it. So here are the access corresponds to be asked why I that is the score of the true class for some for some training example, and now the y-axis is the loss and you can see that as the score for the true category for the true category for this example increases then the loss will go down the nearly until we get to this to about the safety margin at after which the loss will be zero because we\'ve already correctly classify this example.'),(3,'Did the Note 7 week we have this production function tax which cakes in our our example Axe and our weight Matrix W and make some prediction for y in the case of image classification. These will be our 10 numbers. Then we then we\'ll Define some loss function Li which will take in the predicted scores coming out of the function. F together with a true Target or label Y and give us some quantitative value for how bad those predictions are for that training example, and now the final loss L will be the average of these losses some over the entire data set or each of the end examples in our date of that. So this is actually a very general formulation and actually extends even Beyond image classification. I\'m kind of as we move forward and see other tabs others examples of tasks and deep-learning the kind of generic setup. Is that for any task you have some x\'s and y\'s and you want to write down some loss function that quantifies exactly how happy you are with your particular parameter setting.W and then you\'ll eventually search over the space of w to find the W that minimize with the loss on your training data. So as a first exam.'),(4,'So then kind of has a bit of a bit of a cheeser together kind of the way that this image classification pipeline might have looked like maybe about 5 to 10 years ago would be that you would take your image and then compute these different feature representations of your image thing is like bag of words or hits a histogram oriented gradients concatenate a whole bunch of pictures together and then feed the beast feature extractors down into your lane in Tucson linear classifier. I\'m simplifying a little bit. They\'re like the pipelines were a little bit more complex than that. But this is kind of the general intuition and then the idea here it was that after you fed after you extract of these features this feature extractor, it would be kind of a fixed block that would not be updated during training and during training you would only update the linear classifier that\'s working on top of teachers. And actually my I would argue that once we move to convolutional neural networks and deep neural networks and actually doesn\'t look that different will end up the only difference. Is that rather than sort of writing down the features ahead of time.We\'re going to learn the features directly from the data. So we\'ll take our our our our raw pixels and feed them into this convolutional network, which will end up competing for many different. There\'s some type of feature representation driven by the data and that will actually trained this entire wait for this entire network rather than just the weight of linear classifier on top.'),(5,'Last time you started looking at the statement of cash flows and briefly about its cash flows from operating activities section in this video. We will look at all that I just meant that need to be made to compute the company\'s cash flows from operating activities for non-cash expenses expenses related to investing and financing activities as well as cash flows related to current assets and current liabilities.Let\'s start looking at Amazon\'s cash flow from operating activities for 2015 important of these adjustments. The first item is Amazon\'s net income of 0.60 billion dollars for various items the first iPhone on cash expenditures as well as expenditures related to investing and financing activities balance.Cash basis investing and financing expenses will be adjusted for later in the cash flow from investing and financing activities section respectively of the statement of cash flows. The first major adjustment for depreciation and amortization expenses which are non-cash expenses. This means that while they are deducted from revenues when calculating profit this expense has not paid or O2 anyone to net income under stage the amount of cash a company has an expense will have to be added back in full to the net income while making adjustments. These non-cash expenses was 6.28 billion dollars for Amazon salaries all executive an employee salaries are recorded and our sg&a and deducted from revenues not all salaries will be paid in cash. Part of it may include stock-based compensation is recognized as an expense on the income statement. This again is Cash not paid to employees under stage the cash on hand in 2015 Amazon stock based compensation. What\'s 2.12 billion dollars, which is added back and foot. Some of a company\'s operating expenses may not have been in cash. And so again the net income understates how much cash a company has this amount must also be added back in full to the net Amazon statement of cash flows reports this number to be 0.16 billion dollars. A company may earn income from interest and other sources and may also include other types. Of course, none of which are related to its operations. The impact of these items must be removed from the net income Amazon had 0.25 billion dollars in such expenses net of any income as the operations operating income being greater than any non-operating expenses. The number would have to be subtracted from net income as the income net of expenses are not related to operations. The other major adjustment to net income for non-cash expenses is any deferred income taxes should be spending on tax laws not all taxes may be paid off some of it may be difficult to the Future attacks do from revenues under reports how much cash a company has any defer taxes will have to be added to net income Amazon had 0.08 billion in debt for taxes, which is added back to net income on operations related adjustments to Amazon\'s net income include an additional 0.01 billion in losses incurred by Amazon during the sale of marketable Securities and the reduction of 0.1 to billion dollars for excess tax benefits from stock-based compensation. We will not discuss these in detail or 6 to 8 billion dollars for depreciation and amortization 2.12 billion dollars for stock-based compensation 0.16 billion for net operating expenses 0.25 billion dollars for non-operating expenses 0.08 billion for deferred taxes 0.01 billion for losses during the sale of marketable Securities, and finally a -0.12 billion for excess tax been.'),(6,'It\'s from stock-based compensation add up to a positive 8.78 billion dollars. The next set of adjustments is operations related these largely include adjustments due to changes to the firm\'s operations related current assets and current liabilities Amazon din1 trees increase by 2.19. Dollars between 2014 and 2015 how much the company has spent on purchasing raw materials and supplies but this is not recorded on the income statement until the inventory Source tells us how much cash the company has tied up in inventory as a band of the yard and any increase must be deducted from net income between the consecutive years then no inventory-related adjustment is necessary because the company has not invested more cash in inventory decrease the company would have converted into cash and the cash on hand would have increased by the amount of inventory sold. Dickies in inventory must be added to the net income for all other types of operations related current assets. For example, if accounts receivable increases the notes that the company has not received cash for at least some of it since so that revenue and the net income overstate how much cash the company has Amazon saw an increase of 1.76 billion dollars in his account receivable between 2014 and 2015 subtracted from net income on the statement of cash flows operations related current liabilities increase in current liabilities must be added to net income and decreases must be subtracted from net income has that the company still has not paid some of his suppliers for products and services that the supplies already provided. How would the cost of these products and services are subtracted from revenues while calculating net income increases Amazon\'s accounts payable increased by 4.29 billion dollars between 2014 and 2015 and this is added to net income expenses also increase between 2014 and 2015 from revenues on the income statement, but still not pay so these also need to be added to net income on the statement of cash flows Amazon\'s accrued expenses increased by 0.91 billion dollars between 2014 and 2015 may also pay a company in advance Forest products and services revenues on the balance sheet reported on the income statement only when the company delivers its products and services. Additional cash in hand and hand in inglese has an unearned Revenue should also be added to net income Amazon unearned revenues increase by 7.40 billion dollars between 2014 and 2015 and this is added to net income Amazon has an adjustment of -6.11 billion dollars to its net income in 2015 summarize Amazon had the following operations related current assets and current liabilities of 2.19 billion dollars for increase in inventories a deduction of 1.76 billion dollars for increase in accounts receivable an addition of 4.29 billion dollars for increase in accounts payable and addition of 0.91 billion dollars for increasing accrued expenses in addition of 7.40 billion for increase and unearned revenues and finally a deduction of 6.11 billion dollars for amortization of previously unknown revenues. This adds up to a total of 2.54 billion dollars adding this to the net income of 0.60 billion dollars and the early I just went for non-cash expenses and non operations related expenses of 8.78 billion dollars gives Amazon and net cash flow from operating activities of 11.9 to billion dollars during 2015. Next time we will look at the remaining part of the statement of cash flows and reconcile the changes in cash from it with the changes in cash and cash equivalents on the balance sheet.'),(7,'Can we talk about the status of morality that is the status of judgments like genocide is morally abhorrent or polygamy is morally dubious. What are we doing? We make judgments like this and to think about that question. I put for three questions that we can think about first all these judgments the sorts of things that can be true or false are they mere opinion if they are the circle things that can be true or false what makes them true probably if they are true of the objectively true. These three questions are questions about the status of morality a little to do next is to consider three series or broad approaches the flossers of taking these questions for the first three that I want to talk about is objectivism. The basic idea of activism is that our moral judgments are the sorts of things that can be true or false and what makes them true or false are facts that are generally independent of who we are and what cultural groups we belong to their objective moral facts. That\'s the basic idea of secularism.Thinking of you in protective ISM. Let\'s consider again are empirical judgments example the Earth rotates around the Sun this seems to be a judgment about some objective. Matter of fact, it was a x a controversial judgment and an earlier times in human history. People didn\'t even believe it. But now we\'ve come to think that this is the truth about the relative trajectory of the Earth and the Sun its truth is it\'s a true not by who we are our cultures, but about five something independent of us the way the planets rotate. I in the universe that\'s a kind of Paradigm objective judgment. We should recognize that when it comes to Grand scientific theory is like a Tony and physics or darwinian theory of evolution that I should get much more complicated than thinking about opportunity. But Focus just on the single judgement the Earth rotates around the Sun.No, the Earth doesn\'t rotate around the sun reply to happy to say other than strong. We not going to explain why they think that but but there\'s nothing\'s wrong. The different does rotate around the Sun is bright and made right by the relative trajectory of the Earth and the Sun would you think is completely independent of human practice or taste anything like that? So that\'s kind of the Paradigm example of an objective judgment empirical judgment. Isabel feels like the first one we\'ve been considering genocide is morally abhorrent that lead some philosophers to think that moral judgments are just as objective is empirical judgments this seems like the sort of view that is sort of claim that is possible being true or false and another was a possible being true or false that seems to be objectively true that Dennis is more important. If someone\'s not more important. We think they must just be mistaken. It might be able to explain how they got that crazy idea. But but the idea would be wrong genocide is more important. On the other hand, it\'s examples like our second example polygamy is morally dubious that have led some philosophers to question objectivism. I think well, I think polygamy is morally dubious but this is widely practiced in many cultures around the world. Is it not some kind of cultural chauvinism to impose The View that Blake needs more like devious on everybody. Maybe it\'s not objectively true or false that believe me some really devious so that this is the type of thing people away from objectivism subjectivist. They say well we can explain very well how it\'s possible that people disagree about moral matters. There\'s some objective matter fact when one person says it is this other way, then there\'s something there objectively disagreeing about but they have a hard time explaining these kind of cases where we we sometimes think we\'ll maybe if there is an objective matter of fact, I\'m so the two cases genocides morally abhorrent and polygamy is morally dubious. Try to come a good test case on either side of the Ford against objectivism. The second few I want to talk about or approach to the status of morality is called relativism to the basic idea behind relativism is that our moral judgments are indeed the sorts of things that can be true or false, but they\'re only true or false relative to something that varies from person to person or culture to culture. So to get an idea of what the router that has the bar.'),(8,'Consider a non example consider the statement of one must drive in the left. So if the statement said in Britain, it\'s true that said America is false. So it looks like it\'s a sort of statement that can be true or false but it\'s not true or false objectively is not objective facts about which side of the road to drive on there\'s a driving law in Britain that says about a left in Spanish and American which has been on the right and these are two non-overlapping jurisdictions. So you could say the statement when was driving. The left is true relative British driving customs and or law and false relative to American law. That\'s the kind of model that the relatives but also think about the judgments polygamy is morally dubious. What\'s the relative is going to say about this sort of thing that can be true or false, but it\'s not objectively true.It might be true relative to one person or culture and false spell it to another person of culture. What do you think? Do you think polygamy is morally dubious? Consider definition for consider the example of Oedipus sleeping with his mother Jocasta. So I said I thought that was morally bad. Just didn\'t know that that\'s what he was doing are all cases of incest even if the person doesn\'t know. It\'s incest or latavius or morally bad. You might think. Yes, you might think know the road it says this kind of judgment is true or false, but it\'s only true or false relative to something else. Okay, what sort of thing might be relevant to well as another kind of a rough analogy think about the statement Oprah\'s yummy. So I like okra okra is yummy you say okra? Not yummy, of course gross what was going on in these two crimes? Well, you might think the first rappers that mean I\'m just describing my taste something I like and when you said was not got me your outbursts gross you\'re describing your taste. So the first statement is true for me in the second statements true for you. This kind of idea is the idea behind an extreme form.'),(9,'subjectivism the subject to decide to have the basic idea behind subjectivism. Is there a moral judgments are indeed true or false? But they\'re only true or false relative to the subjective feelings of a particular person person who makes them so it\'s almost like when I say X\'s bad I\'m saying I\'m morally disapprove of X. That\'s the subject of this idea the subjects. This has a has nice teachers objectives and that I can\'t explain the way I\'m old arguments are intimately tied up with how we are motivated to act. So if I dislike something I\'ll be motivated to avoid it or I\'m not promoted or if I like something or proving something I\'ll be motivated to promote it or or drawn towards it. I\'m so this objective has that nice explanation of the connection between Morality In Our motivations. Another hand protectionism has a hard time explaining disagreement. So go back to the case of polygamy is more like devious there doesn\'t seem like it\'s merely a description of different people\'s taste when two cultures come into contact one of which practices polygamy in the other one doesn\'t there seems to be a real issue a disagreement between those who think it is morally dubious in those who think it\'s not and a subjectivist has a hard time explaining that this is what leads to the a more aggressive from a proud of them back on cultural relativism good idea behind cultural relativism is that are more judgments are indeed true or false the only true or faults of relative to the culture of the person who makes them so they\'re stuck in like X\'s bad Morley Bad male prong might be thought of his almost like I\'m saying X\'s disapproved of or forbidden by my culture so you could see how One person saying more morally dubious take me true for him because of his culture. It is morally dubious. Where is another person saying polygamy is morally dubious. It\'s fall for him cuz it\'s not morally dubious in his culture. So that\'s the basic idea behind cultural relativism Which is less aggressive or less strong form of relativism. But so subjectivism and culture are both forms of relativism in the basic idea behind relativism. Is that unlike the objective like the objectivist the road of those things are more judgments are the sorts of things that can be true or false but unlike the objectivist the router things to the truth or falsity our moral judgments. It\'s only relative to something that can vary from person to person. The third approach to these questions about the status of morality. I don\'t wanna discuss this called emotivism the basic idea and emotivism is that our moral judgments are not the sorts of things that can be true or false neither objectively true or false. No true or false valor to some person\'s feelings are some culture there that direct expression of our emotive reactions to the world. So to get the basic idea of why somebody might endorse emotivism remember our example of okra, Simon Says okras gross you might think well, they\'re not actually describing their feelings are just expressing their feelings of the Americas think something similar about the example of or moral decadence by generally, but for example, polygamy is morally dubious. So they think what I say polygamy is morally dubious. I\'m expressing my feelings for polygamy. It\'s almost as if I said before polygamy or someone said charity is morally good that they\'re saying hooray for charity. So in these direct expressions of emotion, We\'re not describing some objective matter of fact or describing some feeling or cultural practice. We\'re directly expressing our emotions. That\'s the idea behind emotivism know your motive. It\'s like this objectivist can explain the tight connection between some moral judgments are motivations that action because we\'re often motivated to act based on the baby feel about things but its objectives have a problem of not being able to explain very well disagreements if what I say believe me is morally dubious. It\'s just describing my feelings when you say it\'s not only do this. You\'re just describing your feelings. It\'s not clear that there\'s any disagreement the emotive is also thinks there\'s no factual disagreement. There\'s no belief that we both disagree about but there could be attitudes. We are expressing disagreement attitudes the samoas idea. A person that worried that we all can call moral Darkness true or false. So I say polygamy is morally dubious and you might agree with me by saying what Matthew said was true. Another assistant deny that we do this but they\'ll have to say that this is a loose sentence of true or false and strictly speaking World judgments on the sort of thing that can be true or false because they\'re the direct expression of emotion. That\'s the amount of us. Talk to you. So we\'ve been talking about the status of morality.'),(10,'And pick your three questions. The first question is are our moral judgments of sorts of things that can be true or false or are they mere opinions? The second question is if they aren\'t the sort of things do come true or false what makes them true or false. Another question is if they are true are they objected we true who discuss three views about these questions are about the status of the first of you is objectivism. So the objective says yes, moral judgments of the sorts of things that can be true or false and indeed there objectively true because her May True by objective moral facts by the wrongness of genocide of the goodness of Charity II you have discusses relativism. The ideas that are all the sorts of things that can be true or false are the only true or false relative to something like somebody subjective feelings or some cultural practice.Define would you have discussed is emotivism. The idea behind emotivism is that no are more customers are not the sort some things that can be true or false. There are the direct expressions of our emotions are motor reactions to the baby. Take the world to beat the last of the three views three broad approaches to the status of morality that I wanted to introduce.'),(11,'So this week I wanted to highlight on that. We have several example project ideas as a pin post on Piazza. So we went out and solicited example of project ideas from berries people in the Stanford Community or Affiliated to Stanford and they came up with some interesting suggestions for projects that they might want students in the class to work on. So check out this pin post on Piazza. And if you want to work on any of these projects, then feel free to contact the project managers directly about these things. Additionally we posted office hours on the course website.');
/*!40000 ALTER TABLE `summarize_splittranscript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_video`
--

DROP TABLE IF EXISTS `summarize_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VideoPath` varchar(100) DEFAULT NULL,
  `Name` varchar(400) NOT NULL,
  `UserID_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `summarize_video_UserID_id_2e2e6686_fk_auth_user_id` (`UserID_id`),
  CONSTRAINT `summarize_video_UserID_id_2e2e6686_fk_auth_user_id` FOREIGN KEY (`UserID_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_video`
--

LOCK TABLES `summarize_video` WRITE;
/*!40000 ALTER TABLE `summarize_video` DISABLE KEYS */;
INSERT INTO `summarize_video` VALUES (1,'videos/F5su0B-Ro9B5N-h95S1UEpoQoCMtGSf3NjUcbEefkRzA_pm9_S7V2UFwP4P16bpg-fKgxkpDlnWGbTHUcCW39A.mp4','lr-Scene-005.mp4',2),(2,'videos/cII8N3Rc6JtzD8dqTYeBjwkfX20iNgnz9FlikldK8035rl_zFIy9b4Ak4zI8kYp05MhNdYN2knERtOhYRsvKWg.mp4','Lecture 3 _ Loss Functions and Optimization-h7iBpEHGVNc-Scene-034.mp4',2),(3,'videos/QGZIclCSwJuV3uQl8XCuWnpUT60j7VbUOcYwSFg86LG3CztW3VHyr0zzdm_zJOW8J1pv9H2-7AOv8tYwdC8o0Q.mp4','Lecture 3 _ Loss Functions and Optimization-h7iBpEHGVNc-Scene-030.mp4',2),(4,'videos/kmUwFfcGjvrAbaterQEvkLzQPEeB7ZxPnhuSJXLOsJmRb10Di0o5SmRVJLoUYbt-7wIok5krhEuuntSBom07_Q.mp4','Lecture 3 _ Loss Functions and Optimization-h7iBpEHGVNc-Scene-127.mp4',2),(5,'videos/DWLI9XfQO0VX6u53FMbnpBI_yfIsn6yeRKLgrGhQ4pG-bqNUIAjjuV5JEikqBL0dBqrjXnPTf4UELNJL1ll7SQ.mp4','isb_2.mp4',2),(6,'videos/qSFhc24mSUJsASe2X3cb_ORq65FpVBHa_GGo0c2WVtSusYkn1eIwULEKFq2z7Mo6bG8E6vIkwGz3DdBob-P12A.mp4','philosophy.mp4',2),(7,'videos/4CPhO5GmQQc9BFH7OoS1C1N1b7SGFjFrFCcuEioKKW89ypef2WrqCVD2A5Lvhrg__bmqKKfb0yCOOo_P4F9NMg.mp4','Lecture 3 _ Loss Functions and Optimization-h7iBpEHGVNc-Scene-016.mp4',2);
/*!40000 ALTER TABLE `summarize_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summarize_videosplit`
--

DROP TABLE IF EXISTS `summarize_videosplit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summarize_videosplit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SplitID_id` int NOT NULL,
  `VideoID_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `summarize_videosplit_VideoID_id_SplitID_id_21f6a423_uniq` (`VideoID_id`,`SplitID_id`),
  KEY `summarize_videosplit_SplitID_id_dbbf6e3d_fk_summarize_split_id` (`SplitID_id`),
  CONSTRAINT `summarize_videosplit_SplitID_id_dbbf6e3d_fk_summarize_split_id` FOREIGN KEY (`SplitID_id`) REFERENCES `summarize_split` (`id`),
  CONSTRAINT `summarize_videosplit_VideoID_id_b075740c_fk_summarize_video_id` FOREIGN KEY (`VideoID_id`) REFERENCES `summarize_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summarize_videosplit`
--

LOCK TABLES `summarize_videosplit` WRITE;
/*!40000 ALTER TABLE `summarize_videosplit` DISABLE KEYS */;
INSERT INTO `summarize_videosplit` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,5),(7,7,6),(8,8,6),(9,9,6),(10,10,6),(11,11,7);
/*!40000 ALTER TABLE `summarize_videosplit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27 13:50:32
