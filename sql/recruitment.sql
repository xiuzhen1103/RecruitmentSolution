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

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `administrator` */

insert  into `administrator`(`adminId`,`username`,`password`) values (1,'xiuzhen','xiuzhen'),(2,'zhen','zhen'),(3,'zhen','zhen');

/*Table structure for table `applyjob` */

DROP TABLE IF EXISTS `applyjob`;

CREATE TABLE `applyjob` (
  `applyJobId` int(11) NOT NULL AUTO_INCREMENT,
  `jobseekerId` int(11) NOT NULL,
  `jobId` int(11) NOT NULL,
  `cvId` int(11) DEFAULT NULL,
  PRIMARY KEY (`applyJobId`),
  KEY `jobseekerId` (`jobseekerId`),
  KEY `jobId` (`jobId`),
  CONSTRAINT `applyjob_ibfk_1` FOREIGN KEY (`jobseekerId`) REFERENCES `jobseeker` (`jsId`),
  CONSTRAINT `applyjob_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `job` (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `applyjob` */

insert  into `applyjob`(`applyJobId`,`jobseekerId`,`jobId`,`cvId`) values (1,1,1,8),(3,1,13,11),(4,1,12,5),(5,1,16,16),(10,1,1,17),(12,1,1,18),(13,1,17,1),(14,1,1,19),(15,1,1,19),(16,1,1,20),(17,1,1,20),(18,1,1,17);

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

/*Table structure for table `cv` */

DROP TABLE IF EXISTS `cv`;

CREATE TABLE `cv` (
  `cvId` int(11) NOT NULL AUTO_INCREMENT,
  `cvTitle` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `coverLetter` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `jsId` int(11) NOT NULL,
  PRIMARY KEY (`cvId`),
  KEY `cv_job_fk` (`jsId`),
  CONSTRAINT `cv_job_fk` FOREIGN KEY (`jsId`) REFERENCES `jobseeker` (`jsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cv` */

insert  into `cv`(`cvId`,`cvTitle`,`coverLetter`,`jsId`) values (1,'aaaaaa','aaaaa',1),(2,'b','bbbbbbbbbbbbbbbbb',4),(3,'test CV','test CV',1),(4,'1_group_journal.docx','Mr/Mrs',12),(5,'1_group_journal.docx','Dear Sir/Madam',1),(8,'gfjkh','dfskhj',1),(11,'24','234',1),(16,'1_coverLetter.docx','5665464',1),(17,'1_null','Mr/Mrs',1),(18,'1_salesCV.docx','Mr/Mrs',1),(19,'1_Submission Form.docx','Mr/Mrs',1),(20,'1_CV.docx','Mr/Mrs',1);

/*Table structure for table `employer` */

DROP TABLE IF EXISTS `employer`;

CREATE TABLE `employer` (
  `empId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'employer id',
  `username` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'username unique',
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'contact email',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'contact name of advertise job',
  `contactName` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'company name',
  `companyName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'address of company',
  `address` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT 'company website',
  `webSite` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT 'company website',
  `companySize` int(20) DEFAULT NULL,
  `companyType` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `employer` */

insert  into `employer`(`empId`,`username`,`password`,`email`,`phone`,`contactName`,`companyName`,`address`,`webSite`,`companySize`,`companyType`) values (1,'Darren','d','d@gmail.com','234','aaaaaa','aaaaaaa','aaaaaaa','aaaaaaa',234,'aaaaaaaaa'),(6,'bob','b','b@gmail.com','0871234776','Tracy','Tracy','George St','www.tracy.com',30,'retail'),(8,'Ciara','c','c@gmail.com','cc','cc','cc','cc','www.cc.vom',20,'cc'),(9,'Anna','a','a@gmail.com','a','a','a','a','a',0,'a'),(10,'Mary','mary','mary@gmail.com','32432','macy','macy','macy','macy',20,'IT'),(11,'Sarah','sarah','sarah@gmail.com','3q2w4','sd','sfd','sfd','sdf',324,'423'),(14,'Tom','tom','tom@gmail.com','5436985798','Bella','Bella','Bella','www.bella.com',47,'Pub'),(15,'aaaa','aaa','aaa@gmail.com','5436985798','Bella','Bella','Bella','www.bella.com',47,'Pub'),(16,'darling','zhen','da@gmail.com','0138778','DaWa','DIT','Aungier st','www.dit.ie',100,'Education'),(17,'darling1','1','darling1@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(18,'darling111','1','darling12@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(19,'darling1111','1','darling121@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(20,'darling11111','1','darling1211@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(21,'darling111111','1','darling12111@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(22,'darling1111111','1','darling121111@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(23,'darling11111111','q','darling1211111@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(24,'darling111111111','1','darling12111111@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(25,'darling2','1','darling2@gmail.com','1','aa','aa','aa','www.cc.vom',100,'Pub'),(26,'darling22','1','darling22@gmail.com','1','aa','aa','aa','www.cc.vom',100,'Pub'),(27,'darling1111111111','1','darling121111111@gmail.com','1543','aa','aa','aa','www.bella.com',20,'Pub'),(28,'darling222','2','darling222@gmail.com','1','aa','aa','aa','www.cc.vom',100,'Pub'),(29,'darling2222','2','darling2222@gmail.com','1','aa','aa','aa','www.cc.vom',100,'Pub'),(30,'aaaaa','a','aa@gmail.com','1543','a','aa','aa','www.bella.com',20,'Pub'),(31,'aaaaaa','1','xiuzhen1103@gmail.com','1543','a','aa','aa','www.bella.com',20,'Pub'),(32,'','','','','','','','',NULL,''),(33,'aaaaaaaaaaaaa','a','dddd@gmail.com','','','','','',NULL,''),(34,'aaaaaaaaaaaaaaa','1','dddddd@gmail.com','','','','','',NULL,''),(35,'ddddd','d','ddddddd@gmail.com','','','','','',NULL,''),(36,'aaaaaaaaaaa','','dddddddddd@gmail.com','','','','','',NULL,''),(37,'aaaaaaaaaaaa','a','dddddddd@gmail.com','','','','','',NULL,''),(38,'aaaaaaaaaa','','aaaaaaaaa@gmail.com','','','','','',NULL,''),(39,'adfdssfs','aa','dd@gmail.com','','','','','www.bella',NULL,''),(40,'test111','xiuzhen','xiu@hotmail.com','','Xiu','','','www.bella.com',NULL,'');

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `jobDesc` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `startDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `numPosition` int(11) DEFAULT NULL,
  `requirement` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `countyId` int(11) DEFAULT NULL,
  `districtId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobId`),
  KEY `empId` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `job` */

insert  into `job`(`jobId`,`title`,`jobDesc`,`startDate`,`address`,`phone`,`numPosition`,`requirement`,`salary`,`empId`,`countryId`,`countyId`,`districtId`) values (1,'lecturer','lecturer','2014-02-28 21:56:56','DIT','0138989',2,'experiences required',40000,6,1,4,20),(2,'Advertising','advertising','2014-03-19 22:06:07','Bolton st','0137878',1,'expereinces required',30000,1,1,4,20),(12,'Designer','Designer','2014-03-28 21:58:50','Malahide','013878',1,'experiences required',30000,9,1,4,20),(13,'barman','barman','2014-03-27 22:00:08','Aungier St','0134898',1,'minimum 2 years experiences',35000,9,1,4,20),(14,'Database administrator','administrator','2015-02-05 22:11:15','Belfast','0145365456',1,'minimum two years experiences',40000,1,2,NULL,NULL),(17,'Database administrator','lecturer','2014-02-28 22:36:16','DBS','353871234776',2,'minimum two years experiences',40000,1,1,4,20),(18,'business support','support','2014-03-27 22:51:15','DCU','0145365456',1,'minimum two years experiences',40000,1,1,31,32),(19,'UI Designer','Designer','2014-03-12 23:00:00','DCU','01304384',1,'minimum two years experiences',40000,1,1,31,32),(20,'','','2014-03-07 23:08:40','','',NULL,'',NULL,1,1,31,25),(21,'Lecturer','lecturer','2014-03-07 23:08:40','DCU','353871234776',1,'minimum two years experiences',40000,1,2,27,28),(22,'Lecturer','lecturer','2014-03-07 23:08:40','DCU','353871234776',1,'minimum two years experiences',40000,1,2,27,28),(27,'.Net developer','asp. web services','2014-02-27 15:15:09','Datalex','0138787',1,'',NULL,1,2,24,26),(28,'.Net developer','asp. web services','2014-02-27 15:15:09','Datalex','0138787',1,'',NULL,1,2,NULL,NULL),(29,'.Net developer','asp. web services','2014-02-27 15:15:09','Datalex','0138787',1,'',NULL,1,2,NULL,NULL),(31,'graduate developer','junior developer','2014-04-30 15:23:47','College green','0145365456',1,'minimum two years experiences',40000,1,1,31,35),(32,'graduate developer','junior developer','2014-04-30 15:23:47','College green','0145365456',1,'minimum two years experiences',40000,1,1,31,35),(33,'Junior developer','.Net','2014-03-07 15:28:45','Ballsbridge','353871234776',1,'minimum two years experiences',40000,1,2,24,25),(34,'Junior developer','.Net','2014-03-07 15:28:45','Ballsbridge','353871234776',1,'minimum two years experiences',40000,1,2,24,25),(35,'graduate developer','J2EE','2014-02-28 15:35:46','College green','353871234776',1,'minimum two years experiences',40000,1,1,31,32),(36,'lecturer','lecturer','2014-02-27 13:20:29','5 Stewart Hall','353871234776',1,'2.1 ',40000,1,1,31,35),(37,'lecturer','lecturer','2014-02-27 13:20:29','5 Stewart Hall','353871234776',1,'2.1 ',40000,1,1,NULL,NULL),(41,'Lecturer','lecturer','2014-03-07 13:25:12','5 Stewart Hall','353871234776',1,'minimum two years experiences',40000,1,2,23,37),(43,'l','l','2014-02-13 13:26:47','5 Stewart Hall','353871234776',NULL,'',NULL,1,1,4,20),(44,'Test','Test','2014-03-18 15:35:09','5 Stewart Hall','353871234776',1,'minimum two years experiences',40000,1,1,31,0),(45,'Technical Support','support analysis','2014-04-15 17:52:10','5 Stewart Hall','353871234776',1,'minimum two years experiences',40000,1,1,31,32),(46,'Tester','Tester','2014-04-15 17:57:50','5 Stewart Hall','353871234776',1,'minimum two years experiences',40000,1,1,31,36),(48,'l','df','2014-03-10 18:19:23','5 Stewart Hall','353871234776',1,'minimum two years experiences',40000,1,1,31,32),(57,'.Net developer','asp. web services','2014-03-27 19:06:43','5 Stewart Hall','353871234776',1,'minimum two years experiences',40000,1,2,24,25),(58,'.Net developer','asp. web services','2014-03-20 19:09:59','5 Stewart Hall','353871234776',1,'minimum two years experiences',40000,1,1,31,36),(59,'lecturer','lecturer','2014-03-19 13:13:29','5 Stewart Hall','353871234776',1,'2.1 ',40000,1,1,31,32);

/*Table structure for table `jobseeker` */

DROP TABLE IF EXISTS `jobseeker`;

CREATE TABLE `jobseeker` (
  `jsId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `name` varchar(30) COLLATE utf8_bin DEFAULT '',
  `address` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `expectedSalary` int(11) DEFAULT NULL,
  PRIMARY KEY (`jsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jobseeker` */

insert  into `jobseeker`(`jsId`,`username`,`password`,`name`,`address`,`email`,`phone`,`expectedSalary`) values (1,'xiuzhen','xiuzhen','Danny','Danny','xiu.z@hotmail.com','8656',50000),(4,'a','www','Jeff','jefff','ccc@hotmail.com','04376',40000),(5,'aa','cc','ccc','','ccc@hotmail.com','0871234776',40000),(6,'aa','c','ccc','','ccc@hotmail.com','0871234776',40000),(7,'www','www','www','r','www@hotmail.com','0871234776',40000),(8,'jeff','jeff','jefff','Aungier stt','jeff@hotmail.com','08712347766',40001),(9,'r','r','r','r','r@hotmail.com','1111111',40000),(10,'4','r','linda','bolton st','4@hotmail.com','22222',50000),(12,'1','1','James','James st','11@hotmail.com','34890',50000),(13,'zhenzhen','z','zhen','aa','xiuzhen1103@gmail.com','32423',30000),(14,'Micheal','xiuzhen','micheal','Crumlin','micheal@gmail.com','453909',234242),(15,'snail','xiuzhen','snail','China','snail@gmail.com','2342342',30894),(16,'test11','xiuzhen','Xiu','5 Stewart Hall','xiu@hotmail.com','0134589',300055),(17,'test111','a, a','Xiu','5 Stewart Hall','xiuu@hotmail.com','0134589',300055),(18,'test1111','aa, aa','Xiu','5 Stewart Hall','xiuuu@hotmail.com','0134589',300055),(19,'test11111','1, 1','Xiu','5 Stewart Hall','xiuuu1@hotmail.com','0134589',300055),(20,'test111111','1, 1','Xiu','5 Stewart Hall','xiuuu11@hotmail.com','0134589',300055),(21,'test22','t','test','test','test2@gmail.com','01321978',2418709),(22,'xiuzhen2','aa','aa','aa','1aa@gmail.co,','0134829',2343534),(23,'xiuzhen21','1','aa','aa','1aa@gmail.com','',NULL),(24,'xiuzhenaa','a','aa','Danny','xiu.z@','',NULL),(26,'xiuzhenaaff','1','1','1','xiu.z11@hotmail.com','353871234776',30000),(27,'xiuzhenaaffa','a','1','1','xiu.z1a1@hotmail.com','353871234776',30000),(28,'xiuzhen11q','a','Xiuzhen Chen','5 Stewart Hall','xiu.zaaa@hotmail.com','353871234776',30000),(29,'xiuzhen111','1','1','1','1@gmail.com','01546546',30000),(30,'xiuzhen1111','1','1','1','13@gmail.com','01546546',30000),(31,'xiuzhen1100','q','q','q@gmail.com','q@gmail.com','1343',30000),(32,'xiuzhen1100','q','q','q@gmail.com','q@gmail.com','1343',30000),(33,'xiuzhen11234','1','1','1','xiu.z1211@hotmail.com','1343',30000),(34,'xiuzhen112341','1','1','1','xiu.z121111@hotmail.com','1343',30000),(35,'xiu111','1','1','12@gmail.com','12@gmail.com','013989',30000),(36,'xiuzhen11134','1','Xiuzhen Chen','5 Stewart Hall','sdd@gmail.com','353871234776',30000),(37,'xiuzhen11s','s','s','s@','sdddd@gmail.com','34890',50000),(38,'test11211','1','Xiuzhen Chen','5 Stewart Hall','xiu.dz@hotmail.com','353871234776',30000);

/*Table structure for table `jobseekerskill` */

DROP TABLE IF EXISTS `jobseekerskill`;

CREATE TABLE `jobseekerskill` (
  `jobSeekerSkillId` int(11) NOT NULL AUTO_INCREMENT,
  `skillId` int(11) DEFAULT NULL,
  `jsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSeekerSkillId`),
  KEY `skillId` (`skillId`),
  KEY `jsId` (`jsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jobseekerskill` */

insert  into `jobseekerskill`(`jobSeekerSkillId`,`skillId`,`jsId`) values (7,1,26),(8,2,26),(9,0,26),(10,2,27),(11,0,27),(12,1,27),(13,1,28),(14,0,28),(15,1,29),(16,2,29),(17,1,30),(18,2,30),(19,2,31),(20,1,31),(21,1,32),(22,2,32),(23,2,33),(24,1,33),(25,2,34),(26,0,34),(27,1,34),(28,4,35),(29,3,35),(30,3,36),(31,2,36),(38,3,1),(49,1,1),(54,1,1),(55,3,1),(56,3,37),(57,1,37),(58,1,38),(59,2,38);

/*Table structure for table `jobskill` */

DROP TABLE IF EXISTS `jobskill`;

CREATE TABLE `jobskill` (
  `jobSkillId` int(11) NOT NULL AUTO_INCREMENT,
  `jobId` int(11) DEFAULT NULL,
  `skillId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSkillId`),
  KEY `jobId` (`jobId`),
  KEY `skillId` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jobskill` */

insert  into `jobskill`(`jobSkillId`,`jobId`,`skillId`) values (1,57,2),(2,57,3),(3,58,4),(4,58,3),(5,59,3),(6,59,1);

/*Table structure for table `pastexperience` */

DROP TABLE IF EXISTS `pastexperience`;

CREATE TABLE `pastexperience` (
  `pxId` int(11) NOT NULL AUTO_INCREMENT,
  `jobDescription` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `duty` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `empName` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `startDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reasonForLeave` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `jsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pxId`),
  KEY `jsId` (`jsId`),
  CONSTRAINT `pastexperience_ibfk_1` FOREIGN KEY (`jsId`) REFERENCES `jobseeker` (`jsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `pastexperience` */

insert  into `pastexperience`(`pxId`,`jobDescription`,`duty`,`empName`,`email`,`phone`,`address`,`startDate`,`endDate`,`reasonForLeave`,`jsId`) values (1,'waitress','barmaid','Mary','mary@gmail.com','03473892','Foley st','2013-11-09 20:51:35','2014-10-10 20:51:38','holidays',1),(5,'reception','greeting, appointment','Eva','eva@gmail.com','03473892','Foley st','2013-12-05 11:24:18','2014-10-27 21:17:02','bored',1),(9,'reception','intern','Mayr','mary@gmail.com','013487','Aungier St','2011-12-13 21:48:46','2013-12-09 21:48:51','holidays',1);

/*Table structure for table `skill` */

DROP TABLE IF EXISTS `skill`;

CREATE TABLE `skill` (
  `skillId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  `skillCategoryId` int(11) NOT NULL,
  PRIMARY KEY (`skillId`),
  KEY `skillCategoryId` (`skillCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `skill` */

insert  into `skill`(`skillId`,`name`,`skillCategoryId`) values (1,'Java',2),(2,'.Net',2),(3,'J2EE',2),(4,'C#',2),(5,'Web Service',3),(6,'Asp',3),(7,'DBA',3),(8,'Test',1);

/*Table structure for table `skillcategory` */

DROP TABLE IF EXISTS `skillcategory`;

CREATE TABLE `skillcategory` (
  `skillCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`skillCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `skillcategory` */

insert  into `skillcategory`(`skillCategoryId`,`name`,`parentId`,`level`) values (1,'Software Development',NULL,0),(2,'Progamm',1,1),(3,'.Net',1,0),(4,'Mechanic',1,1),(5,'Design',1,0),(6,'Design',6,1),(7,'Design',1,1),(8,'Product Design',1,1),(9,'Home Service',4,1),(19,'Engineering',NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
