# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: blog
# Generation Time: 2018-08-27 01:38:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(32) DEFAULT NULL,
  `content` text,
  `summary` text,
  `date` varchar(64) DEFAULT NULL,
  `category_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FKy5kkohbk00g0w88fi05k2hcw` (`category_id`),
  CONSTRAINT `FKy5kkohbk00g0w88fi05k2hcw` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `for_cate` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `title`, `content`, `summary`, `date`, `category_id`)
VALUES
	('402881a16440473d0164404e9b9d0002','a1','a1','a1','2018-06-27 16:14','402881a16440473d0164404773790001'),
	('402881a16440473d0164404ed2fd0003','aa2','aa2','aa2','2018-06-27 16:14','402881a16440473d0164404773790002'),
	('402881a16444368d01644437b2140000','天气晴朗','梅雨季节','梅雨季节','2018-06-28 10:27','402881a16440473d0164404773790001');

/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT NULL,
  `display_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `display_name`)
VALUES
	('402881a16440473d0164404773790001','c1','C1'),
	('402881a16440473d0164404773790002','c2','C2');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `article_id` varchar(64) DEFAULT '',
  `comm_ip` varchar(32) DEFAULT NULL,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnwlc4xv9fm2swgesuas3uf3mo` (`article_id`),
  CONSTRAINT `FKnwlc4xv9fm2swgesuas3uf3mo` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `article_foreign` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `article_id`, `comm_ip`, `comment`, `created_at`)
VALUES
	('402881a1645e27c601645e27f8a30000','402881a16440473d0164404e9b9d0002','127.0.0.1','bb',NULL),
	('402881a1645eaaaf01645eab37c30000','402881a16440473d0164404e9b9d0002','127.0.0.1','why wanyi',NULL),
	('402881a1645eb10e01645eb13c1c0000','402881a16440473d0164404e9b9d0002','127.0.0.1','redirect',NULL),
	('402881a1645eb10e01645eb15aa90001','402881a16440473d0164404e9b9d0002','127.0.0.1','aiyoyo',NULL),
	('402881a1645f20dd01645f22764c0000','402881a16440473d0164404e9b9d0002','127.0.0.1','te it nal',NULL),
	('402881a1646313f901646314649e0000','402881a16440473d0164404e9b9d0002','127.0.0.1','333',NULL),
	('402881a1646313f90164631481800001','402881a16440473d0164404e9b9d0002','127.0.0.1','中文',NULL),
	('402881a164631c700164631cad730000','402881a16440473d0164404e9b9d0002','127.0.0.1','new comments date','2018-07-04 00:00:00'),
	('402881a164631c700164631ee1c00001','402881a16440473d0164404e9b9d0002','127.0.0.1','','2018-07-04 10:28:00'),
	('402881a164631c700164631ef5970002','402881a16440473d0164404e9b9d0002','127.0.0.1','time is ','2018-07-04 10:28:00'),
	('402881a16464241d0164642488ea0000','402881a16440473d0164404e9b9d0002','127.0.0.1','333333','2018-07-04 15:14:00'),
	('40289ffc645f703201645f7056cb0000','402881a16440473d0164404e9b9d0002','127.0.0.1','111',NULL),
	('40289ffc645f811801645f8183770000','402881a16440473d0164404e9b9d0002','127.0.0.1','222',NULL);

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `password`)
VALUES
	('402881a16440473d0164404773790004','admin','111111');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
