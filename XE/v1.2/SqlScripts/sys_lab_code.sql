/*
Navicat MySQL Data Transfer

Source Server         : DB
Source Server Version : 50207
Source Host           : 127.0.0.1:3306
Source Database       : hos

Target Server Type    : MYSQL
Target Server Version : 50207
File Encoding         : 65001

Date: 2013-03-11 10:56:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_lab_code`
-- ----------------------------
DROP TABLE IF EXISTS `sys_lab_code`;
CREATE TABLE `sys_lab_code` (
  `sys_lab_code_id` int(11) NOT NULL,
  `sys_lab_name` varchar(200) NOT NULL,
  `lab_items_name_list` text,
  PRIMARY KEY (`sys_lab_code_id`),
  UNIQUE KEY `ix_sys_lab_name` (`sys_lab_name`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of sys_lab_code
-- ----------------------------
INSERT INTO `sys_lab_code` VALUES ('1', 'BUN', 'Albumin,AFP,ABO,37 c');
INSERT INTO `sys_lab_code` VALUES ('2', 'FBS', null);
INSERT INTO `sys_lab_code` VALUES ('3', 'Creatinine', null);
INSERT INTO `sys_lab_code` VALUES ('4', 'Total Cholesterol', '\r\n');
INSERT INTO `sys_lab_code` VALUES ('5', 'Triglyceride', null);
INSERT INTO `sys_lab_code` VALUES ('6', 'HDL', null);
INSERT INTO `sys_lab_code` VALUES ('7', 'LDL', null);
INSERT INTO `sys_lab_code` VALUES ('8', 'AST', '\r\n');
INSERT INTO `sys_lab_code` VALUES ('9', 'ALT', null);
INSERT INTO `sys_lab_code` VALUES ('10', 'Uric acid', '\r\n');
INSERT INTO `sys_lab_code` VALUES ('11', 'Blood Group', null);
INSERT INTO `sys_lab_code` VALUES ('12', 'HCT', null);
INSERT INTO `sys_lab_code` VALUES ('13', 'Sodium', null);
INSERT INTO `sys_lab_code` VALUES ('14', 'Chloride', null);
INSERT INTO `sys_lab_code` VALUES ('15', 'Potasssium', null);
INSERT INTO `sys_lab_code` VALUES ('16', 'TCO2', null);
INSERT INTO `sys_lab_code` VALUES ('17', 'HbA1c', null);
INSERT INTO `sys_lab_code` VALUES ('18', 'Urine Albumin', null);
INSERT INTO `sys_lab_code` VALUES ('19', 'Urine Creatinine', null);
INSERT INTO `sys_lab_code` VALUES ('20', 'Macro Albumin', null);
INSERT INTO `sys_lab_code` VALUES ('21', 'Micro Albumin', null);
INSERT INTO `sys_lab_code` VALUES ('22', 'Hb', null);
INSERT INTO `sys_lab_code` VALUES ('23', 'UPCR', null);
INSERT INTO `sys_lab_code` VALUES ('24', 'Bicarb', null);
INSERT INTO `sys_lab_code` VALUES ('25', 'Phosphate', null);
INSERT INTO `sys_lab_code` VALUES ('26', 'PTH', null);

-- ----------------------------
-- Table structure for `sys_lab_link`
-- ----------------------------
DROP TABLE IF EXISTS `sys_lab_link`;
CREATE TABLE `sys_lab_link` (
  `sys_lab_link_id` int(11) NOT NULL,
  `sys_lab_code_id` int(11) NOT NULL,
  `lab_items_code` int(11) NOT NULL,
  PRIMARY KEY (`sys_lab_link_id`),
  UNIQUE KEY `ix_sys_lab_link_unique` (`sys_lab_code_id`,`lab_items_code`),
  KEY `ix_lab_code_id` (`sys_lab_code_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of sys_lab_link
-- ----------------------------
INSERT INTO `sys_lab_link` VALUES ('1', '1', '154');
INSERT INTO `sys_lab_link` VALUES ('2', '1', '119');
INSERT INTO `sys_lab_link` VALUES ('3', '1', '147');
INSERT INTO `sys_lab_link` VALUES ('4', '1', '95');
