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
  CONSTRAINT `applyjob_ibfk_1` FOREIGN KEY (`jobseekerId`) REFERENCES `jobseeker` (`jsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `applyjob` */

insert  into `applyjob`(`applyJobId`,`jobseekerId`,`jobId`,`cvId`) values (1,1,1,8),(3,1,13,11),(5,1,16,16),(10,1,1,17),(12,1,1,18),(13,1,17,1),(14,1,1,19),(15,1,1,19),(16,1,1,20),(17,1,1,20),(18,1,1,17),(19,1,0,18),(20,1,0,18),(21,1,0,19),(22,1,0,17),(23,1,0,19),(24,1,0,18),(25,1,0,19),(26,1,0,18),(28,29,18,24),(29,29,18,24),(31,32,18,25),(43,1,19,28),(45,41,61,35),(46,41,63,35),(47,1,18,5),(48,1,18,40),(49,1,29,17),(50,1,32,3);

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `areaName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`areaId`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `area` (`areaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `area` */

insert  into `area`(`areaId`,`parentId`,`areaName`,`level`) values (0,NULL,'All Country',0),(1,NULL,'Ireland',0),(2,NULL,'China',0),(3,1,'Dublin',1),(4,1,'Donegal',1),(5,1,'Sligo',1),(6,1,'Meath',1),(7,1,'Wicklow',1),(8,1,'Wexford',1),(9,1,'Kildare',1),(10,1,'Clare',1),(11,1,'Galway',1),(12,NULL,'UK',0),(15,1,'Waterford',1),(20,4,'Letterkenny',2),(21,4,'Castlefin',2),(23,2,'BeiJing',1),(24,2,'FuJian',1),(25,24,'FuZhou',2),(26,24,'XiaMen',2),(27,2,'HuBei',1),(28,27,'WuHan',2),(29,12,'London',1),(30,29,'London City',2),(31,1,'',1),(32,3,'Dublin City Center',2),(33,3,'Dublin 2',2),(35,3,'Dublin 4',2),(36,3,'Dublin 3',2),(37,23,'ChaoYang',1),(38,2,'ChengDu',1),(39,3,'Dublin 24',2),(41,3,'City West',2),(42,3,'Dublin 24',2);

/*Table structure for table `cv` */

DROP TABLE IF EXISTS `cv`;

CREATE TABLE `cv` (
  `cvId` int(11) NOT NULL AUTO_INCREMENT,
  `cvTitle` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `coverLetter` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `jsId` int(11) NOT NULL,
  PRIMARY KEY (`cvId`),
  KEY `cv_job_fk` (`jsId`),
  CONSTRAINT `cv_job_fk` FOREIGN KEY (`jsId`) REFERENCES `jobseeker` (`jsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cv` */

insert  into `cv`(`cvId`,`cvTitle`,`coverLetter`,`jsId`) values (2,'b','bbbbbbbbbbbbbbbbb',4),(21,'26_CV.docx','Dear Sir/Madam',26),(23,'26_er.txt','cv',26),(24,'29_CV.docx','CV',29),(25,'32_new.docx','my CV',32),(35,'41_CV.docx','Mr/MrsMr/MrsMr/MrsMr/Mrs',41),(54,NULL,'sfsfs',88),(55,'1_Question 2.docx','f',1);

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
  `image` varchar(50) COLLATE utf8_bin DEFAULT 'emp_default.jpg' COMMENT 'image of company',
  `loginTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `employer` */

insert  into `employer`(`empId`,`username`,`password`,`email`,`phone`,`contactName`,`companyName`,`address`,`webSite`,`companySize`,`companyType`,`image`,`loginTime`) values (1,'alex@hotmail.com','1','alex@hotmail.com',NULL,'Alex',NULL,NULL,NULL,NULL,NULL,'emp_default.jpg',NULL),(6,'bob','bing','b@gmail.com','0871234776','Tracy','Tracy','George St','George St',30,'retail','emp_default.jpg','2014-04-28 23:11:32'),(8,'Ciara','c','c@gmail.com','cc','cc','cc','cc','www.cc.vom',20,'cc','emp_default.jpg',NULL),(9,'Anna','a','a@gmail.com','a','a','a','a','a',0,'a','emp_default.jpg',NULL),(10,'Mary','mary','mary@gmail.com','32432','macy','macy','macy','macy',20,'IT','emp_default.jpg',NULL),(11,'Sarah','sarah','sarah@gmail.com','3q2w4','sd','sfd','sfd','sdf',324,'423','emp_default.jpg',NULL),(14,'Tom','tom','tom@gmail.com','5436985798','Bella','Bella','Bella','www.bella.com',47,'Pub','emp_default.jpg',NULL),(15,'aaaa','aaa','aaa@gmail.com','5436985798','Bella','Bella','Bella','www.bella.com',47,'Pub','emp_default.jpg',NULL);

/*Table structure for table `interviewrecord` */

DROP TABLE IF EXISTS `interviewrecord`;

CREATE TABLE `interviewrecord` (
  `interviewId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NOT NULL COMMENT 'employee id',
  `jsId` int(11) NOT NULL COMMENT 'job seeker id',
  `jobId` int(11) NOT NULL COMMENT 'job id0',
  `cvId` int(11) NOT NULL COMMENT 'cv id',
  `interviewTime` varchar(20) COLLATE utf8_bin NOT NULL,
  `phone` varchar(15) COLLATE utf8_bin NOT NULL,
  `memo` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'fail(0), No interview(1), success(2)',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`interviewId`),
  KEY `empId` (`empId`),
  KEY `jsId` (`jsId`),
  KEY `jobId` (`jobId`),
  KEY `cvId` (`cvId`),
  CONSTRAINT `interviewrecord_ibfk_1` FOREIGN KEY (`empId`) REFERENCES `employer` (`empId`),
  CONSTRAINT `interviewrecord_ibfk_2` FOREIGN KEY (`jsId`) REFERENCES `jobseeker` (`jsId`),
  CONSTRAINT `interviewrecord_ibfk_3` FOREIGN KEY (`jobId`) REFERENCES `job` (`jobId`),
  CONSTRAINT `interviewrecord_ibfk_4` FOREIGN KEY (`cvId`) REFERENCES `cv` (`cvId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `interviewrecord` */

insert  into `interviewrecord`(`interviewId`,`empId`,`jsId`,`jobId`,`cvId`,`interviewTime`,`phone`,`memo`,`status`,`createTime`) values (8,1,32,18,25,'25/4/2014 01:42','0139798','sfd',1,'2014-04-13 01:42:19'),(24,6,41,61,35,'1/4/2014 16:43','sdf','trre',0,'2014-04-22 16:43:35');

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `jobDesc` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `numPosition` int(11) DEFAULT NULL,
  `requirement` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `countyId` int(11) DEFAULT NULL,
  `districtId` int(11) DEFAULT NULL,
  `jobCategoryId` int(11) DEFAULT NULL,
  `skillCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobId`),
  KEY `empId` (`empId`),
  KEY `countyId` (`countyId`),
  KEY `countryId` (`countryId`),
  KEY `districtId` (`districtId`),
  KEY `jobCategoryId` (`jobCategoryId`),
  KEY `skillCategoryId` (`skillCategoryId`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`empId`) REFERENCES `employer` (`empId`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`countyId`) REFERENCES `area` (`areaId`),
  CONSTRAINT `job_ibfk_3` FOREIGN KEY (`countryId`) REFERENCES `area` (`areaId`),
  CONSTRAINT `job_ibfk_4` FOREIGN KEY (`districtId`) REFERENCES `area` (`areaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `job` */

insert  into `job`(`jobId`,`title`,`jobDesc`,`address`,`createTime`,`phone`,`numPosition`,`requirement`,`salary`,`empId`,`countryId`,`countyId`,`districtId`,`jobCategoryId`,`skillCategoryId`) values (1,'Child Minder','Child Minder','Creche & Montessori Schools','2014-03-02 16:55:25','',0,'experiences required',40000,6,1,4,20,23,24),(2,'Advertising','advertising','Bolton st','2014-01-14 16:55:25','0137878',1,'expereinces required',30000,1,1,4,20,21,22),(12,'Designer','Designer','Malahide','2014-04-01 16:55:25','013878',1,'experiences required',30000,9,1,4,20,5,6),(13,'barman','barman','Aungier St','2014-04-11 16:55:25','0134898',1,'minimum 2 years experiences',35000,9,1,4,20,19,20),(14,'Database administrator','administrator','Belfast','2014-03-01 16:55:25','0145365456',1,'minimum two years experiences',40000,1,1,3,33,1,4),(17,'Database administrator','lecturer','DBS','2014-02-01 16:55:25','353871234776',2,'minimum two years experiences',40000,1,1,4,20,1,4),(18,'business support','support','DCU','2014-01-23 16:55:25','0145365456',0,'minimum two years experiences',40000,1,32,3,32,1,2),(19,'UI Designer','Designer','DCU','2014-01-01 16:55:25','01304384',1,'minimum two years experiences',40000,1,1,3,32,1,2),(27,'.Net developer','asp. web services','Datalex','2014-04-01 16:55:25','0138787',1,'',NULL,1,2,24,26,1,2),(28,'.Net developer','asp. web services','Datalex','2013-12-18 16:55:25','0138787',1,'',NULL,1,1,3,32,1,2),(29,'.Net developer','asp. web services','Datalex','2014-01-13 16:55:25','0138787',1,'',NULL,1,1,3,33,1,2),(31,'graduate developer','junior developer','College green','2014-04-01 16:55:25','0145365456',1,'minimum two years experiences',40000,1,1,3,35,1,2),(32,'graduate developer','junior developer','College green','2014-03-11 16:55:25','0145365456',1,'minimum two years experiences',40000,1,1,3,35,1,2),(33,'Junior developer','.Net','Ballsbridge','2014-01-21 16:55:25','353871234776',1,'minimum two years experiences',40000,1,2,24,25,1,2),(34,'Junior developer','.Net','Ballsbridge','2014-02-01 16:55:25','353871234776',1,'minimum two years experiences',40000,1,2,24,25,1,2),(35,'graduate developer','J2EE','College green','2013-11-30 16:55:25','353871234776',1,'minimum two years experiences',40000,1,1,3,32,1,2),(57,'.Net developer','asp. web services','5 Stewart Hall','2014-04-02 16:55:25','353871234776',1,'minimum two years experiences',40000,1,2,24,25,1,2),(58,'.Net developer','asp. web services','5 Stewart Hall','2014-04-01 16:55:25','353871234776',1,'minimum two years experiences',40000,1,1,3,36,1,2),(59,'lecturer','lecturer','5 Stewart Hall','2014-03-04 16:55:25','353871234776',1,'2.1 ',40000,1,1,3,32,1,2),(60,'Database administrator','web services','DIT','2014-04-01 16:55:25','01304384',2,'minimum two years experiences',40000,6,33,3,32,1,2),(61,'Designer','product design','DIT','2014-02-24 16:55:25','0138787',2,'2.1 ',40000,6,37,23,37,5,6),(62,'J2EE Developer','J2EE Developer','D2','2014-03-24 16:55:25','353871234776',1,'minimum two years experiences',30000,6,1,3,32,1,2),(63,'Teacher','Teacher','IBAT','2014-02-11 16:55:25','0145365456',1,'2.1 ',40000,6,37,23,37,5,6),(64,'Hospitality Manager','Practical experiences required','5 Stewart Hall','2014-04-12 21:29:28','353871234776',1,'Practical experiences required',40000,1,1,3,32,19,20),(67,'Interior Designer','Interior Designer','Dublin','2013-12-10 22:09:06','01349798',1,'experiences required',30000,8,1,3,36,5,6),(68,'lecturer','asp. web services','5 Stewart Hall','2014-04-23 14:48:44','353871234776',NULL,'minimum two years experiences',NULL,6,1,3,41,1,2),(69,'Developer','23423','123','2014-04-23 15:02:03','353871234776',1,'minimum two years experiences',40000,6,1,3,32,1,2),(70,'Developer','23423','123','2014-04-23 15:21:26','353871234776',1,'minimum two years experiences',40000,6,32,3,32,1,2);

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
  `status` int(4) DEFAULT '0',
  `image` varchar(50) COLLATE utf8_bin DEFAULT 'default.jpg',
  `loginTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`jsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jobseeker` */

insert  into `jobseeker`(`jsId`,`username`,`password`,`name`,`address`,`email`,`phone`,`expectedSalary`,`status`,`image`,`loginTime`) values (1,'xiuzhen','xiuzhen','Linda','Bolton St','xiu.z@hotmail.com','01878656',50000,0,'1_cat.jpg','2014-04-28 23:49:20'),(4,'a','www','Jeff','jefff','ccc@hotmail.com','01987897',40000,0,'upload/default.jpg',NULL),(26,'xiuzhenaaff','1','1','1','xiu.z11@hotmail.com','353845245676',30000,0,'upload/default.jpg',NULL),(27,'xiuzhenaaffa','a','1','1','xiu.z1a1@hotmail.com','35383145645',30000,0,'upload/default.jpg',NULL),(28,'xiuzhen11q','a','Xiuzhen Chen','5 Stewart Hall','xiu.zaaa@hotmail.com','35385456546',30000,0,'upload/default.jpg',NULL),(29,'xiuzhen111','1','1','1','1@gmail.com','01546546',30000,0,'upload/default.jpg',NULL),(30,'xiuzhen1111','1','1','1','13@gmail.com','01546546',30000,0,'upload/default.jpg',NULL),(32,'xiuzhen1100','q','q','q@gmail.com','q@gmail.com','017981343',30000,0,'upload/default.jpg',NULL),(33,'xiuzhen11234','1','1','1','xiu.z1211@hotmail.com','04541343',30000,0,'upload/default.jpg',NULL),(39,'yuanyong','1234','xiuzhen','xiuzhen','yuanyong@gmai..com','014897398',30000,0,'upload/default.jpg',NULL),(41,'Angelico','1','angelico','DIT','xiuzhen1103@gmail.com','01374989',3000,0,'upload/default.jpg',NULL),(42,'s','1','1','DIT','xiu.z28@hotmail.com','013435436',30000,0,'upload/default.jpg',NULL),(88,'xiuzhen2434','1','Xiuzhen Chen','5 Stewart Hall','angelico3343@gmail.com','353871234776',30000,0,'88_26866090c9a6d17.jpg','2014-04-22 16:02:04'),(92,'test3','1','Linda','','xiu.z@hotmail.com','1343',30000,0,'default.jpg','2014-04-28 23:09:00');

/*Table structure for table `jobseekerskill` */

DROP TABLE IF EXISTS `jobseekerskill`;

CREATE TABLE `jobseekerskill` (
  `jobSeekerSkillId` int(11) NOT NULL AUTO_INCREMENT,
  `skillId` int(11) DEFAULT NULL,
  `jsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSeekerSkillId`),
  KEY `skillId` (`skillId`),
  KEY `jsId` (`jsId`),
  CONSTRAINT `jobseekerskill_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jobseekerskill` */

insert  into `jobseekerskill`(`jobSeekerSkillId`,`skillId`,`jsId`) values (7,1,26),(8,2,26),(10,2,27),(12,1,27),(13,1,28),(15,1,29),(16,2,29),(17,1,30),(18,2,30),(19,2,31),(20,1,31),(21,1,32),(22,2,32),(23,2,33),(24,1,33),(25,2,34),(27,1,34),(28,4,35),(29,3,35),(30,3,36),(31,2,36),(56,3,37),(57,1,37),(58,1,38),(59,2,38),(60,4,39),(63,1,40),(65,9,41),(66,1,42),(67,2,42),(72,9,4),(73,10,4),(173,2,1),(175,1,1);

/*Table structure for table `jobskill` */

DROP TABLE IF EXISTS `jobskill`;

CREATE TABLE `jobskill` (
  `jobSkillId` int(11) NOT NULL AUTO_INCREMENT,
  `jobId` int(11) DEFAULT NULL,
  `skillId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSkillId`),
  KEY `jobId` (`jobId`),
  KEY `skillId` (`skillId`),
  CONSTRAINT `jobskill_ibfk_1` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jobskill` */

insert  into `jobskill`(`jobSkillId`,`jobId`,`skillId`) values (1,57,2),(2,57,3),(3,58,4),(4,58,3),(5,59,3),(6,59,1),(7,60,3),(8,60,1),(9,60,2),(10,61,10),(11,61,9),(12,1,16),(13,1,17),(14,2,14),(15,2,15),(16,12,9),(17,13,12),(18,13,13),(19,14,18),(20,14,19),(21,17,19),(22,17,20),(23,17,21),(24,18,1),(25,18,2),(26,18,3),(27,19,2),(28,19,3),(29,19,1),(30,27,1),(31,27,3),(32,28,3),(33,28,4),(34,29,1),(35,29,2),(36,31,3),(37,31,4),(38,32,1),(39,32,2),(40,33,5),(41,33,3),(42,34,1),(43,34,2),(44,35,4),(45,35,2),(46,62,1),(47,62,2),(48,62,3),(49,63,9),(50,64,12),(51,64,13),(52,65,12),(53,66,10),(54,67,11),(55,67,10),(56,68,2),(57,68,1),(58,68,1),(61,68,1),(66,69,1),(75,70,2),(76,70,1),(79,71,2),(80,71,1),(81,72,1),(82,72,2);

/*Table structure for table `skill` */

DROP TABLE IF EXISTS `skill`;

CREATE TABLE `skill` (
  `skillId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  `skillCategoryId` int(11) NOT NULL,
  PRIMARY KEY (`skillId`),
  KEY `skillCategoryId` (`skillCategoryId`),
  CONSTRAINT `skill_ibfk_1` FOREIGN KEY (`skillCategoryId`) REFERENCES `skillcategory` (`skillCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `skill` */

insert  into `skill`(`skillId`,`name`,`skillCategoryId`) values (1,'Java',2),(2,'.Net',2),(3,'J2EE',2),(4,'C#',2),(5,'ABAP',2),(6,'Selenium',3),(7,'JBehave',3),(8,'JUnit',3),(9,'Furniture',6),(10,'CAD',6),(11,'Graphic Composition',6),(12,'Customer Skills',20),(13,'IELTS certificate',20),(14,'Computer Design Packages',22),(15,'Customer Skills',22),(16,'TESOL certificate',24),(17,'FETAC in Childcare ',24),(18,'SQL',4),(19,'Oracle',4),(20,'HANA',4),(21,'MANGO',4),(22,'',0),(23,'Test',2);

/*Table structure for table `skillcategory` */

DROP TABLE IF EXISTS `skillcategory`;

CREATE TABLE `skillcategory` (
  `skillCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`skillCategoryId`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `skillcategory_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `skillcategory` (`skillCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `skillcategory` */

insert  into `skillcategory`(`skillCategoryId`,`name`,`parentId`,`level`) values (0,' ',0,0),(1,'Software Development',NULL,0),(2,'Progamm',1,1),(3,'Testing',1,1),(4,'DB Development',1,1),(5,'Design',NULL,0),(6,'Interior Design',5,1),(7,'Indutrial Design',5,1),(8,'Product Design',5,1),(9,'Home Service',5,1),(19,'Hopitality',NULL,0),(20,'Bar & Restaurant',19,1),(21,'Marketing',NULL,0),(22,'Advertisings',21,1),(23,'Education',NULL,0),(24,'Child Care',23,1),(25,'Design',1,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
