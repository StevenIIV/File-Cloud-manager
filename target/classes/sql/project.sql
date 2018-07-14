/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-07-14 17:32:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(255) NOT NULL COMMENT '用户邮箱',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `username` varchar(255) NOT NULL COMMENT '用户昵称',
  `role` varchar(255) NOT NULL COMMENT '用户身份',
  `status` int(1) NOT NULL COMMENT '用户状态',
  `regTime` datetime NOT NULL COMMENT '注册时间',
  `regIp` varchar(255) NOT NULL COMMENT '注册IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xxx', '123456', 'steven', 'root', '0', '2017-03-28 09:40:31', '127.0.0.1');
