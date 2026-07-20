/*
 Navicat Premium Dump SQL

 Source Server         : RRFX
 Source Server Type    : MySQL
 Source Server Version : 110409 (11.4.9-MariaDB-log)
 Source Host           : rrfx-mariadb.chgakw66e3og.ap-southeast-3.rds.amazonaws.com:22110
 Source Schema         : db_rrfx_staging

 Target Server Type    : MySQL
 Target Server Version : 110409 (11.4.9-MariaDB-log)
 File Encoding         : 65001

 Date: 20/07/2026 16:46:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_module_group
-- ----------------------------
DROP TABLE IF EXISTS `admin_module_group`;
CREATE TABLE `admin_module_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int UNSIGNED NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('single','dropdown') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'single',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `min_level` int NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_module_group
-- ----------------------------
INSERT INTO `admin_module_group` VALUES (1, 1, 'Dashboard', 'single', 'ti-home sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (2, 2, 'Developer', 'dropdown', 'fas fa-code sidemenu-icon menu-icon', 1);
INSERT INTO `admin_module_group` VALUES (12, 3, 'Master', 'dropdown', 'ti-server sidemenu-icon menu-icon', 2);
INSERT INTO `admin_module_group` VALUES (13, 12, 'Admin', 'single', 'ti-user sidemenu-icon menu-icon', 2);
INSERT INTO `admin_module_group` VALUES (20, 13, 'test', 'dropdown', 'ti-user sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (23, 5, 'Account', 'dropdown', 'ti-layers sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (25, 4, 'Member', 'dropdown', 'ti-user sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (26, 25, 'Password', 'single', 'fe fe-settings', 11);
INSERT INTO `admin_module_group` VALUES (27, 9, 'Banner', 'single', 'ti-image sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (28, 6, 'Metatrader', 'dropdown', 'ti-harddrive sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (29, 7, 'Transaction', 'dropdown', 'ti-money sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (30, 29, 'DTC', 'single', 'ti-pencil sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (32, 30, 'News', 'dropdown', 'ti-announcement sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (33, 8, 'Tools', 'dropdown', 'ti-settings sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (34, 33, 'News', 'single', 'ti-write sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (35, 34, 'Log', 'dropdown', 'ti-info-alt sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (36, 35, 'Support', 'dropdown', 'ti-headphone-alt sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (37, 36, 'Commision', 'dropdown', 'ti-layers-alt sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (46, 37, 'BRM', 'dropdown', 'ti-layout-cta-btn-right sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (47, 46, 'Structure Setting', 'dropdown', 'ti-layers sidemenu-icon menu-icon', 1);
INSERT INTO `admin_module_group` VALUES (48, 47, 'Sales Reporting', 'dropdown', 'ti-money sidemenu-icon menu-icon', 1);
INSERT INTO `admin_module_group` VALUES (49, 48, 'Account Conditions', 'dropdown', 'ti-layers sidemenu-icon menu-icon', 11);
INSERT INTO `admin_module_group` VALUES (50, 49, 'User Logs', 'single', 'ti-user sidemenu-icon menu-icon', 15);
INSERT INTO `admin_module_group` VALUES (51, 50, 'Event', 'dropdown', 'ti-medall-alt sidemenu-icon menu-icon', 15);

SET FOREIGN_KEY_CHECKS = 1;
