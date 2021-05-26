-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour cms_blogging_system
CREATE DATABASE IF NOT EXISTS `cms_blogging_system` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cms_blogging_system`;

-- Listage de la structure de la table cms_blogging_system. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table cms_blogging_system.categories : ~3 rows (environ)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
	(1, 'Evenement'),
	(2, 'Musique'),
	(3, 'RÃ©union');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Listage de la structure de la table cms_blogging_system. comments
CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_post_id` int(11) DEFAULT NULL,
  `comment_author` varchar(50) DEFAULT NULL,
  `comment_email` varchar(50) DEFAULT NULL,
  `comment_content` text,
  `comment_status` varchar(50) DEFAULT NULL,
  `comment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Listage des données de la table cms_blogging_system.comments : ~1 rows (environ)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
	(1, 1, 'maisha', 'vvv@ktt.com', 'La satisfaction client est un Ã©lÃ©ment indispensable pour faire revenir un client, mais aussi pour en attirer dâ€™autres. Cette formation, qui est un gage dâ€™efficience pour lâ€™entreprise, nous permettra dâ€™amÃ©liorer nos processus afin dâ€™Ãªtre plus performants face aux exigences de nos clients.', 'approved', '2021-05-26 12:49:41');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Listage de la structure de la table cms_blogging_system. posts
CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(500) DEFAULT NULL,
  `post_category_id` int(11) NOT NULL,
  `post_author` varchar(50) DEFAULT NULL,
  `post_image` varchar(500) DEFAULT NULL,
  `post_content` text,
  `post_comment_count` int(11) NOT NULL DEFAULT '0',
  `post_tags` text,
  `post_status` varchar(50) DEFAULT NULL,
  `post_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table cms_blogging_system.posts : ~1 rows (environ)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`post_id`, `post_title`, `post_category_id`, `post_author`, `post_image`, `post_content`, `post_comment_count`, `post_tags`, `post_status`, `post_date`) VALUES
	(1, 'First Blog', 3, 'cozino', '1621421286855.jpg', 'Plusieurs agents de Congo Telecom ont participÃ© du jeudi 25 au vendredi 26 fÃ©vrier Ã  une formation sur la norme ISO 9001v2015 au siÃ¨ge de lâ€™entreprise Ã  Brazzaville.\r\n\r\nCette formation dispensÃ©e par Lambano a permis aux participants de comprendre lâ€™intÃ©rÃªt de la qualitÃ© dans la rÃ©alisation des objectifs de lâ€™entreprise, les exigences essentielles de la norme ISO 9001 ainsi que la mise en Å“uvre des exigences et le processus de certification ISO et enfin pour Congo Telecom, dâ€™obtenir lâ€™adhÃ©sion Ã  la dÃ©marche qualitÃ© en entreprise. Â« Cette norme ISO est un gage de qualitÃ© pour rassurer nos clients et est Ã©galement un critÃ¨re dâ€™assurance du bon dÃ©roulement de nos processus Â» a dÃ©clarÃ© un participant.\r\n\r\nÂ« La satisfaction client est un Ã©lÃ©ment indispensable pour faire revenir un client, mais aussi pour en attirer dâ€™autres. Cette formation, qui est un gage dâ€™efficience pour lâ€™entreprise, nous permettra dâ€™amÃ©liorer nos processus afin dâ€™Ãªtre plus performants face aux exigences de nos clients. Â» a dÃ©clarÃ© Sirig Sika, Directeur de lâ€™Administration et des Ressources Humaines (DARH) Ã  Congo Telecom.\r\n\r\nGrace Ã  cette formation qui sâ€™articulait autour dâ€™un module thÃ©orique et de plusieurs mises en situation, Congo Telecom se dote dâ€™outils de mesure de la performance et entend rÃ©pondre aux exigences de ses clients. Cette formation sâ€™inscrit pleinement dans la volontÃ© du top management de Congo Telecom de mettre les clients au cÅ“ur de la stratÃ©gie de lâ€™entreprise.\r\n\r\nNotons que lâ€™ISO 9001 version 2015 est une des principales certifications prÃ©sentes dans les entreprises. Elle reprÃ©sente plus dâ€™un million dâ€™organismes certifiÃ©s dans le monde dont plus de 500 000 en Europe.', 1, 'Management, personnel, ISO, certification', 'draft', '2021-05-26 12:45:28');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Listage de la structure de la table cms_blogging_system. users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `user_firstname` varchar(50) DEFAULT NULL,
  `user_lastname` varchar(50) DEFAULT NULL,
  `user_image` varchar(500) DEFAULT NULL,
  `user_role` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table cms_blogging_system.users : ~1 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `username`, `user_firstname`, `user_lastname`, `user_image`, `user_role`, `user_email`, `user_password`) VALUES
	(1, 'cozay', 'Rock', 'Mouelet', NULL, 'subscriber', 'mystercozay@gmail.com', 'azerty');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
