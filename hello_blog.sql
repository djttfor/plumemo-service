/*
 Navicat Premium Data Transfer
 Date: 23/08/2021 18:17:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for plumemo_auth_token
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_auth_token`;
CREATE TABLE `plumemo_auth_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NOT NULL COMMENT '过期时间',
  `user_id` bigint(20) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_auth_user`;
CREATE TABLE `plumemo_auth_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `social_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社交账户ID',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名',
  `role_id` bigint(20) NOT NULL COMMENT '角色主键 1 普通用户 2 admin',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NOT NULL COMMENT '注册时间',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ak',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sk',
  `status` int(1) NULL DEFAULT 0 COMMENT '0 正常 1 锁定 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_email`(`email`) USING BTREE COMMENT '邮箱唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_auth_user_log
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_auth_user_log`;
CREATE TABLE `plumemo_auth_user_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记录用户id(游客取系统id：-1)',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ip地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求的url',
  `parameter` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需要记录的参数',
  `device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来自于哪个设备 eg 手机 型号 电脑浏览器',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `run_time` bigint(20) NOT NULL COMMENT '执行时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `browser_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器名称',
  `browser_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4499 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户行为日志记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_auth_user_social
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_auth_user_social`;
CREATE TABLE `plumemo_auth_user_social`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qq、csdn、wechat、weibo、email等',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社交内容',
  `show_type` smallint(6) NOT NULL COMMENT '展示类型( 1、显示图片，2、显示账号，3、跳转链接)',
  `remark` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `is_enabled` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否启用',
  `is_home` smallint(6) NULL DEFAULT 0 COMMENT '是否主页社交信息',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表社交信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_black_list
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_black_list`;
CREATE TABLE `plumemo_black_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ip_range` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip范围',
  `is_enable` int(1) NULL DEFAULT 0 COMMENT '是否启用 0 启用，1不启用',
  `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_user` datetime(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '黑名单拦截表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plumemo_category
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_category`;
CREATE TABLE `plumemo_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_category_tags
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_category_tags`;
CREATE TABLE `plumemo_category_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags_id` bigint(32) NOT NULL COMMENT '名称',
  `category_id` bigint(20) NOT NULL COMMENT '分类的主键',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_config
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_config`;
CREATE TABLE `plumemo_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置key',
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `type` smallint(6) NOT NULL DEFAULT 0 COMMENT '配置类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_99vo6d7ci4wlxruo3gd0q2jq8`(`config_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_friendship_link
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_friendship_link`;
CREATE TABLE `plumemo_friendship_link`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转的路径',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_menu
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_menu`;
CREATE TABLE `plumemo_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单Id',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'icon图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转路径',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_my_img
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_my_img`;
CREATE TABLE `plumemo_my_img`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `img_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `img_type` tinyint(1) NULL DEFAULT 0 COMMENT '0表示背景图片，1表示横幅图片',
  `upload_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plumemo_my_img
-- ----------------------------
INSERT INTO `plumemo_my_img` VALUES (61, 'https://img.djttfor.cn/api/blog/files/2a109261-e711-48cd-ba76-a38c58e61111.png', 'banner-1.png', 1, '2021-08-09 01:50:05');
INSERT INTO `plumemo_my_img` VALUES (62, 'https://img.djttfor.cn/api/blog/files/bb0d0f73-8cfa-4d16-a16c-08093d32a5ca.png', 'banner-2.png', 1, '2021-08-09 01:50:09');
INSERT INTO `plumemo_my_img` VALUES (64, 'https://img.djttfor.cn/api/blog/files/78a153ae-3c17-4523-b321-cd06c7ab94ba.png', 'banner-4.png', 1, '2021-08-09 01:50:15');
INSERT INTO `plumemo_my_img` VALUES (65, 'https://img.djttfor.cn/api/blog/files/d37cff2f-f8a4-4243-ac5b-de6e921cdaaf.png', 'list_01.png', 0, '2021-08-09 02:09:20');
INSERT INTO `plumemo_my_img` VALUES (66, 'https://img.djttfor.cn/api/blog/files/f4559e96-432c-414c-a83e-f48d4f108131.png', 'list_02.png', 0, '2021-08-09 02:09:25');
INSERT INTO `plumemo_my_img` VALUES (67, 'https://img.djttfor.cn/api/blog/files/1e1f4f49-f592-4321-a177-6f89349e3e55.png', 'list_03.png', 0, '2021-08-09 02:09:30');
INSERT INTO `plumemo_my_img` VALUES (68, 'https://img.djttfor.cn/api/blog/files/4250c60f-1cfb-4d7d-b113-6acaffdbdb79.png', 'list_04.png', 0, '2021-08-09 02:09:42');
INSERT INTO `plumemo_my_img` VALUES (69, 'https://img.djttfor.cn/api/blog/files/e58bc996-2d33-4d69-b6f3-b1ea8ee7a352.png', 'list_05.png', 0, '2021-08-09 02:09:45');
INSERT INTO `plumemo_my_img` VALUES (70, 'https://img.djttfor.cn/api/blog/files/fd018467-d87e-4375-a6bf-7bb88ac1211c.png', 'list_06.png', 0, '2021-08-09 02:10:01');
INSERT INTO `plumemo_my_img` VALUES (72, 'https://img.djttfor.cn/api/blog/files/c9aed606-6934-44e5-a54a-663689f4930b.png', 'list_07.png', 0, '2021-08-09 02:43:24');
INSERT INTO `plumemo_my_img` VALUES (73, 'https://img.djttfor.cn/api/blog/files/775e3421-0b57-413e-be97-6e8af22decc0.png', 'list_08.png', 0, '2021-08-09 02:43:37');
INSERT INTO `plumemo_my_img` VALUES (74, 'https://img.djttfor.cn/api/blog/files/61b5a790-46ff-4b76-8e4c-ce2ec99bbd46.png', 'list_09.png', 0, '2021-08-09 02:44:04');
INSERT INTO `plumemo_my_img` VALUES (75, 'https://img.djttfor.cn/api/blog/files/432961f6-b804-4724-99e2-4b16b224f4c6.png', 'list_10.png', 0, '2021-08-09 02:44:16');
INSERT INTO `plumemo_my_img` VALUES (76, 'https://img.djttfor.cn/api/blog/files/c1f37676-7dc9-408c-8e27-e6b221d4af1e.png', 'list_11.png', 0, '2021-08-09 02:44:27');
INSERT INTO `plumemo_my_img` VALUES (77, 'https://img.djttfor.cn/api/blog/files/9f56bde6-863a-42f8-a9c4-1e1f8e8c4489.png', 'list_12.png', 0, '2021-08-09 02:44:41');
INSERT INTO `plumemo_my_img` VALUES (78, 'https://img.djttfor.cn/api/blog/files/7a13e185-80dd-418f-8dbf-df917adf0113.png', 'list_13.png', 0, '2021-08-09 02:44:54');
INSERT INTO `plumemo_my_img` VALUES (79, 'https://img.djttfor.cn/api/blog/files/f661a5fb-4ac6-4faa-950c-3bc0486b856f.png', 'list_14.png', 0, '2021-08-09 02:45:01');
INSERT INTO `plumemo_my_img` VALUES (80, 'https://img.djttfor.cn/api/blog/files/86621f6c-f0e5-4ffb-8bf4-20e54c25ed97.png', 'yyy.png', 1, '2021-08-09 20:34:14');
INSERT INTO `plumemo_my_img` VALUES (91, 'https://img.djttfor.cn/api/blog/files/8ff3f056-c496-4596-acc1-92239e7741cb.png', 'qq.png', 2, '2021-08-12 01:25:38');
INSERT INTO `plumemo_my_img` VALUES (96, 'https://img.djttfor.cn/api/blog/files/886e2c25-9d33-49e6-9dd5-01588b21af7c.js', 'highlight.min.js', 3, '2021-08-12 02:34:14');
INSERT INTO `plumemo_my_img` VALUES (97, 'https://img.djttfor.cn/api/blog/files/b4bbcb92-5c1d-4302-ba23-85ffc9aba9bd.png', 'wechat.png', 2, '2021-08-12 02:34:51');
INSERT INTO `plumemo_my_img` VALUES (98, 'https://img.djttfor.cn/api/blog/files/e8146266-5d8b-4951-ad52-2c1cb5a1c471.png', 'wangyiyun.png', 2, '2021-08-12 02:34:57');
INSERT INTO `plumemo_my_img` VALUES (99, 'https://img.djttfor.cn/api/blog/files/449fa882-21f0-4966-834c-c016755a9ac7.png', 'sina.png', 2, '2021-08-12 02:35:05');
INSERT INTO `plumemo_my_img` VALUES (100, 'https://img.djttfor.cn/api/blog/files/45d84a48-d5ef-4e0c-8063-0e167db2aa6e.png', 'csdn.png', 2, '2021-08-12 02:35:09');
INSERT INTO `plumemo_my_img` VALUES (101, 'https://img.djttfor.cn/api/blog/files/6b1113db-f9d9-47fc-8907-575314ddb42d.png', 'zhihu.png', 2, '2021-08-12 02:35:14');
INSERT INTO `plumemo_my_img` VALUES (102, 'https://img.djttfor.cn/api/blog/files/dd6e2d57-d5c3-443d-83bc-c302cf216335.png', 'twitter.png', 2, '2021-08-12 02:35:20');
INSERT INTO `plumemo_my_img` VALUES (103, 'https://img.djttfor.cn/api/blog/files/94f30a4c-875d-4c0f-9aae-f52f3c0ad209.png', 'github.png', 2, '2021-08-12 02:35:30');
INSERT INTO `plumemo_my_img` VALUES (104, 'https://img.djttfor.cn/api/blog/files/5ae48abc-9924-4136-b43f-1d34bd7c617f.png', 'Facebook.png', 2, '2021-08-12 02:35:42');
INSERT INTO `plumemo_my_img` VALUES (105, 'https://img.djttfor.cn/api/blog/files/3d6778d2-932d-4399-9e3b-336502f29c1a.js', 'highlightjs-line-numbers.min.js', 3, '2021-08-16 11:54:34');
INSERT INTO `plumemo_my_img` VALUES (106, 'https://img.djttfor.cn/api/blog/files/61bf895b-76c0-4e10-b4e9-ab43a72fdcad.jpg', 'github.jpg', 2, '2021-08-16 19:36:24');
INSERT INTO `plumemo_my_img` VALUES (107, 'https://img.djttfor.cn/api/blog/files/00fd2cf1-2da9-4f66-84a7-b4890587c652.png', 'banner-3.png', 1, '2021-08-19 11:20:21');


-- ----------------------------
-- Table structure for plumemo_my_playlist
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_my_playlist`;
CREATE TABLE `plumemo_my_playlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌单名称',
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '从https://music.163.com/weapi/v6/playlist/detail?csrf_token=f5ab5453e8a45a3bcf47b7e08ccf8a6b下的tracks复制过来的',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '获取歌单的外链有限制，故出此下策' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plumemo_my_playlist
-- ----------------------------
INSERT INTO `plumemo_my_playlist` VALUES (1, 'ss', '[\r\n  {\r\n    \"name\": \"BROKEN ENGLISH\",\r\n    \"id\": 1303026364,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 21708,\r\n        \"name\": \"SCHAFT\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [],\r\n    \"pop\": 65,\r\n    \"st\": 0,\r\n    \"rt\": null,\r\n    \"fee\": 0,\r\n    \"v\": 3,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 72385750,\r\n      \"name\": \"ARCHIVES\",\r\n      \"picUrl\": \"http://p4.music.126.net/_WvmxjsaoQdbVjza-rKqDQ==/109951163496524721.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951163496524721\",\r\n      \"pic\": 109951163496524720\r\n    },\r\n    \"dt\": 393639,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 15746656,\r\n      \"vd\": -36600\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 9448011,\r\n      \"vd\": -34100\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 6298688,\r\n      \"vd\": -32600\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 7,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 0,\r\n    \"s_id\": 0,\r\n    \"mark\": 262144,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1453219200007\r\n  },\r\n  {\r\n    \"name\": \"Bad Apple!!\",\r\n    \"id\": 22645196,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 17423,\r\n        \"name\": \"のみこ\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      },\r\n      {\r\n        \"id\": 190901,\r\n        \"name\": \"Masayoshi Minoshima\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 30,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 2076221,\r\n      \"name\": \"Lovelight\",\r\n      \"picUrl\": \"http://p3.music.126.net/NpC1cmlGABqAXyG6x9nENg==/109951166027157822.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951166027157822\",\r\n      \"pic\": 109951166027157820\r\n    },\r\n    \"dt\": 319426,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 12780191,\r\n      \"vd\": -76484\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 7668132,\r\n      \"vd\": -73954\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 5112102,\r\n      \"vd\": -72277\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 2,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 262144,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 290067,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1179590400007\r\n  },\r\n  {\r\n    \"name\": \"ツキアカリのミチシルベ\",\r\n    \"id\": 818316,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 21314,\r\n        \"name\": \"ステレオポニー\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《DARKER THAN BLACK 流星之双子》第2-12集片头曲\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 43,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 81069,\r\n      \"name\": \"ツキアカリのミチシルベ\",\r\n      \"picUrl\": \"http://p3.music.126.net/D_eGz30z9c-yShS06Ua2pg==/2274889557918495.jpg\",\r\n      \"tns\": [],\r\n      \"pic\": 2274889557918495\r\n    },\r\n    \"dt\": 237906,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 9519063,\r\n      \"vd\": -37400\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 5711455,\r\n      \"vd\": -34900\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 3807651,\r\n      \"vd\": -33700\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 1,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255003136,\r\n    \"originCoverType\": 1,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1257264000000\r\n  },\r\n  {\r\n    \"name\": \"ツキアカリ\",\r\n    \"id\": 640324,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 17599,\r\n        \"name\": \"Rie fu\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《DARKER THAN BLACK -黑之契约者-》ED1\"\r\n    ],\r\n    \"pop\": 90,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 8,\r\n    \"v\": 19,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 61363,\r\n      \"name\": \"ツキアカリ\",\r\n      \"picUrl\": \"http://p4.music.126.net/c3oZWAhr4pQqsHsAVZJsxw==/109951165979568373.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951165979568373\",\r\n      \"pic\": 109951165979568370\r\n    },\r\n    \"dt\": 271464,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 10859668,\r\n      \"vd\": -49704\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 6515818,\r\n      \"vd\": -47095\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 4343893,\r\n      \"vd\": -45342\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 1,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255011328,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 5343052,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 7001,\r\n    \"publishTime\": 1179849600000\r\n  },\r\n  {\r\n    \"name\": \"BRE@TH//LESS\",\r\n    \"id\": 29307195,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 16823,\r\n        \"name\": \"小林未郁\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《ALDNOAH.ZERO》插曲\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": null,\r\n    \"fee\": 8,\r\n    \"v\": 45,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 3003031,\r\n      \"name\": \"アルドノア・ゼロ オリジナル・サウンドトラック\",\r\n      \"picUrl\": \"http://p3.music.126.net/dFHZ8zjTGY_6p-z1swc9lw==/109951166197961259.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951166197961259\",\r\n      \"pic\": 109951166197961260\r\n    },\r\n    \"dt\": 242050,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 9682068,\r\n      \"vd\": -58925\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 5809258,\r\n      \"vd\": -56416\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 3872853,\r\n      \"vd\": -54729\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 20,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 1,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255011328,\r\n    \"originCoverType\": 1,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 2706476,\r\n    \"publishTime\": 1410278400000\r\n  },\r\n  {\r\n    \"name\": \"天空巢穴领主：普雷·伊希斯 - isys 2phase boss\",\r\n    \"id\": 1345555861,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 31464841,\r\n        \"name\": \"Dungeon and Fighter\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [],\r\n    \"pop\": 80,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 11,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 75524110,\r\n      \"name\": \"Dungeon and Fighter Prey - Isis Raid BGM COLLECTION\",\r\n      \"picUrl\": \"http://p3.music.126.net/cfjCGGMo8A0YnsFrQJXVxw==/109951163857119578.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951163857119578\",\r\n      \"pic\": 109951163857119580\r\n    },\r\n    \"dt\": 241528,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 9662215,\r\n      \"vd\": -3\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 5797346,\r\n      \"vd\": -3\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 3864912,\r\n      \"vd\": -3\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"01\",\r\n    \"no\": 7,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 393216,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 0,\r\n    \"publishTime\": 1549555200000\r\n  },\r\n  {\r\n    \"name\": \"Hacking to the Gate\",\r\n    \"id\": 26584163,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 16277,\r\n        \"name\": \"いとうかなこ\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《命运石之门》片头曲:TVアニメ「Steins\",\r\n      \"Gate」OPテーマ\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 727,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 2529023,\r\n      \"name\": \"STEINS;GATE VOCAL BEST\",\r\n      \"picUrl\": \"http://p4.music.126.net/-VXSb2SetwRclgijQYN2ww==/4458519650641386.jpg\",\r\n      \"tns\": [],\r\n      \"pic\": 4458519650641386\r\n    },\r\n    \"dt\": 256000,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 10261045,\r\n      \"vd\": -45300\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 6156685,\r\n      \"vd\": -42900\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 4104506,\r\n      \"vd\": -41900\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 7,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255003136,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 5331712,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1372176000007\r\n  },\r\n  {\r\n    \"name\": \"勇侠青春讴\",\r\n    \"id\": 4952192,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 15995,\r\n        \"name\": \"ALI PROJECT\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"映画「コードギアス 反逆のルルーシュ」ed1テーマ\"\r\n    ],\r\n    \"pop\": 80,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 744,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 494681,\r\n      \"name\": \"CODE GEASS COMPLETE BEST (コードギアス コンプリートベスト)\",\r\n      \"picUrl\": \"http://p3.music.126.net/3jKBNsnjbg_tYTUM22JmGw==/6009930557660871.jpg\",\r\n      \"tns\": [],\r\n      \"pic\": 6009930557660871\r\n    },\r\n    \"dt\": 261920,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 10479325,\r\n      \"vd\": -40500\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 6287613,\r\n      \"vd\": -37900\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 4191756,\r\n      \"vd\": -36600\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 3,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 262144,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1231862400000\r\n  },\r\n  {\r\n    \"name\": \"シアワセネイロ\",\r\n    \"id\": 4952199,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 20880,\r\n        \"name\": \"ORANGE RANGE\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TVアニメ「コードギアス 反逆のルルーシュ R2」ED1テーマ\"\r\n    ],\r\n    \"pop\": 60,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 746,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 494681,\r\n      \"name\": \"CODE GEASS COMPLETE BEST (コードギアス コンプリートベスト)\",\r\n      \"picUrl\": \"http://p4.music.126.net/3jKBNsnjbg_tYTUM22JmGw==/6009930557660871.jpg\",\r\n      \"tns\": [],\r\n      \"pic\": 6009930557660871\r\n    },\r\n    \"dt\": 258680,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 10349758,\r\n      \"vd\": -27700\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 6209872,\r\n      \"vd\": -25100\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 4139929,\r\n      \"vd\": -23699\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 10,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255003136,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1231862400000\r\n  },\r\n  {\r\n    \"name\": \"only my railgun\",\r\n    \"id\": 725692,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 19395,\r\n        \"name\": \"fripSide\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《某科学的超电磁炮》OP1\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 1,\r\n    \"v\": 122,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 71074,\r\n      \"name\": \"only my railgun\",\r\n      \"picUrl\": \"http://p4.music.126.net/39FnBt_Wtfu0mIcagSK8ew==/109951164211039258.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951164211039258\",\r\n      \"pic\": 109951164211039260\r\n    },\r\n    \"dt\": 257093,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 10286019,\r\n      \"vd\": -62199\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 6171629,\r\n      \"vd\": -59699\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 4114434,\r\n      \"vd\": -58500\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 1,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 0,\r\n    \"s_id\": 0,\r\n    \"mark\": 270336,\r\n    \"originCoverType\": 1,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 1397820,\r\n    \"publishTime\": 1257292800000\r\n  },\r\n  {\r\n    \"name\": \"Dear My Friend -まだ見ぬ未来へ-\",\r\n    \"id\": 1308782110,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 16271,\r\n        \"name\": \"ELISA\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《某科学的超电磁炮》片尾曲1\"\r\n    ],\r\n    \"pop\": 90,\r\n    \"st\": 0,\r\n    \"rt\": null,\r\n    \"fee\": 0,\r\n    \"v\": 9,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 72797925,\r\n      \"name\": \"DIAMOND MEMORIES ～All Time Best of ELISA～\",\r\n      \"picUrl\": \"http://p4.music.126.net/Y3ie63Q1w-n1pa4le2p5Nw==/109951163544475885.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951163544475885\",\r\n      \"pic\": 109951163544475890\r\n    },\r\n    \"dt\": 247248,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 9891048,\r\n      \"vd\": -27900\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 5934646,\r\n      \"vd\": -25400\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 3956445,\r\n      \"vd\": -23900\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 5,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 0,\r\n    \"s_id\": 0,\r\n    \"mark\": 262144,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1535472000007\r\n  },\r\n  {\r\n    \"name\": \"Awake\",\r\n    \"id\": 26319684,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 14056,\r\n        \"name\": \"岩崎琢\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"《JOJO的奇妙冒险 第二部 战斗潮流》柱之男处刑曲\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 29,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 2450674,\r\n      \"name\": \"ジョジョの奇妙な冒険 O.S.T Battle Tendency [Leicht Verwendbar]\",\r\n      \"picUrl\": \"http://p3.music.126.net/uKijq1u6rABUe5BgWL73Ew==/109951164137343183.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951164137343183\",\r\n      \"pic\": 109951164137343180\r\n    },\r\n    \"dt\": 201000,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 8067937,\r\n      \"vd\": -17000\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 4840874,\r\n      \"vd\": -14700\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 3227342,\r\n      \"vd\": -13800\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 23,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 262144,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1366905600000\r\n  },\r\n  {\r\n    \"name\": \"月光\",\r\n    \"id\": 414118124,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 161457,\r\n        \"name\": \"宮脇詩音\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《暗杀教室2》 第16话插曲\"\r\n    ],\r\n    \"pop\": 65,\r\n    \"st\": 0,\r\n    \"rt\": null,\r\n    \"fee\": 8,\r\n    \"v\": 20,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 34700564,\r\n      \"name\": \"バイバイ YESTERDAY\",\r\n      \"picUrl\": \"http://p3.music.126.net/YbC0ZqzLSankS-4h50lTpQ==/18552059697278764.jpg\",\r\n      \"tns\": [\r\n        \"Bye Bye Yesterday\"\r\n      ],\r\n      \"pic_str\": \"18552059697278764\",\r\n      \"pic\": 18552059697278764\r\n    },\r\n    \"dt\": 293593,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 11744697,\r\n      \"vd\": -26900\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 7046835,\r\n      \"vd\": -24300\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 4697905,\r\n      \"vd\": -22500\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 2,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 270464,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 457010,\r\n    \"publishTime\": 1464105600000\r\n  },\r\n  {\r\n    \"name\": \"奇迹再现\",\r\n    \"id\": 27901832,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 4552,\r\n        \"name\": \"毛华锋\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"特摄剧《迪迦奥特曼》中文主题曲\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 753,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 0,\r\n      \"name\": \"\",\r\n      \"picUrl\": \"http://p3.music.126.net/6jtW-JXGQYGe1hXQ2u_UYw==/109951165549495300.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951165549495300\",\r\n      \"pic\": 109951165549495300\r\n    },\r\n    \"dt\": 235963,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 9439651,\r\n      \"vd\": -27100\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 5663808,\r\n      \"vd\": -24600\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 3775886,\r\n      \"vd\": -23300\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"01\",\r\n    \"no\": 1,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 524288,\r\n    \"originCoverType\": 1,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 1,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 5570563,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 0,\r\n    \"publishTime\": 1356969600004\r\n  },\r\n  {\r\n    \"name\": \"Butter-Fly\",\r\n    \"id\": 4940920,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 15800,\r\n        \"name\": \"和田光司\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《数码宝贝》片头曲\",\r\n      \" TVアニメ「デジモンアドベンチャー」OP\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 8,\r\n    \"v\": 561,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 494028,\r\n      \"name\": \"DIGIMON HISTORY 1999-2006 All The Best\",\r\n      \"picUrl\": \"http://p3.music.126.net/o8ZfncjFF5frq8Q8iJJ9QQ==/2321069046256264.jpg\",\r\n      \"tns\": [],\r\n      \"pic\": 2321069046256264\r\n    },\r\n    \"dt\": 258000,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 10322590,\r\n      \"vd\": -33600\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 6193571,\r\n      \"vd\": -31199\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 4129061,\r\n      \"vd\": -29600\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 1,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255003136,\r\n    \"originCoverType\": 1,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 474042,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 468010,\r\n    \"publishTime\": 1262275200000\r\n  },\r\n  {\r\n    \"name\": \"All Alone With You (from BEST AL“ALTER EGO”)\",\r\n    \"id\": 525240550,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 19353,\r\n        \"name\": \"EGOIST\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《心理测量者》片尾曲\"\r\n    ],\r\n    \"pop\": 80,\r\n    \"st\": 0,\r\n    \"rt\": null,\r\n    \"fee\": 8,\r\n    \"v\": 28,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 37026165,\r\n      \"name\": \"Greatest Hits 2011-2017 Alter Ego\",\r\n      \"picUrl\": \"http://p3.music.126.net/xLGqUx2VlfFCCm_r31uzDQ==/109951166198393058.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"109951166198393058\",\r\n      \"pic\": 109951166198393060\r\n    },\r\n    \"dt\": 349622,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 13984958,\r\n      \"vd\": -82068\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 8390992,\r\n      \"vd\": -79472\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 5594009,\r\n      \"vd\": -77974\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 9,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 1,\r\n    \"s_id\": 0,\r\n    \"mark\": 270336,\r\n    \"originCoverType\": 1,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 2706476,\r\n    \"publishTime\": 1514304000000\r\n  },\r\n  {\r\n    \"name\": \"動天\",\r\n    \"id\": 531925,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 15639,\r\n        \"name\": \"高梨康治\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 24,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 50071,\r\n      \"name\": \"NARUTO-ナルト- 疾風伝 オリジナル・サウンドトラック\",\r\n      \"picUrl\": \"http://p3.music.126.net/SmLK20zS2_klvPyeYfEc7w==/109951165569412248.jpg\",\r\n      \"tns\": [\r\n        \"火影忍者疾风传OST1\"\r\n      ],\r\n      \"pic_str\": \"109951165569412248\",\r\n      \"pic\": 109951165569412260\r\n    },\r\n    \"dt\": 183506,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 7342542,\r\n      \"vd\": 1142\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 4405542,\r\n      \"vd\": 2421\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 2937043,\r\n      \"vd\": 6113\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 2,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255134208,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1197993600000\r\n  },\r\n  {\r\n    \"name\": \"Old Memory\",\r\n    \"id\": 477982,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 12121319,\r\n        \"name\": \"Bruno Wen-li\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 29,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 45858,\r\n      \"name\": \"『ヨスガノソラ』オリジナルサウンドトラック-New-\",\r\n      \"picUrl\": \"http://p4.music.126.net/OpgpNNPKznDDMxoBqVJy-Q==/2464005557906815.jpg\",\r\n      \"tns\": [],\r\n      \"pic\": 2464005557906815\r\n    },\r\n    \"dt\": 112840,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 4516093,\r\n      \"vd\": 4579\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 2709673,\r\n      \"vd\": 7535\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 1806463,\r\n      \"vd\": 8981\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 17,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 1,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255134208,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1298390400000\r\n  },\r\n  {\r\n    \"name\": \"ヨスガノソラ メインテーマ -記憶-\",\r\n    \"id\": 477931,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 12121319,\r\n        \"name\": \"Bruno Wen-li\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 25,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 45858,\r\n      \"name\": \"『ヨスガノソラ』オリジナルサウンドトラック-New-\",\r\n      \"picUrl\": \"http://p4.music.126.net/OpgpNNPKznDDMxoBqVJy-Q==/2464005557906815.jpg\",\r\n      \"tns\": [],\r\n      \"pic\": 2464005557906815\r\n    },\r\n    \"dt\": 180240,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 7211929,\r\n      \"vd\": 3585\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 4327175,\r\n      \"vd\": 6409\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 2884798,\r\n      \"vd\": 6521\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 5,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 1,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255134208,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1298390400000\r\n  },\r\n  {\r\n    \"name\": \"回レ! 雪月花\",\r\n    \"id\": 28018274,\r\n    \"pst\": 0,\r\n    \"t\": 0,\r\n    \"ar\": [\r\n      {\r\n        \"id\": 16486,\r\n        \"name\": \"原田ひとみ\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      },\r\n      {\r\n        \"id\": 16906,\r\n        \"name\": \"茅野愛衣\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      },\r\n      {\r\n        \"id\": 17554,\r\n        \"name\": \"小倉唯\",\r\n        \"tns\": [],\r\n        \"alias\": []\r\n      }\r\n    ],\r\n    \"alia\": [\r\n      \"TV动画《機巧少女は傷つかない》片尾曲:TVアニメ「機巧少女は傷つかない」EDテーマ\"\r\n    ],\r\n    \"pop\": 100,\r\n    \"st\": 0,\r\n    \"rt\": \"\",\r\n    \"fee\": 0,\r\n    \"v\": 21,\r\n    \"crbt\": null,\r\n    \"cf\": \"\",\r\n    \"al\": {\r\n      \"id\": 2713036,\r\n      \"name\": \"回レ! 雪月花\",\r\n      \"picUrl\": \"http://p4.music.126.net/UrbsnGXM8_cc3nLd3Ru3zw==/18541064580889962.jpg\",\r\n      \"tns\": [],\r\n      \"pic_str\": \"18541064580889962\",\r\n      \"pic\": 18541064580889960\r\n    },\r\n    \"dt\": 234680,\r\n    \"h\": {\r\n      \"br\": 320000,\r\n      \"fid\": 0,\r\n      \"size\": 9389496,\r\n      \"vd\": -42199\r\n    },\r\n    \"m\": {\r\n      \"br\": 192000,\r\n      \"fid\": 0,\r\n      \"size\": 5633714,\r\n      \"vd\": -39900\r\n    },\r\n    \"l\": {\r\n      \"br\": 128000,\r\n      \"fid\": 0,\r\n      \"size\": 3755824,\r\n      \"vd\": -38700\r\n    },\r\n    \"a\": null,\r\n    \"cd\": \"1\",\r\n    \"no\": 1,\r\n    \"rtUrl\": null,\r\n    \"ftype\": 0,\r\n    \"rtUrls\": [],\r\n    \"djId\": 0,\r\n    \"copyright\": 2,\r\n    \"s_id\": 0,\r\n    \"mark\": 9007199255003136,\r\n    \"originCoverType\": 0,\r\n    \"originSongSimpleData\": null,\r\n    \"single\": 0,\r\n    \"noCopyrightRcmd\": null,\r\n    \"mv\": 0,\r\n    \"rtype\": 0,\r\n    \"rurl\": null,\r\n    \"mst\": 9,\r\n    \"cp\": 663018,\r\n    \"publishTime\": 1385481600007\r\n  }\r\n]', '2021-07-24 17:50:19');

-- ----------------------------
-- Table structure for plumemo_posts
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_posts`;
CREATE TABLE `plumemo_posts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author_id` bigint(255) NULL DEFAULT NULL COMMENT '文章创建人',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `comments` int(11) NOT NULL DEFAULT 0 COMMENT '评论数',
  `is_comment` smallint(6) NULL DEFAULT 1 COMMENT '是否打开评论 (0 不打开 1 打开 )',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类主键',
  `sync_status` smallint(6) NOT NULL DEFAULT 0 COMMENT '同步到byteblogs状态',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 1 草稿 2 发布',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '摘要',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `weight` int(11) NOT NULL DEFAULT 0 COMMENT '文章权重',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_posts_attribute
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_posts_attribute`;
CREATE TABLE `plumemo_posts_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `posts_id` bigint(20) NOT NULL COMMENT '文章表主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_posts_comments
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_posts_comments`;
CREATE TABLE `plumemo_posts_comments`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) NOT NULL COMMENT '评论人的id',
  `reply_author_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '被回复者的id，为0时就是根评论',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论的内容',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父评论的id，为0表示没有父评论',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `posts_id` bigint(20) NOT NULL COMMENT '哪篇文章的评论',
  `tree_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级结构',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_posts_tags
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_posts_tags`;
CREATE TABLE `plumemo_posts_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags_id` bigint(32) NOT NULL COMMENT '名称',
  `posts_id` bigint(20) NOT NULL COMMENT '文章主键',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plumemo_tags
-- ----------------------------
DROP TABLE IF EXISTS `plumemo_tags`;
CREATE TABLE `plumemo_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
