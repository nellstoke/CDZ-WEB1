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

 Date: 19/04/2023 20:33:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for device_event
-- ----------------------------
DROP TABLE IF EXISTS `device_event`;
CREATE TABLE `device_event`  (
  `event_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '设备事件记录id',
  `status_id` int(8) NOT NULL COMMENT '设备运行状态表id',
  `is_online` tinyint(1) NULL DEFAULT NULL COMMENT '事件记录，0上次在线、1上次离线、2上次异常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `status_id`(`status_id`) USING BTREE,
  CONSTRAINT `fk_devicestatus` FOREIGN KEY (`status_id`) REFERENCES `device_status` (`status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备事件记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_event
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
