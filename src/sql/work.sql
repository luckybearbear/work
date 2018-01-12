/*
Navicat MySQL Data Transfer

Source Server         : zj
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-04-29 23:11:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cloginname` varchar(50) NOT NULL,
  `cloginpwd` varchar(50) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `ccontact` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('3', '123', '123456', 'IT', '18751905713', '南京', 'www.dddd.com', '略', 'IT');
INSERT INTO `company` VALUES ('7', '123456', '123456', '人民银行', '18751905713', '南京', 'www.dddd.com', '略', '金融');

-- ----------------------------
-- Table structure for `employ`
-- ----------------------------
DROP TABLE IF EXISTS `employ`;
CREATE TABLE `employ` (
  `employid` int(11) NOT NULL AUTO_INCREMENT,
  `stunum` varchar(20) DEFAULT NULL,
  `jid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `employstatus` varchar(100) DEFAULT NULL,
  `employtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employ
-- ----------------------------
INSERT INTO `employ` VALUES ('22', '12', '1', '7', '未审核', '2017-04-18');
INSERT INTO `employ` VALUES ('23', '12', '2', '7', '未审核', '2017-04-18');
INSERT INTO `employ` VALUES ('24', '12', '3', '7', '未审核', '2017-04-18');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `jobname` varchar(50) DEFAULT NULL,
  `salary` varchar(50) DEFAULT NULL,
  `jobdescription` varchar(200) DEFAULT NULL,
  `starttime` varchar(20) DEFAULT NULL,
  `deadline` varchar(50) DEFAULT NULL,
  `jobstatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '7', '前台', '5000~10000', '无', '2017-04-08', '2017-04-22', '已审核');
INSERT INTO `job` VALUES ('2', '7', '注册会计师', '10000~15000', '无', '2017-04-07', '2017-04-28', '已审核');
INSERT INTO `job` VALUES ('3', '7', '大堂经理', '面议', '无', '2017-04-08', '2017-04-26', '已审核');
INSERT INTO `job` VALUES ('4', '7', '保安', '0~1000', '保障银行的正常运作', '2017-04-15', '2017-04-29', '未审核');
INSERT INTO `job` VALUES ('7', '7', '实习生', '0~1000', '实习生', '2017-04-28', '2017-04-30', '未审核');

-- ----------------------------
-- Table structure for `resuem`
-- ----------------------------
DROP TABLE IF EXISTS `resuem`;
CREATE TABLE `resuem` (
  `rid` varchar(20) NOT NULL,
  `stunum` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `political` varchar(20) DEFAULT NULL,
  `classes` varchar(20) DEFAULT NULL,
  `identity` varchar(20) DEFAULT NULL,
  `nation` varchar(20) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `graduatetime` varchar(20) DEFAULT NULL,
  `enjoy` varchar(20) DEFAULT NULL,
  `reward` varchar(20) DEFAULT NULL,
  `workhistory` varchar(20) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `jobinterntion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resuem
-- ----------------------------
INSERT INTO `resuem` VALUES ('12', '12', '男', '计科', '群众', '2', '321084199507215814', '汉族', '本科生', '18751905713', '2017-06-16', '无', '无', '无', '滨江学院', '371407bc-fa76-42ae-96da-ffa2218f4040.png', '无');
INSERT INTO `resuem` VALUES ('20132308029', '20132308029', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stunum` varchar(20) NOT NULL,
  `stuname` varchar(20) DEFAULT NULL,
  `stuloginpwd` varchar(20) DEFAULT NULL,
  `emplstatus` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stunum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('12', '张俊', '123456', '就业', '529140702@qq.com');
INSERT INTO `student` VALUES ('20132308029', '张俊', '123456', '待业', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
