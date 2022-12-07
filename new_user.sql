/*
 Navicat MySQL Data Transfer

 Source Server         : newMysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 116.205.187.238:3306
 Source Schema         : new_user

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 06/12/2022 14:37:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_user_access_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_user_access_manage`;
CREATE TABLE `t_user_access_manage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封禁ip',
  `user_id` int NULL DEFAULT NULL COMMENT '封禁用户id',
  `see` tinyint NULL DEFAULT 1 COMMENT '可看内容',
  `comment` tinyint NULL DEFAULT 1 COMMENT '可回复',
  `post` tinyint NULL DEFAULT 1 COMMENT '可发帖',
  `send_letter` tinyint NULL DEFAULT 1 COMMENT '可私信',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户访问权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_access_manage
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_black_list
-- ----------------------------
DROP TABLE IF EXISTS `t_user_black_list`;
CREATE TABLE `t_user_black_list`  (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT '用户id',
  `black_user_id` int NOT NULL COMMENT '拉黑对象',
  `time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户黑名单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_black_list
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_user_comment`;
CREATE TABLE `t_user_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int NOT NULL COMMENT '用户id',
  `article_id` int NULL DEFAULT NULL COMMENT '对应来源id 根据status',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论创建时间',
  `last_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论最后一次回复时间',
  `parent_id` int UNSIGNED NULL DEFAULT 0 COMMENT '父评论id',
  `visibility` tinyint NULL DEFAULT 1 COMMENT '是否可见 0 不可见 1可见',
  `status` tinyint NULL DEFAULT NULL COMMENT '文章评论 0 论坛评论 1',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_comment
-- ----------------------------
INSERT INTO `t_user_comment` VALUES (1, 1, 1, '2022-11-16 12:09:50', '2022-11-15 08:04:35', 0, 1, 0, '文章写的很棒');
INSERT INTO `t_user_comment` VALUES (2, 1, 1, '2022-11-16 12:14:17', '2022-11-15 08:05:18', 0, 1, 0, '楼上说的对');
INSERT INTO `t_user_comment` VALUES (3, 1, 1, '2022-11-16 12:14:20', '2022-11-15 08:05:39', 1, 1, 0, '楼上说的很对呀');
INSERT INTO `t_user_comment` VALUES (4, 1, 1, '2022-11-16 12:14:18', '2022-11-15 08:05:58', 1, 1, 0, '对对对:smile:');
INSERT INTO `t_user_comment` VALUES (5, 2, 1, '2022-11-17 13:20:57', '2022-11-17 13:20:57', 4, 1, 0, '顶顶顶');

-- ----------------------------
-- Table structure for t_user_comment_user_like
-- ----------------------------
DROP TABLE IF EXISTS `t_user_comment_user_like`;
CREATE TABLE `t_user_comment_user_like`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户评论联系id',
  `user_id` int NOT NULL COMMENT '用户id',
  `comment_id` int NOT NULL COMMENT '评论id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户点赞时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_comment_id`(`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '记录用户什么时候点赞了' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_comment_user_like
-- ----------------------------
INSERT INTO `t_user_comment_user_like` VALUES (1, 2, 3, '2022-11-17 07:00:21');
INSERT INTO `t_user_comment_user_like` VALUES (2, 2, 3, '2022-11-17 09:15:37');
INSERT INTO `t_user_comment_user_like` VALUES (3, 2, 3, '2022-11-17 09:16:07');
INSERT INTO `t_user_comment_user_like` VALUES (4, 2, 3, '2022-11-17 09:17:08');
INSERT INTO `t_user_comment_user_like` VALUES (5, 2, 3, '2022-11-17 09:23:42');
INSERT INTO `t_user_comment_user_like` VALUES (6, 2, 3, '2022-11-17 09:29:56');
INSERT INTO `t_user_comment_user_like` VALUES (7, 2, 3, '2022-11-17 09:34:42');
INSERT INTO `t_user_comment_user_like` VALUES (8, 2, 4, '2022-11-17 09:59:16');
INSERT INTO `t_user_comment_user_like` VALUES (13, 2, 5, '2022-11-18 09:48:14');
INSERT INTO `t_user_comment_user_like` VALUES (14, 2, 1, '2022-11-18 09:48:16');

-- ----------------------------
-- Table structure for t_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `t_user_ext`;
CREATE TABLE `t_user_ext`  (
  `user_id` int NOT NULL COMMENT '用户id',
  `experience` int NULL DEFAULT 0 COMMENT '用户经验值',
  `post_num` int NULL DEFAULT 0 COMMENT '帖子总数',
  `blog_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客url',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人签名',
  `show_mail` tinyint NULL DEFAULT 1 COMMENT '是否展示邮箱',
  `extend1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息扩展表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_ext
-- ----------------------------
INSERT INTO `t_user_ext` VALUES (1, 0, 0, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '加密后密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像图片链接',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '用户性别',
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户邮箱',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '账号创建时间',
  `last_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `last_ip` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `extend1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展预留字段1',
  `extend2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展预留字段1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES (1, '杂货店的阿猿', '$2a$10$UQg9.fQp4HrMQS9uVphiPu1WAdMLkqKMN98HwSRVK.tvBr50367Za', 'http://img.zzzyuan.cn/avater.png', NULL, 'codesuperman@foxmail.com', '2022-11-19 12:14:42', '2022-11-19 12:14:42', NULL, NULL, NULL);
INSERT INTO `t_user_info` VALUES (2, 'zzzyuan', '$2a$10$ONyUWATpcAuMn1r0mpNxSOFDiOjaxMOLn77/htSVYPN8fABbpK5NS', 'http://img.zzzyuan.cn/avater.png', NULL, 'zzzyuanluo@163.com', '2022-11-19 12:14:49', '2022-11-19 12:14:49', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
