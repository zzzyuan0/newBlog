/*
 Navicat MySQL Data Transfer

 Source Server         : newMysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 116.205.187.238:3306
 Source Schema         : new_admin

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 06/12/2022 14:36:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_blog_img_url', '图片链接表', '', NULL, 'TBlogImgUrl', 'crud', 'com.ruoyi.system', 'system', 'url', '图片链接修改', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2030\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"新博客管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 08:57:32', '', '2022-11-08 08:57:59', '');
INSERT INTO `gen_table` VALUES (2, 't_blog_article', '用户文章表', 't_blog_article_category_rel', 'article_id', 'TBlogArticle', 'sub', 'com.ruoyi.system', 'system', 'article', '用户文章', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2030\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"新博客管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 09:35:25', '', '2022-11-08 09:36:58', '');
INSERT INTO `gen_table` VALUES (3, 't_blog_article_category_rel', '分类文章联系表', '', NULL, 'TBlogArticleCategoryRel', 'crud', 'com.ruoyi.system', 'system', 'rel', '分类文章联系', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2030\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"新博客管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 09:35:26', '', '2022-11-08 09:36:42', '');
INSERT INTO `gen_table` VALUES (4, 't_blog_category', '文章分类表', '', NULL, 'TBlogCategory', 'crud', 'com.ruoyi.system', 'system', 'category', '文章分类', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2030\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"新博客管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 09:35:26', '', '2022-11-08 09:36:51', '');
INSERT INTO `gen_table` VALUES (5, 't_blog_friend_link', '友链表', '', NULL, 'TBlogFriendLink', 'crud', 'com.ruoyi.system', 'system', 'link', '友链', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2030\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"新博客管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 09:35:27', '', '2022-11-08 09:36:31', '');
INSERT INTO `gen_table` VALUES (6, 't_forum_posts', '论坛帖子表', '', NULL, 'TForumPosts', 'crud', 'com.ruoyi.system', 'system', 'posts', '论坛帖子', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2031\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"论坛管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 10:53:06', '', '2022-11-08 11:00:30', '');
INSERT INTO `gen_table` VALUES (7, 't_forum_private_letter', '私信表', '', NULL, 'TForumPrivateLetter', 'crud', 'com.ruoyi.system', 'system', 'letter', '私信', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2031\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"论坛管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 10:53:07', '', '2022-11-08 11:00:16', '');
INSERT INTO `gen_table` VALUES (8, 't_user_access_manage', '用户访问权限表', '', NULL, 'TUserAccessManage', 'crud', 'com.ruoyi.system', 'system', 'manage', '用户访问权限', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2032\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 10:53:08', '', '2022-11-08 10:59:23', '');
INSERT INTO `gen_table` VALUES (9, 't_user_black_list', '用户黑名单表', '', NULL, 'TUserBlackList', 'crud', 'com.ruoyi.system', 'system', 'list', '用户黑名单', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2032\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 10:53:08', '', '2022-11-08 10:59:52', '');
INSERT INTO `gen_table` VALUES (10, 't_user_comment', '评论表', '', NULL, 'TUserComment', 'crud', 'com.ruoyi.system', 'system', 'comment', '评论', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2032\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 10:53:09', '', '2022-11-08 10:58:32', '');
INSERT INTO `gen_table` VALUES (11, 't_user_ext', '用户信息扩展表', '', NULL, 'TUserExt', 'crud', 'com.ruoyi.system', 'system', 'ext', '用户信息扩展', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2032\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 10:53:09', '', '2022-11-08 10:59:30', '');
INSERT INTO `gen_table` VALUES (12, 't_user_info', '用户信息表', '', NULL, 'TUserInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '用户信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2032\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"用户管理\",\"treeCode\":\"\"}', 'admin', '2022-11-08 10:53:10', '', '2022-11-08 10:58:22', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '', 'int', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 08:57:32', NULL, '2022-11-08 08:57:59');
INSERT INTO `gen_table_column` VALUES (2, '1', 'img_url', '', 'varchar(255)', 'String', 'imgUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 08:57:32', NULL, '2022-11-08 08:58:00');
INSERT INTO `gen_table_column` VALUES (3, '2', 'id', '文章id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 09:35:25', NULL, '2022-11-08 09:36:58');
INSERT INTO `gen_table_column` VALUES (4, '2', 'user_id', '用户id', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 09:35:25', NULL, '2022-11-08 09:36:58');
INSERT INTO `gen_table_column` VALUES (5, '2', 'title', '文章标题', 'varchar(60)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 09:35:25', NULL, '2022-11-08 09:36:58');
INSERT INTO `gen_table_column` VALUES (6, '2', 'content', '文章内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 4, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:58');
INSERT INTO `gen_table_column` VALUES (7, '2', 'heat', '文章热度', 'int', 'Long', 'heat', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:58');
INSERT INTO `gen_table_column` VALUES (8, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:58');
INSERT INTO `gen_table_column` VALUES (9, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:59');
INSERT INTO `gen_table_column` VALUES (10, '2', 'visibility', '是否可见 默认可见 1 不可见 0', 'tinyint', 'Long', 'visibility', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:59');
INSERT INTO `gen_table_column` VALUES (11, '3', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:42');
INSERT INTO `gen_table_column` VALUES (12, '3', 'article_id', '文章id', 'int', 'Long', 'articleId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:42');
INSERT INTO `gen_table_column` VALUES (13, '3', 'category_id', '分类id', 'int', 'Long', 'categoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:42');
INSERT INTO `gen_table_column` VALUES (14, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2022-11-08 09:35:26', NULL, '2022-11-08 09:36:42');
INSERT INTO `gen_table_column` VALUES (15, '4', 'id', 'id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:51');
INSERT INTO `gen_table_column` VALUES (16, '4', 'parent_id', '父分类id', 'int', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:51');
INSERT INTO `gen_table_column` VALUES (17, '4', 'name', '分类名', 'varchar(50)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:51');
INSERT INTO `gen_table_column` VALUES (18, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:51');
INSERT INTO `gen_table_column` VALUES (19, '4', 'status', '分类等级 0 语言 1 一级分类 2 二级分类', 'tinyint', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:51');
INSERT INTO `gen_table_column` VALUES (20, '5', 'id', '友链id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:31');
INSERT INTO `gen_table_column` VALUES (21, '5', 'name', '好友名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:31');
INSERT INTO `gen_table_column` VALUES (22, '5', 'url', '好友博客链接', 'varchar(255)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:31');
INSERT INTO `gen_table_column` VALUES (23, '5', 'email', '好友邮箱', 'varchar(255)', 'String', 'email', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:31');
INSERT INTO `gen_table_column` VALUES (24, '5', 'avatar', '好友头像', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:31');
INSERT INTO `gen_table_column` VALUES (25, '5', 'sign', '好友签名', 'varchar(255)', 'String', 'sign', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-08 09:35:27', NULL, '2022-11-08 09:36:32');
INSERT INTO `gen_table_column` VALUES (26, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-11-08 09:35:28', NULL, '2022-11-08 09:36:32');
INSERT INTO `gen_table_column` VALUES (27, '5', 'visibility', '是否可见', 'tinyint', 'Long', 'visibility', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-08 09:35:28', NULL, '2022-11-08 09:36:32');
INSERT INTO `gen_table_column` VALUES (28, '6', 'id', '帖子id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:30');
INSERT INTO `gen_table_column` VALUES (29, '6', 'user_id', '创建帖子的用户id', 'int', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:30');
INSERT INTO `gen_table_column` VALUES (30, '6', 'heat', '点击量', 'int', 'Long', 'heat', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:30');
INSERT INTO `gen_table_column` VALUES (31, '6', 'content', '内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 4, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:31');
INSERT INTO `gen_table_column` VALUES (32, '6', 'title', '帖子标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:31');
INSERT INTO `gen_table_column` VALUES (33, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:31');
INSERT INTO `gen_table_column` VALUES (34, '6', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:31');
INSERT INTO `gen_table_column` VALUES (35, '6', 'visibility', '是否可见 1 可见 0 不可见', 'tinyint', 'Long', 'visibility', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:31');
INSERT INTO `gen_table_column` VALUES (36, '7', 'id', '私信id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:16');
INSERT INTO `gen_table_column` VALUES (37, '7', 'send_id', '私信发送人', 'int', 'Long', 'sendId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:16');
INSERT INTO `gen_table_column` VALUES (38, '7', 'receive_id', '私信接收人', 'int', 'Long', 'receiveId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:17');
INSERT INTO `gen_table_column` VALUES (39, '7', 'send_time', '发送时间', 'datetime', 'Date', 'sendTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:17');
INSERT INTO `gen_table_column` VALUES (40, '7', 'receive_time', '接收时间', 'datetime', 'Date', 'receiveTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:17');
INSERT INTO `gen_table_column` VALUES (41, '7', 'visibility', '是否可见 1 0', 'tinyint', 'Long', 'visibility', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-08 10:53:07', NULL, '2022-11-08 11:00:17');
INSERT INTO `gen_table_column` VALUES (42, '8', 'id', '用户id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:24');
INSERT INTO `gen_table_column` VALUES (43, '8', 'ip', '封禁ip', 'varchar(255)', 'String', 'ip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:24');
INSERT INTO `gen_table_column` VALUES (44, '8', 'user_id', '封禁用户id', 'int', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:24');
INSERT INTO `gen_table_column` VALUES (45, '8', 'see', '可看内容', 'tinyint', 'Long', 'see', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:24');
INSERT INTO `gen_table_column` VALUES (46, '8', 'comment', '可回复', 'tinyint', 'Long', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:24');
INSERT INTO `gen_table_column` VALUES (47, '8', 'post', '可发帖', 'tinyint', 'Long', 'post', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:24');
INSERT INTO `gen_table_column` VALUES (48, '8', 'send_letter', '可私信', 'tinyint', 'Long', 'sendLetter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:24');
INSERT INTO `gen_table_column` VALUES (49, '9', 'id', '用户id', 'int', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:52');
INSERT INTO `gen_table_column` VALUES (50, '9', 'user_id', '用户id', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:52');
INSERT INTO `gen_table_column` VALUES (51, '9', 'black_user_id', '拉黑对象', 'int', 'Long', 'blackUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:52');
INSERT INTO `gen_table_column` VALUES (52, '9', 'time', '时间', 'datetime', 'Date', 'time', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2022-11-08 10:53:08', NULL, '2022-11-08 10:59:52');
INSERT INTO `gen_table_column` VALUES (53, '9', 'remark', '原因', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:59:52');
INSERT INTO `gen_table_column` VALUES (54, '10', 'id', '评论id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:32');
INSERT INTO `gen_table_column` VALUES (55, '10', 'user_id', '用户id', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:32');
INSERT INTO `gen_table_column` VALUES (56, '10', 'article_id', '对应来源id 根据status', 'int', 'Long', 'articleId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:32');
INSERT INTO `gen_table_column` VALUES (57, '10', 'create_time', '评论创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:33');
INSERT INTO `gen_table_column` VALUES (58, '10', 'last_time', '评论最后一次回复时间', 'datetime', 'Date', 'lastTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:33');
INSERT INTO `gen_table_column` VALUES (59, '10', 'parent_id', '父评论id', 'int', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:33');
INSERT INTO `gen_table_column` VALUES (60, '10', 'heat', '点赞热度', 'int', 'Long', 'heat', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:33');
INSERT INTO `gen_table_column` VALUES (61, '10', 'visibility', '是否可见 0 不可见 1可见', 'tinyint', 'Long', 'visibility', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:33');
INSERT INTO `gen_table_column` VALUES (62, '10', 'status', '文章评论 0 论坛评论 1', 'tinyint', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2022-11-08 10:53:09', NULL, '2022-11-08 10:58:33');
INSERT INTO `gen_table_column` VALUES (63, '11', 'user_id', '用户id', 'int', 'Long', 'userId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 10:53:10', NULL, '2022-11-08 10:59:30');
INSERT INTO `gen_table_column` VALUES (64, '11', 'experience', '用户经验值', 'int', 'Long', 'experience', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-08 10:53:10', NULL, '2022-11-08 10:59:30');
INSERT INTO `gen_table_column` VALUES (65, '11', 'post_num', '帖子总数', 'int', 'Long', 'postNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 10:53:10', NULL, '2022-11-08 10:59:31');
INSERT INTO `gen_table_column` VALUES (66, '11', 'blog_url', '博客url', 'varchar(255)', 'String', 'blogUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-08 10:53:10', NULL, '2022-11-08 10:59:31');
INSERT INTO `gen_table_column` VALUES (67, '11', 'sign', '个人签名', 'varchar(255)', 'String', 'sign', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-08 10:53:10', NULL, '2022-11-08 10:59:31');
INSERT INTO `gen_table_column` VALUES (68, '11', 'show_mail', '是否展示邮箱', 'tinyint', 'Long', 'showMail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-08 10:53:10', NULL, '2022-11-08 10:59:31');
INSERT INTO `gen_table_column` VALUES (69, '11', 'extend1', '', 'varchar(255)', 'String', 'extend1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-08 10:53:10', NULL, '2022-11-08 10:59:31');
INSERT INTO `gen_table_column` VALUES (70, '12', 'id', '用户id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:22');
INSERT INTO `gen_table_column` VALUES (71, '12', 'name', '用户名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (72, '12', 'password', '加密后密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (73, '12', 'avatar', '用户头像图片链接', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (74, '12', 'sex', '用户性别', 'tinyint(1)', 'Integer', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (75, '12', 'email', '用户邮箱', 'varchar(125)', 'String', 'email', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (76, '12', 'create_time', '账号创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (77, '12', 'last_time', '最后登录时间', 'datetime', 'Date', 'lastTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2022-11-08 10:53:11', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (78, '12', 'last_ip', '最后登录ip', 'varchar(60)', 'String', 'lastIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-11-08 10:53:12', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (79, '12', 'extend1', '扩展预留字段1', 'varchar(255)', 'String', 'extend1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-11-08 10:53:12', NULL, '2022-11-08 10:58:23');
INSERT INTO `gen_table_column` VALUES (80, '12', 'extend2', '扩展预留字段1', 'varchar(255)', 'String', 'extend2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-11-08 10:53:12', NULL, '2022-11-08 10:58:24');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-11-08 06:58:47', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-11-08 06:58:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-11-08 06:58:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-11-08 06:58:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 07:03:46');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 07:07:42');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 07:45:14');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 07:47:37');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-11-08 07:53:08');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 07:53:12');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 08:07:03');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 08:52:59');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:01:41');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:02:41');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:05:15');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-11-08 09:11:10');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:11:13');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:14:12');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:23:10');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:41:18');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 09:43:17');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 10:43:45');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-11-08 11:16:07');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-08 11:16:22');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '222.240.35.246', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-09 07:30:17');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '222.240.34.121', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-10 05:51:00');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '27.184.157.132', 'XX XX', 'Chrome 10', 'Windows 10', '1', '* 必须填写', '2022-11-12 12:28:44');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '27.184.157.132', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-12 12:28:57');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '183.198.1.125', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2022-11-12 12:35:45');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '223.147.209.232', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-14 09:10:01');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '45.62.122.143', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-18 13:08:57');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2075 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-11-08 06:58:46', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2022-11-08 06:58:46', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-11-08 06:58:46', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-11-08 06:58:46', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-11-08 06:58:46', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-11-08 06:58:46', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-11-08 06:58:46', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-11-08 06:58:46', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-11-08 06:58:46', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-11-08 06:58:46', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-11-08 06:58:46', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-11-08 06:58:46', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-11-08 06:58:46', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-11-08 06:58:46', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-11-08 06:58:46', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-11-08 06:58:46', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-11-08 06:58:46', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-11-08 06:58:46', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-11-08 06:58:46', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-11-08 06:58:46', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-11-08 06:58:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-11-08 06:58:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '用户文章', 2030, 1, '/system/article', 'menuItem', 'C', '0', '1', 'new-blog-admin:article:view', '#', 'admin', '2022-11-08 07:01:09', 'admin', '2022-11-08 07:49:00', '用户文章菜单');
INSERT INTO `sys_menu` VALUES (2001, '用户文章查询', 2000, 1, '#', '', 'F', '0', '1', 'new-blog-admin:article:list', '#', 'admin', '2022-11-08 07:01:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '用户文章新增', 2000, 2, '#', '', 'F', '0', '1', 'new-blog-admin:article:add', '#', 'admin', '2022-11-08 07:01:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '用户文章修改', 2000, 3, '#', '', 'F', '0', '1', 'new-blog-admin:article:edit', '#', 'admin', '2022-11-08 07:01:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '用户文章删除', 2000, 4, '#', '', 'F', '0', '1', 'new-blog-admin:article:remove', '#', 'admin', '2022-11-08 07:01:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '用户文章导出', 2000, 5, '#', '', 'F', '0', '1', 'new-blog-admin:article:export', '#', 'admin', '2022-11-08 07:01:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '文章分类', 2030, 1, '/system/category', 'menuItem', 'C', '0', '1', 'new-blog-admin:category:view', '#', 'admin', '2022-11-08 07:01:18', 'admin', '2022-11-08 09:43:56', '文章分类菜单');
INSERT INTO `sys_menu` VALUES (2007, '文章分类查询', 2006, 1, '#', '', 'F', '0', '1', 'new-blog-admin:category:list', '#', 'admin', '2022-11-08 07:01:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '文章分类新增', 2006, 2, '#', '', 'F', '0', '1', 'new-blog-admin:category:add', '#', 'admin', '2022-11-08 07:01:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '文章分类修改', 2006, 3, '#', '', 'F', '0', '1', 'new-blog-admin:category:edit', '#', 'admin', '2022-11-08 07:01:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '文章分类删除', 2006, 4, '#', '', 'F', '0', '1', 'new-blog-admin:category:remove', '#', 'admin', '2022-11-08 07:01:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '文章分类导出', 2006, 5, '#', '', 'F', '0', '1', 'new-blog-admin:category:export', '#', 'admin', '2022-11-08 07:01:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '友链', 2030, 1, '/system/link', 'menuItem', 'C', '0', '1', 'new-blog-admin:link:view', '#', 'admin', '2022-11-08 07:01:32', 'admin', '2022-11-08 09:44:12', '友链菜单');
INSERT INTO `sys_menu` VALUES (2013, '友链查询', 2012, 1, '#', '', 'F', '0', '1', 'new-blog-admin:link:list', '#', 'admin', '2022-11-08 07:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '友链新增', 2012, 2, '#', '', 'F', '0', '1', 'new-blog-admin:link:add', '#', 'admin', '2022-11-08 07:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '友链修改', 2012, 3, '#', '', 'F', '0', '1', 'new-blog-admin:link:edit', '#', 'admin', '2022-11-08 07:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '友链删除', 2012, 4, '#', '', 'F', '0', '1', 'new-blog-admin:link:remove', '#', 'admin', '2022-11-08 07:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '友链导出', 2012, 5, '#', '', 'F', '0', '1', 'new-blog-admin:link:export', '#', 'admin', '2022-11-08 07:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '分类文章联系', 2030, 1, '/system/rel', 'menuItem', 'C', '0', '1', 'new-blog-admin:rel:view', '#', 'admin', '2022-11-08 07:01:49', 'admin', '2022-11-08 09:44:23', '分类文章联系菜单');
INSERT INTO `sys_menu` VALUES (2019, '分类文章联系查询', 2018, 1, '#', '', 'F', '0', '1', 'new-blog-admin:rel:list', '#', 'admin', '2022-11-08 07:01:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '分类文章联系新增', 2018, 2, '#', '', 'F', '0', '1', 'new-blog-admin:rel:add', '#', 'admin', '2022-11-08 07:01:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '分类文章联系修改', 2018, 3, '#', '', 'F', '0', '1', 'new-blog-admin:rel:edit', '#', 'admin', '2022-11-08 07:01:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '分类文章联系删除', 2018, 4, '#', '', 'F', '0', '1', 'new-blog-admin:rel:remove', '#', 'admin', '2022-11-08 07:01:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '分类文章联系导出', 2018, 5, '#', '', 'F', '0', '1', 'new-blog-admin:rel:export', '#', 'admin', '2022-11-08 07:01:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '图片链接修改', 2030, 1, '/system/url', 'menuItem', 'C', '0', '1', 'new-blog-admin:url:view', '#', 'admin', '2022-11-08 07:01:58', 'admin', '2022-11-08 09:06:53', '图片链接修改菜单');
INSERT INTO `sys_menu` VALUES (2025, '图片链接修改查询', 2024, 1, '#', '', 'F', '0', '1', 'new-blog-admin:url:list', '#', 'admin', '2022-11-08 07:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '图片链接修改新增', 2024, 2, '#', '', 'F', '0', '1', 'new-blog-admin:url:add', '#', 'admin', '2022-11-08 07:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '图片链接修改修改', 2024, 3, '#', '', 'F', '0', '1', 'new-blog-admin:url:edit', '#', 'admin', '2022-11-08 07:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '图片链接修改删除', 2024, 4, '#', '', 'F', '0', '1', 'new-blog-admin:url:remove', '#', 'admin', '2022-11-08 07:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '图片链接修改导出', 2024, 5, '#', '', 'F', '0', '1', 'new-blog-admin:url:export', '#', 'admin', '2022-11-08 07:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '博客管理', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-file-word-o', 'admin', '2022-11-08 07:04:23', 'admin', '2022-11-08 10:57:27', '');
INSERT INTO `sys_menu` VALUES (2031, '论坛管理', 0, 6, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-comment-o', 'admin', '2022-11-08 10:56:13', 'admin', '2022-11-08 10:56:52', '');
INSERT INTO `sys_menu` VALUES (2032, '用户管理', 0, 7, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-address-book', 'admin', '2022-11-08 10:56:28', 'admin', '2022-11-08 10:57:35', '');
INSERT INTO `sys_menu` VALUES (2033, '用户信息扩展', 2032, 1, '/system/ext', '', 'C', '0', '1', 'system:ext:view', '#', 'admin', '2022-11-08 11:01:51', '', NULL, '用户信息扩展菜单');
INSERT INTO `sys_menu` VALUES (2034, '用户信息扩展查询', 2033, 1, '#', '', 'F', '0', '1', 'system:ext:list', '#', 'admin', '2022-11-08 11:01:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '用户信息扩展新增', 2033, 2, '#', '', 'F', '0', '1', 'system:ext:add', '#', 'admin', '2022-11-08 11:01:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '用户信息扩展修改', 2033, 3, '#', '', 'F', '0', '1', 'system:ext:edit', '#', 'admin', '2022-11-08 11:01:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '用户信息扩展删除', 2033, 4, '#', '', 'F', '0', '1', 'system:ext:remove', '#', 'admin', '2022-11-08 11:01:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '用户信息扩展导出', 2033, 5, '#', '', 'F', '0', '1', 'system:ext:export', '#', 'admin', '2022-11-08 11:01:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '评论', 2032, 1, '/system/comment', '', 'C', '0', '1', 'system:comment:view', '#', 'admin', '2022-11-08 11:01:57', '', NULL, '评论菜单');
INSERT INTO `sys_menu` VALUES (2040, '评论查询', 2039, 1, '#', '', 'F', '0', '1', 'system:comment:list', '#', 'admin', '2022-11-08 11:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '评论新增', 2039, 2, '#', '', 'F', '0', '1', 'system:comment:add', '#', 'admin', '2022-11-08 11:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '评论修改', 2039, 3, '#', '', 'F', '0', '1', 'system:comment:edit', '#', 'admin', '2022-11-08 11:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '评论删除', 2039, 4, '#', '', 'F', '0', '1', 'system:comment:remove', '#', 'admin', '2022-11-08 11:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '评论导出', 2039, 5, '#', '', 'F', '0', '1', 'system:comment:export', '#', 'admin', '2022-11-08 11:01:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '用户信息', 2032, 1, '/system/info', '', 'C', '0', '1', 'system:info:view', '#', 'admin', '2022-11-08 11:02:05', '', NULL, '用户信息菜单');
INSERT INTO `sys_menu` VALUES (2046, '用户信息查询', 2045, 1, '#', '', 'F', '0', '1', 'system:info:list', '#', 'admin', '2022-11-08 11:02:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '用户信息新增', 2045, 2, '#', '', 'F', '0', '1', 'system:info:add', '#', 'admin', '2022-11-08 11:02:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '用户信息修改', 2045, 3, '#', '', 'F', '0', '1', 'system:info:edit', '#', 'admin', '2022-11-08 11:02:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '用户信息删除', 2045, 4, '#', '', 'F', '0', '1', 'system:info:remove', '#', 'admin', '2022-11-08 11:02:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '用户信息导出', 2045, 5, '#', '', 'F', '0', '1', 'system:info:export', '#', 'admin', '2022-11-08 11:02:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '私信', 2031, 1, '/system/letter', '', 'C', '0', '1', 'system:letter:view', '#', 'admin', '2022-11-08 11:02:11', '', NULL, '私信菜单');
INSERT INTO `sys_menu` VALUES (2052, '私信查询', 2051, 1, '#', '', 'F', '0', '1', 'system:letter:list', '#', 'admin', '2022-11-08 11:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '私信新增', 2051, 2, '#', '', 'F', '0', '1', 'system:letter:add', '#', 'admin', '2022-11-08 11:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '私信修改', 2051, 3, '#', '', 'F', '0', '1', 'system:letter:edit', '#', 'admin', '2022-11-08 11:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '私信删除', 2051, 4, '#', '', 'F', '0', '1', 'system:letter:remove', '#', 'admin', '2022-11-08 11:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '私信导出', 2051, 5, '#', '', 'F', '0', '1', 'system:letter:export', '#', 'admin', '2022-11-08 11:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '用户黑名单', 2032, 1, '/system/list', '', 'C', '0', '1', 'system:list:view', '#', 'admin', '2022-11-08 11:02:19', '', NULL, '用户黑名单菜单');
INSERT INTO `sys_menu` VALUES (2058, '用户黑名单查询', 2057, 1, '#', '', 'F', '0', '1', 'system:list:list', '#', 'admin', '2022-11-08 11:02:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '用户黑名单新增', 2057, 2, '#', '', 'F', '0', '1', 'system:list:add', '#', 'admin', '2022-11-08 11:02:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '用户黑名单修改', 2057, 3, '#', '', 'F', '0', '1', 'system:list:edit', '#', 'admin', '2022-11-08 11:02:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '用户黑名单删除', 2057, 4, '#', '', 'F', '0', '1', 'system:list:remove', '#', 'admin', '2022-11-08 11:02:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '用户黑名单导出', 2057, 5, '#', '', 'F', '0', '1', 'system:list:export', '#', 'admin', '2022-11-08 11:02:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '用户访问权限', 2032, 1, '/system/manage', '', 'C', '0', '1', 'system:manage:view', '#', 'admin', '2022-11-08 11:02:26', '', NULL, '用户访问权限菜单');
INSERT INTO `sys_menu` VALUES (2064, '用户访问权限查询', 2063, 1, '#', '', 'F', '0', '1', 'system:manage:list', '#', 'admin', '2022-11-08 11:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '用户访问权限新增', 2063, 2, '#', '', 'F', '0', '1', 'system:manage:add', '#', 'admin', '2022-11-08 11:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '用户访问权限修改', 2063, 3, '#', '', 'F', '0', '1', 'system:manage:edit', '#', 'admin', '2022-11-08 11:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '用户访问权限删除', 2063, 4, '#', '', 'F', '0', '1', 'system:manage:remove', '#', 'admin', '2022-11-08 11:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '用户访问权限导出', 2063, 5, '#', '', 'F', '0', '1', 'system:manage:export', '#', 'admin', '2022-11-08 11:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '论坛帖子', 2031, 1, '/system/posts', '', 'C', '0', '1', 'system:posts:view', '#', 'admin', '2022-11-08 11:02:32', '', NULL, '论坛帖子菜单');
INSERT INTO `sys_menu` VALUES (2070, '论坛帖子查询', 2069, 1, '#', '', 'F', '0', '1', 'system:posts:list', '#', 'admin', '2022-11-08 11:02:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '论坛帖子新增', 2069, 2, '#', '', 'F', '0', '1', 'system:posts:add', '#', 'admin', '2022-11-08 11:02:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '论坛帖子修改', 2069, 3, '#', '', 'F', '0', '1', 'system:posts:edit', '#', 'admin', '2022-11-08 11:02:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '论坛帖子删除', 2069, 4, '#', '', 'F', '0', '1', 'system:posts:remove', '#', 'admin', '2022-11-08 11:02:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '论坛帖子导出', 2069, 5, '#', '', 'F', '0', '1', 'system:posts:export', '#', 'admin', '2022-11-08 11:02:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-11-08 06:58:47', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"新博客管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 07:04:24');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"2030\"],\"menuType\":[\"C\"],\"menuName\":[\"用户文章\"],\"url\":[\"/system/article\"],\"target\":[\"menuItem\"],\"perms\":[\"new-blog-admin:article:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 07:49:00');
INSERT INTO `sys_oper_log` VALUES (102, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `t_blog_article`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'文章id\',\\n  `user_id` int NOT NULL COMMENT \'用户id\',\\n  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'文章标题\',\\n  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT \'文章内容\',\\n  `heat` int NULL DEFAULT 0 COMMENT \'文章热度\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `visibility` tinyint NULL DEFAULT 1 COMMENT \'是否可见 默认可见 1 不可见 0\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'用户文章表\' ROW_FORMAT = DYNAMIC;\\n\\n-- ----------------------------\\n-- Table structure for t_blog_article_category_rel\\n-- ----------------------------\\nCREATE TABLE `t_blog_article_category_rel`  (\\n  `id` int NOT NULL AUTO_INCREMENT,\\n  `article_id` int NOT NULL COMMENT \'文章id\',\\n  `category_id` int NOT NULL COMMENT \'分类id\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  PRIMARY KEY (`id`) USING BTREE,\\n  INDEX `index_article_id`(`article_id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'分类文章联系表\' ROW_FORMAT = DYNAMIC;\\n\\n-- ----------------------------\\n-- Table structure for t_blog_category\\n-- ----------------------------\\nCREATE TABLE `t_blog_category`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'id\',\\n  `parent_id` int NULL DEFAULT NULL COMMENT \'父分类id\',\\n  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'分类名\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `status` tinyint NULL DEFAULT NULL COMMENT \'分类等级 0 语言 1 一级分类 2 二级分类\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'文章分类表\' ROW_FORMAT = DYNAMIC;\\', '{\"msg\":\"创建表结构异常[参数存在SQL注入风险]\",\"code\":500}', 0, NULL, '2022-11-08 08:55:11');
INSERT INTO `sys_oper_log` VALUES (103, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `t_blog_article`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'文章id\',\\n  `user_id` int NOT NULL COMMENT \'用户id\',\\n  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'文章标题\',\\n  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT \'文章内容\',\\n  `heat` int NULL DEFAULT 0 COMMENT \'文章热度\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `visibility` tinyint NULL DEFAULT 1 COMMENT \'是否可见 默认可见 1 不可见 0\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'用户文章表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_article_category_rel`  (\\n  `id` int NOT NULL AUTO_INCREMENT,\\n  `article_id` int NOT NULL COMMENT \'文章id\',\\n  `category_id` int NOT NULL COMMENT \'分类id\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  PRIMARY KEY (`id`) USING BTREE,\\n  INDEX `index_article_id`(`article_id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'分类文章联系表\' ROW_FORMAT = DYNAMIC;\\n\\n-- ----------------------------\\n-- Table structure for t_blog_category\\n-- ----------------------------\\nCREATE TABLE `t_blog_category`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'id\',\\n  `parent_id` int NULL DEFAULT NULL COMMENT \'父分类id\',\\n  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'分类名\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `status` tinyint NULL DEFAULT NULL COMMENT \'分类等级 0 语言 1 一级分类 2 二级分类\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'文章分类表\' ROW_FORMAT = DYNAMIC;\\n\\n-- ----------------------------\\n-- Table structure for t_blog_friend_link\\n-- ----------------------------\\nCREATE', '{\"msg\":\"创建表结构异常[参数存在SQL注入风险]\",\"code\":500}', 0, NULL, '2022-11-08 08:55:17');
INSERT INTO `sys_oper_log` VALUES (104, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `t_blog_article`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'文章id\',\\n  `user_id` int NOT NULL COMMENT \'用户id\',\\n  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'文章标题\',\\n  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT \'文章内容\',\\n  `heat` int NULL DEFAULT 0 COMMENT \'文章热度\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `visibility` tinyint NULL DEFAULT 1 COMMENT \'是否可见 默认可见 1 不可见 0\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'用户文章表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_article_category_rel`  (\\n  `id` int NOT NULL AUTO_INCREMENT,\\n  `article_id` int NOT NULL COMMENT \'文章id\',\\n  `category_id` int NOT NULL COMMENT \'分类id\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  PRIMARY KEY (`id`) USING BTREE,\\n  INDEX `index_article_id`(`article_id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'分类文章联系表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_category`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'id\',\\n  `parent_id` int NULL DEFAULT NULL COMMENT \'父分类id\',\\n  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'分类名\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `status` tinyint NULL DEFAULT NULL COMMENT \'分类等级 0 语言 1 一级分类 2 二级分类\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'文章分类表\' ROW_FORMAT = DYNAMIC;\\n\\n-- ----------------------------\\n-- Table structure for t_blog_friend_link\\n-- ----------------------------\\nCREATE TABLE `t_blog_friend_link`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'友链id\',\\n  `name` varchar(255) ', '{\"msg\":\"创建表结构异常[参数存在SQL注入风险]\",\"code\":500}', 0, NULL, '2022-11-08 08:55:21');
INSERT INTO `sys_oper_log` VALUES (105, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `t_blog_article`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'文章id\',\\n  `user_id` int NOT NULL COMMENT \'用户id\',\\n  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'文章标题\',\\n  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT \'文章内容\',\\n  `heat` int NULL DEFAULT 0 COMMENT \'文章热度\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `visibility` tinyint NULL DEFAULT 1 COMMENT \'是否可见 默认可见 1 不可见 0\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'用户文章表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_article_category_rel`  (\\n  `id` int NOT NULL AUTO_INCREMENT,\\n  `article_id` int NOT NULL COMMENT \'文章id\',\\n  `category_id` int NOT NULL COMMENT \'分类id\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  PRIMARY KEY (`id`) USING BTREE,\\n  INDEX `index_article_id`(`article_id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'分类文章联系表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_category`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'id\',\\n  `parent_id` int NULL DEFAULT NULL COMMENT \'父分类id\',\\n  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'分类名\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `status` tinyint NULL DEFAULT NULL COMMENT \'分类等级 0 语言 1 一级分类 2 二级分类\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'文章分类表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_friend_link`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'友链id\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'好友名\',\\n  `url` varchar(255) CHARACTER SET ', '{\"msg\":\"创建表结构异常[参数存在SQL注入风险]\",\"code\":500}', 0, NULL, '2022-11-08 08:55:26');
INSERT INTO `sys_oper_log` VALUES (106, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `t_blog_article`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'文章id\',\\n  `user_id` int NOT NULL COMMENT \'用户id\',\\n  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'文章标题\',\\n  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT \'文章内容\',\\n  `heat` int NULL DEFAULT 0 COMMENT \'文章热度\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `visibility` tinyint NULL DEFAULT 1 COMMENT \'是否可见 默认可见 1 不可见 0\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'用户文章表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_article_category_rel`  (\\n  `id` int NOT NULL AUTO_INCREMENT,\\n  `article_id` int NOT NULL COMMENT \'文章id\',\\n  `category_id` int NOT NULL COMMENT \'分类id\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  PRIMARY KEY (`id`) USING BTREE,\\n  INDEX `index_article_id`(`article_id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'分类文章联系表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_category`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'id\',\\n  `parent_id` int NULL DEFAULT NULL COMMENT \'父分类id\',\\n  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'分类名\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `status` tinyint NULL DEFAULT NULL COMMENT \'分类等级 0 语言 1 一级分类 2 二级分类\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'文章分类表\' ROW_FORMAT = DYNAMIC;\\n\\nCREATE TABLE `t_blog_friend_link`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'友链id\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'好友名\',\\n  `url` varchar(255) CHARACTER SET ', '{\"msg\":\"创建表结构异常[参数存在SQL注入风险]\",\"code\":500}', 0, NULL, '2022-11-08 08:55:34');
INSERT INTO `sys_oper_log` VALUES (107, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `t_blog_article`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'文章id\',\\n  `user_id` int NOT NULL COMMENT \'用户id\',\\n  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT \'文章标题\',\\n  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT \'文章内容\',\\n  `heat` int NULL DEFAULT 0 COMMENT \'文章热度\',\\n  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `visibility` tinyint NULL DEFAULT 1 COMMENT \'是否可见 默认可见 1 不可见 0\',\\n  PRIMARY KEY (`id`) USING BTREE\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = \'用户文章表\' ROW_FORMAT = DYNAMIC;\\n\"]}', '{\"msg\":\"创建表结构异常[参数存在SQL注入风险]\",\"code\":500}', 0, NULL, '2022-11-08 08:55:41');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_blog_img_url\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 08:57:33');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"t_blog_img_url\"],\"tableComment\":[\"图片链接表\"],\"className\":[\"TBlogImgUrl\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"imgUrl\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"url\"],\"functionName\":[\"图片链接修改\"],\"params[parentMenuId]\":[\"2030\"],\"params[parentMenuName]\":[\"新博客管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 08:58:00');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_blog_img_url', '127.0.0.1', '内网IP', '\"t_blog_img_url\"', NULL, 0, NULL, '2022-11-08 08:58:14');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2022-11-08 09:06:31');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2024', '127.0.0.1', '内网IP', '2024', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2022-11-08 09:06:37');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2024\"],\"parentId\":[\"2030\"],\"menuType\":[\"C\"],\"menuName\":[\"图片链接修改\"],\"url\":[\"/system/url\"],\"target\":[\"menuItem\"],\"perms\":[\"new-blog-admin:url:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:06:54');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2022-11-08 09:08:23');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_blog_friend_link,t_blog_article_category_rel,t_blog_category,t_blog_article\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:35:28');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_blog_article\"],\"tableComment\":[\"用户文章表\"],\"className\":[\"TBlogArticle\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"3\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"文章id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"4\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"5\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文章标题\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"title\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"6\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"文章内容\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"content\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"summernote\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"7\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"文章热度\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"heat\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"8\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:36:18');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"t_blog_friend_link\"],\"tableComment\":[\"友链表\"],\"className\":[\"TBlogFriendLink\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"20\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"友链id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"21\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"好友名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"22\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"好友博客链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"好友邮箱\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"email\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"24\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"好友头像\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"avatar\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"25\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"好友签名\"],\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:36:32');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_blog_article_category_rel\"],\"tableComment\":[\"分类文章联系表\"],\"className\":[\"TBlogArticleCategoryRel\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"11\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"12\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"文章id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"articleId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"13\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"分类id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"categoryId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"14\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"rel\"],\"functionName\":[\"分类文章联系\"],\"params[parentMenuId]\":[\"2030\"],\"params[parentMenuName]\":[\"新博客管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:36:42');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_blog_category\"],\"tableComment\":[\"文章分类表\"],\"className\":[\"TBlogCategory\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"15\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"16\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"父分类id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"parentId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"17\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"分类名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"name\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"18\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"19\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"分类等级 0 语言 1 一级分类 2 二级分类\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"status\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"radio\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"category\"],\"functionName\":[\"文章分类\"],\"params[parentMenuId]\":[\"2030\"],\"params[parentMenuName]\":[\"新博客管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTa', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:36:51');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_blog_article\"],\"tableComment\":[\"用户文章表\"],\"className\":[\"TBlogArticle\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"3\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"文章id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"4\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"5\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文章标题\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"title\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"6\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"文章内容\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"content\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"summernote\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"7\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"文章热度\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"heat\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"8\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:36:59');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_blog_friend_link,t_blog_article,t_blog_category,t_blog_article_category_rel\"]}', NULL, 0, NULL, '2022-11-08 09:37:06');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2030\"],\"menuType\":[\"C\"],\"menuName\":[\"文章分类\"],\"url\":[\"/system/category\"],\"target\":[\"menuItem\"],\"perms\":[\"new-blog-admin:category:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:43:56');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2030\"],\"menuType\":[\"C\"],\"menuName\":[\"友链\"],\"url\":[\"/system/link\"],\"target\":[\"menuItem\"],\"perms\":[\"new-blog-admin:link:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:44:12');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2030\"],\"menuType\":[\"C\"],\"menuName\":[\"分类文章联系\"],\"url\":[\"/system/rel\"],\"target\":[\"menuItem\"],\"perms\":[\"new-blog-admin:rel:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 09:44:23');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2022-11-08 10:46:58');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"F\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:47:07');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2022-11-08 10:47:10');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_forum_posts,t_user_info,t_user_comment,t_user_black_list,t_forum_private_letter,t_user_access_manage,t_user_ext\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:53:12');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2030\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"博客管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:55:49');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"论坛管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:56:14');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:56:28');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"论坛管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-comment-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:56:52');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2030\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"博客管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-file-word-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:57:27');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:57:35');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"t_user_info\"],\"tableComment\":[\"用户信息表\"],\"className\":[\"TUserInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"70\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"71\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"72\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"加密后密码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"password\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"73\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户头像图片链接\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"avatar\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"74\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"用户性别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"sex\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"75\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"用户邮箱\"],\"columns[5].javaType\":[\"String\"],', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:58:24');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"10\"],\"tableName\":[\"t_user_comment\"],\"tableComment\":[\"评论表\"],\"className\":[\"TUserComment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"54\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"评论id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"55\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"56\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"对应来源id 根据status\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"articleId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"57\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"评论创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"58\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评论最后一次回复时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"lastTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"59\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"父评论id\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"parentId\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:58:33');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"11\"],\"tableName\":[\"t_user_ext\"],\"tableComment\":[\"用户信息扩展表\"],\"className\":[\"TUserExt\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"63\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"64\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户经验值\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"experience\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"65\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"帖子总数\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"postNum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"66\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"博客url\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"blogUrl\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"67\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"个人签名\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"sign\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"68\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否展示邮箱\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"showMail\"],\"columns[5].isInsert\":[', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:58:46');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"t_user_black_list\"],\"tableComment\":[\"用户黑名单表\"],\"className\":[\"TUserBlackList\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"49\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"50\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"51\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"拉黑对象\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"blackUserId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"52\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"time\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"53\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"原因\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"list\"],\"functionName\":[\"用户黑名单\"],\"params[parentMe', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:59:02');
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"t_user_access_manage\"],\"tableComment\":[\"用户访问权限表\"],\"className\":[\"TUserAccessManage\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"42\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"43\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"封禁ip\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"ip\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"44\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"封禁用户id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"45\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"可看内容\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"see\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"46\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"可回复\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"comment\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"47\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"可发帖\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"post\"],\"columns[5].isInsert\":[\"1\"],\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:59:24');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"11\"],\"tableName\":[\"t_user_ext\"],\"tableComment\":[\"用户信息扩展表\"],\"className\":[\"TUserExt\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"63\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"64\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户经验值\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"experience\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"65\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"帖子总数\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"postNum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"66\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"博客url\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"blogUrl\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"67\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"个人签名\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"sign\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"68\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否展示邮箱\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"showMail\"],\"columns[5].isInsert\":[', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:59:31');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"t_user_black_list\"],\"tableComment\":[\"用户黑名单表\"],\"className\":[\"TUserBlackList\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"49\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"50\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"51\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"拉黑对象\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"blackUserId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"52\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"time\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"53\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"原因\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"list\"],\"functionName\":[\"用户黑名单\"],\"params[parentMe', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:59:44');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"t_user_black_list\"],\"tableComment\":[\"用户黑名单表\"],\"className\":[\"TUserBlackList\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"49\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"50\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"51\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"拉黑对象\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"blackUserId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"52\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"time\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"53\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"原因\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"list\"],\"functionName\":[\"用户黑名单\"],\"params[parentMe', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 10:59:53');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"t_forum_private_letter\"],\"tableComment\":[\"私信表\"],\"className\":[\"TForumPrivateLetter\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"私信id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"私信发送人\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"sendId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"私信接收人\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"receiveId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"39\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"发送时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"sendTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"40\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"接收时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"receiveTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"41\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否可见 1 0\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 11:00:17');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"t_forum_posts\"],\"tableComment\":[\"论坛帖子表\"],\"className\":[\"TForumPosts\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"28\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"帖子id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"29\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建帖子的用户id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"30\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"点击量\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"heat\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"31\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"内容\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"content\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"summernote\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"32\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"帖子标题\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"title\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"33\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 11:00:31');
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_forum_posts,t_forum_private_letter,t_user_access_manage,t_user_black_list,t_user_ext,t_user_comment,t_user_info\"]}', NULL, 0, NULL, '2022-11-08 11:00:45');
INSERT INTO `sys_oper_log` VALUES (146, '文章分类', 1, 'com.ruoyi.web.controller.system.TBlogCategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/category/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"name\":[\"计算机网络\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 11:17:51');
INSERT INTO `sys_oper_log` VALUES (147, '用户文章', 1, 'com.ruoyi.web.controller.system.TBlogArticleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/article/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"title\":[\"Doker\"],\"content\":[\"<p>aaa</p>\"],\"heat\":[\"\"],\"visibility\":[\"\"],\"index\":[\"1\"],\"tBlogArticleCategoryRelList[0].categoryId\":[\"1\"],\"tBlogArticleCategoryRelList[0].createTime\":[\"\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-11-08 11:19:09');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-11-08 06:58:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-11-08 06:58:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-11-08 06:58:46', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '45.62.122.143', '2022-11-18 21:08:57', '2022-11-08 06:58:46', 'admin', '2022-11-08 06:58:46', '', '2022-11-18 13:08:57', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-11-08 06:58:46', '2022-11-08 06:58:46', 'admin', '2022-11-08 06:58:46', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_blog_article
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_article`;
CREATE TABLE `t_blog_article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `user_id` int NOT NULL COMMENT '用户id',
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `heat` int NULL DEFAULT 0 COMMENT '文章热度',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `visibility` tinyint NULL DEFAULT 1 COMMENT '是否可见 默认可见 1 不可见 0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_article
-- ----------------------------

-- ----------------------------
-- Table structure for t_blog_article_category_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_article_category_rel`;
CREATE TABLE `t_blog_article_category_rel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `category_id` int NOT NULL COMMENT '分类id',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类文章联系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_article_category_rel
-- ----------------------------

-- ----------------------------
-- Table structure for t_blog_category
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_category`;
CREATE TABLE `t_blog_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int NULL DEFAULT NULL COMMENT '父分类id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint NULL DEFAULT NULL COMMENT '分类等级 0 语言 1 一级分类 2 二级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_blog_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_friend_link`;
CREATE TABLE `t_blog_friend_link`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '友链id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '好友名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '好友博客链接',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '好友邮箱',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '好友头像',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '好友签名',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `visibility` tinyint NULL DEFAULT 1 COMMENT '是否可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '友链表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for t_blog_img_url
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_img_url`;
CREATE TABLE `t_blog_img_url`  (
  `id` int NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_img_url
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '私信表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_forum_private_letter
-- ----------------------------

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
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论创建时间',
  `last_time` datetime NULL DEFAULT NULL COMMENT '评论最后一次回复时间',
  `parent_id` int NULL DEFAULT NULL COMMENT '父评论id',
  `heat` int NULL DEFAULT NULL COMMENT '点赞热度',
  `visibility` tinyint NULL DEFAULT 1 COMMENT '是否可见 0 不可见 1可见',
  `status` tinyint NULL DEFAULT NULL COMMENT '文章评论 0 论坛评论 1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_comment
-- ----------------------------

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
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '账号创建时间',
  `last_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `last_ip` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `extend1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展预留字段1',
  `extend2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展预留字段1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
