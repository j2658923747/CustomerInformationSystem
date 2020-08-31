/*
 Navicat Premium Data Transfer

 Source Server         : ac
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 27/07/2020 09:02:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (9, 'tj_city', '', NULL, NULL, 'TjCity', 'crud', 'com.ruoyi.system', 'system', 'city', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-07-22 16:11:54', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (57, '9', 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-07-22 16:11:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '9', 'city', '城市', 'varchar(255)', 'String', 'city', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-07-22 16:11:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '9', 'pv', '浏览量(PV)', 'int(255)', 'Long', 'pv', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-07-22 16:11:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '9', 'uv', '独立用户(UV)', 'int(255)', 'Long', 'uv', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-07-22 16:11:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, '9', 'vv', '访问次数(VV)', 'int(255)', 'Long', 'vv', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-07-22 16:11:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, '9', 'iv', '独立IP', 'int(255)', 'Long', 'iv', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-07-22 16:11:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, '9', 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-07-22 16:11:54', '', NULL);

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
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

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
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

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
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'PC2020071708551595810599707', 1595811593102, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1595810600000, -1, 5, 'PAUSED', 'CRON', 1595810599000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1595810610000, -1, 5, 'PAUSED', 'CRON', 1595810599000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1595810600000, -1, 5, 'PAUSED', 'CRON', 1595810599000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2020-07-23 16:55:09', '是否开启注册用户功能');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '公司', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-07-23 17:48:09', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'test', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '登录成功', '2020-07-20 13:57:24');
INSERT INTO `sys_logininfor` VALUES (2, 'test', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '退出成功', '2020-07-20 14:15:11');
INSERT INTO `sys_logininfor` VALUES (3, 'test', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '登录成功', '2020-07-20 14:15:16');
INSERT INTO `sys_logininfor` VALUES (4, 'test', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 14:15:48');
INSERT INTO `sys_logininfor` VALUES (5, 'test', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '登录成功', '2020-07-20 14:16:28');
INSERT INTO `sys_logininfor` VALUES (6, 'test', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '退出成功', '2020-07-20 14:18:24');
INSERT INTO `sys_logininfor` VALUES (7, 'test', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '登录成功', '2020-07-20 14:18:28');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 14:20:00');
INSERT INTO `sys_logininfor` VALUES (9, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 14:22:25');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '登录成功', '2020-07-20 15:01:44');
INSERT INTO `sys_logininfor` VALUES (11, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 15:11:50');
INSERT INTO `sys_logininfor` VALUES (12, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-20 15:18:22');
INSERT INTO `sys_logininfor` VALUES (13, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 15:18:27');
INSERT INTO `sys_logininfor` VALUES (14, 'test', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 7', '0', '登录成功', '2020-07-20 15:45:11');
INSERT INTO `sys_logininfor` VALUES (15, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 16:15:05');
INSERT INTO `sys_logininfor` VALUES (16, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 17:46:32');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 17:59:54');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-20 18:00:45');
INSERT INTO `sys_logininfor` VALUES (19, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-20 18:00:57');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 08:27:25');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 08:27:27');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '192.168.1.2', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-21 09:01:11');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '192.168.1.2', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-07-21 09:01:42');
INSERT INTO `sys_logininfor` VALUES (24, 'test', '192.168.1.2', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-21 09:01:52');
INSERT INTO `sys_logininfor` VALUES (25, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 09:02:19');
INSERT INTO `sys_logininfor` VALUES (26, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 09:02:26');
INSERT INTO `sys_logininfor` VALUES (27, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 09:02:50');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 09:25:15');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 09:25:17');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '113.127.182.94', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-07-21 10:35:11');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 10:54:20');
INSERT INTO `sys_logininfor` VALUES (32, 'test', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 11:10:33');
INSERT INTO `sys_logininfor` VALUES (33, 'test·', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '用户不存在/密码错误', '2020-07-21 11:35:40');
INSERT INTO `sys_logininfor` VALUES (34, 'tst·', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 11:35:46');
INSERT INTO `sys_logininfor` VALUES (35, 'trst·', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '用户不存在/密码错误', '2020-07-21 11:35:51');
INSERT INTO `sys_logininfor` VALUES (36, 'trst', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '用户不存在/密码错误', '2020-07-21 11:35:56');
INSERT INTO `sys_logininfor` VALUES (37, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 11:36:02');
INSERT INTO `sys_logininfor` VALUES (38, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 11:36:05');
INSERT INTO `sys_logininfor` VALUES (39, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 11:58:23');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 13:33:32');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-21 13:33:44');
INSERT INTO `sys_logininfor` VALUES (42, 'test', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 13:33:49');
INSERT INTO `sys_logininfor` VALUES (43, 'test', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-21 13:35:51');
INSERT INTO `sys_logininfor` VALUES (44, 'test', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 13:35:56');
INSERT INTO `sys_logininfor` VALUES (45, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 13:40:41');
INSERT INTO `sys_logininfor` VALUES (46, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '密码输入错误1次', '2020-07-21 13:40:43');
INSERT INTO `sys_logininfor` VALUES (47, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 13:40:48');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 13:44:42');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 14:26:04');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 14:30:28');
INSERT INTO `sys_logininfor` VALUES (51, 'test', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 14:46:01');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 15:23:10');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 15:23:12');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 15:23:14');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 17:18:31');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '192.168.1.5', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 17:18:32');
INSERT INTO `sys_logininfor` VALUES (57, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:33:45');
INSERT INTO `sys_logininfor` VALUES (58, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:33:48');
INSERT INTO `sys_logininfor` VALUES (59, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:33:56');
INSERT INTO `sys_logininfor` VALUES (60, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:33:59');
INSERT INTO `sys_logininfor` VALUES (61, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:34:07');
INSERT INTO `sys_logininfor` VALUES (62, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:34:12');
INSERT INTO `sys_logininfor` VALUES (63, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:34:16');
INSERT INTO `sys_logininfor` VALUES (64, 'test', '192.168.1.2', '内网IP', 'Internet Explorer 9', 'Windows 7', '1', '验证码错误', '2020-07-21 17:34:18');
INSERT INTO `sys_logininfor` VALUES (65, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 17:34:50');
INSERT INTO `sys_logininfor` VALUES (66, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 17:35:04');
INSERT INTO `sys_logininfor` VALUES (67, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 17:35:21');
INSERT INTO `sys_logininfor` VALUES (68, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-21 17:48:47');
INSERT INTO `sys_logininfor` VALUES (69, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 17:49:01');
INSERT INTO `sys_logininfor` VALUES (70, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-21 17:49:07');
INSERT INTO `sys_logininfor` VALUES (71, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 17:49:12');
INSERT INTO `sys_logininfor` VALUES (72, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 17:53:47');
INSERT INTO `sys_logininfor` VALUES (73, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 18:02:15');
INSERT INTO `sys_logininfor` VALUES (74, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-21 18:02:17');
INSERT INTO `sys_logininfor` VALUES (75, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-21 18:02:19');
INSERT INTO `sys_logininfor` VALUES (76, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 09:48:01');
INSERT INTO `sys_logininfor` VALUES (77, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 09:48:25');
INSERT INTO `sys_logininfor` VALUES (78, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 10:41:13');
INSERT INTO `sys_logininfor` VALUES (79, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 10:41:15');
INSERT INTO `sys_logininfor` VALUES (80, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 11:13:48');
INSERT INTO `sys_logininfor` VALUES (81, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 11:24:16');
INSERT INTO `sys_logininfor` VALUES (82, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 11:27:17');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 11:27:19');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-22 11:52:20');
INSERT INTO `sys_logininfor` VALUES (85, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 11:52:24');
INSERT INTO `sys_logininfor` VALUES (86, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-22 11:58:44');
INSERT INTO `sys_logininfor` VALUES (87, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 11:58:45');
INSERT INTO `sys_logininfor` VALUES (88, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 13:32:12');
INSERT INTO `sys_logininfor` VALUES (89, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 13:54:06');
INSERT INTO `sys_logininfor` VALUES (90, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 14:52:42');
INSERT INTO `sys_logininfor` VALUES (91, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 15:06:26');
INSERT INTO `sys_logininfor` VALUES (92, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 15:06:28');
INSERT INTO `sys_logininfor` VALUES (93, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 15:18:41');
INSERT INTO `sys_logininfor` VALUES (94, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 15:18:44');
INSERT INTO `sys_logininfor` VALUES (95, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 15:23:31');
INSERT INTO `sys_logininfor` VALUES (96, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 15:44:41');
INSERT INTO `sys_logininfor` VALUES (97, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 15:45:06');
INSERT INTO `sys_logininfor` VALUES (98, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 16:13:01');
INSERT INTO `sys_logininfor` VALUES (99, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 16:13:07');
INSERT INTO `sys_logininfor` VALUES (100, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 16:18:39');
INSERT INTO `sys_logininfor` VALUES (101, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 16:22:15');
INSERT INTO `sys_logininfor` VALUES (102, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 16:22:18');
INSERT INTO `sys_logininfor` VALUES (103, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 16:23:33');
INSERT INTO `sys_logininfor` VALUES (104, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 16:47:37');
INSERT INTO `sys_logininfor` VALUES (105, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 16:51:08');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 16:58:54');
INSERT INTO `sys_logininfor` VALUES (107, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 17:18:46');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 17:50:17');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 17:50:20');
INSERT INTO `sys_logininfor` VALUES (110, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 17:52:05');
INSERT INTO `sys_logininfor` VALUES (111, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-22 17:59:03');
INSERT INTO `sys_logininfor` VALUES (112, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-22 17:59:08');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-23 08:28:40');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 08:28:42');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 09:07:05');
INSERT INTO `sys_logininfor` VALUES (116, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 09:07:58');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 10:27:21');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 10:43:44');
INSERT INTO `sys_logininfor` VALUES (119, '11', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '注册成功', '2020-07-23 10:46:54');
INSERT INTO `sys_logininfor` VALUES (120, '11', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 10:47:06');
INSERT INTO `sys_logininfor` VALUES (121, '11', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 10:49:18');
INSERT INTO `sys_logininfor` VALUES (122, '12', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '注册成功', '2020-07-23 10:49:27');
INSERT INTO `sys_logininfor` VALUES (123, '12', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 10:49:32');
INSERT INTO `sys_logininfor` VALUES (124, '12', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 10:56:06');
INSERT INTO `sys_logininfor` VALUES (125, '13', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '注册成功', '2020-07-23 10:56:16');
INSERT INTO `sys_logininfor` VALUES (126, '15', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '用户不存在/密码错误', '2020-07-23 10:56:21');
INSERT INTO `sys_logininfor` VALUES (127, '14', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-23 10:56:24');
INSERT INTO `sys_logininfor` VALUES (128, '13', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 10:56:29');
INSERT INTO `sys_logininfor` VALUES (129, '13', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 11:05:48');
INSERT INTO `sys_logininfor` VALUES (130, '14', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '注册成功', '2020-07-23 11:05:56');
INSERT INTO `sys_logininfor` VALUES (131, '14', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 11:06:00');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 14:07:44');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 14:20:19');
INSERT INTO `sys_logininfor` VALUES (134, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 14:20:50');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 15:12:47');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 16:37:24');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 16:38:00');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 16:39:23');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 16:54:58');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 16:55:11');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:01:10');
INSERT INTO `sys_logininfor` VALUES (142, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:01:50');
INSERT INTO `sys_logininfor` VALUES (143, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 17:18:10');
INSERT INTO `sys_logininfor` VALUES (144, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:18:28');
INSERT INTO `sys_logininfor` VALUES (145, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:22:40');
INSERT INTO `sys_logininfor` VALUES (146, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-23 17:34:10');
INSERT INTO `sys_logininfor` VALUES (147, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:34:12');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 17:41:54');
INSERT INTO `sys_logininfor` VALUES (149, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:45:12');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:47:25');
INSERT INTO `sys_logininfor` VALUES (151, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 17:49:20');
INSERT INTO `sys_logininfor` VALUES (152, '山东兴昊塑胶有限公司', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '密码输入错误1次', '2020-07-23 17:49:26');
INSERT INTO `sys_logininfor` VALUES (153, '山东兴昊塑胶有限公司', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '验证码错误', '2020-07-23 17:49:29');
INSERT INTO `sys_logininfor` VALUES (154, '山东兴昊塑胶有限公司', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '密码输入错误2次', '2020-07-23 17:49:33');
INSERT INTO `sys_logininfor` VALUES (155, '山东兴昊塑胶有限公司', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '密码输入错误3次', '2020-07-23 17:49:52');
INSERT INTO `sys_logininfor` VALUES (156, '山东兴昊塑胶有限公司', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '1', '密码输入错误4次', '2020-07-23 17:50:00');
INSERT INTO `sys_logininfor` VALUES (157, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:50:36');
INSERT INTO `sys_logininfor` VALUES (158, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 17:51:23');
INSERT INTO `sys_logininfor` VALUES (159, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:51:28');
INSERT INTO `sys_logininfor` VALUES (160, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '退出成功', '2020-07-23 17:52:00');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:52:04');
INSERT INTO `sys_logininfor` VALUES (162, 'test', '192.168.1.2', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-23 17:55:27');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-07-27 08:43:28');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1089 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '', 'fa fa-location-arrow', 'admin', '2018-03-16 11:33:00', 'admin', '2020-07-17 15:27:14', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1063, '财务管理', 0, 5, '#', 'menuItem', 'M', '0', '', 'fa fa-server', 'admin', '2020-07-17 15:26:43', 'admin', '2020-07-20 15:23:27', '');
INSERT INTO `sys_menu` VALUES (1064, '财务信息', 1063, 2, '/finance/use', 'menuItem', 'C', '0', 'finance:use:view', 'fa fa-bullseye', 'admin', '2020-07-17 15:27:59', 'admin', '2020-07-20 15:24:50', '');
INSERT INTO `sys_menu` VALUES (1065, '财务流水', 1063, 1, '/system/invest', 'menuItem', 'C', '0', 'system:invest:view', 'fa fa-address-card-o', 'admin', '2020-07-18 14:24:09', 'admin', '2020-07-20 15:24:40', '');
INSERT INTO `sys_menu` VALUES (1066, '查询充值', 1065, 1, '#', 'menuItem', 'F', '0', 'system:invest:list', '#', 'admin', '2020-07-18 17:30:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '统计管理', 0, 6, '#', 'menuItem', 'M', '0', NULL, 'fa fa-calendar-o', 'admin', '2020-07-21 13:46:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '访问统计', 1067, 1, '/system/tencent', 'menuItem', 'C', '0', 'system:tencent:view', 'fa fa-at', 'admin', '2020-07-21 13:51:47', 'admin', '2020-07-22 16:27:43', '');
INSERT INTO `sys_menu` VALUES (1069, '查询访问', 1068, 1, '#', 'menuItem', 'F', '0', 'system:tencent:list', '#', 'admin', '2020-07-21 14:31:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '产品中心', 0, 7, '#', 'menuItem', 'M', '0', '', 'fa fa-bar-chart', 'admin', '2020-07-22 10:11:11', 'admin', '2020-07-22 10:14:14', '');
INSERT INTO `sys_menu` VALUES (1071, '百度爱采购(年制会员)', 1070, 1, '/product/one.html', 'menuItem', 'C', '0', '', 'fa fa-clone', 'admin', '2020-07-22 10:13:56', 'admin', '2020-07-22 11:43:46', '');
INSERT INTO `sys_menu` VALUES (1074, '百度爱采购(竞价)', 1070, 2, '/product/two.html', 'menuItem', 'C', '0', '', 'fa fa-clone', 'admin', '2020-07-22 11:45:24', 'admin', '2020-07-22 11:45:51', '');
INSERT INTO `sys_menu` VALUES (1075, '万词推广系统', 1070, 3, '/product/three.html', 'menuItem', 'C', '0', NULL, 'fa fa-clone', 'admin', '2020-07-22 11:45:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1076, '云发布软件', 1070, 4, '/product/four.html', 'menuItem', 'C', '0', NULL, 'fa fa-clone', 'admin', '2020-07-22 11:46:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '百度竞价', 1070, 5, '/product/five.html', 'menuItem', 'C', '0', '', 'fa fa-clone', 'admin', '2020-07-22 11:46:31', 'admin', '2020-07-23 17:58:19', '');
INSERT INTO `sys_menu` VALUES (1078, '易上云发布系统', 1070, 6, '/product/six.html', 'menuItem', 'C', '0', NULL, 'fa fa-clone', 'admin', '2020-07-22 11:46:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, '官网推', 1070, 7, '/product/seven.html', 'menuItem', 'C', '0', NULL, 'fa fa-clone', 'admin', '2020-07-22 11:47:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1080, '网站制作', 1070, 8, '/product/eight.html', 'menuItem', 'C', '0', NULL, 'fa fa-clone', 'admin', '2020-07-22 11:47:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '浏览器', 1067, 2, '/system/client', 'menuItem', 'C', '0', 'system:client:view', 'fa fa-bomb', 'admin', '2020-07-22 15:24:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '浏览器查询', 1081, 1, '#', 'menuItem', 'F', '0', 'system:client:list', '#', 'admin', '2020-07-22 15:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '操作系统', 1067, 3, '/system/os', 'menuItem', 'C', '0', 'system:os:view', 'fa fa-bolt', 'admin', '2020-07-22 15:25:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '操作系统列表', 1083, 1, '#', 'menuItem', 'F', '0', 'system:os:list', '#', 'admin', '2020-07-22 15:26:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '城市分布', 1067, 4, '/system/city', 'menuItem', 'C', '0', 'system:city:view', 'fa fa-bullhorn', 'admin', '2020-07-22 16:27:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, '城市列表', 1085, 1, '#', 'menuItem', 'F', '0', 'system:city:list', '#', 'admin', '2020-07-22 16:28:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '联系我们', 0, 8, '/chat.html', 'menuItem', 'C', '0', NULL, 'fa fa-user-plus', 'admin', '2020-07-23 10:27:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, '托管', 1070, 9, '/product/nine.html', 'menuItem', 'C', '1', '', 'fa fa-battery-0', 'admin', '2020-07-23 17:55:48', 'admin', '2020-07-23 17:55:56', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '测试', '2', '<p><img src=\"http://192.168.1.5/profile/upload/2020/07/22/b864c8c4-ecb3-44df-86fa-53d7de9c9cf0.jpg\" data-filename=\"/profile/upload/2020/07/22/b864c8c4-ecb3-44df-86fa-53d7de9c9cf0.jpg\" style=\"width: 1348px;\"></p>', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-07-22 17:08:42', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '<span style=\"background-color: rgb(107, 173, 222);\">维护内容&nbsp; 来了</span>', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-07-22 16:43:56', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"测试\" ],\r\n  \"deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:07:36');
INSERT INTO `sys_oper_log` VALUES (2, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'test', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"测试1\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"6\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:09:22');
INSERT INTO `sys_oper_log` VALUES (3, '在线用户', 7, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.batchForceLogout()', 'POST', 1, 'test', '研发部门', '/monitor/online/batchForceLogout', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"7e9df1b0-c6ca-4f02-9d20-c4f44a5b2744\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:10:30');
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1062', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:14:57');
INSERT INTO `sys_oper_log` VALUES (5, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"3,113,114,1057,1058,1059,1060,1061,115,4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:17:38');
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"财务流水\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-server\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:26:43');
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"若依官网\" ],\r\n  \"url\" : [ \"http://ruoyi.vip\" ],\r\n  \"target\" : [ \"menuBlank\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-location-arrow\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:27:14');
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"使用信息\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-asterisk\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:27:59');
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1064\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"使用信息\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-bullseye\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:28:17');
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1064\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"使用信息\" ],\r\n  \"url\" : [ \"/finance/use\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-bullseye\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:30:35');
INSERT INTO `sys_oper_log` VALUES (11, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1064\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:36:39');
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1064\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"使用信息\" ],\r\n  \"url\" : [ \"/finance/use\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"finance:use:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-bullseye\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-17 15:58:13');
INSERT INTO `sys_oper_log` VALUES (13, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zd_invest\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:02:52');
INSERT INTO `sys_oper_log` VALUES (14, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/zd_invest', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-18 14:03:16');
INSERT INTO `sys_oper_log` VALUES (15, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/zd_invest', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-18 14:18:58');
INSERT INTO `sys_oper_log` VALUES (16, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:19:10');
INSERT INTO `sys_oper_log` VALUES (17, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zd_invest\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:19:14');
INSERT INTO `sys_oper_log` VALUES (18, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zd_invest\" ]\r\n}', 'null', 0, NULL, '2020-07-18 14:19:27');
INSERT INTO `sys_oper_log` VALUES (19, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/zd_invest', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-18 14:20:05');
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"充值订单\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-address-card-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:24:09');
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1064\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"使用信息\" ],\r\n  \"url\" : [ \"/finance/use\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"finance:use:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-bullseye\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:24:16');
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1065\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"充值订单\" ],\r\n  \"url\" : [ \"/system/invest\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-address-card-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:24:38');
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1065\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"充值详情\" ],\r\n  \"url\" : [ \"/system/invest\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-address-card-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:26:04');
INSERT INTO `sys_oper_log` VALUES (24, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:39:32');
INSERT INTO `sys_oper_log` VALUES (25, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zd_invest\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 14:39:35');
INSERT INTO `sys_oper_log` VALUES (26, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/zd_invest', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-18 14:39:39');
INSERT INTO `sys_oper_log` VALUES (27, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 15:01:00');
INSERT INTO `sys_oper_log` VALUES (28, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zd_invest\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 15:01:03');
INSERT INTO `sys_oper_log` VALUES (29, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/zd_invest', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-18 15:01:05');
INSERT INTO `sys_oper_log` VALUES (30, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 15:04:31');
INSERT INTO `sys_oper_log` VALUES (31, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zd_invest\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 15:04:50');
INSERT INTO `sys_oper_log` VALUES (32, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/zd_invest', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-18 15:04:53');
INSERT INTO `sys_oper_log` VALUES (33, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 16:02:14');
INSERT INTO `sys_oper_log` VALUES (34, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 16:02:17');
INSERT INTO `sys_oper_log` VALUES (35, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3,4,5,6,7,8,9\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 16:02:25');
INSERT INTO `sys_oper_log` VALUES (36, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"12,13,14,15,16,17,18,19\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 16:55:02');
INSERT INTO `sys_oper_log` VALUES (37, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1,2,20,21,22,23,24,25,26,27\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 16:55:05');
INSERT INTO `sys_oper_log` VALUES (38, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"29,30,31,32,33,34,35,36\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 16:55:08');
INSERT INTO `sys_oper_log` VALUES (39, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"28,37,38,39\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 17:23:33');
INSERT INTO `sys_oper_log` VALUES (40, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1064\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"充值余额\" ],\r\n  \"url\" : [ \"/finance/use\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"finance:use:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-bullseye\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 17:23:46');
INSERT INTO `sys_oper_log` VALUES (41, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '39.70.30.246', 'XX XX', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1064\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 17:25:26');
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '39.70.30.246', 'XX XX', '{\r\n  \"menuId\" : [ \"1065\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"充值详情\" ],\r\n  \"url\" : [ \"/system/invest\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:invest:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-address-card-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 17:28:15');
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '39.70.30.246', 'XX XX', '{\r\n  \"parentId\" : [ \"1065\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"查询充值\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:invest:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 17:30:05');
INSERT INTO `sys_oper_log` VALUES (44, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '39.70.30.246', 'XX XX', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-18 17:30:46');
INSERT INTO `sys_oper_log` VALUES (45, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"43\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 08:31:56');
INSERT INTO `sys_oper_log` VALUES (46, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"44\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 08:44:34');
INSERT INTO `sys_oper_log` VALUES (47, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"48\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 09:21:16');
INSERT INTO `sys_oper_log` VALUES (48, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"49\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 09:21:25');
INSERT INTO `sys_oper_log` VALUES (49, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"53\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 09:24:35');
INSERT INTO `sys_oper_log` VALUES (50, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"42,50,52,59\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 09:38:56');
INSERT INTO `sys_oper_log` VALUES (51, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"54,55,56,57\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 09:39:07');
INSERT INTO `sys_oper_log` VALUES (52, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"58\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 09:39:12');
INSERT INTO `sys_oper_log` VALUES (53, '账户解锁', 0, 'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/unlock', '192.168.1.5', '内网IP', '{\r\n  \"loginName\" : [ \"admin\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 13:54:38');
INSERT INTO `sys_oper_log` VALUES (54, '账户解锁', 0, 'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/unlock', '192.168.1.5', '内网IP', '{\r\n  \"loginName\" : [ \"admin\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 13:54:46');
INSERT INTO `sys_oper_log` VALUES (55, '登陆日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/remove', '192.168.1.5', '内网IP', '{\r\n  \"ids\" : [ \"87\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 13:54:56');
INSERT INTO `sys_oper_log` VALUES (56, '登陆日志', 9, 'com.ruoyi.web.controller.monitor.SysLogininforController.clean()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/clean', '192.168.1.5', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 13:54:59');
INSERT INTO `sys_oper_log` VALUES (57, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '192.168.1.5', '内网IP', '{\r\n  \"ids\" : [ \"62\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 14:10:58');
INSERT INTO `sys_oper_log` VALUES (58, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '192.168.1.5', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 14:15:33');
INSERT INTO `sys_oper_log` VALUES (59, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"66\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:03:26');
INSERT INTO `sys_oper_log` VALUES (60, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"61,64\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:09:41');
INSERT INTO `sys_oper_log` VALUES (61, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"65\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:09:45');
INSERT INTO `sys_oper_log` VALUES (62, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '192.168.1.5', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"测试\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:14:44');
INSERT INTO `sys_oper_log` VALUES (63, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '192.168.1.5', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"测试\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:17:38');
INSERT INTO `sys_oper_log` VALUES (64, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.1.5', '内网IP', '{\r\n  \"menuId\" : [ \"1063\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"财务管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-server\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:23:27');
INSERT INTO `sys_oper_log` VALUES (65, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.1.5', '内网IP', '{\r\n  \"menuId\" : [ \"1065\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"财务流水\" ],\r\n  \"url\" : [ \"/system/invest\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:invest:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-address-card-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:24:40');
INSERT INTO `sys_oper_log` VALUES (66, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.1.5', '内网IP', '{\r\n  \"menuId\" : [ \"1064\" ],\r\n  \"parentId\" : [ \"1063\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"财务信息\" ],\r\n  \"url\" : [ \"/finance/use\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"finance:use:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-bullseye\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:24:50');
INSERT INTO `sys_oper_log` VALUES (67, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '192.168.1.5', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"测试\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:25:40');
INSERT INTO `sys_oper_log` VALUES (68, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '192.168.1.5', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"测试\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:30:31');
INSERT INTO `sys_oper_log` VALUES (69, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '192.168.1.5', '内网IP', '{\r\n  \"ids\" : [ \"70,72\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-20 15:51:36');
INSERT INTO `sys_oper_log` VALUES (70, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '192.168.1.5', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2020-07-20 16:06:51');
INSERT INTO `sys_oper_log` VALUES (71, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '192.168.1.5', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"测试\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"sid\" : [ \"1\" ],\r\n  \"seckey\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 10:57:07');
INSERT INTO `sys_oper_log` VALUES (72, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '192.168.1.5', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"测试\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"sid\" : [ \"500725047\" ],\r\n  \"seckey\" : [ \"0fc5cd00df01a5e17c4c8a3e8b4f87\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 10:57:35');
INSERT INTO `sys_oper_log` VALUES (73, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '192.168.1.5', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"统计管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"6\" ],\r\n  \"icon\" : [ \"fa fa-calendar-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 13:46:42');
INSERT INTO `sys_oper_log` VALUES (74, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '192.168.1.5', '内网IP', '{\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"访问结果\" ],\r\n  \"url\" : [ \"/pv/search\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 13:51:47');
INSERT INTO `sys_oper_log` VALUES (75, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.1.5', '内网IP', '{\r\n  \"menuId\" : [ \"1068\" ],\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"访问结果\" ],\r\n  \"url\" : [ \"/tencent/main\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 13:52:22');
INSERT INTO `sys_oper_log` VALUES (76, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '192.168.1.5', '内网IP', '{\r\n  \"ids\" : [ \"5\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 14:27:10');
INSERT INTO `sys_oper_log` VALUES (77, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '192.168.1.5', '内网IP', '{\r\n  \"tables\" : [ \"tj_tencent\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 14:27:14');
INSERT INTO `sys_oper_log` VALUES (78, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/tj_tencent', '192.168.1.5', '内网IP', '{ }', 'null', 0, NULL, '2020-07-21 14:27:17');
INSERT INTO `sys_oper_log` VALUES (79, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.1.5', '内网IP', '{\r\n  \"menuId\" : [ \"1068\" ],\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"访问结果\" ],\r\n  \"url\" : [ \"/system/tencent\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:tencent:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 14:29:56');
INSERT INTO `sys_oper_log` VALUES (80, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '192.168.1.5', '内网IP', '{\r\n  \"parentId\" : [ \"1068\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"查询访问\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:tencent:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 14:31:43');
INSERT INTO `sys_oper_log` VALUES (81, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.1.5', '内网IP', '{\r\n  \"menuId\" : [ \"1068\" ],\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"访问统计\" ],\r\n  \"url\" : [ \"/system/tencent\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:tencent:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 15:25:56');
INSERT INTO `sys_oper_log` VALUES (82, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '192.168.1.5', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 15:26:29');
INSERT INTO `sys_oper_log` VALUES (83, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'test', '研发部门', '/system/user/profile/updateAvatar', '192.168.1.2', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-21 17:48:21');
INSERT INTO `sys_oper_log` VALUES (84, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"产品中心\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"fa fa-server\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:11:11');
INSERT INTO `sys_oper_log` VALUES (85, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1070\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"产品中心\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:11:44');
INSERT INTO `sys_oper_log` VALUES (86, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1070\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"集客\" ],\r\n  \"url\" : [ \"/product\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:13:22');
INSERT INTO `sys_oper_log` VALUES (87, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1070\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"产品中心\" ],\r\n  \"url\" : [ \"/product\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:13:42');
INSERT INTO `sys_oper_log` VALUES (88, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"集客\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:13:57');
INSERT INTO `sys_oper_log` VALUES (89, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1070\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"产品中心\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:14:14');
INSERT INTO `sys_oper_log` VALUES (90, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1071\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"第一个产品\" ],\r\n  \"url\" : [ \"/product/one\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-window-minimize\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:14:52');
INSERT INTO `sys_oper_log` VALUES (91, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1072\" ],\r\n  \"parentId\" : [ \"1071\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"第一个产品\" ],\r\n  \"url\" : [ \"/product/one.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-window-minimize\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 10:42:40');
INSERT INTO `sys_oper_log` VALUES (92, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069,1070,1071,1072\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:23:17');
INSERT INTO `sys_oper_log` VALUES (93, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.ZdInvestController.remove()', 'POST', 1, 'admin', '研发部门', '/system/invest/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"75,76,77\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:27:30');
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1071\" ],\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"百度爱采购\" ],\r\n  \"url\" : [ \"/product/one.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:30:09');
INSERT INTO `sys_oper_log` VALUES (95, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1072', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-07-22 11:30:13');
INSERT INTO `sys_oper_log` VALUES (96, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1072\" ],\r\n  \"parentId\" : [ \"1071\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"第一个产品\" ],\r\n  \"url\" : [ \"/product/one.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-window-minimize\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:30:23');
INSERT INTO `sys_oper_log` VALUES (97, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1072', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-07-22 11:30:26');
INSERT INTO `sys_oper_log` VALUES (98, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1071', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"存在子菜单,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-07-22 11:30:36');
INSERT INTO `sys_oper_log` VALUES (99, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1072\" ],\r\n  \"parentId\" : [ \"1071\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"1\" ],\r\n  \"url\" : [ \"/product/one.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-window-minimize\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:30:50');
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1072', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-07-22 11:30:54');
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:31:34');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1072', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:31:39');
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069,1070,1071\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:31:53');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1071\" ],\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"百度爱采购(年制会员)\" ],\r\n  \"url\" : [ \"/product/one.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:43:46');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1071\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"百度爱采购(竞价)\" ],\r\n  \"url\" : [ \"/product/two.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:44:59');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1073', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:45:10');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"百度爱采购(竞价)\" ],\r\n  \"url\" : [ \"/product/two.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:45:24');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"万词推广系统\" ],\r\n  \"url\" : [ \"/product/three.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:45:43');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1074\" ],\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"百度爱采购(竞价)\" ],\r\n  \"url\" : [ \"/product/two.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:45:51');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"云发布软件\" ],\r\n  \"url\" : [ \"/product/four.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:46:10');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"优化\" ],\r\n  \"url\" : [ \"/product/five.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:46:31');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"易上云发布系统\" ],\r\n  \"url\" : [ \"/product/six.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"6\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:46:45');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"官网推\" ],\r\n  \"url\" : [ \"/product/seven.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:47:04');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"网站制作\" ],\r\n  \"url\" : [ \"/product/eight.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"8\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:47:25');
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069,1070,1071,1074,1075,1076,1077,1078,1079,1080\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 11:58:58');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"6\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 15:06:33');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tj_os,tj_client\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 15:06:38');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tj_os,tj_client\" ]\r\n}', 'null', 0, NULL, '2020-07-22 15:06:42');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tj_os,tj_client\" ]\r\n}', 'null', 0, NULL, '2020-07-22 15:06:42');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"浏览器\" ],\r\n  \"url\" : [ \"/system/client\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:client:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-bomb\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 15:24:38');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1081\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"浏览器查询\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:client:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 15:25:24');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"操作系统\" ],\r\n  \"url\" : [ \"/system/os\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:os:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-bolt\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 15:25:58');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1083\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"操作系统列表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:os:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 15:26:25');
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069,1081,1082,1070,1071,1074,1075,1076,1077,1078,1079,1080\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 15:47:51');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"8,7\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:11:51');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tj_city\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:11:54');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/tj_city', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-22 16:11:58');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/tj_city', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-07-22 16:11:58');
INSERT INTO `sys_oper_log` VALUES (129, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069,1081,1082,1083,1084,1070,1071,1074,1075,1076,1077,1078,1079,1080\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:14:21');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"城市分布\" ],\r\n  \"url\" : [ \"/system/city\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:city:view\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-bullhorn\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:27:34');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1068\" ],\r\n  \"parentId\" : [ \"1067\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"访问统计\" ],\r\n  \"url\" : [ \"/system/tencent\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:tencent:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-at\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:27:43');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1085\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"城市列表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:city:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:28:13');
INSERT INTO `sys_oper_log` VALUES (133, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"1\" ],\r\n  \"noticeTitle\" : [ \"温馨提醒：2018-07-01 若依新版本发布啦\" ],\r\n  \"noticeType\" : [ \"2\" ],\r\n  \"noticeContent\" : [ \"新版本内容\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:33:47');
INSERT INTO `sys_oper_log` VALUES (134, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\r\n  \"noticeTitle\" : [ \"是\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"<p>是</p>\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:38:32');
INSERT INTO `sys_oper_log` VALUES (135, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:38:42');
INSERT INTO `sys_oper_log` VALUES (136, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知：2018-07-01 若依系统凌晨维护\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"<span style=\\\"background-color: rgb(107, 173, 222);\\\">维护内容&nbsp; 来了</span>\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 16:43:56');
INSERT INTO `sys_oper_log` VALUES (137, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"1\" ],\r\n  \"noticeTitle\" : [ \"测试\" ],\r\n  \"noticeType\" : [ \"2\" ],\r\n  \"noticeContent\" : [ \"<p><img src=\\\"http://127.0.0.1/profile/upload/2020/07/22/b864c8c4-ecb3-44df-86fa-53d7de9c9cf0.jpg\\\" data-filename=\\\"/profile/upload/2020/07/22/b864c8c4-ecb3-44df-86fa-53d7de9c9cf0.jpg\\\" style=\\\"width: 1348px;\\\"></p>\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-22 17:08:42');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"联系我们\" ],\r\n  \"url\" : [ \"/chat.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"8\" ],\r\n  \"icon\" : [ \"fa fa-user-plus\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 10:27:50');
INSERT INTO `sys_oper_log` VALUES (139, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"4\" ],\r\n  \"configName\" : [ \"账号自助-是否开启用户注册功能\" ],\r\n  \"configKey\" : [ \"sys.account.registerUser\" ],\r\n  \"configValue\" : [ \"true\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"是否开启注册用户功能\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 10:44:03');
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1063,1065,1066,1064,1067,1068,1069,1081,1082,1083,1084,1085,1086,1070,1071,1074,1075,1076,1077,1078,1079,1080,1087\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 10:47:22');
INSERT INTO `sys_oper_log` VALUES (141, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"4\" ],\r\n  \"configName\" : [ \"账号自助-是否开启用户注册功能\" ],\r\n  \"configKey\" : [ \"sys.account.registerUser\" ],\r\n  \"configValue\" : [ \"false\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"是否开启注册用户功能\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 16:55:09');
INSERT INTO `sys_oper_log` VALUES (142, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'test', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"山东兴昊塑胶有限公司\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:46:27');
INSERT INTO `sys_oper_log` VALUES (143, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'test', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"山东兴昊塑胶有限公司\" ],\r\n  \"phonenumber\" : [ \"15315737002\" ],\r\n  \"email\" : [ \"123456789@QQ.COM\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:46:49');
INSERT INTO `sys_oper_log` VALUES (144, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'test', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"山东兴昊塑胶有限公司\" ],\r\n  \"phonenumber\" : [ \"15315737002\" ],\r\n  \"email\" : [ \"3460777387@qq.com\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:47:06');
INSERT INTO `sys_oper_log` VALUES (145, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"deptName\" : [ \"公司\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:48:09');
INSERT INTO `sys_oper_log` VALUES (146, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"山东兴昊塑胶有限公司\" ],\r\n  \"dept.deptName\" : [ \"公司\" ],\r\n  \"phonenumber\" : [ \"15315737002\" ],\r\n  \"email\" : [ \"3460777387@qq.com\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"sid\" : [ \"500725047\" ],\r\n  \"seckey\" : [ \"0fc5cd00df01a5e17c4c8a3e8b4f8700\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:48:56');
INSERT INTO `sys_oper_log` VALUES (147, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"7,6,5,4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:52:34');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"托管\" ],\r\n  \"url\" : [ \"/product/nine.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"9\" ],\r\n  \"icon\" : [ \"fa fa-battery-0\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:55:48');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1088\" ],\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"托管\" ],\r\n  \"url\" : [ \"/product/nine.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"9\" ],\r\n  \"icon\" : [ \"fa fa-battery-0\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:55:56');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1077\" ],\r\n  \"parentId\" : [ \"1070\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"百度竞价\" ],\r\n  \"url\" : [ \"/product/five.html\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-clone\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-07-23 17:58:19');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-07-23 10:47:22', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (2, 1066);
INSERT INTO `sys_role_menu` VALUES (2, 1067);
INSERT INTO `sys_role_menu` VALUES (2, 1068);
INSERT INTO `sys_role_menu` VALUES (2, 1069);
INSERT INTO `sys_role_menu` VALUES (2, 1070);
INSERT INTO `sys_role_menu` VALUES (2, 1071);
INSERT INTO `sys_role_menu` VALUES (2, 1074);
INSERT INTO `sys_role_menu` VALUES (2, 1075);
INSERT INTO `sys_role_menu` VALUES (2, 1076);
INSERT INTO `sys_role_menu` VALUES (2, 1077);
INSERT INTO `sys_role_menu` VALUES (2, 1078);
INSERT INTO `sys_role_menu` VALUES (2, 1079);
INSERT INTO `sys_role_menu` VALUES (2, 1080);
INSERT INTO `sys_role_menu` VALUES (2, 1081);
INSERT INTO `sys_role_menu` VALUES (2, 1082);
INSERT INTO `sys_role_menu` VALUES (2, 1083);
INSERT INTO `sys_role_menu` VALUES (2, 1084);
INSERT INTO `sys_role_menu` VALUES (2, 1085);
INSERT INTO `sys_role_menu` VALUES (2, 1086);
INSERT INTO `sys_role_menu` VALUES (2, 1087);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `money` double(255, 2) NULL DEFAULT 0.00 COMMENT '用户余额',
  `charg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扣费标志',
  `sid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计ID',
  `seckey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计key',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `un_charg`(`charg`) USING BTREE COMMENT '扣费标志不重复'
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-07-27 08:43:28', 'admin', '2018-03-16 11:33:00', 'ry', '2020-07-27 08:43:28', '管理员', 370.50, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员', 0.00, '123456789', NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 110, 'test', '山东兴昊塑胶有限公司', '00', '3460777387@qq.com', '15315737002', '0', '/profile/avatar/2020/07/21/af204d05-a1e7-4bed-99da-307a7ff74d40.png', 'fb30c1e4d955c206a6307de5a0a9636f', '7af9bd', '0', '0', '192.168.1.2', '2020-07-23 17:55:27', 'admin', '2020-05-17 15:07:36', 'admin', '2020-07-23 17:55:27', '测试员', 0.00, '123456780', '500725047', '0fc5cd00df01a5e17c4c8a3e8b4f8700');
INSERT INTO `sys_user` VALUES (4, NULL, '11', '', '01', '', '', '0', '', '094a49922569b3bdc78167922c08adea', '95dc77', '0', '2', '127.0.0.1', '2020-07-23 10:47:06', '', '2020-07-23 10:46:54', '', '2020-07-23 10:47:06', NULL, 0.00, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (5, NULL, '12', '', '01', '', '', '0', '', '048b6bd0f2d6fa4eafccda18290fd4a7', '7fbcf2', '0', '2', '127.0.0.1', '2020-07-23 10:49:32', '', '2020-07-23 10:49:27', '', '2020-07-23 10:49:32', NULL, 0.00, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (6, NULL, '13', '', '01', '', '', '0', '', '86b0db2fd55e98f466e5662e5f453574', '883dcd', '0', '2', '127.0.0.1', '2020-07-23 10:56:30', '', '2020-07-23 10:56:16', '', '2020-07-23 10:56:29', NULL, 0.00, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (7, NULL, '14', '', '01', '', '', '0', '', '92359dc278df5b1869b805c81fe1101f', 'ce87de', '0', '2', '127.0.0.1', '2020-07-23 11:06:01', '', '2020-07-23 11:05:56', '', '2020-07-23 11:06:00', NULL, 0.00, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('c59d4d8d-9183-42a3-981f-9fbaf9bf969b', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 7', 'on_line', '2020-07-27 08:43:22', '2020-07-27 08:59:24', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (7, 2);

-- ----------------------------
-- Table structure for tj_city
-- ----------------------------
DROP TABLE IF EXISTS `tj_city`;
CREATE TABLE `tj_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `pv` int(255) NULL DEFAULT NULL COMMENT '浏览量(PV)',
  `uv` int(255) NULL DEFAULT NULL COMMENT '独立用户(UV)',
  `vv` int(255) NULL DEFAULT NULL COMMENT '访问次数(VV)',
  `iv` int(255) NULL DEFAULT NULL COMMENT '独立IP',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tj_city
-- ----------------------------
INSERT INTO `tj_city` VALUES (3, '山东省', 297, 10, 37, 3, 3);

-- ----------------------------
-- Table structure for tj_client
-- ----------------------------
DROP TABLE IF EXISTS `tj_client`;
CREATE TABLE `tj_client`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端',
  `client_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端名称',
  `pv` int(255) NULL DEFAULT NULL COMMENT '浏览量(PV)',
  `uv` int(255) NULL DEFAULT NULL COMMENT '独立用户(UV)',
  `vv` int(255) NULL DEFAULT NULL COMMENT '访问次数(VV)',
  `iv` int(255) NULL DEFAULT NULL COMMENT '独立IP',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tj_client
-- ----------------------------
INSERT INTO `tj_client` VALUES (1, 'QQBrowser', 'QQ浏览器', 3, 2, 2, 2, 3);
INSERT INTO `tj_client` VALUES (2, 'Chrome', 'Chrome', 448, 13, 56, 3, 3);

-- ----------------------------
-- Table structure for tj_os
-- ----------------------------
DROP TABLE IF EXISTS `tj_os`;
CREATE TABLE `tj_os`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `os_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统名称',
  `pv` int(255) NULL DEFAULT NULL COMMENT '浏览量(PV)',
  `uv` int(255) NULL DEFAULT NULL COMMENT '独立用户(UV)',
  `vv` int(255) NULL DEFAULT NULL COMMENT '访问次数(VV)',
  `iv` int(255) NULL DEFAULT NULL COMMENT '独立IP',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tj_os
-- ----------------------------
INSERT INTO `tj_os` VALUES (1, 'Win7', 'Win7', 449, 14, 57, 3, 3);
INSERT INTO `tj_os` VALUES (2, 'Android', 'Android', 2, 1, 1, 1, 3);

-- ----------------------------
-- Table structure for tj_tencent
-- ----------------------------
DROP TABLE IF EXISTS `tj_tencent`;
CREATE TABLE `tj_tencent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `find_date` date NULL DEFAULT NULL COMMENT '时间',
  `pv` int(255) NULL DEFAULT NULL COMMENT '浏览量(PV)',
  `uv` int(255) NULL DEFAULT NULL COMMENT '独立用户(UV)',
  `vv` int(255) NULL DEFAULT NULL COMMENT '访问次数(VV)',
  `iv` int(255) NULL DEFAULT NULL COMMENT '独立IP',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tj_tencent
-- ----------------------------
INSERT INTO `tj_tencent` VALUES (1, '2020-07-21', 114, 6, 16, 2, 3);
INSERT INTO `tj_tencent` VALUES (3, '2020-07-22', 183, 4, 21, 1, 3);
INSERT INTO `tj_tencent` VALUES (4, '2020-07-23', 154, 5, 21, 1, 3);

-- ----------------------------
-- Table structure for zd_invest
-- ----------------------------
DROP TABLE IF EXISTS `zd_invest`;
CREATE TABLE `zd_invest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `total_amount` double(255, 2) NOT NULL COMMENT '充值金额',
  `alipay_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建订单时间',
  `succe_time` datetime(0) NULL DEFAULT NULL COMMENT '完成订单时间',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未支付' COMMENT '支付状态',
  `product_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值产品',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zd_invest
-- ----------------------------
INSERT INTO `zd_invest` VALUES (40, '19b-4009-80ca-49f3140f7802-b210c', 12.00, '2020071822001439390504960350', '2020-07-18 17:04:27', '2020-07-18 17:04:51', '已支付', NULL, NULL, 1);
INSERT INTO `zd_invest` VALUES (41, '20e-4eb1-8489-de45ab15d4a4-2813c', 50.00, '2020071822001439390504960351', '2020-07-18 17:21:49', '2020-07-18 17:22:12', '已支付', NULL, NULL, 1);
INSERT INTO `zd_invest` VALUES (45, 'bca-4cad-9f35-fbef520ac2d0-9b147', 50.00, '2020072022001439390504960635', '2020-07-20 08:44:43', '2020-07-20 08:45:02', '已支付', NULL, NULL, 1);
INSERT INTO `zd_invest` VALUES (46, 'd3c-4a96-b1d6-bbb2671ab0eb-f51d0', 50.00, '2020072022001439390504960749', '2020-07-20 08:50:27', '2020-07-20 08:50:44', '已支付', NULL, NULL, 1);
INSERT INTO `zd_invest` VALUES (47, '52b-4dd5-bd08-01e104a76438-c71be', 50.00, '2020072022001439390504960636', '2020-07-20 09:07:43', '2020-07-20 09:07:57', '已支付', NULL, NULL, 1);
INSERT INTO `zd_invest` VALUES (51, '135-40bb-9f28-6f4b2473710c-0012c', 110.00, '2020072022001439390504960491', '2020-07-20 09:21:50', '2020-07-20 09:22:26', '已支付', NULL, NULL, 1);
INSERT INTO `zd_invest` VALUES (60, 'e3b-42a0-8541-852ea1058e8b-02173', 1.50, '2020072022001439390504960751', '2020-07-20 09:39:27', '2020-07-20 09:39:43', '已支付', NULL, NULL, 1);
INSERT INTO `zd_invest` VALUES (63, '682-44ac-b30b-9c4147ff4046-6d387', 9.90, '2020072022001439390504960759', '2020-07-20 14:11:16', '2020-07-20 14:11:39', '已支付', NULL, NULL, 3);
INSERT INTO `zd_invest` VALUES (67, '6d3-4ba9-bf70-d5aa832aa7a9-c015a', 10.00, '2020072022001439390504960502', '2020-07-20 15:10:00', '2020-07-20 15:11:09', '已支付', '万词霸屏', '测试', 1);
INSERT INTO `zd_invest` VALUES (68, '6fd-4a3a-a530-ee67b52ddf3f-763c2', 10.00, '2020072022001439390504961060', '2020-07-20 15:16:49', '2020-07-20 15:17:09', '已支付', '万词霸屏', '测试充值', 3);
INSERT INTO `zd_invest` VALUES (69, 'a96-46ca-8d85-968c66eac2e0-5f3a8', 10.00, '2020072022001439390504961061', '2020-07-20 15:21:03', '2020-07-20 15:22:03', '已支付', 'AI分站', 'c', 3);
INSERT INTO `zd_invest` VALUES (71, '045-4a10-9e38-898434599d61-2d3dc', 10.00, '2020072022001439390504960503', '2020-07-20 15:26:52', '2020-07-20 15:27:12', '已支付', '闪速排', 's', 3);
INSERT INTO `zd_invest` VALUES (73, '447-4aa1-bca1-68475dbb12a7-7a3ec', 10.00, '2020072022001439390504960647', '2020-07-20 15:45:29', '2020-07-20 15:45:45', '已支付', '闪速排', '测试', 3);
INSERT INTO `zd_invest` VALUES (74, 'b3f-48a6-a675-c06ebeaf2bdd-f7115', 10.00, '2020072122001439390504961206', '2020-07-21 08:28:40', '2020-07-21 08:28:59', '已支付', '采购宝', '11', 1);
INSERT INTO `zd_invest` VALUES (78, 'fed-4bde-b2ff-3e0e6e99dfa3-78395', 5000.00, '2020072222001439390504962001', '2020-07-22 11:27:46', '2020-07-22 11:28:01', '已支付', '集客', '', 3);
INSERT INTO `zd_invest` VALUES (79, '64bac3f1-01cc-4bbd-978d-75c79761168d', -4000.00, NULL, '2020-07-22 11:28:25', '2020-07-22 11:28:25', '未支付', '第一个产品', '购买产品', 3);
INSERT INTO `zd_invest` VALUES (80, 'fef1d82c-135a-48ff-aab7-4a6a424f0fa7', -880.00, NULL, '2020-07-22 12:02:05', '2020-07-22 12:02:05', '已支付', '万词推广系统', '购买产品', 3);

SET FOREIGN_KEY_CHECKS = 1;
