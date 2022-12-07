/*
 Navicat MySQL Data Transfer

 Source Server         : newMysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 116.205.187.238:3306
 Source Schema         : new_common

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 06/12/2022 14:37:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_common_log_record
-- ----------------------------
DROP TABLE IF EXISTS `t_common_log_record`;
CREATE TABLE `t_common_log_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `param_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `param_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_common_log_record
-- ----------------------------
INSERT INTO `t_common_log_record` VALUES (1, '/user/info/getUserById', 2, '${spring.application.name}', '获取用户信息', '第1个参数为：1', 'String', 'getUserInfoById', '2022-11-11 15:12:51', '用户id');
INSERT INTO `t_common_log_record` VALUES (2, '/user/info/getUserById', 2, '${spring.application.name}', '获取用户信息', '第1个参数为：1', 'String', 'getUserInfoById', '2022-11-11 15:12:51', '用户id');
INSERT INTO `t_common_log_record` VALUES (3, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 16:56:01', '用户名');
INSERT INTO `t_common_log_record` VALUES (4, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 16:56:01', '用户名');
INSERT INTO `t_common_log_record` VALUES (5, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 16:56:56', '用户名');
INSERT INTO `t_common_log_record` VALUES (6, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 16:57:07', '用户名');
INSERT INTO `t_common_log_record` VALUES (7, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 16:58:04', '用户名');
INSERT INTO `t_common_log_record` VALUES (8, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:11:44', '用户名');
INSERT INTO `t_common_log_record` VALUES (9, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:11:44', '用户名');
INSERT INTO `t_common_log_record` VALUES (10, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:12:04', '用户名');
INSERT INTO `t_common_log_record` VALUES (11, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:13:23', '用户名');
INSERT INTO `t_common_log_record` VALUES (12, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:13:58', '用户名');
INSERT INTO `t_common_log_record` VALUES (13, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:20:58', '用户名');
INSERT INTO `t_common_log_record` VALUES (14, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:20:58', '用户名');
INSERT INTO `t_common_log_record` VALUES (15, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:21:48', '用户名');
INSERT INTO `t_common_log_record` VALUES (16, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:21:50', '用户名');
INSERT INTO `t_common_log_record` VALUES (17, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:22:21', '用户名');
INSERT INTO `t_common_log_record` VALUES (18, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:22:36', '用户名');
INSERT INTO `t_common_log_record` VALUES (19, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:22:38', '用户名');
INSERT INTO `t_common_log_record` VALUES (20, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:22:51', '用户名');
INSERT INTO `t_common_log_record` VALUES (21, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:24:16', '用户名');
INSERT INTO `t_common_log_record` VALUES (22, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:28:31', '用户名');
INSERT INTO `t_common_log_record` VALUES (23, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:30:41', '用户名');
INSERT INTO `t_common_log_record` VALUES (24, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:30:41', '用户名');
INSERT INTO `t_common_log_record` VALUES (25, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:31:41', '用户名');
INSERT INTO `t_common_log_record` VALUES (26, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:34:17', '用户名');
INSERT INTO `t_common_log_record` VALUES (27, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:34:17', '用户名');
INSERT INTO `t_common_log_record` VALUES (28, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:34:29', '用户名');
INSERT INTO `t_common_log_record` VALUES (29, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:52:09', '用户名');
INSERT INTO `t_common_log_record` VALUES (30, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:52:09', '用户名');
INSERT INTO `t_common_log_record` VALUES (31, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:52:19', '用户名');
INSERT INTO `t_common_log_record` VALUES (32, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:53:56', '用户名');
INSERT INTO `t_common_log_record` VALUES (33, '/user/info/getUser/codesuperman%40foxmail.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"codesuperman@foxmail.com\"', 'String', 'getPasswordByUsername', '2022-11-16 17:58:53', '用户名');
INSERT INTO `t_common_log_record` VALUES (34, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-17 17:01:06', '用户名');
INSERT INTO `t_common_log_record` VALUES (35, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-17 17:01:06', '用户名');
INSERT INTO `t_common_log_record` VALUES (36, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-17 17:01:29', '用户名');
INSERT INTO `t_common_log_record` VALUES (37, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-17 17:02:39', '用户名');
INSERT INTO `t_common_log_record` VALUES (38, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 16:35:02', '用户名');
INSERT INTO `t_common_log_record` VALUES (39, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 16:35:39', '用户名');
INSERT INTO `t_common_log_record` VALUES (40, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 16:59:29', '用户名');
INSERT INTO `t_common_log_record` VALUES (41, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:17:19', '用户名');
INSERT INTO `t_common_log_record` VALUES (42, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:17:19', '用户名');
INSERT INTO `t_common_log_record` VALUES (43, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:18:11', '用户名');
INSERT INTO `t_common_log_record` VALUES (44, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:18:15', '用户名');
INSERT INTO `t_common_log_record` VALUES (45, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:18:28', '用户名');
INSERT INTO `t_common_log_record` VALUES (46, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:20:20', '用户名');
INSERT INTO `t_common_log_record` VALUES (47, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:33:00', '用户名');
INSERT INTO `t_common_log_record` VALUES (48, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:35:51', '用户名');
INSERT INTO `t_common_log_record` VALUES (49, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:38:22', '用户名');
INSERT INTO `t_common_log_record` VALUES (50, '/user/info/getUser/zzzyunluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyunluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:38:55', '用户名');
INSERT INTO `t_common_log_record` VALUES (51, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:39:28', '用户名');
INSERT INTO `t_common_log_record` VALUES (52, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:42:34', '用户名');
INSERT INTO `t_common_log_record` VALUES (53, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:45:20', '用户名');
INSERT INTO `t_common_log_record` VALUES (54, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:46:12', '用户名');
INSERT INTO `t_common_log_record` VALUES (55, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:46:40', '用户名');
INSERT INTO `t_common_log_record` VALUES (56, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:47:23', '用户名');
INSERT INTO `t_common_log_record` VALUES (57, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:47:35', '用户名');
INSERT INTO `t_common_log_record` VALUES (58, '/user/info/getUser/zzzyuan%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuan@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:47:54', '用户名');
INSERT INTO `t_common_log_record` VALUES (59, '/user/info/getUser/zzzyuanluo%40163.com', 2, '${spring.application.name}', '获取用户加密密码进行验证', '第1个参数为：\"zzzyuanluo@163.com\"', 'String', 'getPasswordByUsername', '2022-11-18 17:48:03', '用户名');

SET FOREIGN_KEY_CHECKS = 1;
