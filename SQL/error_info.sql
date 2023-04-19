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

 Date: 19/04/2023 20:33:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for error_info
-- ----------------------------
DROP TABLE IF EXISTS `error_info`;
CREATE TABLE `error_info`  (
  `error_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '设备错误记录表id',
  `status_id` int(8) NOT NULL COMMENT '设备运行状态表id',
  `number_id` int(8) NOT NULL COMMENT '错误编码ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`error_id`) USING BTREE,
  INDEX `status_id`(`status_id`) USING BTREE,
  INDEX `err_id`(`number_id`) USING BTREE,
  CONSTRAINT `FK_DeviceStatus_status_id` FOREIGN KEY (`status_id`) REFERENCES `device_status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Error_number_errnum_id` FOREIGN KEY (`number_id`) REFERENCES `error_number` (`errnum_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备错误记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of error_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
