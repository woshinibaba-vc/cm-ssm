/*
 Navicat Premium Data Transfer

 Source Server         : 2021-9-14
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : db_ssm_community_manage

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 01/04/2022 13:54:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aId` int(11) NOT NULL AUTO_INCREMENT,
  `aName` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aPwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`aId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (100, 'admin', 'admin', '1603727023681695.png');

-- ----------------------------
-- Table structure for chargeitem
-- ----------------------------
DROP TABLE IF EXISTS `chargeitem`;
CREATE TABLE `chargeitem`  (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `cCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费项目编号',
  `cName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费名称',
  `cMoney` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费标准',
  PRIMARY KEY (`cId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chargeitem
-- ----------------------------
INSERT INTO `chargeitem` VALUES (100, 'd1001', '电费', '3元/度');
INSERT INTO `chargeitem` VALUES (104, 'd1002', '电费', '2元/度');
INSERT INTO `chargeitem` VALUES (105, 'd1003', '水费', '3元/方');
INSERT INTO `chargeitem` VALUES (106, 'd1004', '物管费', '333元');
INSERT INTO `chargeitem` VALUES (107, 'd1005', '维修下水道', '200元/次');
INSERT INTO `chargeitem` VALUES (108, 'd1006', '停车费', '80元/月');
INSERT INTO `chargeitem` VALUES (109, 'd1007', '燃气费', '33元/方');
INSERT INTO `chargeitem` VALUES (110, 'a\'a\'a', 'a\'a\'a', 'a\'a\'a');
INSERT INTO `chargeitem` VALUES (112, 'b\'b', 'b\'b', 'b\'b');
INSERT INTO `chargeitem` VALUES (113, 'c\'c', 'c\'c', 'c\'c');

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `idcord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checkin
-- ----------------------------
INSERT INTO `checkin` VALUES (100, '王强', '2020-10-27 21:46:27', '13614725562', '124452120211202215', '进入');
INSERT INTO `checkin` VALUES (102, 'admin', NULL, 'aaaaaa', '1', '1');

-- ----------------------------
-- Table structure for dorepair
-- ----------------------------
DROP TABLE IF EXISTS `dorepair`;
CREATE TABLE `dorepair`  (
  `dId` int(11) NOT NULL AUTO_INCREMENT,
  `dTime` datetime NOT NULL COMMENT '上门维修时间',
  `dMoney` int(11) NOT NULL COMMENT '维修估计费用',
  `sId` int(11) NOT NULL,
  `rId` int(11) NOT NULL,
  PRIMARY KEY (`dId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dorepair
-- ----------------------------
INSERT INTO `dorepair` VALUES (100, '2020-10-25 16:00:00', 70, 101, 101);

-- ----------------------------
-- Table structure for face
-- ----------------------------
DROP TABLE IF EXISTS `face`;
CREATE TABLE `face`  (
  `face_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  INDEX `a`(`uid`) USING BTREE,
  CONSTRAINT `a` FOREIGN KEY (`uid`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `hId` int(11) NOT NULL AUTO_INCREMENT,
  `hCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼房编号',
  `hSite` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼房位置',
  `hArea` int(11) NOT NULL COMMENT '楼房面积',
  `hHeight` int(11) NOT NULL COMMENT '房子层数',
  PRIMARY KEY (`hId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (100, 'A1栋', '在中心广场对面，门牌号3001', 100, 101);
INSERT INTO `house` VALUES (101, 'A2栋', '在中心广场附近，门牌号4001', 110, 100);
INSERT INTO `house` VALUES (102, 'A3栋', '门牌号4001', 102, 102);
INSERT INTO `house` VALUES (103, 'B1栋', '在中心广场附近，门牌号5001', 102, 99);
INSERT INTO `house` VALUES (104, 'B2栋', '门牌号6001', 103, 100);
INSERT INTO `house` VALUES (105, 'B3栋', '在中心广场附近，门牌号7001', 104, 102);
INSERT INTO `house` VALUES (119, 'C1栋', '在中心广场附近，门牌号4001', 103, 102);
INSERT INTO `house` VALUES (123, 'C2栋', '在中心广场附近，门牌号6001', 103, 102);
INSERT INTO `house` VALUES (124, 'C3栋', '在中心广场附近，门牌号4001', 102, 102);

-- ----------------------------
-- Table structure for loginuser
-- ----------------------------
DROP TABLE IF EXISTS `loginuser`;
CREATE TABLE `loginuser`  (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业主登录名',
  `l_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业主登录密码',
  PRIMARY KEY (`l_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of loginuser
-- ----------------------------
INSERT INTO `loginuser` VALUES (100, '张三', '202cb962ac59075b964b07152d234b70');
INSERT INTO `loginuser` VALUES (101, '李四', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `loginuser` VALUES (102, '王五', '123456');

-- ----------------------------
-- Table structure for moving
-- ----------------------------
DROP TABLE IF EXISTS `moving`;
CREATE TABLE `moving`  (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_time` datetime NOT NULL COMMENT '发送时间',
  `m_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动态内容',
  `l_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moving
-- ----------------------------
INSERT INTO `moving` VALUES (100, '2020-10-26 15:19:07', '发动态...<b>新的列表<img src=\"http://localhost:8080/CM_SSM_war_exploded/resources/app/js/images/face/50.gif\" alt=\"[熊猫]\"><img src=\"http://localhost:8080/CM_SSM_war_exploded/resources/app/js/images/face/2.gif\" alt=\"[哈哈]\"></b>', '管理员 admin');
INSERT INTO `moving` VALUES (102, '2020-10-26 15:46:08', '<p>本人于2020年8月25日在深圳马成时代广场附近丢失一张深圳通，卡号700189994 如有好心人寻得 请联系微信<b>13244855570</b></p>', '管理员');
INSERT INTO `moving` VALUES (104, '2020-10-26 16:01:40', '新的动态<img src=\"http://localhost:8080/CM_SSM_war_exploded/resources/app/js/images/face/13.gif\" alt=\"[偷笑]\"><img src=\"http://localhost:8080/CM_SSM_war_exploded/resources/app/js/images/face/29.gif\" alt=\"[拜拜]\"><img src=\"http://localhost:8080/CM_SSM_war_exploded/resources/app/js/images/face/53.gif\" alt=\"[耶]\">', '用户 张三');
INSERT INTO `moving` VALUES (105, '2020-10-29 15:34:56', '发动态...aa', '管理员 admin');

-- ----------------------------
-- Table structure for payinfo
-- ----------------------------
DROP TABLE IF EXISTS `payinfo`;
CREATE TABLE `payinfo`  (
  `pId` int(11) NOT NULL AUTO_INCREMENT,
  `pCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴欠费编号',
  `pTime` datetime NOT NULL COMMENT '缴费时间',
  `pMoney` int(11) NOT NULL COMMENT '缴收费用',
  `pInfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴欠费信息',
  `pStatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴欠费状态',
  `cId` int(11) NOT NULL,
  `uId` int(11) NOT NULL,
  PRIMARY KEY (`pId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1234 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payinfo
-- ----------------------------
INSERT INTO `payinfo` VALUES (100, 'user1012', '2020-10-27 00:00:00', 700, '交了电费', '已收取', 101, 100);
INSERT INTO `payinfo` VALUES (101, 'user1022', '2020-10-27 00:00:00', 300, '要交水费了', '未收取', 100, 101);
INSERT INTO `payinfo` VALUES (102, 'user1023', '2022-03-22 12:48:03', 300, '电费', '未收取', 100, 101);
INSERT INTO `payinfo` VALUES (103, 'user1024', '2022-03-22 12:49:08', 300, '停车费', '未收取', 100, 101);
INSERT INTO `payinfo` VALUES (104, 'user1024', '2022-03-22 12:49:36', 500, '物管费', '未收取', 100, 101);
INSERT INTO `payinfo` VALUES (105, 'user1025', '2022-03-22 12:50:11', 500, '燃气费', '未收取', 100, 101);
INSERT INTO `payinfo` VALUES (106, 'user102', '2022-03-22 12:51:34', 500, '维修费', '以收取', 100, 101);
INSERT INTO `payinfo` VALUES (123, '123123', '2022-03-22 12:59:32', 12312, '12312', '啊', 100, 101);
INSERT INTO `payinfo` VALUES (1233, '444', '2022-03-22 12:59:50', 123, '123', '112', 100, 101);

-- ----------------------------
-- Table structure for repairinfo
-- ----------------------------
DROP TABLE IF EXISTS `repairinfo`;
CREATE TABLE `repairinfo`  (
  `rId` int(11) NOT NULL AUTO_INCREMENT,
  `rCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修单编号',
  `rTime` datetime NOT NULL COMMENT '维修申请时间',
  `rDetail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修内容',
  `rStatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修状态',
  `uId` int(11) NOT NULL,
  PRIMARY KEY (`rId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of repairinfo
-- ----------------------------
INSERT INTO `repairinfo` VALUES (100, 'wxd1223', '2020-10-27 00:00:00', '电视坏了，需要维修', '未受理', 100);
INSERT INTO `repairinfo` VALUES (101, 'wxd1333', '2020-10-27 00:00:00', '空调坏了，需要维修', '未受理', 101);
INSERT INTO `repairinfo` VALUES (102, 'wxd16037280653249', '2020-10-27 00:00:00', 'aaaaaaaaa', '未受理', 100);

-- ----------------------------
-- Table structure for staffrepair
-- ----------------------------
DROP TABLE IF EXISTS `staffrepair`;
CREATE TABLE `staffrepair`  (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `sCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修人员编号',
  `sName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修人员名字',
  `sPwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sSex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修人员电话',
  `sEvaluate` double NOT NULL DEFAULT 0 COMMENT '好评率',
  `stheme` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staffrepair
-- ----------------------------
INSERT INTO `staffrepair` VALUES (100, 'wx1001', '王师傅', '123', '女', '19922337654', 0.88, '蓝色');
INSERT INTO `staffrepair` VALUES (101, '123', '123', '123', '男', '123', 0, NULL);
INSERT INTO `staffrepair` VALUES (102, '123', '123', '123', '男', '123', 0, NULL);
INSERT INTO `staffrepair` VALUES (103, '123', '从管理自己到管理他人', '123', '女', '123', 0, NULL);
INSERT INTO `staffrepair` VALUES (104, '123123', '12312312', '1231231', '男', '123123', 0, NULL);
INSERT INTO `staffrepair` VALUES (105, '123123', '12312', '1231', '男', '1231', 0, NULL);
INSERT INTO `staffrepair` VALUES (109, '123123', '12312', '12312', '男', '12312', 0, NULL);
INSERT INTO `staffrepair` VALUES (110, '12312', '12312', '12312', '女', '123123', 0, NULL);
INSERT INTO `staffrepair` VALUES (111, '1231', '1231', '123', '男', '123', 0, NULL);
INSERT INTO `staffrepair` VALUES (113, '123', '从管理自己到管理他人', '123', '男', '13882536858', 0, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `uCode` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业主编号',
  `uName` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业主名',
  `uPwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uSex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uPhone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uStartTime` datetime NOT NULL COMMENT '入住时间',
  `uPeopleNum` int(11) NOT NULL COMMENT '入住人数',
  `uHouseCode` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房间位置',
  `utheme` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hId` int(11) NOT NULL,
  PRIMARY KEY (`uId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (100, '业主0001', '张三', '123', '男', '15744552344', '2020-10-27 00:00:00', 44, '1单元-301', '红色', 100);
INSERT INTO `user` VALUES (101, '123', '王五', '88888888', '男', '13882536858', '2022-03-18 00:00:00', 3, '123', '默认', 100);
INSERT INTO `user` VALUES (102, '业主102', '王五', '88888888', '男', '13882536858', '2022-03-18 00:00:00', 3, '123', '默认', 100);
INSERT INTO `user` VALUES (112, '业主105', '王五', '88888888', '男', '13882536858', '2022-03-18 00:00:00', 3, '123', '默认', 112);
INSERT INTO `user` VALUES (113, '业主103', '王五', '88888888', '男', '13882536858', '2022-03-18 00:00:00', 3, '123', '默认', 113);
INSERT INTO `user` VALUES (114, '业主104', '王五', '88888888', '男', '13882536858', '2022-03-02 00:00:00', 3, '123', '默认', 114);
INSERT INTO `user` VALUES (115, '业主106', '王五', '88888888', '男', '13882536858', '2022-03-18 00:00:00', 3, '123', '默认', 105);
INSERT INTO `user` VALUES (116, '业主107', '王五', '88888888', '女', '13882536858', '2022-03-18 00:00:00', 3, '123', '默认', 116);
INSERT INTO `user` VALUES (121, '业主220', 'zhansgan', '88888888', '男', '13882536858', '2022-03-30 00:00:00', 3, '123', '默认', 100);

SET FOREIGN_KEY_CHECKS = 1;
