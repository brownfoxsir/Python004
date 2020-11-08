/*
 Navicat Premium Data Transfer

 Source Server         : ecs
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 47.94.3.20:10010
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 08/11/2020 22:28:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for movie_moviedetail
-- ----------------------------
DROP TABLE IF EXISTS `movie_moviedetail`;
CREATE TABLE `movie_moviedetail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `director` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `actor` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `release_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `film_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `film_length` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `another_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rank` int(0) NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_moviedetail
-- ----------------------------
INSERT INTO `movie_moviedetail` VALUES (1, '霸王别姬', '陈凯歌', '芦苇,李碧华', '张国荣,张丰毅,巩俐,葛优,英达,蒋雯丽,吴大维,吕齐,雷汉,尹治,马明威,费振翔,智一桐,李春,赵海龙,李丹,童弟,沈慧芬,黄斐,徐杰', '', '', '1993-01-01(中国香港),1993-07-26(中国大陆)', '剧情,爱情,同性', '171分钟', '/ 155分钟(美国剧场版)', 2, '9.6', 'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561716440.jpg');
INSERT INTO `movie_moviedetail` VALUES (2, '肖申克的救赎', '弗兰克·德拉邦特', '弗兰克·德拉邦特,斯蒂芬·金', '蒂姆·罗宾斯,摩根·弗里曼,鲍勃·冈顿,威廉姆·赛德勒,克兰西·布朗,吉尔·贝罗斯,马克·罗斯顿,詹姆斯·惠特摩,杰弗里·德曼,拉里·布兰登伯格,尼尔·吉恩托利,布赖恩·利比,大卫·普罗瓦尔,约瑟夫·劳格诺,祖德·塞克利拉,保罗·麦克兰尼,芮妮·布莱恩,阿方索·弗里曼,V·J·福斯特,弗兰克·梅德拉诺,马克·迈尔斯,尼尔·萨默斯,耐德·巴拉米,布赖恩·戴拉特,唐·麦克马纳斯', '美国', '英语', '1994-09-10(多伦多电影节),1994-10-14(美国)', '剧情,犯罪', '142分钟', '月黑高飞(港) / 刺激1995(台) / 地狱诺言 / 铁窗岁月 / 消香克的救赎', 1, '9.7', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg');
INSERT INTO `movie_moviedetail` VALUES (3, '这个杀手不太冷', '吕克·贝松', '吕克·贝松', '让·雷诺,娜塔莉·波特曼,加里·奥德曼,丹尼·爱罗,彼得·阿佩尔,迈克尔·巴达鲁科,艾伦·格里尼,伊丽莎白·瑞根,卡尔·马图斯维奇,弗兰克·赛格,麦温,乔治·马丁,罗伯特·拉萨多,亚当·布斯奇,马里奥·托迪斯科,萨米·纳塞利', '', '', '1994-09-14(法国)', '剧情,动作,犯罪', '110分钟(剧场版)', '', 4, '9.4', 'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p511118051.jpg');
INSERT INTO `movie_moviedetail` VALUES (4, '泰坦尼克号', '詹姆斯·卡梅隆', '詹姆斯·卡梅隆', '莱昂纳多·迪卡普里奥,凯特·温丝莱特,比利·赞恩,凯西·贝茨,弗兰西丝·费舍,格劳瑞亚·斯图尔特,比尔·帕克斯顿,伯纳德·希尔,大卫·沃纳,维克多·加博,乔纳森·海德,苏茜·爱米斯,刘易斯·阿伯内西,尼古拉斯·卡斯柯恩,阿那托利·萨加洛维奇,丹尼·努齐,杰森·贝瑞,伊万·斯图尔特,艾恩·格拉法德,乔纳森·菲利普斯,马克·林赛·查普曼,理查德·格拉翰,保罗·布赖特威尔,艾瑞克·布里登,夏洛特·查顿,博纳德·福克斯,迈克尔·英塞恩,法妮·布雷特,马丁·贾维斯,罗莎琳·艾尔斯,罗切尔·罗斯,乔纳森·伊万斯-琼斯,西蒙·克雷恩,爱德华德·弗莱彻,斯科特·安德森,马丁·伊斯特,克雷格·凯利,格雷戈里·库克,利亚姆·图伊,詹姆斯·兰开斯特,艾尔莎·瑞雯,卢·帕尔特,泰瑞·佛瑞斯塔,凯文·德·拉·诺伊', '', '', '1998-04-03(中国大陆),1997-11-01(东京电影节),1997-12-19(美国)', '剧情,爱情,灾难', '194分钟', '', 5, '9.4', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p457760035.jpg');
INSERT INTO `movie_moviedetail` VALUES (5, '阿甘正传', '罗伯特·泽米吉斯', '艾瑞克·罗斯,温斯顿·格鲁姆', '汤姆·汉克斯,罗宾·怀特,加里·西尼斯,麦凯尔泰·威廉逊,莎莉·菲尔德,海利·乔·奥斯蒙,迈克尔·康纳·亨弗里斯,哈罗德·G·赫瑟姆,山姆·安德森,伊俄涅·M·特雷奇,彼得·道博森,希芳·法隆,伊丽莎白·汉克斯,汉娜·豪尔,克里斯托弗·琼斯,罗布·兰德里,杰森·麦克奎尔,桑尼·施罗耶,艾德·戴维斯,丹尼尔C.斯瑞派克,大卫·布里斯宾,德博拉·麦克蒂尔,艾尔·哈林顿,阿非莫·奥米拉,约翰·沃德斯塔德,迈克尔·伯吉斯,埃里克·安德伍德,拜伦·明斯,斯蒂芬·布吉格沃特,约翰·威廉·高尔特,希拉里·沙普兰,伊莎贝尔·罗斯,理查德·达历山德罗,迪克·史迪威,迈克尔-杰斯,杰弗里·布莱克,瓦妮莎·罗斯,迪克·卡维特,马拉·苏查雷特扎,乔·阿拉斯奇,W·本森·泰瑞', '美国', '英语', '1994-06-23(洛杉矶首映),1994-07-06(美国)', '剧情,爱情', '142分钟', '福雷斯特·冈普', 3, '9.5', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2372307693.jpg');
INSERT INTO `movie_moviedetail` VALUES (6, '千与千寻', '宫崎骏', '宫崎骏', '柊瑠美,入野自由,夏木真理,菅原文太,中村彰男,玉井夕海,神木隆之介,内藤刚志,泽口靖子,我修院达也,大泉洋,小林郁夫,上条恒彦,小野武彦', '', '', '2019-06-21(中国大陆),2001-07-20(日本)', '剧情,动画,奇幻', '125分钟', '', 7, '9.4', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557573348.jpg');
INSERT INTO `movie_moviedetail` VALUES (7, '美丽人生', '罗伯托·贝尼尼', '温琴佐·切拉米,罗伯托·贝尼尼', '罗伯托·贝尼尼,尼可莱塔·布拉斯基,乔治·坎塔里尼,朱斯蒂诺·杜拉诺,赛尔乔·比尼·布斯特里克,玛丽萨·帕雷德斯,霍斯特·布赫霍尔茨,利迪娅·阿方西,朱利亚娜·洛约迪切,亚美利哥·丰塔尼,彼得·德·席尔瓦,弗朗西斯·古佐,拉法埃拉·莱博罗尼,克劳迪奥·阿方西,吉尔·巴罗尼,马西莫·比安奇,恩尼奥·孔萨尔维,吉安卡尔洛·科森蒂诺,阿伦·克雷格,汉尼斯·赫尔曼,弗兰科·梅斯科利尼,安东尼奥·普雷斯特,吉娜·诺维勒,理查德·塞梅尔,安德烈提多娜,迪尔克·范登贝格,奥梅罗·安东努蒂', '/', '意大利', '2020-01-03(中国大陆),1997-12-20(意大利)', '剧情,喜剧,爱情,战争', '116分钟', '', 6, '9.5', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2578474613.jpg');
INSERT INTO `movie_moviedetail` VALUES (8, '辛德勒的名单', '史蒂文·斯皮尔伯格', '托马斯·肯尼利,斯蒂文·泽里安', '连姆·尼森,本·金斯利,拉尔夫·费因斯,卡罗琳·古多尔,乔纳森·萨加尔,艾伯丝·戴维兹,马尔戈萨·格贝尔,马克·伊瓦涅,碧翠斯·马科拉,安德烈·瑟韦林,弗里德里希·冯·图恩,克齐斯茨托夫·拉夫特,诺伯特·魏塞尔', '', '', '1993-11-30(华盛顿首映),1994-02-04(美国)', '剧情,历史,战争', '195分钟', '', 8, '9.5', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p492406163.jpg');
INSERT INTO `movie_moviedetail` VALUES (9, '盗梦空间', '克里斯托弗·诺兰', '克里斯托弗·诺兰', '莱昂纳多·迪卡普里奥,约瑟夫·高登-莱维特,艾伦·佩吉,汤姆·哈迪,渡边谦,迪利普·劳,基里安·墨菲,汤姆·贝伦杰,玛丽昂·歌迪亚,皮特·波斯尔思韦特,迈克尔·凯恩,卢卡斯·哈斯,李太力,克莱尔·吉尔蕾,马格努斯·诺兰,泰勒·吉蕾,乔纳森·吉尔,水源士郎,冈本玉二,厄尔·卡梅伦,瑞恩·海沃德,米兰达·诺兰,拉什·费加,蒂姆·科勒赫,妲露拉·莱莉', '/', '美国 / 英国', '2010-09-01(中国大陆),2020-08-28(中国大陆重映),2010-07-16(美国)', '剧情,科幻,悬疑,冒险', '148分钟', '', 9, '9.3', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2616355133.jpg');
INSERT INTO `movie_moviedetail` VALUES (10, '忠犬八公的故事', '拉斯·霍尔斯道姆', '斯蒂芬·P·林赛,新藤兼人', '理查·基尔,萨拉·罗默尔,琼·艾伦,罗比·萨布莱特,艾瑞克·阿瓦利,田川洋行,杰森·亚历山大,罗伯特·卡普荣', '', '', '2009-06-13(西雅图电影节),2010-03-12(英国)', '剧情', '93分钟', '', 10, '9.4', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p524964039.jpg');
INSERT INTO `movie_moviedetail` VALUES (11, '星际穿越', '克里斯托弗·诺兰', '乔纳森·诺兰,克里斯托弗·诺兰', '马修·麦康纳,安妮·海瑟薇,杰西卡·查斯坦,麦肯吉·弗依,卡西·阿弗莱克,迈克尔·凯恩,马特·达蒙,蒂莫西·柴勒梅德,艾伦·伯斯汀,约翰·利思戈,韦斯·本特利,大卫·吉亚西,比尔·欧文,托弗·戈瑞斯,科莱特·沃夫,弗朗西斯·X·麦卡蒂,安德鲁·博尔巴,乔什·斯图沃特,莱雅·卡里恩斯,利亚姆·迪金森,杰夫·赫普内尔,伊莱耶斯·加贝尔,布鲁克·史密斯,大卫·奥伊罗,威廉姆·德瓦内,拉什·费加,格里芬·弗雷泽,弗洛拉·诺兰', '', '', '2014-11-12(中国大陆),2020-08-02(中国大陆重映),2014-11-07(美国)', '剧情,科幻,冒险', '169分钟', '', 12, '9.3', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2614988097.jpg');
INSERT INTO `movie_moviedetail` VALUES (12, '海上钢琴师', '朱塞佩·托纳多雷', '亚利桑德罗·巴里克,朱塞佩·托纳多雷', '蒂姆·罗斯,普路特·泰勒·文斯,比尔·努恩,克兰伦斯·威廉姆斯三世,梅兰尼·蒂埃里,皮特·沃恩,尼尔·奥布赖恩,阿尔贝托·巴斯克斯,加布里埃莱·拉维亚,科里·巴克,西德尼·科尔,Luigi De Luca,尼古拉·迪·平托,费米·依鲁福祖,伊斯顿·盖奇,凯文·麦克纳利,布莱恩·普林格,沙拉·鲁宾,希思科特·威廉姆斯,阿妮妲·扎格利亚,安吉洛·迪洛雷塔', '意大利', '英语 / 法语 / 意大利语', '2019-11-15(中国大陆),1998-10-28(意大利)', '剧情,音乐', '165分钟', '', 11, '9.3', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2574551676.jpg');
INSERT INTO `movie_moviedetail` VALUES (13, '楚门的世界', '彼得·威尔', '安德鲁·尼科尔', '金·凯瑞,劳拉·琳妮,艾德·哈里斯,诺亚·艾默里奇,娜塔莎·麦克艾霍恩', '美国', '英语', '1998-06-05(美国)', '剧情,科幻', '103分钟', '', 13, '9.3', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p479682972.jpg');
INSERT INTO `movie_moviedetail` VALUES (14, '三傻大闹宝莱坞', '拉吉库马尔·希拉尼', '维德胡·维诺德·乔普拉,拉吉库马尔·希拉尼,阿希贾特·乔希', '阿米尔·汗,卡琳娜·卡普尔,马达范,沙尔曼·乔希,奥米·瓦依达,博曼·伊拉尼,莫娜·辛格,拉杰夫·拉宾德拉纳特安', '/', '印度', '2011-12-08(中国大陆),2009-12-25(印度)', '剧情,喜剧,爱情,歌舞', '171分钟(印度)', '', 14, '9.2', 'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p579729551.jpg');
INSERT INTO `movie_moviedetail` VALUES (15, '机器人总动员', '安德鲁·斯坦顿', '安德鲁·斯坦顿,吉姆·里尔顿,彼特·道格特', '本·贝尔特,艾丽莎·奈特,杰夫·格尔林,佛莱德·威拉特,西格妮·韦弗,MacInTalk,约翰·拉岑贝格,凯茜·纳基麦,泰迪·牛顿,鲍伯·伯根,洛丽·理查德森,吉姆·瓦德,彼特·道格特,安德鲁·斯坦顿,杰夫·皮金,约翰·齐甘,米凯·麦高万,雪莉·琳恩,克莱特·惠特克,唐纳德·富利洛夫,罗里·艾伦,杰斯·哈梅尔,拉瑞恩·纽曼,扬·拉布森,保罗·伊丁', '', '', '2008-06-27(美国)', '科幻,动画,冒险', '98分钟', '', 15, '9.3', 'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1461851991.jpg');
INSERT INTO `movie_moviedetail` VALUES (16, '大话西游之大圣娶亲', '刘镇伟', '刘镇伟', '周星驰,吴孟达,朱茵,蔡少芬,蓝洁瑛,莫文蔚,罗家英,刘镇伟,陆树铭,李健仁', '/', '中国香港 / 中国大陆', '1995-02-04(中国香港),2014-10-24(中国大陆),2017-04-13(中国大陆重映)', '喜剧,爱情,奇幻,古装', '95分钟', '', 17, '9.2', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2455050536.jpg');
INSERT INTO `movie_moviedetail` VALUES (17, '放牛班的春天', '克里斯托夫·巴拉蒂', '乔治·沙普罗,勒·惠勒,诺埃-诺尔,克里斯托夫·巴拉蒂,菲利普·洛佩斯-屈瓦尔', '热拉尔·朱尼奥,弗朗索瓦·贝莱昂,凯德·麦拉德,让-保罗·博奈雷,玛丽·布奈尔,让-巴蒂斯特·莫尼耶,马科森斯·珀林,格雷戈里·加迪诺尔,托马斯·布伦门塔尔,西里尔·伯尔尼科特,西蒙·法戈特,泰奥杜尔·卡雷-卡赛尼,菲利普·杜·詹纳兰德,埃里克·德斯玛莱茨,狄迪尔·弗拉蒙,雅克·贝汉', '法国 / 瑞士 / 德国', '法语', '2004-10-16(中国大陆),2004-03-17(法国)', '剧情,音乐', '97分钟', '歌声伴我心(港) / 唱诗班男孩 / The Chorus', 16, '9.3', 'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1910824951.jpg');
INSERT INTO `movie_moviedetail` VALUES (18, '熔炉', '黄东赫', '黄东赫,孔枝泳', '孔侑,郑有美,金贤秀,郑仁絮,白承焕,张光,金民尚,林贤成,金周灵,严孝燮,全国焕,崔镇浩,金志映,严智星,许在浩,张素妍', '', '', '2011-09-22(韩国)', '剧情', '125分钟', '', 18, '9.3', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1363250216.jpg');
INSERT INTO `movie_moviedetail` VALUES (19, '疯狂动物城', '拜伦·霍华德,瑞奇·摩尔,杰拉德·布什', '拜伦·霍华德,瑞奇·摩尔,杰拉德·布什,吉姆·里尔顿,乔西·特立尼达,菲尔·约翰斯顿,珍妮弗·李', '金妮弗·古德温,杰森·贝特曼,伊德里斯·艾尔巴,珍妮·斯蕾特,内特·托伦斯,邦尼·亨特,唐·雷克,汤米·钟,J·K·西蒙斯,奥克塔维亚·斯宾瑟,艾伦·图代克,夏奇拉,雷蒙德·S·佩尔西,德拉·萨巴,莫里斯·拉马奇,菲尔·约翰斯顿,约翰·迪·马吉欧,凯蒂·洛斯,吉塔·雷迪,杰西·科尔蒂,汤米·利斯特,乔希·达拉斯,瑞奇·摩尔,凯斯·索西,彼得·曼斯布里奇,拜伦·霍华德,杰拉德·布什,马克·史密斯,乔西·特立尼达,约翰·拉维尔,克里斯汀·贝尔,吉尔·科德斯,梅利莎·古德温', '', '', '2016-03-04(中国大陆/美国),2020-07-24(中国大陆重映)', '喜剧,动画,冒险', '109分钟(中国大陆)', '/ 108分钟', 19, '9.2', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2614500649.jpg');
INSERT INTO `movie_moviedetail` VALUES (20, '无间道', '刘伟强,麦兆辉', '麦兆辉,庄文强', '刘德华,梁朝伟,黄秋生,曾志伟,郑秀文,陈慧琳,陈冠希,余文乐,杜汶泽,林家栋,萧亚轩', '', '', '2002-12-12(中国香港),2003-09-05(中国大陆)', '剧情,悬疑,犯罪', '101分钟', '/ 97分钟(导演剪辑版)', 20, '9.2', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2564556863.jpg');
INSERT INTO `movie_moviedetail` VALUES (21, '龙猫', '宫崎骏', '宫崎骏', '日高法子,坂本千夏,糸井重里,岛本须美,北林谷荣,高木均,雨笠利幸,丸山裕子,广濑正志,鹫尾真知子,铃木玲子,千叶繁,龙田直树,鳕子,西村朋纮,石田光子,神代知衣,中村大树,水谷优子,平松晶子,大谷育江', '', '', '2018-12-14(中国大陆),1988-04-16(日本)', '动画,奇幻,冒险', '86分钟', '', 22, '9.2', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2540924496.jpg');
INSERT INTO `movie_moviedetail` VALUES (22, '触不可及', '奥利维埃·纳卡什,埃里克·托莱达诺', '奥利维埃·纳卡什,埃里克·托莱达诺', '弗朗索瓦·克鲁塞,奥玛·希,安娜·勒尼,奥德雷·弗勒罗,托马·索利韦尔', '法国', '法语', '2011-11-02(法国)', '剧情,喜剧', '112分钟', '', 25, '9.2', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1454261925.jpg');
INSERT INTO `movie_moviedetail` VALUES (23, '怦然心动', '罗伯·莱纳', '罗伯·莱纳,安德鲁·沙因曼,文德琳·范·德拉安南', '玛德琳·卡罗尔,卡兰·麦克奥利菲,瑞贝卡·德·莫妮,安东尼·爱德华兹,约翰·马奥尼,佩内洛普·安·米勒,艾丹·奎因,凯文·韦斯曼,摩根·莉莉,瑞安·克茨纳,吉莉安·普法夫,迈克尔·博萨,博·勒纳,杰奎琳·埃沃拉,泰勒·格鲁秀斯,艾莉·布莱恩特,阿什莉·泰勒,伊瑟尔·布罗萨德,科迪·霍恩,迈克尔·博尔顿,肖恩·哈珀,斯戴芬妮·斯考特,帕特丽夏·伦茨,马修·戈尔德,阿罗拉·凯瑟琳·史密斯,凯莉·唐纳利,索菲亚·撒高,米歇尔·梅斯默,斯科特·乔尔·吉兹基,罗德·迈尔斯,卡拉 帕西托,凯特琳·帕西托', '', '', '2010-07-26(好莱坞首映),2010-09-10(美国)', '剧情,喜剧,爱情', '90分钟', '', 24, '9.1', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p501177648.jpg');
INSERT INTO `movie_moviedetail` VALUES (24, '当幸福来敲门', '加布里埃莱·穆奇诺', '斯蒂夫·康拉德', '威尔·史密斯,贾登·史密斯,坦迪·牛顿,布莱恩·豪威 ,詹姆斯·凯伦,丹·卡斯泰兰尼塔,柯特·富勒,塔卡尤·费舍尔,凯文·韦斯特,乔治·张,戴维·迈克尔·西尔弗曼,多米尼克·博夫,杰弗·卡伦,乔伊芙·拉文,斯科特·克拉斯', '', '', '2008-01-17(中国大陆),2020-07-20(中国大陆重映),2006-12-15(美国)', '剧情,家庭,传记', '117分钟', '', 23, '9.1', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2614359276.jpg');
INSERT INTO `movie_moviedetail` VALUES (25, '教父', '弗朗西斯·福特·科波拉', '马里奥·普佐,弗朗西斯·福特·科波拉', '马龙·白兰度,阿尔·帕西诺,詹姆斯·肯恩,理查德·卡斯特尔诺,罗伯特·杜瓦尔,斯特林·海登,约翰·马利,理查德·康特,艾尔·勒提埃里,黛安·基顿,阿贝·维高达,塔莉娅·夏尔,吉亚尼·罗素,约翰·凯泽尔,鲁迪·邦德,兰尼·蒙大拿', '美国', '英语 / 意大利语 / 拉丁语', '1972-03-15(纽约首映),1972-03-24(美国)', '剧情,犯罪', '175 分钟', 'Mario Puzo\'s The Godfather', 21, '9.3', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p616779645.jpg');

SET FOREIGN_KEY_CHECKS = 1;
