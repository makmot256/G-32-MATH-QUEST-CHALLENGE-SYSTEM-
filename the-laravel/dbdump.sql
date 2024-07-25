-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: math_quest
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `school_registration_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `image` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicants`
--

LOCK TABLES `applicants` WRITE;
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` VALUES (7,'Test8','test8','test8','921275','mwesigwajojo@gmail.com','2024-01-01','2024-07-08 07:40:21','2024-07-08 07:40:21','test8',NULL),(9,'Test10','test10','test10','921275','test10@gmail.com','2023-01-09','2024-07-10 12:11:37','2024-07-10 12:11:37','test10',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\r   4,$&1\'%2%1+-00/#+383.7)-.+\n\n\n\r+7+++77-/++77/1--73//+-5+-7+7-777++377-+3++++731-07��\0\0�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0>\0\0\0\0\0\0!1A\"Qaq��2B��#Rs�\�\�3C�\�$DScr��\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\0+\0\0\0\0\0\0\0\0!1AQ\"24aq��\�3��\�\0\0\0?\0\�\n�����\"����\"��\0���\"�\0���\"\"\0���� \n���������\0��\" ZN�\�|6\03\�\r/v�\��\�:\�\�l\�`\�\�]q�5<����S9\�\\�\\\�q,\�\�	cN��>\�\�\��\�ui �@\0i\�\��qy\�d\�\�V\�}O�J`\r&�g���\�yg�ldN#R�X \�k��\���\�3\�\�Fƻ��=�s\�>�@\�#w�q{n	!za�l�ە4��o�\�x�\�:F\�1�\�$\�w�\�\�R\�\�gF\�7{%��=�\�\�5\��1z\�\�\�c\\*\�vw?\��>\�A-����KN\�!\0DD�\0(�D@\0Z>�\�e�I1�\�*6�Z\�xx���\\\�T\�\�\�?�@\�\�dK��\��׺W1�s�\�A~�mZo�{W�i\�\�\�{�dK��7\�4�0\r�\�4\�� ���\�;�B��\0$	-=\�v*{\�ׂn\�o\�gar�\�?\�D\�\Z\�v/oUIPo�K�o�Z�˵\�\�\r\�Z\�\��@,��tl��\�\�j�Qh�5fn��0\�kO�~j�,>K��\"M$.�\�\r�\�\�����\�\�ѧ\�l�n��\�+)��S�5�\�\�e��\\\nu\�\�\�h�\�4֙\�O�\\\�lNI���\�7�����\�pob9\��\�\�]qK�\�\�$��R\�!C\0��@�B�\" ��/���\�\�\�k?}�{N�\�辌\\Gێ	\��|\'ִ\�\�\�\�R�\�Y%׸�#s\�YnQ\r�\�l�e�/Cʘt�\�}\09\'�*�\'\�4\�9$I\����M\0\�vR�>\�\�j0N޸[�<�\�+�������_f�\�1p\r\�-��ab\�{ZJ*�bݑ,\�-c��\��\�6ΰ7�㛭\�\���q�	Q\\\�\0fi�\�\�+\��]{�\Z�o\�\�{5{Fe�q�ш�s[\�\�\n���\�ә\�XG�S⾟]\�<����\"\"\0� �\0��\" \n+\�\')��m�|m2�\�\�\�R��\�S\�¿Cl�\�n\�- ٥\rҲRm\�>f\�p�Y���O�\�]7	�hc\0�YnT�s\�\�.tg�n\�i�E@&\�zYfi\��Ղ.-\�g���h\\$�̞J\�\�z�\�8��\ZKTF|IdO�°\�kd.\�٭�<,���Y�8�dl2���l8 �Y\�\ZQ��\�mʛ\'\�\�Ʀ����ͳ8���j\���\�\�\0�H�V6a���:�Sn\��ʪ�z����0&\�W\�\�\�\�^\���U\�Hl��\�o��+9�_��p�\���/ކ\�ֈ\�\�\�\�\Zg�΍\�\�4?Lo�5y%�H�$\�\�^&A�\�\�p:���B\�\�y�\�׷\�\�Wn?�l�%g\�q�WVɇ��[W\�\�\�Ke;tr\��\�3�\\\�\"\"\0� �D@\0Z΢�V\�\�G\�l\�>:y\��-\�\�\�Q%h�]4\�_�e\�90Қ�#\�9�KJ�\�\��O	\�X�4\�׍��\"\�DR\��\�t�\'�ї\�˰`\�\��4U\�S\���6�� ��\�ce��EL�x��\�9$k�\�a\�a�\�ߒ�΋LĴ\�\�\�J2|0\��Z\�\�PS��β<��M7FC�s\���X\�\���\�\�\�\�\�-k\�\'�8\�K�\�[^ƿ.Ķ�/\��\Z>$E\�\��\0\�ڼo%\�0Q\�H�Tequ�\��]i��\���~I^�H��d\0@��Q\0DDD@@}�\�\��$\�G��6g���#\�960(�k�\�0\�7\�\�ms\�B\�0\���H���\�Q\"\�IB֍a��έ�Ā\�>K]�cc2i#� �~8K�s�w�>��:A�\'H]\�?`>�0���\�z%�_R\��_Cb(�O�g\�9\�Ν�~}\��&\�u\n/bcr��\��ms�5��EN\�`sh\�k\\\�n�\�Ӎ>��\�\�\�$h\�m\�\Z����Y�M�\0M܆ۈT\�ݪ!\�ӴH��6c,�l�^��k\�uE\���`4`�9)\�.��a����\�p�n\�\"!DD(�\"\"\0�Q\0DD�r\�>�C�8�\�\�侅\�\��\�\�[Y�\�s�gk\�\�\�$\"�)�4i�i�Ar\�\�H\�\r\�\�D�\�y{�<--> 7\\��|R�\�\�\'��\�\�P{�\Z\�g\�P��\�%q-�\'��O���Gq\�\�v 5\�\�,�f�\�Q�6>u>�c\�+\�>�N\�ek֠\r+XΫ\�1�G\�\�e�R�#u�{f��q�\�\�B�\�4�s�\�/;ͽ\��b\�����\�͉\\6�#\�Z�zq�Ʉߩ:\\�\0�\�\�<�-lo�s\�$�<>�2�0N\�ޣ\�I�-[H�\"!!DD(D@Q&?1�r�7\�w?%\�z\�α\0\�\�\�uj?\0�&\�l�V<+\�{&X\�|P��\�C��\�z\�6\�-��.\��K��Kqs���^\�\�X틟A_�1�s\�\�{�\�i^=\�9��\�\�n\�ϲ\�w\�\�c�@[<,u\�\�\�N��\�R锽\�\�\�,�H\� ]P>J��\�<�\�\�:�p]�l0sH��\�#$��\Z�\�\n��x\��q)mrs3�uWn\rr�>b@\'�(Z\�x.�\�:\�I�7\0\�ꃥ\�\�\�^{en\�\�\�`� yVI\�\�ZD`\��\�`�\��E��V\Z\0YX\�\�H\�\\�r�3�%��6swi\�>��\Z\�ko\0?\�\�d0�\�q{�ޙ�)_\�\���Ln��:N]\�pK�\�\'z\�ߪ\�\�#\\-�؂\\OS�\�ן�\�e�\�НQ��w��\�-%��v|dG_E\�:\�7\�f\�\�o\�9\nS�\�G(\�\�ǡf\�\�.�Uqe\��A�TU*?\�������s����Z�+f9\�G\�{̺�	-\�dx4Z�t~<(\�e\�\�>\�lC�\�z�K,���\�?E��\����Y\�\�&�\�Oq6w.$�\�\�lxh\���\"M-ۓ�Yyl:X\\y+D�6Sol\�py��M�_�V\�?�e\�5Y�N�w�o\�\�`p\�Rҳ\�\�2\�I�\�݇��ǩ�\�+\\�\�\�\�t�p�\�ͦ\�+\�3�o\�;I:\�m��ڲ\\�\�漷�3\�c�3JQv��q�/��/b\rv��D\Z��E�=\�Q\�k1�kxZ���\�R@�Z�S)\�\���\�E\'K��3C�\�\"\�-�8\�\���]��,\�L�l�� \�_?N\'�\��S\�s��{\�^\"~�Q��W\�4\�\�*�\�8\�\�a\�\�S\�\Zn���N,4�ds~���x^6\�[-1:�a\�CD\�r�ӦL2��p�\��~\�6w\�)�[�ňg��ڛtv6�\\rX(�8+�{;ma���\��\0��\�\Z=\�\�\�\�\�?N[7��0Cy熏2�X�\�\�9\�6O*S\�\'\�,�\'\�T1�X\ZWĵg/w\�\'�\�\�&�\�\�V$\�\�\�\�X��K�\�A�A>+F�!lֵ�\��[�V�5\�{�4�e\�R\���-\�u,0\�\�\�\�\�櫴���\�\�S��D6\�Y\�/\�\�\�\�&�`_\�O�Rb�\�\�\�5\�qb�\�|��4f�\\ʠ\�@\�\�\�E\�t\�\\\�Ip�(j�Օ^�\�\�8�l��pk\�\������\�v\n\�x`M/RŤ\�6��gO�u`\�\�_D�o�\0�\�8�;4h\��\��\���J��p/\��\0�\��\�V\�Z���\�\\\��#\�\�k&u_\�Y�e\�>V��c\�8s\�9�}\�lԛu�r4�Y\�Y\� Ǆ�/	\�&�\�\"동�����|l\r�K��MU˱�\�E��l\�:v�\�;9iF�\�~&<��y�\�g��\�)\��n�t\�\�\�a;q��\�\�fc\�d�_\�V��\�]~Kч�i����/D2�x�\0\�&�Qf�dU\Z\�M�7��\0�AVkG�\��\�N�5?��9@\�q\�G,~\�?��\0%9\�QE�q�9C�1\�H�\0S}\�1��w_\�?\�	nb��bR��\�y\�\�ڏu�\�\\��6j������\�\�һ<\�7	&n3L�\�7i\�\�ե\�\����`��^��{[Mw�D\��r��&\�kQz:z\���\�\�h��%�A ��32\�6B\��2�\�{\r_\�c��Z\��QΦ\�\\}�r ��@ݒ\�BA\\x\'{�/���%ca�h$\��+۞\�u�����]\�i�+\�\�$�\0\�ߚ�\��IbS�z1�)\�\�/\Z\�U�yj�e��V���R\r�y���[\�؈\�\�\��\�kc[���\0�\�ٔ�-��F�\�\�\�\�\�aυ\�C�\�\�\�\\9W��>F��,,ixw�\r[�\�\�\�\�\�yr�#*\�c��\��\��\0�).]�ik�2}\�\n�\�\�\���ʄ���L`�͕�\�\�\�\�\�M��\�\n�[�(\�R���\�\�~�1\�\�\�\���2\�O�ý�\�~ComB���c\\$Z�د\���\�H�\0�$ !AD�-\�ޟ\��\�');
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_questions`
--

DROP TABLE IF EXISTS `challenge_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `challenge_questions_ibfk_1` (`question_id`),
  KEY `challenge_questions_ibfk_2` (`challenge_id`),
  CONSTRAINT `challenge_questions_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `challenge_questions_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_questions`
--

LOCK TABLES `challenge_questions` WRITE;
/*!40000 ALTER TABLE `challenge_questions` DISABLE KEYS */;
INSERT INTO `challenge_questions` VALUES (5,1,929),(6,1,946),(7,1,892),(8,1,907),(9,1,908),(10,2,876),(11,2,859),(12,2,18),(13,2,906),(14,2,938),(15,3,852),(16,3,899),(17,3,876),(18,3,882),(19,3,877),(20,4,875),(21,4,908),(22,4,932),(23,4,885),(24,4,900),(25,5,944),(26,5,916),(27,5,852),(28,5,3),(29,5,928),(30,6,912),(31,6,1),(32,6,899),(33,6,866),(34,6,860),(35,7,18),(36,7,15),(37,7,1),(38,7,891),(39,7,927),(40,8,888),(41,8,856),(42,8,932),(43,8,880),(44,8,866),(45,9,873),(46,9,896),(47,9,20),(48,9,868),(49,9,897),(50,10,926),(51,10,890),(52,10,884),(53,10,865),(54,10,876);
/*!40000 ALTER TABLE `challenge_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `duration` int NOT NULL,
  `num_questions` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (1,'Challenge 5','2024-07-03','2024-08-17',92,5,'Description for Challenge 5','2024-08-03 12:28:31','2024-07-25 06:17:30'),(2,'Challenge 4','2024-07-03','2024-08-17',69,5,'Description for Challenge 4','2022-07-03 12:28:31','2024-07-25 06:16:06'),(3,'Challenge 3','2024-07-03','2024-08-17',91,5,'Description for Challenge 3','2024-09-03 12:28:31','2024-07-25 06:17:30'),(4,'Challenge 2','2024-07-03','2024-08-17',131,5,'Description for Challenge 2','2022-07-03 12:28:31','2024-07-25 06:16:01'),(5,'Challenge 1','2024-07-03','2024-08-17',86,5,'Description for Challenge 1','2024-07-03 12:28:31','2024-07-24 07:25:56'),(6,'Challenge 15','2024-07-03','2024-08-17',68,5,'Description for Challenge 15','2024-07-05 12:28:31','2024-07-25 06:17:30'),(7,'Challenge 14','2024-07-03','2024-08-17',130,5,'Description for Challenge 14','2023-07-03 12:28:31','2024-07-25 06:15:57'),(8,'Challenge 13','2024-07-03','2024-08-17',144,5,'Description for Challenge 13','2024-07-05 12:28:31','2024-07-25 06:17:30'),(9,'Challenge 12','2024-07-03','2024-08-17',111,5,'Description for Challenge 12','2023-07-03 12:28:31','2024-07-25 06:15:52'),(10,'Challenge 11','2024-07-03','2024-08-17',73,5,'Description for Challenge 11','2022-09-03 12:28:31','2024-07-25 06:17:31');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_attempts`
--

DROP TABLE IF EXISTS `participant_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_attempts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `participant_id` int NOT NULL,
  `challenge_id` int NOT NULL,
  `question_id` int NOT NULL,
  `attempt_number` int NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `score` int NOT NULL,
  `time_taken` int NOT NULL,
  `attempt_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `participant_id` (`participant_id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `participant_attempts_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`),
  CONSTRAINT `participant_attempts_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`),
  CONSTRAINT `participant_attempts_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_attempts`
--

LOCK TABLES `participant_attempts` WRITE;
/*!40000 ALTER TABLE `participant_attempts` DISABLE KEYS */;
INSERT INTO `participant_attempts` VALUES (33,18,1,2,1,1,4,4300,'2023-07-08 12:15:03','2024-07-08 12:15:03','2024-07-25 06:41:31'),(34,18,1,1,1,1,10,8576,'2024-07-08 12:15:07','2024-07-08 12:15:07','2024-07-08 12:15:07'),(35,20,1,2,1,0,4,7157,'2023-07-19 13:23:58','2024-07-19 13:23:58','2024-07-25 06:41:31'),(36,20,1,1,1,1,10,11640,'2024-07-19 13:24:03','2024-07-19 13:24:03','2024-07-19 13:24:03'),(42,20,9,873,1,1,2,2888,'2024-07-24 07:44:20','2024-07-24 07:44:20','2024-07-24 07:44:20'),(43,20,9,897,1,1,2,10098,'2022-07-24 07:44:27','2024-07-24 07:44:27','2024-07-25 06:41:32'),(44,20,9,20,1,0,6,16257,'2024-07-24 07:44:33','2024-07-24 07:44:33','2024-07-24 07:44:33'),(45,20,9,896,1,1,2,22055,'2024-07-24 07:44:39','2024-07-24 07:44:39','2024-07-24 07:44:39'),(46,20,9,868,1,1,2,26414,'2022-07-24 07:44:43','2024-07-24 07:44:43','2024-07-25 06:41:32'),(47,21,10,865,1,1,2,4093,'2024-07-25 09:11:52','2024-07-25 09:11:52','2024-07-25 09:11:52'),(48,21,10,890,1,1,2,7999,'2024-07-25 09:11:56','2024-07-25 09:11:56','2024-07-25 09:11:56'),(49,21,10,926,1,0,2,11592,'2024-07-25 09:11:59','2024-07-25 09:11:59','2024-07-25 09:11:59'),(50,21,10,884,1,0,2,17585,'2024-07-25 09:12:05','2024-07-25 09:12:05','2024-07-25 09:12:05'),(51,21,10,876,1,1,2,23806,'2024-07-25 09:12:12','2024-07-25 09:12:12','2024-07-25 09:12:12'),(52,21,9,868,1,1,2,3678,'2024-07-25 09:15:25','2024-07-25 09:15:25','2024-07-25 09:15:25'),(53,21,9,20,1,1,6,9281,'2024-07-25 09:15:31','2024-07-25 09:15:31','2024-07-25 09:15:31'),(54,21,9,896,1,0,2,17765,'2024-07-25 09:15:39','2024-07-25 09:15:39','2024-07-25 09:15:39'),(55,21,9,873,1,1,2,20339,'2024-07-25 09:15:42','2024-07-25 09:15:42','2024-07-25 09:15:42'),(56,21,9,897,1,0,2,26249,'2024-07-25 09:15:48','2024-07-25 09:15:48','2024-07-25 09:15:48'),(57,21,8,866,1,0,2,14649,'2024-07-25 09:21:24','2024-07-25 09:21:24','2024-07-25 09:21:24'),(58,21,8,880,1,0,2,128290,'2024-07-25 09:23:18','2024-07-25 09:23:18','2024-07-25 09:23:18'),(59,21,8,856,3,1,2,2314,'2024-07-25 09:24:25','2024-07-25 09:24:25','2024-07-25 09:24:25'),(60,21,8,932,3,0,2,8750,'2024-07-25 09:24:32','2024-07-25 09:24:32','2024-07-25 09:24:32'),(61,21,8,866,3,1,2,12413,'2024-07-25 09:24:35','2024-07-25 09:24:35','2024-07-25 09:24:35'),(62,21,8,880,3,1,2,14515,'2024-07-25 09:24:38','2024-07-25 09:24:38','2024-07-25 09:24:38'),(63,21,8,888,3,1,2,19247,'2024-07-25 09:24:42','2024-07-25 09:24:42','2024-07-25 09:24:42'),(64,21,7,1,1,0,10,3878,'2024-07-25 09:27:55','2024-07-25 09:27:55','2024-07-25 09:27:55'),(65,21,7,927,1,0,2,7555,'2024-07-25 09:27:58','2024-07-25 09:27:58','2024-07-25 09:27:58'),(66,21,7,18,1,0,5,10614,'2024-07-25 09:28:02','2024-07-25 09:28:02','2024-07-25 09:28:02'),(67,21,7,891,1,1,2,14634,'2024-07-25 09:28:06','2024-07-25 09:28:06','2024-07-25 09:28:06'),(68,21,7,15,1,0,5,18775,'2024-07-25 09:28:10','2024-07-25 09:28:10','2024-07-25 09:28:10'),(69,21,6,860,1,1,2,1861,'2024-07-25 09:28:46','2024-07-25 09:28:46','2024-07-25 09:28:46'),(70,21,6,1,1,0,10,5117,'2024-07-25 09:28:49','2024-07-25 09:28:49','2024-07-25 09:28:49'),(71,21,6,912,1,1,2,12819,'2024-07-25 09:28:56','2024-07-25 09:28:56','2024-07-25 09:28:56'),(72,21,6,899,1,0,2,20310,'2024-07-25 09:29:04','2024-07-25 09:29:04','2024-07-25 09:29:04'),(73,21,6,866,1,1,2,23345,'2024-07-25 09:29:07','2024-07-25 09:29:07','2024-07-25 09:29:07'),(74,21,5,944,1,1,2,9634,'2024-07-25 09:32:27','2024-07-25 09:32:27','2024-07-25 09:32:27'),(75,21,5,928,1,1,2,18088,'2024-07-25 09:32:35','2024-07-25 09:32:35','2024-07-25 09:32:35'),(76,21,5,852,1,1,2,20737,'2024-07-25 09:32:38','2024-07-25 09:32:38','2024-07-25 09:32:38'),(77,21,5,916,1,0,2,23257,'2024-07-25 09:32:41','2024-07-25 09:32:41','2024-07-25 09:32:41'),(78,21,5,3,1,0,1,29178,'2024-07-25 09:32:46','2024-07-25 09:32:46','2024-07-25 09:32:46'),(79,21,4,900,1,1,2,1814,'2024-07-25 09:34:44','2024-07-25 09:34:44','2024-07-25 09:34:44'),(80,21,4,885,1,1,2,4353,'2024-07-25 09:34:47','2024-07-25 09:34:47','2024-07-25 09:34:47'),(81,21,4,932,1,1,2,6941,'2024-07-25 09:34:49','2024-07-25 09:34:49','2024-07-25 09:34:49'),(82,21,4,875,1,1,2,9324,'2024-07-25 09:34:52','2024-07-25 09:34:52','2024-07-25 09:34:52'),(83,21,4,908,1,1,2,13095,'2024-07-25 09:34:55','2024-07-25 09:34:55','2024-07-25 09:34:55');
/*!40000 ALTER TABLE `participant_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `school_registration_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'confirmed',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `image` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `school_registration_number` (`school_registration_number`),
  CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`school_registration_number`) REFERENCES `schools` (`school_registration_number`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (11,'user1','First1','Last1','569808','mwesigwaisaac40@gmail.com','2005-01-01','confirmed','2024-07-03 12:34:05','2024-07-25 07:33:23','',NULL),(12,'user2','First2','Last2','734878','mwesigwaisaac40@gmail.com','2006-02-02','confirmed','2024-07-03 12:34:05','2024-07-25 07:33:23','',NULL),(13,'user3','First3','Last3','734417','mwesigwaisaac40@gmail.com','2007-03-03','confirmed','2024-07-03 12:34:05','2024-07-25 07:33:24','',NULL),(14,'Test1','Test1','Test1','921275','mwesigwajojo@gmail.com','2023-01-01','confirmed','2024-07-04 07:38:14','2024-07-25 07:29:12','test1',NULL),(15,'Test2','Test2','Test2','569808','mwesigwajojo@gmail.com','2021-01-01','confirmed','2024-07-05 11:48:45','2024-07-25 07:33:24','',NULL),(16,'Test3','test3','test3','569808','mwesigwajojo@gmail.com','2023-10-01','confirmed','2024-07-05 11:53:56','2024-07-25 07:33:25','',NULL),(17,'Test4','test4','test4','939795','mwesigwaisaac40@gmail.com','2023-01-01','confirmed','2024-07-05 12:05:20','2024-07-25 07:33:25','test4',NULL),(18,'Test9','test9','test9','921275','mwesigwajojo@gmail.com','2023-01-01','confirmed','2024-07-08 07:50:58','2024-07-08 07:50:58','test9',NULL),(19,'Test13','test13','test13','921275','mwesigwaisaac40@gmail.com','2023-01-04','confirmed','2024-07-12 07:47:20','2024-07-25 07:32:50','test13',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( \Z%!1!%)+...383-7(9.+\n\n\n\r+ -+-+++----+---+-7-+++--++++-+7++--27++++-+-+++++++��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0@\0\0\0\0\0\0!1AQaq\"2��#B3Rr���%4b\�$CS��\�\�\��\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\"\0\0\0\0\0\0\0\0\0\0!1AQaq�\�\0\0\0?\0\�\0\0\0\0\0\0��\0\0\0\0\0:��ol�^�:K��o\�	�p7�\�\�\�M�*�\�\�c�Ok\�eF���\�YGA�J\�\�n�\�\�\�o\�./�g�\0\0\0�\0\0 \0\0\0\0\0\0\0\0`\0��\0�J�)�4�Ym\�1��\Zq�\�\�c�\�$�\�ǋ\�^\�T)Mӵ�\�\�x�_<\�3m�k/{V\���t\��ڋgY��>�y�]wkwy\';���o?�\�mB\�B)?\\�u�E\�\�b����a���\��ti\�o*��}\�\�{U֚E\�qP�\�In�7�\��\0\�\�\�5T�uO\��Q\�1�g\�\�\�\�]G�k\��\�흯y\�׋mo��Sᨾj3\�q/\�>i�u�)�\�$\��\�Ϲ\�^\r\�����\��\�\�\��.�eJ��\�@\�M&�SYO�I\0�@\00\0\0\0�\0C\0\0\0\nRI6\�Ie�!��\�y\�ZJ0x�[1��S(\�=�x\�W%mBX�M\�M?\�3�\���.���ę\�\�Yc<\�7ƞ_sZ\n[������\�KЋ]db�.}Mu)r$(\�|\�\�j�U%��\�b��V��%֛����Qβ�\�R\�S\�3Np\nE%\�~ʼd\�?\�}̳8/��\�8�\�\�\�#\�u:iW�\�gJJI�x\�\��o\�:�o-h\�ÕH��\�:J\�b\���`�!�\0 \0�b\0\0\0x_�\�UԿv\��6\�K\��sl��\�7^�R���\�\�fV\�\�\�L��ӎ}�V1\�\�U\�&PF\�v\�U��\�q6�+z��Ҍe\�d�\��-g4�\\\�\�̑SI����]\�\�:e��e\�{>K�M:��mF\�\�|#\Z\�\�\�\�ΰVץ\�Mֵ\�M>/3��\�\�\��*#%��ki�dh֩א\�\\��__\�R+uh\�\'��	\�%:\�{P�PO��<�1\�\���j�\Z��\�\nt�&�\�\\�\�\0HH� \0\0` \0�!�\0\0`c/\�|\�\�h_._/�\�\�>s\�ջ��ަ��b\�g�\�2�{�Z��x�\�7бu:��\"�\�j-��/�\�\'�{�\�\�YVw2�\�9\�f�WӃ\�\�I6zt\�Y\�\�(фf\�\�\��Q_qA�\�q߯��T��\�V�$���\�}V\�k1|\�\ZM\�Jo�$�\�J\�+)ԓ\�؝/~S���\�ga$�\�2yK\�{`��P�����\�˒:Z\�i~�;XF�\�\�5r�\0\\�\�\�ss\�\�R�\�	EE\�\�]W��x�&��.-\�<\�\�����/��#f�\�l\�\�}\�\�ϱ\�{&���	r���p\�.<\��\0\����B�k��P�(�9\�\�,�^΀\�o^3��$���\�ͅ�\0�\0\0@0@\0\0\0\03\�}�i\�X\\\���_\�\�\�R\�\�ѫW�\�\�\�˅u�\�;\�8Ҍ�*J�\�\�\\\\FV\�u&��|�6\�\��ʒX}V̗o\�\�<���x\�\�}NV�LQ�:_6;�\�2\r\����\�\�OS����5�){\�c�\\�I^�\�qg	s3k��YQm��U���q\�\\ht\�\�n*:pQ\�j<\\R��n�Zۅ:5�w�Ma�\�\�9j�xk$�X˳k\�\�Vtd\�rI�\���j-JI>(\�oR��Q�Zw��\�\�%�\�ԝ)%&��?S���9$򑛭\�UԊOoRej�r㒦\�\�\��).Y4��-�z\�t�B\r>\Z�\�\�\�\�t�6=\�\�MJ�\�(T�\��\�K�;�\�WNq\�\�T\�>�\�N��*\0\Z\0\0\0d\0\0`\0\0\0 �\0¬��YRM5\�(��\�\�r����ҍIME\�\�O��\�ͤF�r�\�]a�\0\�eV/2��\�>�W�krv\�(�E5��~�Ue).�4ۮ\'\�\�9\�\�2^X\�PU%-\�XL\�kS�~we��\�K�p\��\�t\�6�\�ש+\�]��I\�B�N&�q\�ڮ�Z��\�߇|2N�`�\���g�\�\�ee��\�0p�\�?�-�6�S�|���_\��\0����8\�/\"�챭���\�\�$��\�A^�\�\�mqr[\�f��w\�\�͉j��\ZZ����,we��\�T��C	F���M���v�\�\�\�\rŽ�E��mV�\�\�B.uĢ�\�\'�KC\��AӰ��\�\Z1O\�K�(ѥ,IB)�\��\��\0\0�\0\0 \0\0\0�\0!�\0b\0�\��cN��\�M|T�Gٽ�ā�鐺�:3�e�\�\\�c\�ќ%80�l\�ty:?i\�\�\�e\�\�*)T\��_\'��u\�#\�4�\�K+�,|3\�\�\�AqS\\�é.D��jP\�\�c�隭\�{�u�)\�X\�|ɵr;;ofIӾ��\'\�bo�2�9\�\�\\߇g/#�\�5j��N�J{\�\�Z\�-\�k;\�J�y�\�\\/\�\'k�w\�&\���E\�W�\��,�<\�\�+\�l\�(~�Y\�M�,\�]�[\�s��qt\�\�m\�?�)\'%)\�n�^\�c�\�>\�F*+�25\�ӓ}R\�E���_v��SQ\�n��\�N�f\�U�K,\��\�\�K.	\�Fm|K\�3�\�w�p\�wU8��|\�\�[\�)\�o\�n\\s\�f\0 C@\0�`\0\0\0�` \0�&\0�{Z\��\0\�%\�$\�\�s�3\�?i\n\�ڢ\�(\'(�N�\�z��\�\�\'�,\\�\Z}_\�\�ċ\�T�(\���\����[�ҋKɑ�uƴZj\�i<4��\�\'O\�\��(B>ina�i6\�S�^\Z��\���1�ؗO.P\�kV��H\�cn���>�-�\�xRq\�K=1̫�W	gl��eg�\�(�H\�c�q\�\\I\�\�e�\�$�Éžr\�\�v:�ӧn�*�\�Kg���5�RJ�\�[�\�q�M:0ia`\�ۍiS��Gsk�\�=?D�\�G\�QQ\'����\0\0\0�\0\0\0��\0` �\�|�\n�\�K�<x�\�R�6�mJ>}Ϣ�a/\�\��\�ŭ\�\�\�&MV.n�\�6�ϡ\"�\��\�\�C����\� \�RFx�\����Q�w��3��\�\�F�kp�F<8\�4y*��{�V��\�ع\�\�\��z7S��Tc����ꐕN7�?*\�\�su/��&b�\�\�َ�s۶�\�\�r\�Y�\�u\�\'q՗9=\�qˉ\�m�)\��Iu��*�No-I?\�}�?\�z?���|ſ<���t?\�\��tC$\���`\0 \0�`\0!�\0\0 �M�\0\�خ�\�mh\'*��{\��c.\�Ϝ<o]ܮ\�Y\���ڛ�iYE\�9jUe���{y�_{ω���o�d[�\�4�E�%o\�\�F�cJ[ꪫck��C8xܶ�B;�\�l�Ҳ��M��n[�p\�\'�v�\r��\�\r���ˑ\n�4\�|-,Ms\�O#\��%�ҭB1���5�G;�|\�k�:xh�CW��\�\n����\�}J��o�2��\�\�O\�R�\�S\�_Fz��\�Z\�O\�e\�\�\�\��܎V\�u]XS�%(�\�\�љ\r\0�\0\0\0\0@1\0\�\"\�\Z�*s�5�W�\�[|	E.�\�[{8�Vi\�\�\�r8_{E���\�.ru_\�\�g�\�\\Jrs���\�\�\�\�\�\�\\�\�\�4�ΏŞ3���\�\�\�|�\�z\�km�qJK�Rrܘ�i�0��\�\�ޫ�\�;Ž?.\�\�U׉	�]\�\�\�5i\�|\�^\�,�V͐(C\�O�[\"_,�f2�\�Cl)1fkm\�ڴ\�\�\�\�2�dmr�\�\n���6!\\H���a^\�#̸�Ж\�\�؍\�ZZ\�\�\"\�cюeMv�K\�-\�6T�?\�y��\��>>\�<��wQ�\�\�\��Esj\�J�\�愾$\�ב\��\�ݽ\�!W\�j>�-?�\�\�\�/��\�?\�1\�\�l&�\�i�\�tdx~�⻛V�e\�M×,z���x\�\�\�(�{��c-�|�\��:|\��ǧY]:�$\�\\�^\�<\�\00\Zn��J.U%Eu�\�<\�\�\� ��c{,~���?C�\�5��\�ʽW6�\0*x�\�\�\�\��e\�\�\�.Y�\�h�\�\�\�\�O�\�\�\�y���ֹ��i�e\�G?}\n�\�\�j\�O�\���6\\�&R���f�\�b&]0	F&ٹ�K�2YX������Zoϱu�]JQ�5\�G\�\�\�ww�\�\�\�x\�J�nŝ(.ƨ\�a\�?�*�q\�\�g\�rO��l/\�(Qx\�\�\��M��.cV8\�\�\Z�\\K\�_�?�^�~\�\"���!Bmn\�aO�<̣Rk�~��\�?��\rzX\�\"T�ؽ�EI\�\�Gvq\�\�>�Lz^K\�\�>\�KI$�˫;f\�d�\�\�\�mkN;\�e�\�I\�\�\�\�uw�\�\�\�nk8\��fb\��\0O�&�;vH\\���fJX\���dxɚ6\�\\[b2���\�|⼏@\��mi_iK\�K�{&�����X\�<ܝ.]�\�\��Z\��u?���T���=\�\�\�\"���.\�\Zl\�\�`\�\�4\�\�PET{�e\r#4���\r\�FHB�ṉ́���檲q\�\�\�\�m�&�\�\�\�컦\Z��g�㵦\�4�.ful�8g\��h\�\��J\�\�-�w�j�o�C�\�霓\�Q��٥\�\�\�\�K-$��\�\�f�3\�nl|8\�f\�B|�No\�\0��\�\�_a\�\�\�+ṃ�nl\�6�ϳ\�)��nS13,���4�Аٖ\0�\�X�{2\�C1\�\0i��>@1��\"=.q�\��\r�\0�\�\Z1�3o@\06\�E}_�\0\�ش�.�\��\�qaT\�o\�\�\05sC�1�\�\0ƹ-_\�\�\��\0l|��\0*0\�9\0�6H\01�\��\0���\�'),(20,'Test','Test','One','921275','mwesigwajojo@gmail.com','2020-01-01','confirmed','2024-07-19 13:17:40','2024-07-19 13:17:40','test1',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( \Z%!1!%*-...\Z383-7(-.+\n\n\n\r5% %/-+-+5+-//---1/+/-/--7-/--/282--+---/-------------��\0\0�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0@\0\n\0\0\0!1A\�\"2QTaq��dr�4BR����#$5�\�3bs��\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0!1Qq\"#A�a�\�R��ѱ\�\�B�\�\0\0\0?\0�\�V�\�sR��f�O\�\�\�\�s�(ᵒ7�ʂdY#a\�6��8\�#�\�\�B)VC\Z\�\�2��\05�\�c\�\�\�\Z$�B�\�&�F�2\�3ҽy�\�O28m��\�uƵUx\�u��\��\0Kw+�LW\�\�)��\�ϲ\�]M�Nq�9\�~\�No:\�,8P��\ZFrL�\�\�\�\�o\�X�ax\� \�Xj ���6@\����_!#�r�\�\�ʱ�P��a�Aݤrs\�P�\�I\�I��\�E���,rčK�l�c\�S�\�[\�F\�\ZYH\����\0J�\�����\�1�*ː\�\�ҥB\�׮sH\�\�\�\�{ӗ\�\�\�\�\���T��,\�UI\�s���\r`�^\�o&\�҄m\'��85\'�8�\0�\�\��A\�\�\�v�\�7J�\"\�^h\��îqZ\�꿃>]�\���nі\�ye>T\���\n�\�Ք\�\�5c�{x�2�ҬH|u=6�7�\�\�@a�3<ڃ\��ߕVp\�\�d�H}Kt8\��#5v\�d\�\�Eߙ���\"uvd\���F�-�F\�\��\\�\n[�dB^9��]GF#+�\�#���x`T,��\�ꑘ�pU�8\�᎘�\�ͪ��-�$r\�S[\�!\�\�����\�\�\�|��ưI�\0l�H\�\�I\�VS��~\�>S�h�PSti2\�d^�6\�\�\�\�\�Z��`\n�\�[��ѷ�\�>mqn�4yd�Ư��i=	A�a\�R\�\�\�&��S�2\����]\'\�qQx\�{B�1$�VAr\r�#j����\0�Bq��U�vQ��\�\�.q\�\��̆\�%�AX�]̇q� ���b\�]\\�B\��+�\�U�\0��\�\�\��f�*����e�f�\03X�\�\�*ْ�\0�ySɭ\�7x�b��#���F�Oen..y\�#2�\�\�\�Vv\�\��\�B\�]f$�J�dq�\�{�Ʀ\�~c2�p��m�UI9o\�$\��S�\';��f�l\��\0�\�\�\�\�B؋Jٲ�i\�7\�:7\�\�+\�\n1u�\0jqZ>�2\�\�.Y4�>\�gOL�\0\�\�w��&3��cۃ�R���b��j\���8U�\�\�\�P\�xPK��\�\�E:\�m���>\�׈Y��\�\�6�\�aO��~\�Y[\�r\�b�Ȓ\�.�%\�+\�N�\�\�5\�\�\�\�{��Zu��\�\�T\�m\��7��\�\�\r\�V�s\\�I#\�a�\"�1\'\�mG#qY�e\�\�orѪH�\0����A\�\�`�\�n$����|	YHܑ \�\�U1q���H\�*U�*\�;��w��SR\�c��p�J�W�\�w9�\���.Z�I\�\�L\�w\0\�\�o�i8\�,D���^\�b�\Z@������++�\�͵\�s�\�Q�`�g\��%\�;0�e���\�\�C��\�z\�\�x���q��Y�.\�2��}RvGN���\��3�\�ڹV��X\�)5k:���\�\�1�-\�d\�\�\'h�\���l���F\n���\�a\\\"\�\�%��q�2�I�?��\�>ʋ4��}\�\�\�8�#��iQ\�:��h\�G\�*4ܧr�\�\�\�̃P+�\�\�WY���m1aZ�\�\�j �,\�N\�\��\�9\�l\0\r�0z\�\�\�W�\0���	\�:7&\\v���g�f@ޘ\n\�2A\�\�\�\0�\��\0�F\�-be{�1R����`\�\��T\�\�DM�439\r#��\�OE�Vz\�粕d+�I\�2˟\�H\"�s\�x}�g�5�gV\�>���lA�?\�y\�23v��3(b52�\0vj��x�]�ԩ=X,\�F:�wc\�;�H�\�N\�\�\�\�\�\��\�N�\n�UW%X��\�6ph��7�\�ժmepp8\Z�\��fY\�\�H\�і\��H] �	�Gr۱\'\�sZk.o1D� �M��\�\����oִ\�\�l�dX[\���\�@!�\�e.-ĩ\Z�Ժ���\�7\Z�<�#�]r#L�\0�\�\�	8\�˦z\Z\�\�\�J\�\�\�4+I��\�=3^\�\�v�d[*���6�:�#��\0?��Z��!͹:a+\�\�\�{ �FR\���\\\�n��NL�\�\��&�	���J�iS���u��5�\�;�yK��;!RAW]뵗8�\�y;\"0a�WQ�\0�\�0��h\�G�A\�fQl.\�)�Y!N\�i\�	�:\�\�\�s$N�,�m�\�I�\�dglb�\��\�bX}�_q�\�,�,\�\�j���\�\�_�o\�4�\�\�\"ٔ4�i[!\�)JJW���({^R�R�\�Yr՚Oy2����u�✥\"�\�kiZ~\�I����\����6Ӥ\�CmX;g\����]\�\�nq���q���S�ܮ�\�.)Y��\�S�<!RE�^X���p`g#�\�iyX%�H\�(�f\�d\�\Z:zǨ\�5ǘ\�Y!+Mۨ\�WK��\�>\�\�\�쒬��i%�\�\�\�B\0\�\0\�5��_!\�7(N�x\�e�cuRs?L\�\r�\"�d\�Y;T�9���\��>� %\�3�\�\�R%\�)�%�\�D�F\�me:��\�o\�@N�\�kl\�\�d2;�\�\�(�G�\�ù\\v�\�\�$O�\�;�v?β��^k*Uc�V4�TT\�N\�gS\�\�\n\�\�\��\0Fe�\�R���E)JJR�\��\�()Jڽ\�?�Y~Y�\�\�\r_q�\�,�,\�\�k\�w�e[2��\�y[ �{^P\nW�\�\0�)@+\�\���+\��\�4�\��Wp|\�i8\�,\�\"b6��5Y%\�$S����Y>~m�I\�Cm@�\�gŚ;�u�1_I\�o���r�d\�tΑq��h��>��:���\r�M:7bC\0q��\�\�yi��O�\�Y#1�δ\��\�\��\�YǢ n\�\�39q \�+\\�Ln\�oo9�\�\Z3�k\�Yn��鞕�U�\�ψyNf�\�,��\�@fѫ�`��TعD$w=����&\�1ُ���\�\�p��$\�Y�\\K�fS&�U\�\r\�wW\�c�mp+$ȨSSz:T�\�I\�\�^kB\�-r_K�\�\�\�\�\�\0\��]\�$a\"2�C&F�If8R6�\�_\���@%A\�c1�\�g#�U�\\\��x\�\�EIa�\�\�l�\�Z�;\�ea��\�|�)vV�%\�\"E�[\�i2��\�\n\�a\�\Zg�L\�\"<\��-�e�N���\\st�\�%�)\�	\�P\�q_1\�l�C�+p\�sՁ\Z~[\�-Vƽ3\�\�R��c\":9�j\Z����\�=\�:\�\�\�d\�M&X\�{#0�\��\�S�FA\�i8<mc\n\"\'i�c�\�\�\�\�wb�M\�\�u��xL8,\�@$1b\�rv}Rze�	\0\���\�_4�k�\�\�)@)^ה��\�\�_�o\�5CW\�g\�/\�7��ķ]�V̢�+\�V\�+\�R�R�\�\�)^\�R�\�\�)^І�\�x_\�>�|4\��Ϫ\r{��k�\�|\�f\0\�j��\�I�[�C�6W`A\�p6د�\�i\�\��-\�b�\�x_\�>�|4\��Ϫ\rY\�\�&��\�\�c,l\�\�\0`3��,\\�F���*�5e�\�{�\0��v3$\�?o!\����\�\�\�x_\�>�|5\�ա��YN7�5�R\�\�GG�w�\�\�}P�i\�</\�T>\Z�Jb�#���;\�x_\�>�|4\��Ϫ\rA�1K�\�Q\��\�</\�T>\Zy�g\���Ҙ�\�\�\�N\��Ϫ\r<���3\�\�PiLR\�tTx\'y�g\���C\��\0\�C\�4�)r:*<����3\�\�O!\����\�\�\ZS�	\�C\��\0\�C\�n%i\�ͭ�o)\��0\�gv9Օ\�_ef\�\��\�k\���G)]jG\�)/b\"\�p���T>\Z���p\�8e�S\�&�֭yGn\���\"\�\�շ�M�-,�\�D\�\�)�ߎk.���\�?\rEJ\�L�\�|4.���O~b\�\�\�H�g\roUoN=�#���\�\�Op\�n#�	#\�B0H�8\�\�\�z������\�lK92�+�wZ\�t�3�G\��\0�\�</\�y\�C᧐\�e\�\�\��}��<\��v���c�\�z� zC\��\�Z�\�Y$ᎲʺH\���m�ƶ\�J\�\�\�\�RO	�7�\�զ\�H\�9�,鯟!\����\�֊~�\�J��d�\�6\Zz\rC=I#\�5#�,m繂\0\�4j5`.H\�\�f�t�\'OC\��_!\����\�\�\�x_\�>�|5i\�\�m\�Yb�=\"�S+�\�R\�\'\�Y\�қj\�7	BJ\�����3\�\�O!\����\�\�\ZU\�.MtTx%\�\�\�d�N�8\�3�՜\�\�6X�\���\�/\�s�Ow¨iYqL�S\�\�O\�D\�L^�\�a�\�ti\�ߺ�!\�4B\� ƩA�9Cd�;\�j\�R�L����\�o3ͧN�\�3�~���J�\0�)@)JP\nR���\0�)@*\��\�k\��\�SU\���\�\�/�\Z�tf[��\�\�\�Z�$��В3\�#��\��qL>O(\��#Qr\�t�ꥥ0�\�aW��ngP�b�H\�u\�\�zc�\�\Z\�ø�H�\�Y�Rd�*}�Tt��&\�~\"\�34��N\0��\�\n��\�UX\�Ku~\�t:�!�wۻ�\�\n\�R�����j\�\�\�0<�\� ̲�g�;�\�Oֻ\�s\ZHbv�B\�RI$2�\�\�nk?J�P�\�q\�,�qhMZ�]�9��AT��T�*Il)JU)\�礞\�g\�O��zI\�Vd�����p���ܱQ#$o��\�<��峕\�\�\��:`X\�H��\�^��ы�F����\�\�Or��\'\�O=$\�+?�|U\�˓.�X\�ª�\�.)�p޶3�G~V�\��f\�5E��-��\�S��R&y\��\�g\�[\�O=$\�+?�|UQk\�%{�h\�C�\�uc\�\�~�|Z�y\�W)q,��\�Y`�.I8�9�\�\�N\�\"�\�D�=$\�+?�|t\�\�Or��\'\�Ta(��1�\�V��;b��o)\�\�Io6X�Yx՛N\�\�\��%J�U\�Aƚ\�\�\����\�o<\��ܬ�\�x\���v��=\��\�]:GV/�\0>u\�N\\�]y��0pT�\0\�l�`\��mL�A��e礞\�g\�[\�O=ܬ�\�x\��\0�\\A�����\�#\�#Pw\�\���<\�h�X\�\��@zJ\�ݴ)9l|*\�Q�\�\Zv�i礞\�g\�O��zI\�Ve�u͋\�Ƕ\�ϵ\��%?�.rG\�R�\�9E�\�z\"YeImL\0\�3�$\�Yp��%��|\��ܬ�\�x\�\����\�of)]:z|ˏ�\�G\�+?�\�:y\�\'�Y��\�\�b�\�\�\�2\���\�\�Or��-㫞+\�N�v�y-�\�%\�LD�\�\�z#V\���h8\��}�\��\�X�\nw���\0ĩ\�\�O\��\�r��-㧞�{��\�oW\�\�\�\�8&\�f\��8Tf  �|k]\�\� ���\�8\�c/�%���r��ںc\�k�8\�G䒊�V(|\��ܬ�\�x\�礞\�g\�[\�Z\�}\r\�\�\Z\�8�|q\�3 u�ק¿7\�\�\r\�#T\�\��C�!\nr�\�k*.\�[^zI\�Ve�t\�\�Or��\'\�W|\�\�v\�\\޴\�XJ\�4�� �\�ߧS���\�0If����l�#[!��\�\��b���}�\���T\�{/=$\�+?�\�:y\�\'�Y��⩶��ķ\�<0��<�,wI/�\�Y�;\�\�\�v�� �(w�S\�+�aBN\�jt��ݒ-�\��ܬ�\�\�S\�I=\�\�\�f)]:z|ˏ�\�G\�+?�\�:y\�\'�Y��\�\�)\�\�\�eG�Ǘx�\�]\�;Dn�\���W�s=�)���t�~с.\�\�1�k-il\�ȱƥ��Gy5�\�ܙ4�)ތl��#gGUS�j\�\�\n�U;\�35\�E�\�:A�T�\�K��d\"\0��\�\�j=�1\�\�$��ɖ�eV\"6b:�yoTg�oY\�\�O5\�[۩b\�T&I\�NpJ�ܱt)EN\�6�ӧ�:\�Vr\�-/\�&\nkC\�qu��5\���J\�؃�\�Ws\�-��\��Gq\"O�����E}�OJ�^V�2�]�]���\nީ\�N0{�O���n\�n\�m\�#>s�u銲\�\�_�x4ԍ\�x\�m\�eYGh���8Ƭeh�\�X\�Hcgd\�!TF\"Dd\�lpNsY�N\\��QDK��t\Z�nU2}#�ew�\�\"�K\�u\���L�T\0z䜝\�6��I\�>��n\�\�,���.\� t}O$\��M�2\��WknuH\�$D\�!n�*�d�\�G?\��\�*���\Zʉ�\�d\�\�\�P�J(2\�|*\��@T�	\�\r�q0�Z&��>�Ƣ���\�kJ��p\�B\�\�\�5�͑\�mbֽ޳c\��m_w�\�o$Sb9��M�Ҧ=##�\n\�ҦD7&TE)J\�t�(h8\��}�\��\�Y�\�q���\�?���\�x\��f%�\�\�\�ܹĭ\�g6\�h\�]\'���\0\�\�5s̖~O�I\�,�I;F�w�\�J\�Ғ�;�\�\�~�\����\\D���\�\Z,h\�\�@\�~u���Β`\�][\0s��J��+!\Zj*\�\�\�s��yT\�A\"\�t�&%�U\\i\�;\��s\�\�1{ir\"lA\�\�#\'�#�\�2��\�\���&&\�ˏYC<���I�YL09%���\�~9��o\��\�J�T,kՍM�\'Scl�\�+Q�,^\�T\�w�+��JR��\��\'\�Q\�iՠ\�=��\�kGm\�\�BbH�sfv\�Z`Gv�\�w��x���ݘ��:��j\�r\�	R\�\�.{WvU\�QX($�?�|\�7+K�\�����\�fF\�[�\�+�^\�`I!z�\02{\�J���-V�\�G�r0Gegb\��7�ߊ���.\�\ZF�iV\�p\�}-����ߧμ���ёL`��D4��.q�}\�9J\����\0�jwl��\�8&2\�,RvR\�\n\n\�-X>\�k��:����	Pӣ\�_�`ie\�o��}�\�b�\0�\�\�O\"�\0��4�\r�tw�*u\�*\�FP�]\�`++a\�\�F�\�\�\�S*�V\�Q���\�\�0Ć%IQg�=\Z2C~\�\����\�q\�eغ�j&�U`F�\�[W\��~i\�5�1}ZJ��Jz˫8\�\�W�\�\�\�d\�\n�\�\�N�\�]*\�s\�\�I;�\�	SOr��oq\�WhȽ��\�c[7(pvo�X\�\�H��u�FDVu�GN�0w`q�\�]X%{�u\"����_�[��^\�Y�k��fB�B�؎��9\�+��\�z\�\r�\Z@�ԩUوl\�n���\�\�\�KJ�\�x\\�\�Pe���t ��B�&��4�\��*�JR�V��\�\��Y�\0\�5��\Z�\0�����\0\�k�\���b[��\0\�Ҕ��\�)JJR�R���()J×�����vR\�6@\�5�\�\�n��U�b�\�IC�XaGwQ��J\�*Q��\�bPMݕi\�Z`�5S�+��$\�\�\�\�\�ޭ��\�IG\�\�\�MEz��	�쓹�*:0dt\�\�\�\�En��F\�S(\�j\0ֆ\�-�\�n��q!�\�&�\�\��\�\�s�)VT\�\�\�Wΰs|0H��B�\�%�\�-0#lt������\��i�S��\�*@���ҕ~~�\0\�8�7\�\�\�\Z\�@�\�\�\�1�t��\�	\�\�(��\��\�\�@�\�_S囵�\�\��ҕ �D�\�|\��D�&*�\�\���(Lm�îk\�\�QD�q?f�\�\Z�+��\�$�m���)L�62�Rq\�(.\�B�\�`H�NrW�|*����$���ed)JU(�)@+Aƿ\�\�,�\0\�\ZR�\�x\��f%�\�\�\��)J\�lR���()JJR�R��?�\�'),(21,'Test20','Tes','20','734417','pentest046@gmail.com','2020-01-01','confirmed','2024-07-24 08:09:08','2024-07-24 08:09:08','test20',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0\n\Z\Z#.%+\Z&8&+/1555\Z$;@;4?.451\Z\Z4!!#4444411444144441414144?444411444444?4444414?4??411��\0\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0;\0\0\0\0\0\0!1AQaq�\"��\�\�2R��BSb�\�\�#3Cr�\��\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\01!AQ2�\�\0\0\0?\0\��)i\Z\�(\�$JCHTƈ����ad\�H+I�\0�I��S\n�T�R	�\�\Z�jT|#3\�\�*F\���P#�7\����&\�\�P\Z\�\��i��F\�\�{l£hiZn�.�Դ���3J\�l[7U����G�\�vګ]����on��&=\�MQZ\�˩�\�WH34�\�[Bw\�=ys\�\�\�\�l\�\�\��&�p�|ػ^ÁZe�\�\�r24�Z2\�\��kJ�\�ɿT\��\'��!o�&eh\�ri�f�s��-�Ba�G��\�\�\\�\\��~!M\�3\�F\��\�ƛ$�\�H&��\�y��\�\�s�\�>.\�21h�G\�:~\"M)�r۰��h\�\�ƚ�D+A��V\�\n���0�)�HaD���m\�P��HٝxSh9a��\�w�/�\�y���\�+gh�\�\���\'\�ˤ\�M�\�Ե+��(\0\�i�cG|c���ȹQN�QL�\��*uW1�8$�[�Yh�\�I5q�o\�Pw[ư\�m\�R\�q:oE��N��|A�\�\�}����\�ʦ�Г�,\�\�\�\�\��\�\'\�W\�=���)\�\r2tݥ�Zb�@0=zo�\��\�\��nE`\r��KFz\�0�~\�\r�\�A\�p\�#%��������MyT\�ӿ?�\�T�\�hf:\�P]&΀\�\�\�h{�b\r�4\�E\'�t\�\�ǻ�t-��\����;�\���E���\�ǿt{�m��\�\�S��5@8\�\�$�\�\�\�G\�#\\ZN\�\�N���\�\�^2��rF�\�\�s\�dW��	�M��j��\�!RG�da\�@e&5\�C�=�\�F(ɚ\�,\�;\�L\�\�͆t\�f}-\�Ӑs�\�i)�a��\�\���f=\�a���e��oC�A�-oȢ�\�V�]�6��y\�J\�vO#3tb�chpӍf��G��V�p\�\�\�V�\�\\lw\�\�S\�f)\ZǬ���\�\��O�$�jW\��{7]\�G�u\�\Z\�\�\��M�^���[ k��X�\�\0�w\�_\\ -I8Ezu\n9(\�Ns\��\\\��r�8�&��Њl\�e����u<ش��f:\�Uv��\�N�\�\�\Zo\�R��0��FPӞ?ķ\�=Ŭ�\�l}^\0\Z�A\�S����j\�q�轛�\�ZX\�SU\�kZ26�\�\����\�ﬖZ\�\0	�d�Yq��.�|S�לb:\�֜d\�G\�DB\�2\��6m\'w?ۥOm1\�\"���֮�\�{0œ*[g$\�\�?\�N�W{՟\�\'Y5Z,\�\0�F\�9n\�)��rάmY%IN�(ں�\�\rk�h\�ciQ\�\�C�\0xo�x\�m.\���\�\�\Z\�\�T�v\�,��A\�S+\�&\r\�/\�/C\�\��O�z9B�VT�\�7\�|7R�5�݁\�\�Oq\�X�Vl􅢀�`GI\�\�\��b�	\�[���\�)j\�j��~��c���\�|#_k\�(A����۬o\�\�>v\�`b��y�����\\��35�5}방4\�PF�\�\�s��:\�\�$\�yJ7�1\0q\�\'�ǫ�$�\�\��\�͗Q�9�=�\0�J�[[\n*�\r2\��;a�R\�	OH\�\�1$T�\\��\�^�\�;\�{\�={j����!5\�\�\�o)o٤\"\�\�쵣�<\ZЖ\�8�\Z�y�6�_v���b\�\�u{rT��-�v\���y��~~�c�x\�u��\�)X^Y1V#\����\�\�⃨\�k\�H\�\"Gw� Tv�\�\� + jq�N1ɍXS\�D�&L\�F�ݱ�\�^`h\�޳�\�i]��X��H�1\��\�?\�\�3cVdi�\�^_x�\��\�B��Px\�@x\�5��%h\�U�(\rX��p\�\�<\�kErχ9^\�{\n(Y�Q\��\Z\�SY�\0,ǎ\�\�)��mkV\�v�OE�\�\�T�s\�@\�\�\\��n\�\�]\�͢\�\�\���W]������|\�,ơ�\�Pwǌ\�oz3T�%E0\�)\�+I/:�\��kΖ%AU��\�\�ɚ�\�d��\�f�\�MEgj\�R7J\�˫\��\nيMr2\�\�=[�ӽ\�6{\\\�\�\�\�ug�5�\�\� �d\�n\�n\��^��,n�\0\n(��@	~\�/^�\�\�\�<����׮\�Da_\\��J\����\�-L=z��h\�^ʜ\r>����\��W�\�\�\�f\�\�l\�\�NĘ{�2\�\�\��,�\�ևXkm\�ǌʑ�1̉�=ݵ\�6.�\��f^��ګ�k7\\v��f���RN=\�j�l\�\�t\�\�\�\�21Z2ԍ\��\Z\�HZ\�\�\��&=ci�ב�LD\���\�M�Y\�ũ�A \���\�갊\�\�0�EB|笘D��D&�ݯ\�\�|\��y��\�Y+d\�mZ\�\n\�L$!R(\�\�\�EX����FaI\� Z\�F9��\�8\0\��e0R\�T�?�\�qS\�\�^��	\�_��\�]P|(1\�\�C���\�O\�OE\�év��\�\np��jj*@\"z\�6\�d��\Z\��\0ogb����\�jS�\�e\Z\�W<8\�G\�\�O^��\�j�H\��[X\�\�hY\�`f~s�\���\��Ҟ�\�kS\�?)8�\�X6|i\�/\�o\\\�F\�\�ǔ{#�\���\0�\�\�i�\�GG�z\�\��LJ��[�\�e�z^39�;`~�\��\�\�-�O^qe_-�\�l;0\�\��\�\�\Z.-��=ݪ[��[bϢQ���L��i\�mO\���\�H\\C�x�n)f\��b\�hi\�b<@�wf\�OU�i�,5-�\�f�\"j<5�XQ\�\�)�S&!\�\�(0�1By?sC\�I�6�$?CS\��X�D��h�R��2���!�\�iڦ�\��\�\�\�@��Qp6`\�T\�\�\�5/m�JlæS6\��-\��2�DC\�ֽ���\0T�Z,�\0�F\���\�0\�\r�S*\Zr�Mm\�\�\�O�U\�\�H�\��S�|�Q\�u�ch\�u�����x2�R�\�_�\�\�WRiJl4\�C��\�P\�\�/wzz��0\���g�g��/\�=\�\�W��\�^\�)���\�\�\�\'_\r�\�\�\�\�2�\�V\�{�{��p\��\�#|\�\�J�w�B9�xʶmBA�\"��\n|S�p]�z\�p<Y�.^\�A�BX\�r���\�\��y*�*~\�\�\��\����\�k\�?n\�Ի\�\�\�q$\��\�\�$\�\r\��a\��,МN^���f2#.��\�dI���Z���6R��s�\�\�oC<�Ǒ8�l.��\�\�\'A���|\n\�\�s�\�]\����G�\0�vO��851�5�S\0��` 0*a�(2BI\�{j7�%{\�w�>\�vmB1����n\��\��5�CBٮ8\�2\�ξ\�5q�\�\�J\�m\�:��F\�<8z\�b_/&�~��1PwWd�2\�g��x�\�VM\"\�\�!N\�\�2�\�H��Ш3R\�\�U5FA��\�_�йZP�\�\�2nW�\�\Z\�t՚6yz\�$#j͢�\�\�)ݯKLX\�+\����SM�����,؀\0aJmZ\�]���fƘ��W\�\�\�0a\�\�곗^=�\�͓,I]\�r�\�&��\�\�)�ah�\0(}c,�ΜO�\�.��]X{M�Fϩ\�\�#>*	��r\�;\�d\��B+��H腉5��+��ɽa[�2>�Vdj�\Z\�\n�L�;�\�7&�A\�lÔ�f$\0\�W:U��\�B\��/n\0\n\�p�r<\�=\�+\�\�scN\�\�{\�\�\�1\�e�\����]e48�6x\�N�w�Y��K.�\�Z\�\���9an\�I��a��67d�\��\�\�\0\�U�a\�C�j\�\�>\�f\�\�qʘ㔖�2���Oey�$U\�W}{\'O�H\�4���\�p�IwI]\�-�6$rn\��ʤ@hD���@��=a�z��&	)�\�\�\��\�N\�5�#騊\�#\n\�8�,���\�DB\���򂵽�\Zn�\�(%\�Z����1߄\�\�Gi\�\�-\��Sz�$W� ��\'H\�Z�ĵ�u\�\�\�+\�n\�R��f�\�\�\�\�ȍ�\�\�\Z�\\�\�C�\�\��\�\\�\�\�~؋z\�mW%8SY\�)�\��pP�\�b@ΛH�.^�\�T\�M:���\�\�)�\�,��j�ȉф�����$ls\�7\�-@�ФiAJ�n\��\�kO]fU`\�z\�\"\�_\\\�\�׭\�łm\���:jA�\�\�\��~\� E��\�Օ�{\'=���JG\�\�$G����F\"�a��2��\�\�\�,\��L�\�ӈ�_���\�G\�Kin�\�u<	�X���%�\�%h5��\�\�˺\Z\�)h�6\���(�ǻ���\0�������høӞ\�$4찚D\�袤dىcF\�%\�a􀦯)j\�(\'�$��\�\�\�\�F�`\0��\�An�:\���_�z6E\�:	ͦ��O�z���~e\�&[�\�%vA��\�E,-ʳ+�RT�FC�Wq\��Uw\�\��|�轿��\�\�ٰqR	Z�\�\�x\�Zn\�>�X�FOi.\��B9�yC\�\�˱�\0�ϼ\�\�<\�\�o�\�\�0z����o�\�\�\�u\�R\�NL��yc�\���H\�Izq���L\�\�e�=/n�[ڏ��\���Lg]dtާ�\�k?i/#�Ry�?hu\��\�?�z1����\�q�{:��hs\�\�o�,\�$`N\�\�\��N~更g/i�s\�I,r\�1�ZV\�\�!a��\�*\�\�z\�Nu\�{=�K8W�%�f\�u�\�+�\��h����\'�G�S��3�\�j�ôA��\�\�,\�Ϯ�|}��\��*�fj����\�2��+ʨ\�+\�b1Č�\�[�_��6O[���v\Z�d�{Lj�\r��g�\�\�\���\�\�\�\r@	�\�P\�\�M��7g�\��\�풱$k7Sl/\�<d\��9��mG��\�Y6OL��C\�\'\�4\�|!5_.\�:?��)\�c�?\��|��G����Ǆ\�ta�u }\�\�?0~\�\�M`�?\�\�~\�Ǆ���[�\�\�\�m\������}Q\�k��G?\�\�n#%�S\�xp�0�\�οa\n�[?\�l$�o�e]s\�ʖ���\�\�p!ִ�f�u\�]Km\�\�|\�k�g$\�kf\�\�\�\�\Z8\�j�Б\�9/�\�x�CyF¢h%\�\"��*\�\��GIe�\�Zp\rf��j\0@\�y\�w4S]Q^Rޠ\���h71���f�l\�`ɓ \�=)pKœؽu\\cCB\�w�C<�J{kf\�\�v�09V�\�C�<�\��\�B�SBs�e�&��h+t\�\�\�\�\�O��|VN?\�|���9e	�(64\�Gqj��3\�Z\�`MfsD?��\�w���\���\�\�\�_A\�~Rw\n}%{Of�\�#�7�\Z\��;D\�N��g>��#��\�f�\�X��|{ �hø\�M�V��I\�Fc���+{�\"^\�\�\�\�~΢\n\�>YM+=�`��8t\�7��\0j\�T�i\��¦��Z\Z��^\�O��\�\�6av�5\�ܽ�D`\�\�\�hpZ�\�oYТ\�d\�\"3�#��[^l\�:�j^̓f�\�%MT	�\\|�\�~�Y�]5�4\�-H\�\"�v�|D\�z��J�#c�z_\�\�p\�\\r\��U�\�ܿ�yE�Co���\�$4c\�YMU\�\��C\��[\Z0�ä�\�g\�\��b�s�\��-4F��g��\�\�>U��\\h�\�\�d\�D��\rC@�G\�C5\�\�n\�U@up�y\�I`,\�f�ZIZ:6p��\�');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `marks` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=951 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Question 5','Answer C',10,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(2,'Question 4','Answer B',4,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(3,'Question 3','Answer A',1,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(4,'Question 2','Answer C',4,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(5,'Question 1','Answer B',4,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(6,'Question 15','Answer A',8,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(7,'Question 14','Answer C',6,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(8,'Question 13','Answer B',8,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(9,'Question 12','Answer A',3,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(10,'Question 11','Answer C',8,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(11,'Question 25','Answer B',1,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(12,'Question 24','Answer A',9,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(13,'Question 23','Answer C',2,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(14,'Question 22','Answer B',2,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(15,'Question 21','Answer A',5,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(16,'Question 35','Answer C',8,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(17,'Question 34','Answer B',4,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(18,'Question 33','Answer A',5,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(19,'Question 32','Answer C',2,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(20,'Question 31','Answer B',6,'2024-07-03 12:27:37','2024-07-03 12:27:37'),(851,'1 + 1','2',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(852,'2 + 2','4',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(853,'3 + 3','6',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(854,'4 + 4','8',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(855,'5 + 5','10',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(856,'6 + 6','12',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(857,'7 + 7','14',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(858,'8 + 8','16',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(859,'9 + 9','18',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(860,'10 + 10','20',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(861,'11 + 11','22',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(862,'12 + 12','24',2,'2024-07-23 08:36:39','2024-07-23 08:36:40'),(863,'13 + 13','26',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(864,'14 + 14','28',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(865,'15 + 15','30',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(866,'16 + 16','32',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(867,'17 + 17','34',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(868,'18 + 18','36',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(869,'19 + 19','38',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(870,'20 + 20','40',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(871,'21 + 21','42',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(872,'22 + 22','44',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(873,'23 + 23','46',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(874,'24 + 24','48',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(875,'25 + 25','50',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(876,'26 + 26','52',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(877,'27 + 27','54',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(878,'28 + 28','56',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(879,'29 + 29','58',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(880,'30 + 30','60',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(881,'31 + 31','62',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(882,'32 + 32','64',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(883,'33 + 33','66',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(884,'34 + 34','68',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(885,'35 + 35','70',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(886,'36 + 36','72',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(887,'37 + 37','74',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(888,'38 + 38','76',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(889,'39 + 39','78',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(890,'40 + 40','80',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(891,'41 + 41','82',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(892,'42 + 42','84',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(893,'43 + 43','86',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(894,'44 + 44','88',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(895,'45 + 45','90',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(896,'46 + 46','92',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(897,'47 + 47','94',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(898,'48 + 48','96',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(899,'49 + 49','98',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(900,'50 + 50','100',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(901,'51 + 51','102',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(902,'52 + 52','104',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(903,'53 + 53','106',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(904,'54 + 54','108',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(905,'55 + 55','110',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(906,'56 + 56','112',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(907,'57 + 57','114',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(908,'58 + 58','116',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(909,'59 + 59','118',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(910,'60 + 60','120',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(911,'61 + 61','122',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(912,'62 + 62','124',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(913,'63 + 63','126',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(914,'64 + 64','128',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(915,'65 + 65','130',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(916,'66 + 66','132',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(917,'67 + 67','134',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(918,'68 + 68','136',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(919,'69 + 69','138',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(920,'70 + 70','140',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(921,'71 + 71','142',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(922,'72 + 72','144',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(923,'73 + 73','146',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(924,'74 + 74','148',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(925,'75 + 75','150',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(926,'76 + 76','152',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(927,'77 + 77','154',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(928,'78 + 78','156',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(929,'79 + 79','158',2,'2024-07-23 08:36:39','2024-07-23 08:36:41'),(930,'80 + 80','160',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(931,'81 + 81','162',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(932,'82 + 82','164',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(933,'83 + 83','166',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(934,'84 + 84','168',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(935,'85 + 85','170',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(936,'86 + 86','172',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(937,'87 + 87','174',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(938,'88 + 88','176',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(939,'89 + 89','178',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(940,'90 + 90','180',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(941,'91 + 91','182',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(942,'92 + 92','184',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(943,'93 + 93','186',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(944,'94 + 94','188',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(945,'95 + 95','190',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(946,'96 + 96','192',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(947,'97 + 97','194',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(948,'98 + 98','196',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(949,'99 + 99','198',2,'2024-07-23 08:36:40','2024-07-23 08:36:41'),(950,'100 + 100','200',2,'2024-07-23 08:36:40','2024-07-23 08:36:41');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejected_applicants`
--

DROP TABLE IF EXISTS `rejected_applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rejected_applicants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejected_applicants`
--

LOCK TABLES `rejected_applicants` WRITE;
/*!40000 ALTER TABLE `rejected_applicants` DISABLE KEYS */;
INSERT INTO `rejected_applicants` VALUES (1,'Test11','','2024-07-12 07:27:29','2024-07-12 07:27:29'),(2,'Test12','taep','2024-07-12 07:39:58','2024-07-12 07:39:58'),(3,'Test6','not applicable','2024-07-12 07:47:58','2024-07-12 07:47:58'),(4,'Test7','taep','2024-07-19 13:19:47','2024-07-19 13:19:47');
/*!40000 ALTER TABLE `rejected_applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_representatives`
--

DROP TABLE IF EXISTS `school_representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_representatives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_representatives`
--

LOCK TABLES `school_representatives` WRITE;
/*!40000 ALTER TABLE `school_representatives` DISABLE KEYS */;
INSERT INTO `school_representatives` VALUES (1,'Representative 5','rep','5','mwesigwaisaac40@gmail.com','2024-07-05 09:47:40','2024-07-08 07:29:52','rep5',0),(2,'Representative 2','rep','2','pentest046@gmail.com','2024-07-05 09:47:40','2024-07-08 07:29:52','rep2',1);
/*!40000 ALTER TABLE `school_representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schools` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `school_registration_number` varchar(255) NOT NULL,
  `representative_email` varchar(255) NOT NULL,
  `representative_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_registration_number` (`school_registration_number`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'School 5','District 3','921275','mwesigwaisaac40@gmail.com','Representative 5','2024-07-03 12:26:43','2024-07-08 07:28:58'),(2,'School 4','District 5','569808','representative4@school.example.com','Representative 4','2024-07-03 12:26:43','2024-07-03 12:26:43'),(3,'School 3','District 1','734878','representative3@school.example.com','Representative 3','2024-07-03 12:26:43','2024-07-03 12:26:43'),(4,'School 2','District 2','734417','mwesigwajojo@gmail.com','Representative 2','2024-07-03 12:26:43','2024-07-24 07:53:52'),(5,'School 1','District 3','140034','representative1@school.example.com','Representative 1','2024-07-03 12:26:43','2024-07-03 12:26:43'),(6,'School 15','District 5','550896','representative15@school.example.com','Representative 15','2024-07-03 12:26:43','2024-07-03 12:26:43'),(7,'School 14','District 4','206719','representative14@school.example.com','Representative 14','2024-07-03 12:26:43','2024-07-03 12:26:43'),(8,'School 13','District 3','769611','representative13@school.example.com','Representative 13','2024-07-03 12:26:43','2024-07-03 12:26:43'),(9,'School 12','District 3','162139','representative12@school.example.com','Representative 12','2024-07-03 12:26:43','2024-07-03 12:26:43'),(10,'School 11','District 5','654149','representative11@school.example.com','Representative 11','2024-07-03 12:26:43','2024-07-03 12:26:43'),(11,'School 25','District 1','169578','representative25@school.example.com','Representative 25','2024-07-03 12:26:43','2024-07-03 12:26:43'),(12,'School 24','District 5','934657','representative24@school.example.com','Representative 24','2024-07-03 12:26:43','2024-07-03 12:26:43'),(13,'School 23','District 1','932290','representative23@school.example.com','Representative 23','2024-07-03 12:26:43','2024-07-03 12:26:43'),(14,'School 22','District 1','301600','representative22@school.example.com','Representative 22','2024-07-03 12:26:43','2024-07-03 12:26:43'),(15,'School 21','District 3','939795','representative21@school.example.com','Representative 21','2024-07-03 12:26:43','2024-07-03 12:26:43'),(16,'School 35','District 1','741709','representative35@school.example.com','Representative 35','2024-07-03 12:26:43','2024-07-03 12:26:43'),(17,'School 34','District 2','234327','representative34@school.example.com','Representative 34','2024-07-03 12:26:43','2024-07-03 12:26:43'),(18,'School 33','District 5','476842','representative33@school.example.com','Representative 33','2024-07-03 12:26:43','2024-07-03 12:26:43'),(19,'School 32','District 1','651051','representative32@school.example.com','Representative 32','2024-07-03 12:26:43','2024-07-03 12:26:43'),(20,'School 31','District 3','878391','representative31@school.example.com','Representative 31','2024-07-03 12:26:43','2024-07-03 12:26:43'),(21,'School 45','District 4','929983','representative45@school.example.com','Representative 45','2024-07-03 12:26:43','2024-07-03 12:26:43'),(22,'School 44','District 3','764152','representative44@school.example.com','Representative 44','2024-07-03 12:26:43','2024-07-03 12:26:43'),(23,'School 43','District 1','749055','representative43@school.example.com','Representative 43','2024-07-03 12:26:43','2024-07-03 12:26:43'),(24,'School 42','District 1','154678','representative42@school.example.com','Representative 42','2024-07-03 12:26:43','2024-07-03 12:26:43'),(25,'School 41','District 1','697386','representative41@school.example.com','Representative 41','2024-07-03 12:26:43','2024-07-03 12:26:43'),(26,'School 55','District 5','158233','representative55@school.example.com','Representative 55','2024-07-03 12:26:43','2024-07-03 12:26:43'),(27,'School 54','District 5','329964','representative54@school.example.com','Representative 54','2024-07-03 12:26:43','2024-07-03 12:26:43'),(28,'School 53','District 4','345229','representative53@school.example.com','Representative 53','2024-07-03 12:26:43','2024-07-03 12:26:43'),(29,'School 52','District 3','889679','representative52@school.example.com','Representative 52','2024-07-03 12:26:43','2024-07-03 12:26:43'),(30,'School 51','District 4','296845','representative51@school.example.com','Representative 51','2024-07-03 12:26:43','2024-07-03 12:26:43'),(31,'School 65','District 4','332947','representative65@school.example.com','Representative 65','2024-07-03 12:26:43','2024-07-03 12:26:43'),(32,'School 64','District 5','954390','representative64@school.example.com','Representative 64','2024-07-03 12:26:43','2024-07-03 12:26:43'),(33,'School 63','District 5','736889','representative63@school.example.com','Representative 63','2024-07-03 12:26:43','2024-07-03 12:26:43'),(34,'School 62','District 5','911394','representative62@school.example.com','Representative 62','2024-07-03 12:26:43','2024-07-03 12:26:43'),(35,'School 61','District 1','784485','representative61@school.example.com','Representative 61','2024-07-03 12:26:43','2024-07-03 12:26:43'),(36,'School 75','District 3','402671','representative75@school.example.com','Representative 75','2024-07-03 12:26:43','2024-07-03 12:26:43'),(37,'School 74','District 1','590391','representative74@school.example.com','Representative 74','2024-07-03 12:26:43','2024-07-03 12:26:43'),(38,'School 73','District 2','393389','representative73@school.example.com','Representative 73','2024-07-03 12:26:43','2024-07-03 12:26:43'),(39,'School 72','District 3','360887','representative72@school.example.com','Representative 72','2024-07-03 12:26:43','2024-07-03 12:26:43'),(40,'School 71','District 1','616350','representative71@school.example.com','Representative 71','2024-07-03 12:26:43','2024-07-03 12:26:43'),(41,'School 85','District 4','362680','representative85@school.example.com','Representative 85','2024-07-03 12:26:43','2024-07-03 12:26:43'),(42,'School 84','District 4','443772','representative84@school.example.com','Representative 84','2024-07-03 12:26:43','2024-07-03 12:26:43'),(43,'School 83','District 5','667559','representative83@school.example.com','Representative 83','2024-07-03 12:26:43','2024-07-03 12:26:43'),(44,'School 82','District 2','589672','representative82@school.example.com','Representative 82','2024-07-03 12:26:43','2024-07-03 12:26:43'),(45,'School 81','District 5','695736','representative81@school.example.com','Representative 81','2024-07-03 12:26:43','2024-07-03 12:26:43'),(46,'School 95','District 4','711949','representative95@school.example.com','Representative 95','2024-07-03 12:26:43','2024-07-03 12:26:43'),(47,'School 94','District 2','965404','representative94@school.example.com','Representative 94','2024-07-03 12:26:43','2024-07-03 12:26:43'),(48,'School 93','District 2','235138','representative93@school.example.com','Representative 93','2024-07-03 12:26:43','2024-07-03 12:26:43'),(49,'School 92','District 1','278987','representative92@school.example.com','Representative 92','2024-07-03 12:26:43','2024-07-03 12:26:43'),(50,'School 91','District 4','484525','representative91@school.example.com','Representative 91','2024-07-03 12:26:43','2024-07-03 12:26:43');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test','test@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$sNjsVzE/4g/nJ6qPxFLUiuX8ezc/UijHVZQoq8.lUALkdNPtteJlO',NULL,'2024-07-13 05:04:53','2024-07-13 05:04:53'),(2,'Test1','test1@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$tShbMI9BtaOh1ZPmNOIFMOriWcuRHe5YLk1AYuAZ5BaMju1CTW2rC',NULL,'2024-07-23 08:21:08','2024-07-23 08:21:08');
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

-- Dump completed on 2024-07-25 15:02:27
