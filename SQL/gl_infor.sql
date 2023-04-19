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

 Date: 19/04/2023 20:33:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gl_infor
-- ----------------------------
DROP TABLE IF EXISTS `gl_infor`;
CREATE TABLE `gl_infor`  (
  `gl_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '地理位置id',
  `pro_id` int(8) NOT NULL COMMENT '具体地理位置id',
  `rode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路段名称',
  `building` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '楼栋名称',
  `lo` decimal(10, 6) NULL DEFAULT NULL COMMENT '地球经度',
  `la` decimal(10, 6) NULL DEFAULT NULL COMMENT '地球纬度',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`gl_id`) USING BTREE,
  INDEX `pro_id`(`pro_id`) USING BTREE,
  CONSTRAINT `gl_infor_province` FOREIGN KEY (`pro_id`) REFERENCES `province` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地理位置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gl_infor
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
