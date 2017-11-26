/*
Navicat MySQL Data Transfer

Source Server         : qwe
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : maven_shopping

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2017-11-26 16:06:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `suitpeople` varchar(255) DEFAULT NULL,
  `market_price` varchar(255) DEFAULT NULL,
  `shop_price` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('3', 'car', '奥迪A6', '青年', '40000.0', '50000.0', '2017-09-21');
INSERT INTO `goods` VALUES ('4', 'food', '麦片', '儿童', '20.0', '18.0', '2017-10-12');
INSERT INTO `goods` VALUES ('5', 'car', '奔驰A1', '青年', '100000.0', '990000.0', '2017-10-20');
INSERT INTO `goods` VALUES ('6', 'food', '奥利奥12', '儿童', '10.0', '8.0', '2017-10-21');
INSERT INTO `goods` VALUES ('8', 'food', '曲奇', '儿童', '12.0', '12.0', '2017-10-12');
INSERT INTO `goods` VALUES ('9', 'food', '小米锅巴', '儿童', '5.0', '3.0', '2017-10-12');
INSERT INTO `goods` VALUES ('10', 'food', '手撕面包12', '儿童', '34.0', '32.0', '2017-10-11');
INSERT INTO `goods` VALUES ('11', 'it', '笔记本电脑', '成年', '6000.0', '5800.0', '2017-10-18');
INSERT INTO `goods` VALUES ('12', 'food', '雪碧', '青年', '5.0', '3.0', '2017-10-27');

-- ----------------------------
-- Table structure for `order_goodsmessage`
-- ----------------------------
DROP TABLE IF EXISTS `order_goodsmessage`;
CREATE TABLE `order_goodsmessage` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_price` double(255,0) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_goodsmessage
-- ----------------------------

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_price` double(11,0) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0,未结算，1,已付款',
  `order_createtime` varchar(255) DEFAULT NULL COMMENT '标记不同时间创建的订单的商品的不同',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('70', '风衣123', '100', '2', '效率', '1', '2017/10/27 下午2:35:14');
INSERT INTO `shoppingcart` VALUES ('71', '奥利奥12', '8', '1', 'xiaoming', '1', '2017/11/26 下午4:01:53');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '1231', '11111111111', null, null, null, null, '2');
INSERT INTO `user` VALUES ('2', 'xiaoming', '123456', '213412', '湖北', '小明a', '21', '女', '0');
INSERT INTO `user` VALUES ('3', 'xiaoqiang', '1234', '111111111', null, null, null, null, '0');
INSERT INTO `user` VALUES ('4', '木之本樱', '12312', '6789', null, null, null, null, '1');
INSERT INTO `user` VALUES ('5', '星马豪', '213141', '1321', null, null, null, null, '1');
INSERT INTO `user` VALUES ('8', '小华', '123', '2356', null, null, null, null, '0');
INSERT INTO `user` VALUES ('9', 'xiaobin', '12121', '12345678901', null, null, null, null, '0');
INSERT INTO `user` VALUES ('12', 'xiaoxiao', '123456', '13243253343', null, null, null, null, '0');
INSERT INTO `user` VALUES ('13', '效率', '12345678', '13222222222', null, null, null, null, '0');

-- ----------------------------
-- Table structure for `user_order`
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sumprice` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES ('26', '200', '2017/10/27 下午2:35:14', '效率', '已付款');
INSERT INTO `user_order` VALUES ('27', '8', '2017/11/26 下午4:01:53', 'xiaoming', '已付款');
