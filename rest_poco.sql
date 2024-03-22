-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               11.3.2-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных rest_poco
CREATE DATABASE IF NOT EXISTS `rest_poco` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `rest_poco`;

-- Дамп структуры для таблица rest_poco.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id_usr` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_usr`,`id_product`),
  KEY `FK_cart_product` (`id_product`),
  CONSTRAINT `FK_cart_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cart_usr` FOREIGN KEY (`id_usr`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы rest_poco.cart: ~3 rows (приблизительно)
INSERT INTO `cart` (`id_usr`, `id_product`) VALUES
	(1, 1),
	(2, 2),
	(2, 3);

-- Дамп структуры для таблица rest_poco.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы rest_poco.product: ~3 rows (приблизительно)
INSERT INTO `product` (`id`, `name`) VALUES
	(1, 'Pasta'),
	(2, 'Tomatoes'),
	(3, 'Apples');

-- Дамп структуры для таблица rest_poco.usr
CREATE TABLE IF NOT EXISTS `usr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT '0',
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы rest_poco.usr: ~2 rows (приблизительно)
INSERT INTO `usr` (`id`, `login`, `first_name`, `last_name`) VALUES
	(1, 'log1', 'John', 'Car'),
	(2, 'log2', 'Jane', 'Doe');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
