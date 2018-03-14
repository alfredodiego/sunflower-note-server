/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50720
Source Host           : localhost:33060
Source Database       : weeklyreport_db

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-03-14 14:18:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `group_info`
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `memberNum` int(4) DEFAULT '0',
  `remark` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES ('37', 'CA大平台-IMP组-前端', '0', 'CA大平台-IMP组-前端，suninfolwer，一个潮气蓬勃，潜力无限，有梦想有追求的前端团队。', '2018-03-14 14:10:51');

-- ----------------------------
-- Table structure for `journal_info`
-- ----------------------------
DROP TABLE IF EXISTS `journal_info`;
CREATE TABLE `journal_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `task` varchar(255) CHARACTER SET utf8 NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `week` date NOT NULL,
  `status` enum('finished','unfinished') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of journal_info
-- ----------------------------

-- ----------------------------
-- Table structure for `report_info`
-- ----------------------------
DROP TABLE IF EXISTS `report_info`;
CREATE TABLE `report_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `week` date NOT NULL,
  `status` enum('public','private') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'private',
  `email` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `groupId` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of report_info
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `email` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `sex` enum('female','male') COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupId` int(20) NOT NULL,
  `password` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('admin', 'admin', 'male', 'admin', '0', 'admin', 'admin');

-- ----------------------------
-- Table structure for `_mysql_session_store`
-- ----------------------------
DROP TABLE IF EXISTS `_mysql_session_store`;
CREATE TABLE `_mysql_session_store` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` bigint(20) DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of _mysql_session_store
-- ----------------------------
