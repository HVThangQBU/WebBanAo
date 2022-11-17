-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.9.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for webbanhangjsp
CREATE DATABASE IF NOT EXISTS `webbanhangjsp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `webbanhangjsp`;

-- Dumping structure for table webbanhangjsp.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `is_sell` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table webbanhangjsp.account: ~9 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `user_name`, `pass`, `is_sell`, `is_admin`) VALUES
	(1, 'admin', '1231231', 1, 1),
	(2, 'thang', '123123', 0, 0),
	(3, 'hoang45345', '123123', 1, 1),
	(4, 'teo', '123123', 1, 0),
	(45, 'thangdeptrai', '231231', 0, 0),
	(48, 'thanguhaha', '12312', 1, 1),
	(50, 'taideptrai', '123123', 1, 1),
	(51, 'hiuusdf', '123123', 0, 0),
	(52, 'thanne', '123123', 0, 0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table webbanhangjsp.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `account_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `cart_product_id_fk` (`product_id`),
  CONSTRAINT `cart_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `cart_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table webbanhangjsp.cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table webbanhangjsp.category
CREATE TABLE IF NOT EXISTS `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) CHARACTER SET utf8mb3 NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table webbanhangjsp.category: ~4 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`cid`, `cname`) VALUES
	(1, 'quần'),
	(2, 'dép'),
	(3, 'áo'),
	(4, 'giày');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table webbanhangjsp.order
CREATE TABLE IF NOT EXISTS `order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` int(11) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `total` float DEFAULT 0,
  `order_status` int(11) DEFAULT 1,
  `date_order` varchar(45) DEFAULT '0',
  `shipped_date` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table webbanhangjsp.order: ~13 rows (approximately)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`id_order`, `id_account`, `address`, `phone_number`, `email`, `total`, `order_status`, `date_order`, `shipped_date`) VALUES
	(1, 1, 'asdasdas', '32432', 'dsaddfs', 3423, 0, '0', '0'),
	(10, 4, 'Web', '0772888043', 'admin@admin.com', 456, 3, '2022-11-07', '2022-11-12'),
	(11, 4, 'Web', '(+84) 367506544', 'hoangthangdnd278@gmail.com', 579, 4, '2022-11-07', '2022-11-12'),
	(12, 4, 'asdfasd', '0772888043', 'hoangthangdnd278@gmail.com', 456, 4, '2022-11-07', '2022-11-12'),
	(13, 4, 'ưerdfsedfsdf', '5435354', 'scodeweb2016@gmail.com', 702, 6, '2022-11-07', '2022-11-12'),
	(14, 4, 'Websad áda', '5435354', 'hoangthangd5ddt@gmail.com', 456, 1, '2022-11-07', '2022-11-12'),
	(15, 4, 'Hanoi, Hoàn Kiếm', '0772888043', 'hoangthangd5ddt@gmail.com', 123, 3, '2022-11-10', '2022-11-15'),
	(16, 4, 'Hanoi, Hoàn Kiếm', '0772888043', 'hoangthangd5ddt@gmail.com', 456, 1, '2022-11-10', '2022-11-15'),
	(17, 4, 'Hanoi, Hoàn Kiếm', '0772888043', 'hoangthangd5ddt@gmail.com', 123, 1, '2022-11-10', '2022-11-15'),
	(18, 1, 'Hanoi, Hoàn Kiếm', '0772888043', 'hoangthangd5ddt@gmail.com', 123, 4, '2022-11-10', '2022-11-15'),
	(19, 1, 'Hanoi, Hoàn Kiếm', '0772888043', 'hoangthangd5ddt@gmail.com', 858, 2, '2022-11-10', '2022-11-15'),
	(20, 1, 'dong hoi haha', '421312312', 'thashfg@gmail.com', 1859, 3, '2022-11-11', '2022-11-29'),
	(21, 52, 'duc ninh dong', '23123123', 'hoanthangdd@gmail.com', 456, 3, '2022-11-11', '2022-11-30');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Dumping structure for table webbanhangjsp.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` float DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table webbanhangjsp.order_details: ~35 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `order_id`, `id_product`, `quantity`, `price`) VALUES
	(1, 5, 17, 2, 122),
	(2, 7, 2, 2, 456),
	(3, 8, 2, 2, 456),
	(4, 8, 15, 1, 123),
	(5, 8, 17, 1, 122),
	(6, 9, 1, 1, 123),
	(7, 9, 2, 3, 1368),
	(8, 0, 1, 1, 123),
	(9, 10, 2, 1, 456),
	(10, 11, 2, 1, 456),
	(11, 11, 4, 1, 123),
	(12, 0, 2, 1, 456),
	(13, 12, 2, 1, 456),
	(14, 13, 1, 1, 123),
	(15, 13, 2, 1, 456),
	(16, 13, 14, 1, 123),
	(17, 14, 2, 1, 456),
	(18, 0, 2, 1, 456),
	(19, 0, 1, 1, 123),
	(20, 15, 1, 1, 123),
	(21, 0, 2, 1, 456),
	(22, 16, 2, 1, 456),
	(23, 17, 4, 1, 123),
	(24, 0, 1, 1, 123),
	(25, 0, 4, 3, 369),
	(26, 0, 17, 1, 122),
	(27, 0, 2, 1, 456),
	(28, 18, 4, 1, 123),
	(29, 19, 1, 4, 492),
	(30, 19, 17, 3, 366),
	(31, 20, 1, 3, 369),
	(32, 20, 2, 3, 1368),
	(33, 20, 17, 1, 122),
	(34, 0, 2, 1, 456),
	(35, 21, 2, 1, 456);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table webbanhangjsp.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `sell_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_cid_fk` (`cate_id`),
  KEY `product_account_id_fk` (`sell_id`),
  CONSTRAINT `product_account_id_fk` FOREIGN KEY (`sell_id`) REFERENCES `account` (`id`),
  CONSTRAINT `product_category_cid_fk` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table webbanhangjsp.product: ~6 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `pname`, `image`, `price`, `title`, `description`, `cate_id`, `sell_id`) VALUES
	(1, 'áo dài tay', 'https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12.jpg', 123, 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors\n', 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors\n', 3, 2),
	(2, 'áo ngắn tay', 'https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12.jpg', 456, 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors\n', 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors\n', 3, 3),
	(4, 'áo quần', 'https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12.jpg', 123, 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors\n', 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors\n', 3, 2),
	(14, 'Ao', 'https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12.jpg', 123, 'Giày đá bóng nam chính hãng Adidas X TANGO 18.4 TF DB2479', 'Giày đá bóng nam chính hãng Adidas X TANGO 18.4 TF DB2479', 1, 2),
	(15, 'ao', 'aaaaa', 123, 'ssss', '3df', 2, 2),
	(17, 'them ao moi', 'https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12.jpg', 122, 'GiÃ y ÄÃ¡ bÃ³ng nam chÃ­nh hÃ£ng Adidas X TANGO 18.4 TF DB2479', 'GiÃ y ÄÃ¡ bÃ³ng nam chÃ­nh hÃ£ng Adidas X TANGO 18.4 TF DB2479', 1, 4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
