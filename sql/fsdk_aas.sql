-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: fsdk_aas
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `fsdk_admin_menu`
--

DROP TABLE IF EXISTS `fsdk_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_admin_menu`
--

LOCK TABLES `fsdk_admin_menu` WRITE;
/*!40000 ALTER TABLE `fsdk_admin_menu` DISABLE KEYS */;
INSERT INTO `fsdk_admin_menu` VALUES (1,0,0,0,20,'admin','Plugin','default','','插件中心','cloud','插件中心'),(2,1,1,1,10000,'admin','Hook','index','','钩子管理','','钩子管理'),(3,2,1,0,10000,'admin','Hook','plugins','','钩子插件管理','','钩子插件管理'),(4,2,2,0,10000,'admin','Hook','pluginListOrder','','钩子插件排序','','钩子插件排序'),(5,2,1,0,10000,'admin','Hook','sync','','同步钩子','','同步钩子'),(6,0,0,1,0,'admin','Setting','default','','设置','cogs','系统设置入口'),(7,6,1,0,50,'admin','Link','index','','友情链接','','友情链接管理'),(8,7,1,0,10000,'admin','Link','add','','添加友情链接','','添加友情链接'),(9,7,2,0,10000,'admin','Link','addPost','','添加友情链接提交保存','','添加友情链接提交保存'),(10,7,1,0,10000,'admin','Link','edit','','编辑友情链接','','编辑友情链接'),(11,7,2,0,10000,'admin','Link','editPost','','编辑友情链接提交保存','','编辑友情链接提交保存'),(12,7,2,0,10000,'admin','Link','delete','','删除友情链接','','删除友情链接'),(13,7,2,0,10000,'admin','Link','listOrder','','友情链接排序','','友情链接排序'),(14,7,2,0,10000,'admin','Link','toggle','','友情链接显示隐藏','','友情链接显示隐藏'),(15,6,1,0,10,'admin','Mailer','index','','邮箱配置','','邮箱配置'),(16,15,2,0,10000,'admin','Mailer','indexPost','','邮箱配置提交保存','','邮箱配置提交保存'),(17,15,1,0,10000,'admin','Mailer','template','','邮件模板','','邮件模板'),(18,15,2,0,10000,'admin','Mailer','templatePost','','邮件模板提交','','邮件模板提交'),(19,15,1,0,10000,'admin','Mailer','test','','邮件发送测试','','邮件发送测试'),(20,6,1,0,10000,'admin','Menu','index','','后台菜单','','后台菜单管理'),(21,20,1,0,10000,'admin','Menu','lists','','所有菜单','','后台所有菜单列表'),(22,20,1,0,10000,'admin','Menu','add','','后台菜单添加','','后台菜单添加'),(23,20,2,0,10000,'admin','Menu','addPost','','后台菜单添加提交保存','','后台菜单添加提交保存'),(24,20,1,0,10000,'admin','Menu','edit','','后台菜单编辑','','后台菜单编辑'),(25,20,2,0,10000,'admin','Menu','editPost','','后台菜单编辑提交保存','','后台菜单编辑提交保存'),(26,20,2,0,10000,'admin','Menu','delete','','后台菜单删除','','后台菜单删除'),(27,20,2,0,10000,'admin','Menu','listOrder','','后台菜单排序','','后台菜单排序'),(28,20,1,0,10000,'admin','Menu','getActions','','导入新后台菜单','','导入新后台菜单'),(29,6,1,0,30,'admin','Nav','index','','导航管理','','导航管理'),(30,29,1,0,10000,'admin','Nav','add','','添加导航','','添加导航'),(31,29,2,0,10000,'admin','Nav','addPost','','添加导航提交保存','','添加导航提交保存'),(32,29,1,0,10000,'admin','Nav','edit','','编辑导航','','编辑导航'),(33,29,2,0,10000,'admin','Nav','editPost','','编辑导航提交保存','','编辑导航提交保存'),(34,29,2,0,10000,'admin','Nav','delete','','删除导航','','删除导航'),(35,29,1,0,10000,'admin','NavMenu','index','','导航菜单','','导航菜单'),(36,35,1,0,10000,'admin','NavMenu','add','','添加导航菜单','','添加导航菜单'),(37,35,2,0,10000,'admin','NavMenu','addPost','','添加导航菜单提交保存','','添加导航菜单提交保存'),(38,35,1,0,10000,'admin','NavMenu','edit','','编辑导航菜单','','编辑导航菜单'),(39,35,2,0,10000,'admin','NavMenu','editPost','','编辑导航菜单提交保存','','编辑导航菜单提交保存'),(40,35,2,0,10000,'admin','NavMenu','delete','','删除导航菜单','','删除导航菜单'),(41,35,2,0,10000,'admin','NavMenu','listOrder','','导航菜单排序','','导航菜单排序'),(42,1,1,1,10000,'admin','Plugin','index','','插件列表','','插件列表'),(43,42,2,0,10000,'admin','Plugin','toggle','','插件启用禁用','','插件启用禁用'),(44,42,1,0,10000,'admin','Plugin','setting','','插件设置','','插件设置'),(45,42,2,0,10000,'admin','Plugin','settingPost','','插件设置提交','','插件设置提交'),(46,42,2,0,10000,'admin','Plugin','install','','插件安装','','插件安装'),(47,42,2,0,10000,'admin','Plugin','update','','插件更新','','插件更新'),(48,42,2,0,10000,'admin','Plugin','uninstall','','卸载插件','','卸载插件'),(49,110,0,1,10000,'admin','User','default','','管理组','','管理组'),(50,49,1,1,10000,'admin','Rbac','index','','角色管理','','角色管理'),(51,50,1,0,10000,'admin','Rbac','roleAdd','','添加角色','','添加角色'),(52,50,2,0,10000,'admin','Rbac','roleAddPost','','添加角色提交','','添加角色提交'),(53,50,1,0,10000,'admin','Rbac','roleEdit','','编辑角色','','编辑角色'),(54,50,2,0,10000,'admin','Rbac','roleEditPost','','编辑角色提交','','编辑角色提交'),(55,50,2,0,10000,'admin','Rbac','roleDelete','','删除角色','','删除角色'),(56,50,1,0,10000,'admin','Rbac','authorize','','设置角色权限','','设置角色权限'),(57,50,2,0,10000,'admin','Rbac','authorizePost','','角色授权提交','','角色授权提交'),(58,0,1,0,10000,'admin','RecycleBin','index','','回收站','','回收站'),(59,58,2,0,10000,'admin','RecycleBin','restore','','回收站还原','','回收站还原'),(60,58,2,0,10000,'admin','RecycleBin','delete','','回收站彻底删除','','回收站彻底删除'),(61,6,1,0,10000,'admin','Route','index','','URL美化','','URL规则管理'),(62,61,1,0,10000,'admin','Route','add','','添加路由规则','','添加路由规则'),(63,61,2,0,10000,'admin','Route','addPost','','添加路由规则提交','','添加路由规则提交'),(64,61,1,0,10000,'admin','Route','edit','','路由规则编辑','','路由规则编辑'),(65,61,2,0,10000,'admin','Route','editPost','','路由规则编辑提交','','路由规则编辑提交'),(66,61,2,0,10000,'admin','Route','delete','','路由规则删除','','路由规则删除'),(67,61,2,0,10000,'admin','Route','ban','','路由规则禁用','','路由规则禁用'),(68,61,2,0,10000,'admin','Route','open','','路由规则启用','','路由规则启用'),(69,61,2,0,10000,'admin','Route','listOrder','','路由规则排序','','路由规则排序'),(70,61,1,0,10000,'admin','Route','select','','选择URL','','选择URL'),(71,6,1,1,0,'admin','Setting','site','','网站信息','','网站信息'),(72,71,2,0,10000,'admin','Setting','sitePost','','网站信息设置提交','','网站信息设置提交'),(73,6,1,0,10000,'admin','Setting','password','','密码修改','','密码修改'),(74,73,2,0,10000,'admin','Setting','passwordPost','','密码修改提交','','密码修改提交'),(75,6,1,1,10000,'admin','Setting','upload','','上传设置','','上传设置'),(76,75,2,0,10000,'admin','Setting','uploadPost','','上传设置提交','','上传设置提交'),(77,6,1,0,10000,'admin','Setting','clearCache','','清除缓存','','清除缓存'),(78,6,1,0,40,'admin','Slide','index','','幻灯片管理','','幻灯片管理'),(79,78,1,0,10000,'admin','Slide','add','','添加幻灯片','','添加幻灯片'),(80,78,2,0,10000,'admin','Slide','addPost','','添加幻灯片提交','','添加幻灯片提交'),(81,78,1,0,10000,'admin','Slide','edit','','编辑幻灯片','','编辑幻灯片'),(82,78,2,0,10000,'admin','Slide','editPost','','编辑幻灯片提交','','编辑幻灯片提交'),(83,78,2,0,10000,'admin','Slide','delete','','删除幻灯片','','删除幻灯片'),(84,78,1,0,10000,'admin','SlideItem','index','','幻灯片页面列表','','幻灯片页面列表'),(85,84,1,0,10000,'admin','SlideItem','add','','幻灯片页面添加','','幻灯片页面添加'),(86,84,2,0,10000,'admin','SlideItem','addPost','','幻灯片页面添加提交','','幻灯片页面添加提交'),(87,84,1,0,10000,'admin','SlideItem','edit','','幻灯片页面编辑','','幻灯片页面编辑'),(88,84,2,0,10000,'admin','SlideItem','editPost','','幻灯片页面编辑提交','','幻灯片页面编辑提交'),(89,84,2,0,10000,'admin','SlideItem','delete','','幻灯片页面删除','','幻灯片页面删除'),(90,84,2,0,10000,'admin','SlideItem','ban','','幻灯片页面隐藏','','幻灯片页面隐藏'),(91,84,2,0,10000,'admin','SlideItem','cancelBan','','幻灯片页面显示','','幻灯片页面显示'),(92,84,2,0,10000,'admin','SlideItem','listOrder','','幻灯片页面排序','','幻灯片页面排序'),(93,6,1,1,10000,'admin','Storage','index','','文件存储','','文件存储'),(94,93,2,0,10000,'admin','Storage','settingPost','','文件存储设置提交','','文件存储设置提交'),(95,6,1,0,20,'admin','Theme','index','','模板管理','','模板管理'),(96,95,1,0,10000,'admin','Theme','install','','安装模板','','安装模板'),(97,95,2,0,10000,'admin','Theme','uninstall','','卸载模板','','卸载模板'),(98,95,2,0,10000,'admin','Theme','installTheme','','模板安装','','模板安装'),(99,95,2,0,10000,'admin','Theme','update','','模板更新','','模板更新'),(100,95,2,0,10000,'admin','Theme','active','','启用模板','','启用模板'),(101,95,1,0,10000,'admin','Theme','files','','模板文件列表','','启用模板'),(102,95,1,0,10000,'admin','Theme','fileSetting','','模板文件设置','','模板文件设置'),(103,95,1,0,10000,'admin','Theme','fileArrayData','','模板文件数组数据列表','','模板文件数组数据列表'),(104,95,2,0,10000,'admin','Theme','fileArrayDataEdit','','模板文件数组数据添加编辑','','模板文件数组数据添加编辑'),(105,95,2,0,10000,'admin','Theme','fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存','','模板文件数组数据添加编辑提交保存'),(106,95,2,0,10000,'admin','Theme','fileArrayDataDelete','','模板文件数组数据删除','','模板文件数组数据删除'),(107,95,2,0,10000,'admin','Theme','settingPost','','模板文件编辑提交保存','','模板文件编辑提交保存'),(108,95,1,0,10000,'admin','Theme','dataSource','','模板文件设置数据源','','模板文件设置数据源'),(109,95,1,0,10000,'admin','Theme','design','','模板设计','','模板设计'),(110,0,0,1,10,'user','AdminIndex','default','','用户管理','group','用户管理'),(111,49,1,1,10000,'admin','User','index','','管理员','','管理员管理'),(112,111,1,0,10000,'admin','User','add','','管理员添加','','管理员添加'),(113,111,2,0,10000,'admin','User','addPost','','管理员添加提交','','管理员添加提交'),(114,111,1,0,10000,'admin','User','edit','','管理员编辑','','管理员编辑'),(115,111,2,0,10000,'admin','User','editPost','','管理员编辑提交','','管理员编辑提交'),(116,111,1,0,10000,'admin','User','userInfo','','个人信息','','管理员个人信息修改'),(117,111,2,0,10000,'admin','User','userInfoPost','','管理员个人信息修改提交','','管理员个人信息修改提交'),(118,111,2,0,10000,'admin','User','delete','','管理员删除','','管理员删除'),(119,111,2,0,10000,'admin','User','ban','','停用管理员','','停用管理员'),(120,111,2,0,10000,'admin','User','cancelBan','','启用管理员','','启用管理员'),(121,0,1,0,10000,'user','AdminAsset','index','','资源管理','file','资源管理列表'),(122,121,2,0,10000,'user','AdminAsset','delete','','删除文件','','删除文件'),(123,110,0,1,10000,'user','AdminIndex','default1','','用户组','','用户组'),(124,123,1,1,10000,'user','AdminIndex','index','','本站用户','','本站用户'),(125,124,2,0,10000,'user','AdminIndex','ban','','本站用户拉黑','','本站用户拉黑'),(126,124,2,0,10000,'user','AdminIndex','cancelBan','','本站用户启用','','本站用户启用'),(127,123,1,1,10000,'user','AdminOauth','index','','第三方用户','','第三方用户'),(128,127,2,0,10000,'user','AdminOauth','delete','','删除第三方用户绑定','','删除第三方用户绑定'),(129,6,1,0,10000,'user','AdminUserAction','index','','用户操作管理','','用户操作管理'),(130,129,1,0,10000,'user','AdminUserAction','edit','','编辑用户操作','','编辑用户操作'),(131,129,2,0,10000,'user','AdminUserAction','editPost','','编辑用户操作提交','','编辑用户操作提交'),(132,129,1,0,10000,'user','AdminUserAction','sync','','同步用户操作','','同步用户操作'),(133,0,0,1,30,'realname','AdminSetting','default','','防沉迷','gamepad','游戏防沉迷'),(134,133,1,1,10,'realname','AdminSetting','index','','规则配置','','规则配置'),(135,133,1,1,20,'realname','AdminApp','index','','应用管理','','应用管理'),(136,133,1,1,30,'realname','AdminHoliday','index','','节日管理','',''),(137,133,1,1,40,'realname','AdminUser','default','','玩家管理','','玩家管理'),(138,137,1,1,10,'realname','AdminUser','guestIndex','','游客','','游客'),(139,137,1,1,20,'realname','AdminUser','userIndex','','实名用户','','实名用户');
/*!40000 ALTER TABLE `fsdk_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_asset`
--

DROP TABLE IF EXISTS `fsdk_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_asset`
--

LOCK TABLES `fsdk_asset` WRITE;
/*!40000 ALTER TABLE `fsdk_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_auth_access`
--

DROP TABLE IF EXISTS `fsdk_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_auth_access`
--

LOCK TABLES `fsdk_auth_access` WRITE;
/*!40000 ALTER TABLE `fsdk_auth_access` DISABLE KEYS */;
INSERT INTO `fsdk_auth_access` VALUES (20,2,'user/adminindex/default','admin_url'),(21,2,'admin/user/default','admin_url'),(22,2,'admin/user/index','admin_url'),(23,2,'admin/user/userinfo','admin_url'),(24,2,'realname/adminsetting/default','admin_url'),(25,2,'realname/adminsetting/index','admin_url'),(26,2,'realname/adminapp/index','admin_url'),(27,2,'realname/adminholiday/index','admin_url'),(28,2,'realname/adminuser/default','admin_url'),(29,2,'realname/adminuser/guestindex','admin_url'),(30,2,'realname/adminuser/userindex','admin_url');
/*!40000 ALTER TABLE `fsdk_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_auth_rule`
--

DROP TABLE IF EXISTS `fsdk_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_auth_rule`
--

LOCK TABLES `fsdk_auth_rule` WRITE;
/*!40000 ALTER TABLE `fsdk_auth_rule` DISABLE KEYS */;
INSERT INTO `fsdk_auth_rule` VALUES (1,1,'admin','admin_url','admin/Hook/index','','钩子管理',''),(2,1,'admin','admin_url','admin/Hook/plugins','','钩子插件管理',''),(3,1,'admin','admin_url','admin/Hook/pluginListOrder','','钩子插件排序',''),(4,1,'admin','admin_url','admin/Hook/sync','','同步钩子',''),(5,1,'admin','admin_url','admin/Link/index','','友情链接',''),(6,1,'admin','admin_url','admin/Link/add','','添加友情链接',''),(7,1,'admin','admin_url','admin/Link/addPost','','添加友情链接提交保存',''),(8,1,'admin','admin_url','admin/Link/edit','','编辑友情链接',''),(9,1,'admin','admin_url','admin/Link/editPost','','编辑友情链接提交保存',''),(10,1,'admin','admin_url','admin/Link/delete','','删除友情链接',''),(11,1,'admin','admin_url','admin/Link/listOrder','','友情链接排序',''),(12,1,'admin','admin_url','admin/Link/toggle','','友情链接显示隐藏',''),(13,1,'admin','admin_url','admin/Mailer/index','','邮箱配置',''),(14,1,'admin','admin_url','admin/Mailer/indexPost','','邮箱配置提交保存',''),(15,1,'admin','admin_url','admin/Mailer/template','','邮件模板',''),(16,1,'admin','admin_url','admin/Mailer/templatePost','','邮件模板提交',''),(17,1,'admin','admin_url','admin/Mailer/test','','邮件发送测试',''),(18,1,'admin','admin_url','admin/Menu/index','','后台菜单',''),(19,1,'admin','admin_url','admin/Menu/lists','','所有菜单',''),(20,1,'admin','admin_url','admin/Menu/add','','后台菜单添加',''),(21,1,'admin','admin_url','admin/Menu/addPost','','后台菜单添加提交保存',''),(22,1,'admin','admin_url','admin/Menu/edit','','后台菜单编辑',''),(23,1,'admin','admin_url','admin/Menu/editPost','','后台菜单编辑提交保存',''),(24,1,'admin','admin_url','admin/Menu/delete','','后台菜单删除',''),(25,1,'admin','admin_url','admin/Menu/listOrder','','后台菜单排序',''),(26,1,'admin','admin_url','admin/Menu/getActions','','导入新后台菜单',''),(27,1,'admin','admin_url','admin/Nav/index','','导航管理',''),(28,1,'admin','admin_url','admin/Nav/add','','添加导航',''),(29,1,'admin','admin_url','admin/Nav/addPost','','添加导航提交保存',''),(30,1,'admin','admin_url','admin/Nav/edit','','编辑导航',''),(31,1,'admin','admin_url','admin/Nav/editPost','','编辑导航提交保存',''),(32,1,'admin','admin_url','admin/Nav/delete','','删除导航',''),(33,1,'admin','admin_url','admin/NavMenu/index','','导航菜单',''),(34,1,'admin','admin_url','admin/NavMenu/add','','添加导航菜单',''),(35,1,'admin','admin_url','admin/NavMenu/addPost','','添加导航菜单提交保存',''),(36,1,'admin','admin_url','admin/NavMenu/edit','','编辑导航菜单',''),(37,1,'admin','admin_url','admin/NavMenu/editPost','','编辑导航菜单提交保存',''),(38,1,'admin','admin_url','admin/NavMenu/delete','','删除导航菜单',''),(39,1,'admin','admin_url','admin/NavMenu/listOrder','','导航菜单排序',''),(40,1,'admin','admin_url','admin/Plugin/default','','插件中心',''),(41,1,'admin','admin_url','admin/Plugin/index','','插件列表',''),(42,1,'admin','admin_url','admin/Plugin/toggle','','插件启用禁用',''),(43,1,'admin','admin_url','admin/Plugin/setting','','插件设置',''),(44,1,'admin','admin_url','admin/Plugin/settingPost','','插件设置提交',''),(45,1,'admin','admin_url','admin/Plugin/install','','插件安装',''),(46,1,'admin','admin_url','admin/Plugin/update','','插件更新',''),(47,1,'admin','admin_url','admin/Plugin/uninstall','','卸载插件',''),(48,1,'admin','admin_url','admin/Rbac/index','','角色管理',''),(49,1,'admin','admin_url','admin/Rbac/roleAdd','','添加角色',''),(50,1,'admin','admin_url','admin/Rbac/roleAddPost','','添加角色提交',''),(51,1,'admin','admin_url','admin/Rbac/roleEdit','','编辑角色',''),(52,1,'admin','admin_url','admin/Rbac/roleEditPost','','编辑角色提交',''),(53,1,'admin','admin_url','admin/Rbac/roleDelete','','删除角色',''),(54,1,'admin','admin_url','admin/Rbac/authorize','','设置角色权限',''),(55,1,'admin','admin_url','admin/Rbac/authorizePost','','角色授权提交',''),(56,1,'admin','admin_url','admin/RecycleBin/index','','回收站',''),(57,1,'admin','admin_url','admin/RecycleBin/restore','','回收站还原',''),(58,1,'admin','admin_url','admin/RecycleBin/delete','','回收站彻底删除',''),(59,1,'admin','admin_url','admin/Route/index','','URL美化',''),(60,1,'admin','admin_url','admin/Route/add','','添加路由规则',''),(61,1,'admin','admin_url','admin/Route/addPost','','添加路由规则提交',''),(62,1,'admin','admin_url','admin/Route/edit','','路由规则编辑',''),(63,1,'admin','admin_url','admin/Route/editPost','','路由规则编辑提交',''),(64,1,'admin','admin_url','admin/Route/delete','','路由规则删除',''),(65,1,'admin','admin_url','admin/Route/ban','','路由规则禁用',''),(66,1,'admin','admin_url','admin/Route/open','','路由规则启用',''),(67,1,'admin','admin_url','admin/Route/listOrder','','路由规则排序',''),(68,1,'admin','admin_url','admin/Route/select','','选择URL',''),(69,1,'admin','admin_url','admin/Setting/default','','设置',''),(70,1,'admin','admin_url','admin/Setting/site','','网站信息',''),(71,1,'admin','admin_url','admin/Setting/sitePost','','网站信息设置提交',''),(72,1,'admin','admin_url','admin/Setting/password','','密码修改',''),(73,1,'admin','admin_url','admin/Setting/passwordPost','','密码修改提交',''),(74,1,'admin','admin_url','admin/Setting/upload','','上传设置',''),(75,1,'admin','admin_url','admin/Setting/uploadPost','','上传设置提交',''),(76,1,'admin','admin_url','admin/Setting/clearCache','','清除缓存',''),(77,1,'admin','admin_url','admin/Slide/index','','幻灯片管理',''),(78,1,'admin','admin_url','admin/Slide/add','','添加幻灯片',''),(79,1,'admin','admin_url','admin/Slide/addPost','','添加幻灯片提交',''),(80,1,'admin','admin_url','admin/Slide/edit','','编辑幻灯片',''),(81,1,'admin','admin_url','admin/Slide/editPost','','编辑幻灯片提交',''),(82,1,'admin','admin_url','admin/Slide/delete','','删除幻灯片',''),(83,1,'admin','admin_url','admin/SlideItem/index','','幻灯片页面列表',''),(84,1,'admin','admin_url','admin/SlideItem/add','','幻灯片页面添加',''),(85,1,'admin','admin_url','admin/SlideItem/addPost','','幻灯片页面添加提交',''),(86,1,'admin','admin_url','admin/SlideItem/edit','','幻灯片页面编辑',''),(87,1,'admin','admin_url','admin/SlideItem/editPost','','幻灯片页面编辑提交',''),(88,1,'admin','admin_url','admin/SlideItem/delete','','幻灯片页面删除',''),(89,1,'admin','admin_url','admin/SlideItem/ban','','幻灯片页面隐藏',''),(90,1,'admin','admin_url','admin/SlideItem/cancelBan','','幻灯片页面显示',''),(91,1,'admin','admin_url','admin/SlideItem/listOrder','','幻灯片页面排序',''),(92,1,'admin','admin_url','admin/Storage/index','','文件存储',''),(93,1,'admin','admin_url','admin/Storage/settingPost','','文件存储设置提交',''),(94,1,'admin','admin_url','admin/Theme/index','','模板管理',''),(95,1,'admin','admin_url','admin/Theme/install','','安装模板',''),(96,1,'admin','admin_url','admin/Theme/uninstall','','卸载模板',''),(97,1,'admin','admin_url','admin/Theme/installTheme','','模板安装',''),(98,1,'admin','admin_url','admin/Theme/update','','模板更新',''),(99,1,'admin','admin_url','admin/Theme/active','','启用模板',''),(100,1,'admin','admin_url','admin/Theme/files','','模板文件列表',''),(101,1,'admin','admin_url','admin/Theme/fileSetting','','模板文件设置',''),(102,1,'admin','admin_url','admin/Theme/fileArrayData','','模板文件数组数据列表',''),(103,1,'admin','admin_url','admin/Theme/fileArrayDataEdit','','模板文件数组数据添加编辑',''),(104,1,'admin','admin_url','admin/Theme/fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存',''),(105,1,'admin','admin_url','admin/Theme/fileArrayDataDelete','','模板文件数组数据删除',''),(106,1,'admin','admin_url','admin/Theme/settingPost','','模板文件编辑提交保存',''),(107,1,'admin','admin_url','admin/Theme/dataSource','','模板文件设置数据源',''),(108,1,'admin','admin_url','admin/Theme/design','','模板设计',''),(109,1,'admin','admin_url','admin/User/default','','管理组',''),(110,1,'admin','admin_url','admin/User/index','','管理员',''),(111,1,'admin','admin_url','admin/User/add','','管理员添加',''),(112,1,'admin','admin_url','admin/User/addPost','','管理员添加提交',''),(113,1,'admin','admin_url','admin/User/edit','','管理员编辑',''),(114,1,'admin','admin_url','admin/User/editPost','','管理员编辑提交',''),(115,1,'admin','admin_url','admin/User/userInfo','','个人信息',''),(116,1,'admin','admin_url','admin/User/userInfoPost','','管理员个人信息修改提交',''),(117,1,'admin','admin_url','admin/User/delete','','管理员删除',''),(118,1,'admin','admin_url','admin/User/ban','','停用管理员',''),(119,1,'admin','admin_url','admin/User/cancelBan','','启用管理员',''),(120,1,'user','admin_url','user/AdminAsset/index','','资源管理',''),(121,1,'user','admin_url','user/AdminAsset/delete','','删除文件',''),(122,1,'user','admin_url','user/AdminIndex/default','','用户管理',''),(123,1,'user','admin_url','user/AdminIndex/default1','','用户组',''),(124,1,'user','admin_url','user/AdminIndex/index','','本站用户',''),(125,1,'user','admin_url','user/AdminIndex/ban','','本站用户拉黑',''),(126,1,'user','admin_url','user/AdminIndex/cancelBan','','本站用户启用',''),(127,1,'user','admin_url','user/AdminOauth/index','','第三方用户',''),(128,1,'user','admin_url','user/AdminOauth/delete','','删除第三方用户绑定',''),(129,1,'user','admin_url','user/AdminUserAction/index','','用户操作管理',''),(130,1,'user','admin_url','user/AdminUserAction/edit','','编辑用户操作',''),(131,1,'user','admin_url','user/AdminUserAction/editPost','','编辑用户操作提交',''),(132,1,'user','admin_url','user/AdminUserAction/sync','','同步用户操作',''),(133,1,'realname','admin_url','realname/AdminSetting/default','','防沉迷',''),(134,1,'realname','admin_url','realname/AdminSetting/index','','规则配置',''),(135,1,'realname','admin_url','realname/AdminApp/index','','应用管理',''),(136,1,'realname','admin_url','realname/AdminHoliday/index','','节日管理',''),(137,1,'realname','admin_url','realname/AdminUser/default','','玩家管理',''),(138,1,'realname','admin_url','realname/AdminUser/guestIndex','','游客',''),(139,1,'realname','admin_url','realname/AdminUser/userIndex','','实名用户','');
/*!40000 ALTER TABLE `fsdk_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_comment`
--

DROP TABLE IF EXISTS `fsdk_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_comment`
--

LOCK TABLES `fsdk_comment` WRITE;
/*!40000 ALTER TABLE `fsdk_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_hook`
--

DROP TABLE IF EXISTS `fsdk_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_hook`
--

LOCK TABLES `fsdk_hook` WRITE;
/*!40000 ALTER TABLE `fsdk_hook` DISABLE KEYS */;
INSERT INTO `fsdk_hook` VALUES (2,1,0,'应用开始','app_begin','cmf','应用开始'),(3,1,0,'模块初始化','module_init','cmf','模块初始化'),(4,1,0,'控制器开始','action_begin','cmf','控制器开始'),(5,1,0,'视图输出过滤','view_filter','cmf','视图输出过滤'),(6,1,0,'应用结束','app_end','cmf','应用结束'),(7,1,0,'日志write方法','log_write','cmf','日志write方法'),(8,1,0,'输出结束','response_end','cmf','输出结束'),(9,1,0,'后台控制器初始化','admin_init','cmf','后台控制器初始化'),(10,1,0,'前台控制器初始化','home_init','cmf','前台控制器初始化'),(11,1,1,'发送手机验证码','send_mobile_verification_code','cmf','发送手机验证码'),(12,3,0,'模板 body标签开始','body_start','','模板 body标签开始'),(13,3,0,'模板 head标签结束前','before_head_end','','模板 head标签结束前'),(14,3,0,'模板底部开始','footer_start','','模板底部开始'),(15,3,0,'模板底部开始之前','before_footer','','模板底部开始之前'),(16,3,0,'模板底部结束之前','before_footer_end','','模板底部结束之前'),(17,3,0,'模板 body 标签结束之前','before_body_end','','模板 body 标签结束之前'),(18,3,0,'模板左边栏开始','left_sidebar_start','','模板左边栏开始'),(19,3,0,'模板左边栏结束之前','before_left_sidebar_end','','模板左边栏结束之前'),(20,3,0,'模板右边栏开始','right_sidebar_start','','模板右边栏开始'),(21,3,0,'模板右边栏结束之前','before_right_sidebar_end','','模板右边栏结束之前'),(22,3,1,'评论区','comment','','评论区'),(23,3,1,'留言区','guestbook','','留言区'),(24,2,0,'后台首页仪表盘','admin_dashboard','admin','后台首页仪表盘'),(25,4,0,'后台模板 head标签结束前','admin_before_head_end','','后台模板 head标签结束前'),(26,4,0,'后台模板 body 标签结束之前','admin_before_body_end','','后台模板 body 标签结束之前'),(27,2,0,'后台登录页面','admin_login','admin','后台登录页面'),(28,1,1,'前台模板切换','switch_theme','cmf','前台模板切换'),(29,3,0,'主要内容之后','after_content','','主要内容之后'),(32,2,1,'获取上传界面','fetch_upload_view','user','获取上传界面'),(33,3,0,'主要内容之前','before_content','cmf','主要内容之前'),(34,1,0,'日志写入完成','log_write_done','cmf','日志写入完成'),(35,1,1,'后台模板切换','switch_admin_theme','cmf','后台模板切换'),(36,1,1,'验证码图片','captcha_image','cmf','验证码图片'),(37,2,1,'后台模板设计界面','admin_theme_design_view','admin','后台模板设计界面'),(38,2,1,'后台设置网站信息界面','admin_setting_site_view','admin','后台设置网站信息界面'),(39,2,1,'后台清除缓存界面','admin_setting_clear_cache_view','admin','后台清除缓存界面'),(40,2,1,'后台导航管理界面','admin_nav_index_view','admin','后台导航管理界面'),(41,2,1,'后台友情链接管理界面','admin_link_index_view','admin','后台友情链接管理界面'),(42,2,1,'后台幻灯片管理界面','admin_slide_index_view','admin','后台幻灯片管理界面'),(43,2,1,'后台管理员列表界面','admin_user_index_view','admin','后台管理员列表界面'),(44,2,1,'后台角色管理界面','admin_rbac_index_view','admin','后台角色管理界面'),(49,2,1,'用户管理本站用户列表界面','user_admin_index_view','user','用户管理本站用户列表界面'),(50,2,1,'资源管理列表界面','user_admin_asset_index_view','user','资源管理列表界面'),(51,2,1,'用户管理第三方用户列表界面','user_admin_oauth_index_view','user','用户管理第三方用户列表界面'),(52,2,1,'后台首页界面','admin_index_index_view','admin','后台首页界面'),(53,2,1,'后台回收站界面','admin_recycle_bin_index_view','admin','后台回收站界面'),(54,2,1,'后台菜单管理界面','admin_menu_index_view','admin','后台菜单管理界面'),(55,2,1,'后台自定义登录是否开启钩子','admin_custom_login_open','admin','后台自定义登录是否开启钩子'),(64,2,1,'后台幻灯片页面列表界面','admin_slide_item_index_view','admin','后台幻灯片页面列表界面'),(65,2,1,'后台幻灯片页面添加界面','admin_slide_item_add_view','admin','后台幻灯片页面添加界面'),(66,2,1,'后台幻灯片页面编辑界面','admin_slide_item_edit_view','admin','后台幻灯片页面编辑界面'),(67,2,1,'后台管理员添加界面','admin_user_add_view','admin','后台管理员添加界面'),(68,2,1,'后台管理员编辑界面','admin_user_edit_view','admin','后台管理员编辑界面'),(69,2,1,'后台角色添加界面','admin_rbac_role_add_view','admin','后台角色添加界面'),(70,2,1,'后台角色编辑界面','admin_rbac_role_edit_view','admin','后台角色编辑界面'),(71,2,1,'后台角色授权界面','admin_rbac_authorize_view','admin','后台角色授权界面');
/*!40000 ALTER TABLE `fsdk_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_hook_plugin`
--

DROP TABLE IF EXISTS `fsdk_hook_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_hook_plugin`
--

LOCK TABLES `fsdk_hook_plugin` WRITE;
/*!40000 ALTER TABLE `fsdk_hook_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_hook_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_link`
--

DROP TABLE IF EXISTS `fsdk_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_link`
--

LOCK TABLES `fsdk_link` WRITE;
/*!40000 ALTER TABLE `fsdk_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_nav`
--

DROP TABLE IF EXISTS `fsdk_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_nav`
--

LOCK TABLES `fsdk_nav` WRITE;
/*!40000 ALTER TABLE `fsdk_nav` DISABLE KEYS */;
INSERT INTO `fsdk_nav` VALUES (1,1,'主导航','主导航'),(2,0,'底部导航','');
/*!40000 ALTER TABLE `fsdk_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_nav_menu`
--

DROP TABLE IF EXISTS `fsdk_nav_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_nav_menu`
--

LOCK TABLES `fsdk_nav_menu` WRITE;
/*!40000 ALTER TABLE `fsdk_nav_menu` DISABLE KEYS */;
INSERT INTO `fsdk_nav_menu` VALUES (1,1,0,1,0,'首页','','home','','0-1');
/*!40000 ALTER TABLE `fsdk_nav_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_option`
--

DROP TABLE IF EXISTS `fsdk_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_option`
--

LOCK TABLES `fsdk_option` WRITE;
/*!40000 ALTER TABLE `fsdk_option` DISABLE KEYS */;
INSERT INTO `fsdk_option` VALUES (1,1,'site_info','{\"site_name\":\"\\u9632\\u6c89\\u8ff7\\u7cfb\\u7edf(\\u63d0\\u5ba1)\",\"site_seo_title\":\"FusionSDK\\u9632\\u6c89\\u8ff7\",\"site_seo_keywords\":\"FusionSDK\\u9632\\u6c89\\u8ff7\",\"site_seo_description\":\"FusionSDK\\u9632\\u6c89\\u8ff7\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\"}'),(2,1,'cmf_settings','{\"open_registration\":\"0\",\"banned_usernames\":\"\"}'),(3,1,'cdn_settings','{\"cdn_static_root\":\"\"}'),(4,1,'admin_settings','{\"admin_password\":\"\",\"admin_theme\":\"admin_simpleboot3\",\"admin_style\":\"flatadmin\"}'),(5,1,'realname_settings','{\"guest_time_limit\":\"3600\",\"guest_replay_limit\":\"1296000\",\"young_forbidden_timerange\":\"22:00-23:59,00:00-07:59\",\"young_time_limit_weekday\":\"5400\",\"young_time_limit_holiday\":\"10800\",\"young2_pay_limit_once\":\"50\",\"young2_pay_limit_monthly\":\"200\",\"young3_pay_limit_once\":\"100\",\"young3_pay_limit_monthly\":\"400\"}');
/*!40000 ALTER TABLE `fsdk_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_plugin`
--

DROP TABLE IF EXISTS `fsdk_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_plugin`
--

LOCK TABLES `fsdk_plugin` WRITE;
/*!40000 ALTER TABLE `fsdk_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_recycle_bin`
--

DROP TABLE IF EXISTS `fsdk_recycle_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_recycle_bin`
--

LOCK TABLES `fsdk_recycle_bin` WRITE;
/*!40000 ALTER TABLE `fsdk_recycle_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_recycle_bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_role`
--

DROP TABLE IF EXISTS `fsdk_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_role`
--

LOCK TABLES `fsdk_role` WRITE;
/*!40000 ALTER TABLE `fsdk_role` DISABLE KEYS */;
INSERT INTO `fsdk_role` VALUES (1,0,1,1329633709,1329633709,0,'超级管理员','拥有网站最高管理员权限！'),(2,0,1,1329633709,1329633709,0,'高级管理员','权限由最高管理员分配！一般权限分配给企业最高层管理。');
/*!40000 ALTER TABLE `fsdk_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_role_user`
--

DROP TABLE IF EXISTS `fsdk_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_role_user`
--

LOCK TABLES `fsdk_role_user` WRITE;
/*!40000 ALTER TABLE `fsdk_role_user` DISABLE KEYS */;
INSERT INTO `fsdk_role_user` VALUES (1,1,1);
/*!40000 ALTER TABLE `fsdk_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_route`
--

DROP TABLE IF EXISTS `fsdk_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_route`
--

LOCK TABLES `fsdk_route` WRITE;
/*!40000 ALTER TABLE `fsdk_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_slide`
--

DROP TABLE IF EXISTS `fsdk_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_slide`
--

LOCK TABLES `fsdk_slide` WRITE;
/*!40000 ALTER TABLE `fsdk_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_slide_item`
--

DROP TABLE IF EXISTS `fsdk_slide_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_slide_item`
--

LOCK TABLES `fsdk_slide_item` WRITE;
/*!40000 ALTER TABLE `fsdk_slide_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_slide_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_theme`
--

DROP TABLE IF EXISTS `fsdk_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_theme`
--

LOCK TABLES `fsdk_theme` WRITE;
/*!40000 ALTER TABLE `fsdk_theme` DISABLE KEYS */;
INSERT INTO `fsdk_theme` VALUES (1,0,0,0,0,'default','default','1.0.0','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF默认模板','ThinkCMF默认模板');
/*!40000 ALTER TABLE `fsdk_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_theme_file`
--

DROP TABLE IF EXISTS `fsdk_theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_theme_file`
--

LOCK TABLES `fsdk_theme_file` WRITE;
/*!40000 ALTER TABLE `fsdk_theme_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_third_party_user`
--

DROP TABLE IF EXISTS `fsdk_third_party_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方唯一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_third_party_user`
--

LOCK TABLES `fsdk_third_party_user` WRITE;
/*!40000 ALTER TABLE `fsdk_third_party_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_third_party_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user`
--

DROP TABLE IF EXISTS `fsdk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user`
--

LOCK TABLES `fsdk_user` WRITE;
/*!40000 ALTER TABLE `fsdk_user` DISABLE KEYS */;
INSERT INTO `fsdk_user` VALUES (1,1,0,0,1594637781,0,0,0.00,1583944926,1,'admin','###da859fa25fb931a1b04bb56d10379fd1','admin','kevin@fusionsdk.com','','','','::1','','',NULL);
/*!40000 ALTER TABLE `fsdk_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_action`
--

DROP TABLE IF EXISTS `fsdk_user_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_action`
--

LOCK TABLES `fsdk_user_action` WRITE;
/*!40000 ALTER TABLE `fsdk_user_action` DISABLE KEYS */;
INSERT INTO `fsdk_user_action` VALUES (1,1,1,1,2,1,'用户登录','login','user','');
/*!40000 ALTER TABLE `fsdk_user_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_action_log`
--

DROP TABLE IF EXISTS `fsdk_user_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_action_log`
--

LOCK TABLES `fsdk_user_action_log` WRITE;
/*!40000 ALTER TABLE `fsdk_user_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_user_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_balance_log`
--

DROP TABLE IF EXISTS `fsdk_user_balance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_balance_log`
--

LOCK TABLES `fsdk_user_balance_log` WRITE;
/*!40000 ALTER TABLE `fsdk_user_balance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_user_balance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_favorite`
--

DROP TABLE IF EXISTS `fsdk_user_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_favorite`
--

LOCK TABLES `fsdk_user_favorite` WRITE;
/*!40000 ALTER TABLE `fsdk_user_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_user_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_like`
--

DROP TABLE IF EXISTS `fsdk_user_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_like`
--

LOCK TABLES `fsdk_user_like` WRITE;
/*!40000 ALTER TABLE `fsdk_user_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_user_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_login_attempt`
--

DROP TABLE IF EXISTS `fsdk_user_login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_login_attempt`
--

LOCK TABLES `fsdk_user_login_attempt` WRITE;
/*!40000 ALTER TABLE `fsdk_user_login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_user_login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_score_log`
--

DROP TABLE IF EXISTS `fsdk_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_score_log`
--

LOCK TABLES `fsdk_user_score_log` WRITE;
/*!40000 ALTER TABLE `fsdk_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_user_token`
--

DROP TABLE IF EXISTS `fsdk_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_user_token`
--

LOCK TABLES `fsdk_user_token` WRITE;
/*!40000 ALTER TABLE `fsdk_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsdk_verification_code`
--

DROP TABLE IF EXISTS `fsdk_verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsdk_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsdk_verification_code`
--

LOCK TABLES `fsdk_verification_code` WRITE;
/*!40000 ALTER TABLE `fsdk_verification_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsdk_verification_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_app`
--

DROP TABLE IF EXISTS `game_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_app` (
  `app_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_secret` varchar(20) NOT NULL DEFAULT '' COMMENT '应用的密钥',
  `app_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `app_icon` varchar(100) NOT NULL DEFAULT '' COMMENT '应用图标',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `realname_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '实名认证状态;0:禁用,1:正常',
  `fatigue_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '防沉迷状态;0:禁用,1:正常',
  `recharge_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '充值统计方式;0:客户端上报,1:服务器查询',
  `recharge_query_url` varchar(100) NOT NULL DEFAULT '' COMMENT '游戏充值查询地址',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='游戏应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_app`
--

LOCK TABLES `game_app` WRITE;
/*!40000 ALTER TABLE `game_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_guest_device`
--

DROP TABLE IF EXISTS `game_guest_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_guest_device` (
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  `device_id` varchar(50) NOT NULL DEFAULT '' COMMENT '设备号',
  `uid` varchar(50) NOT NULL DEFAULT '' COMMENT '最新登录帐号ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '激活时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`app_id`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游客设备激活表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_guest_device`
--

LOCK TABLES `game_guest_device` WRITE;
/*!40000 ALTER TABLE `game_guest_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_guest_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_holiday`
--

DROP TABLE IF EXISTS `game_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_holiday` (
  `dt` int(11) NOT NULL COMMENT '指定日期时间戳',
  `date_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '日期状态;0:上班,1:休息',
  PRIMARY KEY (`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='节假日特殊设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_holiday`
--

LOCK TABLES `game_holiday` WRITE;
/*!40000 ALTER TABLE `game_holiday` DISABLE KEYS */;
INSERT INTO `game_holiday` VALUES (1586102400,1),(1587830400,0),(1588262400,1),(1588521600,1),(1588608000,1),(1588953600,0),(1593014400,1),(1593100800,1),(1593273600,0),(1601136000,0),(1601481600,1),(1601568000,1),(1601827200,1),(1601913600,1),(1602000000,1),(1602086400,1),(1602259200,0);
/*!40000 ALTER TABLE `game_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_user`
--

DROP TABLE IF EXISTS `game_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_user` (
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  `uid` varchar(50) NOT NULL DEFAULT '' COMMENT '帐号ID',
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '帐号类型;0:游客,1:实名用户',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `idcard` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `session_id` varchar(50) NOT NULL DEFAULT '' COMMENT '会话ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `online_time` int(11) NOT NULL DEFAULT '0' COMMENT '帐号类型为0时：累计在线时长；帐号类型为1时：今日在线时长',
  PRIMARY KEY (`app_id`,`uid`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_user`
--

LOCK TABLES `game_user` WRITE;
/*!40000 ALTER TABLE `game_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_user_recharge`
--

DROP TABLE IF EXISTS `game_user_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_user_recharge` (
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  `uid` varchar(50) NOT NULL DEFAULT '' COMMENT '帐号ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `pay_monthly` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '当月累计充值',
  PRIMARY KEY (`app_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户充值累计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_user_recharge`
--

LOCK TABLES `game_user_recharge` WRITE;
/*!40000 ALTER TABLE `game_user_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_user_recharge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-13 22:46:22
