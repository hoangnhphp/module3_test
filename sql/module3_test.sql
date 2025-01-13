/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80040
 Source Host           : localhost:3306
 Source Schema         : module3_test

 Target Server Type    : MySQL
 Target Server Version : 80040
 File Encoding         : 65001

 Date: 13/01/2025 21:55:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for places
-- ----------------------------
DROP TABLE IF EXISTS `places`;
CREATE TABLE `places`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `acreage` decimal(10, 2) NOT NULL,
  `num_of_floors` int NOT NULL,
  `type` int NOT NULL,
  `price` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of places
-- ----------------------------
INSERT INTO `places` VALUES (2, 'MB02', 1, 240.00, 5, 2, 5000000, '2020-04-03', '2020-10-03', NULL);
INSERT INTO `places` VALUES (3, 'MB03', 2, 100.00, 6, 1, 4000000, '2020-11-30', '2022-12-31', NULL);
INSERT INTO `places` VALUES (4, 'MB04', 2, 160.00, 4, 2, 2500000, '2023-12-01', '2025-04-12', NULL);
INSERT INTO `places` VALUES (5, 'MB05', 1, 100.00, 8, 1, 1000000, '2021-02-25', '2025-02-25', '');

SET FOREIGN_KEY_CHECKS = 1;
