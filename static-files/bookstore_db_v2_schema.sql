/*
 Navicat Premium Data Transfer

 Source Server         : 本地MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 26/04/2023 15:40:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_bookstore_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_admin_user`;
CREATE TABLE `tb_bookstore_admin_user`  (
                                            `admin_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
                                            `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆名称',
                                            `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆密码',
                                            `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
                                            `locked` tinyint(4) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
                                            PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_admin_user
-- ----------------------------
INSERT INTO `tb_bookstore_admin_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超管', 0);

-- ----------------------------
-- Table structure for tb_bookstore_admin_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_admin_user_token`;
CREATE TABLE `tb_bookstore_admin_user_token`  (
                                                  `admin_user_id` bigint(20) NOT NULL COMMENT '用户主键id',
                                                  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token值(32位字符串)',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'token过期时间',
                                                  PRIMARY KEY (`admin_user_id`) USING BTREE,
                                                  UNIQUE INDEX `uq_token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_admin_user_token
-- ----------------------------
INSERT INTO `tb_bookstore_admin_user_token` VALUES (1, '54d186aa4e54cc40105c578630ecb3f7', '2023-04-26 09:06:09', '2023-04-28 09:06:09');

-- ----------------------------
-- Table structure for tb_bookstore_books_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_books_category`;
CREATE TABLE `tb_bookstore_books_category`  (
                                                `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
                                                `category_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
                                                `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父分类id',
                                                `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
                                                `category_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
                                                `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
                                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                                `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
                                                PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_books_category
-- ----------------------------
INSERT INTO `tb_bookstore_books_category` VALUES (1, 1, 0, '小说', 2, 0, '2023-04-25 00:11:17', 0, '2023-04-24 14:10:15', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (2, 1, 0, '人文社科', 3, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:10:38', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (3, 1, 0, '经济', 4, 0, '2023-04-25 00:10:07', 0, '2023-04-26 09:32:47', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (4, 1, 0, '成功励志', 7, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:22', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (5, 1, 0, '科技科普', 5, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:10:57', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (6, 1, 0, '计算机与互联网', 6, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:08', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (7, 1, 0, '生活', 9, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:29', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (8, 1, 0, '杂志', 10, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:42', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (9, 1, 0, '文学', 1, 0, '2023-04-25 00:11:30', 0, '2023-04-24 14:10:29', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (10, 2, 9, '世界名著', 1, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:12:28', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (11, 3, 10, '中国名著', 1, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:12:42', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (12, 3, 10, '英国名著', 2, 0, '2023-04-24 14:13:04', 0, '2023-04-24 14:13:04', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (13, 2, 8, '新闻人物', 1, 0, '2023-04-25 12:12:49', 0, '2023-04-25 12:12:49', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (15, 2, 8, '百科万象', 2, 0, '2023-04-25 12:22:55', 0, '2023-04-25 12:22:55', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (16, 3, 15, '旅游', 1, 0, '2023-04-25 13:31:24', 0, '2023-04-25 13:31:24', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (17, 2, 2, '社会纪实', 1, 0, '2023-04-25 16:02:33', 0, '2023-04-25 16:02:33', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (18, 3, 17, '马哲', 1, 0, '2023-04-25 16:03:01', 0, '2023-04-25 16:03:01', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (19, 2, 6, '运维', 1, 0, '2023-04-25 16:05:41', 0, '2023-04-25 16:05:41', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (20, 2, 6, '开发', 2, 0, '2023-04-25 16:05:50', 0, '2023-04-25 16:05:50', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (21, 2, 6, '算法', 3, 0, '2023-04-25 16:05:59', 0, '2023-04-25 16:05:59', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (22, 2, 6, '安全', 4, 0, '2023-04-25 16:06:07', 0, '2023-04-25 16:06:07', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (23, 3, 19, '实施运维', 1, 0, '2023-04-25 16:06:23', 0, '2023-04-25 17:04:02', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (24, 3, 19, '系统运维', 2, 0, '2023-04-25 16:06:53', 0, '2023-04-25 16:06:53', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (25, 3, 19, '桌面运维', 3, 0, '2023-04-25 16:07:24', 0, '2023-04-25 16:07:24', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (26, 3, 19, '自动化运维', 4, 0, '2023-04-25 16:07:34', 0, '2023-04-25 16:07:34', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (27, 3, 19, '大数据运维', 5, 0, '2023-04-25 16:07:44', 0, '2023-04-25 16:07:44', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (28, 3, 19, 'devops运维', 6, 0, '2023-04-25 16:08:07', 0, '2023-04-25 16:08:07', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (29, 2, 3, '世界各国经济概况、经济史、经济地理', 2, 0, '2023-04-26 09:32:15', 0, '2023-04-26 09:37:42', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (30, 2, 3, '经济管理', 3, 0, '2023-04-26 09:32:39', 0, '2023-04-26 09:37:36', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (31, 2, 3, '经济学', 1, 0, '2023-04-26 09:33:19', 0, '2023-04-26 09:33:19', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (32, 2, 3, '农业经济', 4, 0, '2023-04-26 09:38:04', 0, '2023-04-26 09:38:04', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (33, 2, 3, '工业经济', 5, 0, '2023-04-26 09:38:19', 0, '2023-04-26 09:38:19', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (34, 3, 33, '信息产业经济', 1, 0, '2023-04-26 09:38:48', 0, '2023-04-26 09:38:48', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (35, 2, 9, '文化理论', 2, 0, '2023-04-26 15:07:54', 0, '2023-04-26 15:07:54', 0);
INSERT INTO `tb_bookstore_books_category` VALUES (36, 3, 35, '中国古文', 1, 0, '2023-04-26 15:08:08', 0, '2023-04-26 15:08:08', 0);

-- ----------------------------
-- Table structure for tb_bookstore_books_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_books_info`;
CREATE TABLE `tb_bookstore_books_info`  (
                                            `books_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图书表主键id',
                                            `books_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图书名',
                                            `books_intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图书简介',
                                            `books_category_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联分类id',
                                            `books_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/static/no-img.png' COMMENT '图书主图',
                                            `books_carousel` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/static/no-img.png' COMMENT '图书轮播图',
                                            `books_detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书详情',
                                            `original_price` int(11) NOT NULL DEFAULT 1 COMMENT '图书价格',
                                            `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '图书实际售价',
                                            `stock_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图书库存数量',
                                            `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图书标签',
                                            `books_sell_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '图书上架状态 1-下架 0-上架',
                                            `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '添加者主键id',
                                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '图书添加时间',
                                            `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者主键id',
                                            `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '图书修改时间',
                                            PRIMARY KEY (`books_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 793 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_books_info
-- ----------------------------
INSERT INTO `tb_bookstore_books_info` VALUES (9, '鸟哥的Linux私房菜', 'Linux经典图书', 24, 'http://localhost:8888/static/3c95c13e568540ee5b74a2236f282edf_20230424140407.jpg', 'http://localhost:8888/static/44a77d4ad4ca075023f827d853e4a74a_20230426153844.png', '<p>本书是最具知名度的Linux入门书《鸟哥的Linux私房菜基础学习篇》的最新版，全面而详细地介绍了Linux操作系统。全书分为5个部分：第一部分着重说明Linux的起源及功能，如何规划和安装Linux主机；第二部分介绍Linux的文件系统、文件、目录与磁盘的管理；第三部分介绍文字模式接口 shell和管理系统的好帮手shell脚本，另外还介绍了文字编辑器vi和vim的使用方法；第四部分介绍了对于系统安全非常重要的Linux账号的管理，以及主机系统与程序的管理，如查看进程、任务分配和作业管理；第五部分介绍了系统管理员(root)的管理事项，如了解系统运行状况、系统服务，针对登录文件进行解析，对系统进行备份以及核心的管理等。</p><p>本书内容丰富全面，基本概念的讲解非常细致，深入浅出。各种功能和命令的介绍，都配以大量的实例操作和详尽的解析。本书是初学者学习Linux不可多得的一本入门好书。</p>', 83, 79, 88, '', 0, 0, '2023-04-24 11:36:08', 0, '2023-04-26 15:37:51');
INSERT INTO `tb_bookstore_books_info` VALUES (666, '走遍中国', '旅游书籍', 16, 'http://localhost:8888/static/a698fbc35bbb9e686aa5820079f42740_20230424140521.jpg', 'http://localhost:8888/static/bcbe3365e6ac95ea2c0343a2395834dd_20230424102000.png', '<p><a href=\"https://book.douban.com/series/33672\">图说天下：国家地理</a>(共28册)， 这套丛书还有 《失落的文明》《游遍日本》《中国篇-人一生要去的100个地方-图说天下》《梦想家的100张旅行地图》《全球最美的100个地方》 等 。<br/></p>', 83, 79, 10, '', 0, 0, '2023-04-24 11:36:08', 0, '2023-04-26 15:36:56');
INSERT INTO `tb_bookstore_books_info` VALUES (777, '平语近人：习近平总书记用典', '作者: 中共中央宣传部 / 中央广播电视总台', 18, 'http://localhost:8888/static/f561aaf6ef0bf14d4208bb46a4ccb3ad_20230424135510.jpg', 'http://localhost:8888/static/698d51a19d8a121ce581499d7b701668_20230424101911.png', '<p>由中共中央宣传部、中央广播电视总台联合创作的《百家讲坛》特别节目《平“语”近人——习近平总书记用典》将于8日至19日在央视综合频道晚间播出。节目从习近平总书记一系列重要讲话、文章、谈话中所引用的古代典籍和经典名句为切入点，旨在推动习近平新时代中国特色社会主义思想的生动阐释与广泛传播。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;据中央广播电视总台介绍，节目分为《一枝一叶总关情》《治国有常民为本》《国无德不兴》《国之本在家》《报得三春晖》《只留清气满乾坤》《绝知此事要躬行》《腹有诗书气自华》《恶竹应须斩万竿》《天下之治在人才》《咬定青山不放松》《天下为公行大道》12集，由“原声微视频”“思想解读”“经典释义”“现场访谈”“互动问答”“经典诵读”六个环节构成。<br/></p>', 69, 70, 999999, '', 0, 0, '2023-04-24 11:36:08', 0, '2023-04-25 16:03:47');
INSERT INTO `tb_bookstore_books_info` VALUES (788, '新疆 从这里开始', '都说新疆好地方，这个物产富饶、风景独好的省份，还拥有着5600多公里绵长的边境线，像是竖琴弯曲的琴颈，稳稳地围住了这方水土。', 16, 'http://localhost:8888/static/fcd99748cb6720b002105b4410279c93_20230425134312.jpg', 'http://localhost:8888/static/no-img.png', '', 0, 0, 1000, '', 0, 0, '2023-04-25 13:44:35', 0, '2023-04-25 14:15:26');
INSERT INTO `tb_bookstore_books_info` VALUES (789, '傲慢与偏见', '《傲慢与偏见》是简·奥斯汀的代表作，是一部描写爱情与婚姻的经典小说。作品以男女主人公达西和伊丽莎白由于傲慢和偏见而产生的爱情纠葛为线索，共写了四起姻缘：伊丽莎白与达西、简与宾利、莉迪亚与威克姆、夏洛蒂与柯林斯。伊丽莎白、简和莉迪亚是贝内特家五个女儿中的三个姐妹，而夏洛蒂则是她们的邻居，也是伊丽莎白的朋友。男主人公达西与宾利是好友，且与威克姆一起长大，而柯林斯则是贝内特家的远房亲戚。', 12, 'http://localhost:8888/static/170912fd1a77db906209eec82a7f3eb6_20230425154618.jpg', 'http://localhost:8888/static/no-img.png', '<p>虚荣与骄傲是截然不同的东西，然而大家常常把它们当同义词来用。一个人可能骄傲而并不虚荣。骄傲多半涉及我们自己怎样看自己，而虚荣则涉及我们想别人怎样看我们。<br/></p>', 13, 13, 999, '', 0, 0, '2023-04-25 15:55:53', 0, '2023-04-25 15:55:53');
INSERT INTO `tb_bookstore_books_info` VALUES (790, '月亮和六便士', '一个英国证券交易所的经纪人，本已有牢靠的职业和地位、美满的家庭，但却迷恋上绘画，像“被魔鬼附了体”，突然弃家出走，到巴黎去追求绘画的理想。他的行径没有人能够理解。他在异国不仅肉体受着贫穷和饥饿煎熬，而且为了寻找表现手法，精神亦在忍受痛苦折磨。经过一番离奇的遭遇后，主人公最后离开文明世界，远遁到与世隔绝的塔希提岛上。他终于找到灵魂的宁静和适合自己艺术气质的氛围...', 12, 'http://localhost:8888/static/951bfff9155e853f3a01fa4119630e06_20230425160010.jpg', 'http://localhost:8888/static/no-img.png', '<p>一个英国证券交易所的经纪人，本已有牢靠的职业和地位、美满的家庭，但却迷恋上绘画，像“被魔鬼附了体”，突然弃家出走，到巴黎去追求绘画的理想。他的行径没有人能够理解。他在异国不仅肉体受着贫穷和饥饿煎熬，而且为了寻找表现手法，精神亦在忍受痛苦折磨。经过一番离奇的遭遇后，主人公最后离开文明世界，远遁到与世隔绝的塔希提岛上。他终于找到灵魂的宁静和适合自己艺术气质的氛围。他同一个土著女子同居，创作出一幅又一幅使后世震惊的杰作。在他染上麻风病双目失明之前，曾在自己住房四壁画了一幅表现伊甸园的伟大作品。但在逝世之前，他却命令土著女子在他死后把这幅画作付之一炬。通过这样一个一心追求艺术、不通人性世故的怪才，毛姆探索了艺术的产生与本质、个性与天才的关系、艺术家与社会的矛盾等等引人深思的问题。同时这本书也引发了人们对摆脱世俗束缚逃离世俗社会寻找心灵家园这一话题的思考，而关于南太平洋小岛的自然民风的描写也引人向往。</p><p>《月亮和六便士》说问世后，以情节入胜、文字深刻在文坛轰动一时，人们争相传看。在小说中，毛姆用第一人称的叙述手法，借“我”之口，叙述整个故事，有人认为这篇小说的原型是法国印象派画家高更，这更增加了它的传奇色彩，受到了全世界读者的关注。</p><h2>作者简介&nbsp;&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·</h2><p>威廉·萨默赛特·毛姆（William Somerset Maugham）于1874年1月25日出生在巴黎。父亲是律师，当时在英国驻法使馆供职。小毛姆不满十岁，父母就先后去世，他被送回英国由伯父抚养。毛姆进坎特伯雷皇家公学之后，由于身材矮小，且严重口吃，经常受到大孩子的欺凌和折磨，有时还遭到冬烘学究的无端羞辱。孤寂凄清的童年生活，在他稚嫩的心灵上投下了痛苦的阴影，养成他孤僻、敏感、内向的性格。幼年的经历对他的世界观和文学创作产生了深刻的影响。</p><p>1892年初，他去德国海德堡大学学习了一年。在那儿，他接触到德国哲学史家昆诺·费希尔的哲学思想和以易卜生为代表的新戏剧潮流。同年返回英国，在伦敦一家会计师事务所当了六个星期的练习生，随后即进伦敦圣托马斯医学院学医。为期五年的习医生涯，不仅使他有机会了解到底层人民的生活状况，而且使他学会用解剖刀一样冷峻、犀利的目光...</p>', 15, 15, 987, '', 0, 0, '2023-04-25 16:00:18', 0, '2023-04-25 16:00:18');
INSERT INTO `tb_bookstore_books_info` VALUES (791, '2011-2012年电子信息产业经济运行分析与展望', '《2011－2012年电子信息产业经济运行分析与展望》含综合篇、行业篇、省市篇及国际篇四个部分，分行业、地区、领域回顾了2011年电子信息产业发展状况并对2012年电子信息产业发展趋势进行展望，并附有世界主要国家电子信息产业统计数据，反映了2011年我国电子信息产业发展全貌。', 34, 'http://localhost:8888/static/ed5d18a9bccb442c46b9fea881167880_20230426094209.jpg', 'http://localhost:8888/static/no-img.png', '<p>《2011－2012年电子信息产业经济运行分析与展望》含综合篇、行业篇、省市篇及国际篇四个部分，分行业、地区、领域回顾了2011年电子信息产业发展状况并对2012年电子信息产业发展趋势进行展望，并附有世界主要国家电子信息产业统计数据，反映了2011年我国电子信息产业发展全貌。<br/></p>', 198, 198, 500, '', 0, 0, '2023-04-26 09:42:11', 0, '2023-04-26 09:42:11');
INSERT INTO `tb_bookstore_books_info` VALUES (792, '王昱珩解读三千字文', '古有“千字文”，今有“三千字文”。\n\n作为启蒙读物，全文三千字无一字重复。\n\n内容包罗万象，涵盖天文、地理、自然、社会、历史、文化、艺术等方面的知识。文辞华美，用韵工整。\n\n本书通过图文结合的方式解读三千字文，插图均出自王昱珩之手。绘画线条立体，精细入微；图片风格别致，让人心静。\n\n精彩的释文与逼真的插图交相辉映，使得文因图而生姿态，图因文而入情理。', 36, 'http://localhost:8888/static/0425912febab57b78aa0c50322864d00_20230426151201.jpg', 'http://localhost:8888/static/15de21c670ae7c3f6f3f1f37029303c9_20230424102418.png', '<h2>作者简介&nbsp;&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·</h2><p>王昱珩</p><p>《zui强大脑第二季》选手，《zui强大脑第三季》中国队队长。毕业于清华大学，具有强大的观察能力和出色的绘画天赋。</p><p>在《zui强大脑》节目中挑战“微观辨水”，从520杯同质同量同水源的水中一眼就辨认出嘉宾挑选的水，因此被称为“水哥”。曾凭借强大的观察能力协助山东警方破获一起肇事逃逸案。</p><p>擅长绘画，对花鸟鱼虫的观察细致入微，所画动植物、人物线条立体，惟妙惟肖。作为父亲，为女儿创作了大量想象力丰富的绘画作品，留存做“父爱日记”。</p><p>李振沣</p><p>桂林市诗词楹联学会中青分会副会长，围棋速成法创始人，五小时写好字发明人，现任耿文彬围棋道场副总教练，被称为“真疯叔叔”。曾两次获得广西围棋少年赛冠军，拥有两项国家发明专利，合作著有《围棋水浒108型》、《围棋速成进阶宝典》。</p><h2>目录&nbsp;&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·</h2><p>第一部分　天文地理<br/>一<br/>宇宙开混沌，盘古辟鸿蒙。浊者下坤厚，轻盈上虚空。／ 24<br/>阴晴适交替，昼暑对腊冬。白露凉忽至，惊蛰雷轰隆。／ 26<br/>巳午伏闷热，丑寅夜朦胧。酉戌看暮霭，宿半话入梦。／ 27<br/>排布星辰亮，拱列霓与虹。夸父追曦曜，嫦娥住蟾宫。／ 28<br/>彤旭耀寰球，名岳谓岱宗。俯瞰瞿塘峡，翘颈仰恒嵩。／ 29<br/>陡峭岭逶迤，澎湃涛汹涌。滂沱倾灵液，亘久润虬榕。／ 30<br/>社树现福瑞，凤凰栖梧桐。桂魄旋晦朔，瀛洲觅丹踪。／ 31<br/>劫噩占卦卜，谜昧问昊穹。恍惚寐慌栗，妖魔吓惧悚。／ 32<br/>临碣瞻浩瀚，登岩赏绯枫。杜鹃朵灿烂，君乃梅竹松。／ 33<br/>山林躲鸟兽，峥嵘鹰窝峰。旱亩盼霖沐，沁燥思贯融。／ 34<br/>熔浆喷吞噬，汪洋骇翻洪。渤澥波澜掀，咆哮潮奔泷。／ 35<br/>溃涨淤滚沸，雨滴响叮咚。寒食舞柳絮，音籁顾寮篷。／ 37<br/>葵芍蕊槐序，萧煞漫蒲绒。藤蔓绕桦杉，荆萝缠矮丛。／ 38<br/>渊溪浮萍隐，沿滨椰榈棕。最晚荼蘼花，阑珊瞬消溶。／ 39<br/>攀得枇杷果，弄荷摘莲蓬。篱笆蔷薇绿，冲激挂悬淙。／ 40<br/>瀑水滔崩溅，震撼汽恢宏。／ 41<br/>二<br/>景致斯旖旎，极限杳苍茫。九隅驰尘埃，四海划船桨。／ 42<br/>嶙峋崖峤怪，楫篙泊埠港。鸥鹭禽展翅，舳舻踏漭沧。／ 43<br/>舰艇驶北冥，征艘廓舷舱。摆舵号摇橹，查迹索滥觞。／ 44<br/>韧苗隙礁缝，榆杨环甸旁。榴苹植盆栽，亭侧挺翠篁。／ 45<br/>艾叶但凋零，蓑笠迎雪霜。堑壕崎崤函，漓鲤涟漪漾。／ 46<br/>长青樟橡柏，峪麓联屏障。边陲滇陇黔，秀丽浙沪杭。／ 47<br/>岛屿湾琼澳，叠嶂闽渝川。夹岸猴猿啼，渔帆漂沅湘。／ 48<br/>巍邈峨眉顶，耸峻昆仑巅。渑池晖炫目，雁荡兀踞蟠。／ 49<br/>悠渺洞庭雾，晨烁绚银滩。偶眺鹳雀楼，余醺斜倚栏。／ 50<br/>玫牡枝头蒂，含苞卉鲜艳。琪瑶绽蓓蕾，阆苑驾舆鸾。／ 51<br/>趟岖涧蜿蜒，见蹊径辗转。岚幕若薄纱，悄默罩层峦。／ 52<br/>三<br/>蔚蓝隼遨逸，潭深潜蛟龙。鲸鲨穿沓浪，摧枯呆罴熊。／ 53<br/>伶俐颖鹦鹉，鹞鹫翼乘风。譬喻狐狸伪，涯沼鳄蟒凶。／ 54<br/>狰讹蔑貉狈，喧嚣赌鸣蛩。姹紫忙酿蜜，锦簇戏蝶蜂。／ 55<br/>乌鸦吵聒噪，鸱鸮叫怖恐。危折蜥蜴尾，迅疾飘骝鬃。／ 56<br/>蚂蚁励恳劳，鸳鸯侣携泳。虾蟹螯钳并，蜈蚣百肢虫。／ 57<br/>蜘蛛网蚊蝇，蝴蛾缚化蛹。蜻蜓保禾粟，摩拳习螳螂。／ 58<br/>蛤蟆幼蝌蚪，瞋蛙士气昂。萦愁邮迢递，鹁鸽任翱翔。／ 59<br/>暗途参萤璨，璇玑示迷航。骏马挣槽枥，蓄势志未央。／ 60<br/>犀兕革媲铁，不挠意胜钢。荒漠驭骆驼，驯服弯鼻象。／ 61<br/>揽辔领羔犊，无垠遥旷莽。猫狗供抚娱，驴骡畜吆唤。／ 62<br/>蜉蝣命须臾，玳瑁寿绵延。／ 63<br/>第二部分　历史知识<br/>一<br/>蚩尤扰黎胥，轩辕复一统。咸安巡界域，西行访崆峒。／ 66<br/>霆威偕电闪，祝氏斗共工。仓颉造字符，嫘祖饲蚕桑。／ 67<br/>宁靖庶淳朴，尧舜唯禅让。禹技通河患，夏代初莅王。／ 68<br/>伊尹遣庖厨，肝脑侍贤汤。履癸桀暴虐，覆没继以商。／ 69<br/>般庚迁殷墟，龟甲记史纲。鼎铭司母戊，贱奴怜殉葬。／ 70<br/>囹圄算易理，羑狱困姬昌。渭畔直钩坐，吕尚亦姓姜。／ 71<br/>幸佑逢知己，伐恶民所望。盟津竖义旗，抱节饿首阳。／ 72<br/>倒戈附周旅，纣奢鹿台丧。叔旦三吐哺，惩毖永流芳。／ 73<br/>都郡新洛邑，颐穆享亨旺。烽火姒妃笑，镐京犬戎败。／ 74<br/>侈庇刁苛刑，爱溺诈诳罔。春秋侯轮霸，赛竞谋私囊。／ 75<br/>重耳曾颠沛，晋文渐兴邦。敏高假郑使，诡黠退敌将。／ 76<br/>伍员辅阖闾，孙武计扶匡。仲尼杰识礼，课业述伦常。／ 77<br/>越勾舔胆汁，卧薪辱勿忘。事了泛扁舟，陶朱伴夷光。／ 78<br/>战国纷兵祸，墨翟比巨匠。智伯毁贪愎，赵韩魏獗猖。／ 79<br/>南门扛棒走，变法是卫鞅。庞涓剜膑膝，救邯胁大梁。／ 80<br/>缔约议合纵，连横张仪倡。骑射效虏术，阔袍改胡裳。／ 81<br/>昭襄听诬陷，何辜禁孟尝。郭隗寓骥骨，乐毅锐谁当。／ 82<br/>齐单焱牛猛，骄矜岂堪挡。汨罗浴兰涕，屈原愤投江。／ 83<br/>蔺卿护璧玺，赔罪负棘杖。近攻远结友，范雎册丞相。／ 84<br/>妄括笨庸碌，屠夫坑杀降。毛遂促歃血，信陵袭营房。／ 85<br/>贾韦居奇货，恃傲欺朝堂。廷尉谗非死，戕朋饶哪桩。／ 86<br/>燕储炼毒匕，刺政轲身亡。翦贲灭六强，遐迩属始皇。／ 87<br/>奏旨刻小篆，衡定简度量。焚典书生埋，万里筑坚墙。／ 88<br/>赢亥戮胞族，宦寺权独掌。押犯赴御戍，泽地振吴广。／ 89<br/>会稽项揭竿，刘季逃芒砀。／ 90<br/>二<br/>元清满狄盛，繁荣推汉唐。运筹谈诸葛，诙谐聊东方。／ 91<br/>托孤嘱遗诏，孺帝多夭殇。博沙椎副车，曹刿荐鲁庄。／ 92<br/>织席演哽咽，阿瞒称枭篡。逵手裂狮虎，樊哙啖彘肩。／ 93<br/>彬谦羡管鲍，郦寄昔悖叛。董卓霹雳怒，部众缢隋炀。／ 94<br/>子逼爸逊位，哥丕鸩弟彰。恣肆废显睿，印绶归媚娘。／ 95<br/>和婚去土蕃，突厥焉能抗。徽钦汴州掳，鹏帅收建康。／ 96<br/>阁臣峙凌主，英宪厄阉党。倭酋炮卢沟，亿兆仇外番。／ 97<br/>招赘做驸婿，科举题金榜。嗣朕惮昏敝，狠绝跋扈官。／ 98<br/>赣皖平宸濠，守仁馨德传。宋末丘八懦，明戚歼寇乱。／ 99<br/>胤禛罚劣绅，弘历耻谏言。团宴措馐馔，銮殿蹈婵娟。／ 100<br/>努尔晓韬略，熙烨禀亶聪。害良桧谀佞，铡美拯耿忠。／ 101<br/>踢斛酷吏奸，淋尖佃户恸。翰院辞欢洽，你我碰杯觥。／ 102<br/>奠坟祈悼词，纠案诉诤讼。稀缺偷觊觎，珍异呈陛贡。／ 103<br/>祭祀备牺牲，缅忆搭庐冢。县爷衙署座，府差站两班。／ 104<br/>循堤垒砾袋，汛弁防坝堰。乞丐袄褴褛，挥霍衣绸缎。／ 105<br/>禄蠹矢之的，懊惋留嘘叹。／ 106<br/>三<br/>睡榻骤闻讯，漱洗矫跨鞍。驿僚送羽檄，阙前授牙璋。／ 108<br/>剿匪总督师，披铠绰缨枪。奋臂勉悍卒，叱咤鞭飞缰。／ 109<br/>旌仗力擂鼓，骂阵互试探。斧盾往厮夺，骁军决疆场。／ 110<br/>帐内频帷幄，凯捷返故乡。墓殂麻裹尸，爹妈泣断肠。／ 111<br/>徭役驻关隘，妻孩别心伤。／ 112<br/>四<br/>孔圣创儒训，诗经谱华章。释迦悟悲悯，道教尊李聃。／ 113<br/>济日渡鉴真，求佛涉玄奘。鹊陀罕神医，捉脉药疴疮。／ 114<br/>邕欧隶楷正，羲献草均专。庵庙持斋律，剃皈在戒坛。／ 115<br/>嗜瘾耽弈趣，增益阅期刊。棋局导圭臬，哲辩颇蕴涵。／ 116<br/>善琏扎湖笔，肇庆产端砚。潦寞拨琴瑟，羞扣琵琶弦。／ 117<br/>笙箫笛缭悦，铃钹锣铿锵。板桥扮糊涂，米芾佯痴狂。／ 118<br/>僧繇绘云螭，点睛便腾骧。彦钧炳瞎瞽，哑聋画世祥。／ 119<br/>秉灯研籍注，凿壁借辉煌。绛珠感瑛灌，还泪兮凄怆。／ 120<br/>颜回免二过，箪瓢处陋巷。孰由惜跬誉，召公存甘棠。／ 122<br/>鬼伎咒巫蛊，观天测魁冈。喝醪谪仙醉，曼吟歌佳篇。／ 123<br/>抽刀弃俗务，采菊想桃源。苏轼艺兼擅，陆游赋十千。／ 124<br/>蔡纸磁针巧，毕昇制活版。／ 125<br/>第三部分　人间百态<br/>一<br/>拼搏石可锲，克难彼慧勇。错后悔自省，忿怨宜反躬。／ 128<br/>淡利趋杵臼，同忾解曲衷。背恩竟忤逆，孝悌兹拜崇。／ 129<br/>殊勋承宣奖，敦俭蔼顺从。吩咐肺腑声，咏作吉贺颂。／ 130<br/>抑郁因器窄，襟怀贵有容。少忧固静肃，竭虑殆怔忡。／ 131<br/>究读忌照搬，迂讷弊愚瞢。纤细输豁达，粗糙该慎终。／ 132<br/>拖蹭蹉跎岁，拔萃数倍功。积微迄于著，分秒遁遽匆。／ 133<br/>臧否即褒贬，枢纽悉阐综。狡猾维俘获，窃盗拘囚笼。／ 134<br/>懒惰必滞碍，鳏寡受窘穷。敬老插茱萸，愍恤妥赡养。／ 135<br/>绩优需执着，愿就值舒畅。充裕掷秕屑，瑰宝谨贮藏。／ 136<br/>沦落其惭愧，艰贫奈恓惶。际遇靠坦诚，笃挚莫诌谎。／ 137<br/>疗治询彻底，察录确审详。篮足练体质，速快拍乒乓。／ 138<br/>译撰写样稿，稗说唾也谤。耍泼彪且妒，性纯慨而慷。／ 139<br/>描摹诫勒碑，谣谚讴诵唱。憋恨烟七窍，扯嗓吼秦腔。／ 140<br/>挫侮萌誓念，豪迈填胸膛。泰然嘲讥讽，谆睦恕宽谅。／ 141<br/>敛财准吝啬，离群格蹇亢。考评析疑惑，秘奥妙叙讲。／ 142<br/>侵挪畏把柄，弗癖欲则刚。拟规再订矩，臆判似冤枉。／ 143<br/>富宅宠纨绔，硕鼠蛀婪赃。怎肯拒贿赂，廉洁颁嘉状。／ 144<br/>歹徒特乖戾，憨愣蛮砸抢。拐骗皆太坏，蛇蝎锁锒铛。／ 145<br/>邪狞牢缧绁，侦缉贼遭殃。诽嫉嫌魑魅，干警擒魍魉。／ 146<br/>育女责媳妇，姑婆喜嫡郎。陈窖溢芬馥，濡沫惟糟糠。／ 148<br/>邻家碎句语，哀黯苦哭孀。妣殒惨嚎啕，失魂歉彷徨。／ 149<br/>茕孑只寂寥，胶漆伉俪双。钗黛倦闺中，娇慵觉绣床。／ 150<br/>浅施胭脂恰，姐妹抹匀妆。莹澈澄碧眼，冰月凝肌肪。／ 151<br/>恋慕躯健伟，侠情男俊朗。翩跹态婀娜，潇洒貌倜傥。／ 152<br/>皂靴裙衫俏，巾帽飒爽装。拾掇霞帔被，佩饰攒奁箱。／ 153<br/>刃镂麒麟纹，玉珏配嵌镶。雅懿应憧憬，邋遢惹憎厌。／ 154<br/>亲睹认瑕瑜，实践辨偏全。拂拭扫凡秽，览镜瞧冕冠。／ 155<br/>恭惕待左右，兄姊奉慈严。及笄已嫁娶，进仕诺壮年。／ 156<br/>烦恼添皱痕，衰累染鬓斑。犹豫尽踌躇，缘份系羁绊。／ 157<br/>浑倔面迟钝，侏盲甭诋谩。委顿腹饥馁，煦暖好酣眠。／ 158<br/>烛芯燎为炽，憾误俱熬煎。兢勤惦诲谕，漏残忍掩卷。／ 159<br/>修锻选栋才，冻疲图温饱。踔厉驱怏怯，慢等怕焦躁。／ 160<br/>凭甚压柔弱，睚眦叵耐报。希冀成懈矣，起跑趁今宵。／ 161<br/>二<br/>辽塞资畋猎，牧羊策驹骢。棍击豺狼豹，捕雕弩箭弓。／ 162<br/>磐险援狩客，森湿步樵童。膏壤本肥沃，稼穑学炎农。／ 163<br/>播秧依令候，动物论雌雄。具损请磨砺，糜粥缓病痛。／ 164<br/>畦垄芹韭嫩，芝圃橙柿红。嬉闹垂髫瘦，鹤发钓鱼翁。／ 165<br/>娉婷惠贞婉，淑姿类芙蓉。樱口整皓齿，炯视盯黑瞳。／ 166<br/>稻菽麦黍稷，垦耘谷茂丰。库堆锄镰铲，堡邸佣仆僮。／ 167<br/>室介柴榭寝，时间表晷钟。凹凸阡埂路，稚顽跳跃踊。／ 168<br/>井围集城镇，稠密人接踵。炊袅遍畴墅，蔽窑破裘茸。／ 169<br/>浽溦打檐槛，疏影驳窗栊。屋舍砍乔木，铸械锡铝铜。／ 170<br/>角爵斟醇酒，炉冶剑铓锋。朽支蘑菇伞，柯架葡萄棚。／ 171<br/>瓜薯形圆椭，杏莓个玲珑。闲暇来品茶，设筵酌几盅。／ 172<br/>煲锅炖鸡鸭，蒸煮饭粳粱。藩园种梨橘，郊渠捞螺蚌。／ 173<br/>烹炒荤腥素，调佐芥蒜葱。蜀椒辣唇嘴，鲈鲫卡喉咙。／ 174<br/>剖壳掏核肉，剥皮取瓣瓤。沏盏熟普洱，泡壶茉莉香。／ 175<br/>冷饮咖啡涩，甜味赤砂糖。逐棵寻蝉蜕，菜蔬坡梯田。／ 176<br/>耕犁又浇溉，歇息逛坊厢。肮脏滋瘟疫，欠粮灾涝蝗。／ 178<br/>徘徊村僻野，伫立幽泉傍。桌匣杂污垢，笋芽透筠廊。／ 179<br/>止渴葫芦勺，炙烈芭蕉扇。琉璃映五色，掐丝曰珐琅。／ 180<br/>贩贸聚街市，铺店钉牌幌。款贷签债契，赊买要抵偿。／ 181<br/>售卖赚币钞，汇率兑铢镑。塑泥烧砖瓦，估价换材矿。／ 182<br/>凛冽逞屯寨，呼啸吹苇帘。耙扬坪晒籽，削篾编箩筐。／ 184<br/>除夕燃彩焰，爆炸引硫黄。丈尺毫厘寸，锱较吨斤磅。／ 185<br/>韶龄弹指逝，刹那散如幻。劝您早付出，儿辈休谬赞。／ 186<br/>吾择加抖擞，急切每争先。殚精凑页码，韵诀到此完。／ 187</p>', 38, 38, 1199, '', 0, 0, '2023-04-26 15:12:13', 0, '2023-04-26 15:12:13');

-- ----------------------------
-- Table structure for tb_bookstore_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_carousel`;
CREATE TABLE `tb_bookstore_carousel`  (
                                          `carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
                                          `carousel_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播图',
                                          `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'##\'' COMMENT '点击后的跳转地址(默认不跳转)',
                                          `carousel_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
                                          `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                          `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者id',
                                          PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_carousel
-- ----------------------------
INSERT INTO `tb_bookstore_carousel` VALUES (18, 'http://localhost:8888/static/698d51a19d8a121ce581499d7b701668_20230424101911.png', 'https://book.douban.com/subject/33429002/', 1, 0, '2023-04-24 10:19:54', 0, '2023-04-24 10:19:54', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (19, 'http://localhost:8888/static/bcbe3365e6ac95ea2c0343a2395834dd_20230424102000.png', 'https://book.douban.com/subject/10808707/', 2, 0, '2023-04-24 10:21:31', 0, '2023-04-24 10:21:31', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (20, 'http://localhost:8888/static/310dcbbf4cce62f762a2aaa148d556bd_20230424102134.png', 'https://book.douban.com/subject/26831879/', 3, 0, '2023-04-24 10:22:03', 0, '2023-04-24 10:22:03', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (22, 'http://localhost:8888/static/15de21c670ae7c3f6f3f1f37029303c9_20230424102418.png', 'https://book.douban.com/subject/26899059/', 5, 0, '2023-04-24 10:24:44', 0, '2023-04-24 10:24:44', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (23, 'http://localhost:8888/static/fae0b27c451c728867a567e8c1bb4e53_20230424102447.png', 'https://book.douban.com/subject/5253939/', 6, 0, '2023-04-24 10:25:29', 0, '2023-04-24 10:25:29', 0);

-- ----------------------------
-- Table structure for tb_bookstore_index_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_index_config`;
CREATE TABLE `tb_bookstore_index_config`  (
                                              `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
                                              `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
                                              `config_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销图书 4-(首页)新品上线 5-(首页)为你推荐',
                                              `books_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '图书id 默认为0',
                                              `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
                                              `config_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
                                              `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
                                              `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
                                              PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_index_config
-- ----------------------------
INSERT INTO `tb_bookstore_index_config` VALUES (10, '走遍中国', 5, 666, '##', 1, 0, '2019-09-18 17:47:23', 0, '2023-04-25 15:40:33', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (22, '平语近人：习近平总书记用典', 4, 777, 'https://book.douban.com/subject/33429002/', 1, 0, '2019-09-19 23:26:05', 0, '2023-04-26 15:18:14', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (30, '鸟哥的Linux私房菜', 3, 9, 'https://book.douban.com/subject/4889838/', 4, 0, '2023-04-24 13:39:19', 0, '2023-04-26 15:24:50', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (34, '王昱珩解读三千字文', 4, 792, 'https://book.douban.com/subject/26899059/', 3, 0, '2023-04-26 15:17:45', 0, '2023-04-26 15:17:45', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (35, '傲慢与偏见', 3, 789, 'https://book.douban.com/subject/1083428/', 2, 0, '2023-04-26 15:24:28', 0, '2023-04-26 15:24:28', 0);

-- ----------------------------
-- Table structure for tb_bookstore_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_order`;
CREATE TABLE `tb_bookstore_order`  (
                                       `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
                                       `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
                                       `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户主键id',
                                       `total_price` int(11) NOT NULL DEFAULT 1 COMMENT '订单总价',
                                       `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
                                       `pay_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.无 1.支付宝支付 2.微信支付',
                                       `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
                                       `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
                                       `extra_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单body',
                                       `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
                                       PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_order
-- ----------------------------
INSERT INTO `tb_bookstore_order` VALUES (1, '16824719101412388', 1, 70, 1, 1, '2023-04-26 09:18:32', 4, '', 0, '2023-04-26 09:18:30', '2023-04-26 09:19:00');
INSERT INTO `tb_bookstore_order` VALUES (2, '16824913022447342', 1, 158, 1, 1, '2023-04-26 14:41:43', -1, '', 0, '2023-04-26 14:41:42', '2023-04-26 14:53:28');

-- ----------------------------
-- Table structure for tb_bookstore_order_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_order_address`;
CREATE TABLE `tb_bookstore_order_address`  (
                                               `order_id` bigint(20) NOT NULL,
                                               `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
                                               `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
                                               `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省',
                                               `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城',
                                               `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区',
                                               `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件详细地址(街道/楼宇/单元)',
                                               PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单收货地址关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_order_address
-- ----------------------------

-- ----------------------------
-- Table structure for tb_bookstore_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_order_item`;
CREATE TABLE `tb_bookstore_order_item`  (
                                            `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
                                            `order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单主键id',
                                            `books_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联图书id',
                                            `books_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时图书的名称(订单快照)',
                                            `books_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时图书的主图(订单快照)',
                                            `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '下单时图书的价格(订单快照)',
                                            `books_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(订单快照)',
                                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_order_item
-- ----------------------------
INSERT INTO `tb_bookstore_order_item` VALUES (1, 1, 777, '平语近人：习近平总书记用典', 'http://localhost:8888/static/f561aaf6ef0bf14d4208bb46a4ccb3ad_20230424135510.jpg', 70, 1, '2023-04-26 09:18:30');
INSERT INTO `tb_bookstore_order_item` VALUES (2, 2, 9, '鸟哥的Linux私房菜', 'http://localhost:8888/static/3c95c13e568540ee5b74a2236f282edf_20230424140407.jpg', 79, 1, '2023-04-26 14:41:42');
INSERT INTO `tb_bookstore_order_item` VALUES (3, 2, 9, '鸟哥的Linux私房菜', 'http://localhost:8888/static/3c95c13e568540ee5b74a2236f282edf_20230424140407.jpg', 79, 1, '2023-04-26 14:41:42');

-- ----------------------------
-- Table structure for tb_bookstore_shopping_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_shopping_cart_item`;
CREATE TABLE `tb_bookstore_shopping_cart_item`  (
                                                    `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
                                                    `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
                                                    `books_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联图书id',
                                                    `books_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(最大为5)',
                                                    `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
                                                    PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_shopping_cart_item
-- ----------------------------
INSERT INTO `tb_bookstore_shopping_cart_item` VALUES (1, 1, 777, 1, 1, '2023-04-26 09:16:48', '2023-04-26 09:16:48');
INSERT INTO `tb_bookstore_shopping_cart_item` VALUES (2, 1, 9, 1, 1, '2023-04-26 10:41:35', '2023-04-26 10:41:35');
INSERT INTO `tb_bookstore_shopping_cart_item` VALUES (3, 1, 9, 1, 1, '2023-04-26 11:24:55', '2023-04-26 11:24:55');

-- ----------------------------
-- Table structure for tb_bookstore_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_user`;
CREATE TABLE `tb_bookstore_user`  (
                                      `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
                                      `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
                                      `login_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
                                      `password_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
                                      `introduce_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
                                      `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '注销标识字段(0-正常 1-已注销)',
                                      `locked_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
                                      PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_user
-- ----------------------------
INSERT INTO `tb_bookstore_user` VALUES (1, '王小五', 'test', '098f6bcd4621d373cade4e832627b4f6', '不知道写什么', 0, 0, '2023-04-23 16:07:43');
INSERT INTO `tb_bookstore_user` VALUES (2, '悠悠', '13700002703', 'e10adc3949ba59abbe56e057f20f883e', '头发好少', 0, 1, '2020-05-22 08:44:57');

-- ----------------------------
-- Table structure for tb_bookstore_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_user_address`;
CREATE TABLE `tb_bookstore_user_address`  (
                                              `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
                                              `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户主键id',
                                              `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
                                              `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
                                              `default_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否为默认 0-非默认 1-是默认',
                                              `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省',
                                              `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城',
                                              `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区',
                                              `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件详细地址(街道/楼宇/单元)',
                                              `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                              PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_user_address
-- ----------------------------
INSERT INTO `tb_bookstore_user_address` VALUES (1, 1, '王小五', '15269651517', 1, '四川省', '成都市', '金牛区', '沙湾路77号', 0, '2023-04-24 10:38:46', '2023-04-26 09:18:21');

-- ----------------------------
-- Table structure for tb_bookstore_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_user_token`;
CREATE TABLE `tb_bookstore_user_token`  (
                                            `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
                                            `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token值(32位字符串)',
                                            `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                            `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'token过期时间',
                                            PRIMARY KEY (`user_id`) USING BTREE,
                                            UNIQUE INDEX `uq_token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_user_token
-- ----------------------------
INSERT INTO `tb_bookstore_user_token` VALUES (1, '873db2659dca9b3456371b3e4ab37471', '2023-04-26 13:44:18', '2023-04-28 13:44:18');

SET FOREIGN_KEY_CHECKS = 1;
