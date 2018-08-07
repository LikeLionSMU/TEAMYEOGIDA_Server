-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.23-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- yeogida 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `yeogida` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `yeogida`;

-- 테이블 yeogida.productchoice 구조 내보내기
CREATE TABLE IF NOT EXISTS `productchoice` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `choice_productpid` int(11) DEFAULT NULL,
  `choice_personpid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `productchoice_ibfk_2` (`choice_personpid`),
  KEY `productchoice_ibfk_1` (`choice_productpid`),
  CONSTRAINT `productchoice_ibfk_1` FOREIGN KEY (`choice_productpid`) REFERENCES `productinfo` (`productpid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productchoice_ibfk_2` FOREIGN KEY (`choice_personpid`) REFERENCES `profile` (`personpid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 yeogida.productinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `productinfo` (
  `productpid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(50) DEFAULT NULL,
  `productdate` date DEFAULT NULL,
  `producprice` int(11) DEFAULT NULL,
  `productimage` varchar(50) DEFAULT NULL,
  `producthit` int(11) DEFAULT NULL,
  `checker` tinyint(4) DEFAULT NULL,
  `personpid` int(11) DEFAULT NULL,
  `productUrl` varchar(45) DEFAULT NULL,
  `formerprice` int(11) NOT NULL,
  `productaddress_x` float DEFAULT NULL,
  `productaddress_y` float DEFAULT NULL,
  `productaddress` float DEFAULT NULL,
  `text` longtext,
  PRIMARY KEY (`productpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 yeogida.productsearch 구조 내보내기
CREATE TABLE IF NOT EXISTS `productsearch` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `search_personpid` int(11) DEFAULT NULL,
  `search_productpid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `productsearch_ibfk_1` (`search_productpid`),
  KEY `productsearch_ibfk_2` (`search_personpid`),
  CONSTRAINT `productsearch_ibfk_1` FOREIGN KEY (`search_productpid`) REFERENCES `productinfo` (`productpid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productsearch_ibfk_2` FOREIGN KEY (`search_personpid`) REFERENCES `profile` (`personpid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 yeogida.productsell 구조 내보내기
CREATE TABLE IF NOT EXISTS `productsell` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `seller_personpid` int(11) DEFAULT NULL,
  `sell_productpid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `personpid_idx` (`seller_personpid`),
  KEY `productsell_ibfk_1` (`sell_productpid`),
  CONSTRAINT `personpid` FOREIGN KEY (`seller_personpid`) REFERENCES `profile` (`personpid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productsell_ibfk_1` FOREIGN KEY (`sell_productpid`) REFERENCES `productinfo` (`productpid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 yeogida.productsold 구조 내보내기
CREATE TABLE IF NOT EXISTS `productsold` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_personpid` int(11) DEFAULT NULL,
  `sold_productpid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_personpid_idx` (`buyer_personpid`),
  KEY `fk_productpid_idx` (`sold_productpid`),
  CONSTRAINT `fk_personpid` FOREIGN KEY (`buyer_personpid`) REFERENCES `profile` (`personpid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_productpid` FOREIGN KEY (`sold_productpid`) REFERENCES `productinfo` (`productpid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 yeogida.profile 구조 내보내기
CREATE TABLE IF NOT EXISTS `profile` (
  `personpid` int(11) NOT NULL AUTO_INCREMENT,
  `phone` int(11) DEFAULT NULL,
  `kakaonickname` varchar(45) DEFAULT NULL,
  `kakaoPW` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `kakaopid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`personpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
