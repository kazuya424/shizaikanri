-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sizaib
-- ------------------------------------------------------
-- Server version	5.7.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_instock`
--

DROP TABLE IF EXISTS `tbl_instock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_instock` (
  `INSTOCK_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理番号',
  `INSTOCK_DATE` datetime NOT NULL COMMENT '入庫日付',
  `INSTOCK_HANDLER` int(11) NOT NULL COMMENT '入庫入力者',
  `INSTOCK_INPUTUSER` int(11) NOT NULL COMMENT '入庫取扱者',
  `INSTOCK_TYPE` int(11) NOT NULL COMMENT '入庫種別',
  `INSTOCK_COUNT` int(11) NOT NULL COMMENT '入庫枚数',
  `INSTOCK_COMMENT` varchar(45) DEFAULT NULL COMMENT '入庫参考',
  `INSTOCK_REG_ID` int(11) NOT NULL COMMENT '入庫登録者',
  `INSTOCK_REG_DT` datetime NOT NULL COMMENT '入庫登録日',
  `INSTOCK_UPD_ID` int(11) NOT NULL COMMENT '入庫修正者',
  `INSTOCK_UPD_DT` datetime NOT NULL COMMENT '入庫修正日',
  `INSTOCK_IS_DELETE` varchar(45) NOT NULL DEFAULT 'N' COMMENT '入庫削除フラグ',
  PRIMARY KEY (`INSTOCK_SEQ`),
  KEY `FK_INSTOCK_TYPE_idx` (`INSTOCK_TYPE`),
  KEY `FK_INSTOCK_REG_ID_idx` (`INSTOCK_REG_ID`),
  KEY `FK_INSTOCK_UPD_ID_idx` (`INSTOCK_UPD_ID`),
  KEY `FK_INSTOCK_HANDLER_idx` (`INSTOCK_HANDLER`),
  CONSTRAINT `FK_INSTOCK_HANDLER` FOREIGN KEY (`INSTOCK_HANDLER`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_INSTOCK_REG_ID` FOREIGN KEY (`INSTOCK_REG_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_INSTOCK_TYPE` FOREIGN KEY (`INSTOCK_TYPE`) REFERENCES `tbl_stock` (`STOCK_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_INSTOCK_UPD_ID` FOREIGN KEY (`INSTOCK_UPD_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='入庫テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_instock`
--

LOCK TABLES `tbl_instock` WRITE;
/*!40000 ALTER TABLE `tbl_instock` DISABLE KEYS */;
INSERT INTO `tbl_instock` VALUES (1,'2020-07-02 00:00:00',2,1,3,20,'',2,'2020-11-05 09:38:17',2,'2020-11-05 09:38:17','N'),(2,'2020-07-03 00:00:00',3,2,10,5,'',2,'2020-11-05 09:39:04',2,'2020-11-05 09:39:04','N');
/*!40000 ALTER TABLE `tbl_instock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manager`
--

DROP TABLE IF EXISTS `tbl_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_manager` (
  `MANAGER_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理番号',
  `MANAGER_COMPANY` varchar(45) NOT NULL COMMENT '担当者会社',
  `MANAGER_NAME` varchar(45) DEFAULT NULL COMMENT '担当者名前',
  `MANAGER_REG_ID` int(11) NOT NULL COMMENT '担当者登録者',
  `MANAGER_REG_DT` datetime NOT NULL COMMENT '担当者登録日',
  `MANAGER_UPD_ID` int(11) NOT NULL COMMENT '担当者修正者',
  `MANAGER_UPD_DT` datetime NOT NULL COMMENT '担当者修正日',
  `MANAGER_IS_DELETE` varchar(45) NOT NULL DEFAULT 'N' COMMENT '担当者削除フラグ',
  PRIMARY KEY (`MANAGER_SEQ`),
  UNIQUE KEY `UNIQUE` (`MANAGER_COMPANY`,`MANAGER_NAME`),
  KEY `FK_MANAGER_REG_ID_idx` (`MANAGER_REG_ID`),
  KEY `FK_MANAGER_UPD_ID_idx` (`MANAGER_UPD_ID`),
  CONSTRAINT `FK_MANAGER_REG_ID` FOREIGN KEY (`MANAGER_REG_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MANAGER_UPD_ID` FOREIGN KEY (`MANAGER_UPD_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='担当者テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manager`
--

LOCK TABLES `tbl_manager` WRITE;
/*!40000 ALTER TABLE `tbl_manager` DISABLE KEYS */;
INSERT INTO `tbl_manager` VALUES (1,'','すずき',1,'2020-08-19 16:02:13',1,'2020-08-19 16:02:13','N'),(2,'','たかはし',1,'2020-08-19 16:02:28',1,'2020-08-19 16:02:28','N'), (3,'IBS','',1,'2020-08-19 16:02:13',1,'2020-08-19 16:02:13','N'),(4,'JICCO','',1,'2020-08-19 16:02:28',1,'2020-08-19 16:02:28','N');
/*!40000 ALTER TABLE `tbl_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_outgoing`
--

DROP TABLE IF EXISTS `tbl_outgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_outgoing` (
  `OUTGOING_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理番号',
  `OUTGOING_DATE` datetime NOT NULL COMMENT '出庫日付',
  `OUTGOING_DESTINATION` varchar(200) DEFAULT NULL COMMENT '出庫送付先会社',
  `OUTGOING_MANAGER` varchar(200) DEFAULT NULL COMMENT '出庫送付先担当者',
  `OUTGOING_HANDLER` int(11) NOT NULL COMMENT '出庫入力者',
  `OUTGOING_INPUTUSER` int(11) NOT NULL COMMENT '出庫取扱者',
  `OUTGOING_TYPE` int(11) NOT NULL COMMENT '出庫種別',
  `OUTGOING_COUNT` int(11) NOT NULL COMMENT '出庫枚数',
  `OUTGOING_COMPANY` int(11) NOT NULL COMMENT '払出会社',
  `OUTGOING_COMMENT` varchar(200) DEFAULT NULL COMMENT '出庫参考',
  `OUTGOING_CONTENT` varchar(200) NOT NULL COMMENT '出庫内容',
  `OUTGOING_REG_ID` int(11) NOT NULL COMMENT '出庫登録者',
  `OUTGOING_REG_DT` datetime NOT NULL COMMENT '出庫登録日',
  `OUTGOING_UPD_ID` int(11) NOT NULL COMMENT '出庫修正者',
  `OUTGOING_UPD_DT` datetime NOT NULL COMMENT '出庫修正日',
  `OUTGOING_IS_DELETE` varchar(45) NOT NULL DEFAULT 'N' COMMENT '出庫削除フラグ',
  PRIMARY KEY (`OUTGOING_SEQ`),
  KEY `FK_OUTGOING_TYPE_idx` (`OUTGOING_TYPE`),
  KEY `FK_OUTGOING_REG_ID_idx` (`OUTGOING_REG_ID`),
  KEY `FK_OUTGOING_UPD_ID_idx` (`OUTGOING_UPD_ID`),
  KEY `FK_OUTGOING_HANDLER_idx` (`OUTGOING_HANDLER`),
  KEY `FK_OUTGOING_COMPANY_idx` (`OUTGOING_COMPANY`),
  CONSTRAINT `FK_OUTGOING_COMPANY` FOREIGN KEY (`OUTGOING_COMPANY`) REFERENCES `tbl_manager` (`MANAGER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OUTGOING_HANDLER` FOREIGN KEY (`OUTGOING_HANDLER`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OUTGOING_REG_ID` FOREIGN KEY (`OUTGOING_REG_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OUTGOING_TYPE` FOREIGN KEY (`OUTGOING_TYPE`) REFERENCES `tbl_stock` (`STOCK_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OUTGOING_UPD_ID` FOREIGN KEY (`OUTGOING_UPD_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='出庫テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_outgoing`
--

LOCK TABLES `tbl_outgoing` WRITE;
/*!40000 ALTER TABLE `tbl_outgoing` DISABLE KEYS */;
INSERT INTO `tbl_outgoing` VALUES (1,'2020-07-02 00:00:00','A株式会社','加藤',2,1,3,5,3,'','請求書1',2,'2020-11-05 09:49:28',2,'2020-11-05 09:49:28','N'),(2,'2020-07-31 00:00:00','B株式会社','伊藤',3,2,3,3,3,'','請求書2',2,'2020-11-05 09:50:08',3,'2020-11-06 03:17:03','Y'),(3,'2020-08-01 00:00:00','C株式会社','高田',4,3,10,2,4,'','請求書3',2,'2020-11-05 09:51:10',1,'2020-11-10 17:31:30','N');
/*!40000 ALTER TABLE `tbl_outgoing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_post`
--

DROP TABLE IF EXISTS `tbl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_post` (
  `post_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理番号',
  `post_input` datetime NOT NULL COMMENT '郵便入力日付',
  `post_input_user` int(11) NOT NULL COMMENT '郵便取扱者',
  `post_sender` varchar(100) DEFAULT NULL COMMENT '郵便送付元会社名',
  `post_comment` varchar(100) DEFAULT NULL COMMENT '郵便内容',
  `post_company` int(11) NOT NULL COMMENT '郵便配布先会社',
  `post_manager` int(11) NOT NULL COMMENT '郵便配布先担当者',
  `post_remark` varchar(100) DEFAULT NULL COMMENT '郵便備考',
  `post_reg_id` int(11) NOT NULL COMMENT '郵便登録者',
  `post_reg_dt` datetime NOT NULL COMMENT '郵便登録日',
  `post_upd_id` int(11) NOT NULL COMMENT '郵便更新者',
  `post_upd_dt` datetime NOT NULL COMMENT '郵便更新日',
  `post_is_delete` varchar(45) NOT NULL DEFAULT 'N' COMMENT '郵便削除フラグ',
  PRIMARY KEY (`post_seq`),
  KEY `FK_POST_INPUT_USER_idx` (`post_input_user`),
  KEY `FK_POST_MANAGER_idx` (`post_manager`),
  KEY `FK_POST_REG_ID_idx` (`post_reg_id`),
  KEY `FK_POST_UPD_ID_idx` (`post_upd_id`),
  CONSTRAINT `FK_POST_INPUT_USER` FOREIGN KEY (`post_input_user`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_POST_MANAGER` FOREIGN KEY (`post_manager`) REFERENCES `tbl_manager` (`MANAGER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_POST_REG_ID` FOREIGN KEY (`post_reg_id`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_POST_UPD_ID` FOREIGN KEY (`post_upd_id`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='郵便テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` VALUES (1,'2020-07-01 00:00:00',2,'A株式会社','請求書',3,1,'伝言1',1,'2020-10-27 15:50:40',1,'2020-10-27 15:50:40','N'),(3,'2020-07-31 00:00:00',3,'B株式会社','書籍',4,2,'伝言2',1,'2020-10-27 15:53:13',1,'2020-10-27 15:53:13','N');
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_stock`
--

DROP TABLE IF EXISTS `tbl_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_stock` (
  `STOCK_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理番号',
  `STOCK_TYPE` varchar(45) NOT NULL COMMENT '種別名',
  `STOCK_PRICE` varchar(45) NOT NULL DEFAULT '0' COMMENT '種別価格',
  `STOCK_COUNT` varchar(45) NOT NULL DEFAULT '0' COMMENT '種別在庫',
  `STOCK_REG_ID` int(11) NOT NULL COMMENT '種別登録者',
  `STOCK_REG_DT` datetime NOT NULL COMMENT '種別登録日',
  `STOCK_UPD_ID` int(11) NOT NULL COMMENT '種別修正者',
  `STOCK_UPD_DT` datetime NOT NULL COMMENT '種別修正日',
  `STOCK_IS_DELETE` varchar(45) NOT NULL DEFAULT 'N' COMMENT '種別削除フラグ',
  PRIMARY KEY (`STOCK_SEQ`),
  UNIQUE KEY `STOCK_TYPE` (`STOCK_TYPE`,`STOCK_PRICE`),
  KEY `FK_STOCK_REG_ID_idx` (`STOCK_REG_ID`),
  KEY `FK_STOCK_UPD_ID_idx` (`STOCK_UPD_ID`),
  CONSTRAINT `FK_STOCK_REG_ID` FOREIGN KEY (`STOCK_REG_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_STOCK_UPD_ID` FOREIGN KEY (`STOCK_UPD_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='種別テーブル（在庫）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_stock`
--

LOCK TABLES `tbl_stock` WRITE;
/*!40000 ALTER TABLE `tbl_stock` DISABLE KEYS */;
INSERT INTO `tbl_stock` VALUES (3,'切手','80','16',2,'2020-10-27 16:30:26',1,'2020-12-09 15:21:12','N'),(4,'切手','70','7',4,'2020-10-27 16:32:30',1,'2020-11-12 15:31:43','N'),(5,'切手','92','5',3,'2020-10-27 16:33:40',3,'2020-11-06 06:50:00','N'),(6,'切手','120','6',3,'2020-10-27 16:33:56',2,'2020-10-30 16:06:23','N'),(8,'印紙','80','7',7,'2020-10-27 16:34:45',5,'2020-11-06 06:29:25','N'),(9,'印紙','160','8',5,'2020-10-27 16:35:31',1,'2020-11-12 16:11:39','N'),(10,'印紙','300','3',3,'2020-10-27 16:36:43',1,'2020-11-10 17:31:30','N'),(11,'レタパ','100','5',5,'2020-10-27 16:37:13',1,'2020-11-12 15:31:35','N');
/*!40000 ALTER TABLE `tbl_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `USER_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理番号',
  `USER_ID` varchar(45) NOT NULL COMMENT '利用者ID',
  `USER_PW` varchar(45) NOT NULL COMMENT '利用者パスワード',
  `USER_NAME` varchar(45) NOT NULL COMMENT '利用者名前',
  `USER_AUTH` varchar(45) NOT NULL COMMENT '利用者権限',
  `USER_REG_ID` int(11) NOT NULL COMMENT '利用者登録者',
  `USER_REG_DT` datetime NOT NULL COMMENT '利用者登録日',
  `USER_UPD_ID` int(11) NOT NULL COMMENT '利用者修正者',
  `USER_UPD_DT` datetime NOT NULL COMMENT '利用者修正日',
  `USER_PWD_ERR` varchar(45) NOT NULL DEFAULT '0' COMMENT '利用者パスワードエラー回数',
  `USER_IS_LOCK` varchar(45) NOT NULL DEFAULT 'N' COMMENT '利用者ロックフラグ',
  `USER_IS_DELETE` varchar(45) NOT NULL DEFAULT 'N' COMMENT '利用者削除フラグ',
  PRIMARY KEY (`USER_SEQ`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='利用者テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','PQKFAMJqadJd79VQEY1/VA==','管理者','ADMIN',1,'2020-08-20 00:00:00',2,'2020-10-28 11:34:46','0','N','N'),(2,'test_a@sizai.com','GCjuPUsRZOLZYEmqGR1Ekg==','検証者A','ADMIN',1,'2020-10-27 15:28:36',1,'2020-10-27 15:28:36','0','N','N'),(3,'test_b@sizai.com','Kt132Vtw/YmBJseiy96sdw==','検証者B','USER',1,'2020-10-27 15:29:19',1,'2020-10-27 15:29:19','0','N','N'),(4,'test_c@sizai.com','VHy8GwrhoqeJV51w7H6dog==','検証者C','USER',1,'2020-10-27 15:29:53',1,'2020-10-27 15:29:53','0','N','N'),(5,'test_d@sizai.com','J7QkMRpz2Cjt5MVOvfAGng==','検証者D','ADMIN',1,'2020-10-27 15:31:28',1,'2020-10-27 15:31:28','0','N','N'),(6,'test_e@sizai.com','USH9UVShv35WFtbSLH+2YQ==','検証者E','USER',1,'2020-10-27 15:32:47',1,'2020-10-27 15:32:47','0','N','N'),(7,'test_f@sizai.com','S9OUa0XeN4ZXVNEoKocI9w==','検証者F','USER',1,'2020-10-27 15:33:48',1,'2020-10-27 15:33:48','0','N','N'),(8,'test_g@sizai.com','AZ/ie0lMTleEfrcurAYxrw==','検証者G','USER',1,'2020-10-27 15:34:25',1,'2020-10-27 15:34:25','0','N','N'),(12,'test_i@sizai.com','AZ/ie0lMTleEfrcurAYxrw==','検証者J','USER',11,'2020-10-28 17:10:33',2,'2020-10-30 13:32:16','0','N','Y');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `tbl_pcadmin`
--

DROP TABLE IF EXISTS `tbl_pcadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pcadmin` (
  `PCADMIN_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理番号',
  `PCADMIN_ID` varchar(45) NOT NULL COMMENT 'ID',
  `PCADMIN_HOLDING_COMPANY` int(11) NOT NULL COMMENT '保有会社',
  `PCADMIN_HOLDING_PLACE` varchar(45) NOT NULL COMMENT '保管場所',
  `PCADMIN_USE_PLACE` varchar(45) DEFAULT NULL COMMENT '使用場所',
  `PCADMIN_OPERATION` varchar(45) NOT NULL COMMENT '稼働区分',
  `PCADMIN_USER` varchar(45) NOT NULL COMMENT '利用者',
  `PCADMIN_LAST_USER` varchar(45) DEFAULT NULL COMMENT '前回利用者',
  `PCADMIN_TYPE` varchar(45) NOT NULL COMMENT '種類',
  `PCADMIN_ACCOUNT_NAME` varchar(45) DEFAULT NULL COMMENT 'アカウント名',
  `PCADMIN_PASSWORD` varchar(45) DEFAULT NULL COMMENT 'パスワード',
  `PCADMIN_MAKER` varchar(45) DEFAULT NULL COMMENT 'メーカー',
  `PCADMIN_MODEL` varchar(45) DEFAULT NULL COMMENT 'モデル',
  `PCADMIN_MODEL_NUM` varchar(45) DEFAULT NULL COMMENT '型番',
  `PCADMIN_ETHERNET` varchar(45) DEFAULT NULL COMMENT 'MACアドレス(イーサネット用)',
  `PCADMIN_WIFI_ADDRESS` varchar(45) DEFAULT NULL COMMENT 'MACアドレス(無線LAN用)',
  `PCADMIN_CPU` varchar(45) DEFAULT NULL COMMENT 'CPU',
  `PCADMIN_MEMORY` varchar(45) DEFAULT NULL COMMENT 'メモリ',
  `PCADMIN_HARD_DISK` varchar(45) DEFAULT NULL COMMENT 'ハードディスク',
  `PCADMIN_INSTALL_MEDIA` varchar(45) DEFAULT NULL COMMENT 'インストールメディア',
  `PCADMIN_SECURITY_SOFT` varchar(45) DEFAULT NULL COMMENT 'セキュリティソフト',
  `PCADMIN_OFFICE` varchar(45) DEFAULT NULL COMMENT 'Office',
  `PCADMIN_OS` varchar(45) DEFAULT NULL COMMENT 'OS',
  `PCADMIN_PRODUCT_KEY` varchar(45) DEFAULT NULL COMMENT 'プロダクトキー',
  `PCADMIN_FORM` varchar(45) NOT NULL COMMENT '形態',
  `PCADMIN_RET_DT` datetime DEFAULT NULL COMMENT '返却日',
  `PCADMIN_PURCHASE_DATE` datetime NOT NULL COMMENT '購入日',
  `PCADMIN_REG_ID` int(11) NOT NULL COMMENT '登録者',
  `PCADMIN_REG_DT` datetime NOT NULL COMMENT '登録日',
  `PCADMIN_UPD_ID` int(11) NOT NULL COMMENT '修正者',
  `PCADMIN_UPD_DT` datetime NOT NULL COMMENT '修正日',
  `PCADMIN_COMMENT` varchar(200) DEFAULT NULL COMMENT '備考',
  `PCADMIN_IS_DELETE` varchar(45) NOT NULL DEFAULT 'N' COMMENT '入庫削除フラグ',
  PRIMARY KEY (`PCADMIN_SEQ`),
  KEY `FK_PCADMIN_HOLDING_COMPANY` (`PCADMIN_HOLDING_COMPANY`),
  KEY `FK_PCADMIN_REG_ID_idx` (`PCADMIN_REG_ID`),
  KEY `FK_PCADMIN_UPD_ID_idx` (`PCADMIN_UPD_ID`),
  UNIQUE KEY `PCADMIN_ID_UNIQUE` (`PCADMIN_ID`),
  CONSTRAINT `FK_PCADMIN_HOLDING_COMPANY` FOREIGN KEY (`PCADMIN_HOLDING_COMPANY`) REFERENCES `tbl_manager` (`MANAGER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PCADMIN_REG_ID` FOREIGN KEY (`PCADMIN_REG_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PCADMIN_UPD_ID` FOREIGN KEY (`PCADMIN_UPD_ID`) REFERENCES `tbl_user` (`USER_SEQ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='PC管理テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pcadmin`
--

LOCK TABLES `tbl_pcadmin` WRITE;
/*!40000 ALTER TABLE `tbl_pcadmin` DISABLE KEYS */;
INSERT INTO `tbl_pcadmin` VALUES (1,'BRIDGE-WS-001',3,'58番書庫','社内','待機','多田','竹田伸一','ノートパソコン','JICOO-001','Pink0401','lenovo','ThinkPad SL510','LR-XXH63','00-26-9E-EF-92-7D','9C-2A-70-0F-9F-D3','Intel Core2Duo CPU P8700 2.53GHz','2GB','226GB','リカバリディスクあり','なし','office2016','Windows8','J8K99-7JQXT-42G62-HQKT3-22C73','寄贈','2020-11-05 09:38:17','2020-01-05 10:38:17',1,'2020-01-05 09:38:17',2,'2021-01-05 09:00:17','','N'),(2,'IBS-WS-003',4,'94番書庫','社内研修','稼働中','重田','田中','デスクトップ','JICOO-003','Ibs#003','DELL','Latitude E5530','34453042705（エクスプレスコード）','E8-9D-87-5B-89-22','BC-77-37-68-D4-3B','Corei5_2520M(2.60GHz)','4GB','222GB','なし（作成予定）','なし','office2010','windows10 pro','VK7JG-NPHTM-C97JM-9MPGT-3V66T','購入','2020-12-05 09:38:17','2020-08-05 10:38:17',1,'2020-01-08 09:38:17',2,'2021-01-25 09:00:17','','N');
/*!40000 ALTER TABLE `tbl_pcadmin` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2020-12-15 10:05:26