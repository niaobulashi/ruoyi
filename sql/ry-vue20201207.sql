/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1(mysql)
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 127.0.0.1:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 07/12/2020 18:14:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
   sub_table_name    varchar(64)     default null               comment '关联子表的表名',
   sub_table_fk_name varchar(64)     default null               comment '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (18, 't_daily', '日报表', 'TDaily', 'crud', 'com.ruoyi.attendance', 'attendance', 'daily', '日报管理', 'niaobulashi', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00', NULL);
INSERT INTO `gen_table` VALUES (20, 'sys_calendar', '工作日历表', 'SysCalendar', 'crud', 'com.ruoyi.system', 'system', 'calendar', '工作日历', 'niaobulashi', '0', '/', '{\"parentMenuId\":\"1\"}', 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (173, '18', 'daily_id', '日报ID', 'bigint', 'Long', 'dailyId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (174, '18', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (175, '18', 'daily_time', '日报时间', 'datetime', 'Date', 'dailyTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (176, '18', 'daily', '日报内容', 'longtext', 'String', 'daily', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (177, '18', 'del_flag', '删除标识0-未删除1-已删除', 'varchar(255)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (178, '18', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (179, '18', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (180, '18', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (181, '18', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (182, '18', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2020-11-12 11:19:06', '', '2020-11-12 13:36:00');
INSERT INTO `gen_table_column` VALUES (202, '20', 'c_date', '自然日日期', 'varchar(8)', 'String', 'dateStr', '1', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 1, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (203, '20', 'c_type', '日期类型', 'varchar(1)', 'String', 'type', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'select', 'sys_calendar_type', 2, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (204, '20', 'c_typename', '日期描述', 'varchar(10)', 'String', 'typeName', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 3, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (205, '20', 'c_yearname', '年份', 'varchar(4)', 'String', 'yearName', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 4, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (206, '20', 'c_nonglicn', '农历', 'varchar(10)', 'String', 'nongLiCn', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 5, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (207, '20', 'c_nongli', '农历月份', 'varchar(10)', 'String', 'nongLi', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 6, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (208, '20', 'c_animals_year', '生肖年', 'varchar(2)', 'String', 'animalsYear', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 7, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (209, '20', 'c_throttle', '节气', 'varchar(10)', 'String', 'throttle', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 8, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (210, '20', 'c_weekcn', '周-中文', 'varchar(2)', 'String', 'weekCn', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 9, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (211, '20', 'c_week1', '周期英文缩写', 'varchar(6)', 'String', 'week1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (212, '20', 'c_week2', '周期数字', 'varchar(2)', 'String', 'week2', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (213, '20', 'c_week3', '周期英文', 'varchar(10)', 'String', 'week3', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 12, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (214, '20', 'c_daynum', '天数', 'varchar(4)', 'String', 'dayNum', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 13, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (215, '20', 'c_weeknum', '周数', 'varchar(4)', 'String', 'weekNum', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 14, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (216, '20', 'c_suit', '宜', 'varchar(200)', 'String', 'suit', '0', '0', NULL, NULL, NULL, '1', '1', 'LIKE', 'input', '', 15, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (217, '20', 'c_avoid', '忌', 'varchar(200)', 'String', 'avoid', '0', '0', NULL, NULL, NULL, '1', '1', 'LIKE', 'input', '', 16, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');
INSERT INTO `gen_table_column` VALUES (218, '20', 'c_desc', '假日描述', 'varchar(200)', 'String', 'desc', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 17, 'hulang', '2020-11-25 14:21:23', '', '2020-11-25 15:02:29');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000175965C2A8078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000175965C2A8078707400007070707400013174000E302F3135202A202A202A202A203F74001F72795461736B2E7279506172616D732827E689A7E8A18CE4B880E6ACA1272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000175965C2A8078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-1O4LT4911607335567376', 1607336080939, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int NULL DEFAULT NULL,
  `int_prop_2` int NULL DEFAULT NULL,
  `long_prop_1` bigint NULL DEFAULT NULL,
  `long_prop_2` bigint NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint NULL DEFAULT NULL,
  `prev_fire_time` bigint NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1607335570000, -1, 5, 'PAUSED', 'CRON', 1607335567000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1607335575000, -1, 5, 'PAUSED', 'CRON', 1607335567000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1607335580000, -1, 5, 'PAUSED', 'CRON', 1607335567000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_calendar
-- ----------------------------
DROP TABLE IF EXISTS `sys_calendar`;
CREATE TABLE `sys_calendar`  (
  `c_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自然日日期',
  `c_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为工作日 0-工作日 1-假日 2-节日',
  `c_typename` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期描述',
  `c_yearname` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年份',
  `c_nonglicn` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '农历',
  `c_nongli` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '农历月份',
  `c_animals_year` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生肖年',
  `c_throttle` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节气',
  `c_weekcn` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周-中文',
  `c_week1` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期英文缩写',
  `c_week2` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期数字',
  `c_week3` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期英文',
  `c_daynum` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天数',
  `c_weeknum` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周数',
  `c_suit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宜',
  `c_avoid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '忌',
  `c_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '假日描述',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`c_date`) USING BTREE,
  UNIQUE INDEX `sys_calendar_index_c_date`(`c_date`) USING BTREE COMMENT '工作日历表日期'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作日历表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_calendar
-- ----------------------------
INSERT INTO `sys_calendar` VALUES ('20170101', '2', '节日', '丙申', '腊月初四', '11-4', '猴', '冬至后', '日', 'Sun', '7', 'Sunday', '0', '52', '合帐.裁衣.教牛马.余事勿取', '入宅.动土.破土.嫁娶.作灶.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170102', '1', '假日', '丙申', '腊月初五', '11-5', '猴', '冬至后', '一', 'Mon', '1', 'Monday', '1', '01', '纳采.订盟.嫁娶.祭祀.祈福.安香.出火.出行.会亲友.经络.求医.治病.解除.拆卸.起基.修造.动土.定磉.扫舍.栽种.牧养.造畜椆栖', '斋醮.作梁.掘井.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170103', '0', '工作日', '丙申', '腊月初六', '11-6', '猴', '冬至后', '二', 'Tue', '2', 'Tuesday', '2', '01', '纳财.开市.交易.立券.会亲友.进人口.经络.祭祀.祈福.安香.出火.求医.治病.修造.动土.拆卸.扫舍.安床.栽种.牧养.开生坟.合寿木.入殓.安葬.启攒', '嫁娶.祈福.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170104', '0', '工作日', '丙申', '腊月初七', '11-7', '猴', '冬至后', '三', 'Wed', '3', 'Wednesday', '3', '01', '祭祀.入殓.移柩.余事勿取', '入宅.修造.动土.破土.安门.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170105', '0', '工作日', '丙申', '腊月初八', '11-8', '猴', '小寒', '四', 'Thu', '4', 'Thursday', '4', '01', '解除.平治道涂.余事勿取', '移徙.入宅.掘井.造庙.栽种.针灸.治病.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170106', '0', '工作日', '丙申', '腊月初九', '11-9', '猴', '小寒后', '五', 'Fri', '5', 'Friday', '5', '01', '嫁娶.祭祀.开光.伐木.出火.拆卸.入宅.移徙.修造.动土.上梁.安床.纳畜', '开市.行丧.栽种.出行.出货财.安葬.置产.词讼.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170107', '1', '假日', '丙申', '腊月初十', '11-10', '猴', '小寒后', '六', 'Sat', '6', 'Saturday', '6', '01', '嫁娶.纳采.订盟.入宅.移徙.安床.祭祀.祈福.开光.出行.解除.出火.拆卸.动土.纳畜.谢土.安葬.破土', '伐木.开市.交易.上梁.作灶.安门.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170108', '1', '假日', '丙申', '腊月十一', '11-11', '猴', '小寒后', '日', 'Sun', '7', 'Sunday', '7', '01', '祭祀.破屋.坏垣.解除.余事勿取', '开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170109', '0', '工作日', '丙申', '腊月十二', '11-12', '猴', '小寒后', '一', 'Mon', '1', 'Monday', '8', '02', '嫁娶.纳采.订盟.开光.安香.出火.纳财.开市.交易.立券.裁衣.造屋.起基.修造.动土.安门.移徙.入宅.栽种.牧养.畋猎.掘井.开池.安葬.破土.入殓.除服.成服.立碑', '祈福.造庙.祭祀.安床.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170110', '0', '工作日', '丙申', '腊月十三', '11-13', '猴', '小寒后', '二', 'Tue', '2', 'Tuesday', '9', '02', '祭祀.斋醮.入殓.破土.启攒.安葬.修坟.立碑.除服.成服', '嫁娶.入宅.作灶.纳采.订盟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170111', '0', '工作日', '丙申', '腊月十四', '11-14', '猴', '小寒后', '三', 'Wed', '3', 'Wednesday', '10', '02', '祭祀.斋醮.纳财.捕捉.畋猎', '嫁娶.开市.入宅.安床.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170112', '0', '工作日', '丙申', '腊月十五', '11-15', '猴', '小寒后', '四', 'Thu', '4', 'Thursday', '11', '02', '纳采.订盟.祭祀.祈福.求嗣.斋醮.沐浴.进人口.会亲友.入学.治病.安碓硙.掘井.开池.纳畜.牧养.造畜椆栖', '嫁娶.合帐.入宅.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170113', '0', '工作日', '丙申', '腊月十六', '11-16', '猴', '小寒后', '五', 'Fri', '5', 'Friday', '12', '02', '祭祀.祈福.求嗣.沐浴.问名.交易.纳财.入殓.移柩.安葬.修坟.立碑.谢土.造畜椆栖.教牛马', '入宅.置产.嫁娶.动土.栽种.开市.开光.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170114', '1', '假日', '丙申', '腊月十七', '11-17', '猴', '小寒后', '六', 'Sat', '6', 'Saturday', '13', '02', '祭祀.教牛马.造畜椆栖.祭祀.会亲友.解除.余事勿取', '嫁娶.入宅.出行.动土.破土.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170115', '1', '假日', '丙申', '腊月十八', '11-18', '猴', '小寒后', '日', 'Sun', '7', 'Sunday', '14', '02', '嫁娶.开光.解除.出火.拆卸.修造.进人口.入宅.移徙.安床.栽种.入殓.修坟.动土.除服.成服', '作灶.安葬.祭祀.开市.纳采.订盟.纳畜.谢土.出行.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170116', '0', '工作日', '丙申', '腊月十九', '11-19', '猴', '小寒后', '一', 'Mon', '1', 'Monday', '15', '03', '出行.起基.安床.纳财.交易.立券.嫁娶.栽种.入殓.移柩.安葬', '挂匾.入宅.上梁.祈福.词讼.作梁.作灶.开池.安门.动土.破土.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170117', '0', '工作日', '丙申', '腊月二十', '11-20', '猴', '小寒后', '二', 'Tue', '2', 'Tuesday', '16', '03', '平治道涂.余事勿取', '开光.嫁娶.开仓.出货财.造船.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170118', '0', '工作日', '丙申', '腊月廿一', '11-21', '猴', '小寒后', '三', 'Wed', '3', 'Wednesday', '17', '03', '嫁娶.订盟.纳采.会亲友.祭祀.安机械.移徙.入宅.造屋.安床.起基.定磉.安香.出火.挂匾.拆卸.置产', '开市.出行.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170119', '0', '工作日', '丙申', '腊月廿二', '11-22', '猴', '小寒后', '四', 'Thu', '4', 'Thursday', '18', '03', '沐浴.捕捉.畋猎.理发.整手足甲.入殓.除服.成服.破土.安葬.谢土.立碑.修坟.启攒', '纳采.订盟.嫁娶.上梁.开市.斋醮.造屋.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170120', '0', '工作日', '丙申', '腊月廿三', '11-23', '猴', '大寒', '五', 'Fri', '5', 'Friday', '19', '03', '祭祀.破屋.坏垣.余事勿取', '斋醮.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170121', '1', '假日', '丙申', '腊月廿四', '11-24', '猴', '大寒后', '六', 'Sat', '6', 'Saturday', '20', '03', '沐浴.开仓.出货财.开市.交易.立券.纳财.栽种.纳畜.牧养.畋猎.入殓.破土.安葬', '祈福.嫁娶.安床.入宅.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170122', '0', '工作日', '丙申', '腊月廿五', '11-25', '猴', '大寒后', '日', 'Sun', '7', 'Sunday', '21', '03', '祭祀.沐浴.补垣.塞穴.断蚁.解除.余事勿取', '造庙.入宅.修造.安葬.行丧.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170123', '0', '工作日', '丙申', '腊月廿六', '11-26', '猴', '大寒后', '一', 'Mon', '1', 'Monday', '22', '04', '嫁娶.纳采.订盟.问名.祭祀.冠笄.裁衣.会亲友.进人口.纳财.捕捉.作灶', '开市.安床.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170124', '0', '工作日', '丙申', '腊月廿七', '11-27', '猴', '大寒后', '二', 'Tue', '2', 'Tuesday', '23', '04', '订盟.纳采.会亲友.祭祀.斋醮.沐浴.塑绘.出火.开光.竖柱.上梁.开市.交易.立券.作梁.开柱眼.伐木.架马.安门.安床.拆卸.牧养.造畜椆栖.掘井', '造庙.嫁娶.出行.动土.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170125', '0', '工作日', '丙申', '腊月廿八', '11-28', '猴', '大寒后', '三', 'Wed', '3', 'Wednesday', '24', '04', '交易.立券.纳财.安床.裁衣.造畜椆栖.安葬.谢土.启攒.除服.成服.修坟.立碑.移柩.入殓', '开光.嫁娶.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170126', '0', '工作日', '丙申', '腊月廿九', '11-29', '猴', '大寒后', '四', 'Thu', '4', 'Thursday', '25', '04', '祭祀.解除.教牛马.会亲友.余事勿取', '破土.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170127', '1', '假日', '丙申', '腊月三十', '11-30', '猴', '大寒后', '五', 'Fri', '5', 'Friday', '26', '04', '纳采.订盟.移徙.纳财.开市.交易.立券.入宅.会亲友.解除.求医.治病.入学.安床.安门.安香.出火.拆卸.扫舍.入宅.挂匾.开生坟.合寿木.破土.修坟.启攒.入殓', '探病.祭祀.出行.上梁.造屋.谢土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170128', '2', '节日', '丁酉', '正月初一', '1-1', '鸡', '大寒后', '六', 'Sat', '6', 'Saturday', '27', '04', '嫁娶.订盟.纳采.祭祀.祈福.求嗣.会亲友.解除.出行.入学.纳财.开市.交易.立券.习艺.经络.安床.开仓.出货财.纳畜.安葬.启攒.修坟.入殓', '入宅.开光.开市.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170129', '2', '节日', '丁酉', '正月初二', '1-2', '鸡', '大寒后', '日', 'Sun', '7', 'Sunday', '28', '04', '祭祀.冠笄.嫁娶.会亲友.进人口.裁衣.结网.平治道涂', '移徙.入宅.造庙.作灶.治病.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170130', '2', '节日', '丁酉', '正月初三', '1-3', '鸡', '大寒后', '一', 'Mon', '1', 'Monday', '29', '05', '祭祀.安碓硙.结网.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170131', '1', '假日', '丁酉', '正月初四', '1-4', '鸡', '大寒后', '二', 'Tue', '2', 'Tuesday', '30', '05', '嫁娶.祭祀.沐浴.裁衣.出行.理发.移徙.捕捉.畋猎.放水.入宅.除服.成服.启攒.安葬.移柩.入殓', '造屋.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170201', '1', '假日', '丁酉', '正月初五', '1-5', '鸡', '大寒后', '三', 'Wed', '3', 'Wednesday', '31', '05', '破屋.坏垣.余事勿取', '嫁娶.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170202', '1', '假日', '丁酉', '正月初六', '1-6', '鸡', '大寒后', '四', 'Thu', '4', 'Thursday', '32', '05', '纳采.订盟.祭祀.求嗣.出火.塑绘.裁衣.会亲友.入学.拆卸.扫舍.造仓.挂匾.掘井.开池.结网.栽种.纳畜.破土.修坟.立碑.安葬.入殓', '祈福.嫁娶.造庙.安床.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170203', '0', '工作日', '丁酉', '正月初七', '1-7', '鸡', '立春', '五', 'Fri', '5', 'Friday', '33', '05', '祭祀.斋醮.沐浴.开生坟.除服.成服.移柩.入殓.破土.安葬.合寿木', '开市.嫁娶.安床.会亲友.入宅.作灶.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170204', '0', '工作日', '丁酉', '正月初八', '1-8', '鸡', '立春后', '六', 'Sat', '6', 'Saturday', '34', '05', '祭祀.塞穴.结网.破土.谢土.安葬.移柩.除服.成服.余事勿取', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170205', '1', '假日', '丁酉', '正月初九', '1-9', '鸡', '立春后', '日', 'Sun', '7', 'Sunday', '35', '05', '祭祀.沐浴.理发.作灶.结网.栽种', '嫁娶.词讼.行丧.安葬.牧养.伐木.作梁.开市.纳畜.造畜椆栖', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170206', '0', '工作日', '丁酉', '正月初十', '1-10', '鸡', '立春后', '一', 'Mon', '1', 'Monday', '36', '06', '嫁娶.祭祀.开光.祈福.求嗣.出行.开市.交易.立券.动土.纳财.掘井.会亲友', '入宅.安葬.伐木.作梁.纳畜.造畜椆栖.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170207', '0', '工作日', '丁酉', '正月十一', '1-11', '鸡', '立春后', '二', 'Tue', '2', 'Tuesday', '37', '06', '祭祀.祈福.求嗣.纳畜.入殓.启攒.谢土.除服.成服', '栽种.开光.出行.针灸.嫁娶.入宅.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170208', '0', '工作日', '丁酉', '正月十二', '1-12', '鸡', '立春后', '三', 'Wed', '3', 'Wednesday', '38', '06', '开光.解除.伐木.竖柱.上梁.交易.立券.纳畜.入殓.移柩.安葬', '入宅.出行.移徙.祭祀.嫁娶.动土.破土.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170209', '0', '工作日', '丁酉', '正月十三', '1-13', '鸡', '立春后', '四', 'Thu', '4', 'Thursday', '39', '06', '祭祀.祈福.求嗣.开光.嫁娶.出行.解除.伐木.拆卸.进人口.安床.动土.起基.上梁.栽种.纳畜.破土.谢土.启攒.安葬', '移徙.入宅.出火.作灶.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170210', '0', '工作日', '丁酉', '正月十四', '1-14', '鸡', '立春后', '五', 'Fri', '5', 'Friday', '40', '06', '会亲友.冠笄.安床.会亲友.安机械.祭祀.祈福.求嗣.经络', '嫁娶.开市.动土.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170211', '1', '假日', '丁酉', '正月十五', '1-15', '鸡', '立春后', '六', 'Sat', '6', 'Saturday', '41', '06', '作灶.解除.平治道涂.余事勿取', '祭祀.祈福.安葬.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170212', '1', '假日', '丁酉', '正月十六', '1-16', '鸡', '立春后', '日', 'Sun', '7', 'Sunday', '42', '06', '嫁娶.祭祀.冠笄.修饰垣墙.置产', '经络.探病.造屋.作灶.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170213', '0', '工作日', '丁酉', '正月十七', '1-17', '鸡', '立春后', '一', 'Mon', '1', 'Monday', '43', '07', '纳采.嫁娶.祭祀.祈福.出行.修造.动土.移徙.入宅.安葬.破土', '开市.入宅.斋醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170214', '0', '工作日', '丁酉', '正月十八', '1-18', '鸡', '立春后', '二', 'Tue', '2', 'Tuesday', '44', '07', '祭祀.沐浴.解除.理发.扫舍.破屋.坏垣.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170215', '0', '工作日', '丁酉', '正月十九', '1-19', '鸡', '立春后', '三', 'Wed', '3', 'Wednesday', '45', '07', '纳采.订盟.祭祀.祈福.安香.出火.修造.出行.开市.移徙.入宅.动土.安葬.破土', '安床.作灶.造船.会亲友', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170216', '0', '工作日', '丁酉', '正月二十', '1-20', '鸡', '立春后', '四', 'Thu', '4', 'Thursday', '46', '07', '塞穴.结网.取渔.畋猎', '嫁娶.安门.移徙.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170217', '0', '工作日', '丁酉', '正月廿一', '1-21', '鸡', '立春后', '五', 'Fri', '5', 'Friday', '47', '07', '纳采.祭祀.祈福.出行.会亲友.修造.动土.移徙.入宅', '嫁娶.开市.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170218', '1', '假日', '丁酉', '正月廿二', '1-22', '鸡', '雨水', '六', 'Sat', '6', 'Saturday', '48', '07', '纳采.嫁娶.祭祀.祈福.出行.开市.会亲友.动土.破土.启攒', '移徙.入宅.出火.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170219', '1', '假日', '丁酉', '正月廿三', '1-23', '鸡', '雨水后', '日', 'Sun', '7', 'Sunday', '49', '07', '祭祀.祈福.求嗣.斋醮.入殓.除服.成服.移柩.安葬.启攒', '嫁娶.动土.开光.造屋.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170220', '0', '工作日', '丁酉', '正月廿四', '1-24', '鸡', '雨水后', '一', 'Mon', '1', 'Monday', '50', '08', '纳采.会亲友.竖柱.上梁.立券.入殓.移柩.安葬.启攒', '祭祀.移徙.入宅.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170221', '0', '工作日', '丁酉', '正月廿五', '1-25', '鸡', '雨水后', '二', 'Tue', '2', 'Tuesday', '51', '08', '祭祀.祈福.斋醮.出行.开市.立券.动土.移徙.入宅.破土.安葬', '开光.嫁娶.作灶.掘井.纳畜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170222', '0', '工作日', '丁酉', '正月廿六', '1-26', '鸡', '雨水后', '三', 'Wed', '3', 'Wednesday', '52', '08', '会亲友.求嗣.理发.冠笄.结网.捕捉.开光.理发', '开市.动土.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170223', '0', '工作日', '丁酉', '正月廿七', '1-27', '鸡', '雨水后', '四', 'Thu', '4', 'Thursday', '53', '08', '祭祀.平治道涂.余事勿取', '嫁娶.祈福.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170224', '0', '工作日', '丁酉', '正月廿八', '1-28', '鸡', '雨水后', '五', 'Fri', '5', 'Friday', '54', '08', '祈福.求嗣.斋醮.纳采.嫁娶.伐木.修造.动土.移徙.入宅.造庙.安机械.开市.入殓.除服.成服.移柩.安葬.破土.谢土', '置产.造屋.合脊.开光.探病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170225', '1', '假日', '丁酉', '正月廿九', '1-29', '鸡', '雨水后', '六', 'Sat', '6', 'Saturday', '55', '08', '入学.习艺.出行.纳采.订盟.嫁娶.会亲友.进人口.牧养.捕捉.入殓.移柩.安葬.启攒', '开光.开市.入宅.动土.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170226', '1', '假日', '丁酉', '二月初一', '2-1', '鸡', '雨水后', '日', 'Sun', '7', 'Sunday', '56', '08', '祭祀.沐浴.求医.治病.扫舍.破屋.坏垣.解除.余事勿取', '入宅.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170227', '0', '工作日', '丁酉', '二月初二', '2-2', '鸡', '雨水后', '一', 'Mon', '1', 'Monday', '57', '09', '祭祀.冠笄.嫁娶.拆卸.修造.动土.起基.上梁.造屋.入宅.开市.开池.塞穴.入殓.除服.成服.移柩.安葬.破土', '安床.栽种.治病.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170228', '0', '工作日', '丁酉', '二月初三', '2-3', '鸡', '雨水后', '二', 'Tue', '2', 'Tuesday', '58', '09', '祭祀.结网.入殓.除服.成服.移柩.安葬.破土', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170301', '0', '工作日', '丁酉', '二月初四', '2-4', '鸡', '雨水后', '三', 'Wed', '3', 'Wednesday', '59', '09', '塑绘.开光.祈福.求嗣.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.起基.安门.安床.移徙.造仓.结网.纳畜', '伐木.作灶.安葬.取渔.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170302', '0', '工作日', '丁酉', '二月初五', '2-5', '鸡', '雨水后', '四', 'Thu', '4', 'Thursday', '60', '09', '祭祀.沐浴.开光.塑绘.祈福.求嗣.订盟.纳采.冠笄.裁衣.嫁娶.动土.除服.成服.移柩.破土.启攒.出行.安碓硙.放水.开市.立券.交易', '安葬.上梁.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170303', '0', '工作日', '丁酉', '二月初六', '2-6', '鸡', '雨水后', '五', 'Fri', '5', 'Friday', '61', '09', '祭祀.祈福.求嗣.酬神.裁衣.安床.立券.交易.入殓.除服.成服.移柩.谢土.启攒', '出行.嫁娶.入宅.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170304', '1', '假日', '丁酉', '二月初七', '2-7', '鸡', '雨水后', '六', 'Sat', '6', 'Saturday', '62', '09', '裁衣.合帐.入殓.除服.成服.会亲友.纳财', '祭祀.祈福.移徙.嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170305', '1', '假日', '丁酉', '二月初八', '2-8', '鸡', '惊蛰', '日', 'Sun', '7', 'Sunday', '63', '09', '祭祀.祈福.求嗣.斋醮.嫁娶.冠笄.出行.开市.交易.会亲友.教牛马.除服.成服.启攒.安葬.移柩', '祈福.动土.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170306', '0', '工作日', '丁酉', '二月初九', '2-9', '鸡', '惊蛰后', '一', 'Mon', '1', 'Monday', '64', '10', '塞穴.整手足甲.解除.捕捉.畋猎.结网.余事勿取.诸事不宜', '嫁娶.作灶.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170307', '0', '工作日', '丁酉', '二月初十', '2-10', '鸡', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '65', '10', '纳财.开市.立券.交易.开光.安床.上梁.造屋.修造.起基', '动土.破土.安葬.行丧.赴任.出行.嫁娶.入宅.移徙.谢土.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170308', '0', '工作日', '丁酉', '二月十一', '2-11', '鸡', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '66', '10', '祭祀.祈福.嫁娶.冠笄.修饰垣墙.置产.平治道涂', '开仓.出货财.造屋.作灶.开市.交易.立券.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170309', '0', '工作日', '丁酉', '二月十二', '2-12', '鸡', '惊蛰后', '四', 'Thu', '4', 'Thursday', '67', '10', '嫁娶.祭祀.开光.祈福.求嗣.出行.出火.进人口.入宅.移徙.安床.拆卸.修造.安门.挂匾.纳财.扫舍', '动土.伐木.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170310', '0', '工作日', '丁酉', '二月十三', '2-13', '鸡', '惊蛰后', '五', 'Fri', '5', 'Friday', '68', '10', '嫁娶.开光.祭祀.祈福.求嗣.出行.出火.入宅.移徙.解除.栽种.伐木.破土.谢土.安葬', '开市.交易.作灶.纳财.上梁.安床.造屋.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170311', '1', '假日', '丁酉', '二月十四', '2-14', '鸡', '惊蛰后', '六', 'Sat', '6', 'Saturday', '69', '10', '破屋.坏垣.求医.治病.余事勿取', '开光.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170312', '1', '假日', '丁酉', '二月十五', '2-15', '鸡', '惊蛰后', '日', 'Sun', '7', 'Sunday', '70', '10', '纳采.交易.立券.安床.安机械.安葬.移柩.动土.破土.立碑', '嫁娶.开光.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170313', '0', '工作日', '丁酉', '二月十六', '2-16', '鸡', '惊蛰后', '一', 'Mon', '1', 'Monday', '71', '11', '祭祀.祈福.求嗣.斋醮.沐浴.开光.理发.经络.解除.治病.治病.立碑.栽种.牧养.掘井.开池', '嫁娶.定磉.合寿木.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170314', '0', '工作日', '丁酉', '二月十七', '2-17', '鸡', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '72', '11', '纳财.交易.立券.栽种.捕捉.结网.取渔.进人口.教牛马.理发', '入宅.造屋.竖柱.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170315', '0', '工作日', '丁酉', '二月十八', '2-18', '鸡', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '73', '11', '嫁娶.订盟.纳采.祭祀.祈福.出行.修造.动土.移徙.入宅.破土.出火.安门.安床.上梁.立碑.移柩', '开市.交易.合帐.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170316', '0', '工作日', '丁酉', '二月十九', '2-19', '鸡', '惊蛰后', '四', 'Thu', '4', 'Thursday', '74', '11', '冠笄.立券.交易.修造.动土.安机械.入殓.安葬.破土', '嫁娶.祈福.出火.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170317', '0', '工作日', '丁酉', '二月二十', '2-20', '鸡', '惊蛰后', '五', 'Fri', '5', 'Friday', '75', '11', '祭祀.会亲友.出行.立券.交易.冠笄.纳财', '嫁娶.动土.掘井.起基.定磉.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170318', '1', '假日', '丁酉', '二月廿一', '2-21', '鸡', '惊蛰后', '六', 'Sat', '6', 'Saturday', '76', '11', '祭祀.沐浴.解除.扫舍.塞穴.牧养', '嫁娶.安葬.行丧.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170319', '1', '假日', '丁酉', '二月廿二', '2-22', '鸡', '惊蛰后', '日', 'Sun', '7', 'Sunday', '77', '11', '纳财.开市.交易.立券.开光.针灸.会亲友.理发.安床.造仓.结网', '移徙.入宅.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170320', '0', '工作日', '丁酉', '二月廿三', '2-23', '鸡', '春分', '一', 'Mon', '1', 'Monday', '78', '12', '嫁娶.冠笄.会亲友.安机械.纳财.交易.立券.置产', '开市.造屋.治病.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170321', '0', '工作日', '丁酉', '二月廿四', '2-24', '鸡', '春分后', '二', 'Tue', '2', 'Tuesday', '79', '12', '嫁娶.造车器.纳采.订盟.祭祀.祈福.安机械.移徙.入宅.开市.立券.破土.安葬', '纳畜.理发.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170322', '0', '工作日', '丁酉', '二月廿五', '2-25', '鸡', '春分后', '三', 'Wed', '3', 'Wednesday', '80', '12', '祈福.斋醮.出行.移徙.入宅.修造.动土.破土.安葬', '纳采.开光.安床.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170323', '0', '工作日', '丁酉', '二月廿六', '2-26', '鸡', '春分后', '四', 'Thu', '4', 'Thursday', '81', '12', '破屋.坏垣.余事勿取', '嫁娶.移徙.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170324', '0', '工作日', '丁酉', '二月廿七', '2-27', '鸡', '春分后', '五', 'Fri', '5', 'Friday', '82', '12', '嫁娶.冠笄.祭祀.出行.会亲友.修造.动土.入殓.破土', '塑绘.开光.造桥.除服.成服', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170325', '1', '假日', '丁酉', '二月廿八', '2-28', '鸡', '春分后', '六', 'Sat', '6', 'Saturday', '83', '12', '开光.求嗣.出行.纳采.冠笄.出火.拆卸.起基.修造.动土.上梁.移徙.造船.开市.交易.立券.纳财', '祈福.嫁娶.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170326', '1', '假日', '丁酉', '二月廿九', '2-29', '鸡', '春分后', '日', 'Sun', '7', 'Sunday', '84', '12', '理发.冠笄.嫁娶.进人口.栽种.捕捉.针灸', '纳财.开市.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170327', '0', '工作日', '丁酉', '二月三十', '2-30', '鸡', '春分后', '一', 'Mon', '1', 'Monday', '85', '13', '开光.祈福.求嗣.出行.解除.伐木.造屋.起基.修造.架马.安门.移徙.入宅.造庙.除服.成服.移柩.谢土.纳畜.牧养', '纳采.动土.开市.交易.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170328', '0', '工作日', '丁酉', '三月初一', '3-1', '鸡', '春分后', '二', 'Tue', '2', 'Tuesday', '86', '13', '裁衣.经络.伐木.开柱眼.拆卸.修造.动土.上梁.合脊.合寿木.入殓.除服.成服.移柩.破土.安葬.启攒.修坟.立碑', '祭祀.嫁娶.出行.上梁.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170329', '0', '工作日', '丁酉', '三月初二', '3-2', '鸡', '春分后', '三', 'Wed', '3', 'Wednesday', '87', '13', '祭祀.会亲友.立券.交易.裁衣.合帐.嫁娶.冠笄.进人口', '栽种.动土.安葬.掘井.修坟.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170330', '0', '工作日', '丁酉', '三月初三', '3-3', '鸡', '春分后', '四', 'Thu', '4', 'Thursday', '88', '13', '扫舍.塞穴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170331', '0', '工作日', '丁酉', '三月初四', '3-4', '鸡', '春分后', '五', 'Fri', '5', 'Friday', '89', '13', '塑绘.开光.订盟.纳采.裁衣.合帐.冠笄.安机械.会亲友.纳财.开市.立券.交易.安床.竖柱.上梁.结网.栽种.解除.经络', '作灶.出行.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170401', '0', '工作日', '丁酉', '三月初五', '3-5', '鸡', '春分后', '六', 'Sat', '6', 'Saturday', '90', '13', '祭祀.嫁娶.纳婿.除服.成服.入殓.移柩', '动土.作灶.入宅.开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170402', '1', '假日', '丁酉', '三月初六', '3-6', '鸡', '春分后', '日', 'Sun', '7', 'Sunday', '91', '13', '祈福.求嗣.开光.塑绘.斋醮.订盟.纳采.嫁娶.拆卸.安床.入宅.安香.移柩.修坟.安葬.谢土.栽种.解除.冠笄.裁衣.移徙.修造.动土.竖柱.放水.启攒.立碑', '赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170403', '1', '假日', '丁酉', '三月初七', '3-7', '鸡', '春分后', '一', 'Mon', '1', 'Monday', '92', '14', '祭祀.解除.入殓.除服.成服.移柩.启攒.安葬.修坟.立碑.谢土.沐浴.扫舍.捕捉.取渔.结网.畋猎.理发', '安床.嫁娶.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170404', '2', '节日', '丁酉', '三月初八', '3-8', '鸡', '清明', '二', 'Tue', '2', 'Tuesday', '93', '14', '祭祀.解除.入殓.移柩.启攒.安葬.整手足甲.捕捉.畋猎.取渔.除服.成服.扫舍.谢土.斋醮', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170405', '0', '工作日', '丁酉', '三月初九', '3-9', '鸡', '清明后', '三', 'Wed', '3', 'Wednesday', '94', '14', '祭祀.沐浴.解除.破屋.坏垣.求医.治病.余事勿取', '嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170406', '0', '工作日', '丁酉', '三月初十', '3-10', '鸡', '清明后', '四', 'Thu', '4', 'Thursday', '95', '14', '沐浴.塞穴.畋猎.结网.取渔.扫舍.余事勿取', '祈福.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170407', '0', '工作日', '丁酉', '三月十一', '3-11', '鸡', '清明后', '五', 'Fri', '5', 'Friday', '96', '14', '开市.交易.立券.挂匾.祭祀.开光.祈福.求嗣.安床.解除.修造.安葬', '纳采.问名.订盟.嫁娶.入宅.开仓.出火.动土.破土.纳畜.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170408', '1', '假日', '丁酉', '三月十二', '3-12', '鸡', '清明后', '六', 'Sat', '6', 'Saturday', '97', '14', '祭祀.修门.取渔.纳财.纳畜.余事勿取', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170409', '1', '假日', '丁酉', '三月十三', '3-13', '鸡', '清明后', '日', 'Sun', '7', 'Sunday', '98', '14', '安香.出火.纳采.订盟.嫁娶.开市.立券.交易.挂匾.开光.出行.解除.安床.栽种.置产.拆卸.修造.动土', '作灶.安葬.祭祀.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170410', '0', '工作日', '丁酉', '三月十四', '3-14', '鸡', '清明后', '一', 'Mon', '1', 'Monday', '99', '15', '祭祀.出行.修造.动土.合帐.造畜椆栖.安床.移徙.入殓.移柩.破土.启攒.安葬.开生坟.合寿木.补垣.塞穴', '移徙.入宅.作灶.理发.开光.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170411', '0', '工作日', '丁酉', '三月十五', '3-15', '鸡', '清明后', '二', 'Tue', '2', 'Tuesday', '100', '15', '祭祀.修饰垣墙.余事勿取', '开光.修造.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170412', '0', '工作日', '丁酉', '三月十六', '3-16', '鸡', '清明后', '三', 'Wed', '3', 'Wednesday', '101', '15', '嫁娶.祭祀.祈福.求嗣.斋醮.开光.出火.移徙.入宅.竖柱.上梁.会亲友.造屋.起基.治病.治病.安门.造车器.掘井.开池', '纳采.出行.修坟.安葬.开市.立券.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170413', '0', '工作日', '丁酉', '三月十七', '3-17', '鸡', '清明后', '四', 'Thu', '4', 'Thursday', '102', '15', '祭祀.塑绘.开光.纳采.嫁娶.开市.出行.会亲友.安床.结网.除服.成服.启攒.安葬.移柩', '祈福.入宅.造屋.动土.破土.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170414', '0', '工作日', '丁酉', '三月十八', '3-18', '鸡', '清明后', '五', 'Fri', '5', 'Friday', '103', '15', '祭祀.作灶.平治道涂.余事勿取', '安床.入宅.安碓硙.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170415', '1', '假日', '丁酉', '三月十九', '3-19', '鸡', '清明后', '六', 'Sat', '6', 'Saturday', '104', '15', '祭祀.祈福.求嗣.斋醮.沐浴.纳畜.入殓.破土.安葬', '移徙.入宅.嫁娶.出行.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170416', '1', '假日', '丁酉', '三月二十', '3-20', '鸡', '清明后', '日', 'Sun', '7', 'Sunday', '105', '15', '纳采.祭祀.祈福.求嗣.斋醮.出行.起基.造屋.定磉.安门.入殓.安葬', '嫁娶.开市.纳财.出火', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170417', '0', '工作日', '丁酉', '三月廿一', '3-21', '鸡', '清明后', '一', 'Mon', '1', 'Monday', '106', '16', '祭祀.沐浴.解除.求医.治病.破屋.坏垣.余事勿取', '祈福.斋醮.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170418', '0', '工作日', '丁酉', '三月廿二', '3-22', '鸡', '清明后', '二', 'Tue', '2', 'Tuesday', '107', '16', '沐浴.捕捉.畋猎.结网.取渔', '祭祀.嫁娶.入宅.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170419', '0', '工作日', '丁酉', '三月廿三', '3-23', '鸡', '清明后', '三', 'Wed', '3', 'Wednesday', '108', '16', '祭祀.祈福.求嗣.斋醮.纳采.订盟.开光.竖柱.上梁.开仓.出货财.造屋.起基.定磉.安门.诸事不宜.破土.入殓.启攒.谢土', '出火.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170420', '0', '工作日', '丁酉', '三月廿四', '3-24', '鸡', '谷雨', '四', 'Thu', '4', 'Thursday', '109', '16', '祭祀.捕捉.解除.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170421', '0', '工作日', '丁酉', '三月廿五', '3-25', '鸡', '谷雨后', '五', 'Fri', '5', 'Friday', '110', '16', '纳采.嫁娶.出行.开市.立券.纳畜.牧养.出火.移徙.入宅', '祈福.动土.破土.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170422', '1', '假日', '丁酉', '三月廿六', '3-26', '鸡', '谷雨后', '六', 'Sat', '6', 'Saturday', '111', '16', '祭祀.祈福.求嗣.斋醮.冠笄.作灶.纳财.交易', '开光.嫁娶.掘井.安葬.安门.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170423', '1', '假日', '丁酉', '三月廿七', '3-27', '鸡', '谷雨后', '日', 'Sun', '7', 'Sunday', '112', '16', '祭祀.解除.教牛马.出行.余事勿取', '动土.破土.行丧.开光.作梁.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170424', '0', '工作日', '丁酉', '三月廿八', '3-28', '鸡', '谷雨后', '一', 'Mon', '1', 'Monday', '113', '17', '沐浴.斋醮.解除.求医.治病.会亲友.造畜椆栖.栽种.理发.扫舍', '开市.嫁娶.移徙.入宅.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170425', '0', '工作日', '丁酉', '三月廿九', '3-29', '鸡', '谷雨后', '二', 'Tue', '2', 'Tuesday', '114', '17', '求嗣.出行.解除.订盟.纳采.嫁娶.会亲友.进人口.安床.开市.交易.纳畜.牧养.入殓.除服.成服.移柩.安葬.启攒', '祈福.开市.修造.动土.破土.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170426', '0', '工作日', '丁酉', '四月初一', '4-1', '鸡', '谷雨后', '三', 'Wed', '3', 'Wednesday', '115', '17', '祭祀.作灶.平治道涂.余事勿取', '嫁娶.安葬.动土.安床.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170427', '0', '工作日', '丁酉', '四月初二', '4-2', '鸡', '谷雨后', '四', 'Thu', '4', 'Thursday', '116', '17', '造车器.祭祀.祈福.求嗣.斋醮.开市.交易.安机械.雕刻.开光.造屋.合脊.起基.定磉.安门.纳畜.安葬.开生坟.立碑.谢土.斋醮', '入宅.动土.开仓.出货财', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170428', '0', '工作日', '丁酉', '四月初三', '4-3', '鸡', '谷雨后', '五', 'Fri', '5', 'Friday', '117', '17', '祭祀.祈福.开光.求嗣.斋醮.纳采.订盟.求医.治病.起基.定磉.造船.取渔.解除.安葬.启攒.谢土.入殓', '开市.动土.掘井.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170429', '1', '假日', '丁酉', '四月初四', '4-4', '鸡', '谷雨后', '六', 'Sat', '6', 'Saturday', '118', '17', '祭祀.沐浴.破屋.坏垣.求医.治病.解除.余事勿取', '嫁娶.开市.交易.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170430', '1', '假日', '丁酉', '四月初五', '4-5', '鸡', '谷雨后', '日', 'Sun', '7', 'Sunday', '119', '17', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170501', '2', '节日', '丁酉', '四月初六', '4-6', '鸡', '谷雨后', '一', 'Mon', '1', 'Monday', '120', '18', '祭祀.塑绘.开光.订盟.纳采.冠笄.裁衣.安机械.拆卸.修造.动土.安床.经络.开市', '出火.入宅.安葬.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170502', '0', '工作日', '丁酉', '四月初七', '4-7', '鸡', '谷雨后', '二', 'Tue', '2', 'Tuesday', '121', '18', '祭祀.余事勿取', '造庙.嫁娶.安床.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170503', '0', '工作日', '丁酉', '四月初八', '4-8', '鸡', '谷雨后', '三', 'Wed', '3', 'Wednesday', '122', '18', '订盟.纳采.嫁娶.进人口.会亲友.交易.立券.动土.除服.谢土.移柩.破土.启攒.赴任.出行.开市.纳财.栽种', '入殓.安葬.入宅.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170504', '0', '工作日', '丁酉', '四月初九', '4-9', '鸡', '谷雨后', '四', 'Thu', '4', 'Thursday', '123', '18', '祭祀.祈福.裁衣.合帐.安床.入殓.除服.成服.移柩.破土.启攒.安葬.谢土.立碑.造畜椆栖', '掘井.安门.嫁娶.纳采', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170505', '0', '工作日', '丁酉', '四月初十', '4-10', '鸡', '立夏', '五', 'Fri', '5', 'Friday', '124', '18', '嫁娶.交易.立券.作厕.补垣.塞穴.畋猎.取渔.开生坟', '安床.开渠.上梁.修造.开市.开光.入宅.移徙.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170506', '1', '假日', '丁酉', '四月十一', '4-11', '鸡', '立夏后', '六', 'Sat', '6', 'Saturday', '125', '18', '塞穴.断蚁.结网.畋猎.余事勿取', '嫁娶.安葬.入宅.出行.动土.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170507', '1', '假日', '丁酉', '四月十二', '4-12', '鸡', '立夏后', '日', 'Sun', '7', 'Sunday', '126', '18', '纳采.订盟.嫁娶.祭祀.祈福.求嗣.开光.解除.出行.出火.入宅.移徙.栽种.纳畜.牧养.动土.破土.入殓.安葬', '作灶.安床.开仓.造屋.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170508', '0', '工作日', '丁酉', '四月十三', '4-13', '鸡', '立夏后', '一', 'Mon', '1', 'Monday', '127', '19', '开光.纳采.裁衣.冠笄.安床.作灶.进人口.造仓.塞穴', '嫁娶.栽种.修造.动土.出行.伐木.作梁.安葬.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170509', '0', '工作日', '丁酉', '四月十四', '4-14', '鸡', '立夏后', '二', 'Tue', '2', 'Tuesday', '128', '19', '纳采.嫁娶.裁衣.理发.出行.修造.动土.进人口.开市.交易.立券.挂匾.移徙.上梁.栽种.纳畜', '伐木.安葬.安床.祭祀.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170510', '0', '工作日', '丁酉', '四月十五', '4-15', '鸡', '立夏后', '三', 'Wed', '3', 'Wednesday', '129', '19', '开市.交易.立券.挂匾.祭祀.祈福.斋醮.出行.开市.交易.立券.造屋.起基.修造.动土.定磉.安床.安机械.安葬.破土.启攒.除服.成服.立碑', '作灶.嫁娶.移徙.入宅.理发', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170511', '0', '工作日', '丁酉', '四月十六', '4-16', '鸡', '立夏后', '四', 'Thu', '4', 'Thursday', '130', '19', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.开光.出火.出行.拆卸.动土.修造.进人口.入宅.移徙.安床.解除.挂匾.栽种.破土.谢土.入殓.移柩.安葬', '开市.立券.造船.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170512', '0', '工作日', '丁酉', '四月十七', '4-17', '鸡', '立夏后', '五', 'Fri', '5', 'Friday', '131', '19', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '开光.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170513', '1', '假日', '丁酉', '四月十八', '4-18', '鸡', '立夏后', '六', 'Sat', '6', 'Saturday', '132', '19', '订盟.纳采.嫁娶.解除.祭祀.祈福.求嗣.开光.出行.解除.出火.拆卸.入宅.移徙.安床.栽种.纳畜.动土.破土.谢土.安葬.修坟', '作灶.开市.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170514', '1', '假日', '丁酉', '四月十九', '4-19', '鸡', '立夏后', '日', 'Sun', '7', 'Sunday', '133', '19', '祭祀.祈福.求嗣.开光.订盟.纳采.解除.动土.起基.进人口.开市.交易.立券.纳财.造仓.开池.栽种.纳畜.破土.安葬', '安床.上梁.裁衣.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170515', '0', '工作日', '丁酉', '四月二十', '4-20', '鸡', '立夏后', '一', 'Mon', '1', 'Monday', '134', '20', '祭祀.结网.捕捉.余事勿取', '探病.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170516', '0', '工作日', '丁酉', '四月廿一', '4-21', '鸡', '立夏后', '二', 'Tue', '2', 'Tuesday', '135', '20', '祭祀.祈福.求嗣.开光.纳采.订盟.嫁娶.出行.动土.破土.会亲友.开市.交易.立券.习艺.拆卸.起基.安碓硙.放水.开池.造仓.开渠.栽种.谢土.启攒.修坟.立碑', '入宅.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170517', '0', '工作日', '丁酉', '四月廿二', '4-22', '鸡', '立夏后', '三', 'Wed', '3', 'Wednesday', '136', '20', '嫁娶.冠笄.祭祀.出行.移徙.入宅.作灶.造车器.补垣.塞穴.作厕.破土.启攒.除服.成服.入殓', '入宅.造屋.造桥.安门.安葬.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170518', '0', '工作日', '丁酉', '四月廿三', '4-23', '鸡', '立夏后', '四', 'Thu', '4', 'Thursday', '137', '20', '祭祀.解除.断蚁.会亲友.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170519', '0', '工作日', '丁酉', '四月廿四', '4-24', '鸡', '立夏后', '五', 'Fri', '5', 'Friday', '138', '20', '嫁娶.纳采.订盟.祭祀.祈福.治病.造车器.修造.动土.移徙.入宅', '开市.出行.安床.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170520', '1', '假日', '丁酉', '四月廿五', '4-25', '鸡', '立夏后', '六', 'Sat', '6', 'Saturday', '139', '20', '嫁娶.纳采.订盟.会亲友.安机械.结网.冠笄.祭祀.求嗣.进人口.经络', '开市.作灶.动土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170521', '1', '假日', '丁酉', '四月廿六', '4-26', '鸡', '小满', '日', 'Sun', '7', 'Sunday', '140', '20', '祭祀.沐浴.移徙.破土.安葬.扫舍.平治道涂', '祈福.嫁娶.入宅.安床.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170522', '0', '工作日', '丁酉', '四月廿七', '4-27', '鸡', '小满后', '一', 'Mon', '1', 'Monday', '141', '21', '祭祀.祈福.斋醮.求嗣.安机械.纳畜.移徙.入宅.安机械.塑绘.开光.起基.竖柱.上梁.作灶.安门.安香.出火.造屋.启攒.安葬', '动土.破土.嫁娶.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170523', '0', '工作日', '丁酉', '四月廿八', '4-28', '鸡', '小满后', '二', 'Tue', '2', 'Tuesday', '142', '21', '嫁娶.纳采.订盟.斋醮.开光.祭祀.祈福.求医.治病.会亲友.动土.解除.捕捉.纳畜.牧养.入殓.破土.安葬', '移徙.入宅.造屋.架马', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170524', '0', '工作日', '丁酉', '四月廿九', '4-29', '鸡', '小满后', '三', 'Wed', '3', 'Wednesday', '143', '21', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170525', '0', '工作日', '丁酉', '四月三十', '4-30', '鸡', '小满后', '四', 'Thu', '4', 'Thursday', '144', '21', '沐浴.扫舍.余事勿取', '斋醮.开市.嫁娶.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170526', '0', '工作日', '丁酉', '五月初一', '5-1', '鸡', '小满后', '五', 'Fri', '5', 'Friday', '145', '21', '开市.交易.立券.安机械.会亲友.开光.求医.治病.造屋.起基.修造.动土.定磉.竖柱.上梁.安门.作灶.放水.作厕.开池.栽种.牧养.造畜椆栖.破土.安葬.立碑', '嫁娶.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170527', '0', '工作日', '丁酉', '五月初二', '5-2', '鸡', '小满后', '六', 'Sat', '6', 'Saturday', '146', '21', '栽种.捕捉.畋猎.余事勿取', '开市.动土.祭祀.斋醮.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170528', '1', '假日', '丁酉', '五月初三', '5-3', '鸡', '小满后', '日', 'Sun', '7', 'Sunday', '147', '21', '嫁娶.祭祀.祈福.求嗣.斋醮.订盟.纳采.解除.出行.动土.破土.习艺.针灸.理发.会亲友.起基.修造.动土.竖柱.定磉.安床.拆卸.纳畜.牧养.放水.破土.除服.成服.修坟.立碑', '开市.入宅.探病.出火.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170529', '1', '假日', '丁酉', '五月初四', '5-4', '鸡', '小满后', '一', 'Mon', '1', 'Monday', '148', '22', '余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170530', '2', '节日', '丁酉', '五月初五', '5-5', '鸡', '小满后', '二', 'Tue', '2', 'Tuesday', '149', '22', '塞穴.断蚁.结网.余事勿取', '破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170531', '0', '工作日', '丁酉', '五月初六', '5-6', '鸡', '小满后', '三', 'Wed', '3', 'Wednesday', '150', '22', '开光.出行.纳采.嫁娶.伐木.架马.出火.拆卸.移徙.入宅.造庙.造桥.造船.造畜椆栖.开市.入殓.除服.成服.移柩.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170601', '0', '工作日', '丁酉', '五月初七', '5-7', '鸡', '小满后', '四', 'Thu', '4', 'Thursday', '151', '22', '进人口.牧养.置产.塞穴.结网.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170602', '0', '工作日', '丁酉', '五月初八', '5-8', '鸡', '小满后', '五', 'Fri', '5', 'Friday', '152', '22', '开光.出行.嫁娶', '会亲友.进人口.修造.动土.起基.移徙.开市.纳畜.入殓.除服.成服.移柩.破土.安葬.修坟.立碑.会亲友', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170603', '1', '假日', '丁酉', '五月初九', '5-9', '鸡', '小满后', '六', 'Sat', '6', 'Saturday', '153', '22', '嫁娶.纳采.出行.祭祀.祈福.开市.动土.移徙.入宅.破土.安葬', '安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170604', '1', '假日', '丁酉', '五月初十', '5-10', '鸡', '小满后', '日', 'Sun', '7', 'Sunday', '154', '22', '嫁娶.纳采.求医.治病.修造.动土.移徙.入宅.破土.安葬', '开市.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170605', '0', '工作日', '丁酉', '五月十一', '5-11', '鸡', '芒种', '一', 'Mon', '1', 'Monday', '155', '23', '畋猎.捕捉.结网.取渔.祭祀.沐浴.余事勿取', '嫁娶.开市.安葬.启攒.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170606', '0', '工作日', '丁酉', '五月十二', '5-12', '鸡', '芒种后', '二', 'Tue', '2', 'Tuesday', '156', '23', '祭祀.破屋.坏垣.余事勿取', '移徙.入宅.开仓.出货财', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170607', '0', '工作日', '丁酉', '五月十三', '5-13', '鸡', '芒种后', '三', 'Wed', '3', 'Wednesday', '157', '23', '祭祀.斋醮.塑绘.开光.出行.修造.动土.造畜椆栖.安床.放水.掘井.开池.作厕.结网.破土', '出火.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170608', '0', '工作日', '丁酉', '五月十四', '5-14', '鸡', '芒种后', '四', 'Thu', '4', 'Thursday', '158', '23', '开市.交易.立券.挂匾.开光.解除.拆卸.动土.安床.修造.上梁.置产.栽种.破土.安葬', '作灶.出火.祭祀.嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170609', '0', '工作日', '丁酉', '五月十五', '5-15', '鸡', '芒种后', '五', 'Fri', '5', 'Friday', '159', '23', '祭祀.结网.余事勿取', '入宅.出行.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170610', '1', '假日', '丁酉', '五月十六', '5-16', '鸡', '芒种后', '六', 'Sat', '6', 'Saturday', '160', '23', '嫁娶.纳采.订盟.冠笄.造车器.祭祀.开光.祈福.求嗣.出行.解除.伐木.出火.入宅.拆卸.修造.动土.上梁.安床.栽种.破土', '行丧.置产.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170611', '1', '假日', '丁酉', '五月十七', '5-17', '鸡', '芒种后', '日', 'Sun', '7', 'Sunday', '161', '23', '嫁娶.合帐.裁衣.冠笄.伐木.上梁.出火.拆卸.移徙.修造.动土.安门.纳财.筑堤.栽种.塞穴', '安床.祈福.出行.安葬.行丧.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170612', '0', '工作日', '丁酉', '五月十八', '5-18', '鸡', '芒种后', '一', 'Mon', '1', 'Monday', '162', '24', '出行.教牛马.割蜜.余事勿取', '斋醮.造屋.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170613', '0', '工作日', '丁酉', '五月十九', '5-19', '鸡', '芒种后', '二', 'Tue', '2', 'Tuesday', '163', '24', '嫁娶.祭祀.祈福.求嗣.开光.出行.解除.出火.拆卸.修造.进人口.入宅.移徙.动土.安床.纳畜.栽种.纳财.交易.立券.挂匾.造畜椆栖', '安葬.开生坟.合寿木.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170614', '0', '工作日', '丁酉', '五月二十', '5-20', '鸡', '芒种后', '三', 'Wed', '3', 'Wednesday', '164', '24', '安机械.祭祀.祈福.求嗣.沐浴.解除.纳采.开市.修造.竖柱.上梁.开柱眼.安碓硙.归岫.补垣.塞穴.拆卸.放水.出火.扫舍.开生坟.合寿木.安葬.谢土.启攒.除服.成服', '嫁娶.安床.作灶.动土.破土.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170615', '0', '工作日', '丁酉', '五月廿一', '5-21', '鸡', '芒种后', '四', 'Thu', '4', 'Thursday', '165', '24', '祭祀.沐浴.理发.整手足甲.修饰垣墙.平治道涂.余事勿取', '开市.入宅.出行.修造.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170616', '0', '工作日', '丁酉', '五月廿二', '5-22', '鸡', '芒种后', '五', 'Fri', '5', 'Friday', '166', '24', '嫁娶.纳采.祭祀.祈福.出行.立券.移徙.入宅.动土.破土.安葬', '开光.作灶.造屋.架马.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170617', '1', '假日', '丁酉', '五月廿三', '5-23', '鸡', '芒种后', '六', 'Sat', '6', 'Saturday', '167', '24', '纳采.订盟.冠笄.祭祀.祈福.斋醮.出行.修造.动土.移徙.入宅.安香.出火.拆卸.造屋.起基.竖柱.上梁.定磉.安门.开池', '嫁娶.开市.合寿木.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170618', '1', '假日', '丁酉', '五月廿四', '5-24', '鸡', '芒种后', '日', 'Sun', '7', 'Sunday', '168', '24', '祭祀.沐浴.破屋.坏垣.余事勿取', '入宅.嫁娶.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170619', '0', '工作日', '丁酉', '五月廿五', '5-25', '鸡', '芒种后', '一', 'Mon', '1', 'Monday', '169', '25', '嫁娶.安机械.交易.出行.祭祀.祈福.求嗣.斋醮.塑绘.开光.合帐.裁衣.放水.开池.掘井', '作灶.理发.造桥.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170620', '0', '工作日', '丁酉', '五月廿六', '5-26', '鸡', '芒种后', '二', 'Tue', '2', 'Tuesday', '170', '25', '纳采.冠笄.求医.治病.开市.立券.修造.动土.安机械.破土.安葬', '斋醮.祭祀.移徙.入宅.上梁.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170621', '0', '工作日', '丁酉', '五月廿七', '5-27', '鸡', '夏至', '三', 'Wed', '3', 'Wednesday', '171', '25', '祭祀.作灶.余事勿取', '开市.安葬.破土.修坟.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170622', '0', '工作日', '丁酉', '五月廿八', '5-28', '鸡', '夏至后', '四', 'Thu', '4', 'Thursday', '172', '25', '祭祀.祈福.求嗣.斋醮.安香.解除.移徙.入宅.会亲友.求医.治病.动土.破土.开生坟.合寿木', '合帐.上梁.经络.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170623', '0', '工作日', '丁酉', '五月廿九', '5-29', '鸡', '夏至后', '五', 'Fri', '5', 'Friday', '173', '25', '嫁娶.冠笄.修造.动土.作灶.移徙.入宅.补垣.塞穴.纳畜.牧养.架马.修造.动土.起基.定磉.开池.造船', '祈福.开光.掘井.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170624', '1', '假日', '丁酉', '六月初一', '6-1', '鸡', '夏至后', '六', 'Sat', '6', 'Saturday', '174', '25', '祭祀.交易.纳财', '斋醮.开渠.上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170625', '1', '假日', '丁酉', '六月初二', '6-2', '鸡', '夏至后', '日', 'Sun', '7', 'Sunday', '175', '25', '嫁娶.订盟.纳采.冠笄.会亲友.安机械.造车器.祭祀.出行.纳财.入宅.安香.出火.入学.塑绘.开光.拆卸.起基.修造.动土.牧养.栽种.安门.作厕', '行丧.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170626', '0', '工作日', '丁酉', '六月初三', '6-3', '鸡', '夏至后', '一', 'Mon', '1', 'Monday', '176', '26', '开光.求嗣.出行.冠笄.嫁娶.伐木.架马.开柱眼.修造.移徙.入宅.开市.交易.立券.出行.安香.出火.挂匾.起基.修造.开生坟.合寿木.入殓.除服.成服.移柩.安葬', '安床.出货财.作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170627', '0', '工作日', '丁酉', '六月初四', '6-4', '鸡', '夏至后', '二', 'Tue', '2', 'Tuesday', '177', '26', '祭祀.沐浴.理发.嫁娶.作灶.整手足甲.扫舍.修饰垣墙.平治道涂', '斋醮.出行.治病.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170628', '0', '工作日', '丁酉', '六月初五', '6-5', '鸡', '夏至后', '三', 'Wed', '3', 'Wednesday', '178', '26', '安机械.移徙.入宅.出行.祭祀.祈福.斋醮.纳采.订盟.安香.出火.解除.会亲友.修造.动土.拆卸.起基.定磉.移徙.入宅.造屋.安床.修造.破土.安葬.入殓.立碑', '开市.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170629', '0', '工作日', '丁酉', '六月初六', '6-6', '鸡', '夏至后', '四', 'Thu', '4', 'Thursday', '179', '26', '祭祀.沐浴.捕捉.结网.畋猎.取渔.余事勿取', '开市.交易.嫁娶.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170630', '0', '工作日', '丁酉', '六月初七', '6-7', '鸡', '夏至后', '五', 'Fri', '5', 'Friday', '180', '26', '破屋.坏垣.求医.治病.畋猎.余事勿取', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170701', '1', '假日', '丁酉', '六月初八', '6-8', '鸡', '夏至后', '六', 'Sat', '6', 'Saturday', '181', '26', '嫁娶.出行.安机械.祭祀.塑绘.开光.治病.经络.安床.结网.塞穴.破土.入殓', '开市.安门.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170702', '1', '假日', '丁酉', '六月初九', '6-9', '鸡', '夏至后', '日', 'Sun', '7', 'Sunday', '182', '26', '订盟.纳采.会亲友.进人口.雕刻.拆卸.修造.动土.起基.开市.栽种.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170703', '0', '工作日', '丁酉', '六月初十', '6-10', '鸡', '夏至后', '一', 'Mon', '1', 'Monday', '183', '27', '祭祀.捕捉.取渔.修饰垣墙.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170704', '0', '工作日', '丁酉', '六月十一', '6-11', '鸡', '夏至后', '二', 'Tue', '2', 'Tuesday', '184', '27', '嫁娶.纳采.祭祀.祈福.求医.治病.出行.动土.移徙.入宅', '开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170705', '0', '工作日', '丁酉', '六月十二', '6-12', '鸡', '夏至后', '三', 'Wed', '3', 'Wednesday', '185', '27', '裁衣.作灶.移徙.入宅.纳畜', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170706', '0', '工作日', '丁酉', '六月十三', '6-13', '鸡', '夏至后', '四', 'Thu', '4', 'Thursday', '186', '27', '祭祀.入殓.移柩.启攒.安葬', '上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170707', '0', '工作日', '丁酉', '六月十四', '6-14', '鸡', '小暑', '五', 'Fri', '5', 'Friday', '187', '27', '嫁娶.祭祀.出行.裁衣.冠笄.交易.雕刻.纳财.造畜椆栖.造车器.雕刻.教牛马', '移徙.入宅.栽种.动土.破土.作灶.安葬.行丧.伐木.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170708', '1', '假日', '丁酉', '六月十五', '6-15', '鸡', '小暑后', '六', 'Sat', '6', 'Saturday', '188', '27', '修造.动土.安机械.祭祀.沐浴.解除.拆卸.治病.作灶.造屋.起基.开池.扫舍.造畜椆栖.开生坟.合寿木.安葬.破土.启攒.移柩.入殓.立碑', '开市.入宅.出行.安床.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170709', '1', '假日', '丁酉', '六月十六', '6-16', '鸡', '小暑后', '日', 'Sun', '7', 'Sunday', '189', '27', '嫁娶.纳采.订盟.造车器.开光.出行.拆卸.起基.安床.除服.成服.开市.交易.立券.栽种.牧养.入殓.移柩.启攒', '上梁.入宅.修造.动土.破土.祭祀.祈福.斋醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170710', '0', '工作日', '丁酉', '六月十七', '6-17', '鸡', '小暑后', '一', 'Mon', '1', 'Monday', '190', '28', '祭祀.嫁娶.畋猎.结网', '动土.破土.治病.开渠', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170711', '0', '工作日', '丁酉', '六月十八', '6-18', '鸡', '小暑后', '二', 'Tue', '2', 'Tuesday', '191', '28', '纳采.订盟.会亲友.入学.祭祀.祈福.求嗣.开光.出行.解除.理发.动土.起基.开市.交易.立券.纳财.造仓.栽种.纳畜.牧养', '嫁娶.作灶.出火.置产.嫁娶.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170712', '0', '工作日', '丁酉', '六月十九', '6-19', '鸡', '小暑后', '三', 'Wed', '3', 'Wednesday', '192', '28', '祭祀.祈福.解除.整手足甲.安床.沐浴.入殓.移柩.破土.启攒.安葬.谢土', '嫁娶.斋醮.开市.出火.入宅.移徙.出行.作灶.安门.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170713', '0', '工作日', '丁酉', '六月二十', '6-20', '鸡', '小暑后', '四', 'Thu', '4', 'Thursday', '193', '28', '破屋.坏垣.解除.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170714', '0', '工作日', '丁酉', '六月廿一', '6-21', '鸡', '小暑后', '五', 'Fri', '5', 'Friday', '194', '28', '嫁娶.开市.立券.移徙.入宅.安机械.会亲友.经络.安门.安床.挂匾.拆卸.开仓.出货财.开池.栽种.纳畜.牧养.破土.安葬.启攒.移柩.入殓.立碑', '祭祀.祈福.探病.谢土.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170715', '1', '假日', '丁酉', '六月廿二', '6-22', '鸡', '小暑后', '六', 'Sat', '6', 'Saturday', '195', '28', '嫁娶.订盟.纳采.祭祀.祈福.斋醮.开光.会亲友.求医.治病.造屋.起基.竖柱.上梁.安门.安碓硙.筑堤.开池.破土.安葬.除服.成服', '入宅.开市.掘井.词讼.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170716', '1', '假日', '丁酉', '六月廿三', '6-23', '鸡', '小暑后', '日', 'Sun', '7', 'Sunday', '196', '28', '纳采.订盟.嫁娶.移徙.入宅.出行.祭祀.祈福.斋醮.塑绘.开光.安香.出火.会亲友.解除.入学.竖柱.上梁.拆卸.造屋.起基.栽种.牧养.纳畜', '安葬.破土.开市.开仓.出货财.启攒', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170717', '0', '工作日', '丁酉', '六月廿四', '6-24', '鸡', '小暑后', '一', 'Mon', '1', 'Monday', '197', '29', '纳采.订盟.嫁娶.祭祀.沐浴.塑绘.开光.出火.治病.习艺.伐木.造屋.竖柱.上梁.安床.作灶.安碓硙.挂匾.掘井.纳畜', '出行.安葬.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170718', '0', '工作日', '丁酉', '六月廿五', '6-25', '鸡', '小暑后', '二', 'Tue', '2', 'Tuesday', '198', '29', '祭祀.入殓.除服.成服.移柩.破土.启攒.安葬.塞穴.断蚁.结网', '开市.入宅.嫁娶.开光.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170719', '0', '工作日', '丁酉', '六月廿六', '6-26', '鸡', '小暑后', '三', 'Wed', '3', 'Wednesday', '199', '29', '祭祀.修造.出行.造屋.竖柱.造车器.教牛马.造畜椆栖.割蜜', '动土.破土.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170720', '0', '工作日', '丁酉', '六月廿七', '6-27', '鸡', '小暑后', '四', 'Thu', '4', 'Thursday', '200', '29', '祭祀.沐浴.塑绘.开光.入学.解除.扫舍.治病.开池.牧养', '嫁娶.出行.纳采.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170721', '0', '工作日', '丁酉', '六月廿八', '6-28', '鸡', '小暑后', '五', 'Fri', '5', 'Friday', '201', '29', '纳财.开市.交易.立券.出行.祭祀.祈福.求嗣.开光.解除.扫舍.起基.竖柱.安床.移徙.开仓.出货财.补垣.塞穴.栽种.纳畜.牧养', '斋醮.入宅.安门.安葬.破土.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170722', '1', '假日', '丁酉', '六月廿九', '6-29', '鸡', '大暑', '六', 'Sat', '6', 'Saturday', '202', '29', '祭祀.修饰垣墙.平治道涂', '开市.动土.破土.嫁娶.修造.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170723', '1', '假日', '丁酉', '闰六月初一', '7-1', '鸡', '大暑后', '日', 'Sun', '7', 'Sunday', '203', '29', '订盟.纳采.祭祀.祈福.开光.安香.出火.立券.安机械.移徙.入宅.竖柱.上梁.会亲友.安床.拆卸.挂匾.牧养.教牛马', '嫁娶.安葬.行丧.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170724', '0', '工作日', '丁酉', '闰六月初二', '7-2', '鸡', '大暑后', '一', 'Mon', '1', 'Monday', '204', '30', '沐浴.理发.捕捉.入殓.移柩.破土.启攒.安葬', '出火.嫁娶.入宅.作灶.破土.上梁.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170725', '0', '工作日', '丁酉', '闰六月初三', '7-3', '鸡', '大暑后', '二', 'Tue', '2', 'Tuesday', '205', '30', '求医.治病.破屋.坏垣.余事勿取', '嫁娶.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170726', '0', '工作日', '丁酉', '闰六月初四', '7-4', '鸡', '大暑后', '三', 'Wed', '3', 'Wednesday', '206', '30', '纳采.订盟.嫁娶.移徙.入宅.出行.开市.交易.立券.纳财.会亲友.安香.出火.拆卸.造屋.起基.安床.作灶.挂匾.安葬.破土.启攒.立碑.入殓.移柩', '祈福.上梁.开仓.掘井.牧养', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170727', '0', '工作日', '丁酉', '闰六月初五', '7-5', '鸡', '大暑后', '四', 'Thu', '4', 'Thursday', '207', '30', '祭祀.祈福.斋醮.出行.纳采.订盟.安机械.出火.拆卸.修造.动土.起基.移徙.入宅.造庙.入殓.除服.成服.移柩.破土.安葬.谢土', '嫁娶.开市.栽种.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170728', '0', '工作日', '丁酉', '闰六月初六', '7-6', '鸡', '大暑后', '五', 'Fri', '5', 'Friday', '208', '30', '祭祀.进人口.纳财.纳畜.牧养.捕捉.余事勿取', '开市.入宅.安床.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170729', '1', '假日', '丁酉', '闰六月初七', '7-7', '鸡', '大暑后', '六', 'Sat', '6', 'Saturday', '209', '30', '祭祀.塑绘.开光.求医.治病.嫁娶.会亲友.放水.掘井.牧养.纳畜.开渠.安碓硙', '造屋.入宅.作灶.入学.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170730', '1', '假日', '丁酉', '闰六月初八', '7-8', '鸡', '大暑后', '日', 'Sun', '7', 'Sunday', '210', '30', '祭祀.塞穴.结网.畋猎.余事勿取', '移徙.开市.入宅.嫁娶.开光.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170731', '0', '工作日', '丁酉', '闰六月初九', '7-9', '鸡', '大暑后', '一', 'Mon', '1', 'Monday', '211', '31', '开市.纳财.祭祀.塑绘.安机械.冠笄.会亲友.裁衣.开仓.经络.纳畜.造畜椆栖.教牛马.牧养', '动土.破土.安葬.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170801', '0', '工作日', '丁酉', '闰六月初十', '7-10', '鸡', '大暑后', '二', 'Tue', '2', 'Tuesday', '212', '31', '移徙.入宅.治病.会亲友.祭祀.祈福.斋醮.安香.移徙.嫁娶.造屋.起基', '开市.斋醮.安床.出行.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170802', '0', '工作日', '丁酉', '闰六月十一', '7-11', '鸡', '大暑后', '三', 'Wed', '3', 'Wednesday', '213', '31', '塑绘.出行.冠笄.嫁娶.进人口.裁衣.纳婿.造畜椆栖.交易.立券.牧养.开生坟.入殓.除服.成服.移柩.安葬.启攒', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170803', '0', '工作日', '丁酉', '闰六月十二', '7-12', '鸡', '大暑后', '四', 'Thu', '4', 'Thursday', '214', '31', '祭祀.冠笄.嫁娶.捕捉.结网.畋猎.取渔.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170804', '0', '工作日', '丁酉', '闰六月十三', '7-13', '鸡', '大暑后', '五', 'Fri', '5', 'Friday', '215', '31', '沐浴.扫舍.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170805', '1', '假日', '丁酉', '闰六月十四', '7-14', '鸡', '大暑后', '六', 'Sat', '6', 'Saturday', '216', '31', '纳采.祭祀.祈福.解除.动土.破土.安葬', '嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170806', '1', '假日', '丁酉', '闰六月十五', '7-15', '鸡', '大暑后', '日', 'Sun', '7', 'Sunday', '217', '31', '祭祀.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170807', '0', '工作日', '丁酉', '闰六月十六', '7-16', '鸡', '立秋', '一', 'Mon', '1', 'Monday', '218', '32', '破屋.坏垣.治病.余事勿取', '祈福.纳采.订盟.嫁娶.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170808', '0', '工作日', '丁酉', '闰六月十七', '7-17', '鸡', '立秋后', '二', 'Tue', '2', 'Tuesday', '219', '32', '嫁娶.开光.祭祀.祈福.求嗣.安香.出火.解除.伐木.入宅.移徙.安床.开市.交易.立券.栽种.出火.出行.安葬', '掘井.理发.作灶.动土.破土.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170809', '0', '工作日', '丁酉', '闰六月十八', '7-18', '鸡', '立秋后', '三', 'Wed', '3', 'Wednesday', '220', '32', '安机械.纳采.订盟.祭祀.祈福.求嗣.开光.普渡.出行.出火.拆卸.修造.动土.进人口.开市.交易.立券.移徙.安床.栽种.上梁.纳畜.破土.移柩.安葬', '入宅.嫁娶.掘井.牧养', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170810', '0', '工作日', '丁酉', '闰六月十九', '7-19', '鸡', '立秋后', '四', 'Thu', '4', 'Thursday', '221', '32', '嫁娶.祭祀.祈福.求嗣.裁衣.冠笄.经络.修造.进人口.安床.动土.竖柱.上梁.移徙.交易.立券.栽种.会亲友', '行丧.安葬.出行.作梁.纳畜.伐木.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170811', '0', '工作日', '丁酉', '闰六月二十', '7-20', '鸡', '立秋后', '五', 'Fri', '5', 'Friday', '222', '32', '嫁娶.纳采.订盟.开光.祭祀.出行.理发.动土.安床.放水.开渠.栽种.进人口', '入宅.上梁.入殓.造屋.探病.作灶.安门.安葬.纳畜.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170812', '1', '假日', '丁酉', '闰六月廿一', '7-21', '鸡', '立秋后', '六', 'Sat', '6', 'Saturday', '223', '32', '祭祀.出行.作梁.出火.拆卸.修造.动土.起基.安床.补垣.塞穴.入殓.破土.安葬.移柩.造畜椆栖', '嫁娶.入宅.斋醮.开光.针灸.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170813', '1', '假日', '丁酉', '闰六月廿二', '7-22', '鸡', '立秋后', '日', 'Sun', '7', 'Sunday', '224', '32', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.出行.解除.竖柱.入宅.移徙.纳财.上梁.纳畜.入殓.安葬.启攒', '栽种.掘井.动土.安床.破土.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170814', '0', '工作日', '丁酉', '闰六月廿三', '7-23', '鸡', '立秋后', '一', 'Mon', '1', 'Monday', '225', '33', '解除.祭祀.祈福.求嗣.修造.动土.竖柱.上梁.安床.纳畜.造屋.合脊.起基.入殓.破土.安葬', '出火.嫁娶.开光.进人口.出行.词讼.开市.入宅.移徙.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170815', '0', '工作日', '丁酉', '闰六月廿四', '7-24', '鸡', '立秋后', '二', 'Tue', '2', 'Tuesday', '226', '33', '沐浴.理发.会亲友.塑绘.开光.栽种.牧养.嫁娶.经络.补垣.塞穴', '开市.入宅.动土.破土.安葬.作灶.上梁.安床.开仓.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170816', '0', '工作日', '丁酉', '闰六月廿五', '7-25', '鸡', '立秋后', '三', 'Wed', '3', 'Wednesday', '227', '33', '祭祀.理发.作灶.沐浴.修饰垣墙.平治道涂', '嫁娶.栽种.祈福.造桥.安葬.安门.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170817', '0', '工作日', '丁酉', '闰六月廿六', '7-26', '鸡', '立秋后', '四', 'Thu', '4', 'Thursday', '228', '33', '嫁娶.纳采.订盟.祭祀.祈福.斋醮.普渡.移徙.入宅.出行.安机械.开光.修造.动土.竖柱.上梁.造屋.起基.定磉.安门.安葬.破土', '开市.立券.置产.作灶.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170818', '0', '工作日', '丁酉', '闰六月廿七', '7-27', '鸡', '立秋后', '五', 'Fri', '5', 'Friday', '229', '33', '祭祀.普渡.捕捉.解除.结网.畋猎.入殓.破土.安葬', '开市.交易.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170819', '1', '假日', '丁酉', '闰六月廿八', '7-28', '鸡', '立秋后', '六', 'Sat', '6', 'Saturday', '230', '33', '沐浴.破屋.坏垣.余事勿取', '斋醮.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170820', '1', '假日', '丁酉', '闰六月廿九', '7-29', '鸡', '立秋后', '日', 'Sun', '7', 'Sunday', '231', '33', '订盟.纳采.祭祀.祈福.安香.出火.开市.立券.入宅.挂匾.造桥.启攒.安葬', '动土.破土.嫁娶.掘井.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170821', '0', '工作日', '丁酉', '闰六月三十', '7-30', '鸡', '立秋后', '一', 'Mon', '1', 'Monday', '232', '34', '嫁娶.祭祀.祈福.斋醮.普渡.移徙.入宅.动土.治病.开市.交易.立券.开光.修造.造车器.安香.安床.捕捉.畋猎.结网', '纳采.订盟.经络.行丧.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170822', '0', '工作日', '丁酉', '七月初一', '8-1', '鸡', '立秋后', '二', 'Tue', '2', 'Tuesday', '233', '34', '嫁娶.订盟.纳采.作灶.冠笄.裁衣.会亲友.纳畜.牧养.安机械.开市.立券.纳财.安床', '掘井.出行.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170823', '0', '工作日', '丁酉', '七月初二', '8-2', '鸡', '处暑', '三', 'Wed', '3', 'Wednesday', '234', '34', '嫁娶.订盟.纳采.祭祀.斋醮.普渡.解除.出行.会亲友.开市.纳财.修造.动土.竖柱.上梁.开光.开仓.出货财.纳畜.牧养.开池.破土.启攒', '出火.入宅.造屋.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170824', '0', '工作日', '丁酉', '七月初三', '8-3', '鸡', '处暑后', '四', 'Thu', '4', 'Thursday', '235', '34', '嫁娶.普渡.祭祀.祈福.补垣.塞穴.断蚁.筑堤.入殓.除服.成服.安葬', '动土.破土.掘井.开光.上梁.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170825', '0', '工作日', '丁酉', '七月初四', '8-4', '鸡', '处暑后', '五', 'Fri', '5', 'Friday', '236', '34', '嫁娶.冠笄.祭祀.沐浴.普渡.出行.纳财.扫舍.纳畜.赴任', '开市.动土.破土.安床.开仓.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170826', '1', '假日', '丁酉', '七月初五', '8-5', '鸡', '处暑后', '六', 'Sat', '6', 'Saturday', '237', '34', '祭祀.沐浴.理发.整手足甲.冠笄.解除.入殓.移柩.破土.启攒.安葬', '嫁娶.出行.入宅.开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170827', '1', '假日', '丁酉', '七月初六', '8-6', '鸡', '处暑后', '日', 'Sun', '7', 'Sunday', '238', '34', '塑绘.冠笄.嫁娶.会亲友.进人口.经络.裁衣.栽种.纳畜.牧养.补垣.塞穴.捕捉', '祈福.开市.动土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170828', '0', '工作日', '丁酉', '七月初七', '8-7', '鸡', '处暑后', '一', 'Mon', '1', 'Monday', '239', '35', '出行.沐浴.订盟.纳采.裁衣.竖柱.上梁.移徙.纳畜.牧养', '嫁娶.安门.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170829', '0', '工作日', '丁酉', '七月初八', '8-8', '鸡', '处暑后', '二', 'Tue', '2', 'Tuesday', '240', '35', '纳采.订盟.嫁娶.祭祀.祈福.普渡.开光.安香.出火.移徙.入宅.竖柱.修造.动土.竖柱.上梁.起基.造屋.安门.造庙.造桥.破土.启攒.安葬', '开市.立券.纳财.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170830', '0', '工作日', '丁酉', '七月初九', '8-9', '鸡', '处暑后', '三', 'Wed', '3', 'Wednesday', '241', '35', '祭祀.捕捉.畋猎.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬.启攒', '嫁娶.纳采.订盟.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170831', '0', '工作日', '丁酉', '七月初十', '8-10', '鸡', '处暑后', '四', 'Thu', '4', 'Thursday', '242', '35', '破屋.坏垣.治病.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170901', '0', '工作日', '丁酉', '七月十一', '8-11', '鸡', '处暑后', '五', 'Fri', '5', 'Friday', '243', '35', '祈福.斋醮.出行.冠笄.嫁娶.雕刻.开柱眼.入宅.造桥.开市.交易.立券.纳财.入殓.除服.成服.移柩.破土.安葬.启攒', '动土.破土.订盟.安床.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170902', '1', '假日', '丁酉', '七月十二', '8-12', '鸡', '处暑后', '六', 'Sat', '6', 'Saturday', '244', '35', '祈福.求嗣.解除.订盟.纳采.动土.起基.放水.造仓.开市.纳畜.牧养.开生坟.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170903', '1', '假日', '丁酉', '七月十三', '8-13', '鸡', '处暑后', '日', 'Sun', '7', 'Sunday', '245', '35', '塑绘.开光.解除.订盟.纳采.嫁娶.出火.修造.动土.移徙.入宅.拆卸.起基.安门.分居.开市.交易.立券.纳财.纳畜.牧养', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170904', '0', '工作日', '丁酉', '七月十四', '8-14', '鸡', '处暑后', '一', 'Mon', '1', 'Monday', '246', '36', '祈福.出行.订盟.纳采.嫁娶.裁衣.动土.安床.放水.开市.掘井.交易.立券.栽种.开渠.除服.成服.移柩.破土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170905', '0', '工作日', '丁酉', '七月十五', '8-15', '鸡', '处暑后', '二', 'Tue', '2', 'Tuesday', '247', '36', '嫁娶.祭祀.祈福.斋醮.作灶.移徙.入宅', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170906', '0', '工作日', '丁酉', '七月十六', '8-16', '鸡', '处暑后', '三', 'Wed', '3', 'Wednesday', '248', '36', '嫁娶.出行.纳畜.祭祀.入殓.启攒.安葬', '作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170907', '0', '工作日', '丁酉', '七月十七', '8-17', '鸡', '白露', '四', 'Thu', '4', 'Thursday', '249', '36', '祭祀.出行.沐浴.扫舍.安葬.余事勿取', '动土.破土.置产.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170908', '0', '工作日', '丁酉', '七月十八', '8-18', '鸡', '白露后', '五', 'Fri', '5', 'Friday', '250', '36', '嫁娶.纳采.祭祀.解除.出行.修造.动土.开市.上梁.安床.整手足甲.扫舍.求医.治病.起基.定磉.造屋.合脊', '造庙.行丧.安葬.伐木.作灶.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170909', '1', '假日', '丁酉', '七月十九', '8-19', '鸡', '白露后', '六', 'Sat', '6', 'Saturday', '251', '36', '纳采.订盟.开市.交易.立券.挂匾.纳财.栽种.进人口.入宅.移徙.安床.开光.出火.拆卸.安门.修造', '斋醮.嫁娶.行丧.动土.作灶.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170910', '1', '假日', '丁酉', '七月二十', '8-20', '鸡', '白露后', '日', 'Sun', '7', 'Sunday', '252', '36', '祭祀.沐浴.修饰垣墙.平治道涂.余事勿取', '嫁娶.入宅.安床.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170911', '0', '工作日', '丁酉', '七月廿一', '8-21', '鸡', '白露后', '一', 'Mon', '1', 'Monday', '253', '37', '开光.祈福.求嗣.斋醮.修造.动土.纳财.造仓.作厕.栽种.牧养.会亲友', '作灶.出火.进人口.开渠.入宅.移徙.祭祀', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170912', '0', '工作日', '丁酉', '七月廿二', '8-22', '鸡', '白露后', '二', 'Tue', '2', 'Tuesday', '254', '37', '开光.解除.拆卸.修造.动土.竖柱.安门.牧养.安葬.修坟.破土.移柩', '出火.入宅.移徙.祈福.祭祀.安床.开市.嫁娶.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170913', '0', '工作日', '丁酉', '七月廿三', '8-23', '鸡', '白露后', '三', 'Wed', '3', 'Wednesday', '255', '37', '破屋.坏垣.求医.治病.余事勿取', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170914', '0', '工作日', '丁酉', '七月廿四', '8-24', '鸡', '白露后', '四', 'Thu', '4', 'Thursday', '256', '37', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.开光.出行.出火.拆卸.修造.动土.进人口.入宅.移徙.安床.上梁.合脊.放水.掘井.破土.移柩.谢土.除服.成服', '开市.开仓.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170915', '0', '工作日', '丁酉', '七月廿五', '8-25', '鸡', '白露后', '五', 'Fri', '5', 'Friday', '257', '37', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.开光.解除.进人口.入宅.移徙.出火.安床.开市.交易.立券.挂匾', '安葬.纳畜.出行.行丧.伐木.栽种.造庙.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170916', '1', '假日', '丁酉', '七月廿六', '8-26', '鸡', '白露后', '六', 'Sat', '6', 'Saturday', '258', '37', '祭祀.冠笄.捕捉.余事勿取', '嫁娶.开市.造屋.作梁.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170917', '1', '假日', '丁酉', '七月廿七', '8-27', '鸡', '白露后', '日', 'Sun', '7', 'Sunday', '259', '37', '祭祀.解除.结网.畋猎.取渔.会亲友.入学.移柩.启攒.除服.成服', '开市.祈福.动土.破土.入殓.安葬.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170918', '0', '工作日', '丁酉', '七月廿八', '8-28', '鸡', '白露后', '一', 'Mon', '1', 'Monday', '260', '38', '冠笄.沐浴.出行.修造.动土.移徙.入宅.破土.安葬', '嫁娶.开市.祭祀.祈福.斋醮.纳采.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170919', '0', '工作日', '丁酉', '七月廿九', '8-29', '鸡', '白露后', '二', 'Tue', '2', 'Tuesday', '261', '38', '祭祀.出行', '嫁娶.入宅.修造.动土.会亲友.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170920', '0', '工作日', '丁酉', '八月初一', '9-1', '鸡', '白露后', '三', 'Wed', '3', 'Wednesday', '262', '38', '嫁娶.订盟.纳采.祭祀.祈福.出行.修造.动土.移徙.入宅', '针灸.伐木.作梁.造庙.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170921', '0', '工作日', '丁酉', '八月初二', '9-2', '鸡', '白露后', '四', 'Thu', '4', 'Thursday', '263', '38', '出行.开市.交易.立券.安机械.出火.上梁.移徙', '嫁娶.安葬.动土.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170922', '0', '工作日', '丁酉', '八月初三', '9-3', '鸡', '白露后', '五', 'Fri', '5', 'Friday', '264', '38', '祭祀.沐浴.修饰垣墙.平治道涂.余事勿取', '斋醮.嫁娶.移徙.出行.上梁.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170923', '1', '假日', '丁酉', '八月初四', '9-4', '鸡', '秋分', '六', 'Sat', '6', 'Saturday', '265', '38', '嫁娶.造车器.安机械.祭祀.祈福.开光.安香.出火.出行.开市.立券.修造.动土.移徙.入宅.破土.安葬', '纳采.订盟.架马.词讼.开渠', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170924', '1', '假日', '丁酉', '八月初五', '9-5', '鸡', '秋分后', '日', 'Sun', '7', 'Sunday', '266', '38', '沐浴.捕捉.入殓.除服.成服.破土.启攒.安葬', '祭祀.嫁娶.安床.开市.入宅.探病.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170925', '0', '工作日', '丁酉', '八月初六', '9-6', '鸡', '秋分后', '一', 'Mon', '1', 'Monday', '267', '39', '余事勿取', '探病.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170926', '0', '工作日', '丁酉', '八月初七', '9-7', '鸡', '秋分后', '二', 'Tue', '2', 'Tuesday', '268', '39', '订盟.纳采.祭祀.祈福.安香.出火.修造.动土.上梁.安门.起基.竖柱.上梁.定磉.开池.移徙.入宅.立券.破土', '嫁娶.造庙.造桥.造船.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170927', '0', '工作日', '丁酉', '八月初八', '9-8', '鸡', '秋分后', '三', 'Wed', '3', 'Wednesday', '269', '39', '开光.求嗣.雕刻.嫁娶.订盟.纳采.出火.拆卸.修造.动土.起基.上梁.放水.移徙.入宅.造仓.造船.开市.开池.纳畜.牧养.挂匾', '行丧.安葬.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170928', '0', '工作日', '丁酉', '八月初九', '9-9', '鸡', '秋分后', '四', 'Thu', '4', 'Thursday', '270', '39', '祭祀.嫁娶.捕捉', '开光.动土.破土.开市.修造.入宅.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170929', '0', '工作日', '丁酉', '八月初十', '9-10', '鸡', '秋分后', '五', 'Fri', '5', 'Friday', '271', '39', '祭祀.普渡.解除.会亲友.捕捉.畋猎.启攒.除服.成服.移柩', '嫁娶.开市.动土.掘井.开池.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20170930', '0', '工作日', '丁酉', '八月十一', '9-11', '鸡', '秋分后', '六', 'Sat', '6', 'Saturday', '272', '39', '祭祀.出行.解除.冠笄.嫁娶.伐木.架马.开柱眼.修造.动土.移徙.入宅.开生坟.合寿木.入殓.移柩.破土.安葬.修坟', '开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171001', '2', '节日', '丁酉', '八月十二', '9-12', '鸡', '秋分后', '日', 'Sun', '7', 'Sunday', '273', '39', '祭祀.祈福.求嗣.出行.沐浴.交易.扫舍.教牛马', '动土.作灶.行丧.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171002', '2', '节日', '丁酉', '八月十三', '9-13', '鸡', '秋分后', '一', 'Mon', '1', 'Monday', '274', '40', '出行.解除.纳采.冠笄.雕刻.修造.动土.起基.上梁.合脊.安床.移徙.入宅.开市.栽种.作厕', '造庙.安门.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171003', '2', '节日', '丁酉', '八月十四', '9-14', '鸡', '秋分后', '二', 'Tue', '2', 'Tuesday', '275', '40', '祭祀.沐浴.解除.理发.冠笄.安机械.作灶.造仓.开市.开池.作厕.补垣.塞穴.断蚁.结网', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171004', '2', '节日', '丁酉', '八月十五', '9-15', '鸡', '秋分后', '三', 'Wed', '3', 'Wednesday', '276', '40', '祭祀.沐浴.修饰垣墙.平治道涂', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171005', '1', '假日', '丁酉', '八月十六', '9-16', '鸡', '秋分后', '四', 'Thu', '4', 'Thursday', '277', '40', '祭祀.会亲友.纳采.嫁娶.开光.塑绘.斋醮.安香.开市.立券.除服.成服.入殓.移柩.安葬.赴任.进人口.出行.裁衣.修造.动土.上梁.经络.交易', '入宅.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171006', '1', '假日', '丁酉', '八月十七', '9-17', '鸡', '秋分后', '五', 'Fri', '5', 'Friday', '278', '40', '祭祀.冠笄.会亲友.拆卸.起基.除服.成服.移柩.启攒.安葬.沐浴.捕捉.开光.塑绘', '作灶.祭祀.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171007', '1', '假日', '丁酉', '八月十八', '9-18', '鸡', '秋分后', '六', 'Sat', '6', 'Saturday', '279', '40', '祭祀.沐浴.破屋.坏垣.余事勿取', '移徙.入宅.出行.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171008', '1', '假日', '丁酉', '八月十九', '9-19', '鸡', '寒露', '日', 'Sun', '7', 'Sunday', '280', '40', '祭祀.沐浴.破屋.坏垣.余事勿取', '嫁娶.入宅.上梁.出行.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171009', '0', '工作日', '丁酉', '八月二十', '9-20', '鸡', '寒露后', '一', 'Mon', '1', 'Monday', '281', '41', '祭祀.求嗣.冠笄.进人口.会亲友.安门.安床.经络.纳财.牧养.畋猎.放水.割蜜', '祈福.斋醮.纳采.订盟.嫁娶.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171010', '0', '工作日', '丁酉', '八月廿一', '9-21', '鸡', '寒露后', '二', 'Tue', '2', 'Tuesday', '282', '41', '嫁娶.纳采.订盟.开市.交易.立券.挂匾.祭祀.祈福.开光.造车器.挂匾.出行.入宅.移徙.安床.安门.拆卸.修造.动土.栽种.安葬.破土.启攒.除服.成服.入殓.立碑', '探病.纳畜.伐木.起基.作梁.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171011', '0', '工作日', '丁酉', '八月廿二', '9-22', '鸡', '寒露后', '三', 'Wed', '3', 'Wednesday', '283', '41', '祭祀.冠笄.移徙.会亲友.纳财.理发.捕捉', '嫁娶.开市.开池.作厕.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171012', '0', '工作日', '丁酉', '八月廿三', '9-23', '鸡', '寒露后', '四', 'Thu', '4', 'Thursday', '284', '41', '祭祀.祈福.求嗣.斋醮.开光.出行.嫁娶.求医.治病.动土.破土.入学.起基.扫舍.竖柱.上梁.开仓.出货财.置产.栽种.牧养.开生坟.谢土.立碑', '安门.安床.裁衣.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171013', '0', '工作日', '丁酉', '八月廿四', '9-24', '鸡', '寒露后', '五', 'Fri', '5', 'Friday', '285', '41', '嫁娶.裁衣.冠笄.合帐.祭祀.出行.安床.移徙.塞穴.入殓.破土.移柩.安葬', '开市.出行.栽种.置产.词讼.安门.掘井.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171014', '1', '假日', '丁酉', '八月廿五', '9-25', '鸡', '寒露后', '六', 'Sat', '6', 'Saturday', '286', '41', '祭祀.造车器.出行.修造.上梁.造屋.安门.安床.造畜椆栖.教牛马', '出货财.开仓.动土.破土.安葬.行丧.伐木.开渠.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171015', '1', '假日', '丁酉', '八月廿六', '9-26', '鸡', '寒露后', '日', 'Sun', '7', 'Sunday', '287', '41', '祭祀.开光.出行.解除.伐木.作梁.出火.拆卸.入宅.移徙.安床.修造.造畜椆栖.扫舍', '造庙.嫁娶.掘井.栽种.造桥.作灶.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171016', '0', '工作日', '丁酉', '八月廿七', '9-27', '鸡', '寒露后', '一', 'Mon', '1', 'Monday', '288', '42', '纳采.订盟.开市.交易.立券.会亲友.纳畜.牧养.问名.移徙.解除.作厕.入学.起基.安床.开仓.出货财.安葬.启攒.入殓.除服.成服', '入宅.上梁.斋醮.出火.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171017', '0', '工作日', '丁酉', '八月廿八', '9-28', '鸡', '寒露后', '二', 'Tue', '2', 'Tuesday', '289', '42', '祭祀.平治道涂.余事勿取', '嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171018', '0', '工作日', '丁酉', '八月廿九', '9-29', '鸡', '寒露后', '三', 'Wed', '3', 'Wednesday', '290', '42', '捕捉.畋猎.余事勿取', '开市.交易.祭祀.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171019', '0', '工作日', '丁酉', '八月三十', '9-30', '鸡', '寒露后', '四', 'Thu', '4', 'Thursday', '291', '42', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.斋醮.开光.安香.出火.造庙.移徙.出行.入宅.造庙.起基.竖柱.上梁.安床.纳畜.捕捉.纳婿.安葬', '开市.破土.掘井.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171020', '0', '工作日', '丁酉', '九月初一', '10-1', '鸡', '寒露后', '五', 'Fri', '5', 'Friday', '292', '42', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '开市.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171021', '1', '假日', '丁酉', '九月初二', '10-2', '鸡', '寒露后', '六', 'Sat', '6', 'Saturday', '293', '42', '订盟.纳采.会亲友.交易.立券.纳财.栽种.纳畜.牧养', '嫁娶.开市.入宅.祈福.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171022', '1', '假日', '丁酉', '九月初三', '10-3', '鸡', '寒露后', '日', 'Sun', '7', 'Sunday', '294', '42', '造车器.嫁娶.订盟.纳采.会亲友.祭祀.出行.开市.立券.移徙.入宅.破土.安葬', '上梁.开光.造屋.架马.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171023', '0', '工作日', '丁酉', '九月初四', '10-4', '鸡', '霜降', '一', 'Mon', '1', 'Monday', '295', '43', '祭祀.作灶.纳财.捕捉.畋猎.余事勿取', '动土.破土.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171024', '0', '工作日', '丁酉', '九月初五', '10-5', '鸡', '霜降后', '二', 'Tue', '2', 'Tuesday', '296', '43', '嫁娶.订盟.纳采.祭祀.祈福.出行.求医.治病.出火.移徙.入宅', '开市.开仓.出货财.安床.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171025', '0', '工作日', '丁酉', '九月初六', '10-6', '鸡', '霜降后', '三', 'Wed', '3', 'Wednesday', '297', '43', '冠笄.祭祀.沐浴.作灶.理发.整手足甲.扫舍.补垣.塞穴.入殓.破土.启攒', '开光.嫁娶.会亲友.栽种.针灸.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171026', '0', '工作日', '丁酉', '九月初七', '10-7', '鸡', '霜降后', '四', 'Thu', '4', 'Thursday', '298', '43', '纳采.订盟.嫁娶.祭祀.祈福.求嗣.置产.求医.治病.开市.交易.立券.会亲友.移徙.竖柱.上梁.造屋.合脊.安门.放水.捕捉.纳畜', '造庙.造船.动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171027', '0', '工作日', '丁酉', '九月初八', '10-8', '鸡', '霜降后', '五', 'Fri', '5', 'Friday', '299', '43', '出行.造车器.造畜椆栖.解除.冠笄.裁衣.作梁.雕刻.会亲友.移徙.入宅.安机械.造畜椆栖.开市.扫舍', '嫁娶.动土.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171028', '1', '假日', '丁酉', '九月初九', '10-9', '鸡', '霜降后', '六', 'Sat', '6', 'Saturday', '300', '43', '沐浴.理发.冠笄.安床.开市.立券.会亲友.交易.纳财.结网.教牛马', '移徙.入宅.出行.祈福.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171029', '1', '假日', '丁酉', '九月初十', '10-10', '鸡', '霜降后', '日', 'Sun', '7', 'Sunday', '301', '43', '祭祀.造畜椆栖.修饰垣墙.平治道涂.余事勿取', '嫁娶.开市.安床.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171030', '0', '工作日', '丁酉', '九月十一', '10-11', '鸡', '霜降后', '一', 'Mon', '1', 'Monday', '302', '44', '捕捉.结网.入殓.除服.成服.移柩.破土.安葬.启攒.立碑', '嫁娶.祭祀.入宅.造屋.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171031', '0', '工作日', '丁酉', '九月十二', '10-12', '鸡', '霜降后', '二', 'Tue', '2', 'Tuesday', '303', '44', '祭祀.祈福.求嗣.斋醮.造庙.出火.安机械.会亲友.开市.交易.立券.纳财.习艺.经络.求医.治病.开池.作厕.畋猎.结网.栽种.牧养.安葬.破土.启攒', '开光.嫁娶.掘井.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171101', '0', '工作日', '丁酉', '九月十三', '10-13', '鸡', '霜降后', '三', 'Wed', '3', 'Wednesday', '304', '44', '破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171102', '0', '工作日', '丁酉', '九月十四', '10-14', '鸡', '霜降后', '四', 'Thu', '4', 'Thursday', '305', '44', '会亲友.嫁娶.订盟.纳采.纳婿.拆卸.修造.动土.起基.竖柱.上梁.安床.会亲友.纳财', '出行.祈福.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171103', '0', '工作日', '丁酉', '九月十五', '10-15', '鸡', '霜降后', '五', 'Fri', '5', 'Friday', '306', '44', '祭祀.塑绘.开光.祈福.斋醮.出行.订盟.纳采.裁衣.嫁娶.拆卸.修造.安床.入宅.安香.入殓.启攒.安葬.谢土.赴任.会亲友.进人口.出行.移徙.上梁.经络.开市.交易.立券.纳财', '开仓.冠笄.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171104', '1', '假日', '丁酉', '九月十六', '10-16', '鸡', '霜降后', '六', 'Sat', '6', 'Saturday', '307', '44', '祭祀.作灶.入殓.除服.成服.畋猎', '栽种.动土.安葬.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171105', '1', '假日', '丁酉', '九月十七', '10-17', '鸡', '霜降后', '日', 'Sun', '7', 'Sunday', '308', '44', '祭祀.祈福.斋醮.沐浴.竖柱.订盟.纳采.嫁娶.拆卸.入宅.移柩.启攒.谢土.赴任.出火.纳畜', '作灶.入殓.安葬.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171106', '0', '工作日', '丁酉', '九月十八', '10-18', '鸡', '霜降后', '一', 'Mon', '1', 'Monday', '309', '45', '嫁娶.祭祀.安机械.入殓.破土.安葬', '动土.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171107', '0', '工作日', '丁酉', '九月十九', '10-19', '鸡', '立冬', '二', 'Tue', '2', 'Tuesday', '310', '45', '合帐.裁衣.嫁娶.安床.入殓.移柩.破土.造畜椆栖', '置产.造船.开光.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171108', '0', '工作日', '丁酉', '九月二十', '10-20', '鸡', '立冬后', '三', 'Wed', '3', 'Wednesday', '311', '45', '解除.修饰垣墙.冠笄.出行.余事勿取', '开市.动土.破土.嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171109', '0', '工作日', '丁酉', '九月廿一', '10-21', '鸡', '立冬后', '四', 'Thu', '4', 'Thursday', '312', '45', '纳采.订盟.嫁娶.祭祀.祈福.求嗣.开光.出行.解除.进人口.开市.立券.挂匾.入宅.移徙.安门.栽种.动土.求医.治病.会亲友.起基.修造.造屋.安葬', '作灶.经络.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171110', '0', '工作日', '丁酉', '九月廿二', '10-22', '鸡', '立冬后', '五', 'Fri', '5', 'Friday', '313', '45', '祭祀.塑绘.理发.会亲友.牧养.开池.造畜椆栖.畋猎.结网', '祈福.谢土.安葬.上梁.作灶.开市.嫁娶.出行.入宅.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171111', '1', '假日', '丁酉', '九月廿三', '10-23', '鸡', '立冬后', '六', 'Sat', '6', 'Saturday', '314', '45', '出行.纳财.开市.交易.立券.动土.移徙.入宅.裁衣.会亲友.拆卸.进人口.安香.经络.出货财.修饰垣墙.平治道涂', '造庙.谢土.作灶.作梁.伐木.安葬.行丧.修坟.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171112', '1', '假日', '丁酉', '九月廿四', '10-24', '鸡', '立冬后', '日', 'Sun', '7', 'Sunday', '315', '45', '嫁娶.纳采.订盟.祭祀.斋醮.开光.安香.出火.出行.出火.拆卸.动土.祈福.进人口.纳财.交易.立券.移徙.安床.修造.安葬.除服.成服', '置产.掘井.词讼.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171113', '0', '工作日', '丁酉', '九月廿五', '10-25', '鸡', '立冬后', '一', 'Mon', '1', 'Monday', '316', '46', '嫁娶.纳采.订盟.祭祀.开光.出行.解除.伐木.出火.入宅.移徙.拆卸.修造.栽种.安葬.入殓', '破土.动土.安门.作灶.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171114', '0', '工作日', '丁酉', '九月廿六', '10-26', '鸡', '立冬后', '二', 'Tue', '2', 'Tuesday', '317', '46', '祭祀.解除.破屋.坏垣.求医.治病.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171115', '0', '工作日', '丁酉', '九月廿七', '10-27', '鸡', '立冬后', '三', 'Wed', '3', 'Wednesday', '318', '46', '祭祀.扫舍.破土.安葬.除服.成服.启攒.移柩.入殓.立碑.余事勿取', '祭祀.嫁娶.入宅.修造.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171116', '0', '工作日', '丁酉', '九月廿八', '10-28', '鸡', '立冬后', '四', 'Thu', '4', 'Thursday', '319', '46', '订盟.纳采.会亲友.祭祀.祈福.修造.动土.安机械.破土.安葬', '嫁娶.移徙.出火.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171117', '0', '工作日', '丁酉', '九月廿九', '10-29', '鸡', '立冬后', '五', 'Fri', '5', 'Friday', '320', '46', '祭祀.沐浴.捕捉.畋猎.结网.扫舍', '嫁娶.纳采.订盟.安床.动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171118', '1', '假日', '丁酉', '十月初一', '10-1', '鸡', '立冬后', '六', 'Sat', '6', 'Saturday', '321', '46', '开市.纳财.出行.祭祀.祈福.求嗣.斋醮.问名.入学.起基.定磉.置产.开渠.掘井.拆卸.栽种.纳畜.牧养.动土.破土.启攒', '移徙.入宅.出火.入殓.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171119', '1', '假日', '丁酉', '十月初二', '10-2', '鸡', '立冬后', '日', 'Sun', '7', 'Sunday', '322', '46', '祭祀.理发.置产.塞穴.除服.成服.移柩.入殓.破土.安葬', '嫁娶.入宅.安床.掘井.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171120', '0', '工作日', '丁酉', '十月初三', '10-3', '鸡', '立冬后', '一', 'Mon', '1', 'Monday', '323', '47', '祭祀.沐浴.出行.余事勿取', '开市.动土.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171121', '0', '工作日', '丁酉', '十月初四', '10-4', '鸡', '立冬后', '二', 'Tue', '2', 'Tuesday', '324', '47', '嫁娶.造车器.出行.会亲友.移徙.入宅.修造.动土.雕刻.开光.安香.出火.理发.会亲友.造屋.合脊.起基.归岫.安门.拆卸.扫舍.栽种.造畜椆栖', '开市.纳采.造庙.安床.开渠.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171122', '0', '工作日', '丁酉', '十月初五', '10-5', '鸡', '小雪', '三', 'Wed', '3', 'Wednesday', '325', '47', '塑绘.会亲友.安机械.塞穴.结网.裁衣.经络', '嫁娶.开市.祈福.斋醮.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171123', '0', '工作日', '丁酉', '十月初六', '10-6', '鸡', '小雪后', '四', 'Thu', '4', 'Thursday', '326', '47', '纳采.移徙.纳财.开市.交易.立券.纳财.入宅.修造.动土.竖柱.起基.定磉.造庙.安香.出火.修饰垣墙.平治道涂.会亲友.出行.开池.作厕', '开仓.造屋.造桥.祭祀', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171124', '0', '工作日', '丁酉', '十月初七', '10-7', '鸡', '小雪后', '五', 'Fri', '5', 'Friday', '327', '47', '订盟.纳采.纳财.开市.立券.祭祀.祈福.移徙.入宅.出行.造屋.起基.修造.动土.竖柱.上梁.安门.安香.出火.教牛马.会亲友.破土', '嫁娶.安葬.掘井.置产.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171125', '1', '假日', '丁酉', '十月初八', '10-8', '鸡', '小雪后', '六', 'Sat', '6', 'Saturday', '328', '47', '嫁娶.订盟.纳采.祭祀.祈福.塑绘.开光.移徙.安床.伐木.作梁.捕捉.畋猎.结网.求医.治病.解除.安葬.除服.成服.移柩.入殓.立碑.谢土', '开市.造庙.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171126', '1', '假日', '丁酉', '十月初九', '10-9', '鸡', '小雪后', '日', 'Sun', '7', 'Sunday', '329', '47', '破屋.坏垣.祭祀.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171127', '0', '工作日', '丁酉', '十月初十', '10-10', '鸡', '小雪后', '一', 'Mon', '1', 'Monday', '330', '48', '嫁娶.纳采.订盟.祭祀.冠笄.裁衣.伐木.作梁.架马.定磉.开柱眼.作灶.移徙.安床.畋猎.结网.开池.作厕.除服.成服.启攒.入殓.移柩.安葬', '造屋.造船.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171128', '0', '工作日', '丁酉', '十月十一', '10-11', '鸡', '小雪后', '二', 'Tue', '2', 'Tuesday', '331', '48', '纳采.订盟.祭祀.祈福.求嗣.斋醮.开光.会亲友.解除.入学.纳财.交易.立券.经络.起基.动土.定磉.开池.栽种.纳畜.牧养.破土.入殓.立碑.安葬', '嫁娶.开市.入宅.出火.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171129', '0', '工作日', '丁酉', '十月十二', '10-12', '鸡', '小雪后', '三', 'Wed', '3', 'Wednesday', '332', '48', '捕捉.畋猎.会亲友.解除.入殓.除服.成服.移柩.余事勿取', '安床.安门.破土.修坟.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171130', '0', '工作日', '丁酉', '十月十三', '10-13', '鸡', '小雪后', '四', 'Thu', '4', 'Thursday', '333', '48', '祭祀.祈福.求嗣.斋醮.沐浴.冠笄.出行.理发.拆卸.解除.起基.动土.定磉.安碓硙.开池.掘井.扫舍.除服.成服.移柩.启攒.立碑.谢土', '移徙.入宅.安门.作梁.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171201', '0', '工作日', '丁酉', '十月十四', '10-14', '鸡', '小雪后', '五', 'Fri', '5', 'Friday', '334', '48', '嫁娶.冠笄.安床.纳采.会亲友.塞穴.捕捉.置产.造畜椆栖', '开光.掘井.安葬.谢土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171202', '1', '假日', '丁酉', '十月十五', '10-15', '鸡', '小雪后', '六', 'Sat', '6', 'Saturday', '335', '48', '祭祀.沐浴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171203', '1', '假日', '丁酉', '十月十六', '10-16', '鸡', '小雪后', '日', 'Sun', '7', 'Sunday', '336', '48', '祭祀.会亲友.嫁娶.沐浴.修造.动土.祈福.开光.塑绘.出行.订盟.纳采.裁衣.入殓.除服.成服.移柩.启攒.赴任.竖柱.上梁.纳财.扫舍.栽种.纳畜.伐木', '入宅.作灶.安床.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171204', '0', '工作日', '丁酉', '十月十七', '10-17', '鸡', '小雪后', '一', 'Mon', '1', 'Monday', '337', '49', '理发.会亲友.补垣.塞穴.结网', '嫁娶.入宅.安门.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171205', '0', '工作日', '丁酉', '十月十八', '10-18', '鸡', '小雪后', '二', 'Tue', '2', 'Tuesday', '338', '49', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.除服.成服.入殓.移柩.安葬.谢土.赴任.会亲友.进人口.出行.竖柱.上梁.经络.开市.交易.立券.纳财.开仓', '作灶.治病.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171206', '0', '工作日', '丁酉', '十月十九', '10-19', '鸡', '小雪后', '三', 'Wed', '3', 'Wednesday', '339', '49', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.入殓.移柩.安葬.谢土.赴任.进人口.会亲友', '作灶.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171207', '0', '工作日', '丁酉', '十月二十', '10-20', '鸡', '大雪', '四', 'Thu', '4', 'Thursday', '340', '49', '纳采.订盟.祭祀.祈福.开光.安香.出火.出行.会亲友.安机械.修造.动土.竖柱.上梁.造屋.起基.定磉.安床.安门.拆卸.移徙.造桥.造船.安葬.破土.入殓', '开市.造庙.置产.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171208', '0', '工作日', '丁酉', '十月廿一', '10-21', '鸡', '大雪后', '五', 'Fri', '5', 'Friday', '341', '49', '嫁娶.冠笄.祭祀.祈福.求嗣.斋醮.进人口.会亲友.伐木.作梁.开柱眼.安床.掘井.捕捉.畋猎', '开生坟.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171209', '1', '假日', '丁酉', '十月廿二', '10-22', '鸡', '大雪后', '六', 'Sat', '6', 'Saturday', '342', '49', '破屋.坏垣.治病.余事勿取', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171210', '1', '假日', '丁酉', '十月廿三', '10-23', '鸡', '大雪后', '日', 'Sun', '7', 'Sunday', '343', '49', '安床.架马.祭祀.塑绘.开光.出行.理发.伐木.作梁.开柱眼.作厕.畋猎.破土.入殓.除服.成服.移柩.启攒.修坟.立碑', '作灶.安门.造桥.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171211', '0', '工作日', '丁酉', '十月廿四', '10-24', '鸡', '大雪后', '一', 'Mon', '1', 'Monday', '344', '50', '嫁娶.祭祀.祈福.求嗣.开光.出行.解除.入宅.移徙.纳畜.入殓.破土.修坟.立碑', '伐木.作梁.动土.安床.破土.栽种.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171212', '0', '工作日', '丁酉', '十月廿五', '10-25', '鸡', '大雪后', '二', 'Tue', '2', 'Tuesday', '345', '50', '祭祀.沐浴.理发.纳财.进人口.栽种.扫舍.捕捉.畋猎.结网', '会亲友.安葬.入宅.移徙.安床.开市.行丧.出火.作灶.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171213', '0', '工作日', '丁酉', '十月廿六', '10-26', '鸡', '大雪后', '三', 'Wed', '3', 'Wednesday', '346', '50', '纳采.订盟.祭祀.祈福.求嗣.塑绘.解除.拆卸.修造.动土.竖柱.上梁.安门.置产.开池.掘井.纳畜.安床.栽种.造畜椆栖.破土.移柩.立碑', '嫁娶.开市.出火.进人口.入殓.赴任.入宅.移徙.出行.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171214', '0', '工作日', '丁酉', '十月廿七', '10-27', '鸡', '大雪后', '四', 'Thu', '4', 'Thursday', '347', '50', '入宅.移徙.出行.进人口.修造.动土.起基.上梁.安门.造仓.补垣.塞穴.造畜椆栖', '嫁娶.开市.安床.栽种.安葬.祈福.开光.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171215', '0', '工作日', '丁酉', '十月廿八', '10-28', '鸡', '大雪后', '五', 'Fri', '5', 'Friday', '348', '50', '造畜椆栖.教牛马', '入宅.移徙.分居.作灶.出火.安香.动土.嫁娶.掘井.扫舍.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171216', '1', '假日', '丁酉', '十月廿九', '10-29', '鸡', '大雪后', '六', 'Sat', '6', 'Saturday', '349', '50', '订盟.纳采.造车器.祭祀.祈福.出行.安香.修造.动土.上梁.开市.交易.立券.移徙.入宅.会亲友.安机械.栽种.纳畜.造屋.起基.安床.造畜椆栖', '破土.安葬.行丧.开生坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171217', '1', '假日', '丁酉', '十月三十', '10-30', '鸡', '大雪后', '日', 'Sun', '7', 'Sunday', '350', '50', '订盟.纳采.会亲友.安机械.开光.修造.动土.竖柱.上梁.造屋.起基.造桥.栽种.纳畜.造畜椆栖.移柩.入殓.启攒.修坟.立碑.安葬', '祈福.出火.嫁娶.入宅.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171218', '0', '工作日', '丁酉', '十一月初一', '11-1', '鸡', '大雪后', '一', 'Mon', '1', 'Monday', '351', '51', '祭祀.平治道涂.修坟.除服.成服.余事勿取', '移徙.入宅.嫁娶.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171219', '0', '工作日', '丁酉', '十一月初二', '11-2', '鸡', '大雪后', '二', 'Tue', '2', 'Tuesday', '352', '51', '嫁娶.冠笄.祭祀.祈福.求嗣.雕刻.开光.安香.出行.入学.修造.动土.竖柱.上梁.造屋.起基.安门.出火.移徙.入宅.掘井.造畜椆栖.安葬.破土.除服.成服', '开市.纳采.订盟.作灶.造庙.造船.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171220', '0', '工作日', '丁酉', '十一月初三', '11-3', '鸡', '大雪后', '三', 'Wed', '3', 'Wednesday', '353', '51', '嫁娶.订盟.纳采.祭祀.祈福.求嗣.斋醮.安香.出火.修造.起基.造屋.合脊.安门.安碓硙.动土.上梁.移徙.入宅', '出行.掘井.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171221', '0', '工作日', '丁酉', '十一月初四', '11-4', '鸡', '大雪后', '四', 'Thu', '4', 'Thursday', '354', '51', '祭祀.沐浴.破屋.坏垣.余事勿取', '嫁娶.移徙.入宅.探病.出行.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171222', '0', '工作日', '丁酉', '十一月初五', '11-5', '鸡', '冬至', '五', 'Fri', '5', 'Friday', '355', '51', '冠笄.纳财.掘井.开池.出火.安床.交易.立券.畋猎.结网.理发.放水', '安门.动土.破土.行丧.安葬.成服', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171223', '1', '假日', '丁酉', '十一月初六', '11-6', '鸡', '冬至后', '六', 'Sat', '6', 'Saturday', '356', '51', '纳采.订盟.移徙.入宅.出行.安机械.会亲友.祭祀.祈福.斋醮.开光.安香.出火.解除.求医.针灸.治病.造屋.起基.修造.安门.造船.纳畜.牧养.移柩.入殓.启攒.谢土.修坟.立碑', '嫁娶.动土.安床.造桥.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171224', '1', '假日', '丁酉', '十一月初七', '11-7', '鸡', '冬至后', '日', 'Sun', '7', 'Sunday', '357', '51', '祭祀.沐浴.作灶.纳财.捕捉.畋猎.安床.扫舍', '开市.斋醮.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171225', '0', '工作日', '丁酉', '十一月初八', '11-8', '鸡', '冬至后', '一', 'Mon', '1', 'Monday', '358', '52', '祈福.斋醮.纳采.订盟.解除.架马.开柱眼.修造.动土.起基.上梁.归岫.造屋.合脊.掘井.除服.成服.破土.栽种', '移徙.开市.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171226', '0', '工作日', '丁酉', '十一月初九', '11-9', '鸡', '冬至后', '二', 'Tue', '2', 'Tuesday', '359', '52', '纳采.订盟.祭祀.沐浴.冠笄.合帐.裁衣.修造.动土.拆卸.移徙.入宅.安门.开仓.筑堤.作厕.栽种.纳畜.补垣.塞穴', '嫁娶.祈福.开光.掘井.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171227', '0', '工作日', '丁酉', '十一月初十', '11-10', '鸡', '冬至后', '三', 'Wed', '3', 'Wednesday', '360', '52', '合帐.裁衣.教牛马.余事勿取', '入宅.动土.破土.嫁娶.作灶.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171228', '0', '工作日', '丁酉', '十一月十一', '11-11', '鸡', '冬至后', '四', 'Thu', '4', 'Thursday', '361', '52', '纳采.订盟.嫁娶.祭祀.祈福.安香.出火.出行.会亲友.经络.求医.治病.解除.拆卸.起基.修造.动土.定磉.扫舍.栽种.牧养.造畜椆栖', '斋醮.作梁.掘井.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171229', '0', '工作日', '丁酉', '十一月十二', '11-12', '鸡', '冬至后', '五', 'Fri', '5', 'Friday', '362', '52', '纳财.开市.交易.立券.会亲友.进人口.经络.祭祀.祈福.安香.出火.求医.治病.修造.动土.拆卸.扫舍.安床.栽种.牧养.开生坟.合寿木.入殓.安葬.启攒', '嫁娶.祈福.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171230', '1', '假日', '丁酉', '十一月十三', '11-13', '鸡', '冬至后', '六', 'Sat', '6', 'Saturday', '363', '52', '祭祀.入殓.移柩.余事勿取', '入宅.修造.动土.破土.安门.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20171231', '1', '假日', '丁酉', '十一月十四', '11-14', '鸡', '冬至后', '日', 'Sun', '7', 'Sunday', '364', '52', '塑绘.开光.订盟.纳采.裁衣.冠笄.拆卸.修造.安床.入宅.出火.安葬.谢土.赴任', '掘井.伐木.斋醮.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180101', '2', '节日', '丁酉', '十一月十五', '11-15', '鸡', '冬至后', '一', 'Mon', '1', 'Monday', '0', '01', '祭祀.塑绘.开光.裁衣.冠笄.嫁娶.纳采.拆卸.修造.动土.竖柱.上梁.安床.移徙.入宅.安香.结网.捕捉.畋猎.伐木.进人口.放水', '出行.安葬.修坟.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180102', '0', '工作日', '丁酉', '十一月十六', '11-16', '鸡', '冬至后', '二', 'Tue', '2', 'Tuesday', '1', '01', '祭祀.求医.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180103', '0', '工作日', '丁酉', '十一月十七', '11-17', '鸡', '冬至后', '三', 'Wed', '3', 'Wednesday', '2', '01', '祭祀.祈福.斋醮.出行.冠笄.安机械.移徙.入宅.安香.安床.除服.成服.移柩.启攒', '开光.栽种.治病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180104', '0', '工作日', '丁酉', '十一月十八', '11-18', '鸡', '冬至后', '四', 'Thu', '4', 'Thursday', '3', '01', '塑绘.斋醮.出行.拆卸.解除.修造.移徙.造船.入殓.除服.成服.移柩.启攒.修坟.立碑.谢土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180105', '0', '工作日', '丁酉', '十一月十九', '11-19', '鸡', '小寒', '五', 'Fri', '5', 'Friday', '4', '01', '祭祀.斋醮.入殓.破土.启攒.安葬.修坟.立碑.除服.成服', '嫁娶.入宅.作灶.纳采.订盟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180106', '1', '假日', '丁酉', '十一月二十', '11-20', '鸡', '小寒后', '六', 'Sat', '6', 'Saturday', '5', '01', '祭祀.斋醮.纳财.捕捉.畋猎', '嫁娶.开市.入宅.安床.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180107', '1', '假日', '丁酉', '十一月廿一', '11-21', '鸡', '小寒后', '日', 'Sun', '7', 'Sunday', '6', '01', '纳采.订盟.祭祀.祈福.求嗣.斋醮.沐浴.进人口.会亲友.入学.治病.安碓硙.掘井.开池.纳畜.牧养.造畜椆栖', '嫁娶.合帐.入宅.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180108', '0', '工作日', '丁酉', '十一月廿二', '11-22', '鸡', '小寒后', '一', 'Mon', '1', 'Monday', '7', '02', '祭祀.祈福.求嗣.沐浴.问名.交易.纳财.入殓.移柩.安葬.修坟.立碑.谢土.造畜椆栖.教牛马', '入宅.置产.嫁娶.动土.栽种.开市.开光.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180109', '0', '工作日', '丁酉', '十一月廿三', '11-23', '鸡', '小寒后', '二', 'Tue', '2', 'Tuesday', '8', '02', '祭祀.教牛马.造畜椆栖.祭祀.会亲友.解除.余事勿取', '嫁娶.入宅.出行.动土.破土.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180110', '0', '工作日', '丁酉', '十一月廿四', '11-24', '鸡', '小寒后', '三', 'Wed', '3', 'Wednesday', '9', '02', '嫁娶.开光.解除.出火.拆卸.修造.进人口.入宅.移徙.安床.栽种.入殓.修坟.动土.除服.成服', '作灶.安葬.祭祀.开市.纳采.订盟.纳畜.谢土.出行.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180111', '0', '工作日', '丁酉', '十一月廿五', '11-25', '鸡', '小寒后', '四', 'Thu', '4', 'Thursday', '10', '02', '出行.起基.安床.纳财.交易.立券.嫁娶.栽种.入殓.移柩.安葬', '挂匾.入宅.上梁.祈福.词讼.作梁.作灶.开池.安门.动土.破土.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180112', '0', '工作日', '丁酉', '十一月廿六', '11-26', '鸡', '小寒后', '五', 'Fri', '5', 'Friday', '11', '02', '平治道涂.余事勿取', '开光.嫁娶.开仓.出货财.造船.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180113', '1', '假日', '丁酉', '十一月廿七', '11-27', '鸡', '小寒后', '六', 'Sat', '6', 'Saturday', '12', '02', '嫁娶.订盟.纳采.会亲友.祭祀.安机械.移徙.入宅.造屋.安床.起基.定磉.安香.出火.挂匾.拆卸.置产', '开市.出行.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180114', '1', '假日', '丁酉', '十一月廿八', '11-28', '鸡', '小寒后', '日', 'Sun', '7', 'Sunday', '13', '02', '沐浴.捕捉.畋猎.理发.整手足甲.入殓.除服.成服.破土.安葬.谢土.立碑.修坟.启攒', '纳采.订盟.嫁娶.上梁.开市.斋醮.造屋.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180115', '0', '工作日', '丁酉', '十一月廿九', '11-29', '鸡', '小寒后', '一', 'Mon', '1', 'Monday', '14', '03', '祭祀.破屋.坏垣.余事勿取', '斋醮.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180116', '0', '工作日', '丁酉', '十一月三十', '11-30', '鸡', '小寒后', '二', 'Tue', '2', 'Tuesday', '15', '03', '沐浴.开仓.出货财.开市.交易.立券.纳财.栽种.纳畜.牧养.畋猎.入殓.破土.安葬', '祈福.嫁娶.安床.入宅.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180117', '0', '工作日', '丁酉', '腊月初一', '12-1', '鸡', '小寒后', '三', 'Wed', '3', 'Wednesday', '16', '03', '祭祀.沐浴.补垣.塞穴.断蚁.解除.余事勿取', '造庙.入宅.修造.安葬.行丧.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180118', '0', '工作日', '丁酉', '腊月初二', '12-2', '鸡', '小寒后', '四', 'Thu', '4', 'Thursday', '17', '03', '嫁娶.纳采.订盟.问名.祭祀.冠笄.裁衣.会亲友.进人口.纳财.捕捉.作灶', '开市.安床.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180119', '0', '工作日', '丁酉', '腊月初三', '12-3', '鸡', '小寒后', '五', 'Fri', '5', 'Friday', '18', '03', '订盟.纳采.会亲友.祭祀.斋醮.沐浴.塑绘.出火.开光.竖柱.上梁.开市.交易.立券.作梁.开柱眼.伐木.架马.安门.安床.拆卸.牧养.造畜椆栖.掘井', '造庙.嫁娶.出行.动土.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180120', '1', '假日', '丁酉', '腊月初四', '12-4', '鸡', '大寒', '六', 'Sat', '6', 'Saturday', '19', '03', '交易.立券.纳财.安床.裁衣.造畜椆栖.安葬.谢土.启攒.除服.成服.修坟.立碑.移柩.入殓', '开光.嫁娶.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180121', '1', '假日', '丁酉', '腊月初五', '12-5', '鸡', '大寒后', '日', 'Sun', '7', 'Sunday', '20', '03', '祭祀.解除.教牛马.会亲友.余事勿取', '破土.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180122', '0', '工作日', '丁酉', '腊月初六', '12-6', '鸡', '大寒后', '一', 'Mon', '1', 'Monday', '21', '04', '纳采.订盟.移徙.纳财.开市.交易.立券.入宅.会亲友.解除.求医.治病.入学.安床.安门.安香.出火.拆卸.扫舍.入宅.挂匾.开生坟.合寿木.破土.修坟.启攒.入殓', '探病.祭祀.出行.上梁.造屋.谢土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180123', '0', '工作日', '丁酉', '腊月初七', '12-7', '鸡', '大寒后', '二', 'Tue', '2', 'Tuesday', '22', '04', '嫁娶.订盟.纳采.祭祀.祈福.求嗣.会亲友.解除.出行.入学.纳财.开市.交易.立券.习艺.经络.安床.开仓.出货财.纳畜.安葬.启攒.修坟.入殓', '入宅.开光.开市.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180124', '0', '工作日', '丁酉', '腊月初八', '12-8', '鸡', '大寒后', '三', 'Wed', '3', 'Wednesday', '23', '04', '祭祀.冠笄.嫁娶.会亲友.进人口.裁衣.结网.平治道涂', '移徙.入宅.造庙.作灶.治病.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180125', '0', '工作日', '丁酉', '腊月初九', '12-9', '鸡', '大寒后', '四', 'Thu', '4', 'Thursday', '24', '04', '祭祀.安碓硙.结网.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180126', '0', '工作日', '丁酉', '腊月初十', '12-10', '鸡', '大寒后', '五', 'Fri', '5', 'Friday', '25', '04', '嫁娶.祭祀.沐浴.裁衣.出行.理发.移徙.捕捉.畋猎.放水.入宅.除服.成服.启攒.安葬.移柩.入殓', '造屋.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180127', '1', '假日', '丁酉', '腊月十一', '12-11', '鸡', '大寒后', '六', 'Sat', '6', 'Saturday', '26', '04', '破屋.坏垣.余事勿取', '嫁娶.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180128', '1', '假日', '丁酉', '腊月十二', '12-12', '鸡', '大寒后', '日', 'Sun', '7', 'Sunday', '27', '04', '纳采.订盟.祭祀.求嗣.出火.塑绘.裁衣.会亲友.入学.拆卸.扫舍.造仓.挂匾.掘井.开池.结网.栽种.纳畜.破土.修坟.立碑.安葬.入殓', '祈福.嫁娶.造庙.安床.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180129', '0', '工作日', '丁酉', '腊月十三', '12-13', '鸡', '大寒后', '一', 'Mon', '1', 'Monday', '28', '05', '入殓.除服.成服.移柩.启攒.安葬.修坟.立碑', '开市.伐木.嫁娶.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180130', '0', '工作日', '丁酉', '腊月十四', '12-14', '鸡', '大寒后', '二', 'Tue', '2', 'Tuesday', '29', '05', '祭祀.作灶.入殓.除服.余事勿取', '开市.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180131', '0', '工作日', '丁酉', '腊月十五', '12-15', '鸡', '大寒后', '三', 'Wed', '3', 'Wednesday', '30', '05', '塑绘.开光.沐浴.冠笄.会亲友.作灶.放水.造畜椆栖', '嫁娶.入殓.安葬.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180201', '0', '工作日', '丁酉', '腊月十六', '12-16', '鸡', '大寒后', '四', 'Thu', '4', 'Thursday', '31', '05', '祭祀.沐浴.祈福.斋醮.订盟.纳采.裁衣.拆卸.起基.竖柱.上梁.安床.入殓.除服.成服.移柩.启攒.挂匾.求嗣.出行.合帐.造畜椆栖', '开仓.嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180202', '0', '工作日', '丁酉', '腊月十七', '12-17', '鸡', '大寒后', '五', 'Fri', '5', 'Friday', '32', '05', '祭祀.解除.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180203', '1', '假日', '丁酉', '腊月十八', '12-18', '鸡', '大寒后', '六', 'Sat', '6', 'Saturday', '33', '05', '沐浴.解除.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.移徙.入宅.除服.成服.移柩.破土.启攒.安葬.扫舍.修坟.伐木.纳财.交易.立券', '作灶.祭祀.上梁.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180204', '1', '假日', '丁酉', '腊月十九', '12-19', '鸡', '立春', '日', 'Sun', '7', 'Sunday', '34', '05', '祭祀.祈福.求嗣.开光.嫁娶.出行.解除.伐木.拆卸.进人口.安床.动土.起基.上梁.栽种.纳畜.破土.谢土.启攒.安葬', '移徙.入宅.出火.作灶.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180205', '0', '工作日', '丁酉', '腊月二十', '12-20', '鸡', '立春后', '一', 'Mon', '1', 'Monday', '35', '06', '会亲友.冠笄.安床.会亲友.安机械.祭祀.祈福.求嗣.经络', '嫁娶.开市.动土.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180206', '0', '工作日', '丁酉', '腊月廿一', '12-21', '鸡', '立春后', '二', 'Tue', '2', 'Tuesday', '36', '06', '作灶.解除.平治道涂.余事勿取', '祭祀.祈福.安葬.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180207', '0', '工作日', '丁酉', '腊月廿二', '12-22', '鸡', '立春后', '三', 'Wed', '3', 'Wednesday', '37', '06', '嫁娶.祭祀.冠笄.修饰垣墙.置产', '经络.探病.造屋.作灶.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180208', '0', '工作日', '丁酉', '腊月廿三', '12-23', '鸡', '立春后', '四', 'Thu', '4', 'Thursday', '38', '06', '纳采.嫁娶.祭祀.祈福.出行.修造.动土.移徙.入宅.安葬.破土', '开市.入宅.斋醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180209', '0', '工作日', '丁酉', '腊月廿四', '12-24', '鸡', '立春后', '五', 'Fri', '5', 'Friday', '39', '06', '祭祀.沐浴.解除.理发.扫舍.破屋.坏垣.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180210', '1', '假日', '丁酉', '腊月廿五', '12-25', '鸡', '立春后', '六', 'Sat', '6', 'Saturday', '40', '06', '纳采.订盟.祭祀.祈福.安香.出火.修造.出行.开市.移徙.入宅.动土.安葬.破土', '安床.作灶.造船.会亲友', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180211', '0', '工作日', '丁酉', '腊月廿六', '12-26', '鸡', '立春后', '日', 'Sun', '7', 'Sunday', '41', '06', '塞穴.结网.取渔.畋猎', '嫁娶.安门.移徙.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180212', '0', '工作日', '丁酉', '腊月廿七', '12-27', '鸡', '立春后', '一', 'Mon', '1', 'Monday', '42', '07', '纳采.祭祀.祈福.出行.会亲友.修造.动土.移徙.入宅', '嫁娶.开市.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180213', '0', '工作日', '丁酉', '腊月廿八', '12-28', '鸡', '立春后', '二', 'Tue', '2', 'Tuesday', '43', '07', '纳采.嫁娶.祭祀.祈福.出行.开市.会亲友.动土.破土.启攒', '移徙.入宅.出火.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180214', '0', '工作日', '丁酉', '腊月廿九', '12-29', '鸡', '立春后', '三', 'Wed', '3', 'Wednesday', '44', '07', '祭祀.祈福.求嗣.斋醮.入殓.除服.成服.移柩.安葬.启攒', '嫁娶.动土.开光.造屋.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180215', '1', '假日', '丁酉', '腊月三十', '12-30', '鸡', '立春后', '四', 'Thu', '4', 'Thursday', '45', '07', '纳采.会亲友.竖柱.上梁.立券.入殓.移柩.安葬.启攒', '祭祀.移徙.入宅.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180216', '2', '节日', '戊戌', '正月初一', '1-1', '狗', '立春后', '五', 'Fri', '5', 'Friday', '46', '07', '祭祀.祈福.斋醮.出行.开市.立券.动土.移徙.入宅.破土.安葬', '开光.嫁娶.作灶.掘井.纳畜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180217', '2', '节日', '戊戌', '正月初二', '1-2', '狗', '立春后', '六', 'Sat', '6', 'Saturday', '47', '07', '会亲友.求嗣.理发.冠笄.结网.捕捉.开光.理发', '开市.动土.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180218', '2', '节日', '戊戌', '正月初三', '1-3', '狗', '立春后', '日', 'Sun', '7', 'Sunday', '48', '07', '祭祀.平治道涂.余事勿取', '嫁娶.祈福.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180219', '1', '假日', '戊戌', '正月初四', '1-4', '狗', '雨水', '一', 'Mon', '1', 'Monday', '49', '08', '祈福.求嗣.斋醮.纳采.嫁娶.伐木.修造.动土.移徙.入宅.造庙.安机械.开市.入殓.除服.成服.移柩.安葬.破土.谢土', '置产.造屋.合脊.开光.探病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180220', '1', '假日', '戊戌', '正月初五', '1-5', '狗', '雨水后', '二', 'Tue', '2', 'Tuesday', '50', '08', '入学.习艺.出行.纳采.订盟.嫁娶.会亲友.进人口.牧养.捕捉.入殓.移柩.安葬.启攒', '开光.开市.入宅.动土.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180221', '1', '假日', '戊戌', '正月初六', '1-6', '狗', '雨水后', '三', 'Wed', '3', 'Wednesday', '51', '08', '祭祀.沐浴.求医.治病.扫舍.破屋.坏垣.解除.余事勿取', '入宅.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180222', '0', '工作日', '戊戌', '正月初七', '1-7', '狗', '雨水后', '四', 'Thu', '4', 'Thursday', '52', '08', '祭祀.冠笄.嫁娶.拆卸.修造.动土.起基.上梁.造屋.入宅.开市.开池.塞穴.入殓.除服.成服.移柩.安葬.破土', '安床.栽种.治病.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180223', '0', '工作日', '戊戌', '正月初八', '1-8', '狗', '雨水后', '五', 'Fri', '5', 'Friday', '53', '08', '祭祀.结网.入殓.除服.成服.移柩.安葬.破土', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180224', '0', '工作日', '戊戌', '正月初九', '1-9', '狗', '雨水后', '六', 'Sat', '6', 'Saturday', '54', '08', '塑绘.开光.祈福.求嗣.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.起基.安门.安床.移徙.造仓.结网.纳畜', '伐木.作灶.安葬.取渔.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180225', '1', '假日', '戊戌', '正月初十', '1-10', '狗', '雨水后', '日', 'Sun', '7', 'Sunday', '55', '08', '祭祀.沐浴.开光.塑绘.祈福.求嗣.订盟.纳采.冠笄.裁衣.嫁娶.动土.除服.成服.移柩.破土.启攒.出行.安碓硙.放水.开市.立券.交易', '安葬.上梁.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180226', '0', '工作日', '戊戌', '正月十一', '1-11', '狗', '雨水后', '一', 'Mon', '1', 'Monday', '56', '09', '祭祀.祈福.求嗣.酬神.裁衣.安床.立券.交易.入殓.除服.成服.移柩.谢土.启攒', '出行.嫁娶.入宅.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180227', '0', '工作日', '戊戌', '正月十二', '1-12', '狗', '雨水后', '二', 'Tue', '2', 'Tuesday', '57', '09', '裁衣.合帐.入殓.除服.成服.会亲友.纳财', '祭祀.祈福.移徙.嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180228', '0', '工作日', '戊戌', '正月十三', '1-13', '狗', '雨水后', '三', 'Wed', '3', 'Wednesday', '58', '09', '祭祀.斋醮.裁衣.合帐.冠笄.订盟.纳采.嫁娶.入宅.安香.谢土.入殓.移柩.破土.立碑.安香.会亲友.出行.祈福.求嗣.立碑.上梁.放水', '掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180301', '0', '工作日', '戊戌', '正月十四', '1-14', '狗', '雨水后', '四', 'Thu', '4', 'Thursday', '59', '09', '安床.合帐.入宅.问名.纳采.求嗣.祭祀.开仓', '斋醮.作灶.安床.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180302', '0', '工作日', '戊戌', '正月十五', '1-15', '狗', '雨水后', '五', 'Fri', '5', 'Friday', '60', '09', '作灶.平治道涂', '祭祀.祈福.安葬.安门.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180303', '1', '假日', '戊戌', '正月十六', '1-16', '狗', '雨水后', '六', 'Sat', '6', 'Saturday', '61', '09', '塑绘.开光.酬神.斋醮.订盟.纳采.裁衣.合帐.拆卸.动土.上梁.安床.安香.造庙.挂匾.会亲友.进人口.出行.修造.纳财.伐木.放水.出火.纳畜.沐浴.安门', '造屋.栽种.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180304', '1', '假日', '戊戌', '正月十七', '1-17', '狗', '雨水后', '日', 'Sun', '7', 'Sunday', '62', '09', '祭祀.祈福.酬神.订盟.纳采.冠笄.裁衣.合帐.嫁娶.安床.移徙.入宅.安香.入殓.移柩.启攒.安葬.解除.取渔.捕捉.伐木.安门.出火', '栽种.动土.开市.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180305', '0', '工作日', '戊戌', '正月十八', '1-18', '狗', '惊蛰', '一', 'Mon', '1', 'Monday', '63', '10', '嫁娶.开光.祭祀.祈福.求嗣.出行.出火.入宅.移徙.解除.栽种.伐木.破土.谢土.安葬', '开市.交易.作灶.纳财.上梁.安床.造屋.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180306', '0', '工作日', '戊戌', '正月十九', '1-19', '狗', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '64', '10', '破屋.坏垣.求医.治病.余事勿取', '开光.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180307', '0', '工作日', '戊戌', '正月二十', '1-20', '狗', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '65', '10', '纳采.交易.立券.安床.安机械.安葬.移柩.动土.破土.立碑', '嫁娶.开光.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180308', '0', '工作日', '戊戌', '正月廿一', '1-21', '狗', '惊蛰后', '四', 'Thu', '4', 'Thursday', '66', '10', '祭祀.祈福.求嗣.斋醮.沐浴.开光.理发.经络.解除.治病.治病.立碑.栽种.牧养.掘井.开池', '嫁娶.定磉.合寿木.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180309', '0', '工作日', '戊戌', '正月廿二', '1-22', '狗', '惊蛰后', '五', 'Fri', '5', 'Friday', '67', '10', '纳财.交易.立券.栽种.捕捉.结网.取渔.进人口.教牛马.理发', '入宅.造屋.竖柱.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180310', '1', '假日', '戊戌', '正月廿三', '1-23', '狗', '惊蛰后', '六', 'Sat', '6', 'Saturday', '68', '10', '嫁娶.订盟.纳采.祭祀.祈福.出行.修造.动土.移徙.入宅.破土.出火.安门.安床.上梁.立碑.移柩', '开市.交易.合帐.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180311', '1', '假日', '戊戌', '正月廿四', '1-24', '狗', '惊蛰后', '日', 'Sun', '7', 'Sunday', '69', '10', '冠笄.立券.交易.修造.动土.安机械.入殓.安葬.破土', '嫁娶.祈福.出火.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180312', '0', '工作日', '戊戌', '正月廿五', '1-25', '狗', '惊蛰后', '一', 'Mon', '1', 'Monday', '70', '11', '祭祀.会亲友.出行.立券.交易.冠笄.纳财', '嫁娶.动土.掘井.起基.定磉.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180313', '0', '工作日', '戊戌', '正月廿六', '1-26', '狗', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '71', '11', '祭祀.沐浴.解除.扫舍.塞穴.牧养', '嫁娶.安葬.行丧.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180314', '0', '工作日', '戊戌', '正月廿七', '1-27', '狗', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '72', '11', '纳财.开市.交易.立券.开光.针灸.会亲友.理发.安床.造仓.结网', '移徙.入宅.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180315', '0', '工作日', '戊戌', '正月廿八', '1-28', '狗', '惊蛰后', '四', 'Thu', '4', 'Thursday', '73', '11', '嫁娶.冠笄.会亲友.安机械.纳财.交易.立券.置产', '开市.造屋.治病.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180316', '0', '工作日', '戊戌', '正月廿九', '1-29', '狗', '惊蛰后', '五', 'Fri', '5', 'Friday', '74', '11', '嫁娶.造车器.纳采.订盟.祭祀.祈福.安机械.移徙.入宅.开市.立券.破土.安葬', '纳畜.理发.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180317', '1', '假日', '戊戌', '二月初一', '2-1', '狗', '惊蛰后', '六', 'Sat', '6', 'Saturday', '75', '11', '祈福.斋醮.出行.移徙.入宅.修造.动土.破土.安葬', '纳采.开光.安床.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180318', '1', '假日', '戊戌', '二月初二', '2-2', '狗', '惊蛰后', '日', 'Sun', '7', 'Sunday', '76', '11', '破屋.坏垣.余事勿取', '嫁娶.移徙.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180319', '0', '工作日', '戊戌', '二月初三', '2-3', '狗', '惊蛰后', '一', 'Mon', '1', 'Monday', '77', '12', '嫁娶.冠笄.祭祀.出行.会亲友.修造.动土.入殓.破土', '塑绘.开光.造桥.除服.成服', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180320', '0', '工作日', '戊戌', '二月初四', '2-4', '狗', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '78', '12', '开光.求嗣.出行.纳采.冠笄.出火.拆卸.起基.修造.动土.上梁.移徙.造船.开市.交易.立券.纳财', '祈福.嫁娶.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180321', '0', '工作日', '戊戌', '二月初五', '2-5', '狗', '春分', '三', 'Wed', '3', 'Wednesday', '79', '12', '理发.冠笄.嫁娶.进人口.栽种.捕捉.针灸', '纳财.开市.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180322', '0', '工作日', '戊戌', '二月初六', '2-6', '狗', '春分后', '四', 'Thu', '4', 'Thursday', '80', '12', '开光.祈福.求嗣.出行.解除.伐木.造屋.起基.修造.架马.安门.移徙.入宅.造庙.除服.成服.移柩.谢土.纳畜.牧养', '纳采.动土.开市.交易.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180323', '0', '工作日', '戊戌', '二月初七', '2-7', '狗', '春分后', '五', 'Fri', '5', 'Friday', '81', '12', '裁衣.经络.伐木.开柱眼.拆卸.修造.动土.上梁.合脊.合寿木.入殓.除服.成服.移柩.破土.安葬.启攒.修坟.立碑', '祭祀.嫁娶.出行.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180324', '1', '假日', '戊戌', '二月初八', '2-8', '狗', '春分后', '六', 'Sat', '6', 'Saturday', '82', '12', '祭祀.会亲友.立券.交易.裁衣.合帐.嫁娶.冠笄.进人口', '栽种.动土.安葬.掘井.修坟.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180325', '1', '假日', '戊戌', '二月初九', '2-9', '狗', '春分后', '日', 'Sun', '7', 'Sunday', '83', '12', '扫舍.塞穴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180326', '0', '工作日', '戊戌', '二月初十', '2-10', '狗', '春分后', '一', 'Mon', '1', 'Monday', '84', '13', '塑绘.开光.订盟.纳采.裁衣.合帐.冠笄.安机械.会亲友.纳财.开市.立券.交易.安床.竖柱.上梁.结网.栽种.解除.经络', '作灶.出行.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180327', '0', '工作日', '戊戌', '二月十一', '2-11', '狗', '春分后', '二', 'Tue', '2', 'Tuesday', '85', '13', '祭祀.嫁娶.纳婿.除服.成服.入殓.移柩', '动土.作灶.入宅.开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180328', '0', '工作日', '戊戌', '二月十二', '2-12', '狗', '春分后', '三', 'Wed', '3', 'Wednesday', '86', '13', '祈福.求嗣.开光.塑绘.斋醮.订盟.纳采.嫁娶.拆卸.安床.入宅.安香.移柩.修坟.安葬.谢土.栽种.解除.冠笄.裁衣.移徙.修造.动土.竖柱.放水.启攒.立碑', '赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180329', '0', '工作日', '戊戌', '二月十三', '2-13', '狗', '春分后', '四', 'Thu', '4', 'Thursday', '87', '13', '祭祀.解除.入殓.除服.成服.移柩.启攒.安葬.修坟.立碑.谢土.沐浴.扫舍.捕捉.取渔.结网.畋猎.理发', '安床.嫁娶.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180330', '0', '工作日', '戊戌', '二月十四', '2-14', '狗', '春分后', '五', 'Fri', '5', 'Friday', '88', '13', '破屋.坏垣', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180331', '1', '假日', '戊戌', '二月十五', '2-15', '狗', '春分后', '六', 'Sat', '6', 'Saturday', '89', '13', '祭祀.出行.订盟.纳采.裁衣.合帐.冠笄.进人口.动土.安床.作灶.入殓.移柩.安葬.破土.结网.取渔.畋猎', '作梁.造庙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180401', '1', '假日', '戊戌', '二月十六', '2-16', '狗', '春分后', '日', 'Sun', '7', 'Sunday', '90', '13', '祭祀.开光.塑绘.订盟.纳采.合帐.冠笄.拆卸.动土.起基.上梁.入宅.安香.开市.立券.纳财.沐浴.求嗣.出火.竖柱.安门', '造庙.嫁娶.伐木.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180402', '0', '工作日', '戊戌', '二月十七', '2-17', '狗', '春分后', '一', 'Mon', '1', 'Monday', '91', '14', '祭祀.沐浴.捕捉.栽种', '嫁娶.入宅.移徙.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180403', '0', '工作日', '戊戌', '二月十八', '2-18', '狗', '春分后', '二', 'Tue', '2', 'Tuesday', '92', '14', '祭祀.开光.塑绘.酬神.斋醮.订盟.纳采.嫁娶.裁衣.动土.起基.出火.拆卸.移徙.入宅.安香.修造.竖柱.上梁.纳畜.牧养.祈福.求嗣.解除.伐木.定磉.造屋.安门', '栽种.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180404', '0', '工作日', '戊戌', '二月十九', '2-19', '狗', '春分后', '三', 'Wed', '3', 'Wednesday', '93', '14', '订盟.纳采.冠笄.拆卸.修造.动土.安床.入殓.除服.成服.移柩.安葬.破土.启攒.造仓', '作灶.开光.嫁娶.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180405', '2', '节日', '戊戌', '二月二十', '2-20', '狗', '清明', '四', 'Thu', '4', 'Thursday', '94', '14', '祭祀.出行.修造.动土.合帐.造畜椆栖.安床.移徙.入殓.移柩.破土.启攒.安葬.开生坟.合寿木.补垣.塞穴', '移徙.入宅.作灶.理发.开光.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180406', '1', '假日', '戊戌', '二月廿一', '2-21', '狗', '清明后', '五', 'Fri', '5', 'Friday', '95', '14', '祭祀.修饰垣墙.余事勿取', '开光.修造.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180407', '1', '假日', '戊戌', '二月廿二', '2-22', '狗', '清明后', '六', 'Sat', '6', 'Saturday', '96', '14', '嫁娶.祭祀.祈福.求嗣.斋醮.开光.出火.移徙.入宅.竖柱.上梁.会亲友.造屋.起基.治病.治病.安门.造车器.掘井.开池', '纳采.出行.修坟.安葬.开市.立券.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180408', '0', '工作日', '戊戌', '二月廿三', '2-23', '狗', '清明后', '日', 'Sun', '7', 'Sunday', '97', '14', '祭祀.塑绘.开光.纳采.嫁娶.开市.出行.会亲友.安床.结网.除服.成服.启攒.安葬.移柩', '祈福.入宅.造屋.动土.破土.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180409', '0', '工作日', '戊戌', '二月廿四', '2-24', '狗', '清明后', '一', 'Mon', '1', 'Monday', '98', '15', '祭祀.作灶.平治道涂.余事勿取', '安床.入宅.安碓硙.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180410', '0', '工作日', '戊戌', '二月廿五', '2-25', '狗', '清明后', '二', 'Tue', '2', 'Tuesday', '99', '15', '祭祀.祈福.求嗣.斋醮.沐浴.纳畜.入殓.破土.安葬', '移徙.入宅.嫁娶.出行.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180411', '0', '工作日', '戊戌', '二月廿六', '2-26', '狗', '清明后', '三', 'Wed', '3', 'Wednesday', '100', '15', '纳采.祭祀.祈福.求嗣.斋醮.出行.起基.造屋.定磉.安门.入殓.安葬', '嫁娶.开市.纳财.出火', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180412', '0', '工作日', '戊戌', '二月廿七', '2-27', '狗', '清明后', '四', 'Thu', '4', 'Thursday', '101', '15', '祭祀.沐浴.解除.求医.治病.破屋.坏垣.余事勿取', '祈福.斋醮.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180413', '0', '工作日', '戊戌', '二月廿八', '2-28', '狗', '清明后', '五', 'Fri', '5', 'Friday', '102', '15', '沐浴.捕捉.畋猎.结网.取渔', '祭祀.嫁娶.入宅.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180414', '1', '假日', '戊戌', '二月廿九', '2-29', '狗', '清明后', '六', 'Sat', '6', 'Saturday', '103', '15', '祭祀.祈福.求嗣.斋醮.纳采.订盟.开光.竖柱.上梁.开仓.出货财.造屋.起基.定磉.安门.诸事不宜.破土.入殓.启攒.谢土', '出火.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180415', '1', '假日', '戊戌', '二月三十', '2-30', '狗', '清明后', '日', 'Sun', '7', 'Sunday', '104', '15', '祭祀.捕捉.解除.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180416', '0', '工作日', '戊戌', '三月初一', '3-1', '狗', '清明后', '一', 'Mon', '1', 'Monday', '105', '16', '纳采.嫁娶.出行.开市.立券.纳畜.牧养.出火.移徙.入宅', '祈福.动土.破土.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180417', '0', '工作日', '戊戌', '三月初二', '3-2', '狗', '清明后', '二', 'Tue', '2', 'Tuesday', '106', '16', '祭祀.祈福.求嗣.斋醮.冠笄.作灶.纳财.交易', '开光.嫁娶.掘井.安葬.安门.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180418', '0', '工作日', '戊戌', '三月初三', '3-3', '狗', '清明后', '三', 'Wed', '3', 'Wednesday', '107', '16', '祭祀.解除.教牛马.出行.余事勿取', '动土.破土.行丧.开光.作梁.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180419', '0', '工作日', '戊戌', '三月初四', '3-4', '狗', '清明后', '四', 'Thu', '4', 'Thursday', '108', '16', '沐浴.斋醮.解除.求医.治病.会亲友.造畜椆栖.栽种.理发.扫舍', '开市.嫁娶.移徙.入宅.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180420', '0', '工作日', '戊戌', '三月初五', '3-5', '狗', '谷雨', '五', 'Fri', '5', 'Friday', '109', '16', '求嗣.出行.解除.订盟.纳采.嫁娶.会亲友.进人口.安床.开市.交易.纳畜.牧养.入殓.除服.成服.移柩.安葬.启攒', '祈福.开市.修造.动土.破土.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180421', '1', '假日', '戊戌', '三月初六', '3-6', '狗', '谷雨后', '六', 'Sat', '6', 'Saturday', '110', '16', '祭祀.作灶.平治道涂.余事勿取', '嫁娶.安葬.动土.安床.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180422', '1', '假日', '戊戌', '三月初七', '3-7', '狗', '谷雨后', '日', 'Sun', '7', 'Sunday', '111', '16', '造车器.祭祀.祈福.求嗣.斋醮.开市.交易.安机械.雕刻.开光.造屋.合脊.起基.定磉.安门.纳畜.安葬.开生坟.立碑.谢土.斋醮', '入宅.动土.开仓.出货财', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180423', '0', '工作日', '戊戌', '三月初八', '3-8', '狗', '谷雨后', '一', 'Mon', '1', 'Monday', '112', '17', '祭祀.祈福.开光.求嗣.斋醮.纳采.订盟.求医.治病.起基.定磉.造船.取渔.解除.安葬.启攒.谢土.入殓', '开市.动土.掘井.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180424', '0', '工作日', '戊戌', '三月初九', '3-9', '狗', '谷雨后', '二', 'Tue', '2', 'Tuesday', '113', '17', '祭祀.沐浴.破屋.坏垣.求医.治病.解除.余事勿取', '嫁娶.开市.交易.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180425', '0', '工作日', '戊戌', '三月初十', '3-10', '狗', '谷雨后', '三', 'Wed', '3', 'Wednesday', '114', '17', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180426', '0', '工作日', '戊戌', '三月十一', '3-11', '狗', '谷雨后', '四', 'Thu', '4', 'Thursday', '115', '17', '祭祀.塑绘.开光.订盟.纳采.冠笄.裁衣.安机械.拆卸.修造.动土.安床.经络.开市', '出火.入宅.安葬.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180427', '0', '工作日', '戊戌', '三月十二', '3-12', '狗', '谷雨后', '五', 'Fri', '5', 'Friday', '116', '17', '祭祀.余事勿取', '造庙.嫁娶.安床.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180428', '0', '工作日', '戊戌', '三月十三', '3-13', '狗', '谷雨后', '六', 'Sat', '6', 'Saturday', '117', '17', '订盟.纳采.嫁娶.进人口.会亲友.交易.立券.动土.除服.谢土.移柩.破土.启攒.赴任.出行.开市.纳财.栽种', '入殓.安葬.入宅.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180429', '1', '假日', '戊戌', '三月十四', '3-14', '狗', '谷雨后', '日', 'Sun', '7', 'Sunday', '118', '17', '祭祀.祈福.裁衣.合帐.安床.入殓.除服.成服.移柩.破土.启攒.安葬.谢土.立碑.造畜椆栖', '掘井.安门.嫁娶.纳采', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180430', '1', '假日', '戊戌', '三月十五', '3-15', '狗', '谷雨后', '一', 'Mon', '1', 'Monday', '119', '18', '祭祀.进人口.嫁娶.安床.解除.冠笄.出行.裁衣.扫舍', '掘井.动土.破土.安葬.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180501', '2', '节日', '戊戌', '三月十六', '3-16', '狗', '谷雨后', '二', 'Tue', '2', 'Tuesday', '120', '18', '纳采.开光.求医.治病.动土.上梁.移徙.入宅', '嫁娶.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180502', '0', '工作日', '戊戌', '三月十七', '3-17', '狗', '谷雨后', '三', 'Wed', '3', 'Wednesday', '121', '18', '祭祀.会亲友.开市.安床.启攒.安葬', '嫁娶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180503', '0', '工作日', '戊戌', '三月十八', '3-18', '狗', '谷雨后', '四', 'Thu', '4', 'Thursday', '122', '18', '祭祀.作灶.掘井.平治道涂', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180504', '0', '工作日', '戊戌', '三月十九', '3-19', '狗', '谷雨后', '五', 'Fri', '5', 'Friday', '123', '18', '祭祀.斋醮.开市.动土.入殓.破土.安葬', '嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180505', '1', '假日', '戊戌', '三月二十', '3-20', '狗', '立夏', '六', 'Sat', '6', 'Saturday', '124', '18', '开市.交易.立券.挂匾.祭祀.祈福.斋醮.出行.开市.交易.立券.造屋.起基.修造.动土.定磉.安床.安机械.安葬.破土.启攒.除服.成服.立碑', '作灶.嫁娶.移徙.入宅.理发', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180506', '1', '假日', '戊戌', '三月廿一', '3-21', '狗', '立夏后', '日', 'Sun', '7', 'Sunday', '125', '18', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.开光.出火.出行.拆卸.动土.修造.进人口.入宅.移徙.安床.解除.挂匾.栽种.破土.谢土.入殓.移柩.安葬', '开市.立券.造船.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180507', '0', '工作日', '戊戌', '三月廿二', '3-22', '狗', '立夏后', '一', 'Mon', '1', 'Monday', '126', '19', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '开光.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180508', '0', '工作日', '戊戌', '三月廿三', '3-23', '狗', '立夏后', '二', 'Tue', '2', 'Tuesday', '127', '19', '订盟.纳采.嫁娶.解除.祭祀.祈福.求嗣.开光.出行.解除.出火.拆卸.入宅.移徙.安床.栽种.纳畜.动土.破土.谢土.安葬.修坟', '作灶.开市.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180509', '0', '工作日', '戊戌', '三月廿四', '3-24', '狗', '立夏后', '三', 'Wed', '3', 'Wednesday', '128', '19', '祭祀.祈福.求嗣.开光.订盟.纳采.解除.动土.起基.进人口.开市.交易.立券.纳财.造仓.开池.栽种.纳畜.破土.安葬', '安床.上梁.裁衣.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180510', '0', '工作日', '戊戌', '三月廿五', '3-25', '狗', '立夏后', '四', 'Thu', '4', 'Thursday', '129', '19', '祭祀.结网.捕捉.余事勿取', '探病.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180511', '0', '工作日', '戊戌', '三月廿六', '3-26', '狗', '立夏后', '五', 'Fri', '5', 'Friday', '130', '19', '祭祀.祈福.求嗣.开光.纳采.订盟.嫁娶.出行.动土.破土.会亲友.开市.交易.立券.习艺.拆卸.起基.安碓硙.放水.开池.造仓.开渠.栽种.谢土.启攒.修坟.立碑', '入宅.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180512', '1', '假日', '戊戌', '三月廿七', '3-27', '狗', '立夏后', '六', 'Sat', '6', 'Saturday', '131', '19', '嫁娶.冠笄.祭祀.出行.移徙.入宅.作灶.造车器.补垣.塞穴.作厕.破土.启攒.除服.成服.入殓', '入宅.造屋.造桥.安门.安葬.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180513', '1', '假日', '戊戌', '三月廿八', '3-28', '狗', '立夏后', '日', 'Sun', '7', 'Sunday', '132', '19', '祭祀.解除.断蚁.会亲友.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180514', '0', '工作日', '戊戌', '三月廿九', '3-29', '狗', '立夏后', '一', 'Mon', '1', 'Monday', '133', '20', '嫁娶.纳采.订盟.祭祀.祈福.治病.造车器.修造.动土.移徙.入宅', '开市.出行.安床.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180515', '0', '工作日', '戊戌', '四月初一', '4-1', '狗', '立夏后', '二', 'Tue', '2', 'Tuesday', '134', '20', '嫁娶.纳采.订盟.会亲友.安机械.结网.冠笄.祭祀.求嗣.进人口.经络', '开市.作灶.动土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180516', '0', '工作日', '戊戌', '四月初二', '4-2', '狗', '立夏后', '三', 'Wed', '3', 'Wednesday', '135', '20', '祭祀.沐浴.移徙.破土.安葬.扫舍.平治道涂', '祈福.嫁娶.入宅.安床.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180517', '0', '工作日', '戊戌', '四月初三', '4-3', '狗', '立夏后', '四', 'Thu', '4', 'Thursday', '136', '20', '祭祀.祈福.斋醮.求嗣.安机械.纳畜.移徙.入宅.安机械.塑绘.开光.起基.竖柱.上梁.作灶.安门.安香.出火.造屋.启攒.安葬', '动土.破土.嫁娶.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180518', '0', '工作日', '戊戌', '四月初四', '4-4', '狗', '立夏后', '五', 'Fri', '5', 'Friday', '137', '20', '嫁娶.纳采.订盟.斋醮.开光.祭祀.祈福.求医.治病.会亲友.动土.解除.捕捉.纳畜.牧养.入殓.破土.安葬', '移徙.入宅.造屋.架马', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180519', '1', '假日', '戊戌', '四月初五', '4-5', '狗', '立夏后', '六', 'Sat', '6', 'Saturday', '138', '20', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180520', '1', '假日', '戊戌', '四月初六', '4-6', '狗', '立夏后', '日', 'Sun', '7', 'Sunday', '139', '20', '沐浴.扫舍.余事勿取', '斋醮.开市.嫁娶.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180521', '0', '工作日', '戊戌', '四月初七', '4-7', '狗', '小满', '一', 'Mon', '1', 'Monday', '140', '21', '开市.交易.立券.安机械.会亲友.开光.求医.治病.造屋.起基.修造.动土.定磉.竖柱.上梁.安门.作灶.放水.作厕.开池.栽种.牧养.造畜椆栖.破土.安葬.立碑', '嫁娶.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180522', '0', '工作日', '戊戌', '四月初八', '4-8', '狗', '小满后', '二', 'Tue', '2', 'Tuesday', '141', '21', '栽种.捕捉.畋猎.余事勿取', '开市.动土.祭祀.斋醮.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180523', '0', '工作日', '戊戌', '四月初九', '4-9', '狗', '小满后', '三', 'Wed', '3', 'Wednesday', '142', '21', '嫁娶.祭祀.祈福.求嗣.斋醮.订盟.纳采.解除.出行.动土.破土.习艺.针灸.理发.会亲友.起基.修造.动土.竖柱.定磉.安床.拆卸.纳畜.牧养.放水.破土.除服.成服.修坟.立碑', '开市.入宅.探病.出火.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180524', '0', '工作日', '戊戌', '四月初十', '4-10', '狗', '小满后', '四', 'Thu', '4', 'Thursday', '143', '21', '余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180525', '0', '工作日', '戊戌', '四月十一', '4-11', '狗', '小满后', '五', 'Fri', '5', 'Friday', '144', '21', '塞穴.断蚁.结网.余事勿取', '破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180526', '1', '假日', '戊戌', '四月十二', '4-12', '狗', '小满后', '六', 'Sat', '6', 'Saturday', '145', '21', '开光.出行.纳采.嫁娶.伐木.架马.出火.拆卸.移徙.入宅.造庙.造桥.造船.造畜椆栖.开市.入殓.除服.成服.移柩.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180527', '1', '假日', '戊戌', '四月十三', '4-13', '狗', '小满后', '日', 'Sun', '7', 'Sunday', '146', '21', '进人口.牧养.置产.塞穴.结网.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180528', '0', '工作日', '戊戌', '四月十四', '4-14', '狗', '小满后', '一', 'Mon', '1', 'Monday', '147', '22', '开光.出行.嫁娶', '会亲友.进人口.修造.动土.起基.移徙.开市.纳畜.入殓.除服.成服.移柩.破土.安葬.修坟.立碑.会亲友', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180529', '0', '工作日', '戊戌', '四月十五', '4-15', '狗', '小满后', '二', 'Tue', '2', 'Tuesday', '148', '22', '嫁娶.纳采.出行.祭祀.祈福.开市.动土.移徙.入宅.破土.安葬', '安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180530', '0', '工作日', '戊戌', '四月十六', '4-16', '狗', '小满后', '三', 'Wed', '3', 'Wednesday', '149', '22', '嫁娶.纳采.求医.治病.修造.动土.移徙.入宅.破土.安葬', '开市.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180531', '0', '工作日', '戊戌', '四月十七', '4-17', '狗', '小满后', '四', 'Thu', '4', 'Thursday', '150', '22', '祭祀.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180601', '0', '工作日', '戊戌', '四月十八', '4-18', '狗', '小满后', '五', 'Fri', '5', 'Friday', '151', '22', '嫁娶.纳采.祭祀.祈福.出行.动土.上梁.移徙.入宅.破土.安葬', '斋醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180602', '1', '假日', '戊戌', '四月十九', '4-19', '狗', '小满后', '六', 'Sat', '6', 'Saturday', '152', '22', '纳采.祭祀.祈福.开市.求医.治病.动土.纳畜', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180603', '1', '假日', '戊戌', '四月二十', '4-20', '狗', '小满后', '日', 'Sun', '7', 'Sunday', '153', '22', '嫁娶.纳采.出行.移徙.入宅', '动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180604', '0', '工作日', '戊戌', '四月廿一', '4-21', '狗', '小满后', '一', 'Mon', '1', 'Monday', '154', '23', '订盟.纳采.祭祀.动土.破土.交易.立券', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180605', '0', '工作日', '戊戌', '四月廿二', '4-22', '狗', '小满后', '二', 'Tue', '2', 'Tuesday', '155', '23', '嫁娶.裁衣.祭祀.出行.安床.作灶.移徙.入宅.破土.安葬', '赴任.捕捉', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180606', '0', '工作日', '戊戌', '四月廿三', '4-23', '狗', '芒种', '三', 'Wed', '3', 'Wednesday', '156', '23', '嫁娶.合帐.裁衣.冠笄.伐木.上梁.出火.拆卸.移徙.修造.动土.安门.纳财.筑堤.栽种.塞穴', '安床.祈福.出行.安葬.行丧.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180607', '0', '工作日', '戊戌', '四月廿四', '4-24', '狗', '芒种后', '四', 'Thu', '4', 'Thursday', '157', '23', '出行.教牛马.割蜜.余事勿取', '斋醮.造屋.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180608', '0', '工作日', '戊戌', '四月廿五', '4-25', '狗', '芒种后', '五', 'Fri', '5', 'Friday', '158', '23', '嫁娶.祭祀.祈福.求嗣.开光.出行.解除.出火.拆卸.修造.进人口.入宅.移徙.动土.安床.纳畜.栽种.纳财.交易.立券.挂匾.造畜椆栖', '安葬.开生坟.合寿木.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180609', '1', '假日', '戊戌', '四月廿六', '4-26', '狗', '芒种后', '六', 'Sat', '6', 'Saturday', '159', '23', '安机械.祭祀.祈福.求嗣.沐浴.解除.纳采.开市.修造.竖柱.上梁.开柱眼.安碓硙.归岫.补垣.塞穴.拆卸.放水.出火.扫舍.开生坟.合寿木.安葬.谢土.启攒.除服.成服', '嫁娶.安床.作灶.动土.破土.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180610', '1', '假日', '戊戌', '四月廿七', '4-27', '狗', '芒种后', '日', 'Sun', '7', 'Sunday', '160', '23', '祭祀.沐浴.理发.整手足甲.修饰垣墙.平治道涂.余事勿取', '开市.入宅.出行.修造.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180611', '0', '工作日', '戊戌', '四月廿八', '4-28', '狗', '芒种后', '一', 'Mon', '1', 'Monday', '161', '24', '嫁娶.纳采.祭祀.祈福.出行.立券.移徙.入宅.动土.破土.安葬', '开光.作灶.造屋.架马.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180612', '0', '工作日', '戊戌', '四月廿九', '4-29', '狗', '芒种后', '二', 'Tue', '2', 'Tuesday', '162', '24', '纳采.订盟.冠笄.祭祀.祈福.斋醮.出行.修造.动土.移徙.入宅.安香.出火.拆卸.造屋.起基.竖柱.上梁.定磉.安门.开池', '嫁娶.开市.合寿木.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180613', '0', '工作日', '戊戌', '四月三十', '4-30', '狗', '芒种后', '三', 'Wed', '3', 'Wednesday', '163', '24', '祭祀.沐浴.破屋.坏垣.余事勿取', '入宅.嫁娶.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180614', '0', '工作日', '戊戌', '五月初一', '5-1', '狗', '芒种后', '四', 'Thu', '4', 'Thursday', '164', '24', '嫁娶.安机械.交易.出行.祭祀.祈福.求嗣.斋醮.塑绘.开光.合帐.裁衣.放水.开池.掘井', '作灶.理发.造桥.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180615', '0', '工作日', '戊戌', '五月初二', '5-2', '狗', '芒种后', '五', 'Fri', '5', 'Friday', '165', '24', '纳采.冠笄.求医.治病.开市.立券.修造.动土.安机械.破土.安葬', '斋醮.祭祀.移徙.入宅.上梁.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180616', '1', '假日', '戊戌', '五月初三', '5-3', '狗', '芒种后', '六', 'Sat', '6', 'Saturday', '166', '24', '祭祀.作灶.余事勿取', '开市.安葬.破土.修坟.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180617', '1', '假日', '戊戌', '五月初四', '5-4', '狗', '芒种后', '日', 'Sun', '7', 'Sunday', '167', '24', '祭祀.祈福.求嗣.斋醮.安香.解除.移徙.入宅.会亲友.求医.治病.动土.破土.开生坟.合寿木', '合帐.上梁.经络.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180618', '2', '节日', '戊戌', '五月初五', '5-5', '狗', '芒种后', '一', 'Mon', '1', 'Monday', '168', '25', '嫁娶.冠笄.修造.动土.作灶.移徙.入宅.补垣.塞穴.纳畜.牧养.架马.修造.动土.起基.定磉.开池.造船', '祈福.开光.掘井.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180619', '0', '工作日', '戊戌', '五月初六', '5-6', '狗', '芒种后', '二', 'Tue', '2', 'Tuesday', '169', '25', '祭祀.交易.纳财', '斋醮.开渠.上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180620', '0', '工作日', '戊戌', '五月初七', '5-7', '狗', '芒种后', '三', 'Wed', '3', 'Wednesday', '170', '25', '嫁娶.订盟.纳采.冠笄.会亲友.安机械.造车器.祭祀.出行.纳财.入宅.安香.出火.入学.塑绘.开光.拆卸.起基.修造.动土.牧养.栽种.安门.作厕', '行丧.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180621', '0', '工作日', '戊戌', '五月初八', '5-8', '狗', '夏至', '四', 'Thu', '4', 'Thursday', '171', '25', '开光.求嗣.出行.冠笄.嫁娶.伐木.架马.开柱眼.修造.移徙.入宅.开市.交易.立券.出行.安香.出火.挂匾.起基.修造.开生坟.合寿木.入殓.除服.成服.移柩.安葬', '安床.出货财.作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180622', '0', '工作日', '戊戌', '五月初九', '5-9', '狗', '夏至后', '五', 'Fri', '5', 'Friday', '172', '25', '祭祀.沐浴.理发.嫁娶.作灶.整手足甲.扫舍.修饰垣墙.平治道涂', '斋醮.出行.治病.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180623', '1', '假日', '戊戌', '五月初十', '5-10', '狗', '夏至后', '六', 'Sat', '6', 'Saturday', '173', '25', '安机械.移徙.入宅.出行.祭祀.祈福.斋醮.纳采.订盟.安香.出火.解除.会亲友.修造.动土.拆卸.起基.定磉.移徙.入宅.造屋.安床.修造.破土.安葬.入殓.立碑', '开市.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180624', '1', '假日', '戊戌', '五月十一', '5-11', '狗', '夏至后', '日', 'Sun', '7', 'Sunday', '174', '25', '祭祀.沐浴.捕捉.结网.畋猎.取渔.余事勿取', '开市.交易.嫁娶.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180625', '0', '工作日', '戊戌', '五月十二', '5-12', '狗', '夏至后', '一', 'Mon', '1', 'Monday', '175', '26', '破屋.坏垣.求医.治病.畋猎.余事勿取', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180626', '0', '工作日', '戊戌', '五月十三', '5-13', '狗', '夏至后', '二', 'Tue', '2', 'Tuesday', '176', '26', '嫁娶.出行.安机械.祭祀.塑绘.开光.治病.经络.安床.结网.塞穴.破土.入殓', '开市.安门.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180627', '0', '工作日', '戊戌', '五月十四', '5-14', '狗', '夏至后', '三', 'Wed', '3', 'Wednesday', '177', '26', '订盟.纳采.会亲友.进人口.雕刻.拆卸.修造.动土.起基.开市.栽种.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180628', '0', '工作日', '戊戌', '五月十五', '5-15', '狗', '夏至后', '四', 'Thu', '4', 'Thursday', '178', '26', '祭祀.捕捉.取渔.修饰垣墙.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180629', '0', '工作日', '戊戌', '五月十六', '5-16', '狗', '夏至后', '五', 'Fri', '5', 'Friday', '179', '26', '嫁娶.纳采.祭祀.祈福.求医.治病.出行.动土.移徙.入宅', '开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180630', '1', '假日', '戊戌', '五月十七', '5-17', '狗', '夏至后', '六', 'Sat', '6', 'Saturday', '180', '26', '裁衣.作灶.移徙.入宅.纳畜', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180701', '1', '假日', '戊戌', '五月十八', '5-18', '狗', '夏至后', '日', 'Sun', '7', 'Sunday', '181', '26', '祭祀.入殓.移柩.启攒.安葬', '上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180702', '0', '工作日', '戊戌', '五月十九', '5-19', '狗', '夏至后', '一', 'Mon', '1', 'Monday', '182', '27', '订盟.纳采.出行.祈福.斋醮.安床.会亲友', '移徙.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180703', '0', '工作日', '戊戌', '五月二十', '5-20', '狗', '夏至后', '二', 'Tue', '2', 'Tuesday', '183', '27', '嫁娶.纳采.出行.求医.治病.开市.移徙.入宅.启攒.安葬', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180704', '0', '工作日', '戊戌', '五月廿一', '5-21', '狗', '夏至后', '三', 'Wed', '3', 'Wednesday', '184', '27', '嫁娶.祭祀.沐浴.扫舍.修饰垣墙', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180705', '0', '工作日', '戊戌', '五月廿二', '5-22', '狗', '夏至后', '四', 'Thu', '4', 'Thursday', '185', '27', '嫁娶.订盟.纳采.出行.开市.祭祀.祈福.动土.移徙.入宅.破土.安葬', '作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180706', '0', '工作日', '戊戌', '五月廿三', '5-23', '狗', '夏至后', '五', 'Fri', '5', 'Friday', '186', '27', '订盟.纳采.出行.祭祀.祈福.修造.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180707', '1', '假日', '戊戌', '五月廿四', '5-24', '狗', '小暑', '六', 'Sat', '6', 'Saturday', '187', '27', '祭祀.祈福.解除.整手足甲.安床.沐浴.入殓.移柩.破土.启攒.安葬.谢土', '嫁娶.斋醮.开市.出火.入宅.移徙.出行.作灶.安门.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180708', '1', '假日', '戊戌', '五月廿五', '5-25', '狗', '小暑后', '日', 'Sun', '7', 'Sunday', '188', '27', '破屋.坏垣.解除.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180709', '0', '工作日', '戊戌', '五月廿六', '5-26', '狗', '小暑后', '一', 'Mon', '1', 'Monday', '189', '28', '嫁娶.开市.立券.移徙.入宅.安机械.会亲友.经络.安门.安床.挂匾.拆卸.开仓.出货财.开池.栽种.纳畜.牧养.破土.安葬.启攒.移柩.入殓.立碑', '祭祀.祈福.探病.谢土.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180710', '0', '工作日', '戊戌', '五月廿七', '5-27', '狗', '小暑后', '二', 'Tue', '2', 'Tuesday', '190', '28', '嫁娶.订盟.纳采.祭祀.祈福.斋醮.开光.会亲友.求医.治病.造屋.起基.竖柱.上梁.安门.安碓硙.筑堤.开池.破土.安葬.除服.成服', '入宅.开市.掘井.词讼.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180711', '0', '工作日', '戊戌', '五月廿八', '5-28', '狗', '小暑后', '三', 'Wed', '3', 'Wednesday', '191', '28', '纳采.订盟.嫁娶.移徙.入宅.出行.祭祀.祈福.斋醮.塑绘.开光.安香.出火.会亲友.解除.入学.竖柱.上梁.拆卸.造屋.起基.栽种.牧养.纳畜', '安葬.破土.开市.开仓.出货财.启攒', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180712', '0', '工作日', '戊戌', '五月廿九', '5-29', '狗', '小暑后', '四', 'Thu', '4', 'Thursday', '192', '28', '纳采.订盟.嫁娶.祭祀.沐浴.塑绘.开光.出火.治病.习艺.伐木.造屋.竖柱.上梁.安床.作灶.安碓硙.挂匾.掘井.纳畜', '出行.安葬.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180713', '0', '工作日', '戊戌', '六月初一', '6-1', '狗', '小暑后', '五', 'Fri', '5', 'Friday', '193', '28', '祭祀.入殓.除服.成服.移柩.破土.启攒.安葬.塞穴.断蚁.结网', '开市.入宅.嫁娶.开光.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180714', '1', '假日', '戊戌', '六月初二', '6-2', '狗', '小暑后', '六', 'Sat', '6', 'Saturday', '194', '28', '祭祀.修造.出行.造屋.竖柱.造车器.教牛马.造畜椆栖.割蜜', '动土.破土.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180715', '1', '假日', '戊戌', '六月初三', '6-3', '狗', '小暑后', '日', 'Sun', '7', 'Sunday', '195', '28', '祭祀.沐浴.塑绘.开光.入学.解除.扫舍.治病.开池.牧养', '嫁娶.出行.纳采.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180716', '0', '工作日', '戊戌', '六月初四', '6-4', '狗', '小暑后', '一', 'Mon', '1', 'Monday', '196', '29', '纳财.开市.交易.立券.出行.祭祀.祈福.求嗣.开光.解除.扫舍.起基.竖柱.安床.移徙.开仓.出货财.补垣.塞穴.栽种.纳畜.牧养', '斋醮.入宅.安门.安葬.破土.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180717', '0', '工作日', '戊戌', '六月初五', '6-5', '狗', '小暑后', '二', 'Tue', '2', 'Tuesday', '197', '29', '祭祀.修饰垣墙.平治道涂', '开市.动土.破土.嫁娶.修造.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180718', '0', '工作日', '戊戌', '六月初六', '6-6', '狗', '小暑后', '三', 'Wed', '3', 'Wednesday', '198', '29', '订盟.纳采.祭祀.祈福.开光.安香.出火.立券.安机械.移徙.入宅.竖柱.上梁.会亲友.安床.拆卸.挂匾.牧养.教牛马', '嫁娶.安葬.行丧.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180719', '0', '工作日', '戊戌', '六月初七', '6-7', '狗', '小暑后', '四', 'Thu', '4', 'Thursday', '199', '29', '沐浴.理发.捕捉.入殓.移柩.破土.启攒.安葬', '出火.嫁娶.入宅.作灶.破土.上梁.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180720', '0', '工作日', '戊戌', '六月初八', '6-8', '狗', '小暑后', '五', 'Fri', '5', 'Friday', '200', '29', '求医.治病.破屋.坏垣.余事勿取', '嫁娶.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180721', '1', '假日', '戊戌', '六月初九', '6-9', '狗', '小暑后', '六', 'Sat', '6', 'Saturday', '201', '29', '纳采.订盟.嫁娶.移徙.入宅.出行.开市.交易.立券.纳财.会亲友.安香.出火.拆卸.造屋.起基.安床.作灶.挂匾.安葬.破土.启攒.立碑.入殓.移柩', '祈福.上梁.开仓.掘井.牧养', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180722', '1', '假日', '戊戌', '六月初十', '6-10', '狗', '小暑后', '日', 'Sun', '7', 'Sunday', '202', '29', '祭祀.祈福.斋醮.出行.纳采.订盟.安机械.出火.拆卸.修造.动土.起基.移徙.入宅.造庙.入殓.除服.成服.移柩.破土.安葬.谢土', '嫁娶.开市.栽种.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180723', '0', '工作日', '戊戌', '六月十一', '6-11', '狗', '大暑', '一', 'Mon', '1', 'Monday', '203', '30', '祭祀.进人口.纳财.纳畜.牧养.捕捉.余事勿取', '开市.入宅.安床.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180724', '0', '工作日', '戊戌', '六月十二', '6-12', '狗', '大暑后', '二', 'Tue', '2', 'Tuesday', '204', '30', '祭祀.塑绘.开光.求医.治病.嫁娶.会亲友.放水.掘井.牧养.纳畜.开渠.安碓硙', '造屋.入宅.作灶.入学.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180725', '0', '工作日', '戊戌', '六月十三', '6-13', '狗', '大暑后', '三', 'Wed', '3', 'Wednesday', '205', '30', '祭祀.塞穴.结网.畋猎.余事勿取', '移徙.开市.入宅.嫁娶.开光.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180726', '0', '工作日', '戊戌', '六月十四', '6-14', '狗', '大暑后', '四', 'Thu', '4', 'Thursday', '206', '30', '开市.纳财.祭祀.塑绘.安机械.冠笄.会亲友.裁衣.开仓.经络.纳畜.造畜椆栖.教牛马.牧养', '动土.破土.安葬.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180727', '0', '工作日', '戊戌', '六月十五', '6-15', '狗', '大暑后', '五', 'Fri', '5', 'Friday', '207', '30', '移徙.入宅.治病.会亲友.祭祀.祈福.斋醮.安香.移徙.嫁娶.造屋.起基', '开市.斋醮.安床.出行.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180728', '1', '假日', '戊戌', '六月十六', '6-16', '狗', '大暑后', '六', 'Sat', '6', 'Saturday', '208', '30', '塑绘.出行.冠笄.嫁娶.进人口.裁衣.纳婿.造畜椆栖.交易.立券.牧养.开生坟.入殓.除服.成服.移柩.安葬.启攒', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180729', '1', '假日', '戊戌', '六月十七', '6-17', '狗', '大暑后', '日', 'Sun', '7', 'Sunday', '209', '30', '祭祀.冠笄.嫁娶.捕捉.结网.畋猎.取渔.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180730', '0', '工作日', '戊戌', '六月十八', '6-18', '狗', '大暑后', '一', 'Mon', '1', 'Monday', '210', '31', '沐浴.扫舍.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180731', '0', '工作日', '戊戌', '六月十九', '6-19', '狗', '大暑后', '二', 'Tue', '2', 'Tuesday', '211', '31', '纳采.祭祀.祈福.解除.动土.破土.安葬', '嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180801', '0', '工作日', '戊戌', '六月二十', '6-20', '狗', '大暑后', '三', 'Wed', '3', 'Wednesday', '212', '31', '祭祀.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180802', '0', '工作日', '戊戌', '六月廿一', '6-21', '狗', '大暑后', '四', 'Thu', '4', 'Thursday', '213', '31', '嫁娶.纳采.开市.出行.动土.上梁.移徙.入宅.破土.安葬', '祭祀.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180803', '0', '工作日', '戊戌', '六月廿二', '6-22', '狗', '大暑后', '五', 'Fri', '5', 'Friday', '214', '31', '嫁娶.纳采.开市.出行.动土.上梁.移徙.入宅.破土.安葬', '赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180804', '1', '假日', '戊戌', '六月廿三', '6-23', '狗', '大暑后', '六', 'Sat', '6', 'Saturday', '215', '31', '祭祀.作灶.纳财.捕捉', '开市.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180805', '1', '假日', '戊戌', '六月廿四', '6-24', '狗', '大暑后', '日', 'Sun', '7', 'Sunday', '216', '31', '嫁娶.开市.立券.祭祀.祈福.动土.移徙.入宅', '造庙.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180806', '0', '工作日', '戊戌', '六月廿五', '6-25', '狗', '大暑后', '一', 'Mon', '1', 'Monday', '217', '32', '补垣.塞穴.结网.入殓.除服.成服.移柩.安葬.启攒.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180807', '0', '工作日', '戊戌', '六月廿六', '6-26', '狗', '立秋', '二', 'Tue', '2', 'Tuesday', '218', '32', '祭祀.出行.作梁.出火.拆卸.修造.动土.起基.安床.补垣.塞穴.入殓.破土.安葬.移柩.造畜椆栖', '嫁娶.入宅.斋醮.开光.针灸.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180808', '0', '工作日', '戊戌', '六月廿七', '6-27', '狗', '立秋后', '三', 'Wed', '3', 'Wednesday', '219', '32', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.出行.解除.竖柱.入宅.移徙.纳财.上梁.纳畜.入殓.安葬.启攒', '栽种.掘井.动土.安床.破土.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180809', '0', '工作日', '戊戌', '六月廿八', '6-28', '狗', '立秋后', '四', 'Thu', '4', 'Thursday', '220', '32', '解除.祭祀.祈福.求嗣.修造.动土.竖柱.上梁.安床.纳畜.造屋.合脊.起基.入殓.破土.安葬', '出火.嫁娶.开光.进人口.出行.词讼.开市.入宅.移徙.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180810', '0', '工作日', '戊戌', '六月廿九', '6-29', '狗', '立秋后', '五', 'Fri', '5', 'Friday', '221', '32', '沐浴.理发.会亲友.塑绘.开光.栽种.牧养.嫁娶.经络.补垣.塞穴', '开市.入宅.动土.破土.安葬.作灶.上梁.安床.开仓.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180811', '1', '假日', '戊戌', '七月初一', '7-1', '狗', '立秋后', '六', 'Sat', '6', 'Saturday', '222', '32', '祭祀.理发.作灶.沐浴.修饰垣墙.平治道涂', '嫁娶.栽种.祈福.造桥.安葬.安门.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180812', '1', '假日', '戊戌', '七月初二', '7-2', '狗', '立秋后', '日', 'Sun', '7', 'Sunday', '223', '32', '嫁娶.纳采.订盟.祭祀.祈福.斋醮.普渡.移徙.入宅.出行.安机械.开光.修造.动土.竖柱.上梁.造屋.起基.定磉.安门.安葬.破土', '开市.立券.置产.作灶.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180813', '0', '工作日', '戊戌', '七月初三', '7-3', '狗', '立秋后', '一', 'Mon', '1', 'Monday', '224', '33', '祭祀.普渡.捕捉.解除.结网.畋猎.入殓.破土.安葬', '开市.交易.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180814', '0', '工作日', '戊戌', '七月初四', '7-4', '狗', '立秋后', '二', 'Tue', '2', 'Tuesday', '225', '33', '沐浴.破屋.坏垣.余事勿取', '斋醮.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180815', '0', '工作日', '戊戌', '七月初五', '7-5', '狗', '立秋后', '三', 'Wed', '3', 'Wednesday', '226', '33', '订盟.纳采.祭祀.祈福.安香.出火.开市.立券.入宅.挂匾.造桥.启攒.安葬', '动土.破土.嫁娶.掘井.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180816', '0', '工作日', '戊戌', '七月初六', '7-6', '狗', '立秋后', '四', 'Thu', '4', 'Thursday', '227', '33', '嫁娶.祭祀.祈福.斋醮.普渡.移徙.入宅.动土.治病.开市.交易.立券.开光.修造.造车器.安香.安床.捕捉.畋猎.结网', '纳采.订盟.经络.行丧.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180817', '0', '工作日', '戊戌', '七月初七', '7-7', '狗', '立秋后', '五', 'Fri', '5', 'Friday', '228', '33', '嫁娶.订盟.纳采.作灶.冠笄.裁衣.会亲友.纳畜.牧养.安机械.开市.立券.纳财.安床', '掘井.出行.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180818', '1', '假日', '戊戌', '七月初八', '7-8', '狗', '立秋后', '六', 'Sat', '6', 'Saturday', '229', '33', '嫁娶.订盟.纳采.祭祀.斋醮.普渡.解除.出行.会亲友.开市.纳财.修造.动土.竖柱.上梁.开光.开仓.出货财.纳畜.牧养.开池.破土.启攒', '出火.入宅.造屋.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180819', '1', '假日', '戊戌', '七月初九', '7-9', '狗', '立秋后', '日', 'Sun', '7', 'Sunday', '230', '33', '嫁娶.普渡.祭祀.祈福.补垣.塞穴.断蚁.筑堤.入殓.除服.成服.安葬', '动土.破土.掘井.开光.上梁.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180820', '0', '工作日', '戊戌', '七月初十', '7-10', '狗', '立秋后', '一', 'Mon', '1', 'Monday', '231', '34', '嫁娶.冠笄.祭祀.沐浴.普渡.出行.纳财.扫舍.纳畜.赴任', '开市.动土.破土.安床.开仓.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180821', '0', '工作日', '戊戌', '七月十一', '7-11', '狗', '立秋后', '二', 'Tue', '2', 'Tuesday', '232', '34', '祭祀.沐浴.理发.整手足甲.冠笄.解除.入殓.移柩.破土.启攒.安葬', '嫁娶.出行.入宅.开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180822', '0', '工作日', '戊戌', '七月十二', '7-12', '狗', '立秋后', '三', 'Wed', '3', 'Wednesday', '233', '34', '塑绘.冠笄.嫁娶.会亲友.进人口.经络.裁衣.栽种.纳畜.牧养.补垣.塞穴.捕捉', '祈福.开市.动土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180823', '0', '工作日', '戊戌', '七月十三', '7-13', '狗', '处暑', '四', 'Thu', '4', 'Thursday', '234', '34', '出行.沐浴.订盟.纳采.裁衣.竖柱.上梁.移徙.纳畜.牧养', '嫁娶.安门.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180824', '0', '工作日', '戊戌', '七月十四', '7-14', '狗', '处暑后', '五', 'Fri', '5', 'Friday', '235', '34', '纳采.订盟.嫁娶.祭祀.祈福.普渡.开光.安香.出火.移徙.入宅.竖柱.修造.动土.竖柱.上梁.起基.造屋.安门.造庙.造桥.破土.启攒.安葬', '开市.立券.纳财.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180825', '1', '假日', '戊戌', '七月十五', '7-15', '狗', '处暑后', '六', 'Sat', '6', 'Saturday', '236', '34', '祭祀.捕捉.畋猎.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬.启攒', '嫁娶.纳采.订盟.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180826', '1', '假日', '戊戌', '七月十六', '7-16', '狗', '处暑后', '日', 'Sun', '7', 'Sunday', '237', '34', '破屋.坏垣.治病.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180827', '0', '工作日', '戊戌', '七月十七', '7-17', '狗', '处暑后', '一', 'Mon', '1', 'Monday', '238', '35', '祈福.斋醮.出行.冠笄.嫁娶.雕刻.开柱眼.入宅.造桥.开市.交易.立券.纳财.入殓.除服.成服.移柩.破土.安葬.启攒', '动土.破土.订盟.安床.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180828', '0', '工作日', '戊戌', '七月十八', '7-18', '狗', '处暑后', '二', 'Tue', '2', 'Tuesday', '239', '35', '祈福.求嗣.解除.订盟.纳采.动土.起基.放水.造仓.开市.纳畜.牧养.开生坟.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180829', '0', '工作日', '戊戌', '七月十九', '7-19', '狗', '处暑后', '三', 'Wed', '3', 'Wednesday', '240', '35', '塑绘.开光.解除.订盟.纳采.嫁娶.出火.修造.动土.移徙.入宅.拆卸.起基.安门.分居.开市.交易.立券.纳财.纳畜.牧养', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180830', '0', '工作日', '戊戌', '七月二十', '7-20', '狗', '处暑后', '四', 'Thu', '4', 'Thursday', '241', '35', '祈福.出行.订盟.纳采.嫁娶.裁衣.动土.安床.放水.开市.掘井.交易.立券.栽种.开渠.除服.成服.移柩.破土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180831', '0', '工作日', '戊戌', '七月廿一', '7-21', '狗', '处暑后', '五', 'Fri', '5', 'Friday', '242', '35', '嫁娶.祭祀.祈福.斋醮.作灶.移徙.入宅', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180901', '1', '假日', '戊戌', '七月廿二', '7-22', '狗', '处暑后', '六', 'Sat', '6', 'Saturday', '243', '35', '嫁娶.出行.纳畜.祭祀.入殓.启攒.安葬', '作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180902', '1', '假日', '戊戌', '七月廿三', '7-23', '狗', '处暑后', '日', 'Sun', '7', 'Sunday', '244', '35', '订盟.纳采.祭祀.祈福.修造.动土.上梁.破土.安葬', '嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180903', '0', '工作日', '戊戌', '七月廿四', '7-24', '狗', '处暑后', '一', 'Mon', '1', 'Monday', '245', '36', '订盟.纳采.出行.会亲友.修造.上梁.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180904', '0', '工作日', '戊戌', '七月廿五', '7-25', '狗', '处暑后', '二', 'Tue', '2', 'Tuesday', '246', '36', '沐浴.修饰垣墙.平治道涂.余事勿取', '嫁娶.祈福.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180905', '0', '工作日', '戊戌', '七月廿六', '7-26', '狗', '处暑后', '三', 'Wed', '3', 'Wednesday', '247', '36', '嫁娶.祭祀.祈福.斋醮.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180906', '0', '工作日', '戊戌', '七月廿七', '7-27', '狗', '处暑后', '四', 'Thu', '4', 'Thursday', '248', '36', '捕捉.结网.入殓.破土.安葬', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180907', '0', '工作日', '戊戌', '七月廿八', '7-28', '狗', '处暑后', '五', 'Fri', '5', 'Friday', '249', '36', '沐浴.治病.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180908', '1', '假日', '戊戌', '七月廿九', '7-29', '狗', '白露', '六', 'Sat', '6', 'Saturday', '250', '36', '破屋.坏垣.求医.治病.余事勿取', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180909', '1', '假日', '戊戌', '七月三十', '7-30', '狗', '白露后', '日', 'Sun', '7', 'Sunday', '251', '36', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.开光.出行.出火.拆卸.修造.动土.进人口.入宅.移徙.安床.上梁.合脊.放水.掘井.破土.移柩.谢土.除服.成服', '开市.开仓.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180910', '0', '工作日', '戊戌', '八月初一', '8-1', '狗', '白露后', '一', 'Mon', '1', 'Monday', '252', '37', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.开光.解除.进人口.入宅.移徙.出火.安床.开市.交易.立券.挂匾', '安葬.纳畜.出行.行丧.伐木.栽种.造庙.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180911', '0', '工作日', '戊戌', '八月初二', '8-2', '狗', '白露后', '二', 'Tue', '2', 'Tuesday', '253', '37', '祭祀.冠笄.捕捉.余事勿取', '嫁娶.开市.造屋.作梁.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180912', '0', '工作日', '戊戌', '八月初三', '8-3', '狗', '白露后', '三', 'Wed', '3', 'Wednesday', '254', '37', '祭祀.解除.结网.畋猎.取渔.会亲友.入学.移柩.启攒.除服.成服', '开市.祈福.动土.破土.入殓.安葬.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180913', '0', '工作日', '戊戌', '八月初四', '8-4', '狗', '白露后', '四', 'Thu', '4', 'Thursday', '255', '37', '冠笄.沐浴.出行.修造.动土.移徙.入宅.破土.安葬', '嫁娶.开市.祭祀.祈福.斋醮.纳采.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180914', '0', '工作日', '戊戌', '八月初五', '8-5', '狗', '白露后', '五', 'Fri', '5', 'Friday', '256', '37', '祭祀.出行', '嫁娶.入宅.修造.动土.会亲友.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180915', '1', '假日', '戊戌', '八月初六', '8-6', '狗', '白露后', '六', 'Sat', '6', 'Saturday', '257', '37', '嫁娶.订盟.纳采.祭祀.祈福.出行.修造.动土.移徙.入宅', '针灸.伐木.作梁.造庙.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180916', '1', '假日', '戊戌', '八月初七', '8-7', '狗', '白露后', '日', 'Sun', '7', 'Sunday', '258', '37', '出行.开市.交易.立券.安机械.出火.上梁.移徙', '嫁娶.安葬.动土.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180917', '0', '工作日', '戊戌', '八月初八', '8-8', '狗', '白露后', '一', 'Mon', '1', 'Monday', '259', '38', '祭祀.沐浴.修饰垣墙.平治道涂.余事勿取', '斋醮.嫁娶.移徙.出行.上梁.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180918', '0', '工作日', '戊戌', '八月初九', '8-9', '狗', '白露后', '二', 'Tue', '2', 'Tuesday', '260', '38', '嫁娶.造车器.安机械.祭祀.祈福.开光.安香.出火.出行.开市.立券.修造.动土.移徙.入宅.破土.安葬', '纳采.订盟.架马.词讼.开渠', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180919', '0', '工作日', '戊戌', '八月初十', '8-10', '狗', '白露后', '三', 'Wed', '3', 'Wednesday', '261', '38', '沐浴.捕捉.入殓.除服.成服.破土.启攒.安葬', '祭祀.嫁娶.安床.开市.入宅.探病.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180920', '0', '工作日', '戊戌', '八月十一', '8-11', '狗', '白露后', '四', 'Thu', '4', 'Thursday', '262', '38', '余事勿取', '探病.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180921', '0', '工作日', '戊戌', '八月十二', '8-12', '狗', '白露后', '五', 'Fri', '5', 'Friday', '263', '38', '订盟.纳采.祭祀.祈福.安香.出火.修造.动土.上梁.安门.起基.竖柱.上梁.定磉.开池.移徙.入宅.立券.破土', '嫁娶.造庙.造桥.造船.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180922', '1', '假日', '戊戌', '八月十三', '8-13', '狗', '白露后', '六', 'Sat', '6', 'Saturday', '264', '38', '开光.求嗣.雕刻.嫁娶.订盟.纳采.出火.拆卸.修造.动土.起基.上梁.放水.移徙.入宅.造仓.造船.开市.开池.纳畜.牧养.挂匾', '行丧.安葬.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180923', '1', '假日', '戊戌', '八月十四', '8-14', '狗', '秋分', '日', 'Sun', '7', 'Sunday', '265', '38', '祭祀.嫁娶.捕捉', '开光.动土.破土.开市.修造.入宅.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180924', '2', '节日', '戊戌', '八月十五', '8-15', '狗', '秋分后', '一', 'Mon', '1', 'Monday', '266', '39', '祭祀.普渡.解除.会亲友.捕捉.畋猎.启攒.除服.成服.移柩', '嫁娶.开市.动土.掘井.开池.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180925', '0', '工作日', '戊戌', '八月十六', '8-16', '狗', '秋分后', '二', 'Tue', '2', 'Tuesday', '267', '39', '祭祀.出行.解除.冠笄.嫁娶.伐木.架马.开柱眼.修造.动土.移徙.入宅.开生坟.合寿木.入殓.移柩.破土.安葬.修坟', '开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180926', '0', '工作日', '戊戌', '八月十七', '8-17', '狗', '秋分后', '三', 'Wed', '3', 'Wednesday', '268', '39', '祭祀.祈福.求嗣.出行.沐浴.交易.扫舍.教牛马', '动土.作灶.行丧.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180927', '0', '工作日', '戊戌', '八月十八', '8-18', '狗', '秋分后', '四', 'Thu', '4', 'Thursday', '269', '39', '出行.解除.纳采.冠笄.雕刻.修造.动土.起基.上梁.合脊.安床.移徙.入宅.开市.栽种.作厕', '造庙.安门.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180928', '0', '工作日', '戊戌', '八月十九', '8-19', '狗', '秋分后', '五', 'Fri', '5', 'Friday', '270', '39', '祭祀.沐浴.解除.理发.冠笄.安机械.作灶.造仓.开市.开池.作厕.补垣.塞穴.断蚁.结网', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180929', '0', '工作日', '戊戌', '八月二十', '8-20', '狗', '秋分后', '六', 'Sat', '6', 'Saturday', '271', '39', '祭祀.沐浴.修饰垣墙.平治道涂', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20180930', '0', '工作日', '戊戌', '八月廿一', '8-21', '狗', '秋分后', '日', 'Sun', '7', 'Sunday', '272', '39', '祭祀.会亲友.纳采.嫁娶.开光.塑绘.斋醮.安香.开市.立券.除服.成服.入殓.移柩.安葬.赴任.进人口.出行.裁衣.修造.动土.上梁.经络.交易', '入宅.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181001', '2', '节日', '戊戌', '八月廿二', '8-22', '狗', '秋分后', '一', 'Mon', '1', 'Monday', '273', '40', '祭祀.冠笄.会亲友.拆卸.起基.除服.成服.移柩.启攒.安葬.沐浴.捕捉.开光.塑绘', '作灶.祭祀.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181002', '2', '节日', '戊戌', '八月廿三', '8-23', '狗', '秋分后', '二', 'Tue', '2', 'Tuesday', '274', '40', '祭祀.沐浴.破屋.坏垣.余事勿取', '移徙.入宅.出行.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181003', '2', '节日', '戊戌', '八月廿四', '8-24', '狗', '秋分后', '三', 'Wed', '3', 'Wednesday', '275', '40', '祭祀.塑绘.开光.出行.解除.订盟.嫁娶.拆卸.起基.安床.入宅.开市.入殓.除服.成服.移柩.破土.谢土.挂匾.开柱眼.交易', '造桥.冠笄.造屋.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181004', '1', '假日', '戊戌', '八月廿五', '8-25', '狗', '秋分后', '四', 'Thu', '4', 'Thursday', '276', '40', '祭祀.赴任.动土.上梁.开光.塑绘.冠笄.拆卸.起基.安床.开市.立券.赴任.经络', '定磉.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181005', '1', '假日', '戊戌', '八月廿六', '8-26', '狗', '秋分后', '五', 'Fri', '5', 'Friday', '277', '40', '祭祀.裁衣.冠笄.嫁娶.纳婿.会亲友.除服.成服.移柩.捕捉.进人口.入殓', '移徙.入宅.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181006', '1', '假日', '戊戌', '八月廿七', '8-27', '狗', '秋分后', '六', 'Sat', '6', 'Saturday', '278', '40', '祭祀.诸事不宜', '入殓.安葬.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181007', '1', '假日', '戊戌', '八月廿八', '8-28', '狗', '秋分后', '日', 'Sun', '7', 'Sunday', '279', '40', '祭祀.裁衣.冠笄.嫁娶.安机械.拆卸.动土.起基.移徙.入宅.入殓.启攒.安葬.造仓.经络', '安床.开光.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181008', '0', '工作日', '戊戌', '八月廿九', '8-29', '狗', '寒露', '一', 'Mon', '1', 'Monday', '280', '41', '嫁娶.裁衣.冠笄.合帐.祭祀.出行.安床.移徙.塞穴.入殓.破土.移柩.安葬', '开市.出行.栽种.置产.词讼.安门.掘井.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181009', '0', '工作日', '戊戌', '九月初一', '9-1', '狗', '寒露后', '二', 'Tue', '2', 'Tuesday', '281', '41', '祭祀.造车器.出行.修造.上梁.造屋.安门.安床.造畜椆栖.教牛马', '出货财.开仓.动土.破土.安葬.行丧.伐木.开渠.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181010', '0', '工作日', '戊戌', '九月初二', '9-2', '狗', '寒露后', '三', 'Wed', '3', 'Wednesday', '282', '41', '祭祀.开光.出行.解除.伐木.作梁.出火.拆卸.入宅.移徙.安床.修造.造畜椆栖.扫舍', '造庙.嫁娶.掘井.栽种.造桥.作灶.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181011', '0', '工作日', '戊戌', '九月初三', '9-3', '狗', '寒露后', '四', 'Thu', '4', 'Thursday', '283', '41', '纳采.订盟.开市.交易.立券.会亲友.纳畜.牧养.问名.移徙.解除.作厕.入学.起基.安床.开仓.出货财.安葬.启攒.入殓.除服.成服', '入宅.上梁.斋醮.出火.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181012', '0', '工作日', '戊戌', '九月初四', '9-4', '狗', '寒露后', '五', 'Fri', '5', 'Friday', '284', '41', '祭祀.平治道涂.余事勿取', '嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181013', '1', '假日', '戊戌', '九月初五', '9-5', '狗', '寒露后', '六', 'Sat', '6', 'Saturday', '285', '41', '捕捉.畋猎.余事勿取', '开市.交易.祭祀.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181014', '1', '假日', '戊戌', '九月初六', '9-6', '狗', '寒露后', '日', 'Sun', '7', 'Sunday', '286', '41', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.斋醮.开光.安香.出火.造庙.移徙.出行.入宅.造庙.起基.竖柱.上梁.安床.纳畜.捕捉.纳婿.安葬', '开市.破土.掘井.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181015', '0', '工作日', '戊戌', '九月初七', '9-7', '狗', '寒露后', '一', 'Mon', '1', 'Monday', '287', '42', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '开市.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181016', '0', '工作日', '戊戌', '九月初八', '9-8', '狗', '寒露后', '二', 'Tue', '2', 'Tuesday', '288', '42', '订盟.纳采.会亲友.交易.立券.纳财.栽种.纳畜.牧养', '嫁娶.开市.入宅.祈福.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181017', '0', '工作日', '戊戌', '九月初九', '9-9', '狗', '寒露后', '三', 'Wed', '3', 'Wednesday', '289', '42', '造车器.嫁娶.订盟.纳采.会亲友.祭祀.出行.开市.立券.移徙.入宅.破土.安葬', '上梁.开光.造屋.架马.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181018', '0', '工作日', '戊戌', '九月初十', '9-10', '狗', '寒露后', '四', 'Thu', '4', 'Thursday', '290', '42', '祭祀.作灶.纳财.捕捉.畋猎.余事勿取', '动土.破土.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181019', '0', '工作日', '戊戌', '九月十一', '9-11', '狗', '寒露后', '五', 'Fri', '5', 'Friday', '291', '42', '嫁娶.订盟.纳采.祭祀.祈福.出行.求医.治病.出火.移徙.入宅', '开市.开仓.出货财.安床.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181020', '1', '假日', '戊戌', '九月十二', '9-12', '狗', '寒露后', '六', 'Sat', '6', 'Saturday', '292', '42', '冠笄.祭祀.沐浴.作灶.理发.整手足甲.扫舍.补垣.塞穴.入殓.破土.启攒', '开光.嫁娶.会亲友.栽种.针灸.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181021', '1', '假日', '戊戌', '九月十三', '9-13', '狗', '寒露后', '日', 'Sun', '7', 'Sunday', '293', '42', '纳采.订盟.嫁娶.祭祀.祈福.求嗣.置产.求医.治病.开市.交易.立券.会亲友.移徙.竖柱.上梁.造屋.合脊.安门.放水.捕捉.纳畜', '造庙.造船.动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181022', '0', '工作日', '戊戌', '九月十四', '9-14', '狗', '寒露后', '一', 'Mon', '1', 'Monday', '294', '43', '出行.造车器.造畜椆栖.解除.冠笄.裁衣.作梁.雕刻.会亲友.移徙.入宅.安机械.造畜椆栖.开市.扫舍', '嫁娶.动土.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181023', '0', '工作日', '戊戌', '九月十五', '9-15', '狗', '霜降', '二', 'Tue', '2', 'Tuesday', '295', '43', '沐浴.理发.冠笄.安床.开市.立券.会亲友.交易.纳财.结网.教牛马', '移徙.入宅.出行.祈福.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181024', '0', '工作日', '戊戌', '九月十六', '9-16', '狗', '霜降后', '三', 'Wed', '3', 'Wednesday', '296', '43', '祭祀.造畜椆栖.修饰垣墙.平治道涂.余事勿取', '嫁娶.开市.安床.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181025', '0', '工作日', '戊戌', '九月十七', '9-17', '狗', '霜降后', '四', 'Thu', '4', 'Thursday', '297', '43', '捕捉.结网.入殓.除服.成服.移柩.破土.安葬.启攒.立碑', '嫁娶.祭祀.入宅.造屋.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181026', '0', '工作日', '戊戌', '九月十八', '9-18', '狗', '霜降后', '五', 'Fri', '5', 'Friday', '298', '43', '祭祀.祈福.求嗣.斋醮.造庙.出火.安机械.会亲友.开市.交易.立券.纳财.习艺.经络.求医.治病.开池.作厕.畋猎.结网.栽种.牧养.安葬.破土.启攒', '开光.嫁娶.掘井.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181027', '1', '假日', '戊戌', '九月十九', '9-19', '狗', '霜降后', '六', 'Sat', '6', 'Saturday', '299', '43', '破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181028', '1', '假日', '戊戌', '九月二十', '9-20', '狗', '霜降后', '日', 'Sun', '7', 'Sunday', '300', '43', '会亲友.嫁娶.订盟.纳采.纳婿.拆卸.修造.动土.起基.竖柱.上梁.安床.会亲友.纳财', '出行.祈福.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181029', '0', '工作日', '戊戌', '九月廿一', '9-21', '狗', '霜降后', '一', 'Mon', '1', 'Monday', '301', '44', '祭祀.塑绘.开光.祈福.斋醮.出行.订盟.纳采.裁衣.嫁娶.拆卸.修造.安床.入宅.安香.入殓.启攒.安葬.谢土.赴任.会亲友.进人口.出行.移徙.上梁.经络.开市.交易.立券.纳财', '开仓.冠笄.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181030', '0', '工作日', '戊戌', '九月廿二', '9-22', '狗', '霜降后', '二', 'Tue', '2', 'Tuesday', '302', '44', '祭祀.作灶.入殓.除服.成服.畋猎', '栽种.动土.安葬.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181031', '0', '工作日', '戊戌', '九月廿三', '9-23', '狗', '霜降后', '三', 'Wed', '3', 'Wednesday', '303', '44', '祭祀.祈福.斋醮.沐浴.竖柱.订盟.纳采.嫁娶.拆卸.入宅.移柩.启攒.谢土.赴任.出火.纳畜', '作灶.入殓.安葬.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181101', '0', '工作日', '戊戌', '九月廿四', '9-24', '狗', '霜降后', '四', 'Thu', '4', 'Thursday', '304', '44', '嫁娶.祭祀.安机械.入殓.破土.安葬', '动土.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181102', '0', '工作日', '戊戌', '九月廿五', '9-25', '狗', '霜降后', '五', 'Fri', '5', 'Friday', '305', '44', '作灶.造畜椆栖', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181103', '1', '假日', '戊戌', '九月廿六', '9-26', '狗', '霜降后', '六', 'Sat', '6', 'Saturday', '306', '44', '沐浴.理发.入学.习艺.进人口', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181104', '1', '假日', '戊戌', '九月廿七', '9-27', '狗', '霜降后', '日', 'Sun', '7', 'Sunday', '307', '44', '开光.针灸.会亲友.启攒.安葬', '开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181105', '0', '工作日', '戊戌', '九月廿八', '9-28', '狗', '霜降后', '一', 'Mon', '1', 'Monday', '308', '45', '祭祀.结网.造畜椆栖.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181106', '0', '工作日', '戊戌', '九月廿九', '9-29', '狗', '霜降后', '二', 'Tue', '2', 'Tuesday', '309', '45', '入殓.除服.成服.移柩.破土.启攒.安葬', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181107', '0', '工作日', '戊戌', '九月三十', '9-30', '狗', '立冬', '三', 'Wed', '3', 'Wednesday', '310', '45', '嫁娶.纳采.订盟.祭祀.斋醮.开光.安香.出火.出行.出火.拆卸.动土.祈福.进人口.纳财.交易.立券.移徙.安床.修造.安葬.除服.成服', '置产.掘井.词讼.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181108', '0', '工作日', '戊戌', '十月初一', '10-1', '狗', '立冬后', '四', 'Thu', '4', 'Thursday', '311', '45', '嫁娶.纳采.订盟.祭祀.开光.出行.解除.伐木.出火.入宅.移徙.拆卸.修造.栽种.安葬.入殓', '破土.动土.安门.作灶.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181109', '0', '工作日', '戊戌', '十月初二', '10-2', '狗', '立冬后', '五', 'Fri', '5', 'Friday', '312', '45', '祭祀.解除.破屋.坏垣.求医.治病.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181110', '1', '假日', '戊戌', '十月初三', '10-3', '狗', '立冬后', '六', 'Sat', '6', 'Saturday', '313', '45', '祭祀.扫舍.破土.安葬.除服.成服.启攒.移柩.入殓.立碑.余事勿取', '祭祀.嫁娶.入宅.修造.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181111', '1', '假日', '戊戌', '十月初四', '10-4', '狗', '立冬后', '日', 'Sun', '7', 'Sunday', '314', '45', '订盟.纳采.会亲友.祭祀.祈福.修造.动土.安机械.破土.安葬', '嫁娶.移徙.出火.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181112', '0', '工作日', '戊戌', '十月初五', '10-5', '狗', '立冬后', '一', 'Mon', '1', 'Monday', '315', '46', '祭祀.沐浴.捕捉.畋猎.结网.扫舍', '嫁娶.纳采.订盟.安床.动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181113', '0', '工作日', '戊戌', '十月初六', '10-6', '狗', '立冬后', '二', 'Tue', '2', 'Tuesday', '316', '46', '开市.纳财.出行.祭祀.祈福.求嗣.斋醮.问名.入学.起基.定磉.置产.开渠.掘井.拆卸.栽种.纳畜.牧养.动土.破土.启攒', '移徙.入宅.出火.入殓.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181114', '0', '工作日', '戊戌', '十月初七', '10-7', '狗', '立冬后', '三', 'Wed', '3', 'Wednesday', '317', '46', '祭祀.理发.置产.塞穴.除服.成服.移柩.入殓.破土.安葬', '嫁娶.入宅.安床.掘井.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181115', '0', '工作日', '戊戌', '十月初八', '10-8', '狗', '立冬后', '四', 'Thu', '4', 'Thursday', '318', '46', '祭祀.沐浴.出行.余事勿取', '开市.动土.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181116', '0', '工作日', '戊戌', '十月初九', '10-9', '狗', '立冬后', '五', 'Fri', '5', 'Friday', '319', '46', '嫁娶.造车器.出行.会亲友.移徙.入宅.修造.动土.雕刻.开光.安香.出火.理发.会亲友.造屋.合脊.起基.归岫.安门.拆卸.扫舍.栽种.造畜椆栖', '开市.纳采.造庙.安床.开渠.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181117', '1', '假日', '戊戌', '十月初十', '10-10', '狗', '立冬后', '六', 'Sat', '6', 'Saturday', '320', '46', '塑绘.会亲友.安机械.塞穴.结网.裁衣.经络', '嫁娶.开市.祈福.斋醮.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181118', '1', '假日', '戊戌', '十月十一', '10-11', '狗', '立冬后', '日', 'Sun', '7', 'Sunday', '321', '46', '纳采.移徙.纳财.开市.交易.立券.纳财.入宅.修造.动土.竖柱.起基.定磉.造庙.安香.出火.修饰垣墙.平治道涂.会亲友.出行.开池.作厕', '开仓.造屋.造桥.祭祀', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181119', '0', '工作日', '戊戌', '十月十二', '10-12', '狗', '立冬后', '一', 'Mon', '1', 'Monday', '322', '47', '订盟.纳采.纳财.开市.立券.祭祀.祈福.移徙.入宅.出行.造屋.起基.修造.动土.竖柱.上梁.安门.安香.出火.教牛马.会亲友.破土', '嫁娶.安葬.掘井.置产.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181120', '0', '工作日', '戊戌', '十月十三', '10-13', '狗', '立冬后', '二', 'Tue', '2', 'Tuesday', '323', '47', '嫁娶.订盟.纳采.祭祀.祈福.塑绘.开光.移徙.安床.伐木.作梁.捕捉.畋猎.结网.求医.治病.解除.安葬.除服.成服.移柩.入殓.立碑.谢土', '开市.造庙.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181121', '0', '工作日', '戊戌', '十月十四', '10-14', '狗', '立冬后', '三', 'Wed', '3', 'Wednesday', '324', '47', '破屋.坏垣.祭祀.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181122', '0', '工作日', '戊戌', '十月十五', '10-15', '狗', '小雪', '四', 'Thu', '4', 'Thursday', '325', '47', '嫁娶.纳采.订盟.祭祀.冠笄.裁衣.伐木.作梁.架马.定磉.开柱眼.作灶.移徙.安床.畋猎.结网.开池.作厕.除服.成服.启攒.入殓.移柩.安葬', '造屋.造船.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181123', '0', '工作日', '戊戌', '十月十六', '10-16', '狗', '小雪后', '五', 'Fri', '5', 'Friday', '326', '47', '纳采.订盟.祭祀.祈福.求嗣.斋醮.开光.会亲友.解除.入学.纳财.交易.立券.经络.起基.动土.定磉.开池.栽种.纳畜.牧养.破土.入殓.立碑.安葬', '嫁娶.开市.入宅.出火.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181124', '1', '假日', '戊戌', '十月十七', '10-17', '狗', '小雪后', '六', 'Sat', '6', 'Saturday', '327', '47', '捕捉.畋猎.会亲友.解除.入殓.除服.成服.移柩.余事勿取', '安床.安门.破土.修坟.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181125', '1', '假日', '戊戌', '十月十八', '10-18', '狗', '小雪后', '日', 'Sun', '7', 'Sunday', '328', '47', '祭祀.祈福.求嗣.斋醮.沐浴.冠笄.出行.理发.拆卸.解除.起基.动土.定磉.安碓硙.开池.掘井.扫舍.除服.成服.移柩.启攒.立碑.谢土', '移徙.入宅.安门.作梁.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181126', '0', '工作日', '戊戌', '十月十九', '10-19', '狗', '小雪后', '一', 'Mon', '1', 'Monday', '329', '48', '嫁娶.冠笄.安床.纳采.会亲友.塞穴.捕捉.置产.造畜椆栖', '开光.掘井.安葬.谢土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181127', '0', '工作日', '戊戌', '十月二十', '10-20', '狗', '小雪后', '二', 'Tue', '2', 'Tuesday', '330', '48', '祭祀.沐浴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181128', '0', '工作日', '戊戌', '十月廿一', '10-21', '狗', '小雪后', '三', 'Wed', '3', 'Wednesday', '331', '48', '祭祀.会亲友.嫁娶.沐浴.修造.动土.祈福.开光.塑绘.出行.订盟.纳采.裁衣.入殓.除服.成服.移柩.启攒.赴任.竖柱.上梁.纳财.扫舍.栽种.纳畜.伐木', '入宅.作灶.安床.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181129', '0', '工作日', '戊戌', '十月廿二', '10-22', '狗', '小雪后', '四', 'Thu', '4', 'Thursday', '332', '48', '理发.会亲友.补垣.塞穴.结网', '嫁娶.入宅.安门.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181130', '0', '工作日', '戊戌', '十月廿三', '10-23', '狗', '小雪后', '五', 'Fri', '5', 'Friday', '333', '48', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.除服.成服.入殓.移柩.安葬.谢土.赴任.会亲友.进人口.出行.竖柱.上梁.经络.开市.交易.立券.纳财.开仓', '作灶.治病.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181201', '1', '假日', '戊戌', '十月廿四', '10-24', '狗', '小雪后', '六', 'Sat', '6', 'Saturday', '334', '48', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.入殓.移柩.安葬.谢土.赴任.进人口.会亲友', '作灶.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181202', '1', '假日', '戊戌', '十月廿五', '10-25', '狗', '小雪后', '日', 'Sun', '7', 'Sunday', '335', '48', '祭祀.塑绘.开光.订盟.纳采.嫁娶.安床.进人口.入殓.除服.成服.移柩.启攒.安葬.立碑', '开市.交易.破土.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181203', '0', '工作日', '戊戌', '十月廿六', '10-26', '狗', '小雪后', '一', 'Mon', '1', 'Monday', '336', '49', '祭祀.解除.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181204', '0', '工作日', '戊戌', '十月廿七', '10-27', '狗', '小雪后', '二', 'Tue', '2', 'Tuesday', '337', '49', '祭祀.解除.祈福.开光.塑绘.斋醮.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.入殓.除服.成服.移柩.启攒.安床.赴任.出行.移徙.竖柱.上梁.伐木.栽种.破土.安葬.纳畜', '造屋.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181205', '0', '工作日', '戊戌', '十月廿八', '10-28', '狗', '小雪后', '三', 'Wed', '3', 'Wednesday', '338', '49', '祭祀.祈福.订盟.纳采.裁衣.合帐.冠笄.安机械.安床.造畜椆栖.入殓.移柩.启攒.安葬.谢土.除服.成服.会亲友.竖柱.上梁.经络.开市.交易.立券.纳财.纳畜.筑堤', '嫁娶.入宅.治病.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181206', '0', '工作日', '戊戌', '十月廿九', '10-29', '狗', '小雪后', '四', 'Thu', '4', 'Thursday', '339', '49', '沐浴.扫舍.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181207', '0', '工作日', '戊戌', '十一月初一', '10-1', '狗', '大雪', '五', 'Fri', '5', 'Friday', '340', '49', '祭祀.沐浴.理发.纳财.进人口.栽种.扫舍.捕捉.畋猎.结网', '会亲友.安葬.入宅.移徙.安床.开市.行丧.出火.作灶.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181208', '1', '假日', '戊戌', '十一月初二', '10-2', '狗', '大雪后', '六', 'Sat', '6', 'Saturday', '341', '49', '纳采.订盟.祭祀.祈福.求嗣.塑绘.解除.拆卸.修造.动土.竖柱.上梁.安门.置产.开池.掘井.纳畜.安床.栽种.造畜椆栖.破土.移柩.立碑', '嫁娶.开市.出火.进人口.入殓.赴任.入宅.移徙.出行.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181209', '1', '假日', '戊戌', '十一月初三', '10-3', '狗', '大雪后', '日', 'Sun', '7', 'Sunday', '342', '49', '入宅.移徙.出行.进人口.修造.动土.起基.上梁.安门.造仓.补垣.塞穴.造畜椆栖', '嫁娶.开市.安床.栽种.安葬.祈福.开光.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181210', '0', '工作日', '戊戌', '十一月初四', '10-4', '狗', '大雪后', '一', 'Mon', '1', 'Monday', '343', '50', '造畜椆栖.教牛马', '入宅.移徙.分居.作灶.出火.安香.动土.嫁娶.掘井.扫舍.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181211', '0', '工作日', '戊戌', '十一月初五', '10-5', '狗', '大雪后', '二', 'Tue', '2', 'Tuesday', '344', '50', '订盟.纳采.造车器.祭祀.祈福.出行.安香.修造.动土.上梁.开市.交易.立券.移徙.入宅.会亲友.安机械.栽种.纳畜.造屋.起基.安床.造畜椆栖', '破土.安葬.行丧.开生坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181212', '0', '工作日', '戊戌', '十一月初六', '10-6', '狗', '大雪后', '三', 'Wed', '3', 'Wednesday', '345', '50', '订盟.纳采.会亲友.安机械.开光.修造.动土.竖柱.上梁.造屋.起基.造桥.栽种.纳畜.造畜椆栖.移柩.入殓.启攒.修坟.立碑.安葬', '祈福.出火.嫁娶.入宅.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181213', '0', '工作日', '戊戌', '十一月初七', '10-7', '狗', '大雪后', '四', 'Thu', '4', 'Thursday', '346', '50', '祭祀.平治道涂.修坟.除服.成服.余事勿取', '移徙.入宅.嫁娶.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181214', '0', '工作日', '戊戌', '十一月初八', '10-8', '狗', '大雪后', '五', 'Fri', '5', 'Friday', '347', '50', '嫁娶.冠笄.祭祀.祈福.求嗣.雕刻.开光.安香.出行.入学.修造.动土.竖柱.上梁.造屋.起基.安门.出火.移徙.入宅.掘井.造畜椆栖.安葬.破土.除服.成服', '开市.纳采.订盟.作灶.造庙.造船.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181215', '1', '假日', '戊戌', '十一月初九', '10-9', '狗', '大雪后', '六', 'Sat', '6', 'Saturday', '348', '50', '嫁娶.订盟.纳采.祭祀.祈福.求嗣.斋醮.安香.出火.修造.起基.造屋.合脊.安门.安碓硙.动土.上梁.移徙.入宅', '出行.掘井.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181216', '1', '假日', '戊戌', '十一月初十', '10-10', '狗', '大雪后', '日', 'Sun', '7', 'Sunday', '349', '50', '祭祀.沐浴.破屋.坏垣.余事勿取', '嫁娶.移徙.入宅.探病.出行.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181217', '0', '工作日', '戊戌', '十一月十一', '10-11', '狗', '大雪后', '一', 'Mon', '1', 'Monday', '350', '51', '冠笄.纳财.掘井.开池.出火.安床.交易.立券.畋猎.结网.理发.放水', '安门.动土.破土.行丧.安葬.成服', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181218', '0', '工作日', '戊戌', '十一月十二', '10-12', '狗', '大雪后', '二', 'Tue', '2', 'Tuesday', '351', '51', '纳采.订盟.移徙.入宅.出行.安机械.会亲友.祭祀.祈福.斋醮.开光.安香.出火.解除.求医.针灸.治病.造屋.起基.修造.安门.造船.纳畜.牧养.移柩.入殓.启攒.谢土.修坟.立碑', '嫁娶.动土.安床.造桥.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181219', '0', '工作日', '戊戌', '十一月十三', '10-13', '狗', '大雪后', '三', 'Wed', '3', 'Wednesday', '352', '51', '祭祀.沐浴.作灶.纳财.捕捉.畋猎.安床.扫舍', '开市.斋醮.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181220', '0', '工作日', '戊戌', '十一月十四', '10-14', '狗', '大雪后', '四', 'Thu', '4', 'Thursday', '353', '51', '祈福.斋醮.纳采.订盟.解除.架马.开柱眼.修造.动土.起基.上梁.归岫.造屋.合脊.掘井.除服.成服.破土.栽种', '移徙.开市.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181221', '0', '工作日', '戊戌', '十一月十五', '10-15', '狗', '大雪后', '五', 'Fri', '5', 'Friday', '354', '51', '纳采.订盟.祭祀.沐浴.冠笄.合帐.裁衣.修造.动土.拆卸.移徙.入宅.安门.开仓.筑堤.作厕.栽种.纳畜.补垣.塞穴', '嫁娶.祈福.开光.掘井.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181222', '1', '假日', '戊戌', '十一月十六', '10-16', '狗', '冬至', '六', 'Sat', '6', 'Saturday', '355', '51', '合帐.裁衣.教牛马.余事勿取', '入宅.动土.破土.嫁娶.作灶.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181223', '1', '假日', '戊戌', '十一月十七', '10-17', '狗', '冬至后', '日', 'Sun', '7', 'Sunday', '356', '51', '纳采.订盟.嫁娶.祭祀.祈福.安香.出火.出行.会亲友.经络.求医.治病.解除.拆卸.起基.修造.动土.定磉.扫舍.栽种.牧养.造畜椆栖', '斋醮.作梁.掘井.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181224', '0', '工作日', '戊戌', '十一月十八', '10-18', '狗', '冬至后', '一', 'Mon', '1', 'Monday', '357', '52', '纳财.开市.交易.立券.会亲友.进人口.经络.祭祀.祈福.安香.出火.求医.治病.修造.动土.拆卸.扫舍.安床.栽种.牧养.开生坟.合寿木.入殓.安葬.启攒', '嫁娶.祈福.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181225', '0', '工作日', '戊戌', '十一月十九', '10-19', '狗', '冬至后', '二', 'Tue', '2', 'Tuesday', '358', '52', '祭祀.入殓.移柩.余事勿取', '入宅.修造.动土.破土.安门.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181226', '0', '工作日', '戊戌', '十一月二十', '10-20', '狗', '冬至后', '三', 'Wed', '3', 'Wednesday', '359', '52', '塑绘.开光.订盟.纳采.裁衣.冠笄.拆卸.修造.安床.入宅.出火.安葬.谢土.赴任', '掘井.伐木.斋醮.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181227', '0', '工作日', '戊戌', '十一月廿一', '10-21', '狗', '冬至后', '四', 'Thu', '4', 'Thursday', '360', '52', '祭祀.塑绘.开光.裁衣.冠笄.嫁娶.纳采.拆卸.修造.动土.竖柱.上梁.安床.移徙.入宅.安香.结网.捕捉.畋猎.伐木.进人口.放水', '出行.安葬.修坟.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181228', '0', '工作日', '戊戌', '十一月廿二', '10-22', '狗', '冬至后', '五', 'Fri', '5', 'Friday', '361', '52', '祭祀.求医.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181229', '1', '假日', '戊戌', '十一月廿三', '10-23', '狗', '冬至后', '六', 'Sat', '6', 'Saturday', '362', '52', '祭祀.祈福.斋醮.出行.冠笄.安机械.移徙.入宅.安香.安床.除服.成服.移柩.启攒', '开光.栽种.治病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181230', '1', '假日', '戊戌', '十一月廿四', '10-24', '狗', '冬至后', '日', 'Sun', '7', 'Sunday', '363', '52', '塑绘.斋醮.出行.拆卸.解除.修造.移徙.造船.入殓.除服.成服.移柩.启攒.修坟.立碑.谢土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20181231', '0', '工作日', '戊戌', '十一月廿五', '10-25', '狗', '冬至后', '一', 'Mon', '1', 'Monday', '364', '01', '祭祀.沐浴.安床.纳财.畋猎.捕捉', '开市.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190101', '2', '节日', '戊戌', '十一月廿六', '10-26', '狗', '冬至后', '二', 'Tue', '2', 'Tuesday', '0', '01', '订盟.纳采.祭祀.祈福.修造.动土.上梁.破土', '嫁娶.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190102', '0', '工作日', '戊戌', '十一月廿七', '10-27', '狗', '冬至后', '三', 'Wed', '3', 'Wednesday', '1', '01', '出行.沐浴.理发.补垣.塞穴', '入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190103', '0', '工作日', '戊戌', '十一月廿八', '10-28', '狗', '冬至后', '四', 'Thu', '4', 'Thursday', '2', '01', '教牛马.余事勿取', '入宅.动土.破土.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190104', '0', '工作日', '戊戌', '十一月廿九', '10-29', '狗', '冬至后', '五', 'Fri', '5', 'Friday', '3', '01', '嫁娶.出行.求医.治病.祭祀.祈福.上梁.纳畜', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190105', '1', '假日', '戊戌', '十一月三十', '10-30', '狗', '小寒', '六', 'Sat', '6', 'Saturday', '4', '01', '嫁娶.开光.解除.出火.拆卸.修造.进人口.入宅.移徙.安床.栽种.入殓.修坟.动土.除服.成服', '作灶.安葬.祭祀.开市.纳采.订盟.纳畜.谢土.出行.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190106', '1', '假日', '戊戌', '腊月初一', '11-1', '狗', '小寒后', '日', 'Sun', '7', 'Sunday', '5', '01', '出行.起基.安床.纳财.交易.立券.嫁娶.栽种.入殓.移柩.安葬', '挂匾.入宅.上梁.祈福.词讼.作梁.作灶.开池.安门.动土.破土.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190107', '0', '工作日', '戊戌', '腊月初二', '11-2', '狗', '小寒后', '一', 'Mon', '1', 'Monday', '6', '02', '平治道涂.余事勿取', '开光.嫁娶.开仓.出货财.造船.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190108', '0', '工作日', '戊戌', '腊月初三', '11-3', '狗', '小寒后', '二', 'Tue', '2', 'Tuesday', '7', '02', '嫁娶.订盟.纳采.会亲友.祭祀.安机械.移徙.入宅.造屋.安床.起基.定磉.安香.出火.挂匾.拆卸.置产', '开市.出行.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190109', '0', '工作日', '戊戌', '腊月初四', '11-4', '狗', '小寒后', '三', 'Wed', '3', 'Wednesday', '8', '02', '沐浴.捕捉.畋猎.理发.整手足甲.入殓.除服.成服.破土.安葬.谢土.立碑.修坟.启攒', '纳采.订盟.嫁娶.上梁.开市.斋醮.造屋.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190110', '0', '工作日', '戊戌', '腊月初五', '11-5', '狗', '小寒后', '四', 'Thu', '4', 'Thursday', '9', '02', '祭祀.破屋.坏垣.余事勿取', '斋醮.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190111', '0', '工作日', '戊戌', '腊月初六', '11-6', '狗', '小寒后', '五', 'Fri', '5', 'Friday', '10', '02', '沐浴.开仓.出货财.开市.交易.立券.纳财.栽种.纳畜.牧养.畋猎.入殓.破土.安葬', '祈福.嫁娶.安床.入宅.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190112', '1', '假日', '戊戌', '腊月初七', '11-7', '狗', '小寒后', '六', 'Sat', '6', 'Saturday', '11', '02', '祭祀.沐浴.补垣.塞穴.断蚁.解除.余事勿取', '造庙.入宅.修造.安葬.行丧.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190113', '1', '假日', '戊戌', '腊月初八', '11-8', '狗', '小寒后', '日', 'Sun', '7', 'Sunday', '12', '02', '嫁娶.纳采.订盟.问名.祭祀.冠笄.裁衣.会亲友.进人口.纳财.捕捉.作灶', '开市.安床.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190114', '0', '工作日', '戊戌', '腊月初九', '11-9', '狗', '小寒后', '一', 'Mon', '1', 'Monday', '13', '03', '订盟.纳采.会亲友.祭祀.斋醮.沐浴.塑绘.出火.开光.竖柱.上梁.开市.交易.立券.作梁.开柱眼.伐木.架马.安门.安床.拆卸.牧养.造畜椆栖.掘井', '造庙.嫁娶.出行.动土.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190115', '0', '工作日', '戊戌', '腊月初十', '11-10', '狗', '小寒后', '二', 'Tue', '2', 'Tuesday', '14', '03', '交易.立券.纳财.安床.裁衣.造畜椆栖.安葬.谢土.启攒.除服.成服.修坟.立碑.移柩.入殓', '开光.嫁娶.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190116', '0', '工作日', '戊戌', '腊月十一', '11-11', '狗', '小寒后', '三', 'Wed', '3', 'Wednesday', '15', '03', '祭祀.解除.教牛马.会亲友.余事勿取', '破土.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190117', '0', '工作日', '戊戌', '腊月十二', '11-12', '狗', '小寒后', '四', 'Thu', '4', 'Thursday', '16', '03', '纳采.订盟.移徙.纳财.开市.交易.立券.入宅.会亲友.解除.求医.治病.入学.安床.安门.安香.出火.拆卸.扫舍.入宅.挂匾.开生坟.合寿木.破土.修坟.启攒.入殓', '探病.祭祀.出行.上梁.造屋.谢土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190118', '0', '工作日', '戊戌', '腊月十三', '11-13', '狗', '小寒后', '五', 'Fri', '5', 'Friday', '17', '03', '嫁娶.订盟.纳采.祭祀.祈福.求嗣.会亲友.解除.出行.入学.纳财.开市.交易.立券.习艺.经络.安床.开仓.出货财.纳畜.安葬.启攒.修坟.入殓', '入宅.开光.开市.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190119', '1', '假日', '戊戌', '腊月十四', '11-14', '狗', '小寒后', '六', 'Sat', '6', 'Saturday', '18', '03', '祭祀.冠笄.嫁娶.会亲友.进人口.裁衣.结网.平治道涂', '移徙.入宅.造庙.作灶.治病.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190120', '1', '假日', '戊戌', '腊月十五', '11-15', '狗', '大寒', '日', 'Sun', '7', 'Sunday', '19', '03', '祭祀.安碓硙.结网.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190121', '0', '工作日', '戊戌', '腊月十六', '11-16', '狗', '大寒后', '一', 'Mon', '1', 'Monday', '20', '04', '嫁娶.祭祀.沐浴.裁衣.出行.理发.移徙.捕捉.畋猎.放水.入宅.除服.成服.启攒.安葬.移柩.入殓', '造屋.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190122', '0', '工作日', '戊戌', '腊月十七', '11-17', '狗', '大寒后', '二', 'Tue', '2', 'Tuesday', '21', '04', '破屋.坏垣.余事勿取', '嫁娶.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190123', '0', '工作日', '戊戌', '腊月十八', '11-18', '狗', '大寒后', '三', 'Wed', '3', 'Wednesday', '22', '04', '纳采.订盟.祭祀.求嗣.出火.塑绘.裁衣.会亲友.入学.拆卸.扫舍.造仓.挂匾.掘井.开池.结网.栽种.纳畜.破土.修坟.立碑.安葬.入殓', '祈福.嫁娶.造庙.安床.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190124', '0', '工作日', '戊戌', '腊月十九', '11-19', '狗', '大寒后', '四', 'Thu', '4', 'Thursday', '23', '04', '入殓.除服.成服.移柩.启攒.安葬.修坟.立碑', '开市.伐木.嫁娶.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190125', '0', '工作日', '戊戌', '腊月二十', '11-20', '狗', '大寒后', '五', 'Fri', '5', 'Friday', '24', '04', '祭祀.作灶.入殓.除服.余事勿取', '开市.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190126', '1', '假日', '戊戌', '腊月廿一', '11-21', '狗', '大寒后', '六', 'Sat', '6', 'Saturday', '25', '04', '塑绘.开光.沐浴.冠笄.会亲友.作灶.放水.造畜椆栖', '嫁娶.入殓.安葬.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190127', '1', '假日', '戊戌', '腊月廿二', '11-22', '狗', '大寒后', '日', 'Sun', '7', 'Sunday', '26', '04', '祭祀.沐浴.祈福.斋醮.订盟.纳采.裁衣.拆卸.起基.竖柱.上梁.安床.入殓.除服.成服.移柩.启攒.挂匾.求嗣.出行.合帐.造畜椆栖', '开仓.嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190128', '0', '工作日', '戊戌', '腊月廿三', '11-23', '狗', '大寒后', '一', 'Mon', '1', 'Monday', '27', '05', '祭祀.解除.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190129', '0', '工作日', '戊戌', '腊月廿四', '11-24', '狗', '大寒后', '二', 'Tue', '2', 'Tuesday', '28', '05', '沐浴.解除.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.移徙.入宅.除服.成服.移柩.破土.启攒.安葬.扫舍.修坟.伐木.纳财.交易.立券', '作灶.祭祀.上梁.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190130', '0', '工作日', '戊戌', '腊月廿五', '11-25', '狗', '大寒后', '三', 'Wed', '3', 'Wednesday', '29', '05', '出行.嫁娶.订盟.纳采.入殓.安床.启攒.安葬.祭祀.裁衣.会亲友.进人口', '作灶.掘井.谢土.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190131', '0', '工作日', '戊戌', '腊月廿六', '11-26', '狗', '大寒后', '四', 'Thu', '4', 'Thursday', '30', '05', '修饰垣墙.平治道涂.入殓.移柩.余事勿取', '嫁娶.移徙.入宅.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190201', '0', '工作日', '戊戌', '腊月廿七', '11-27', '狗', '大寒后', '五', 'Fri', '5', 'Friday', '31', '05', '会亲友.纳采.进人口.修造.动土.竖柱.上梁.祭祀.开光.塑绘.祈福.斋醮.嫁娶.安床.移徙.入宅.安香.纳畜', '出行.治病.安葬.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190202', '0', '工作日', '戊戌', '腊月廿八', '11-28', '狗', '大寒后', '六', 'Sat', '6', 'Saturday', '32', '05', '祭祀.会亲友.出行.订盟.纳采.沐浴.修造.动土.祈福.斋醮.嫁娶.拆卸.安床.入殓.移柩.安葬.谢土.赴任.裁衣.竖柱.上梁.伐木.捕捉.栽种.破土.安门', '造屋.开市.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190203', '0', '工作日', '戊戌', '腊月廿九', '11-29', '狗', '大寒后', '日', 'Sun', '7', 'Sunday', '33', '05', '解除.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190204', '1', '假日', '戊戌', '腊月三十', '11-30', '狗', '立春', '一', 'Mon', '1', 'Monday', '34', '06', '祭祀.沐浴.解除.理发.扫舍.破屋.坏垣.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190205', '2', '节日', '己亥', '正月初一', '1-1', '猪', '立春后', '二', 'Tue', '2', 'Tuesday', '35', '06', '纳采.订盟.祭祀.祈福.安香.出火.修造.出行.开市.移徙.入宅.动土.安葬.破土', '安床.作灶.造船.会亲友', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190206', '2', '节日', '己亥', '正月初二', '1-2', '猪', '立春后', '三', 'Wed', '3', 'Wednesday', '36', '06', '塞穴.结网.取渔.畋猎', '嫁娶.安门.移徙.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190207', '2', '节日', '己亥', '正月初三', '1-3', '猪', '立春后', '四', 'Thu', '4', 'Thursday', '37', '06', '纳采.祭祀.祈福.出行.会亲友.修造.动土.移徙.入宅', '嫁娶.开市.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190208', '1', '假日', '己亥', '正月初四', '1-4', '猪', '立春后', '五', 'Fri', '5', 'Friday', '38', '06', '纳采.嫁娶.祭祀.祈福.出行.开市.会亲友.动土.破土.启攒', '移徙.入宅.出火.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190209', '1', '假日', '己亥', '正月初五', '1-5', '猪', '立春后', '六', 'Sat', '6', 'Saturday', '39', '06', '祭祀.祈福.求嗣.斋醮.入殓.除服.成服.移柩.安葬.启攒', '嫁娶.动土.开光.造屋.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190210', '1', '假日', '己亥', '正月初六', '1-6', '猪', '立春后', '日', 'Sun', '7', 'Sunday', '40', '06', '纳采.会亲友.竖柱.上梁.立券.入殓.移柩.安葬.启攒', '祭祀.移徙.入宅.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190211', '0', '工作日', '己亥', '正月初七', '1-7', '猪', '立春后', '一', 'Mon', '1', 'Monday', '41', '07', '祭祀.祈福.斋醮.出行.开市.立券.动土.移徙.入宅.破土.安葬', '开光.嫁娶.作灶.掘井.纳畜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190212', '0', '工作日', '己亥', '正月初八', '1-8', '猪', '立春后', '二', 'Tue', '2', 'Tuesday', '42', '07', '会亲友.求嗣.理发.冠笄.结网.捕捉.开光.理发', '开市.动土.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190213', '0', '工作日', '己亥', '正月初九', '1-9', '猪', '立春后', '三', 'Wed', '3', 'Wednesday', '43', '07', '祭祀.平治道涂.余事勿取', '嫁娶.祈福.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190214', '0', '工作日', '己亥', '正月初十', '1-10', '猪', '立春后', '四', 'Thu', '4', 'Thursday', '44', '07', '祈福.求嗣.斋醮.纳采.嫁娶.伐木.修造.动土.移徙.入宅.造庙.安机械.开市.入殓.除服.成服.移柩.安葬.破土.谢土', '置产.造屋.合脊.开光.探病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190215', '0', '工作日', '己亥', '正月十一', '1-11', '猪', '立春后', '五', 'Fri', '5', 'Friday', '45', '07', '入学.习艺.出行.纳采.订盟.嫁娶.会亲友.进人口.牧养.捕捉.入殓.移柩.安葬.启攒', '开光.开市.入宅.动土.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190216', '1', '假日', '己亥', '正月十二', '1-12', '猪', '立春后', '六', 'Sat', '6', 'Saturday', '46', '07', '祭祀.沐浴.求医.治病.扫舍.破屋.坏垣.解除.余事勿取', '入宅.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190217', '1', '假日', '己亥', '正月十三', '1-13', '猪', '立春后', '日', 'Sun', '7', 'Sunday', '47', '07', '祭祀.冠笄.嫁娶.拆卸.修造.动土.起基.上梁.造屋.入宅.开市.开池.塞穴.入殓.除服.成服.移柩.安葬.破土', '安床.栽种.治病.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190218', '0', '工作日', '己亥', '正月十四', '1-14', '猪', '立春后', '一', 'Mon', '1', 'Monday', '48', '08', '祭祀.结网.入殓.除服.成服.移柩.安葬.破土', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190219', '0', '工作日', '己亥', '正月十五', '1-15', '猪', '雨水', '二', 'Tue', '2', 'Tuesday', '49', '08', '塑绘.开光.祈福.求嗣.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.起基.安门.安床.移徙.造仓.结网.纳畜', '伐木.作灶.安葬.取渔.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190220', '0', '工作日', '己亥', '正月十六', '1-16', '猪', '雨水后', '三', 'Wed', '3', 'Wednesday', '50', '08', '祭祀.沐浴.开光.塑绘.祈福.求嗣.订盟.纳采.冠笄.裁衣.嫁娶.动土.除服.成服.移柩.破土.启攒.出行.安碓硙.放水.开市.立券.交易', '安葬.上梁.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190221', '0', '工作日', '己亥', '正月十七', '1-17', '猪', '雨水后', '四', 'Thu', '4', 'Thursday', '51', '08', '祭祀.祈福.求嗣.酬神.裁衣.安床.立券.交易.入殓.除服.成服.移柩.谢土.启攒', '出行.嫁娶.入宅.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190222', '0', '工作日', '己亥', '正月十八', '1-18', '猪', '雨水后', '五', 'Fri', '5', 'Friday', '52', '08', '裁衣.合帐.入殓.除服.成服.会亲友.纳财', '祭祀.祈福.移徙.嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190223', '1', '假日', '己亥', '正月十九', '1-19', '猪', '雨水后', '六', 'Sat', '6', 'Saturday', '53', '08', '祭祀.斋醮.裁衣.合帐.冠笄.订盟.纳采.嫁娶.入宅.安香.谢土.入殓.移柩.破土.立碑.安香.会亲友.出行.祈福.求嗣.立碑.上梁.放水', '掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190224', '1', '假日', '己亥', '正月二十', '1-20', '猪', '雨水后', '日', 'Sun', '7', 'Sunday', '54', '08', '安床.合帐.入宅.问名.纳采.求嗣.祭祀.开仓', '斋醮.作灶.安床.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190225', '0', '工作日', '己亥', '正月廿一', '1-21', '猪', '雨水后', '一', 'Mon', '1', 'Monday', '55', '09', '作灶.平治道涂', '祭祀.祈福.安葬.安门.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190226', '0', '工作日', '己亥', '正月廿二', '1-22', '猪', '雨水后', '二', 'Tue', '2', 'Tuesday', '56', '09', '塑绘.开光.酬神.斋醮.订盟.纳采.裁衣.合帐.拆卸.动土.上梁.安床.安香.造庙.挂匾.会亲友.进人口.出行.修造.纳财.伐木.放水.出火.纳畜.沐浴.安门', '造屋.栽种.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190227', '0', '工作日', '己亥', '正月廿三', '1-23', '猪', '雨水后', '三', 'Wed', '3', 'Wednesday', '57', '09', '祭祀.祈福.酬神.订盟.纳采.冠笄.裁衣.合帐.嫁娶.安床.移徙.入宅.安香.入殓.移柩.启攒.安葬.解除.取渔.捕捉.伐木.安门.出火', '栽种.动土.开市.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190228', '0', '工作日', '己亥', '正月廿四', '1-24', '猪', '雨水后', '四', 'Thu', '4', 'Thursday', '58', '09', '求医.破屋', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190301', '0', '工作日', '己亥', '正月廿五', '1-25', '猪', '雨水后', '五', 'Fri', '5', 'Friday', '59', '09', '祈福.求嗣.斋醮.塑绘.开光.订盟.纳采.嫁娶.动土.入宅.安香.移柩.安葬.谢土.出行.沐浴.修造.竖柱.上梁.纳财.破土.解除.安门.放水', '作灶.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190302', '1', '假日', '己亥', '正月廿六', '1-26', '猪', '雨水后', '六', 'Sat', '6', 'Saturday', '60', '09', '取渔.入殓.除服.成服.移柩.破土.安葬.立碑', '嫁娶.上梁.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190303', '1', '假日', '己亥', '正月廿七', '1-27', '猪', '雨水后', '日', 'Sun', '7', 'Sunday', '61', '09', '祭祀.求嗣.沐浴.酬神.订盟.纳采.裁衣.合帐.冠笄.安机械.安床.造仓.开池.经络.纳财.开市.立券.交易.结网.取渔.纳畜.捕捉', '安葬.作灶.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190304', '0', '工作日', '己亥', '正月廿八', '1-28', '猪', '雨水后', '一', 'Mon', '1', 'Monday', '62', '10', '祭祀.沐浴.祈福.求嗣.斋醮.订盟.纳采.裁衣.冠笄.开市.立券.交易.纳财.沐浴.除服.谢土.出行.移柩', '入殓.安葬.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190305', '0', '工作日', '己亥', '正月廿九', '1-29', '猪', '雨水后', '二', 'Tue', '2', 'Tuesday', '63', '10', '祭祀.祈福.求嗣.入殓.启攒.安葬.移柩', '开光.掘井.针灸.出行.嫁娶.入宅.移徙.作灶.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190306', '0', '工作日', '己亥', '正月三十', '1-30', '猪', '惊蛰', '三', 'Wed', '3', 'Wednesday', '64', '10', '冠笄.立券.交易.修造.动土.安机械.入殓.安葬.破土', '嫁娶.祈福.出火.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190307', '0', '工作日', '己亥', '二月初一', '2-1', '猪', '惊蛰后', '四', 'Thu', '4', 'Thursday', '65', '10', '祭祀.会亲友.出行.立券.交易.冠笄.纳财', '嫁娶.动土.掘井.起基.定磉.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190308', '0', '工作日', '己亥', '二月初二', '2-2', '猪', '惊蛰后', '五', 'Fri', '5', 'Friday', '66', '10', '祭祀.沐浴.解除.扫舍.塞穴.牧养', '嫁娶.安葬.行丧.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190309', '1', '假日', '己亥', '二月初三', '2-3', '猪', '惊蛰后', '六', 'Sat', '6', 'Saturday', '67', '10', '纳财.开市.交易.立券.开光.针灸.会亲友.理发.安床.造仓.结网', '移徙.入宅.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190310', '1', '假日', '己亥', '二月初四', '2-4', '猪', '惊蛰后', '日', 'Sun', '7', 'Sunday', '68', '10', '嫁娶.冠笄.会亲友.安机械.纳财.交易.立券.置产', '开市.造屋.治病.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190311', '0', '工作日', '己亥', '二月初五', '2-5', '猪', '惊蛰后', '一', 'Mon', '1', 'Monday', '69', '11', '嫁娶.造车器.纳采.订盟.祭祀.祈福.安机械.移徙.入宅.开市.立券.破土.安葬', '纳畜.理发.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190312', '0', '工作日', '己亥', '二月初六', '2-6', '猪', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '70', '11', '祈福.斋醮.出行.移徙.入宅.修造.动土.破土.安葬', '纳采.开光.安床.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190313', '0', '工作日', '己亥', '二月初七', '2-7', '猪', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '71', '11', '破屋.坏垣.余事勿取', '嫁娶.移徙.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190314', '0', '工作日', '己亥', '二月初八', '2-8', '猪', '惊蛰后', '四', 'Thu', '4', 'Thursday', '72', '11', '嫁娶.冠笄.祭祀.出行.会亲友.修造.动土.入殓.破土', '塑绘.开光.造桥.除服.成服', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190315', '0', '工作日', '己亥', '二月初九', '2-9', '猪', '惊蛰后', '五', 'Fri', '5', 'Friday', '73', '11', '开光.求嗣.出行.纳采.冠笄.出火.拆卸.起基.修造.动土.上梁.移徙.造船.开市.交易.立券.纳财', '祈福.嫁娶.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190316', '1', '假日', '己亥', '二月初十', '2-10', '猪', '惊蛰后', '六', 'Sat', '6', 'Saturday', '74', '11', '理发.冠笄.嫁娶.进人口.栽种.捕捉.针灸', '纳财.开市.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190317', '1', '假日', '己亥', '二月十一', '2-11', '猪', '惊蛰后', '日', 'Sun', '7', 'Sunday', '75', '11', '开光.祈福.求嗣.出行.解除.伐木.造屋.起基.修造.架马.安门.移徙.入宅.造庙.除服.成服.移柩.谢土.纳畜.牧养', '纳采.动土.开市.交易.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190318', '0', '工作日', '己亥', '二月十二', '2-12', '猪', '惊蛰后', '一', 'Mon', '1', 'Monday', '76', '12', '裁衣.经络.伐木.开柱眼.拆卸.修造.动土.上梁.合脊.合寿木.入殓.除服.成服.移柩.破土.安葬.启攒.修坟.立碑', '祭祀.嫁娶.出行.上梁.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190319', '0', '工作日', '己亥', '二月十三', '2-13', '猪', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '77', '12', '祭祀.会亲友.立券.交易.裁衣.合帐.嫁娶.冠笄.进人口', '栽种.动土.安葬.掘井.修坟.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190320', '0', '工作日', '己亥', '二月十四', '2-14', '猪', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '78', '12', '扫舍.塞穴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190321', '0', '工作日', '己亥', '二月十五', '2-15', '猪', '春分', '四', 'Thu', '4', 'Thursday', '79', '12', '塑绘.开光.订盟.纳采.裁衣.合帐.冠笄.安机械.会亲友.纳财.开市.立券.交易.安床.竖柱.上梁.结网.栽种.解除.经络', '作灶.出行.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190322', '0', '工作日', '己亥', '二月十六', '2-16', '猪', '春分后', '五', 'Fri', '5', 'Friday', '80', '12', '祭祀.嫁娶.纳婿.除服.成服.入殓.移柩', '动土.作灶.入宅.开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190323', '1', '假日', '己亥', '二月十七', '2-17', '猪', '春分后', '六', 'Sat', '6', 'Saturday', '81', '12', '祈福.求嗣.开光.塑绘.斋醮.订盟.纳采.嫁娶.拆卸.安床.入宅.安香.移柩.修坟.安葬.谢土.栽种.解除.冠笄.裁衣.移徙.修造.动土.竖柱.放水.启攒.立碑', '赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190324', '1', '假日', '己亥', '二月十八', '2-18', '猪', '春分后', '日', 'Sun', '7', 'Sunday', '82', '12', '祭祀.解除.入殓.除服.成服.移柩.启攒.安葬.修坟.立碑.谢土.沐浴.扫舍.捕捉.取渔.结网.畋猎.理发', '安床.嫁娶.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190325', '0', '工作日', '己亥', '二月十九', '2-19', '猪', '春分后', '一', 'Mon', '1', 'Monday', '83', '13', '破屋.坏垣', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190326', '0', '工作日', '己亥', '二月二十', '2-20', '猪', '春分后', '二', 'Tue', '2', 'Tuesday', '84', '13', '祭祀.出行.订盟.纳采.裁衣.合帐.冠笄.进人口.动土.安床.作灶.入殓.移柩.安葬.破土.结网.取渔.畋猎', '作梁.造庙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190327', '0', '工作日', '己亥', '二月廿一', '2-21', '猪', '春分后', '三', 'Wed', '3', 'Wednesday', '85', '13', '祭祀.开光.塑绘.订盟.纳采.合帐.冠笄.拆卸.动土.起基.上梁.入宅.安香.开市.立券.纳财.沐浴.求嗣.出火.竖柱.安门', '造庙.嫁娶.伐木.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190328', '0', '工作日', '己亥', '二月廿二', '2-22', '猪', '春分后', '四', 'Thu', '4', 'Thursday', '86', '13', '祭祀.沐浴.捕捉.栽种', '嫁娶.入宅.移徙.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190329', '0', '工作日', '己亥', '二月廿三', '2-23', '猪', '春分后', '五', 'Fri', '5', 'Friday', '87', '13', '祭祀.开光.塑绘.酬神.斋醮.订盟.纳采.嫁娶.裁衣.动土.起基.出火.拆卸.移徙.入宅.安香.修造.竖柱.上梁.纳畜.牧养.祈福.求嗣.解除.伐木.定磉.造屋.安门', '栽种.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190330', '1', '假日', '己亥', '二月廿四', '2-24', '猪', '春分后', '六', 'Sat', '6', 'Saturday', '88', '13', '订盟.纳采.冠笄.拆卸.修造.动土.安床.入殓.除服.成服.移柩.安葬.破土.启攒.造仓', '作灶.开光.嫁娶.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190331', '1', '假日', '己亥', '二月廿五', '2-25', '猪', '春分后', '日', 'Sun', '7', 'Sunday', '89', '13', '祈福.开光.塑绘.酬神.订盟.纳采.裁衣.安床.开市.立券.入殓.除服.成服.移柩.启攒.安葬.立碑.赴任.会亲友.出行.交易.竖柱', '作灶.掘井.动土.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190401', '0', '工作日', '己亥', '二月廿六', '2-26', '猪', '春分后', '一', 'Mon', '1', 'Monday', '90', '14', '祭祀.扫舍.塞穴', '栽种.作灶.安葬.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190402', '0', '工作日', '己亥', '二月廿七', '2-27', '猪', '春分后', '二', 'Tue', '2', 'Tuesday', '91', '14', '开光.塑绘.裁衣.冠笄.伐木.拆卸.竖柱.上梁.开仓.会亲友.安机械.造仓.造屋.交易.解除.开市.立券.纳财', '出行.嫁娶.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190403', '0', '工作日', '己亥', '二月廿八', '2-28', '猪', '春分后', '三', 'Wed', '3', 'Wednesday', '92', '14', '冠笄.入殓.除服.成服.移柩.平治道涂.修饰垣墙', '造屋.作灶.治病.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190404', '0', '工作日', '己亥', '二月廿九', '2-29', '猪', '春分后', '四', 'Thu', '4', 'Thursday', '93', '14', '祭祀.嫁娶.祈福.纳采.裁衣.合帐.安床.入宅.安香.入殓.移柩.安葬.谢土.修造.安碓硙.求嗣.会亲友.挂匾.交易.立券.纳财.造仓.放水', '栽种.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190405', '2', '节日', '己亥', '三月初一', '3-1', '猪', '清明', '五', 'Fri', '5', 'Friday', '94', '14', '祭祀.祈福.求嗣.斋醮.沐浴.纳畜.入殓.破土.安葬', '移徙.入宅.嫁娶.出行.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190406', '1', '假日', '己亥', '三月初二', '3-2', '猪', '清明后', '六', 'Sat', '6', 'Saturday', '95', '14', '纳采.祭祀.祈福.求嗣.斋醮.出行.起基.造屋.定磉.安门.入殓.安葬', '嫁娶.开市.纳财.出火', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190407', '1', '假日', '己亥', '三月初三', '3-3', '猪', '清明后', '日', 'Sun', '7', 'Sunday', '96', '14', '祭祀.沐浴.解除.求医.治病.破屋.坏垣.余事勿取', '祈福.斋醮.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190408', '0', '工作日', '己亥', '三月初四', '3-4', '猪', '清明后', '一', 'Mon', '1', 'Monday', '97', '15', '沐浴.捕捉.畋猎.结网.取渔', '祭祀.嫁娶.入宅.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190409', '0', '工作日', '己亥', '三月初五', '3-5', '猪', '清明后', '二', 'Tue', '2', 'Tuesday', '98', '15', '祭祀.祈福.求嗣.斋醮.纳采.订盟.开光.竖柱.上梁.开仓.出货财.造屋.起基.定磉.安门.诸事不宜.破土.入殓.启攒.谢土', '出火.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190410', '0', '工作日', '己亥', '三月初六', '3-6', '猪', '清明后', '三', 'Wed', '3', 'Wednesday', '99', '15', '祭祀.捕捉.解除.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190411', '0', '工作日', '己亥', '三月初七', '3-7', '猪', '清明后', '四', 'Thu', '4', 'Thursday', '100', '15', '纳采.嫁娶.出行.开市.立券.纳畜.牧养.出火.移徙.入宅', '祈福.动土.破土.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190412', '0', '工作日', '己亥', '三月初八', '3-8', '猪', '清明后', '五', 'Fri', '5', 'Friday', '101', '15', '祭祀.祈福.求嗣.斋醮.冠笄.作灶.纳财.交易', '开光.嫁娶.掘井.安葬.安门.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190413', '1', '假日', '己亥', '三月初九', '3-9', '猪', '清明后', '六', 'Sat', '6', 'Saturday', '102', '15', '祭祀.解除.教牛马.出行.余事勿取', '动土.破土.行丧.开光.作梁.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190414', '1', '假日', '己亥', '三月初十', '3-10', '猪', '清明后', '日', 'Sun', '7', 'Sunday', '103', '15', '沐浴.斋醮.解除.求医.治病.会亲友.造畜椆栖.栽种.理发.扫舍', '开市.嫁娶.移徙.入宅.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190415', '0', '工作日', '己亥', '三月十一', '3-11', '猪', '清明后', '一', 'Mon', '1', 'Monday', '104', '16', '求嗣.出行.解除.订盟.纳采.嫁娶.会亲友.进人口.安床.开市.交易.纳畜.牧养.入殓.除服.成服.移柩.安葬.启攒', '祈福.开市.修造.动土.破土.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190416', '0', '工作日', '己亥', '三月十二', '3-12', '猪', '清明后', '二', 'Tue', '2', 'Tuesday', '105', '16', '祭祀.作灶.平治道涂.余事勿取', '嫁娶.安葬.动土.安床.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190417', '0', '工作日', '己亥', '三月十三', '3-13', '猪', '清明后', '三', 'Wed', '3', 'Wednesday', '106', '16', '造车器.祭祀.祈福.求嗣.斋醮.开市.交易.安机械.雕刻.开光.造屋.合脊.起基.定磉.安门.纳畜.安葬.开生坟.立碑.谢土.斋醮', '入宅.动土.开仓.出货财', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190418', '0', '工作日', '己亥', '三月十四', '3-14', '猪', '清明后', '四', 'Thu', '4', 'Thursday', '107', '16', '祭祀.祈福.开光.求嗣.斋醮.纳采.订盟.求医.治病.起基.定磉.造船.取渔.解除.安葬.启攒.谢土.入殓', '开市.动土.掘井.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190419', '0', '工作日', '己亥', '三月十五', '3-15', '猪', '清明后', '五', 'Fri', '5', 'Friday', '108', '16', '祭祀.沐浴.破屋.坏垣.求医.治病.解除.余事勿取', '嫁娶.开市.交易.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190420', '1', '假日', '己亥', '三月十六', '3-16', '猪', '谷雨', '六', 'Sat', '6', 'Saturday', '109', '16', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190421', '1', '假日', '己亥', '三月十七', '3-17', '猪', '谷雨后', '日', 'Sun', '7', 'Sunday', '110', '16', '祭祀.塑绘.开光.订盟.纳采.冠笄.裁衣.安机械.拆卸.修造.动土.安床.经络.开市', '出火.入宅.安葬.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190422', '0', '工作日', '己亥', '三月十八', '3-18', '猪', '谷雨后', '一', 'Mon', '1', 'Monday', '111', '17', '祭祀.余事勿取', '造庙.嫁娶.安床.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190423', '0', '工作日', '己亥', '三月十九', '3-19', '猪', '谷雨后', '二', 'Tue', '2', 'Tuesday', '112', '17', '订盟.纳采.嫁娶.进人口.会亲友.交易.立券.动土.除服.谢土.移柩.破土.启攒.赴任.出行.开市.纳财.栽种', '入殓.安葬.入宅.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190424', '0', '工作日', '己亥', '三月二十', '3-20', '猪', '谷雨后', '三', 'Wed', '3', 'Wednesday', '113', '17', '祭祀.祈福.裁衣.合帐.安床.入殓.除服.成服.移柩.破土.启攒.安葬.谢土.立碑.造畜椆栖', '掘井.安门.嫁娶.纳采', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190425', '0', '工作日', '己亥', '三月廿一', '3-21', '猪', '谷雨后', '四', 'Thu', '4', 'Thursday', '114', '17', '祭祀.进人口.嫁娶.安床.解除.冠笄.出行.裁衣.扫舍', '掘井.动土.破土.安葬.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190426', '0', '工作日', '己亥', '三月廿二', '3-22', '猪', '谷雨后', '五', 'Fri', '5', 'Friday', '115', '17', '纳采.开光.求医.治病.动土.上梁.移徙.入宅', '嫁娶.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190427', '0', '工作日', '己亥', '三月廿三', '3-23', '猪', '谷雨后', '六', 'Sat', '6', 'Saturday', '116', '17', '祭祀.会亲友.开市.安床.启攒.安葬', '嫁娶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190428', '0', '工作日', '己亥', '三月廿四', '3-24', '猪', '谷雨后', '日', 'Sun', '7', 'Sunday', '117', '17', '祭祀.作灶.掘井.平治道涂', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190429', '1', '假日', '己亥', '三月廿五', '3-25', '猪', '谷雨后', '一', 'Mon', '1', 'Monday', '118', '18', '祭祀.斋醮.开市.动土.入殓.破土.安葬', '嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190430', '1', '假日', '己亥', '三月廿六', '3-26', '猪', '谷雨后', '二', 'Tue', '2', 'Tuesday', '119', '18', '嫁娶.纳采.祭祀.祈福.出行.移徙.求医', '开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190501', '2', '节日', '己亥', '三月廿七', '3-27', '猪', '谷雨后', '三', 'Wed', '3', 'Wednesday', '120', '18', '祭祀.求医.治病.解除.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190502', '0', '工作日', '己亥', '三月廿八', '3-28', '猪', '谷雨后', '四', 'Thu', '4', 'Thursday', '121', '18', '沐浴.结网.取渔', '嫁娶.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190503', '0', '工作日', '己亥', '三月廿九', '3-29', '猪', '谷雨后', '五', 'Fri', '5', 'Friday', '122', '18', NULL, '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190504', '1', '假日', '己亥', '三月三十', '3-30', '猪', '谷雨后', '六', 'Sat', '6', 'Saturday', '123', '18', '解除.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190505', '1', '假日', '己亥', '四月初一', '4-1', '猪', '谷雨后', '日', 'Sun', '7', 'Sunday', '124', '18', '嫁娶.开光.出行.出火.拆卸.进人口.开市.立券.交易.挂匾.入宅.移徙.安床.栽种', '祈福.入殓.祭祀.作灶.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190506', '0', '工作日', '己亥', '四月初二', '4-2', '猪', '立夏', '一', 'Mon', '1', 'Monday', '125', '19', '祭祀.祈福.求嗣.开光.纳采.订盟.嫁娶.出行.动土.破土.会亲友.开市.交易.立券.习艺.拆卸.起基.安碓硙.放水.开池.造仓.开渠.栽种.谢土.启攒.修坟.立碑', '入宅.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190507', '0', '工作日', '己亥', '四月初三', '4-3', '猪', '立夏后', '二', 'Tue', '2', 'Tuesday', '126', '19', '嫁娶.冠笄.祭祀.出行.移徙.入宅.作灶.造车器.补垣.塞穴.作厕.破土.启攒.除服.成服.入殓', '入宅.造屋.造桥.安门.安葬.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190508', '0', '工作日', '己亥', '四月初四', '4-4', '猪', '立夏后', '三', 'Wed', '3', 'Wednesday', '127', '19', '祭祀.解除.断蚁.会亲友.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190509', '0', '工作日', '己亥', '四月初五', '4-5', '猪', '立夏后', '四', 'Thu', '4', 'Thursday', '128', '19', '嫁娶.纳采.订盟.祭祀.祈福.治病.造车器.修造.动土.移徙.入宅', '开市.出行.安床.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190510', '0', '工作日', '己亥', '四月初六', '4-6', '猪', '立夏后', '五', 'Fri', '5', 'Friday', '129', '19', '嫁娶.纳采.订盟.会亲友.安机械.结网.冠笄.祭祀.求嗣.进人口.经络', '开市.作灶.动土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190511', '1', '假日', '己亥', '四月初七', '4-7', '猪', '立夏后', '六', 'Sat', '6', 'Saturday', '130', '19', '祭祀.沐浴.移徙.破土.安葬.扫舍.平治道涂', '祈福.嫁娶.入宅.安床.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190512', '1', '假日', '己亥', '四月初八', '4-8', '猪', '立夏后', '日', 'Sun', '7', 'Sunday', '131', '19', '祭祀.祈福.斋醮.求嗣.安机械.纳畜.移徙.入宅.安机械.塑绘.开光.起基.竖柱.上梁.作灶.安门.安香.出火.造屋.启攒.安葬', '动土.破土.嫁娶.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190513', '0', '工作日', '己亥', '四月初九', '4-9', '猪', '立夏后', '一', 'Mon', '1', 'Monday', '132', '20', '嫁娶.纳采.订盟.斋醮.开光.祭祀.祈福.求医.治病.会亲友.动土.解除.捕捉.纳畜.牧养.入殓.破土.安葬', '移徙.入宅.造屋.架马', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190514', '0', '工作日', '己亥', '四月初十', '4-10', '猪', '立夏后', '二', 'Tue', '2', 'Tuesday', '133', '20', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190515', '0', '工作日', '己亥', '四月十一', '4-11', '猪', '立夏后', '三', 'Wed', '3', 'Wednesday', '134', '20', '沐浴.扫舍.余事勿取', '斋醮.开市.嫁娶.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190516', '0', '工作日', '己亥', '四月十二', '4-12', '猪', '立夏后', '四', 'Thu', '4', 'Thursday', '135', '20', '开市.交易.立券.安机械.会亲友.开光.求医.治病.造屋.起基.修造.动土.定磉.竖柱.上梁.安门.作灶.放水.作厕.开池.栽种.牧养.造畜椆栖.破土.安葬.立碑', '嫁娶.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190517', '0', '工作日', '己亥', '四月十三', '4-13', '猪', '立夏后', '五', 'Fri', '5', 'Friday', '136', '20', '栽种.捕捉.畋猎.余事勿取', '开市.动土.祭祀.斋醮.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190518', '1', '假日', '己亥', '四月十四', '4-14', '猪', '立夏后', '六', 'Sat', '6', 'Saturday', '137', '20', '嫁娶.祭祀.祈福.求嗣.斋醮.订盟.纳采.解除.出行.动土.破土.习艺.针灸.理发.会亲友.起基.修造.动土.竖柱.定磉.安床.拆卸.纳畜.牧养.放水.破土.除服.成服.修坟.立碑', '开市.入宅.探病.出火.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190519', '1', '假日', '己亥', '四月十五', '4-15', '猪', '立夏后', '日', 'Sun', '7', 'Sunday', '138', '20', '余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190520', '0', '工作日', '己亥', '四月十六', '4-16', '猪', '立夏后', '一', 'Mon', '1', 'Monday', '139', '21', '塞穴.断蚁.结网.余事勿取', '破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190521', '0', '工作日', '己亥', '四月十七', '4-17', '猪', '小满', '二', 'Tue', '2', 'Tuesday', '140', '21', '开光.出行.纳采.嫁娶.伐木.架马.出火.拆卸.移徙.入宅.造庙.造桥.造船.造畜椆栖.开市.入殓.除服.成服.移柩.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190522', '0', '工作日', '己亥', '四月十八', '4-18', '猪', '小满后', '三', 'Wed', '3', 'Wednesday', '141', '21', '进人口.牧养.置产.塞穴.结网.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190523', '0', '工作日', '己亥', '四月十九', '4-19', '猪', '小满后', '四', 'Thu', '4', 'Thursday', '142', '21', '开光.出行.嫁娶', '会亲友.进人口.修造.动土.起基.移徙.开市.纳畜.入殓.除服.成服.移柩.破土.安葬.修坟.立碑.会亲友', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190524', '0', '工作日', '己亥', '四月二十', '4-20', '猪', '小满后', '五', 'Fri', '5', 'Friday', '143', '21', '嫁娶.纳采.出行.祭祀.祈福.开市.动土.移徙.入宅.破土.安葬', '安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190525', '1', '假日', '己亥', '四月廿一', '4-21', '猪', '小满后', '六', 'Sat', '6', 'Saturday', '144', '21', '嫁娶.纳采.求医.治病.修造.动土.移徙.入宅.破土.安葬', '开市.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190526', '1', '假日', '己亥', '四月廿二', '4-22', '猪', '小满后', '日', 'Sun', '7', 'Sunday', '145', '21', '祭祀.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190527', '0', '工作日', '己亥', '四月廿三', '4-23', '猪', '小满后', '一', 'Mon', '1', 'Monday', '146', '22', '嫁娶.纳采.祭祀.祈福.出行.动土.上梁.移徙.入宅.破土.安葬', '祈福.斋醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190528', '0', '工作日', '己亥', '四月廿四', '4-24', '猪', '小满后', '二', 'Tue', '2', 'Tuesday', '147', '22', '纳采.祭祀.祈福.开市.求医.治病.动土.纳畜', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190529', '0', '工作日', '己亥', '四月廿五', '4-25', '猪', '小满后', '三', 'Wed', '3', 'Wednesday', '148', '22', '嫁娶.纳采.出行.移徙.入宅', '动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190530', '0', '工作日', '己亥', '四月廿六', '4-26', '猪', '小满后', '四', 'Thu', '4', 'Thursday', '149', '22', '订盟.纳采.祭祀.动土.破土.交易.立券', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190531', '0', '工作日', '己亥', '四月廿七', '4-27', '猪', '小满后', '五', 'Fri', '5', 'Friday', '150', '22', '嫁娶.裁衣.祭祀.出行.安床.作灶.移徙.入宅.破土.安葬', '赴任.捕捉', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190601', '1', '假日', '己亥', '四月廿八', '4-28', '猪', '小满后', '六', 'Sat', '6', 'Saturday', '151', '22', '塞穴.结网.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190602', '1', '假日', '己亥', '四月廿九', '4-29', '猪', '小满后', '日', 'Sun', '7', 'Sunday', '152', '22', '嫁娶.订盟.纳采.出行.祭祀.祈福.斋醮.动土.上梁.破土.安葬', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190603', '0', '工作日', '己亥', '五月初一', '5-1', '猪', '小满后', '一', 'Mon', '1', 'Monday', '153', '23', '订盟.纳采.会亲友.安床.作灶.造畜椆栖', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190604', '0', '工作日', '己亥', '五月初二', '5-2', '猪', '小满后', '二', 'Tue', '2', 'Tuesday', '154', '23', '沐浴.平治道涂.扫舍.入殓.移柩.破土.启攒.安葬.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190605', '0', '工作日', '己亥', '五月初三', '5-3', '猪', '小满后', '三', 'Wed', '3', 'Wednesday', '155', '23', '嫁娶.祭祀.祈福.求嗣.开光.出行.出火.拆卸.动土.上梁.进人口.入宅.移徙.安床.安门.开市.交易.立券.挂匾.栽种.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190606', '0', '工作日', '己亥', '五月初四', '5-4', '猪', '芒种', '四', 'Thu', '4', 'Thursday', '156', '23', '嫁娶.纳采.祭祀.祈福.出行.立券.移徙.入宅.动土.破土.安葬', '开光.作灶.造屋.架马.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190607', '2', '节日', '己亥', '五月初五', '5-5', '猪', '芒种后', '五', 'Fri', '5', 'Friday', '157', '23', '纳采.订盟.冠笄.祭祀.祈福.斋醮.出行.修造.动土.移徙.入宅.安香.出火.拆卸.造屋.起基.竖柱.上梁.定磉.安门.开池', '嫁娶.开市.合寿木.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190608', '1', '假日', '己亥', '五月初六', '5-6', '猪', '芒种后', '六', 'Sat', '6', 'Saturday', '158', '23', '祭祀.沐浴.破屋.坏垣.余事勿取', '入宅.嫁娶.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190609', '1', '假日', '己亥', '五月初七', '5-7', '猪', '芒种后', '日', 'Sun', '7', 'Sunday', '159', '23', '嫁娶.安机械.交易.出行.祭祀.祈福.求嗣.斋醮.塑绘.开光.合帐.裁衣.放水.开池.掘井', '作灶.理发.造桥.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190610', '0', '工作日', '己亥', '五月初八', '5-8', '猪', '芒种后', '一', 'Mon', '1', 'Monday', '160', '24', '纳采.冠笄.求医.治病.开市.立券.修造.动土.安机械.破土.安葬', '斋醮.祭祀.移徙.入宅.上梁.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190611', '0', '工作日', '己亥', '五月初九', '5-9', '猪', '芒种后', '二', 'Tue', '2', 'Tuesday', '161', '24', '祭祀.作灶.余事勿取', '开市.安葬.破土.修坟.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190612', '0', '工作日', '己亥', '五月初十', '5-10', '猪', '芒种后', '三', 'Wed', '3', 'Wednesday', '162', '24', '祭祀.祈福.求嗣.斋醮.安香.解除.移徙.入宅.会亲友.求医.治病.动土.破土.开生坟.合寿木', '合帐.上梁.经络.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190613', '0', '工作日', '己亥', '五月十一', '5-11', '猪', '芒种后', '四', 'Thu', '4', 'Thursday', '163', '24', '嫁娶.冠笄.修造.动土.作灶.移徙.入宅.补垣.塞穴.纳畜.牧养.架马.修造.动土.起基.定磉.开池.造船', '祈福.开光.掘井.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190614', '0', '工作日', '己亥', '五月十二', '5-12', '猪', '芒种后', '五', 'Fri', '5', 'Friday', '164', '24', '祭祀.交易.纳财', '斋醮.开渠.上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190615', '1', '假日', '己亥', '五月十三', '5-13', '猪', '芒种后', '六', 'Sat', '6', 'Saturday', '165', '24', '嫁娶.订盟.纳采.冠笄.会亲友.安机械.造车器.祭祀.出行.纳财.入宅.安香.出火.入学.塑绘.开光.拆卸.起基.修造.动土.牧养.栽种.安门.作厕', '行丧.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190616', '1', '假日', '己亥', '五月十四', '5-14', '猪', '芒种后', '日', 'Sun', '7', 'Sunday', '166', '24', '开光.求嗣.出行.冠笄.嫁娶.伐木.架马.开柱眼.修造.移徙.入宅.开市.交易.立券.出行.安香.出火.挂匾.起基.修造.开生坟.合寿木.入殓.除服.成服.移柩.安葬', '安床.出货财.作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190617', '0', '工作日', '己亥', '五月十五', '5-15', '猪', '芒种后', '一', 'Mon', '1', 'Monday', '167', '25', '祭祀.沐浴.理发.嫁娶.作灶.整手足甲.扫舍.修饰垣墙.平治道涂', '斋醮.出行.治病.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190618', '0', '工作日', '己亥', '五月十六', '5-16', '猪', '芒种后', '二', 'Tue', '2', 'Tuesday', '168', '25', '安机械.移徙.入宅.出行.祭祀.祈福.斋醮.纳采.订盟.安香.出火.解除.会亲友.修造.动土.拆卸.起基.定磉.移徙.入宅.造屋.安床.修造.破土.安葬.入殓.立碑', '开市.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190619', '0', '工作日', '己亥', '五月十七', '5-17', '猪', '芒种后', '三', 'Wed', '3', 'Wednesday', '169', '25', '祭祀.沐浴.捕捉.结网.畋猎.取渔.余事勿取', '开市.交易.嫁娶.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190620', '0', '工作日', '己亥', '五月十八', '5-18', '猪', '芒种后', '四', 'Thu', '4', 'Thursday', '170', '25', '破屋.坏垣.求医.治病.畋猎.余事勿取', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190621', '0', '工作日', '己亥', '五月十九', '5-19', '猪', '夏至', '五', 'Fri', '5', 'Friday', '171', '25', '嫁娶.出行.安机械.祭祀.塑绘.开光.治病.经络.安床.结网.塞穴.破土.入殓', '开市.安门.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190622', '1', '假日', '己亥', '五月二十', '5-20', '猪', '夏至后', '六', 'Sat', '6', 'Saturday', '172', '25', '订盟.纳采.会亲友.进人口.雕刻.拆卸.修造.动土.起基.开市.栽种.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190623', '1', '假日', '己亥', '五月廿一', '5-21', '猪', '夏至后', '日', 'Sun', '7', 'Sunday', '173', '25', '祭祀.捕捉.取渔.修饰垣墙.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190624', '0', '工作日', '己亥', '五月廿二', '5-22', '猪', '夏至后', '一', 'Mon', '1', 'Monday', '174', '26', '嫁娶.纳采.祭祀.祈福.求医.治病.出行.动土.移徙.入宅', '开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190625', '0', '工作日', '己亥', '五月廿三', '5-23', '猪', '夏至后', '二', 'Tue', '2', 'Tuesday', '175', '26', '裁衣.作灶.移徙.入宅.纳畜', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190626', '0', '工作日', '己亥', '五月廿四', '5-24', '猪', '夏至后', '三', 'Wed', '3', 'Wednesday', '176', '26', '祭祀.入殓.移柩.启攒.安葬', '上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190627', '0', '工作日', '己亥', '五月廿五', '5-25', '猪', '夏至后', '四', 'Thu', '4', 'Thursday', '177', '26', '订盟.纳采.出行.祈福.斋醮.安床.会亲友', '移徙.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190628', '0', '工作日', '己亥', '五月廿六', '5-26', '猪', '夏至后', '五', 'Fri', '5', 'Friday', '178', '26', '嫁娶.纳采.出行.求医.治病.开市.移徙.入宅.启攒.安葬', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190629', '1', '假日', '己亥', '五月廿七', '5-27', '猪', '夏至后', '六', 'Sat', '6', 'Saturday', '179', '26', '嫁娶.祭祀.沐浴.扫舍.修饰垣墙', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190630', '1', '假日', '己亥', '五月廿八', '5-28', '猪', '夏至后', '日', 'Sun', '7', 'Sunday', '180', '26', '嫁娶.订盟.纳采.出行.开市.祭祀.祈福.动土.移徙.入宅.破土.安葬', '作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190701', '0', '工作日', '己亥', '五月廿九', '5-29', '猪', '夏至后', '一', 'Mon', '1', 'Monday', '181', '27', '订盟.纳采.出行.祭祀.祈福.修造.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190702', '0', '工作日', '己亥', '五月三十', '5-30', '猪', '夏至后', '二', 'Tue', '2', 'Tuesday', '182', '27', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190703', '0', '工作日', '己亥', '六月初一', '6-1', '猪', '夏至后', '三', 'Wed', '3', 'Wednesday', '183', '27', '嫁娶.订盟.纳采.祭祀.祈福.入殓.破土.安葬', '开光.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190704', '0', '工作日', '己亥', '六月初二', '6-2', '猪', '夏至后', '四', 'Thu', '4', 'Thursday', '184', '27', '开光.求医.治病.动土.上梁.入殓.破土.安葬', '嫁娶.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190705', '0', '工作日', '己亥', '六月初三', '6-3', '猪', '夏至后', '五', 'Fri', '5', 'Friday', '185', '27', '祭祀.栽种.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190706', '1', '假日', '己亥', '六月初四', '6-4', '猪', '夏至后', '六', 'Sat', '6', 'Saturday', '186', '27', '嫁娶.开光.祭祀.祈福.求嗣.出行.解除.伐木.入宅.移徙.安床.出火.拆卸.修造.上梁.栽种.移柩', '安葬.开市.交易.立券', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190707', '1', '假日', '己亥', '六月初五', '6-5', '猪', '小暑', '日', 'Sun', '7', 'Sunday', '187', '27', '纳采.订盟.嫁娶.祭祀.沐浴.塑绘.开光.出火.治病.习艺.伐木.造屋.竖柱.上梁.安床.作灶.安碓硙.挂匾.掘井.纳畜', '出行.安葬.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190708', '0', '工作日', '己亥', '六月初六', '6-6', '猪', '小暑后', '一', 'Mon', '1', 'Monday', '188', '28', '祭祀.入殓.除服.成服.移柩.破土.启攒.安葬.塞穴.断蚁.结网', '开市.入宅.嫁娶.开光.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190709', '0', '工作日', '己亥', '六月初七', '6-7', '猪', '小暑后', '二', 'Tue', '2', 'Tuesday', '189', '28', '祭祀.修造.出行.造屋.竖柱.造车器.教牛马.造畜椆栖.割蜜', '动土.破土.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190710', '0', '工作日', '己亥', '六月初八', '6-8', '猪', '小暑后', '三', 'Wed', '3', 'Wednesday', '190', '28', '祭祀.沐浴.塑绘.开光.入学.解除.扫舍.治病.开池.牧养', '嫁娶.出行.纳采.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190711', '0', '工作日', '己亥', '六月初九', '6-9', '猪', '小暑后', '四', 'Thu', '4', 'Thursday', '191', '28', '纳财.开市.交易.立券.出行.祭祀.祈福.求嗣.开光.解除.扫舍.起基.竖柱.安床.移徙.开仓.出货财.补垣.塞穴.栽种.纳畜.牧养', '斋醮.入宅.安门.安葬.破土.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190712', '0', '工作日', '己亥', '六月初十', '6-10', '猪', '小暑后', '五', 'Fri', '5', 'Friday', '192', '28', '祭祀.修饰垣墙.平治道涂', '开市.动土.破土.嫁娶.修造.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190713', '1', '假日', '己亥', '六月十一', '6-11', '猪', '小暑后', '六', 'Sat', '6', 'Saturday', '193', '28', '订盟.纳采.祭祀.祈福.开光.安香.出火.立券.安机械.移徙.入宅.竖柱.上梁.会亲友.安床.拆卸.挂匾.牧养.教牛马', '嫁娶.安葬.行丧.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190714', '1', '假日', '己亥', '六月十二', '6-12', '猪', '小暑后', '日', 'Sun', '7', 'Sunday', '194', '28', '沐浴.理发.捕捉.入殓.移柩.破土.启攒.安葬', '出火.嫁娶.入宅.作灶.破土.上梁.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190715', '0', '工作日', '己亥', '六月十三', '6-13', '猪', '小暑后', '一', 'Mon', '1', 'Monday', '195', '29', '求医.治病.破屋.坏垣.余事勿取', '嫁娶.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190716', '0', '工作日', '己亥', '六月十四', '6-14', '猪', '小暑后', '二', 'Tue', '2', 'Tuesday', '196', '29', '纳采.订盟.嫁娶.移徙.入宅.出行.开市.交易.立券.纳财.会亲友.安香.出火.拆卸.造屋.起基.安床.作灶.挂匾.安葬.破土.启攒.立碑.入殓.移柩', '祈福.上梁.开仓.掘井.牧养', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190717', '0', '工作日', '己亥', '六月十五', '6-15', '猪', '小暑后', '三', 'Wed', '3', 'Wednesday', '197', '29', '祭祀.祈福.斋醮.出行.纳采.订盟.安机械.出火.拆卸.修造.动土.起基.移徙.入宅.造庙.入殓.除服.成服.移柩.破土.安葬.谢土', '嫁娶.开市.栽种.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190718', '0', '工作日', '己亥', '六月十六', '6-16', '猪', '小暑后', '四', 'Thu', '4', 'Thursday', '198', '29', '祭祀.进人口.纳财.纳畜.牧养.捕捉.余事勿取', '开市.入宅.安床.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190719', '0', '工作日', '己亥', '六月十七', '6-17', '猪', '小暑后', '五', 'Fri', '5', 'Friday', '199', '29', '祭祀.塑绘.开光.求医.治病.嫁娶.会亲友.放水.掘井.牧养.纳畜.开渠.安碓硙', '造屋.入宅.作灶.入学.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190720', '1', '假日', '己亥', '六月十八', '6-18', '猪', '小暑后', '六', 'Sat', '6', 'Saturday', '200', '29', '祭祀.塞穴.结网.畋猎.余事勿取', '移徙.开市.入宅.嫁娶.开光.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190721', '1', '假日', '己亥', '六月十九', '6-19', '猪', '小暑后', '日', 'Sun', '7', 'Sunday', '201', '29', '开市.纳财.祭祀.塑绘.安机械.冠笄.会亲友.裁衣.开仓.经络.纳畜.造畜椆栖.教牛马.牧养', '动土.破土.安葬.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190722', '0', '工作日', '己亥', '六月二十', '6-20', '猪', '小暑后', '一', 'Mon', '1', 'Monday', '202', '30', '移徙.入宅.治病.会亲友.祭祀.祈福.斋醮.安香.移徙.嫁娶.造屋.起基', '开市.斋醮.安床.出行.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190723', '0', '工作日', '己亥', '六月廿一', '6-21', '猪', '大暑', '二', 'Tue', '2', 'Tuesday', '203', '30', '塑绘.出行.冠笄.嫁娶.进人口.裁衣.纳婿.造畜椆栖.交易.立券.牧养.开生坟.入殓.除服.成服.移柩.安葬.启攒', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190724', '0', '工作日', '己亥', '六月廿二', '6-22', '猪', '大暑后', '三', 'Wed', '3', 'Wednesday', '204', '30', '祭祀.冠笄.嫁娶.捕捉.结网.畋猎.取渔.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190725', '0', '工作日', '己亥', '六月廿三', '6-23', '猪', '大暑后', '四', 'Thu', '4', 'Thursday', '205', '30', '沐浴.扫舍.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190726', '0', '工作日', '己亥', '六月廿四', '6-24', '猪', '大暑后', '五', 'Fri', '5', 'Friday', '206', '30', '纳采.祭祀.祈福.解除.动土.破土.安葬', '嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190727', '1', '假日', '己亥', '六月廿五', '6-25', '猪', '大暑后', '六', 'Sat', '6', 'Saturday', '207', '30', '祭祀.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190728', '1', '假日', '己亥', '六月廿六', '6-26', '猪', '大暑后', '日', 'Sun', '7', 'Sunday', '208', '30', '嫁娶.纳采.开市.出行.动土.上梁.移徙.入宅.破土.安葬', '祭祀.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190729', '0', '工作日', '己亥', '六月廿七', '6-27', '猪', '大暑后', '一', 'Mon', '1', 'Monday', '209', '31', '嫁娶.纳采.开市.出行.动土.上梁.移徙.入宅.破土.安葬', '赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190730', '0', '工作日', '己亥', '六月廿八', '6-28', '猪', '大暑后', '二', 'Tue', '2', 'Tuesday', '210', '31', '祭祀.作灶.纳财.捕捉', '开市.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190731', '0', '工作日', '己亥', '六月廿九', '6-29', '猪', '大暑后', '三', 'Wed', '3', 'Wednesday', '211', '31', '嫁娶.开市.立券.祭祀.祈福.动土.移徙.入宅', '造庙.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190801', '0', '工作日', '己亥', '七月初一', '7-1', '猪', '大暑后', '四', 'Thu', '4', 'Thursday', '212', '31', '补垣.塞穴.结网.入殓.除服.成服.移柩.安葬.启攒.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190802', '0', '工作日', '己亥', '七月初二', '7-2', '猪', '大暑后', '五', 'Fri', '5', 'Friday', '213', '31', '嫁娶.纳采.出行.祭祀.祈福.解除.移徙.入宅', '动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190803', '1', '假日', '己亥', '七月初三', '7-3', '猪', '大暑后', '六', 'Sat', '6', 'Saturday', '214', '31', '嫁娶.祭祀.祈福.斋醮.治病.破土.安葬', '开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190804', '1', '假日', '己亥', '七月初四', '7-4', '猪', '大暑后', '日', 'Sun', '7', 'Sunday', '215', '31', '嫁娶.出行.开市.安床.入殓.启攒.安葬', '祈福.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190805', '0', '工作日', '己亥', '七月初五', '7-5', '猪', '大暑后', '一', 'Mon', '1', 'Monday', '216', '32', '嫁娶.祭祀.裁衣.结网.冠笄.沐浴', '开仓.出货财.置产.安葬.动土.破土.掘井.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190806', '0', '工作日', '己亥', '七月初六', '7-6', '猪', '大暑后', '二', 'Tue', '2', 'Tuesday', '217', '32', '入宅.移徙.安床.开光.祈福.求嗣.进人口.开市.交易.立券.出火.拆卸.修造.动土', '嫁娶.破土.置产.栽种.安葬.修坟.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190807', '0', '工作日', '己亥', '七月初七', '7-7', '猪', '大暑后', '三', 'Wed', '3', 'Wednesday', '218', '32', '祭祀.解除.沐浴.整手足甲.入殓.移柩.破土.启攒.安葬', '嫁娶.入宅.移徙.作灶.开市.交易.安门.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190808', '0', '工作日', '己亥', '七月初八', '7-8', '猪', '立秋', '四', 'Thu', '4', 'Thursday', '219', '32', '祭祀.普渡.捕捉.解除.结网.畋猎.入殓.破土.安葬', '开市.交易.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190809', '0', '工作日', '己亥', '七月初九', '7-9', '猪', '立秋后', '五', 'Fri', '5', 'Friday', '220', '32', '沐浴.破屋.坏垣.余事勿取', '斋醮.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190810', '1', '假日', '己亥', '七月初十', '7-10', '猪', '立秋后', '六', 'Sat', '6', 'Saturday', '221', '32', '订盟.纳采.祭祀.祈福.安香.出火.开市.立券.入宅.挂匾.造桥.启攒.安葬', '动土.破土.嫁娶.掘井.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190811', '1', '假日', '己亥', '七月十一', '7-11', '猪', '立秋后', '日', 'Sun', '7', 'Sunday', '222', '32', '嫁娶.祭祀.祈福.斋醮.普渡.移徙.入宅.动土.治病.开市.交易.立券.开光.修造.造车器.安香.安床.捕捉.畋猎.结网', '纳采.订盟.经络.行丧.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190812', '0', '工作日', '己亥', '七月十二', '7-12', '猪', '立秋后', '一', 'Mon', '1', 'Monday', '223', '33', '嫁娶.订盟.纳采.作灶.冠笄.裁衣.会亲友.纳畜.牧养.安机械.开市.立券.纳财.安床', '掘井.出行.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190813', '0', '工作日', '己亥', '七月十三', '7-13', '猪', '立秋后', '二', 'Tue', '2', 'Tuesday', '224', '33', '嫁娶.订盟.纳采.祭祀.斋醮.普渡.解除.出行.会亲友.开市.纳财.修造.动土.竖柱.上梁.开光.开仓.出货财.纳畜.牧养.开池.破土.启攒', '出火.入宅.造屋.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190814', '0', '工作日', '己亥', '七月十四', '7-14', '猪', '立秋后', '三', 'Wed', '3', 'Wednesday', '225', '33', '嫁娶.普渡.祭祀.祈福.补垣.塞穴.断蚁.筑堤.入殓.除服.成服.安葬', '动土.破土.掘井.开光.上梁.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190815', '0', '工作日', '己亥', '七月十五', '7-15', '猪', '立秋后', '四', 'Thu', '4', 'Thursday', '226', '33', '嫁娶.冠笄.祭祀.沐浴.普渡.出行.纳财.扫舍.纳畜.赴任', '开市.动土.破土.安床.开仓.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190816', '0', '工作日', '己亥', '七月十六', '7-16', '猪', '立秋后', '五', 'Fri', '5', 'Friday', '227', '33', '祭祀.沐浴.理发.整手足甲.冠笄.解除.入殓.移柩.破土.启攒.安葬', '嫁娶.出行.入宅.开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190817', '1', '假日', '己亥', '七月十七', '7-17', '猪', '立秋后', '六', 'Sat', '6', 'Saturday', '228', '33', '塑绘.冠笄.嫁娶.会亲友.进人口.经络.裁衣.栽种.纳畜.牧养.补垣.塞穴.捕捉', '祈福.开市.动土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190818', '1', '假日', '己亥', '七月十八', '7-18', '猪', '立秋后', '日', 'Sun', '7', 'Sunday', '229', '33', '出行.沐浴.订盟.纳采.裁衣.竖柱.上梁.移徙.纳畜.牧养', '嫁娶.安门.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190819', '0', '工作日', '己亥', '七月十九', '7-19', '猪', '立秋后', '一', 'Mon', '1', 'Monday', '230', '34', '纳采.订盟.嫁娶.祭祀.祈福.普渡.开光.安香.出火.移徙.入宅.竖柱.修造.动土.竖柱.上梁.起基.造屋.安门.造庙.造桥.破土.启攒.安葬', '开市.立券.纳财.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190820', '0', '工作日', '己亥', '七月二十', '7-20', '猪', '立秋后', '二', 'Tue', '2', 'Tuesday', '231', '34', '祭祀.捕捉.畋猎.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬.启攒', '嫁娶.纳采.订盟.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190821', '0', '工作日', '己亥', '七月廿一', '7-21', '猪', '立秋后', '三', 'Wed', '3', 'Wednesday', '232', '34', '破屋.坏垣.治病.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190822', '0', '工作日', '己亥', '七月廿二', '7-22', '猪', '立秋后', '四', 'Thu', '4', 'Thursday', '233', '34', '祈福.斋醮.出行.冠笄.嫁娶.雕刻.开柱眼.入宅.造桥.开市.交易.立券.纳财.入殓.除服.成服.移柩.破土.安葬.启攒', '动土.破土.订盟.安床.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190823', '0', '工作日', '己亥', '七月廿三', '7-23', '猪', '处暑', '五', 'Fri', '5', 'Friday', '234', '34', '祈福.求嗣.解除.订盟.纳采.动土.起基.放水.造仓.开市.纳畜.牧养.开生坟.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190824', '1', '假日', '己亥', '七月廿四', '7-24', '猪', '处暑后', '六', 'Sat', '6', 'Saturday', '235', '34', '塑绘.开光.解除.订盟.纳采.嫁娶.出火.修造.动土.移徙.入宅.拆卸.起基.安门.分居.开市.交易.立券.纳财.纳畜.牧养', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190825', '1', '假日', '己亥', '七月廿五', '7-25', '猪', '处暑后', '日', 'Sun', '7', 'Sunday', '236', '34', '祈福.出行.订盟.纳采.嫁娶.裁衣.动土.安床.放水.开市.掘井.交易.立券.栽种.开渠.除服.成服.移柩.破土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190826', '0', '工作日', '己亥', '七月廿六', '7-26', '猪', '处暑后', '一', 'Mon', '1', 'Monday', '237', '35', '嫁娶.祭祀.祈福.斋醮.作灶.移徙.入宅', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190827', '0', '工作日', '己亥', '七月廿七', '7-27', '猪', '处暑后', '二', 'Tue', '2', 'Tuesday', '238', '35', '嫁娶.出行.纳畜.祭祀.入殓.启攒.安葬', '作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190828', '0', '工作日', '己亥', '七月廿八', '7-28', '猪', '处暑后', '三', 'Wed', '3', 'Wednesday', '239', '35', '订盟.纳采.祭祀.祈福.修造.动土.上梁.破土.安葬', '嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190829', '0', '工作日', '己亥', '七月廿九', '7-29', '猪', '处暑后', '四', 'Thu', '4', 'Thursday', '240', '35', '订盟.纳采.出行.会亲友.修造.上梁.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190830', '0', '工作日', '己亥', '八月初一', '8-1', '猪', '处暑后', '五', 'Fri', '5', 'Friday', '241', '35', '沐浴.修饰垣墙.平治道涂.余事勿取', '嫁娶.祈福.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190831', '1', '假日', '己亥', '八月初二', '8-2', '猪', '处暑后', '六', 'Sat', '6', 'Saturday', '242', '35', '嫁娶.祭祀.祈福.斋醮.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190901', '1', '假日', '己亥', '八月初三', '8-3', '猪', '处暑后', '日', 'Sun', '7', 'Sunday', '243', '35', '捕捉.结网.入殓.破土.安葬', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190902', '0', '工作日', '己亥', '八月初四', '8-4', '猪', '处暑后', '一', 'Mon', '1', 'Monday', '244', '36', '沐浴.治病.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190903', '0', '工作日', '己亥', '八月初五', '8-5', '猪', '处暑后', '二', 'Tue', '2', 'Tuesday', '245', '36', '嫁娶.订盟.纳采.出行.开市.祭祀.祈福.移徙.入宅.启攒.安葬', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190904', '0', '工作日', '己亥', '八月初六', '8-6', '猪', '处暑后', '三', 'Wed', '3', 'Wednesday', '246', '36', '嫁娶.订盟.纳采.祭祀.祈福.求医.治病.动土.移徙.入宅.破土.安葬', '开光.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190905', '0', '工作日', '己亥', '八月初七', '8-7', '猪', '处暑后', '四', 'Thu', '4', 'Thursday', '247', '36', '订盟.纳采.祭祀.祈福.安机械.作灶.纳畜', '动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190906', '0', '工作日', '己亥', '八月初八', '8-8', '猪', '处暑后', '五', 'Fri', '5', 'Friday', '248', '36', '嫁娶.祭祀.祈福.求嗣.出行.动土.安床.掘井.破土.启攒', '入宅.作梁.安门.伐木.修造.上梁.入殓.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190907', '1', '假日', '己亥', '八月初九', '8-9', '猪', '处暑后', '六', 'Sat', '6', 'Saturday', '249', '36', '嫁娶.祭祀.祈福.求嗣.出行.出火.拆卸.修造.移徙.动土.安床.入殓.破土.安葬.启攒', '造屋.开光.理发.造船.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190908', '1', '假日', '己亥', '八月初十', '8-10', '猪', '白露', '日', 'Sun', '7', 'Sunday', '250', '36', '冠笄.沐浴.出行.修造.动土.移徙.入宅.破土.安葬', '嫁娶.开市.祭祀.祈福.斋醮.纳采.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190909', '0', '工作日', '己亥', '八月十一', '8-11', '猪', '白露后', '一', 'Mon', '1', 'Monday', '251', '37', '祭祀.出行', '嫁娶.入宅.修造.动土.会亲友.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190910', '0', '工作日', '己亥', '八月十二', '8-12', '猪', '白露后', '二', 'Tue', '2', 'Tuesday', '252', '37', '嫁娶.订盟.纳采.祭祀.祈福.出行.修造.动土.移徙.入宅', '针灸.伐木.作梁.造庙.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190911', '0', '工作日', '己亥', '八月十三', '8-13', '猪', '白露后', '三', 'Wed', '3', 'Wednesday', '253', '37', '出行.开市.交易.立券.安机械.出火.上梁.移徙', '嫁娶.安葬.动土.造桥', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190912', '0', '工作日', '己亥', '八月十四', '8-14', '猪', '白露后', '四', 'Thu', '4', 'Thursday', '254', '37', '祭祀.沐浴.修饰垣墙.平治道涂.余事勿取', '斋醮.嫁娶.移徙.出行.上梁.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190913', '2', '节日', '己亥', '八月十五', '8-15', '猪', '白露后', '五', 'Fri', '5', 'Friday', '255', '37', '嫁娶.造车器.安机械.祭祀.祈福.开光.安香.出火.出行.开市.立券.修造.动土.移徙.入宅.破土.安葬', '纳采.订盟.架马.词讼.开渠', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190914', '1', '假日', '己亥', '八月十六', '8-16', '猪', '白露后', '六', 'Sat', '6', 'Saturday', '256', '37', '沐浴.捕捉.入殓.除服.成服.破土.启攒.安葬', '祭祀.嫁娶.安床.开市.入宅.探病.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190915', '1', '假日', '己亥', '八月十七', '8-17', '猪', '白露后', '日', 'Sun', '7', 'Sunday', '257', '37', '余事勿取', '探病.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190916', '0', '工作日', '己亥', '八月十八', '8-18', '猪', '白露后', '一', 'Mon', '1', 'Monday', '258', '38', '订盟.纳采.祭祀.祈福.安香.出火.修造.动土.上梁.安门.起基.竖柱.上梁.定磉.开池.移徙.入宅.立券.破土', '嫁娶.造庙.造桥.造船.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190917', '0', '工作日', '己亥', '八月十九', '8-19', '猪', '白露后', '二', 'Tue', '2', 'Tuesday', '259', '38', '开光.求嗣.雕刻.嫁娶.订盟.纳采.出火.拆卸.修造.动土.起基.上梁.放水.移徙.入宅.造仓.造船.开市.开池.纳畜.牧养.挂匾', '行丧.安葬.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190918', '0', '工作日', '己亥', '八月二十', '8-20', '猪', '白露后', '三', 'Wed', '3', 'Wednesday', '260', '38', '祭祀.嫁娶.捕捉', '开光.动土.破土.开市.修造.入宅.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190919', '0', '工作日', '己亥', '八月廿一', '8-21', '猪', '白露后', '四', 'Thu', '4', 'Thursday', '261', '38', '祭祀.普渡.解除.会亲友.捕捉.畋猎.启攒.除服.成服.移柩', '嫁娶.开市.动土.掘井.开池.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190920', '0', '工作日', '己亥', '八月廿二', '8-22', '猪', '白露后', '五', 'Fri', '5', 'Friday', '262', '38', '祭祀.出行.解除.冠笄.嫁娶.伐木.架马.开柱眼.修造.动土.移徙.入宅.开生坟.合寿木.入殓.移柩.破土.安葬.修坟', '开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190921', '1', '假日', '己亥', '八月廿三', '8-23', '猪', '白露后', '六', 'Sat', '6', 'Saturday', '263', '38', '祭祀.祈福.求嗣.出行.沐浴.交易.扫舍.教牛马', '动土.作灶.行丧.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190922', '1', '假日', '己亥', '八月廿四', '8-24', '猪', '白露后', '日', 'Sun', '7', 'Sunday', '264', '38', '出行.解除.纳采.冠笄.雕刻.修造.动土.起基.上梁.合脊.安床.移徙.入宅.开市.栽种.作厕', '造庙.安门.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190923', '0', '工作日', '己亥', '八月廿五', '8-25', '猪', '秋分', '一', 'Mon', '1', 'Monday', '265', '39', '祭祀.沐浴.解除.理发.冠笄.安机械.作灶.造仓.开市.开池.作厕.补垣.塞穴.断蚁.结网', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190924', '0', '工作日', '己亥', '八月廿六', '8-26', '猪', '秋分后', '二', 'Tue', '2', 'Tuesday', '266', '39', '祭祀.沐浴.修饰垣墙.平治道涂', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190925', '0', '工作日', '己亥', '八月廿七', '8-27', '猪', '秋分后', '三', 'Wed', '3', 'Wednesday', '267', '39', '祭祀.会亲友.纳采.嫁娶.开光.塑绘.斋醮.安香.开市.立券.除服.成服.入殓.移柩.安葬.赴任.进人口.出行.裁衣.修造.动土.上梁.经络.交易', '入宅.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190926', '0', '工作日', '己亥', '八月廿八', '8-28', '猪', '秋分后', '四', 'Thu', '4', 'Thursday', '268', '39', '祭祀.冠笄.会亲友.拆卸.起基.除服.成服.移柩.启攒.安葬.沐浴.捕捉.开光.塑绘', '作灶.祭祀.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190927', '0', '工作日', '己亥', '八月廿九', '8-29', '猪', '秋分后', '五', 'Fri', '5', 'Friday', '269', '39', '祭祀.沐浴.破屋.坏垣.余事勿取', '移徙.入宅.出行.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190928', '1', '假日', '己亥', '八月三十', '8-30', '猪', '秋分后', '六', 'Sat', '6', 'Saturday', '270', '39', '祭祀.塑绘.开光.出行.解除.订盟.嫁娶.拆卸.起基.安床.入宅.开市.入殓.除服.成服.移柩.破土.谢土.挂匾.开柱眼.交易', '造桥.冠笄.造屋.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190929', '0', '工作日', '己亥', '九月初一', '9-1', '猪', '秋分后', '日', 'Sun', '7', 'Sunday', '271', '39', '祭祀.赴任.动土.上梁.开光.塑绘.冠笄.拆卸.起基.安床.开市.立券.赴任.经络', '定磉.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20190930', '0', '工作日', '己亥', '九月初二', '9-2', '猪', '秋分后', '一', 'Mon', '1', 'Monday', '272', '40', '祭祀.裁衣.冠笄.嫁娶.纳婿.会亲友.除服.成服.移柩.捕捉.进人口.入殓', '移徙.入宅.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191001', '2', '节日', '己亥', '九月初三', '9-3', '猪', '秋分后', '二', 'Tue', '2', 'Tuesday', '273', '40', '祭祀.诸事不宜', '入殓.安葬.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191002', '2', '节日', '己亥', '九月初四', '9-4', '猪', '秋分后', '三', 'Wed', '3', 'Wednesday', '274', '40', '祭祀.裁衣.冠笄.嫁娶.安机械.拆卸.动土.起基.移徙.入宅.入殓.启攒.安葬.造仓.经络', '安床.开光.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191003', '2', '节日', '己亥', '九月初五', '9-5', '猪', '秋分后', '四', 'Thu', '4', 'Thursday', '275', '40', '祭祀.出行.成服.除服.沐浴.入殓', '动土.冠笄.移徙.入宅.开市.竖柱.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191004', '1', '假日', '己亥', '九月初六', '9-6', '猪', '秋分后', '五', 'Fri', '5', 'Friday', '276', '40', '祭祀.沐浴.赴任.出行.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191005', '1', '假日', '己亥', '九月初七', '9-7', '猪', '秋分后', '六', 'Sat', '6', 'Saturday', '277', '40', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191006', '1', '假日', '己亥', '九月初八', '9-8', '猪', '秋分后', '日', 'Sun', '7', 'Sunday', '278', '40', '沐浴.入殓.移柩.除服.成服.破土.平治道涂', '嫁娶.移徙.入宅.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191007', '1', '假日', '己亥', '九月初九', '9-9', '猪', '秋分后', '一', 'Mon', '1', 'Monday', '279', '41', '嫁娶.祭祀.祈福.求嗣.沐浴.出火.出行.拆卸.修造.动土.进人口.开市.交易.立券.入宅.移徙.安床.栽种.纳畜.入殓.安葬.启攒.除服.成服', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191008', '0', '工作日', '己亥', '九月初十', '9-10', '猪', '寒露', '二', 'Tue', '2', 'Tuesday', '280', '41', '捕捉.畋猎.余事勿取', '开市.交易.祭祀.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191009', '0', '工作日', '己亥', '九月十一', '9-11', '猪', '寒露后', '三', 'Wed', '3', 'Wednesday', '281', '41', '嫁娶.纳采.订盟.祭祀.祈福.求嗣.斋醮.开光.安香.出火.造庙.移徙.出行.入宅.造庙.起基.竖柱.上梁.安床.纳畜.捕捉.纳婿.安葬', '开市.破土.掘井.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191010', '0', '工作日', '己亥', '九月十二', '9-12', '猪', '寒露后', '四', 'Thu', '4', 'Thursday', '282', '41', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '开市.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191011', '0', '工作日', '己亥', '九月十三', '9-13', '猪', '寒露后', '五', 'Fri', '5', 'Friday', '283', '41', '订盟.纳采.会亲友.交易.立券.纳财.栽种.纳畜.牧养', '嫁娶.开市.入宅.祈福.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191012', '0', '工作日', '己亥', '九月十四', '9-14', '猪', '寒露后', '六', 'Sat', '6', 'Saturday', '284', '41', '造车器.嫁娶.订盟.纳采.会亲友.祭祀.出行.开市.立券.移徙.入宅.破土.安葬', '上梁.开光.造屋.架马.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191013', '1', '假日', '己亥', '九月十五', '9-15', '猪', '寒露后', '日', 'Sun', '7', 'Sunday', '285', '41', '祭祀.作灶.纳财.捕捉.畋猎.余事勿取', '动土.破土.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191014', '0', '工作日', '己亥', '九月十六', '9-16', '猪', '寒露后', '一', 'Mon', '1', 'Monday', '286', '42', '嫁娶.订盟.纳采.祭祀.祈福.出行.求医.治病.出火.移徙.入宅', '开市.开仓.出货财.安床.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191015', '0', '工作日', '己亥', '九月十七', '9-17', '猪', '寒露后', '二', 'Tue', '2', 'Tuesday', '287', '42', '冠笄.祭祀.沐浴.作灶.理发.整手足甲.扫舍.补垣.塞穴.入殓.破土.启攒', '开光.嫁娶.会亲友.栽种.针灸.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191016', '0', '工作日', '己亥', '九月十八', '9-18', '猪', '寒露后', '三', 'Wed', '3', 'Wednesday', '288', '42', '纳采.订盟.嫁娶.祭祀.祈福.求嗣.置产.求医.治病.开市.交易.立券.会亲友.移徙.竖柱.上梁.造屋.合脊.安门.放水.捕捉.纳畜', '造庙.造船.动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191017', '0', '工作日', '己亥', '九月十九', '9-19', '猪', '寒露后', '四', 'Thu', '4', 'Thursday', '289', '42', '出行.造车器.造畜椆栖.解除.冠笄.裁衣.作梁.雕刻.会亲友.移徙.入宅.安机械.造畜椆栖.开市.扫舍', '嫁娶.动土.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191018', '0', '工作日', '己亥', '九月二十', '9-20', '猪', '寒露后', '五', 'Fri', '5', 'Friday', '290', '42', '沐浴.理发.冠笄.安床.开市.立券.会亲友.交易.纳财.结网.教牛马', '移徙.入宅.出行.祈福.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191019', '1', '假日', '己亥', '九月廿一', '9-21', '猪', '寒露后', '六', 'Sat', '6', 'Saturday', '291', '42', '祭祀.造畜椆栖.修饰垣墙.平治道涂.余事勿取', '嫁娶.开市.安床.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191020', '1', '假日', '己亥', '九月廿二', '9-22', '猪', '寒露后', '日', 'Sun', '7', 'Sunday', '292', '42', '捕捉.结网.入殓.除服.成服.移柩.破土.安葬.启攒.立碑', '嫁娶.祭祀.入宅.造屋.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191021', '0', '工作日', '己亥', '九月廿三', '9-23', '猪', '寒露后', '一', 'Mon', '1', 'Monday', '293', '43', '祭祀.祈福.求嗣.斋醮.造庙.出火.安机械.会亲友.开市.交易.立券.纳财.习艺.经络.求医.治病.开池.作厕.畋猎.结网.栽种.牧养.安葬.破土.启攒', '开光.嫁娶.掘井.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191022', '0', '工作日', '己亥', '九月廿四', '9-24', '猪', '寒露后', '二', 'Tue', '2', 'Tuesday', '294', '43', '破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191023', '0', '工作日', '己亥', '九月廿五', '9-25', '猪', '寒露后', '三', 'Wed', '3', 'Wednesday', '295', '43', '会亲友.嫁娶.订盟.纳采.纳婿.拆卸.修造.动土.起基.竖柱.上梁.安床.会亲友.纳财', '出行.祈福.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191024', '0', '工作日', '己亥', '九月廿六', '9-26', '猪', '霜降', '四', 'Thu', '4', 'Thursday', '296', '43', '祭祀.塑绘.开光.祈福.斋醮.出行.订盟.纳采.裁衣.嫁娶.拆卸.修造.安床.入宅.安香.入殓.启攒.安葬.谢土.赴任.会亲友.进人口.出行.移徙.上梁.经络.开市.交易.立券.纳财', '开仓.冠笄.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191025', '0', '工作日', '己亥', '九月廿七', '9-27', '猪', '霜降后', '五', 'Fri', '5', 'Friday', '297', '43', '祭祀.作灶.入殓.除服.成服.畋猎', '栽种.动土.安葬.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191026', '1', '假日', '己亥', '九月廿八', '9-28', '猪', '霜降后', '六', 'Sat', '6', 'Saturday', '298', '43', '祭祀.祈福.斋醮.沐浴.竖柱.订盟.纳采.嫁娶.拆卸.入宅.移柩.启攒.谢土.赴任.出火.纳畜', '作灶.入殓.安葬.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191027', '1', '假日', '己亥', '九月廿九', '9-29', '猪', '霜降后', '日', 'Sun', '7', 'Sunday', '299', '43', '嫁娶.祭祀.安机械.入殓.破土.安葬', '动土.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191028', '0', '工作日', '己亥', '十月初一', '10-1', '猪', '霜降后', '一', 'Mon', '1', 'Monday', '300', '44', '作灶.造畜椆栖', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191029', '0', '工作日', '己亥', '十月初二', '10-2', '猪', '霜降后', '二', 'Tue', '2', 'Tuesday', '301', '44', '沐浴.理发.入学.习艺.进人口', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191030', '0', '工作日', '己亥', '十月初三', '10-3', '猪', '霜降后', '三', 'Wed', '3', 'Wednesday', '302', '44', '开光.针灸.会亲友.启攒.安葬', '开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191031', '0', '工作日', '己亥', '十月初四', '10-4', '猪', '霜降后', '四', 'Thu', '4', 'Thursday', '303', '44', '祭祀.结网.造畜椆栖.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191101', '0', '工作日', '己亥', '十月初五', '10-5', '猪', '霜降后', '五', 'Fri', '5', 'Friday', '304', '44', '入殓.除服.成服.移柩.破土.启攒.安葬', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191102', '1', '假日', '己亥', '十月初六', '10-6', '猪', '霜降后', '六', 'Sat', '6', 'Saturday', '305', '44', '嫁娶.订盟.纳采.出行.祭祀.祈福.动土.移徙.入宅.破土.安葬', '开市.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191103', '1', '假日', '己亥', '十月初七', '10-7', '猪', '霜降后', '日', 'Sun', '7', 'Sunday', '306', '44', '祭祀.解除.破屋.坏垣.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191104', '0', '工作日', '己亥', '十月初八', '10-8', '猪', '霜降后', '一', 'Mon', '1', 'Monday', '307', '45', '订盟.纳采.会亲友.安机械.纳财.牧养', '祈福.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191105', '0', '工作日', '己亥', '十月初九', '10-9', '猪', '霜降后', '二', 'Tue', '2', 'Tuesday', '308', '45', '嫁娶.订盟.纳采.出行.开市.祭祀.祈福.动土.移徙.入宅.破土.安葬', '斋醮.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191106', '0', '工作日', '己亥', '十月初十', '10-10', '猪', '霜降后', '三', 'Wed', '3', 'Wednesday', '309', '45', '祭祀.塞穴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191107', '0', '工作日', '己亥', '十月十一', '10-11', '猪', '霜降后', '四', 'Thu', '4', 'Thursday', '310', '45', '祭祀.祈福.求嗣.开光.开市.出行.解除.动土.起基.置产.栽种', '嫁娶.作灶.修坟.安门.入宅.立碑.安葬.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191108', '0', '工作日', '己亥', '十月十二', '10-12', '猪', '立冬', '五', 'Fri', '5', 'Friday', '311', '45', '开市.纳财.出行.祭祀.祈福.求嗣.斋醮.问名.入学.起基.定磉.置产.开渠.掘井.拆卸.栽种.纳畜.牧养.动土.破土.启攒', '移徙.入宅.出火.入殓.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191109', '1', '假日', '己亥', '十月十三', '10-13', '猪', '立冬后', '六', 'Sat', '6', 'Saturday', '312', '45', '祭祀.理发.置产.塞穴.除服.成服.移柩.入殓.破土.安葬', '嫁娶.入宅.安床.掘井.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191110', '1', '假日', '己亥', '十月十四', '10-14', '猪', '立冬后', '日', 'Sun', '7', 'Sunday', '313', '45', '祭祀.沐浴.出行.余事勿取', '开市.动土.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191111', '0', '工作日', '己亥', '十月十五', '10-15', '猪', '立冬后', '一', 'Mon', '1', 'Monday', '314', '46', '嫁娶.造车器.出行.会亲友.移徙.入宅.修造.动土.雕刻.开光.安香.出火.理发.会亲友.造屋.合脊.起基.归岫.安门.拆卸.扫舍.栽种.造畜椆栖', '开市.纳采.造庙.安床.开渠.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191112', '0', '工作日', '己亥', '十月十六', '10-16', '猪', '立冬后', '二', 'Tue', '2', 'Tuesday', '315', '46', '塑绘.会亲友.安机械.塞穴.结网.裁衣.经络', '嫁娶.开市.祈福.斋醮.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191113', '0', '工作日', '己亥', '十月十七', '10-17', '猪', '立冬后', '三', 'Wed', '3', 'Wednesday', '316', '46', '纳采.移徙.纳财.开市.交易.立券.纳财.入宅.修造.动土.竖柱.起基.定磉.造庙.安香.出火.修饰垣墙.平治道涂.会亲友.出行.开池.作厕', '开仓.造屋.造桥.祭祀', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191114', '0', '工作日', '己亥', '十月十八', '10-18', '猪', '立冬后', '四', 'Thu', '4', 'Thursday', '317', '46', '订盟.纳采.纳财.开市.立券.祭祀.祈福.移徙.入宅.出行.造屋.起基.修造.动土.竖柱.上梁.安门.安香.出火.教牛马.会亲友.破土', '嫁娶.安葬.掘井.置产.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191115', '0', '工作日', '己亥', '十月十九', '10-19', '猪', '立冬后', '五', 'Fri', '5', 'Friday', '318', '46', '嫁娶.订盟.纳采.祭祀.祈福.塑绘.开光.移徙.安床.伐木.作梁.捕捉.畋猎.结网.求医.治病.解除.安葬.除服.成服.移柩.入殓.立碑.谢土', '开市.造庙.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191116', '1', '假日', '己亥', '十月二十', '10-20', '猪', '立冬后', '六', 'Sat', '6', 'Saturday', '319', '46', '破屋.坏垣.祭祀.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191117', '1', '假日', '己亥', '十月廿一', '10-21', '猪', '立冬后', '日', 'Sun', '7', 'Sunday', '320', '46', '嫁娶.纳采.订盟.祭祀.冠笄.裁衣.伐木.作梁.架马.定磉.开柱眼.作灶.移徙.安床.畋猎.结网.开池.作厕.除服.成服.启攒.入殓.移柩.安葬', '造屋.造船.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191118', '0', '工作日', '己亥', '十月廿二', '10-22', '猪', '立冬后', '一', 'Mon', '1', 'Monday', '321', '47', '纳采.订盟.祭祀.祈福.求嗣.斋醮.开光.会亲友.解除.入学.纳财.交易.立券.经络.起基.动土.定磉.开池.栽种.纳畜.牧养.破土.入殓.立碑.安葬', '嫁娶.开市.入宅.出火.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191119', '0', '工作日', '己亥', '十月廿三', '10-23', '猪', '立冬后', '二', 'Tue', '2', 'Tuesday', '322', '47', '捕捉.畋猎.会亲友.解除.入殓.除服.成服.移柩.余事勿取', '安床.安门.破土.修坟.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191120', '0', '工作日', '己亥', '十月廿四', '10-24', '猪', '立冬后', '三', 'Wed', '3', 'Wednesday', '323', '47', '祭祀.祈福.求嗣.斋醮.沐浴.冠笄.出行.理发.拆卸.解除.起基.动土.定磉.安碓硙.开池.掘井.扫舍.除服.成服.移柩.启攒.立碑.谢土', '移徙.入宅.安门.作梁.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191121', '0', '工作日', '己亥', '十月廿五', '10-25', '猪', '立冬后', '四', 'Thu', '4', 'Thursday', '324', '47', '嫁娶.冠笄.安床.纳采.会亲友.塞穴.捕捉.置产.造畜椆栖', '开光.掘井.安葬.谢土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191122', '0', '工作日', '己亥', '十月廿六', '10-26', '猪', '小雪', '五', 'Fri', '5', 'Friday', '325', '47', '祭祀.沐浴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191123', '1', '假日', '己亥', '十月廿七', '10-27', '猪', '小雪后', '六', 'Sat', '6', 'Saturday', '326', '47', '祭祀.会亲友.嫁娶.沐浴.修造.动土.祈福.开光.塑绘.出行.订盟.纳采.裁衣.入殓.除服.成服.移柩.启攒.赴任.竖柱.上梁.纳财.扫舍.栽种.纳畜.伐木', '入宅.作灶.安床.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191124', '1', '假日', '己亥', '十月廿八', '10-28', '猪', '小雪后', '日', 'Sun', '7', 'Sunday', '327', '47', '理发.会亲友.补垣.塞穴.结网', '嫁娶.入宅.安门.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191125', '0', '工作日', '己亥', '十月廿九', '10-29', '猪', '小雪后', '一', 'Mon', '1', 'Monday', '328', '48', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.除服.成服.入殓.移柩.安葬.谢土.赴任.会亲友.进人口.出行.竖柱.上梁.经络.开市.交易.立券.纳财.开仓', '作灶.治病.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191126', '0', '工作日', '己亥', '十一月初一', '10-1', '猪', '小雪后', '二', 'Tue', '2', 'Tuesday', '329', '48', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.入殓.移柩.安葬.谢土.赴任.进人口.会亲友', '作灶.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191127', '0', '工作日', '己亥', '十一月初二', '10-2', '猪', '小雪后', '三', 'Wed', '3', 'Wednesday', '330', '48', '祭祀.塑绘.开光.订盟.纳采.嫁娶.安床.进人口.入殓.除服.成服.移柩.启攒.安葬.立碑', '开市.交易.破土.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191128', '0', '工作日', '己亥', '十一月初三', '10-3', '猪', '小雪后', '四', 'Thu', '4', 'Thursday', '331', '48', '祭祀.解除.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191129', '0', '工作日', '己亥', '十一月初四', '10-4', '猪', '小雪后', '五', 'Fri', '5', 'Friday', '332', '48', '祭祀.解除.祈福.开光.塑绘.斋醮.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.入殓.除服.成服.移柩.启攒.安床.赴任.出行.移徙.竖柱.上梁.伐木.栽种.破土.安葬.纳畜', '造屋.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191130', '1', '假日', '己亥', '十一月初五', '10-5', '猪', '小雪后', '六', 'Sat', '6', 'Saturday', '333', '48', '祭祀.祈福.订盟.纳采.裁衣.合帐.冠笄.安机械.安床.造畜椆栖.入殓.移柩.启攒.安葬.谢土.除服.成服.会亲友.竖柱.上梁.经络.开市.交易.立券.纳财.纳畜.筑堤', '嫁娶.入宅.治病.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191201', '1', '假日', '己亥', '十一月初六', '10-6', '猪', '小雪后', '日', 'Sun', '7', 'Sunday', '334', '48', '沐浴.扫舍.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191202', '0', '工作日', '己亥', '十一月初七', '10-7', '猪', '小雪后', '一', 'Mon', '1', 'Monday', '335', '49', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191203', '0', '工作日', '己亥', '十一月初八', '10-8', '猪', '小雪后', '二', 'Tue', '2', 'Tuesday', '336', '49', '祈福.斋醮.出行.订盟.纳采.入殓.移柩.破土.安葬.立碑.结网', '入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191204', '0', '工作日', '己亥', '十一月初九', '10-9', '猪', '小雪后', '三', 'Wed', '3', 'Wednesday', '337', '49', '祭祀.沐浴.出行.冠笄.进人口.余事勿取', '嫁娶.动土.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191205', '0', '工作日', '己亥', '十一月初十', '10-10', '猪', '小雪后', '四', 'Thu', '4', 'Thursday', '338', '49', '祭祀.祈福.斋醮.塑绘.开光.订盟.纳采.裁衣.冠笄.嫁娶.拆卸.入宅.安香.入殓.移柩.理发.安葬.修坟.谢土.赴任.移徙.沐浴.治病.破土.启攒.整手足甲.入学.作梁', '开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191206', '0', '工作日', '己亥', '十一月十一', '10-11', '猪', '小雪后', '五', 'Fri', '5', 'Friday', '339', '49', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191207', '1', '假日', '己亥', '十一月十二', '10-12', '猪', '大雪', '六', 'Sat', '6', 'Saturday', '340', '49', '订盟.纳采.会亲友.安机械.开光.修造.动土.竖柱.上梁.造屋.起基.造桥.栽种.纳畜.造畜椆栖.移柩.入殓.启攒.修坟.立碑.安葬', '祈福.出火.嫁娶.入宅.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191208', '1', '假日', '己亥', '十一月十三', '10-13', '猪', '大雪后', '日', 'Sun', '7', 'Sunday', '341', '49', '祭祀.平治道涂.修坟.除服.成服.余事勿取', '移徙.入宅.嫁娶.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191209', '0', '工作日', '己亥', '十一月十四', '10-14', '猪', '大雪后', '一', 'Mon', '1', 'Monday', '342', '50', '嫁娶.冠笄.祭祀.祈福.求嗣.雕刻.开光.安香.出行.入学.修造.动土.竖柱.上梁.造屋.起基.安门.出火.移徙.入宅.掘井.造畜椆栖.安葬.破土.除服.成服', '开市.纳采.订盟.作灶.造庙.造船.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191210', '0', '工作日', '己亥', '十一月十五', '10-15', '猪', '大雪后', '二', 'Tue', '2', 'Tuesday', '343', '50', '嫁娶.订盟.纳采.祭祀.祈福.求嗣.斋醮.安香.出火.修造.起基.造屋.合脊.安门.安碓硙.动土.上梁.移徙.入宅', '出行.掘井.破土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191211', '0', '工作日', '己亥', '十一月十六', '10-16', '猪', '大雪后', '三', 'Wed', '3', 'Wednesday', '344', '50', '祭祀.沐浴.破屋.坏垣.余事勿取', '嫁娶.移徙.入宅.探病.出行.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191212', '0', '工作日', '己亥', '十一月十七', '10-17', '猪', '大雪后', '四', 'Thu', '4', 'Thursday', '345', '50', '冠笄.纳财.掘井.开池.出火.安床.交易.立券.畋猎.结网.理发.放水', '安门.动土.破土.行丧.安葬.成服', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191213', '0', '工作日', '己亥', '十一月十八', '10-18', '猪', '大雪后', '五', 'Fri', '5', 'Friday', '346', '50', '纳采.订盟.移徙.入宅.出行.安机械.会亲友.祭祀.祈福.斋醮.开光.安香.出火.解除.求医.针灸.治病.造屋.起基.修造.安门.造船.纳畜.牧养.移柩.入殓.启攒.谢土.修坟.立碑', '嫁娶.动土.安床.造桥.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191214', '1', '假日', '己亥', '十一月十九', '10-19', '猪', '大雪后', '六', 'Sat', '6', 'Saturday', '347', '50', '祭祀.沐浴.作灶.纳财.捕捉.畋猎.安床.扫舍', '开市.斋醮.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191215', '1', '假日', '己亥', '十一月二十', '10-20', '猪', '大雪后', '日', 'Sun', '7', 'Sunday', '348', '50', '祈福.斋醮.纳采.订盟.解除.架马.开柱眼.修造.动土.起基.上梁.归岫.造屋.合脊.掘井.除服.成服.破土.栽种', '移徙.开市.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191216', '0', '工作日', '己亥', '十一月廿一', '10-21', '猪', '大雪后', '一', 'Mon', '1', 'Monday', '349', '51', '纳采.订盟.祭祀.沐浴.冠笄.合帐.裁衣.修造.动土.拆卸.移徙.入宅.安门.开仓.筑堤.作厕.栽种.纳畜.补垣.塞穴', '嫁娶.祈福.开光.掘井.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191217', '0', '工作日', '己亥', '十一月廿二', '10-22', '猪', '大雪后', '二', 'Tue', '2', 'Tuesday', '350', '51', '合帐.裁衣.教牛马.余事勿取', '入宅.动土.破土.嫁娶.作灶.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191218', '0', '工作日', '己亥', '十一月廿三', '10-23', '猪', '大雪后', '三', 'Wed', '3', 'Wednesday', '351', '51', '纳采.订盟.嫁娶.祭祀.祈福.安香.出火.出行.会亲友.经络.求医.治病.解除.拆卸.起基.修造.动土.定磉.扫舍.栽种.牧养.造畜椆栖', '斋醮.作梁.掘井.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191219', '0', '工作日', '己亥', '十一月廿四', '10-24', '猪', '大雪后', '四', 'Thu', '4', 'Thursday', '352', '51', '纳财.开市.交易.立券.会亲友.进人口.经络.祭祀.祈福.安香.出火.求医.治病.修造.动土.拆卸.扫舍.安床.栽种.牧养.开生坟.合寿木.入殓.安葬.启攒', '嫁娶.祈福.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191220', '0', '工作日', '己亥', '十一月廿五', '10-25', '猪', '大雪后', '五', 'Fri', '5', 'Friday', '353', '51', '祭祀.入殓.移柩.余事勿取', '入宅.修造.动土.破土.安门.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191221', '1', '假日', '己亥', '十一月廿六', '10-26', '猪', '大雪后', '六', 'Sat', '6', 'Saturday', '354', '51', '塑绘.开光.订盟.纳采.裁衣.冠笄.拆卸.修造.安床.入宅.出火.安葬.谢土.赴任', '掘井.伐木.斋醮.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191222', '1', '假日', '己亥', '十一月廿七', '10-27', '猪', '冬至', '日', 'Sun', '7', 'Sunday', '355', '51', '祭祀.塑绘.开光.裁衣.冠笄.嫁娶.纳采.拆卸.修造.动土.竖柱.上梁.安床.移徙.入宅.安香.结网.捕捉.畋猎.伐木.进人口.放水', '出行.安葬.修坟.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191223', '0', '工作日', '己亥', '十一月廿八', '10-28', '猪', '冬至后', '一', 'Mon', '1', 'Monday', '356', '52', '祭祀.求医.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191224', '0', '工作日', '己亥', '十一月廿九', '10-29', '猪', '冬至后', '二', 'Tue', '2', 'Tuesday', '357', '52', '祭祀.祈福.斋醮.出行.冠笄.安机械.移徙.入宅.安香.安床.除服.成服.移柩.启攒', '开光.栽种.治病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191225', '0', '工作日', '己亥', '十一月三十', '10-30', '猪', '冬至后', '三', 'Wed', '3', 'Wednesday', '358', '52', '塑绘.斋醮.出行.拆卸.解除.修造.移徙.造船.入殓.除服.成服.移柩.启攒.修坟.立碑.谢土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191226', '0', '工作日', '己亥', '腊月初一', '11-1', '猪', '冬至后', '四', 'Thu', '4', 'Thursday', '359', '52', '祭祀.沐浴.安床.纳财.畋猎.捕捉', '开市.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191227', '0', '工作日', '己亥', '腊月初二', '11-2', '猪', '冬至后', '五', 'Fri', '5', 'Friday', '360', '52', '订盟.纳采.祭祀.祈福.修造.动土.上梁.破土', '嫁娶.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191228', '1', '假日', '己亥', '腊月初三', '11-3', '猪', '冬至后', '六', 'Sat', '6', 'Saturday', '361', '52', '出行.沐浴.理发.补垣.塞穴', '入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191229', '1', '假日', '己亥', '腊月初四', '11-4', '猪', '冬至后', '日', 'Sun', '7', 'Sunday', '362', '52', '教牛马.余事勿取', '入宅.动土.破土.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191230', '0', '工作日', '己亥', '腊月初五', '11-5', '猪', '冬至后', '一', 'Mon', '1', 'Monday', '363', '01', '嫁娶.出行.求医.治病.祭祀.祈福.上梁.纳畜', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20191231', '0', '工作日', '己亥', '腊月初六', '11-6', '猪', '冬至后', '二', 'Tue', '2', 'Tuesday', '364', '01', '开市.立券.开光.解除.安机械.上梁.启攒.安葬', '嫁娶.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200101', '2', '节日', '己亥', '腊月初七', '11-7', '猪', '冬至后', '三', 'Wed', '3', 'Wednesday', '0', '01', '平治道涂.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200102', '0', '工作日', '己亥', '腊月初八', '11-8', '猪', '冬至后', '四', 'Thu', '4', 'Thursday', '1', '01', '求嗣.斋醮.塑绘.订盟.纳采.出火.拆卸.修造.动土.造桥.安机械.栽种.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬', '开市.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200103', '0', '工作日', '己亥', '腊月初九', '11-9', '猪', '冬至后', '五', 'Fri', '5', 'Friday', '2', '01', '嫁娶.订盟.纳采.祭祀.祈福.修造.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200104', '1', '假日', '己亥', '腊月初十', '11-10', '猪', '冬至后', '六', 'Sat', '6', 'Saturday', '3', '01', '治病.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200105', '1', '假日', '己亥', '腊月十一', '11-11', '猪', '冬至后', '日', 'Sun', '7', 'Sunday', '4', '01', '祭祀.祈福.求嗣.斋醮.开光.入学.订盟.冠笄.伐木.修造.动土.起基.放水.交易.开池', '造桥.安门.理发.造庙.栽种.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200106', '0', '工作日', '己亥', '腊月十二', '12-12', '猪', '小寒', '一', 'Mon', '1', 'Monday', '5', '02', '沐浴.开仓.出货财.开市.交易.立券.纳财.栽种.纳畜.牧养.畋猎.入殓.破土.安葬', '祈福.嫁娶.安床.入宅.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200107', '0', '工作日', '己亥', '腊月十三', '12-13', '猪', '小寒后', '二', 'Tue', '2', 'Tuesday', '6', '02', '祭祀.沐浴.补垣.塞穴.断蚁.解除.余事勿取', '造庙.入宅.修造.安葬.行丧.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200108', '0', '工作日', '己亥', '腊月十四', '12-14', '猪', '小寒后', '三', 'Wed', '3', 'Wednesday', '7', '02', '嫁娶.纳采.订盟.问名.祭祀.冠笄.裁衣.会亲友.进人口.纳财.捕捉.作灶', '开市.安床.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200109', '0', '工作日', '己亥', '腊月十五', '12-15', '猪', '小寒后', '四', 'Thu', '4', 'Thursday', '8', '02', '订盟.纳采.会亲友.祭祀.斋醮.沐浴.塑绘.出火.开光.竖柱.上梁.开市.交易.立券.作梁.开柱眼.伐木.架马.安门.安床.拆卸.牧养.造畜椆栖.掘井', '造庙.嫁娶.出行.动土.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200110', '0', '工作日', '己亥', '腊月十六', '12-16', '猪', '小寒后', '五', 'Fri', '5', 'Friday', '9', '02', '交易.立券.纳财.安床.裁衣.造畜椆栖.安葬.谢土.启攒.除服.成服.修坟.立碑.移柩.入殓', '开光.嫁娶.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200111', '1', '假日', '己亥', '腊月十七', '12-17', '猪', '小寒后', '六', 'Sat', '6', 'Saturday', '10', '02', '祭祀.解除.教牛马.会亲友.余事勿取', '破土.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200112', '1', '假日', '己亥', '腊月十八', '12-18', '猪', '小寒后', '日', 'Sun', '7', 'Sunday', '11', '02', '纳采.订盟.移徙.纳财.开市.交易.立券.入宅.会亲友.解除.求医.治病.入学.安床.安门.安香.出火.拆卸.扫舍.入宅.挂匾.开生坟.合寿木.破土.修坟.启攒.入殓', '探病.祭祀.出行.上梁.造屋.谢土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200113', '0', '工作日', '己亥', '腊月十九', '12-19', '猪', '小寒后', '一', 'Mon', '1', 'Monday', '12', '03', '嫁娶.订盟.纳采.祭祀.祈福.求嗣.会亲友.解除.出行.入学.纳财.开市.交易.立券.习艺.经络.安床.开仓.出货财.纳畜.安葬.启攒.修坟.入殓', '入宅.开光.开市.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200114', '0', '工作日', '己亥', '腊月二十', '12-20', '猪', '小寒后', '二', 'Tue', '2', 'Tuesday', '13', '03', '祭祀.冠笄.嫁娶.会亲友.进人口.裁衣.结网.平治道涂', '移徙.入宅.造庙.作灶.治病.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200115', '0', '工作日', '己亥', '腊月廿一', '12-21', '猪', '小寒后', '三', 'Wed', '3', 'Wednesday', '14', '03', '祭祀.安碓硙.结网.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200116', '0', '工作日', '己亥', '腊月廿二', '12-22', '猪', '小寒后', '四', 'Thu', '4', 'Thursday', '15', '03', '嫁娶.祭祀.沐浴.裁衣.出行.理发.移徙.捕捉.畋猎.放水.入宅.除服.成服.启攒.安葬.移柩.入殓', '造屋.开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200117', '0', '工作日', '己亥', '腊月廿三', '12-23', '猪', '小寒后', '五', 'Fri', '5', 'Friday', '16', '03', '破屋.坏垣.余事勿取', '嫁娶.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200118', '1', '假日', '己亥', '腊月廿四', '12-24', '猪', '小寒后', '六', 'Sat', '6', 'Saturday', '17', '03', '纳采.订盟.祭祀.求嗣.出火.塑绘.裁衣.会亲友.入学.拆卸.扫舍.造仓.挂匾.掘井.开池.结网.栽种.纳畜.破土.修坟.立碑.安葬.入殓', '祈福.嫁娶.造庙.安床.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200119', '0', '工作日', '己亥', '腊月廿五', '12-25', '猪', '小寒后', '日', 'Sun', '7', 'Sunday', '18', '03', '入殓.除服.成服.移柩.启攒.安葬.修坟.立碑', '开市.伐木.嫁娶.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200120', '0', '工作日', '己亥', '腊月廿六', '12-26', '猪', '大寒', '一', 'Mon', '1', 'Monday', '19', '04', '祭祀.作灶.入殓.除服.余事勿取', '开市.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200121', '0', '工作日', '己亥', '腊月廿七', '12-27', '猪', '大寒后', '二', 'Tue', '2', 'Tuesday', '20', '04', '塑绘.开光.沐浴.冠笄.会亲友.作灶.放水.造畜椆栖', '嫁娶.入殓.安葬.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200122', '0', '工作日', '己亥', '腊月廿八', '12-28', '猪', '大寒后', '三', 'Wed', '3', 'Wednesday', '21', '04', '祭祀.沐浴.祈福.斋醮.订盟.纳采.裁衣.拆卸.起基.竖柱.上梁.安床.入殓.除服.成服.移柩.启攒.挂匾.求嗣.出行.合帐.造畜椆栖', '开仓.嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200123', '0', '工作日', '己亥', '腊月廿九', '12-29', '猪', '大寒后', '四', 'Thu', '4', 'Thursday', '22', '04', '祭祀.解除.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200124', '1', '假日', '己亥', '腊月三十', '12-30', '猪', '大寒后', '五', 'Fri', '5', 'Friday', '23', '04', '沐浴.解除.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.移徙.入宅.除服.成服.移柩.破土.启攒.安葬.扫舍.修坟.伐木.纳财.交易.立券', '作灶.祭祀.上梁.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200125', '2', '节日', '庚子', '正月初一', '1-1', '鼠', '大寒后', '六', 'Sat', '6', 'Saturday', '24', '04', '出行.嫁娶.订盟.纳采.入殓.安床.启攒.安葬.祭祀.裁衣.会亲友.进人口', '作灶.掘井.谢土.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200126', '2', '节日', '庚子', '正月初二', '1-2', '鼠', '大寒后', '日', 'Sun', '7', 'Sunday', '25', '04', '修饰垣墙.平治道涂.入殓.移柩.余事勿取', '嫁娶.移徙.入宅.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200127', '2', '节日', '庚子', '正月初三', '1-3', '鼠', '大寒后', '一', 'Mon', '1', 'Monday', '26', '05', '会亲友.纳采.进人口.修造.动土.竖柱.上梁.祭祀.开光.塑绘.祈福.斋醮.嫁娶.安床.移徙.入宅.安香.纳畜', '出行.治病.安葬.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200128', '1', '假日', '庚子', '正月初四', '1-4', '鼠', '大寒后', '二', 'Tue', '2', 'Tuesday', '27', '05', '祭祀.会亲友.出行.订盟.纳采.沐浴.修造.动土.祈福.斋醮.嫁娶.拆卸.安床.入殓.移柩.安葬.谢土.赴任.裁衣.竖柱.上梁.伐木.捕捉.栽种.破土.安门', '造屋.开市.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200129', '1', '假日', '庚子', '正月初五', '1-5', '鼠', '大寒后', '三', 'Wed', '3', 'Wednesday', '28', '05', '解除.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200130', '1', '假日', '庚子', '正月初六', '1-6', '鼠', '大寒后', '四', 'Thu', '4', 'Thursday', '29', '05', '塑绘.开光.出行.订盟.纳采.除服.成服.嫁娶.纳婿.入殓.移柩.启攒.安葬.立碑', '入宅.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200131', '1', '假日', '庚子', '正月初七', '1-7', '鼠', '大寒后', '五', 'Fri', '5', 'Friday', '30', '05', '入殓.除服.成服.移柩.启攒.安葬.立碑.余事勿取', '破土.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200201', '1', '假日', '庚子', '正月初八', '1-8', '鼠', '大寒后', '六', 'Sat', '6', 'Saturday', '31', '05', '祭祀.祈福.斋醮.塑绘.开光.除服.成服.入殓.作灶.嫁娶.捕捉.畋猎.纳财', '开仓.造屋.安葬.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200202', '1', '假日', '庚子', '正月初九', '1-9', '鼠', '大寒后', '日', 'Sun', '7', 'Sunday', '32', '05', '祭祀.出行.沐浴.裁衣.祈福.斋醮.订盟.纳采.嫁娶.安机械.开市.立券.安碓硙.纳畜', '栽种.嫁娶.入殓.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200203', '0', '工作日', '庚子', '正月初十', '1-10', '鼠', '大寒后', '一', 'Mon', '1', 'Monday', '33', '06', '祭祀.祈福.斋醮.沐浴.安床.安机械.造车器.入殓.移柩.启攒.安葬.立碑.合帐.经络.交易', '作灶.掘井.嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200204', '0', '工作日', '庚子', '正月十一', '1-11', '鼠', '立春', '二', 'Tue', '2', 'Tuesday', '34', '06', '祭祀.祈福.求嗣.斋醮.入殓.除服.成服.移柩.安葬.启攒', '嫁娶.动土.开光.造屋.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200205', '0', '工作日', '庚子', '正月十二', '1-12', '鼠', '立春后', '三', 'Wed', '3', 'Wednesday', '35', '06', '纳采.会亲友.竖柱.上梁.立券.入殓.移柩.安葬.启攒', '祭祀.移徙.入宅.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200206', '0', '工作日', '庚子', '正月十三', '1-13', '鼠', '立春后', '四', 'Thu', '4', 'Thursday', '36', '06', '祭祀.祈福.斋醮.出行.开市.立券.动土.移徙.入宅.破土.安葬', '开光.嫁娶.作灶.掘井.纳畜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200207', '0', '工作日', '庚子', '正月十四', '1-14', '鼠', '立春后', '五', 'Fri', '5', 'Friday', '37', '06', '会亲友.求嗣.理发.冠笄.结网.捕捉.开光.理发', '开市.动土.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200208', '1', '假日', '庚子', '正月十五', '1-15', '鼠', '立春后', '六', 'Sat', '6', 'Saturday', '38', '06', '祭祀.平治道涂.余事勿取', '嫁娶.祈福.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200209', '1', '假日', '庚子', '正月十六', '1-16', '鼠', '立春后', '日', 'Sun', '7', 'Sunday', '39', '06', '祈福.求嗣.斋醮.纳采.嫁娶.伐木.修造.动土.移徙.入宅.造庙.安机械.开市.入殓.除服.成服.移柩.安葬.破土.谢土', '置产.造屋.合脊.开光.探病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200210', '0', '工作日', '庚子', '正月十七', '1-17', '鼠', '立春后', '一', 'Mon', '1', 'Monday', '40', '07', '入学.习艺.出行.纳采.订盟.嫁娶.会亲友.进人口.牧养.捕捉.入殓.移柩.安葬.启攒', '开光.开市.入宅.动土.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200211', '0', '工作日', '庚子', '正月十八', '1-18', '鼠', '立春后', '二', 'Tue', '2', 'Tuesday', '41', '07', '祭祀.沐浴.求医.治病.扫舍.破屋.坏垣.解除.余事勿取', '入宅.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200212', '0', '工作日', '庚子', '正月十九', '1-19', '鼠', '立春后', '三', 'Wed', '3', 'Wednesday', '42', '07', '祭祀.冠笄.嫁娶.拆卸.修造.动土.起基.上梁.造屋.入宅.开市.开池.塞穴.入殓.除服.成服.移柩.安葬.破土', '安床.栽种.治病.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200213', '0', '工作日', '庚子', '正月二十', '1-20', '鼠', '立春后', '四', 'Thu', '4', 'Thursday', '43', '07', '祭祀.结网.入殓.除服.成服.移柩.安葬.破土', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200214', '0', '工作日', '庚子', '正月廿一', '1-21', '鼠', '立春后', '五', 'Fri', '5', 'Friday', '44', '07', '塑绘.开光.祈福.求嗣.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.起基.安门.安床.移徙.造仓.结网.纳畜', '伐木.作灶.安葬.取渔.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200215', '1', '假日', '庚子', '正月廿二', '1-22', '鼠', '立春后', '六', 'Sat', '6', 'Saturday', '45', '07', '祭祀.沐浴.开光.塑绘.祈福.求嗣.订盟.纳采.冠笄.裁衣.嫁娶.动土.除服.成服.移柩.破土.启攒.出行.安碓硙.放水.开市.立券.交易', '安葬.上梁.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200216', '1', '假日', '庚子', '正月廿三', '1-23', '鼠', '立春后', '日', 'Sun', '7', 'Sunday', '46', '07', '祭祀.祈福.求嗣.酬神.裁衣.安床.立券.交易.入殓.除服.成服.移柩.谢土.启攒', '出行.嫁娶.入宅.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200217', '0', '工作日', '庚子', '正月廿四', '1-24', '鼠', '立春后', '一', 'Mon', '1', 'Monday', '47', '08', '裁衣.合帐.入殓.除服.成服.会亲友.纳财', '祭祀.祈福.移徙.嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200218', '0', '工作日', '庚子', '正月廿五', '1-25', '鼠', '立春后', '二', 'Tue', '2', 'Tuesday', '48', '08', '祭祀.斋醮.裁衣.合帐.冠笄.订盟.纳采.嫁娶.入宅.安香.谢土.入殓.移柩.破土.立碑.安香.会亲友.出行.祈福.求嗣.立碑.上梁.放水', '掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200219', '0', '工作日', '庚子', '正月廿六', '1-26', '鼠', '雨水', '三', 'Wed', '3', 'Wednesday', '49', '08', '安床.合帐.入宅.问名.纳采.求嗣.祭祀.开仓', '斋醮.作灶.安床.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200220', '0', '工作日', '庚子', '正月廿七', '1-27', '鼠', '雨水后', '四', 'Thu', '4', 'Thursday', '50', '08', '作灶.平治道涂', '祭祀.祈福.安葬.安门.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200221', '0', '工作日', '庚子', '正月廿八', '1-28', '鼠', '雨水后', '五', 'Fri', '5', 'Friday', '51', '08', '塑绘.开光.酬神.斋醮.订盟.纳采.裁衣.合帐.拆卸.动土.上梁.安床.安香.造庙.挂匾.会亲友.进人口.出行.修造.纳财.伐木.放水.出火.纳畜.沐浴.安门', '造屋.栽种.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200222', '1', '假日', '庚子', '正月廿九', '1-29', '鼠', '雨水后', '六', 'Sat', '6', 'Saturday', '52', '08', '祭祀.祈福.酬神.订盟.纳采.冠笄.裁衣.合帐.嫁娶.安床.移徙.入宅.安香.入殓.移柩.启攒.安葬.解除.取渔.捕捉.伐木.安门.出火', '栽种.动土.开市.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200223', '1', '假日', '庚子', '二月初一', '2-1', '鼠', '雨水后', '日', 'Sun', '7', 'Sunday', '53', '08', '求医.破屋', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200224', '0', '工作日', '庚子', '二月初二', '2-2', '鼠', '雨水后', '一', 'Mon', '1', 'Monday', '54', '09', '祈福.求嗣.斋醮.塑绘.开光.订盟.纳采.嫁娶.动土.入宅.安香.移柩.安葬.谢土.出行.沐浴.修造.竖柱.上梁.纳财.破土.解除.安门.放水', '作灶.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200225', '0', '工作日', '庚子', '二月初三', '2-3', '鼠', '雨水后', '二', 'Tue', '2', 'Tuesday', '55', '09', '取渔.入殓.除服.成服.移柩.破土.安葬.立碑', '嫁娶.上梁.入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200226', '0', '工作日', '庚子', '二月初四', '2-4', '鼠', '雨水后', '三', 'Wed', '3', 'Wednesday', '56', '09', '祭祀.求嗣.沐浴.酬神.订盟.纳采.裁衣.合帐.冠笄.安机械.安床.造仓.开池.经络.纳财.开市.立券.交易.结网.取渔.纳畜.捕捉', '安葬.作灶.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200227', '0', '工作日', '庚子', '二月初五', '2-5', '鼠', '雨水后', '四', 'Thu', '4', 'Thursday', '57', '09', '祭祀.沐浴.祈福.求嗣.斋醮.订盟.纳采.裁衣.冠笄.开市.立券.交易.纳财.沐浴.除服.谢土.出行.移柩', '入殓.安葬.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200228', '0', '工作日', '庚子', '二月初六', '2-6', '鼠', '雨水后', '五', 'Fri', '5', 'Friday', '58', '09', '祭祀.祈福.求嗣.入殓.启攒.安葬.移柩', '开光.掘井.针灸.出行.嫁娶.入宅.移徙.作灶.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200229', '1', '假日', '庚子', '二月初七', '2-7', '鼠', '雨水后', '六', 'Sat', '6', 'Saturday', '59', '09', '安床.解除.裁衣.竖柱.上梁.交易.立券.纳财.纳畜.牧养.入殓.移柩.安葬.启攒', '嫁娶.出行.动土.开渠.入宅.祭祀.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200301', '1', '假日', '庚子', '二月初八', '2-8', '鼠', '雨水后', '日', 'Sun', '7', 'Sunday', '60', '09', '嫁娶.安床.开光.出行.祭祀.动土.出火.解除.会亲友.开市.交易.立券.挂匾.入宅.移徙.拆卸.破土.启攒.安葬', '掘井.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200302', '0', '工作日', '庚子', '二月初九', '2-9', '鼠', '雨水后', '一', 'Mon', '1', 'Monday', '61', '10', '嫁娶.开光.求嗣.会亲友.安床.牧养.塑绘.针灸', '入宅.移徙.出火.分居.安香.作灶.开市.交易.立券.安葬.动土.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200303', '0', '工作日', '庚子', '二月初十', '2-10', '鼠', '雨水后', '二', 'Tue', '2', 'Tuesday', '62', '10', '作灶.解除.平治道涂', '栽种.出行.祈福.行丧.纳畜.安葬.安门.伐木.作梁.牧养', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200304', '0', '工作日', '庚子', '二月十一', '2-11', '鼠', '雨水后', '三', 'Wed', '3', 'Wednesday', '63', '10', '解除.沐浴', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200305', '0', '工作日', '庚子', '二月十二', '2-12', '鼠', '雨水后', '四', 'Thu', '4', 'Thursday', '64', '10', '嫁娶.造车器.纳采.订盟.祭祀.祈福.安机械.移徙.入宅.开市.立券.破土.安葬', '纳畜.理发.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200306', '0', '工作日', '庚子', '二月十三', '2-13', '鼠', '惊蛰', '五', 'Fri', '5', 'Friday', '65', '10', '祈福.斋醮.出行.移徙.入宅.修造.动土.破土.安葬', '纳采.开光.安床.嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200307', '1', '假日', '庚子', '二月十四', '2-14', '鼠', '惊蛰后', '六', 'Sat', '6', 'Saturday', '66', '10', '破屋.坏垣.余事勿取', '嫁娶.移徙.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200308', '1', '假日', '庚子', '二月十五', '2-15', '鼠', '惊蛰后', '日', 'Sun', '7', 'Sunday', '67', '10', '嫁娶.冠笄.祭祀.出行.会亲友.修造.动土.入殓.破土', '塑绘.开光.造桥.除服.成服', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200309', '0', '工作日', '庚子', '二月十六', '2-16', '鼠', '惊蛰后', '一', 'Mon', '1', 'Monday', '68', '11', '开光.求嗣.出行.纳采.冠笄.出火.拆卸.起基.修造.动土.上梁.移徙.造船.开市.交易.立券.纳财', '祈福.嫁娶.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200310', '0', '工作日', '庚子', '二月十七', '2-17', '鼠', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '69', '11', '理发.冠笄.嫁娶.进人口.栽种.捕捉.针灸', '纳财.开市.安葬.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200311', '0', '工作日', '庚子', '二月十八', '2-18', '鼠', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '70', '11', '开光.祈福.求嗣.出行.解除.伐木.造屋.起基.修造.架马.安门.移徙.入宅.造庙.除服.成服.移柩.谢土.纳畜.牧养', '纳采.动土.开市.交易.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200312', '0', '工作日', '庚子', '二月十九', '2-19', '鼠', '惊蛰后', '四', 'Thu', '4', 'Thursday', '71', '11', '裁衣.经络.伐木.开柱眼.拆卸.修造.动土.上梁.合脊.合寿木.入殓.除服.成服.移柩.破土.安葬.启攒.修坟.立碑', '祭祀.嫁娶.出行.上梁.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200313', '0', '工作日', '庚子', '二月二十', '2-20', '鼠', '惊蛰后', '五', 'Fri', '5', 'Friday', '72', '11', '祭祀.会亲友.立券.交易.裁衣.合帐.嫁娶.冠笄.进人口', '栽种.动土.安葬.掘井.修坟.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200314', '1', '假日', '庚子', '二月廿一', '2-21', '鼠', '惊蛰后', '六', 'Sat', '6', 'Saturday', '73', '11', '扫舍.塞穴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200315', '1', '假日', '庚子', '二月廿二', '2-22', '鼠', '惊蛰后', '日', 'Sun', '7', 'Sunday', '74', '11', '塑绘.开光.订盟.纳采.裁衣.合帐.冠笄.安机械.会亲友.纳财.开市.立券.交易.安床.竖柱.上梁.结网.栽种.解除.经络', '作灶.出行.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200316', '0', '工作日', '庚子', '二月廿三', '2-23', '鼠', '惊蛰后', '一', 'Mon', '1', 'Monday', '75', '12', '祭祀.嫁娶.纳婿.除服.成服.入殓.移柩', '动土.作灶.入宅.开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200317', '0', '工作日', '庚子', '二月廿四', '2-24', '鼠', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '76', '12', '祈福.求嗣.开光.塑绘.斋醮.订盟.纳采.嫁娶.拆卸.安床.入宅.安香.移柩.修坟.安葬.谢土.栽种.解除.冠笄.裁衣.移徙.修造.动土.竖柱.放水.启攒.立碑', '赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200318', '0', '工作日', '庚子', '二月廿五', '2-25', '鼠', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '77', '12', '祭祀.解除.入殓.除服.成服.移柩.启攒.安葬.修坟.立碑.谢土.沐浴.扫舍.捕捉.取渔.结网.畋猎.理发', '安床.嫁娶.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200319', '0', '工作日', '庚子', '二月廿六', '2-26', '鼠', '惊蛰后', '四', 'Thu', '4', 'Thursday', '78', '12', '破屋.坏垣', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200320', '0', '工作日', '庚子', '二月廿七', '2-27', '鼠', '惊蛰后', '五', 'Fri', '5', 'Friday', '79', '12', '祭祀.出行.订盟.纳采.裁衣.合帐.冠笄.进人口.动土.安床.作灶.入殓.移柩.安葬.破土.结网.取渔.畋猎', '作梁.造庙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200321', '1', '假日', '庚子', '二月廿八', '2-28', '鼠', '春分', '六', 'Sat', '6', 'Saturday', '80', '12', '祭祀.开光.塑绘.订盟.纳采.合帐.冠笄.拆卸.动土.起基.上梁.入宅.安香.开市.立券.纳财.沐浴.求嗣.出火.竖柱.安门', '造庙.嫁娶.伐木.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200322', '1', '假日', '庚子', '二月廿九', '2-29', '鼠', '春分后', '日', 'Sun', '7', 'Sunday', '81', '12', '祭祀.沐浴.捕捉.栽种', '嫁娶.入宅.移徙.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200323', '0', '工作日', '庚子', '二月三十', '2-30', '鼠', '春分后', '一', 'Mon', '1', 'Monday', '82', '13', '祭祀.开光.塑绘.酬神.斋醮.订盟.纳采.嫁娶.裁衣.动土.起基.出火.拆卸.移徙.入宅.安香.修造.竖柱.上梁.纳畜.牧养.祈福.求嗣.解除.伐木.定磉.造屋.安门', '栽种.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200324', '0', '工作日', '庚子', '三月初一', '3-1', '鼠', '春分后', '二', 'Tue', '2', 'Tuesday', '83', '13', '订盟.纳采.冠笄.拆卸.修造.动土.安床.入殓.除服.成服.移柩.安葬.破土.启攒.造仓', '作灶.开光.嫁娶.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200325', '0', '工作日', '庚子', '三月初二', '3-2', '鼠', '春分后', '三', 'Wed', '3', 'Wednesday', '84', '13', '祈福.开光.塑绘.酬神.订盟.纳采.裁衣.安床.开市.立券.入殓.除服.成服.移柩.启攒.安葬.立碑.赴任.会亲友.出行.交易.竖柱', '作灶.掘井.动土.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200326', '0', '工作日', '庚子', '三月初三', '3-3', '鼠', '春分后', '四', 'Thu', '4', 'Thursday', '85', '13', '祭祀.扫舍.塞穴', '栽种.作灶.安葬.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200327', '0', '工作日', '庚子', '三月初四', '3-4', '鼠', '春分后', '五', 'Fri', '5', 'Friday', '86', '13', '开光.塑绘.裁衣.冠笄.伐木.拆卸.竖柱.上梁.开仓.会亲友.安机械.造仓.造屋.交易.解除.开市.立券.纳财', '出行.嫁娶.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200328', '1', '假日', '庚子', '三月初五', '3-5', '鼠', '春分后', '六', 'Sat', '6', 'Saturday', '87', '13', '冠笄.入殓.除服.成服.移柩.平治道涂.修饰垣墙', '造屋.作灶.治病.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200329', '1', '假日', '庚子', '三月初六', '3-6', '鼠', '春分后', '日', 'Sun', '7', 'Sunday', '88', '13', '祭祀.嫁娶.祈福.纳采.裁衣.合帐.安床.入宅.安香.入殓.移柩.安葬.谢土.修造.安碓硙.求嗣.会亲友.挂匾.交易.立券.纳财.造仓.放水', '栽种.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200330', '0', '工作日', '庚子', '三月初七', '3-7', '鼠', '春分后', '一', 'Mon', '1', 'Monday', '89', '14', '祭祀.祈福.斋醮.订盟.纳采.裁衣.合帐.拆卸.修造.动土.上梁.起基.移柩.安葬.谢土.沐浴.扫舍.开柱眼.伐木.出火', '安床.开市.立券.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200331', '0', '工作日', '庚子', '三月初八', '3-8', '鼠', '春分后', '二', 'Tue', '2', 'Tuesday', '90', '14', '破屋.坏垣.求医.治病', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200401', '0', '工作日', '庚子', '三月初九', '3-9', '鼠', '春分后', '三', 'Wed', '3', 'Wednesday', '91', '14', '祭祀.动土.上梁.订盟.纳采.嫁娶.安机械.拆卸.安床.入宅.安香.入殓.移柩.破土.安葬.立碑.谢土.赴任.出行.移徙.祈福.求嗣.解除.造仓.进人口', '开光.出货财', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200402', '0', '工作日', '庚子', '三月初十', '3-10', '鼠', '春分后', '四', 'Thu', '4', 'Thursday', '92', '14', '祭祀.开光.塑绘.纳采.裁衣.拆卸.安床.起基.动土.竖柱.上梁.移徙.入宅.安香.开市.立券.挂匾.沐浴.出行.求嗣.安门', '嫁娶.栽种.伐木.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200403', '0', '工作日', '庚子', '三月十一', '3-11', '鼠', '春分后', '五', 'Fri', '5', 'Friday', '93', '14', '裁衣.合帐.冠笄.嫁娶.纳婿.安床.入殓.纳财', '作灶.开市.安葬.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200404', '2', '节日', '庚子', '三月十二', '3-12', '鼠', '春分后', '六', 'Sat', '6', 'Saturday', '94', '14', '祭祀.捕捉.解除.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200405', '1', '假日', '庚子', '三月十三', '3-13', '鼠', '清明', '日', 'Sun', '7', 'Sunday', '95', '14', '纳采.嫁娶.出行.开市.立券.纳畜.牧养.出火.移徙.入宅', '祈福.动土.破土.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200406', '1', '假日', '庚子', '三月十四', '3-14', '鼠', '清明后', '一', 'Mon', '1', 'Monday', '96', '15', '祭祀.祈福.求嗣.斋醮.冠笄.作灶.纳财.交易', '开光.嫁娶.掘井.安葬.安门.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200407', '0', '工作日', '庚子', '三月十五', '3-15', '鼠', '清明后', '二', 'Tue', '2', 'Tuesday', '97', '15', '祭祀.解除.教牛马.出行.余事勿取', '动土.破土.行丧.开光.作梁.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200408', '0', '工作日', '庚子', '三月十六', '3-16', '鼠', '清明后', '三', 'Wed', '3', 'Wednesday', '98', '15', '沐浴.斋醮.解除.求医.治病.会亲友.造畜椆栖.栽种.理发.扫舍', '开市.嫁娶.移徙.入宅.掘井.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200409', '0', '工作日', '庚子', '三月十七', '3-17', '鼠', '清明后', '四', 'Thu', '4', 'Thursday', '99', '15', '求嗣.出行.解除.订盟.纳采.嫁娶.会亲友.进人口.安床.开市.交易.纳畜.牧养.入殓.除服.成服.移柩.安葬.启攒', '祈福.开市.修造.动土.破土.谢土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200410', '0', '工作日', '庚子', '三月十八', '3-18', '鼠', '清明后', '五', 'Fri', '5', 'Friday', '100', '15', '祭祀.作灶.平治道涂.余事勿取', '嫁娶.安葬.动土.安床.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200411', '1', '假日', '庚子', '三月十九', '3-19', '鼠', '清明后', '六', 'Sat', '6', 'Saturday', '101', '15', '造车器.祭祀.祈福.求嗣.斋醮.开市.交易.安机械.雕刻.开光.造屋.合脊.起基.定磉.安门.纳畜.安葬.开生坟.立碑.谢土.斋醮', '入宅.动土.开仓.出货财', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200412', '1', '假日', '庚子', '三月二十', '3-20', '鼠', '清明后', '日', 'Sun', '7', 'Sunday', '102', '15', '祭祀.祈福.开光.求嗣.斋醮.纳采.订盟.求医.治病.起基.定磉.造船.取渔.解除.安葬.启攒.谢土.入殓', '开市.动土.掘井.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200413', '0', '工作日', '庚子', '三月廿一', '3-21', '鼠', '清明后', '一', 'Mon', '1', 'Monday', '103', '16', '祭祀.沐浴.破屋.坏垣.求医.治病.解除.余事勿取', '嫁娶.开市.交易.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200414', '0', '工作日', '庚子', '三月廿二', '3-22', '鼠', '清明后', '二', 'Tue', '2', 'Tuesday', '104', '16', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200415', '0', '工作日', '庚子', '三月廿三', '3-23', '鼠', '清明后', '三', 'Wed', '3', 'Wednesday', '105', '16', '祭祀.塑绘.开光.订盟.纳采.冠笄.裁衣.安机械.拆卸.修造.动土.安床.经络.开市', '出火.入宅.安葬.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200416', '0', '工作日', '庚子', '三月廿四', '3-24', '鼠', '清明后', '四', 'Thu', '4', 'Thursday', '106', '16', '祭祀.余事勿取', '造庙.嫁娶.安床.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200417', '0', '工作日', '庚子', '三月廿五', '3-25', '鼠', '清明后', '五', 'Fri', '5', 'Friday', '107', '16', '订盟.纳采.嫁娶.进人口.会亲友.交易.立券.动土.除服.谢土.移柩.破土.启攒.赴任.出行.开市.纳财.栽种', '入殓.安葬.入宅.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200418', '1', '假日', '庚子', '三月廿六', '3-26', '鼠', '清明后', '六', 'Sat', '6', 'Saturday', '108', '16', '祭祀.祈福.裁衣.合帐.安床.入殓.除服.成服.移柩.破土.启攒.安葬.谢土.立碑.造畜椆栖', '掘井.安门.嫁娶.纳采', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200419', '1', '假日', '庚子', '三月廿七', '3-27', '鼠', '清明后', '日', 'Sun', '7', 'Sunday', '109', '16', '祭祀.进人口.嫁娶.安床.解除.冠笄.出行.裁衣.扫舍', '掘井.动土.破土.安葬.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200420', '0', '工作日', '庚子', '三月廿八', '3-28', '鼠', '谷雨', '一', 'Mon', '1', 'Monday', '110', '17', '纳采.开光.求医.治病.动土.上梁.移徙.入宅', '嫁娶.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200421', '0', '工作日', '庚子', '三月廿九', '3-29', '鼠', '谷雨后', '二', 'Tue', '2', 'Tuesday', '111', '17', '祭祀.会亲友.开市.安床.启攒.安葬', '嫁娶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200422', '0', '工作日', '庚子', '三月三十', '3-30', '鼠', '谷雨后', '三', 'Wed', '3', 'Wednesday', '112', '17', '祭祀.作灶.掘井.平治道涂', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200423', '0', '工作日', '庚子', '四月初一', '4-1', '鼠', '谷雨后', '四', 'Thu', '4', 'Thursday', '113', '17', '祭祀.斋醮.开市.动土.入殓.破土.安葬', '嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200424', '0', '工作日', '庚子', '四月初二', '4-2', '鼠', '谷雨后', '五', 'Fri', '5', 'Friday', '114', '17', '嫁娶.纳采.祭祀.祈福.出行.移徙.求医', '开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200425', '1', '假日', '庚子', '四月初三', '4-3', '鼠', '谷雨后', '六', 'Sat', '6', 'Saturday', '115', '17', '祭祀.求医.治病.解除.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200426', '0', '工作日', '庚子', '四月初四', '4-4', '鼠', '谷雨后', '日', 'Sun', '7', 'Sunday', '116', '17', '沐浴.结网.取渔', '嫁娶.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200427', '0', '工作日', '庚子', '四月初五', '4-5', '鼠', '谷雨后', '一', 'Mon', '1', 'Monday', '117', '18', NULL, '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200428', '0', '工作日', '庚子', '四月初六', '4-6', '鼠', '谷雨后', '二', 'Tue', '2', 'Tuesday', '118', '18', '解除.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200429', '0', '工作日', '庚子', '四月初七', '4-7', '鼠', '谷雨后', '三', 'Wed', '3', 'Wednesday', '119', '18', '嫁娶.开光.出行.出火.拆卸.进人口.开市.立券.交易.挂匾.入宅.移徙.安床.栽种', '祈福.入殓.祭祀.作灶.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200430', '0', '工作日', '庚子', '四月初八', '4-8', '鼠', '谷雨后', '四', 'Thu', '4', 'Thursday', '120', '18', '嫁娶.出行.合帐.冠笄.安床.除服.成服.作灶.交易.立券.入殓.移柩.破土.安葬', '词讼.开光.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200501', '2', '节日', '庚子', '四月初九', '4-9', '鼠', '谷雨后', '五', 'Fri', '5', 'Friday', '121', '18', '出行.修饰垣墙.造畜椆栖.教牛马.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200502', '1', '假日', '庚子', '四月初十', '4-10', '鼠', '谷雨后', '六', 'Sat', '6', 'Saturday', '122', '18', '祭祀.祈福.开光.求嗣.解除.伐木.出火.入宅.移徙.安床.拆卸.修造.动土.造畜椆栖', '嫁娶.纳财.安葬.出行.开市.立券.作灶.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200503', '1', '假日', '庚子', '四月十一', '4-11', '鼠', '谷雨后', '日', 'Sun', '7', 'Sunday', '123', '18', '纳采.嫁娶.开光.出行.理发.会亲友.开市.安床.栽种.牧养.入殓.移柩.启攒', '谢土.祈福.上梁.作灶.斋醮.修造.入宅.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200504', '1', '假日', '庚子', '四月十二', '4-12', '鼠', '谷雨后', '一', 'Mon', '1', 'Monday', '124', '19', '祭祀.平治道涂.解除.修饰垣墙.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200505', '1', '假日', '庚子', '四月十三', '4-13', '鼠', '谷雨后', '二', 'Tue', '2', 'Tuesday', '125', '19', '祭祀.沐浴.移徙.破土.安葬.扫舍.平治道涂', '祈福.嫁娶.入宅.安床.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200506', '0', '工作日', '庚子', '四月十四', '4-14', '鼠', '立夏', '三', 'Wed', '3', 'Wednesday', '126', '19', '祭祀.祈福.斋醮.求嗣.安机械.纳畜.移徙.入宅.安机械.塑绘.开光.起基.竖柱.上梁.作灶.安门.安香.出火.造屋.启攒.安葬', '动土.破土.嫁娶.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200507', '0', '工作日', '庚子', '四月十五', '4-15', '鼠', '立夏后', '四', 'Thu', '4', 'Thursday', '127', '19', '嫁娶.纳采.订盟.斋醮.开光.祭祀.祈福.求医.治病.会亲友.动土.解除.捕捉.纳畜.牧养.入殓.破土.安葬', '移徙.入宅.造屋.架马', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200508', '0', '工作日', '庚子', '四月十六', '4-16', '鼠', '立夏后', '五', 'Fri', '5', 'Friday', '128', '19', '祭祀.沐浴.解除.破屋.坏垣.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200509', '0', '工作日', '庚子', '四月十七', '4-17', '鼠', '立夏后', '六', 'Sat', '6', 'Saturday', '129', '19', '沐浴.扫舍.余事勿取', '斋醮.开市.嫁娶.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200510', '1', '假日', '庚子', '四月十八', '4-18', '鼠', '立夏后', '日', 'Sun', '7', 'Sunday', '130', '19', '开市.交易.立券.安机械.会亲友.开光.求医.治病.造屋.起基.修造.动土.定磉.竖柱.上梁.安门.作灶.放水.作厕.开池.栽种.牧养.造畜椆栖.破土.安葬.立碑', '嫁娶.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200511', '0', '工作日', '庚子', '四月十九', '4-19', '鼠', '立夏后', '一', 'Mon', '1', 'Monday', '131', '20', '栽种.捕捉.畋猎.余事勿取', '开市.动土.祭祀.斋醮.安葬.探病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200512', '0', '工作日', '庚子', '四月二十', '4-20', '鼠', '立夏后', '二', 'Tue', '2', 'Tuesday', '132', '20', '嫁娶.祭祀.祈福.求嗣.斋醮.订盟.纳采.解除.出行.动土.破土.习艺.针灸.理发.会亲友.起基.修造.动土.竖柱.定磉.安床.拆卸.纳畜.牧养.放水.破土.除服.成服.修坟.立碑', '开市.入宅.探病.出火.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200513', '0', '工作日', '庚子', '四月廿一', '4-21', '鼠', '立夏后', '三', 'Wed', '3', 'Wednesday', '133', '20', '余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200514', '0', '工作日', '庚子', '四月廿二', '4-22', '鼠', '立夏后', '四', 'Thu', '4', 'Thursday', '134', '20', '塞穴.断蚁.结网.余事勿取', '破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200515', '0', '工作日', '庚子', '四月廿三', '4-23', '鼠', '立夏后', '五', 'Fri', '5', 'Friday', '135', '20', '开光.出行.纳采.嫁娶.伐木.架马.出火.拆卸.移徙.入宅.造庙.造桥.造船.造畜椆栖.开市.入殓.除服.成服.移柩.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200516', '1', '假日', '庚子', '四月廿四', '4-24', '鼠', '立夏后', '六', 'Sat', '6', 'Saturday', '136', '20', '进人口.牧养.置产.塞穴.结网.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200517', '1', '假日', '庚子', '四月廿五', '4-25', '鼠', '立夏后', '日', 'Sun', '7', 'Sunday', '137', '20', '开光.出行.嫁娶', '会亲友.进人口.修造.动土.起基.移徙.开市.纳畜.入殓.除服.成服.移柩.破土.安葬.修坟.立碑.会亲友', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200518', '0', '工作日', '庚子', '四月廿六', '4-26', '鼠', '立夏后', '一', 'Mon', '1', 'Monday', '138', '21', '嫁娶.纳采.出行.祭祀.祈福.开市.动土.移徙.入宅.破土.安葬', '安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200519', '0', '工作日', '庚子', '四月廿七', '4-27', '鼠', '立夏后', '二', 'Tue', '2', 'Tuesday', '139', '21', '嫁娶.纳采.求医.治病.修造.动土.移徙.入宅.破土.安葬', '开市.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200520', '0', '工作日', '庚子', '四月廿八', '4-28', '鼠', '立夏后', '三', 'Wed', '3', 'Wednesday', '140', '21', '祭祀.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200521', '0', '工作日', '庚子', '四月廿九', '4-29', '鼠', '小满', '四', 'Thu', '4', 'Thursday', '141', '21', '嫁娶.纳采.祭祀.祈福.出行.动土.上梁.移徙.入宅.破土.安葬', '祈福.斋醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200522', '0', '工作日', '庚子', '四月三十', '4-30', '鼠', '小满后', '五', 'Fri', '5', 'Friday', '142', '21', '纳采.祭祀.祈福.开市.求医.治病.动土.纳畜', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200523', '1', '假日', '庚子', '闰四月初一', '4-1', '鼠', '小满后', '六', 'Sat', '6', 'Saturday', '143', '21', '嫁娶.纳采.出行.移徙.入宅', '动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200524', '1', '假日', '庚子', '闰四月初二', '4-2', '鼠', '小满后', '日', 'Sun', '7', 'Sunday', '144', '21', '订盟.纳采.祭祀.动土.破土.交易.立券', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200525', '0', '工作日', '庚子', '闰四月初三', '4-3', '鼠', '小满后', '一', 'Mon', '1', 'Monday', '145', '22', '嫁娶.裁衣.祭祀.出行.安床.作灶.移徙.入宅.破土.安葬', '赴任.捕捉', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200526', '0', '工作日', '庚子', '闰四月初四', '4-4', '鼠', '小满后', '二', 'Tue', '2', 'Tuesday', '146', '22', '塞穴.结网.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200527', '0', '工作日', '庚子', '闰四月初五', '4-5', '鼠', '小满后', '三', 'Wed', '3', 'Wednesday', '147', '22', '嫁娶.订盟.纳采.出行.祭祀.祈福.斋醮.动土.上梁.破土.安葬', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200528', '0', '工作日', '庚子', '闰四月初六', '4-6', '鼠', '小满后', '四', 'Thu', '4', 'Thursday', '148', '22', '订盟.纳采.会亲友.安床.作灶.造畜椆栖', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200529', '0', '工作日', '庚子', '闰四月初七', '4-7', '鼠', '小满后', '五', 'Fri', '5', 'Friday', '149', '22', '沐浴.平治道涂.扫舍.入殓.移柩.破土.启攒.安葬.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200530', '1', '假日', '庚子', '闰四月初八', '4-8', '鼠', '小满后', '六', 'Sat', '6', 'Saturday', '150', '22', '嫁娶.祭祀.祈福.求嗣.开光.出行.出火.拆卸.动土.上梁.进人口.入宅.移徙.安床.安门.开市.交易.立券.挂匾.栽种.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200531', '1', '假日', '庚子', '闰四月初九', '4-9', '鼠', '小满后', '日', 'Sun', '7', 'Sunday', '151', '22', '祭祀.开光.出行.解除.塑绘.裁衣.入殓.移柩.破土.启攒.安葬.除服.成服', '嫁娶.上梁.修造.拆卸.架马.入宅.伐木.动土.出火.开柱眼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200601', '0', '工作日', '庚子', '闰四月初十', '4-10', '鼠', '小满后', '一', 'Mon', '1', 'Monday', '152', '23', '祭祀.解除.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200602', '0', '工作日', '庚子', '闰四月十一', '4-11', '鼠', '小满后', '二', 'Tue', '2', 'Tuesday', '153', '23', '嫁娶.祭祀.祈福.求嗣.开光.出行.拆卸.动土.上梁.出火.进人口.入宅.移徙.安床.栽种.纳畜.牧养.竖柱.安门.修造.解除.会亲友', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200603', '0', '工作日', '庚子', '闰四月十二', '4-12', '鼠', '小满后', '三', 'Wed', '3', 'Wednesday', '154', '23', '开市.交易.立券.祭祀.祈福.开光.伐木.进人口.安床.拆卸.修造.动土.栽种.破土.移柩.安葬', '入宅.移徙.理发.出火.嫁娶.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200604', '0', '工作日', '庚子', '闰四月十三', '4-13', '鼠', '小满后', '四', 'Thu', '4', 'Thursday', '155', '23', '结网.解除.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200605', '0', '工作日', '庚子', '闰四月十四', '4-14', '鼠', '小满后', '五', 'Fri', '5', 'Friday', '156', '23', '祭祀.作灶.余事勿取', '开市.安葬.破土.修坟.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200606', '1', '假日', '庚子', '闰四月十五', '4-15', '鼠', '芒种', '六', 'Sat', '6', 'Saturday', '157', '23', '祭祀.祈福.求嗣.斋醮.安香.解除.移徙.入宅.会亲友.求医.治病.动土.破土.开生坟.合寿木', '合帐.上梁.经络.安葬.入殓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200607', '1', '假日', '庚子', '闰四月十六', '4-16', '鼠', '芒种后', '日', 'Sun', '7', 'Sunday', '158', '23', '嫁娶.冠笄.修造.动土.作灶.移徙.入宅.补垣.塞穴.纳畜.牧养.架马.修造.动土.起基.定磉.开池.造船', '祈福.开光.掘井.开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200608', '0', '工作日', '庚子', '闰四月十七', '4-17', '鼠', '芒种后', '一', 'Mon', '1', 'Monday', '159', '24', '祭祀.交易.纳财', '斋醮.开渠.上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200609', '0', '工作日', '庚子', '闰四月十八', '4-18', '鼠', '芒种后', '二', 'Tue', '2', 'Tuesday', '160', '24', '嫁娶.订盟.纳采.冠笄.会亲友.安机械.造车器.祭祀.出行.纳财.入宅.安香.出火.入学.塑绘.开光.拆卸.起基.修造.动土.牧养.栽种.安门.作厕', '行丧.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200610', '0', '工作日', '庚子', '闰四月十九', '4-19', '鼠', '芒种后', '三', 'Wed', '3', 'Wednesday', '161', '24', '开光.求嗣.出行.冠笄.嫁娶.伐木.架马.开柱眼.修造.移徙.入宅.开市.交易.立券.出行.安香.出火.挂匾.起基.修造.开生坟.合寿木.入殓.除服.成服.移柩.安葬', '安床.出货财.作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200611', '0', '工作日', '庚子', '闰四月二十', '4-20', '鼠', '芒种后', '四', 'Thu', '4', 'Thursday', '162', '24', '祭祀.沐浴.理发.嫁娶.作灶.整手足甲.扫舍.修饰垣墙.平治道涂', '斋醮.出行.治病.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200612', '0', '工作日', '庚子', '闰四月廿一', '4-21', '鼠', '芒种后', '五', 'Fri', '5', 'Friday', '163', '24', '安机械.移徙.入宅.出行.祭祀.祈福.斋醮.纳采.订盟.安香.出火.解除.会亲友.修造.动土.拆卸.起基.定磉.移徙.入宅.造屋.安床.修造.破土.安葬.入殓.立碑', '开市.伐木.作梁.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200613', '1', '假日', '庚子', '闰四月廿二', '4-22', '鼠', '芒种后', '六', 'Sat', '6', 'Saturday', '164', '24', '祭祀.沐浴.捕捉.结网.畋猎.取渔.余事勿取', '开市.交易.嫁娶.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200614', '1', '假日', '庚子', '闰四月廿三', '4-23', '鼠', '芒种后', '日', 'Sun', '7', 'Sunday', '165', '24', '破屋.坏垣.求医.治病.畋猎.余事勿取', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200615', '0', '工作日', '庚子', '闰四月廿四', '4-24', '鼠', '芒种后', '一', 'Mon', '1', 'Monday', '166', '25', '嫁娶.出行.安机械.祭祀.塑绘.开光.治病.经络.安床.结网.塞穴.破土.入殓', '开市.安门.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200616', '0', '工作日', '庚子', '闰四月廿五', '4-25', '鼠', '芒种后', '二', 'Tue', '2', 'Tuesday', '167', '25', '订盟.纳采.会亲友.进人口.雕刻.拆卸.修造.动土.起基.开市.栽种.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200617', '0', '工作日', '庚子', '闰四月廿六', '4-26', '鼠', '芒种后', '三', 'Wed', '3', 'Wednesday', '168', '25', '祭祀.捕捉.取渔.修饰垣墙.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200618', '0', '工作日', '庚子', '闰四月廿七', '4-27', '鼠', '芒种后', '四', 'Thu', '4', 'Thursday', '169', '25', '嫁娶.纳采.祭祀.祈福.求医.治病.出行.动土.移徙.入宅', '开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200619', '0', '工作日', '庚子', '闰四月廿八', '4-28', '鼠', '芒种后', '五', 'Fri', '5', 'Friday', '170', '25', '裁衣.作灶.移徙.入宅.纳畜', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200620', '1', '假日', '庚子', '闰四月廿九', '4-29', '鼠', '芒种后', '六', 'Sat', '6', 'Saturday', '171', '25', '祭祀.入殓.移柩.启攒.安葬', '上梁.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200621', '1', '假日', '庚子', '五月初一', '5-1', '鼠', '芒种后', '日', 'Sun', '7', 'Sunday', '172', '25', '订盟.纳采.出行.祈福.斋醮.安床.会亲友', '移徙.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200622', '0', '工作日', '庚子', '五月初二', '5-2', '鼠', '夏至', '一', 'Mon', '1', 'Monday', '173', '26', '嫁娶.纳采.出行.求医.治病.开市.移徙.入宅.启攒.安葬', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200623', '0', '工作日', '庚子', '五月初三', '5-3', '鼠', '夏至后', '二', 'Tue', '2', 'Tuesday', '174', '26', '嫁娶.祭祀.沐浴.扫舍.修饰垣墙', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200624', '0', '工作日', '庚子', '五月初四', '5-4', '鼠', '夏至后', '三', 'Wed', '3', 'Wednesday', '175', '26', '嫁娶.订盟.纳采.出行.开市.祭祀.祈福.动土.移徙.入宅.破土.安葬', '作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200625', '2', '节日', '庚子', '五月初五', '5-5', '鼠', '夏至后', '四', 'Thu', '4', 'Thursday', '176', '26', '订盟.纳采.出行.祭祀.祈福.修造.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200626', '1', '假日', '庚子', '五月初六', '5-6', '鼠', '夏至后', '五', 'Fri', '5', 'Friday', '177', '26', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200627', '1', '假日', '庚子', '五月初七', '5-7', '鼠', '夏至后', '六', 'Sat', '6', 'Saturday', '178', '26', '嫁娶.订盟.纳采.祭祀.祈福.入殓.破土.安葬', '开光.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200628', '0', '工作日', '庚子', '五月初八', '5-8', '鼠', '夏至后', '日', 'Sun', '7', 'Sunday', '179', '26', '开光.求医.治病.动土.上梁.入殓.破土.安葬', '嫁娶.开光', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200629', '0', '工作日', '庚子', '五月初九', '5-9', '鼠', '夏至后', '一', 'Mon', '1', 'Monday', '180', '27', '祭祀.栽种.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200630', '0', '工作日', '庚子', '五月初十', '5-10', '鼠', '夏至后', '二', 'Tue', '2', 'Tuesday', '181', '27', '嫁娶.开光.祭祀.祈福.求嗣.出行.解除.伐木.入宅.移徙.安床.出火.拆卸.修造.上梁.栽种.移柩', '安葬.开市.交易.立券', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200701', '0', '工作日', '庚子', '五月十一', '5-11', '鼠', '夏至后', '三', 'Wed', '3', 'Wednesday', '182', '27', '求嗣.嫁娶.纳采.合帐.裁衣.冠笄.伐木.作梁.修造.动土.起基.竖柱.上梁.安门.作灶.筑堤.造畜椆栖', '安葬.出行.祈福.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200702', '0', '工作日', '庚子', '五月十二', '5-12', '鼠', '夏至后', '四', 'Thu', '4', 'Thursday', '183', '27', '祭祀.解除.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200703', '0', '工作日', '庚子', '五月十三', '5-13', '鼠', '夏至后', '五', 'Fri', '5', 'Friday', '184', '27', '嫁娶.祭祀.祈福.出火.开光.求嗣.出行.拆卸.开市.交易.立券.挂匾.入宅.移徙.安床.栽种.动土', '安葬.行丧.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200704', '1', '假日', '庚子', '五月十四', '5-14', '鼠', '夏至后', '六', 'Sat', '6', 'Saturday', '185', '27', '开光.求嗣.出行.解除.伐木.出火.拆卸.修造.上梁.起基.入宅.移徙.开市.交易.立券.栽种.牧养.入殓.安葬.除服.成服', '置产.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200705', '1', '假日', '庚子', '五月十五', '5-15', '鼠', '夏至后', '日', 'Sun', '7', 'Sunday', '186', '27', '祭祀.理发.修饰垣墙.平治道涂.沐浴.整手足甲.扫舍', '出行.安门.修造.嫁娶.上梁.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200706', '0', '工作日', '庚子', '五月十六', '5-16', '鼠', '夏至后', '一', 'Mon', '1', 'Monday', '187', '28', '祭祀.修饰垣墙.平治道涂', '开市.动土.破土.嫁娶.修造.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200707', '0', '工作日', '庚子', '五月十七', '5-17', '鼠', '小暑', '二', 'Tue', '2', 'Tuesday', '188', '28', '订盟.纳采.祭祀.祈福.开光.安香.出火.立券.安机械.移徙.入宅.竖柱.上梁.会亲友.安床.拆卸.挂匾.牧养.教牛马', '嫁娶.安葬.行丧.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200708', '0', '工作日', '庚子', '五月十八', '5-18', '鼠', '小暑后', '三', 'Wed', '3', 'Wednesday', '189', '28', '沐浴.理发.捕捉.入殓.移柩.破土.启攒.安葬', '出火.嫁娶.入宅.作灶.破土.上梁.动土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200709', '0', '工作日', '庚子', '五月十九', '5-19', '鼠', '小暑后', '四', 'Thu', '4', 'Thursday', '190', '28', '求医.治病.破屋.坏垣.余事勿取', '嫁娶.出行', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200710', '0', '工作日', '庚子', '五月二十', '5-20', '鼠', '小暑后', '五', 'Fri', '5', 'Friday', '191', '28', '纳采.订盟.嫁娶.移徙.入宅.出行.开市.交易.立券.纳财.会亲友.安香.出火.拆卸.造屋.起基.安床.作灶.挂匾.安葬.破土.启攒.立碑.入殓.移柩', '祈福.上梁.开仓.掘井.牧养', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200711', '1', '假日', '庚子', '五月廿一', '5-21', '鼠', '小暑后', '六', 'Sat', '6', 'Saturday', '192', '28', '祭祀.祈福.斋醮.出行.纳采.订盟.安机械.出火.拆卸.修造.动土.起基.移徙.入宅.造庙.入殓.除服.成服.移柩.破土.安葬.谢土', '嫁娶.开市.栽种.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200712', '1', '假日', '庚子', '五月廿二', '5-22', '鼠', '小暑后', '日', 'Sun', '7', 'Sunday', '193', '28', '祭祀.进人口.纳财.纳畜.牧养.捕捉.余事勿取', '开市.入宅.安床.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200713', '0', '工作日', '庚子', '五月廿三', '5-23', '鼠', '小暑后', '一', 'Mon', '1', 'Monday', '194', '29', '祭祀.塑绘.开光.求医.治病.嫁娶.会亲友.放水.掘井.牧养.纳畜.开渠.安碓硙', '造屋.入宅.作灶.入学.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200714', '0', '工作日', '庚子', '五月廿四', '5-24', '鼠', '小暑后', '二', 'Tue', '2', 'Tuesday', '195', '29', '祭祀.塞穴.结网.畋猎.余事勿取', '移徙.开市.入宅.嫁娶.开光.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200715', '0', '工作日', '庚子', '五月廿五', '5-25', '鼠', '小暑后', '三', 'Wed', '3', 'Wednesday', '196', '29', '开市.纳财.祭祀.塑绘.安机械.冠笄.会亲友.裁衣.开仓.经络.纳畜.造畜椆栖.教牛马.牧养', '动土.破土.安葬.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200716', '0', '工作日', '庚子', '五月廿六', '5-26', '鼠', '小暑后', '四', 'Thu', '4', 'Thursday', '197', '29', '移徙.入宅.治病.会亲友.祭祀.祈福.斋醮.安香.移徙.嫁娶.造屋.起基', '开市.斋醮.安床.出行.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200717', '0', '工作日', '庚子', '五月廿七', '5-27', '鼠', '小暑后', '五', 'Fri', '5', 'Friday', '198', '29', '塑绘.出行.冠笄.嫁娶.进人口.裁衣.纳婿.造畜椆栖.交易.立券.牧养.开生坟.入殓.除服.成服.移柩.安葬.启攒', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200718', '1', '假日', '庚子', '五月廿八', '5-28', '鼠', '小暑后', '六', 'Sat', '6', 'Saturday', '199', '29', '祭祀.冠笄.嫁娶.捕捉.结网.畋猎.取渔.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200719', '1', '假日', '庚子', '五月廿九', '5-29', '鼠', '小暑后', '日', 'Sun', '7', 'Sunday', '200', '29', '沐浴.扫舍.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200720', '0', '工作日', '庚子', '五月三十', '5-30', '鼠', '小暑后', '一', 'Mon', '1', 'Monday', '201', '30', '纳采.祭祀.祈福.解除.动土.破土.安葬', '嫁娶.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200721', '0', '工作日', '庚子', '六月初一', '6-1', '鼠', '小暑后', '二', 'Tue', '2', 'Tuesday', '202', '30', '祭祀.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200722', '0', '工作日', '庚子', '六月初二', '6-2', '鼠', '小暑后', '三', 'Wed', '3', 'Wednesday', '203', '30', '嫁娶.纳采.开市.出行.动土.上梁.移徙.入宅.破土.安葬', '祭祀.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200723', '0', '工作日', '庚子', '六月初三', '6-3', '鼠', '大暑', '四', 'Thu', '4', 'Thursday', '204', '30', '嫁娶.纳采.开市.出行.动土.上梁.移徙.入宅.破土.安葬', '赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200724', '0', '工作日', '庚子', '六月初四', '6-4', '鼠', '大暑后', '五', 'Fri', '5', 'Friday', '205', '30', '祭祀.作灶.纳财.捕捉', '开市.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200725', '1', '假日', '庚子', '六月初五', '6-5', '鼠', '大暑后', '六', 'Sat', '6', 'Saturday', '206', '30', '嫁娶.开市.立券.祭祀.祈福.动土.移徙.入宅', '造庙.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200726', '1', '假日', '庚子', '六月初六', '6-6', '鼠', '大暑后', '日', 'Sun', '7', 'Sunday', '207', '30', '补垣.塞穴.结网.入殓.除服.成服.移柩.安葬.启攒.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200727', '0', '工作日', '庚子', '六月初七', '6-7', '鼠', '大暑后', '一', 'Mon', '1', 'Monday', '208', '31', '嫁娶.纳采.出行.祭祀.祈福.解除.移徙.入宅', '动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200728', '0', '工作日', '庚子', '六月初八', '6-8', '鼠', '大暑后', '二', 'Tue', '2', 'Tuesday', '209', '31', '嫁娶.祭祀.祈福.斋醮.治病.破土.安葬', '开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200729', '0', '工作日', '庚子', '六月初九', '6-9', '鼠', '大暑后', '三', 'Wed', '3', 'Wednesday', '210', '31', '嫁娶.出行.开市.安床.入殓.启攒.安葬', '祈福.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200730', '0', '工作日', '庚子', '六月初十', '6-10', '鼠', '大暑后', '四', 'Thu', '4', 'Thursday', '211', '31', '嫁娶.祭祀.裁衣.结网.冠笄.沐浴', '开仓.出货财.置产.安葬.动土.破土.掘井.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200731', '0', '工作日', '庚子', '六月十一', '6-11', '鼠', '大暑后', '五', 'Fri', '5', 'Friday', '212', '31', '入宅.移徙.安床.开光.祈福.求嗣.进人口.开市.交易.立券.出火.拆卸.修造.动土', '嫁娶.破土.置产.栽种.安葬.修坟.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200801', '1', '假日', '庚子', '六月十二', '6-12', '鼠', '大暑后', '六', 'Sat', '6', 'Saturday', '213', '31', '祭祀.解除.沐浴.整手足甲.入殓.移柩.破土.启攒.安葬', '嫁娶.入宅.移徙.作灶.开市.交易.安门.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200802', '1', '假日', '庚子', '六月十三', '6-13', '鼠', '大暑后', '日', 'Sun', '7', 'Sunday', '214', '31', '破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200803', '0', '工作日', '庚子', '六月十四', '6-14', '鼠', '大暑后', '一', 'Mon', '1', 'Monday', '215', '32', '嫁娶.开光.出行.理发.作梁.出火.拆卸.修造.开市.交易.立券.挂匾.动土.入宅.移徙.安床.栽种', '伐木.祭祀.纳畜.祭祀', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200804', '0', '工作日', '庚子', '六月十五', '6-15', '鼠', '大暑后', '二', 'Tue', '2', 'Tuesday', '216', '32', '嫁娶.开光.出行.祈福.求嗣.解除.拆卸.动土.修造.进人口.开市.交易.立券.挂匾.入宅.移徙.安床.栽种.纳畜.入殓.移柩.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200805', '0', '工作日', '庚子', '六月十六', '6-16', '鼠', '大暑后', '三', 'Wed', '3', 'Wednesday', '217', '32', '祭祀.作灶.纳财.栽种.纳畜.进人口', '安葬.经络.修坟.破土.开市.安床.启攒.立碑', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200806', '0', '工作日', '庚子', '六月十七', '6-17', '鼠', '大暑后', '四', 'Thu', '4', 'Thursday', '218', '32', '祭祀.祈福.求嗣.开光.开市.牧养.理发', '嫁娶.出行.安葬.入殓.入宅.作灶.冠笄.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200807', '0', '工作日', '庚子', '六月十八', '6-18', '鼠', '大暑后', '五', 'Fri', '5', 'Friday', '219', '32', '嫁娶.订盟.纳采.祭祀.斋醮.普渡.解除.出行.会亲友.开市.纳财.修造.动土.竖柱.上梁.开光.开仓.出货财.纳畜.牧养.开池.破土.启攒', '出火.入宅.造屋.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200808', '1', '假日', '庚子', '六月十九', '6-19', '鼠', '立秋', '六', 'Sat', '6', 'Saturday', '220', '32', '嫁娶.普渡.祭祀.祈福.补垣.塞穴.断蚁.筑堤.入殓.除服.成服.安葬', '动土.破土.掘井.开光.上梁.词讼', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200809', '1', '假日', '庚子', '六月二十', '6-20', '鼠', '立秋后', '日', 'Sun', '7', 'Sunday', '221', '32', '嫁娶.冠笄.祭祀.沐浴.普渡.出行.纳财.扫舍.纳畜.赴任', '开市.动土.破土.安床.开仓.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200810', '0', '工作日', '庚子', '六月廿一', '6-21', '鼠', '立秋后', '一', 'Mon', '1', 'Monday', '222', '33', '祭祀.沐浴.理发.整手足甲.冠笄.解除.入殓.移柩.破土.启攒.安葬', '嫁娶.出行.入宅.开市.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200811', '0', '工作日', '庚子', '六月廿二', '6-22', '鼠', '立秋后', '二', 'Tue', '2', 'Tuesday', '223', '33', '塑绘.冠笄.嫁娶.会亲友.进人口.经络.裁衣.栽种.纳畜.牧养.补垣.塞穴.捕捉', '祈福.开市.动土.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200812', '0', '工作日', '庚子', '六月廿三', '6-23', '鼠', '立秋后', '三', 'Wed', '3', 'Wednesday', '224', '33', '出行.沐浴.订盟.纳采.裁衣.竖柱.上梁.移徙.纳畜.牧养', '嫁娶.安门.动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200813', '0', '工作日', '庚子', '六月廿四', '6-24', '鼠', '立秋后', '四', 'Thu', '4', 'Thursday', '225', '33', '纳采.订盟.嫁娶.祭祀.祈福.普渡.开光.安香.出火.移徙.入宅.竖柱.修造.动土.竖柱.上梁.起基.造屋.安门.造庙.造桥.破土.启攒.安葬', '开市.立券.纳财.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200814', '0', '工作日', '庚子', '六月廿五', '6-25', '鼠', '立秋后', '五', 'Fri', '5', 'Friday', '226', '33', '祭祀.捕捉.畋猎.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬.启攒', '嫁娶.纳采.订盟.开市.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200815', '1', '假日', '庚子', '六月廿六', '6-26', '鼠', '立秋后', '六', 'Sat', '6', 'Saturday', '227', '33', '破屋.坏垣.治病.余事勿取', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200816', '1', '假日', '庚子', '六月廿七', '6-27', '鼠', '立秋后', '日', 'Sun', '7', 'Sunday', '228', '33', '祈福.斋醮.出行.冠笄.嫁娶.雕刻.开柱眼.入宅.造桥.开市.交易.立券.纳财.入殓.除服.成服.移柩.破土.安葬.启攒', '动土.破土.订盟.安床.开池', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200817', '0', '工作日', '庚子', '六月廿八', '6-28', '鼠', '立秋后', '一', 'Mon', '1', 'Monday', '229', '34', '祈福.求嗣.解除.订盟.纳采.动土.起基.放水.造仓.开市.纳畜.牧养.开生坟.入殓.除服.成服.移柩.破土.安葬', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200818', '0', '工作日', '庚子', '六月廿九', '6-29', '鼠', '立秋后', '二', 'Tue', '2', 'Tuesday', '230', '34', '塑绘.开光.解除.订盟.纳采.嫁娶.出火.修造.动土.移徙.入宅.拆卸.起基.安门.分居.开市.交易.立券.纳财.纳畜.牧养', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200819', '0', '工作日', '庚子', '七月初一', '7-1', '鼠', '立秋后', '三', 'Wed', '3', 'Wednesday', '231', '34', '祈福.出行.订盟.纳采.嫁娶.裁衣.动土.安床.放水.开市.掘井.交易.立券.栽种.开渠.除服.成服.移柩.破土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200820', '0', '工作日', '庚子', '七月初二', '7-2', '鼠', '立秋后', '四', 'Thu', '4', 'Thursday', '232', '34', '嫁娶.祭祀.祈福.斋醮.作灶.移徙.入宅', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200821', '0', '工作日', '庚子', '七月初三', '7-3', '鼠', '立秋后', '五', 'Fri', '5', 'Friday', '233', '34', '嫁娶.出行.纳畜.祭祀.入殓.启攒.安葬', '作灶.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200822', '1', '假日', '庚子', '七月初四', '7-4', '鼠', '立秋后', '六', 'Sat', '6', 'Saturday', '234', '34', '订盟.纳采.祭祀.祈福.修造.动土.上梁.破土.安葬', '嫁娶.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200823', '1', '假日', '庚子', '七月初五', '7-5', '鼠', '处暑', '日', 'Sun', '7', 'Sunday', '235', '34', '订盟.纳采.出行.会亲友.修造.上梁.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200824', '0', '工作日', '庚子', '七月初六', '7-6', '鼠', '处暑后', '一', 'Mon', '1', 'Monday', '236', '35', '沐浴.修饰垣墙.平治道涂.余事勿取', '嫁娶.祈福.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200825', '0', '工作日', '庚子', '七月初七', '7-7', '鼠', '处暑后', '二', 'Tue', '2', 'Tuesday', '237', '35', '嫁娶.祭祀.祈福.斋醮.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200826', '0', '工作日', '庚子', '七月初八', '7-8', '鼠', '处暑后', '三', 'Wed', '3', 'Wednesday', '238', '35', '捕捉.结网.入殓.破土.安葬', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200827', '0', '工作日', '庚子', '七月初九', '7-9', '鼠', '处暑后', '四', 'Thu', '4', 'Thursday', '239', '35', '沐浴.治病.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200828', '0', '工作日', '庚子', '七月初十', '7-10', '鼠', '处暑后', '五', 'Fri', '5', 'Friday', '240', '35', '嫁娶.订盟.纳采.出行.开市.祭祀.祈福.移徙.入宅.启攒.安葬', '动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200829', '1', '假日', '庚子', '七月十一', '7-11', '鼠', '处暑后', '六', 'Sat', '6', 'Saturday', '241', '35', '嫁娶.订盟.纳采.祭祀.祈福.求医.治病.动土.移徙.入宅.破土.安葬', '开光.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200830', '1', '假日', '庚子', '七月十二', '7-12', '鼠', '处暑后', '日', 'Sun', '7', 'Sunday', '242', '35', '订盟.纳采.祭祀.祈福.安机械.作灶.纳畜', '动土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200831', '0', '工作日', '庚子', '七月十三', '7-13', '鼠', '处暑后', '一', 'Mon', '1', 'Monday', '243', '36', '嫁娶.祭祀.祈福.求嗣.出行.动土.安床.掘井.破土.启攒', '入宅.作梁.安门.伐木.修造.上梁.入殓.造屋', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200901', '0', '工作日', '庚子', '七月十四', '7-14', '鼠', '处暑后', '二', 'Tue', '2', 'Tuesday', '244', '36', '嫁娶.祭祀.祈福.求嗣.出行.出火.拆卸.修造.移徙.动土.安床.入殓.破土.安葬.启攒', '造屋.开光.理发.造船.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200902', '0', '工作日', '庚子', '七月十五', '7-15', '鼠', '处暑后', '三', 'Wed', '3', 'Wednesday', '245', '36', '祭祀.祈福.求嗣.开光.出行.解除.上梁.造屋.移徙.安门.纳财.牧养.纳畜.安葬.启攒.入殓', '破土.置产.掘井.动土.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200903', '0', '工作日', '庚子', '七月十六', '7-16', '鼠', '处暑后', '四', 'Thu', '4', 'Thursday', '246', '36', '祭祀.解除.沐浴.理发.整手足甲.入殓.移柩.破土.安葬.扫舍', '嫁娶.会亲友.进人口.出行.入宅.移徙.赴任.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200904', '0', '工作日', '庚子', '七月十七', '7-17', '鼠', '处暑后', '五', 'Fri', '5', 'Friday', '247', '36', '塑绘.开光.进人口.纳畜.补垣.塞穴.栽种.牧养', '嫁娶.纳财.祈福.安葬.修造.开市.交易.立券.动土.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200905', '1', '假日', '庚子', '七月十八', '7-18', '鼠', '处暑后', '六', 'Sat', '6', 'Saturday', '248', '36', '祭祀.作灶.沐浴.修饰垣墙.平治道涂.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200906', '1', '假日', '庚子', '七月十九', '7-19', '鼠', '处暑后', '日', 'Sun', '7', 'Sunday', '249', '36', '祭祀.求嗣.开光.出行.伐木.作梁.出火.解除.拆卸.进人口.修造.动土.起基.安床.栽种.纳畜.入殓.破土.安葬.除服.成服', '嫁娶.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200907', '0', '工作日', '庚子', '七月二十', '7-20', '鼠', '处暑后', '一', 'Mon', '1', 'Monday', '250', '37', '嫁娶.造车器.安机械.祭祀.祈福.开光.安香.出火.出行.开市.立券.修造.动土.移徙.入宅.破土.安葬', '纳采.订盟.架马.词讼.开渠', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200908', '0', '工作日', '庚子', '七月廿一', '7-21', '鼠', '白露', '二', 'Tue', '2', 'Tuesday', '251', '37', '沐浴.捕捉.入殓.除服.成服.破土.启攒.安葬', '祭祀.嫁娶.安床.开市.入宅.探病.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200909', '0', '工作日', '庚子', '七月廿二', '7-22', '鼠', '白露后', '三', 'Wed', '3', 'Wednesday', '252', '37', '余事勿取', '探病.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200910', '0', '工作日', '庚子', '七月廿三', '7-23', '鼠', '白露后', '四', 'Thu', '4', 'Thursday', '253', '37', '订盟.纳采.祭祀.祈福.安香.出火.修造.动土.上梁.安门.起基.竖柱.上梁.定磉.开池.移徙.入宅.立券.破土', '嫁娶.造庙.造桥.造船.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200911', '0', '工作日', '庚子', '七月廿四', '7-24', '鼠', '白露后', '五', 'Fri', '5', 'Friday', '254', '37', '开光.求嗣.雕刻.嫁娶.订盟.纳采.出火.拆卸.修造.动土.起基.上梁.放水.移徙.入宅.造仓.造船.开市.开池.纳畜.牧养.挂匾', '行丧.安葬.合寿木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200912', '1', '假日', '庚子', '七月廿五', '7-25', '鼠', '白露后', '六', 'Sat', '6', 'Saturday', '255', '37', '祭祀.嫁娶.捕捉', '开光.动土.破土.开市.修造.入宅.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200913', '1', '假日', '庚子', '七月廿六', '7-26', '鼠', '白露后', '日', 'Sun', '7', 'Sunday', '256', '37', '祭祀.普渡.解除.会亲友.捕捉.畋猎.启攒.除服.成服.移柩', '嫁娶.开市.动土.掘井.开池.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200914', '0', '工作日', '庚子', '七月廿七', '7-27', '鼠', '白露后', '一', 'Mon', '1', 'Monday', '257', '38', '祭祀.出行.解除.冠笄.嫁娶.伐木.架马.开柱眼.修造.动土.移徙.入宅.开生坟.合寿木.入殓.移柩.破土.安葬.修坟', '开光.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200915', '0', '工作日', '庚子', '七月廿八', '7-28', '鼠', '白露后', '二', 'Tue', '2', 'Tuesday', '258', '38', '祭祀.祈福.求嗣.出行.沐浴.交易.扫舍.教牛马', '动土.作灶.行丧.安葬.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200916', '0', '工作日', '庚子', '七月廿九', '7-29', '鼠', '白露后', '三', 'Wed', '3', 'Wednesday', '259', '38', '出行.解除.纳采.冠笄.雕刻.修造.动土.起基.上梁.合脊.安床.移徙.入宅.开市.栽种.作厕', '造庙.安门.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200917', '0', '工作日', '庚子', '八月初一', '8-1', '鼠', '白露后', '四', 'Thu', '4', 'Thursday', '260', '38', '祭祀.沐浴.解除.理发.冠笄.安机械.作灶.造仓.开市.开池.作厕.补垣.塞穴.断蚁.结网', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200918', '0', '工作日', '庚子', '八月初二', '8-2', '鼠', '白露后', '五', 'Fri', '5', 'Friday', '261', '38', '祭祀.沐浴.修饰垣墙.平治道涂', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200919', '1', '假日', '庚子', '八月初三', '8-3', '鼠', '白露后', '六', 'Sat', '6', 'Saturday', '262', '38', '祭祀.会亲友.纳采.嫁娶.开光.塑绘.斋醮.安香.开市.立券.除服.成服.入殓.移柩.安葬.赴任.进人口.出行.裁衣.修造.动土.上梁.经络.交易', '入宅.伐木', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200920', '1', '假日', '庚子', '八月初四', '8-4', '鼠', '白露后', '日', 'Sun', '7', 'Sunday', '263', '38', '祭祀.冠笄.会亲友.拆卸.起基.除服.成服.移柩.启攒.安葬.沐浴.捕捉.开光.塑绘', '作灶.祭祀.入宅.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200921', '0', '工作日', '庚子', '八月初五', '8-5', '鼠', '白露后', '一', 'Mon', '1', 'Monday', '264', '39', '祭祀.沐浴.破屋.坏垣.余事勿取', '移徙.入宅.出行.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200922', '0', '工作日', '庚子', '八月初六', '8-6', '鼠', '白露后', '二', 'Tue', '2', 'Tuesday', '265', '39', '祭祀.塑绘.开光.出行.解除.订盟.嫁娶.拆卸.起基.安床.入宅.开市.入殓.除服.成服.移柩.破土.谢土.挂匾.开柱眼.交易', '造桥.冠笄.造屋.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200923', '0', '工作日', '庚子', '八月初七', '8-7', '鼠', '秋分', '三', 'Wed', '3', 'Wednesday', '266', '39', '祭祀.赴任.动土.上梁.开光.塑绘.冠笄.拆卸.起基.安床.开市.立券.赴任.经络', '定磉.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200924', '0', '工作日', '庚子', '八月初八', '8-8', '鼠', '秋分后', '四', 'Thu', '4', 'Thursday', '267', '39', '祭祀.裁衣.冠笄.嫁娶.纳婿.会亲友.除服.成服.移柩.捕捉.进人口.入殓', '移徙.入宅.作灶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200925', '0', '工作日', '庚子', '八月初九', '8-9', '鼠', '秋分后', '五', 'Fri', '5', 'Friday', '268', '39', '祭祀.诸事不宜', '入殓.安葬.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200926', '1', '假日', '庚子', '八月初十', '8-10', '鼠', '秋分后', '六', 'Sat', '6', 'Saturday', '269', '39', '祭祀.裁衣.冠笄.嫁娶.安机械.拆卸.动土.起基.移徙.入宅.入殓.启攒.安葬.造仓.经络', '安床.开光.开市.交易', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200927', '0', '工作日', '庚子', '八月十一', '8-11', '鼠', '秋分后', '日', 'Sun', '7', 'Sunday', '270', '39', '祭祀.出行.成服.除服.沐浴.入殓', '动土.冠笄.移徙.入宅.开市.竖柱.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200928', '0', '工作日', '庚子', '八月十二', '8-12', '鼠', '秋分后', '一', 'Mon', '1', 'Monday', '271', '40', '祭祀.沐浴.赴任.出行.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200929', '0', '工作日', '庚子', '八月十三', '8-13', '鼠', '秋分后', '二', 'Tue', '2', 'Tuesday', '272', '40', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20200930', '0', '工作日', '庚子', '八月十四', '8-14', '鼠', '秋分后', '三', 'Wed', '3', 'Wednesday', '273', '40', '沐浴.入殓.移柩.除服.成服.破土.平治道涂', '嫁娶.移徙.入宅.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201001', '2', '节日', '庚子', '八月十五', '8-15', '鼠', '秋分后', '四', 'Thu', '4', 'Thursday', '274', '40', '嫁娶.祭祀.祈福.求嗣.沐浴.出火.出行.拆卸.修造.动土.进人口.开市.交易.立券.入宅.移徙.安床.栽种.纳畜.入殓.安葬.启攒.除服.成服', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201002', '2', '节日', '庚子', '八月十六', '8-16', '鼠', '秋分后', '五', 'Fri', '5', 'Friday', '275', '40', '开光.解除.起基.动土.拆卸.上梁.立碑.修坟.安葬.破土.启攒.移柩', '嫁娶.出行.安床.作灶.祭祀.入宅.移徙.出火.进人口.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201003', '2', '节日', '庚子', '八月十七', '8-17', '鼠', '秋分后', '六', 'Sat', '6', 'Saturday', '276', '40', '破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201004', '2', '节日', '庚子', '八月十八', '8-18', '鼠', '秋分后', '日', 'Sun', '7', 'Sunday', '277', '40', '嫁娶.祈福.求嗣.出行.出火.拆卸.修造.动土.上梁.开光.进人口.开市.交易.立券.挂匾.安床.入宅.移徙.栽种.伐木.入殓.破土.除服.成服', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201005', '1', '假日', '庚子', '八月十九', '8-19', '鼠', '秋分后', '一', 'Mon', '1', 'Monday', '278', '41', '开市.交易.立券.挂匾.祭祀.开光.进人口.入宅.安床.出火.拆卸.修造.动土.栽种', '嫁娶.立碑.出行.伐木.安葬.行丧.移徙.纳畜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201006', '1', '假日', '庚子', '八月二十', '8-20', '鼠', '秋分后', '二', 'Tue', '2', 'Tuesday', '279', '41', '祭祀.理发.会亲友.进人口.嫁娶.针灸.入殓.移柩', '探病.开渠.安葬.伐木.作灶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201007', '1', '假日', '庚子', '八月廿一', '8-21', '鼠', '秋分后', '三', 'Wed', '3', 'Wednesday', '280', '41', '祭祀.立碑.修坟.启攒.除服.成服.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201008', '1', '假日', '庚子', '八月廿二', '8-22', '鼠', '秋分后', '四', 'Thu', '4', 'Thursday', '281', '41', '嫁娶.订盟.纳采.祭祀.祈福.出行.求医.治病.出火.移徙.入宅', '开市.开仓.出货财.安床.安门.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201009', '0', '工作日', '庚子', '八月廿三', '8-23', '鼠', '寒露', '五', 'Fri', '5', 'Friday', '282', '41', '冠笄.祭祀.沐浴.作灶.理发.整手足甲.扫舍.补垣.塞穴.入殓.破土.启攒', '开光.嫁娶.会亲友.栽种.针灸.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201010', '0', '工作日', '庚子', '八月廿四', '8-24', '鼠', '寒露后', '六', 'Sat', '6', 'Saturday', '283', '41', '纳采.订盟.嫁娶.祭祀.祈福.求嗣.置产.求医.治病.开市.交易.立券.会亲友.移徙.竖柱.上梁.造屋.合脊.安门.放水.捕捉.纳畜', '造庙.造船.动土.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201011', '1', '假日', '庚子', '八月廿五', '8-25', '鼠', '寒露后', '日', 'Sun', '7', 'Sunday', '284', '41', '出行.造车器.造畜椆栖.解除.冠笄.裁衣.作梁.雕刻.会亲友.移徙.入宅.安机械.造畜椆栖.开市.扫舍', '嫁娶.动土.破土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201012', '0', '工作日', '庚子', '八月廿六', '8-26', '鼠', '寒露后', '一', 'Mon', '1', 'Monday', '285', '42', '沐浴.理发.冠笄.安床.开市.立券.会亲友.交易.纳财.结网.教牛马', '移徙.入宅.出行.祈福.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201013', '0', '工作日', '庚子', '八月廿七', '8-27', '鼠', '寒露后', '二', 'Tue', '2', 'Tuesday', '286', '42', '祭祀.造畜椆栖.修饰垣墙.平治道涂.余事勿取', '嫁娶.开市.安床.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201014', '0', '工作日', '庚子', '八月廿八', '8-28', '鼠', '寒露后', '三', 'Wed', '3', 'Wednesday', '287', '42', '捕捉.结网.入殓.除服.成服.移柩.破土.安葬.启攒.立碑', '嫁娶.祭祀.入宅.造屋.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201015', '0', '工作日', '庚子', '八月廿九', '8-29', '鼠', '寒露后', '四', 'Thu', '4', 'Thursday', '288', '42', '祭祀.祈福.求嗣.斋醮.造庙.出火.安机械.会亲友.开市.交易.立券.纳财.习艺.经络.求医.治病.开池.作厕.畋猎.结网.栽种.牧养.安葬.破土.启攒', '开光.嫁娶.掘井.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201016', '0', '工作日', '庚子', '八月三十', '8-30', '鼠', '寒露后', '五', 'Fri', '5', 'Friday', '289', '42', '破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201017', '1', '假日', '庚子', '九月初一', '9-1', '鼠', '寒露后', '六', 'Sat', '6', 'Saturday', '290', '42', '会亲友.嫁娶.订盟.纳采.纳婿.拆卸.修造.动土.起基.竖柱.上梁.安床.会亲友.纳财', '出行.祈福.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201018', '1', '假日', '庚子', '九月初二', '9-2', '鼠', '寒露后', '日', 'Sun', '7', 'Sunday', '291', '42', '祭祀.塑绘.开光.祈福.斋醮.出行.订盟.纳采.裁衣.嫁娶.拆卸.修造.安床.入宅.安香.入殓.启攒.安葬.谢土.赴任.会亲友.进人口.出行.移徙.上梁.经络.开市.交易.立券.纳财', '开仓.冠笄.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201019', '0', '工作日', '庚子', '九月初三', '9-3', '鼠', '寒露后', '一', 'Mon', '1', 'Monday', '292', '43', '祭祀.作灶.入殓.除服.成服.畋猎', '栽种.动土.安葬.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201020', '0', '工作日', '庚子', '九月初四', '9-4', '鼠', '寒露后', '二', 'Tue', '2', 'Tuesday', '293', '43', '祭祀.祈福.斋醮.沐浴.竖柱.订盟.纳采.嫁娶.拆卸.入宅.移柩.启攒.谢土.赴任.出火.纳畜', '作灶.入殓.安葬.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201021', '0', '工作日', '庚子', '九月初五', '9-5', '鼠', '寒露后', '三', 'Wed', '3', 'Wednesday', '294', '43', '嫁娶.祭祀.安机械.入殓.破土.安葬', '动土.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201022', '0', '工作日', '庚子', '九月初六', '9-6', '鼠', '寒露后', '四', 'Thu', '4', 'Thursday', '295', '43', '作灶.造畜椆栖', '行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201023', '0', '工作日', '庚子', '九月初七', '9-7', '鼠', '寒露后', '五', 'Fri', '5', 'Friday', '296', '43', '沐浴.理发.入学.习艺.进人口', '嫁娶.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201024', '1', '假日', '庚子', '九月初八', '9-8', '鼠', '霜降', '六', 'Sat', '6', 'Saturday', '297', '43', '开光.针灸.会亲友.启攒.安葬', '开市.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201025', '1', '假日', '庚子', '九月初九', '9-9', '鼠', '霜降后', '日', 'Sun', '7', 'Sunday', '298', '43', '祭祀.结网.造畜椆栖.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201026', '0', '工作日', '庚子', '九月初十', '9-10', '鼠', '霜降后', '一', 'Mon', '1', 'Monday', '299', '44', '入殓.除服.成服.移柩.破土.启攒.安葬', '移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201027', '0', '工作日', '庚子', '九月十一', '9-11', '鼠', '霜降后', '二', 'Tue', '2', 'Tuesday', '300', '44', '嫁娶.订盟.纳采.出行.祭祀.祈福.动土.移徙.入宅.破土.安葬', '开市.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201028', '0', '工作日', '庚子', '九月十二', '9-12', '鼠', '霜降后', '三', 'Wed', '3', 'Wednesday', '301', '44', '祭祀.解除.破屋.坏垣.余事勿取', '余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201029', '0', '工作日', '庚子', '九月十三', '9-13', '鼠', '霜降后', '四', 'Thu', '4', 'Thursday', '302', '44', '订盟.纳采.会亲友.安机械.纳财.牧养', '祈福.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201030', '0', '工作日', '庚子', '九月十四', '9-14', '鼠', '霜降后', '五', 'Fri', '5', 'Friday', '303', '44', '嫁娶.订盟.纳采.出行.开市.祭祀.祈福.动土.移徙.入宅.破土.安葬', '斋醮.安门', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201031', '1', '假日', '庚子', '九月十五', '9-15', '鼠', '霜降后', '六', 'Sat', '6', 'Saturday', '304', '44', '祭祀.塞穴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201101', '1', '假日', '庚子', '九月十六', '9-16', '鼠', '霜降后', '日', 'Sun', '7', 'Sunday', '305', '44', '祭祀.祈福.求嗣.开光.开市.出行.解除.动土.起基.置产.栽种', '嫁娶.作灶.修坟.安门.入宅.立碑.安葬.安床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201102', '0', '工作日', '庚子', '九月十七', '9-17', '鼠', '霜降后', '一', 'Mon', '1', 'Monday', '306', '45', '祭祀.解除.裁衣.理发.安床.作灶.造畜椆栖.放水.筑堤.补垣.塞穴.整手足甲.扫舍', '嫁娶.开光.会亲友.掘井.安门.栽种', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201103', '0', '工作日', '庚子', '九月十八', '9-18', '鼠', '霜降后', '二', 'Tue', '2', 'Tuesday', '307', '45', '祭祀.出行.裁衣.冠笄.会亲友.造畜椆栖.嫁娶.竖柱.上梁.移徙.纳财.纳畜', '动土.伐木.作梁.行丧.安葬.开生坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201104', '0', '工作日', '庚子', '九月十九', '9-19', '鼠', '霜降后', '三', 'Wed', '3', 'Wednesday', '308', '45', '祭祀.祈福.求嗣.开光.出行.解除.移徙.伐木.安床.纳畜.出火.拆卸', '安葬.修坟.作灶.破土.造庙.动土.嫁娶.纳采', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201105', '0', '工作日', '庚子', '九月二十', '9-20', '鼠', '霜降后', '四', 'Thu', '4', 'Thursday', '309', '45', '开市.交易.立券.纳财.会亲友.开光.理发.入殓.移柩.安葬.启攒', '嫁娶.作灶.出火.出行.入宅.移徙.安床.祈福.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201106', '0', '工作日', '庚子', '九月廿一', '9-21', '鼠', '霜降后', '五', 'Fri', '5', 'Friday', '310', '45', '造畜椆栖.平治道涂.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201107', '1', '假日', '庚子', '九月廿二', '9-22', '鼠', '霜降后', '六', 'Sat', '6', 'Saturday', '311', '45', '纳采.移徙.纳财.开市.交易.立券.纳财.入宅.修造.动土.竖柱.起基.定磉.造庙.安香.出火.修饰垣墙.平治道涂.会亲友.出行.开池.作厕', '开仓.造屋.造桥.祭祀', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201108', '1', '假日', '庚子', '九月廿三', '9-23', '鼠', '立冬', '日', 'Sun', '7', 'Sunday', '312', '45', '订盟.纳采.纳财.开市.立券.祭祀.祈福.移徙.入宅.出行.造屋.起基.修造.动土.竖柱.上梁.安门.安香.出火.教牛马.会亲友.破土', '嫁娶.安葬.掘井.置产.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201109', '0', '工作日', '庚子', '九月廿四', '9-24', '鼠', '立冬后', '一', 'Mon', '1', 'Monday', '313', '46', '嫁娶.订盟.纳采.祭祀.祈福.塑绘.开光.移徙.安床.伐木.作梁.捕捉.畋猎.结网.求医.治病.解除.安葬.除服.成服.移柩.入殓.立碑.谢土', '开市.造庙.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201110', '0', '工作日', '庚子', '九月廿五', '9-25', '鼠', '立冬后', '二', 'Tue', '2', 'Tuesday', '314', '46', '破屋.坏垣.祭祀.余事勿取', '嫁娶.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201111', '0', '工作日', '庚子', '九月廿六', '9-26', '鼠', '立冬后', '三', 'Wed', '3', 'Wednesday', '315', '46', '嫁娶.纳采.订盟.祭祀.冠笄.裁衣.伐木.作梁.架马.定磉.开柱眼.作灶.移徙.安床.畋猎.结网.开池.作厕.除服.成服.启攒.入殓.移柩.安葬', '造屋.造船.动土.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201112', '0', '工作日', '庚子', '九月廿七', '9-27', '鼠', '立冬后', '四', 'Thu', '4', 'Thursday', '316', '46', '纳采.订盟.祭祀.祈福.求嗣.斋醮.开光.会亲友.解除.入学.纳财.交易.立券.经络.起基.动土.定磉.开池.栽种.纳畜.牧养.破土.入殓.立碑.安葬', '嫁娶.开市.入宅.出火.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201113', '0', '工作日', '庚子', '九月廿八', '9-28', '鼠', '立冬后', '五', 'Fri', '5', 'Friday', '317', '46', '捕捉.畋猎.会亲友.解除.入殓.除服.成服.移柩.余事勿取', '安床.安门.破土.修坟.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201114', '1', '假日', '庚子', '九月廿九', '9-29', '鼠', '立冬后', '六', 'Sat', '6', 'Saturday', '318', '46', '祭祀.祈福.求嗣.斋醮.沐浴.冠笄.出行.理发.拆卸.解除.起基.动土.定磉.安碓硙.开池.掘井.扫舍.除服.成服.移柩.启攒.立碑.谢土', '移徙.入宅.安门.作梁.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201115', '1', '假日', '庚子', '十月初一', '10-1', '鼠', '立冬后', '日', 'Sun', '7', 'Sunday', '319', '46', '嫁娶.冠笄.安床.纳采.会亲友.塞穴.捕捉.置产.造畜椆栖', '开光.掘井.安葬.谢土.修坟', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201116', '0', '工作日', '庚子', '十月初二', '10-2', '鼠', '立冬后', '一', 'Mon', '1', 'Monday', '320', '47', '祭祀.沐浴.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201117', '0', '工作日', '庚子', '十月初三', '10-3', '鼠', '立冬后', '二', 'Tue', '2', 'Tuesday', '321', '47', '祭祀.会亲友.嫁娶.沐浴.修造.动土.祈福.开光.塑绘.出行.订盟.纳采.裁衣.入殓.除服.成服.移柩.启攒.赴任.竖柱.上梁.纳财.扫舍.栽种.纳畜.伐木', '入宅.作灶.安床.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201118', '0', '工作日', '庚子', '十月初四', '10-4', '鼠', '立冬后', '三', 'Wed', '3', 'Wednesday', '322', '47', '理发.会亲友.补垣.塞穴.结网', '嫁娶.入宅.安门.移徙', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201119', '0', '工作日', '庚子', '十月初五', '10-5', '鼠', '立冬后', '四', 'Thu', '4', 'Thursday', '323', '47', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.除服.成服.入殓.移柩.安葬.谢土.赴任.会亲友.进人口.出行.竖柱.上梁.经络.开市.交易.立券.纳财.开仓', '作灶.治病.伐木.作梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201120', '0', '工作日', '庚子', '十月初六', '10-6', '鼠', '立冬后', '五', 'Fri', '5', 'Friday', '324', '47', '祭祀.祈福.订盟.纳采.裁衣.拆卸.修造.动土.起基.安床.移徙.入宅.安香.入殓.移柩.安葬.谢土.赴任.进人口.会亲友', '作灶.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201121', '1', '假日', '庚子', '十月初七', '10-7', '鼠', '立冬后', '六', 'Sat', '6', 'Saturday', '325', '47', '祭祀.塑绘.开光.订盟.纳采.嫁娶.安床.进人口.入殓.除服.成服.移柩.启攒.安葬.立碑', '开市.交易.破土.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201122', '1', '假日', '庚子', '十月初八', '10-8', '鼠', '立冬后', '日', 'Sun', '7', 'Sunday', '326', '47', '祭祀.解除.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201123', '0', '工作日', '庚子', '十月初九', '10-9', '鼠', '小雪', '一', 'Mon', '1', 'Monday', '327', '48', '祭祀.解除.祈福.开光.塑绘.斋醮.订盟.纳采.裁衣.冠笄.拆卸.修造.动土.入殓.除服.成服.移柩.启攒.安床.赴任.出行.移徙.竖柱.上梁.伐木.栽种.破土.安葬.纳畜', '造屋.治病', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201124', '0', '工作日', '庚子', '十月初十', '10-10', '鼠', '小雪后', '二', 'Tue', '2', 'Tuesday', '328', '48', '祭祀.祈福.订盟.纳采.裁衣.合帐.冠笄.安机械.安床.造畜椆栖.入殓.移柩.启攒.安葬.谢土.除服.成服.会亲友.竖柱.上梁.经络.开市.交易.立券.纳财.纳畜.筑堤', '嫁娶.入宅.治病.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201125', '0', '工作日', '庚子', '十月十一', '10-11', '鼠', '小雪后', '三', 'Wed', '3', 'Wednesday', '329', '48', '沐浴.扫舍.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201126', '0', '工作日', '庚子', '十月十二', '10-12', '鼠', '小雪后', '四', 'Thu', '4', 'Thursday', '330', '48', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201127', '0', '工作日', '庚子', '十月十三', '10-13', '鼠', '小雪后', '五', 'Fri', '5', 'Friday', '331', '48', '祈福.斋醮.出行.订盟.纳采.入殓.移柩.破土.安葬.立碑.结网', '入宅.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201128', '1', '假日', '庚子', '十月十四', '10-14', '鼠', '小雪后', '六', 'Sat', '6', 'Saturday', '332', '48', '祭祀.沐浴.出行.冠笄.进人口.余事勿取', '嫁娶.动土.安葬.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201129', '1', '假日', '庚子', '十月十五', '10-15', '鼠', '小雪后', '日', 'Sun', '7', 'Sunday', '333', '48', '祭祀.祈福.斋醮.塑绘.开光.订盟.纳采.裁衣.冠笄.嫁娶.拆卸.入宅.安香.入殓.移柩.理发.安葬.修坟.谢土.赴任.移徙.沐浴.治病.破土.启攒.整手足甲.入学.作梁', '开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201130', '0', '工作日', '庚子', '十月十六', '10-16', '鼠', '小雪后', '一', 'Mon', '1', 'Monday', '334', '49', '诸事不宜', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201201', '0', '工作日', '庚子', '十月十七', '10-17', '鼠', '小雪后', '二', 'Tue', '2', 'Tuesday', '335', '49', '开市.交易.立券.挂匾.纳财.开光.出行.入宅.移徙.安床.纳畜.入殓.移柩.安葬', '栽种.破土.置产.祭祀.嫁娶.动土.作灶.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201202', '0', '工作日', '庚子', '十月十八', '10-18', '鼠', '小雪后', '三', 'Wed', '3', 'Wednesday', '336', '49', '嫁娶.祭祀.祈福.求嗣.开光.出行.解除.出火.出行.拆卸.进人口.入宅.移徙.安床.栽种.动土.修造.纳畜.入殓.安葬.立碑.除服.成服', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201203', '0', '工作日', '庚子', '十月十九', '10-19', '鼠', '小雪后', '四', 'Thu', '4', 'Thursday', '337', '49', '开光.解除.拆卸.修造.动土.安床.纳畜.安葬.启攒.入殓', '嫁娶.开市.出火.栽种.破土.动土.入宅.移徙.安香.分居.掘井.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201204', '0', '工作日', '庚子', '十月二十', '10-20', '鼠', '小雪后', '五', 'Fri', '5', 'Friday', '338', '49', '破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201205', '1', '假日', '庚子', '十月廿一', '10-21', '鼠', '小雪后', '六', 'Sat', '6', 'Saturday', '339', '49', '嫁娶.祭祀.开光.出火.出行.拆卸.修造.动土.解除.开市.交易.立券.挂匾.纳财.入宅.移徙.安床.栽种.纳畜', '探病.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201206', '1', '假日', '庚子', '十月廿二', '10-22', '鼠', '小雪后', '日', 'Sun', '7', 'Sunday', '340', '49', '祭祀.祈福.求嗣.开光.解除.理发.会亲友.栽种.纳畜.牧养.安葬.修坟.立碑.启攒', '入宅.作灶.词讼.移徙.出行.赴任', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201207', '0', '工作日', '庚子', '十月廿三', '10-23', '鼠', '小雪后', '一', 'Mon', '1', 'Monday', '341', '50', '纳采.订盟.移徙.入宅.出行.安机械.会亲友.祭祀.祈福.斋醮.开光.安香.出火.解除.求医.针灸.治病.造屋.起基.修造.安门.造船.纳畜.牧养.移柩.入殓.启攒.谢土.修坟.立碑', '嫁娶.动土.安床.造桥.掘井', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201208', '0', '工作日', '庚子', '十月廿四', '10-24', '鼠', '大雪', '二', 'Tue', '2', 'Tuesday', '342', '50', '祭祀.沐浴.作灶.纳财.捕捉.畋猎.安床.扫舍', '开市.斋醮.破土.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201209', '0', '工作日', '庚子', '十月廿五', '10-25', '鼠', '大雪后', '三', 'Wed', '3', 'Wednesday', '343', '50', '祈福.斋醮.纳采.订盟.解除.架马.开柱眼.修造.动土.起基.上梁.归岫.造屋.合脊.掘井.除服.成服.破土.栽种', '移徙.开市.入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201210', '0', '工作日', '庚子', '十月廿六', '10-26', '鼠', '大雪后', '四', 'Thu', '4', 'Thursday', '344', '50', '纳采.订盟.祭祀.沐浴.冠笄.合帐.裁衣.修造.动土.拆卸.移徙.入宅.安门.开仓.筑堤.作厕.栽种.纳畜.补垣.塞穴', '嫁娶.祈福.开光.掘井.安葬.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201211', '0', '工作日', '庚子', '十月廿七', '10-27', '鼠', '大雪后', '五', 'Fri', '5', 'Friday', '345', '50', '合帐.裁衣.教牛马.余事勿取', '入宅.动土.破土.嫁娶.作灶.造船', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201212', '1', '假日', '庚子', '十月廿八', '10-28', '鼠', '大雪后', '六', 'Sat', '6', 'Saturday', '346', '50', '纳采.订盟.嫁娶.祭祀.祈福.安香.出火.出行.会亲友.经络.求医.治病.解除.拆卸.起基.修造.动土.定磉.扫舍.栽种.牧养.造畜椆栖', '斋醮.作梁.掘井.行丧.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201213', '1', '假日', '庚子', '十月廿九', '10-29', '鼠', '大雪后', '日', 'Sun', '7', 'Sunday', '347', '50', '纳财.开市.交易.立券.会亲友.进人口.经络.祭祀.祈福.安香.出火.求医.治病.修造.动土.拆卸.扫舍.安床.栽种.牧养.开生坟.合寿木.入殓.安葬.启攒', '嫁娶.祈福.出火.移徙.入宅', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201214', '0', '工作日', '庚子', '十月三十', '10-30', '鼠', '大雪后', '一', 'Mon', '1', 'Monday', '348', '51', '祭祀.入殓.移柩.余事勿取', '入宅.修造.动土.破土.安门.上梁', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201215', '0', '工作日', '庚子', '十一月初一', '11-1', '鼠', '大雪后', '二', 'Tue', '2', 'Tuesday', '349', '51', '塑绘.开光.订盟.纳采.裁衣.冠笄.拆卸.修造.安床.入宅.出火.安葬.谢土.赴任', '掘井.伐木.斋醮.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201216', '0', '工作日', '庚子', '十一月初二', '11-2', '鼠', '大雪后', '三', 'Wed', '3', 'Wednesday', '350', '51', '祭祀.塑绘.开光.裁衣.冠笄.嫁娶.纳采.拆卸.修造.动土.竖柱.上梁.安床.移徙.入宅.安香.结网.捕捉.畋猎.伐木.进人口.放水', '出行.安葬.修坟.开市', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201217', '0', '工作日', '庚子', '十一月初三', '11-3', '鼠', '大雪后', '四', 'Thu', '4', 'Thursday', '351', '51', '祭祀.求医.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201218', '0', '工作日', '庚子', '十一月初四', '11-4', '鼠', '大雪后', '五', 'Fri', '5', 'Friday', '352', '51', '祭祀.祈福.斋醮.出行.冠笄.安机械.移徙.入宅.安香.安床.除服.成服.移柩.启攒', '开光.栽种.治病.安门.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201219', '1', '假日', '庚子', '十一月初五', '11-5', '鼠', '大雪后', '六', 'Sat', '6', 'Saturday', '353', '51', '塑绘.斋醮.出行.拆卸.解除.修造.移徙.造船.入殓.除服.成服.移柩.启攒.修坟.立碑.谢土', NULL, NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201220', '1', '假日', '庚子', '十一月初六', '11-6', '鼠', '大雪后', '日', 'Sun', '7', 'Sunday', '354', '51', '祭祀.沐浴.安床.纳财.畋猎.捕捉', '开市.破土', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201221', '0', '工作日', '庚子', '十一月初七', '11-7', '鼠', '大雪后', '一', 'Mon', '1', 'Monday', '355', '52', '订盟.纳采.祭祀.祈福.修造.动土.上梁.破土', '嫁娶.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201222', '0', '工作日', '庚子', '十一月初八', '11-8', '鼠', '冬至', '二', 'Tue', '2', 'Tuesday', '356', '52', '出行.沐浴.理发.补垣.塞穴', '入宅.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201223', '0', '工作日', '庚子', '十一月初九', '11-9', '鼠', '冬至后', '三', 'Wed', '3', 'Wednesday', '357', '52', '教牛马.余事勿取', '入宅.动土.破土.余事勿取', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201224', '0', '工作日', '庚子', '十一月初十', '11-10', '鼠', '冬至后', '四', 'Thu', '4', 'Thursday', '358', '52', '嫁娶.出行.求医.治病.祭祀.祈福.上梁.纳畜', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201225', '0', '工作日', '庚子', '十一月十一', '11-11', '鼠', '冬至后', '五', 'Fri', '5', 'Friday', '359', '52', '开市.立券.开光.解除.安机械.上梁.启攒.安葬', '嫁娶.祈福', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201226', '1', '假日', '庚子', '十一月十二', '11-12', '鼠', '冬至后', '六', 'Sat', '6', 'Saturday', '360', '52', '平治道涂.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201227', '1', '假日', '庚子', '十一月十三', '11-13', '鼠', '冬至后', '日', 'Sun', '7', 'Sunday', '361', '52', '求嗣.斋醮.塑绘.订盟.纳采.出火.拆卸.修造.动土.造桥.安机械.栽种.纳畜.牧养.入殓.除服.成服.移柩.破土.安葬', '开市.嫁娶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201228', '0', '工作日', '庚子', '十一月十四', '11-14', '鼠', '冬至后', '一', 'Mon', '1', 'Monday', '362', '53', '嫁娶.订盟.纳采.祭祀.祈福.修造.动土.移徙.入宅', '开市.安葬', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201229', '0', '工作日', '庚子', '十一月十五', '11-15', '鼠', '冬至后', '二', 'Tue', '2', 'Tuesday', '363', '53', '治病.破屋.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201230', '0', '工作日', '庚子', '十一月十六', '11-16', '鼠', '冬至后', '三', 'Wed', '3', 'Wednesday', '364', '53', '祭祀.祈福.求嗣.斋醮.开光.入学.订盟.冠笄.伐木.修造.动土.起基.放水.交易.开池', '造桥.安门.理发.造庙.栽种.作灶', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20201231', '0', '工作日', '庚子', '十一月十七', '11-17', '鼠', '冬至后', '四', 'Thu', '4', 'Thursday', '365', '53', '解除.坏垣.余事勿取', '诸事不宜', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210101', '2', '节日', '庚子', '十一月十八', '11-18', '鼠', '冬至后', '五', 'Fri', '5', 'Friday', '0', '53', '搬家.结婚.入宅.领证.订婚.入学.求嗣.纳财.捕捉.嫁娶.纳采.移徙.竖柱.栽种.斋醮.求财.开仓', '装修.开业.开工.安床.出行.安葬.上梁.开张.旅游.修坟.赴任.破土.修造.祈福.祭祀.开市.纳畜.启钻.伐木.盖屋.经络.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210102', '1', '假日', '庚子', '十一月十九', '11-19', '鼠', '冬至后', '六', 'Sat', '6', 'Saturday', '1', '53', '搬家.结婚.领证.订婚.上梁.入学.求嗣.祈福.祭祀.纳财.纳畜.嫁娶.纳采.移徙.立券.竖柱.栽种.斋醮', '装修.开业.开工.动土.安床.出行.安葬.开张.旅游.赴任.破土.修造.开市.盖屋.冠笄.求医.求财.造床.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210103', '1', '假日', '庚子', '十一月二十', '11-20', '鼠', '冬至后', '日', 'Sun', '7', 'Sunday', '2', '53', '装修.开业.结婚.领证.开工.订婚.安葬.上梁.开张.求嗣.赴任.修造.祈福.祭祀.开市.纳财.纳畜.嫁娶.纳采.立券.塞穴.栽种.斋醮.送礼.筑堤.恩赦', '搬家.入宅.动土.出行.旅游.解除.安香.移徙.盖屋.求医.竖柱.分居.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210104', '0', '工作日', '庚子', '十一月廿一', '11-21', '鼠', '冬至后', '一', 'Mon', '1', 'Monday', '3', '01', '开业.结婚.领证.开工.开张.作灶.入学.祭祀.开市.纳财.纳畜.除服.嫁娶.盖屋.冠笄.斋醮.求人', '搬家.装修.入宅.动土.安门.安床.出行.订婚.安葬.上梁.旅游.求嗣.赴任.破土.修造.祈福.解除.启钻.出火.纳采.移徙.竖柱.栽种.放水.分居.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210105', '0', '工作日', '庚子', '十一月廿二', '11-22', '鼠', '小寒', '二', 'Tue', '2', 'Tuesday', '4', '01', '装修.开业.开工.动土.出行.上梁.开张.旅游.求嗣.赴任.修造.祭祀.解除.开市.牧养.纳财.开光.求医.竖柱.栽种.求财.藏宝', '搬家.结婚.入宅.领证.安床.订婚.安葬.破土.祈福.安香.纳畜.嫁娶.纳采.移徙.斋醮.放水.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210106', '0', '工作日', '庚子', '十一月廿三', '11-23', '鼠', '小寒后', '三', 'Wed', '3', 'Wednesday', '5', '01', '入宅.订婚.安葬.上梁.求嗣.解除.牧养.纳畜.启钻.裁衣.除服.纳采.经络.立券.竖柱.栽种.斋醮', '搬家.装修.开业.结婚.领证.开工.动土.出行.开张.旅游.赴任.破土.修造.祈福.祭祀.开市.纳财.嫁娶.移徙.盖屋.求财.归宁.放水.分居.开仓.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210107', '0', '工作日', '庚子', '十一月廿四', '11-24', '鼠', '小寒后', '四', 'Thu', '4', 'Thursday', '6', '01', '搬家.结婚.入宅.领证.安床.出行.订婚.安葬.上梁.旅游.求嗣.赴任.破土.祈福.祭祀.解除.纳财.启钻.除服.嫁娶.纳采.移徙.竖柱.词讼.开仓.打官司.平治道涂', '装修.动土.修造.纳畜.经络.掘井.栽种.放水.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210108', '0', '工作日', '庚子', '十一月廿五', '11-25', '鼠', '小寒后', '五', 'Fri', '5', 'Friday', '7', '01', '开业.开工.订婚.开张.入学.求嗣.祈福.祭祀.开市.纳财.裁衣.纳采.盖屋.冠笄.斋醮.求财.招赘.纳婿', '搬家.装修.结婚.入宅.领证.动土.安床.出行.安葬.上梁.旅游.修造.嫁娶.移徙.经络.求医.竖柱.词讼.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210109', '1', '假日', '庚子', '十一月廿六', '11-26', '鼠', '小寒后', '六', 'Sat', '6', 'Saturday', '8', '01', '结婚.领证.作灶.求嗣.祈福.祭祀.捕捉.嫁娶.经络.栽种.招赘.纳婿', '搬家.装修.开业.入宅.开工.安门.安床.出行.订婚.安葬.上梁.开张.旅游.破土.修造.开市.纳财.纳畜.启钻.纳采.移徙.盖屋.立券.竖柱.分居.行丧.入殓.移柩.开仓.置产.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210110', '1', '假日', '庚子', '十一月廿七', '11-27', '鼠', '小寒后', '日', 'Sun', '7', 'Sunday', '9', '01', '求嗣.赴任.祭祀.解除.破屋.立券.求医.招赘.词讼.行丧.纳婿.服药.和讼.打官司', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.作灶.旅游.破土.修造.祈福.开市.纳畜.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.放水.分居.合帐.开仓.针灸.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210111', '0', '工作日', '庚子', '十一月廿八', '11-28', '鼠', '小寒后', '一', 'Mon', '1', 'Monday', '10', '02', '装修.结婚.领证.安床.订婚.赴任.修造.祈福.祭祀.纳财.捕捉.嫁娶.纳采.斋醮.求财.取渔', '开业.开工.安葬.开张.破土.开市.纳畜.启钻.伐木.经络.立券.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210112', '0', '工作日', '庚子', '十一月廿九', '11-29', '鼠', '小寒后', '二', 'Tue', '2', 'Tuesday', '11', '02', '结婚.领证.出行.订婚.安葬.作灶.旅游.入学.修坟.赴任.祭祀.启钻.裁衣.嫁娶.纳采.盖屋.求医.竖柱.栽种.求财', '搬家.装修.开业.入宅.开工.动土.安门.安床.上梁.开张.破土.修造.祈福.安香.开市.纳财.纳畜.移徙.伐木.立券.斋醮.词讼.放水.分居.置产.筑堤.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210113', '0', '工作日', '庚子', '腊月初一', '12-1', '鼠', '小寒后', '三', 'Wed', '3', 'Wednesday', '12', '02', '装修.入宅.动土.订婚.入学.求嗣.修坟.赴任.破土.修造.祭祀.解除.纳财.裁衣.纳采.盖屋.立券.求医.竖柱.栽种.求财.置产', '搬家.开业.结婚.领证.开工.安床.出行.安葬.上梁.交易.开张.旅游.祈福.开市.纳畜.嫁娶.移徙.伐木.斋醮.词讼.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210114', '0', '工作日', '庚子', '腊月初二', '12-2', '鼠', '小寒后', '四', 'Thu', '4', 'Thursday', '13', '02', '装修.结婚.领证.动土.订婚.上梁.入学.求嗣.赴任.修造.祈福.祭祀.解除.纳财.纳畜.捕捉.嫁娶.纳采.竖柱.栽种.斋醮', '搬家.开业.入宅.开工.出行.安葬.开张.旅游.修坟.破土.安香.开市.启钻.移徙.经络.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210115', '0', '工作日', '庚子', '腊月初三', '12-3', '鼠', '小寒后', '五', 'Fri', '5', 'Friday', '14', '02', '搬家.结婚.领证.出行.上梁.旅游.入学.求嗣.祈福.祭祀.解除.纳财.纳畜.嫁娶.移徙.立券.求医.竖柱.斋醮.行丧.开仓.恩赦', '装修.开业.入宅.开工.动土.安床.订婚.安葬.交易.开张.赴任.破土.修造.开市.纳采.栽种.求财.造床.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210116', '1', '假日', '庚子', '腊月初四', '12-4', '鼠', '小寒后', '六', 'Sat', '6', 'Saturday', '15', '02', '开业.开工.订婚.安葬.上梁.开张.求嗣.赴任.祈福.祭祀.解除.开市.纳财.纳畜.纳采.立券.求医.塞穴.栽种.斋醮.行丧', '搬家.装修.结婚.入宅.领证.动土.出行.旅游.破土.修造.嫁娶.移徙.盖屋.冠笄.竖柱.归宁.放水.针灸.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210117', '1', '假日', '庚子', '腊月初五', '12-5', '鼠', '小寒后', '日', 'Sun', '7', 'Sunday', '16', '02', '搬家.开业.结婚.领证.开工.出行.开张.作灶.旅游.入学.祭祀.开市.纳财.纳畜.嫁娶.移徙.冠笄.栽种.斋醮.求财.求人', '装修.入宅.动土.安床.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.启钻.纳采.求医.竖柱.放水.分居.行丧.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210118', '0', '工作日', '庚子', '腊月初六', '12-6', '鼠', '小寒后', '一', 'Mon', '1', 'Monday', '17', '03', '开业.开工.出行.安葬.开张.旅游.求嗣.赴任.破土.祈福.祭祀.解除.开市.牧养.纳财.纳畜.启钻.除服.开光.求医.竖柱.栽种.斋醮.求财.招赘.纳婿', '搬家.装修.结婚.入宅.领证.动土.订婚.上梁.修造.安香.嫁娶.纳采.移徙.盖屋.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210119', '0', '工作日', '庚子', '腊月初七', '12-7', '鼠', '小寒后', '二', 'Tue', '2', 'Tuesday', '18', '03', '入宅.出行.安葬.旅游.求嗣.牧养.启钻.裁衣.除服.经络.栽种.招赘.词讼.纳婿.藏宝.打官司', '搬家.装修.开业.结婚.领证.开工.动土.安门.订婚.上梁.开张.作灶.赴任.破土.修造.祈福.祭祀.开市.纳财.纳畜.嫁娶.纳采.移徙.盖屋.竖柱.斋醮.求财.放水.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210120', '0', '工作日', '庚子', '腊月初八', '12-8', '鼠', '大寒', '三', 'Wed', '3', 'Wednesday', '19', '03', '开业.结婚.领证.开工.动土.出行.订婚.上梁.开张.旅游.求嗣.赴任.祈福.祭祀.开市.纳财.嫁娶.纳采.立券.竖柱.斋醮.求财.招赘.纳婿.平治道涂', '搬家.装修.入宅.安葬.破土.修造.安香.纳畜.移徙.盖屋.经络.掘井.栽种.放水.分居.行丧.开仓.造桥.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210121', '0', '工作日', '庚子', '腊月初九', '12-9', '鼠', '大寒后', '四', 'Thu', '4', 'Thursday', '20', '03', '订婚.入学.求嗣.祈福.祭祀.裁衣.纳采.盖屋.冠笄.竖柱.求财.招赘.开仓.纳婿', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安床.出行.安葬.上梁.开张.旅游.破土.修造.开市.纳财.嫁娶.移徙.立券.求医.词讼.分居.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210122', '0', '工作日', '庚子', '腊月初十', '12-10', '鼠', '大寒后', '五', 'Fri', '5', 'Friday', '21', '03', '装修.结婚.领证.动土.安床.订婚.作灶.修坟.赴任.修造.祈福.祭祀.解除.捕捉.嫁娶.纳采.盖屋.求医.栽种.词讼.和讼.打官司', '搬家.开业.入宅.开工.出行.安葬.上梁.开张.旅游.破土.开市.纳财.纳畜.启钻.移徙.经络.立券.竖柱.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210123', '1', '假日', '庚子', '腊月十一', '12-11', '鼠', '大寒后', '六', 'Sat', '6', 'Saturday', '22', '03', '作灶.求嗣.修坟.赴任.解除.纳财.破屋.立券.求医.栽种.斋醮.招赘.纳婿.服药', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.旅游.破土.修造.祈福.祭祀.开市.纳畜.启钻.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.求财.放水.分居.入殓.移柩.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210124', '1', '假日', '庚子', '腊月十二', '12-12', '鼠', '大寒后', '日', 'Sun', '7', 'Sunday', '23', '03', '搬家.装修.开业.结婚.入宅.领证.开工.动土.订婚.安葬.开张.求嗣.修坟.赴任.破土.修造.祈福.祭祀.开市.纳财.启钻.捕捉.嫁娶.纳采.移徙.盖屋.经络.立券.竖柱.栽种.斋醮.求财.取渔.和讼', '安床.上梁.解除.纳畜.伐木.求医', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210125', '0', '工作日', '庚子', '腊月十三', '12-13', '鼠', '大寒后', '一', 'Mon', '1', 'Monday', '24', '04', '搬家.装修.开业.结婚.入宅.领证.开工.动土.出行.订婚.安葬.开张.旅游.入学.求嗣.修坟.赴任.修造.祭祀.解除.开市.纳财.启钻.裁衣.嫁娶.纳采.移徙.盖屋.立券.求医.竖柱.栽种.求财.置产', '安床.上梁.破土.祈福.纳畜.伐木.斋醮.词讼.放水.筑堤.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210126', '0', '工作日', '庚子', '腊月十四', '12-14', '鼠', '大寒后', '二', 'Tue', '2', 'Tuesday', '25', '04', '搬家.装修.结婚.入宅.领证.动土.订婚.上梁.入学.求嗣.赴任.修造.祈福.祭祀.解除.纳财.纳畜.捕捉.嫁娶.纳采.移徙.竖柱.栽种.斋醮', '开业.开工.出行.安葬.开张.旅游.修坟.破土.开市.启钻.盖屋.经络.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210127', '0', '工作日', '庚子', '腊月十五', '12-15', '鼠', '大寒后', '三', 'Wed', '3', 'Wednesday', '26', '04', '结婚.领证.出行.订婚.上梁.作灶.旅游.入学.求嗣.赴任.祈福.祭祀.解除.纳财.纳畜.嫁娶.纳采.立券.求医.竖柱.斋醮.行丧.开仓.恩赦', '搬家.装修.开业.入宅.开工.动土.安床.安葬.开张.破土.修造.安香.开市.移徙.栽种.求财.造床.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210128', '0', '工作日', '庚子', '腊月十六', '12-16', '鼠', '大寒后', '四', 'Thu', '4', 'Thursday', '27', '04', '开业.开工.订婚.安葬.开张.求嗣.赴任.祈福.祭祀.开市.纳财.启钻.除服.纳采.立券.求医.塞穴.斋醮.招赘.行丧.纳婿', '搬家.装修.结婚.入宅.领证.动土.出行.旅游.破土.修造.嫁娶.移徙.盖屋.冠笄.开池.竖柱.归宁.放水.针灸.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210129', '0', '工作日', '庚子', '腊月十七', '12-17', '鼠', '大寒后', '五', 'Fri', '5', 'Friday', '28', '04', '出行.旅游.入学.祭祀.冠笄.求财.求人.招赘.纳婿', '搬家.装修.结婚.入宅.领证.动土.安门.安床.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.安香.启钻.嫁娶.纳采.移徙.求医.竖柱.放水.分居.行丧.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210130', '1', '假日', '庚子', '腊月十八', '12-18', '鼠', '大寒后', '六', 'Sat', '6', 'Saturday', '29', '04', '搬家.开业.入宅.开工.出行.上梁.开张.旅游.求嗣.修坟.赴任.祈福.祭祀.解除.开市.牧养.纳财.纳畜.启钻.开光.移徙.盖屋.求医.竖柱.栽种.求财.招赘.纳婿', '装修.结婚.领证.动土.订婚.安葬.破土.修造.嫁娶.纳采.行丧.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210131', '1', '假日', '庚子', '腊月十九', '12-19', '鼠', '大寒后', '日', 'Sun', '7', 'Sunday', '30', '04', '求嗣.修坟.牧养.启钻.裁衣.经络.栽种.招赘.词讼.纳婿.藏宝.打官司', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.出行.订婚.安葬.上梁.开张.作灶.旅游.赴任.破土.修造.祈福.祭祀.开市.纳财.纳畜.出火.嫁娶.纳采.移徙.盖屋.竖柱.斋醮.求财.放水.分居.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210201', '0', '工作日', '庚子', '腊月二十', '12-20', '鼠', '大寒后', '一', 'Mon', '1', 'Monday', '31', '05', '搬家.开业.结婚.入宅.领证.开工.动土.安床.出行.订婚.安葬.上梁.开张.作灶.旅游.求嗣.赴任.祈福.祭祀.开市.纳财.嫁娶.纳采.移徙.立券.竖柱.斋醮.求财.招赘.纳婿.平治道涂', '装修.修造.纳畜.盖屋.经络.掘井.栽种.放水.分居.开仓.造桥.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210202', '0', '工作日', '庚子', '腊月廿一', '12-21', '鼠', '大寒后', '二', 'Tue', '2', 'Tuesday', '32', '05', '搬家.订婚.安葬.上梁.入学.求嗣.赴任.祈福.祭祀.解除.纳畜.裁衣.纳采.移徙.盖屋.冠笄.竖柱.栽种.斋醮.求财.送礼.开仓', '装修.开业.结婚.入宅.领证.开工.动土.安床.出行.开张.旅游.修造.开市.纳财.嫁娶.立券.求医.词讼.分居.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210203', '0', '工作日', '庚子', '腊月廿二', '12-22', '鼠', '立春', '三', 'Wed', '3', 'Wednesday', '33', '05', '装修.结婚.领证.动土.订婚.求嗣.修坟.修造.祈福.祭祀.解除.捕捉.嫁娶.纳采.盖屋.求医.栽种.斋醮.词讼.和讼.打官司', '搬家.开业.入宅.开工.出行.安葬.上梁.开张.旅游.赴任.破土.开市.纳财.纳畜.启钻.移徙.经络.立券.竖柱.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210204', '0', '工作日', '庚子', '腊月廿三', '12-23', '鼠', '立春后', '四', 'Thu', '4', 'Thursday', '34', '05', '作灶.求嗣.修坟.赴任.解除.纳财.破屋.立券.求医.栽种.斋醮.招赘.纳婿.服药', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.旅游.破土.修造.祈福.祭祀.开市.纳畜.启钻.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.求财.放水.分居.入殓.移柩.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210205', '0', '工作日', '庚子', '腊月廿四', '12-24', '鼠', '立春后', '五', 'Fri', '5', 'Friday', '35', '05', '装修.开业.结婚.领证.开工.动土.订婚.安葬.开张.求嗣.修坟.赴任.破土.修造.祈福.祭祀.开市.纳财.启钻.捕捉.嫁娶.纳采.盖屋.立券.竖柱.栽种.斋醮.求财.取渔.和讼', '搬家.入宅.安床.上梁.解除.安香.纳畜.移徙.伐木.经络.求医', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210206', '1', '假日', '庚子', '腊月廿五', '12-25', '鼠', '立春后', '六', 'Sat', '6', 'Saturday', '36', '05', '装修.开业.结婚.入宅.领证.开工.动土.出行.订婚.开张.作灶.旅游.入学.求嗣.修坟.赴任.破土.修造.祭祀.解除.开市.纳财.启钻.裁衣.嫁娶.纳采.盖屋.立券.求医.竖柱.栽种.求财.置产', '搬家.安床.安葬.上梁.祈福.纳畜.移徙.伐木.斋醮.词讼.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210207', '0', '工作日', '庚子', '腊月廿六', '12-26', '鼠', '立春后', '日', 'Sun', '7', 'Sunday', '37', '05', '装修.结婚.领证.订婚.入学.修造.祈福.祭祀.纳财.纳畜.捕捉.嫁娶.纳采.栽种.斋醮', '搬家.开业.入宅.开工.出行.安葬.开张.旅游.修坟.破土.安香.开市.启钻.移徙.经络.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210208', '0', '工作日', '庚子', '腊月廿七', '12-27', '鼠', '立春后', '一', 'Mon', '1', 'Monday', '38', '06', '搬家.结婚.领证.出行.订婚.旅游.入学.求嗣.祈福.祭祀.纳财.嫁娶.纳采.移徙.立券.求医.斋醮.行丧.开仓.恩赦', '装修.开业.入宅.开工.动土.安床.安葬.上梁.开张.赴任.破土.修造.开市.盖屋.栽种.求财.造床.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210209', '0', '工作日', '庚子', '腊月廿八', '12-28', '鼠', '立春后', '二', 'Tue', '2', 'Tuesday', '39', '06', '开业.开工.订婚.开张.求嗣.赴任.祈福.祭祀.开市.纳财.纳采.立券.求医.塞穴.斋醮', '搬家.装修.结婚.入宅.领证.动土.出行.安葬.旅游.破土.修造.嫁娶.移徙.盖屋.冠笄.竖柱.归宁.放水.行丧.针灸.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210210', '0', '工作日', '庚子', '腊月廿九', '12-29', '鼠', '立春后', '三', 'Wed', '3', 'Wednesday', '40', '06', '出行.旅游.入学.祭祀.冠笄.求财.求人.招赘.纳婿', '装修.结婚.入宅.领证.动土.安床.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.启钻.嫁娶.纳采.求医.竖柱.放水.分居.行丧.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210211', '1', '假日', '庚子', '腊月三十', '12-30', '鼠', '立春后', '四', 'Thu', '4', 'Thursday', '41', '06', '搬家.开业.结婚.入宅.领证.开工.安床.出行.安葬.上梁.开张.作灶.旅游.求嗣.赴任.破土.祈福.祭祀.解除.开市.牧养.纳财.纳畜.启钻.除服.开光.嫁娶.移徙.盖屋.求医.竖柱.栽种.求财.招赘.纳婿', '装修.动土.订婚.修造.纳采.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210212', '2', '节日', '辛丑', '正月初一', '1-1', '牛', '立春后', '五', 'Fri', '5', 'Friday', '42', '06', '开业.结婚.领证.开工.安床.出行.开张.作灶.旅游.赴任.破土.祈福.祭祀.解除.开市.牧养.纳财.启钻.除服.开光.嫁娶.盖屋.求医.栽种.求财.招赘.纳婿', '搬家.装修.入宅.动土.订婚.安葬.上梁.修造.纳畜.纳采.移徙.开池.分居.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210213', '2', '节日', '辛丑', '正月初二', '1-2', '牛', '立春后', '六', 'Sat', '6', 'Saturday', '43', '06', '结婚.领证.订婚.作灶.求嗣.牧养.裁衣.嫁娶.纳采.经络.栽种', '搬家.装修.开业.入宅.开工.动土.安床.出行.安葬.开张.旅游.赴任.破土.修造.祈福.祭祀.开市.纳财.移徙.盖屋.立券.斋醮.求财.放水.分居.行丧.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210214', '2', '节日', '辛丑', '正月初三', '1-3', '牛', '立春后', '日', 'Sun', '7', 'Sunday', '44', '06', '结婚.领证.动土.订婚.求嗣.赴任.纳财.嫁娶.纳采.藏宝.平治道涂', '搬家.装修.开业.入宅.开工.安葬.上梁.开张.破土.修造.祈福.祭祀.解除.安香.开市.纳畜.启钻.移徙.盖屋.经络.掘井.立券.求医.竖柱.栽种.放水.开仓.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210215', '1', '假日', '辛丑', '正月初四', '1-4', '牛', '立春后', '一', 'Mon', '1', 'Monday', '45', '07', '搬家.开业.结婚.入宅.领证.开工.订婚.上梁.开张.入学.求嗣.修坟.祈福.祭祀.解除.开市.纳财.纳畜.启钻.裁衣.嫁娶.纳采.移徙.盖屋.冠笄.立券.竖柱.栽种.求财.开仓', '装修.动土.安床.出行.安葬.旅游.赴任.破土.修造.求医.词讼.分居.行丧.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210216', '1', '假日', '辛丑', '正月初五', '1-5', '牛', '立春后', '二', 'Tue', '2', 'Tuesday', '46', '07', '装修.结婚.领证.动土.安床.订婚.安葬.上梁.求嗣.修坟.赴任.破土.修造.祭祀.解除.启钻.捕捉.嫁娶.纳采.盖屋.竖柱.栽种.招赘.纳婿', '搬家.开业.入宅.开工.出行.开张.旅游.祈福.安香.开市.纳财.纳畜.移徙.立券.斋醮.放水.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210217', '1', '假日', '辛丑', '正月初六', '1-6', '牛', '立春后', '三', 'Wed', '3', 'Wednesday', '47', '07', '开业.结婚.领证.开工.开张.作灶.求嗣.修坟.赴任.破土.祭祀.解除.开市.纳财.破屋.启钻.嫁娶.立券.求医.栽种.斋醮.求财.招赘.词讼.纳婿.服药.和讼.打官司', '搬家.装修.入宅.动土.安门.安床.出行.订婚.安葬.上梁.旅游.修造.祈福.纳畜.纳采.移徙.盖屋.冠笄.经络.竖柱.放水.分居.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210218', '0', '工作日', '辛丑', '正月初七', '1-7', '牛', '雨水', '四', 'Thu', '4', 'Thursday', '48', '07', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安床.订婚.上梁.开张.作灶.求嗣.修坟.赴任.修造.祈福.祭祀.解除.开市.纳财.纳畜.捕捉.嫁娶.纳采.移徙.立券.竖柱.栽种.斋醮.求财.取渔', '安葬.破土.启钻.伐木.入殓.移柩.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210219', '0', '工作日', '辛丑', '正月初八', '1-8', '牛', '雨水后', '五', 'Fri', '5', 'Friday', '49', '07', '搬家.装修.开业.结婚.入宅.领证.开工.动土.出行.订婚.上梁.开张.旅游.入学.赴任.修造.祭祀.开市.纳财.裁衣.嫁娶.纳采.移徙.盖屋.立券.求医.竖柱.求财.和讼', '祈福.纳畜.经络.栽种.斋醮.词讼.置产.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210220', '0', '工作日', '辛丑', '正月初九', '1-9', '牛', '雨水后', '六', 'Sat', '6', 'Saturday', '50', '07', '装修.入宅.订婚.入学.修造.祈福.祭祀.纳财.捕捉.纳采.盖屋.立券.栽种.斋醮.招赘.纳婿', '搬家.开业.结婚.领证.开工.安床.出行.安葬.上梁.开张.旅游.修坟.赴任.破土.开市.纳畜.启钻.嫁娶.移徙.伐木.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210221', '1', '假日', '辛丑', '正月初十', '1-10', '牛', '雨水后', '日', 'Sun', '7', 'Sunday', '51', '07', '搬家.装修.结婚.入宅.领证.出行.旅游.入学.求嗣.修造.祈福.祭祀.纳财.启钻.除服.嫁娶.移徙.立券.求医.栽种.斋醮.招赘.行丧.开仓.纳婿', '开业.开工.动土.安门.安床.订婚.安葬.上梁.开张.作灶.破土.开市.纳畜.纳采.伐木.盖屋.竖柱.求财.造床.放水.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210222', '0', '工作日', '辛丑', '正月十一', '1-11', '牛', '雨水后', '一', 'Mon', '1', 'Monday', '52', '08', '开业.结婚.领证.开工.安床.订婚.安葬.开张.作灶.求嗣.赴任.祈福.祭祀.开市.纳财.嫁娶.纳采.立券.求医.塞穴.招赘.行丧.纳婿', '搬家.装修.入宅.动土.出行.旅游.破土.修造.纳畜.移徙.盖屋.竖柱.归宁.放水.开仓.针灸.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210223', '0', '工作日', '辛丑', '正月十二', '1-12', '牛', '雨水后', '二', 'Tue', '2', 'Tuesday', '53', '08', '开业.结婚.领证.开工.安床.出行.开张.作灶.旅游.入学.修坟.祭祀.开市.纳财.除服.嫁娶.斋醮.求财.求人.恩赦', '搬家.装修.入宅.动土.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.安香.启钻.纳采.移徙.盖屋.冠笄.求医.竖柱.放水.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210224', '0', '工作日', '辛丑', '正月十三', '1-13', '牛', '雨水后', '三', 'Wed', '3', 'Wednesday', '54', '08', '装修.安葬.修坟.赴任.破土.修造.祈福.祭祀.解除.牧养.启钻.除服.开光.盖屋.求医.栽种.求财.招赘.纳婿', '搬家.结婚.入宅.领证.出行.订婚.旅游.纳畜.出火.嫁娶.纳采.移徙.开池.分居.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210225', '0', '工作日', '辛丑', '正月十四', '1-14', '牛', '雨水后', '四', 'Thu', '4', 'Thursday', '55', '08', '订婚.上梁.求嗣.解除.牧养.纳畜.裁衣.纳采.经络.竖柱.栽种', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安床.出行.安葬.开张.旅游.赴任.破土.修造.祈福.祭祀.安香.开市.纳财.嫁娶.移徙.盖屋.立券.求财.放水.分居.行丧.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210226', '0', '工作日', '辛丑', '正月十五', '1-15', '牛', '雨水后', '五', 'Fri', '5', 'Friday', '56', '08', '搬家.结婚.领证.动土.订婚.求嗣.赴任.纳财.嫁娶.纳采.移徙.藏宝.平治道涂', '装修.开业.开工.安葬.上梁.开张.破土.修造.祈福.祭祀.解除.开市.纳畜.启钻.盖屋.经络.掘井.立券.求医.竖柱.栽种.放水.开仓.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210227', '1', '假日', '辛丑', '正月十六', '1-16', '牛', '雨水后', '六', 'Sat', '6', 'Saturday', '57', '08', '搬家.开业.结婚.入宅.领证.开工.订婚.安葬.上梁.开张.作灶.入学.求嗣.修坟.赴任.破土.祈福.祭祀.解除.开市.纳财.纳畜.启钻.裁衣.嫁娶.纳采.移徙.盖屋.冠笄.立券.竖柱.栽种.求财.招赘.开仓.纳婿', '装修.动土.安床.出行.旅游.修造.求医.词讼.分居.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210228', '1', '假日', '辛丑', '正月十七', '1-17', '牛', '雨水后', '日', 'Sun', '7', 'Sunday', '58', '08', '装修.结婚.领证.动土.安床.订婚.作灶.求嗣.修坟.赴任.破土.修造.祭祀.解除.启钻.捕捉.嫁娶.纳采.盖屋.竖柱.栽种', '搬家.开业.入宅.开工.出行.安葬.上梁.开张.旅游.祈福.开市.纳财.纳畜.移徙.立券.斋醮.放水.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210301', '0', '工作日', '辛丑', '正月十八', '1-18', '牛', '雨水后', '一', 'Mon', '1', 'Monday', '59', '09', '开业.开工.开张.作灶.修坟.赴任.破土.解除.开市.破屋.启钻.立券.求医.斋醮.求财.招赘.词讼.纳婿.服药.和讼.打官司', '搬家.装修.结婚.入宅.领证.动土.安门.安床.出行.订婚.安葬.上梁.旅游.修造.祈福.纳畜.嫁娶.纳采.移徙.盖屋.冠笄.经络.竖柱.放水.分居.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210302', '0', '工作日', '辛丑', '正月十九', '1-19', '牛', '雨水后', '二', 'Tue', '2', 'Tuesday', '60', '09', '搬家.装修.结婚.入宅.领证.安床.订婚.上梁.求嗣.修坟.赴任.修造.祈福.祭祀.纳财.纳畜.捕捉.嫁娶.纳采.移徙.立券.竖柱.栽种.斋醮.求财.取渔', '安葬.破土.启钻.伐木.入殓.移柩.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210303', '0', '工作日', '辛丑', '正月二十', '1-20', '牛', '雨水后', '三', 'Wed', '3', 'Wednesday', '61', '09', '搬家.装修.开业.结婚.入宅.领证.开工.动土.出行.订婚.上梁.开张.旅游.入学.求嗣.修造.祭祀.开市.纳财.裁衣.嫁娶.纳采.移徙.盖屋.立券.求医.竖柱.求财.和讼', '安床.安葬.赴任.破土.祈福.纳畜.栽种.斋醮.词讼.置产.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210304', '0', '工作日', '辛丑', '正月廿一', '1-21', '牛', '雨水后', '四', 'Thu', '4', 'Thursday', '62', '09', '装修.结婚.领证.动土.订婚.作灶.入学.求嗣.赴任.修造.祈福.祭祀.纳财.捕捉.嫁娶.纳采.盖屋.立券.竖柱.栽种.斋醮.送礼.招赘.纳婿', '搬家.开业.入宅.开工.安床.出行.安葬.上梁.开张.旅游.修坟.破土.安香.开市.纳畜.启钻.移徙.伐木.经络', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210305', '0', '工作日', '辛丑', '正月廿二', '1-22', '牛', '惊蛰', '五', 'Fri', '5', 'Friday', '63', '09', '搬家.装修.结婚.入宅.领证.入学.求嗣.赴任.修造.祈福.祭祀.纳财.启钻.除服.嫁娶.移徙.立券.求医.栽种.斋醮.招赘.行丧.开仓.纳婿', '开业.开工.动土.安门.安床.出行.订婚.安葬.上梁.交易.开张.作灶.旅游.破土.开市.纳畜.纳采.伐木.盖屋.竖柱.求财.造床', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210306', '1', '假日', '辛丑', '正月廿三', '1-23', '牛', '惊蛰后', '六', 'Sat', '6', 'Saturday', '64', '09', '开业.开工.订婚.安葬.上梁.开张.求嗣.赴任.祈福.祭祀.开市.纳财.纳采.立券.求医.塞穴.栽种.斋醮.行丧', '搬家.装修.结婚.入宅.领证.动土.出行.旅游.破土.修造.安香.纳畜.嫁娶.移徙.盖屋.竖柱.归宁.放水.开仓.针灸.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210307', '1', '假日', '辛丑', '正月廿四', '1-24', '牛', '惊蛰后', '日', 'Sun', '7', 'Sunday', '65', '09', '搬家.结婚.领证.出行.旅游.入学.祭祀.纳财.纳畜.除服.嫁娶.移徙.栽种.斋醮.求财.求人.恩赦', '装修.动土.安床.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.启钻.纳采.盖屋.冠笄.求医.竖柱.放水.行丧.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210308', '0', '工作日', '辛丑', '正月廿五', '1-25', '牛', '惊蛰后', '一', 'Mon', '1', 'Monday', '66', '10', '出行.旅游.求嗣.赴任.破土.祈福.祭祀.解除.牧养.纳财.启钻.除服.开光.盖屋.求医.竖柱.栽种.求财.招赘.纳婿', '搬家.装修.结婚.入宅.领证.动土.订婚.安葬.上梁.修造.纳畜.嫁娶.纳采.移徙.分居.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210309', '0', '工作日', '辛丑', '正月廿六', '1-26', '牛', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '67', '10', '结婚.领证.订婚.上梁.作灶.求嗣.解除.牧养.纳畜.裁衣.嫁娶.纳采.经络.竖柱.栽种', '搬家.装修.开业.入宅.开工.动土.安床.出行.安葬.开张.旅游.赴任.破土.修造.祈福.祭祀.开市.纳财.移徙.盖屋.立券.求财.放水.分居.行丧.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210310', '0', '工作日', '辛丑', '正月廿七', '1-27', '牛', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '68', '10', '搬家.结婚.入宅.领证.动土.安床.订婚.作灶.求嗣.赴任.纳财.嫁娶.纳采.移徙.藏宝.平治道涂', '装修.开业.开工.安葬.上梁.开张.破土.修造.祈福.祭祀.解除.开市.纳畜.启钻.盖屋.经络.掘井.立券.求医.竖柱.栽种.放水.开仓.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210311', '0', '工作日', '辛丑', '正月廿八', '1-28', '牛', '惊蛰后', '四', 'Thu', '4', 'Thursday', '69', '10', '搬家.开业.结婚.领证.开工.订婚.安葬.上梁.开张.入学.求嗣.赴任.祈福.祭祀.解除.开市.纳财.纳畜.裁衣.嫁娶.纳采.移徙.盖屋.冠笄.立券.竖柱.栽种.求财.开仓', '装修.动土.安床.出行.旅游.修造.求医.词讼.分居.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210312', '0', '工作日', '辛丑', '正月廿九', '1-29', '牛', '惊蛰后', '五', 'Fri', '5', 'Friday', '70', '10', '装修.结婚.领证.安床.订婚.上梁.修造.祭祀.捕捉.嫁娶.纳采.盖屋.竖柱.栽种', '搬家.开业.入宅.开工.出行.开张.旅游.祈福.开市.纳财.纳畜.移徙.立券.斋醮.放水.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210313', '1', '假日', '辛丑', '二月初一', '2-1', '牛', '惊蛰后', '六', 'Sat', '6', 'Saturday', '71', '10', '结婚.领证.动土.作灶.修坟.赴任.破土.祈福.祭祀.解除.启钻.捕捉.嫁娶.求医.栽种.斋醮.求财.词讼.和讼.打官司', '搬家.装修.开业.入宅.开工.安门.安床.出行.订婚.安葬.上梁.开张.旅游.修造.安香.开市.纳财.纳畜.纳采.移徙.盖屋.立券.竖柱.分居.开仓.置产.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210314', '1', '假日', '辛丑', '二月初二', '2-2', '牛', '惊蛰后', '日', 'Sun', '7', 'Sunday', '72', '10', '结婚.领证.修坟.破土.破屋.嫁娶.立券.求医.招赘.纳婿.服药', '搬家.装修.开业.入宅.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.作灶.旅游.赴任.修造.祈福.开市.纳畜.纳采.移徙.盖屋.冠笄.竖柱.栽种.造床.放水.分居.合帐.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210315', '0', '工作日', '辛丑', '二月初三', '2-3', '牛', '惊蛰后', '一', 'Mon', '1', 'Monday', '73', '11', '装修.开业.结婚.领证.开工.动土.安床.订婚.安葬.上梁.开张.求嗣.赴任.修造.祭祀.解除.开市.纳财.捕捉.嫁娶.纳采.盖屋.立券.竖柱.栽种.取渔', '搬家.入宅.祈福.安香.纳畜.移徙.伐木.经络.斋醮.放水.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210316', '0', '工作日', '辛丑', '二月初四', '2-4', '牛', '惊蛰后', '二', 'Tue', '2', 'Tuesday', '74', '11', '搬家.装修.开业.结婚.入宅.领证.开工.动土.出行.订婚.开张.旅游.入学.修造.祭祀.开市.纳财.裁衣.嫁娶.纳采.移徙.盖屋.立券.求医.竖柱.栽种.求财.置产', '安床.安葬.上梁.破土.祈福.纳畜.启钻.伐木.斋醮.词讼.行丧.入殓.移柩.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210317', '0', '工作日', '辛丑', '二月初五', '2-5', '牛', '惊蛰后', '三', 'Wed', '3', 'Wednesday', '75', '11', '搬家.结婚.入宅.领证.订婚.作灶.入学.求嗣.赴任.祈福.祭祀.解除.纳财.捕捉.嫁娶.纳采.移徙.竖柱.栽种.斋醮.和讼', '装修.开业.开工.动土.安床.出行.安葬.上梁.开张.旅游.修坟.破土.修造.开市.纳畜.启钻.伐木.盖屋.经络.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210318', '0', '工作日', '辛丑', '二月初六', '2-6', '牛', '惊蛰后', '四', 'Thu', '4', 'Thursday', '76', '11', '搬家.结婚.领证.订婚.上梁.入学.求嗣.赴任.祈福.祭祀.解除.纳畜.嫁娶.纳采.移徙.求医.竖柱.栽种.斋醮.招赘.纳婿', '装修.开业.入宅.开工.动土.安床.出行.安葬.开张.旅游.破土.修造.开市.纳财.立券.求财.分居.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210319', '0', '工作日', '辛丑', '二月初七', '2-7', '牛', '惊蛰后', '五', 'Fri', '5', 'Friday', '77', '11', '装修.开业.结婚.领证.开工.订婚.安葬.开张.求嗣.赴任.破土.修造.祈福.祭祀.开市.纳财.启钻.除服.嫁娶.纳采.经络.立券.塞穴.栽种.斋醮.招赘.纳婿.筑堤.恩赦', '搬家.入宅.动土.出行.上梁.旅游.解除.安香.纳畜.移徙.盖屋.求医.竖柱.归宁.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210320', '1', '假日', '辛丑', '二月初八', '2-8', '牛', '春分', '六', 'Sat', '6', 'Saturday', '78', '11', '搬家.入宅.出行.旅游.入学.赴任.纳财.纳畜.除服.移徙.冠笄.栽种.斋醮.求财.求人', '装修.结婚.领证.动土.订婚.安葬.上梁.求嗣.破土.修造.祈福.祭祀.解除.启钻.嫁娶.纳采.竖柱.放水.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210321', '1', '假日', '辛丑', '二月初九', '2-9', '牛', '春分后', '日', 'Sun', '7', 'Sunday', '79', '11', '装修.出行.旅游.求嗣.赴任.修造.祭祀.解除.牧养.纳财.开光.求医.竖柱.栽种.求财', '搬家.开业.结婚.入宅.领证.开工.安床.订婚.安葬.上梁.开张.破土.祈福.安香.开市.纳畜.启钻.嫁娶.纳采.移徙.盖屋.冠笄.经络.立券.斋醮.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210322', '0', '工作日', '辛丑', '二月初十', '2-10', '牛', '春分后', '一', 'Mon', '1', 'Monday', '80', '12', '结婚.领证.安床.出行.订婚.安葬.作灶.旅游.牧养.裁衣.嫁娶.纳采.经络.立券.栽种.斋醮', '搬家.装修.开业.入宅.开工.动土.开张.赴任.破土.修造.祈福.祭祀.开市.纳财.移徙.盖屋.求医.求财.放水.分居.开仓.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210323', '0', '工作日', '辛丑', '二月十一', '2-11', '牛', '春分后', '二', 'Tue', '2', 'Tuesday', '81', '12', '装修.开业.结婚.领证.开工.动土.订婚.安葬.上梁.开张.求嗣.修坟.赴任.破土.修造.祈福.祭祀.解除.开市.纳财.纳畜.启钻.嫁娶.纳采.盖屋.竖柱.斋醮.词讼.行丧.打官司.平治道涂', '搬家.入宅.出行.旅游.出火.移徙.经络.掘井.栽种.放水.分居.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210324', '0', '工作日', '辛丑', '二月十二', '2-12', '牛', '春分后', '三', 'Wed', '3', 'Wednesday', '82', '12', '搬家.开业.结婚.领证.开工.订婚.安葬.开张.入学.求嗣.修坟.赴任.破土.祈福.祭祀.开市.纳财.启钻.裁衣.嫁娶.纳采.移徙.盖屋.冠笄.斋醮.求财.行丧.藏宝', '装修.动土.安床.出行.上梁.旅游.修造.求医.竖柱.词讼.针灸.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210325', '0', '工作日', '辛丑', '二月十三', '2-13', '牛', '春分后', '四', 'Thu', '4', 'Thursday', '83', '12', '装修.结婚.领证.安床.订婚.安葬.上梁.作灶.修坟.破土.修造.祈福.祭祀.解除.启钻.捕捉.嫁娶.纳采.盖屋.求医.竖柱.栽种.求财.词讼.和讼.打官司', '搬家.开业.入宅.开工.出行.开张.旅游.赴任.开市.纳财.移徙.立券.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210326', '0', '工作日', '辛丑', '二月十四', '2-14', '牛', '春分后', '五', 'Fri', '5', 'Friday', '84', '12', '修坟.破屋.启钻.立券.求医.招赘.纳婿.服药', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.作灶.旅游.破土.修造.祈福.开市.纳畜.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.栽种.造床.放水.分居.行丧.合帐.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210327', '1', '假日', '辛丑', '二月十五', '2-15', '牛', '春分后', '六', 'Sat', '6', 'Saturday', '85', '12', '搬家.装修.开业.结婚.领证.开工.动土.安床.订婚.安葬.上梁.开张.作灶.求嗣.赴任.修造.祭祀.解除.开市.纳财.捕捉.嫁娶.纳采.移徙.盖屋.立券.竖柱.栽种.取渔', '入宅.祈福.纳畜.伐木.经络.斋醮.放水.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210328', '1', '假日', '辛丑', '二月十六', '2-16', '牛', '春分后', '日', 'Sun', '7', 'Sunday', '86', '12', '装修.结婚.领证.动土.出行.旅游.入学.求嗣.赴任.修造.祭祀.解除.纳财.裁衣.嫁娶.盖屋.立券.求医.竖柱.栽种.求财.招赘.纳婿.置产', '搬家.开业.入宅.开工.安床.订婚.安葬.上梁.交易.开张.破土.祈福.安香.开市.纳畜.启钻.纳采.移徙.伐木.斋醮.词讼.入殓.移柩.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210329', '0', '工作日', '辛丑', '二月十七', '2-17', '牛', '春分后', '一', 'Mon', '1', 'Monday', '87', '13', '结婚.入宅.领证.订婚.入学.求嗣.赴任.祈福.祭祀.解除.纳财.捕捉.除服.嫁娶.纳采.竖柱.栽种.斋醮.招赘.纳婿.和讼', '搬家.装修.开业.开工.动土.安床.出行.安葬.上梁.开张.旅游.修坟.破土.修造.开市.纳畜.启钻.移徙.伐木.盖屋.经络.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210330', '0', '工作日', '辛丑', '二月十八', '2-18', '牛', '春分后', '二', 'Tue', '2', 'Tuesday', '88', '13', '结婚.领证.订婚.上梁.入学.求嗣.祈福.祭祀.解除.纳畜.嫁娶.纳采.求医.竖柱.栽种.斋醮.招赘.纳婿', '搬家.装修.开业.入宅.开工.动土.安床.出行.安葬.开张.旅游.赴任.破土.修造.安香.开市.纳财.移徙.盖屋.立券.求财.分居.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210331', '0', '工作日', '辛丑', '二月十九', '2-19', '牛', '春分后', '三', 'Wed', '3', 'Wednesday', '89', '13', '装修.开业.开工.订婚.安葬.开张.修坟.赴任.破土.修造.祈福.祭祀.开市.纳财.启钻.纳采.经络.立券.塞穴.斋醮.筑堤.恩赦', '搬家.结婚.入宅.领证.动土.出行.旅游.解除.纳畜.嫁娶.移徙.盖屋.求医.竖柱.归宁.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210401', '0', '工作日', '辛丑', '二月二十', '2-20', '牛', '春分后', '四', 'Thu', '4', 'Thursday', '90', '13', '搬家.开业.结婚.入宅.领证.开工.安床.出行.开张.作灶.旅游.入学.修坟.赴任.开市.纳财.纳畜.嫁娶.移徙.冠笄.栽种.斋醮.求财.求人', '装修.动土.订婚.安葬.上梁.求嗣.破土.修造.祈福.祭祀.解除.启钻.纳采.竖柱.放水.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210402', '0', '工作日', '辛丑', '二月廿一', '2-21', '牛', '春分后', '五', 'Fri', '5', 'Friday', '91', '13', '搬家.装修.入宅.动土.出行.上梁.旅游.求嗣.赴任.修造.祈福.祭祀.解除.牧养.纳财.开光.移徙.求医.竖柱.栽种.斋醮.求财', '开业.结婚.领证.开工.安床.订婚.安葬.开张.破土.开市.纳畜.启钻.嫁娶.纳采.盖屋.冠笄.经络.立券.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210403', '1', '假日', '辛丑', '二月廿二', '2-22', '牛', '春分后', '六', 'Sat', '6', 'Saturday', '92', '13', '结婚.领证.安床.出行.订婚.安葬.上梁.作灶.旅游.求嗣.牧养.纳畜.裁衣.嫁娶.纳采.经络.立券.竖柱.栽种.斋醮.送礼', '搬家.装修.开业.入宅.开工.动土.开张.赴任.破土.修造.祈福.祭祀.开市.纳财.移徙.盖屋.求医.求财.放水.分居.开仓.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210404', '2', '节日', '辛丑', '二月廿三', '2-23', '牛', '清明', '日', 'Sun', '7', 'Sunday', '93', '13', '搬家.装修.开业.结婚.入宅.领证.开工.动土.出行.订婚.安葬.上梁.开张.旅游.求嗣.修坟.赴任.破土.修造.祈福.祭祀.解除.开市.纳财.纳畜.启钻.嫁娶.纳采.移徙.盖屋.竖柱.斋醮.词讼.行丧.打官司.平治道涂', '经络.掘井.栽种.放水.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210405', '1', '假日', '辛丑', '二月廿四', '2-24', '牛', '清明后', '一', 'Mon', '1', 'Monday', '94', '14', '搬家.开业.结婚.领证.开工.订婚.开张.入学.求嗣.修坟.赴任.祈福.祭祀.开市.纳财.纳畜.启钻.裁衣.嫁娶.纳采.移徙.盖屋.冠笄.栽种.斋醮.求财.藏宝', '装修.动土.安床.出行.安葬.上梁.旅游.破土.修造.求医.竖柱.词讼.行丧.针灸.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210406', '0', '工作日', '辛丑', '二月廿五', '2-25', '牛', '清明后', '二', 'Tue', '2', 'Tuesday', '95', '14', '装修.结婚.领证.动土.安床.订婚.作灶.求嗣.修坟.赴任.破土.修造.祈福.祭祀.解除.纳畜.启钻.捕捉.嫁娶.纳采.盖屋.求医.竖柱.栽种.求财.词讼.和讼.打官司', '搬家.开业.入宅.开工.出行.安葬.上梁.开张.旅游.安香.开市.纳财.移徙.立券.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210407', '0', '工作日', '辛丑', '二月廿六', '2-26', '牛', '清明后', '三', 'Wed', '3', 'Wednesday', '96', '14', '求嗣.修坟.赴任.破土.祭祀.解除.纳财.破屋.启钻.立券.求医.招赘.纳婿.服药', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.作灶.旅游.修造.祈福.开市.纳畜.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.栽种.造床.放水.分居.合帐.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210408', '0', '工作日', '辛丑', '二月廿七', '2-27', '牛', '清明后', '四', 'Thu', '4', 'Thursday', '97', '14', '装修.开业.结婚.领证.开工.动土.安床.出行.订婚.安葬.上梁.开张.旅游.求嗣.赴任.修造.祭祀.解除.开市.纳财.捕捉.嫁娶.纳采.盖屋.立券.竖柱.栽种.招赘.纳婿.取渔', '搬家.入宅.祈福.安香.纳畜.移徙.伐木.经络.斋醮.放水.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210409', '0', '工作日', '辛丑', '二月廿八', '2-28', '牛', '清明后', '五', 'Fri', '5', 'Friday', '98', '14', '搬家.装修.开业.结婚.入宅.领证.开工.动土.出行.订婚.开张.旅游.入学.求嗣.赴任.修造.祭祀.解除.开市.纳财.裁衣.嫁娶.纳采.移徙.立券.求医.竖柱.栽种.求财.招赘.纳婿.置产', '安床.安葬.上梁.破土.祈福.纳畜.启钻.伐木.盖屋.斋醮.词讼.入殓.移柩.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210410', '1', '假日', '辛丑', '二月廿九', '2-29', '牛', '清明后', '六', 'Sat', '6', 'Saturday', '99', '14', '搬家.结婚.入宅.领证.订婚.入学.赴任.祈福.祭祀.纳财.捕捉.嫁娶.纳采.移徙.栽种.斋醮.招赘.纳婿.和讼', '装修.开业.开工.动土.安床.出行.安葬.上梁.开张.旅游.修坟.破土.修造.开市.纳畜.启钻.伐木.盖屋.经络.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210411', '1', '假日', '辛丑', '二月三十', '2-30', '牛', '清明后', '日', 'Sun', '7', 'Sunday', '100', '14', '搬家.结婚.领证.订婚.作灶.入学.求嗣.祈福.祭祀.嫁娶.纳采.移徙.求医.栽种.斋醮.招赘.纳婿', '装修.开业.入宅.开工.动土.安床.出行.安葬.开张.旅游.破土.修造.开市.纳财.立券.求财.分居.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210412', '0', '工作日', '辛丑', '三月初一', '3-1', '牛', '清明后', '一', 'Mon', '1', 'Monday', '101', '15', '安床.出行.订婚.旅游.入学.求嗣.赴任.祈福.祭祀.解除.纳财.纳畜.启钻.除服.纳采.盖屋.立券.求医.竖柱.栽种.行丧.开仓.恩赦.和讼', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安葬.上梁.开张.破土.修造.开市.嫁娶.移徙.求财.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210413', '0', '工作日', '辛丑', '三月初二', '3-2', '牛', '清明后', '二', 'Tue', '2', 'Tuesday', '102', '15', '结婚.领证.订婚.赴任.祈福.祭祀.纳财.除服.嫁娶.纳采.求医.塞穴.求财.筑堤', '搬家.装修.开业.入宅.开工.动土.出行.安葬.开张.旅游.破土.修造.开市.纳畜.启钻.移徙.盖屋.经络.开池.立券.竖柱.针灸.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210414', '0', '工作日', '辛丑', '三月初三', '3-3', '牛', '清明后', '三', 'Wed', '3', 'Wednesday', '103', '15', '搬家.开业.结婚.领证.开工.出行.开张.作灶.旅游.入学.赴任.祭祀.开市.纳财.嫁娶.移徙.盖屋.冠笄.求人', '装修.入宅.动土.安床.订婚.安葬.上梁.求嗣.破土.修造.祈福.解除.纳畜.启钻.纳采.竖柱.斋醮.放水.行丧.置产.筑堤.出货.鸣鼓.设醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210415', '0', '工作日', '辛丑', '三月初四', '3-4', '牛', '清明后', '四', 'Thu', '4', 'Thursday', '104', '15', '装修.开业.开工.出行.开张.旅游.赴任.修造.祈福.祭祀.解除.开市.牧养.纳财.纳畜.开光.盖屋.经络.立券.求医.栽种.斋醮.求财', '搬家.结婚.入宅.领证.订婚.安葬.破土.安香.嫁娶.纳采.移徙.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210416', '0', '工作日', '辛丑', '三月初五', '3-5', '牛', '清明后', '五', 'Fri', '5', 'Friday', '105', '15', '出行.安葬.旅游.求嗣.修坟.解除.牧养.纳畜.启钻.裁衣.经络.栽种.词讼.打官司', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.订婚.上梁.开张.作灶.赴任.破土.修造.祈福.祭祀.开市.纳财.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.求财.放水.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210417', '1', '假日', '辛丑', '三月初六', '3-6', '牛', '清明后', '六', 'Sat', '6', 'Saturday', '106', '15', '装修.结婚.领证.动土.订婚.安葬.上梁.求嗣.修坟.赴任.破土.修造.祈福.祭祀.解除.纳财.启钻.嫁娶.纳采.竖柱.平治道涂', '搬家.入宅.安床.安香.纳畜.移徙.经络.掘井.栽种.造床.放水.分居.开仓.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210418', '1', '假日', '辛丑', '三月初七', '3-7', '牛', '清明后', '日', 'Sun', '7', 'Sunday', '107', '15', '搬家.结婚.领证.入学.求嗣.修坟.破土.祈福.祭祀.解除.纳财.纳畜.启钻.裁衣.嫁娶.移徙.冠笄.竖柱.斋醮.求财', '装修.开业.入宅.开工.动土.安床.出行.订婚.安葬.上梁.开张.旅游.赴任.修造.开市.纳采.盖屋.求医.栽种.词讼.置产.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210419', '0', '工作日', '辛丑', '三月初八', '3-8', '牛', '清明后', '一', 'Mon', '1', 'Monday', '108', '16', '结婚.领证.安床.订婚.安葬.作灶.求嗣.修坟.赴任.祈福.祭祀.解除.纳畜.启钻.捕捉.嫁娶.纳采.盖屋.栽种.斋醮.招赘.纳婿.藏宝', '搬家.装修.开业.入宅.开工.动土.出行.上梁.开张.旅游.破土.修造.开市.纳财.移徙.立券.竖柱.放水.分居.开仓.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210420', '0', '工作日', '辛丑', '三月初九', '3-9', '牛', '谷雨', '二', 'Tue', '2', 'Tuesday', '109', '16', '作灶.求嗣.赴任.祭祀.解除.破屋.求医.斋醮.招赘.词讼.纳婿.服药.和讼.打官司', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.旅游.修造.祈福.开市.纳财.纳畜.出火.嫁娶.纳采.移徙.盖屋.冠笄.经络.立券.竖柱.求财.放水.分居.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210421', '0', '工作日', '辛丑', '三月初十', '3-10', '牛', '谷雨后', '三', 'Wed', '3', 'Wednesday', '110', '16', '搬家.结婚.入宅.领证.订婚.赴任.祭祀.纳财.捕捉.嫁娶.纳采.移徙.立券.招赘.开仓.纳婿.取渔', '装修.动土.安床.安葬.上梁.破土.修造.祈福.解除.纳畜.伐木.求医.斋醮.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210422', '0', '工作日', '辛丑', '三月十一', '3-11', '牛', '谷雨后', '四', 'Thu', '4', 'Thursday', '111', '16', '搬家.装修.开业.开工.动土.订婚.安葬.开张.入学.求嗣.赴任.破土.修造.祭祀.解除.开市.纳财.启钻.裁衣.除服.纳采.移徙.盖屋.立券.求医.竖柱.栽种.求财.置产', '结婚.入宅.领证.安床.出行.上梁.旅游.祈福.纳畜.嫁娶.伐木.经络.斋醮.归宁.词讼.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210423', '0', '工作日', '辛丑', '三月十二', '3-12', '牛', '谷雨后', '五', 'Fri', '5', 'Friday', '112', '16', '搬家.结婚.领证.动土.入学.求嗣.赴任.纳财.捕捉.嫁娶.移徙.栽种.行丧', '装修.开业.入宅.开工.出行.订婚.安葬.开张.旅游.修坟.破土.修造.祈福.祭祀.开市.纳畜.启钻.纳采.盖屋.经络.放水.入殓.移柩.开仓.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210424', '1', '假日', '辛丑', '三月十三', '3-13', '牛', '谷雨后', '六', 'Sat', '6', 'Saturday', '113', '16', '结婚.领证.安床.出行.订婚.作灶.旅游.入学.求嗣.修坟.赴任.祈福.祭祀.纳财.启钻.除服.嫁娶.纳采.盖屋.立券.求医.栽种.招赘.行丧.开仓.纳婿.恩赦.和讼', '搬家.装修.开业.入宅.开工.动土.安门.安葬.开张.破土.修造.安香.开市.移徙.求财.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210425', '0', '工作日', '辛丑', '三月十四', '3-14', '牛', '谷雨后', '日', 'Sun', '7', 'Sunday', '114', '16', '装修.结婚.领证.订婚.修坟.赴任.修造.祈福.祭祀.纳财.除服.嫁娶.纳采.求医.塞穴.求财.筑堤', '搬家.开业.入宅.开工.动土.出行.安葬.开张.旅游.破土.开市.纳畜.启钻.移徙.盖屋.经络.开池.立券.竖柱.针灸.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210426', '0', '工作日', '辛丑', '三月十五', '3-15', '牛', '谷雨后', '一', 'Mon', '1', 'Monday', '115', '17', '出行.旅游.入学.祭祀.纳财.盖屋.冠笄.栽种.求人', '搬家.装修.结婚.入宅.领证.动土.安床.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.安香.纳畜.启钻.嫁娶.纳采.移徙.竖柱.斋醮.放水.行丧.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210427', '0', '工作日', '辛丑', '三月十六', '3-16', '牛', '谷雨后', '二', 'Tue', '2', 'Tuesday', '116', '17', '搬家.装修.开业.入宅.开工.动土.出行.安葬.上梁.开张.旅游.求嗣.赴任.修造.祈福.祭祀.解除.开市.牧养.纳财.纳畜.开光.移徙.盖屋.经络.立券.求医.竖柱.栽种.斋醮.求财', '结婚.领证.订婚.嫁娶.纳采.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210428', '0', '工作日', '辛丑', '三月十七', '3-17', '牛', '谷雨后', '三', 'Wed', '3', 'Wednesday', '117', '17', '结婚.领证.出行.旅游.求嗣.修坟.解除.牧养.纳畜.启钻.裁衣.嫁娶.经络.栽种.斋醮.词讼.打官司', '搬家.装修.开业.开工.动土.安门.订婚.安葬.上梁.开张.作灶.赴任.破土.修造.祈福.祭祀.开市.纳财.纳采.移徙.盖屋.冠笄.竖柱.求财.放水.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210429', '0', '工作日', '辛丑', '三月十八', '3-18', '牛', '谷雨后', '四', 'Thu', '4', 'Thursday', '118', '17', '搬家.装修.开业.结婚.领证.开工.动土.订婚.安葬.上梁.开张.作灶.求嗣.修坟.赴任.破土.修造.祈福.祭祀.解除.开市.纳财.启钻.嫁娶.纳采.移徙.竖柱.平治道涂', '入宅.安床.纳畜.经络.掘井.栽种.造床.放水.分居.开仓.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210430', '0', '工作日', '辛丑', '三月十九', '3-19', '牛', '谷雨后', '五', 'Fri', '5', 'Friday', '119', '17', '开业.结婚.入宅.领证.开工.订婚.安葬.上梁.开张.入学.求嗣.修坟.破土.祈福.祭祀.开市.纳财.启钻.裁衣.嫁娶.纳采.盖屋.冠笄.竖柱.求财', '装修.动土.安床.出行.旅游.赴任.修造.求医.栽种.词讼.置产.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210501', '2', '节日', '辛丑', '三月二十', '3-20', '牛', '谷雨后', '六', 'Sat', '6', 'Saturday', '120', '17', '结婚.领证.订婚.求嗣.修坟.赴任.祈福.祭祀.纳畜.启钻.捕捉.嫁娶.纳采.盖屋.栽种.斋醮.招赘.纳婿.藏宝', '搬家.装修.开业.入宅.开工.动土.出行.安葬.上梁.开张.旅游.破土.修造.开市.纳财.移徙.立券.竖柱.放水.分居.行丧.开仓.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210502', '1', '假日', '辛丑', '三月廿一', '3-21', '牛', '谷雨后', '日', 'Sun', '7', 'Sunday', '121', '17', '作灶.求嗣.赴任.祭祀.解除.破屋.求医.栽种.招赘.词讼.纳婿.服药.和讼.打官司', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.旅游.修造.祈福.开市.纳财.纳畜.嫁娶.纳采.移徙.盖屋.冠笄.立券.竖柱.斋醮.求财.放水.分居.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210503', '1', '假日', '辛丑', '三月廿二', '3-22', '牛', '谷雨后', '一', 'Mon', '1', 'Monday', '122', '18', '结婚.领证.出行.订婚.安葬.旅游.求嗣.祈福.祭祀.纳财.捕捉.嫁娶.纳采.立券.竖柱.栽种.斋醮.送礼.开仓.取渔', '搬家.装修.入宅.动土.安床.上梁.赴任.修造.解除.安香.纳畜.移徙.伐木.求医', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210504', '1', '假日', '辛丑', '三月廿三', '3-23', '牛', '谷雨后', '二', 'Tue', '2', 'Tuesday', '123', '18', '搬家.装修.结婚.领证.动土.订婚.安葬.作灶.入学.求嗣.赴任.破土.修造.祭祀.纳财.启钻.裁衣.除服.嫁娶.纳采.移徙.盖屋.立券.求医.竖柱.栽种.求财.置产', '开业.入宅.开工.安床.出行.上梁.交易.开张.旅游.祈福.开市.纳畜.伐木.经络.斋醮.归宁.词讼.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210505', '1', '假日', '辛丑', '三月廿四', '3-24', '牛', '立夏', '三', 'Wed', '3', 'Wednesday', '124', '18', '上梁.入学.求嗣.赴任.纳财.捕捉.竖柱.栽种.斋醮.行丧', '搬家.装修.开业.结婚.入宅.领证.开工.出行.订婚.安葬.开张.旅游.修坟.破土.修造.祈福.祭祀.安香.开市.纳畜.启钻.嫁娶.纳采.移徙.盖屋.经络.放水.入殓.移柩.开仓.造桥.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210506', '0', '工作日', '辛丑', '三月廿五', '3-25', '牛', '立夏后', '四', 'Thu', '4', 'Thursday', '125', '18', '安床.出行.订婚.旅游.入学.求嗣.赴任.祈福.祭祀.解除.纳财.纳畜.启钻.除服.纳采.盖屋.立券.求医.竖柱.栽种.招赘.行丧.开仓.纳婿.恩赦.和讼', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安葬.上梁.开张.破土.修造.开市.嫁娶.移徙.求财.针灸', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210507', '0', '工作日', '辛丑', '三月廿六', '3-26', '牛', '立夏后', '五', 'Fri', '5', 'Friday', '126', '18', '结婚.领证.订婚.上梁.求嗣.赴任.祈福.祭祀.解除.纳财.除服.嫁娶.纳采.求医.塞穴.栽种.求财.筑堤', '搬家.装修.开业.入宅.开工.动土.出行.安葬.开张.旅游.破土.修造.开市.纳畜.启钻.移徙.盖屋.经络.立券.竖柱.针灸.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210508', '0', '工作日', '辛丑', '三月廿七', '3-27', '牛', '立夏后', '六', 'Sat', '6', 'Saturday', '127', '18', '搬家.结婚.领证.出行.旅游.入学.祭祀.纳财.嫁娶.移徙.盖屋.冠笄.栽种.求人', '装修.入宅.动土.安床.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.纳畜.启钻.纳采.竖柱.斋醮.放水.行丧.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210509', '1', '假日', '辛丑', '三月廿八', '3-28', '牛', '立夏后', '日', 'Sun', '7', 'Sunday', '128', '18', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安床.出行.安葬.开张.作灶.旅游.求嗣.赴任.修造.祈福.祭祀.解除.开市.牧养.纳财.纳畜.开光.嫁娶.移徙.经络.立券.求医.竖柱.栽种.斋醮.求财', '订婚.上梁.纳采.盖屋.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210510', '0', '工作日', '辛丑', '三月廿九', '3-29', '牛', '立夏后', '一', 'Mon', '1', 'Monday', '129', '19', '出行.安葬.旅游.求嗣.解除.牧养.纳畜.裁衣.经络.栽种.词讼.打官司', '搬家.装修.开业.结婚.领证.开工.动土.安门.订婚.上梁.开张.作灶.赴任.破土.修造.祈福.祭祀.开市.纳财.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.求财.放水.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210511', '0', '工作日', '辛丑', '三月三十', '3-30', '牛', '立夏后', '二', 'Tue', '2', 'Tuesday', '130', '19', '搬家.装修.结婚.领证.动土.订婚.上梁.求嗣.赴任.修造.祈福.祭祀.解除.纳财.嫁娶.纳采.移徙.竖柱.平治道涂', '入宅.安床.安葬.破土.纳畜.经络.掘井.栽种.造床.放水.分居.行丧.开仓.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210512', '0', '工作日', '辛丑', '四月初一', '4-1', '牛', '立夏后', '三', 'Wed', '3', 'Wednesday', '131', '19', '开业.结婚.领证.开工.动土.订婚.开张.作灶.求嗣.修坟.赴任.祈福.祭祀.开市.纳财.纳畜.启钻.嫁娶.纳采.立券.平治道涂', '搬家.装修.入宅.安床.安葬.上梁.破土.修造.解除.安香.移徙.盖屋.冠笄.经络.掘井.求医.竖柱.栽种.造床.放水.行丧.开仓.造桥.针灸.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210513', '0', '工作日', '辛丑', '四月初二', '4-2', '牛', '立夏后', '四', 'Thu', '4', 'Thursday', '132', '19', '搬家.开业.结婚.领证.开工.订婚.安葬.上梁.开张.作灶.入学.求嗣.修坟.赴任.破土.祈福.祭祀.开市.纳财.裁衣.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.求财', '装修.入宅.动土.安床.出行.旅游.修造.求医.词讼.分居.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210514', '0', '工作日', '辛丑', '四月初三', '4-3', '牛', '立夏后', '五', 'Fri', '5', 'Friday', '133', '19', '结婚.领证.订婚.上梁.求嗣.祈福.祭祀.解除.捕捉.嫁娶.纳采.盖屋.求医.竖柱.栽种.词讼.和讼.打官司', '搬家.装修.开业.入宅.开工.动土.出行.开张.旅游.修造.安香.开市.纳财.移徙.立券.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210515', '1', '假日', '辛丑', '四月初四', '4-4', '牛', '立夏后', '六', 'Sat', '6', 'Saturday', '134', '19', '作灶.纳财.破屋.立券.求财.招赘.纳婿.藏宝.服药', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.开张.旅游.赴任.修造.祈福.祭祀.开市.纳畜.嫁娶.纳采.移徙.盖屋.冠笄.求医.竖柱.斋醮.放水.分居.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210516', '1', '假日', '辛丑', '四月初五', '4-5', '牛', '立夏后', '日', 'Sun', '7', 'Sunday', '135', '19', '装修.开业.结婚.领证.开工.动土.安床.出行.订婚.上梁.开张.旅游.求嗣.赴任.修造.祈福.祭祀.解除.开市.纳财.捕捉.嫁娶.纳采.立券.竖柱.栽种.斋醮.求财.招赘.纳婿.取渔', '搬家.入宅.安葬.作灶.破土.纳畜.移徙.伐木.分居.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210517', '0', '工作日', '辛丑', '四月初六', '4-6', '牛', '立夏后', '一', 'Mon', '1', 'Monday', '136', '20', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安床.订婚.安葬.上梁.开张.作灶.入学.求嗣.赴任.修造.祭祀.开市.纳财.纳畜.裁衣.嫁娶.纳采.移徙.盖屋.立券.求医.竖柱.栽种.求财.开仓.置产', '出行.旅游.祈福.斋醮.归宁.词讼.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210518', '0', '工作日', '辛丑', '四月初七', '4-7', '牛', '立夏后', '二', 'Tue', '2', 'Tuesday', '137', '20', '结婚.领证.订婚.作灶.入学.求嗣.赴任.祭祀.解除.纳财.捕捉.除服.嫁娶.纳采.竖柱.栽种', '搬家.装修.开业.入宅.开工.动土.安床.出行.安葬.上梁.开张.旅游.修坟.破土.修造.祈福.安香.开市.纳畜.启钻.出火.移徙.伐木.盖屋.经络.立券.斋醮.放水.分居.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210519', '0', '工作日', '辛丑', '四月初八', '4-8', '牛', '立夏后', '三', 'Wed', '3', 'Wednesday', '138', '20', '搬家.装修.结婚.领证.出行.旅游.入学.求嗣.赴任.修造.祈福.祭祀.解除.纳财.除服.嫁娶.移徙.立券.求医.栽种.斋醮.招赘.开仓.纳婿', '开业.开工.动土.安门.安床.订婚.安葬.上梁.开张.作灶.破土.开市.纳畜.启钻.纳采.伐木.盖屋.竖柱.求财.入殓.移柩', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210520', '0', '工作日', '辛丑', '四月初九', '4-9', '牛', '立夏后', '四', 'Thu', '4', 'Thursday', '139', '20', '装修.开业.开工.订婚.开张.求嗣.修造.祈福.祭祀.解除.开市.纳财.纳采.立券.求医.塞穴.栽种.斋醮.求财.筑堤.和讼', '搬家.结婚.入宅.领证.动土.出行.安葬.上梁.旅游.赴任.安香.纳畜.嫁娶.移徙.盖屋.竖柱.开仓.针灸.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210521', '0', '工作日', '辛丑', '四月初十', '4-10', '牛', '小满', '五', 'Fri', '5', 'Friday', '140', '20', '搬家.结婚.领证.出行.旅游.入学.祭祀.纳财.嫁娶.移徙.冠笄.栽种.求人.恩赦', '装修.动土.安床.订婚.安葬.上梁.求嗣.赴任.破土.修造.祈福.解除.纳畜.启钻.纳采.竖柱.放水.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210522', '1', '假日', '辛丑', '四月十一', '4-11', '牛', '小满后', '六', 'Sat', '6', 'Saturday', '141', '20', '搬家.装修.开业.结婚.入宅.领证.开工.安床.出行.开张.作灶.旅游.修坟.赴任.修造.祭祀.解除.开市.牧养.纳财.启钻.开光.嫁娶.移徙.求医.栽种.求财', '订婚.安葬.破土.祈福.纳采.斋醮.行丧', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210523', '1', '假日', '辛丑', '四月十二', '4-12', '牛', '小满后', '日', 'Sun', '7', 'Sunday', '142', '20', '结婚.领证.订婚.作灶.求嗣.修坟.牧养.启钻.裁衣.嫁娶.纳采.经络.开仓', '搬家.装修.开业.入宅.开工.动土.安床.出行.安葬.开张.旅游.赴任.破土.修造.祈福.祭祀.开市.纳财.移徙.盖屋.立券.栽种.求财.放水.分居.行丧.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210524', '0', '工作日', '辛丑', '四月十三', '4-13', '牛', '小满后', '一', 'Mon', '1', 'Monday', '143', '21', '开业.结婚.入宅.领证.开工.动土.订婚.安葬.开张.求嗣.修坟.赴任.破土.祈福.祭祀.开市.纳财.纳畜.启钻.嫁娶.纳采.立券.行丧.平治道涂', '装修.安床.上梁.修造.解除.盖屋.冠笄.经络.掘井.求医.竖柱.栽种.造床.放水.开仓.造桥.针灸.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210525', '0', '工作日', '辛丑', '四月十四', '4-14', '牛', '小满后', '二', 'Tue', '2', 'Tuesday', '144', '21', '开业.结婚.领证.开工.订婚.安葬.上梁.开张.入学.求嗣.修坟.破土.祈福.祭祀.开市.纳财.启钻.裁衣.嫁娶.纳采.盖屋.冠笄.竖柱.求财', '装修.入宅.动土.安床.出行.旅游.修造.求医.词讼.分居.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210526', '0', '工作日', '辛丑', '四月十五', '4-15', '牛', '小满后', '三', 'Wed', '3', 'Wednesday', '145', '21', '结婚.领证.订婚.上梁.求嗣.祈福.祭祀.解除.捕捉.嫁娶.纳采.盖屋.求医.竖柱.栽种.斋醮.招赘.词讼.纳婿.和讼.打官司', '搬家.装修.开业.入宅.开工.动土.出行.安葬.开张.旅游.破土.修造.开市.纳财.移徙.立券.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210527', '0', '工作日', '辛丑', '四月十六', '4-16', '牛', '小满后', '四', 'Thu', '4', 'Thursday', '146', '21', '开业.结婚.领证.开工.开张.作灶.开市.纳财.破屋.嫁娶.立券.斋醮.求财.招赘.纳婿.藏宝.服药', '搬家.装修.入宅.动土.安门.安床.出行.订婚.安葬.上梁.旅游.赴任.修造.祈福.祭祀.安香.纳畜.纳采.移徙.盖屋.冠笄.求医.竖柱.放水.分居.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210528', '0', '工作日', '辛丑', '四月十七', '4-17', '牛', '小满后', '五', 'Fri', '5', 'Friday', '147', '21', '装修.开业.结婚.入宅.领证.开工.动土.安床.出行.订婚.开张.作灶.旅游.求嗣.赴任.破土.修造.祈福.祭祀.解除.开市.纳财.启钻.捕捉.除服.嫁娶.纳采.立券.竖柱.栽种.求财.招赘.纳婿.取渔', '搬家.安葬.上梁.纳畜.移徙.伐木.分居.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210529', '1', '假日', '辛丑', '四月十八', '4-18', '牛', '小满后', '六', 'Sat', '6', 'Saturday', '148', '21', '装修.开业.开工.动土.安床.订婚.安葬.上梁.开张.入学.求嗣.赴任.修造.祭祀.解除.开市.纳财.纳畜.裁衣.纳采.盖屋.立券.求医.竖柱.栽种.求财.开仓.置产', '搬家.结婚.入宅.领证.出行.旅游.祈福.安香.嫁娶.移徙.斋醮.归宁.词讼.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210530', '1', '假日', '辛丑', '四月十九', '4-19', '牛', '小满后', '日', 'Sun', '7', 'Sunday', '149', '21', '搬家.结婚.领证.订婚.入学.求嗣.赴任.祭祀.解除.纳财.捕捉.嫁娶.纳采.移徙.竖柱.栽种', '装修.开业.入宅.开工.动土.安床.出行.安葬.上梁.开张.旅游.修坟.破土.修造.祈福.开市.纳畜.启钻.伐木.经络.立券.斋醮.放水.置产.筑堤.鸣鼓.设醮', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210531', '0', '工作日', '辛丑', '四月二十', '4-20', '牛', '小满后', '一', 'Mon', '1', 'Monday', '150', '22', '搬家.装修.结婚.领证.出行.旅游.入学.求嗣.修坟.赴任.修造.祈福.祭祀.解除.纳财.嫁娶.移徙.立券.求医.栽种.斋醮.招赘.开仓.纳婿', '开业.开工.动土.安门.安床.订婚.安葬.上梁.开张.作灶.破土.开市.纳畜.启钻.纳采.伐木.盖屋.竖柱.求财.放水.入殓.移柩.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210601', '0', '工作日', '辛丑', '四月廿一', '4-21', '牛', '小满后', '二', 'Tue', '2', 'Tuesday', '151', '22', '装修.开业.结婚.领证.开工.安床.订婚.上梁.开张.作灶.求嗣.赴任.修造.祈福.祭祀.解除.开市.纳财.嫁娶.纳采.立券.求医.塞穴.栽种.斋醮.求财.筑堤.和讼', '搬家.入宅.动土.出行.安葬.旅游.破土.纳畜.移徙.盖屋.竖柱.行丧.开仓.针灸.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210602', '0', '工作日', '辛丑', '四月廿二', '4-22', '牛', '小满后', '三', 'Wed', '3', 'Wednesday', '152', '22', '搬家.开业.结婚.入宅.领证.开工.安床.出行.开张.作灶.旅游.入学.赴任.祭祀.开市.纳财.嫁娶.移徙.冠笄.栽种.斋醮.求人.送礼.恩赦', '装修.动土.订婚.安葬.上梁.求嗣.破土.修造.祈福.解除.纳畜.启钻.纳采.竖柱.放水.置产.筑堤.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210603', '0', '工作日', '辛丑', '四月廿三', '4-23', '牛', '小满后', '四', 'Thu', '4', 'Thursday', '153', '22', '搬家.装修.入宅.出行.安葬.上梁.旅游.求嗣.修坟.赴任.破土.修造.祈福.祭祀.解除.牧养.纳财.纳畜.启钻.开光.移徙.求医.竖柱.栽种.斋醮.求财', '结婚.领证.订婚.嫁娶.纳采', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210604', '0', '工作日', '辛丑', '四月廿四', '4-24', '牛', '小满后', '五', 'Fri', '5', 'Friday', '154', '22', '订婚.上梁.求嗣.修坟.牧养.纳畜.启钻.裁衣.纳采.经络.竖柱.斋醮.开仓', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安床.出行.安葬.开张.旅游.赴任.破土.修造.祈福.祭祀.开市.纳财.嫁娶.移徙.盖屋.立券.栽种.求财.放水.分居.行丧.置产.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210605', '1', '假日', '辛丑', '四月廿五', '4-25', '牛', '芒种', '六', 'Sat', '6', 'Saturday', '155', '22', '开业.开工.动土.订婚.开张.求嗣.修坟.赴任.祈福.祭祀.开市.纳财.纳畜.启钻.纳采.立券.斋醮.招赘.行丧.纳婿.平治道涂', '搬家.装修.结婚.入宅.领证.安床.安葬.上梁.破土.修造.解除.安香.嫁娶.移徙.盖屋.冠笄.经络.掘井.求医.竖柱.栽种.造床.放水.开仓.造桥.针灸.筑堤', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210606', '1', '假日', '辛丑', '四月廿六', '4-26', '牛', '芒种后', '日', 'Sun', '7', 'Sunday', '156', '22', '搬家.开业.结婚.领证.开工.订婚.安葬.上梁.开张.作灶.入学.求嗣.修坟.破土.祈福.祭祀.开市.纳财.启钻.裁衣.嫁娶.纳采.移徙.盖屋.冠笄.竖柱.求财.招赘.纳婿', '装修.入宅.动土.安床.出行.旅游.修造.求医.词讼.分居.出师.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210607', '0', '工作日', '辛丑', '四月廿七', '4-27', '牛', '芒种后', '一', 'Mon', '1', 'Monday', '157', '23', '结婚.领证.安床.订婚.安葬.上梁.作灶.求嗣.赴任.祈福.祭祀.解除.纳畜.捕捉.嫁娶.纳采.盖屋.求医.竖柱.栽种.招赘.词讼.纳婿.和讼.打官司', '搬家.装修.开业.入宅.开工.动土.出行.开张.旅游.修造.安香.开市.纳财.移徙.立券.分居.开仓.出货', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210608', '0', '工作日', '辛丑', '四月廿八', '4-28', '牛', '芒种后', '二', 'Tue', '2', 'Tuesday', '158', '23', '作灶.求嗣.解除.纳财.破屋.立券.栽种.斋醮.求财.招赘.纳婿.藏宝.服药', '搬家.装修.开业.结婚.入宅.领证.开工.动土.安门.安床.出行.订婚.安葬.上梁.交易.开张.旅游.赴任.修造.祈福.祭祀.开市.纳畜.嫁娶.纳采.移徙.盖屋.冠笄.求医.竖柱.放水.分居.合帐.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210609', '0', '工作日', '辛丑', '四月廿九', '4-29', '牛', '芒种后', '三', 'Wed', '3', 'Wednesday', '159', '23', '搬家.装修.开业.结婚.领证.开工.动土.安床.出行.订婚.安葬.上梁.开张.旅游.求嗣.赴任.修造.祈福.祭祀.解除.开市.纳财.捕捉.嫁娶.纳采.移徙.立券.竖柱.栽种.求财.招赘.纳婿.取渔', '纳畜.伐木.分居.开仓', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210610', '0', '工作日', '辛丑', '五月初一', '5-1', '牛', '芒种后', '四', 'Thu', '4', 'Thursday', '160', '23', '装修.动土.安床.订婚.求嗣.赴任.修造.祈福.祭祀.解除.纳财.捕捉.纳采.竖柱.栽种.斋醮.招赘.纳婿.取渔.藏宝', '搬家.开业.结婚.领证.开工.安葬.上梁.开张.破土.开市.纳畜.启钻.嫁娶.移徙.伐木.经络.立券.开仓.置产', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210611', '0', '工作日', '辛丑', '五月初二', '5-2', '牛', '芒种后', '五', 'Fri', '5', 'Friday', '161', '23', '搬家.装修.开业.结婚.入宅.领证.开工.动土.订婚.安葬.开张.作灶.入学.求嗣.赴任.破土.修造.祭祀.开市.纳财.启钻.裁衣.除服.嫁娶.纳采.移徙.盖屋.立券.求医.竖柱.栽种.求财.行丧.置产', '安床.出行.上梁.旅游.祈福.纳畜.伐木.斋醮.归宁.词讼.分居.打官司', NULL, '0');
INSERT INTO `sys_calendar` VALUES ('20210612', '1', '假日', '辛丑', '五月初三', '5-3', '牛', '芒种后', '六', 'Sat', '6', 'Saturday', '162', '23', '搬家.结婚.领证.订婚.作灶.入学.求嗣.祈福.祭祀.捕捉.除服.嫁娶.纳采.移徙.栽种.斋醮.行丧.开仓', '装修.开业.入宅.开工.动土.安床.出行.安葬.上梁.开张.旅游.修坟.赴任.破土.修造.开市.纳财.纳畜.启钻.伐木.盖屋.经络.立券.求医.分居.造桥.针灸.筑堤', NULL, '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2020-11-05 11:03:44', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-11-05 11:03:44', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-11-05 11:03:44', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 0, '0', '亿创网安', 1, '马**', NULL, NULL, '0', '0', 'admin', '2020-11-11 15:34:54', 'admin', '2020-11-12 10:57:49');
INSERT INTO `sys_dept` VALUES (201, 200, '0,200', '商务售前部', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:55:39', 'admin', '2020-11-12 10:57:32');
INSERT INTO `sys_dept` VALUES (202, 200, '0,200', '人力行政部', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:57:06', 'admin', '2020-11-12 10:57:43');
INSERT INTO `sys_dept` VALUES (203, 200, '0,200', '财务部', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:57:15', 'admin', '2020-11-12 10:57:49');
INSERT INTO `sys_dept` VALUES (204, 200, '0,200', '研发部', 4, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:57:23', '', NULL);
INSERT INTO `sys_dept` VALUES (205, 201, '0,200,201', '售前部', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:58:05', '', NULL);
INSERT INTO `sys_dept` VALUES (206, 201, '0,200,201', '商务部', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:58:13', '', NULL);
INSERT INTO `sys_dept` VALUES (207, 204, '0,200,204', '研发一部', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:58:41', '', NULL);
INSERT INTO `sys_dept` VALUES (208, 204, '0,200,204', '研发二部', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:58:48', '', NULL);
INSERT INTO `sys_dept` VALUES (209, 204, '0,200,204', '研发三部', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:58:58', '', NULL);
INSERT INTO `sys_dept` VALUES (210, 208, '0,200,204,208', '研发二部兴业银行项目组', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:59:40', '', NULL);
INSERT INTO `sys_dept` VALUES (211, 208, '0,200,204,208', '研发二部长安信托项目组', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-12 10:59:53', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '工作日', '0', 'sys_calendar_type', NULL, NULL, 'N', '0', 'hulang', '2020-11-25 14:37:00', '', NULL, '0-工作日');
INSERT INTO `sys_dict_data` VALUES (101, 1, '假日', '1', 'sys_calendar_type', NULL, NULL, 'N', '0', 'hulang', '2020-11-25 14:37:13', '', NULL, '1-假日');
INSERT INTO `sys_dict_data` VALUES (102, 2, '节日', '2', 'sys_calendar_type', NULL, NULL, 'N', '0', 'hulang', '2020-11-25 14:37:24', '', NULL, '2-节日');
INSERT INTO `sys_dict_data` VALUES (103, 10, '同步', '10', 'sys_oper_type', NULL, NULL, 'N', '0', 'admin', '2020-11-25 20:23:54', '', NULL, '同步');
INSERT INTO `sys_dict_data` VALUES (104, 0, '居民身份证', '10', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 15:35:19', 'hulang', '2020-12-03 10:48:59', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '临时居民身份证', '11', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 15:35:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '户口薄', '12', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 15:35:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 3, '普通护照', '13', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 15:36:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 4, '外交护照', '14', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 15:36:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 5, '公务护照', '15', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 6, '公务普通护照', '16', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 7, '中国人民解放军军官证', '17', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 8, '中国人民解放军士兵证', '18', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 9, '人民警察证', '19', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 10, '港澳居民居住证', '1A', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 11, '台湾居民居住证', '1B', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 12, '港澳居民来往内地通行证', '1C', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 13, '台湾居民来往大陆通行证', '1D', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 14, '外国人永久居留身份证', '1E', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 15, '外国人居留或居留许可', '1F', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 16, '外国人临时居留证', '1G', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 17, '其他个人有效身份证件', '1Z', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 18, '组织机构代码', '21', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 19, '营业执照号(工商注册号)', '22', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 20, '社会信用代码', '23', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 21, '事业单位证书号', '24', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 22, '社会团体登记号', '25', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 23, '机关法人成立批文', '26', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 24, '登记信息', '31', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 25, '信托产品登记编码', '32', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 26, '业务许可证', '33', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 27, '法人登记证', '34', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 28, '备案证明', '35', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 29, '批文', '36', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 30, '确认函', '37', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 31, '其他', '99', 'partner_id_type', NULL, NULL, 'N', '0', 'hulang', '2020-12-01 19:14:42', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '日期类型', 'sys_calendar_type', '0', 'hulang', '2020-11-25 14:36:07', 'hulang', '2020-11-25 14:38:25', '日期类型列表');
INSERT INTO `sys_dict_type` VALUES (101, '证件类型', 'partner_id_type', '0', 'hulang', '2020-12-01 15:33:42', 'hulang', '2020-12-01 15:34:23', '证件类型');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-11-05 11:03:44', 'admin', '2020-11-12 13:48:26', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-11-05 11:03:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2020-11-12 13:47:15');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-11-12 13:47:30');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-11-12 13:47:45');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-11-12 13:48:00');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-11-12 13:48:15');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '系统默认（有参） 总共耗时：2毫秒', '0', '', '2020-11-20 13:36:31');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'执行一次\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-11-20 13:36:55');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 263 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-05 13:39:01');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-11 10:22:55');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-11 11:01:42');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-11 13:38:23');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-11 15:34:03');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-12 10:46:46');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-12 13:34:17');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-12 16:06:06');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-12 16:15:03');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-12 16:15:07');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-12 16:19:11');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-12 16:19:16');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-12 17:35:16');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-13 09:15:12');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-13 11:08:34');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-13 13:40:07');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-13 15:15:04');


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2020-11-05 11:03:44', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2020-11-05 11:03:44', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2020-11-05 11:03:44', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 5, 'http://ruoyi.vip', NULL, 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2020-11-05 11:03:44', 'admin', '2020-11-12 11:06:28', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2020-11-05 11:03:44', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2020-11-05 11:03:44', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2020-11-05 11:03:44', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2020-11-05 11:03:44', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2020-11-05 11:03:44', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2020-11-05 11:03:44', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2020-11-05 11:03:44', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 9, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2020-11-05 11:03:44', 'admin', '2020-11-25 14:50:16', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 10, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2020-11-05 11:03:44', 'admin', '2020-11-25 14:50:22', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2020-11-05 11:03:44', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2020-11-05 11:03:44', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2020-11-05 11:03:44', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2020-11-05 11:03:44', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2020-11-25 14:24:40', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2020-11-25 14:24:40', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2020-11-25 14:24:40', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2020-11-25 14:24:40', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2020-11-05 11:03:44', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2020-11-05 11:03:44', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '鸟不拉诗', 0, 6, 'https://niaobulashi.com/', NULL, 0, 0, 'M', '0', '0', '', 'star', 'admin', '2020-11-12 11:07:24', 'admin', '2020-11-12 11:07:47', '');
INSERT INTO `sys_menu` VALUES (2001, '考勤管理', 0, 4, 'attendance', NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2020-11-12 11:08:26', 'admin', '2020-11-12 11:11:28', '');
INSERT INTO `sys_menu` VALUES (2003, '日报管理', 2001, 1, 'daily', 'attendance/daily/index', 1, 0, 'C', '0', '0', 'attendance:daily:list', 'log', 'admin', '2020-11-12 14:28:37', 'admin', '2020-11-12 14:47:02', '日报管理菜单');
INSERT INTO `sys_menu` VALUES (2004, '日报管理查询', 2003, 1, '#', '', 1, 0, 'F', '0', '0', 'attendance:daily:query', '#', 'admin', '2020-11-12 14:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '日报管理新增', 2003, 2, '#', '', 1, 0, 'F', '0', '0', 'attendance:daily:add', '#', 'admin', '2020-11-12 14:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '日报管理修改', 2003, 3, '#', '', 1, 0, 'F', '0', '0', 'attendance:daily:edit', '#', 'admin', '2020-11-12 14:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '日报管理删除', 2003, 4, '#', '', 1, 0, 'F', '0', '0', 'attendance:daily:remove', '#', 'admin', '2020-11-12 14:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '日报管理导出', 2003, 5, '#', '', 1, 0, 'F', '0', '0', 'attendance:daily:export', '#', 'admin', '2020-11-12 14:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '工作日历', 1, 8, 'calendar', 'system/calendar/index', 1, 0, 'C', '0', '0', 'system:calendar:list', 'date', 'admin', '2020-11-25 14:46:41', 'admin', '2020-11-25 14:50:31', '工作日历菜单');
INSERT INTO `sys_menu` VALUES (2010, '工作日历查询', 2009, 1, '#', '', 1, 0, 'F', '0', '0', 'system:calendar:query', '#', 'admin', '2020-11-25 14:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '工作日历新增', 2009, 2, '#', '', 1, 0, 'F', '0', '0', 'system:calendar:add', '#', 'admin', '2020-11-25 14:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '工作日历修改', 2009, 3, '#', '', 1, 0, 'F', '0', '0', 'system:calendar:edit', '#', 'admin', '2020-11-25 14:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '工作日历删除', 2009, 4, '#', '', 1, 0, 'F', '0', '0', 'system:calendar:remove', '#', 'admin', '2020-11-25 14:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '工作日历导出', 2009, 5, '#', '', 1, 0, 'F', '0', '0', 'system:calendar:export', '#', 'admin', '2020-11-25 14:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '工作日同步日期', 2009, 6, '', NULL, 1, 0, 'F', '0', '0', 'system:calendar:syncDate', '#', 'admin', '2020-11-26 16:00:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '工作日历同步', 2009, 7, '', NULL, 1, 0, 'F', '0', '0', 'system:calendar:doSync', '#', 'admin', '2020-11-26 16:01:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '公告PDF导出', 107, 5, '', NULL, 1, 0, 'F', '0', '0', 'system:notice:exportPDF', '#', 'admin', '2020-12-16 11:33:58', '', NULL, '');
-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2020-11-05 11:03:44', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2020-11-05 11:03:44', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 421 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_config,sys_dept,sys_dict_data,sys_dict_type,sys_job,sys_job_log,sys_logininfor,sys_menu,sys_notice,sys_oper_log', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-05 14:01:42');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_post,sys_role,sys_role_dept,sys_role_menu,sys_user,sys_user_post,sys_user_role', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-05 14:01:49');
INSERT INTO `sys_oper_log` VALUES (102, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"亿创网安\",\"leader\":\"马建民\",\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"phone\":\"\",\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-11 15:34:54');
INSERT INTO `sys_oper_log` VALUES (103, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"开发部\",\"orderNum\":\"0\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:55:39');
INSERT INTO `sys_oper_log` VALUES (104, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"商务售前部\",\"deptId\":201,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"createTime\":1605149739000,\"updateBy\":\"admin\",\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:56:43');
INSERT INTO `sys_oper_log` VALUES (105, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"人力行政部\",\"orderNum\":\"1\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:57:06');
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"财务部\",\"orderNum\":\"2\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:57:15');
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"研发部\",\"orderNum\":\"4\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:57:23');
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"商务售前部\",\"deptId\":201,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"createTime\":1605149739000,\"updateBy\":\"admin\",\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:57:33');
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"人力行政部\",\"deptId\":202,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"createTime\":1605149826000,\"updateBy\":\"admin\",\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:57:43');
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"财务部\",\"deptId\":203,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"createTime\":1605149835000,\"updateBy\":\"admin\",\"ancestors\":\"0,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:57:49');
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"售前部\",\"orderNum\":\"1\",\"params\":{},\"parentId\":201,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200,201\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:58:05');
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"商务部\",\"orderNum\":\"2\",\"params\":{},\"parentId\":201,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200,201\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:58:13');
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"研发一部\",\"orderNum\":\"1\",\"params\":{},\"parentId\":204,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200,204\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:58:41');
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"研发二部\",\"orderNum\":\"2\",\"params\":{},\"parentId\":204,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200,204\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:58:48');
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"研发三部\",\"orderNum\":\"3\",\"params\":{},\"parentId\":204,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200,204\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:58:58');
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"研发二部兴业银行项目组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":208,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200,204,208\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:59:40');
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"研发二部长安信托项目组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":208,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,200,204,208\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 10:59:53');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15527916033\",\"admin\":false,\"password\":\"$2a$10$wvBMsUNZyajArCrCb2I6/.TXmXSf41uyFJcdkYuAhnZPtW41cYmXu\",\"postIds\":[2],\"email\":\"hulang6666@qq.com\",\"nickName\":\"hulang\",\"sex\":\"0\",\"deptId\":211,\"params\":{},\"userName\":\"hulang\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:01:45');
INSERT INTO `sys_oper_log` VALUES (119, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1604545424000,\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[200,204,208,211],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:02:37');
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"hladmin\",\"roleName\":\"管理端\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:03:32');
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1605150212000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"hladmin\",\"roleName\":\"管理员\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:04:01');
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15527916033\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"hulang6666@qq.com\",\"nickName\":\"hulang\",\"sex\":\"0\",\"deptId\":211,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发二部长安信托项目组\",\"deptId\":211,\"orderNum\":\"2\",\"params\":{},\"parentId\":208,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"hulang\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[100],\"createTime\":1605150104000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:04:12');
INSERT INTO `sys_oper_log` VALUES (123, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.clearCache()', 'DELETE', 1, 'admin', NULL, '/system/config/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:04:30');
INSERT INTO `sys_oper_log` VALUES (124, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.clearCache()', 'DELETE', 1, 'admin', NULL, '/system/config/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:04:36');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"5\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1604545424000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:06:28');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"star\",\"orderNum\":\"6\",\"menuName\":\"鸟不拉诗句\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://niaobulashi.com/\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:07:24');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"star\",\"orderNum\":\"6\",\"menuName\":\"鸟不拉诗\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://niaobulashi.com/\",\"children\":[],\"createTime\":1605150444000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:07:47');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"4\",\"menuName\":\"考勤管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"22\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:08:26');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"4\",\"menuName\":\"考勤管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"attendance\",\"children\":[],\"createTime\":1605150506000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:11:28');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1,2,3,4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '{tableIds=1,2,3,4,5,6,7,8,9,10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:18:51');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/11,12,13,14,15,16,17', '127.0.0.1', '内网IP', '{tableIds=11,12,13,14,15,16,17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:18:56');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_daily', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:19:06');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"niaobulashi\",\"columns\":[{\"usableColumn\":false,\"columnId\":173,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"dailyId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"日报ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1605151146000,\"tableId\":18,\"pk\":true,\"columnName\":\"daily_id\"},{\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户ID\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605151146000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dailyTime\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日报时间\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605151146000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"daily_time\"},{\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"daily\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"日报内容\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605151146000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":fa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:20:22');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":\"1\",\"menuName\":\"日报管理\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"2\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 11:23:58');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":\"1\",\"menuName\":\"日报管理\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"daily\",\"component\":\"attendance/daily/index\",\"children\":[],\"createTime\":1605151438000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"attendance:daily:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 13:34:51');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"niaobulashi\",\"columns\":[{\"usableColumn\":false,\"columnId\":173,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"dailyId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"日报ID\",\"updateTime\":1605151222000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1605151146000,\"tableId\":18,\"pk\":true,\"columnName\":\"daily_id\"},{\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户ID\",\"isQuery\":\"1\",\"updateTime\":1605151222000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605151146000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dailyTime\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日报时间\",\"isQuery\":\"1\",\"updateTime\":1605151222000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605151146000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"daily_time\"},{\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"daily\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"日报内容\",\"isQuery\":\"1\",\"updateTime\":1605151222000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"colum', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 13:36:00');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 13:36:11');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/19', '127.0.0.1', '内网IP', '{tableIds=19}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 13:36:30');
INSERT INTO `sys_oper_log` VALUES (139, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"系统默认（有参）\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0/15 * * * * ?\",\"jobId\":2,\"createBy\":\"admin\",\"nextValidTime\":1605160005000,\"createTime\":1604545424000,\"updateBy\":\"admin\",\"invokeTarget\":\"ryTask.ryParams(\'执行一次\')\",\"misfirePolicy\":\"3\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 13:46:33');
INSERT INTO `sys_oper_log` VALUES (140, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":2,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 13:46:39');
INSERT INTO `sys_oper_log` VALUES (141, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":2,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 13:48:26');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-12 14:05:45');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"日报管理\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"daily\",\"component\":\"attendance/daily/index\",\"children\":[],\"createTime\":1605162517000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"attendance:daily:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 14:47:02');
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"hladmin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15527916033\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"hulang6666@qq.com\",\"nickName\":\"胡浪\",\"sex\":\"0\",\"deptId\":211,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发二部长安信托项目组\",\"deptId\":211,\"orderNum\":\"2\",\"params\":{},\"parentId\":208,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"hulang\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[100],\"createTime\":1605150104000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 16:31:44');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2020-11-05 11:03:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2020-11-05 11:03:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2020-11-05 11:03:44', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2020-11-05 11:03:44', 'hulang', '2020-12-01 16:48:18', '普通角色');
INSERT INTO `sys_role` VALUES (100, '管理员', 'hladmin', 2, '1', 1, 1, '0', '0', 'admin', '2020-11-12 11:03:32', 'admin', '2020-11-27 14:38:39', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 200);
INSERT INTO `sys_role_dept` VALUES (2, 204);
INSERT INTO `sys_role_dept` VALUES (2, 208);
INSERT INTO `sys_role_dept` VALUES (2, 211);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 4);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-11-05 11:03:44', 'admin', '2020-11-05 11:03:44', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-11-05 11:03:44', 'admin', '2020-11-05 11:03:44', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 211, 'hulang', '胡浪', '00', 'hulang6666@qq.com', '15527916033', '0', '/profile/avatar/2020/11/13/31e5c5c8-c5e9-40bb-9430-8844f4da115e.jpeg', '$2a$10$wvBMsUNZyajArCrCb2I6/.TXmXSf41uyFJcdkYuAhnZPtW41cYmXu', '0', '0', '', NULL, 'admin', '2020-11-12 11:01:44', 'admin', '2020-11-12 16:31:44', NULL);
INSERT INTO `sys_user` VALUES (101, 211, 'zhangqi', '张琪', '00', '11111@qq.com', '15512345678', '0', '/profile/avatar/2020/11/13/3a63ca84-8d05-43b7-bfe6-40058d3f4055.jpeg', '$2a$10$RQncx1.zWbSkMPuw7A0m/eGvvU.34hUMjZ6PLLt7PL1Qmar3B7JF.', '0', '0', '', NULL, 'admin', '2020-11-13 15:11:26', 'admin', '2020-11-13 15:15:01', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 2);
INSERT INTO `sys_user_post` VALUES (101, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 2);

-- ----------------------------
-- Table structure for t_daily
-- ----------------------------
DROP TABLE IF EXISTS `t_daily`;
CREATE TABLE `t_daily`  (
  `daily_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日报ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `daily_time` datetime(0) NOT NULL COMMENT '日报时间',
  `daily` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日报内容',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识0-未删除1-已删除',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`daily_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_daily
-- ----------------------------
INSERT INTO `t_daily` VALUES (1, 100, '2020-11-11 00:00:00', '1、XXXXXXX 100%\n2、XXXXXX 70%\n3、XXXXXXX 70%\n4、XXXXXXXX 100%', '0', 'admin', '2020-10-15 15:39:34', 'admin', '2020-11-13 16:00:53', '');
INSERT INTO `t_daily` VALUES (2, 100, '2020-11-13 00:00:00', '1、XXXXXXX 100%\n2、XXXXXXX 20%\n3、XXXXXXX 100%\n4、XXXXXXX 100%\n5、XXXXXXX  30%', '0', 'admin', '2020-11-13 13:57:26', '', '2020-11-16 10:01:58', '666');

SET FOREIGN_KEY_CHECKS = 1;
