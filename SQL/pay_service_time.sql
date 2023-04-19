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

 Date: 19/04/2023 20:33:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pay_service_time
-- ----------------------------
DROP TABLE IF EXISTS `pay_service_time`;
CREATE TABLE `pay_service_time`  (
  `serv_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '服务计时表的id',
  `pay_id` int(8) NOT NULL COMMENT '支付流水号id,外键,引用PayList表的pay_id字段',
  `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间，通过powerPackage表的take_time数值计算结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`serv_id`) USING BTREE,
  INDEX `pay_id`(`pay_id`) USING BTREE,
  CONSTRAINT `FK_PayServiceTime_PayList` FOREIGN KEY (`pay_id`) REFERENCES `pay_list` (`pay_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付服务时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_service_time
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
