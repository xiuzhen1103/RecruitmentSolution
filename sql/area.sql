/*
SQLyog v10.2 
MySQL - 5.1.12-beta-community-nt : Database - recruitment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`recruitment` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `recruitment`;

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `areaName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`areaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `area` */

insert  into `area`(`areaId`,`parentId`,`areaName`,`level`,`latitude`,`longitude`) values (0,NULL,'All Country',0,'0','0'),(1,0,'Ireland',0,'34','34'),(2,NULL,'China',0,'9','34'),(3,1,'Monaghan',1,'2','2'),(4,1,'Donegal',1,'45','34'),(5,1,'Sligo',1,'42','34'),(6,1,'Meath',1,'34','34'),(7,1,'Wicklow',1,'13','34'),(8,1,'Wexford',1,'3342','32'),(9,1,'Kildare',1,'323','34'),(10,1,'Clare',1,'34','34'),(11,1,'Galway',1,'59','58'),(12,NULL,'UK',0,'54','34'),(15,1,'Waterford',1,'33','4'),(20,4,'Letterkenny',2,'45','546'),(21,4,'Castlefin',2,'34',NULL),(23,2,'BeiJing',1,'78','98'),(24,2,'FuJian',1,'89','43'),(25,24,'FuZhou',2,'45','43'),(26,24,'XiaMen',2,'43','34'),(27,2,'HuBei',1,'89','67'),(28,27,'WuHan',2,'56','45'),(29,12,'London',1,'43','34'),(30,29,'London City',2,'43','34'),(31,1,'Dublin',1,'34','43'),(32,31,'Dublin City Center',2,'34','32'),(33,31,'Dublin 2',2,'32','23'),(35,31,'Dublin 4',2,'34','34'),(36,31,'Dublin 3',2,'59','4'),(37,23,'ChaoYang',1,'2','4'),(38,2,'ChengDu',1,'439','23');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
