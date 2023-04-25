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

 Date: 25/04/2023 17:21:38
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_admin_user
-- ----------------------------
INSERT INTO `tb_bookstore_admin_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超管', 0);
INSERT INTO `tb_bookstore_admin_user` VALUES (2, 'newbee-admin1', 'e10adc3949ba59abbe56e057f20f883e', '新蜂01', 0);
INSERT INTO `tb_bookstore_admin_user` VALUES (3, 'newbee-admin2', 'e10adc3949ba59abbe56e057f20f883e', '新蜂02', 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bookstore_admin_user_token
-- ----------------------------
INSERT INTO `tb_bookstore_admin_user_token` VALUES (1, '3aee6f3e5f9248369d36669799822290', '2023-04-24 15:14:52', '2023-04-26 15:14:52');

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_carousel
-- ----------------------------
INSERT INTO `tb_bookstore_carousel` VALUES (18, 'http://localhost:8888/static/698d51a19d8a121ce581499d7b701668_20230424101911.png', 'https://book.douban.com/subject/33429002/', 1, 0, '2023-04-24 10:19:54', 0, '2023-04-24 10:19:54', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (19, 'http://localhost:8888/static/bcbe3365e6ac95ea2c0343a2395834dd_20230424102000.png', 'https://book.douban.com/subject/10808707/', 2, 0, '2023-04-24 10:21:31', 0, '2023-04-24 10:21:31', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (20, 'http://localhost:8888/static/310dcbbf4cce62f762a2aaa148d556bd_20230424102134.png', 'https://book.douban.com/subject/26831879/', 3, 0, '2023-04-24 10:22:03', 0, '2023-04-24 10:22:03', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (22, 'http://localhost:8888/static/15de21c670ae7c3f6f3f1f37029303c9_20230424102418.png', 'https://book.douban.com/subject/26899059/', 5, 0, '2023-04-24 10:24:44', 0, '2023-04-24 10:24:44', 0);
INSERT INTO `tb_bookstore_carousel` VALUES (23, 'http://localhost:8888/static/fae0b27c451c728867a567e8c1bb4e53_20230424102447.png', 'https://book.douban.com/subject/5253939/', 6, 0, '2023-04-24 10:25:29', 0, '2023-04-24 10:25:29', 0);

-- ----------------------------
-- Table structure for tb_bookstore_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_goods_category`;
CREATE TABLE `tb_bookstore_goods_category`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_goods_category
-- ----------------------------
INSERT INTO `tb_bookstore_goods_category` VALUES (1, 1, 0, '小说', 2, 0, '2023-04-25 00:11:17', 0, '2023-04-24 14:10:15', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (2, 1, 0, '人文社科', 3, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:10:38', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (3, 1, 0, '经济管理', 4, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:10:47', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (4, 1, 0, '成功励志', 7, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:22', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (5, 1, 0, '科技科普', 5, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:10:57', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (6, 1, 0, '计算机与互联网', 6, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:08', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (7, 1, 0, '生活', 9, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:29', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (8, 1, 0, '杂志', 10, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:11:42', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (9, 1, 0, '文学', 1, 0, '2023-04-25 00:11:30', 0, '2023-04-24 14:10:29', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (10, 2, 9, '世界名著', 1, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:12:28', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (11, 3, 10, '中国名著', 1, 0, '2023-04-25 00:10:07', 0, '2023-04-24 14:12:42', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (12, 3, 10, '英国名著', 2, 0, '2023-04-24 14:13:04', 0, '2023-04-24 14:13:04', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (13, 2, 8, '新闻人物', 1, 0, '2023-04-25 12:12:49', 0, '2023-04-25 12:12:49', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (15, 2, 8, '百科万象', 2, 0, '2023-04-25 12:22:55', 0, '2023-04-25 12:22:55', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (16, 3, 15, '旅游', 1, 0, '2023-04-25 13:31:24', 0, '2023-04-25 13:31:24', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (17, 2, 2, '社会纪实', 1, 0, '2023-04-25 16:02:33', 0, '2023-04-25 16:02:33', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (18, 3, 17, '马哲', 1, 0, '2023-04-25 16:03:01', 0, '2023-04-25 16:03:01', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (19, 2, 6, '运维', 1, 0, '2023-04-25 16:05:41', 0, '2023-04-25 16:05:41', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (20, 2, 6, '开发', 2, 0, '2023-04-25 16:05:50', 0, '2023-04-25 16:05:50', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (21, 2, 6, '算法', 3, 0, '2023-04-25 16:05:59', 0, '2023-04-25 16:05:59', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (22, 2, 6, '安全', 4, 0, '2023-04-25 16:06:07', 0, '2023-04-25 16:06:07', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (23, 3, 19, '实施运维', 1, 0, '2023-04-25 16:06:23', 0, '2023-04-25 17:04:02', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (24, 3, 19, '系统运维', 2, 0, '2023-04-25 16:06:53', 0, '2023-04-25 16:06:53', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (25, 3, 19, '桌面运维', 3, 0, '2023-04-25 16:07:24', 0, '2023-04-25 16:07:24', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (26, 3, 19, '自动化运维', 4, 0, '2023-04-25 16:07:34', 0, '2023-04-25 16:07:34', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (27, 3, 19, '大数据运维', 5, 0, '2023-04-25 16:07:44', 0, '2023-04-25 16:07:44', 0);
INSERT INTO `tb_bookstore_goods_category` VALUES (28, 3, 19, 'devops运维', 6, 0, '2023-04-25 16:08:07', 0, '2023-04-25 16:08:07', 0);

-- ----------------------------
-- Table structure for tb_bookstore_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_goods_info`;
CREATE TABLE `tb_bookstore_goods_info`  (
                                            `goods_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
                                            `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名',
                                            `goods_intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品简介',
                                            `goods_category_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联分类id',
                                            `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
                                            `goods_carousel` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
                                            `goods_detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
                                            `original_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品价格',
                                            `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品实际售价',
                                            `stock_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品库存数量',
                                            `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签',
                                            `goods_sell_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '商品上架状态 1-下架 0-上架',
                                            `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '添加者主键id',
                                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加时间',
                                            `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者主键id',
                                            `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品修改时间',
                                            PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 791 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_goods_info
-- ----------------------------
INSERT INTO `tb_bookstore_goods_info` VALUES (9, '鸟哥的Linux私房菜', 'Linux经典图书', 21, 'http://localhost:8888/static/3c95c13e568540ee5b74a2236f282edf_20230424140407.jpg', '/admin/dist/img/no-img.png', '<p>本书是最具知名度的Linux入门书《鸟哥的Linux私房菜基础学习篇》的最新版，全面而详细地介绍了Linux操作系统。全书分为5个部分：第一部分着重说明Linux的起源及功能，如何规划和安装Linux主机；第二部分介绍Linux的文件系统、文件、目录与磁盘的管理；第三部分介绍文字模式接口 shell和管理系统的好帮手shell脚本，另外还介绍了文字编辑器vi和vim的使用方法；第四部分介绍了对于系统安全非常重要的Linux账号的管理，以及主机系统与程序的管理，如查看进程、任务分配和作业管理；第五部分介绍了系统管理员(root)的管理事项，如了解系统运行状况、系统服务，针对登录文件进行解析，对系统进行备份以及核心的管理等。</p><p>本书内容丰富全面，基本概念的讲解非常细致，深入浅出。各种功能和命令的介绍，都配以大量的实例操作和详尽的解析。本书是初学者学习Linux不可多得的一本入门好书。</p>', 83, 79, 10, '', 0, 0, '2023-04-24 11:36:08', 0, '2023-04-24 14:04:34');
INSERT INTO `tb_bookstore_goods_info` VALUES (666, '走遍中国', '旅游书籍', 20, 'http://localhost:8888/static/a698fbc35bbb9e686aa5820079f42740_20230424140521.jpg', '/admin/dist/img/no-img.png', '<p><a href=\"https://book.douban.com/series/33672\">图说天下：国家地理</a>(共28册)， 这套丛书还有 《全球最美的100魅力古城》《失落的文明》《中国最美的100个地方》《游遍西藏-中国最美的地方精华特辑-图说天下》《全球最美的地方精华特辑.跟着电影去旅行》 等 。<br/></p>', 83, 79, 10, '', 0, 0, '2023-04-24 11:36:08', 0, '2023-04-24 14:05:28');
INSERT INTO `tb_bookstore_goods_info` VALUES (777, '平语近人：习近平总书记用典', '作者: 中共中央宣传部 / 中央广播电视总台', 18, 'http://localhost:8888/static/f561aaf6ef0bf14d4208bb46a4ccb3ad_20230424135510.jpg', '/admin/dist/img/no-img.png', '<p>由中共中央宣传部、中央广播电视总台联合创作的《百家讲坛》特别节目《平“语”近人——习近平总书记用典》将于8日至19日在央视综合频道晚间播出。节目从习近平总书记一系列重要讲话、文章、谈话中所引用的古代典籍和经典名句为切入点，旨在推动习近平新时代中国特色社会主义思想的生动阐释与广泛传播。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;据中央广播电视总台介绍，节目分为《一枝一叶总关情》《治国有常民为本》《国无德不兴》《国之本在家》《报得三春晖》《只留清气满乾坤》《绝知此事要躬行》《腹有诗书气自华》《恶竹应须斩万竿》《天下之治在人才》《咬定青山不放松》《天下为公行大道》12集，由“原声微视频”“思想解读”“经典释义”“现场访谈”“互动问答”“经典诵读”六个环节构成。<br/></p>', 69, 70, 1000000, '', 0, 0, '2023-04-24 11:36:08', 0, '2023-04-25 16:03:47');
INSERT INTO `tb_bookstore_goods_info` VALUES (788, '新疆 从这里开始', '都说新疆好地方，这个物产富饶、风景独好的省份，还拥有着5600多公里绵长的边境线，像是竖琴弯曲的琴颈，稳稳地围住了这方水土。', 16, 'http://localhost:8888/static/fcd99748cb6720b002105b4410279c93_20230425134312.jpg', '/admin/dist/img/no-img.png', '', 0, 0, 1000, '', 0, 0, '2023-04-25 13:44:35', 0, '2023-04-25 14:15:26');
INSERT INTO `tb_bookstore_goods_info` VALUES (789, '傲慢与偏见', '《傲慢与偏见》是简·奥斯汀的代表作，是一部描写爱情与婚姻的经典小说。作品以男女主人公达西和伊丽莎白由于傲慢和偏见而产生的爱情纠葛为线索，共写了四起姻缘：伊丽莎白与达西、简与宾利、莉迪亚与威克姆、夏洛蒂与柯林斯。伊丽莎白、简和莉迪亚是贝内特家五个女儿中的三个姐妹，而夏洛蒂则是她们的邻居，也是伊丽莎白的朋友。男主人公达西与宾利是好友，且与威克姆一起长大，而柯林斯则是贝内特家的远房亲戚。', 12, 'http://localhost:8888/static/170912fd1a77db906209eec82a7f3eb6_20230425154618.jpg', '/admin/dist/img/no-img.png', '<p>虚荣与骄傲是截然不同的东西，然而大家常常把它们当同义词来用。一个人可能骄傲而并不虚荣。骄傲多半涉及我们自己怎样看自己，而虚荣则涉及我们想别人怎样看我们。<br/></p>', 13, 13, 999, '', 0, 0, '2023-04-25 15:55:53', 0, '2023-04-25 15:55:53');
INSERT INTO `tb_bookstore_goods_info` VALUES (790, '月亮和六便士', '一个英国证券交易所的经纪人，本已有牢靠的职业和地位、美满的家庭，但却迷恋上绘画，像“被魔鬼附了体”，突然弃家出走，到巴黎去追求绘画的理想。他的行径没有人能够理解。他在异国不仅肉体受着贫穷和饥饿煎熬，而且为了寻找表现手法，精神亦在忍受痛苦折磨。经过一番离奇的遭遇后，主人公最后离开文明世界，远遁到与世隔绝的塔希提岛上。他终于找到灵魂的宁静和适合自己艺术气质的氛围...', 12, 'http://localhost:8888/static/951bfff9155e853f3a01fa4119630e06_20230425160010.jpg', '', '<p>一个英国证券交易所的经纪人，本已有牢靠的职业和地位、美满的家庭，但却迷恋上绘画，像“被魔鬼附了体”，突然弃家出走，到巴黎去追求绘画的理想。他的行径没有人能够理解。他在异国不仅肉体受着贫穷和饥饿煎熬，而且为了寻找表现手法，精神亦在忍受痛苦折磨。经过一番离奇的遭遇后，主人公最后离开文明世界，远遁到与世隔绝的塔希提岛上。他终于找到灵魂的宁静和适合自己艺术气质的氛围。他同一个土著女子同居，创作出一幅又一幅使后世震惊的杰作。在他染上麻风病双目失明之前，曾在自己住房四壁画了一幅表现伊甸园的伟大作品。但在逝世之前，他却命令土著女子在他死后把这幅画作付之一炬。通过这样一个一心追求艺术、不通人性世故的怪才，毛姆探索了艺术的产生与本质、个性与天才的关系、艺术家与社会的矛盾等等引人深思的问题。同时这本书也引发了人们对摆脱世俗束缚逃离世俗社会寻找心灵家园这一话题的思考，而关于南太平洋小岛的自然民风的描写也引人向往。</p><p>《月亮和六便士》说问世后，以情节入胜、文字深刻在文坛轰动一时，人们争相传看。在小说中，毛姆用第一人称的叙述手法，借“我”之口，叙述整个故事，有人认为这篇小说的原型是法国印象派画家高更，这更增加了它的传奇色彩，受到了全世界读者的关注。</p><h2>作者简介&nbsp;&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·</h2><p>威廉·萨默赛特·毛姆（William Somerset Maugham）于1874年1月25日出生在巴黎。父亲是律师，当时在英国驻法使馆供职。小毛姆不满十岁，父母就先后去世，他被送回英国由伯父抚养。毛姆进坎特伯雷皇家公学之后，由于身材矮小，且严重口吃，经常受到大孩子的欺凌和折磨，有时还遭到冬烘学究的无端羞辱。孤寂凄清的童年生活，在他稚嫩的心灵上投下了痛苦的阴影，养成他孤僻、敏感、内向的性格。幼年的经历对他的世界观和文学创作产生了深刻的影响。</p><p>1892年初，他去德国海德堡大学学习了一年。在那儿，他接触到德国哲学史家昆诺·费希尔的哲学思想和以易卜生为代表的新戏剧潮流。同年返回英国，在伦敦一家会计师事务所当了六个星期的练习生，随后即进伦敦圣托马斯医学院学医。为期五年的习医生涯，不仅使他有机会了解到底层人民的生活状况，而且使他学会用解剖刀一样冷峻、犀利的目光...</p>', 15, 15, 987, '', 0, 0, '2023-04-25 16:00:18', 0, '2023-04-25 16:00:18');

-- ----------------------------
-- Table structure for tb_bookstore_index_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_index_config`;
CREATE TABLE `tb_bookstore_index_config`  (
                                              `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
                                              `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
                                              `config_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
                                              `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品id 默认为0',
                                              `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
                                              `config_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
                                              `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
                                              `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
                                              PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bookstore_index_config
-- ----------------------------
INSERT INTO `tb_bookstore_index_config` VALUES (10, '走遍中国', 5, 666, '##', 1, 0, '2019-09-18 17:47:23', 0, '2023-04-25 15:40:33', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (22, '平语近人：习近平总书记用典', 4, 777, '##', 1, 0, '2019-09-19 23:26:05', 0, '2023-04-25 11:26:02', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (29, '走遍中国', 4, 666, '##', 2, 0, '2019-12-14 15:53:34', 0, '2023-04-25 11:26:05', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (30, '鸟哥的Linux私房菜', 3, 9, '##', 4, 0, '2023-04-24 13:39:19', 0, '2023-04-24 14:06:00', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (32, '走遍中国', 3, 666, '##', 1, 0, '2023-04-24 13:46:05', 0, '2023-04-24 13:46:05', 0);
INSERT INTO `tb_bookstore_index_config` VALUES (33, '平语近人：习近平总书记用典', 3, 777, '', 2, 0, '2023-04-24 13:53:55', 0, '2023-04-24 13:53:55', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bookstore_order
-- ----------------------------
INSERT INTO `tb_bookstore_order` VALUES (1, '16823039363159687', 7, 12999, 1, 1, '2023-04-24 10:38:59', 4, '', 0, '2023-04-24 10:38:56', '2023-04-24 11:20:30');
INSERT INTO `tb_bookstore_order` VALUES (2, '16823062954516390', 7, 15398, 1, 2, '2023-04-24 11:18:17', -1, '', 0, '2023-04-24 11:18:15', '2023-04-24 11:18:32');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单收货地址关联表' ROW_FORMAT = Dynamic;

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
                                            `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
                                            `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
                                            `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
                                            `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '下单时商品的价格(订单快照)',
                                            `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(订单快照)',
                                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bookstore_order_item
-- ----------------------------
INSERT INTO `tb_bookstore_order_item` VALUES (1, 1, 10269, 'Apple 2019新品 Macbook Pro 13...', '/goods-img/a2afdb6c-69a7-4081-bd09-62174f9f5624.jpg', 12999, 1, '2023-04-24 10:38:56');
INSERT INTO `tb_bookstore_order_item` VALUES (2, 2, 10320, 'Apple iPhone 11 Pro', '/goods-img/0025ad55-e260-4a00-be79-fa5b8c5ac0de.jpg', 9999, 1, '2023-04-24 11:18:15');
INSERT INTO `tb_bookstore_order_item` VALUES (3, 2, 10893, 'HUAWEI Mate 30 Pro 双4000万徕卡...', '/goods-img/mate30p2.png', 5399, 1, '2023-04-24 11:18:15');

-- ----------------------------
-- Table structure for tb_bookstore_shopping_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstore_shopping_cart_item`;
CREATE TABLE `tb_bookstore_shopping_cart_item`  (
                                                    `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
                                                    `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
                                                    `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
                                                    `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(最大为5)',
                                                    `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
                                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
                                                    PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bookstore_shopping_cart_item
-- ----------------------------
INSERT INTO `tb_bookstore_shopping_cart_item` VALUES (1, 7, 10269, 1, 1, '2023-04-24 10:32:39', '2023-04-24 10:32:39');
INSERT INTO `tb_bookstore_shopping_cart_item` VALUES (2, 7, 10320, 1, 1, '2023-04-24 10:41:00', '2023-04-24 10:43:01');
INSERT INTO `tb_bookstore_shopping_cart_item` VALUES (3, 7, 10893, 1, 1, '2023-04-24 10:42:50', '2023-04-24 10:42:50');

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_bookstore_user
-- ----------------------------
INSERT INTO `tb_bookstore_user` VALUES (1, '十三', '13700002703', 'e10adc3949ba59abbe56e057f20f883e', '我不怕千万人阻挡，只怕自己投降', 0, 1, '2020-05-22 08:44:57');
INSERT INTO `tb_bookstore_user` VALUES (6, '陈尼克', '13711113333', 'e10adc3949ba59abbe56e057f20f883e', '测试用户陈尼克', 0, 1, '2020-05-22 08:44:57');
INSERT INTO `tb_bookstore_user` VALUES (7, '测试用户', 'test', '098f6bcd4621d373cade4e832627b4f6', '', 0, 0, '2023-04-23 16:07:43');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bookstore_user_address
-- ----------------------------
INSERT INTO `tb_bookstore_user_address` VALUES (1, 7, '小五', '15269651517', 1, '江苏省', '南京市', '白下区', '交管大队', 0, '2023-04-24 10:38:46', '2023-04-24 10:38:46');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bookstore_user_token
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
