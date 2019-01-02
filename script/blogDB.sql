/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.62
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : 192.168.3.62:3306
 Source Schema         : blogDB

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 02/01/2019 13:19:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, 'peterlee', '34032c7c01b5d87474c9587c5e8c4649', '2017-04-28 11:09:05');
INSERT INTO `admin` VALUES (2, 1, 'admin', '670b14728ad9902aecba32e22fa4f6bd', '2017-04-28 11:10:09');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `category_id` int(4) DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_total` int(4) DEFAULT 0,
  `ip_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(4) DEFAULT 0,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFEBA5C93FCBC1E60`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Reading', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (2, 'Feeling', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (3, 'Traveling', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (4, 'Working', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (5, 'Learning', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (6, 'Watching', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (7, 'Playing', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (8, 'Living', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (9, 'Listening', 0, '2006-11-27 00:00:00');
INSERT INTO `category` VALUES (10, 'Codeing', 1, '2017-05-04 00:00:00');
INSERT INTO `category` VALUES (12, 'Ending', 1, '2017-05-04 00:00:00');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `browser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `previous_page` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `current_page` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `access_date_time` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (146, 'webkit', '192.168.2.29', 'null', 'http://192.168.2.29:8080/frontend/', 1499740755520);
INSERT INTO `log` VALUES (147, 'webkit', '192.168.2.29', 'null', 'http://192.168.2.29:8080/frontend/', 1499741411256);
INSERT INTO `log` VALUES (148, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/270', 1499741441072);
INSERT INTO `log` VALUES (149, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/1', 1499741445104);
INSERT INTO `log` VALUES (150, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/7', 1499741451084);
INSERT INTO `log` VALUES (151, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/', 1499741455617);
INSERT INTO `log` VALUES (152, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/', 1499741459498);
INSERT INTO `log` VALUES (153, 'webkit', '192.168.2.29', 'null', 'http://192.168.2.29:8080/frontend/', 1499757590002);
INSERT INTO `log` VALUES (154, 'webkit', '192.168.2.29', 'null', 'http://192.168.2.29:8080/frontend/', 1499758178831);
INSERT INTO `log` VALUES (155, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/269', 1499762546137);
INSERT INTO `log` VALUES (156, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/271', 1499762551539);
INSERT INTO `log` VALUES (157, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/270', 1499762555620);
INSERT INTO `log` VALUES (158, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/1', 1499762558830);
INSERT INTO `log` VALUES (159, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/2', 1499762561452);
INSERT INTO `log` VALUES (160, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/3', 1499762565152);
INSERT INTO `log` VALUES (161, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/5', 1499762569802);
INSERT INTO `log` VALUES (162, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/6', 1499762573442);
INSERT INTO `log` VALUES (163, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/7', 1499762576863);
INSERT INTO `log` VALUES (164, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/', 1499762601295);
INSERT INTO `log` VALUES (165, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/', 1499762607927);
INSERT INTO `log` VALUES (166, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/269', 1499762613112);
INSERT INTO `log` VALUES (167, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/7', 1499762626088);
INSERT INTO `log` VALUES (168, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/7', 1499762633181);
INSERT INTO `log` VALUES (169, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/6', 1499763691356);
INSERT INTO `log` VALUES (170, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/7', 1499763694441);
INSERT INTO `log` VALUES (171, 'webkit', '192.168.2.29', 'http://192.168.2.29:8080/frontend/', 'http://192.168.2.29:8080/frontend/blog/detail/269', 1499763794638);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `father_id` int(4) DEFAULT NULL,
  `menu_code` int(40) DEFAULT NULL,
  `menu_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_url` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 10, 1001, '内容管理', '');
INSERT INTO `menu` VALUES (2, 10, 1002, '权限管理', '');
INSERT INTO `menu` VALUES (3, 1001, 100101, '博客管理', '');
INSERT INTO `menu` VALUES (4, 100101, 10010101, '新增博客', 'blog/add');
INSERT INTO `menu` VALUES (5, 100101, 10010102, '博客列表', 'blog/list');
INSERT INTO `menu` VALUES (6, 0, 10, '顶层', '');
INSERT INTO `menu` VALUES (7, 1001, 100102, '类别管理', '');
INSERT INTO `menu` VALUES (8, 100102, 10010201, '新增类别', 'category/add');
INSERT INTO `menu` VALUES (9, 100102, 10010202, '类别列表', 'category/list');
INSERT INTO `menu` VALUES (10, 1002, 100201, '配置管理', '');
INSERT INTO `menu` VALUES (11, 100201, 10020101, '菜单管理', 'menu/list');
INSERT INTO `menu` VALUES (15, 1002, 100202, '用户管理', '');
INSERT INTO `menu` VALUES (16, 100202, 10020201, '新增用户', 'admin/add');
INSERT INTO `menu` VALUES (17, 100202, 10020202, '用户列表', 'admin/list');
INSERT INTO `menu` VALUES (22, 1002, 100203, '角色管理', '');
INSERT INTO `menu` VALUES (23, 100203, 10020301, '新增角色', 'role/add');
INSERT INTO `menu` VALUES (24, 100203, 10020302, '角色列表', 'role/list');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `blog_id` int(4) NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 469 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 40, 'CC', '您好，请问能发一份完整版的给我吗？ 多谢^^ 0602chenchen@163.com', '222.128.171.75', 1330628994000);
INSERT INTO `reply` VALUES (2, 40, '阿久', '在书店翻看过，总觉得被hx过，豆瓣上一找，果真如此… 希望楼主有时间能发份给我拜读一下完整版，非常感谢！！！！ kiley1026@gmail.com', '222.177.11.180', 1328584896000);
INSERT INTO `reply` VALUES (3, 40, 'he', '549647346@qq.com。也发我一份吧', '121.33.190.164', 1326398590000);
INSERT INTO `reply` VALUES (4, 40, 'D', '从豆瓣追来，可否发一份dyg1990@live.cn，谢谢博主啊！！！', '183.62.39.66', 1325806462000);
INSERT INTO `reply` VALUES (5, 40, 'show8725', '豆瓣同好，望楼主不吝赐书，不胜感激！ show8725@163.com', '221.6.32.54', 1325735990000);
INSERT INTO `reply` VALUES (6, 40, '丁丁在追寻', '能否请楼主发一份PDF版给我？万分感谢！ fillflying@163.com', '220.163.43.122', 1323376548000);
INSERT INTO `reply` VALUES (7, 40, '多谢', '麻烦楼主给我发一份吧，很希望看这几本书。谢谢楼主！niuxinghao@foxmail.com', '94.188.48.112', 1323365250000);
INSERT INTO `reply` VALUES (8, 40, '追寻现代中国', '链接失效，望发邮箱cnwycol@163.com，谢谢', '112.233.56.216', 1322863973000);
INSERT INTO `reply` VALUES (9, 40, 'postino', '谢谢楼主。sfwhhp@sina.com', '60.160.182.10', 1322621057000);
INSERT INTO `reply` VALUES (10, 40, 'postino', '来自豆瓣，谢谢楼主。sfwhhp@sina.com', '60.160.182.10', 1322620986000);
INSERT INTO `reply` VALUES (11, 40, 'Walker', '感谢文轩先生的分享，这里的链接显示无法找到指定文件，希望能抽空也邮我一份，thankguojia@yahoo.cn,多谢！', '202.114.129.62', 1322438554000);
INSERT INTO `reply` VALUES (12, 40, 'long', '你好文轩先生，请您也发我一份吧，多谢了！717657179@qq.com', '124.65.99.122', 1322416848000);
INSERT INTO `reply` VALUES (13, 40, 'caizijin', '文轩兄你好，豆瓣慕名而来，可以的话请发一份完整版给我，我的邮箱是ajxz@qq.com', '113.58.211.27', 1322172116000);
INSERT INTO `reply` VALUES (14, 40, '笑看风云', '你好 请发我一份《追寻现代中国》 我的邮箱： liyuyun888@163.com 链接下不下来 谢谢', '219.141.236.161', 1320281158000);
INSERT INTO `reply` VALUES (15, 40, 'lhlpx', '你好，我下载不了，能把这套书和中国近代史发一份给我吗？谢谢哦。我的邮箱：zjnbpx@126.com', '115.238.150.7', 1320257593000);
INSERT INTO `reply` VALUES (16, 40, '小黄鹂', '跪求博主发我一份 联系失效了 huangliliruc@163.com 多谢多谢', '218.106.181.103', 1319425235000);
INSERT INTO `reply` VALUES (17, 40, '楼主好人', '请博主发给一份，好吗？谢谢了！ wh514@yahoo.com', '218.10.131.49', 1319314013000);
INSERT INTO `reply` VALUES (18, 40, 'wowo', '請問可否電郵給我呢?? abcpang@ymail.com 謝謝!', '116.49.74.147', 1318308889000);
INSERT INTO `reply` VALUES (19, 40, '沧江', '能不能将《追寻现代中国》邮件给我：laiyangliwhl@163.com', '222.168.65.121', 1318209527000);
INSERT INTO `reply` VALUES (20, 40, '游客', '赞美博主,这么多人都是索要这本书的,如果博主能给我邮一份,我一定把它发布出去,给个种子出来,谢谢!humandong@gmail.com', '180.170.5.0', 1317959671000);
INSERT INTO `reply` VALUES (21, 40, '宏志', '望楼主不吝赐书，不胜感激！ 邮箱shzwww@yahoo.com.cn', '114.226.28.104', 1317869871000);
INSERT INTO `reply` VALUES (22, 40, '谢谢', '这么多年以后我才找到这里来，可不可以麻烦传我一份，不胜感激。274767712@qq.com', '220.243.128.3', 1317875830000);
INSERT INTO `reply` VALUES (23, 40, '哈利', '楼主能否也分享一份给我，也是从豆瓣上来的，谢谢 dabenbenla@163.com', '59.46.239.169', 1317689353000);
INSERT INTO `reply` VALUES (24, 40, 'shareman', '这么难得的机会，我也要一份啊[emot]1[/emot] vonshareman@126.com 拜谢！', '218.94.13.134', 1314069374000);
INSERT INTO `reply` VALUES (25, 40, '杰别', '链接貌似已经失效了 staples08@163.com 谢谢楼主', '218.89.40.77', 1312064496000);
INSERT INTO `reply` VALUES (26, 40, '紫川', '351846330@qq.com LZ发我一份吧 谢谢了', '101.64.38.75', 1312048438000);
INSERT INTO `reply` VALUES (27, 40, 'fangfangfangyuy', '您好,能不能将此书和《追寻现代中国》《中国近代史》邮件给我，非常谢谢：fangfangfangyuyuyu@126.com ', '1.202.186.19', 1311997383000);
INSERT INTO `reply` VALUES (28, 40, 'fangfangfangyuy', '手头只有阉割版，可以传一份吗？感谢楼主。fangfangfangyuyuyu@126.com', '202.112.174.19', 1311997049000);
INSERT INTO `reply` VALUES (29, 40, 'fangfangfangyuy', '手头只有阉割版，可以传一份吗？望楼主不吝赐书，不胜感激！fangfangfangyuyuyu@126.com', '202.112.174.19', 1311996958000);
INSERT INTO `reply` VALUES (30, 40, 'xena', '不能下载哦~豆瓣追过来的，求全文ningyexena@163.com', '114.86.55.180', 1310943109000);
INSERT INTO `reply` VALUES (31, 40, 'nihao', '请问博主如何购得图书？我喜欢纸质版，想买一份', '220.167.40.243', 1308627800000);
INSERT INTO `reply` VALUES (32, 40, 'watermark', '未知楼主现在还关注这个帖子不，如能看到，请发一份给我，不甚感谢！ ppbluetree@yahoo.com.cn', '112.64.79.237', 1307899992000);
INSERT INTO `reply` VALUES (33, 40, 'nnnnnnnnnnn', '我是从豆瓣跟过来的，您给的下载链接不能用了，还请方便的时候也给我发一份吧，nnnn3@sina.com.cn，谢谢啦！', '222.65.114.43', 1307666347000);
INSERT INTO `reply` VALUES (34, 40, 'bigeye', '时隔三年 好书之香扑面而来 追寻豆瓣到此 烦请博主不吝赠书 bigeye.bby@gmail.com 珍谢再三！！！！！！！！', '180.168.147.18', 1306979209000);
INSERT INTO `reply` VALUES (35, 40, '烟枪', '谢谢 smokegan@sohu.com', '124.133.2.254', 1302919468000);
INSERT INTO `reply` VALUES (36, 40, '巴子', '楼主能否也分享一份给我，我是豆瓣上来的，谢谢 bayan0412@126.com', '117.32.153.157', 1302575027000);
INSERT INTO `reply` VALUES (37, 40, 'yoursincerely', '能否共享，多谢多谢了，yoursincerely@sina.com', '124.160.46.122', 1301937508000);
INSERT INTO `reply` VALUES (38, 40, 'doudou', '楼主的链接已经失效了，如蒙转赐，心诚感激 wangdoudou321@gmail.com', '58.60.1.94', 1301525849000);
INSERT INTO `reply` VALUES (39, 40, '求书', '从豆瓣来到这里，麻烦楼主也发我一份，312462731@qq.com', '59.38.110.226', 1301430962000);
INSERT INTO `reply` VALUES (40, 40, 'l', 'liangchaoyi@126.com 辛苦了~討饒了', '114.221.34.73', 1298595732000);
INSERT INTO `reply` VALUES (41, 33041, 'Doris代代非', '我也看了《异类》，很多技艺要到娴熟，必须一万小时为····', '119.132.102.115', 1298174264000);
INSERT INTO `reply` VALUES (42, 40, 'babydog', '时隔三年了啊快~发个帖 求个书 顺便博主忆个旧 babydog17@gmail.com 祝好！元宵快乐~！', '89.88.172.100', 1297987282000);
INSERT INTO `reply` VALUES (43, 40, 'babydog', '.....都隔了快三年了 留个言 求个书 博主顺便忆个旧... babydog17@gmail.com 谢谢！祝元宵节快乐！', '89.88.172.100', 1297987183000);
INSERT INTO `reply` VALUES (44, 40, '板凳', '从豆瓣追到这里来的～拜托博主能给我发一份吗？麻烦您了，谢谢哈～我的邮箱地址是 han.yinxiao@hotmail.com', '112.2.179.252', 1297642656000);
INSERT INTO `reply` VALUES (45, 40, '板凳', '从豆瓣追到这里来的～拜托博主能给我发一份吗？麻烦您了，谢谢哈～我的邮箱地址是 han.yinxiao@hotmail.com', '112.2.179.252', 1297642396000);
INSERT INTO `reply` VALUES (46, 40, '豆瓣', '找不到 希望楼主发一份 myhamlet@hotmail.com 谢谢^^', '125.89.223.98', 1296841633000);
INSERT INTO `reply` VALUES (47, 40, '问津', '你好，我在豆瓣上看到你的评论而来。不知道哪里还可以看到“未阉割”版？豆瓣的一些活跃用户正在组织“公开课堂”教授中国近代史，其中这本书就在书单之列。如果能提供一些信息，将万分感激。http://site.douban.com/xcx/room/589477/', '115.172.236.113', 1296868453000);
INSERT INTO `reply` VALUES (48, 40, '问津', '你好，我在豆瓣上看到你的评论而来。不知道哪里还可以看到“未阉割”版？豆瓣的一些活跃用户正在组织“公开课堂”教授中国近代史，其中这本书就在书单之列。如果能提供一些信息，将万分感激。http://site.douban.com/xcx/room/589477/', '115.172.236.113', 1296868387000);
INSERT INTO `reply` VALUES (49, 40, '凤凰单车', '兄弟，搜索了很久搜到你这来了，你给的连接我无法下载，能否赠我好书，非万分感谢！147061726@qq.com', '219.137.246.74', 1293594561000);
INSERT INTO `reply` VALUES (50, 40, '二道小市民', '从豆瓣追踪至此，邮箱pengbing8915@126.com 不胜感激', '123.138.157.65', 1292203683000);
INSERT INTO `reply` VALUES (51, 40, '豆瓣同好', '幸好楼主还在用这个博客，链接进不去，方便的话发我一份吧，谢谢！ flyingliuyi@gmail.com', '218.78.237.44', 1287446933000);
INSERT INTO `reply` VALUES (52, 40, '沐和', '既我一份啊，yuexian0408@163.com 谢谢哥们。。。', '121.28.48.172', 1286740359000);
INSERT INTO `reply` VALUES (53, 33088, '冰冷冬季', '你七天长假就那样过拉？？昏．．又不过来我这里玩．．肯定有女朋友陪你，家都不想出了．．', '58.248.126.143', 1286558919000);
INSERT INTO `reply` VALUES (54, 40, 'lauda', '博主可否share一份给俺一阅，邮箱sunwaysoc#gmail.com，谢谢', '116.228.240.58', 1286482388000);
INSERT INTO `reply` VALUES (55, 219, 'q525093551', '真不错，非常好。请帮忙推荐我的软件：顶贴机 自动顶贴 顶贴工具 顶贴软件 论坛顶贴 顶帖机 联系qq:525093551 论坛自动顶帖工具 自动顶帖 顶帖工具 顶帖软件 灌水机 刷分机 刷贴机 回贴机 帖子置顶器 联系qq:525093551 论坛自动顶贴机 自动顶贴机 论坛顶贴机 智能顶贴机 百度贴吧顶贴机 顶贴器 顶贴机下载 联系qq:525093551 多谢帮忙介绍 ', '114.246.180.150', 1285544014000);
INSERT INTO `reply` VALUES (56, 40, 'cathy', '我来晚了，上传地址已经没有 cathylsb@hotmail.com 可以给一份吗？感谢！', '61.170.229.24', 1285095436000);
INSERT INTO `reply` VALUES (57, 40, 'tomy', '为一本书,众同好近悦远至,小弟不才,也要讨一份分享,谢谢您的辛苦,tomyzhuang@hotmail.com', '211.136.97.74', 1283834783000);
INSERT INTO `reply` VALUES (58, 40, 'keepsmile', '一路追来，却打不开，能否分享发我一份，不胜感激。wjx_ay@163.com 你的博客有深度和内涵。还在深圳？抑或可能来北京吗？', '114.244.69.76', 1282356721000);
INSERT INTO `reply` VALUES (59, 26786, '英狐', '共鸣之。', '125.89.184.118', 1281463039000);
INSERT INTO `reply` VALUES (60, 33048, '冰冷冬季', '你的思维能力太强了!我现在还没有学好.net呢！得闲跟我说说你的学习方法拉！ ', '59.41.249.29', 1280284409000);
INSERT INTO `reply` VALUES (61, 219, 'q525093551', '真不错，非常好。请帮忙推荐我的软件：顶贴机 自动顶贴 顶贴工具 顶贴软件 论坛顶贴 顶帖机 联系qq:525093551 论坛自动顶帖工具 自动顶帖 顶帖工具 顶帖软件 灌水机 刷分机 刷贴机 回贴机 帖子置顶器 联系qq:525093551 论坛自动顶贴机 自动顶贴机 论坛顶贴机 智能顶贴机 百度贴吧顶贴机 顶贴器 顶贴机下载 联系qq:525093551 多谢帮忙介绍 ', '114.245.246.223', 1280255288000);
INSERT INTO `reply` VALUES (62, 22, '躺着喝水', '[emot]15[/emot]恕我眼花，没看到熊，只看到一只毛绒狗。', '210.75.17.50', 1279055989000);
INSERT INTO `reply` VALUES (63, 33047, '冰冷冬季', '你什么时候也信这些东西拉?', '58.63.28.67', 1278901701000);
INSERT INTO `reply` VALUES (64, 219, '鲁鲁', '说的好鼎鼎鼎', '58.33.45.29', 1278881172000);
INSERT INTO `reply` VALUES (65, 219, 'q525093551', '真不错，非常好。请帮忙推荐我的软件：顶贴机 自动顶贴 顶贴工具 顶贴软件 论坛顶贴 顶帖机 联系qq:525093551 论坛自动顶帖工具 自动顶帖 顶帖工具 顶帖软件 灌水机 刷分机 刷贴机 回贴机 帖子置顶器 联系qq:525093551 论坛自动顶贴机 自动顶贴机 论坛顶贴机 智能顶贴机 百度贴吧顶贴机 顶贴器 顶贴机下载 联系qq:525093551 多谢帮忙介绍', '114.245.240.93', 1278648242000);
INSERT INTO `reply` VALUES (66, 33047, '躺着喝水', '[emot]21[/emot]这关系研究的相当有学问。', '210.75.17.50', 1278442828000);
INSERT INTO `reply` VALUES (67, 40, 'happypinkpig', '能给我发一份嘛，chenrong0121@gmail.com,谢谢', '219.141.175.197', 1278303709000);
INSERT INTO `reply` VALUES (68, 33045, '冰冷冬季', '[emot]2[/emot]太有道理拉!计算机牵涉到的东西可以说无边际的.', '59.42.134.103', 1276644354000);
INSERT INTO `reply` VALUES (69, 38, '123', 'this book：pulicheng@yahoo.com.cn', '120.36.127.156', 1276385000000);
INSERT INTO `reply` VALUES (70, 40, '感谢豆瓣', 'jimmycnteda8696@yahoo.com.cn', '221.212.176.50', 1275885073000);
INSERT INTO `reply` VALUES (71, 40, '求知者', '谢谢了 jimmycnteda8696@yahoo.com.cn', '221.212.176.50', 1275884999000);
INSERT INTO `reply` VALUES (72, 33043, '雪乌鸦', '试了下，不错哦', '221.172.167.252', 1275707205000);
INSERT INTO `reply` VALUES (73, 33042, '雪乌鸦', '老实说我对云概念不深，只是片面的认识。', '221.172.167.252', 1275706931000);
INSERT INTO `reply` VALUES (74, 33038, '雪乌鸦', '这广告不错，我们也要打温情牌，但发EM给老大们，都说市场部不通过啊。', '221.172.167.252', 1275706142000);
INSERT INTO `reply` VALUES (75, 33037, '雪乌鸦', '就这么简单？我这边天桥上好多啊，外包行不？', '221.172.167.252', 1275706001000);
INSERT INTO `reply` VALUES (76, 33039, '花园', '你如何才能要人猜到你的心思呢？唯一的办法就是你得先输出你的部分意识。 就说豆瓣，如果你写出了你的小部分意识，他会猜到你的兴趣，不过这些是你已经读过，但未写出的（另外一部分意识）。如果你输出了大部分意识，或者全部的意识，他说不定就会——猜出感兴趣而又没读过的。所以这不是豆瓣不够厉害~~~而是你输出的太少[emot]7[/emot] 突然想到，有时会不解为何自己不被理解。但现在想来，还真怪不得别人。。。', '123.116.122.163', 1275187679000);
INSERT INTO `reply` VALUES (77, 33043, '躺着喝水', '[emot]15[/emot]这么有意思？', '210.75.17.50', 1274667912000);
INSERT INTO `reply` VALUES (78, 33022, 'Milla', '这人好能吃！[emot]22[/emot]', '59.174.216.172', 1274496996000);
INSERT INTO `reply` VALUES (79, 40, 'wanshi280', '楼主你好 从豆瓣那边追过来 能不能将此书和《追寻现代中国》《中国近代史》邮件给我 万分感谢 wanshi280@163.com', '116.205.109.202', 1273958618000);
INSERT INTO `reply` VALUES (80, 33032, 'keblues', '哈哈,是啊,你到底是干什么的啊[quote][b]以下为blog主人的回复：[/b] 不如你来我公司加入我的团队,然后你就知道我是干嘛的了.[/quote]', '119.132.99.234', 1273461558000);
INSERT INTO `reply` VALUES (81, 33021, '花园', '“临阵退缩是没有用的”感同身受，新接了一本教室用书的编写，要是在以前，真会临阵退缩。不过现在心里突然有了边学边做的信心！[emot]18[/emot]', '221.219.116.198', 1273263853000);
INSERT INTO `reply` VALUES (82, 40, 'tazo', '能否将《追寻现代中国》邮一份给我：tazo@sohu.com', '222.248.34.112', 1273095515000);
INSERT INTO `reply` VALUES (83, 40, 'tazo', '能否将《追寻现代中国》邮一份给我：tazo@sohu.com', '222.248.34.112', 1273095514000);
INSERT INTO `reply` VALUES (84, 40, 'Vincent', '请问还有没有pdf扫描版下载~~我很想看？ 或者书能否转让？ equalye@hotmail.com', '67.23.228.112', 1272512321000);
INSERT INTO `reply` VALUES (85, 40, '我的我的我', '貌似不能下载。还请博主发我一份啊，谢谢了。xiaowei_226@163.com', '119.84.148.172', 1272334936000);
INSERT INTO `reply` VALUES (86, 40, '我的我的我', '好像下不了呢，请博主发我一份吧，谢谢了。xiaowei_226@163.com', '119.84.148.172', 1272334642000);
INSERT INTO `reply` VALUES (87, 40, '生死有爱', '你好，请你也给我发一份吧，mg1980215@sina.com', '123.149.201.84', 1270432635000);
INSERT INTO `reply` VALUES (88, 40, '生死有爱', '你好，请你也给我发一份吧，mg1980215@sina.com', '123.149.201.84', 1270432615000);
INSERT INTO `reply` VALUES (89, 40, '生死有爱', '你好，请你也给我发一份吧，mg1980215@sina.com', '123.149.201.84', 1270432595000);
INSERT INTO `reply` VALUES (90, 40, '生死有爱', '你好，请你也给我发一份吧，mg1980215@sina.com', '123.149.201.84', 1270432575000);
INSERT INTO `reply` VALUES (91, 40, '生死有爱', '你好，请你也给我发一份吧，mg1980215@sina.com', '123.149.201.84', 1270432553000);
INSERT INTO `reply` VALUES (92, 33022, '如郢随行', '如果自己创业成立公司需要从长计议的话，不如赶紧找个人帮你管管家。人的精力都是有限的，如果把精力投入到记账中去，多少会减少你对其他方面精力的投入。', '123.117.20.189', 1270424932000);
INSERT INTO `reply` VALUES (93, 40, 'memorylane', '同时从豆瓣追随至此，看到这么多人留下邮箱，知道文轩一定辛苦了！不过还是想看到《中国近代史》和《追寻现代中国》，所以还是留下邮箱.guocai.yao@gmail.com', '118.229.170.166', 1270344004000);
INSERT INTO `reply` VALUES (94, 40, 'memorylane', '也是从豆瓣追随而来，看到这么多人留下邮箱，文轩一定辛苦不少，不过还是非常想看到《追寻现代中国》和《中国近代史》，所以还是留下邮箱。guocai.yao@gmail.com', '118.229.170.166', 1270343626000);
INSERT INTO `reply` VALUES (95, 40, '高山流水', '先谢谢楼主，好书拿出来分享', '218.199.206.74', 1270096075000);
INSERT INTO `reply` VALUES (96, 40, '何西', '从豆瓣上追寻而来，希望博主能抽出时间给本人发送一份，不胜感激。fy175isme@gmail.com', '70.231.145.74', 1269826852000);
INSERT INTO `reply` VALUES (97, 33022, '雪乌鸦', '外包？培训？都是你强项啊，我暂时没资金，有资金再说', '112.94.147.15', 1269569309000);
INSERT INTO `reply` VALUES (98, 33036, '雪乌鸦', 'E文不好的我路过看看。', '112.94.250.98', 1269397886000);
INSERT INTO `reply` VALUES (99, 33032, '雪乌鸦', '最近无聊到思考这些东西了？', '112.94.250.98', 1269394906000);
INSERT INTO `reply` VALUES (100, 33022, '雪乌鸦', '什么时候开公司，开什么公司？[quote][b]以下为blog主人的回复：[/b] 会尝试做外包和培训，有没有兴趣投资？[emot]1[/emot][/quote]', '112.94.250.98', 1269394671000);
INSERT INTO `reply` VALUES (101, 33021, '雪乌鸦', '读完后觉得爽，学习到东西了。', '112.94.250.98', 1269394295000);
INSERT INTO `reply` VALUES (102, 40, '倚天', '豆瓣而来，谢谢你，发我一份RNEWSHIP@SINA.COM', '121.28.73.156', 1269233961000);
INSERT INTO `reply` VALUES (103, 33020, 'peterlee', '希望你工作顺利，带回更多关于迪拜的资讯回来与我分享。', '211.154.134.99', 1268707767000);
INSERT INTO `reply` VALUES (104, 40, 'zsz', '您好！请发一份给我吧，十分感激！zhu.shangzhi@hotmail.com', '116.7.127.239', 1267924530000);
INSERT INTO `reply` VALUES (105, 40, '豆豆', '能否发一个给我gromi@163.com 万分感激！！', '114.243.8.193', 1267678358000);
INSERT INTO `reply` VALUES (106, 40, '豆豆', '能否发一个给我gromi@163.com', '114.243.8.193', 1267678229000);
INSERT INTO `reply` VALUES (107, 40, 'unnc_silent', '您好 您提供的那个网址已经不能下载了 能不能发给我邮箱 上课要用那~谢谢unnc_silent@163.com', '60.190.19.141', 1266871042000);
INSERT INTO `reply` VALUES (108, 40, '居家好男人', '相邮一份，不甚感谢！ schubertz@qq.com', '121.76.200.244', 1266196630000);
INSERT INTO `reply` VALUES (109, 33020, 'Iris', '认真在杂志上拜读过了，杂志与你同期的另外一篇介绍迪拜的文章是我经理的大作，我也将远赴迪拜工作两年！[emot]1[/emot]', '113.14.119.171', 1265073293000);
INSERT INTO `reply` VALUES (110, 27755, '雪乌鸦', '不懂。', '112.94.170.116', 1264642212000);
INSERT INTO `reply` VALUES (111, 31667, '雪乌鸦', '赶项目吗？搞定个项目就放风一样，呵呵', '112.94.170.116', 1264641798000);
INSERT INTO `reply` VALUES (112, 32487, '雪乌鸦', 'Apach非常强大，早有耳闻。 技术越来越厉害啊', '112.94.170.116', 1264641701000);
INSERT INTO `reply` VALUES (113, 32625, '雪乌鸦', '以前的C、汇编都忘记了，现在让我学都未必学进去。', '112.94.170.116', 1264641330000);
INSERT INTO `reply` VALUES (114, 32327, '雪乌鸦', '的确压力大，也领悟了不少新东西吧。', '112.94.170.116', 1264640863000);
INSERT INTO `reply` VALUES (115, 32867, '雪乌鸦', '我没那么严谨，娱乐一下、需要时候就拿书学习~', '112.94.170.116', 1264640679000);
INSERT INTO `reply` VALUES (116, 40, '豆瓣同好(游客)', '豆瓣追来，望楼主传于我，不胜感激。eddylove111@163.com', '60.167.239.242', 1263690482000);
INSERT INTO `reply` VALUES (117, 40, 'nickeyue@sohu.com', 'nickeyue@sohu.com，给我份吧，谢谢', '222.70.65.125', 1260723631000);
INSERT INTO `reply` VALUES (118, 40, 'nickeyue', '好心的豆瓣楼主能给我看看吗 nickeyue@sohu.com，谢谢您', '222.70.65.125', 1260766733000);
INSERT INTO `reply` VALUES (119, 40, 'icyheart', '从豆瓣追来，很想看看追寻现代中国和中国近代史，请发我一份吧，icyheart@tom.com', '121.12.200.28', 1259716568000);
INSERT INTO `reply` VALUES (120, 32625, '花园', '哈哈，学习了，原来语言还可以这样来诠释的。', '123.116.122.62', 1259470592000);
INSERT INTO `reply` VALUES (121, 40, '晚辈', '望博主能不吝赠书 共同学习 谢谢~ cbrianect@gmail.com', '221.232.103.144', 1258334397000);
INSERT INTO `reply` VALUES (122, 40, 'yanmie930', '从豆瓣上追寻而来，希望博主能抽出时间给我发送一份，谢谢。邮箱：zhanger@bocommtrust.com', '211.144.211.182', 1257709374000);
INSERT INTO `reply` VALUES (123, 40, 'Fred', '请博主发给俺一份：fredliu@yahoo.cn', '202.101.8.227', 1257213542000);
INSERT INTO `reply` VALUES (124, 26989, '郢轩', '看来文轩长了张娃娃脸！！！[emot]8[/emot]', '111.194.95.64', 1255387683000);
INSERT INTO `reply` VALUES (125, 40, 'leshong', '也是来求书的，最近有个讨论要用这书，又不好意思只看个阉版，谢谢博主了~~leshong@163.com', '60.217.248.194', 1254097298000);
INSERT INTO `reply` VALUES (126, 40, 'G_will', '追寻现代中国，追到了这里。 望楼主不吝赐书，不胜感激！ G_will@ieqi.com', '218.193.2.19', 1253727018000);
INSERT INTO `reply` VALUES (127, 40, 'G_will', '从豆瓣来的，实在不想读阉版。 谢谢赠书。 g_will@ieqi.com', '218.193.2.19', 1253726860000);
INSERT INTO `reply` VALUES (128, 26989, 'ann', '[emot]5[/emot][emot]5[/emot][emot]5[/emot][emot]5[/emot][emot]5[/emot][emot]5[/emot][emot]5[/emot][emot]5[/emot] 哈哈，看来叫你大叔也不错', '121.15.132.33', 1247073695000);
INSERT INTO `reply` VALUES (129, 40, '摆渡的鱼', '谢谢您，也发给我好吗？xiaoming62@hotmail.com', '58.34.145.100', 1246826759000);
INSERT INTO `reply` VALUES (130, 26962, 'ann', '[emot]7[/emot]哈哈 把这个发上了呀', '219.134.115.174', 1245818724000);
INSERT INTO `reply` VALUES (131, 40, 'fromdouban', '博主好，我也是从豆瓣过来的，不知能否麻烦发一份到我的邮箱，多谢！bluestorm.cd@gmail.com', '218.82.227.241', 1245604128000);
INSERT INTO `reply` VALUES (132, 40, 'from douban', '博主好，我也是从豆瓣过来的，不知能否麻烦发一份到我的邮箱，多谢！bluestorm.cd@gmail.com', '218.82.227.241', 1245646695000);
INSERT INTO `reply` VALUES (133, 38, 'kkk', '麻烦也给我发一份吧 liuyi161616@163.com', '119.7.72.185', 1245550077000);
INSERT INTO `reply` VALUES (134, 26943, '慧慧', '写的真的很不错，就像21天成功训练营（www.21days.cn/train）要求我们做的：行动，行动，再行动！以后我会常来你这做客的，也期待你新的作品。', '121.100.130.106', 1245113011000);
INSERT INTO `reply` VALUES (135, 38, '佳未', 'weiyike123@msn.com 也请给我传一份吧，十分感谢！', '94.23.60.172', 1244313986000);
INSERT INTO `reply` VALUES (136, 40, 'L', '烦请楼主分享一份：nilgnil[at]gmail[dot]com 不甚感激', '61.171.91.51', 1244310873000);
INSERT INTO `reply` VALUES (137, 40, '陈浩南', '楼主，你好，我很想看《追寻现代中国》（3本全）。能否把这三本书发到我邮箱：kobeekin@sina.com，谢谢拉！！', '202.120.6.167', 1243892846000);
INSERT INTO `reply` VALUES (138, 40, 'monica', '下不了，能否发一份给我，谢谢 monica_miaomiao@hotmail.com', '58.34.123.36', 1243546368000);
INSERT INTO `reply` VALUES (139, 40, 'monica', '下载不了,能否也发一份给我,谢谢 monica_miaomiao@hotmail.com', '58.34.123.36', 1243546270000);
INSERT INTO `reply` VALUES (140, 38, '爱上八神', '跪求 万望楼主抽点时间发给小弟 心仪已久！！！！！！！ wangliliguoji@yahoo.cn 万分感谢！！！！！', '115.59.56.194', 1243308909000);
INSERT INTO `reply` VALUES (141, 26919, 'ann', '要识别一个人并不是很困难的事情。 但事实往往是当局者迷，旁观者清。 若你真的能非常清醒的观察事态走向，只是代表了你非身处局中。', '222.125.193.82', 1242755604000);
INSERT INTO `reply` VALUES (142, 40, '小强', '希望博主也给俺一份，不胜感激，sgq0203@126.com,再次感谢！', '222.133.130.138', 1242601632000);
INSERT INTO `reply` VALUES (143, 40, 'nihao', '楼主，你好，你给的地址无法下载书籍哈，能否电子一份？谢谢。 wanchaoqi@163.com', '222.53.216.86', 1242606890000);
INSERT INTO `reply` VALUES (144, 26891, '乐萁儿', '看你的文章让我想起了对我人生帮助最大的21天成功训练营(www.21days.cn/train)其实一切都是选择的力量！努力吧，朋友！', '121.100.137.115', 1242514451000);
INSERT INTO `reply` VALUES (145, 26891, 'ann', '棋魂和钢炼堪称完美之作', '202.105.104.120', 1241289865000);
INSERT INTO `reply` VALUES (146, 40, 'nemo1873', '麻烦给我也发一份吧 nemo1873@qq.com', '221.238.108.132', 1241148477000);
INSERT INTO `reply` VALUES (147, 26609, '花园', '遗憾你在北京的时候我不知道，不然带你好好逛逛。', '123.116.118.37', 1241152328000);
INSERT INTO `reply` VALUES (148, 26891, '花园', '宅男的纪录是多少啊？提到的动漫中我最喜欢棋魂。', '123.116.118.37', 1241042667000);
INSERT INTO `reply` VALUES (149, 26887, '春天的花园', '为何每次都胆战心惊的丢了你的博客，却有惊无险的找了回来。送上迟到的生日快乐吧！[quote][b]以下为blog主人的回复：[/b] [emot]1[/emot]谢谢你的祝福,久讳了.[/quote]', '123.116.118.37', 1240960864000);
INSERT INTO `reply` VALUES (150, 22, '小小', '这个分明是狗嘛', '218.15.250.208', 1240538429000);
INSERT INTO `reply` VALUES (151, 2, 'bluesky', '佛在灵山莫远求,灵山就在汝心头.人人皆在灵山塔,何须身外去苦求?', '218.17.237.154', 1240519552000);
INSERT INTO `reply` VALUES (152, 4, 'bluesky', '哈哈 可怜的驴呀，自断脉身亡..', '218.17.237.154', 1240519260000);
INSERT INTO `reply` VALUES (153, 7, 'bluesky', '不错的故事..', '218.17.237.154', 1240518992000);
INSERT INTO `reply` VALUES (154, 10, 'bluesky', '有这种偷法！ 下次得留意这样的状况。', '218.17.237.154', 1240518603000);
INSERT INTO `reply` VALUES (155, 2249, 'bluesky', '这样的老板呀 跟我遇见的有得比 天下乌鸦一般黑..', '218.17.238.149', 1240436127000);
INSERT INTO `reply` VALUES (156, 2428, 'bluesky', '9527不错', '218.17.238.149', 1240435988000);
INSERT INTO `reply` VALUES (157, 164, 'bluesky', '好喜欢读书的人哦，以后想看什么类型的书就找你咨询吧 哈哈', '218.17.237.15', 1240263935000);
INSERT INTO `reply` VALUES (158, 158, 'bluesky', '可能是很多东西还没来得及整理记住吧 一切都太快还来不及适应', '218.17.237.15', 1240263469000);
INSERT INTO `reply` VALUES (159, 157, 'bluesky', '第一次读， 很感人..', '218.17.237.15', 1240263360000);
INSERT INTO `reply` VALUES (160, 124, 'bluesky', '不错。想必你是到境界了', '218.17.237.15', 1240261975000);
INSERT INTO `reply` VALUES (161, 84, 'bluesky', '很想读下这本书。听你介绍我想是值得读的', '218.17.237.15', 1240260197000);
INSERT INTO `reply` VALUES (162, 82, 'bluesky', '看似有道理 ', '218.17.237.15', 1240259956000);
INSERT INTO `reply` VALUES (163, 81, 'bluesky', '[quote][b]以下引用黄金甲(游客)在2006-12-31 16:31:57发表的评论:[/b] 有志青年.呵呵[/quote] 同感.. ', '218.17.237.15', 1240259241000);
INSERT INTO `reply` VALUES (164, 51, 'bluesky', '有道理', '218.17.237.15', 1240258054000);
INSERT INTO `reply` VALUES (165, 32, 'bluesky', '心态不错哦..可贵', '218.17.237.15', 1240257384000);
INSERT INTO `reply` VALUES (166, 23, 'bluesky', '凌晨两点逛书店，很想体验一下', '218.17.237.15', 1240257310000);
INSERT INTO `reply` VALUES (167, 40, 'jerom', '请博主发一份到jerom83@gmail.com多谢多谢！', '211.90.224.130', 1240286189000);
INSERT INTO `reply` VALUES (168, 40, '豆瓣同好', '望楼主不吝赐书，不胜感激！xjsk1981@163.com', '116.5.245.226', 1240275985000);
INSERT INTO `reply` VALUES (169, 186, 'ray', '呵呵，跟我一样。我也是从中学时开始写日记，不过最初是周记，后来慢慢演变成了日记。', '219.136.50.239', 1240094696000);
INSERT INTO `reply` VALUES (170, 26842, '雪乌鸦', '上次我早上进去晚上出来，已经很不耐烦了。', '59.46.56.127', 1239156600000);
INSERT INTO `reply` VALUES (171, 26852, '雪乌鸦', '学习一下，以后开电脑要慢慢打开多一点的窗口干活', '59.46.56.127', 1239156511000);
INSERT INTO `reply` VALUES (172, 212, '雪乌鸦', '外表斯文的人都有潜在暴力倾向，爆发力特强。', '59.46.56.127', 1239156151000);
INSERT INTO `reply` VALUES (173, 26863, '恭喜', 'AJAX是好东西，我也想学，可惜拉下了太多，重头起步需要时间太长了。希望你在新岗位一帆风顺。', '59.46.56.127', 1239156051000);
INSERT INTO `reply` VALUES (174, 26868, '雪乌鸦', '呵呵，人缘好是好事。', '59.46.56.127', 1239155876000);
INSERT INTO `reply` VALUES (175, 26878, '雪乌鸦', '还是人才最贵', '59.46.56.127', 1239155786000);
INSERT INTO `reply` VALUES (176, 26864, '雪乌鸦', '祝愿事业爱情双丰收，心情大爽！ :)', '218.30.110.166', 1239064836000);
INSERT INTO `reply` VALUES (177, 212, 'lzh', '嘿嘿~ 要我的话，估计会倒提着老鼠的尾巴给提溜出去吧', '218.18.113.135', 1238992325000);
INSERT INTO `reply` VALUES (178, 26864, '贝贝', '呵呵，祝你生日快乐，也祝福你愿望早日实现。', '220.231.219.196', 1238703594000);
INSERT INTO `reply` VALUES (179, 40, 'Fisher', '楼主可否辛苦下，发我一份：yyfisher@21cn.com 谢谢', '58.61.195.186', 1238610943000);
INSERT INTO `reply` VALUES (180, 26864, 'keblues', '好漂亮的生日蛋糕啊，好像有好多水果', '221.4.221.156', 1238642684000);
INSERT INTO `reply` VALUES (181, 40, '贝羽', '你好 我也是从豆瓣过来的 能给我也发一份吗 linshubin5@163.com 谢谢~~', '202.117.45.194', 1238375586000);
INSERT INTO `reply` VALUES (182, 40, 'mengshiye', '文轩兄，阁下的链接似乎有问题，已经下载不了了。望阁下不吝惠赐 偶的邮箱 yangwen0340_cn@sina.com', '117.88.184.13', 1238207132000);
INSERT INTO `reply` VALUES (183, 26863, '老吴', '你是好样的，是金子就总是会发光的。 你就是那块闪闪发光的金子！[quote][b]以下为blog主人的回复：[/b] 这顶高帽真是受之有愧。谢谢你的称赞，不会让你失望的。[/quote]', '222.125.112.206', 1238201669000);
INSERT INTO `reply` VALUES (184, 26863, 'keblues', '这也许真的是你收到的一个最好的生日礼物，同时也是让我感觉有点突然的事情。恭喜，恭喜！愿你在新的环境里收获更多。生日快乐！[quote][b]以下为blog主人的回复：[/b] 谢谢，可惜你人在珠海，否则这个生日少不了与你好好喝上一杯。[/quote]', '221.4.221.154', 1238208536000);
INSERT INTO `reply` VALUES (185, 26863, '冰冷冬季', '生日快乐!', '218.19.112.148', 1238178649000);
INSERT INTO `reply` VALUES (186, 40, '立渊', 'xjwangchina@hotmail.com 我也找了好久。 麻烦能再上传到某地址。', '58.35.204.79', 1238114608000);
INSERT INTO `reply` VALUES (187, 26821, '郢轩', '相思总是叫人苦。文轩，你也体会到了？！[quote][b]以下为blog主人的回复：[/b] 有所思总比无所思要好。[/quote]', '124.207.234.50', 1237931702000);
INSERT INTO `reply` VALUES (188, 26822, '郢轩', '希望文轩快快好起来。[quote][b]以下为blog主人的回复：[/b] 谢谢关心。[/quote]', '124.207.234.50', 1237931208000);
INSERT INTO `reply` VALUES (189, 26838, '郢轩', '我也看这部电影了，感觉故事情节极其荒诞，演员表演苍白无力。不知道是不是我老了，所以欣赏不了这种电影了。 对文轩说的情蛊很感兴趣。也许这个更适合现代人，起码可以抑制一下向方便面一样速食的爱情。让人们有些节制。[quote][b]以下为blog主人的回复：[/b] 如果不是陪着朋友看，我想我也不会看这种无聊的电影。但存在总是有价值的。不是吗？[/quote]', '124.207.234.50', 1237931081000);
INSERT INTO `reply` VALUES (190, 40, '超越左和右', '能否发给我 邮箱442648684@qq.com 不胜感激', '218.19.141.13', 1237955403000);
INSERT INTO `reply` VALUES (191, 40, '豆瓣过来', '也是今天在豆瓣看到的，麻烦博主给我发一份电子版，先行谢过了。 junguan006@sina.com', '58.17.176.228', 1237086524000);
INSERT INTO `reply` VALUES (192, 40, 'Raindog', '从豆瓣上链接过来的，麻烦楼主电邮一份给我，不胜感激！raincity.hk@gmail.com', '221.221.112.200', 1236807069000);
INSERT INTO `reply` VALUES (193, 40, '豆友', 'LZ，能发份copy吗？rayeah67@gmail.com 谢谢你呢『豆瓣寻来～』', '222.177.88.71', 1236795213000);
INSERT INTO `reply` VALUES (194, 40, '清风', '留言发了几遍都没显示。希望没有重复，请博主发封给我：lvfred@126.com，不胜感激。', '211.100.229.98', 1236829310000);
INSERT INTO `reply` VALUES (195, 40, '清风', '从豆瓣而来，链接无法下载，麻烦博主给发封邮件：lvfred@126.com，不胜感激！', '211.100.229.98', 1236829189000);
INSERT INTO `reply` VALUES (196, 40, 'beatux', '链接已经失效。求博主发一份给我谢谢！ beatux.yi@gmail.com', '160.39.213.174', 1236828984000);
INSERT INTO `reply` VALUES (197, 26822, '3D狂人', '南风天气，难免感冒；孜然一人，难免孤独；一声问候，弥足珍贵。', '59.41.168.157', 1236821158000);
INSERT INTO `reply` VALUES (198, 26822, '3D狂人', '您好，如果可以话麻烦你把《追寻》发到我邮箱可以吗？谢谢！tczb@163.com，感激不尽！愿嘤鸣以求友，敢步将伯之呼。', '59.41.168.157', 1236820884000);
INSERT INTO `reply` VALUES (199, 40, '历史爱好者', '辗转找到这，不知能否发我一份,谢谢博主。 castorhu@yahoo.cn', '58.22.120.15', 1236715539000);
INSERT INTO `reply` VALUES (200, 40, 'mark', 'markwang2008@yahoo.com.cn;谢', '58.34.6.126', 1236647258000);
INSERT INTO `reply` VALUES (201, 26810, '如郢随行', '我和你的境况几乎雷同，每天累个半死，还一事无成。同事怀孕了，那个孕妈为了下一代着想，上着半休假的班，每天来坐坐，如果有活就干，没活歇着。领导语重心长的跟我说：“你有什么杂活儿就让她干，这段时间多辛苦点”。人家是孕妇，怎么好意思让她干活，所以两个人干的活，就变成我一个人挑！！！！', '124.207.234.50', 1235422955000);
INSERT INTO `reply` VALUES (202, 40, 'xgkm', '从豆瓣上追寻而来，希望博主能抽出时间给本人发送一份，不胜感激。jinlaowu@126.com', '119.181.15.97', 1235162866000);
INSERT INTO `reply` VALUES (203, 40, '水鬼', '从豆瓣一直追到了这里,但是发现楼主的连接我这里打不开，可否给我一份电子版， 我邮箱是:mucheng777@sina.com ', '202.98.250.131', 1235094436000);
INSERT INTO `reply` VALUES (204, 40, '香草山', '一直在苦苦的找，终于找到，但是链接失效无法打开，兄台能否将徐中约《中国近代史》及史景迁《追寻现代中国》发至我的邮箱：ruanjingjun@sina.com，感激不尽！', '61.184.96.106', 1234722777000);
INSERT INTO `reply` VALUES (205, 40, '风流小民', '从豆瓣上一路追过来，发现链接无法打开。是否可以发三部书的电子版到本人邮箱polly1208n@163.com？非常感谢！', '125.77.127.97', 1234579082000);
INSERT INTO `reply` VALUES (206, 26733, '如郢随行', '只要不是夜夜笙歌，醉一次，又何妨！', '124.207.234.50', 1234039712000);
INSERT INTO `reply` VALUES (207, 40, 'i<3China', '我也要嘛。请楼主慷慨一份给我吧！ 谢谢 hihi_jennifer@hotmail.com', '38.115.166.174', 1234044011000);
INSERT INTO `reply` VALUES (208, 40, 'I<3China', '我也要嘛。 请楼主慷慨一份给我吧！ 谢谢 hihi_jennifer@hotmail.com', '38.115.166.174', 1234043932000);
INSERT INTO `reply` VALUES (209, 40, 'alie', '好像打不开了，谢谢博主，发我一份吧qw0629@163.com', '222.66.117.10', 1233787465000);
INSERT INTO `reply` VALUES (210, 40, 'didi', '望楼主不吝赐书,请发给我一份吧，谢谢了 zhouyidi@hotmail.com', '78.86.32.250', 1233792846000);
INSERT INTO `reply` VALUES (211, 40, '我我我我', '你好 我找这三本书很久了 能否寄一份给我,我的邮箱是zealken@126.com 先谢谢了', '58.219.129.89', 1233718707000);
INSERT INTO `reply` VALUES (212, 40, 'zealken', '你好！～ 我找这本书很久了 能否寄一份给我，我的邮箱是zealken@126.com 先谢谢了！！！！', '58.219.129.89', 1233718488000);
INSERT INTO `reply` VALUES (213, 38, '穆奇诺', '楼主新年好！特地前来，希望能得到一份《中国近代史》的电子版，谢谢！ 我的邮箱：nanwan106@yahoo.com.cn', '220.169.252.92', 1233345364000);
INSERT INTO `reply` VALUES (214, 38, '穆奇诺', '楼主新年好！特地前来，希望能得到一份《中国近代史》的电子版，谢谢！ 我的邮箱：nanwan106@yahoo.com.cn', '220.169.252.92', 1233345267000);
INSERT INTO `reply` VALUES (215, 40, '豆豆', '能否发我一份kanwoqishierbian@hotmail.com。万分感谢！', '60.208.211.223', 1232565062000);
INSERT INTO `reply` VALUES (216, 40, 'glassheart1986', '文轩先生好，后生小子因寻《追寻现代中国一书》，冒昧打扰，但求明智，先生若方便，恳请先生赐书，不甚感激，并致春祺，叩。zxh860901@126.com,qq:102629329', '219.153.131.99', 1231781007000);
INSERT INTO `reply` VALUES (217, 40, 'glassheart', '文轩先生好，后生晚学苦寻《追寻现代中国》一书，冒昧叨扰，只为求知，恳请先生不吝赐书，并致春祺~zxh860901@126.com', '219.153.131.99', 1231780470000);
INSERT INTO `reply` VALUES (218, 40, 'Zack', '我在大陆买不到全套。多打算去香港买了。请博主发一份给我吧。谢谢了。邮箱：zackzengjia@yahoo.com.cn', '222.240.67.22', 1230691016000);
INSERT INTO `reply` VALUES (219, 40, 'Zack', '博主好。我在网上找了半天，都决定要去香港或者台湾买了。如果方便的话，请您发一份给我吧，万分感谢！ 邮箱：zackzengjia@yahoo.com.cn', '222.240.67.22', 1230690010000);
INSERT INTO `reply` VALUES (220, 40, '天涯', '这套书我追寻已久，请博主给我发一份，不胜感激！godjian2008@163.com', '59.38.32.6', 1230423894000);
INSERT INTO `reply` VALUES (221, 40, 'Hector', '望楼主不吝赐书，不胜感激！hector@pt-newpower.com', '220.161.175.221', 1229887189000);
INSERT INTO `reply` VALUES (222, 40, '妙mm', '望楼主不吝赐书，不胜感激！wjie12345@tom.com', '218.200.118.202', 1229568278000);
INSERT INTO `reply` VALUES (223, 40, '妙mm', '望楼主不吝赐书，不胜感激！wjie12345@tom.com', '218.200.118.202', 1229565065000);
INSERT INTO `reply` VALUES (224, 26694, '纠集', '兄弟，您所做的《追寻现代中国》3本书的电子版，堪称楷模。但当初所留的地址，现在已无法进入，可否再次告知新的地址，或者传到我的邮箱shrjslm@163.com 谢谢！', '222.66.124.206', 1229314790000);
INSERT INTO `reply` VALUES (225, 26694, 'Rola', '\"负心多是读书人\"你读的书多,你是不是负心人啊??哈', '116.24.202.129', 1229105986000);
INSERT INTO `reply` VALUES (226, 26691, '冰冷冬季', '记住告诉我!我帮你拿!! ', '219.137.155.19', 1228970255000);
INSERT INTO `reply` VALUES (227, 26689, 'ROLA', '哇!!佩服你!!佩服得五体投地!', '58.61.63.172', 1228859529000);
INSERT INTO `reply` VALUES (228, 26689, '冰冷冬季', '高人!几时教下我用SQL咯!我怎么才可以知道SQL语句的性能的好坏! ', '219.136.44.37', 1228855608000);
INSERT INTO `reply` VALUES (229, 26689, '雪乌鸦', '想讲一句：那乃。', '59.46.8.151', 1228842913000);
INSERT INTO `reply` VALUES (230, 26686, 'rola', '你有几招会用的啊?不会全用上的吧??!!~', '121.35.60.32', 1228687941000);
INSERT INTO `reply` VALUES (231, 38, '可可', '楼主如果方便的话能否发我一份，我一直都非常想拜读下徐中约先生中国近代史的港版译本 实在感谢！ babyday@163.com', '124.77.202.185', 1228588762000);
INSERT INTO `reply` VALUES (232, 40, '海宴河清', '网页打不开！也能请您发一份到我的信箱吗？wmay@sohu.com 谢谢！', '88.74.176.119', 1228185188000);
INSERT INTO `reply` VALUES (233, 40, 'Momo', '从豆瓣追至此处，可惜无法下载。博主能给发一份到我邮箱吗。 xixi-mianmian@163.com 在大陆看到禁书真难。。。。 非常感谢！', '221.8.30.181', 1226545396000);
INSERT INTO `reply` VALUES (234, 40, 'Momo', '从豆瓣追至此处，可惜无法下载。博主能给发一份到我邮箱吗。 xixi-mianmian@163.com 在大陆看到禁书真难。。。。 非常感谢！', '221.8.30.181', 1226545251000);
INSERT INTO `reply` VALUES (235, 40, 'MOMO', '也是从豆瓣追过来的。可惜没办法下载。因为不能在大陆出版，我们错过了多少好书呢。 xixi-mianmian@163.com 博主能发一份完整版的到我邮箱吗。不胜感谢！', '221.8.30.181', 1226544900000);
INSERT INTO `reply` VALUES (236, 26634, '雪乌鸦', '发张你的新PP看看长还是短', '59.46.9.126', 1226518767000);
INSERT INTO `reply` VALUES (237, 40, '谷子', '好人楼主。我搜索这个好久了都找不到，please。给我发一个吧，谢谢：gaochu11@hotmail.com 万分感谢', '218.107.131.146', 1226284995000);
INSERT INTO `reply` VALUES (238, 40, '小小', 'wbj369@gmail.com', '123.115.178.182', 1226283843000);
INSERT INTO `reply` VALUES (239, 40, '小小', '豆瓣过来，wbj369@gmail.com', '123.115.178.182', 1226283724000);
INSERT INTO `reply` VALUES (240, 40, '感谢', '手头只有阉割版，可以传一份吗？感谢楼主。tonyjean@126.com', '58.132.128.2', 1226272727000);
INSERT INTO `reply` VALUES (241, 40, 'douban', '从豆瓣慕名而来，发一份吧，谢谢！ changsha_2001@126.com', '222.244.86.19', 1226289890000);
INSERT INTO `reply` VALUES (242, 40, 'doubaner', '从豆瓣慕名而来，发一份吧，谢谢！ changsha_2001@126.com', '222.244.86.19', 1226289827000);
INSERT INTO `reply` VALUES (243, 40, '海滨', '能否发给我一份，wuhaibing_hyit@yahoo.com.cn,谢谢', '61.160.19.34', 1226190310000);
INSERT INTO `reply` VALUES (244, 40, '夜思', '我是从豆瓣来的，能不能将此书和《中国近代史》发邮件给我：shanshangyezi@163.com', '218.204.230.226', 1226190291000);
INSERT INTO `reply` VALUES (245, 40, '我本善良', '我也是豆瓣追过来的 能否赐予一本 不胜感激 www.80yahoo.cn@gmail.com', '124.134.19.26', 1226171597000);
INSERT INTO `reply` VALUES (246, 40, '我本善良', '我也是豆瓣追过来的 能否赐予一本 不胜感激 www.80yahoo.cn@gmail.com', '124.134.19.26', 1226171518000);
INSERT INTO `reply` VALUES (247, 38, 'dingxiaofei', '跪求 万分感谢 向往已久 dingxiaofei2008@163.com', '123.123.157.218', 1225673327000);
INSERT INTO `reply` VALUES (248, 40, '余海', '请发一份至mlez@live.cn，十分感谢您！', '60.161.14.61', 1225045016000);
INSERT INTO `reply` VALUES (249, 40, 'anhao', '豆瓣找来的 请发我一份 不胜感激 anhao8418@hotmail.com', '60.167.246.123', 1224967561000);
INSERT INTO `reply` VALUES (250, 40, 'anhao', '豆瓣而来 请文轩兄发我一份 谢谢 anhao8418@hotmail.com', '60.167.246.123', 1224967455000);
INSERT INTO `reply` VALUES (251, 26628, 'rola', '把人忽悠上贼船，只要自己出了单拿了提成!~~sales 也要混饭吃的啊！！', '119.122.137.13', 1224731628000);
INSERT INTO `reply` VALUES (252, 40, 'wavesong', '从豆瓣上追寻而来,无法下载，能否发我一份。 谢谢 songyubo@seu.edu.cn', '58.213.113.77', 1223952748000);
INSERT INTO `reply` VALUES (253, 40, '范磊1966', '兄弟能否将《追寻现代中国》邮一份给我：masfss@sina.com 十万分感谢！', '211.141.223.25', 1223699685000);
INSERT INTO `reply` VALUES (254, 174, 'ROLA', '我也下载来听听', '121.15.121.179', 1223610343000);
INSERT INTO `reply` VALUES (255, 40, 'smaxii', '从豆瓣一直追到这里，博主能否发一份给我，多谢了 smaxii@163.com', '119.39.10.120', 1222891743000);
INSERT INTO `reply` VALUES (256, 40, 'gawa', '文章中的地址不能点开和下载，万分焦急。文轩先生能否电邮一份，感谢。gawafio@126.com', '218.80.194.162', 1222316780000);
INSERT INTO `reply` VALUES (257, 40, '豆瓣同好', '能否给我邮一份 todo.dz@gmail.com 谢谢', '125.64.74.80', 1222226266000);
INSERT INTO `reply` VALUES (258, 40, '麦兜', '搜了半天都没下到完整版的，谢谢博主，发我一份吧 angela_zhang_321@126.com', '58.37.193.53', 1222025073000);
INSERT INTO `reply` VALUES (259, 40, '豆瓣同好', '豆瓣同好，谢谢赠书 xiaolong_dd@yahoo.com.cn', '60.30.96.77', 1221412790000);
INSERT INTO `reply` VALUES (260, 26608, '雪乌鸦', '我想看老胡同、四合院、在街边看老北京互侃、吃好吃的名小吃，其他的没什么兴趣，呵呵。', '59.46.113.229', 1221358101000);
INSERT INTO `reply` VALUES (261, 40, '感谢', '望楼主不吝赐书，不胜感激！zhaojunjiejie4@126.com', '60.208.232.166', 1221334624000);
INSERT INTO `reply` VALUES (262, 26603, '雪乌鸦', '人在北京了？拍点照片回来看看，分享一下。', '118.24.206.203', 1221083476000);
INSERT INTO `reply` VALUES (263, 26602, '雪乌鸦', '呵呵，果然重情。', '118.24.206.203', 1221083371000);
INSERT INTO `reply` VALUES (264, 40, '感谢，期待中', '手头只有阉割版，可以传一份吗？感谢楼主。81855282@163.com', '123.233.117.225', 1220500549000);
INSERT INTO `reply` VALUES (265, 40, '感谢', '从豆瓣上追寻而来，希望博主能抽出时间给本人发送一份，不胜感激。beyondwll1126@163.com', '58.62.223.92', 1220493927000);
INSERT INTO `reply` VALUES (266, 26590, 'teenspi', '如果经济上允许想这样做就去做吧。呵呵。（坏坏的笑）。以前得到徐中约《中国近代史》电子本就是你传给我的。谢谢哈。', '121.228.59.152', 1220324720000);
INSERT INTO `reply` VALUES (267, 40, '感谢', '楼主能否也分享一份给我，也是从豆瓣上来的，谢谢zh99105381@sina.com', '58.246.93.194', 1219857319000);
INSERT INTO `reply` VALUES (268, 26599, 'yaoship', '不是怀疑楼主的痴情，只是人会越来越成熟，时间也会带走一切，或许不用很久，楼主回忆起这段往事，会轻轻一笑，感谢对方给自己的生命留下如此纯洁美好的烙印。 走进婚姻的爱情只会同时走进庸俗，纯纯的爱情只能是失败的爱情，你应该庆幸你遇上了，经历过了。 完美只留在自己的想像中，楼主也不用太痛苦了。从心理学来说，或许你只是不想承认自己的失败而已！', '219.133.105.236', 1219709840000);
INSERT INTO `reply` VALUES (269, 26599, '如郢随行', '可以把我的忘情水分你半杯。', '124.207.234.50', 1219692703000);
INSERT INTO `reply` VALUES (270, 26583, '如郢随行', '为什么受伤的总是你！', '221.218.128.47', 1219545456000);
INSERT INTO `reply` VALUES (271, 26590, '如郢随行', '去北海吧！', '221.218.128.47', 1219545296000);
INSERT INTO `reply` VALUES (272, 26590, '白色的草', '那种地方有强盗的.', '218.94.246.217', 1219358809000);
INSERT INTO `reply` VALUES (273, 26580, '冰冷冬季', '看着时间一天天过,自己一天天的老,身边的人一天天的离开!心里不由得想到自己要更坚强的生活下去!', '218.107.1.243', 1219177024000);
INSERT INTO `reply` VALUES (274, 26583, 'rola', '她会看得到你的这些话语吗？ 相信她会原谅你的．', '121.35.60.135', 1219096912000);
INSERT INTO `reply` VALUES (275, 26590, 'rola', '这样的生活是让人向往的,但不会无聊吗?哈哈', '121.35.60.135', 1219096784000);
INSERT INTO `reply` VALUES (276, 40, '村正', '也是从豆瓣上追寻而来的，发现这本书好像是外国人认识中国的入门材料之类的~希望博主百忙之中赐书，不胜感激！tuye1234@hotmail.com', '60.186.232.102', 1218740080000);
INSERT INTO `reply` VALUES (277, 26584, 'Qzi', '很有道理的说...', '116.5.182.106', 1218649406000);
INSERT INTO `reply` VALUES (278, 38, 'GAGBI618', '给小弟也发一个吧 gangbi618@gmail.com', '219.150.222.26', 1218496001000);
INSERT INTO `reply` VALUES (279, 198, 'rola', '你看了好多书喔！！', '121.35.178.38', 1218506502000);
INSERT INTO `reply` VALUES (280, 26577, 'Rola', '你真的去寻找她了？一种蒙蒙的美', '121.35.178.38', 1218506395000);
INSERT INTO `reply` VALUES (281, 26577, 'Rola', '呵,看你的文章很有意思.[quote][b]以下为blog主人的回复：[/b] 从失意人文章里看出得意来，你也未免太残忍了一点。[/quote]', '121.35.178.38', 1218506322000);
INSERT INTO `reply` VALUES (282, 40, '追寻现代中国', '从豆瓣上一路追过来，发现链接无法打开。是否可以发三部书的电子版到本人邮箱ailiqun@126.com？非常感谢！', '61.144.22.123', 1218391756000);
INSERT INTO `reply` VALUES (283, 26577, '冰冷冬季', '让对方冷静一段时间再说吧!!你自己跟她解释只能火上加油!让你身边的人帮你去帮你解说吧!可能效果会好很多的!', '58.248.125.187', 1218308630000);
INSERT INTO `reply` VALUES (284, 26572, '冰冷冬季', '如果想别人喜欢你,先要别人去了解你!让她融入你的生活圈子,认识你身边的人,那样她才能更好的认识你,喜欢你!!', '58.248.125.187', 1218307889000);
INSERT INTO `reply` VALUES (285, 40, '阿小', '我的邮箱是 garfieldxx@gmail.com 可以的话能给我也发一份吗？非常感激。还有请问楼主，原本是用英文还是中文写的？ 谢谢回复。^^ 小。', '219.237.180.88', 1218160558000);
INSERT INTO `reply` VALUES (286, 26572, '雪乌鸦', '没回应？上门去看看？', '59.46.115.77', 1218171052000);
INSERT INTO `reply` VALUES (287, 26565, '雪乌鸦', '这个，阿拉也经历过~', '59.46.115.77', 1218164827000);
INSERT INTO `reply` VALUES (288, 26562, '雪乌鸦', '嗯...唉...', '59.46.115.77', 1218164743000);
INSERT INTO `reply` VALUES (289, 26378, 'yaoship', '《连城诀》在武侠小说里很是另类，看完了总觉得金庸在写该书时心情一定很不好，对世界很悲观，不过真实的世界往往都是如此的', '219.133.105.236', 1217877721000);
INSERT INTO `reply` VALUES (290, 40, 'tempan', '下不了，楼主能否邮一份，感谢 yaowin@139.com', '219.133.105.236', 1217361171000);
INSERT INTO `reply` VALUES (291, 40, 'aduan', '麻烦文轩兄给我邮一份，不胜感激。 hyr_bupt@263.net', '219.142.69.34', 1216922215000);
INSERT INTO `reply` VALUES (292, 40, '三十年以后才明白', '一路从豆瓣追来，麻烦兄台给我也邮一份，不胜感激。 szdxbldc1985@yahoo.cn', '220.195.76.171', 1216834075000);
INSERT INTO `reply` VALUES (293, 40, '昏昏', '兄台日前上传的电子书地址已失效 故此留言扰烦 若能email分享该书 余将不胜感激 zzxandrew@gmail.com', '211.158.85.188', 1215129293000);
INSERT INTO `reply` VALUES (294, 40, '天蝎小猪', '我也是豆瓣追过来的 能否赐予一本 不胜感激 115676413@qq.com （欢迎交流哦）', '221.131.80.238', 1214967956000);
INSERT INTO `reply` VALUES (295, 1364, 'hellofiona', '太可爱了，看的时候一直在想你写的时候是什么表情。', '124.207.234.50', 1214598786000);
INSERT INTO `reply` VALUES (296, 24433, '雪乌鸦', '正在看，看完再探讨下。', '116.21.160.223', 1214106421000);
INSERT INTO `reply` VALUES (297, 40, 'hifha', '我也想要一份 liang198109@126.com', '219.141.236.162', 1214082720000);
INSERT INTO `reply` VALUES (298, 26378, 'peterlee', '今次的好書不是很多。[emot]1[/emot]', '218.18.20.210', 1214010095000);
INSERT INTO `reply` VALUES (299, 26378, '雪乌鸦', '没其他书了？[emot]27[/emot]', '116.23.28.95', 1214008367000);
INSERT INTO `reply` VALUES (300, 350, '雪乌鸦', '散步狂人[emot]27[/emot]', '116.21.167.106', 1213148594000);
INSERT INTO `reply` VALUES (301, 547, '雪乌鸦', '这样的会我也想去听听，长长见识。', '116.21.167.106', 1213148461000);
INSERT INTO `reply` VALUES (302, 24429, 'EF', '实际毛泽东的独裁有中国皇权文化的根子，如果中国当时的市民社会和商业文化能占据主流话语权的话，应该独裁的弊病也就不会留下那么深刻的问题了', '221.239.34.194', 1212427448000);
INSERT INTO `reply` VALUES (303, 40, '狮子', '留下电邮 yyymyc@yahoo.com.cn 先谢谢您了。此功德无量之事。', '222.84.10.29', 1212091082000);
INSERT INTO `reply` VALUES (304, 40, 'peterlee', '己经邮出，请各位查收。[emot]1[/emot]', '119.145.2.17', 1211766093000);
INSERT INTO `reply` VALUES (305, 40, '追寻现代中国', '哦！刚才细看把邮箱打错了！不好意思 haishen315@163.com 谢谢！', '61.186.110.49', 1211741097000);
INSERT INTO `reply` VALUES (306, 40, 'Re:追寻现代中国', '大家都到这里了哦！ 来自豆瓣，请赐予一份 haishen163.com 谢谢文兄！ ', '61.186.110.49', 1211741010000);
INSERT INTO `reply` VALUES (307, 40, 'level1221', '来自豆瓣,拜托急需. eguang50@163.com', '123.4.242.189', 1211424423000);
INSERT INTO `reply` VALUES (308, 40, 'maggi007', '从豆瓣来的,请发一份给我可否？maggi-007@163.com', '59.60.113.206', 1211315280000);
INSERT INTO `reply` VALUES (309, 244, 'qhjbeqm', '代开北京机打发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1210969484000);
INSERT INTO `reply` VALUES (310, 26127, '对', '数十万只蟾蜍迁徙引居民担忧http://www.sina.com.cn 2008年05月10日03:40 四川在线-华西都市报 　　日前，绵竹市西南镇檀木村出现了大规模的蟾蜍迁徙：数十万只大小蟾蜍浩浩荡荡地在一制药厂附近的公路上行走，很多被过往车辆压死，被行人踩死。大量出现的蟾蜍，使一些村民认为会有不好的兆头出现。当地林业部门对此解释说，这是蟾蜍正常的迁徙，并对大量蟾蜍的产生做了科学的解释。 　　蟾蜍成群过马路 　　吓得路人绕道走 　　“太多了，太吓人了，一群一群的，它们‘携妻带子’，就像赶集一样热闹，”绵竹市西南镇檀木村的周大姐说，“早上天蒙蒙亮，我一早去赶集买东西，出门不远，就看到有蟾蜍在路上慢悠悠的走着，搞得我的脚都不敢往地上放。最后，我只好绕道上街。中午我回家的时候，看到这里只有少许蟾蜍在爬行，由于有车子路过，已经有很多蟾蜍葬身车轮下了。” 　　蟾蜍集中出现的地方在绵竹市西南镇檀木村，旁边是某制药厂厂房。家住制药厂旁边的刘先生说，他看到黑压压一片蟾蜍，在地上爬行，“那时已经被车和行人压死、踩死很多，血淋淋的躺在地上。过去，我们这里从来没有出现过这种情况。” 　　是“天灾预兆”？ 　　林业专家现场释疑 　　“这种现象是不是啥子天灾的预兆哟？”许多村民表示了担忧。消息不胫而走，引起人们不安和忧虑。 　　绵竹市林业局接到报告后，很快赶到了事发当地。专家在现场看见，密密麻麻的蟾蜍布满了村道，蟾蜍聚集面积大约有二十亩，分布在制药厂周围农民的菜园、空地里；而某制药厂后面的那条排水沟流出的水，水温略高于其他水沟，这里的蟾蜍也最多。 　　据绵竹市林业局局长舒实说，这里处于农田的低洼地段，很适合蟾蜍生存，现在正是蟾蜍繁殖季节，连续两天的降雨加上排水沟水温略高，非常适合蟾蜍产卵和孵化，在孵化时间集中、孵化率高的情况下就会爆发大量幼蟾集体上岸迁移，这种情况是正常现象，与老百姓所说的天灾毫无关系；蟾蜍也不会影响到人们的生活，它们的到来还会为当地减少蚊虫，村民不用为此担忧。 　　德阳市林业局野保处工作人员介绍，蟾蜍俗称蛤蟆，前身是蝌蚪，在呼吸器官完成由鳃到肺的蜕变后，它们的生活空间', '219.130.93.49', 1210791278000);
INSERT INTO `reply` VALUES (311, 38, 'pooh', '抱歉,刚才邮箱打错 pooh19841231@yahoo.com.cn', '58.213.236.65', 1210641313000);
INSERT INTO `reply` VALUES (312, 38, 'pooh', '麻烦楼主给我发一份可以吗. 我目前也没有能力通过谁去香港买. 非常感谢!! pooh19841231@yaho.com.cn', '58.213.236.65', 1210641253000);
INSERT INTO `reply` VALUES (313, 38, 'wan', '给我一份吧，wanhao12111@tom.com.谢谢', '222.79.245.82', 1210369543000);
INSERT INTO `reply` VALUES (314, 40, 'hsuchin', '大家都是从豆瓣来的啊，我也是，请也给我一份，谢谢！！！ hsuchinxq@gmail.com', '218.94.60.10', 1210308883000);
INSERT INTO `reply` VALUES (315, 25380, '路', ' 去看看这个人的，你们口味相似，真是没救了。 http://hi.baidu.com/yiren9566', '124.129.1.202', 1210017742000);
INSERT INTO `reply` VALUES (316, 38, 'wyz404', '给我一份吧《中国近代史》《追寻现代中国》wyz404@sina.com', '121.56.159.124', 1209682316000);
INSERT INTO `reply` VALUES (317, 244, 'wgrgfhkt', '代开北京机打发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1209431826000);
INSERT INTO `reply` VALUES (318, 38, '谢谢', '麻烦您给我发一份吧 谢谢 rong731230@sina.com.cn', '60.16.134.150', 1209266995000);
INSERT INTO `reply` VALUES (319, 38, 'iwon', '寻求已久，麻烦发给我一份，非常感谢！ iwon7@126.com', '220.181.38.252', 1209082098000);
INSERT INTO `reply` VALUES (320, 38, '解放中国', 'caremoon@126.com 谢谢来一份', '122.225.6.146', 1209087365000);
INSERT INTO `reply` VALUES (321, 38, 'cheung', '麻烦给我发一份啊 谢谢 frank7695@163.com', '124.114.143.186', 1208918493000);
INSERT INTO `reply` VALUES (322, 38, 'hzhp1', '请楼主给我一份，好吗？Great Thanks！ hzhp1@126.com', '218.108.45.205', 1208915702000);
INSERT INTO `reply` VALUES (323, 38, 'alexs', '请楼主给我一份，好吗？谢谢！ alexswang@163.com', '59.52.74.62', 1208806686000);
INSERT INTO `reply` VALUES (324, 38, 'mm', '请楼主给我一份，好吗？谢谢！ nuan__er@163.com', '61.177.195.70', 1208832279000);
INSERT INTO `reply` VALUES (325, 244, 'mofbyvk', '北京海淀办证1３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1208625159000);
INSERT INTO `reply` VALUES (326, 38, 'hs', '请楼主给我一份，好吗？谢谢！ mindartist@gmail.com', '221.234.46.15', 1208566039000);
INSERT INTO `reply` VALUES (327, 244, 'movjgoh', '北京刻章办证1３３９１９８７５５８代售印花税票机打发票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1208540432000);
INSERT INTO `reply` VALUES (328, 40, 'hydrlily', '能否赐稿？ hydrlily@126.com', '219.239.199.178', 1208486662000);
INSERT INTO `reply` VALUES (329, 40, 'yoyoli007', '想看看不同内容的历史书，但是发现连接打不开，可否给我一份电子版，我邮箱是: . yoyoli007@163.com', '58.19.119.242', 1208134395000);
INSERT INTO `reply` VALUES (330, 38, 'yoyoli007', '请给我一份好吗?我特别喜欢,多谢了!邮箱: yoyoli007@163.com', '58.19.119.242', 1208134015000);
INSERT INTO `reply` VALUES (331, 38, 'werockyou', '请给我一份好吗?我特别喜欢,多谢了!邮箱: liuhua7788@yahoo.cn', '219.159.69.51', 1208020184000);
INSERT INTO `reply` VALUES (332, 38, 'rockyou', '请楼主给我一份，好吗？谢谢！ werockyou@163.com', '219.159.69.51', 1208020033000);
INSERT INTO `reply` VALUES (333, 244, 'jqrlsi', '中国验厂网提供验厂咨询,验厂辅导\r\n中国验厂网,中国验厂咨询/认证培训第一品牌，辅导社会责任验厂、人权验厂、品质验厂、反恐验厂咨询和验厂培训， 专业的辅导，让你轻松、顺利跨过外贸接单的门槛！\r\n\r\n所经营项目:客户验厂咨询辅导服务及体系认证咨询辅导服务\r\n1 COC验厂咨询辅导服务(中国验厂网提供验厂咨询,验厂辅导,disney验厂咨询/迪士尼验厂咨询/迪斯尼验厂咨询,wal mart验厂咨询/沃尔玛验厂咨询,可口可乐验厂咨询....等)；\r\n2 社会责任咨询辅导服务（SA8000）；\r\n3 防恐验厂咨询辅导服务（C-TPAT）；\r\n4 质量体系咨询辅导服务（ISO9000）；\r\n中国验厂网-中国验厂咨询第一品牌\r\n网址：http://www.sa8000cn.cn', '220.234.88.189', 1207960999000);
INSERT INTO `reply` VALUES (334, 40, '英子', '偶也是从豆瓣过来的，可否发给我一份： dolphinmcy@163.com 非常感谢！', '221.218.188.38', 1207945205000);
INSERT INTO `reply` VALUES (335, 244, 'hgrfvi', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1207852722000);
INSERT INTO `reply` VALUES (336, 244, 'uojkgfkv', 'sgs验厂咨询,教企业如何走出验厂困境\r\n验厂是欧美销售商为增强本地广大消费者的消费信心，降低消费风险而根据供应商所属国的有关法律法规内容，对供应商的生产过程，现场生产安全及遵守与执行所属国有关法律、法规情况进行全面评诂的活动。验厂对我们生产或制造商来说意义重大。验厂结果的“好”、“坏”将直接影响到销售商对我们的下单信心或下单的数量。也就是说将直接影响我们企业的生存和每位员工的切身利益。\r\n\r\n中国验厂网,中国验厂咨询/认证培训第一品牌的宗旨是制订出付合工厂实际情况的验厂服务，帮助工厂通过验厂，拿到订单。\r\n中国验厂网-中国验厂咨询第一品牌\r\n网址：http://www.sa8000cn.cn', '220.234.88.189', 1207847954000);
INSERT INTO `reply` VALUES (337, 244, 'gmdugl', '北京海淀办证1３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1207770624000);
INSERT INTO `reply` VALUES (338, 38, 'pengjlaw', '请楼主给我一份，好吗？谢谢！pengjlaw@hotmail.com', '219.133.105.225', 1207682763000);
INSERT INTO `reply` VALUES (339, 244, 'jxvxbd', 'sgs验厂咨询,教企业如何走出验厂困境\r\n验厂是欧美销售商为增强本地广大消费者的消费信心，降低消费风险而根据供应商所属国的有关法律法规内容，对供应商的生产过程，现场生产安全及遵守与执行所属国有关法律、法规情况进行全面评诂的活动。验厂对我们生产或制造商来说意义重大。验厂结果的“好”、“坏”将直接影响到销售商对我们的下单信心或下单的数量。也就是说将直接影响我们企业的生存和每位员工的切身利益。\r\n\r\n中国验厂网,中国验厂咨询/认证培训第一品牌的宗旨是制订出付合工厂实际情况的验厂服务，帮助工厂通过验厂，拿到订单。\r\n中国验厂网-中国验厂咨询第一品牌\r\n网址：http://www.sa8000cn.cn', '220.234.88.189', 1207694002000);
INSERT INTO `reply` VALUES (340, 38, '123', '支持！ 我也想要一份 麻烦楼主了 1986zxt@163.com 万分感谢！！', '58.34.97.187', 1207590879000);
INSERT INTO `reply` VALUES (341, 244, 'fhmiuciay', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1207338349000);
INSERT INTO `reply` VALUES (342, 244, 'uneiadnx', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1207368271000);
INSERT INTO `reply` VALUES (343, 38, '酒剑琴书', '楼主方便的话~也给我一份 lizhedemail@163.com', '218.107.132.126', 1207276102000);
INSERT INTO `reply` VALUES (344, 244, 'wkxdpwve', '中国验厂网,中国验厂咨询/认证培训第一品牌，是目前国内最为专业性验厂咨询（顾问）机构之一。提供coc验厂咨询的重要性，我们协助企业通过国外客户coc验厂或公证行（如ITS，SGS，CSCC，BVQI，TUV，DNV，CSQA，MTL）验厂，确保工厂顺利接单和出货。\r\n中国验厂网-中国验厂咨询第一品牌\r\n网址：http://www.sa8000cn.cn', '220.234.88.189', 1207099309000);
INSERT INTO `reply` VALUES (345, 244, 'bbfnbnwps', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1207096500000);
INSERT INTO `reply` VALUES (346, 244, 'lvaxovx', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1207002773000);
INSERT INTO `reply` VALUES (347, 38, 'george', '我的邮箱 reeves_anyou@citiz.net 谢谢', '58.37.1.179', 1206732184000);
INSERT INTO `reply` VALUES (348, 244, 'cueqlkouq', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京办证北京机打发票电话１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1206570195000);
INSERT INTO `reply` VALUES (349, 40, '风一样的人', '您好,能不能将此书和《追寻现代中国》《中国近代史》邮件给我：zxd7232@yahoo.com.cn 谢谢赐教.', '220.172.53.91', 1206562330000);
INSERT INTO `reply` VALUES (350, 40, 'daydream', '由豆瓣而來，呵呵，能不能也給我一份：） gzdaydream@126.com 謝謝：》', '116.21.183.88', 1206418028000);
INSERT INTO `reply` VALUES (351, 40, '五味子', '我也是豆瓣追来的，能否给我发一份： wangjie13@gmail.com 谢谢！', '61.51.168.15', 1206308407000);
INSERT INTO `reply` VALUES (352, 38, 'oliver', '麻烦给我寄一份。谢谢。oliveryu@tom.com', '59.37.58.67', 1206292919000);
INSERT INTO `reply` VALUES (353, 244, 'idhhpj', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1206309393000);
INSERT INTO `reply` VALUES (354, 38, 'rosegirl', '请给我一份好吗?我特别喜欢,多谢了!邮箱:qqr_9481@sina.com', '60.17.166.177', 1206238343000);
INSERT INTO `reply` VALUES (355, 244, 'febcpe', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1206217963000);
INSERT INTO `reply` VALUES (356, 244, 'katvgc', '中国验厂网,中国验厂咨询/认证培训第一品牌\r\n\r\n总部设在上海，服务地区覆盖南京、无锡、扬州、杭州、宁波、绍兴、海宁、义乌等江浙沪地区及山东，北京，天津，安徽等地区，有着最完善的服务网络，有近百名各类资深专家正活跃在全国各地为不同客户提供认证培训，验厂咨询，验厂培训，认证咨询，认证辅导服务，是目前国内最为专业性验厂咨询（顾问）机构之一。\r\n\r\n所经营项目：\r\n一、体系认证咨询：\r\nISO20000、ISO14001、ISO/TS16949、ISO9001、SA8000、ICTI、WRAP、ETI、BSCI/AVE、C-TPAT。\r\n二、专题培训项目：\r\n长期顾问服务、企业管理培训、企业验厂辅导。\r\n三、客户验厂咨询服务：\r\n目前从事:沃尔玛验厂、disney验厂等COC客户验厂的专业化辅导,咨询和培训\r\n中国验厂网-中国验厂咨询第一品牌\r\n网址：http://www.sa8000cn.cn', '220.234.88.189', 1206216296000);
INSERT INTO `reply` VALUES (357, 244, 'alxdsydgw', '意大利：康宁克通针（40mg）\r\n\r\n■中文通用名：曲安奈德针、曲安缩松针\r\n■英文通用名：Briamcinolone\r\n■中文商品名：康宁克通－A\r\n■国外商品名：KENACORT-A\r\n\r\n■“曲安缩松针”使用说明：\r\n■“曲安缩松”注射剂每毫升中含Triamcinolone Acetonide 40mg，是一种消炎作用强之合成皮肤类固醇，其疗效持续甚久，每次肌注40mg-80mg后平均可长达20~30天，本品作局部注射时，亦呈持久之疗效，疼痛与肿胀之缓减通常於 注射后数小时内奏效。并可持续数周之久。\r\n■适应症：凡全身性类固醇适用之诸疾如遇敏，皮肤病，全身性风湿关节炎和其他结缔性组织疾病，本品均有疗效。且对不能口服之病例尤为有用。本品亦可作关节内之局部注射，以消除发炎，并使疼痛，肿胀或僵硬感觉独得缓解。当治理全身性关节病时，本品宜与其他惯用疗法结合应用。对局部病疾，祗需局部关节注射。\r\n剂 量：本品祗供肌肉注射。\r\n■成人初用剂量为40mg~80mg，视病情而定。\r\n■局部关节注射时，治疗风湿关节炎用2.5mg~15mg，视病情及患部大小而定.有些病人经注射1或2针后完全痊愈，有些则需每隔一段时间重复使用，治疗之频率以发病之快慢为主而定期给药。\r\n■用法：\r\n■本品不得作静胝注射，祗供肌注，用前摇匀液体。\r\n■本品作全身性治疗时，宜注入臀部之肌肉。\r\n■本品作局部治疗时，如有必要，可先局部麻醉周围之软组织。\r\n■本品作神经节治疗时，可直接注入囊腔内。\r\n■厂家：意大利里沙化马大药厂\r\n■规格：40m/瓶； 50瓶/1打； 500瓶/件；\r\n■【福建省闽南药业发展公司】货到付款\r\n网址：www.ujifm.cn\r\n■QQ：346789868．\r\n■电话：0591-87636953．\r\n■短信平台: 13859003899\r\n■E-mail：kgmt@tom.com\r\n福建省闽南药业发展公司\r\n网址：http://www.ujifm.cn', '117.26.208.226', 1206213613000);
INSERT INTO `reply` VALUES (358, 244, 'qhyhdkr', '北京发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1206119710000);
INSERT INTO `reply` VALUES (359, 244, 'ibulsw', '北京机打发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1206034959000);
INSERT INTO `reply` VALUES (360, 38, 'hoho', 'talkwithme76@hotmail.com 麻烦也给我一份吧 谢谢', '222.45.87.202', 1205983904000);
INSERT INTO `reply` VALUES (361, 244, 'iafsbt', '北京机打发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1205946425000);
INSERT INTO `reply` VALUES (362, 24419, '怡弘电磁加热', '长沙怡弘科技(www.eh2005.cn)利用电磁加热原理生产电磁加热圈、电磁加热器、电磁加热设备、电磁感应加热器、注塑机节能电磁加热器、注塑机节电电磁加热设备、电磁管道加热器、电磁加热节能设备、超音频电磁感应加热器、电磁波加热器、电磁加热控制器、高效加热节电设备、高效加热节电主机、塑机加热节电主机、塑胶热熔节电系统、塑料加热节电设备 、塑料机械电磁加热器、塑料机械节电器、输油管道加热器、高效加热节能设备、工业电磁加热设备、工业电磁加热系统、大功率感应加热节能设备、塑料加工感应加热节能设备、电磁感应加热装置、高效加热节电器、超音频红外线电磁感应加热器、塑料加热节电器。在电磁加热技术领域处于国内领先地位，节能电磁加热设备具有节电效果显著，最高节电达85%，升温速度快，热效率达95%以上，降低生产环境温度，免维修等显著特点，并且对原生产工艺、操作程序无任何影响和改变。已广泛应用于塑料加热及其类似加热行业的节能改造中。本公司面向全球诚征产品代理商、提供OEM贴牌和专利技术转让及承接电磁加热节能改造工程。产品供货价格自2008年4月份开始大幅度下调，欢迎咨询。 电话：0731-5711790 5326790 免费热线：4008100100 转 长沙怡弘', '222.247.156.237', 1205888040000);
INSERT INTO `reply` VALUES (363, 24441, '雪乌鸦', '不错，祝你愿望成真。', '59.46.112.103', 1205901369000);
INSERT INTO `reply` VALUES (364, 244, 'oredhyo', '北京机打发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1205866341000);
INSERT INTO `reply` VALUES (365, 244, 'xqqlqdld', '北京机打发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1205785422000);
INSERT INTO `reply` VALUES (366, 40, '123456', '我给你发邮件了，请在方便的时候给我发一份，谢谢了！', '61.128.234.252', 1205724227000);
INSERT INTO `reply` VALUES (367, 244, 'woejdhsv', '北京机打发票１３３９１９８７５５８代售印花税票\r\n\r\n北京机打发票１３３９１９８７５５８ 印花税票，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n北京印花税票１３３９１９８７５５８，本公司经地税局批准专售印花税票，样板齐全，量多从优，专业代办各类发票、税点低<0.5-2>%\r\n发票类：建筑业、服务业、房地产、运输、餐饭发票、销售发票、税务发票、医院门诊、住院等。\r\n\r\n\r\n北京顺发办证公司\r\n网址：http://www.banzheng5.cn', '219.232.59.42', 1205629190000);
INSERT INTO `reply` VALUES (368, 40, 'SUE', '请发一份给我可否？queenzxd@yahoo.com.cn 多谢！', '203.134.244.14', 1205467759000);
INSERT INTO `reply` VALUES (369, 24441, 'lwckbi', '论坛自动跟贴工具 自动顶帖工具 联系qq:525093551 自动发贴机 站内消息机等各类网上宣传工具 网站推广软件 联系qq:525093551 刷贴机 顶贴机 跟贴机 灌水机 帖子置顶器 回贴机 联系qq:525093551 u9z5z5hn', '125.34.104.121', 1205456956000);
INSERT INTO `reply` VALUES (370, 38, 'elone', '也想要中国近代史，多谢楼主啊', '218.82.90.196', 1205292113000);
INSERT INTO `reply` VALUES (371, 40, '仓少', '请发《追寻现代中国》一份给我(cangwenhua@126.com),多谢文轩兄!', '61.144.114.139', 1205289307000);
INSERT INTO `reply` VALUES (372, 350, 'zkin32', '看不清,有做弊嫌疑', '58.60.219.242', 1204495210000);
INSERT INTO `reply` VALUES (373, 2546, 'zkin32', '顶', '58.60.219.242', 1204495078000);
INSERT INTO `reply` VALUES (374, 244, 'qtgfwyk', '中国验厂网,中国验厂咨询/认证培训第一品牌\r\n\r\n总部设在上海，服务地区覆盖南京、无锡、扬州、杭州、宁波、绍兴、海宁、义乌等江浙沪地区及山东，北京，天津，安徽等地区，有着最完善的服务网络，有近百名各类资深专家正活跃在全国各地为不同客户提供认证培训，验厂咨询，验厂培训，认证咨询，认证辅导服务，是目前国内最为专业性验厂咨询（顾问）机构之一。\r\n\r\n所经营项目：\r\n一、体系认证咨询：\r\nISO20000、ISO14001、ISO/TS16949、ISO9001、SA8000、ICTI、WRAP、ETI、BSCI/AVE、C-TPAT。\r\n二、专题培训项目：\r\n长期顾问服务、企业管理培训、企业验厂辅导。\r\n三、客户验厂咨询服务：\r\n目前从事:沃尔玛验厂、disney验厂等COC客户验厂的专业化辅导,咨询和培训\r\n中国验厂网-中国验厂咨询第一品牌\r\n网址：http://www.sa8000cn.cn', '220.234.88.189', 1204255498000);
INSERT INTO `reply` VALUES (375, 38, '韵', '楼主你好，你能否帮我邮一本辛灝年先生的谁是新中国。 谢谢！我的邮箱是：a-b-c-f123456@163.com', '219.137.183.5', 1203819057000);
INSERT INTO `reply` VALUES (376, 40, 'aa', '请发一份给我！shenzheng07@126.com 追寻了很久了，谢谢了！', '58.20.199.66', 1203800249000);
INSERT INTO `reply` VALUES (377, 38, 'FROM EYE', '我的邮箱是:eyeshenzhen@gmail.com', '219.133.200.138', 1203655557000);
INSERT INTO `reply` VALUES (378, 38, 'FROM EYE', '渴望要一份电子版 谢谢LZ 我看看合适的话也去香港买一套收藏 ：）', '219.133.200.138', 1203655465000);
INSERT INTO `reply` VALUES (379, 40, 'treeman', '从豆瓣追来看，望不吝赐书，我的邮箱： treeman@163.com 谢谢！', '222.45.93.77', 1203565395000);
INSERT INTO `reply` VALUES (380, 38, '书痴', '找了好长时间了，麻烦也给我一份吧，谢谢了。 邮箱zsldhr-001@163.com', '60.4.134.96', 1203297301000);
INSERT INTO `reply` VALUES (381, 38, '赛里木湖', '很想看这本书，麻烦楼主给我邮一份吧，多谢多谢！！ wang_huil@sina.com', '221.214.4.155', 1203103000000);
INSERT INTO `reply` VALUES (382, 38, 'espresso', '麻烦也给我发一份吧，谢谢！ vaporren@gmail.com', '221.0.28.232', 1203102661000);
INSERT INTO `reply` VALUES (383, 38, '沙欧', '麻烦楼主也给我邮一份吧!万分谢谢!shaou1199@163.com', '218.89.200.225', 1202929715000);
INSERT INTO `reply` VALUES (384, 38, 'dayewndou', '也给我一份吧，不知道楼主方不方便，我的邮箱： dayewandou@163.com ', '202.173.10.35', 1202960577000);
INSERT INTO `reply` VALUES (385, 40, 'wandouer', '从天涯一直追到了这里，想看看不同内容的历史书，但是发现楼主的连接我这里打不开，可否给我一份电子版，我邮箱是: dayewandou@163.com', '202.173.10.35', 1202958366000);
INSERT INTO `reply` VALUES (386, 40, '岔七岔八', '我也买了本阉割版的，感觉很不过瘾，感谢斑竹的扫描版．但我这里下不了．不知道能否传我一份，《中国近代史》我也想要一本．谢谢．EMAIL:jeanmusic@tom.com', '221.6.44.6', 1202686655000);
INSERT INTO `reply` VALUES (387, 24441, 'littlegirl', 'test', '121.15.225.56', 1202588328000);
INSERT INTO `reply` VALUES (388, 40, '兄弟', '兄弟能否将《追寻现代中国》邮一份给我：cc_ding@yahoo.com.cn 万分感谢！', '210.77.80.140', 1199496168000);
INSERT INTO `reply` VALUES (389, 253, 'crossbow', '请问站长这书你有电子版的吗？ 我查了好些书店都只有中国人马先生写的《丑陋的日本人》，不是高桥先生的原作。请问现在哪里买的到？或者您有电子版或者扫描版的吗？ 万分感谢！[quote][b]以下为blog主人的回复：[/b] 抱歉，我没有这本书的电子版，网上搜索找到十页试读版本。http://book.lrbook.com/book/000/001/067/024/C308D69B27B8598ACA8525CE9FE1592A.htm[/quote]', '59.172.111.43', 1199160829000);
INSERT INTO `reply` VALUES (390, 24425, 'jiajia', '卡农不错,建议听听 forever', '220.181.48.61', 1198892404000);
INSERT INTO `reply` VALUES (391, 206, '游客', '可知每幅图的题目？若知请相告，谢谢！ www.dbhlifeng.zjjy.cn ', '220.189.225.219', 1198809915000);
INSERT INTO `reply` VALUES (392, 38, 'K.', 'wydmbxf(at) gmail ( dot ) com 给我一份吧。谢谢。', '218.84.65.209', 1198787003000);
INSERT INTO `reply` VALUES (393, 24437, '雪乌鸦', '去石室圣心堂转悠了几圈，人太多，排队比较久，下一次人没那么多的时候再过去忏悔下~', '218.20.2.148', 1198691788000);
INSERT INTO `reply` VALUES (394, 105, '雪乌鸦', '赞！！！', '218.20.2.148', 1198691526000);
INSERT INTO `reply` VALUES (395, 24437, '春天的花园', '看来今年是一个人的世界-冰山之上---冷啊！', '221.219.15.186', 1198641276000);
INSERT INTO `reply` VALUES (396, 24437, '春天的花园', 'ps.突然发现改版了，喜欢ing！[quote][b]以下为blog主人的回复：[/b] [emot]1[/emot]新年新版[/quote]', '61.51.125.97', 1198540280000);
INSERT INTO `reply` VALUES (397, 24437, '春天的花园', '今天看着家庭教会的外国老奶奶们在祷告，突然想到，很多年过去以后，会不会有这样一批中国人，身在异乡，也组织着这样的聚会，怀念着记忆中的祖国，无形中也传播了中国文化？', '61.51.125.97', 1198540062000);
INSERT INTO `reply` VALUES (398, 38, 'peterlee', '己经邮出,请查收.', '61.144.192.170', 1197853787000);
INSERT INTO `reply` VALUES (399, 38, 'JediMaster', '我的邮箱是 bo.schwarzstein (at) gmail ( dot ) com，谢谢分享！麻烦发给我一份。我也是Coder[emot]1[/emot]。', '58.213.251.63', 1197659566000);
INSERT INTO `reply` VALUES (400, 40, 'Teenspi', 'Dear, 能不能将此书和《中国近代史》邮件给我：teenspi@yahoo.com.cn？ 万分感谢！[quote][b]以下为blog主人的回复：[/b] 己经邮出,请查收.[/quote]', '60.190.225.134', 1197565787000);
INSERT INTO `reply` VALUES (401, 40, 'Teenspi', '不能下载？ ', '60.190.225.134', 1197608018000);
INSERT INTO `reply` VALUES (402, 38, 'keykeyli', '请问您的徐中约《中国近代史》下载网址是用什么下呢？我下不了呀？[quote][b]以下为blog主人的回复：[/b] 己经取消在网络的公共下载，如果你要，给我发个邮件吧，我把下载途径告诉你。[/quote][quote][b]以下为blog主人的回复：[/b] 我的邮箱：feelingatfall@gmail.com[/quote]', '122.0.68.157', 1197316473000);
INSERT INTO `reply` VALUES (403, 246, '周群', '周群定论： 民主分为两个：无产阶级民主与资产阶级民主。 无产阶级民主也称真民主，即：占总人口绝对多数的人民当家作主。 资产阶级民主也称假民主，即：占总人口绝对少数的资产阶级先挑选了几个代表资产阶级利益的候选人，然后再让人民用选票去从中选举，最后以都是人民自己选的为借口要求人民全心甘情愿听资产阶级代言人的话。', '222.93.229.13', 1197061135000);
INSERT INTO `reply` VALUES (404, 206, 'yo', '没想到博主如此呆滞的眼神也欣赏凡高的画..佩服![quote][b]以下为blog主人的回复：[/b] [emot]21[/emot]这算赞美还是算讪笑呢?[/quote]', '124.117.68.160', 1196309877000);
INSERT INTO `reply` VALUES (405, 206, '醉生梦死', '兄台你好 凡高的画我保存了 谢谢：）[quote][b]以下为blog主人的回复：[/b] [emot]7[/emot]不客气.[/quote]', '220.178.47.30', 1196272710000);
INSERT INTO `reply` VALUES (406, 17955, '雪乌鸦', '英文强 -_-# 无言。。。', '122.0.150.23', 1196218974000);
INSERT INTO `reply` VALUES (407, 1137, 'ff', 'gfcgf', '218.201.86.178', 1195951342000);
INSERT INTO `reply` VALUES (408, 208, 'silence', '实际上我们有什么理由拒绝新生的东西，难道是害怕失去自我。日本学习了那么多年西方，固有的文化依然还在，甚至发扬光大，而我们要固执得去封闭自己，结果是失去了更加多的好东西，这是上天给与傲慢者的惩罚。是一种活该。', '122.225.3.19', 1195346986000);
INSERT INTO `reply` VALUES (409, 163, '游戏生存', '什么啊 下载的也不是游戏啊，晕！', '123.190.67.195', 1194060475000);
INSERT INTO `reply` VALUES (410, 20868, 'yuyu99', '有机会见识下S英语.[emot]21[/emot]', '61.144.192.170', 1193706515000);
INSERT INTO `reply` VALUES (411, 14690, 'N/A', '我应聘的只是程序员职位！如果你想招的是CIO，却找了个程序员来面试，那只能说是你真的是什么都不懂，快回家种地去吧！ 我承认目前我是无法拿出一件令自己满意的东西出来，所以干脆就不拿了，如果每个程序员都能拿出一份很好的程序，你以为他还需要找工作吗？Discuz!你知不知道？就这样一个论坛程序能够吸引上千万的投资。月产代码能上五百行的已经是非常优秀的程序员了，你懂不懂？ 我都跟你说过想待在那些有人能懂我的代码的地方，我是程序员，不是要做老大，吗的，都是跟你声明过的啊，后来我才明白原来是你对程序的分工完全不懂！我曾经说过的全都被你的无知自动忽略掉了，我自己也自讨了个没趣！郁闷！！！ 我也看过一些你写的“程序”，如果你认为那是程序的话，那完全是菜鸟级的，连个函数都写不好，更别说啥面向对象了。还有，不是学会了xml文档的格式就以为自己学会了xml，四年前我花了一天就学会了写xml文档，xml是一系列技术，没你想象的那么简单！写程序也是一件很复杂的活，你觉得简单只是因为你还没有入行！无知无畏啊！唉，年轻人的通病！ 既然你说了对我个人的第一印象，我也说说对你们的第一印象吧：你博客上的照片相当帅，现实中如果你愿意来我们这整整，或许能达到照片中的效果的，你朋友就像个二世祖，除了败家没啥用处！当晚我也是对你们失望透顶了的，后来的简历花了半个小时写的，那只是出于礼貌，别误会！', '58.60.79.133', 1192572891000);
INSERT INTO `reply` VALUES (412, 14690, 'N/A', '我就是你面试的那个人！ 5.5k想请个“将”？笑话！ 我不是什么技术牛人，从来没有说过，心里也没有这么认为过，我只是一个程序员。程序员职业道德的第一条就是：不接受自己无法胜任的工作。我自己什么情况当然是要讲明白。但是你无法理解自己的浅薄就把他烂在肚子里好了，没有人知道，你却用如此轻蔑的语气把你自己的浅薄写在博客上除了能证明你自己真的很浅薄外什么也证明不了！ 那个网站只是一年之前无聊之下一个小时制作出来的作品。后来就没有理会过了，我发誓！而且看作品面试我看招美工比较适合！我之前就在QQ上说过我希望到一个能有人理解我的代码的地方，之后还说过要给你一份简历的，不过谈完后完全找不到感觉，想想就想把这件事算了的。后来只是意外...... 至于你说什么怯怯的，只是不太习惯根陌生人打交道而已，心里面没有怯的，那叫做“不习惯”，可能你比较喜欢随时可以放出“王八之气”的人吧！个性上的不合这是无话可说的，随便诬蔑别人就不对了。 php和asp,asp.net(c#)对我来说真的是没有太大区别，入行一点点的人都知道语言无障碍这东西吧，对一个有经验丰富的程序员来说学习一门语言需要多长时间吗？真是夏虫不可以与之语冰！ ', '58.60.79.133', 1192572736000);
INSERT INTO `reply` VALUES (413, 6163, '雪乌鸦', '这个，值得斟酌一下', '122.0.152.34', 1192596188000);
INSERT INTO `reply` VALUES (414, 8136, 'GWEUHPFMQ', '兑现的永远没有承诺的多', '125.92.63.126', 1192313101000);
INSERT INTO `reply` VALUES (415, 12289, '白色的草', '老大,我越来越崇拜你了!', '218.94.240.68', 1191957561000);
INSERT INTO `reply` VALUES (416, 12289, '春天的花园', '难不成你还会古筝？厉害啊！', '61.149.136.154', 1191986842000);
INSERT INTO `reply` VALUES (417, 8136, '春天的花园', '嘿嘿，闭关修行呢^-^ 九月是每年最忙的时候，开学嘛 现在一切走入正轨，可以休息一下了：）', '61.149.136.154', 1191986709000);
INSERT INTO `reply` VALUES (418, 8136, '春天的花园', '嘿嘿，我回来了，会常来看你的！[quote][b]以下为blog主人的回复：[/b] 这么久不见，你出国游历了？[/quote]', '221.219.9.227', 1191798913000);
INSERT INTO `reply` VALUES (419, 361, '幽游仙', '昨天我也碰上了', '211.143.190.30', 1191632652000);
INSERT INTO `reply` VALUES (420, 163, 'hello', '大家好 我是hello', '59.52.98.129', 1191461773000);
INSERT INTO `reply` VALUES (421, 6163, 'SBWind', '光有想法不行啊,兄弟. 除了台湾,其他都赞同...', '61.144.192.170', 1189977358000);
INSERT INTO `reply` VALUES (422, 5904, 'yuyu99', '很好.[quote]用张老人头,看它出来多少[/quote]', '61.144.192.170', 1189884278000);
INSERT INTO `reply` VALUES (423, 5904, '呵呵', '我喝咖啡头晕呢,还好我的钱不会被它骗去了.', '218.94.223.207', 1189883632000);
INSERT INTO `reply` VALUES (424, 219, '好', '佩服', '61.170.195.178', 1189274399000);
INSERT INTO `reply` VALUES (425, 2659, 'aaa', 'Rental International Cell南京锅炉 压力容器苏州团购 汽车团购 时尚服饰服饰搭配 秋季服饰搭配 河海大学毕业论文 经济论文社会论文 心灵鸡汤管理论文 考试频道理工论文 实用论文外汇交流 外汇资讯机构汇评炒汇技巧 外汇理财', '222.93.152.204', 1189221474000);
INSERT INTO `reply` VALUES (426, 2659, 'aaa', '[url=http://www.czibm.cn]常州IBM[/url][url=http://www.czibm.cn]常州IBM专卖[/url][url=http://www.czibm.cn]常州IBM水货[/url][url=http://www.czibm.cn]常州IBM港行[/url][url=http://www.czibm.cn]ThinkPad常州论坛 [/url][url=http://www.czibm.cn]常州IBM笔记本[/url][url=http://www.czibm.cn]IBM港行[/url][url=http://www.czibm.cn]IBM水货[/url][url=http://www.czibm.cn]IBM笔记本[/url][url=http://www.czibm.cn]IBM技术[/url][url=http://www.czibm.cn]IBM介绍[/url] [url=http://52wy.com.ru/index.php]免费资源[/url][url=http://52wy.com.ru/index.php]破解软件[/url][url=http://52wy.com.ru/index.php]杀毒软件[/url][url=http://52wy.com.ru/index.php]免费网络电话[/url][url=http://52wy.com.ru/index.php]软件安装[/url][url=http://52wy.com.ru/index.php]资源申请[/url][url=http://www.ucuc.net/ucuc/webchains.asp?chainid=80]魔兽点卡[/url][url=http://www.ucuc.net/ucuc/webchains.asp?chainid=80]街头篮球点卡[/url][url=http://www.ucuc.net/ucuc/webchains.asp?chainid=80]网易一卡通[/url][url=http://www.ucuc.net/ucuc/webchains.asp?chainid=80]游戏点卡[/url][url=http://www.ucuc.net/ucuc/webchains.asp?chainid=80]QQ币|QQB|QB[/url][url=http://qqfo.net.ru]Internet[/url][url=http://qqfo.net.ru]Movies[/url][url=http://qqfo.net.ru]Travel[/url][url=http://qqfo.net.ru]Career[/url][url=http://qqfo.net.ru]Trasportation[/url][url=http://qqfo.net.ru]Sciene[/url][url=http://qqfo.net.ru]Gardening[/url][url=http://www.xinhope.com]Gsm Wireless[/url][url=http://www.xinhope.com]gsm cellular[/url] [url=http://www.xinhope.com]Nokia Cellular Phone[/url][url=http://www.xinhope.com]Unlocked[/url][url=http://www.xinhope.com]Multisystem[/url][url=http://www.xinhope.com]World Phone[/url][url=http://www.xinhope.com]Rental International Cell[/url][url=http://www.njboiler.com.cn]南京锅炉[/url] [url=http://www.njboiler.com.cn]压力容器[/url][url=http://www.remai.com/]苏州团购[/url][url=http://www.remai.com/]汽车团购[/url] ', '222.93.152.204', 1189221299000);
INSERT INTO `reply` VALUES (427, 2913, '春天的花园', '爬山可是好运动啊 提醒了我有空也去爬爬山：）', '221.219.113.138', 1188668381000);
INSERT INTO `reply` VALUES (428, 699, '安君阳', '写的真的不错 我也想认识你讨论一下我的QQ273287804', '60.160.170.150', 1188622163000);
INSERT INTO `reply` VALUES (429, 2913, 'yaren', '氧化钙,爬山要带[emot]31[/emot]', '61.144.192.170', 1188426904000);
INSERT INTO `reply` VALUES (430, 2659, 'juan', '好崇拜你．强人啊． 可否告诉我你的ＱＱ，交个朋友 我的： ＱＱ:108737805[quote][b]以下为blog主人的回复：[/b] [emot]1[/emot]敢不从命？[/quote]', '218.94.246.177', 1188440227000);
INSERT INTO `reply` VALUES (431, 2249, 'yuyu99', '你一定要氧化钙他', '61.144.192.170', 1188074305000);
INSERT INTO `reply` VALUES (432, 2428, '籸灆', '套用一句莪仩高中塒啲英語課攵 I don‘t think I know you... 好神奇啊，莪正茬百喥給爸爸看迪拜帆船酒店啲圖片塒，隨便點叻一漲圖片竟然鏈接到伱啲blog上 嘻~那就留一個夶夶啲腳茚好叻~ ps:照片仩啲寶寶昰伱嗎？好可愛~.以下为blog主人的回复：多谢哂你的捧场啊，得闲多点黎玩la。个Baby唔系我，系我姐姐的细路。', '221.197.154.26', 1187741825000);
INSERT INTO `reply` VALUES (433, 2249, 'yaren', '明天准时上班', '61.144.192.170', 1187294952000);
INSERT INTO `reply` VALUES (434, 2249, '00000000000', '说得真好,I cann‘t stand!!!! I want to take a holiday!', '61.144.192.170', 1187208226000);
INSERT INTO `reply` VALUES (435, 269, '李寻欢', '写得还不错', '192.168.2.29', 1497327883779);
INSERT INTO `reply` VALUES (436, 269, '陈云', '希望多写些好文章', '192.168.2.29', 1497327919338);
INSERT INTO `reply` VALUES (468, 269, 'li', 'test1', '::1', 1517901371000);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 1491966079000);
INSERT INTO `role` VALUES (17, '系统管理员', 1494558079667);

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) DEFAULT NULL,
  `menu_code` int(40) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_right
-- ----------------------------
INSERT INTO `role_right` VALUES (116, 1, 10);
INSERT INTO `role_right` VALUES (117, 1, 1001);
INSERT INTO `role_right` VALUES (118, 1, 100101);
INSERT INTO `role_right` VALUES (119, 1, 10010101);
INSERT INTO `role_right` VALUES (120, 1, 10010102);
INSERT INTO `role_right` VALUES (121, 1, 100102);
INSERT INTO `role_right` VALUES (122, 1, 10010201);
INSERT INTO `role_right` VALUES (123, 1, 10010202);
INSERT INTO `role_right` VALUES (124, 1, 1002);
INSERT INTO `role_right` VALUES (125, 1, 100202);
INSERT INTO `role_right` VALUES (126, 1, 10020201);
INSERT INTO `role_right` VALUES (127, 1, 10020202);
INSERT INTO `role_right` VALUES (128, 1, 100203);
INSERT INTO `role_right` VALUES (129, 1, 10020301);
INSERT INTO `role_right` VALUES (130, 1, 10020302);
INSERT INTO `role_right` VALUES (131, 1, 100201);
INSERT INTO `role_right` VALUES (132, 1, 10020101);
INSERT INTO `role_right` VALUES (133, 17, 100101);
INSERT INTO `role_right` VALUES (134, 17, 10010101);
INSERT INTO `role_right` VALUES (135, 17, 10010102);
INSERT INTO `role_right` VALUES (136, 17, 100201);
INSERT INTO `role_right` VALUES (137, 17, 10020101);
INSERT INTO `role_right` VALUES (138, 17, 100203);
INSERT INTO `role_right` VALUES (139, 17, 10020301);
INSERT INTO `role_right` VALUES (140, 17, 10020302);

SET FOREIGN_KEY_CHECKS = 1;
