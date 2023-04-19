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

 Date: 19/04/2023 20:33:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for device_slot_status
-- ----------------------------
DROP TABLE IF EXISTS `device_slot_status`;
CREATE TABLE `device_slot_status`  (
  `slot_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '设备端口状态表的ID',
  `status_id` int(8) NOT NULL COMMENT '设备运行状态id，引用DeviceStatus表的status_id',
  `slot_no` tinyint(2) NOT NULL COMMENT '端口号，范围是1到DeviceInfo表的slot_count字段值',
  `slot_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '端口状态，0为空闲，1为占用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '端口状态更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`slot_id`) USING BTREE,
  INDEX `status_id`(`status_id`) USING BTREE,
  CONSTRAINT `FK_DeviceSlotStatus_DeviceStatus` FOREIGN KEY (`status_id`) REFERENCES `device_status` (`status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备端口状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_slot_status
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
