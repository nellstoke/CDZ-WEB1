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

 Date: 19/04/2023 20:34:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for servic_use_time
-- ----------------------------
DROP TABLE IF EXISTS `servic_use_time`;
CREATE TABLE `servic_use_time`  (
  `ut_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '实际服务时间表的id',
  `pay_id` int(8) NOT NULL COMMENT '关联PayList表',
  `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务使用开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '使用服务的真实结束时间',
  `use_min` int(11) NOT NULL COMMENT '实际服务使用时长,单位分钟',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ut_id`) USING BTREE,
  INDEX `pay_id`(`pay_id`) USING BTREE,
  CONSTRAINT `FK_ServicUseTime_PayList` FOREIGN KEY (`pay_id`) REFERENCES `pay_list` (`pay_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '实际服务时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servic_use_time
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
