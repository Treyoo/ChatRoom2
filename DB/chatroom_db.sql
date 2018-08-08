/*
 Navicat MySQL Data Transfer

 Source Server         : myConn
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : chatroom_db

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 08/08/2018 09:28:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `touser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendtime` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fromuser_ref`(`fromuser`) USING BTREE,
  INDEX `touser_ref`(`touser`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '4', NULL, '2018-07-21 18:25:07', 'hh');
INSERT INTO `message` VALUES (2, '马灵儿', 'user1', '2018-07-21 18:26:16', '123');
INSERT INTO `message` VALUES (3, '马灵儿', 'user1', '2018-07-21 18:28:30', 'gou');
INSERT INTO `message` VALUES (4, 'az', '况天佑', '2018-07-21 18:39:18', 'oops');
INSERT INTO `message` VALUES (5, NULL, NULL, '2018-07-21 18:45:14', 'jjjj');
INSERT INTO `message` VALUES (7, 'user1', NULL, '2018-07-22 16:34:39', 'maye');
INSERT INTO `message` VALUES (8, 'cwj', NULL, '2018-07-22 19:52:33', '你好');
INSERT INTO `message` VALUES (9, '', 'user1', '2018-07-23 09:17:25', 'gua');
INSERT INTO `message` VALUES (10, 'cwj', 'user1', '2018-07-23 09:18:46', 'test');
INSERT INTO `message` VALUES (11, 'cwj', 'cwj', '2018-07-23 09:19:23', 'rr');
INSERT INTO `message` VALUES (12, '', 'user1', '2018-07-23 14:29:19', '<p>\n	h\n</p>\n<p>\n	h\n</p>\n<p>\n	h\n</p>\n<p>\n	ooo\n</p>');
INSERT INTO `message` VALUES (13, '', 'user1', '2018-07-23 15:25:43', '1111oooo');
INSERT INTO `message` VALUES (14, 'cwj', 'user1', '2018-07-23 16:30:43', '123');
INSERT INTO `message` VALUES (15, NULL, 'user1', '2018-07-23 16:34:56', 'mydate');
INSERT INTO `message` VALUES (16, 'cwj', 'user1', '2018-07-23 16:39:32', 'rua!');
INSERT INTO `message` VALUES (17, 'user1', 'user1', '2018-07-23 16:55:10', 'fafa');
INSERT INTO `message` VALUES (18, 'user1', '马小玲', '2018-07-31 12:32:35', 'sllll');
INSERT INTO `message` VALUES (19, 'user1', '况天佑', '2018-07-31 12:48:07', 'ces');
INSERT INTO `message` VALUES (20, 'user1', '马灵儿', '2018-08-02 10:10:31', 'hi');
INSERT INTO `message` VALUES (21, '况天佑', '马小玲', '2018-08-02 10:19:11', '巫婆领！');
INSERT INTO `message` VALUES (22, '况天佑', '王珍珍', '2018-08-02 10:54:06', '我系僵尸，怕不怕');
INSERT INTO `message` VALUES (23, '马小玲', '况天佑', '2018-08-02 10:57:34', '临兵斗者皆阵列在前，诛邪！');
INSERT INTO `message` VALUES (24, '况天佑', '马小玲', '2018-08-02 11:19:06', 'lueluelue');
INSERT INTO `message` VALUES (25, '马小玲', '况天佑', '2018-08-02 11:27:07', '死僵尸');
INSERT INTO `message` VALUES (26, '马小玲', '况天佑', '2018-08-02 11:28:19', '出来');
INSERT INTO `message` VALUES (27, '况天佑', '马小玲', '2018-08-02 11:29:57', '保重！');
INSERT INTO `message` VALUES (28, '马小玲', '况天佑', '2018-08-02 11:31:27', '别跑啊');
INSERT INTO `message` VALUES (29, '况天佑', '马小玲', '2018-08-02 22:56:48', '<img src=\"http://localhost:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/4.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/4.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/4.gif\" border=\"0\" alt=\"\" />');
INSERT INTO `message` VALUES (31, '王珍珍', '况天佑', '2018-08-02 23:02:16', '噫~好衰啊你');
INSERT INTO `message` VALUES (32, '况天佑', '王珍珍', '2018-08-02 23:03:00', '靓唔靓？');
INSERT INTO `message` VALUES (34, '况天佑', '王珍珍', '2018-08-02 23:32:17', '啦');
INSERT INTO `message` VALUES (35, '况天佑', '王珍珍', '2018-08-02 23:35:00', 'eee');
INSERT INTO `message` VALUES (36, '马小玲', '况天佑', '2018-08-03 11:29:12', '滚动条自动滚动？');
INSERT INTO `message` VALUES (37, '马小玲', '况天佑', '2018-08-03 11:29:44', '滚动条自动滚动测试2');
INSERT INTO `message` VALUES (38, '马小玲', '况天佑', '2018-08-03 11:39:27', '滚动条自动滚动测试3');
INSERT INTO `message` VALUES (39, '况天佑', '马小玲', '2018-08-03 12:00:46', 'laopo');
INSERT INTO `message` VALUES (40, '马灵儿', '马小玲', '2018-08-03 12:15:10', '小玲');
INSERT INTO `message` VALUES (41, '况天佑', '马灵儿', '2018-08-03 17:38:07', '<img src=\"http://192.168.123.135:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/92.gif\" border=\"0\" alt=\"\" />');
INSERT INTO `message` VALUES (43, '况天佑', '将臣', '2018-08-05 10:59:00', '<img src=\"http://localhost:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/35.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/18.gif\" border=\"0\" alt=\"\" />');
INSERT INTO `message` VALUES (44, '马小玲', '王珍珍', '2018-08-05 11:00:50', '索妹');
INSERT INTO `message` VALUES (45, '况天佑', '复生', '2018-08-05 11:57:35', '<img src=\"http://localhost:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />');
INSERT INTO `message` VALUES (46, '况天佑', 'cwj', '2018-08-05 12:25:11', 'emmm');
INSERT INTO `message` VALUES (47, '复生', '况天佑', '2018-08-05 14:18:42', '大佬佑');
INSERT INTO `message` VALUES (48, '复生', '王珍珍', '2018-08-05 14:20:04', '珍珍姐姐');
INSERT INTO `message` VALUES (49, '阿平', '王珍珍', '2018-08-05 14:48:08', '珍珍');
INSERT INTO `message` VALUES (50, '阿平', '况天佑', '2018-08-05 14:48:34', '天佑');
INSERT INTO `message` VALUES (51, '莱利', '况天佑', '2018-08-05 19:46:32', '大佬');
INSERT INTO `message` VALUES (52, '况天佑', '箭头', '2018-08-06 14:30:10', '前世');
INSERT INTO `message` VALUES (53, '况天佑', '何应求', '2018-08-06 14:33:40', '<span>求叔，有血吗？</span><br />');
INSERT INTO `message` VALUES (54, '况天佑', '山本一夫', '2018-08-06 14:34:18', '萝卜头！');
INSERT INTO `message` VALUES (55, '马灵儿', '况天佑', '2018-08-06 20:33:15', '好好珍惜');
INSERT INTO `message` VALUES (56, '马灵儿', '将臣', '2018-08-06 20:34:00', '你在哪里');
INSERT INTO `message` VALUES (57, '况天涯', '况天佑', '2018-08-06 22:31:41', '爸爸！');
INSERT INTO `message` VALUES (58, '况天涯', '况天佑', '2018-08-06 22:33:10', '我又荡失路啊<img src=\"http://192.168.123.135:8080/ChatRoom2/js/kindeditor/plugins/emoticons/images/9.gif\" border=\"0\" alt=\"\" />');
INSERT INTO `message` VALUES (59, '况天佑', '况天涯', '2018-08-06 22:35:40', '无事嘅，乖女');
INSERT INTO `message` VALUES (61, '况天佑', '王珍珍', '2018-08-07 20:40:23', '今天误删了源代码！');
INSERT INTO `message` VALUES (62, '王珍珍', '况天佑', '2018-08-07 21:01:55', '好可怜');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(10) UNSIGNED NULL DEFAULT NULL,
  `online` tinyint(1) NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_unique`(`username`) USING BTREE COMMENT '限制用户名唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'user1', '123', '女', 16, 0, '2018-08-05 16:34:20');
INSERT INTO `user` VALUES (5, 'cwj', '123', '男', NULL, 0, '2018-07-23 16:37:03');
INSERT INTO `user` VALUES (6, '马灵儿', '123', '女', 2025, 0, '2018-08-06 20:32:41');
INSERT INTO `user` VALUES (9, '复生', '123', '男', 8, 0, '2018-08-05 14:17:57');
INSERT INTO `user` VALUES (10, '况中棠', '123', '男', 2030, 0, '2018-07-24 10:20:45');
INSERT INTO `user` VALUES (11, '况天佑', '123', '男', 98, 0, '2018-08-07 22:22:25');
INSERT INTO `user` VALUES (12, '马小玲', '123', '女', 25, 0, '2018-08-07 12:12:47');
INSERT INTO `user` VALUES (13, '王珍珍', '123', '女', 25, 0, '2018-08-07 21:01:03');
INSERT INTO `user` VALUES (14, '山本一夫', '123', '男', 99, 1, '2018-07-24 10:24:28');
INSERT INTO `user` VALUES (15, '将臣', '123', '男', 99999999, 1, '2018-07-24 10:26:08');
INSERT INTO `user` VALUES (16, '箭头', '123', '男', 835, 1, '2018-07-24 10:27:10');
INSERT INTO `user` VALUES (17, '马丹娜', '123', '女', 146, 1, '2018-07-24 10:28:27');
INSERT INTO `user` VALUES (18, '马叮当', '123', '女', 37, 1, '2018-07-24 10:29:24');
INSERT INTO `user` VALUES (19, '马大龙', '123', '男', 48, 1, '2018-07-24 10:29:46');
INSERT INTO `user` VALUES (20, '何应求', '123', '男', 60, 1, '2018-07-24 10:30:36');
INSERT INTO `user` VALUES (21, '马小虎', '123', '男', 25, 1, '2018-07-24 10:31:15');
INSERT INTO `user` VALUES (22, '金未来', '123', '女', 26, 1, '2018-07-24 10:32:16');
INSERT INTO `user` VALUES (23, '金正中', '123', '男', 24, 1, '2018-07-24 10:32:41');
INSERT INTO `user` VALUES (24, 'Ken', '123', '男', 72, 1, '2018-07-24 10:33:21');
INSERT INTO `user` VALUES (25, 'Nick', '123', '男', 827, 1, '2018-07-24 10:33:52');
INSERT INTO `user` VALUES (26, '况天涯', '123', '女', 14, 0, '2018-08-06 22:31:07');
INSERT INTO `user` VALUES (27, '小青', '123', '女', 628, 1, '2018-07-24 10:35:43');
INSERT INTO `user` VALUES (28, '高保', '123', '男', 29, 1, '2018-07-24 10:36:16');
INSERT INTO `user` VALUES (29, '尼诺', '123', '男', 1, 1, '2018-07-24 10:37:22');
INSERT INTO `user` VALUES (30, '完颜无泪', '123', '女', 833, 1, '2018-07-24 10:38:13');
INSERT INTO `user` VALUES (31, '黑雨', '123', '女', 9999, 1, '2018-07-24 10:39:26');
INSERT INTO `user` VALUES (32, '白心媚', '123', '女', 9999, 1, '2018-07-24 10:40:26');
INSERT INTO `user` VALUES (33, '司徒奋仁', '123', '男', 30, 1, '2018-07-24 10:41:28');
INSERT INTO `user` VALUES (34, 'Peter', '123', '男', 32, 1, '2018-07-24 10:42:02');
INSERT INTO `user` VALUES (35, 'Alice', '123', '女', 8, 1, '2018-07-24 10:42:32');
INSERT INTO `user` VALUES (36, '完颜不破', '123', '男', 836, 1, '2018-07-24 10:43:19');
INSERT INTO `user` VALUES (37, '堂本真悟', '123', '男', 85, 1, '2018-07-24 10:46:01');
INSERT INTO `user` VALUES (38, '嘉嘉', '123', '女', 43, 0, '2018-08-05 11:02:43');
INSERT INTO `user` VALUES (46, 'az', '123', '女', 23, 0, '2018-08-05 16:31:28');
INSERT INTO `user` VALUES (47, '阿平', '123', '男', 35, 0, '2018-08-05 14:24:42');
INSERT INTO `user` VALUES (48, '莱利', '123', '男', 38, 0, '2018-08-05 19:45:28');

SET FOREIGN_KEY_CHECKS = 1;
