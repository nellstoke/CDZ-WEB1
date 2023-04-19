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

 Date: 19/04/2023 20:33:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for device_status
-- ----------------------------
DROP TABLE IF EXISTS `device_status`;
CREATE TABLE `device_status`  (
  `status_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '设备运行状态表id',
  `device_id` int(8) NULL DEFAULT NULL COMMENT '设备id',
  `sim_id` int(8) NULL DEFAULT NULL COMMENT '基站表id',
  `gl_id` int(8) NULL DEFAULT NULL COMMENT '地理位置id',
  `device_state` tinyint(1) NULL DEFAULT NULL COMMENT '设备状态，0在线、1离线、2通电、3断电',
  `signal_val` tinyint(2) NULL DEFAULT NULL COMMENT '设备网络模块信号强度，单位为dbm',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`status_id`) USING BTREE,
  INDEX `FK_devicestatus_siminfo`(`sim_id`) USING BTREE,
  INDEX `FK_devicestatus_deviceinfo`(`device_id`) USING BTREE,
  INDEX `FK_DeviceStatus_gl_infor`(`gl_id`) USING BTREE,
  CONSTRAINT `FK_DeviceStatus_gl_infor` FOREIGN KEY (`gl_id`) REFERENCES `gl_infor` (`gl_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_devicestatus_deviceinfo` FOREIGN KEY (`device_id`) REFERENCES `device_info` (`device_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_devicestatus_siminfo` FOREIGN KEY (`sim_id`) REFERENCES `sim_info` (`sim_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备运行状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_status
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
