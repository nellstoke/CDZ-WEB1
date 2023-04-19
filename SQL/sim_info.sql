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

 Date: 19/04/2023 20:34:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sim_info
-- ----------------------------
DROP TABLE IF EXISTS `sim_info`;
CREATE TABLE `sim_info`  (
  `sim_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '基站信息表id',
  `carrier_id` int(8) NOT NULL COMMENT '运营商信息表id',
  `fw_ver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固件版本',
  `imei` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通讯模组唯一识别码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`sim_id`) USING BTREE,
  INDEX `carrier_id`(`carrier_id`) USING BTREE,
  CONSTRAINT `fk_carrierinfo_siminfo` FOREIGN KEY (`carrier_id`) REFERENCES `carrier_info` (`carrier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基站信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sim_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
