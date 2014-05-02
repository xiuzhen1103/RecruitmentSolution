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

insert  into `applyjob`(`applyJobId`,`jobseekerId`,`jobId`,`cvId`) values (28,29,18,24),(29,29,18,24),(31,32,18,25),(45,41,61,35),(48,27,19,58),(49,29,76,24),(50,32,19,61),(51,32,32,25),(52,33,62,62),(53,1,19,55),(54,1,62,64),(55,92,13,65),(56,94,64,66),(57,94,13,66),(58,95,1,67),(59,95,12,67),(60,95,2,67),(61,26,60,21),(62,26,57,21),(63,26,59,21),(64,41,67,63),(65,32,29,25),(66,32,62,25),(67,32,57,25),(68,32,60,25),(69,1,18,55),(70,32,35,25),(71,32,58,25),(72,32,28,25),(73,1,34,55),(74,1,32,55),(75,1,62,55),(76,1,35,68),(77,27,18,58),(78,27,34,58),(79,27,27,58),(80,27,28,58),(81,4,67,57),(82,4,61,57),(83,93,13,69),(84,93,64,69);

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

insert  into `area`(`areaId`,`parentId`,`areaName`,`level`) values (0,NULL,'All Country',0),(1,NULL,'Ireland',0),(2,NULL,'China',0),(3,1,'Dublin',1),(4,1,'Donegal',1),(5,1,'Sligo',1),(6,1,'Meath',1),(7,1,'Wicklow',1),(8,1,'Wexford',1),(9,1,'Kildare',1),(10,1,'Clare',1),(11,1,'Galway',1),(12,NULL,'UK',0),(15,1,'Waterford',1),(20,4,'Letterkenny',2),(21,4,'Ballybofey',2),(23,2,'BeiJing',1),(24,2,'FuJian',1),(25,24,'FuZhou',2),(26,24,'XiaMen',2),(27,2,'HuBei',1),(28,27,'WuHan',2),(29,12,'London',1),(30,29,'London City',2),(31,1,'',1),(32,3,'Dublin City Center',2),(33,3,'Dublin 2',2),(35,3,'Dublin 4',2),(36,3,'Dublin 3',2),(37,23,'ChaoYang',1),(38,2,'ChengDu',1),(39,3,'Dublin 24',2),(41,3,'City West',2),(42,3,'Dublin 24',2);

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

insert  into `cv`(`cvId`,`cvTitle`,`coverLetter`,`jsId`) values (21,'26_CV.docx','Dear Sir/Madam, I am very interested in this job',26),(24,'29_CV.docx','Dear Hiring Manager, I am motivated and strong in self learning',29),(25,'32_new.docx','Dear Sir/Madam, I am very interested in this job',32),(35,'41_CV.docx','Dear Sir/Madam, I am very interested in this job',41),(55,'1_new.docx','Dear Sir/Madam, I am passion and hard working',1),(57,'4_CV_April.docx','Dear Hiring Manager, I am very interested in this position. ',4),(58,'27_CV_MAY.docx','Dear Hiring Manager, I am very interested in this position as an excellent opportunity to express my knowledge.',27),(59,'28_myCV.docx','',28),(60,'30_newest.docx','Dear Hiring Manager, I am very interested in this position with my past experiences and skills that matches with this job.',30),(61,'32_tCV.docx','Dear Sir, Madam, I am very interested in UI design, I am experienced in number of different UI framework. ',32),(62,'33_Brian.docx','Dear Hiring Manager, I am a strong candidate for this position. \r\nRegards, Brian',33),(63,'41_angelico.docx','Dear Hiring Manager, my name is Angelico, I graduated in DIT, very interested in this position.\r\nRegards,\r\nAngelico',41),(64,'1_xiuzhen.docx','Dear Sir/Madam, I am very interested in this role.\r\nRegards, XiuZhen',1),(65,'92_linda.docx','Dear Sir/Madam, I am very interested in this position.Regards, Linda',92),(66,'94_sherry.docx','Dear Sir/Madam, I am very interested in this position, Regards, Sherry',94),(67,'95_sally.docx','Dear Hiring Manager, I am very interested in this role with strong background, Regards, Sally',95),(68,'1_myCV.docx','Dear Hiring Manager, I am a graduate looking for a position as software developer. Regards, Xiuzhen',1),(69,'93_jay.docx','Dear Hiring Manager, I am Jay who love to being with people and good customer service.\r\nRegards, Jay',93);

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

insert  into `employer`(`empId`,`username`,`password`,`email`,`phone`,`contactName`,`companyName`,`address`,`webSite`,`companySize`,`companyType`,`image`,`loginTime`) values (1,'Alex','alex','alex@hotmail.com','0187987','Alex McKeown','Alex Interior Design','Malahide, Dublin','Malahide, Dublin',500,'Design','1_images.jpg','2014-05-01 23:36:31'),(6,'Bob','bing','b@gmail.com','0871234776','Bob Kenndy','Bob Technology','George St','George St',30,'IT','6_BOB.jpg','2014-05-02 00:44:24'),(8,'Ciara','c','c@gmail.com','016779879','Ciara','Ciara Technology','China','China',20,'IT','8_c.jpg','2014-05-02 00:00:58'),(9,'Anna','anna','a@gmail.com','01897987','Anna','Anna Chlid Care','Donegal','Donegal',40,'Child Care','9_anna.jpg','2014-05-01 22:46:53'),(10,'Jack','jack','jack@gmail.com','32432','Jack','DIT','Aungier St','www.dit.ie',2000,'IT','emp_default.jpg','2014-04-29 13:19:27'),(11,'Sarah','sarah','sarah@gmail.com','018979','Sarah','Kildare','Kildare','www.sarah.ie',324,'Advertisment','emp_default.jpg','2014-05-01 22:51:30'),(14,'Bella','bella','bella@gmail.com','5436985798','Bella','Bella','Bella','www.bellassociation.com',47,'Pub','14_bella.png','2014-05-02 00:55:02'),(15,'Sharon','sharon','sharon@gmail.com','5436985798','Sharon','Sharon Event Management','London','www.sharonevent.co.uk',47,'Event Management','15_event.jpg','2014-05-01 23:41:28');

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

insert  into `interviewrecord`(`interviewId`,`empId`,`jsId`,`jobId`,`cvId`,`interviewTime`,`phone`,`memo`,`status`,`createTime`) values (8,1,32,18,25,'25/4/2014 01:42','0139798','sfd',1,'2014-04-13 01:42:19'),(15,1,41,61,35,'13/5/2014 15:10','0139798','Turn left when you meet third  traffic light beside the kevin st',1,'2014-05-01 15:11:11'),(17,14,92,13,65,'14/5/2014 22:12','0139798','Please turn left when you meet the building',2,'2014-05-01 22:12:08'),(18,6,95,1,67,'14/5/2014 23:28','0139798','Please give me a ring when you downstair',1,'2014-05-01 23:28:17'),(19,6,1,62,64,'19/5/2014 23:51','0139798','When you arrived at reception, please ask for my name. ',1,'2014-05-01 23:51:48'),(20,14,93,13,69,'28/5/2014 09:55','0198789','Please ring me when you at entrance',2,'2014-05-02 00:55:38');

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `jobDesc` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `numPosition` int(11) DEFAULT NULL,
  `requirement` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
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

insert  into `job`(`jobId`,`title`,`jobDesc`,`address`,`createTime`,`phone`,`numPosition`,`requirement`,`salary`,`empId`,`countryId`,`countyId`,`districtId`,`jobCategoryId`,`skillCategoryId`) values (1,'Child Minder','Child Minder','Creche & Montessori Schools','2014-03-02 16:55:25','',3,'experiences required',40000,6,1,4,20,23,24),(2,'Child Care','Child Care','Donegal','2014-01-14 16:55:25','0137878',3,'expereinces required',30000,9,20,4,20,23,23),(12,'English Teacher','Experiences requried','Donegal','2014-04-01 16:55:25','013878',4,'experiences required',30000,9,20,4,20,23,24),(13,'Barman','barman','Aungier St','2014-04-11 16:55:25','0134898',5,'minimum 2 years experiences',35000,14,20,4,20,19,20),(14,'Database administrator','administrator','Belfast','2014-03-01 16:55:25','0145365456',1,'minimum two years experiences',40000,1,33,3,33,1,4),(18,'Business support','support','DCU','2014-01-23 16:55:25','0145365456',4,'minimum two years experiences',40000,1,32,3,32,1,2),(19,'UI Designer','Designer','DCU','2014-01-01 16:55:25','01304384',5,'minimum two years experiences',40000,1,1,3,32,1,2),(27,'.Net developer','asp. web services','Datalex','2014-04-01 16:55:25','0138787',3,'',NULL,1,2,24,26,1,2),(28,'.Net developer','asp. web services','Datalex','2013-12-18 16:55:25','0138787',4,'',NULL,1,1,3,32,1,2),(29,'.Net developer','asp. web services','Datalex','2014-01-13 16:55:25','0138787',4,'',NULL,1,1,3,33,1,2),(32,'Graduate developer','junior developer','College green','2014-03-11 16:55:25','0145365456',5,'minimum two years experiences',40000,1,1,3,35,1,2),(33,'Junior developer','.Net','China','2014-01-21 16:55:25','353871234776',3,'minimum two years experiences',40000,8,2,24,25,1,2),(34,'Junior developer','.Net','China','2014-02-01 16:55:25','353871234776',6,'minimum two years experiences',40000,8,2,24,25,1,2),(35,'Graduate developer','J2EE','College green','2013-11-30 16:55:25','353871234776',3,'minimum two years experiences',40000,1,1,3,32,1,2),(57,'.Net developer','asp. web services','Stewart Hall','2014-04-02 16:55:25','353871234776',6,'minimum two years experiences',40000,8,2,24,25,1,2),(58,'.Net developer','asp. web services','Stewart Hall','2014-04-01 16:55:25','353871234776',1,'minimum two years experiences',40000,1,1,3,36,1,2),(59,'Lecturer','lecturer','Stewart Hall','2014-03-04 16:55:25','353871234776',1,'2.1 ',40000,1,1,3,32,1,2),(60,'Database administrator','web services','DIT','2014-04-01 16:55:25','01304384',2,'minimum two years experiences',40000,6,32,3,32,1,2),(61,'Designer','product design','DIT','2014-02-24 16:55:25','0138787',2,'2.1 ',40000,1,37,23,37,5,6),(62,'J2EE Developer','J2EE Developer','D2','2014-03-24 16:55:25','353871234776',4,'minimum two years experiences',30000,6,1,3,32,1,2),(63,'IT Consultant','Computer Science, Web Design, Technology, Engineering, Creative','IBAT','2014-02-11 16:55:25','0145365456',1,'Graduated with an Honours Degree in IT/ Computer Science/ Physics/Mathematics/Engineering or related discipline ',40000,6,1,3,32,1,2),(64,'Hospitality Manager','Practical experiences required','Lodon','2014-04-12 21:29:28','353871234776',5,'Practical experiences required',40000,15,12,29,30,19,20),(67,'Interior Designer','Interior Designer','Dublin','2013-12-10 22:09:06','01349798',7,'experiences required',30000,1,1,3,36,5,6),(75,'Software Quality Assurance','Experiences required','China','2014-04-30 19:13:14','138900980',3,'Experiences required',30000,8,2,23,37,1,2),(76,'Event manager','Raw Marketing is looking for an energetic and vibrant event manager to work both within in our office and out in the field.','Lodon','2014-04-30 23:38:26','01987987',3,' The right person will combine strong account management and creative skills, this is a position for an ambitious and driven person who wants to get invloved in marketing at it rawest.',35000,15,12,29,30,21,22),(79,'Advertisement marketing','experiences and qualification in Business Management preferred. ','Kildare St','2014-05-01 22:53:09','018798',3,'experiences required to fill this role',30000,11,1,3,39,21,22),(80,'Event manager assistant','Assistant of Event manager of London Bridge project','London','2014-05-01 23:44:25','0178687',3,'Experiences in event industry and 2.1 in Bachelor Degree of Business Management',31000,15,12,29,30,19,20),(81,'Event manager assistant','Assistant of Event manager of London Bridge project','London','2014-05-01 23:44:28','0178687',3,'Experiences in event industry and 2.1 in Bachelor Degree of Business Management',31000,15,12,29,30,19,20);

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

insert  into `jobseeker`(`jsId`,`username`,`password`,`name`,`address`,`email`,`phone`,`expectedSalary`,`status`,`image`,`loginTime`) values (1,'xiuzhen','xiuzhen','Xiuzhen','Bolton Street','xiu.z@hotmail.com','01878656',50000,0,'1_xiuzhen.jpg','2014-05-01 23:57:37'),(4,'micheal','micheal','Micheal','Donegal','micheal@hotmail.com','01987897',40000,0,'4_micheal.png','2014-05-02 00:09:54'),(26,'jeff','jeff','Jeff','Blanchardstown','jeff@hotmail.com','353845245676',30000,0,'26_jeff.jpg','2014-05-01 23:29:29'),(27,'luke','luke','Luke','Ballsbridge','luke@hotmail.com','35383145645',30000,0,'27_luke.png','2014-05-02 00:02:10'),(28,'fiona','fiona','Fiona','Rathfarnham','fiona@hotmail.com','35385456546',30000,0,'28_fiona.jpg','2014-05-01 22:39:18'),(29,'lisa','lisa','Lisa','Lodon','lisa@hotmail.com','01546546',30000,0,'29_lisa.jpg','2014-05-01 22:33:30'),(30,'kevin','kevin','Kevin','Kevin St','kevin@gmail.com','01546546',30000,0,'default.jpg','2014-05-01 21:43:05'),(32,'denise','denise','Denise','Malahide','denise@gmail.com','017981343',30000,0,'default.jpg','2014-05-01 23:45:36'),(33,'brian','brian','Brian','Fairview','brian@hotmail.com','04541343',30000,0,'default.jpg','2014-05-01 21:45:47'),(39,'yuanyong','yuanyong','Tom','China','yuanyong@hotmail.com','014897398',30000,0,'default.jpg','2014-03-16 14:21:11'),(41,'angelico','1','Angelico','Ashbourne','xiuzhen1103@gmail.com','01374989',30000,0,'default.jpg','2014-05-01 23:33:26'),(92,'linda','linda','Linda','China','linda@hotmail.com','01871343',30000,1,'92_linda.jpg','2014-05-01 22:37:40'),(93,'jay','jay','Jay','China','jay@hotmail.comn','0189798',35000,1,'default.jpg','2014-05-02 00:53:32'),(94,'sherry','sherry','Sherry','China','sherry@hotmail.com','0189789',35000,0,'94_sherry.jpg','2014-05-01 22:22:55'),(95,'Sally','sally','Sally','Clanbrassil St','sally@hotmail.com','018787',30000,0,'95_sallyjpg.jpg','2014-05-01 23:37:57');

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

insert  into `jobseekerskill`(`jobSeekerSkillId`,`skillId`,`jsId`) values (17,1,30),(18,2,30),(19,2,31),(20,1,31),(21,1,32),(22,2,32),(23,2,33),(24,1,33),(25,2,34),(27,1,34),(28,4,35),(29,3,35),(30,3,36),(31,2,36),(56,3,37),(57,1,37),(58,1,38),(59,2,38),(60,4,39),(63,1,40),(65,9,41),(66,1,42),(67,2,42),(197,10,41),(198,11,41),(204,12,93),(206,13,93),(208,12,94),(211,1,1),(212,2,1),(215,14,29),(216,15,29),(219,1,27),(220,2,27),(227,1,26),(228,2,26),(231,12,92),(232,13,92),(234,24,28),(239,16,95),(240,17,95),(241,4,32),(242,5,32),(243,3,27),(246,9,4),(247,10,4);

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

insert  into `jobskill`(`jobSkillId`,`jobId`,`skillId`) values (1,57,2),(2,57,3),(3,58,4),(4,58,3),(5,59,3),(6,59,1),(10,61,10),(11,61,9),(12,1,16),(13,1,17),(21,17,19),(22,17,20),(23,17,21),(24,18,1),(25,18,2),(26,18,3),(27,19,2),(28,19,3),(29,19,1),(30,27,1),(31,27,3),(32,28,3),(33,28,4),(34,29,1),(35,29,2),(36,31,3),(37,31,4),(38,32,1),(39,32,2),(40,33,5),(41,33,3),(42,34,1),(43,34,2),(44,35,4),(45,35,2),(46,62,1),(47,62,2),(48,62,3),(52,65,12),(53,66,10),(54,67,11),(55,67,10),(56,68,2),(57,68,1),(58,68,1),(61,68,1),(66,69,1),(75,70,2),(76,70,1),(79,71,2),(80,71,1),(81,72,1),(82,72,2),(83,73,16),(99,12,16),(100,12,17),(101,75,23),(104,74,17),(105,74,16),(110,2,16),(111,76,15),(112,76,14),(115,64,12),(116,64,13),(117,63,5),(118,63,23),(119,14,19),(120,14,18),(121,77,1),(122,78,1),(129,60,3),(130,60,2),(131,79,15),(132,79,14),(133,80,13),(134,80,12),(135,81,12),(136,81,13),(139,13,12),(140,13,13);

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

insert  into `skill`(`skillId`,`name`,`skillCategoryId`) values (1,'Java',2),(2,'.Net',2),(3,'J2EE',2),(4,'C#',2),(5,'ABAP',2),(6,'Selenium',3),(7,'JBehave',3),(8,'JUnit',3),(9,'Furniture',6),(10,'CAD',6),(11,'Graphic Composition',6),(12,'Customer Skills',20),(13,'IELTS certificate',20),(14,'Computer Design Packages',22),(15,'Research',22),(16,'TESOL certificate',24),(17,'FETAC in Childcare ',24),(18,'SQL',4),(19,'Oracle',4),(20,'HANA',4),(21,'MANGO',4),(23,'Test',2),(24,'Ruby on Rails',2);

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

insert  into `skillcategory`(`skillCategoryId`,`name`,`parentId`,`level`) values (0,' ',0,0),(1,'Software Development',NULL,0),(2,'Progamm',1,1),(3,'Testing',1,1),(4,'DB Development',1,1),(5,'Design',NULL,0),(6,'Interior Design',5,1),(7,'Indutrial Design',5,1),(8,'Product Design',5,1),(9,'Home Service',5,1),(19,'Hopitality',NULL,0),(20,'Bar & Restaurant',19,1),(21,'Marketing',NULL,0),(22,'Advertisings',21,1),(23,'Education',NULL,0),(24,'Child Care',23,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
