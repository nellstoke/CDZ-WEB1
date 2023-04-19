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

 Date: 19/04/2023 20:34:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sex_info
-- ----------------------------
DROP TABLE IF EXISTS `sex_info`;
CREATE TABLE `sex_info`  (
  `sex_id` int(11) NOT NULL AUTO_INCREMENT,
  `sex_name` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sex_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户性别选项信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sex_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
