/*
 Navicat MySQL Data Transfer

 Source Server         : newMysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 116.205.187.238:3306
 Source Schema         : new_forum

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 06/12/2022 14:37:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_forum_posts
-- ----------------------------
DROP TABLE IF EXISTS `t_forum_posts`;
CREATE TABLE `t_forum_posts`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `user_id` int NULL DEFAULT NULL COMMENT '创建帖子的用户id',
  `heat` int NULL DEFAULT NULL COMMENT '点击量',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `visibility` tinyint NULL DEFAULT 1 COMMENT '是否可见 1 可见 0 不可见 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛帖子表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_forum_posts
-- ----------------------------

-- ----------------------------
-- Table structure for t_forum_private_letter
-- ----------------------------
DROP TABLE IF EXISTS `t_forum_private_letter`;
CREATE TABLE `t_forum_private_letter`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '私信id',
  `send_id` int NOT NULL COMMENT '私信发送人',
  `receive_id` int NOT NULL COMMENT '私信接收人',
  `send_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '接收时间',
  `visibility` tinyint NULL DEFAULT 1 COMMENT '是否可见 1 0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '私信表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_forum_private_letter
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
