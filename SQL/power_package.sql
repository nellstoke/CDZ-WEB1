/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50741 (5.7.41-log)
 Source Host           : localhost:3306
 Source Schema         : 0771nanning_cdz

 Target Server Type    : MySQL
 Target Server Version : 50741 (5.7.41-log)
 File Encoding         : 65001

 Date: 19/04/2023 20:34:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for power_package
-- ----------------------------
DROP TABLE IF EXISTS `power_package`;
CREATE TABLE `power_package`  (
  `pw_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '功率套餐表id',
  `status_id` int(8) NOT NULL COMMENT '设备运行状态表id',
  `min_pw` tinyint(2) NOT NULL COMMENT '最小功率',
  `max_pw` tinyint(2) NOT NULL COMMENT '最大功率',
  `real_min_pw` tinyint(2) NOT NULL COMMENT '真实最小功率',
  `raal_max_pw` tinyint(2) NOT NULL COMMENT '真实最大功率',
  `price` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `take_time` float(3, 1) NOT NULL COMMENT '设置等值的时间，半个小时时间为0.5',
  `is_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '套餐启用状态，0为启用，1为不启用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`pw_id`) USING BTREE,
  INDEX `status_id`(`status_id`) USING BTREE,
  CONSTRAINT `FK_powerPackage_DeviceStatus` FOREIGN KEY (`status_id`) REFERENCES `device_status` (`status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '功率套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of power_package
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
