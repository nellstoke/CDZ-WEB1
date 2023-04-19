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

 Date: 19/04/2023 20:33:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pay_list
-- ----------------------------
DROP TABLE IF EXISTS `pay_list`;
CREATE TABLE `pay_list`  (
  `pay_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '支付流水号id',
  `user_id` int(8) NOT NULL COMMENT '用户表id，外键',
  `slot_id` int(8) NOT NULL COMMENT '设备端口状态表的ID，外键，引用DeviceSlotStatus表的slot_id字段，用于关联设备端口信息',
  `pw_id` int(8) NOT NULL COMMENT '功率套餐表id，外键，关联powerPackage表的pw_id字段，所支付的功率套餐',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`pay_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `slot_id`(`slot_id`) USING BTREE,
  INDEX `pw_id`(`pw_id`) USING BTREE,
  CONSTRAINT `FK_PayList_DeviceSlotStatus` FOREIGN KEY (`slot_id`) REFERENCES `device_slot_status` (`slot_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PayList_User` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PayList_powerPackage` FOREIGN KEY (`pw_id`) REFERENCES `power_package` (`pw_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付清单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_list
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
