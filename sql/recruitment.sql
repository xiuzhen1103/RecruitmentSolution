/*
Navicat MySQL Data Transfer

Source Server         : Leo
Source Server Version : 50701
Source Host           : localhost:3306
Source Database       : recruitment

Target Server Type    : MYSQL
Target Server Version : 50701
File Encoding         : 65001

Date: 2014-04-01 23:19:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('1', 'xiuzhen', 'xiuzhen');
INSERT INTO `administrator` VALUES ('2', 'zhen', 'zhen');
INSERT INTO `administrator` VALUES ('3', 'zhen', 'zhen');

-- ----------------------------
-- Table structure for applyjob
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of applyjob
-- ----------------------------
INSERT INTO `applyjob` VALUES ('1', '1', '1', '8');
INSERT INTO `applyjob` VALUES ('3', '1', '13', '11');
INSERT INTO `applyjob` VALUES ('4', '1', '12', '5');
INSERT INTO `applyjob` VALUES ('5', '1', '16', '16');
INSERT INTO `applyjob` VALUES ('10', '1', '1', '17');
INSERT INTO `applyjob` VALUES ('12', '1', '1', '18');
INSERT INTO `applyjob` VALUES ('13', '1', '17', '1');
INSERT INTO `applyjob` VALUES ('14', '1', '1', '19');
INSERT INTO `applyjob` VALUES ('15', '1', '1', '19');
INSERT INTO `applyjob` VALUES ('16', '1', '1', '20');
INSERT INTO `applyjob` VALUES ('17', '1', '1', '20');
INSERT INTO `applyjob` VALUES ('18', '1', '1', '17');

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `areaName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`areaId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('0', null, 'All Country', '0', '0', '0');
INSERT INTO `area` VALUES ('1', '0', 'Ireland', '0', '34', '34');
INSERT INTO `area` VALUES ('2', '0', 'China', '0', '9', '34');
INSERT INTO `area` VALUES ('3', '1', 'Monaghan', '1', '2', '2');
INSERT INTO `area` VALUES ('4', '1', 'Donegal', '1', '45', '34');
INSERT INTO `area` VALUES ('5', '1', 'Sligo', '1', '42', '34');
INSERT INTO `area` VALUES ('6', '1', 'Meath', '1', '34', '34');
INSERT INTO `area` VALUES ('7', '1', 'Wicklow', '1', '13', '34');
INSERT INTO `area` VALUES ('8', '1', 'Wexford', '1', '3342', '32');
INSERT INTO `area` VALUES ('9', '1', 'Kildare', '1', '323', '34');
INSERT INTO `area` VALUES ('10', '1', 'Clare', '1', '34', '34');
INSERT INTO `area` VALUES ('11', '1', 'Galway', '1', '59', '58');
INSERT INTO `area` VALUES ('12', '0', 'UK', '0', '54', '34');
INSERT INTO `area` VALUES ('15', '1', 'Waterford', '1', '33', '4');
INSERT INTO `area` VALUES ('20', '4', 'Letterkenny', '2', '45', '546');
INSERT INTO `area` VALUES ('21', '4', 'Castlefin', '2', '34', null);
INSERT INTO `area` VALUES ('23', '2', 'BeiJing', '1', '78', '98');
INSERT INTO `area` VALUES ('24', '2', 'FuJian', '1', '89', '43');
INSERT INTO `area` VALUES ('25', '24', 'FuZhou', '2', '45', '43');
INSERT INTO `area` VALUES ('26', '24', 'XiaMen', '2', '43', '34');
INSERT INTO `area` VALUES ('27', '2', 'HuBei', '1', '89', '67');
INSERT INTO `area` VALUES ('28', '27', 'WuHan', '2', '56', '45');
INSERT INTO `area` VALUES ('29', '12', 'London', '1', '43', '34');
INSERT INTO `area` VALUES ('30', '29', 'London City', '2', '43', '34');
INSERT INTO `area` VALUES ('31', '1', 'Dublin', '1', '34', '43');
INSERT INTO `area` VALUES ('32', '31', 'Dublin City Center', '2', '34', '32');
INSERT INTO `area` VALUES ('33', '31', 'Dublin 2', '2', '32', '23');
INSERT INTO `area` VALUES ('35', '31', 'Dublin 4', '2', '34', '34');
INSERT INTO `area` VALUES ('36', '31', 'Dublin 3', '2', '59', '4');
INSERT INTO `area` VALUES ('37', '23', 'ChaoYang', '1', '2', '4');
INSERT INTO `area` VALUES ('38', '2', 'ChengDu', '1', '439', '23');

-- ----------------------------
-- Table structure for cv
-- ----------------------------
DROP TABLE IF EXISTS `cv`;
CREATE TABLE `cv` (
  `cvId` int(11) NOT NULL AUTO_INCREMENT,
  `cvTitle` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `coverLetter` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `jsId` int(11) NOT NULL,
  PRIMARY KEY (`cvId`),
  KEY `cv_job_fk` (`jsId`),
  CONSTRAINT `cv_job_fk` FOREIGN KEY (`jsId`) REFERENCES `jobseeker` (`jsId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cv
-- ----------------------------
INSERT INTO `cv` VALUES ('1', 'aaaaaa', 'aaaaa', '1');
INSERT INTO `cv` VALUES ('2', 'b', 'bbbbbbbbbbbbbbbbb', '4');
INSERT INTO `cv` VALUES ('3', 'test CV', 'test CV', '1');
INSERT INTO `cv` VALUES ('4', '1_group_journal.docx', 'Mr/Mrs', '12');
INSERT INTO `cv` VALUES ('5', '1_group_journal.docx', 'Dear Sir/Madam', '1');
INSERT INTO `cv` VALUES ('8', 'gfjkh', 'dfskhj', '1');
INSERT INTO `cv` VALUES ('11', '24', '234', '1');
INSERT INTO `cv` VALUES ('16', '1_coverLetter.docx', '5665464', '1');
INSERT INTO `cv` VALUES ('17', '1_null', 'Mr/Mrs', '1');
INSERT INTO `cv` VALUES ('18', '1_salesCV.docx', 'Mr/Mrs', '1');
INSERT INTO `cv` VALUES ('19', '1_Submission Form.docx', 'Mr/Mrs', '1');
INSERT INTO `cv` VALUES ('20', '1_CV.docx', 'Mr/Mrs', '1');

-- ----------------------------
-- Table structure for employer
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of employer
-- ----------------------------
INSERT INTO `employer` VALUES ('1', 'Darren', 'd', 'd@gmail.com', '234', 'aaaaaa', 'aaaaaaa', 'aaaaaaa', 'aaaaaaa', '234', 'aaaaaaaaa');
INSERT INTO `employer` VALUES ('6', 'bob', 'b', 'b@gmail.com', '0871234776', 'Tracy', 'Tracy', 'George St', 'www.tracy.com', '30', 'retail');
INSERT INTO `employer` VALUES ('8', 'Ciara', 'c', 'c@gmail.com', 'cc', 'cc', 'cc', 'cc', 'www.cc.vom', '20', 'cc');
INSERT INTO `employer` VALUES ('9', 'Anna', 'a', 'a@gmail.com', 'a', 'a', 'a', 'a', 'a', '0', 'a');
INSERT INTO `employer` VALUES ('10', 'Mary', 'mary', 'mary@gmail.com', '32432', 'macy', 'macy', 'macy', 'macy', '20', 'IT');
INSERT INTO `employer` VALUES ('11', 'Sarah', 'sarah', 'sarah@gmail.com', '3q2w4', 'sd', 'sfd', 'sfd', 'sdf', '324', '423');
INSERT INTO `employer` VALUES ('14', 'Tom', 'tom', 'tom@gmail.com', '5436985798', 'Bella', 'Bella', 'Bella', 'www.bella.com', '47', 'Pub');
INSERT INTO `employer` VALUES ('15', 'aaaa', 'aaa', 'aaa@gmail.com', '5436985798', 'Bella', 'Bella', 'Bella', 'www.bella.com', '47', 'Pub');
INSERT INTO `employer` VALUES ('16', 'darling', 'zhen', 'da@gmail.com', '0138778', 'DaWa', 'DIT', 'Aungier st', 'www.dit.ie', '100', 'Education');
INSERT INTO `employer` VALUES ('17', 'darling1', '1', 'darling1@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('18', 'darling111', '1', 'darling12@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('19', 'darling1111', '1', 'darling121@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('20', 'darling11111', '1', 'darling1211@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('21', 'darling111111', '1', 'darling12111@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('22', 'darling1111111', '1', 'darling121111@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('23', 'darling11111111', 'q', 'darling1211111@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('24', 'darling111111111', '1', 'darling12111111@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('25', 'darling2', '1', 'darling2@gmail.com', '1', 'aa', 'aa', 'aa', 'www.cc.vom', '100', 'Pub');
INSERT INTO `employer` VALUES ('26', 'darling22', '1', 'darling22@gmail.com', '1', 'aa', 'aa', 'aa', 'www.cc.vom', '100', 'Pub');
INSERT INTO `employer` VALUES ('27', 'darling1111111111', '1', 'darling121111111@gmail.com', '1543', 'aa', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('28', 'darling222', '2', 'darling222@gmail.com', '1', 'aa', 'aa', 'aa', 'www.cc.vom', '100', 'Pub');
INSERT INTO `employer` VALUES ('29', 'darling2222', '2', 'darling2222@gmail.com', '1', 'aa', 'aa', 'aa', 'www.cc.vom', '100', 'Pub');
INSERT INTO `employer` VALUES ('30', 'aaaaa', 'a', 'aa@gmail.com', '1543', 'a', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('31', 'aaaaaa', '1', 'xiuzhen1103@gmail.com', '1543', 'a', 'aa', 'aa', 'www.bella.com', '20', 'Pub');
INSERT INTO `employer` VALUES ('32', '', '', '', '', '', '', '', '', null, '');
INSERT INTO `employer` VALUES ('33', 'aaaaaaaaaaaaa', 'a', 'dddd@gmail.com', '', '', '', '', '', null, '');
INSERT INTO `employer` VALUES ('34', 'aaaaaaaaaaaaaaa', '1', 'dddddd@gmail.com', '', '', '', '', '', null, '');
INSERT INTO `employer` VALUES ('35', 'ddddd', 'd', 'ddddddd@gmail.com', '', '', '', '', '', null, '');
INSERT INTO `employer` VALUES ('36', 'aaaaaaaaaaa', '', 'dddddddddd@gmail.com', '', '', '', '', '', null, '');
INSERT INTO `employer` VALUES ('37', 'aaaaaaaaaaaa', 'a', 'dddddddd@gmail.com', '', '', '', '', '', null, '');
INSERT INTO `employer` VALUES ('38', 'aaaaaaaaaa', '', 'aaaaaaaaa@gmail.com', '', '', '', '', '', null, '');
INSERT INTO `employer` VALUES ('39', 'adfdssfs', 'aa', 'dd@gmail.com', '', '', '', '', 'www.bella', null, '');
INSERT INTO `employer` VALUES ('40', 'test111', 'xiuzhen', 'xiu@hotmail.com', '', 'Xiu', '', '', 'www.bella.com', null, '');

-- ----------------------------
-- Table structure for interviewrecord
-- ----------------------------
DROP TABLE IF EXISTS `interviewrecord`;
CREATE TABLE `interviewrecord` (
  `interviewId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NOT NULL COMMENT 'employee id',
  `jsId` int(11) NOT NULL COMMENT 'job seeker id',
  `jobId` int(11) NOT NULL COMMENT 'job id0',
  `cvId` int(11) NOT NULL COMMENT 'cover id',
  `interviewTime` varchar(20) COLLATE utf8_bin NOT NULL,
  `phone` varchar(15) COLLATE utf8_bin NOT NULL,
  `memo` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'fail(0), No interview(1), success(2)',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`interviewId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of interviewrecord
-- ----------------------------
INSERT INTO `interviewrecord` VALUES ('1', '6', '1', '1', '8', '29/3/2014 09:30', '13544106275', 'please don\'t later', '1', '2014-03-23 23:06:57');
INSERT INTO `interviewrecord` VALUES ('2', '6', '1', '1', '18', '29/3/2014 13:00', '13544106275', 'test', '1', '2014-03-23 23:08:09');
INSERT INTO `interviewrecord` VALUES ('3', '6', '1', '1', '17', '31/3/2014 23:27', '13544106275', 'fdsfdsfds', '1', '2014-03-31 23:27:12');
INSERT INTO `interviewrecord` VALUES ('4', '6', '1', '1', '18', '31/3/2014 23:30', '13544106275', 'test', '1', '2014-03-31 23:30:44');

-- ----------------------------
-- Table structure for job
-- ----------------------------
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
  `jobCategoryId` int(11) DEFAULT NULL,
  `skillCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobId`),
  KEY `empId` (`empId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', 'lecturer', 'lecturer', '2014-02-28 21:56:56', 'DIT', '0138989', '2', 'experiences required', '40000', '6', '1', '4', '20', null, null);
INSERT INTO `job` VALUES ('2', 'Advertising', 'advertising', '2014-03-19 22:06:07', 'Bolton st', '0137878', '1', 'expereinces required', '30000', '1', '1', '4', '20', null, null);
INSERT INTO `job` VALUES ('12', 'Designer', 'Designer', '2014-03-28 21:58:50', 'Malahide', '013878', '1', 'experiences required', '30000', '9', '1', '4', '20', null, null);
INSERT INTO `job` VALUES ('13', 'barman', 'barman', '2014-03-27 22:00:08', 'Aungier St', '0134898', '1', 'minimum 2 years experiences', '35000', '9', '1', '4', '20', null, null);
INSERT INTO `job` VALUES ('14', 'Database administrator', 'administrator', '2015-02-05 22:11:15', 'Belfast', '0145365456', '1', 'minimum two years experiences', '40000', '1', '2', null, null, null, null);
INSERT INTO `job` VALUES ('17', 'Database administrator', 'lecturer', '2014-02-28 22:36:16', 'DBS', '353871234776', '2', 'minimum two years experiences', '40000', '1', '1', '4', '20', null, null);
INSERT INTO `job` VALUES ('18', 'business support', 'support', '2014-03-27 22:51:15', 'DCU', '0145365456', '1', 'minimum two years experiences', '40000', '1', '1', '31', '32', null, null);
INSERT INTO `job` VALUES ('19', 'UI Designer', 'Designer', '2014-03-12 23:00:00', 'DCU', '01304384', '1', 'minimum two years experiences', '40000', '1', '1', '31', '32', null, null);
INSERT INTO `job` VALUES ('20', '', '', '2014-03-07 23:08:40', '', '', null, '', null, '1', '1', '31', '25', null, null);
INSERT INTO `job` VALUES ('21', 'Lecturer', 'lecturer', '2014-03-07 23:08:40', 'DCU', '353871234776', '1', 'minimum two years experiences', '40000', '1', '2', '27', '28', null, null);
INSERT INTO `job` VALUES ('22', 'Lecturer', 'lecturer', '2014-03-07 23:08:40', 'DCU', '353871234776', '1', 'minimum two years experiences', '40000', '1', '2', '27', '28', null, null);
INSERT INTO `job` VALUES ('27', '.Net developer', 'asp. web services', '2014-02-27 15:15:09', 'Datalex', '0138787', '1', '', null, '1', '2', '24', '26', null, null);
INSERT INTO `job` VALUES ('28', '.Net developer', 'asp. web services', '2014-02-27 15:15:09', 'Datalex', '0138787', '1', '', null, '1', '2', null, null, null, null);
INSERT INTO `job` VALUES ('29', '.Net developer', 'asp. web services', '2014-02-27 15:15:09', 'Datalex', '0138787', '1', '', null, '1', '2', null, null, null, null);
INSERT INTO `job` VALUES ('31', 'graduate developer', 'junior developer', '2014-04-30 15:23:47', 'College green', '0145365456', '1', 'minimum two years experiences', '40000', '1', '1', '31', '35', null, null);
INSERT INTO `job` VALUES ('32', 'graduate developer', 'junior developer', '2014-04-30 15:23:47', 'College green', '0145365456', '1', 'minimum two years experiences', '40000', '1', '1', '31', '35', null, null);
INSERT INTO `job` VALUES ('33', 'Junior developer', '.Net', '2014-03-07 15:28:45', 'Ballsbridge', '353871234776', '1', 'minimum two years experiences', '40000', '1', '2', '24', '25', null, null);
INSERT INTO `job` VALUES ('34', 'Junior developer', '.Net', '2014-03-07 15:28:45', 'Ballsbridge', '353871234776', '1', 'minimum two years experiences', '40000', '1', '2', '24', '25', null, null);
INSERT INTO `job` VALUES ('35', 'graduate developer', 'J2EE', '2014-02-28 15:35:46', 'College green', '353871234776', '1', 'minimum two years experiences', '40000', '1', '1', '31', '32', null, null);
INSERT INTO `job` VALUES ('36', 'lecturer', 'lecturer', '2014-02-27 13:20:29', '5 Stewart Hall', '353871234776', '1', '2.1 ', '40000', '1', '1', '31', '35', null, null);
INSERT INTO `job` VALUES ('37', 'lecturer', 'lecturer', '2014-02-27 13:20:29', '5 Stewart Hall', '353871234776', '1', '2.1 ', '40000', '1', '1', null, null, null, null);
INSERT INTO `job` VALUES ('41', 'Lecturer', 'lecturer', '2014-03-07 13:25:12', '5 Stewart Hall', '353871234776', '1', 'minimum two years experiences', '40000', '1', '2', '23', '37', null, null);
INSERT INTO `job` VALUES ('43', 'l', 'l', '2014-02-13 13:26:47', '5 Stewart Hall', '353871234776', null, '', null, '1', '1', '4', '20', null, null);
INSERT INTO `job` VALUES ('44', 'Test', 'Test', '2014-03-18 15:35:09', '5 Stewart Hall', '353871234776', '1', 'minimum two years experiences', '40000', '1', '1', '31', '0', null, null);
INSERT INTO `job` VALUES ('45', 'Technical Support', 'support analysis', '2014-04-15 17:52:10', '5 Stewart Hall', '353871234776', '1', 'minimum two years experiences', '40000', '1', '1', '31', '32', null, null);
INSERT INTO `job` VALUES ('46', 'Tester', 'Tester', '2014-04-15 17:57:50', '5 Stewart Hall', '353871234776', '1', 'minimum two years experiences', '40000', '1', '1', '31', '36', null, null);
INSERT INTO `job` VALUES ('48', 'l', 'df', '2014-03-10 18:19:23', '5 Stewart Hall', '353871234776', '1', 'minimum two years experiences', '40000', '1', '1', '31', '32', null, null);
INSERT INTO `job` VALUES ('57', '.Net developer', 'asp. web services', '2014-03-27 19:06:43', '5 Stewart Hall', '353871234776', '1', 'minimum two years experiences', '40000', '1', '2', '24', '25', null, null);
INSERT INTO `job` VALUES ('58', '.Net developer', 'asp. web services', '2014-03-20 19:09:59', '5 Stewart Hall', '353871234776', '1', 'minimum two years experiences', '40000', '1', '1', '31', '36', null, null);
INSERT INTO `job` VALUES ('59', 'lecturer', 'lecturer', '2014-03-19 13:13:29', '5 Stewart Hall', '353871234776', '1', '2.1 ', '40000', '1', '1', '31', '32', null, null);
INSERT INTO `job` VALUES ('62', 'test', 'test', '2014-04-01 22:51:47', 'test', '123456', '2', 'test', '5000', '6', '2', '27', '28', '1', '2');

-- ----------------------------
-- Table structure for jobseeker
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of jobseeker
-- ----------------------------
INSERT INTO `jobseeker` VALUES ('1', 'xiuzhen', 'xiuzhen', 'Danny', 'Danny', 'xiu.z@hotmail.com', '8656', '50000');
INSERT INTO `jobseeker` VALUES ('4', 'a', 'www', 'Jeff', 'jefff', 'ccc@hotmail.com', '04376', '40000');
INSERT INTO `jobseeker` VALUES ('5', 'aa', 'cc', 'ccc', '', 'ccc@hotmail.com', '0871234776', '40000');
INSERT INTO `jobseeker` VALUES ('6', 'aa', 'c', 'ccc', '', 'ccc@hotmail.com', '0871234776', '40000');
INSERT INTO `jobseeker` VALUES ('7', 'www', 'www', 'www', 'r', 'www@hotmail.com', '0871234776', '40000');
INSERT INTO `jobseeker` VALUES ('8', 'jeff', 'jeff', 'jefff', 'Aungier stt', 'jeff@hotmail.com', '08712347766', '40001');
INSERT INTO `jobseeker` VALUES ('9', 'r', 'r', 'r', 'r', 'r@hotmail.com', '1111111', '40000');
INSERT INTO `jobseeker` VALUES ('10', '4', 'r', 'linda', 'bolton st', '4@hotmail.com', '22222', '50000');
INSERT INTO `jobseeker` VALUES ('12', '1', '1', 'James', 'James st', '11@hotmail.com', '34890', '50000');
INSERT INTO `jobseeker` VALUES ('13', 'zhenzhen', 'z', 'zhen', 'aa', 'xiuzhen1103@gmail.com', '32423', '30000');
INSERT INTO `jobseeker` VALUES ('14', 'Micheal', 'xiuzhen', 'micheal', 'Crumlin', 'micheal@gmail.com', '453909', '234242');
INSERT INTO `jobseeker` VALUES ('15', 'snail', 'xiuzhen', 'snail', 'China', 'snail@gmail.com', '2342342', '30894');
INSERT INTO `jobseeker` VALUES ('16', 'test11', 'xiuzhen', 'Xiu', '5 Stewart Hall', 'xiu@hotmail.com', '0134589', '300055');
INSERT INTO `jobseeker` VALUES ('17', 'test111', 'a, a', 'Xiu', '5 Stewart Hall', 'xiuu@hotmail.com', '0134589', '300055');
INSERT INTO `jobseeker` VALUES ('18', 'test1111', 'aa, aa', 'Xiu', '5 Stewart Hall', 'xiuuu@hotmail.com', '0134589', '300055');
INSERT INTO `jobseeker` VALUES ('19', 'test11111', '1, 1', 'Xiu', '5 Stewart Hall', 'xiuuu1@hotmail.com', '0134589', '300055');
INSERT INTO `jobseeker` VALUES ('20', 'test111111', '1, 1', 'Xiu', '5 Stewart Hall', 'xiuuu11@hotmail.com', '0134589', '300055');
INSERT INTO `jobseeker` VALUES ('21', 'test22', 't', 'test', 'test', 'test2@gmail.com', '01321978', '2418709');
INSERT INTO `jobseeker` VALUES ('22', 'xiuzhen2', 'aa', 'aa', 'aa', '1aa@gmail.co,', '0134829', '2343534');
INSERT INTO `jobseeker` VALUES ('23', 'xiuzhen21', '1', 'aa', 'aa', '1aa@gmail.com', '', null);
INSERT INTO `jobseeker` VALUES ('24', 'xiuzhenaa', 'a', 'aa', 'Danny', 'xiu.z@', '', null);
INSERT INTO `jobseeker` VALUES ('26', 'xiuzhenaaff', '1', '1', '1', 'xiu.z11@hotmail.com', '353871234776', '30000');
INSERT INTO `jobseeker` VALUES ('27', 'xiuzhenaaffa', 'a', '1', '1', 'xiu.z1a1@hotmail.com', '353871234776', '30000');
INSERT INTO `jobseeker` VALUES ('28', 'xiuzhen11q', 'a', 'Xiuzhen Chen', '5 Stewart Hall', 'xiu.zaaa@hotmail.com', '353871234776', '30000');
INSERT INTO `jobseeker` VALUES ('29', 'xiuzhen111', '1', '1', '1', '1@gmail.com', '01546546', '30000');
INSERT INTO `jobseeker` VALUES ('30', 'xiuzhen1111', '1', '1', '1', '13@gmail.com', '01546546', '30000');
INSERT INTO `jobseeker` VALUES ('31', 'xiuzhen1100', 'q', 'q', 'q@gmail.com', 'q@gmail.com', '1343', '30000');
INSERT INTO `jobseeker` VALUES ('32', 'xiuzhen1100', 'q', 'q', 'q@gmail.com', 'q@gmail.com', '1343', '30000');
INSERT INTO `jobseeker` VALUES ('33', 'xiuzhen11234', '1', '1', '1', 'xiu.z1211@hotmail.com', '1343', '30000');
INSERT INTO `jobseeker` VALUES ('34', 'xiuzhen112341', '1', '1', '1', 'xiu.z121111@hotmail.com', '1343', '30000');
INSERT INTO `jobseeker` VALUES ('35', 'xiu111', '1', '1', '12@gmail.com', '12@gmail.com', '013989', '30000');
INSERT INTO `jobseeker` VALUES ('36', 'xiuzhen11134', '1', 'Xiuzhen Chen', '5 Stewart Hall', 'sdd@gmail.com', '353871234776', '30000');
INSERT INTO `jobseeker` VALUES ('37', 'xiuzhen11s', 's', 's', 's@', 'sdddd@gmail.com', '34890', '50000');
INSERT INTO `jobseeker` VALUES ('38', 'test11211', '1', 'Xiuzhen Chen', '5 Stewart Hall', 'xiu.dz@hotmail.com', '353871234776', '30000');

-- ----------------------------
-- Table structure for jobseekerskill
-- ----------------------------
DROP TABLE IF EXISTS `jobseekerskill`;
CREATE TABLE `jobseekerskill` (
  `jobSeekerSkillId` int(11) NOT NULL AUTO_INCREMENT,
  `skillId` int(11) DEFAULT NULL,
  `jsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSeekerSkillId`),
  KEY `skillId` (`skillId`),
  KEY `jsId` (`jsId`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of jobseekerskill
-- ----------------------------
INSERT INTO `jobseekerskill` VALUES ('7', '1', '26');
INSERT INTO `jobseekerskill` VALUES ('8', '2', '26');
INSERT INTO `jobseekerskill` VALUES ('10', '2', '27');
INSERT INTO `jobseekerskill` VALUES ('12', '1', '27');
INSERT INTO `jobseekerskill` VALUES ('13', '1', '28');
INSERT INTO `jobseekerskill` VALUES ('15', '1', '29');
INSERT INTO `jobseekerskill` VALUES ('16', '2', '29');
INSERT INTO `jobseekerskill` VALUES ('17', '1', '30');
INSERT INTO `jobseekerskill` VALUES ('18', '2', '30');
INSERT INTO `jobseekerskill` VALUES ('19', '2', '31');
INSERT INTO `jobseekerskill` VALUES ('20', '1', '31');
INSERT INTO `jobseekerskill` VALUES ('21', '1', '32');
INSERT INTO `jobseekerskill` VALUES ('22', '2', '32');
INSERT INTO `jobseekerskill` VALUES ('23', '2', '33');
INSERT INTO `jobseekerskill` VALUES ('24', '1', '33');
INSERT INTO `jobseekerskill` VALUES ('25', '2', '34');
INSERT INTO `jobseekerskill` VALUES ('27', '1', '34');
INSERT INTO `jobseekerskill` VALUES ('28', '4', '35');
INSERT INTO `jobseekerskill` VALUES ('30', '3', '36');
INSERT INTO `jobseekerskill` VALUES ('31', '2', '36');
INSERT INTO `jobseekerskill` VALUES ('54', '1', '1');
INSERT INTO `jobseekerskill` VALUES ('55', '3', '1');
INSERT INTO `jobseekerskill` VALUES ('56', '3', '37');
INSERT INTO `jobseekerskill` VALUES ('57', '1', '37');
INSERT INTO `jobseekerskill` VALUES ('58', '1', '38');
INSERT INTO `jobseekerskill` VALUES ('59', '2', '38');
INSERT INTO `jobseekerskill` VALUES ('65', '2', '1');
INSERT INTO `jobseekerskill` VALUES ('66', '5', '39');
INSERT INTO `jobseekerskill` VALUES ('67', '1', '40');

-- ----------------------------
-- Table structure for jobskill
-- ----------------------------
DROP TABLE IF EXISTS `jobskill`;
CREATE TABLE `jobskill` (
  `jobSkillId` int(11) NOT NULL AUTO_INCREMENT,
  `jobId` int(11) DEFAULT NULL,
  `skillId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSkillId`),
  KEY `jobId` (`jobId`),
  KEY `skillId` (`skillId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of jobskill
-- ----------------------------
INSERT INTO `jobskill` VALUES ('1', '57', '2');
INSERT INTO `jobskill` VALUES ('2', '57', '3');
INSERT INTO `jobskill` VALUES ('3', '58', '4');
INSERT INTO `jobskill` VALUES ('4', '58', '3');
INSERT INTO `jobskill` VALUES ('5', '59', '3');
INSERT INTO `jobskill` VALUES ('6', '59', '1');
INSERT INTO `jobskill` VALUES ('9', '62', '3');
INSERT INTO `jobskill` VALUES ('10', '62', '1');

-- ----------------------------
-- Table structure for pastexperience
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pastexperience
-- ----------------------------
INSERT INTO `pastexperience` VALUES ('1', 'waitress', 'barmaid', 'Mary', 'mary@gmail.com', '03473892', 'Foley st', '2013-11-09 20:51:35', '2014-10-10 20:51:38', 'holidays', '1');
INSERT INTO `pastexperience` VALUES ('5', 'reception', 'greeting, appointment', 'Eva', 'eva@gmail.com', '03473892', 'Foley st', '2013-12-05 11:24:18', '2014-10-27 21:17:02', 'bored', '1');
INSERT INTO `pastexperience` VALUES ('9', 'reception', 'intern', 'Mayr', 'mary@gmail.com', '013487', 'Aungier St', '2011-12-13 21:48:46', '2013-12-09 21:48:51', 'holidays', '1');

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `skillId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  `skillCategoryId` int(11) NOT NULL,
  PRIMARY KEY (`skillId`),
  KEY `skillCategoryId` (`skillCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of skill
-- ----------------------------
INSERT INTO `skill` VALUES ('1', 'Java', '2');
INSERT INTO `skill` VALUES ('2', '.Net', '2');
INSERT INTO `skill` VALUES ('3', 'J2EE', '2');
INSERT INTO `skill` VALUES ('4', 'C#', '2');
INSERT INTO `skill` VALUES ('5', 'Web Service', '3');
INSERT INTO `skill` VALUES ('6', 'Asp', '3');
INSERT INTO `skill` VALUES ('7', 'DBA', '3');
INSERT INTO `skill` VALUES ('8', 'Test', '1');

-- ----------------------------
-- Table structure for skillcategory
-- ----------------------------
DROP TABLE IF EXISTS `skillcategory`;
CREATE TABLE `skillcategory` (
  `skillCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`skillCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of skillcategory
-- ----------------------------
INSERT INTO `skillcategory` VALUES ('1', 'Software Development', null, '0');
INSERT INTO `skillcategory` VALUES ('2', 'Progamm', '1', '1');
INSERT INTO `skillcategory` VALUES ('3', '.Net', '1', '0');
INSERT INTO `skillcategory` VALUES ('4', 'Mechanic', '1', '1');
INSERT INTO `skillcategory` VALUES ('5', 'Design', '1', '0');
INSERT INTO `skillcategory` VALUES ('6', 'Design', '6', '1');
INSERT INTO `skillcategory` VALUES ('7', 'Design', '1', '1');
INSERT INTO `skillcategory` VALUES ('8', 'Product Design', '1', '1');
INSERT INTO `skillcategory` VALUES ('9', 'Home Service', '4', '1');
INSERT INTO `skillcategory` VALUES ('19', 'Engineering', null, '0');
