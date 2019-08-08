/*
Navicat MySQL Data Transfer

Source Server         : mySQL
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : foods

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-06-02 15:27:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '粤菜');
INSERT INTO `category` VALUES ('2', '闽菜');
INSERT INTO `category` VALUES ('3', '湘菜');
INSERT INTO `category` VALUES ('4', '徽菜');
INSERT INTO `category` VALUES ('5', '鲁菜');
INSERT INTO `category` VALUES ('6', '苏菜');
INSERT INTO `category` VALUES ('7', '浙菜');
INSERT INTO `category` VALUES ('8', '川菜');
INSERT INTO `category` VALUES ('9', '测试菜系一');
INSERT INTO `category` VALUES ('10', '测试菜系二');
INSERT INTO `category` VALUES ('11', '测试菜系三');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `usersId` int(11) NOT NULL,
  `foodsId` int(11) NOT NULL,
  `publishDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CtoFid` (`foodsId`),
  KEY `CtoUid` (`usersId`),
  CONSTRAINT `CtoUid` FOREIGN KEY (`usersId`) REFERENCES `users` (`id`),
  CONSTRAINT `CtoFid` FOREIGN KEY (`foodsId`) REFERENCES `foods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', 'This is so good!', '2', '2', '2019-03-01');
INSERT INTO `comments` VALUES ('2', 'It\'s a delicious food.', '3', '3', '2019-03-01');
INSERT INTO `comments` VALUES ('3', '好吃就两个字', '4', '4', '2019-03-02');
INSERT INTO `comments` VALUES ('4', '我觉得相当合我的口味，给你一个五星好评', '3', '3', '2019-03-03');
INSERT INTO `comments` VALUES ('5', '一般般吧，菜的味道还过得去，就是量太少了', '1', '1', '2019-03-03');
INSERT INTO `comments` VALUES ('6', '不好吃!我觉得太腻了不适合我减肥吃~~~', '5', '5', '2019-03-04');
INSERT INTO `comments` VALUES ('7', '喜欢', '6', '6', '2019-03-05');
INSERT INTO `comments` VALUES ('8', '这没有我想象中的那么好吃，这道菜我期望蛮高的，现在失望了。', '7', '7', '2019-03-06');
INSERT INTO `comments` VALUES ('9', '我自己做了一份，吃了，感觉不好吃，味道有点怪怪的，好像没熟呢，下次努力做好吃', '1', '8', '2019-03-07');
INSERT INTO `comments` VALUES ('10', '没话讲，很对我的口味，我就喜欢吃肉！满分', '1', '9', '2019-03-08');
INSERT INTO `comments` VALUES ('11', '占楼~~~~~', '2', '9', '2019-03-09');
INSERT INTO `comments` VALUES ('12', '嘤嘤嘤？不管你信不信，我李四说他好吃。', '3', '1', '2019-03-10');
INSERT INTO `comments` VALUES ('13', '太酸了不喜欢', '4', '2', '2019-03-11');
INSERT INTO `comments` VALUES ('14', '我不管我就是喜欢吃豆腐', '5', '3', '2019-03-12');
INSERT INTO `comments` VALUES ('15', '还行啦这道菜', '6', '1', '2019-03-13');
INSERT INTO `comments` VALUES ('16', '不错的一道菜', '7', '4', '2019-03-13');
INSERT INTO `comments` VALUES ('17', '哈哈哈好吃', '1', '1', '2019-05-08');
INSERT INTO `comments` VALUES ('18', '请问这个做出来的面包酸不酸啊？', '1', '11', '2019-05-29');
INSERT INTO `comments` VALUES ('19', 'haochi ', '1', '1', '2019-05-30');

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `id` int(11) NOT NULL DEFAULT '0',
  `chineseName` varchar(25) DEFAULT NULL,
  `englishName` varchar(25) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `descriptioin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `englishName` (`englishName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES ('1', '荔浦扣肉', 'lipukourou', '1', '荔浦扣肉的做法\r\n1.将荔浦芋头切成长方形的片，用滚油炸透；\r\n2.大蒜切蓉\r\n3.干淀粉放碗内加适量水调制成湿淀粉备用；\r\n4.将猪肉烧去毛，刮洗干净，放在汤锅里，浸至七成熟，取出，上老抽色，用武火滚油炸（使其皱皮），取起，用冷水洗净油腻，切成长方形的片；\r\n5.将蒜茸、南乳、花椒、八角茴香末、老抽、糖和已切好的熟肉拌匀，然后一片芋头、一片肉相夹起来，排放在大碗内，再入笼蒸熟；\r\n6.将已蒸熟的扣肉倒出原汁，覆盖在碟中；\r\n7.用武火烧锅，放入原汁，加二汤（175克）、老抽，湿淀粉打芡，淋在扣肉上便成。');
INSERT INTO `foods` VALUES ('2', '酸辣汤', 'suanlatang', '8', '酸辣汤的做法\r\n1.将豆腐、冬菇、海参、鱿鱼分别切成细丝。\r\n2.将猪瘦肉切成细丝氽熟，与豆腐丝、冬菇丝、海参丝、鱿鱼丝一起放入锅内，加鸡汤、盐、酱油用旺火烧沸，去浮沫，用湿淀粉勾芡，加打散的鸡蛋液制成汤。\r\n3.将胡椒粉、醋、植物油、葱花放入汤碗内，冲入制好的鸡丝汤即成。注意：海参与醋相克；不宜与甘草同服。');
INSERT INTO `foods` VALUES ('3', '家常豆腐', 'jiachangdoufu', '3', '家常豆腐的做法\r\n1.豆腐改成5厘米宽的对角的三角形，1厘米厚的片，用平盘装上，撒上盐腌一下，滗去水分；\r\n2.猪肉剁成末；\r\n3.大蒜切成2厘米的段；\r\n4.豆瓣辣酱要剁碎；\r\n5.将猪油烧沸后下入豆腐，待两面都煎黄后就取出；\r\n6.另外，再将油烧沸，下入猪肉末炒熟，烹料酒，加入豆瓣辣酱炒香；\r\n7.再加入豆腐、盐、味精和汤，焖入味，收干汁，放入大蒜和香油，装入盘内，即可。\r\n家常豆腐的营养成分\r\n    能量 2235.56千卡,\r\n    蛋白质 81.4克,\r\n    脂肪 209.61克,\r\n ');
INSERT INTO `foods` VALUES ('4', '古井醉鸡', 'gujingzuiji', '4', '古井醉鸡的做法\r\n1.将活母鸡宰杀，流尽血水；\r\n2.待鸡完全死后，用80℃～90℃的水烫泡，不要碰破鸡皮，将毛煺净，从脊背开刀，掏去内脏和嗉囊，用清水冲洗，沥水，放置七八个小时后使用；\r\n3.烧一锅沸水，将鸡放入，氽约10 分钟，捞起洗净，剁去头和爪；\r\n4.另取砂锅一只，放入整鸡，注入清水，淹没鸡身，置锅于大火上烧；\r\n5.待烧开后，撇去浮沫，转小火炖约40 分钟，待鸡达到六成熟时，捞出晾干水分；\r\n6.将鸡身沿背部一剖两半，再把半个鸡身平分两块，鸡身分成四块，放盘中备用；\r\n7.再取一只汤碗，放入冷');
INSERT INTO `foods` VALUES ('5', '元宝肘子', 'yuanbaozouzi', '5', '元宝肘子的做法\r\n1.将肘子刮洗干净，放入汤锅内煮至八分熟捞出；\r\n2.将肘子扒去骨头，将皮面擦干抹上一层糖色，晾约10分钟；\r\n3.勺内放油，浇至七八成热时，将猪肘子皮面朝下放入油内，炸成虎皮色时捞出控净油；\r\n4.将肘子肉面上切成方块形而皮面相连，然后皮朝下装入大碗内，添上汤，加上酱油、葱姜块、花椒、八角，上屉蒸至酥烂取出；\r\n5.将鸡蛋煮熟剥去皮，用酱油腌渍20分钟，然后用七成热的油炸成虎皮色捞出，每个切成两半；\r\n6.将肘子汤滗入勺内，拣去葱姜及花椒、八角，将肘子皮朝上扣入盘内中间，然后将汤烧开，');
INSERT INTO `foods` VALUES ('6', '烩虾仁', 'huixiaren', '6', '烩虾仁的做法\r\n1.将虾仁去沙腺洗净，加入盐、料酒稍腌；\r\n2.用开水将虾仁、豌豆焯好；\r\n3.锅放少量油烧热，放葱米、姜米爆香，加高汤，投入虾仁、豌豆烧开；\r\n4.放味精、盐、料酒，水淀粉勾玻璃芡，出锅淋香油。\r\n烩虾仁的食物相克\r\n虾仁 虾忌与某些水果同吃。虾含有比较丰富的蛋白质和钙等营养物质。\r\n如果把它们与含有鞣酸的水果，如葡萄、石榴、山楂、柿子等同食，\r\n不仅会降低蛋白质的营养价值，而且鞣酸和钙离子结合形成不溶性结合物刺激肠胃，\r\n引起人体不适，出现呕吐、头晕、恶心和腹痛腹泻等症状。海鲜与这些水');
INSERT INTO `foods` VALUES ('7', '嘉兴粽子', 'jiaxingzongzi', '7', '嘉兴粽子的做法\r\n1.选用7～10 厘米宽的伏天粽叶，放在开水锅内煮3～5 分钟，使其回软，捞起用清水洗净，沥干；\r\n2.糯米放入淘箩，用清水淘净，连箩静置约15 分钟，沥干水，将米倒入木盆内，加入糖20克、盐15克及酱油50 克拌匀；\r\n3.将猪腿肉去皮，按横纤维分别肥瘦切成长方小块（每块约重20克），放入大盆，加糖7克、盐10克及味精、白酒，反复搓擦，使用料渗入肉内，直至泛出白沫时止；\r\n4.左手拿粽叶2 张，毛面朝下，宽度1/5 相叠，右手另拿1 张粽叶，光面朝上，约1/3 相叠接在左手粽叶的尾部将');
INSERT INTO `foods` VALUES ('8', '盐焗仔鸡', 'yanjuzaiji', '1', '盐焗仔鸡的做法\r\n1.活鸡宰杀煺净毛后，掏出脏腑，洗净放入盆内，用八角、甘草、葱、姜、精盐、白糖、芝麻油放入一碗内调匀，涂抹鸡身上，剩余的八角、甘草、姜、葱等塞在鸡腹内，随后用丝棉纸包好，再用白报纸包好；将大葱洗净取30克切成葱丝，葱和葱丝都待用；姜洗净取30克切成细姜丝，姜和姜丝都待用；另备棉纸一张，白报纸一张。\r\n2.烧热锅投入粗盐，炒滚热后，取出三分之二，将纸包好的鸡放入盐锅，将取出三分之二的粗盐盖在鸡面上，用微火?三十分钟取出(以熟为准)，轻轻抖掉粗盐，剪去纸棉，将原汁滗在小碗中。\r\n3.取出鸡斩');
INSERT INTO `foods` VALUES ('9', '半月沉江', 'banyuechenjiang', '2', '半月沉江的做法\r\n1.面筋用手捏成直径1.5 厘米、高1.8 厘米的圆粒；\r\n2.水发香菇去蒂切成两片；\r\n3.净冬笋切成滚刀块；\r\n4.番茄切成黄豆粒大的丁，芹菜洗净切丁；\r\n5.当归切成薄片，以上原料备用；\r\n6.炒锅放在旺火上，倒入花生油烧至九成热，放入面筋粒炸干水分，待浮起呈赤红色时捞出，沥油；\r\n7.沥去油后侵入沸水中，泡至回软捞出沥干水；\r\n8.沥水后切成0.6厘米厚的圆片；\r\n9.炒锅洗净置火上，入水500毫升，又放面筋、香菇、当归、冬笋、精盐，煮至面筋回软时，捞起沥干；\r\n10.除去当归，');
INSERT INTO `foods` VALUES ('11', '测试主题3', 'zhuti3', '1', '<p>苹果面包的做法步骤：</p>\r\n\r\n<p>1、准备好所有材料。<br />\r\n2、高筋面粉放和面盆里，放入白糖，再加入酵母，白糖的量依个人的口味添加，再打入2个鸡蛋。<br />\r\n3、准备好温牛奶，牛奶用热水烫2分钟，倒在酵母上，把酵母化开;面粉的的吸水不同，加牛奶要分次加入。<br />\r\n4、用筷子搅拌成面絮状，再倒入植物油，通常加玉米油或葵花油，清淡还好吃。<br />\r\n5、在饧好的生坯刷上蛋黄液，再撒上芝麻，<br />\r\n6、盖上耐高温的保鲜膜，盖上锅盖蒸45分钟。</p>\r\n');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `publishDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isRead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '大白白', 'dabaibai@qq.com', '13536482597', '举杯邀明月，把酒问青天呀。我就喜欢这里的酒！', '2019-03-01 20:29:11', '1');
INSERT INTO `message` VALUES ('2', '二白白', 'erbaibai@qq.com', '15536482598', '举杯邀明月，把酒问青天啊。我也喜欢这里的酒！', '2019-03-01 21:29:11', '1');
INSERT INTO `message` VALUES ('3', '三白白', 'sanbaibai@qq.com', '18536482599', '举杯邀明月，把酒问青天哦。我刚好也喜欢这里的酒！', '2019-03-01 22:29:11', '1');
INSERT INTO `message` VALUES ('4', '赵武', 'zhaowu@136.com', '13536482597', '这里的粽子我觉得不错~', '2019-03-02 20:29:11', '1');
INSERT INTO `message` VALUES ('5', '杜甫', 'dufu@136.com', '15536482587', '大概是口味不同吧，不多说了。', '2019-03-03 20:29:11', '1');
INSERT INTO `message` VALUES ('6', '张三', 'zhangsan@qq.com', '18536482567', '吃了一份川菜我就不能吃第二份了，太辣了太麻了', '2019-03-04 20:29:11', '1');
INSERT INTO `message` VALUES ('7', '李四', 'lisi@136.com', '13536482557', '东西有点贵，但是味道不错，总的来说我觉得物有所值。', '2019-03-05 20:29:11', '1');
INSERT INTO `message` VALUES ('8', '福晋', 'fujin@qq.com', '13536482557', '我作为一位福晋，我说这里的才没皇宫的好吃！', '2019-03-05 20:29:11', '1');
INSERT INTO `message` VALUES ('9', '无名', 'wu@qq.com', '15813512434', '20190530测试', '2019-05-30 00:52:38', '1');
INSERT INTO `message` VALUES ('10', '小小黑', 'xiao@qq.com', '13512343111', '我希望策划和美工可以把界面做的好看点，现在这个好难看啊。', '2019-05-30 00:53:55', '1');
INSERT INTO `message` VALUES ('11', '晓晓', 'xiao@136.com', '13832155464', '希望你们可以好好的，把这个网站做的好点。', '2019-05-30 00:55:03', '1');
INSERT INTO `message` VALUES ('12', '一只不愿留名的小鱼', 'yu@qq.com', '13832198745', '我不想留名，我就在这里留个言', '2019-05-30 00:56:25', '1');
INSERT INTO `message` VALUES ('13', 'nic', '158@qq.com', '13512343111', 'neirong ', '2019-05-30 09:26:39', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(25) NOT NULL,
  `content` varchar(255) NOT NULL,
  `publishDate` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '幸福生活怎么来？', '幸福生活哪里来，幸福生活怎么来？”前不久，裕华区建华南街道举办的“365百姓故事汇”讲述老百姓身边的幸福故事。\r\n　　前不久，裕华区建华南街道凤凰社区活动室，一场主题为“365百姓故事汇”群众宣讲活动精彩上演。据悉，为积极响应裕华区委宣传部的号召，建华南街道办在辖区以“奋斗新时代我们一起来”为主题，广泛征集辖区里的幸福人、幸福事，再通过搭建群众宣讲平台，弘扬主旋律，传递正能量。', '2019-03-05', '1');
INSERT INTO `news` VALUES ('2', '寸金难买邻里情啊！', '“寸金难买邻里情啊！每个人都盼望有个好邻居，首先我们要做一名乐于助人的好邻居……”第一个上台演讲的是来自凤凰社区众美城玉兰苑南苑业主苏志同。苏志同是玉兰苑南苑的老住户，在他的眼中，小区不光环境干净整洁、花团锦簇，而且邻里还互帮互助，相处融洽，这需要社区每一位居民共同努力，而他就用实际行动告诉大家如何做个好邻居，“谁家要是有个困难事，只要能做到，我就会毫不犹豫地帮助别人。”苏志同认为正是无数点滴小帮助，才汇聚成文明和谐温馨的大音符。', '2019-03-06', '1');
INSERT INTO `news` VALUES ('3', '百善孝为先', '“在我眼里，百善孝为先。只要有时间，我们陪父母散步、聊天，过节和父母吃团圆饭，这都是在尽孝……”润园社区推选的张春芬讲述了敬老爱亲的故事；海天社区的好楼长高明芝，她尽职尽责带头清理垃圾，为文明城、卫生城尽一份微薄之力……\r\n　　“虽然每个人的故事各不相同，但幸福的内涵都是一样的，那就是幸福生活需要团结奋斗来实现。”建华南街道办相关负责人米彦巧表示，他们会继续挖掘辖区的幸福典型，进一步营造团结奋进的浓厚氛围，让和谐与文明成为街道的主旋律。', '2019-03-06', '0');
INSERT INTO `news` VALUES ('4', '现代农村是一片大有可为的土地', '中新网北京3月8日电(记者 张蔚然)8日上午，习近平总书记在参加河南代表团审议时说，农业农村发展要用好深化改革这个法宝。现在，城乡之间人才、资本等要素的自由流动越来越活跃。不仅本土大学生返乡多了，很多海归也到乡村去寻找创业机会。现代农业发展空间仍然很大，现代农村是一片大有可为的土地、希望的田野。', '2019-03-07', '1');
INSERT INTO `news` VALUES ('5', '中国足协辟谣', '中新网3月8日电 8日，中国足协新闻办官方微博发文辟谣，称此前网传“中国足协邀请知名教练穆里尼奥担任中国国家男子足球队主教练”的消息不实。\r\n　　北京时间2018年12月18日，英超豪门曼联官方宣布，主帅穆里尼奥下课，此后他下一站将去哪里执教传闻颇多。而在年初亚洲杯以后，国足主教练里皮离任，足协迟迟没有官宣新的国足主帅人选。', '2019-03-08', '1');
INSERT INTO `news` VALUES ('6', '费莱尼宣布退出比利时国家队 ', '费莱尼在个人社交媒体上宣布退出国家队的决定：“代表比利时成年国家队征战12年高水平比赛之后，我决定从国家队退役。对我来说，这不是一个能轻易做出的决定，但我觉得现在是时候停下来，给年轻人机会了，让他们可以继续创造比利时足球的辉煌历史。”', '2019-03-08', '1');
INSERT INTO `news` VALUES ('9', '点点滴滴', '<p>大大地地道道多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多</p>\r\n', '2019-09-09', null);
INSERT INTO `news` VALUES ('11', '5月8号的一次测试', '<p>&nbsp; 这是2019年5月8号的一次测试，虽然之前做过测试了，但是还是习惯性的在每一次修改代码过后重新做一次测试。22:13记录，开始......</p>\r\n', '2019-05-09', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `lastLoginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isUsered` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`userName`),
  UNIQUE KEY `userName` (`userName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '123', '0', '2019-03-11 11:08:42', '1');
INSERT INTO `users` VALUES ('2', '张三', '123456', '1', '2019-03-01 23:08:42', '1');
INSERT INTO `users` VALUES ('3', '李四', '123456', '1', '2019-03-02 23:08:42', '1');
INSERT INTO `users` VALUES ('4', '赵武', '123456', '1', '2019-03-03 23:08:42', '1');
INSERT INTO `users` VALUES ('5', '李六', '123456', '1', '2019-05-30 09:28:31', '1');
INSERT INTO `users` VALUES ('6', '符器', '123456', '1', '2019-03-05 23:08:42', '1');
INSERT INTO `users` VALUES ('7', '王八', '123456', '1', '2019-03-05 23:08:42', '0');
