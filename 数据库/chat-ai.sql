/*
 Navicat Premium Data Transfer

 Source Server         : 美国的
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : ip:3306
 Source Schema         : chat-ai

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 26/07/2023 21:35:52
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_article
-- ----------------------------
INSERT INTO `app_article` VALUES (2, 'test', '<p><strong><em><img src=\"/prod-api/profile/upload/2023/07/22/shuiguo1_20230722194401A001.jpg\">1111</em></strong></p>', '2023-07-22 13:38:42', 0);
INSERT INTO `app_article` VALUES (4, 'ceshi111', '今天天气真好呀！', '2023-07-22 14:06:28', 0);
INSERT INTO `app_article` VALUES (5, '夕阳无限好', '<strong><em>夕阳无限好</em></strong>', '2023-07-22 14:09:49', 0);
INSERT INTO `app_article` VALUES (7, '初四', '<p><img src=\"/prod-api/profile/upload/2023/07/22/96145773074beeb63492237f9c469e3b_20230722194030A001.jpg\"></p>', '2023-07-22 18:26:35', 0);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_collect
-- ----------------------------
INSERT INTO `app_collect` VALUES (12, '123', '123', NULL, 1, 40, '2023-07-23 17:00:15');
INSERT INTO `app_collect` VALUES (13, '123', '123', NULL, 1, 40, '2023-07-23 17:00:31');
INSERT INTO `app_collect` VALUES (14, '123', '123', NULL, 1, 40, '2023-07-23 17:00:32');
INSERT INTO `app_collect` VALUES (15, '123', '123', NULL, 1, 40, '2023-07-23 17:00:32');
INSERT INTO `app_collect` VALUES (16, '123', '123', NULL, 1, 40, '2023-07-25 09:27:24');
INSERT INTO `app_collect` VALUES (17, '123', '123', NULL, 1, 40, '2023-07-25 09:27:25');
INSERT INTO `app_collect` VALUES (18, '123', '123', NULL, 1, 40, '2023-07-25 09:27:25');
INSERT INTO `app_collect` VALUES (19, '123', '123', NULL, 1, 40, '2023-07-25 09:27:31');
INSERT INTO `app_collect` VALUES (20, '123', '123', NULL, 1, 40, '2023-07-25 09:27:32');
INSERT INTO `app_collect` VALUES (21, '123', '123', NULL, 1, 40, '2023-07-25 09:27:32');
INSERT INTO `app_collect` VALUES (22, '123', '123', NULL, 1, 40, '2023-07-25 09:27:36');
INSERT INTO `app_collect` VALUES (23, '123', '123', NULL, 1, 40, '2023-07-25 09:27:36');
INSERT INTO `app_collect` VALUES (24, '123', '123', NULL, 1, 40, '2023-07-25 09:27:37');
INSERT INTO `app_collect` VALUES (25, '123', '123', NULL, 1, 40, '2023-07-25 09:31:32');
INSERT INTO `app_collect` VALUES (26, '123', '123', NULL, 1, 40, '2023-07-25 09:31:33');
INSERT INTO `app_collect` VALUES (27, '123', '123', NULL, 1, 40, '2023-07-25 09:31:33');
INSERT INTO `app_collect` VALUES (28, '123', '123', NULL, 1, 40, '2023-07-25 09:31:37');
INSERT INTO `app_collect` VALUES (29, '123', '123', NULL, 1, 40, '2023-07-25 09:31:37');
INSERT INTO `app_collect` VALUES (30, '123', '123', NULL, 1, 40, '2023-07-25 09:31:38');
INSERT INTO `app_collect` VALUES (31, '123', '123', NULL, 1, 40, '2023-07-25 09:31:40');
INSERT INTO `app_collect` VALUES (32, '123', '123', NULL, 1, 40, '2023-07-25 09:31:40');
INSERT INTO `app_collect` VALUES (33, '123', '123', NULL, 1, 40, '2023-07-25 09:31:41');
INSERT INTO `app_collect` VALUES (34, '123', '123', NULL, 1, 40, '2023-07-25 09:31:43');
INSERT INTO `app_collect` VALUES (35, '123', '123', NULL, 1, 40, '2023-07-25 09:31:43');
INSERT INTO `app_collect` VALUES (36, '123', '123', NULL, 1, 40, '2023-07-25 09:31:44');
INSERT INTO `app_collect` VALUES (37, '123', '123', NULL, 1, 40, '2023-07-25 09:31:46');
INSERT INTO `app_collect` VALUES (38, '123', '123', NULL, 1, 40, '2023-07-25 09:31:46');
INSERT INTO `app_collect` VALUES (39, '123', '123', NULL, 1, 40, '2023-07-25 09:31:47');
INSERT INTO `app_collect` VALUES (40, '123', '123', NULL, 1, 40, '2023-07-25 09:31:48');
INSERT INTO `app_collect` VALUES (41, '123', '123', NULL, 1, 40, '2023-07-25 09:31:49');
INSERT INTO `app_collect` VALUES (42, '123', '123', NULL, 1, 40, '2023-07-25 09:31:49');
INSERT INTO `app_collect` VALUES (43, '123', '123', NULL, 1, 40, '2023-07-25 09:31:51');
INSERT INTO `app_collect` VALUES (44, '123', '123', NULL, 1, 40, '2023-07-25 09:31:51');
INSERT INTO `app_collect` VALUES (45, '123', '123', NULL, 1, 40, '2023-07-25 09:31:52');
INSERT INTO `app_collect` VALUES (46, '123', '123', NULL, 1, 40, '2023-07-25 09:31:53');
INSERT INTO `app_collect` VALUES (47, '123', '123', NULL, 1, 40, '2023-07-25 09:31:54');
INSERT INTO `app_collect` VALUES (48, '123', '123', NULL, 1, 40, '2023-07-25 09:31:54');
INSERT INTO `app_collect` VALUES (49, '123', '123', NULL, 1, 40, '2023-07-25 09:32:00');
INSERT INTO `app_collect` VALUES (50, '123', '123', NULL, 1, 40, '2023-07-25 09:32:00');
INSERT INTO `app_collect` VALUES (51, '123', '123', NULL, 1, 40, '2023-07-25 09:32:01');
INSERT INTO `app_collect` VALUES (52, '123', '123', NULL, 1, 40, '2023-07-25 09:33:07');
INSERT INTO `app_collect` VALUES (53, '123', '123', NULL, 1, 40, '2023-07-25 09:33:07');
INSERT INTO `app_collect` VALUES (54, '123', '123', NULL, 1, 40, '2023-07-25 09:33:08');
INSERT INTO `app_collect` VALUES (55, '123', '123', NULL, 1, 40, '2023-07-25 09:33:10');
INSERT INTO `app_collect` VALUES (56, '123', '123', NULL, 1, 40, '2023-07-25 09:33:10');
INSERT INTO `app_collect` VALUES (57, '123', '123', NULL, 1, 40, '2023-07-25 09:33:11');
INSERT INTO `app_collect` VALUES (58, '123', '123', NULL, 1, 40, '2023-07-25 09:33:12');
INSERT INTO `app_collect` VALUES (59, '123', '123', NULL, 1, 40, '2023-07-25 09:33:13');
INSERT INTO `app_collect` VALUES (60, '123', '123', NULL, 1, 40, '2023-07-25 09:33:13');
INSERT INTO `app_collect` VALUES (61, '123', '123', NULL, 1, 40, '2023-07-25 09:33:15');
INSERT INTO `app_collect` VALUES (62, '123', '123', NULL, 1, 40, '2023-07-25 09:33:15');
INSERT INTO `app_collect` VALUES (63, '123', '123', NULL, 1, 40, '2023-07-25 09:33:16');
INSERT INTO `app_collect` VALUES (64, '123', '123', NULL, 1, 40, '2023-07-25 10:06:01');
INSERT INTO `app_collect` VALUES (65, '123', '123', NULL, 1, 40, '2023-07-25 10:06:01');
INSERT INTO `app_collect` VALUES (66, '123', '123', NULL, 1, 40, '2023-07-25 10:06:01');
INSERT INTO `app_collect` VALUES (67, '123', '123', NULL, 1, 40, '2023-07-25 10:06:03');
INSERT INTO `app_collect` VALUES (68, '123', '123', NULL, 1, 40, '2023-07-25 10:06:03');
INSERT INTO `app_collect` VALUES (69, '123', '123', NULL, 1, 40, '2023-07-25 10:06:03');
INSERT INTO `app_collect` VALUES (70, '123', '123', NULL, 1, 40, '2023-07-25 10:06:04');
INSERT INTO `app_collect` VALUES (71, '123', '123', NULL, 1, 40, '2023-07-25 10:06:04');
INSERT INTO `app_collect` VALUES (72, '123', '123', NULL, 1, 40, '2023-07-25 10:06:04');
INSERT INTO `app_collect` VALUES (73, '123', '123', NULL, 1, 40, '2023-07-25 10:06:06');
INSERT INTO `app_collect` VALUES (74, '123', '123', NULL, 1, 40, '2023-07-25 10:06:06');
INSERT INTO `app_collect` VALUES (75, '123', '123', NULL, 1, 40, '2023-07-25 10:06:06');
INSERT INTO `app_collect` VALUES (76, '123', '123', NULL, 1, 40, '2023-07-25 10:06:07');
INSERT INTO `app_collect` VALUES (77, '123', '123', NULL, 1, 40, '2023-07-25 10:06:07');
INSERT INTO `app_collect` VALUES (78, '123', '123', NULL, 1, 40, '2023-07-25 10:06:07');
INSERT INTO `app_collect` VALUES (79, '123', '123', NULL, 1, 40, '2023-07-25 10:06:08');
INSERT INTO `app_collect` VALUES (80, '123', '123', NULL, 1, 40, '2023-07-25 10:06:08');
INSERT INTO `app_collect` VALUES (81, '123', '123', NULL, 1, 40, '2023-07-25 10:06:08');
INSERT INTO `app_collect` VALUES (82, '123', '123', NULL, 1, 40, '2023-07-25 10:06:10');
INSERT INTO `app_collect` VALUES (83, '123', '123', NULL, 1, 40, '2023-07-25 10:06:10');
INSERT INTO `app_collect` VALUES (84, '123', '123', NULL, 1, 40, '2023-07-25 10:06:10');
INSERT INTO `app_collect` VALUES (85, '123', '123', NULL, 1, 40, '2023-07-25 10:06:11');
INSERT INTO `app_collect` VALUES (86, '123', '123', NULL, 1, 40, '2023-07-25 10:06:11');
INSERT INTO `app_collect` VALUES (87, '123', '123', NULL, 1, 40, '2023-07-25 10:06:11');
INSERT INTO `app_collect` VALUES (88, '123', '123', NULL, 1, 40, '2023-07-25 10:06:12');
INSERT INTO `app_collect` VALUES (89, '123', '123', NULL, 1, 40, '2023-07-25 10:06:12');
INSERT INTO `app_collect` VALUES (90, '123', '123', NULL, 1, 40, '2023-07-25 10:06:12');
INSERT INTO `app_collect` VALUES (91, '你好', '你好！有什么我可以帮助你的吗？', NULL, 1, 41, '2023-07-25 10:49:30');
INSERT INTO `app_collect` VALUES (92, '今天天气怎么样', '很抱歉，作为一个AI助手，我无法获取实时天气信息。你可以通过天气预报网站、手机应用程序或询问当地的天气预报来获取今天的天气情况。', NULL, 1, 41, '2023-07-25 10:49:30');
INSERT INTO `app_collect` VALUES (93, '什么他妈的是他妈的惊喜', '这个表达是一种粗俗的脏话，用来表示对某种意外、突发事件或令人不悦的情况的不满或愤怒。它的含义可以根据语境和个人情绪的强烈程度有所变化，但通常带有负面的情感色彩。请注意，使用脏话并不礼貌，建议避免使用这样的表达。', NULL, 1, 42, '2023-07-25 14:30:59');
INSERT INTO `app_collect` VALUES (94, '帮我翻译一下 什么是他妈的惊喜', '\"他妈的惊喜\"是一种粗俗的表达方式，用来形容一种意料之外或令人不愉快的突发情况。这种表达通常带有强烈的情绪和不满情绪。', NULL, 1, 42, '2023-07-25 14:31:11');
INSERT INTO `app_collect` VALUES (95, '什么他妈的是他妈的惊喜', '这个表达是一种粗俗的脏话，用来表示对某种意外、突发事件或令人不悦的情况的不满或愤怒。它的含义可以根据语境和个人情绪的强烈程度有所变化，但通常带有负面的情感色彩。请注意，使用脏话并不礼貌，建议避免使用这样的表达。', NULL, 1, 42, '2023-07-25 14:31:11');
INSERT INTO `app_collect` VALUES (97, 'Hello', 'Hello! How can I assist you today?', NULL, 1, 46, '2023-07-26 13:53:53');

-- ----------------------------
-- Table structure for app_feedback
-- ----------------------------
DROP TABLE IF EXISTS `app_feedback`;
CREATE TABLE `app_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈的Id',
  `content` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈的内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户的id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_feedback
-- ----------------------------
INSERT INTO `app_feedback` VALUES (7, '很好啊', 44, '2023-07-25 21:14:26');

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_key
-- ----------------------------
INSERT INTO `app_key` VALUES (21, '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', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2030 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_message
-- ----------------------------
INSERT INTO `app_message` VALUES (1671, 40, 0, 2, '看了看', '2023-07-22 21:15:42', 0);
INSERT INTO `app_message` VALUES (1672, 40, 1, 2, '好的，我会注意控制字数在合适的范围内。请问您需要帮助写日报吗？如果有需要，请告诉我日报的主题和要包含的内容。', '2023-07-22 21:15:43', 0);
INSERT INTO `app_message` VALUES (1673, 40, 0, 3, '看了看', '2023-07-22 21:15:48', 0);
INSERT INTO `app_message` VALUES (1680, 40, 1, 3, 'I took a look.', '2023-07-22 23:36:03', 0);
INSERT INTO `app_message` VALUES (1681, 40, 0, 3, '吃饭', '2023-07-22 23:37:11', 0);
INSERT INTO `app_message` VALUES (1682, 40, 1, 3, 'Have a meal.', '2023-07-22 23:37:11', 0);
INSERT INTO `app_message` VALUES (1683, 40, 0, 1, '你好呀', '2023-07-22 23:38:11', 0);
INSERT INTO `app_message` VALUES (1907, 40, 0, 3, '看了看', '2023-07-23 17:06:51', 0);
INSERT INTO `app_message` VALUES (1908, 40, 1, 3, 'I took a look.', '2023-07-23 17:06:52', 0);
INSERT INTO `app_message` VALUES (1973, 44, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-25 15:04:58', 0);
INSERT INTO `app_message` VALUES (1974, 44, 1, 1, '孩子进入叛逆期是一个正常的成长阶段，但也会给家长带来一些挑战。以下是一些建议，帮助您面对孩子的叛逆期：\n1. 保持沟通：保持与孩子的积极沟通，倾听他们的想法和感受。尽量理解他们的立场，避免过度批评或指责。\n2. 设立明确的规矩和界限：确保家中有一些明确的规矩和界限，这有助于孩子建立自律和责任感。与孩子一起制定这些规矩，让他们参与其中。\n3. 给予适当的自主权：尽量给予孩子一定的自主权，让他们能够做出一些决策。这样可以帮助他们建立自信和独立性。\n4. 培养兴趣爱好：鼓励孩子参与各种活动，培养他们的兴趣爱好。这样可以让他们有一个积极的出口，避免过多地沉溺于叛逆情绪中。\n5. 寻求专业支持：如果您发现孩子的叛逆行为变得过于严重或无法控制，不妨寻求专业心理咨询或家庭辅导的帮助。\n重要的是，要记住在孩子的叛逆期，保持家庭中的爱与理解。尽管他们可能会表现出叛逆的行为，但他们仍然需要感受到家庭的支持和关爱。', '2023-07-25 15:05:07', 0);
INSERT INTO `app_message` VALUES (1975, 44, 0, 1, '你好', '2023-07-25 15:05:12', 0);
INSERT INTO `app_message` VALUES (1976, 44, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-25 15:05:13', 0);
INSERT INTO `app_message` VALUES (1977, 44, 0, 1, '律师是干嘛的', '2023-07-25 15:05:25', 0);
INSERT INTO `app_message` VALUES (1978, 44, 1, 1, '律师是一种法律专业人士，他们主要从事法律咨询和代理服务。他们的职责包括但不限于以下几点：\n1. 法律咨询：律师可以提供法律意见和建议，帮助客户了解他们在法律事务中的权利和义务。\n2. 代理诉讼：律师可以代表客户在法庭上进行诉讼，包括起草法律文件、参与听证会、进行辩护等。\n3. 合同和文件起草：律师可以起草、审查和修改各种合同、文件和法律文件，以确保其合法性和合规性。\n4. 谈判和调解：律师可以代表客户参与谈判和调解，寻求解决纠纷的和解方案。\n5. 法律研究：律师需要进行大量的法律研究，以了解相关法律法规和案例，为客户提供全面的法律支持。\n需要注意的是，律师的具体职责和专长可能因国家和法律体系的不同而有所差异。', '2023-07-25 15:05:31', 0);
INSERT INTO `app_message` VALUES (1979, 44, 0, 1, '你好', '2023-07-25 15:10:30', 0);
INSERT INTO `app_message` VALUES (1980, 44, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-25 15:10:31', 0);
INSERT INTO `app_message` VALUES (1981, 44, 0, 1, '你是chstgpt几', '2023-07-25 15:10:42', 0);
INSERT INTO `app_message` VALUES (1982, 44, 1, 1, '我是GPT-3模型。GPT-3是由OpenAI开发的一个自然语言处理模型，它具有广泛的语言理解和生成能力。我是基于GPT-3模型构建的一个聊天机器人，旨在提供有关各种主题的信息和帮助。如果你有任何问题或需要我帮助你解决问题，请随时告诉我。', '2023-07-25 15:10:45', 0);
INSERT INTO `app_message` VALUES (1983, 44, 0, 1, '你是哪家公司的', '2023-07-25 15:10:53', 0);
INSERT INTO `app_message` VALUES (1984, 44, 1, 1, '我是由OpenAI开发的，OpenAI 是一家人工智能研究实验室和公司。OpenAI致力于推动人工智能的发展，探索和开发创新的技术和应用。如果你对OpenAI或者人工智能有更多的兴趣，我可以为你提供更多信息。', '2023-07-25 15:10:56', 0);
INSERT INTO `app_message` VALUES (1985, 45, 0, 5, 'Web\n', '2023-07-25 21:26:05', 0);
INSERT INTO `app_message` VALUES (1986, 45, 1, 5, 'Web开发是指开发用于在互联网上运行的网站和应用程序的技术和工具。它涉及前端开发和后端开发两个方面。\n前端开发主要关注用户界面的设计和交互。它使用HTML、CSS和JavaScript等技术来创建网站和应用程序的用户界面。前端开发人员负责设计和开发网站的布局、样式和交互效果，以确保用户能够方便地浏览和使用网站。\n后端开发主要关注网站和应用程序的后台逻辑和数据库管理。它使用各种编程语言（如Python、Java、PHP等）和数据库（如MySQL、PostgreSQL等）来处理数据和实现业务逻辑。后端开发人员负责处理用户请求、与数据库交互、处理业务逻辑和确保网站的安全性和性能。\n在Web开发中，还有一些其他的技术和工具，如前端框架（如React、Angular、Vue.js等）、后端框架（如Django、Spring、Laravel等）、版本控制系统（如Git）、云服务（如AWS、Azure等）等，它们都可以帮助开发人员更高效地开发和部署网站和应用程序。\n总的来说，Web开发是一个涉及多个技术和工具的领域，它可以帮助我们创建各种各样的网站和应用程序，从简单的个人博客到复杂的电子商务平台，从静态网页到动态交互式应用。', '2023-07-25 21:26:11', 0);
INSERT INTO `app_message` VALUES (1987, 45, 0, 3, '你好', '2023-07-25 21:26:18', 0);
INSERT INTO `app_message` VALUES (1988, 45, 1, 3, 'Hello! How can I assist you today?', '2023-07-25 21:26:18', 0);
INSERT INTO `app_message` VALUES (1989, 44, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-25 21:37:17', 0);
INSERT INTO `app_message` VALUES (1990, 44, 1, 1, '孩子进入叛逆期是一个正常的成长阶段，但也会给家长带来一些挑战。以下是一些建议，帮助您面对孩子的叛逆期：\n1. 保持沟通：保持与孩子的积极沟通，倾听他们的想法和感受。尽量理解他们的立场，避免过度批评或指责。\n2. 设立明确的规矩和界限：确保家中有一些明确的规矩和界限，这有助于孩子建立自律和责任感。与孩子一起制定这些规矩，让他们参与其中。\n3. 给予适当的自主权：尽量给予孩子一定的自主权，让他们能够做一些决策和选择。这有助于培养他们的自信和责任感。\n4. 建立良好的家庭氛围：营造一个温暖、支持和理解的家庭环境。尽量与孩子共享愉快的时光，增加亲子活动和交流的机会。\n5. 寻求专业支持：如果您感到无法处理孩子的叛逆行为，或者情况变得严重，不要犹豫寻求专业的帮助，如咨询师或心理学家。\n记住，每个孩子都是独特的，他们的叛逆表现和需求可能不同。尊重孩子的个体差异，以耐心、理解和爱心引导他们度过这个阶段。', '2023-07-25 21:37:24', 0);
INSERT INTO `app_message` VALUES (1991, 44, 0, 1, '你是谁', '2023-07-25 21:37:35', 0);
INSERT INTO `app_message` VALUES (1992, 44, 1, 1, '我是一个AI助手，由OpenAI开发和提供支持。我被设计用来回答各种问题、提供信息和帮助用户解决问题。如果你有任何需要，尽管告诉我，我会尽力帮助你。', '2023-07-25 21:37:36', 0);
INSERT INTO `app_message` VALUES (1993, 44, 0, 1, '你好', '2023-07-25 21:47:24', 0);
INSERT INTO `app_message` VALUES (1994, 44, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-25 21:47:25', 0);
INSERT INTO `app_message` VALUES (1995, 44, 0, 1, '哈哈哈\n', '2023-07-25 21:47:31', 0);
INSERT INTO `app_message` VALUES (1996, 44, 1, 1, '你似乎很开心！有什么让你开心的事情想分享吗？我很愿意聆听。', '2023-07-25 21:47:32', 0);
INSERT INTO `app_message` VALUES (1999, 44, 0, 1, '你那么好', '2023-07-26 08:20:29', 0);
INSERT INTO `app_message` VALUES (2000, 44, 1, 1, '谢谢你的夸奖！作为AI助手，我努力学习和改进，以便能够为用户提供最好的帮助和回答。如果你有任何问题或需要，随时告诉我，我会尽力帮助你。', '2023-07-26 08:20:30', 0);
INSERT INTO `app_message` VALUES (2001, 46, 0, 3, 'Hello', '2023-07-26 10:26:05', 0);
INSERT INTO `app_message` VALUES (2002, 46, 0, 1, 'Hello', '2023-07-26 10:26:44', 0);
INSERT INTO `app_message` VALUES (2003, 40, 0, 1, '你好', '2023-07-26 10:33:10', 0);
INSERT INTO `app_message` VALUES (2004, 40, 0, 1, '你好', '2023-07-26 10:34:53', 0);
INSERT INTO `app_message` VALUES (2005, 40, 0, 1, '你好', '2023-07-26 10:35:29', 0);
INSERT INTO `app_message` VALUES (2006, 40, 0, 1, '你好', '2023-07-26 10:36:21', 0);
INSERT INTO `app_message` VALUES (2007, 40, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-26 10:36:22', 0);
INSERT INTO `app_message` VALUES (2008, 46, 0, 1, '你好', '2023-07-26 11:43:45', 0);
INSERT INTO `app_message` VALUES (2009, 46, 1, 1, '你好！我是你的AI助手，有什么我可以帮助你的吗？', '2023-07-26 11:43:46', 0);
INSERT INTO `app_message` VALUES (2010, 46, 0, 1, 'Hello', '2023-07-26 12:02:53', 0);
INSERT INTO `app_message` VALUES (2011, 46, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-26 12:02:54', 0);
INSERT INTO `app_message` VALUES (2012, 46, 0, 1, 'Hello', '2023-07-26 13:50:55', 0);
INSERT INTO `app_message` VALUES (2013, 46, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-26 13:50:56', 0);
INSERT INTO `app_message` VALUES (2014, 46, 0, 1, 'Hello', '2023-07-26 13:52:23', 0);
INSERT INTO `app_message` VALUES (2015, 46, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-26 13:52:23', 0);
INSERT INTO `app_message` VALUES (2016, 46, 0, 1, 'Hello', '2023-07-26 13:53:48', 0);
INSERT INTO `app_message` VALUES (2017, 46, 1, 1, 'Hello! How can I assist you today?', '2023-07-26 13:53:48', 0);
INSERT INTO `app_message` VALUES (2018, 46, 0, 3, '你好', '2023-07-26 14:18:15', 0);
INSERT INTO `app_message` VALUES (2019, 46, 1, 3, '你好', '2023-07-26 14:18:16', 0);
INSERT INTO `app_message` VALUES (2020, 46, 0, 1, 'Hello', '2023-07-26 14:39:51', 0);
INSERT INTO `app_message` VALUES (2021, 46, 1, 1, 'Hello! How can I assist you today?', '2023-07-26 14:39:53', 0);
INSERT INTO `app_message` VALUES (2022, 46, 0, 1, '你好', '2023-07-26 16:27:13', 0);
INSERT INTO `app_message` VALUES (2023, 46, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-26 16:27:14', 0);
INSERT INTO `app_message` VALUES (2024, 44, 0, 1, '你好', '2023-07-26 18:57:21', 0);
INSERT INTO `app_message` VALUES (2025, 44, 1, 1, '你好！有什么我可以帮助你的吗？', '2023-07-26 18:57:22', 0);
INSERT INTO `app_message` VALUES (2026, 44, 0, 1, '你是gpt几', '2023-07-26 18:57:37', 0);
INSERT INTO `app_message` VALUES (2027, 44, 1, 1, '我是基于GPT-3模型构建的聊天机器人。GPT-3是由OpenAI开发的最新一代自然语言处理模型，拥有强大的语言理解和生成能力。它是目前最先进的语言模型之一，具备广泛的应用潜力。如果你有任何问题或需要我的帮助，请随时告诉我。', '2023-07-26 18:57:40', 0);
INSERT INTO `app_message` VALUES (2028, 44, 0, 1, '孩子进入叛逆期该怎么办？', '2023-07-26 18:57:44', 0);
INSERT INTO `app_message` VALUES (2029, 44, 1, 1, '孩子进入叛逆期是一个常见的成长阶段，这里有一些建议来帮助您应对这个阶段：\n1. 保持沟通：与孩子保持积极的沟通是非常重要的。尝试倾听他们的想法和感受，理解他们的立场，以便更好地与他们建立连接。\n2. 尊重他们的独立性：叛逆期是孩子寻求独立和自我探索的阶段。尽量给予他们一定的自主权和决策权，让他们感受到自己被尊重。\n3. 设立明确的规则和界限：尽管给予孩子一定的自主权，但仍然需要设立明确的规则和界限。这有助于维持秩序和安全，同时也为孩子提供了必要的指导。\n4. 建立良好的家庭氛围：创造一个支持和谐的家庭氛围，鼓励家庭成员之间的相互尊重和理解。这将有助于减轻叛逆期带来的紧张和冲突。\n5. 寻求专业支持：如果您感到孩子的叛逆行为超出了正常范围，或者您感到无法应对的话，不要犹豫寻求专业支持，如咨询师或心理学家的帮助。\n每个孩子都是独特的，所以可能需要不同的方式和方法来处理叛逆期。最重要的是给予孩子足够的爱和支持，以帮助他们度过这个阶段。', '2023-07-26 18:57:56', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_order
-- ----------------------------
INSERT INTO `app_order` VALUES (44, 41, 'com.js.chatgpt.week', 1, '2000000375080721', '2023-07-25 09:55:37');
INSERT INTO `app_order` VALUES (45, 42, 'com.js.chatgpt.week', 1, '2000000375124669', '2023-07-25 11:28:38');
INSERT INTO `app_order` VALUES (46, 44, 'com.js.chatgpt.week', 1, '2000000375677635', '2023-07-25 21:31:59');
INSERT INTO `app_order` VALUES (47, 44, 'com.js.chatgpt.year', 1, '2000000375684009', '2023-07-25 21:39:13');
INSERT INTO `app_order` VALUES (48, 46, 'com.js.chatgpt.week', 1, '2000000376020546', '2023-07-26 11:43:26');
INSERT INTO `app_order` VALUES (49, 46, 'com.js.chatgpt.week', 1, '2000000376022827', '2023-07-26 11:46:56');
INSERT INTO `app_order` VALUES (50, 46, 'com.js.chatgpt.week', 1, '2000000376023888', '2023-07-26 11:48:40');
INSERT INTO `app_order` VALUES (51, 46, 'com.js.chatgpt.week', 1, '2000000376096347', '2023-07-26 14:04:02');

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (40, '15003574377', 'http://www.chataizs.cn/file/photo5.png', 'AI助手', NULL, NULL, 10, 1, NULL, 'J2P4ZG', '2023-07-22 19:23:34', '2023-07-22 19:23:34', 1, 0);
INSERT INTO `app_user` VALUES (44, '13161979592', 'https://www.chataizs.cn/prod-api/profile/upload/2023/07/26/111_20230726185807A009.png', 'AI助手', 0, 2, 0, 1, NULL, '9HhC3b', '2023-07-25 15:04:17', '2024-08-04 21:39:13', 0, 0);
INSERT INTO `app_user` VALUES (45, '18600571125', 'http://www.chataizs.cn/file/photo3.png', 'AI助手', NULL, NULL, 4, 1, 44, 'Af9zk6', '2023-07-25 15:09:48', '2023-07-25 15:09:48', 0, 0);
INSERT INTO `app_user` VALUES (46, '18202805879', 'https://www.chataizs.cn/prod-api/profile/upload/2023/07/26/111_20230726143841A008.png', 'AI助手', 0, 2, 0, 1, NULL, 'M5nLeA', '2023-07-26 09:57:00', '2023-08-26 14:04:02', 0, 1);

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
INSERT INTO `sys_config` VALUES (1, '用户协议', 'app.userAgreement', 'https://www.chataizs.cn/file/user.html', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-25 21:30:45', '（勿删）');
INSERT INTO `sys_config` VALUES (2, '隐私协议', 'app.privacyAgreement', 'https://www.chataizs.cn/file/privacy.html', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-25 21:30:50', '（勿删）');
INSERT INTO `sys_config` VALUES (3, '客服qq号', 'app.qq', '123456789', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-16 03:20:15', '（勿删）');
INSERT INTO `sys_config` VALUES (4, '推荐给朋友获得机会次数', 'app.forward', '3', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-16 03:20:17', '（勿删）');
INSERT INTO `sys_config` VALUES (5, '充值协议', 'app.rechargeAgreement', 'https://www.chataizs.cn/file/recharge.html', 'Y', 'admin', '2023-07-05 07:11:47', 'admin', '2023-07-25 21:30:56', '（勿删）');
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
INSERT INTO `sys_dict_data` VALUES (110, 0, 'photo1', 'https://www.chataizs.cn/file/photo1.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:53:33', 'admin', '2023-07-26 09:51:00', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, 'photo2', 'https://www.chataizs.cn/file/photo2.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:53:51', 'admin', '2023-07-26 09:51:06', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, 'photo3', 'https://www.chataizs.cn/file/photo3.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:54:02', 'admin', '2023-07-26 09:51:11', NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, 'photo4', 'https://www.chataizs.cn/file/photo4.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:54:14', 'admin', '2023-07-26 09:51:18', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, 'photo5', 'https://www.chataizs.cn/file/photo5.png', 'photo', NULL, 'default', 'N', '0', 'admin', '2023-07-21 06:54:24', 'admin', '2023-07-26 09:51:24', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_job_log` VALUES (20, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：115毫秒', '0', '', '2023-07-23 00:00:00');
INSERT INTO `sys_job_log` VALUES (21, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：68毫秒', '0', '', '2023-07-24 00:00:00');
INSERT INTO `sys_job_log` VALUES (22, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：4918毫秒', '0', '', '2023-07-24 00:00:04');
INSERT INTO `sys_job_log` VALUES (23, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：33毫秒', '0', '', '2023-07-25 00:00:00');
INSERT INTO `sys_job_log` VALUES (24, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：59毫秒', '0', '', '2023-07-26 00:00:00');
INSERT INTO `sys_job_log` VALUES (25, '系统默认（无参）', 'DEFAULT', 'ryTask.everydat', '系统默认（无参） 总共耗时：8587毫秒', '0', '', '2023-07-26 00:00:09');

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
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '111.197.240.97', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 19:26:26');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '111.197.240.97', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-07-22 19:27:11');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '111.197.240.97', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 19:27:28');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '111.197.240.97', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-07-22 19:39:28');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '223.104.38.246', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-07-22 19:58:34');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '223.104.38.246', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-07-22 20:05:38');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '111.193.59.214', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-22 20:09:39');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '111.193.59.214', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-07-22 20:11:38');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '111.197.240.97', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-22 22:15:01');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '124.64.122.228', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-22 23:17:35');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '183.197.144.239', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-07-23 00:11:14');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '111.197.240.97', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-23 09:31:53');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '111.197.240.97', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-23 09:45:11');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '27.186.134.245', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-24 09:34:01');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '39.155.155.226', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-24 16:32:39');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '39.155.155.226', 'XX XX', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-07-25 08:52:14');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '39.155.155.226', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-25 08:52:18');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '27.186.134.245', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-25 11:40:36');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '39.155.155.226', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-25 15:30:03');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '124.64.122.228', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-25 17:33:22');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '111.197.240.97', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-25 21:02:32');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '124.64.122.228', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-26 08:59:26');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '39.155.155.226', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-26 09:50:30');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-07-26 10:13:11');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '124.64.122.228', 'XX XX', 'Chrome 11', 'Mac OS X', '0', '登录成功', '2023-07-26 21:24:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (2000, '用户中心', 0, 5, 'management:userCenter', NULL, NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2023-07-21 02:29:06', 'admin', '2023-07-21 02:32:23', '');
INSERT INTO `sys_menu` VALUES (2001, '文章管理', 0, 6, 'management:articleManagement', NULL, NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2023-07-21 02:31:47', 'admin', '2023-07-22 09:01:21', '');
INSERT INTO `sys_menu` VALUES (2002, '系统设置', 0, 7, 'management:systemSetting', NULL, NULL, 1, 0, 'M', '0', '0', '', 'example', 'admin', '2023-07-21 02:33:47', 'admin', '2023-07-22 09:17:32', '');
INSERT INTO `sys_menu` VALUES (2003, '用户列表', 2000, 1, 'userList', 'management/userCenter/userList/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-07-21 02:39:36', 'admin', '2023-07-22 09:18:13', '');
INSERT INTO `sys_menu` VALUES (2004, '聊天列表', 2000, 2, 'chatList', 'management/userCenter/chatList/index', NULL, 1, 0, 'C', '0', '0', '', 'message', 'admin', '2023-07-21 02:40:50', 'admin', '2023-07-22 09:18:35', '');
INSERT INTO `sys_menu` VALUES (2005, '用户反馈', 2000, 3, 'userFeedback', 'management/userCenter/userFeedback/index', NULL, 1, 0, 'C', '0', '0', '', 'email', 'admin', '2023-07-21 02:41:55', 'admin', '2023-07-22 09:20:17', '');
INSERT INTO `sys_menu` VALUES (2006, '文章列表', 2001, 1, 'articleList', 'management/articleManagement/articleList/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-07-21 02:44:30', 'admin', '2023-07-22 09:16:06', '');
INSERT INTO `sys_menu` VALUES (2007, 'key列表', 2002, 1, 'KeyList', 'management/systemSetting/KeyList/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-07-21 02:46:22', 'admin', '2023-07-22 09:17:50', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-07-06 13:05:02', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-07-06 13:05:02', '', NULL, '管理员');

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
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_oper_log` VALUES (224, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '111.197.240.97', 'XX XX', '{\"configId\":1,\"configKey\":\"app.userAgreement\",\"configName\":\"用户协议\",\"configType\":\"Y\",\"configValue\":\"https://www.chataizs.cn/file/user.html\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-16 03:20:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-25 21:30:45', 17);
INSERT INTO `sys_oper_log` VALUES (225, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '111.197.240.97', 'XX XX', '{\"configId\":2,\"configKey\":\"app.privacyAgreement\",\"configName\":\"隐私协议\",\"configType\":\"Y\",\"configValue\":\"https://www.chataizs.cn/file/privacy.html\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-16 03:20:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-25 21:30:50', 9);
INSERT INTO `sys_oper_log` VALUES (226, '参数管理', 2, 'com.chat.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '111.197.240.97', 'XX XX', '{\"configId\":5,\"configKey\":\"app.rechargeAgreement\",\"configName\":\"充值协议\",\"configType\":\"Y\",\"configValue\":\"https://www.chataizs.cn/file/recharge.html\",\"createBy\":\"admin\",\"createTime\":\"2023-07-05 07:11:47\",\"params\":{},\"remark\":\"（勿删）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-07-16 03:20:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-25 21:30:56', 13);
INSERT INTO `sys_oper_log` VALUES (227, '字典数据', 2, 'com.chat.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '39.155.155.226', 'XX XX', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-21 06:53:33\",\"default\":false,\"dictCode\":110,\"dictLabel\":\"photo1\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"https://www.chataizs.cn/file/photo1.png\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-26 09:51:00', 9);
INSERT INTO `sys_oper_log` VALUES (228, '字典数据', 2, 'com.chat.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '39.155.155.226', 'XX XX', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-21 06:53:51\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"photo2\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"https://www.chataizs.cn/file/photo2.png\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-26 09:51:06', 11);
INSERT INTO `sys_oper_log` VALUES (229, '字典数据', 2, 'com.chat.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '39.155.155.226', 'XX XX', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-21 06:54:02\",\"default\":false,\"dictCode\":112,\"dictLabel\":\"photo3\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"https://www.chataizs.cn/file/photo3.png\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-26 09:51:11', 8);
INSERT INTO `sys_oper_log` VALUES (230, '字典数据', 2, 'com.chat.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '39.155.155.226', 'XX XX', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-21 06:54:14\",\"default\":false,\"dictCode\":113,\"dictLabel\":\"photo4\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"https://www.chataizs.cn/file/photo4.png\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-26 09:51:18', 8);
INSERT INTO `sys_oper_log` VALUES (231, '字典数据', 2, 'com.chat.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '39.155.155.226', 'XX XX', '{\"createBy\":\"admin\",\"createTime\":\"2023-07-21 06:54:24\",\"default\":false,\"dictCode\":114,\"dictLabel\":\"photo5\",\"dictSort\":0,\"dictType\":\"photo\",\"dictValue\":\"https://www.chataizs.cn/file/photo5.png\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-26 09:51:24', 10);

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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'AI助手', '00', 'AI@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '124.64.122.228', '2023-07-26 21:24:02', 'admin', '2023-07-06 13:05:01', '', '2023-07-26 21:24:01', '管理员');
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
