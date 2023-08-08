/*
 Navicat Premium Data Transfer

 Source Server         : one_year
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : 43.138.111.70:3306
 Source Schema         : chat-ai

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 08/08/2023 08:45:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_article
-- ----------------------------
DROP TABLE IF EXISTS `app_article`;
CREATE TABLE `app_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `read_count` int(11) NULL DEFAULT NULL COMMENT '阅读量',
  `support_count` int(11) NULL DEFAULT NULL COMMENT '点赞的数量',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '评论的数量',
  `collect_count` int(11) NULL DEFAULT NULL COMMENT '收藏的数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_article
-- ----------------------------
INSERT INTO `app_article` VALUES (2, 'test', '<strong><em>1111</em></strong>', '2023-07-22 13:38:42', 0, 0, 0, 0);
INSERT INTO `app_article` VALUES (4, 'ceshi111', '今天天气真好呀！', '2023-07-22 14:06:28', 0, 0, 0, 0);
INSERT INTO `app_article` VALUES (5, '夕阳无限好', '<strong><em>夕阳无限好</em></strong>', '2023-07-22 14:09:49', 0, 0, 0, 0);
INSERT INTO `app_article` VALUES (7, '初四', '<p><img src=\"/dev-api/profile/upload/2023/07/22/96145773074beeb63492237f9c469e3b_20230722182249A001.jpg\"></p>', '2023-07-22 18:26:35', 0, 1, 11, 0);

-- ----------------------------
-- Table structure for app_collect
-- ----------------------------
DROP TABLE IF EXISTS `app_collect`;
CREATE TABLE `app_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏的Id',
  `user_content` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的提问内容',
  `ai_content` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回的聊天内容',
  `content_id` int(11) NULL DEFAULT NULL COMMENT '关联的内容的id',
  `type` int(11) NULL DEFAULT NULL COMMENT '收藏的类型：1聊天、2广场、3攻略',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `content_id_index`(`content_id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_collect
-- ----------------------------
INSERT INTO `app_collect` VALUES (4, '123', '123', NULL, 1, 1, '2023-07-17 15:24:33');
INSERT INTO `app_collect` VALUES (5, '123', '123', NULL, 1, 1, '2023-07-17 15:24:34');
INSERT INTO `app_collect` VALUES (6, '123', '123', NULL, 1, 1, '2023-07-17 15:24:36');
INSERT INTO `app_collect` VALUES (9, '写日报', '今日工作总结：完成了项目的需求分析和初步设计，与团队成员讨论了进度和任务分配，明确了下一步的工作计划。', NULL, 1, 4, '2023-07-19 15:53:23');
INSERT INTO `app_collect` VALUES (10, '今天写了一篇文章', '今天我完成了一篇文章，内容是关于环保意识的重要性。在文章中，我提到了全球变暖、水源污染和垃圾处理等环境问题，并强调了每个人都应该积极参与环保行动的重要性。我还列举了一些简单实用的环保方法，如减少塑料使用、节约能源和多种植绿色植物等。希望通过这篇文章能够唤起更多人对环保的关注和行动起来的意识。', NULL, 1, 35, '2023-07-22 08:40:48');
INSERT INTO `app_collect` VALUES (20, NULL, NULL, 14, 2, 34, '2023-07-29 17:59:16');

-- ----------------------------
-- Table structure for app_comment
-- ----------------------------
DROP TABLE IF EXISTS `app_comment`;
CREATE TABLE `app_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论的消息的id',
  `type` int(11) NULL DEFAULT NULL COMMENT '评论的类型：2、广场、3攻略',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `is_content` int(11) NULL DEFAULT NULL COMMENT '评论的对象：1、问题、2、用户',
  `comment_user_id` int(11) NULL DEFAULT NULL COMMENT '评论的用户的id',
  `content` varchar(2555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论的内容',
  `to_comment_id` int(11) NULL DEFAULT NULL COMMENT '回复的评论的id',
  `is_read` int(11) NULL DEFAULT NULL COMMENT '是否已读：0、已读、1未读',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_id_index`(`comment_id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_comment
-- ----------------------------
INSERT INTO `app_comment` VALUES (26, 7, 3, 34, 1, NULL, '你好啊', NULL, 1, '2023-07-30 15:38:06');
INSERT INTO `app_comment` VALUES (38, 7, 2, 34, 1, NULL, '你好啊', NULL, 1, '2023-07-31 13:55:13');
INSERT INTO `app_comment` VALUES (39, 15, 2, 34, 1, NULL, '你好啊', NULL, 1, '2023-07-31 13:56:41');

-- ----------------------------
-- Table structure for app_comment_log
-- ----------------------------
DROP TABLE IF EXISTS `app_comment_log`;
CREATE TABLE `app_comment_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NULL DEFAULT NULL COMMENT '来源的用户的id',
  `to_user_id` int(11) NULL DEFAULT NULL COMMENT '评论的用户的id',
  `type` int(11) NULL DEFAULT NULL COMMENT '2广场、3攻略',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '广场或攻略的id',
  `comment_type` int(11) NULL DEFAULT NULL COMMENT '评论的类型。1、提问或者广场，2、用户的评论',
  `comment_id_real` int(11) NULL DEFAULT NULL COMMENT '广场或攻略的id（真实的）',
  `is_read` int(11) NULL DEFAULT NULL COMMENT '0已读、1未读',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_comment_log
-- ----------------------------

-- ----------------------------
-- Table structure for app_feedback
-- ----------------------------
DROP TABLE IF EXISTS `app_feedback`;
CREATE TABLE `app_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈的Id',
  `content` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈的内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `type` int(11) NULL DEFAULT NULL COMMENT '0意见反馈 1、广场 2攻略',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '举报的评论的id',
  `comment_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '举报的评论的内容',
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_feedback
-- ----------------------------
INSERT INTO `app_feedback` VALUES (1, '123', 1, 0, NULL, NULL, '系统反馈', '2023-07-17 15:25:55');
INSERT INTO `app_feedback` VALUES (3, '信息', 33, 0, NULL, NULL, '系统反馈', '2023-07-20 20:42:49');
INSERT INTO `app_feedback` VALUES (4, '我是一个人的人生态度和态度混为一谈', 38, 0, NULL, NULL, '系统反馈', '2023-07-22 13:47:34');
INSERT INTO `app_feedback` VALUES (5, 'e e e', 38, 0, NULL, NULL, '系统反馈', '2023-07-22 13:50:24');
INSERT INTO `app_feedback` VALUES (6, '怎么回事', 4, 0, NULL, NULL, '系统反馈', '2023-07-23 13:19:07');
INSERT INTO `app_feedback` VALUES (7, '你好', 4, 0, NULL, NULL, '系统反馈', '2023-07-23 13:20:11');
INSERT INTO `app_feedback` VALUES (8, '123', 34, 0, NULL, NULL, '系统反馈', '2023-07-30 12:12:29');
INSERT INTO `app_feedback` VALUES (9, '涉嫌涩情', 34, 1, 7, '你在喊吗', 'java开发时一种开发、后端卡发、运维', '2023-07-30 12:27:41');
INSERT INTO `app_feedback` VALUES (10, '涉嫌涩情', 34, 1, NULL, NULL, '狮子', '2023-07-30 19:42:04');
INSERT INTO `app_feedback` VALUES (11, '涉嫌涩情', 34, 1, NULL, NULL, '狮子', '2023-07-30 19:42:06');
INSERT INTO `app_feedback` VALUES (12, '涉嫌涩情', 34, 1, NULL, NULL, '狮子', '2023-07-30 19:42:08');
INSERT INTO `app_feedback` VALUES (13, '涉嫌涩情', 34, 1, NULL, NULL, '狮子', '2023-07-30 19:42:22');

-- ----------------------------
-- Table structure for app_good_message
-- ----------------------------
DROP TABLE IF EXISTS `app_good_message`;
CREATE TABLE `app_good_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键的Id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `user_message_id` int(11) NULL DEFAULT NULL COMMENT '用户的消息的Id',
  `user_message_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的消息',
  `ai_message_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ai回答的消息',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '评论的数量',
  `support_count` int(11) NULL DEFAULT NULL COMMENT '点赞的数量',
  `collect_count` int(11) NULL DEFAULT NULL COMMENT '收藏的数量',
  `forward_count` int(11) NULL DEFAULT NULL COMMENT '转发的数量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_good_message
-- ----------------------------
INSERT INTO `app_good_message` VALUES (1, 34, 1761, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 0, 0, 0, '2023-07-28 18:19:02');
INSERT INTO `app_good_message` VALUES (5, 34, 1761, 'java开发时一种开发、后端卡发、运维', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 1, 0, 0, '2023-07-28 18:19:03');
INSERT INTO `app_good_message` VALUES (6, 34, 1761, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 0, 0, 0, '2023-07-28 18:19:04');
INSERT INTO `app_good_message` VALUES (7, 34, 1761, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 1, 0, 0, 0, '2023-07-28 18:19:05');
INSERT INTO `app_good_message` VALUES (8, 34, 1761, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 0, 0, 0, '2023-07-28 18:19:06');
INSERT INTO `app_good_message` VALUES (9, 34, 1761, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 0, 0, 0, '2023-07-28 18:19:07');
INSERT INTO `app_good_message` VALUES (10, 34, 1761, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 0, 0, 0, '2023-07-28 18:19:08');
INSERT INTO `app_good_message` VALUES (11, 34, 1761, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 0, 0, 0, '2023-07-28 18:19:09');
INSERT INTO `app_good_message` VALUES (12, 34, 1761, 'java开发时一种开发、后端卡发、运维', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 0, 0, 0, '2023-07-28 18:19:10');
INSERT INTO `app_good_message` VALUES (13, 34, 1761, 'java开发时一种开发、后端卡发、运维', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 0, 1, 0, 0, '2023-07-28 18:19:12');
INSERT INTO `app_good_message` VALUES (14, 34, 1761, 'java开发时一种开发、后端卡发、运维', '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', 3, 1, 1, 0, '2023-07-28 18:20:02');
INSERT INTO `app_good_message` VALUES (15, 36, 1755, '狮子', '你管我', 2, 1, 0, 0, '2023-07-29 17:20:23');

-- ----------------------------
-- Table structure for app_key
-- ----------------------------
DROP TABLE IF EXISTS `app_key`;
CREATE TABLE `app_key`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `status` int(11) NULL DEFAULT NULL COMMENT '0正常、1异常',
  `use_status` int(11) NULL DEFAULT NULL COMMENT '0开启使用、1禁止使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_key
-- ----------------------------
INSERT INTO `app_key` VALUES (1, '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', 0, 0);

-- ----------------------------
-- Table structure for app_look
-- ----------------------------
DROP TABLE IF EXISTS `app_look`;
CREATE TABLE `app_look`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `good_message_id` int(11) NULL DEFAULT NULL COMMENT '查看答案的消息的id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `good_message_id_index`(`good_message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_look
-- ----------------------------

-- ----------------------------
-- Table structure for app_message
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息的id',
  `user_id` int(200) NULL DEFAULT NULL COMMENT '用户的id',
  `send_type` int(255) NULL DEFAULT NULL COMMENT '消息发送的类型（0代表用户发的，1代表机器人发的）',
  `type` int(255) NULL DEFAULT NULL COMMENT '消息的类型1、聊天',
  `content` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息的内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '消息的状态0正常1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1767 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_message
-- ----------------------------
INSERT INTO `app_message` VALUES (1331, 1, 0, 1, '给我一篇关于核聚变的论文', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1332, 1, 1, 1, '当然可以！下面是一篇关于核聚变的论文大纲，以及一些相关的参考文献和书籍供您参考：\n论文大纲：\nI. 引言\n- 背景介绍\n- 目的和意义\nII. 核聚变的基本概念\n- 核聚变与核裂变的区别\n- 核聚变的原理\nIII. 核聚变的研究历史\n- 早期研究的里程碑\n- 目前的研究进展\nIV. 核聚变的实验装置\n- 磁约束聚变（例如托卡马克）\n- 惯性约束聚变（例如激光聚变）\nV. 核聚变的挑战与解决方案\n- 温度和压力的要求\n- 聚变燃料的可获得性\n- 等离子体稳定性和约束问题\nVI. 核聚变的应用前景\n- 清洁能源的替代方案\n- 核聚变在航天领域的应用\n- 核聚变作为科学研究工具\nVII. 结论\n- 核聚变的优势和挑战\n- 未来研究的方向\n参考文献：\n1. Chen, G., & Bromberg, L. (2015). Fusion: Science, politics, and the invention of a new energy source. MIT Press.\n2. Wesson, J. (2016). Tokamaks (4th ed.). Oxford University Press.\n3. Freidberg, J. P. (2007). Plasma physics and fusion energy. Cambridge University Press.\n4. Stacey, W. M. (2010). Fusion: Science, politics, and the invention of a new energy source. Springer.\n5. Hutchinson, I. H. (2002). Principles of plasma diagnostics. Cambridge University Press.\n这些参考文献和书籍可以帮助您深入了解核聚变的原理、研究现状以及应用前景。希望对您的论文写作有所帮助！', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1333, 1, 0, 1, '给我一篇关于核聚变的论文', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1334, 1, 1, 1, '当然可以！下面是一篇关于核聚变的论文大纲，以及一些相关的参考文献和书籍供您参考：\n论文大纲：\nI. 引言\n- 背景介绍\n- 目的和意义\nII. 核聚变的基本概念\n- 核聚变与核裂变的区别\n- 核聚变的原理\nIII. 核聚变的研究历史\n- 早期研究的里程碑\n- 目前的研究进展\nIV. 核聚变的实验装置\n- 磁约束聚变（例如托卡马克）\n- 惯性约束聚变（例如激光聚变）\nV. 核聚变的挑战与解决方案\n- 材料工程挑战\n- 聚变反应堆设计与安全性考虑\nVI. 核聚变的应用前景\n- 清洁能源供应\n- 核废料处理\nVII. 结论\n- 核聚变的未来发展方向\n参考文献：\n1. Wesson, J. (2016). Nuclear Fusion: Half a Century of Magnetic Confinement Fusion Research. CRC Press.\n2. Chen, F. F. (2016). Introduction to Plasma Physics and Controlled Fusion. Springer.\n3. Freidberg, J. P. (2007). Plasma Physics and Fusion Energy. Cambridge University Press.\n4. Stott, P. E. (2011). Fusion: Science, Politics, and the Invention of a New Energy Source. MIT Press.\n5. Hu, H., & Qin, H. (2019). Inertial Fusion Energy: A Practical Introduction. CRC Press.\n这些参考文献和书籍将为您提供丰富的关于核聚变的相关知识和研究进展。希望对您的论文写作有所帮助！', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1335, 1, 0, 1, '我们进入角色扮演，你现在是我的女朋友，我要你向我表白', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1336, 1, 1, 1, '亲爱的，我真的很高兴能扮演你的女朋友，因为在这个角色中，我可以表达我对你的深深的爱意。\n我想对你说，自从我们相遇以来，你给我带来了无尽的快乐和幸福。你的温柔、关心和支持让我感到无比幸运，每一天都变得充满了阳光和希望。\n你是我生命中最特别的人，我的心里只有你一个。每次看到你的笑容，我的心都会为之跳动，每次听到你的声音，我的心都会为之颤动。你是我生活中的动力和梦想，我愿意陪伴你度过每一个美好的时刻。\n我爱你，不仅仅是因为你的外貌和才华，更是因为你的善良、坚强和真诚。和你在一起，我感受到了无尽的爱和温暖，你是我心灵的归宿，是我永远的依靠。\n无论未来会遇到什么困难和挑战，我都愿意牵着你的手一起面对，无论生活中发生什么，我都会一直守护着你。你的幸福就是我的幸福，你的梦想就是我的梦想。\n亲爱的，我希望我们的爱情能够如同星空般闪耀，永远不息。我愿意与你一起走过每一个人生的季节，共同创造属于我们的美好未来。\n我爱你，永远不变。', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1337, 1, 0, 1, '【书山有路勤为径，学海无涯苦作舟】用英文怎么说？', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1338, 1, 0, 1, '【书山有路勤为径，学海无涯苦作舟】用英文怎么说？', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1339, 1, 1, 1, '\"The road to knowledge is paved with diligence, and one must work hard to sail across the boundless sea of learning.\"', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1340, 1, 0, 1, '计算加速度的公式是什么？', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1341, 1, 1, 1, '加速度（acceleration）的公式是：\n加速度 = （末速度 - 初始速度）/ 时间间隔\n或者可以写成：\na = (v - u) / t\n其中，a代表加速度，v代表末速度，u代表初始速度，t代表时间间隔。', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1342, 1, 0, 1, '写一段transform模型的代码', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1343, 1, 1, 1, '当您提到\"transform模型\"时，我不确定您具体指的是哪种类型的转换模型，因为在不同的领域中，\"transform模型\"可以指代不同的概念和实现方式。以下是一个示例，展示了如何使用Python中的scikit-learn库中的`Transform`类来进行特征转换的代码：\n```python\nfrom sklearn.preprocessing import Transform\n# 创建一个Transform对象\ntransformer = Transform()\n# 假设我们有一个特征矩阵X\nX = [[1, 2], [3, 4], [5, 6]]\n# 使用Transform对象对特征矩阵X进行转换\nX_transformed = transformer.transform(X)\n# 查看转换后的特征矩阵\nprint(X_transformed)\n```\n请注意，这只是一个示例，`Transform`类和具体的转换方式会根据您的需求和具体问题而有所不同。您可能需要根据实际情况选择适合您的转换方法和参数设置。', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1344, 1, 0, 1, '给我一篇关于核聚变的论文', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1345, 1, 1, 1, '当然可以！下面是一篇关于核聚变的论文大纲，以及一些相关的参考文献和书籍供您参考：\n论文大纲：\nI. 引言\n- 背景介绍\n- 目的和意义\nII. 核聚变的基本概念\n- 核聚变与核裂变的区别\n- 核聚变的原理\nIII. 核聚变的研究历史\n- 早期研究的里程碑\n- 目前的研究进展\nIV. 核聚变的实验装置\n- 磁约束聚变（例如托卡马克）\n- 惯性约束聚变（例如激光聚变）\nV. 核聚变的挑战与解决方案\n- 等离子体稳定性与热输运\n- 材料工程与辐照损伤\nVI. 核聚变的应用前景\n- 清洁能源生产\n- 放射性废料处理\nVII. 结论\n- 对核聚变研究的总结和展望\n参考文献：\n1. Wesson, J. (2004). Tokamaks (4th ed.). Oxford, UK: Oxford University Press.\n2. Freidberg, J. P. (2007). Plasma Physics and Fusion Energy. Cambridge, UK: Cambridge University Press.\n3. Chen, F. F. (1984). Introduction to Plasma Physics and Controlled Fusion (Vol. 1). New York, NY: Plenum Press.\n4. Stacey, W. M. (2005). Fusion: Science, Politics, and the Invention of a New Energy Source. Singapore: World Scientific Publishing.\n5. ITER Organization. (2019). ITER: The Way to New Energy. ITER Organization Brochure.\n书籍：\n1. Wesson, J. (2004). Tokamaks (4th ed.). Oxford, UK: Oxford University Press.\n2. Freidberg, J. P. (2007). Plasma Physics and Fusion Energy. Cambridge, UK: Cambridge University Press.\n3. Chen, F. F. (1984). Introduction to Plasma Physics and Controlled Fusion (Vol. 1). New York, NY: Plenum Press.\n4. Stacey, W. M. (2005). Fusion: Science, Politics, and the Invention of a New Energy Source. Singapore: World Scientific Publishing.\n5. ITER Organization. (2019). ITER: The Way to New Energy. ITER Organization Brochure.\n希望这些资源能对您的论文写作和研究有所帮助！', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1346, 1, 0, 2, '给我一篇关于核聚变的论文', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1347, 1, 1, 2, '非常抱歉，我无法提供实际的论文。然而，我可以为您提供一些关于核聚变的参考资料，以帮助您进行相关研究。\n1. 文献参考：\n- \"Fusion: Science, Politics, and the Invention of a New Energy Source\" by George H. Neilson\n- \"Introduction to Plasma Physics and Controlled Fusion\" by Francis Chen\n- \"Nuclear Fusion: Half a Century of Magnetic Confinement Fusion Research\" by George H. Neilson\n- \"Magnetic Fusion Energy\" by George H. Neilson\n- \"An Indispensable Truth: How Fusion Power Can Save the Planet\" by Francis F. Chen\n2. 学术期刊：\n- \"Nuclear Fusion\" - 由国际聚变能组织（International Atomic Energy Agency）和欧洲聚变能协会（European Physical Society）合作出版的期刊，涵盖核聚变相关的原创研究论文和综述。\n3. 网络资源：\n- ITER官方网站：www.iter.org\n- 国际聚变能组织（International Atomic Energy Agency）官方网站：www.iaea.org/topics/nuclear-fusion\n这些资源应该能够为您提供关于核聚变的详细信息和研究进展。希望对您的研究有所帮助！如果您有其他问题或需要进一步帮助，请随时告诉我。', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1348, 1, 0, 2, '我写了代码', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1349, 1, 1, 2, '今天我完成了代码的编写，修复了一些bug，优化了性能，准备提交给团队进行代码审查。', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1350, 1, 0, 3, '我写了代码', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1351, 1, 1, 3, 'That\'s great! Could you please provide me with the code so that I can take a look and help you with any questions or issues you may have?', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1352, 1, 0, 3, '请问你吃饭了吗', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1353, 1, 1, 3, 'Have you had', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1354, 1, 0, 3, '请问你吃饭了吗', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1355, 1, 1, 3, 'Have you eaten yet?', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1356, 1, 0, 3, '我正在上学的路上', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1357, 1, 1, 3, 'That\'s great! Have a safe journey to school!', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1358, 1, 0, 5, 'java冒泡排序', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1359, 1, 1, 5, '冒泡排序是一种简单但效率较低的排序算法。它通过多次遍历待排序的元素，比较相邻的元素并交换位置，将最大（或最小）的元素逐渐交换到最后的位置。\n以下是Java语言实现冒泡排序的示例代码：\n```java\npublic class BubbleSort {\n    public static void bubbleSort(int[] array) {\n        int n = array.length;\n        for (int i = 0; i < n - 1; i++) {\n            for (int j = 0; j < n - i - 1; j++) {\n                if (array[j] > array[j + 1]) {\n                    // 交换相邻元素的位置\n                    int temp = array[j];\n                    array[j] = array[j + 1];\n                    array[j + 1] = temp;\n                }\n            }\n        }\n    }\n    public static void main(String[] args) {\n        int[] array = {5, 3, 8, 2, 1, 4};\n        bubbleSort(array);\n        System.out.println(\"排序后的数组：\");\n        for (int num : array) {\n            System.out.print(num + \" \");\n        }\n    }\n}\n```\n在以上代码中，我们定义了一个`bubbleSort`方法来执行冒泡排序。通过嵌套的两个循环，逐个比较相邻元素并交换位置，直到所有元素都按照升序排列。在`main`方法中，我们创建了一个待排序的整数数组，并调用`bubbleSort`方法对其进行排序。最后打印排序后的数组。\n希望这个示例能够帮助你理解冒泡排序的实现方式。如果你有任何问题，请随时提问。', '2023-07-14 19:26:41', 0);
INSERT INTO `app_message` VALUES (1360, 1, 0, 5, '孩子进入叛逆期该怎么办？', '2023-07-15 19:26:41', 0);
INSERT INTO `app_message` VALUES (1361, 1, 1, 5, '孩子进入叛逆期是正常的成长过程，但对于父母来说可能是一个挑战。以下是一些建议，帮助你应对孩子的叛逆期：\n1. 保持沟通：与孩子保持良好的沟通非常重要。尽量倾听他们的想法和感受，尊重他们的独立性，同时表达你的关心和支持。\n2. 建立互信：建立互信关系是关键。尽量避免过度批评或指责，而是给予积极的反馈和鼓励，让孩子感到你是他们的支持者。\n3. 设定清晰的规矩和界限：制定明确的规矩和界限，让孩子知道哪些行为是可以接受的，哪些是不可接受的。同时，也要为他们提供适当的自由度和责任感。\n4. 提供积极的角色模型：作为父母，要成为孩子的积极榜样。展示良好的行为习惯和价值观，让他们学习到正确的价值观念。\n5. 寻求专业帮助：如果你感觉自己无法应对孩子的叛逆行为，不要犹豫寻求专业的帮助和咨询。专业人士可以提供更深入的建议和支持。\n请记住，每个孩子都是独特的，需要个性化的关注和理解。尽量保持耐心和理解，并与孩子一起成长。', '2023-07-15 19:26:41', 0);
INSERT INTO `app_message` VALUES (1362, 4, 0, 1, 'hello', '2023-07-16 14:00:31', 0);
INSERT INTO `app_message` VALUES (1363, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-16 14:00:34', 0);
INSERT INTO `app_message` VALUES (1364, 4, 0, 1, 'hello', '2023-07-16 14:00:48', 0);
INSERT INTO `app_message` VALUES (1365, 4, 1, 1, 'Hello! How can I help you today?', '2023-07-16 14:00:50', 0);
INSERT INTO `app_message` VALUES (1366, 4, 0, 1, 'hello', '2023-07-16 14:05:05', 0);
INSERT INTO `app_message` VALUES (1367, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-16 14:05:06', 0);
INSERT INTO `app_message` VALUES (1368, 4, 0, 1, '你好', '2023-07-16 14:10:16', 0);
INSERT INTO `app_message` VALUES (1369, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 14:10:19', 0);
INSERT INTO `app_message` VALUES (1370, 4, 0, 1, '今天星期几', '2023-07-16 14:24:36', 0);
INSERT INTO `app_message` VALUES (1371, 4, 1, 1, '今天是星期几取决于你所在的时区和当前的日期。请告诉我你所在的时区和当前的日期，我可以帮你确认一下。', '2023-07-16 14:24:38', 0);
INSERT INTO `app_message` VALUES (1372, 4, 0, 1, 'hello', '2023-07-16 14:26:00', 0);
INSERT INTO `app_message` VALUES (1373, 1, 0, 5, '我们进入角色扮演，你现在是我的女朋友，我要你向我表白', '2023-07-16 14:26:03', 0);
INSERT INTO `app_message` VALUES (1374, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-16 14:26:08', 0);
INSERT INTO `app_message` VALUES (1375, 1, 1, 5, '亲爱的，你是我生命中最特别的存在。从我第一次见到你的那一刻起，我就被你的美丽和温柔所吸引。每一天，我都感到无比幸运，因为有你陪伴在我身边。\n你给予我无尽的爱和支持，让我感到无比安心和满足。你的微笑是我每天的阳光，你的温暖是我心灵的庇护所。我真心地爱着你，愿意为你付出一切。\n在你身边的时候，我感到无比幸福和满足，因为你是我真正的归宿。无论经历怎样的挫折和困难，我都愿意与你并肩前行，守护你，照顾你，给你最温暖的拥抱。\n我承诺，无论发生什么，我都会一直陪伴在你身边，为你撑起一片天空。你的快乐就是我的快乐，你的悲伤就是我的悲伤。我愿意与你共度一生，直到永远。\n亲爱的，你愿意接受我的真心表白吗？我爱你，永远爱你。', '2023-07-16 14:26:08', 0);
INSERT INTO `app_message` VALUES (1376, 1, 0, 1, '给我一篇关于核聚变的论文', '2023-07-16 14:26:37', 0);
INSERT INTO `app_message` VALUES (1377, 1, 1, 1, '当然可以！下面是一篇关于核聚变的论文大纲，以及一些相关的参考文献和书籍供您参考：\n论文大纲：\nI. 引言\n- 背景介绍\n- 目的和意义\nII. 核聚变的基本概念\n- 核聚变与核裂变的区别\n- 核聚变的原理\nIII. 核聚变的研究历史\n- 早期研究的里程碑\n- 目前的研究进展\nIV. 核聚变的实验装置\n- 磁约束聚变（例如托卡马克）\n- 惯性约束聚变（例如激光聚变）\nV. 核聚变的挑战与解决方案\n- 材料与工程问题\n- 等离子体物理问题\n- 聚变反应堆设计问题\nVI. 核聚变的应用前景\n- 清洁能源供应\n- 放射性废物管理\nVII. 结论\n- 总结论文的主要观点和发现\n参考文献：\n1. Wesson, J. (2016). Nuclear Fusion: Half a Century of Magnetic Confinement Fusion Research. CRC Press.\n2. Chen, F. F. (2016). Introduction to Plasma Physics and Controlled Fusion: Volume 1: Plasma Physics. Springer.\n3. Stacey, W. M. (2010). Fusion: Science, Politics, and the Invention of a New Energy Source. Springer.\n4. Freidberg, J. P. (2007). Plasma Physics and Fusion Energy. Cambridge University Press.\n5. Hirsch, R. L. (2015). Inertial Fusion Energy Target Injection, Tracking, and Beam Pointing. CRC Press.\n这些参考文献和书籍涵盖了核聚变的基本概念、研究历史、实验装置、挑战与解决方案以及应用前景等方面的内容，希望对您的论文写作和研究有所帮助。祝您顺利完成论文！', '2023-07-16 14:26:46', 0);
INSERT INTO `app_message` VALUES (1378, 1, 0, 1, '我们进入角色扮演，你现在是我的女朋友，我要你向我表白', '2023-07-16 14:27:05', 0);
INSERT INTO `app_message` VALUES (1379, 1, 1, 1, '亲爱的，我真的很高兴能扮演你的女朋友，因为在这个角色中，我可以表达我对你的深深的爱意。\n我想对你说，自从我们相遇以来，你给我带来了无尽的快乐和幸福。你的温柔、关心和支持让我感到无比幸运，每一天都变得充满了阳光和希望。\n你是我生命中最特别的人，我的心里只有你一个。每次看到你的笑容，我的心都会为之跳动，每次听到你的声音，我的心都会为之颤动。你是我生活中的动力和梦想，我愿意陪伴你度过每一个美好的时刻。\n', '2023-07-16 14:27:13', 0);
INSERT INTO `app_message` VALUES (1380, 4, 0, 1, 'hello', '2023-07-16 14:28:06', 0);
INSERT INTO `app_message` VALUES (1381, 4, 1, 1, 'Hello! How can I help you today?', '2023-07-16 14:28:08', 0);
INSERT INTO `app_message` VALUES (1382, 4, 0, 1, 'hello', '2023-07-16 14:29:51', 0);
INSERT INTO `app_message` VALUES (1383, 4, 0, 1, 'hello', '2023-07-16 14:31:59', 0);
INSERT INTO `app_message` VALUES (1384, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-16 14:32:01', 0);
INSERT INTO `app_message` VALUES (1385, 4, 0, 1, 'hello', '2023-07-16 14:32:58', 0);
INSERT INTO `app_message` VALUES (1386, 4, 1, 1, 'Hello! How can I help you today?', '2023-07-16 14:32:59', 0);
INSERT INTO `app_message` VALUES (1387, 4, 0, 1, '今天星期几', '2023-07-16 14:57:45', 0);
INSERT INTO `app_message` VALUES (1388, 4, 1, 1, '今天是星期几取决于你所在的时区和当前的日期。请告诉我你所在的时区和当前的日期，我可以帮你确认一下。', '2023-07-16 14:57:47', 0);
INSERT INTO `app_message` VALUES (1389, 4, 0, 1, '你好', '2023-07-16 15:24:45', 0);
INSERT INTO `app_message` VALUES (1390, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 15:24:47', 0);
INSERT INTO `app_message` VALUES (1391, 4, 0, 1, '你好', '2023-07-16 15:26:12', 0);
INSERT INTO `app_message` VALUES (1392, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 15:26:13', 0);
INSERT INTO `app_message` VALUES (1393, 4, 0, 1, '你好', '2023-07-16 15:29:10', 0);
INSERT INTO `app_message` VALUES (1394, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 15:29:11', 0);
INSERT INTO `app_message` VALUES (1395, 4, 0, 1, '你好', '2023-07-16 15:35:12', 0);
INSERT INTO `app_message` VALUES (1396, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 15:35:14', 0);
INSERT INTO `app_message` VALUES (1397, 4, 0, 1, '你好', '2023-07-16 15:36:45', 0);
INSERT INTO `app_message` VALUES (1398, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 15:36:48', 0);
INSERT INTO `app_message` VALUES (1399, 4, 0, 1, '你好', '2023-07-16 15:40:52', 0);
INSERT INTO `app_message` VALUES (1400, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 15:40:56', 0);
INSERT INTO `app_message` VALUES (1401, 4, 0, 1, '你好', '2023-07-16 15:44:35', 0);
INSERT INTO `app_message` VALUES (1402, 4, 0, 1, '你好', '2023-07-16 15:47:35', 0);
INSERT INTO `app_message` VALUES (1403, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-16 15:47:36', 0);
INSERT INTO `app_message` VALUES (1404, 4, 0, 1, '今天星期几', '2023-07-16 16:05:19', 0);
INSERT INTO `app_message` VALUES (1405, 4, 1, 1, '今天是星期几取决于你所在的时区和当前的日期。请告诉我你所在的时区和当前的日期，我可以帮你确认一下。', '2023-07-16 16:05:24', 0);
INSERT INTO `app_message` VALUES (1406, 4, 0, 1, '\n计算加速度的公式是什么', '2023-07-16 17:10:42', 0);
INSERT INTO `app_message` VALUES (1407, 4, 1, 1, '加速度（a）的计算公式是：加速度等于物体的变化速度（Δv）除以时间的变化量（Δt）。即，a = Δv/Δt。', '2023-07-16 17:10:46', 0);
INSERT INTO `app_message` VALUES (1408, 4, 0, 1, '\n我们进入角色扮演，你现在是我的女朋友，我要你向我表', '2023-07-16 17:11:34', 0);
INSERT INTO `app_message` VALUES (1409, 4, 1, 1, '亲爱的，我想告诉你，每天和你在一起都让我感到幸福无比。你的笑容是我生活中最美好的风景，你的温暖是我心灵最温柔的庇护所。和你在一起，我的世界充满了爱和快乐。无论遇到什么困难和挑战，我都愿意牵着你的手，共同面对。我爱你，永远爱你。你是我生命中最重要的人，我愿意陪伴你走过每一个人生的阶段。谢谢你给我无尽的爱和支持，我发自内心地爱你。', '2023-07-16 17:11:39', 0);
INSERT INTO `app_message` VALUES (1410, 4, 0, 1, 'hello', '2023-07-17 10:01:31', 0);
INSERT INTO `app_message` VALUES (1411, 4, 0, 1, 'hello', '2023-07-17 10:13:19', 0);
INSERT INTO `app_message` VALUES (1412, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 10:13:21', 0);
INSERT INTO `app_message` VALUES (1413, 4, 0, 1, 'hello', '2023-07-17 10:21:20', 0);
INSERT INTO `app_message` VALUES (1414, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 10:21:23', 0);
INSERT INTO `app_message` VALUES (1415, 4, 0, 1, 'Hello', '2023-07-17 10:28:57', 0);
INSERT INTO `app_message` VALUES (1416, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 10:28:59', 0);
INSERT INTO `app_message` VALUES (1417, 4, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-17 13:18:46', 0);
INSERT INTO `app_message` VALUES (1418, 4, 1, 1, '孩子进入叛逆期是成长过程中的一部分，但也可能给家庭带来一些挑战。以下是一些建议来处理孩子进入叛逆期的情况：\n1. 保持沟通：保持和孩子的开放沟通，倾听他们的想法和感受，尊重他们的观点。尽量避免过度批评或指责，而是倾向于理解和支持。\n2. 树立界限：确保在家中存在明确的规则和界限，让孩子知道什么是可以接受的行为，什么是不可接受的行为。同时，也要给予他们一定的自主权，让他们学会自己承担责任。\n3. 培养良好的情绪管理能力：帮助孩子学会管理自己的情绪，教导他们适当地表达愤怒或沮丧，而不是以激烈的方式发泄。\n4. 寻求专业支持：如果你觉得孩子的叛逆行为严重且无法自行解决，考虑寻求专业心理咨询或家庭治疗的支持。专业人士可以提供更具体和个性化的建议。\n5. 维持亲子关系：尽量保持与孩子的亲密关系，找到共同的兴趣和活动，促进亲子间的连结。通过积极参与他们的生活，建立信任和理解。\n请记住，每个孩子都是独特的，处理叛逆期需要耐心和理解。重要的是保持爱和支持的态度，帮助他们顺利度过这个阶段。', '2023-07-17 13:18:58', 0);
INSERT INTO `app_message` VALUES (1419, 4, 0, 1, 'Hello', '2023-07-17 14:52:18', 0);
INSERT INTO `app_message` VALUES (1420, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 14:52:22', 0);
INSERT INTO `app_message` VALUES (1421, 4, 0, 1, 'Hello', '2023-07-17 14:59:38', 0);
INSERT INTO `app_message` VALUES (1422, 4, 0, 1, 'Hello', '2023-07-17 15:01:45', 0);
INSERT INTO `app_message` VALUES (1423, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 15:01:48', 0);
INSERT INTO `app_message` VALUES (1424, 4, 0, 1, 'Hello', '2023-07-17 15:02:42', 0);
INSERT INTO `app_message` VALUES (1425, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 15:02:43', 0);
INSERT INTO `app_message` VALUES (1426, 4, 0, 1, 'Hello', '2023-07-17 15:15:25', 0);
INSERT INTO `app_message` VALUES (1427, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 15:15:30', 0);
INSERT INTO `app_message` VALUES (1428, 4, 0, 1, 'Hello', '2023-07-17 15:21:58', 0);
INSERT INTO `app_message` VALUES (1429, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 15:22:00', 0);
INSERT INTO `app_message` VALUES (1430, 4, 0, 1, 'test', '2023-07-17 15:53:51', 0);
INSERT INTO `app_message` VALUES (1431, 4, 0, 1, 'hi', '2023-07-17 15:55:19', 0);
INSERT INTO `app_message` VALUES (1432, 4, 0, 1, 'Hi', '2023-07-17 15:56:08', 0);
INSERT INTO `app_message` VALUES (1433, 4, 0, 1, 'hello', '2023-07-17 15:56:29', 0);
INSERT INTO `app_message` VALUES (1434, 4, 0, 1, 'Hello ', '2023-07-17 16:59:47', 0);
INSERT INTO `app_message` VALUES (1435, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 16:59:50', 0);
INSERT INTO `app_message` VALUES (1436, 4, 0, 1, 'Hello', '2023-07-17 17:03:36', 0);
INSERT INTO `app_message` VALUES (1437, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 17:03:38', 0);
INSERT INTO `app_message` VALUES (1438, 4, 0, 1, 'Hello', '2023-07-17 17:05:18', 0);
INSERT INTO `app_message` VALUES (1439, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 17:05:21', 0);
INSERT INTO `app_message` VALUES (1440, 4, 0, 1, 'Hello', '2023-07-17 17:06:41', 0);
INSERT INTO `app_message` VALUES (1441, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 17:06:43', 0);
INSERT INTO `app_message` VALUES (1442, 4, 0, 1, 'Hello ', '2023-07-17 17:09:25', 0);
INSERT INTO `app_message` VALUES (1443, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 17:09:27', 0);
INSERT INTO `app_message` VALUES (1444, 4, 0, 1, 'Hello', '2023-07-17 17:27:57', 0);
INSERT INTO `app_message` VALUES (1445, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 17:28:00', 0);
INSERT INTO `app_message` VALUES (1446, 4, 0, 1, 'Hello', '2023-07-17 17:30:43', 0);
INSERT INTO `app_message` VALUES (1447, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 17:30:44', 0);
INSERT INTO `app_message` VALUES (1448, 4, 0, 1, 'Hello', '2023-07-17 17:31:44', 0);
INSERT INTO `app_message` VALUES (1449, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-17 17:31:46', 0);
INSERT INTO `app_message` VALUES (1450, 4, 0, 2, '帮我写一份日报', '2023-07-17 19:20:43', 0);
INSERT INTO `app_message` VALUES (1451, 4, 1, 2, '当然可以帮你写一份日报。请告诉我你需要写日报的具体内容和日期，我会根据你的要求来编写。', '2023-07-17 19:20:46', 0);
INSERT INTO `app_message` VALUES (1452, 4, 0, 2, '帮我写日报', '2023-07-18 08:21:54', 0);
INSERT INTO `app_message` VALUES (1453, 4, 1, 2, '今日工作顺利，完成了项目进度的更新并参与了团队会议讨论。与同事合作良好，取得了不错的成果。明天计划继续推动项目进展，解决遇到的问题。', '2023-07-18 08:21:57', 0);
INSERT INTO `app_message` VALUES (1454, 4, 0, 2, '写日报', '2023-07-18 08:22:53', 0);
INSERT INTO `app_message` VALUES (1455, 4, 1, 2, '今日工作：完成了客户需求分析和竞品调研。明日计划：开始UI设计和编写需求文档。遇到问题：无。感想：充实的一天，期待明天的进展。', '2023-07-18 08:22:55', 0);
INSERT INTO `app_message` VALUES (1456, 4, 0, 2, '写日报', '2023-07-18 08:23:33', 0);
INSERT INTO `app_message` VALUES (1457, 4, 1, 2, '今日工作进展顺利，完成了项目的一部分，与团队成员沟通良好，遇到的问题得到了解决。明天计划继续推进项目，与同事协作更紧密，争取提前完成目标。', '2023-07-18 08:23:36', 0);
INSERT INTO `app_message` VALUES (1458, 4, 0, 2, '写日报', '2023-07-18 08:24:12', 0);
INSERT INTO `app_message` VALUES (1459, 4, 1, 2, '今日工作总结：完成了项目的前期调研和需求分析工作，与团队成员沟通讨论了解决方案。明日计划：继续进行项目开发，完成模块的设计与编码工作。感谢团队的支持与合作！', '2023-07-18 08:24:14', 0);
INSERT INTO `app_message` VALUES (1460, 4, 0, 3, 'Good morning ', '2023-07-18 08:25:13', 0);
INSERT INTO `app_message` VALUES (1461, 4, 1, 3, '早上好', '2023-07-18 08:25:15', 0);
INSERT INTO `app_message` VALUES (1462, 4, 0, 3, 'Hello ', '2023-07-18 08:25:26', 0);
INSERT INTO `app_message` VALUES (1463, 4, 1, 3, '你好', '2023-07-18 08:25:27', 0);
INSERT INTO `app_message` VALUES (1464, 4, 0, 2, '写日报', '2023-07-18 09:07:54', 0);
INSERT INTO `app_message` VALUES (1465, 4, 1, 2, '今日工作完成情况：完成了项目进度跟踪和数据分析工作，与团队成员进行了有效的沟通和协作。遇到的问题及解决方案：遇到了一个技术难题，经过调研和尝试，最终成功解决。明日工作计划：继续推进项目进度，准备项目汇报材料。', '2023-07-18 09:07:57', 0);
INSERT INTO `app_message` VALUES (1466, 4, 0, 2, '写日报', '2023-07-18 09:09:02', 0);
INSERT INTO `app_message` VALUES (1467, 4, 1, 2, '今日工作：完成了项目的前期调研和需求分析。与团队成员进行了沟通和协作，明确了任务分工和进度安排。解决了一些技术问题。明天计划：开始项目的具体开发工作，着手编写代码和进行测试。', '2023-07-18 09:09:05', 0);
INSERT INTO `app_message` VALUES (1468, 4, 0, 2, '写日报', '2023-07-18 09:19:14', 0);
INSERT INTO `app_message` VALUES (1469, 4, 1, 2, '今日工作总结：完成了项目中的任务并提交了相关文档。与团队成员积极合作，解决了遇到的问题。明日计划：继续推进项目进度，参与需求讨论会议。确认并准备下一阶段的任务。', '2023-07-18 09:19:17', 0);
INSERT INTO `app_message` VALUES (1470, 4, 0, 1, '你好', '2023-07-19 15:43:23', 0);
INSERT INTO `app_message` VALUES (1471, 4, 1, 1, '你好！有什么我可以帮你的吗？', '2023-07-19 15:43:26', 0);
INSERT INTO `app_message` VALUES (1472, 4, 0, 2, '写日报', '2023-07-19 15:53:19', 0);
INSERT INTO `app_message` VALUES (1473, 4, 1, 2, '今日工作总结：完成了项目的需求分析和初步设计，与团队成员讨论了进度和任务分配，明确了下一步的工作计划。', '2023-07-19 15:53:21', 0);
INSERT INTO `app_message` VALUES (1474, 33, 0, 1, '你好', '2023-07-20 20:29:34', 0);
INSERT INTO `app_message` VALUES (1475, 33, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-20 20:29:36', 0);
INSERT INTO `app_message` VALUES (1476, 33, 0, 1, '今天是几号', '2023-07-20 20:29:57', 0);
INSERT INTO `app_message` VALUES (1477, 33, 1, 1, '今天是2022年11月28日，星期一。请问有什么我可以帮助您的吗？', '2023-07-20 20:29:59', 0);
INSERT INTO `app_message` VALUES (1478, 33, 0, 1, '什么是transformer算法', '2023-07-20 21:04:05', 0);
INSERT INTO `app_message` VALUES (1479, 33, 1, 1, 'Transformer算法是一种用于自然语言处理（NLP）任务的深度学习模型，由Vaswani等人于2017年提出。它在很多NLP任务中取得了重大的突破，如机器翻译、文本生成、问答系统等。\nTransformer算法的核心思想是自注意力机制（Self-Attention），它能够有效地捕捉句子中不同位置之间的依赖关系。相比于传统的循环神经网络（RNN）或卷积神经网络（CNN），Transformer能够并行计算，加速了模型的训练和推理过程。\nTransformer模型由编码器和解码器组成。编码器负责将输入序列转换为一个抽象的表示，解码器则基于该表示生成目标序列。编码器和解码器都由多层的自注意力机制和前馈神经网络组成。\nTransformer算法的优势在于其能够处理长文本序列，并且能够更好地捕捉句子中的语义信息。它已经成为NLP领域中最重要的模型之一，并且在许多任务中取得了领先的性能。', '2023-07-20 21:04:15', 0);
INSERT INTO `app_message` VALUES (1480, 33, 0, 1, '你是chatgpt几', '2023-07-20 21:05:59', 0);
INSERT INTO `app_message` VALUES (1481, 33, 1, 1, '我是OpenAI的GPT-3模型，被称为ChatGPT。它是目前最先进的基于语言的AI模型之一，具有强大的自然语言处理能力。我被训练来进行对话和提供各种知识和帮助。有什么我可以为您做的呢？', '2023-07-20 21:06:02', 0);
INSERT INTO `app_message` VALUES (1482, 33, 0, 1, '哈哈哈哈', '2023-07-20 21:07:15', 0);
INSERT INTO `app_message` VALUES (1483, 33, 1, 1, '看来你很开心！如果有什么事情让你开心，我也会很高兴。有什么我可以帮助你的吗？', '2023-07-20 21:07:17', 0);
INSERT INTO `app_message` VALUES (1484, 33, 0, 1, '哈哈哈', '2023-07-20 21:12:21', 0);
INSERT INTO `app_message` VALUES (1485, 33, 1, 1, '你好像很开心呢！如果有什么让你笑得更开心的事情，我也可以分享一些有趣的故事或者和你一起开心地聊天。有什么我可以帮助你的吗？', '2023-07-20 21:12:24', 0);
INSERT INTO `app_message` VALUES (1486, 33, 0, 1, '你好', '2023-07-20 21:13:18', 0);
INSERT INTO `app_message` VALUES (1487, 33, 1, 1, '你好！很高兴见到你。有什么我可以帮助你的吗？', '2023-07-20 21:13:20', 0);
INSERT INTO `app_message` VALUES (1488, 33, 0, 1, '请问什么是', '2023-07-20 21:13:45', 0);
INSERT INTO `app_message` VALUES (1489, 33, 1, 1, '请问您想了解什么呢？请提供更多的信息，我会尽力帮助您解答。', '2023-07-20 21:13:46', 0);
INSERT INTO `app_message` VALUES (1490, 33, 0, 1, '什么是人工智能', '2023-07-20 21:13:57', 0);
INSERT INTO `app_message` VALUES (1491, 33, 1, 1, '人工智能（Artificial Intelligence，简称AI）是指机器能够模拟和展现出人类智能的一种技术和科学。它涵盖了多个领域，包括机器学习、自然语言处理、计算机视觉、专家系统等。人工智能的目标是使机器能够执行像人类一样的智能活动，如理解、学习、推理、决策和交流。\n人工智能可以应用于各个领域，如语音助手、自动驾驶汽车、智能机器人、医疗诊断、金融分析等。它的发展不仅带来了许多便利和创新，还在某些领域取得了突破性的进展。然而，人工智能仍然是一个快速发展和不断探索的领域，有许多挑战需要克服，如数据隐私、伦理问题等。', '2023-07-20 21:14:03', 0);
INSERT INTO `app_message` VALUES (1492, 33, 0, 1, '我们进入角色扮演，你现在是我的女朋友，我要你向我表白', '2023-07-20 21:21:29', 0);
INSERT INTO `app_message` VALUES (1493, 33, 1, 1, '亲爱的，我从心底里喜欢你，每一天和你在一起都让我感到无比幸福。你的笑容是我每天的动力，你的温柔和关怀让我感受到无尽的温暖。你是我生命中最重要的人，我愿意陪伴你走过每一个难忘的时刻，分享每一个喜悦和忧愁。无论遇到什么困难和挑战，我会一直站在你的身旁，给予你坚定的支持和爱。我爱你，永远不会改变。', '2023-07-20 21:21:35', 0);
INSERT INTO `app_message` VALUES (1494, 4, 0, 1, '你好', '2023-07-21 11:58:06', 0);
INSERT INTO `app_message` VALUES (1495, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-21 11:58:08', 0);
INSERT INTO `app_message` VALUES (1496, 4, 0, 1, '嗨', '2023-07-21 11:58:34', 0);
INSERT INTO `app_message` VALUES (1497, 4, 1, 1, '嗨！有什么我可以帮你的吗？', '2023-07-21 11:58:36', 0);
INSERT INTO `app_message` VALUES (1498, 4, 0, 1, '帮我写一篇日报', '2023-07-21 11:58:49', 0);
INSERT INTO `app_message` VALUES (1499, 4, 1, 1, '当然可以帮你写日报，请告诉我日报的具体内容和格式要求，我将尽力帮你完成。', '2023-07-21 11:58:52', 0);
INSERT INTO `app_message` VALUES (1500, 4, 0, 1, '今天天气怎么样', '2023-07-21 11:59:24', 0);
INSERT INTO `app_message` VALUES (1501, 4, 1, 1, '抱歉，作为一个语言模型AI，我无法提供实时天气信息。你可以通过天气预报网站或者手机应用程序来获取准确的天气信息。希望你能度过一个美好的一天！有其他问题我可以帮你解答吗？', '2023-07-21 11:59:27', 0);
INSERT INTO `app_message` VALUES (1502, 4, 0, 1, '今天多少度', '2023-07-21 12:00:02', 0);
INSERT INTO `app_message` VALUES (1503, 4, 1, 1, '很抱歉，我无法提供实时的天气信息。建议你使用天气预报网站或手机应用程序来获取当地的实时温度信息。希望你度过一个愉快的一天！如果有其他问题，我会尽力帮助你。', '2023-07-21 12:00:05', 0);
INSERT INTO `app_message` VALUES (1504, 4, 0, 1, 'c++是什么', '2023-07-21 12:02:59', 0);
INSERT INTO `app_message` VALUES (1505, 4, 1, 1, 'C++是一种编程语言，它是从C语言发展而来的，并在其基础上增加了许多新的特性和功能。C++是一种通用的、静态类型的编程语言，被广泛用于开发各种应用程序，包括系统软件、游戏、桌面应用、移动应用等。它支持面向对象编程（OOP）和泛型编程，具有高效性、可移植性和灵活性等特点。C++语言的语法和语义比较复杂，但也因此提供了更多的控制和灵活性，使开发者能够更好地进行底层编程和性能优化。', '2023-07-21 12:03:04', 0);
INSERT INTO `app_message` VALUES (1506, 4, 0, 1, '描述一下编程', '2023-07-21 12:05:09', 0);
INSERT INTO `app_message` VALUES (1507, 4, 1, 1, '编程是一种创造性的过程，通过编写一系列指令或代码，告诉计算机如何执行特定的任务或操作。编程涉及到使用编程语言来表达思想和逻辑，以解决问题、开发软件应用或实现功能。\n编程的过程通常包括以下几个关键步骤：\n1. 理解问题：首先需要明确问题的需求和目标，理解要解决的具体问题。\n2. 设计算法：根据问题的要求，设计一个适当的算法或逻辑流程图，确定如何解决问题。\n3. 编写代码：使用所选的编程语言，按照设计的算法，编写代码来实现解决方案。代码是由一系列指令组成，用于执行特定的操作和逻辑。\n4. 调试和测试：在编写代码后，进行调试和测试，以确保代码的正确性和可靠性。通过测试，发现并修复可能存在的错误和问题。\n5. 运行和优化：将编写的代码运行在计算机或设备上，观察程序的运行结果，并根据需要进行优化，提高程序的性能和效率。\n编程是一项需要思考、逻辑推理和解决问题能力的技能。它涵盖了多种编程语言和工具，每种语言都有其特定的语法、规则和用途。通过编程，人们可以创建各种应用程序、网站、游戏和软件工具，实现各种复杂的功能和任务。', '2023-07-21 12:05:18', 0);
INSERT INTO `app_message` VALUES (1508, 4, 0, 1, '编程', '2023-07-21 12:05:50', 0);
INSERT INTO `app_message` VALUES (1509, 4, 1, 1, '编程是一种创造性的活动，通过编写一系列指令或代码，告诉计算机如何执行特定的任务。编程涉及使用编程语言来表达思想和逻辑，以解决问题、开发软件应用或实现功能。\n编程的过程通常包括以下几个关键步骤：\n1. 理解问题：首先，需要明确问题的需求和目标，了解要解决的具体问题。\n2. 设计算法：根据问题的要求，设计一个适当的算法或逻辑流程，确定如何解决问题。\n3. 编写代码：使用所选的编程语言，按照设计好的算法，编写代码来实现所需的功能。\n4. 调试和测试：运行代码，检查是否有错误或bug，并进行调试和修复。\n5. 运行和优化：在完成调试后，运行程序，观察其表现，并根据需要进行优化，提高程序的效率和性能。\n6. 维护和更新：随着时间的推移，程序可能需要进行维护和更新，以适应新的需求或修复现有问题。\n编程可以是有趣和具有挑战性的过程，它需要逻辑思维、问题解决能力和耐心。通过不断学习和实践，人们可以掌握编程技能，并创造出各种令人惊叹的软件应用和解决方案。', '2023-07-21 12:05:59', 0);
INSERT INTO `app_message` VALUES (1510, 4, 0, 1, '编程', '2023-07-21 12:06:27', 0);
INSERT INTO `app_message` VALUES (1511, 4, 1, 1, '编程是一种创造性的活动，通过编写一系列指令或代码，告诉计算机如何执行特定的任务。编程是将问题转化为计算机可以理解和执行的指令的过程。\n编程的过程通常包括以下几个步骤：\n1. 理解问题：明确问题的需求和目标，了解要解决的具体问题。\n2. 设计算法：根据问题的要求，设计一个解决问题的算法或逻辑流程。\n3. 编写代码：使用特定的编程语言，根据算法和逻辑流程，将问题的解决方案转化为可执行的代码。\n4. 调试和测试：运行代码，检查是否达到预期的结果，修复错误并进行测试。\n5. 优化和改进：根据需求和性能要求，对代码进行优化和改进，提高效率和可靠性。\n6. 部署和维护：将代码部署到目标环境，并进行后续的维护和更新。\n编程可以用于开发各种应用，包括网站、手机应用、游戏、桌面软件、嵌入式系统等。它是一项具有挑战性和创造性的技能，可以帮助实现想法并解决现实生活中的问题。', '2023-07-21 12:06:34', 0);
INSERT INTO `app_message` VALUES (1512, 4, 0, 1, '编程', '2023-07-21 12:06:57', 0);
INSERT INTO `app_message` VALUES (1513, 4, 1, 1, '编程是一种创造性的活动，通过编写一系列指令或代码，告诉计算机如何执行特定的任务。编程涉及使用编程语言来表达思想和逻辑，以解决问题、开发软件应用或实现功能。\n编程的过程通常包括以下几个关键步骤：\n1. 理解问题：首先，需要明确问题的需求和目标，了解要解决的具体问题。\n2. 设计算法：根据问题的要求，设计一个适当的算法或逻辑流程，确定如何解决问题。\n3. 编写代码：使用所选的编程语言，按照设计好的算法和逻辑，将问题的解决方案转化为可执行的代码。\n4. 调试和测试：对编写的代码进行调试和测试，确保程序功能正常、没有错误和异常。\n5. 部署和维护：将编写的程序部署到目标环境中，并进行后续的维护和更新。\n编程可以帮助我们实现各种任务和目标，从简单的计算和数据处理到复杂的软件开发和系统设计。它是现代科技和计算机应用的基石，也是创造和创新的关键工具。不同的编程语言和工具可以用于不同的应用领域和目标，让我们能够创造出更多有用和强大的软件应用。', '2023-07-21 12:07:05', 0);
INSERT INTO `app_message` VALUES (1514, 4, 0, 1, '你好', '2023-07-21 14:35:06', 0);
INSERT INTO `app_message` VALUES (1515, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-21 14:35:10', 0);
INSERT INTO `app_message` VALUES (1516, 4, 0, 1, '你好', '2023-07-21 14:44:21', 0);
INSERT INTO `app_message` VALUES (1517, 4, 1, 1, '你好！有什么我可以为你做的吗？', '2023-07-21 14:44:23', 0);
INSERT INTO `app_message` VALUES (1518, 4, 0, 1, '学习', '2023-07-21 14:46:46', 0);
INSERT INTO `app_message` VALUES (1519, 4, 1, 1, '当然！我可以帮助你学习各种知识。请告诉我你想学习的具体内容，我将尽力为你提供帮助和答疑解惑。无论是学术知识、技术知识还是其他领域的知识，我都会尽力满足你的学习需求。一起努力学习吧！', '2023-07-21 14:46:49', 0);
INSERT INTO `app_message` VALUES (1520, 4, 0, 1, '学习', '2023-07-21 14:48:04', 0);
INSERT INTO `app_message` VALUES (1521, 4, 1, 1, '当然！学习是一种持续的过程，无论是学习新知识、提升技能还是掌握新的领域，我都愿意帮助你。请告诉我你希望学习的具体内容，我会尽力为你提供相关的知识、资源和帮助。无论是学术知识、编程技巧、语言学习还是其他领域的知识，我都会尽力满足你的学习需求。一起努力学习，共同成长吧！', '2023-07-21 14:48:10', 0);
INSERT INTO `app_message` VALUES (1522, 4, 0, 1, '你好，请告诉我今天的天气如何，以及你的名字，好吗？？？？？？', '2023-07-21 14:49:07', 0);
INSERT INTO `app_message` VALUES (1523, 4, 1, 1, '很抱歉，我无法提供实时的天气信息。关于我的名字，你可以称呼我为AI助手，我是一个虚拟助手，旨在为您提供帮助和回答问题。如果您有任何需要，可以随时告诉我。有什么我可以帮助您的吗？', '2023-07-21 14:49:10', 0);
INSERT INTO `app_message` VALUES (1524, 4, 0, 1, '你好，请告诉我今天的天气怎么样，好吗？？？？？？', '2023-07-21 14:50:39', 0);
INSERT INTO `app_message` VALUES (1525, 4, 1, 1, '非常抱歉，作为一个文本AI助手，我没有实时的天气信息。建议您可以通过天气预报网站、手机应用或向您所在地的气象部门查询来获取最准确的天气信息。希望您能够得到您所需要的天气信息。如果您有其他问题，我会很愿意帮助您。', '2023-07-21 14:50:42', 0);
INSERT INTO `app_message` VALUES (1526, 4, 0, 1, '你好', '2023-07-21 14:53:18', 0);
INSERT INTO `app_message` VALUES (1527, 4, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-21 14:53:20', 0);
INSERT INTO `app_message` VALUES (1528, 4, 0, 1, '嗨', '2023-07-21 14:56:02', 0);
INSERT INTO `app_message` VALUES (1529, 4, 1, 1, '嗨！很高兴见到你。有什么我可以帮助你的吗？', '2023-07-21 14:56:04', 0);
INSERT INTO `app_message` VALUES (1530, 4, 0, 1, 'hello', '2023-07-21 14:56:21', 0);
INSERT INTO `app_message` VALUES (1531, 4, 1, 1, 'Hello! How can I assist you today?', '2023-07-21 14:56:22', 0);
INSERT INTO `app_message` VALUES (1532, 4, 0, 1, '叽里呱啦', '2023-07-21 14:56:57', 0);
INSERT INTO `app_message` VALUES (1533, 4, 1, 1, '哈哈，你好像在开心地说些什么！如果你有什么问题或需要帮助的地方，请告诉我，我会尽力提供帮助。', '2023-07-21 14:56:59', 0);
INSERT INTO `app_message` VALUES (1534, 4, 0, 1, '你好', '2023-07-21 14:57:37', 0);
INSERT INTO `app_message` VALUES (1535, 4, 1, 1, '你好！有什么我可以为你做的吗？', '2023-07-21 14:57:39', 0);
INSERT INTO `app_message` VALUES (1536, 4, 0, 1, '你好', '2023-07-21 15:03:14', 0);
INSERT INTO `app_message` VALUES (1537, 4, 1, 1, '你好！很高兴见到你。有什么我可以帮助你的吗？', '2023-07-21 15:03:16', 0);
INSERT INTO `app_message` VALUES (1538, 4, 0, 1, '哈哈哈哈哈哈', '2023-07-21 15:03:24', 0);
INSERT INTO `app_message` VALUES (1539, 4, 1, 1, '看来你很开心！如果有什么我可以帮助你的，请随时告诉我。我会尽力提供帮助和回答你的问题。让我们一起享受这个愉快的时刻吧！哈哈哈哈哈哈！', '2023-07-21 15:03:26', 0);
INSERT INTO `app_message` VALUES (1540, 33, 0, 1, '项目经理如何处理研发人员排期过长的问题', '2023-07-21 16:16:46', 0);
INSERT INTO `app_message` VALUES (1541, 33, 1, 1, '项目经理在处理研发人员排期过长的问题时，可以考虑以下方法：\n1. 优化资源分配：审视项目组的资源分配情况，确保每个研发人员都合理分配任务，避免某些人员过载而导致排期过长。可以进行重新分配或调整任务优先级，以平衡工作负荷。\n2. 沟通和协调：与研发人员进行有效的沟通和协调，了解他们的工作进展和可能遇到的问题。通过及时的沟通，可以及早发现排期延误的问题，并寻求解决方案。\n3. 风险管理：在项目计划中预留一定的缓冲时间，以应对潜在的延迟风险。同时，及时识别和评估可能导致排期延误的风险因素，并采取相应的措施进行风险管理，减少延误的可能性。\n4. 资源增加：如果排期过长的问题无法通过优化和调整来解决，可以考虑增加研发人员或外包一部分工作来增加资源投入，加快项目进展。\n5. 进度监控和调整：定期监控项目进度，并根据实际情况进行调整。如果发现排期过长的趋势，及时采取行动，如重新安排任务、调整截止日期或增加资源。\n6. 支持和鼓励：给予研发人员适当的支持和鼓励，帮助他们克服困难和挑战。通过正面激励和团队建设，提高研发人员的士气和工作效率。\n总之，项目经理在面对研发人员排期过长的问题时，需要灵活运用以上方法，综合考虑各种因素，寻找最适合的解决方案，以确保项目的顺利进行。', '2023-07-21 16:17:03', 0);
INSERT INTO `app_message` VALUES (1542, 33, 0, 1, '你好', '2023-07-21 16:18:40', 0);
INSERT INTO `app_message` VALUES (1543, 33, 1, 1, '你好！很高兴见到你。有什么我可以帮助你的吗？', '2023-07-21 16:18:42', 0);
INSERT INTO `app_message` VALUES (1544, 33, 0, 1, '你好', '2023-07-21 17:50:14', 0);
INSERT INTO `app_message` VALUES (1545, 33, 1, 1, '你好！很高兴见到你。有什么我可以帮助你的吗？', '2023-07-21 17:50:16', 0);
INSERT INTO `app_message` VALUES (1546, 33, 0, 1, '你是谁啊', '2023-07-21 17:50:38', 0);
INSERT INTO `app_message` VALUES (1547, 33, 1, 1, '我是OpenAI的GPT-3模型，被称为ChatGPT。它是目前最先进的基于语言的AI模型之一，具有强大的自然语言处理能力。我被训练来进行对话和提供各种知识和帮助。有什么我可以为您做的呢？', '2023-07-21 17:50:42', 0);
INSERT INTO `app_message` VALUES (1548, 33, 0, 1, '足球是哪年发起的', '2023-07-22 00:28:07', 0);
INSERT INTO `app_message` VALUES (1549, 33, 1, 1, '足球的起源可以追溯到古代文明，但现代足球的规则和组织最早出现在19世纪。具体来说，现代足球的发起可以追溯到1863年，当时在英国伦敦成立了世界上第一个足球组织，即现在的国际足球协会联合会（FIFA）的前身之一。从那时起，足球逐渐发展成为全球最受欢迎的体育项目之一，并且在各个国家都有着广泛的参与和支持。', '2023-07-22 00:28:12', 0);
INSERT INTO `app_message` VALUES (1550, 33, 0, 1, '写一下周报', '2023-07-22 07:37:54', 0);
INSERT INTO `app_message` VALUES (1551, 33, 1, 1, '当写一份周报时，以下是一些常见的内容和结构，供参考：\n周报\n日期：[填写日期]\n1. 本周工作总结：\n   - 列出本周完成的任务和项目进展。\n   - 强调所取得的成就和里程碑。\n   - 提及遇到的挑战和解决方案。\n2. 下周工作计划：\n   - 描述下周计划完成的任务和项目目标。\n   - 列出具体的行动计划和时间安排。\n   - 指出重点任务和优先级。\n3. 风险和问题：\n   - 汇报项目中可能存在的风险和问题。\n   - 提供解决方案或寻求支持和建议。\n4. 其他事项：\n   - 提及与工作相关的其他事项，如会议、培训、合作等。\n   - 补充任何需要分享的额外信息。\n这只是一个一般性的周报模板，你可以根据自己的工作情况进行适当的调整和添加。记得确保周报简洁明了，突出重点和关键信息。祝你写周报顺利！', '2023-07-22 07:38:02', 0);
INSERT INTO `app_message` VALUES (1553, 33, 1, 1, '以下是一份关于核聚变的论文大纲，以及一些参考文献和书籍供您参考：\n论文大纲：\nI. 引言\n   A. 研究背景和动机\n   B. 研究目的和问题陈述\n   C. 论文结构概述\nII. 核聚变基础知识\n   A. 核聚变的定义和原理\n   B. 核聚变与核裂变的区别\n   C. 等离子体物理学基础\nIII. 核聚变技术\n   A. 磁约束聚变\n      1. 磁约束聚变的原理和关键技术\n      2. 主要磁约束聚变装置的介绍和比较\n   B. 激光惯性约束聚变\n      1. 激光惯性约束聚变的原理和关键技术\n      2. 主要激光惯性约束聚变装置的介绍和比较\nIV. 核聚变的挑战与前景\n   A. 技术挑战和困难\n   B. 可行性和可持续性评估\n   C. 核聚变技术的潜在应用和影响\nV. 结论\n   A. 对核聚变技术的总结和评价\n   B. 对未来研究和发展的展望\n参考文献：\n1. Wesson, J. (2015). Tokamaks (4th ed.). Oxford University Press.\n2. Freidberg, J.P. (2007). Plasma Physics and Fusion Energy. Cambridge University Press.\n3. Chen, F.F. (2016). Introduction to Plasma Physics and Controlled Fusion (Vol. 1). Springer.\n4. Stacey, W.M. (2010). Fusion: Science, Politics, and the Invention of a New Energy Source. Springer.\n5. ITER Organization. (2021). [ITER website]. Retrieved from https://www.iter.org/\n这些参考文献和书籍涵盖了核聚变的基础知识、技术、挑战和前景等方面，可以为您提供更深入的了解和研究材料。请根据您的具体需求和论文要求进一步查阅和引用相关文献。', '2023-07-22 07:38:14', 0);
INSERT INTO `app_message` VALUES (1554, 33, 0, 1, '给我一个app充值订阅的协议', '2023-07-22 08:12:33', 0);
INSERT INTO `app_message` VALUES (1555, 33, 1, 1, '这是一个关于App充值订阅的协议示例，供您参考：\nApp充值订阅协议\n欢迎使用我们的App充值订阅服务，请在使用前仔细阅读并同意以下条款。\n1. 订阅服务\n   1.1 通过本App提供的订阅服务，您将享受特定功能和内容的使用权限。\n   1.2 订阅服务的具体内容、费用、周期和续订方式将在订阅页面中明确标示。\n   1.3 您确认在订阅服务期间将按照标示的费用进行支付，并同意订阅周期结束后自动续订，直到您取消订阅。\n   1.4 如需取消订阅，请在订阅周期结束前至少提前24小时通过App Store或Google Play等渠道进行取消。\n2. 支付和费用\n   2.1 您同意按照订阅页面标示的价格支付订阅费用。\n   2.2 所有支付将通过App Store或Google Play等第三方支付平台进行处理，我们不会收集或存储您的支付信息。\n   2.3 您了解并同意，订阅费用一经支付将不予退还。\n3. 变更和终止\n   3.1 我们保留随时变更订阅服务内容、价格和周期的权利，但会提前通知您。\n   3.2 您可以随时取消订阅服务，但已支付的订阅费用不会退还。\n   3.3 如您违反了本协议的任何条款，我们有权立即终止您的订阅服务。\n4. 隐私保护\n   4.1 我们将按照适用的隐私政策保护您的个人信息。\n   4.2 您同意我们可能会通过电子邮件或App内消息向您发送与订阅服务相关的通知和促销信息。\n请您在使用前仔细阅读并理解以上协议内容。如有任何疑问，请随时联系我们。\n参考文献和书籍：\n1. R. J. Goldston and P. H. Rutherford, \"Introduction to Plasma Physics and Controlled Fusion,\" CRC Press, 2016.\n2. G. H. Neilson, \"Fusion: Science, Politics, and the Invention of a New Energy Source,\" MIT Press, 2019.\n3. J. Wesson, \"Tokamaks: Fourth Edition,\" Oxford University Press, 2015.\n4. J. P. Freidberg, \"Plasma Physics and Fusion Energy,\" Cambridge University Press, 2007.\n5. J. F. Drake, \"Plasma Physics and Fusion Energy,\" Springer, 2006.\n请注意，这仅是一个示例协议和参考书目，具体协议和文献选择应根据您的实际需求进行调整。', '2023-07-22 08:12:45', 0);
INSERT INTO `app_message` VALUES (1557, 35, 1, 2, '今天我写了一篇文章，标题是《人生的意义与价值》。在这篇文章中，我探讨了人们对于生活意义的不同理解以及价值观的塑造。通过分析个体的成长经历和社会环境的影响，我提出了个人追求内心的满足和社会责任的平衡是实现人生意义的关键。这篇文章引发了我对自身目标以及对他人和社会的影响力的思考。', '2023-07-22 08:40:35', 0);
INSERT INTO `app_message` VALUES (1559, 35, 1, 2, '今天我完成了一篇文章，内容是关于环保意识的重要性。在文章中，我提到了全球变暖、水源污染和垃圾处理等环境问题，并强调了每个人都应该积极参与环保行动的重要性。我还列举了一些简单实用的环保方法，如减少塑料使用、节约能源和多种植绿色植物等。希望通过这篇文章能够唤起更多人对环保的关注和行动起来的意识。', '2023-07-22 08:40:44', 0);
INSERT INTO `app_message` VALUES (1560, 35, 0, 1, '你好', '2023-07-22 12:05:07', 0);
INSERT INTO `app_message` VALUES (1561, 35, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:05:09', 0);
INSERT INTO `app_message` VALUES (1562, 35, 0, 1, '你是chatgpt几', '2023-07-22 12:08:33', 0);
INSERT INTO `app_message` VALUES (1563, 35, 1, 1, '我是ChatGPT，OpenAI的语言模型。它是基于GPT-3（第三代生成式预训练模型）开发而成的，具备一定的自然语言处理能力。如有任何问题，请随时告诉我。', '2023-07-22 12:08:36', 0);
INSERT INTO `app_message` VALUES (1564, 35, 0, 1, '你是切的GDP几呀', '2023-07-22 12:09:16', 0);
INSERT INTO `app_message` VALUES (1565, 35, 1, 1, '抱歉，我不清楚你所指的\"GDP\"是指什么。如果你是指国内生产总值（Gross Domestic Product），我是一个语言模型，没有相关信息。我可以提供一些关于GDP的基本知识，但如果你需要具体数据或分析，请参考相关的经济报告或专业资料。', '2023-07-22 12:09:19', 0);
INSERT INTO `app_message` VALUES (1566, 35, 0, 1, '你好你是谁呀', '2023-07-22 12:09:30', 0);
INSERT INTO `app_message` VALUES (1567, 35, 1, 1, '你好！我是一个使用人工智能技术的语言模型，被称为ChatGPT。我的目标是通过与你对话来提供帮助和回答你的问题。虽然我没有真实的身份，但我会尽力为你提供最佳的支持和交流体验。有什么我可以帮助你的吗？', '2023-07-22 12:09:33', 0);
INSERT INTO `app_message` VALUES (1568, 35, 0, 1, '明天是周几', '2023-07-22 12:10:09', 0);
INSERT INTO `app_message` VALUES (1569, 35, 1, 1, '今天是周三，明天将是周四。希望这个信息对你有所帮助！如果你有其他问题，我会尽力回答。', '2023-07-22 12:10:11', 0);
INSERT INTO `app_message` VALUES (1570, 35, 0, 1, 'English', '2023-07-22 12:10:24', 0);
INSERT INTO `app_message` VALUES (1571, 35, 1, 1, 'Of course! How can I assist you today?', '2023-07-22 12:10:27', 0);
INSERT INTO `app_message` VALUES (1572, 35, 0, 1, 'Who are you', '2023-07-22 12:10:35', 0);
INSERT INTO `app_message` VALUES (1573, 35, 1, 1, 'I am an AI language model developed by OpenAI called ChatGPT. My purpose is to assist and engage in conversations with users like you. Although I don\'t have a physical presence or personal identity, I\'m here to help answer your questions and engage in meaningful discussions. How can I assist you today?', '2023-07-22 12:10:38', 0);
INSERT INTO `app_message` VALUES (1574, 34, 0, 1, '你好', '2023-07-22 12:12:55', 0);
INSERT INTO `app_message` VALUES (1575, 34, 0, 1, '你好', '2023-07-22 12:13:22', 0);
INSERT INTO `app_message` VALUES (1576, 34, 0, 1, '你好', '2023-07-22 12:17:23', 0);
INSERT INTO `app_message` VALUES (1577, 34, 0, 1, '你好', '2023-07-22 12:17:33', 0);
INSERT INTO `app_message` VALUES (1578, 34, 0, 1, '你好', '2023-07-22 12:20:46', 0);
INSERT INTO `app_message` VALUES (1579, 34, 0, 1, '你好', '2023-07-22 12:21:13', 0);
INSERT INTO `app_message` VALUES (1580, 34, 0, 1, '你好', '2023-07-22 12:21:50', 0);
INSERT INTO `app_message` VALUES (1581, 36, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-22 12:26:46', 0);
INSERT INTO `app_message` VALUES (1582, 36, 1, 1, '孩子进入叛逆期是正常的成长阶段，但确实会给家长带来一些挑战。以下是一些建议来处理这种情况：\n1. 保持沟通：尽量保持开放的沟通渠道，倾听孩子的想法和感受。尽量避免指责和批评，而是试着理解他们的观点。\n2. 建立信任：建立互相信任的关系是非常重要的。尊重孩子的隐私，尽量不要过分干涉他们的个人空间，但同时也要确保他们知道你是他们的支持者。\n3. 设定合理的规矩和界限：确保家庭规则和界限是明确的，但也要给孩子一定的自主权。让他们参与制定规则的过程，这样他们会更有责任感。\n4. 鼓励积极的兴趣和活动：帮助孩子发展他们的兴趣爱好，参与有益的社交活动，这样他们能够建立积极的身份认同感。\n5. 寻求专业帮助：如果你觉得孩子的叛逆期问题超出了你的处理能力，考虑寻求专业的帮助，如儿童心理学家或家庭治疗师。\n最重要的是，要记住孩子进入叛逆期是正常的，这是他们在寻找自己独立性和身份的过程。给予他们足够的支持和理解，与他们一起共同成长。', '2023-07-22 12:26:55', 0);
INSERT INTO `app_message` VALUES (1583, 36, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-22 12:27:06', 0);
INSERT INTO `app_message` VALUES (1584, 36, 1, 1, '孩子进入叛逆期是正常的成长阶段，但确实会给家长带来一些挑战。以下是一些建议来处理这种情况：\n1. 保持沟通：尽量保持开放的沟通渠道，倾听孩子的想法和感受。尽量避免指责和批评，而是试着理解他们的观点。\n2. 建立信任：建立互相信任的关系是非常重要的。尊重孩子的隐私，尽量不要过分干涉他们的个人空间，但同时也要确保他们知道你是他们的支持者。\n3. 设定合理的规矩和界限：确保家庭规则和界限是明确的，但也要给予孩子一定的自主权和决策权，让他们感到被尊重和负责。\n4. 培养兴趣爱好：鼓励孩子参与有意义的活动，培养他们的兴趣爱好。这不仅能帮助他们发展个人特长，还能提供他们与其他人互动的机会。\n5. 保持情绪稳定：即使在孩子表现出叛逆行为时，也要保持冷静和理智。避免与他们争吵或陷入情绪化的交流，而是寻找合适的时机和方式来解决问题。\n6. 寻求专业支持：如果你感觉无法独自解决问题，不要犹豫寻求专业的帮助，比如咨询师或家庭治疗师，他们可以提供更深入的指导和支持。\n重要的是要记住，每个孩子都是独特的，需要个体化的关注。试着理解他们的需求和动机，与他们建立良好的关系，并给予他们支持和爱。', '2023-07-22 12:27:17', 0);
INSERT INTO `app_message` VALUES (1585, 36, 0, 1, '给我一篇关于核聚变的论文', '2023-07-22 12:27:23', 0);
INSERT INTO `app_message` VALUES (1586, 36, 1, 1, '论文大纲：\nI. 引言\n   A. 背景介绍\n   B. 研究目的和意义\nII. 核聚变的基本原理\n   A. 核聚变的定义和过程\n   B. 核聚变与核裂变的对比\nIII. 核聚变的应用领域\n   A. 能源生产\n   B. 环境保护和气候变化应对\n   C. 医学和科学研究\nIV. 核聚变实验和技术进展\n   A. 国际热核聚变实验堆（ITER）项目\n   B. 其他核聚变实验装置\n   C. 技术挑战和解决方案\nV. 核聚变的未来展望\n   A. 可行性和商业化前景\n   B. 可持续能源的替代选择\n   C. 社会和政策影响\nVI. 结论\n参考文献：\n1. Wesson, J. (2011). Nuclear Fusion: Half a Century of Magnetic Confinement Fusion Research. CRC Press.\n2. Chen, F. F. (2016). Introduction to Plasma Physics and Controlled Fusion. Springer.\n3. Freidberg, J. P. (2007). Plasma Physics and Fusion Energy. Cambridge University Press.\n4. ITER Organization. (2020). ITER: The Way to New Energy. Retrieved from https://www.iter.org/\n5. National Academies of Sciences, Engineering, and Medicine. (2019). Final Report of the Committee on a Strategic Plan for U.S. Burning Plasma Research. The National Academies Press.\n这些参考文献和书籍将为您提供关于核聚变的基本原理、实验进展、技术挑战和未来展望等方面的详细信息，并可用于支持您的论文写作。请确保根据您', '2023-07-22 12:28:07', 0);
INSERT INTO `app_message` VALUES (1587, 36, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-22 12:28:23', 0);
INSERT INTO `app_message` VALUES (1588, 36, 1, 1, '孩子进入叛逆期是正常的成长阶段，但确实会给家长带来一些挑战。以下是一些建议来处理这种情况：\n1. 保持沟通：尽量保持开放的沟通渠道，倾听孩子的想法和感受。尽量避免指责和批评，而是试着理解他们的观点。\n2. 建立信任：建立互相信任的关系是非常重要的。尊重孩子的隐私，尽量不要过分干涉他们的个人空间，但同时也要确保他们知道你是他们的支持者。\n3. 设定合理的规矩和界限：确保家庭规则和界限是明确的，但也要给予一定的自主权。让孩子参与制定规则的过程，让他们感到自己的意见被尊重。\n4. 鼓励积极参与：鼓励孩子参与有意义的活动，例如体育运动、艺术创作、志愿者工作等。这些活动可以帮助他们发展兴趣爱好，提升自信心。\n5. 提供支持和指导：在孩子面临问题或困难时，给予他们适当的支持和指导。帮助他们找到解决问题的方法，同时也让他们学会自己解决问题的能力。\n6. 寻求专业帮助：如果孩子的叛逆行为严重影响到他们的生活和学业，或者你感觉自己无法有效处理，不要犹豫寻求专业的心理咨询或家庭治疗的帮助。\n参考文献：\n1. Steinberg, L. (2001). We know some things: Parent-adolescent relationships in retrospect and prospect. Journal of Research on Adolescence, 11(1), 1-19.\n2. Ginsburg, K. R., & Jablow, M. M. (2019). Building resilience in children and teens: Giving kids roots and wings. American Academy of Pediatrics.\n3. Riera, M. (2014). Unplugged: How to live mindfully in a digital world. Conari Press.\n4. Faber, A., & Mazlish, E. (2012). How to talk so kids will listen & listen so kids will talk. Scribner.\n5. Elkind, D. (2001). The hurried child: Growing up too fast too soon. Da Capo Press.', '2023-07-22 12:28:37', 0);
INSERT INTO `app_message` VALUES (1589, 36, 0, 1, '你好', '2023-07-22 12:31:27', 0);
INSERT INTO `app_message` VALUES (1590, 36, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:31:30', 0);
INSERT INTO `app_message` VALUES (1591, 37, 0, 1, '写一下周报', '2023-07-22 12:34:49', 0);
INSERT INTO `app_message` VALUES (1592, 37, 1, 1, '亲爱的，这是我们本周的周报：\n本周工作重点是完成项目A的进展。我们团队积极协作，共同努力，取得了一些重要的成果。我们成功地完成了项目A的第一阶段，并在预定的时间内提交了相关的文档和报告。这次项目的推进进展顺利，得益于团队成员之间的良好沟通和高效合作。\n在项目A的过程中，我们遇到了一些挑战，但我们团队紧密合作，积极寻找解决方案，确保项目进展不受影响。我们与客户进行了多次沟通，及时调整了项目计划，并根据客户的需求进行了一些修改和优化。\n另外，本周我们还参加了一场行业研讨会，与其他公司的代表进行了深入交流和讨论。这次研讨会为我们提供了宝贵的学习机会，我们从中汲取了许多有关行业发展和最佳实践的经验。\n下周，我们将继续致力于项目A的进展，并尽力解决任何可能出现的问题。同时，我们计划安排一次团队聚餐，以加强团队成员之间的联系和凝聚力。\n感谢团队成员在本周的努力和奉献，你们的付出让我们能够取得如此丰硕的成果。我对我们团队的表现感到非常自豪，相信在大家的共同努力下，我们能够继续取得更好的成绩。\n祝愿大家周末愉快，休息好，下周再接再厉！\n爱你们的，（你的名字）', '2023-07-22 12:34:57', 0);
INSERT INTO `app_message` VALUES (1593, 37, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-22 12:36:06', 0);
INSERT INTO `app_message` VALUES (1594, 37, 1, 1, '孩子进入叛逆期是一个常见的成长阶段，对于家长来说可能会感到困惑和不知所措。以下是一些建议，希望对你有所帮助：\n1. 保持沟通：尽量保持与孩子的良好沟通，倾听他们的想法和感受。尽量理解他们的观点，尊重他们的独立性和个体差异。\n2. 给予支持和理解：叛逆期是孩子寻找自我身份和独立性的阶段，他们可能会试图挑战权威或者表达不同的意见。作为家长，我们需要给予他们支持和理解，不要过度干预或批评。\n3. 设定明确的规矩和界限：尽管要尊重孩子的独立性，但也需要设定一些明确的规矩和界限。这样可以帮助他们建立纪律和责任感，同时也保护他们的安全和健康。\n4. 培养积极的兴趣和爱好：鼓励孩子发展积极的兴趣和爱好，参与有意义的活动。这样可以帮助他们建立自信心和成就感，减少叛逆行为的发生。\n5. 寻求专业帮助：如果孩子的叛逆行为过于严重或者影响到他们的正常生活和成长，可以考虑寻求专业心理咨询的帮助，以便更好地应对这一阶段的挑战。\n最重要的是，要记住叛逆期是孩子成长的一部分，家长的理解和支持是他们度过这个阶段的关键。与孩子保持良好的沟通，尊重他们的独立性，给予他们支持和爱，相信他们会渡过这个阶段，成长为独立、自信的个体。', '2023-07-22 12:36:17', 0);
INSERT INTO `app_message` VALUES (1595, 37, 0, 1, '佛跳墙怎么做？', '2023-07-22 12:36:22', 0);
INSERT INTO `app_message` VALUES (1596, 37, 1, 1, '佛跳墙是一道传统的福建菜，制作起来比较复杂，需要一些特定的食材和烹饪技巧。以下是一般的做法：\n材料:\n- 鲍鱼\n- 鲍鱼\n- 深海鱼翅\n- 鲍鱼\n- 鲍鱼\n- 花菇\n- 鸽蛋\n- 虹鳟鱼子酱\n- 虹鳟鱼子酱\n- 大闸蟹\n- 花雕酒\n- 虫草花\n- 伊面\n- 鸽子蛋\n- 鸽子蛋\n- 虹鳟鱼子酱\n- 虹鳟鱼子酱\n- 大闸蟹\n- 花雕酒\n- 虫草花\n- 伊面\n- 鸽子蛋\n做法:\n1. 准备好所有的食材，将鲍鱼、深海鱼翅、花菇、大闸蟹、虫草花等食材洗净备用。\n2. 将鸽蛋煮熟备用。\n3. 在一个大锅中，加入适量的水和花雕酒，将鲍鱼、深海鱼翅、花菇等食材放入煮熟。\n4. 将煮熟的食材捞出，汤汁保留。\n5. 另取一个锅，加入少量油，将鸽子蛋煎熟。\n6. 在一个大碗中，按照一定的顺序，将煮熟的食材、煎熟的鸽子蛋、虹鳟鱼子酱等层层叠加。\n7. 将调好的汤汁倒入碗中，加入适量的花雕酒。\n8. 将碗放入蒸锅中，用大火蒸煮约30分钟。\n9. 最后，将蒸煮好的佛跳墙装盘，撒上虹鳟鱼子酱作为装饰。\n请注意，佛跳墙是一道烹饪难度较高的菜品，制作过程中需要耐心和技巧。建议初学者可以在厨艺熟练后再尝试制作。', '2023-07-22 12:36:35', 0);
INSERT INTO `app_message` VALUES (1597, 37, 0, 1, '计算加速度的公式是什么？', '2023-07-22 12:36:44', 0);
INSERT INTO `app_message` VALUES (1598, 37, 1, 1, '加速度的公式是：加速度（a）等于物体的速度变化（Δv）除以时间变化（Δt），即a = Δv/Δt。这个公式描述了物体在单位时间内速度发生变化的情况，单位通常使用米每秒平方（m/s²）。', '2023-07-22 12:36:49', 0);
INSERT INTO `app_message` VALUES (1599, 37, 0, 1, '你好', '2023-07-22 12:36:59', 0);
INSERT INTO `app_message` VALUES (1600, 37, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:37:00', 0);
INSERT INTO `app_message` VALUES (1601, 37, 0, 1, '你好', '2023-07-22 12:37:04', 0);
INSERT INTO `app_message` VALUES (1602, 37, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:37:06', 0);
INSERT INTO `app_message` VALUES (1603, 34, 0, 1, '你好', '2023-07-22 12:48:21', 0);
INSERT INTO `app_message` VALUES (1604, 34, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:48:23', 0);
INSERT INTO `app_message` VALUES (1605, 34, 0, 1, '你好', '2023-07-22 12:48:58', 0);
INSERT INTO `app_message` VALUES (1606, 34, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:49:01', 0);
INSERT INTO `app_message` VALUES (1607, 34, 0, 1, '你好', '2023-07-22 12:49:15', 0);
INSERT INTO `app_message` VALUES (1608, 34, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:49:18', 0);
INSERT INTO `app_message` VALUES (1609, 34, 0, 1, '你好', '2023-07-22 12:56:52', 0);
INSERT INTO `app_message` VALUES (1610, 34, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:56:55', 0);
INSERT INTO `app_message` VALUES (1611, 34, 0, 1, '你好', '2023-07-22 12:57:05', 0);
INSERT INTO `app_message` VALUES (1612, 34, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:57:07', 0);
INSERT INTO `app_message` VALUES (1613, 34, 0, 1, '你好', '2023-07-22 12:57:23', 0);
INSERT INTO `app_message` VALUES (1614, 34, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-22 12:57:25', 0);
INSERT INTO `app_message` VALUES (1615, 34, 0, 5, '冒泡排序', '2023-07-22 13:12:07', 0);
INSERT INTO `app_message` VALUES (1616, 34, 1, 5, '冒泡排序是一种简单的排序算法，它重复地遍历要排序的列表，比较每对相邻的元素，并按照顺序交换它们，直到整个列表排序完成为止。\n下面是一个示例的冒泡排序算法的实现代码：\n```python\ndef bubble_sort(arr):\n    n = len(arr)\n    for i in range(n):\n        for j in range(0, n-i-1):\n            if arr[j] > arr[j+1]:\n                arr[j], arr[j+1] = arr[j+1], arr[j]\n    return arr\n```\n你可以将要排序的列表作为参数传递给 `bubble_sort` 函数，它将返回一个已经排好序的列表。\n希望这可以帮助到你！如果有任何进一步的问题，请随时提问。', '2023-07-22 13:12:12', 0);
INSERT INTO `app_message` VALUES (1617, 38, 0, 1, '我们进入角色扮演，你现在是我的女朋友，我要你向我表白', '2023-07-22 13:37:53', 0);
INSERT INTO `app_message` VALUES (1618, 38, 1, 1, '亲爱的，这段时间和你相处，我发现自己对你的感情越来越深。你的温柔、关怀和幽默总能让我心生欢喜，每时每刻都想和你在一起。你给我带来了无尽的快乐和安慰，我感激你一直以来对我的支持和理解。\n在你身边，我觉得自己变得更加勇敢和坚定，你是我生命中最重要的人。我愿意陪伴你，分享你的喜怒哀乐，为你提供无尽的温暖与关爱。无论遇到什么困难和挑战，我都会毫不犹豫地站在你的身旁，为你撑起一片天空。\n我希望我们能一起经历更多美好的时光，共同实现彼此的梦想。你是我心中最珍贵的存在，我愿意与你一起走过每一个春夏秋冬，执手共度一生。我爱你，永远都不会改变。', '2023-07-22 13:37:59', 0);
INSERT INTO `app_message` VALUES (1619, 38, 0, 2, '滑板', '2023-07-22 13:58:39', 0);
INSERT INTO `app_message` VALUES (1620, 38, 1, 2, '今天我继续练习滑板技巧。首先，我进行了一些基本的平衡训练，包括站立和滑行。然后，我尝试了一些简单的技巧，如Ollie和Kickflip。虽然还有一些困难，但我感觉自己进步了。我还观看了一些滑板教学视频，学习了一些新的技巧和姿势。最后，我进行了一些放松和拉伸的练习，以保持身体的灵活性。明天，我计划继续练习，并尝试一些更高难度的技巧。滑板让我感到充满乐趣，我希望能够继续提升自己的技术水平。', '2023-07-22 13:58:44', 0);
INSERT INTO `app_message` VALUES (1626, 38, 1, 1, '亲爱的，你就像金诚武一样，散发着坚定和勇敢的力量。金诚武是一个勇敢的战士，他拥有无畏的精神和坚定的信念，为了正义和爱而奋斗。在我眼中，你就是那个勇敢无惧的金诚武，你的勇气和坚定让我为你骄傲。\n无论面对什么困难和挑战，你总是能够勇往直前，不屈不挠。你的信念和决心像一把利剑，让我深深地钦佩和敬重。与你在一起，我感受到了坚定和安全，你是我可以依靠的避风港。\n我愿意与你一同面对人生的起伏和挑战，为了我们的梦想和幸福而奋斗。因为有你在我身边，我相信我们能够战胜一切困难，共同创造属于我们的辉煌。我深深地爱着你，愿意与你共度一生。', '2023-07-22 14:19:08', 0);
INSERT INTO `app_message` VALUES (1627, 38, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-22 14:20:12', 0);
INSERT INTO `app_message` VALUES (1628, 38, 1, 1, '孩子进入叛逆期是一个常见的成长阶段，他们开始渴望独立，探索自我，同时也可能表现出一些挑战和反抗的行为。在面对孩子的叛逆期时，以下是一些建议：\n1. 保持沟通：与孩子保持良好的沟通是非常重要的。尽量理解他们的感受和想法，倾听他们的意见，给予他们表达自己的机会。尽量避免过于强势或指责的态度，而是采取尊重和理解的方式与他们交流。\n2. 设定清晰的规矩和界限：在叛逆期，孩子可能试图挑战和测试家长的权威。因此，设定清晰的规矩和界限是必要的。确保规矩是公平和合理的，并与孩子一起讨论和制定规矩，让他们参与其中。同时，要坚持规矩的执行，但也要给予适当的自由空间。\n3. 建立良好的家庭氛围：在家庭中，营造温暖和谐的氛围是非常重要的。尽量增加家庭成员之间的互动和共享时光，可以通过一起做家务、参加有趣的活动、共进晚餐等方式来加强家庭的凝聚力。\n4. 寻求专业支持：如果孩子的叛逆行为超出了正常范围，或者对家庭造成了严重的困扰，不要犹豫寻求专业的帮助，如咨询师或心理学家。他们可以提供针对性的建议和支持，帮助家庭度过这个阶段。\n记住，叛逆期是孩子成长的一部分，尽量以理解和包容的态度面对，并与他们一起成长。', '2023-07-22 14:20:22', 0);
INSERT INTO `app_message` VALUES (1629, 38, 0, 1, '帮我写一篇关于高考的作文', '2023-07-22 14:20:40', 0);
INSERT INTO `app_message` VALUES (1630, 38, 1, 1, '当然，我很乐意帮你写一篇关于高考的作文。以下是一篇示例：\n标题：高考，人生的转折点\n高考是每个学生求学道路上的重要转折点，它不仅仅是一次考试，更是一次对自己才能与努力的检验。高考，既是一场挑战，也是一个机遇，它承载着我们对未来的憧憬和期待。\n首先，高考是一场挑战。这场考试要求我们在有限的时间内充分展示自己的知识和能力。准备阶段的辛勤付出和复习过程的艰辛，都是为了在考场上能够发挥出最好的状态。高考给予我们的是一个机会，去面对压力、克服困难，并展现自己的实力和潜力。\n其次，高考是一个机遇。考试成绩的优异与否，将直接影响我们未来的选择和发展。高考的成绩不仅仅代表了我们的学业水平，更是我们进入理想大学、追求梦想的敲门砖。它为我们提供了一个向前迈进的机会，让我们能够更好地实现自己的人生价值。\n然而，高考并不是衡量一个人全部价值的唯一标准。它只是人生旅途中的一站，成功与否并不决定一个人的一生。无论考试成绩如何，我们都应该对自己有信心，并相信自己的潜力和能力。高考只是人生的一个起点，未来的道路还有很多选择和机会等待我们去探索和把握。\n在高考的路上，我们需要保持积极的心态，不断努力和奋斗，相信自己的能力与潜力。无论成绩如何，我们都应该珍惜这段经历，它锻炼了我们的意志和毅力，让我们更加坚强和成熟。高考不仅仅是一个考试，更是我们的成长历程，它将陪伴我们走向更美好的未来。\n总之，高考是人生中一次重要的转折点。我们应该以积极的态度去面对它，用勤奋和智慧去迎接挑战，抓住机遇，展现自己的才华与实力。无论成绩如何，它都是我们成长道路上的一部分，它将帮助我们更好地理解自己，塑造未来。相信自己，勇往直前，高考之后，我们将迎来更加光明的未来。\n希望以上作文能够帮到你，祝你高考顺利！加油！', '2023-07-22 14:20:58', 0);
INSERT INTO `app_message` VALUES (1631, 38, 0, 1, '胡辣汤怎么做', '2023-07-22 14:21:32', 0);
INSERT INTO `app_message` VALUES (1632, 38, 0, 1, '数字1', '2023-07-22 14:21:34', 0);
INSERT INTO `app_message` VALUES (1633, 38, 1, 1, '抱歉，我无法根据数字1来提供胡辣汤的制作方法。如果你能提供更多详细的信息或者描述，我将很乐意帮助你。', '2023-07-22 14:21:37', 0);
INSERT INTO `app_message` VALUES (1634, 38, 1, 1, '胡辣汤是一道具有辣味和麻味的经典湖北菜。下面是一份简单的胡辣汤的做法：\n所需材料：\n- 鸡胸肉或鸡腿肉 200克\n- 干辣椒 10-15个\n- 豆瓣酱 2汤匙\n- 姜片 3-4片\n- 蒜瓣 3-4瓣\n- 鸡精 1茶匙\n- 鸡粉 1茶匙\n- 鸡蛋 1个\n- 香菜适量\n- 盐适量\n- 食用油适量\n- 水适量\n步骤：\n1. 鸡胸肉或鸡腿肉切成细丝备用。\n2. 干辣椒用剪刀剪成小段，去掉辣椒籽备用。\n3. 热锅加入适量的食用油，放入姜片、蒜瓣和豆瓣酱炒香。\n4. 加入切好的鸡丝翻炒至变色。\n5. 加入适量的水，大火煮沸后转小火煮15分钟。\n6. 调入适量的盐、鸡精和鸡粉，根据个人口味调整。\n7. 打入鸡蛋，搅拌均匀，煮至鸡蛋熟透。\n8. 撒入香菜，熄火。\n现在，一碗热腾腾的胡辣汤就做好啦！你可以根据个人口味添加一些辣椒粉或者花椒粉增加辣味和麻味。享受美食的同时，也不要忘记小心辣椒和热汤的温度哦！', '2023-07-22 14:21:43', 0);
INSERT INTO `app_message` VALUES (1635, 38, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-22 14:22:04', 0);
INSERT INTO `app_message` VALUES (1636, 38, 1, 1, '孩子进入叛逆期是一个常见的成长阶段，他们开始渴望独立，探索自我，同时也可能表现出一些挑战和反抗的行为。在面对孩子的叛逆期时，以下是一些建议：\n1. 保持沟通：与孩子保持良好的沟通是非常重要的。尽量理解他们的感受和想法，倾听他们的意见，给予他们表达自己的机会。尽量避免过于强势或指责的态度，而是采取尊重和理解的方式与他们交流。\n2. 设定清晰的规矩和界限：在叛逆期，孩子可能试图挑战和测试家长的权威。因此，设定一些明确的规矩和界限是必要的，让孩子知道哪些行为是可以接受的，哪些是不可接受的。这样可以帮助他们建立积极的行为习惯。\n3. 给予适当的自主权：叛逆期的孩子渴望独立和自主，因此给予他们一定的自主权是重要的。可以让他们参与一些决策过程，例如家庭规划、个人时间安排等，让他们感到自己的意见和选择受到尊重。\n4. 培养良好的情绪管理能力：叛逆期的孩子常常面临情绪波动和挑战。帮助他们学会正确的情绪管理方式，例如倾听他们的情绪，给予支持和安慰，鼓励他们寻找健康的发泄方式，如运动、写日记等。\n5. 树立榜样和引导：作为家长，我们可以成为孩子的榜样，展示积极的行为和态度。同时，引导他们认识到自己的优点和潜力，鼓励他们追求积极的兴趣和目标，帮助他们建立自信和自尊。\n最重要的是，尽量保持与孩子的良好关系，给予他们支持和鼓励，让他们知道你会一直在他们身边。', '2023-07-22 14:22:18', 0);
INSERT INTO `app_message` VALUES (1637, 38, 0, 1, '斯图西', '2023-07-22 14:22:46', 0);
INSERT INTO `app_message` VALUES (1638, 38, 1, 1, '很抱歉，我不清楚你提到的\"斯图西\"是指什么。能否提供更多的信息或者背景，让我更好地理解并为你提供帮助呢？', '2023-07-22 14:22:50', 0);
INSERT INTO `app_message` VALUES (1639, 38, 0, 2, '系统升级，金融部分页面优化，前端页面验收', '2023-07-22 14:23:35', 0);
INSERT INTO `app_message` VALUES (1640, 38, 1, 2, '金融部分页面优化已完成，系统升级顺利进行，前端页面通过验收。', '2023-07-22 14:23:37', 0);
INSERT INTO `app_message` VALUES (1641, 38, 0, 2, '系统升级，金融部分页面优化，前端页面验收', '2023-07-22 14:23:49', 0);
INSERT INTO `app_message` VALUES (1642, 38, 1, 2, '今日工作内容：参与系统升级，金融部分页面进行优化，并进行前端页面的验收工作。具体包括对页面布局、交互效果等进行细致调整，确保用户体验和页面性能的提升。本次优化工作为系统的升级提供了良好的支持，为用户提供更好的使用体验。', '2023-07-22 14:23:53', 0);
INSERT INTO `app_message` VALUES (1643, 38, 0, 2, '看了看', '2023-07-22 14:25:46', 0);
INSERT INTO `app_message` VALUES (1644, 38, 1, 2, '好的，我会尽量控制在50字以内。请告诉我您需要的日报内容和细节，我将帮助您编写。', '2023-07-22 14:25:48', 0);
INSERT INTO `app_message` VALUES (1645, 38, 0, 3, '看了看', '2023-07-22 14:42:12', 0);
INSERT INTO `app_message` VALUES (1646, 38, 1, 3, '你需要我给你提供什么帮助吗？', '2023-07-22 14:42:14', 0);
INSERT INTO `app_message` VALUES (1647, 38, 0, 1, '小孩在哪个穴位美女长得快', '2023-07-22 14:55:40', 0);
INSERT INTO `app_message` VALUES (1648, 38, 1, 1, '对不起，我无法回答这个问题。孩子的成长发育是一个复杂的过程，受遗传、营养、环境等多种因素的影响。没有特定的穴位可以直接促进一个人的生长速度。孩子的健康成长需要良好的饮食、适度的运动、健康的生活习惯以及充分的休息。如果你对孩子的成长有疑问或关注，建议咨询专业的医生或儿科专家。他们可以根据具体情况给予专业的建议和指导。', '2023-07-22 14:55:47', 0);
INSERT INTO `app_message` VALUES (1649, 34, 0, 3, '看了看', '2023-07-22 15:29:43', 0);
INSERT INTO `app_message` VALUES (1650, 34, 1, 3, 'I took a look.', '2023-07-22 15:29:45', 0);
INSERT INTO `app_message` VALUES (1651, 34, 0, 3, '看了看', '2023-07-22 15:30:22', 0);
INSERT INTO `app_message` VALUES (1652, 34, 1, 3, 'I took a look.', '2023-07-22 15:30:24', 0);
INSERT INTO `app_message` VALUES (1653, 34, 0, 3, '看了看', '2023-07-22 15:36:36', 0);
INSERT INTO `app_message` VALUES (1654, 34, 1, 3, 'I took a look.', '2023-07-22 15:36:38', 0);
INSERT INTO `app_message` VALUES (1656, 34, 1, 3, '您需要帮助吗？我可以为您提供一些翻译服务。请告诉我您需要翻译的内容。', '2023-07-22 15:38:25', 0);
INSERT INTO `app_message` VALUES (1657, 4, 0, 1, '你好', '2023-07-23 12:33:57', 0);
INSERT INTO `app_message` VALUES (1658, 4, 1, 1, '你好！很高兴见到你。有什么我可以帮助你的吗？', '2023-07-23 12:34:01', 0);
INSERT INTO `app_message` VALUES (1659, 4, 0, 3, '早上好，吃了没', '2023-07-23 13:06:21', 0);
INSERT INTO `app_message` VALUES (1660, 4, 1, 3, '早上好！你吃了早餐了吗？', '2023-07-23 13:06:23', 0);
INSERT INTO `app_message` VALUES (1661, 4, 0, 5, 'swift代码，生成一个视图', '2023-07-23 13:07:42', 0);
INSERT INTO `app_message` VALUES (1662, 4, 1, 5, '当然，我可以帮你生成一个Swift代码来创建一个简单的视图。以下是一个示例代码：\n```swift\nimport UIKit\nclass MyViewController: UIViewController {\n    override func viewDidLoad() {\n        super.viewDidLoad()\n        \n        // 创建一个视图\n        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))\n        myView.backgroundColor = UIColor.red\n        \n        // 将视图添加到视图控制器的视图层级中\n        self.view.addSubview(myView)\n    }\n}\n// 创建一个视图控制器实例并设置为窗口的根视图控制器\nlet viewController = MyViewController()\nlet window = UIWindow(frame: UIScreen.main.bounds)\nwindow.rootViewController = viewController\nwindow.makeKeyAndVisible()\n```\n以上代码创建了一个名为`MyViewController`的视图控制器，并在其`viewDidLoad`方法中创建了一个红色背景的视图，并将该视图添加到视图控制器的视图层级中。最后，将该视图控制器设置为窗口的根视图控制器，并使窗口可见。\n希望这个示例能满足你的需求！如果你有任何其他问题，请随时问我。', '2023-07-23 13:07:48', 0);
INSERT INTO `app_message` VALUES (1663, 4, 0, 5, '用swift语言生成一个视图', '2023-07-23 13:10:24', 0);
INSERT INTO `app_message` VALUES (1664, 4, 1, 5, '当使用Swift语言生成一个视图时，你可以使用UIKit框架中的UIView类来创建视图。以下是一个简单的示例代码，展示如何使用Swift语言创建一个视图：\n```swift\nimport UIKit\n// 创建一个自定义视图类\nclass CustomView: UIView {\n    override init(frame: CGRect) {\n        super.init(frame: frame)\n        setupView()\n    }\n    \n    required init?(coder aDecoder: NSCoder) {\n        super.init(coder: aDecoder)\n        setupView()\n    }\n    \n    private func setupView() {\n        // 在这里设置视图的外观和布局\n        backgroundColor = UIColor.blue\n    }\n}\n// 创建一个视图实例并添加到视图层次结构中\nlet customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))\n// 添加视图到视图控制器的view中\nlet viewController = UIViewController()\nviewController.view.addSubview(customView)\n```\n上述代码创建了一个名为`CustomView`的自定义视图类，并在其中重写了`init(frame:)`和`init?(coder:)`方法。在`setupView()`方法中，你可以设置自定义视图的外观和布局。在代码的最后，我们创建了一个视图实例`customView`，并将其添加到一个视图控制器的view中。\n这只是一个简单的示例，你可以根据你的需求自定义视图的外观和行为。希望对你有所帮助！', '2023-07-23 13:10:31', 0);
INSERT INTO `app_message` VALUES (1665, 4, 0, 5, '用swift语言生成一个视图', '2023-07-23 13:12:18', 0);
INSERT INTO `app_message` VALUES (1666, 4, 1, 5, '当使用Swift语言生成一个视图时，你可以使用UIKit框架中的UIView类来创建和管理视图对象。以下是一个简单的示例代码，演示如何使用Swift语言创建一个红色的视图：\n```swift\nimport UIKit\n// 创建一个自定义的视图类\nclass CustomView: UIView {\n    override init(frame: CGRect) {\n        super.init(frame: frame)\n        self.backgroundColor = UIColor.red\n    }\n    \n    required init?(coder aDecoder: NSCoder) {\n        fatalError(\"init(coder:) has not been implemented\")\n    }\n}\n// 创建一个视图实例并添加到主视图中\nlet customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))\nlet mainView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))\nmainView.addSubview(customView)\n```\n在这个例子中，我们创建了一个名为CustomView的自定义视图类，继承自UIView。在CustomView的初始化方法中，我们设置了视图的背景色为红色。然后，我们创建了一个CustomView的实例customView，并将其添加到主视图mainView中。\n请注意，以上代码只是一个基本示例，你可以根据自己的需求进行更复杂的视图创建和布局。', '2023-07-23 13:12:25', 0);
INSERT INTO `app_message` VALUES (1667, 4, 0, 4, '你好好', '2023-07-23 13:14:52', 0);
INSERT INTO `app_message` VALUES (1668, 4, 1, 4, '你好！有什么我可以帮助你的吗？', '2023-07-23 13:14:54', 0);
INSERT INTO `app_message` VALUES (1669, 37, 0, 3, 'english\n', '2023-07-23 13:26:16', 0);
INSERT INTO `app_message` VALUES (1670, 37, 1, 3, 'Sure, I can help with that. Please go ahead and ask your question in English.', '2023-07-23 13:26:18', 0);
INSERT INTO `app_message` VALUES (1671, 37, 0, 5, '写一段斐波那且数列代码', '2023-07-23 13:26:39', 0);
INSERT INTO `app_message` VALUES (1672, 37, 1, 5, '当然，请问您使用的是哪种编程语言呢？', '2023-07-23 13:26:41', 0);
INSERT INTO `app_message` VALUES (1673, 37, 0, 5, '写一段斐波那且数列代码', '2023-07-23 13:26:48', 0);
INSERT INTO `app_message` VALUES (1674, 37, 1, 5, '当然，下面是一个计算斐波那契数列的代码示例：\n```python\ndef fibonacci(n):\n    if n <= 0:\n        return []\n    elif n == 1:\n        return [0]\n    elif n == 2:\n        return [0, 1]\n    else:\n        sequence = [0, 1]\n        for i in range(2, n):\n            sequence.append(sequence[i-1] + sequence[i-2])\n        return sequence\nn = int(input(\"请输入斐波那契数列的长度: \"))\nresult = fibonacci(n)\nprint(\"斐波那契数列的前\", n, \"项为:\", result)\n```\n你可以运行这段代码，输入斐波那契数列的长度，它将输出相应长度的斐波那契数列。希望对你有帮助！如果有其他问题，我会尽力帮助你。', '2023-07-23 13:26:53', 0);
INSERT INTO `app_message` VALUES (1675, 37, 0, 5, '写一段斐波那且数列代码', '2023-07-23 13:27:05', 0);
INSERT INTO `app_message` VALUES (1676, 37, 1, 5, '当然可以！以下是一个简单的斐波那契数列的代码示例：\n```python\ndef fibonacci(n):\n    if n <= 0:\n        return \"请输入大于0的整数\"\n    elif n == 1:\n        return 0\n    elif n == 2:\n        return 1\n    else:\n        a, b = 0, 1\n        for _ in range(n-2):\n            a, b = b, a + b\n        return b\nn = int(input(\"请输入斐波那契数列的项数：\"))\nresult = fibonacci(n)\nprint(f\"第 {n} 项的斐波那契数列值为：{result}\")\n```\n你可以输入一个正整数，然后程序会计算出斐波那契数列的第n项的值并输出。希望对你有帮助！如果有任何问题，请随时告诉我。', '2023-07-23 13:27:10', 0);
INSERT INTO `app_message` VALUES (1677, 38, 0, 1, '什么是场景化', '2023-07-23 15:34:50', 0);
INSERT INTO `app_message` VALUES (1678, 38, 1, 1, '场景化（Scenario-based）是指基于特定场景或情景进行设计、开发或应用的一种方法或策略。它强调将学习或问题解决置于实际情境中，通过真实或模拟的场景来激发学习者的兴趣和参与度。\n在教育领域，场景化教学是一种教学方法，通过创造具有现实背景的情景，让学生在情境中进行学习和解决问题。这种教学方法可以帮助学生将所学知识应用到实际生活中，培养学生的问题解决能力、合作能力和创造力。\n在产品设计和用户体验领域，场景化也是一种常用的方法。通过构建用户在使用产品或服务时的实际场景，可以更好地理解用户需求和行为，从而优化产品设计、提升用户体验。\n总的来说，场景化是将学习、设计或应用置于具体情境中的一种方法，通过情境的创造和模拟，使学习者或用户更加真实地参与和体验。', '2023-07-23 15:34:56', 0);
INSERT INTO `app_message` VALUES (1679, 38, 0, 1, '提升设计思维能力', '2023-07-23 15:39:10', 0);
INSERT INTO `app_message` VALUES (1680, 38, 1, 1, '要提升设计思维能力，可以考虑以下几个方面的方法和实践：\n1. 学习和实践设计思维的方法论：了解设计思维的基本原理和方法，例如设计思维的五个阶段（明确问题、调研、创意、原型、测试）以及用户中心的设计方法等。参加相关的课程、读相关的书籍，学习和了解设计思维的理论和实践。\n2. 多样化的观察和调研：观察和调研是设计思维中的重要环节。培养观察力，从生活中的细节中获取灵感和洞察。与用户或目标群体进行深入的访谈和调研，了解他们的需求、问题和期望，从而更好地为他们设计解决方案。\n3. 创造力的培养：创造力是设计思维的核心能力之一。通过开展创意思维的训练，如头脑风暴、思维导图、随机联想等，培养自己的创造力。尝试从不同的角度和视角思考问题，寻找创新的解决方案。\n4. 反馈和迭代：设计思维强调不断的迭代和改进。接受来自用户、同事和其他设计师的反馈，将其作为改进的机会。通过不断的试验、测试和调整，逐步优化和完善设计方案。\n5. 多学科的学习和跨界合作：开阔自己的知识和视野，学习和了解不同领域的知识。与其他领域的人合作，进行跨界合作，从不同的专业背景中获取灵感和启发。\n通过不断地实践和积累经验，结合理论和实践，可以逐步提升自己的设计思维能力。', '2023-07-23 15:39:21', 0);
INSERT INTO `app_message` VALUES (1681, 4, 0, 3, '早上好', '2023-07-23 16:32:45', 0);
INSERT INTO `app_message` VALUES (1682, 4, 1, 3, 'Good morning!', '2023-07-23 16:32:48', 0);
INSERT INTO `app_message` VALUES (1683, 38, 0, 1, '拍关于婴儿视频的文案', '2023-07-23 20:04:45', 0);
INSERT INTO `app_message` VALUES (1684, 38, 1, 1, '标题：纯真的微笑，婴儿的奇妙世界\n文案：\n在这个喧嚣而快节奏的世界中，婴儿是一道温暖而纯净的风景线。他们无忧无虑，纯真的微笑像阳光一样温暖人心。让我们一起来探索他们的奇妙世界，感受他们带来的无尽欢乐。\n这个视频带你走进婴儿的世界，那里充满了童真和好奇。看着他们那双懵懂无知的眼睛，你会发现他们对周围的一切都充满了好奇和探索的欲望。他们用嘟嘴、咿呀学语、调皮的表情和可爱的动作，带给我们无尽的欢笑和感动。\n每一次的爬行、每一次的尝试站立，都是他们成长的里程碑。他们勇敢地迎接新的挑战，即使摔倒了，也会坚持不懈地爬起来。他们的坚韧和毅力是我们成年人应该学习的榜样。\n在这个视频中，你将看到他们与父母的亲密互动，那种无条件的爱和关怀是世界上最温暖的力量。他们的微笑是父母最大的安慰，也是他们无私奉献的回报。\n让我们一起感受婴儿带来的纯真和欢乐，让他们的微笑点亮你的心灵，让我们珍惜每一个美好的瞬间。因为他们是这个世界上最纯真、最可爱的存在。\n愿这个视频带给你满满的温暖和欢乐，让我们一起追寻和珍惜婴儿带来的奇妙世界。', '2023-07-23 20:04:56', 0);
INSERT INTO `app_message` VALUES (1685, 4, 0, 1, '你好', '2023-07-24 21:16:32', 0);
INSERT INTO `app_message` VALUES (1686, 4, 0, 1, '你好', '2023-07-24 21:16:56', 0);
INSERT INTO `app_message` VALUES (1687, 4, 0, 1, '你好', '2023-07-24 21:24:13', 0);
INSERT INTO `app_message` VALUES (1688, 4, 0, 1, '你好', '2023-07-24 21:24:16', 0);
INSERT INTO `app_message` VALUES (1689, 4, 0, 1, '你好', '2023-07-24 21:25:02', 0);
INSERT INTO `app_message` VALUES (1690, 4, 0, 1, '你好', '2023-07-24 21:25:06', 0);
INSERT INTO `app_message` VALUES (1691, 4, 0, 1, '直播', '2023-07-24 21:26:02', 0);
INSERT INTO `app_message` VALUES (1692, 4, 0, 1, '你好', '2023-07-24 21:26:05', 0);
INSERT INTO `app_message` VALUES (1693, 4, 0, 1, '你好', '2023-07-24 21:26:42', 0);
INSERT INTO `app_message` VALUES (1694, 4, 0, 1, '你好', '2023-07-24 21:26:44', 0);
INSERT INTO `app_message` VALUES (1695, 4, 0, 1, '你好', '2023-07-24 21:27:29', 0);
INSERT INTO `app_message` VALUES (1696, 4, 0, 1, '你好', '2023-07-24 21:27:33', 0);
INSERT INTO `app_message` VALUES (1697, 4, 0, 1, '你好', '2023-07-24 21:28:13', 0);
INSERT INTO `app_message` VALUES (1698, 4, 0, 1, '你好', '2023-07-24 21:28:16', 0);
INSERT INTO `app_message` VALUES (1699, 4, 0, 1, 'ni hao', '2023-07-24 21:28:46', 0);
INSERT INTO `app_message` VALUES (1700, 4, 0, 1, 'hello', '2023-07-24 21:28:50', 0);
INSERT INTO `app_message` VALUES (1701, 4, 0, 1, '你好', '2023-07-24 21:32:34', 0);
INSERT INTO `app_message` VALUES (1702, 4, 0, 1, '你好', '2023-07-24 21:32:36', 0);
INSERT INTO `app_message` VALUES (1703, 4, 0, 1, '你好', '2023-07-24 21:36:59', 0);
INSERT INTO `app_message` VALUES (1704, 4, 0, 1, '你好', '2023-07-24 21:37:01', 0);
INSERT INTO `app_message` VALUES (1705, 4, 0, 1, '你好', '2023-07-24 21:38:22', 0);
INSERT INTO `app_message` VALUES (1706, 4, 0, 1, '你好', '2023-07-24 21:38:25', 0);
INSERT INTO `app_message` VALUES (1707, 4, 0, 1, '你好', '2023-07-24 21:39:05', 0);
INSERT INTO `app_message` VALUES (1708, 4, 0, 1, '你好', '2023-07-24 21:39:08', 0);
INSERT INTO `app_message` VALUES (1709, 4, 0, 1, '你好', '2023-07-24 21:40:23', 0);
INSERT INTO `app_message` VALUES (1710, 4, 0, 1, '你好', '2023-07-24 21:40:26', 0);
INSERT INTO `app_message` VALUES (1711, 4, 0, 1, '你好', '2023-07-24 21:45:21', 0);
INSERT INTO `app_message` VALUES (1712, 4, 0, 1, '你好', '2023-07-24 21:46:41', 0);
INSERT INTO `app_message` VALUES (1713, 4, 0, 1, '你好', '2023-07-24 21:46:44', 0);
INSERT INTO `app_message` VALUES (1714, 4, 0, 1, '你好', '2023-07-24 21:47:52', 0);
INSERT INTO `app_message` VALUES (1715, 4, 0, 1, '你好', '2023-07-24 21:47:55', 0);
INSERT INTO `app_message` VALUES (1716, 4, 0, 1, '你好', '2023-07-24 22:09:53', 0);
INSERT INTO `app_message` VALUES (1717, 4, 0, 1, '你好', '2023-07-25 09:08:28', 0);
INSERT INTO `app_message` VALUES (1718, 34, 0, 1, '你好', '2023-07-28 14:20:28', 0);
INSERT INTO `app_message` VALUES (1719, 34, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-28 14:20:31', 0);
INSERT INTO `app_message` VALUES (1720, 34, 0, 6, '今天的狗真漂亮', '2023-07-28 14:21:03', 0);
INSERT INTO `app_message` VALUES (1721, 34, 1, 6, '今天的狗真漂亮\n狗是人类最忠诚的朋友之一，它们的忠诚和友善赢得了无数人的喜爱。每一只狗都有自己独特的外貌和个性，而今天我见到的这只狗更是让我惊叹不已。\n这只狗的毛色鲜艳，闪烁着金色的光芒。它的毛发柔软而有光泽，看起来非常健康。它的眼睛明亮而炯炯有神，透露出一种温暖和善意的气息。它的耳朵立起来，时不时地会扭动一下，似乎在聆听周围的声音。\n这只狗的身材匀称，体态优雅。它步履轻盈，活力四溢。当它摇动尾巴时，整个身体都跟着摇晃，表达着它的喜悦和对人的友好。它的四条腿均匀有力，展示出了它的力量和灵活性。\n除了外貌上的吸引力，这只狗的性格也非常讨人喜欢。它友善而温柔，对人类充满了爱和耐心。每当有人走近它时，它总是热情地摇尾巴，表示欢迎。它善于与人交流，会用眼神和身体语言表达自己的需求和情感。\n与这只狗相处的过程中，我感受到了它带来的快乐和幸福。无论是散步时的陪伴，还是在家里的亲密时刻，它总是给予我无尽的快乐和安慰。与狗相处，让我感受到了无条件的爱和宠爱。\n今天的狗真漂亮，它的美丽不仅体现在外貌上，更体现在它的灵性和友善上。它是一个值得我们学习的榜样，教会我们如何去善待他人，如何用爱去感染和影响他人。\n在这个快节奏而繁忙的社会中，与一只漂亮的狗相伴，不仅能够带给我们快乐，还能够让我们放慢脚步，感受生活的美好。让我们珍惜与狗的相处时光，让它们在我们的生活中绽放出更多的快乐和幸福。', '2023-07-28 14:21:18', 0);
INSERT INTO `app_message` VALUES (1722, 34, 0, 6, '冬天的第一场雪', '2023-07-28 14:22:52', 0);
INSERT INTO `app_message` VALUES (1723, 34, 1, 6, '今天的狗真漂亮，它的美丽让我感到心旷神怡。冬天的第一场雪纷纷扬扬地飘落在大地上，洁白的雪花覆盖了一切。而在这银装素裹的世界中，一只狗儿在雪地里蹦跳着，带给我无尽的惊喜和愉悦。\n这只狗的毛发是雪白的，宛如银装素裹。它的身姿高大而挺拔，毛发浓密而有光泽。每一根毛发都被雪花精心点缀着，仿佛是大自然亲手为它打扮而来。当它在雪地里奔跑时，毛发随着风飘动，犹如一团白云在天空中自由翱翔。\n它的眼神明亮而炯炯有神，透露出一种灵动和活力。它时不时地扭动着脖子，好奇地环顾四周，似乎在寻找着什么。每一次扭动都让它的毛发散发出丝丝寒意，却又带给人一种温暖和舒适的感觉。\n这只狗敏捷而灵活，它快速地在雪地上穿梭，留下一串脚印。它的四条腿稳健有力，每一步都带着一种优雅和自信。当它跃起时，雪花在它的周围飞舞，仿佛为它献上了美丽的祝福。\n在这寒冷的冬天，这只狗的存在让我感到温暖和欣慰。它的快乐和自由无拘束的态度，让我不禁想起了自己曾经拥有的童年时光。在雪地里玩耍，感受大自然的美好，是一种难以言表的幸福。\n今天的狗真漂亮，它不仅给我带来了视觉上的享受，更带给我内心深处的喜悦和感动。它是大自然的馈赠，是冬天的美丽注解。让我们珍惜这样的时刻，与这只狗一同享受冬天的第一场雪，感受生活中的美好和惊喜。', '2023-07-28 14:23:10', 0);
INSERT INTO `app_message` VALUES (1724, 34, 0, 6, '冬天的第一场雪', '2023-07-28 14:23:40', 0);
INSERT INTO `app_message` VALUES (1725, 34, 0, 6, '冬天的第一场雪', '2023-07-28 14:24:55', 0);
INSERT INTO `app_message` VALUES (1726, 34, 1, 6, '当寒冷的冬天来临时，大自然也开始为我们带来美丽的景色。而冬天的第一场雪，更是给人们带来了无限的喜悦和惊喜。\n当寒冷的空气与湿润的空气相遇时，精美的雪花便在空中飘舞起来。它们轻盈地飘落，仿佛是天空的使者，带来了一片纯洁与宁静。当人们看到这些飘雪时，内心不禁涌起一种幸福感，仿佛回到了童年时代，可以玩雪、堆雪人、打雪仗的快乐时光。\n冬天的第一场雪也给人们带来了一种独特的美感。大地被白雪覆盖，仿佛是披上了一层银装，闪闪发光。树枝上挂满了洁白的雪花，如同天使的羽毛般轻盈。街道上的建筑物也被雪花装点得如诗如画，给人们一种宛如置身于童话世界的感觉。\n冬天的第一场雪不仅给人们带来美丽的景色，还给大自然带来了一场洗礼。雪花轻柔地覆盖在大地上，为植物和动物提供了一个温暖的保护层。在冬天的寒冷中，大地和万物休眠，等待着春天的到来。而雪花的降临，也为大自然的恢复注入了一丝生机和希望。\n除了美丽和希望，冬天的第一场雪还给人们带来了一种特殊的心情。当人们看到窗外飘落的雪花时，心中不禁浮现出温馨的画面：家人围坐在一起，品尝着热腾腾的汤羹，享受着温暖的氛围。雪花的飘落也让人们不禁回忆起童年时代的快乐时光，或是与朋友相聚打雪仗的欢笑声。\n冬天的第一场雪是大自然的馈赠，也是生活的赐予。它带给我们美丽、希望、温馨和回忆。无论是站在窗前欣赏，还是走出户外感受雪花的触感，我们都能体会到冬天的独特之美。让我们珍惜这一刻，享受雪花带来的喜悦，让冬天的第一场雪成为我们心中美好的记忆。', '2023-07-28 14:26:05', 0);
INSERT INTO `app_message` VALUES (1727, 34, 0, 7, '冬天的第一场雪', '2023-07-28 14:26:57', 0);
INSERT INTO `app_message` VALUES (1728, 34, 1, 7, '冬天的第一场雪飘落，\n银白的雪花纷纷扬扬。\n轻轻地落在大地上，\n像是天使洒下的香。\n纤纤细雪覆盖山巅，\n世界仿佛沉浸在梦境间。\n冰冷的寒风吹拂着脸庞，\n却带来了一片宁静的安详。\n大地被雪花装点得如画，\n树枝上挂满了晶莹的霜。\n纯净的白色仿佛点亮了一切，\n给大地带来了一丝生机的光。\n孩子们充满喜悦地奔跑，\n用雪球打闹、堆起了雪人。\n欢声笑语充满了整个空气，\n冬天的第一场雪，无比美丽温暖。\n走在雪地里的脚步声，\n留下了一串串深深的印痕', '2023-07-28 14:27:50', 0);
INSERT INTO `app_message` VALUES (1729, 34, 0, 7, '冬天的第一场雪', '2023-07-28 14:28:11', 0);
INSERT INTO `app_message` VALUES (1730, 34, 1, 7, '冬天的第一场雪飘落，\n纯白的雪花在空中舞蹈。\n寒冷的空气中弥漫着冰凉，\n大地被雪的覆盖变得祥和。\n雪花轻轻地落在大街小巷，\n铺上了一层银白的毯子。\n孩子们兴奋地奔跑着玩耍，\n欢声笑语让世界变得温暖。\n屋顶上的雪堆如同白玉，\n树枝上的雪花像是花朵。\n清晨的阳光照耀着大地，\n雪地上闪烁着晶莹的光泽。\n冬天的第一场雪，美丽而纯净，\n给人们带来了无尽的想象。\n让我们一起欣赏这冰雪的舞蹈，\n感受冬日的温暖和宁静。', '2023-07-28 14:28:18', 0);
INSERT INTO `app_message` VALUES (1731, 34, 0, 7, '题目：冬天的第一场雪，要求：七言诗', '2023-07-28 14:29:08', 0);
INSERT INTO `app_message` VALUES (1732, 34, 1, 7, '寒风呼啸夜未央，\n天空飘洒雪花扬。\n银装素裹覆大地，\n寂寞寒冷尽收藏。\n轻轻落地如羽绒，\n洁白纷飞似仙乡。\n初雪飘零心欢喜，\n冬季序曲已开场。', '2023-07-28 14:29:12', 0);
INSERT INTO `app_message` VALUES (1733, 34, 0, 7, '题目：冬天的第一场雪，写一首诗', '2023-07-28 14:30:18', 0);
INSERT INTO `app_message` VALUES (1734, 34, 1, 7, '寒风吹过天地间，\n冬天的第一场雪降临。\n纷纷扬扬飘洒下，\n世界披上银装衣。\n纤细的雪花轻飘舞，\n洁白如雪的童话世界。\n落在树梢和花蕊上，\n如诗如画的美丽景。\n小鸟儿躲在温暖窝，\n欢快歌唱响远处。\n雪地上留下脚印，\n寻找着温暖的足迹。\n冬日的雪，如梦如幻，\n点亮了大地的寂静。\n让我们翩然陶醉，\n享受冬天的美好时刻。\n雪花飘落，似诗似画，\n铺满大地如白茫茫。\n让我们一起舞动，\n在冬天的旋律中徜徉。\n冬天的第一场雪，\n是大自然的礼物。\n让我们心怀感恩，\n迎接冰雪的季节。', '2023-07-28 14:30:26', 0);
INSERT INTO `app_message` VALUES (1735, 34, 0, 7, '冬天的第一场雪', '2023-07-28 14:32:16', 0);
INSERT INTO `app_message` VALUES (1736, 34, 1, 7, '冬日寒风凛冽，大地静谧如歌，\n白茫茫的世界，映照着寒冬的美妙。\n小小的雪花纷纷扬扬，轻轻地飘落下来，\n落在树梢、花苞，仿佛是天赐的魔法。\n初雪如羽，轻描淡写，点缀着大地的画卷，\n柔软的雪花轻轻落在窗前，抚慰了心灵的忧伤。\n孩童们兴奋地奔跑，雪花在他们的身旁舞蹈，\n纯洁的笑容，洋溢着对冬天的期盼和喜悦。\n冬天的第一场雪，洁白如银，美丽如梦，\n它给大地披上一层银装，如同童话中的仙境。\n寒冷的空气中弥漫着清新的气息，沁人心脾，\n让人们感受到自然的力量和生命的美丽。\n雪花落下，世界安静了，大地沉睡在冰天雪地，\n但内心却充满了温暖和希望，在这个寒冷的季节。\n让我们迎接冬天的第一场雪，享受它带来的宁静，\n让心灵在雪花中飞舞，感受冬天的神奇之美。', '2023-07-28 14:32:28', 0);
INSERT INTO `app_message` VALUES (1737, 34, 0, 8, '冬天的第一场雪', '2023-07-28 14:32:31', 0);
INSERT INTO `app_message` VALUES (1738, 34, 1, 8, '当纷纷扬扬的雪花纷纷落下，整个世界仿佛被柔软的洁白所包裹。寒冷的冬天，终于迎来了第一场雪。雪花像是天空中的精灵，轻盈地舞动着，给大地披上了一层银装。凝视着窗外的雪景，仿佛时间也被凝固，宛如进入了一个梦幻的童话世界。我不禁想起了小时候，和家人一起堆雪人、打雪仗的快乐时光。冬天的第一场雪，带给我们无尽的温暖和回忆。让我们一起享受这片银装世界的美好吧！#冬天的第一场雪# #雪花纷飞# #童话世界#', '2023-07-28 14:32:38', 0);
INSERT INTO `app_message` VALUES (1739, 34, 0, 8, '我今天画了浓妆', '2023-07-28 14:33:49', 0);
INSERT INTO `app_message` VALUES (1740, 34, 1, 8, '《浓妆脱下来，我还是我》\n今天，我化上了浓妆，像一道绚丽的彩虹闪耀在人群中。眼妆勾勒出迷人的双眸，唇妆鲜艳如花，让我散发出自信和魅力的气息。然而，当我脱下这层浓妆，我依然是真实的自己。因为真正的美丽不仅仅存在于外表，更源自内心的光芒。无论是素颜还是妆容艳丽，我都是独一无二的我。让我们一同追寻真实的美丽，展现最真实的自己吧！', '2023-07-28 14:33:55', 0);
INSERT INTO `app_message` VALUES (1741, 34, 0, 8, '我今天画了浓妆', '2023-07-28 14:36:40', 0);
INSERT INTO `app_message` VALUES (1742, 34, 1, 8, '【标题】\n红唇浓妆，点亮夜晚的绚烂\n【正文】\n妆容如画，浓烈而又妖娆。今天，我尝试了一次浓妆，给自己带来了不一样的魅力。仿佛是化身成了那个自信而迷人的女神，步入了属于自己的时尚舞台。\n一抹烈焰红唇，唇色鲜明而有力，仿佛是点亮了整个夜晚的明星。眼妆用上了烟熏的技巧，勾勒出深邃的眼神，让我仿佛有了无尽的魅力。脸部轮廓的修饰，让我的五官更加立体，散发出一种自信与优雅。\n浓妆并不只是为了追求别人的赞美，更是为了让自己更加自信。每一次化妆，我都可以在镜子前面找到自己最美的一面，让自己更加自信地面对生活的挑战。\n在这个充满自由与创意的时代，每个人都有权利去定义自己的美丽。无论是素颜还是浓妆，都是表达自己个性与风格的方式。今天的浓妆给我带来了别样的惊喜，也让我更加坚信，美丽不仅仅是外表的装饰，更是内心的散发。\n让浓妆成为你的秘密武器，点亮自己的人生舞台。不论是聚会、约会还是重要场合，都让浓妆成为你的闪亮标志。勇敢尝试，勇敢表达，你会发现自己拥有无尽的可能性。\n所以，勇敢地画上浓妆，释放你内心的自信和魅力。让你的妆容成为一幅艺术品，让你的美丽散发出耀眼的光芒。无论何时何地，都让浓妆成为你的自信密码，点亮你的人生之路。让我们一起，用浓妆勾勒出属于自己的绚丽人生！', '2023-07-28 14:36:55', 0);
INSERT INTO `app_message` VALUES (1743, 34, 0, 8, '冬天的第一场雪', '2023-07-28 14:37:25', 0);
INSERT INTO `app_message` VALUES (1744, 34, 1, 8, '冬天的第一场雪\n❄️寒冷的季节，终于迎来了第一场纷飞的雪花。仿佛天空洒下了一层洁白的薄纱，让整个世界都被柔和的光线包裹着。❄️\n🌬️漫天的雪花像是无数个小精灵，跳跃着、旋转着，轻轻地落在大地上。它们像是舞者，优雅地飘落，给寒冷的冬天带来了一丝温暖和美好。🌬️\n🔥我喜欢看着窗外的雪花纷纷扬扬，感受着它们轻轻地融化在我的手心。我仿佛看到了冬天的童话世界，白雪覆盖的街道、屋顶上的雪花，都让我心生喜悦。🔥\n🧣我穿上了厚厚的围巾，戴上了温暖的帽子和手套，走出家门，踏着雪花留下的痕迹，迎接这个美好的冬天。我感受到了冬天的寒冷，也感受到了它的美丽和神奇。🧣\n🎿冬天的第一场雪，让我想起了童年时的欢乐。我和朋友们一起堆雪人、打雪仗，笑声在寒风中回荡。这一刻，时间仿佛凝固了，只有纯粹的快乐在心间流淌。🎿\n❄️在这个冬天，让我们一起享受第一场雪带来的美好。走进雪的世界，感受它的纯净和静谧。让我们用心去触摸雪花，感受它们的温度和生命力。❄️\n🌟冬天的第一场雪，是一次与自然的亲密接触。让我们怀抱着对冬天的热爱，迎接雪花的降临，与冬天的浪漫相伴。🌟\n#冬天的第一场雪 #雪花纷飞 #冬日童话 #冬日浪漫 #与自然亲密接触', '2023-07-28 14:37:41', 0);
INSERT INTO `app_message` VALUES (1745, 34, 0, 8, '我家的小狗真好看', '2023-07-28 14:38:56', 0);
INSERT INTO `app_message` VALUES (1746, 34, 1, 8, '【标题】小红书体文案模板：我家的小狗真好看，天生萌态可掬，撩人的眼神让人心醉！\n【正文】\n一只双眼闪亮的小狗，宛如天使降临人间。它的毛色细腻如绸，柔软如云，轻轻抚摸，仿佛触碰到了一片温暖的阳光。它那一双透亮的眼睛，仿佛能看透人心，让人无法抗拒它的可爱魅力。\n每天早晨，当我醒来的时候，小狗总是第一个迎接我，尾巴摇摆着，充满了对生活的期待。它的快乐感染了我，让我忘记了一切烦恼和困扰。无论是在家中还是户外，它总是与我紧密相依，伴我度过每一个快乐的时刻。\n小狗的聪明才智也让我惊叹不已。它很快就学会了各种小技巧，比如握手、坐下、甚至是装死，每次看到它乖巧地完成任务时，我都不禁为它的聪明才智喝彩。它总是能准确地理解我的表情和语气，仿佛它能读懂我的心思。\n与小狗相处的日子里，我发现自己变得更加关心和爱护生命。它教会了我如何去包容、去关怀，让我懂得了什么是真正的无条件的爱。每一次与它的互动，都让我感受到了生命的宝贵和幸福。\n小狗，你是我生命中最美好的礼物，你的存在让我的世界变得更加充实和多彩。无论是在阳光明媚的日子里，还是在阴雨绵绵的时刻，你都是我最忠实的伴侣和朋友。谢谢你，我的小狗，因为有了你，我的生活变得更加完美！', '2023-07-28 14:39:10', 0);
INSERT INTO `app_message` VALUES (1747, 34, 0, 9, '苦瓜炒鸡蛋', '2023-07-28 14:40:57', 0);
INSERT INTO `app_message` VALUES (1748, 34, 1, 9, '苦瓜炒鸡蛋是一道简单又美味的家常菜。下面是制作苦瓜炒鸡蛋的步骤：\n材料：\n- 苦瓜：1根\n- 鸡蛋：2个\n- 大蒜：2瓣\n- 生抽：适量\n- 盐：适量\n- 食用油：适量\n步骤：\n1. 苦瓜去皮，切成薄片或者丝。\n2. 鸡蛋打入碗中，加入适量的盐，搅拌均匀。\n3. 锅中加入适量的食用油，烧热后加入蒜末炒香。\n4. 加入苦瓜翻炒，炒至苦瓜变软。\n5. 将鸡蛋液倒入锅中，用筷子迅速搅拌均匀。\n6. 炒至鸡蛋凝固，加入适量的生抽调味。\n7. 炒匀后即可出锅，享用美味的苦瓜炒鸡蛋。\n温馨提示：苦瓜炒鸡蛋口感清爽，苦瓜的苦味可以通过炒制和调味来减轻。可以根据个人口味调整盐和生抽的用量。', '2023-07-28 14:41:07', 0);
INSERT INTO `app_message` VALUES (1749, 34, 0, 9, '油漆怎么清理', '2023-07-28 14:41:25', 0);
INSERT INTO `app_message` VALUES (1750, 34, 1, 9, '清理油漆时，可以根据油漆的类型和清理的表面不同采取不同的方法。下面是一些常见的清理油漆的方法：\n1. 水性油漆：水性油漆可以使用温肥皂水或洗涤剂溶液进行清洁。将溶液涂在油漆上，用软布或海绵轻轻擦拭，直到油漆被清除。如果油漆比较顽固，可以用刮刀轻轻刮除。\n2. 油性油漆：油性油漆比较难清洁，可以使用溶剂如酒精、醋或油漆稀释剂来清洁。将溶剂倒在软布上，然后轻轻擦拭油漆表面，直到油漆被清除。请注意，使用溶剂时需要保持通风良好，并避免火源。\n3. 乳胶漆：乳胶漆是一种常见的墙面涂料，清理起来相对简单。如果油漆还没有完全干燥，可以用温肥皂水或洗涤剂溶液擦拭。如果油漆已经干燥，可以用湿布浸湿油漆表面，并轻轻擦拭，或者使用专门的乳胶漆清洁剂。\n无论哪种类型的油漆，都需要在清洁之前先测试清洁剂在不显眼的区域上，以确保不会对表面造成损害。另外，及时清理油漆会取得更好的清洁效果，尽量不要让油漆干燥固化。', '2023-07-28 14:41:36', 0);
INSERT INTO `app_message` VALUES (1751, 34, 0, 9, '茶鸡蛋', '2023-07-28 14:42:02', 0);
INSERT INTO `app_message` VALUES (1752, 34, 1, 9, '茶鸡蛋是一道非常受欢迎的传统中国小吃，具有浓郁的茶香和咸香味道。下面是制作茶鸡蛋的简单步骤： \n材料：\n- 鸡蛋：6个\n- 茶叶：1袋（可根据个人喜好选择不同种类的茶叶）\n- 酱油：2汤匙\n- 盐：适量\n- 水：适量\n- 香料（可选，如八角、香叶、桂皮等）\n步骤：\n1. 先将鸡蛋煮熟，然后用勺子轻轻敲碎蛋壳，不要敲碎到蛋白，只需让蛋壳有裂纹即可。\n2. 将鸡蛋放入一个容器中。\n3. 在另一个锅中，加入适量的水，放入茶叶、酱油、盐和香料，煮沸。\n4. 将煮沸的茶水倒入装有鸡蛋的容器中，确保鸡蛋完全浸泡在茶水中，然后盖上盖子。\n5. 将容器放入冰箱，浸泡4-6个小时或过夜，时间越长，茶香味越浓郁。\n6. 取出茶鸡蛋，剥去蛋壳，即可食用。\n茶鸡蛋可作为小吃，也常用作早餐或配菜。希望你喜欢这道美味的茶鸡蛋！如果你有其他厨房相关问题或需要其他菜谱推荐，请随时告诉我。', '2023-07-28 14:42:14', 0);
INSERT INTO `app_message` VALUES (1753, 34, 0, 9, '狮子', '2023-07-28 14:43:42', 0);
INSERT INTO `app_message` VALUES (1754, 34, 1, 9, '您好！您想要了解关于狮子的菜谱吗？很抱歉，我无法为您提供与狮子有关的菜谱，因为狮子是一种动物，而不是食材。如果您有其他厨房相关的问题或者需要菜谱推荐，请随时告诉我，我会尽力帮助您。', '2023-07-28 14:43:46', 0);
INSERT INTO `app_message` VALUES (1755, 34, 0, 10, '狮子', '2023-07-28 14:44:01', 0);
INSERT INTO `app_message` VALUES (1756, 34, 1, 10, '狮子座是太阳系中的第五个星座，出生于7月23日至8月22日之间。狮子座的人通常具有自信、慷慨和领导才能。以下是狮子座的一些特点和建议：\n1. 自信勇敢：狮子座的人往往自信满满，他们乐于展现自己的才华和个性。与他们相处时，给予他们肯定和鼓励，他们会更加热情和积极。\n2. 爱领导：狮子座的人天生具备领导才能，他们乐于承担责任并带领团队。他们擅长激发他人的潜力，但也需要学会倾听他人的意见和建议。\n3. 热情奔放：狮子座的人热情洋溢，喜欢在人群中成为焦点。他们喜欢参与社交活动和享受与他人的互动。与狮子座的人相处时，给予他们足够的关注和赞赏，他们会感到非常开心。\n4. 坚持自己的价值观：狮子座的人非常重视自己的价值观和原则。他们有着强烈的正义感，喜欢为自己认为正确的事情而奋斗。尊重他们的信仰和意见，与他们进行建设性的对话。\n5. 关注自我成长：狮子座的人追求个人成长和进步。他们喜欢学习新的知识和技能，并努力成为更好的自己。提供给他们学习和发展的机会，他们会非常珍惜。\n希望以上信息对你有帮助！如果你还有其他问题，可以继续提问。', '2023-07-28 14:44:15', 0);
INSERT INTO `app_message` VALUES (1757, 34, 0, 10, '1997-08-04', '2023-07-28 14:45:08', 0);
INSERT INTO `app_message` VALUES (1758, 34, 1, 10, '你的星座是狮子座（Leo）。狮子座的人通常自信、热情、有领导力和创造力。他们喜欢成为注意的焦点，善于表达自己，对于追求成功和享受生活有强烈的渴望。他们也很慷慨大方，乐于帮助他人。在人际关系中，他们倾向于成为领导者，并希望得到尊重和崇拜。\n狮子座的人天生具有领导才能和魅力，他们通常擅长演讲和表达自己的观点。他们热爱生活，喜欢参与各种社交活动和娱乐。在职场上，他们通常有野心和决心，努力追求成功和卓越。\n综上所述，狮子座的人在个性上是自信和有魅力的，他们渴望成功并乐于帮助他人。', '2023-07-28 14:45:16', 0);
INSERT INTO `app_message` VALUES (1759, 34, 0, 10, '狮子座', '2023-07-28 18:17:51', 0);
INSERT INTO `app_message` VALUES (1760, 34, 1, 10, '狮子座（7月23日-8月22日）是火象星座，代表着自信、领导力和热情。以下是一些关于狮子座的特点和建议：\n1. 特点：狮子座的人通常有强烈的自尊心和自信心，他们热爱被关注和赞美。他们有领导才能和决策能力，善于激励他人。他们的热情和乐观态度也使他们成为很好的团队成员。\n2. 爱情：狮子座的人在爱情中非常激情而专注。他们喜欢被呵护和崇拜，并希望与伴侣分享自己的成功和荣耀。他们需要伴侣给予足够的关注和赞美。\n3. 职业：狮子座的人喜欢在职业生涯中扮演领导角色。他们适合从事需要展示自己才能的工作，如演艺、销售、管理和创业等。他们有很高的抱负，追求辉煌和成功。\n4. 建议：狮子座的人应该学会平衡自信和自我意识，尊重他人的意见和感受。虽然他们热爱被关注，但也要学会倾听他人的需求。此外，他们也应该注意控制自己的骄傲和固执，以免给他人带来压力。\n总的来说，狮子座的人热爱生活，充满激情和领导力。他们是勇敢、自信和有魅力的人。', '2023-07-28 18:18:06', 0);
INSERT INTO `app_message` VALUES (1761, 34, 0, 1, '今天我去了一个神秘的地方，这个地方得非常的每次、我非常喜欢', '2023-07-28 18:18:59', 0);
INSERT INTO `app_message` VALUES (1762, 34, 1, 1, '哇，听起来很有趣！你能告诉我这个神秘地方是哪里吗？我很好奇你为什么非常喜欢它。', '2023-07-28 18:19:02', 0);
INSERT INTO `app_message` VALUES (1763, 34, 0, 1, '你知道java开发吗，你感觉java的性能怎么样', '2023-07-28 18:24:44', 0);
INSERT INTO `app_message` VALUES (1764, 34, 0, 1, '你知道java开发吗，你感觉java的性能怎么样', '2023-07-28 18:24:51', 0);
INSERT INTO `app_message` VALUES (1765, 34, 0, 1, '你知道java开发吗，你感觉java的性能怎么样', '2023-07-28 18:25:14', 0);
INSERT INTO `app_message` VALUES (1766, 34, 0, 1, '你知道java开发吗，你感觉java的性能怎么样', '2023-07-28 18:28:37', 0);

-- ----------------------------
-- Table structure for app_noti_read
-- ----------------------------
DROP TABLE IF EXISTS `app_noti_read`;
CREATE TABLE `app_noti_read`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `notice_id` int(11) NULL DEFAULT NULL COMMENT '公告的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_noti_read
-- ----------------------------
INSERT INTO `app_noti_read` VALUES (1, 34, 3);

-- ----------------------------
-- Table structure for app_order
-- ----------------------------
DROP TABLE IF EXISTS `app_order`;
CREATE TABLE `app_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `vip_id` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '订单状态、0未支付、1已支付',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单的id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_order
-- ----------------------------
INSERT INTO `app_order` VALUES (16, 1, '5', 1, 'transactionId', '2023-07-18 14:02:22');
INSERT INTO `app_order` VALUES (17, 1, '5', 1, 'transactionId', '2023-07-18 14:02:33');
INSERT INTO `app_order` VALUES (18, 1, '5', 1, 'transactionId', '2023-07-18 14:02:58');
INSERT INTO `app_order` VALUES (19, 1, '5', 1, 'transactionId', '2023-07-18 17:15:42');
INSERT INTO `app_order` VALUES (20, 1, 'vip_year', 1, 'transactionId', '2023-07-18 17:16:07');
INSERT INTO `app_order` VALUES (26, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 10:50:36');
INSERT INTO `app_order` VALUES (27, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 10:51:05');
INSERT INTO `app_order` VALUES (28, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 10:51:27');
INSERT INTO `app_order` VALUES (29, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 10:51:47');
INSERT INTO `app_order` VALUES (30, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 10:51:59');
INSERT INTO `app_order` VALUES (31, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 10:52:06');
INSERT INTO `app_order` VALUES (32, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 14:24:39');
INSERT INTO `app_order` VALUES (33, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 14:24:45');
INSERT INTO `app_order` VALUES (34, 1, 'com.js.chatgpt.week', 1, '2000000371984560', '2023-07-20 14:25:53');
INSERT INTO `app_order` VALUES (35, 1, 'com.js.chatgpt.week', 1, '2000000372331321', '2023-07-20 14:27:22');
INSERT INTO `app_order` VALUES (36, 4, 'com.js.chatgpt.week', 1, '2000000372413823', '2023-07-20 14:53:21');
INSERT INTO `app_order` VALUES (37, 4, 'com.js.chatgpt.week', 1, '2000000372465126', '2023-07-20 15:39:18');
INSERT INTO `app_order` VALUES (38, 33, 'com.js.chatgpt.week', 1, '2000000372776720', '2023-07-20 21:04:02');
INSERT INTO `app_order` VALUES (39, 34, 'com.js.chatgpt.life', 1, '2000000372776726', '2023-07-20 21:04:02');
INSERT INTO `app_order` VALUES (40, 35, 'com.js.chatgpt.week', 1, '2000000373883916', '2023-07-22 10:07:30');
INSERT INTO `app_order` VALUES (41, 34, 'com.js.chatgpt.week', 1, '2000000372331321', '2023-07-22 13:06:33');
INSERT INTO `app_order` VALUES (42, 34, 'com.js.chatgpt.year', 1, '2000000372331321', '2023-07-22 13:06:49');
INSERT INTO `app_order` VALUES (43, 38, 'com.js.chatgpt.week', 1, '2000000373920362', '2023-07-22 14:17:00');
INSERT INTO `app_order` VALUES (44, 4, 'com.js.chatgpt.year', 1, '2000000374097771', '2023-07-23 16:24:22');

-- ----------------------------
-- Table structure for app_support
-- ----------------------------
DROP TABLE IF EXISTS `app_support`;
CREATE TABLE `app_support`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `support_id` int(11) NULL DEFAULT NULL COMMENT '点赞的id',
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0、已读、1、未读',
  `support_to` int(11) NULL DEFAULT NULL COMMENT '点赞的来源，1、问题或攻略、2、用户',
  `support_user_id` int(11) NULL DEFAULT NULL COMMENT '点赞的用户的id，主要用于评论的时候点赞',
  `type` int(11) NULL DEFAULT NULL COMMENT '点赞的类型：2、广场、3、攻略',
  `create_time` datetime NULL DEFAULT NULL COMMENT '点赞的时间',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '点赞的评论的id，只有给用户的评论点赞有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `support_id_index`(`support_id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `support_user_id_index`(`support_user_id`) USING BTREE,
  INDEX `comment_id_index`(`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_support
-- ----------------------------
INSERT INTO `app_support` VALUES (3, 34, 14, '1', 1, NULL, 2, '2023-07-29 17:59:20', NULL);
INSERT INTO `app_support` VALUES (6, 34, 15, '1', 1, NULL, 2, '2023-07-29 19:15:05', NULL);
INSERT INTO `app_support` VALUES (8, 34, 15, '1', 2, 39, 2, '2023-07-29 19:20:41', 4);
INSERT INTO `app_support` VALUES (9, 34, 15, '1', 2, 34, 2, '2023-07-29 19:48:16', 8);
INSERT INTO `app_support` VALUES (11, 34, 13, '1', 1, NULL, 2, '2023-07-29 19:55:51', NULL);
INSERT INTO `app_support` VALUES (14, 34, 7, '1', 1, NULL, 3, '2023-07-30 14:33:29', NULL);
INSERT INTO `app_support` VALUES (16, 34, 7, '1', 2, 34, 3, '2023-07-30 14:37:13', 20);
INSERT INTO `app_support` VALUES (18, 34, 5, '1', 1, NULL, 2, '2023-07-31 14:01:19', NULL);
INSERT INTO `app_support` VALUES (20, 34, 15, '1', 2, 34, 2, '2023-07-31 14:02:30', 40);
INSERT INTO `app_support` VALUES (23, 34, 15, '1', 2, 34, 2, '2023-07-31 14:29:04', 39);

-- ----------------------------
-- Table structure for app_support_log
-- ----------------------------
DROP TABLE IF EXISTS `app_support_log`;
CREATE TABLE `app_support_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NULL DEFAULT NULL COMMENT '来源的用户的id',
  `to_user_id` int(11) NULL DEFAULT NULL COMMENT '点赞的用户的id',
  `type` int(11) NULL DEFAULT NULL COMMENT '2广场、3攻略',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '如果点赞的类型是广场或攻略、那么此id代表的就是广场或者攻略的id；如果点赞的类型是用户的评论，那么此id代表的就是用户评论的id',
  `comment_type` int(11) NULL DEFAULT NULL COMMENT '点赞的类型。1、提问或者广场，2、用户的评论',
  `comment_id_real` int(11) NULL DEFAULT NULL COMMENT '评论或者广场的id（真实的）',
  `is_read` int(11) NULL DEFAULT NULL COMMENT '0已读、1未读',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_support_log
-- ----------------------------
INSERT INTO `app_support_log` VALUES (2, 34, 34, 2, 5, 1, 5, 0, '2023-07-31 14:01:19');
INSERT INTO `app_support_log` VALUES (4, 34, 34, 2, 40, 2, 15, 0, '2023-07-31 14:02:30');
INSERT INTO `app_support_log` VALUES (7, 34, 34, 2, 39, 2, 15, 0, '2023-07-31 14:29:04');

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户的id',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `photo` varchar(2555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别：0男、1女、2未知',
  `coin` int(11) NULL DEFAULT NULL COMMENT '剩余聊天次数',
  `permanent` int(11) NULL DEFAULT NULL COMMENT '0永久会员、1非永久会员',
  `invite_id` int(11) NULL DEFAULT NULL COMMENT '邀请人id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `is_available` int(11) NULL DEFAULT NULL COMMENT '是否可用、0正常1不可用',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否已删除、0正常1已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_phone`(`phone`) USING BTREE,
  INDEX `index_invite_id`(`invite_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (1, '15003574377', 'http://127.0.0.1:8080/profile/upload/2023/07/11/600_20230711161101A001.jpg', 'sd', 23, 0, 966, 0, NULL, 'gH8o5s', '2023-07-07 15:50:53', '2023-07-28 14:27:22', 0, 1);
INSERT INTO `app_user` VALUES (2, '18202805879', NULL, NULL, NULL, NULL, 0, 1, NULL, '23mOl9', '2023-07-11 22:55:57', '2023-07-11 22:55:57', 0, 1);
INSERT INTO `app_user` VALUES (3, '18202805879', 'http://43.138.111.70:8333/profile/upload/2023/07/12/111_20230712190125A003.png', 'Ahaha', 10, 1, 0, 1, NULL, 'QpJl', '2023-07-12 16:39:30', '2023-07-12 16:39:30', 0, 1);
INSERT INTO `app_user` VALUES (4, '18202805879', NULL, 'Waaghals', 12, 0, 869, 1, NULL, 'HgxD', '2023-07-13 10:14:33', '2024-08-06 16:24:22', 0, 0);
INSERT INTO `app_user` VALUES (33, '13161979592', 'http://43.138.111.70:8333/profile/upload/2023/07/21/111_20230721162009A001.png', '小哈哈哈', 23, 0, 0, 1, NULL, 'u8LBe9', '2023-07-20 20:27:35', '2023-07-30 21:04:02', 0, 1);
INSERT INTO `app_user` VALUES (34, '15003574377', 'http://www.chataizs.cn/file/photo2.png', 'AI助手', NULL, NULL, 0, 1, NULL, 'zVqmVf', '2023-07-21 15:04:54', '2023-07-29 13:06:49', 0, 0);
INSERT INTO `app_user` VALUES (35, '13161979592', 'http://www.chataizs.cn/file/photo4.png', 'AI助手', NULL, NULL, 0, 1, NULL, 'PO0RX2', '2023-07-22 08:37:12', '2023-08-01 10:07:30', 0, 1);
INSERT INTO `app_user` VALUES (36, '13161979592', 'http://www.chataizs.cn/file/photo1.png', 'AI助手', NULL, NULL, 5, 1, NULL, 'FJx2hz', '2023-07-22 12:14:39', '2023-07-22 12:14:39', 0, 1);
INSERT INTO `app_user` VALUES (37, '13161979592', 'http://www.chataizs.cn/file/photo2.png', '无敌小霸王', 0, 2, 4, 1, NULL, 'FBtomI', '2023-07-22 12:34:37', '2023-07-22 12:34:37', 0, 0);
INSERT INTO `app_user` VALUES (38, '18600571125', 'http://43.138.111.70:8333/profile/upload/2023/07/22/111_20230722134657A001.png', 'AI助手', 0, 2, 0, 1, NULL, 'rCf9vu', '2023-07-22 13:37:46', '2023-08-01 14:17:00', 0, 0);
INSERT INTO `app_user` VALUES (39, '18632187415', 'http://www.chataizs.cn/file/photo1.png', 'AI助手', NULL, NULL, 2, 1, NULL, 'pcDVg9', '2023-07-22 14:09:35', '2023-07-22 14:09:35', 0, 0);

-- ----------------------------
-- Table structure for app_vip
-- ----------------------------
DROP TABLE IF EXISTS `app_vip`;
CREATE TABLE `app_vip`  (
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名字',
  `amount` int(255) NULL DEFAULT NULL COMMENT '金额（单位分）',
  `add_day` int(255) NULL DEFAULT NULL COMMENT '首冲送会员天数',
  `day_amount` int(255) NULL DEFAULT NULL COMMENT '折合一天多少钱（单位分）',
  `is_use` int(255) NULL DEFAULT NULL COMMENT '是否启用，0启动、1不启用',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_vip
-- ----------------------------
INSERT INTO `app_vip` VALUES ('com.js.chatgpt.life', '终身会员', 16800, 0, 1, 0, 1);
INSERT INTO `app_vip` VALUES ('com.js.chatgpt.year', '包年会员', 9800, 20, 25, 0, 2);
INSERT INTO `app_vip` VALUES ('com.js.chatgpt.season', '包季会员', 6800, 15, 64, 0, 3);
INSERT INTO `app_vip` VALUES ('com.js.chatgpt.month', '包月会员', 4800, 10, 120, 0, 4);
INSERT INTO `app_vip` VALUES ('com.js.chatgpt.week', '周会员', 2800, 3, 280, 0, 5);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '用户协议', 'app.userAgreement', 'http://www.chataizs.cn/file/user.html', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-16 03:20:09', '（勿删）');
INSERT INTO `sys_config` VALUES (2, '隐私协议', 'app.privacyAgreement', 'http://www.chataizs.cn/file/privacy.html', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-16 03:20:11', '（勿删）');
INSERT INTO `sys_config` VALUES (3, '客服qq号', 'app.qq', '123456789', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-16 03:20:15', '（勿删）');
INSERT INTO `sys_config` VALUES (4, '推荐给朋友获得机会次数', 'app.forward', '3', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-16 03:20:17', '（勿删）');
INSERT INTO `sys_config` VALUES (5, '充值协议', 'app.rechargeAgreement', 'http://www.chataizs.cn/file/recharge.html', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-16 03:20:20', '（勿删）');
INSERT INTO `sys_config` VALUES (100, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-07-06 13:05:02', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (200, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-07-06 13:05:02', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (300, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-07-06 13:05:02', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (400, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-07-06 13:05:02', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (500, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-07-06 13:05:02', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (600, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-07-06 13:05:02', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'AI助手', 0, '若依', '15888888888', 'ai@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', 'admin', '2023-07-22 08:56:03');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '亲爱的主人，上午好，我是ChatAI万能小助手，我可以给出精彩答案，为您节省上网海量搜索的时间，是您工作生活学习的好帮手，请向我提问吧！', '空', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:35:11', 'admin', '2023-07-16 03:36:02', '数据标签就是推荐问题说明、键值就是推荐问题，多个推荐问题用*隔开');
INSERT INTO `sys_dict_data` VALUES (101, 0, '我是一个情感专家，您的忠实聆听者，可以给您解答情感困惑，您可以问我：', '我们进入角色扮演，你现在是我的女朋友，我要你向我表白', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:35:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, ' 我是一个翻译小天才，通晓所有的语言，您可以问我：', '【书山有路勤为径，学海无涯苦作舟】用英文怎么说？', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:36:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '我是职场打工人，拥有一切职场升职小技能，您可以让我：', '写一下周报*以“冒险”为主题写一篇100字广告文案*给我一个直播卖货的话术', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:37:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, ' 我是万能小老师，语数外物理化全不怕，您可以问我：', '计算加速度的公式是什么？*以“春天”为主题写一篇500字的作文', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:38:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '我是编程高手，写的代码不会有bug，您可以问我：', '写一段transform模型的代码', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:38:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, ' 我是一部生活百科，吃穿住行样样精通，您可以问我：', '佛跳墙怎么做？', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:39:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, ' 我知道所有的科学知识，解答各个领域的科研难题，您可以问我：', '给我一篇关于核聚变的论文', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:39:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '我是教育专家，帮助您解决教育孩子的烦恼，您可以问我：', '孩子进入叛逆期该怎么办？', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:39:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '我的知识还涉猎医学、金融、法律、科技、电商等各个领域，我是您最值得信赖的万能AI小助手~', '空', 'sys_recommend', NULL, 'default', 'N', '0', 'admin', '2023-07-16 03:40:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, 'photo1', 'http://www.chataizs.cn/file/photo1.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:53:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, 'photo2', 'http://www.chataizs.cn/file/photo2.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:53:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, 'photo3', 'http://www.chataizs.cn/file/photo3.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:54:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, 'photo4', 'http://www.chataizs.cn/file/photo4.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:54:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, 'photo5', 'http://www.chataizs.cn/file/photo5.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:54:24', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '推荐问题', 'sys_recommend', '0', 'admin', '2023-07-16 03:19:11', 'admin', '2023-07-16 03:19:48', '推荐的问题（勿删）');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '用户性别', 'sys_user_sex', '0', 'admin', '2023-07-06 13:05:02', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (101, '头像的地址', 'photo', '0', 'admin', '2023-07-21 06:52:19', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '0 0 0 * * ?', '3', '1', '0', 'admin', '2023-07-06 13:05:02', 'admin', '2023-07-16 06:20:35', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：63毫秒', '0', '', '2023-07-16 06:10:29');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：69毫秒', '0', '', '2023-07-16 06:13:43');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：167毫秒', '0', '', '2023-07-16 06:15:09');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：108毫秒', '0', '', '2023-07-16 06:16:04');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：114毫秒', '0', '', '2023-07-16 06:16:13');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：99毫秒', '0', '', '2023-07-16 06:17:03');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：97毫秒', '0', '', '2023-07-16 06:17:13');
INSERT INTO `sys_job_log` VALUES (8, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：33913毫秒', '0', '', '2023-07-16 06:18:02');
INSERT INTO `sys_job_log` VALUES (9, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：113毫秒', '0', '', '2023-07-16 06:19:40');
INSERT INTO `sys_job_log` VALUES (10, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：122毫秒', '0', '', '2023-07-16 06:20:11');
INSERT INTO `sys_job_log` VALUES (11, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：92毫秒', '0', '', '2023-07-16 06:20:34');
INSERT INTO `sys_job_log` VALUES (12, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：121毫秒', '0', '', '2023-07-16 16:00:00');
INSERT INTO `sys_job_log` VALUES (13, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：132毫秒', '0', '', '2023-07-17 16:00:00');
INSERT INTO `sys_job_log` VALUES (14, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：199毫秒', '0', '', '2023-07-18 16:00:00');
INSERT INTO `sys_job_log` VALUES (15, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：192毫秒', '0', '', '2023-07-19 16:00:00');
INSERT INTO `sys_job_log` VALUES (16, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：122毫秒', '0', '', '2023-07-20 16:00:00');
INSERT INTO `sys_job_log` VALUES (17, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：415毫秒', '0', '', '2023-07-21 15:59:59');
INSERT INTO `sys_job_log` VALUES (18, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：250毫秒', '0', '', '2023-07-21 16:00:00');
INSERT INTO `sys_job_log` VALUES (19, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：381毫秒', '0', '', '2023-07-21 16:00:00');
INSERT INTO `sys_job_log` VALUES (20, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：91毫秒', '0', '', '2023-07-22 16:00:00');
INSERT INTO `sys_job_log` VALUES (21, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：424毫秒', '0', '', '2023-07-22 16:00:00');
INSERT INTO `sys_job_log` VALUES (22, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：76毫秒', '0', '', '2023-07-23 16:00:00');
INSERT INTO `sys_job_log` VALUES (23, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：418毫秒', '0', '', '2023-07-23 16:00:00');
INSERT INTO `sys_job_log` VALUES (24, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：71毫秒', '0', '', '2023-07-24 16:00:00');
INSERT INTO `sys_job_log` VALUES (25, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：393毫秒', '0', '', '2023-07-24 16:00:00');
INSERT INTO `sys_job_log` VALUES (26, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：83毫秒', '0', '', '2023-07-25 16:00:00');
INSERT INTO `sys_job_log` VALUES (27, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：89毫秒', '0', '', '2023-07-26 16:00:00');
INSERT INTO `sys_job_log` VALUES (28, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：90毫秒', '0', '', '2023-07-27 16:00:00');
INSERT INTO `sys_job_log` VALUES (29, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：70毫秒', '0', '', '2023-07-28 16:00:00');
INSERT INTO `sys_job_log` VALUES (30, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：418毫秒', '0', '', '2023-07-28 16:00:00');
INSERT INTO `sys_job_log` VALUES (31, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：257毫秒', '0', '', '2023-07-29 16:00:00');
INSERT INTO `sys_job_log` VALUES (32, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：409毫秒', '0', '', '2023-07-29 16:00:01');
INSERT INTO `sys_job_log` VALUES (33, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：92毫秒', '0', '', '2023-07-30 16:00:00');
INSERT INTO `sys_job_log` VALUES (34, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：427毫秒', '0', '', '2023-07-30 16:00:01');
INSERT INTO `sys_job_log` VALUES (35, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：92毫秒', '0', '', '2023-07-31 16:00:00');
INSERT INTO `sys_job_log` VALUES (36, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：147毫秒', '0', '', '2023-08-01 16:00:00');
INSERT INTO `sys_job_log` VALUES (37, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：168毫秒', '0', '', '2023-08-02 16:00:00');
INSERT INTO `sys_job_log` VALUES (38, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：137毫秒', '0', '', '2023-08-03 16:00:00');
INSERT INTO `sys_job_log` VALUES (39, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：120毫秒', '0', '', '2023-08-04 16:00:00');
INSERT INTO `sys_job_log` VALUES (40, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：112毫秒', '0', '', '2023-08-05 16:00:00');
INSERT INTO `sys_job_log` VALUES (41, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：125毫秒', '0', '', '2023-08-06 16:00:00');
INSERT INTO `sys_job_log` VALUES (42, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：87毫秒', '0', '', '2023-08-07 16:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-10 07:08:20');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-16 03:13:59');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-16 05:36:15');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-16 06:10:17');
INSERT INTO `sys_logininfor` VALUES (104, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:19:08');
INSERT INTO `sys_logininfor` VALUES (105, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:19:13');
INSERT INTO `sys_logininfor` VALUES (106, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:19:21');
INSERT INTO `sys_logininfor` VALUES (107, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:19:38');
INSERT INTO `sys_logininfor` VALUES (108, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:21:02');
INSERT INTO `sys_logininfor` VALUES (109, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:21:14');
INSERT INTO `sys_logininfor` VALUES (110, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:23:58');
INSERT INTO `sys_logininfor` VALUES (111, 'fuint', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 01:24:07');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-07-21 01:26:35');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-21 01:27:26');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-21 01:45:12');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-21 03:26:55');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-21 05:14:38');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-21 05:59:21');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-21 06:45:37');
INSERT INTO `sys_logininfor` VALUES (119, 'fuint', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 06:46:24');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-07-21 06:46:34');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-21 06:46:37');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-21 09:30:43');
INSERT INTO `sys_logininfor` VALUES (123, 'fuint', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 11:41:53');
INSERT INTO `sys_logininfor` VALUES (124, 'fuint', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：fuint 不存在', '2023-07-21 11:42:18');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-21 11:42:25');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-21 12:43:54');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-22 00:55:13');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-22 02:18:34');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 03:55:02');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '退出成功', '2023-07-22 05:44:28');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-22 05:44:34');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 08:48:19');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 10:22:18');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 10:22:22');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-23 02:20:08');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-24 01:42:18');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 04:15:10');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-30 10:24:26');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-01 06:15:40');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-01 06:51:32');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 8, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-07-06 13:05:01', 'admin', '2023-07-22 08:54:02', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-07-06 13:05:01', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-07-06 13:05:01', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-07-06 13:05:01', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-07-06 13:05:01', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-07-06 13:05:01', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-07-06 13:05:01', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-07-30 10:27:50', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 1, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-06-29 14:31:58', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-07-06 13:05:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-07-06 13:05:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-07-30 10:28:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-07-30 10:28:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-07-30 10:28:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-07-30 10:28:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-06-29 14:31:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-06-29 14:31:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-06-29 14:31:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-06-29 14:31:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-06-29 14:31:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-06-29 14:31:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '用户中心', 0, 5, 'management:userCenter', NULL, NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2023-07-21 02:29:06', 'admin', '2023-07-21 02:32:23', '');
INSERT INTO `sys_menu` VALUES (2001, '文章管理', 0, 6, 'management:articleManagement', NULL, NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2023-07-21 02:31:47', 'admin', '2023-07-22 09:01:21', '');
INSERT INTO `sys_menu` VALUES (2002, '系统设置', 0, 7, 'management:systemSetting', NULL, NULL, 1, 0, 'M', '0', '0', '', 'example', 'admin', '2023-07-21 02:33:47', 'admin', '2023-07-22 09:17:32', '');
INSERT INTO `sys_menu` VALUES (2003, '用户列表', 2000, 1, 'userList', 'management/userCenter/userList/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-07-21 02:39:36', 'admin', '2023-07-22 09:18:13', '');
INSERT INTO `sys_menu` VALUES (2004, '聊天列表', 2000, 2, 'chatList', 'management/userCenter/chatList/index', NULL, 1, 0, 'C', '0', '0', '', 'message', 'admin', '2023-07-21 02:40:50', 'admin', '2023-07-22 09:18:35', '');
INSERT INTO `sys_menu` VALUES (2005, '用户反馈', 2000, 4, 'userFeedback', 'management/userCenter/userFeedback/index', NULL, 1, 0, 'C', '0', '0', '', 'email', 'admin', '2023-07-21 02:41:55', 'admin', '2023-08-01 06:18:32', '');
INSERT INTO `sys_menu` VALUES (2006, '文章列表', 2001, 1, 'articleList', 'management/articleManagement/articleList/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-07-21 02:44:30', 'admin', '2023-07-22 09:16:06', '');
INSERT INTO `sys_menu` VALUES (2007, 'key列表', 2002, 1, 'KeyList', 'management/systemSetting/KeyList/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-07-21 02:46:22', 'admin', '2023-07-22 09:17:50', '');
INSERT INTO `sys_menu` VALUES (2009, '用户评论', 2000, 3, 'userComment', 'management/userCenter/userComment/index', NULL, 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-08-01 06:21:32', 'admin', '2023-08-01 06:26:43', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '1', 'admin', '2023-07-06 13:05:02', 'admin', '2023-07-30 10:40:03', '管理员');
INSERT INTO `sys_notice` VALUES (10, '测测测', NULL, 'asdasdasdasdasdasd', '1', 'admin', '2023-07-30 10:34:31', 'admin', '2023-07-30 10:40:08', NULL);
INSERT INTO `sys_notice` VALUES (12, '西怎', NULL, '奥术大师多', '0', 'admin', '2023-07-30 10:40:23', 'admin', '2023-07-30 10:40:33', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 1, 'com.chat.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"app.userAgreement\",\"configName\":\"用户协议\",\"configType\":\"Y\",\"configValue\":\"用户协议\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-10 07:11:47', 62);
INSERT INTO `sys_oper_log` VALUES (101, '参数管理', 1, 'com.chat.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"app.privacyAgreement\",\"configName\":\"隐私协议\",\"configType\":\"Y\",\"configValue\":\"隐私协议\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-10 07:12:21', 42);
INSERT INTO `sys_oper_log` VALUES (102, '参数管理', 1, 'com.chat.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"app.qq\",\"configName\":\"客服qq号\",\"configType\":\"Y\",\"configValue\":\"123456789\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-10 07:12:47', 42);
INSERT INTO `sys_oper_log` VALUES (103, '参数管理', 1, 'com.chat.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"app.forward\",\"configName\":\"推荐给朋友获得机会次数\",\"configType\":\"Y\",\"configValue\":\"3\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-10 07:13:57', 51);
INSERT INTO `sys_oper_log` VALUES (104, '参数管理', 1, 'com.chat.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"app.rechargeAgreement\",\"configName\":\"充值协议\",\"configType\":\"Y\",\"configValue\":\"充值协议\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-10 07:14:46', 48);
INSERT INTO `sys_oper_log` VALUES (105, '字典类型', 1, 'com.chat.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"推荐问题\",\"dictType\":\"sys_recommend\",\"params\":{},\"remark\":\"推荐的问题（请勿删除）\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:19:11', 48);
INSERT INTO `sys_oper_log` VALUES (106, '字典类型', 2, 'com.chat.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-16 03:19:11\",\"dictId\":1,\"dictName\":\"推荐问题\",\"dictType\":\"sys_recommend\",\"params\":{},\"remark\":\"推荐的问题（勿删）\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:19:48', 117);
INSERT INTO `sys_oper_log` VALUES (107, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":1,\"configKey\":\"app.userAgreement\",\"configName\":\"用户协议\",\"configType\":\"Y\",\"configValue\":\"用户协议\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:20:09', 41);
INSERT INTO `sys_oper_log` VALUES (108, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":2,\"configKey\":\"app.privacyAgreement\",\"configName\":\"隐私协议\",\"configType\":\"Y\",\"configValue\":\"隐私协议\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:20:11', 43);
INSERT INTO `sys_oper_log` VALUES (109, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":3,\"configKey\":\"app.qq\",\"configName\":\"客服qq号\",\"configType\":\"Y\",\"configValue\":\"123456789\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:20:15', 39);
INSERT INTO `sys_oper_log` VALUES (110, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"app.forward\",\"configName\":\"推荐给朋友获得机会次数\",\"configType\":\"Y\",\"configValue\":\"3\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:20:17', 52);
INSERT INTO `sys_oper_log` VALUES (111, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"app.rechargeAgreement\",\"configName\":\"充值协议\",\"configType\":\"Y\",\"configValue\":\"充值协议\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:20:20', 43);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"亲爱的主人，上午好，我是ChatAI万能小助手，我可以给出精彩答案，为您节省上网海量搜索的时间，是您工作生活学习的好帮手，请向我提问吧！\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"空\",\"listClass\":\"default\",\"params\":{},\"remark\":\"数据标签就是推荐问题说明、键值就是推荐问题，多个推荐问题用逗号隔开\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:35:12', 52);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"我是一个情感专家，您的忠实聆听者，可以给您解答情感困惑，您可以问我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"我们进入角色扮演，你现在是我的女朋友，我要你向我表白\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:35:46', 73);
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 2, 'com.chat.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-16 03:35:11\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"亲爱的主人，上午好，我是ChatAI万能小助手，我可以给出精彩答案，为您节省上网海量搜索的时间，是您工作生活学习的好帮手，请向我提问吧！\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"空\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"数据标签就是推荐问题说明、键值就是推荐问题，多个推荐问题用*隔开\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:36:02', 75);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\" 我是一个翻译小天才，通晓所有的语言，您可以问我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"【书山有路勤为径，学海无涯苦作舟】用英文怎么说？\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:36:27', 38);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"我是职场打工人，拥有一切职场升职小技能，您可以让我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"写一下周报*以“冒险”为主题写一篇100字广告文案*给我一个直播卖货的话术\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:37:35', 53);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\" 我是万能小老师，语数外物理化全不怕，您可以问我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"计算加速度的公式是什么？*以“春天”为主题写一篇500字的作文\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:38:03', 42);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"我是编程高手，写的代码不会有bug，您可以问我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"写一段transform模型的代码\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:38:24', 36);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\" 我是一部生活百科，吃穿住行样样精通，您可以问我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"佛跳墙怎么做？\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:39:12', 86);
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\" 我知道所有的科学知识，解答各个领域的科研难题，您可以问我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"给我一篇关于核聚变的论文\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:39:30', 35);
INSERT INTO `sys_oper_log` VALUES (121, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"我是教育专家，帮助您解决教育孩子的烦恼，您可以问我：\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"孩子进入叛逆期该怎么办？\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:39:49', 31);
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"我的知识还涉猎医学、金融、法律、科技、电商等各个领域，我是您最值得信赖的万能AI小助手~\",\"dictSort\":0,\"dictType\":\"sys_recommend\",\"dictValue\":\"空\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 03:40:02', 38);
INSERT INTO `sys_oper_log` VALUES (123, '定时任务', 3, 'com.chat.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', NULL, '/monitor/job/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 05:38:48', 54);
INSERT INTO `sys_oper_log` VALUES (124, '定时任务', 3, 'com.chat.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', NULL, '/monitor/job/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 05:38:50', 45);
INSERT INTO `sys_oper_log` VALUES (125, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-07-06 13:05:02\",\"cronExpression\":\"0 0 0 1 * ?\",\"invokeTarget\":\"ryTask.everydat\",\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"jobName\":\"系统默认（无参）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-08-01 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 05:39:51', 46);
INSERT INTO `sys_oper_log` VALUES (126, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-07-06 13:05:02\",\"cronExpression\":\"0 0 0 * * ?\",\"invokeTarget\":\"ryTask.everydat\",\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"jobName\":\"系统默认（无参）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-07-17 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 05:40:41', 42);
INSERT INTO `sys_oper_log` VALUES (127, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-07-06 13:05:02\",\"cronExpression\":\"0 0 0 * * ?\",\"invokeTarget\":\"ryTask.everydat\",\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"jobName\":\"系统默认（无参）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-07-17 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 05:40:50', 43);
INSERT INTO `sys_oper_log` VALUES (128, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-07-06 13:05:02\",\"cronExpression\":\"0 0 0 * * ?\",\"invokeTarget\":\"ryTask.everydat\",\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"jobName\":\"系统默认（无参）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-07-17 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 05:41:00', 44);
INSERT INTO `sys_oper_log` VALUES (129, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:10:29', 42);
INSERT INTO `sys_oper_log` VALUES (130, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:13:43', 44);
INSERT INTO `sys_oper_log` VALUES (131, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:15:09', 54);
INSERT INTO `sys_oper_log` VALUES (132, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:16:04', 31);
INSERT INTO `sys_oper_log` VALUES (133, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:16:13', 27);
INSERT INTO `sys_oper_log` VALUES (134, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:17:03', 32);
INSERT INTO `sys_oper_log` VALUES (135, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:17:13', 44);
INSERT INTO `sys_oper_log` VALUES (136, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:18:01', 30);
INSERT INTO `sys_oper_log` VALUES (137, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:19:40', 53);
INSERT INTO `sys_oper_log` VALUES (138, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:20:10', 33);
INSERT INTO `sys_oper_log` VALUES (139, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:20:34', 28);
INSERT INTO `sys_oper_log` VALUES (140, '定时任务', 2, 'com.chat.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-16 06:20:35', 60);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户中心\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"management:userCenter\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:29:06', 33);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文章管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"management:articleManagement\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:31:47', 14);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-21 02:29:06\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户中心\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"management:userCenter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:32:13', 22);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-21 02:29:06\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户中心\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"management:userCenter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:32:23', 13);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-21 02:31:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"文章管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"management:articleManagement\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:32:29', 22);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"management:systemSetting\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:33:47', 21);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userList/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"userList\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:39:36', 18);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/chatList/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"聊天列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"userList\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:40:50', 30);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userFeedback/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户反馈\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"userFeedback\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:41:55', 26);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/chatList/index\",\"createTime\":\"2023-07-21 02:40:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"聊天列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"chatList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:42:35', 22);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/articleManagement/articleList/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文章列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"articleList\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:44:30', 23);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/systemSetting/KeyList/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"key列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"KeyList\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 02:46:22', 16);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/articleManagement/addArticle/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增文章\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"addArticle\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:06:07', 29);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2008', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:46:08', 14);
INSERT INTO `sys_oper_log` VALUES (155, '字典类型', 1, 'com.chat.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"头像的地址\",\"dictType\":\"photo\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:52:20', 60);
INSERT INTO `sys_oper_log` VALUES (156, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"photo1\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"http://www.chataizs.cn/file/photo1.png\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:53:33', 57);
INSERT INTO `sys_oper_log` VALUES (157, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"photo2\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"http://www.chataizs.cn/file/photo2.png\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:53:51', 46);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"photo3\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"http://www.chataizs.cn/file/photo3.png\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:54:02', 47);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"photo4\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"http://www.chataizs.cn/file/photo4.png\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:54:14', 66);
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 1, 'com.chat.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"photo5\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"http://www.chataizs.cn/file/photo5.png\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-21 06:54:24', 57);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-07-22 08:52:03', 16);
INSERT INTO `sys_oper_log` VALUES (162, '角色管理', 2, 'com.chat.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-07-06 13:05:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:14', 82);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:19', 18);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-07-22 08:52:24', 7);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-07-22 08:52:29', 4);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1046', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:32', 16);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1047', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:34', 17);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1048', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:37', 14);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:39', 14);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:42', 19);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/112', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:44', 16);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/113', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:46', 23);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/114', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:48', 17);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:52', 14);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1050', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:54', 16);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1051', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:56', 16);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1052', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:52:59', 18);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1053', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:01', 11);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1054', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:03', 18);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:06', 16);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:24', 20);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/115', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:28', 14);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/116', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-07-22 08:53:30', 10);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1055', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:37', 20);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1056', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:39', 10);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1057', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:41', 17);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1058', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:43', 17);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1059', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:44', 10);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1060', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:46', 18);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/116', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:48', 14);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/117', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:51', 22);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:53:53', 19);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-06 13:05:01\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:02', 41);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1039', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:35', 14);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1040', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:39', 29);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1041', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:43', 13);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1045', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:45', 12);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1044', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:48', 14);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1043', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:50', 12);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1042', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:52', 21);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/501', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:54', 12);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/500', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:57', 12);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:54:59', 13);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1038', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:03', 25);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1037', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:05', 13);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1036', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:07', 14);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1035', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:09', 15);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:12', 18);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1024', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:21', 12);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1022', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:23', 20);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1020', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:26', 14);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1021', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:28', 10);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1023', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:31', 17);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 3, 'com.chat.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:55:34', 15);
INSERT INTO `sys_oper_log` VALUES (215, '部门管理', 2, 'com.chat.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"AI助手\",\"email\":\"ai@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:56:03', 32);
INSERT INTO `sys_oper_log` VALUES (216, '个人信息', 2, 'com.chat.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-07-06 13:05:01\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"AI@163.com\",\"loginDate\":\"2023-07-22 13:44:35\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"AI助手\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 08:56:19', 23);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-21 02:31:47\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"文章管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"management:articleManagement\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 09:01:21', 13);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/articleManagement/articleList/index\",\"createTime\":\"2023-07-21 02:44:30\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"文章列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"articleList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 09:16:06', 18);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-07-21 02:33:47\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"management:systemSetting\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 09:17:32', 13);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/systemSetting/KeyList/index\",\"createTime\":\"2023-07-21 02:46:22\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"key列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"KeyList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 09:17:50', 14);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userList/index\",\"createTime\":\"2023-07-21 02:39:36\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"用户列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"userList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 09:18:13', 12);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/chatList/index\",\"createTime\":\"2023-07-21 02:40:50\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"聊天列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"chatList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 09:18:35', 15);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userFeedback/index\",\"createTime\":\"2023-07-21 02:41:55\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"用户反馈\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"userFeedback\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-22 09:20:17', 16);
INSERT INTO `sys_oper_log` VALUES (224, '通知公告', 3, 'com.chat.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:29:07', 26);
INSERT INTO `sys_oper_log` VALUES (225, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-06 13:05:02\",\"noticeContent\":\"<p>新版本内容</p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 若依新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:29:14', 21);
INSERT INTO `sys_oper_log` VALUES (226, '通知公告', 1, 'com.chat.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>asdasd</p>\",\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value\r\n### The error may exist in file [E:\\java-project\\chat-ai\\chat-system\\target\\classes\\mapper\\system\\SysNoticeMapper.xml]\r\n### The error may involve com.chat.system.mapper.SysNoticeMapper.insertNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_notice (     notice_title,            notice_content,       status,             create_by,      create_time    )values(     ?,            ?,       ?,             ?,      sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value\n; Field \'notice_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value', '2023-07-30 10:34:06', 56);
INSERT INTO `sys_oper_log` VALUES (227, '通知公告', 1, 'com.chat.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>asdasd</p>\",\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value\r\n### The error may exist in file [E:\\java-project\\chat-ai\\chat-system\\target\\classes\\mapper\\system\\SysNoticeMapper.xml]\r\n### The error may involve com.chat.system.mapper.SysNoticeMapper.insertNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_notice (     notice_title,            notice_content,       status,             create_by,      create_time    )values(     ?,            ?,       ?,             ?,      sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value\n; Field \'notice_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value', '2023-07-30 10:34:11', 17);
INSERT INTO `sys_oper_log` VALUES (228, '通知公告', 1, 'com.chat.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>asdasd</p>\",\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:34:31', 24);
INSERT INTO `sys_oper_log` VALUES (229, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:34:31\",\"noticeContent\":\"<p>asdasd</p>\",\"noticeId\":10,\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:34:37', 16);
INSERT INTO `sys_oper_log` VALUES (230, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:34:31\",\"noticeContent\":\"<p>asdasd</p>\",\"noticeId\":10,\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-30 10:34:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:34:42', 16);
INSERT INTO `sys_oper_log` VALUES (231, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:34:31\",\"noticeContent\":\"<p>asdasdasdasdasdasd</p>\",\"noticeId\":10,\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-30 10:34:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:34:47', 20);
INSERT INTO `sys_oper_log` VALUES (232, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:34:31\",\"noticeContent\":\"<p>asdasdasdasdasdasd</p>\",\"noticeId\":10,\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-30 10:34:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:34:51', 16);
INSERT INTO `sys_oper_log` VALUES (233, '通知公告', 1, 'com.chat.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>asdasdasd</p>\",\"noticeTitle\":\"asdasdasd\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:34:59', 16);
INSERT INTO `sys_oper_log` VALUES (234, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:34:59\",\"noticeContent\":\"<p>asdasdasd</p>\",\"noticeId\":11,\"noticeTitle\":\"asdasdasd\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:35:03', 19);
INSERT INTO `sys_oper_log` VALUES (235, '通知公告', 3, 'com.chat.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:35:16', 25);
INSERT INTO `sys_oper_log` VALUES (236, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-06 13:05:02\",\"noticeContent\":\"新版本内容\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 若依新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-30 10:29:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:40:03', 15);
INSERT INTO `sys_oper_log` VALUES (237, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:34:31\",\"noticeContent\":\"asdasdasdasdasdasd\",\"noticeId\":10,\"noticeTitle\":\"测测测\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-30 10:34:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:40:08', 29);
INSERT INTO `sys_oper_log` VALUES (238, '通知公告', 1, 'com.chat.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"奥术大师多\",\"noticeTitle\":\"西怎\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:40:23', 31);
INSERT INTO `sys_oper_log` VALUES (239, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:40:23\",\"noticeContent\":\"奥术大师多\",\"noticeId\":12,\"noticeTitle\":\"西怎\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:40:29', 40);
INSERT INTO `sys_oper_log` VALUES (240, '通知公告', 2, 'com.chat.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-30 10:40:23\",\"noticeContent\":\"奥术大师多\",\"noticeId\":12,\"noticeTitle\":\"西怎\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-30 10:40:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-30 10:40:34', 57);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userFeedback/index\",\"createTime\":\"2023-07-21 02:41:55\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"用户反馈\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"userFeedback\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-01 06:18:32', 34);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 1, 'com.chat.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userComment\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户评论\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"userComment\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-01 06:21:32', 31);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userComment/index\",\"createTime\":\"2023-08-01 06:21:32\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"用户评论\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"userComment\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-01 06:22:49', 12);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.chat.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"management/userCenter/userComment/index\",\"createTime\":\"2023-08-01 06:21:32\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"用户评论\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"userComment\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-01 06:26:43', 18);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-07-06 13:05:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-07-06 13:05:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-07-06 13:05:01', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-07-06 13:05:01', 'admin', '2023-07-22 08:52:14', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'AI助手', '00', 'AI@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-08-01 14:51:33', 'admin', '2023-07-06 13:05:01', '', '2023-08-01 06:51:32', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-07-06 13:05:01', 'admin', '2023-07-06 13:05:01', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

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
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
