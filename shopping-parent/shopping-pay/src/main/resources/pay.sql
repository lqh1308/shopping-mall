-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping_pay
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
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(100) NOT NULL COMMENT '订单号',
  `userId` varchar(20) NOT NULL COMMENT '用户userId',
  `typeId` int(11) DEFAULT NULL COMMENT '支付类型',
  `platformorderId` varchar(50) DEFAULT NULL COMMENT '第三方平台支付id',
  `price` int(11) DEFAULT NULL COMMENT '价格，精度为2',
  `orderTitle` varchar(50) NOT NULL COMMENT '订单名称',
  `orderDescription` varchar(100) DEFAULT NULL COMMENT '订单描述',
  `source` varchar(20) NOT NULL COMMENT '支付来源',
  `state` bigint(20) NOT NULL COMMENT '支付状态（0：未支付 1：已经支付）',
  `payMessage` text COMMENT '第三方平台支付id',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='支付信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_info`
--

LOCK TABLES `payment_info` WRITE;
/*!40000 ALTER TABLE `payment_info` DISABLE KEYS */;
INSERT INTO `payment_info` VALUES (1,'123456','1',1,NULL,1,'购买商品',NULL,'支付宝',0,NULL,'2019-03-11 08:00:00','2019-03-11 08:00:00'),(35,'20190831112751dd5579bf-300b-40d1-a4d0-8962b5b53e2a','1',NULL,NULL,837600,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 11:27:54','2019-08-31 11:27:54'),(36,'201908311149319d14b49a-3e2d-4d9d-b141-119b342f6750','1',NULL,NULL,837600,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 11:49:32','2019-08-31 11:49:32'),(37,'201908311151149c2005b2-61d6-455c-8019-090cd6577374','1',NULL,NULL,837600,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 11:51:14','2019-08-31 11:51:14'),(38,'20190831120006ae065248-b142-4d57-b661-5864c24335ce','1',NULL,NULL,8376,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 12:00:08','2019-08-31 12:00:08'),(39,'20190831120032c68e86fa-38e7-4282-a958-c877eddc13ff','1',NULL,NULL,8376,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 12:00:32','2019-08-31 12:00:32'),(40,'201908311201471b155a5c-230a-4c67-b370-a3d7f4bb4521','1',NULL,NULL,8376,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 12:01:48','2019-08-31 12:01:48'),(41,'201908311202349c7c838e-ba2d-4a4a-849c-3cdae76e9174','1',NULL,NULL,8376,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 12:02:34','2019-08-31 12:02:34'),(42,'2019083112025896127916-ae43-413a-8f66-62f741fc81cb','1',NULL,'2019083122001485761000071079',8376,'商品购买',NULL,'支付宝',1,'{gmt_create=2019-08-31 12:03:45, charset=utf-8, gmt_payment=2019-08-31 12:04:02, notify_time=2019-08-31 12:04:03, subject=商品购买, buyer_id=2088102179285760, body=null, invoice_amount=8376.00, version=1.0, notify_id=2019083100222120402085761000525145, fund_bill_list=[{\"amount\":\"8376.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=2019083112025896127916-ae43-413a-8f66-62f741fc81cb, total_amount=8376.00, trade_status=TRADE_SUCCESS, trade_no=2019083122001485761000071079, auth_app_id=2016100100640424, receipt_amount=8376.00, point_amount=0.00, app_id=2016100100640424, buyer_pay_amount=8376.00, seller_id=2088102178122824}','2019-08-31 12:02:58','2019-08-31 12:04:05'),(43,'20190831121047dceab168-1971-4846-a583-d5f04872ae46','1',NULL,'2019083122001485761000071080',2800,'商品购买',NULL,'支付宝',1,'{gmt_create=2019-08-31 12:10:57, charset=utf-8, gmt_payment=2019-08-31 12:12:09, notify_time=2019-08-31 12:12:11, subject=商品购买, buyer_id=2088102179285760, body=null, invoice_amount=2800.00, version=1.0, notify_id=2019083100222121209085761000525146, fund_bill_list=[{\"amount\":\"2800.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=20190831121047dceab168-1971-4846-a583-d5f04872ae46, total_amount=2800.00, trade_status=TRADE_SUCCESS, trade_no=2019083122001485761000071080, auth_app_id=2016100100640424, receipt_amount=2800.00, point_amount=0.00, app_id=2016100100640424, buyer_pay_amount=2800.00, seller_id=2088102178122824}','2019-08-31 12:10:48','2019-08-31 12:13:17'),(44,'20190831122553257c38e8-8829-47a5-b35b-602d2f8227ee','1',NULL,'2019083122001485761000072712',2800,'商品购买',NULL,'支付宝',1,'{gmt_create=2019-08-31 12:26:04, charset=utf-8, gmt_payment=2019-08-31 12:26:15, notify_time=2019-08-31 12:26:16, subject=商品购买, buyer_id=2088102179285760, body=null, invoice_amount=2800.00, version=1.0, notify_id=2019083100222122615085761000526978, fund_bill_list=[{\"amount\":\"2800.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=20190831122553257c38e8-8829-47a5-b35b-602d2f8227ee, total_amount=2800.00, trade_status=TRADE_SUCCESS, trade_no=2019083122001485761000072712, auth_app_id=2016100100640424, receipt_amount=2800.00, point_amount=0.00, app_id=2016100100640424, buyer_pay_amount=2800.00, seller_id=2088102178122824}','2019-08-31 12:25:53','2019-08-31 12:26:31'),(45,'201908311330361f6ab41c-1f3a-4e3c-b12f-77d7782143fb','1',NULL,NULL,2800,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 13:30:38','2019-08-31 13:30:38'),(46,'20190831133404b08fad82-3df5-437e-a6a7-3c39991e0c72','1',NULL,'2019083122001485761000072713',5576,'商品购买',NULL,'支付宝',1,'{gmt_create=2019-08-31 13:34:13, charset=utf-8, gmt_payment=2019-08-31 13:34:21, notify_time=2019-08-31 13:34:21, subject=商品购买, buyer_id=2088102179285760, body=null, invoice_amount=5576.00, version=1.0, notify_id=2019083100222133421085761000526979, fund_bill_list=[{\"amount\":\"5576.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=20190831133404b08fad82-3df5-437e-a6a7-3c39991e0c72, total_amount=5576.00, trade_status=TRADE_SUCCESS, trade_no=2019083122001485761000072713, auth_app_id=2016100100640424, receipt_amount=5576.00, point_amount=0.00, app_id=2016100100640424, buyer_pay_amount=5576.00, seller_id=2088102178122824}','2019-08-31 13:34:04','2019-08-31 13:34:23'),(47,'201908311611566db7021b-400c-49b2-8f1d-ff0ade1449ef','1',0,NULL,5588,'商品购买',NULL,'支付宝',0,NULL,'2019-08-31 16:11:56','2019-08-31 16:11:56'),(48,'20190831161344b099456f-b63b-4316-86bc-7e2ecc380617','1',0,'2019083122001485761000073769',5588,'商品购买',NULL,'支付宝',1,'{gmt_create=2019-08-31 16:13:54, charset=utf-8, gmt_payment=2019-08-31 16:14:05, notify_time=2019-08-31 16:14:06, subject=商品购买, buyer_id=2088102179285760, body=null, invoice_amount=5588.00, version=1.0, notify_id=2019083100222161405085761000525147, fund_bill_list=[{\"amount\":\"5588.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=20190831161344b099456f-b63b-4316-86bc-7e2ecc380617, total_amount=5588.00, trade_status=TRADE_SUCCESS, trade_no=2019083122001485761000073769, auth_app_id=2016100100640424, receipt_amount=5588.00, point_amount=0.00, app_id=2016100100640424, buyer_pay_amount=5588.00, seller_id=2088102178122824}','2019-08-31 16:13:44','2019-08-31 16:14:08'),(49,'20190901141930ce844cff-6a7c-4c35-b136-a11e6eec385d','1',0,NULL,2800,'商品购买',NULL,'支付宝',0,NULL,'2019-09-01 14:19:32','2019-09-01 14:19:32'),(50,'20190901145310a34ecf85-d966-483c-aaeb-f3ca56919169','1',0,'2019090122001485761000074953',2800,'商品购买',NULL,'支付宝',1,'{gmt_create=2019-09-01 14:53:22, charset=utf-8, gmt_payment=2019-09-01 14:53:32, notify_time=2019-09-01 14:53:32, subject=商品购买, buyer_id=2088102179285760, body=null, invoice_amount=2800.00, version=1.0, notify_id=2019090100222145332085761000529887, fund_bill_list=[{\"amount\":\"2800.00\",\"fundChannel\":\"ALIPAYACCOUNT\"}], notify_type=trade_status_sync, out_trade_no=20190901145310a34ecf85-d966-483c-aaeb-f3ca56919169, total_amount=2800.00, trade_status=TRADE_SUCCESS, trade_no=2019090122001485761000074953, auth_app_id=2016100100640424, receipt_amount=2800.00, point_amount=0.00, app_id=2016100100640424, buyer_pay_amount=2800.00, seller_id=2088102178122824}','2019-09-01 14:53:11','2019-09-01 14:53:33');
/*!40000 ALTER TABLE `payment_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-01 16:56:00
