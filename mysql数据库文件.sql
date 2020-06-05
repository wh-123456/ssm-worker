/*
Navicat MySQL Data Transfer

Source Server         : helloworld
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : xcxy

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2020-06-04 14:00:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `affairs`
-- ----------------------------
DROP TABLE IF EXISTS `affairs`;
CREATE TABLE `affairs` (
  `a_num` int(11) NOT NULL auto_increment,
  `a_type` varchar(255) default NULL,
  `a_dNum` varchar(255) default NULL,
  `a_dName` varchar(255) default NULL,
  `a_wNum` varchar(255) default NULL,
  `a_wName` varchar(255) default NULL,
  `a_pName` varchar(255) default NULL,
  `a_content` varchar(255) default NULL,
  `a_state` varchar(255) default NULL,
  `a_time` datetime default NULL,
  PRIMARY KEY  (`a_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of affairs
-- ----------------------------
INSERT INTO `affairs` VALUES ('10', '转正', '10003', null, '41654', '张飞飞', null, 'dszvsd', '未审核', '2020-03-11 09:02:33');
INSERT INTO `affairs` VALUES ('11', '转正', '10005', null, '195964646', '关羽', null, '转正啊', '未审核', '2020-03-11 09:18:05');
INSERT INTO `affairs` VALUES ('12', '升职', '10005', null, '1611020601', '杨雄', null, '升职', '未审核', '2020-03-11 09:19:40');
INSERT INTO `affairs` VALUES ('43', '招聘', '10002', '信息技术部门', '14785296345', '关羽', '职员', '2000.0-6000.0,   五险一金', null, '2020-04-28 22:51:14');
INSERT INTO `affairs` VALUES ('44', '招聘', '10006', '后勤部', '12345678945', '关羽', '职员', '3300.0-5000.0,   无', null, '2020-04-28 23:10:58');
INSERT INTO `affairs` VALUES ('45', '招聘', '10001', '人事部门', '15849751648', '张飞', '职员', '3200.0-4500.0,   五险一金', null, '2020-05-04 15:33:56');
INSERT INTO `affairs` VALUES ('46', '公告', '10001', null, null, '卢俊义', null, '本周本部门组织团建', null, '2020-05-09 10:41:51');
INSERT INTO `affairs` VALUES ('55', '升职', '10005', null, '1611020602', '石秀', '测试1', '我要升职', '未审核', '2020-05-23 21:10:41');
INSERT INTO `affairs` VALUES ('59', '招聘', '10003', '财务部门', '1234864864687', '王多', '职员', '600.0-700.0,   五险', null, '2020-05-27 14:34:10');
INSERT INTO `affairs` VALUES ('61', '转正', '10001', null, 'vds', '猪八戒', null, '起的比鸡早，睡得比狗晚', '已同意', '2020-05-28 10:16:23');
INSERT INTO `affairs` VALUES ('62', '转正', '10001', null, '16110207', '朱八戒', null, '起的比鸡早，睡得比狗晚', '已同意', '2020-05-28 10:30:51');
INSERT INTO `affairs` VALUES ('66', '转正', '10001', null, '1611020207', '朱八戒', null, 'efg', '不同意', '2020-05-28 10:53:51');
INSERT INTO `affairs` VALUES ('67', '升职', '10001', null, '1611020201', '鲁智深', '职员', 'ahsnegzhi1', '已同意', '2020-05-28 11:05:31');
INSERT INTO `affairs` VALUES ('69', '主管公告', 'boss', null, null, '宋江', null, '周五开会', null, '2020-05-28 21:49:40');
INSERT INTO `affairs` VALUES ('70', '升职', '10001', null, '1611020202', '花容', '人事部门测式', '起的比鸡早', '已同意', '2020-05-28 21:50:43');

-- ----------------------------
-- Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `b_wnum` varchar(255) NOT NULL,
  `b_num` varchar(255) NOT NULL,
  `b_bank` varchar(255) NOT NULL,
  PRIMARY KEY  (`b_wnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('16110202', 'NjQxNTEyMzQ2NTQ4MzUyOA==', '中国工商银行');
INSERT INTO `bank` VALUES ('1611020602', 'NDMyMTIzNDU2Nzg5NTQxNw==', '中国建设银行');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `d_num` varchar(255) NOT NULL,
  `d_name` varchar(255) NOT NULL,
  `d_time` datetime NOT NULL,
  PRIMARY KEY  (`d_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('10000', '待分配', '1999-01-24 14:59:33');
INSERT INTO `department` VALUES ('10001', '人事部门', '2010-07-23 13:24:36');
INSERT INTO `department` VALUES ('10002', '信息技术部门', '2009-06-09 18:24:54');
INSERT INTO `department` VALUES ('10003', '财务部门', '2003-06-13 19:30:29');
INSERT INTO `department` VALUES ('10006', '后勤部', '2007-08-24 13:26:11');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `h_id` int(11) NOT NULL auto_increment,
  `h_num` varchar(255) NOT NULL,
  `h_content` varchar(255) NOT NULL,
  `h_percentage` double(11,4) NOT NULL,
  `h_money` int(11) NOT NULL,
  `h_time` datetime NOT NULL,
  PRIMARY KEY  (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '16110202', '旷工', '-1.0000', '500', '2020-03-05 15:14:44');
INSERT INTO `history` VALUES ('2', '16110202', '旷工', '-1.0000', '500', '2020-04-08 15:15:07');
INSERT INTO `history` VALUES ('3', '16110202', '迟到', '-1.0000', '200', '2020-04-17 15:15:28');
INSERT INTO `history` VALUES ('4', '16110202', '早退', '-1.0000', '200', '2020-04-20 15:15:47');
INSERT INTO `history` VALUES ('5', '16110202', '提成', '0.0300', '60000', '2020-04-13 15:16:51');
INSERT INTO `history` VALUES ('6', '16110203', '提成', '0.0500', '40000', '2020-04-07 15:17:19');
INSERT INTO `history` VALUES ('7', '16110203', '迟到', '-1.0000', '200', '2020-03-11 15:46:46');
INSERT INTO `history` VALUES ('8', '16110202', '旷工', '-1.0000', '500', '2020-04-29 16:49:50');
INSERT INTO `history` VALUES ('9', '16110202', '请假', '-1.0000', '50', '2020-04-30 09:47:04');
INSERT INTO `history` VALUES ('10', '16110202', '迟到', '-1.0000', '200', '2020-05-22 10:34:53');
INSERT INTO `history` VALUES ('11', '16110202', '提成', '0.0400', '26845', '2020-05-07 10:54:56');
INSERT INTO `history` VALUES ('14', '16110202', '请假', '-1.0000', '50', '2020-05-28 21:56:23');
INSERT INTO `history` VALUES ('15', '16110202', '迟到', '-1.0000', '200', '2020-06-01 19:41:09');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `m_id` int(11) NOT NULL auto_increment,
  `m_name` varchar(255) NOT NULL,
  `m_url` varchar(255) NOT NULL,
  PRIMARY KEY  (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '员工管理', '/worker/workerListByNum');
INSERT INTO `menu` VALUES ('2', '员工信息管理', '/worker/findWorkerInfoByDnum');
INSERT INTO `menu` VALUES ('3', '部门管理', '/department/departmentList');
INSERT INTO `menu` VALUES ('4', '薪资管理', '/money/findMoneyList');
INSERT INTO `menu` VALUES ('5', '实习生管理', '/practice/findpracticeList');
INSERT INTO `menu` VALUES ('6', '实习员工信息管理', '/practice/intopracticeInfo');
INSERT INTO `menu` VALUES ('7', '事务请求', '/affairs/selectpracticeByNum');
INSERT INTO `menu` VALUES ('8', '事务管理界面', '/affairs/bossPromotion');
INSERT INTO `menu` VALUES ('9', '用户管理', '/user/gotoUserInfo');
INSERT INTO `menu` VALUES ('10', '招聘管理', '/affairs/recruitsList');
INSERT INTO `menu` VALUES ('11', '简历筛选', '/resume/selectresumeBydNum?dNum');
INSERT INTO `menu` VALUES ('12', '奖惩详情', '/money/findHistoryByNum');
INSERT INTO `menu` VALUES ('13', '公告管理', '/affairs/departmentnotice');

-- ----------------------------
-- Table structure for `money`
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `m_num` int(11) NOT NULL auto_increment,
  `m_dnum` varchar(255) default NULL,
  `m_pname` varchar(255) default NULL,
  `m_min` double default NULL,
  `m_max` double default NULL,
  `m_safe` varchar(255) default NULL,
  PRIMARY KEY  (`m_num`),
  KEY `cfwf` (`m_pname`),
  KEY `fwf` (`m_dnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('1', '10002', '主管', '5550', '8000', '五险');
INSERT INTO `money` VALUES ('2', '10002', '职员', '2000', '6000', '五险一金');
INSERT INTO `money` VALUES ('3', '10001', '主管', '2564', '3000', '五险');
INSERT INTO `money` VALUES ('5', '10003', '主管', '4000', '10000', '六险二金');
INSERT INTO `money` VALUES ('6', '10003', '职员', '600', '700', '五险');
INSERT INTO `money` VALUES ('11', '10006', '主管', '3500', '6500', '五险一金');
INSERT INTO `money` VALUES ('12', '10006', '职员', '3300', '5000', '无');
INSERT INTO `money` VALUES ('17', '10001', '职员', '3200', '4500', '五险');
INSERT INTO `money` VALUES ('39', '10001', '人事部门测式', null, null, null);

-- ----------------------------
-- Table structure for `practice`
-- ----------------------------
DROP TABLE IF EXISTS `practice`;
CREATE TABLE `practice` (
  `p_num` varchar(255) NOT NULL,
  `p_name` varchar(255) default NULL,
  `p_sex` varchar(255) default NULL,
  `p_dnum` varchar(255) default NULL,
  `p_school` varchar(255) default NULL,
  `p_speciality` varchar(255) default NULL,
  `p_education` varchar(255) default NULL,
  `p_stime` date default NULL,
  `p_etime` date default NULL,
  PRIMARY KEY  (`p_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of practice
-- ----------------------------
INSERT INTO `practice` VALUES ('1546465426', '周瑜', '男', '10000', '四川大学', '电子信息工程', '专科', '2019-10-14', '2020-10-21');
INSERT INTO `practice` VALUES ('161102', 'sdv', '女', '10001', '', '', '本科', '2020-04-11', '2021-04-02');
INSERT INTO `practice` VALUES ('1611020207', '朱八戒', '男', '10001', '西昌学院', '电子信息', '本科', '2020-05-28', '2021-05-07');
INSERT INTO `practice` VALUES ('16110208', '孙悟空', '女', '10001', '电子科技大学', '计算机', '研究生', '2020-05-28', '2020-07-17');
INSERT INTO `practice` VALUES ('161102davev', 'asv', null, '10001', '', '', null, '2020-04-11', '2021-04-01');
INSERT INTO `practice` VALUES ('161102gchfv', 'sac', '男', '10001', '', '', '高中', '2020-04-11', '2020-04-11');
INSERT INTO `practice` VALUES ('161102sacvwqaf', 'qD', null, '10002', '', '', '高中', '2020-04-11', '2020-04-22');
INSERT INTO `practice` VALUES ('265498465', '诸葛亮', '男', '10003', '攀枝花学院', '土木工程', '本科', '2019-12-10', '2020-08-13');
INSERT INTO `practice` VALUES ('41654', '张飞飞', '女', '10002', '四川大', '计算机科学与技', '博士', '2020-01-14', '2020-07-10');
INSERT INTO `practice` VALUES ('525454852', '孙权', '男', '10006', '重庆邮电大学', 'XXX专业', '专科', '2019-12-17', '2020-10-23');
INSERT INTO `practice` VALUES ('ceshceshiceshi103', '测试部门二实习', '男', '10000', '', '', null, '2020-05-25', '2020-05-06');
INSERT INTO `practice` VALUES ('ceshceshiceshi203', '测试部门一实习', '男', '10000', '', '', null, '2020-05-25', '2020-05-12');

-- ----------------------------
-- Table structure for `resume`
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `r_num` int(11) NOT NULL auto_increment,
  `r_name` varchar(255) default NULL,
  `r_dNum` varchar(255) default NULL,
  `r_pName` varchar(255) default NULL,
  `r_sex` varchar(255) default NULL,
  `r_age` int(11) default NULL,
  `r_school` varchar(255) default NULL,
  `r_speciality` varchar(255) default NULL,
  `r_education` varchar(255) default NULL,
  `r_language` varchar(255) default NULL,
  `r_background` varchar(255) default NULL,
  `r_tel` bigint(20) default NULL,
  `r_email` varchar(255) default NULL,
  `r_time` datetime default NULL,
  PRIMARY KEY  (`r_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES ('1', '孙悟空', '10004', '职员', '女', '25', '西昌学院', '电子信息工程', '本科', 'CET-4', '群众', '16854957825', '176584924@qq.com', '2020-03-14 09:32:29');
INSERT INTO `resume` VALUES ('4', '唐僧', '10001', '职员', '男', '32', '四川大学', '电子信息工程', '本科', 'CET-4', '团员', '154852265', 'sacsac.xa.com', '2020-03-14 15:47:49');
INSERT INTO `resume` VALUES ('5', '沙僧', '10001', '职员', '女', '26', '成都理工大学', '电子信息工程', '研究生', 'CET-6', '党员', '135246223', '546466@ca.com', '2020-03-14 15:48:44');
INSERT INTO `resume` VALUES ('6', '白龙马', '10001', '职员', '男', '33', '四川农业大学', '电子信息工程', '本科', 'CET-6', '党员', '4155126336', '255456@csa.com', '2020-03-14 15:49:44');
INSERT INTO `resume` VALUES ('7', '王一', '10001', '职员', '男', '25', '电子科技大学', '电子信息工程', '本科', 'CET-4', '群众', '1654684252', '1894+4@cds.com', '2020-03-14 15:51:15');
INSERT INTO `resume` VALUES ('8', '王欢', '10001', '职员', '男', '22', '西昌学院', '电子信息工程', '本科', '无', '团员', '15884847841', '17338758403@qq.com', '2020-04-22 16:50:10');
INSERT INTO `resume` VALUES ('9', '1', '10006', '职员', '女', '2', '3', '4', '高中', 'CET-4', '团员', '5', '6', '2020-05-04 15:06:36');
INSERT INTO `resume` VALUES ('10', '1', '10001', '职员', '男', '2', '3', '4', '专科', 'CET-4', '群众', '5', '6', '2020-05-04 15:34:32');
INSERT INTO `resume` VALUES ('11', '王欢', '10001', '职员', '男', '24', '西昌学院', '电子信息工程', '本科', '无', '团员', '12345678912', '1733875903@qq.com', '2020-05-28 21:38:13');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int(11) NOT NULL auto_increment,
  `r_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', '主管');
INSERT INTO `role` VALUES ('3', '职员');
INSERT INTO `role` VALUES ('4', '实习员工');

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL auto_increment,
  `r_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `sacs` (`r_id`),
  KEY `cdsv` (`m_id`),
  CONSTRAINT `cdsv` FOREIGN KEY (`m_id`) REFERENCES `menu` (`m_id`),
  CONSTRAINT `sacs` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('8', '1', '1');
INSERT INTO `role_menu` VALUES ('9', '1', '2');
INSERT INTO `role_menu` VALUES ('10', '1', '3');
INSERT INTO `role_menu` VALUES ('11', '1', '4');
INSERT INTO `role_menu` VALUES ('12', '1', '5');
INSERT INTO `role_menu` VALUES ('13', '2', '1');
INSERT INTO `role_menu` VALUES ('14', '2', '2');
INSERT INTO `role_menu` VALUES ('15', '2', '5');
INSERT INTO `role_menu` VALUES ('16', '3', '2');
INSERT INTO `role_menu` VALUES ('17', '4', '6');
INSERT INTO `role_menu` VALUES ('18', '3', '7');
INSERT INTO `role_menu` VALUES ('19', '4', '7');
INSERT INTO `role_menu` VALUES ('20', '1', '9');
INSERT INTO `role_menu` VALUES ('21', '2', '9');
INSERT INTO `role_menu` VALUES ('22', '3', '9');
INSERT INTO `role_menu` VALUES ('23', '4', '9');
INSERT INTO `role_menu` VALUES ('24', '2', '8');
INSERT INTO `role_menu` VALUES ('25', '1', '10');
INSERT INTO `role_menu` VALUES ('26', '2', '11');
INSERT INTO `role_menu` VALUES ('27', '1', '12');
INSERT INTO `role_menu` VALUES ('28', '2', '12');
INSERT INTO `role_menu` VALUES ('29', '3', '12');
INSERT INTO `role_menu` VALUES ('30', '1', '13');
INSERT INTO `role_menu` VALUES ('31', '2', '13');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_wnum` varchar(255) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_password` varchar(255) NOT NULL,
  `fk_role_id` int(11) NOT NULL,
  PRIMARY KEY  (`u_wnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15465', 'lb', 'dc3e49b2124e047aeedac2fde1c4bc1a', '3');
INSERT INTO `user` VALUES ('16110201', 'sj', 'd3687b9c8b8faf0c06f93dd65426835c', '1');
INSERT INTO `user` VALUES ('16110202', 'ljy', '6593fe8f06058966c7b0b4356753ecc4', '2');
INSERT INTO `user` VALUES ('1611020201', 'lzs', '6d21a2261facf0b50560dc8ecb35a267', '3');
INSERT INTO `user` VALUES ('1611020202', 'hr', '9a52ba7955322afd754a2088e8d78ce1', '3');
INSERT INTO `user` VALUES ('1611020207', 'zbj', 'a6b0f796c51e8b7a889833671ead14f1', '4');
INSERT INTO `user` VALUES ('1611020402', 'lk', 'baf8a9466572d96e0d495d780fe7e3d7', '3');
INSERT INTO `user` VALUES ('41654', 'zf', '924e49739429e832b0eb7d2cf0cd357b', '4');

-- ----------------------------
-- Table structure for `worker`
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `w_num` varchar(255) NOT NULL,
  `w_name` varchar(255) default NULL,
  `w_sex` varchar(1) default NULL,
  `w_dnum` varchar(255) default NULL,
  `w_pname` varchar(255) default NULL,
  PRIMARY KEY  (`w_num`),
  KEY `wefw` (`w_dnum`),
  KEY `w_pname` (`w_pname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker
-- ----------------------------
INSERT INTO `worker` VALUES ('15465', '刘备2', '女', '10001', '职员');
INSERT INTO `worker` VALUES ('16110201', '宋江', '男', '00000', '职员');
INSERT INTO `worker` VALUES ('16110202', '卢俊义', '女', '10001', '主管');
INSERT INTO `worker` VALUES ('1611020201', '鲁智深', '男', '10001', '职员');
INSERT INTO `worker` VALUES ('1611020202', '花容', '男', '10001', '人事部门测式');
INSERT INTO `worker` VALUES ('16110203', '吴用', '女', '10002', '主管');
INSERT INTO `worker` VALUES ('1611020301', '柴进', '女', '10002', '职员');
INSERT INTO `worker` VALUES ('1611020302', '关胜', '男', '10002', '职员');
INSERT INTO `worker` VALUES ('16110204', '公孙胜', '男', '10003', '主管');
INSERT INTO `worker` VALUES ('1611020401', '杨志', '女', '10003', '职员');
INSERT INTO `worker` VALUES ('1611020402', '李逵', '男', '10003', '职员');
INSERT INTO `worker` VALUES ('16110205', '林冲', '女', '10002', '职员');
INSERT INTO `worker` VALUES ('1611020501', '史进', '女', '10000', '职员');
INSERT INTO `worker` VALUES ('1611020502', '张顺', '男', '10000', '职员');
INSERT INTO `worker` VALUES ('16110206', '武松', '男', '10000', '职员');
INSERT INTO `worker` VALUES ('1611020601', '杨雄', '女', '10000', '职员');
INSERT INTO `worker` VALUES ('1611020602', '石秀', '女', '10000', '职员');
INSERT INTO `worker` VALUES ('195964646', '关羽', '男', '10000', '职员');
INSERT INTO `worker` VALUES ('264256', '张三', '男', '10000', '职员');
INSERT INTO `worker` VALUES ('dfged', '李四', '女', '10001', '职员');

-- ----------------------------
-- Table structure for `worker_info`
-- ----------------------------
DROP TABLE IF EXISTS `worker_info`;
CREATE TABLE `worker_info` (
  `wi_num` varchar(255) NOT NULL,
  `wi_sex` varchar(255) default NULL,
  `wi_age` int(2) default NULL,
  `wi_address` varchar(255) default NULL,
  `wi_background` varchar(255) default NULL,
  `wi_time` date default NULL,
  `birthday` varchar(255) default NULL,
  `IDcard` varchar(255) default NULL,
  `wi_school` varchar(255) default NULL,
  `wi_education` varchar(255) default NULL,
  `wi_speciality` varchar(255) default NULL,
  `wi_language` varchar(255) default NULL,
  PRIMARY KEY  (`wi_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker_info
-- ----------------------------
INSERT INTO `worker_info` VALUES ('16110201', '男', '44', '四川省内江市', '党员', '2020-05-04', '05-04', '511009188905236847', '西昌学院', '本科', '电子信息工程', 'CET-6');
INSERT INTO `worker_info` VALUES ('16110202', '女', '45', '河北省石家庄市', '群众', '2016-10-05', '10-25', '511009199612168549', '西昌学院', '本科', '电子科学与技术', '无');
INSERT INTO `worker_info` VALUES ('1611020201', '男', '35', '四川省内江市', '党员', '2017-05-03', '11-20', '511004199906058945', '四川大学', '专科', '电子信息工程', 'CET-4');
INSERT INTO `worker_info` VALUES ('1611020202', '女', '45', '北京市', '群众', '2016-11-09', '02-13', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('16110203', '男', '30', '四川省绵阳市', '群众', '2018-02-07', '05-30', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020301', '男', '32', '重庆市', '群众', '2017-06-28', '08-16', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020302', '女', '35', '山西太原市', '群众', '2019-05-30', '07-25', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('16110204', '男', '25', '吉林省长春市', '团员', '2020-01-01', '09-12', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020401', '男', '35', '江苏省南京市', '党员', '2016-11-23', '10-23', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020402', '女', '23', '浙江省杭州市', '团员', '2017-03-10', '12-25', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('16110205', '女', '53', '安徽省合肥市', '党员', '2018-03-03', '05-04', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020501', '男', '32', '四川省德阳市', '群众', '2017-08-03', '06-15', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020502', '女', '35', '上海市', '党员', '2018-07-03', '09-25', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('16110206', '男', '45', '内蒙古呼和浩特市', '党员', '2017-04-01', '04-15', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020601', '男', '35', '黑龙江哈尔滨市', '群众', '2018-02-01', '06-24', null, null, null, null, null);
INSERT INTO `worker_info` VALUES ('1611020602', '女', '20', '四川省成都市', '群众', '2019-07-03', '09-25', '', '四川大学', '本科', '电子信息工程', 'CET-6');
INSERT INTO `worker_info` VALUES ('654', '男', '-1', '4', '8', '2001-10-01', '3', '9', '5', '6', '7', 'CET-4');
