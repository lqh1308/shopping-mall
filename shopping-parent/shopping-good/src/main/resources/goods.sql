-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping_good
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `banner_wall`
--

DROP TABLE IF EXISTS `banner_wall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodCategory` int(11) DEFAULT NULL COMMENT '商品类目',
  `goodId` int(11) DEFAULT NULL COMMENT '商品id',
  `imgUrl` varchar(100) NOT NULL COMMENT '图片地址',
  `weight` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_wall`
--

LOCK TABLES `banner_wall` WRITE;
/*!40000 ALTER TABLE `banner_wall` DISABLE KEYS */;
INSERT INTO `banner_wall` VALUES (1,21,NULL,'/view/default/images/banner/4c9a8e0cc29395d1980500592c671b93_b.jpg',1),(2,21,NULL,'/view/default/images/banner/476bbb34a7a5e6a4645df8463ddea02a_b.jpg',2),(3,21,NULL,'/view/default/images/banner/d4f739418f78e155ae42e276a283ccc8_b.jpg',3),(4,21,NULL,'/view/default/images/banner/f5c4079eb966eb0be52405f9392b01bf_b.jpg',4),(5,21,NULL,'/view/default/images/banner/de5a8e9f29cf2bb1edcf404a28320d14_b.jpg',5);
/*!40000 ALTER TABLE `banner_wall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '品牌名称',
  `logo` varchar(100) DEFAULT NULL COMMENT '品牌logo',
  `relatedGoodsCategory` varchar(45) DEFAULT NULL COMMENT '关联商品类目',
  `website` varchar(45) DEFAULT NULL COMMENT '品牌网址',
  `introduction` text COMMENT '品牌简介',
  `isRecommended` int(11) NOT NULL COMMENT '是否推荐',
  `weight` int(11) DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Huawei','/view/default/images/brandLogo/2cb578d092f604d4e452143a25e4fae3.jpg','2',NULL,NULL,1,1),(2,'iPhone','/view/default/images/brandLogo/b448c9d070bf2fce1c2286fb41b01dce.jpg','2',NULL,NULL,1,2),(3,'oppo','/view/default/images/brandLogo/02aad63a947ebdef7f2e255e2053430a.jpg','2',NULL,NULL,1,3),(4,'三星','/view/default/images/brandLogo/164a926c1613e48b99c4e70164eb07b0.jpg','2',NULL,NULL,0,5),(5,'vivo','/view/default/images/brandLogo/2416a0588f03b9ffacb80b5476bc8e9c.jpg','2',NULL,NULL,1,4),(6,'小米','/view/default/images/brandLogo/182546f99da8ba0dba7803acf50ba469.jpg','2',NULL,NULL,1,6),(7,'魅族','/view/default/images/brandLogo/409ac701da3588fcd69947af55cb5481.jpg','2',NULL,NULL,0,7),(8,'匡威','/view/default/images/brandLogo/15deecc4835d28078dc9de8c565ab9b5.jpg','4',NULL,NULL,1,1),(9,'puma','/view/default/images/brandLogo/c3c207a6a26c5821eaf812742fe68cd3.jpg','4',NULL,NULL,0,4),(10,'耐克','/view/default/images/brandLogo/1057540e57c928a5d9cfdd5a996acf5c.jpg','4',NULL,NULL,1,2),(11,'鸿新尔克','/view/default/images/brandLogo/e45bb8e8046923a2e4fd72fb4fe234a1.jpg','4',NULL,NULL,1,3),(12,'一叶子','/view/default/images/brandLogo/6a481838907adbe07b483f87f1b2cb92.jpg','3',NULL,NULL,0,1),(13,'无印良品','/view/default/images/brandLogo/e6e9bda77d4af55206f9737dcd80ca8a.jpg','6',NULL,NULL,1,1),(14,'卡姿兰','/view/default/images/brandLogo/dea0c478c9ae046565e64001fa8faa78.jpg','3',NULL,NULL,0,4),(15,'良品铺子','/view/default/images/brandLogo/c76415ed052169ce661fbf56512e490f.jpg','5',NULL,NULL,1,1),(16,'湾仔码头','/view/default/images/brandLogo/88ac39d5f1fb497d07a868e718f228e0.jpg','5',NULL,NULL,0,3),(17,'清扬','/view/default/images/brandLogo/a16956d2dbf2003caaa64e450993b4fc.jpg','3',NULL,NULL,1,2),(18,'善存','/view/default/images/brandLogo/256dd412704e905226542652f3096c75.jpg','3',NULL,NULL,1,3);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `goodId` int(11) NOT NULL COMMENT '商品id',
  `purchaseNum` int(11) NOT NULL COMMENT '购买数量',
  `purchasePrice` int(11) NOT NULL COMMENT '购买时候的价格',
  `isCollected` int(11) DEFAULT '0' COMMENT '是否收藏，0表示未收藏， 1已收藏',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (5,1,1,1,278800,0,'2019-08-31 16:37:15','2019-08-31 16:37:15');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_info`
--

DROP TABLE IF EXISTS `category_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_info` (
  `cgy_id` bigint(12) NOT NULL COMMENT 'id规则：一级4位数，二级8位数，三级12位数，二级父类是前四位数id的如此类推',
  `p_cgy_id` bigint(12) DEFAULT NULL COMMENT '上级id，即自己id的前段',
  `title` varchar(50) NOT NULL COMMENT '分类名字',
  `code` varchar(50) DEFAULT NULL COMMENT '分类代码',
  `level` smallint(6) DEFAULT NULL COMMENT '等级',
  `logo` varchar(100) DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '包含的商品类型，多个类型用“,”分割',
  `weight` int(11) DEFAULT '10' COMMENT '权重，排序用，默认权重10，权重越小排前头，搜索的时候order by这个',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `author` varchar(50) DEFAULT NULL COMMENT '创建人',
  `updated` datetime DEFAULT NULL COMMENT '最近修改时间',
  `last_modifier` varchar(50) DEFAULT NULL COMMENT '最后修改人category_info',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '是否激活',
  PRIMARY KEY (`cgy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_info`
--

LOCK TABLES `category_info` WRITE;
/*!40000 ALTER TABLE `category_info` DISABLE KEYS */;
INSERT INTO `category_info` VALUES (0,NULL,'顶级分类','topCategory',0,NULL,'',1,'2019-08-22 17:38:15','admin','2019-08-22 17:38:15','admin',1),(1000,0,'数码电器','digital',1,'/view/default/images/goodLogo/e178f8aeafc39bf71ad98afdab5a672a.jpg','',1,'2019-08-22 17:38:15','admin','2019-08-22 17:38:15','admin',1),(1001,0,'美妆个护','makeup',1,'/view/default/images/goodLogo/9b742983c15b2967864cccce936a2618.jpg','',2,'2019-08-22 17:38:15','admin','2019-08-22 17:38:15','admin',1),(1002,0,'运动户外','sport',1,'/view/default/images/goodLogo/7d67060903e3f2c779a26e8cd9eacf74.png','',3,'2019-08-22 17:38:15','admin','2019-08-22 17:38:15','admin',1),(1003,0,'美食天地','food',1,'/view/default/images/goodLogo/a38081b141e446db9c438a805ee66488.jpg','',4,'2019-08-22 17:38:15','admin','2019-08-22 17:38:15','admin',1),(1004,0,'家具家饰','decorating',1,'/view/default/images/goodLogo/89917c92df6297ba47028daaae973f29.jpg','',5,'2019-08-22 17:38:15','admin','2019-08-22 17:38:15','admin',1),(10000000,1000,'电脑办公','computer',2,NULL,'',1,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10000001,1000,'移动穿戴','mobileWear',2,NULL,'',2,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10000002,1000,'手机数码','mobileDigital',2,NULL,'',3,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10000003,1000,'外设','peripheral',2,NULL,'',4,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10010000,1001,'化妆用品','cosmetic',2,NULL,'',1,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10010001,1001,'洗浴护理','bathe',2,NULL,'',2,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10010002,1001,'保健品','healthcare',2,NULL,'',3,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10020000,1002,'器材','apparatu',2,NULL,'',1,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10020001,1002,'箱包','bags',2,NULL,'',2,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10020002,1002,'鞋子','shose',2,NULL,'',3,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10030000,1003,'生鲜','fresh',2,NULL,'',1,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10030001,1003,'零食','snacks',2,NULL,'',2,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10040000,1004,'家具','furniture',2,NULL,'',1,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10040001,1004,'家饰','decoration',2,NULL,'',2,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(10040002,1004,'工具','tool',2,NULL,'',3,'2019-08-22 17:38:33','admin','2019-08-22 17:38:33','admin',1),(100000000000,10000000,'台式','desktopComputer',3,NULL,'',1,'2019-08-22 17:39:53','admin','2019-08-22 17:39:53','admin',1),(100000000001,10000000,'笔记本','laptop',3,NULL,'',2,'2019-08-22 17:39:53','admin','2019-08-22 17:39:53','admin',1),(100000010000,10000001,'手环','mobileBracel',3,NULL,'',10,'2019-08-22 17:39:53','admin','2019-08-22 17:39:53','admin',1),(100000010001,10000001,'手机','mobilePhone',3,NULL,'',10,'2019-08-22 17:39:53','admin','2019-08-22 17:39:53','admin',1);
/*!40000 ALTER TABLE `category_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collector`
--

DROP TABLE IF EXISTS `collector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `goodId` int(11) NOT NULL COMMENT '商品id',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`,`goodId`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collector`
--

LOCK TABLES `collector` WRITE;
/*!40000 ALTER TABLE `collector` DISABLE KEYS */;
INSERT INTO `collector` VALUES (74,1,2,'2019-08-29 12:18:00');
/*!40000 ALTER TABLE `collector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `subName` varchar(100) DEFAULT NULL COMMENT '副名称',
  `category` bigint(12) NOT NULL COMMENT '商品类目',
  `logo` varchar(100) DEFAULT NULL COMMENT '商品主图',
  `detailPic` varchar(100) DEFAULT NULL COMMENT '细节图片',
  `brand` int(11) DEFAULT NULL COMMENT '品牌',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `warningStock` int(11) DEFAULT '0' COMMENT '预警库存',
  `weight` int(11) DEFAULT '0' COMMENT '重量（g）',
  `customSales` int(11) DEFAULT '0' COMMENT '自定义销量',
  `salePrice` int(11) NOT NULL COMMENT '销售价格（分为单位）',
  `originalPrice` int(11) DEFAULT '0' COMMENT '原价（分为单位）',
  `costPrice` int(11) DEFAULT '0' COMMENT '商品成本价（分为单位）',
  `giftIntegral` int(11) DEFAULT '0' COMMENT '赠送积分',
  `isOnShelf` int(11) NOT NULL DEFAULT '1' COMMENT '0、1 （0表示未上架1表示已经上架）',
  `onShelfTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `offSheltTime` datetime DEFAULT NULL COMMENT '下架时间',
  `promotionType` varchar(50) DEFAULT NULL COMMENT '(0, 1, 2, 3, 4)促销：0-热卖、1-新品、2-精品、3-推荐、4-包邮 可以组合',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `describe` text COMMENT '描述',
  `sortWeight` int(11) DEFAULT '10' COMMENT '排序权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (1,'华为 HUAWEI P10 4G智能手机 钻雕金【现货】 全网通 4G +64G 标配',NULL,100000010001,'/view/default/images/goodImages/b1ffbbbcc2755b5e7c8d2171f42e659b.jpg',NULL,1,1000,0,0,0,378800,378800,378800,0,1,'2019-08-22 12:12:34',NULL,'0','华为手机',NULL,4),(2,'华为 HUAWEI P10 4G智能手机 钻雕金【现货】 全网通 4G +64G 标配',NULL,100000010001,'/view/default/images/goodImages/33fa960831e505264aa2b2cf181ae025_s.jpg',NULL,1,1300,0,0,0,278800,278800,278800,0,1,'2019-08-22 12:14:12',NULL,'2','华为手机麦芒',NULL,5);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(100) NOT NULL COMMENT '订单id',
  `goodId` int(11) NOT NULL COMMENT '商品id',
  `price` int(11) NOT NULL COMMENT '购买时商品价格',
  `num` int(11) NOT NULL COMMENT '购买数量',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES (59,'20190831112751dd5579bf-300b-40d1-a4d0-8962b5b53e2a',1,278800,2,'2019-08-31 11:27:53'),(60,'20190831112751dd5579bf-300b-40d1-a4d0-8962b5b53e2a',2,280000,1,'2019-08-31 11:27:53'),(61,'201908311149319d14b49a-3e2d-4d9d-b141-119b342f6750',1,278800,2,'2019-08-31 11:49:32'),(62,'201908311149319d14b49a-3e2d-4d9d-b141-119b342f6750',2,280000,1,'2019-08-31 11:49:32'),(63,'201908311151149c2005b2-61d6-455c-8019-090cd6577374',1,278800,2,'2019-08-31 11:51:14'),(64,'201908311151149c2005b2-61d6-455c-8019-090cd6577374',2,280000,1,'2019-08-31 11:51:14'),(65,'20190831120006ae065248-b142-4d57-b661-5864c24335ce',2,280000,1,'2019-08-31 12:00:07'),(66,'20190831120006ae065248-b142-4d57-b661-5864c24335ce',1,278800,2,'2019-08-31 12:00:07'),(67,'20190831120032c68e86fa-38e7-4282-a958-c877eddc13ff',1,278800,2,'2019-08-31 12:00:32'),(68,'20190831120032c68e86fa-38e7-4282-a958-c877eddc13ff',2,280000,1,'2019-08-31 12:00:32'),(69,'201908311201471b155a5c-230a-4c67-b370-a3d7f4bb4521',1,278800,2,'2019-08-31 12:01:48'),(70,'201908311201471b155a5c-230a-4c67-b370-a3d7f4bb4521',2,280000,1,'2019-08-31 12:01:48'),(71,'201908311202349c7c838e-ba2d-4a4a-849c-3cdae76e9174',1,278800,2,'2019-08-31 12:02:34'),(72,'201908311202349c7c838e-ba2d-4a4a-849c-3cdae76e9174',2,280000,1,'2019-08-31 12:02:34'),(73,'2019083112025896127916-ae43-413a-8f66-62f741fc81cb',1,278800,2,'2019-08-31 12:02:58'),(74,'2019083112025896127916-ae43-413a-8f66-62f741fc81cb',2,280000,1,'2019-08-31 12:02:58'),(75,'20190831121047dceab168-1971-4846-a583-d5f04872ae46',2,280000,1,'2019-08-31 12:10:48'),(76,'20190831122553257c38e8-8829-47a5-b35b-602d2f8227ee',2,280000,1,'2019-08-31 12:25:53'),(77,'201908311330361f6ab41c-1f3a-4e3c-b12f-77d7782143fb',2,280000,1,'2019-08-31 13:30:38'),(78,'20190831133404b08fad82-3df5-437e-a6a7-3c39991e0c72',1,278800,2,'2019-08-31 13:34:04'),(79,'201908311611566db7021b-400c-49b2-8f1d-ff0ade1449ef',1,278800,1,'2019-08-31 16:11:56'),(80,'201908311611566db7021b-400c-49b2-8f1d-ff0ade1449ef',2,280000,1,'2019-08-31 16:11:56'),(81,'20190831161344b099456f-b63b-4316-86bc-7e2ecc380617',1,278800,1,'2019-08-31 16:13:44'),(82,'20190831161344b099456f-b63b-4316-86bc-7e2ecc380617',2,280000,1,'2019-08-31 16:13:44'),(83,'20190901141930ce844cff-6a7c-4c35-b136-a11e6eec385d',2,280000,1,'2019-09-01 14:19:31'),(84,'20190901145310a34ecf85-d966-483c-aaeb-f3ca56919169',2,280000,1,'2019-09-01 14:53:11');
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-01 16:52:05
