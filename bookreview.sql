CREATE DATABASE  IF NOT EXISTS `bookdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bookdb`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: bookdb
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (14,'J.K Rowling','Harry Potter and the Sorcerer\'s Stone','2016-05-12 17:06:34','2016-05-12 17:06:34'),(15,'J.K Rowling','Harry Potter and the Chamber of Secrets','2016-05-12 17:08:11','2016-05-12 17:08:11'),(16,'J.K Rowling','Harry Potter and the Half Blood Prince','2016-05-12 17:13:47','2016-05-12 17:13:47'),(17,'Steven King','The Shining','2016-05-12 17:47:39','2016-05-12 17:47:39'),(18,'Connor Tack','Connor TACK IS KOREAN','2016-05-12 20:54:13','2016-05-12 20:54:13'),(19,'Me','Eddy is Taiwanese','2016-05-12 21:03:07','2016-05-12 21:03:07'),(20,'Connor','mysql is really dumb','2016-05-12 21:24:00','2016-05-12 21:24:00'),(21,'James Chi','SARANG!','2016-05-17 11:38:07','2016-05-17 11:38:07'),(22,'Kyle Tsuyemura','Coding Dojo','2016-05-17 12:11:47','2016-05-17 12:11:47');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `review` text,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_users_idx` (`user_id`),
  KEY `fk_reviews_books1_idx` (`book_id`),
  CONSTRAINT `fk_reviews_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,6,15,5,'2016-05-12 17:08:11','2016-05-12 17:08:11','EVEN BETTER!'),(4,6,16,5,'2016-05-12 17:13:47','2016-05-12 17:13:47','SO GOOD'),(5,6,17,4,'2016-05-12 17:47:39','2016-05-12 17:47:39','HELLA SCARY'),(6,6,14,4,'2016-05-12 18:30:23','2016-05-12 18:30:23','pretty good'),(7,6,14,4,'2016-05-12 18:39:53','2016-05-12 18:39:53','pretty good'),(8,6,14,4,'2016-05-12 18:42:24','2016-05-12 18:42:24','pretty good'),(9,6,14,4,'2016-05-12 18:44:06','2016-05-12 18:44:06','pretty good'),(10,6,14,4,'2016-05-12 18:45:55','2016-05-12 18:45:55','pretty good'),(11,6,15,4,'2016-05-12 20:17:25','2016-05-12 20:17:25','It was pretty good!'),(12,6,15,3,'2016-05-12 20:17:32','2016-05-12 20:17:32','Not that great though'),(13,7,18,5,'2016-05-12 20:54:13','2016-05-12 20:54:13','Cool guy'),(14,6,18,5,'2016-05-12 21:01:59','2016-05-12 21:01:59','Yeah he\'s pretty korean'),(15,6,19,4,'2016-05-12 21:03:07','2016-05-12 21:03:07','yeah...'),(16,6,20,4,'2016-05-12 21:24:00','2016-05-12 21:24:00','I agree too'),(17,8,20,2,'2016-05-17 11:28:42','2016-05-17 11:28:42','What\'s Mysql?'),(18,8,18,3,'2016-05-17 11:35:05','2016-05-17 11:35:05','I\'m korean too!'),(19,8,21,5,'2016-05-17 11:38:07','2016-05-17 11:38:07','Best book(song)'),(20,6,22,5,'2016-05-17 12:11:47','2016-05-17 12:11:47','Great book about learning web development');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'Kyle Tsuyemura','Satoru','kt.fremont@gmail.com','$2b$12$wgr4d41mb4FZMLOLpDmPrOCCeOrbJHuwOdnJ3dORY0bSuZ65ysinW','2016-05-12 16:51:24','2016-05-12 16:51:24'),(7,'David Lee','lordhentai','dlee@gmail.com','$2b$12$82v1ekYlxsT6vlDuTBgU/eY3NxlUiGWwG/EHkqo75ETagqOtcfT0O','2016-05-12 20:53:31','2016-05-12 20:53:31'),(8,'James','Chi','jchi@gmail.com','$2b$12$xOz0qmT//w4.zvHGsEbrS.jm9IEksWwxXAs3BCCZzB150G8XC35Uy','2016-05-17 11:28:28','2016-05-17 11:28:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-18 19:29:26
