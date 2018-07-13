-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter` (
  `chID` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `pos_id` int(11) NOT NULL,
  `pID` int(11) NOT NULL,
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `isread` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `FK_comment` (`id`),
  KEY `FK_belong` (`pos_id`,`pID`),
  CONSTRAINT `FK_belong` FOREIGN KEY (`pos_id`, `pID`) REFERENCES `post` (`id`, `pID`),
  CONSTRAINT `FK_comment` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (10003,11111,1,1,'牛逼','2018-07-08 15:34:44',0),(11111,11111,1,2,'??','2018-07-11 09:29:39',0),(10000,11111,1,3,'hahaha','2018-07-11 14:53:18',0),(11111,10000,10,4,'123','2018-07-13 09:37:58',0);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compose1`
--

DROP TABLE IF EXISTS `compose1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compose1` (
  `qID` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `hID` int(11) NOT NULL,
  PRIMARY KEY (`qID`,`id`,`hID`),
  KEY `FK_compose1` (`qID`),
  KEY `FK_compose2` (`id`,`hID`),
  CONSTRAINT `FK_compose1` FOREIGN KEY (`qID`) REFERENCES `question` (`qID`),
  CONSTRAINT `FK_compose2` FOREIGN KEY (`id`, `hID`) REFERENCES `homework` (`id`, `hID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compose1`
--

LOCK TABLES `compose1` WRITE;
/*!40000 ALTER TABLE `compose1` DISABLE KEYS */;
INSERT INTO `compose1` VALUES (4,10000,4),(4,10000,5),(5,10000,4),(6,10000,4),(7,10000,4),(8,10000,4),(9,10000,4),(10,10000,4),(11,10000,4),(12,10000,4),(13,10000,4),(14,10000,4),(14,10000,5),(15,10000,4),(16,10000,4),(17,10000,4),(18,10000,4),(19,10000,4),(20,10000,4),(21,10000,4),(22,10000,4),(23,10000,4),(23,10000,5),(25,10000,4),(26,10000,4),(27,10000,4),(31,10000,4);
/*!40000 ALTER TABLE `compose1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compose2`
--

DROP TABLE IF EXISTS `compose2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compose2` (
  `id` int(11) NOT NULL,
  `tID` int(11) NOT NULL,
  `qID` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tID`,`qID`),
  KEY `FK_compose4` (`qID`),
  CONSTRAINT `FK_compose4` FOREIGN KEY (`qID`) REFERENCES `question` (`qID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compose2`
--

LOCK TABLES `compose2` WRITE;
/*!40000 ALTER TABLE `compose2` DISABLE KEYS */;
INSERT INTO `compose2` VALUES (2,2,4),(2,4,4),(2,5,4),(2,2,5),(2,2,6),(2,2,7),(2,2,8),(2,2,9),(2,2,10),(2,2,11),(2,2,12),(2,2,13),(2,3,13),(2,2,14),(2,3,14),(2,4,14),(2,2,15),(2,3,15),(2,4,15),(2,2,16),(2,4,16),(2,2,17),(2,4,17),(2,2,18),(2,4,18),(2,2,19),(2,4,19),(2,4,20),(2,4,21),(2,2,22),(2,4,22),(2,2,23),(2,4,23),(2,4,25),(2,2,26);
/*!40000 ALTER TABLE `compose2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compose3`
--

DROP TABLE IF EXISTS `compose3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compose3` (
  `qID` int(11) NOT NULL,
  `chID` int(11) NOT NULL,
  PRIMARY KEY (`qID`,`chID`),
  KEY `FK_compose6` (`chID`),
  CONSTRAINT `FK_compose6` FOREIGN KEY (`chID`) REFERENCES `chapter` (`chID`),
  CONSTRAINT `FK_compose7` FOREIGN KEY (`qID`) REFERENCES `question` (`qID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compose3`
--

LOCK TABLES `compose3` WRITE;
/*!40000 ALTER TABLE `compose3` DISABLE KEYS */;
/*!40000 ALTER TABLE `compose3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware`
--

DROP TABLE IF EXISTS `courseware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware` (
  `id` int(11) NOT NULL,
  `couID` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`couID`),
  CONSTRAINT `FK_upload` FOREIGN KEY (`id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware`
--

LOCK TABLES `courseware` WRITE;
/*!40000 ALTER TABLE `courseware` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `do`
--

DROP TABLE IF EXISTS `do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `do` (
  `hom_id` int(11) NOT NULL,
  `hID` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `grade` int(11) DEFAULT '-1',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hom_id`,`hID`,`id`),
  KEY `FK_do2` (`id`),
  CONSTRAINT `FK_do` FOREIGN KEY (`hom_id`, `hID`) REFERENCES `homework` (`id`, `hID`),
  CONSTRAINT `FK_do2` FOREIGN KEY (`id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `do`
--

LOCK TABLES `do` WRITE;
/*!40000 ALTER TABLE `do` DISABLE KEYS */;
INSERT INTO `do` VALUES (10000,4,2001,'2018-07-15 10:00:00',-1,'the 4th homework'),(10000,4,11111,'2018-07-15 10:00:00',0,'the 4th homework'),(10000,5,2001,'2018-07-15 10:00:00',-1,'5th'),(10000,5,11111,'2018-07-15 10:00:00',0,'5th');
/*!40000 ALTER TABLE `do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor`
--

DROP TABLE IF EXISTS `editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editor` (
  `id` int(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Inheritance_5` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor`
--

LOCK TABLES `editor` WRITE;
/*!40000 ALTER TABLE `editor` DISABLE KEYS */;
INSERT INTO `editor` VALUES (10001,'123','女','editor','李四');
/*!40000 ALTER TABLE `editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `tes_id` int(11) NOT NULL,
  `tID` int(11) NOT NULL,
  `deadline` date DEFAULT NULL,
  `grade` int(11) DEFAULT '-1',
  `time` time DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (2001,2,4,'2018-09-01',-1,'12:00:00','1st test'),(10000,2,2,NULL,-1,NULL,'2nd'),(11111,2,3,'2018-09-01',0,'00:00:00','3rd'),(11111,2,4,'2018-09-01',6,'12:00:00','4th');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `hID` int(11) NOT NULL,
  PRIMARY KEY (`id`,`hID`),
  CONSTRAINT `FK_set` FOREIGN KEY (`id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (10000,1),(10000,2),(10002,3);
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `nID` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `rev_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `isreleased` tinyint(1) DEFAULT '0',
  `etime` datetime DEFAULT NULL,
  `rtime` datetime DEFAULT NULL,
  PRIMARY KEY (`nID`),
  KEY `FK_editor` (`id`),
  KEY `FK_edit` (`id`),
  KEY `FK_review` (`rev_id`),
  CONSTRAINT `FK_edit` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_review` FOREIGN KEY (`rev_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,10001,10003,'“面向电网需求的储能系统规划-运行-调控关键技术”专辑征稿启事','储能技术因其时序能量调节作用，改变了传统电力系统发输配用同时性问题，正深刻变革着我国电力与能源结构。目前，国家发改委、国家电网有限公司和各级地方行业管理部门均已出台了多项鼓励储能发展的政策措施，其中江苏电网在用户侧、新能源侧、电网侧建成和在建了数百兆瓦多类型储能系统。可以预见储能技术与应用将成为风/光等清洁能源之后，电力能源行业发展的又一关键内生推动力，储能的发展已经进入一个全新的阶段，将对电网运行方式以及经济性产生重大影响。因此，迫切需要研究储能系统在电网典型应用场景中的优化配置、储能系统接入电网的运行优化技术及调度控制策略、“机储”/“光储”/“风储”等系统的协同控制策略、储能与电网共赢的商业模式和价格机制，为储能系统切实发挥提高系统灵活性、提升电网运行效率和支撑电网安全稳定等提供支撑。\n\n为探讨储能技术在电网中的发展与应用，推动该领域的深入研究，共享学术和技术成果，《电力系统自动化》编辑部特邀中国电力科学研究院李建林教授级高级工程师和华中科技大学文劲宇教授担任特约主编，主持“面向电网需求的储能系统规划-运行-调控关键技术”专辑，希望与作者、读者一起，共同研讨相关领域的新理论、新技术、新应用，共同促进中国电力与能源的发展。专辑拟于2019年初出版。\n\n一、   专辑征稿范围 (包括但不限于)\n\n1. 面向电网需求的储能系统规划、配置理论方法\n\n2. 面向电网需求的储能系统运行控制技术\n\n3. 储能系统参与电网调峰、调频、调压、电能质量治理和事故紧急支撑技术\n\n4. 规模化储能接入电网的调度技术\n\n5. 主动配电网架构下储能等多种柔性资源的优化配置与协调运行\n\n6. 储能系统在综合能源多能互补系统中的应用技术\n\n7. 储能系统商业模式和价格机制探索\n\n二、投稿要求\n\n1. 重点突出、结构合理、言简意赅，字数以6000字（包括图表）以内为宜。\n\n2. 围绕近两年相关课题热点、难点问题开展研究，能充分反映储能在电力系统应用方面的理论研究与技术发展态势。\n\n3. 技术路线和设计方案叙述清楚，理论联系实际，有独到见解与实用价值，数据合理并被正确地分析解释，论点、论据和结论清晰明确。\n\n4. 所投论文未在公开媒体上发表。\n\n5. 来稿请用Word排版，格式与《电力系统自动化》要求一致。\n\n三、投稿方式\n\n请登录http://www.aeps-info.com注册作者用户名和密码投稿，投稿栏目请选择“面向电网需求的储能系统规划-运行-调控关键技术”。真诚欢迎国内外相关领域的专家学者踊跃投稿！\n\n四、论文提交时间\n\n征文截止日期： 2018年8月15日\n\n五、联系方式\n\n联系人：孔丽蓓，李建林，文劲宇\n\n联系电话：025-81093058\n\n邮 箱：konglibei@sgepri.sgcc.com.cn；dkyljl@163.com；jinyu.wen@hust.edu.cn',1,'2018-07-07 21:30:18','2018-07-08 21:30:26'),(2,10001,10003,'中国电机工程学会电力市场专业委员会\n\n2018年学术年会征文通知','各有关单位：\n\n2018年，电力市场改革逐渐走入“快车道”与“深水区”！规划设计适应中国国情的电力市场体系和改革路径，并建立科学的电力市场运营技术支撑体系、技术标准体系和实验验证手段，是我国电力市场改革面临的挑战和关键任务，也是学术界普遍关注的问题。\n\n为有效引导电力市场领域的学术研究和工业应用潮流，进一步加强学术交流，中国电机工程学会电力市场专业委员会决定于2018年9月召开学术年会，欢迎电力市场领域的专家学者、科研人员及高校师生踊跃投稿。会议将邀请业内知名院士、专家、教授就广泛关注的热点问题做主旨发言，并开展专题交流讨论。\n\n现将会议征文的有关事宜通知如下：\n\n一、专辑征稿范围（包括但不限于）\n\n1.电力市场体制、机制与模式;\n\n2.电力市场运营、分析与评估;\n\n3.电力市场技术、标准和系统平台;\n\n4.电力市场成员竞价、决策和博弈;\n\n5.电力市场实验、模拟和仿真。\n\n二、投稿要求\n\n1.论文应为作者首发稿件，论点明确，条理分明，要突出本文创造性的工作。\n\n2.研究方法叙述清楚，数据合理，分析和解释正确；比较所提出的方法和现有方法的优缺点。\n\n3.来稿前请严格按论文模板用Word排版，论文模板请至会议网站下载。\n\n4.本刊发表的学术论文文责自负。凡涉及与专利权有关的科技信息和国家科学技术信息保密规定的，由作者审查，责任自负。\n\n三、投稿方式\n\n请至网站http://meeting.aeps.cc/cn/cseedlsc2018实名注册、准确填写手机号码及邮箱，并完成投稿，投稿时请注意选择拟投栏目。请务必使用年会提供的模板投稿，模板请至网站下载。\n\n真诚欢迎国内外相关领域的专家学者踊跃投稿！\n\n四、论文提交时间\n\n征文截止日期：2018年7月15日\n\n录用通知日期：2018年8月15日\n\n录取论文全部入选专委会学术论文集，优秀论文将现场表彰，并推荐至《电力系统自动化》期刊，鼓励投稿英文稿件，优秀论文将推荐至《Journal of Modern Power Systems and Clean Energy》期刊。诚挚邀请电网公司、高等院校、研究所、设备厂家以及有关单位的专家、技术人员踊跃投稿并参加会议。\n\n五、会议时间地点及联系人\n\n1. 2018年9月，具体日期及地点待定。\n\n2. 联系人：\n\n南瑞集团期刊中心：杨松迎：025-81093046\n\n专委会秘书处：    杨红菊：025-83095633',1,'2018-07-08 21:31:17','2018-07-10 10:53:54'),(3,10001,10003,'“人工智能在电力系统及综合能源系统中的应用”\n\n专辑征稿启事\n\n ','为推进能源生产和消费革命，构建清洁低碳安全高效的能源体系，需要发展更加智能的电力系统。目前，人工智能的发展已经进入一个全新的阶段，成为当前最具颠覆性的科学技术之一，在智能电网、智能制造等领域具有广阔的应用前景，将带动国家竞争力整体跃升和跨越式发展。2017年7月，国务院印发《新一代人工智能发展规划》，将人工智能提升到国家战略层面。新一代人工智技术在感知智能、计算智能和认知智能方面表现出的强处理能力，将有助于改变能源传统利用模式，在电力系统及综合能源系统的规划、建设、生产运行、调度控制以及经营管理、市场交易和客户服务中发挥重要作用，推动能源革命。\n\n为探讨人工智能技术在电力系统及综合能源系统中的发展与应用，推动在该领域的深入研究，共享学术和技术成果，《电力系统自动化》编辑部特邀南京邮电大学岳东教授、天津大学杨挺教授和全球能源互联网研究院所长兼国家电网公司人工智能实验室主任高昆仑教高担任联合特约主编（排名不分先后），主持“人工智能在电力系统及综合能源系统中的应用”专辑，希望与作者、读者一起，共同研讨相关领域的新理论、新技术、新应用，共同促进中国电力的智能化发展。专辑拟于2018年年内尽早出版。\n\n一、   专辑征稿范围 (包括但不限于)\n\n1. 新一代人工智能基础理论与方法\n\n2. 人工智能在电力系统及综合能源系统规划建设中的应用\n\n3. 人工智能在电力系统及综合能源系统优化调度中的应用\n\n4. 人工智能在新能源接入及消纳中的应用\n\n5. 人工智能在能源大数据分析与数据挖掘中的应用\n\n6. 人工智能在电力市场中的应用\n\n7. 人工智能在电力设备故障诊断和状态评估中的应用\n\n8. 人工智能在电力系统仿真及安全控制中的应用\n\n9. 人工智能在能源信息物理系统中的应用\n\n10. 人工智能在网络安全与防护中的应用\n\n二、投稿要求\n\n1. 重点突出、结构合理、言简意赅，字数以6000字（包括图表）以内为宜。\n\n2. 围绕近两年相关课题热点、难点问题开展研究，能充分反映人工智能在电力系统及综合能源系统中的应用方面的理论研究与技术发展态势。\n\n3. 技术路线和设计方案叙述清楚，理论联系实际，有独到见解与实用价值，数据合理并被正确地分析解释，论点、论据和结论清晰明确。\n\n4. 所投论文未在公开媒体上发表。\n\n5. 来稿请用Word排版，格式与《电力系统自动化》要求一致。\n\n三、投稿方式\n\n请登录http://www.aeps-info.com注册作者用户名和密码投稿，投稿栏目请选择“人工智能在电力系统及综合能源系统中的应用”。真诚欢迎国内外相关领域的专家学者踊跃投稿！\n\n四、论文提交时间\n\n征文截止日期： 2018年6月30日\n\n五、联系方式\n\n联系人：张 焱，岳 东，杨 挺，高昆仑\n\n联系电话：025-81093045\n\n邮 箱：zhangyan3@sgepri.sgcc.com.cn;yued@njupt.edu.cn;yangting@tju.edu.cn;GKL@geiri.sgcc.com.cn',1,'2018-07-09 11:03:44','2018-07-12 11:03:48'),(4,10001,10003,'test','test',1,'2018-07-12 08:01:05','2018-07-12 10:59:17'),(9,10001,10003,'hello world','Welcome to the machine',1,'2018-07-12 11:16:16','2018-07-12 11:16:29'),(11,10001,10003,'hdheada','sedfgew',1,'2018-07-13 09:30:39','2018-07-13 09:31:02');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `istop` tinyint(1) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`pID`),
  KEY `post_id_index` (`id`),
  CONSTRAINT `post_id_index` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (11111,1,'张三','通知：经公司与带队老师协商，决定7月1日放假一天，7月1日晚23：00收假，6月30日晚离开基地人员统一到室长处登记，在基地人员23：00正常查寝，放假期间注意安全。成都拓思爱诺科技有限公司   2018年6月30日',0,'2018-07-09 21:22:55'),(11111,2,'张三','通知：经公司与带队老师协商，决定7月2日放假一天，7月2日晚23：00收假，6月30日晚离开基地人员统一到室长处登记，在基地人员23：00正常查寝，放假期间注意安全。成都拓思爱诺科技有限公司   2018年6月30日',0,'2018-07-09 21:22:58'),(10000,10,'张三','通知：经公司与带队老师协商，决定7月3日放假一天，7月2日晚23：00收假，6月30日晚离开基地人员统一到室长处登记，在基地人员23：00正常查寝，放假期间注意安全。成都拓思爱诺科技有限公司   2018年6月30日',0,'2018-07-09 21:40:48'),(10000,70,'hello world','13',0,'2018-07-12 11:09:51');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `qID` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `answer` text,
  `score` int(11) DEFAULT NULL,
  `optionA` varchar(255) DEFAULT NULL,
  `optionB` varchar(255) DEFAULT NULL,
  `optionC` varchar(255) DEFAULT NULL,
  `optionD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`qID`),
  KEY `FK_devise` (`id`),
  CONSTRAINT `FK_devise` FOREIGN KEY (`id`) REFERENCES `tgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (4,12,'电力安全','多选题','对无法直接验电的设备，应间接验电，即通过设备什么信号的变化来判断。','ABCD',2,'机械位置指示','电气指示','带电显示装置','仪表'),(5,12,'电力安全','多选题','装设同杆（塔）架设的多层电力线路接地线，应','ABC',2,'先装设低压、后装设高压','先装设下层、后装设上层','先装设近侧、后装设远侧','先装设高压、后装设低压'),(6,12,'电力安全','多选题','操作票应用何种颜色的钢（水）笔或圆珠笔逐项填写','AB',2,'黑色','蓝色','红色','绿色'),(7,12,'电力安全','多选题','雨雪、大风天气或事故巡线，巡视人员应穿','BD',2,'绝缘服','绝缘鞋','绝缘手套','绝缘靴'),(8,12,'电力安全','多选题','作业人员有权拒绝','AD',2,'强令冒险作业','标准化作业','规范作业','违章指挥'),(9,12,'电力安全','多选题','放线、紧线前，应检查确认线盘架','ABC',2,'稳固可靠','转动灵活','制动可靠','外观美好'),(10,12,'电力安全','多选题','利用已有杆塔立、撤杆，应检查什么强度。','ABC',2,'杆塔根部','拉线','杆塔','临时地锚'),(11,12,'电力安全','多选题','接入低压配电网的分布式电源，并网点应安装的开断设备应具备下列哪些特点？','ACD',2,'易操作','可闭锁','具有明显开断指示','具备开断故障电流能力'),(12,12,'电力安全','多选题','高压试验不得少于两人，试验负责人应由有经验的人员担任。试验前，试验负责人应向全体试验人员交待','ABC',2,'工作中的安全注意事项','邻近间隔的带电部位','邻近线路设备的带电部位','被试验设备带电情况'),(13,12,'电力安全','多选题','分布式电源项目验收单位在项目并网验收后，应将工程有关的何种资料提交电网管理单位，及时更新系统接线图。','BD',2,'设备资料','技术资料','验收报告','接线图'),(14,12,'调度运行','单选题','已执行的操作票保存时间应为','C',2,'半年','三个月','一年','两年'),(15,12,'调度运行','单选题','高压电气设备为对地电压在','A',2,'1000V及以上','1000V以上','250V及以上','250V以上'),(16,12,'调度运行','单选题','成套接地线应用有透明护套的多股软铜线组成，其截面不得小于多少同时应满足装设地点短路电流的要求','B',2,'20mm2','25mm2','10mm2','30mm2'),(17,12,'调度运行','单选题','当电网发生常见的单一故障时，对电力系统稳定性的要求是','A',2,'电力系统应当保持稳定运行，同时保持对用户的正常供电；','电力系统应当保持稳定运行，但允许损失部分负荷；','系统不能保持稳定运行时，必须有预定的措施以尽可能缩小故障影响范围和缩短影响时间；','在自动调节器和控制装置的作用下，系统维持长过程的稳定运行'),(18,12,'调度运行','单选题','母线差动保护采用电压闭锁元件的主要目的是','C',2,'系统发生振荡时，母线差动保护不会误动；','区外发生故障时，母线差动保护不会误动；','防止误碰出口继电器而造成母线差动保护误动；','进行辅助判据'),(19,12,'调度运行','单选题','从继电保护原理上讲，受系统振荡影响的保护有','C',2,'零序电流保护','负序电流','相间距离保护','差流保护'),(20,12,'调度运行','单选题','线路的过电流保护的起动电流是按什么而整定的','C',2,'该线路的负荷电流','最大的故障电流','躲过最大负荷电流','最大短路电流'),(21,12,'调度运行','单选题','在大电流接地系统中，线路始端发生两相金属性短路接地时，零序方向过流保护中的方向元件将','B',2,'因短路相电压为零而拒动','因感受零序电压最大而灵敏动作','因短路零序电压为零而拒动','因感受零序电压最大而拒动'),(22,12,'调度运行','单选题','变压器瓦斯保护动作原因是由于变压器','A',2,'内部故障','套管故障','电压过高','一、二次之间TA故障'),(23,12,'调度运行','判断题','提检修申请时应说明：停电范围、检修性质、主要项目、检修时间、综合出力、紧急恢复备用时间以及对电网的要求（送电时是否需要核相、保护测方向）等。未经申请及批准手续，不得在设备上工作。','A',2,'','',NULL,NULL),(24,12,'调度运行','判断题','调度电话为调度业务专用电话，非值班人员不得使用，特殊情况，经领导批准除外','A',2,'',NULL,NULL,NULL),(25,12,'调度运行','判断题','值班调度员或运行值班负责人发布倒闸操作指令时应准确、清晰，使用规范的调度术语和设备名称。','B',2,'',NULL,NULL,NULL),(26,12,'调度运行','判断题','各级领导发布的命令如涉及到值班调度员的权限时，必须经值班调度员许可方可能执行。','A',2,'',NULL,NULL,NULL),(27,12,'调度运行','判断题','所有电流互感器和电压互感器的二次绕组应有一点且仅有一点永久性的、可靠的保护接地','A',2,'',NULL,NULL,NULL),(28,12,'调度运行','判断题','调度系统值班人员须经培训、考核合格方得上岗。','B',2,'',NULL,NULL,NULL),(29,12,'调度运行','判断题','需要并网运行的发电厂与电网之间以及电网与电网之间，应当在并网前根据互惠互利的原则签订并网协议并严格执行。','B',2,'',NULL,NULL,NULL),(30,12,'调度运行','判断题','倒闸操作必须根据值班调度员或运行值班负责人的指令，受令人复诵后执行。','B',2,'',NULL,NULL,NULL),(31,12,'调度运行','判断题','二次系统和照明等回路上的工作，无需将高压设备停电者或做安全措施者应填用第二种工作票。','A',2,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer` (
  `id` int(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Inheritance_4` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES (10003,'123','女','reviewer','关九号');
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Inheritance_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2001,'123','female','student','Katty'),(11111,'123','male','student','关七号');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach`
--

DROP TABLE IF EXISTS `teach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teach` (
  `stu_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach`
--

LOCK TABLES `teach` WRITE;
/*!40000 ALTER TABLE `teach` DISABLE KEYS */;
INSERT INTO `teach` VALUES (11111,10000),(11111,10002),(2001,10000),(11111,1103);
/*!40000 ALTER TABLE `teach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Inheritance_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1103,'123','male','teacher','how','Math'),(10000,'123','female','teacher','major','English'),(10002,'123','女','teacher','李金恒','风力学');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testpaper`
--

DROP TABLE IF EXISTS `testpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testpaper` (
  `id` int(11) NOT NULL,
  `tID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testpaper`
--

LOCK TABLES `testpaper` WRITE;
/*!40000 ALTER TABLE `testpaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `testpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgroup`
--

DROP TABLE IF EXISTS `tgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgroup` (
  `id` int(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Inheritance_3` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgroup`
--

LOCK TABLES `tgroup` WRITE;
/*!40000 ALTER TABLE `tgroup` DISABLE KEYS */;
INSERT INTO `tgroup` VALUES (12,'123456','男','教研组','李哲睿','电磁学');
/*!40000 ALTER TABLE `tgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123','male','useradmin','Tom',NULL),(2,'123','male','group','Jackson',''),(4,'2',NULL,'teacher','hasxwzl',NULL),(12,'123456','male','group','李哲睿',NULL),(1103,'123','male','teacher','how','Math'),(2001,'1234','female','student','Katty',NULL),(10000,'123','female','teacher','major','MATH'),(10001,'123','female','editor','李四',NULL),(10002,'123','female','teacher','李金恒','风力学'),(10003,'123','female','reviewer','关九号',NULL),(11111,'123','male','student','关七号',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-13 10:56:33
