CREATE DATABASE `jspdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

CREATE TABLE `admin` (
  `id` varchar(12) NOT NULL,
  `pw` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `customer` (
  `custom_no` int(11) NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(12) NOT NULL,
  `custom_pw` varchar(256) NOT NULL,
  `custom_name` varchar(15) NOT NULL,
  `custom_nickname` varchar(45) NOT NULL,
  `custom_phone` varchar(15) NOT NULL,
  `custom_email` varchar(45) NOT NULL,
  `custom_address` varchar(100) NOT NULL,
  PRIMARY KEY (`custom_no`),
  UNIQUE KEY `custom_id_UNIQUE` (`custom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `order` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `custom_no` int(11) NOT NULL,
  `product_no` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `custom_no_idx` (`custom_no`),
  KEY `product_no_idx` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `product` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `viewCount` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `image` varchar(45) NOT NULL,
  `info` varchar(120) NOT NULL,
  `status` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

CREATE TABLE `community` (
  `cmtId` int(11) NOT NULL,
  `cmtType` varchar(45) DEFAULT NULL,
  `cmtTitle` varchar(50) DEFAULT NULL,
  `cmtUser` varchar(15) DEFAULT NULL,
  `cmtDate` datetime DEFAULT NULL,
  `cmtContent` varchar(2048) DEFAULT NULL,
  `cmtAvailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `community_event` (
  `cmtId` int(11) NOT NULL,
  `cmtType` varchar(45) DEFAULT NULL,
  `cmtTitle` varchar(50) DEFAULT NULL,
  `cmtUser` varchar(15) DEFAULT NULL,
  `cmtDate` datetime DEFAULT NULL,
  `cmtContent` varchar(2048) DEFAULT NULL,
  `cmtAvailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `community_notice` (
  `cmtId` int(11) NOT NULL,
  `cmtType` varchar(45) DEFAULT NULL,
  `cmtTitle` varchar(50) DEFAULT NULL,
  `cmtUser` varchar(15) DEFAULT NULL,
  `cmtDate` datetime DEFAULT NULL,
  `cmtContent` varchar(2048) DEFAULT NULL,
  `cmtAvailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

