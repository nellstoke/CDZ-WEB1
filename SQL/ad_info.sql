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

 Date: 19/04/2023 20:32:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad_info
-- ----------------------------
DROP TABLE IF EXISTS `ad_info`;
CREATE TABLE `ad_info`  (
  `ad_id` int(8) NOT NULL COMMENT '广告信息表ID',
  `status_id` int(8) NULL DEFAULT NULL COMMENT '设备运行状态id',
  `ad_pri` int(8) NULL DEFAULT 0 COMMENT '广告优先级，0为最高，5为最低，默认为0',
  `ad_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告图片',
  `ad_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告图片的地址',
  `ad_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告图片的url地址',
  `update_tme` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ad_id`) USING BTREE,
  INDEX `ad_info_devicestatus`(`status_id`) USING BTREE,
  CONSTRAINT `ad_info_devicestatus` FOREIGN KEY (`status_id`) REFERENCES `device_status` (`status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运行中设备广告图设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
