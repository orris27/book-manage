-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: bookmanage
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add book',7,'add_book'),(20,'Can change book',7,'change_book'),(21,'Can delete book',7,'delete_book'),(22,'Can add borrow record',8,'add_borrowrecord'),(23,'Can change borrow record',8,'change_borrowrecord'),(24,'Can delete borrow record',8,'delete_borrowrecord'),(25,'Can add card',9,'add_card'),(26,'Can change card',9,'change_card'),(27,'Can delete card',9,'delete_card'),(28,'Can add manager',10,'add_manager'),(29,'Can change manager',10,'change_manager'),(30,'Can delete manager',10,'delete_manager');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$bhmeCtQRdMlO$bC9v5Bp+oDDzhOtw1j1eH02xfu5n7Bi3hDx6BxwW0zw=','2018-04-19 07:30:18.942882',1,'orris','','','orris@gmail.com',1,1,'2018-04-19 07:30:03.761492');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(10) NOT NULL,
  `title` varchar(40) NOT NULL,
  `press` varchar(30) NOT NULL,
  `year` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `total` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'心理学','新的世界','浙江大学',2002,'高云鹏',48.00,20,2),(2,'物理学','物理世界','浙江大学',2012,'高晓明',56.00,50,26),(9,'物理学','时间简史','复旦大学',2016,'陈小春',20.00,30,2),(10,'数学','线性代数','上海交通大学',2013,'李云龙',48.00,20,0),(11,'化学','化学趣味故事','复旦大学',2018,'张三',50.00,70,0),(12,'科学','走进科学','某出版社',2001,'小龙',20.00,50,50),(13,'科学','走进科学2','某出版社',2001,'小龙',12.00,12,12),(14,'化学2','化学趣味故事','复旦大学',2018,'张三',50.00,70,0),(15,'化学3','化学趣味故事','复旦大学',2018,'张三',50.00,70,0),(16,'化学4','化学趣味故事','复旦大学',2018,'张三',50.00,70,1),(18,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(19,'食物学','美食家的自传','斯科特出版社',1998,'斯科特',50.00,12,12),(20,'科学','走进美事','浙江大学出版社',2012,'小李',12.00,50,50),(21,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(22,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(23,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(24,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(25,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(26,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(27,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(28,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(29,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(30,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(31,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(32,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(33,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(34,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(35,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(36,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(37,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(38,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(39,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(40,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(41,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(42,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(43,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(44,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(45,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(46,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(47,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(48,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(49,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(50,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(51,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(52,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(53,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(54,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(55,'化学5','化学趣味故事','复旦大学',2018,'张三',50.00,70,70),(56,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(57,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(58,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(59,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(60,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(61,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(62,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(63,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(64,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(65,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(66,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(67,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(68,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(69,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(70,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(71,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(72,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(73,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(74,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(75,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(76,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(77,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(78,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(79,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(80,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(81,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(82,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(83,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(84,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(85,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(86,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(87,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(88,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(89,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(90,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(91,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(92,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(93,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(94,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(95,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(96,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(97,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(98,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(99,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(100,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(101,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(102,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(103,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(104,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(105,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(106,'数学','数值分析','浙江大学',2018,'张三',30.00,30,30),(107,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(108,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(109,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(110,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(111,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(112,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(113,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(114,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(115,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(116,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(117,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(118,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(119,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(120,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(121,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(122,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(123,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(124,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(125,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(126,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(127,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(128,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(129,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(130,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(131,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(132,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(133,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(134,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(135,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(136,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(137,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(138,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(139,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(140,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(141,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(142,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(143,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(144,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(145,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(146,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(147,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(148,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(149,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(150,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(151,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(152,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(153,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(154,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(155,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(156,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(157,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(158,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(159,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(160,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(161,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(162,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(163,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(164,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(165,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(166,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(167,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(168,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(169,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(170,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(171,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(172,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(173,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(174,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(175,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(176,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(177,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(178,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(179,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(180,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(181,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(182,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(183,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(184,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(185,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(186,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(187,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(188,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(189,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(190,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(191,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(192,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(193,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(194,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(195,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(196,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(197,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(198,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(199,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(200,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(201,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(202,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(203,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(204,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(205,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(206,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(207,'学','数值分析','浙江大学',2018,'张三',30.00,30,30),(208,'算法','数据结构基础','机械工业出版社',1997,'xxx',49.00,20,19);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowrecord`
--

DROP TABLE IF EXISTS `borrowrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrow_date` date NOT NULL,
  `return_date` date NOT NULL,
  `book_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `return_manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowrecord_book_id_57e95553_fk_book_id` (`book_id`),
  KEY `borrowrecord_card_id_a5fe0524_fk_card_id` (`card_id`),
  KEY `borrowrecord_return_manager_id_e4782e83_fk_manager_id` (`return_manager_id`),
  CONSTRAINT `borrowrecord_book_id_57e95553_fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `borrowrecord_card_id_a5fe0524_fk_card_id` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`),
  CONSTRAINT `borrowrecord_return_manager_id_e4782e83_fk_manager_id` FOREIGN KEY (`return_manager_id`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowrecord`
--

LOCK TABLES `borrowrecord` WRITE;
/*!40000 ALTER TABLE `borrowrecord` DISABLE KEYS */;
INSERT INTO `borrowrecord` VALUES (22,'2018-04-27','2018-05-27',1,2,1),(24,'2018-05-05','2018-06-05',2,1,1),(26,'2018-05-05','2018-06-05',10,1,1),(27,'2018-05-05','2018-06-05',11,1,1),(31,'2018-05-05','2018-06-05',2,2,1),(32,'2018-05-05','2018-06-05',9,2,1),(34,'2018-05-09','2018-06-09',1,3,1),(35,'2019-03-29','2019-04-29',208,1,1);
/*!40000 ALTER TABLE `borrowrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `department` varchar(40) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'小明','物理学院',0),(2,'小王','数学学院',0),(3,'小红','数学学院',0),(4,'小张','软件学院',0);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-19 07:30:56.434732','1','1',1,'[{\"added\": {}}]',9,1),(2,'2018-04-19 07:44:55.081271','1','1',1,'[{\"added\": {}}]',10,1),(3,'2018-04-19 07:59:51.540970','1','1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',10,1),(4,'2018-04-19 08:26:45.514884','1','1',1,'[{\"added\": {}}]',8,1),(5,'2018-04-19 09:00:28.169853','2','2',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'bookmanage','book'),(8,'bookmanage','borrowrecord'),(9,'bookmanage','card'),(10,'bookmanage','manager'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-19 07:21:12.570981'),(2,'auth','0001_initial','2018-04-19 07:21:19.176805'),(3,'admin','0001_initial','2018-04-19 07:21:20.720537'),(4,'admin','0002_logentry_remove_auto_add','2018-04-19 07:21:20.759838'),(5,'contenttypes','0002_remove_content_type_name','2018-04-19 07:21:21.734882'),(6,'auth','0002_alter_permission_name_max_length','2018-04-19 07:21:22.297405'),(7,'auth','0003_alter_user_email_max_length','2018-04-19 07:21:22.901414'),(8,'auth','0004_alter_user_username_opts','2018-04-19 07:21:22.941843'),(9,'auth','0005_alter_user_last_login_null','2018-04-19 07:21:23.339315'),(10,'auth','0006_require_contenttypes_0002','2018-04-19 07:21:23.364149'),(11,'auth','0007_alter_validators_add_error_messages','2018-04-19 07:21:23.395615'),(12,'auth','0008_alter_user_username_max_length','2018-04-19 07:21:24.740627'),(13,'auth','0009_alter_user_last_name_max_length','2018-04-19 07:21:25.344519'),(14,'bookmanage','0001_initial','2018-04-19 07:21:28.769613'),(15,'sessions','0001_initial','2018-04-19 07:21:29.214080');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0sf1ouiqg6nlryrco2bd19ps9ngwzbqh','N2ZiZjhlOWNhOGVkYWYzMjAyYjgyZDZjMDgzMTFmN2M2Y2ZhNWEzMjp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJtYW5hZ2VyX3N0YXRlIjoxfQ==','2018-05-23 09:40:33.576435'),('2u15uwdl9rledvt49tzu96txdca5tabd','OTk3Mjg0MDQ2ZGQ0Njc3MDY1NWVlZmFiYTVmOGM3ZDA0OGU5MDIxMzp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJjYXJkX25hbWUiOiJcdTVjMGZcdTY2MGUifQ==','2018-05-27 15:34:50.242528'),('4wx8cp9lofzb4sw424461m9lqs18eken','N2M3ZDM3OWQyNDc0MWNlZjEzY2M0N2ZhZjdjMmIyODRmN2RkMzBlZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-04-12 05:19:25.237229'),('51xnvutpx7pii6u6t6ch3wth9ueraah5','N2ZiZjhlOWNhOGVkYWYzMjAyYjgyZDZjMDgzMTFmN2M2Y2ZhNWEzMjp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJtYW5hZ2VyX3N0YXRlIjoxfQ==','2018-05-18 11:05:45.325196'),('8mdqy2hhorj65j17hal6w8mo5kr2ankt','N2M3ZDM3OWQyNDc0MWNlZjEzY2M0N2ZhZjdjMmIyODRmN2RkMzBlZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2018-05-19 09:26:17.121748'),('9stacw4k57271gkioh9jtgq5j2q6cbip','ZGVhOTgwZjVjZDYxYThkNjJjMWQ0N2ZlMGFlOTM1NTI5OGRiYzA3MDp7ImNhcmRfaWQiOiIyIn0=','2018-05-11 10:51:32.580122'),('9u621mo38z532aur12p1wjc6djbd6n1q','MmNiMWRjZWNiMDZlNDNkNTNiNTcwZTdiMmQ4ZmRhMTNmY2E3MzljNjp7ImNhcmRfaWQiOiIxIiwibWFuYWdlcl9pZCI6IjEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2018-05-04 07:19:58.662986'),('ae43go94vzropv6l9mejv7eoczix2mks','N2M3ZDM3OWQyNDc0MWNlZjEzY2M0N2ZhZjdjMmIyODRmN2RkMzBlZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2018-05-18 12:08:20.078437'),('agkdkw5kbuq9olcit9x586yr2yq7tf5h','ZTRlMmNjZTgzYWJkZGJkOTM2ZTg5ZGYxMWY3MzEyYzczZTZlMTMwZTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwibWFuYWdlcl9pZCI6IjEiLCJjYXJkX2lkIjoiMiJ9','2018-05-03 16:20:40.415433'),('cpowcagqmbyj81aa4w6bp9e31ovo9ma2','MmNiMWRjZWNiMDZlNDNkNTNiNTcwZTdiMmQ4ZmRhMTNmY2E3MzljNjp7ImNhcmRfaWQiOiIxIiwibWFuYWdlcl9pZCI6IjEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2018-05-17 15:30:54.276631'),('d1r0l5mxrdwsr9w78cfs6usnlf98fgg1','MDMyOTE5NjQzZjBiMGNjMDEyMTZjYTQ1ODliZTBjZGIyOWM3NjYyYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzN2Y2OTYwYTdmMWU5ZmZkNmU1YjNlYmViNWJjZGE4NjBkZWIyZTExIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJjYXJkX2lkIjoiMSIsIm1hbmFnZXJfaWQiOiIxIn0=','2018-05-03 09:13:20.304832'),('doudbip7wjkh23unhmzbquh15v9kwvqm','N2M3ZDM3OWQyNDc0MWNlZjEzY2M0N2ZhZjdjMmIyODRmN2RkMzBlZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-04-12 05:25:47.458569'),('dvpi07ptyux2nbfboyvuye0onr2495ym','NTA3OWFhMmFkZTI2NGUxZjY1NmJjNDYwODYwNzY1ODE0NWNlMDdjMTp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJjYXJkX25hbWUiOiIxMjMifQ==','2018-05-18 16:32:39.465456'),('fshqbcfeelcpryfrnx2zr2goa0r17g25','MWU2MTBkNTFjNTJjODM3NzhiZjc5OTIxNTFkZTM1MTMwZDI1ZWYyMDp7Im1hbmFnZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJtYW5hZ2VyX25hbWUiOiJhZG1pbiIsInN0YXRlIjoxLCJtYW5hZ2VyX3N0YXRlIjoxfQ==','2018-05-18 09:28:11.038839'),('lhzi0ppa7ncir7llxe85uo5klfz6vj27','OTk3Mjg0MDQ2ZGQ0Njc3MDY1NWVlZmFiYTVmOGM3ZDA0OGU5MDIxMzp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJjYXJkX25hbWUiOiJcdTVjMGZcdTY2MGUifQ==','2018-05-23 08:49:02.243269'),('m7vt8fa433656zt18krnkaarpwdsqcxu','MTRkOGVkNjU3ZjFhMmEwMDliYjMyOTFjYTU5M2NiNGVlYmU5YmU5ZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJjYXJkX25hbWUiOiJcdTVjMGZcdTczOGIifQ==','2018-05-19 01:46:06.014688'),('mbpngqajx3t41nkib36b2cqhjt9bnql1','N2M3ZDM3OWQyNDc0MWNlZjEzY2M0N2ZhZjdjMmIyODRmN2RkMzBlZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-04-12 05:19:25.490055'),('o8r12o9qb5foewbkafnswt7m09f44u5l','N2M3ZDM3OWQyNDc0MWNlZjEzY2M0N2ZhZjdjMmIyODRmN2RkMzBlZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-01-14 05:22:22.875311'),('okmfth37itdcjjfkvkk8pxehtydpibgd','ZTExZmFjNTdlMzY1YTI5MTU5ZDFiNWViODczYzU4ODAyY2U4NmJjMDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJtYW5hZ2VyX3N0YXRlIjoxLCJjYXJkX25hbWUiOiJcdTVjMGZcdTY2MGUifQ==','2018-05-23 03:23:20.251508'),('v6wjlfypnm2rr0dxivf3fnvmny7kvd0m','N2M3ZDM3OWQyNDc0MWNlZjEzY2M0N2ZhZjdjMmIyODRmN2RkMzBlZDp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2018-05-26 04:59:25.347091'),('y9170d1sgb9rf8w1qu6p01fdgn53vn7n','OTk3Mjg0MDQ2ZGQ0Njc3MDY1NWVlZmFiYTVmOGM3ZDA0OGU5MDIxMzp7Im1hbmFnZXJfbmFtZSI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJjYXJkX25hbWUiOiJcdTVjMGZcdTY2MGUifQ==','2019-04-12 05:36:01.695691');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `contact` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'40bd001563085fc35165329ea1ff5c5ecbdbbeef','李明','123456'),(2,'7110eda4d09e062aa5e4a390b0a572ac0d2c0220','小红','888888'),(3,'7c4a8d09ca3762af61e59520943dc26494f8941b','123','111111111'),(7,'7c222fb2927d828af22f592134e8932480637c0d','admin1','1233123'),(8,'7c222fb2927d828af22f592134e8932480637c0d','admin','12345678');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-28 14:24:47
