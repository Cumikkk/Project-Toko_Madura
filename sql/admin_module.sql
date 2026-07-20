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

 Date: 20/07/2026 16:44:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_module
-- ----------------------------
DROP TABLE IF EXISTS `admin_module`;
CREATE TABLE `admin_module`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `m_order` int NULL DEFAULT 1,
  `group_id` int NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NULL DEFAULT -1,
  `visible` int NULL DEFAULT -1,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_module_name`(`module` ASC) USING BTREE,
  INDEX `fk_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `admin_module_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `admin_module_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_module
-- ----------------------------
INSERT INTO `admin_module` VALUES (1, 1, 1, 'Dashboard', -1, -1, '2025-04-22 13:46:12', NULL);
INSERT INTO `admin_module` VALUES (2, 2, 2, 'Group', -1, -1, '2025-04-22 13:47:10', '2025-06-17 09:33:28');
INSERT INTO `admin_module` VALUES (3, 0, 2, 'Module', -1, -1, '2025-04-22 15:13:55', '2025-06-19 10:06:08');
INSERT INTO `admin_module` VALUES (7, 0, 13, 'Admins', -1, -1, '2025-06-19 13:31:41', '2025-07-23 16:51:14');
INSERT INTO `admin_module` VALUES (8, 0, 12, 'Country', -1, -1, '2025-06-20 09:17:20', '2025-10-05 10:35:17');
INSERT INTO `admin_module` VALUES (23, 1, 23, 'Progress Real Account', -1, -1, '2025-07-28 16:44:52', NULL);
INSERT INTO `admin_module` VALUES (24, 1, 23, 'Active-Real-Account', -1, -1, '2025-07-30 21:40:12', '2025-10-05 10:58:40');
INSERT INTO `admin_module` VALUES (25, 1, 25, 'User', -1, -1, '2025-08-04 11:29:10', NULL);
INSERT INTO `admin_module` VALUES (26, 1, 26, 'Password', -1, 0, '2025-08-04 14:00:17', NULL);
INSERT INTO `admin_module` VALUES (27, 1, 27, 'Banner', -1, -1, '2025-08-04 16:11:01', NULL);
INSERT INTO `admin_module` VALUES (28, 1, 25, 'Demo-Link-Account', -1, -1, '2025-08-05 15:36:11', '2025-10-05 10:58:30');
INSERT INTO `admin_module` VALUES (29, 1, 28, 'Real Account', -1, -1, '2025-08-05 17:22:25', NULL);
INSERT INTO `admin_module` VALUES (30, 1, 29, 'Internal-Transfer', -1, -1, '2025-08-05 17:50:19', '2025-10-05 10:59:00');
INSERT INTO `admin_module` VALUES (31, 1, 30, 'DTC', -1, -1, '2025-08-05 19:31:26', NULL);
INSERT INTO `admin_module` VALUES (32, 1, 29, 'Deposit', -1, -1, '2025-08-05 21:13:33', NULL);
INSERT INTO `admin_module` VALUES (33, 1, 29, 'Withdrawal', -1, -1, '2025-08-05 21:14:49', NULL);
INSERT INTO `admin_module` VALUES (35, 0, 28, 'Open-Trade', -1, -1, '2025-08-08 21:25:23', '2025-08-08 21:29:39');
INSERT INTO `admin_module` VALUES (39, 1, 28, 'Close-Trade', -1, -1, '2025-08-08 21:46:18', NULL);
INSERT INTO `admin_module` VALUES (40, 1, 32, 'Market-Analysis', -1, -1, '2025-08-09 21:58:26', '2025-10-09 14:53:35');
INSERT INTO `admin_module` VALUES (41, 1, 32, 'News', -1, -1, '2025-08-09 21:59:50', '2025-10-09 14:53:49');
INSERT INTO `admin_module` VALUES (42, 1, 33, 'Company-Profile', -1, -1, '2025-08-10 00:24:53', '2025-10-05 10:57:34');
INSERT INTO `admin_module` VALUES (43, 1, 33, 'Product', -1, -1, '2025-08-10 00:26:47', NULL);
INSERT INTO `admin_module` VALUES (44, 0, 33, 'Wakil-Pialang', -1, -1, '2025-08-10 00:26:59', '2025-08-10 00:27:22');
INSERT INTO `admin_module` VALUES (45, 1, 33, 'Bank', -1, -1, '2025-08-10 00:28:18', NULL);
INSERT INTO `admin_module` VALUES (46, 0, 35, 'Log-User', -1, -1, '2025-08-13 17:27:48', '2025-10-05 10:57:50');
INSERT INTO `admin_module` VALUES (47, 1, 35, 'Log-Admin', -1, -1, '2025-08-13 17:54:58', '2025-10-05 10:57:57');
INSERT INTO `admin_module` VALUES (48, 1, 35, 'Log-Error', -1, -1, '2025-08-13 18:06:59', '2025-10-05 10:57:59');
INSERT INTO `admin_module` VALUES (49, 1, 36, 'Ticket', -1, -1, '2025-08-13 18:33:18', NULL);
INSERT INTO `admin_module` VALUES (50, 1, 25, 'Request-IB', -1, -1, '2025-08-17 21:51:34', '2025-10-05 10:58:01');
INSERT INTO `admin_module` VALUES (51, 1, 23, 'Reject-Real-Account', -1, -1, '2025-08-25 14:43:45', '2025-10-05 10:59:03');
INSERT INTO `admin_module` VALUES (52, 1, 33, 'Symbol', -1, -1, '2025-09-03 11:21:52', '2025-09-04 11:31:06');
INSERT INTO `admin_module` VALUES (53, 1, 37, 'Structure', -1, -1, '2025-09-06 01:29:14', NULL);
INSERT INTO `admin_module` VALUES (54, 1, 37, 'Rebate-Setting', -1, -1, '2025-09-06 03:28:20', '2025-10-05 10:58:23');
INSERT INTO `admin_module` VALUES (57, 1, 46, 'Duplicate IP', -1, -1, '2025-09-06 14:19:59', '2025-09-06 14:21:08');
INSERT INTO `admin_module` VALUES (58, 1, 46, 'Scalpers', -1, -1, '2025-09-06 16:38:45', NULL);
INSERT INTO `admin_module` VALUES (59, 0, 46, 'Hedging', -1, -1, '2025-09-08 03:27:09', '2025-09-08 03:28:04');
INSERT INTO `admin_module` VALUES (60, 1, 46, 'Net Margin', -1, -1, '2025-09-10 13:57:13', '2025-09-10 13:57:52');
INSERT INTO `admin_module` VALUES (61, 1, 25, 'Delete-User', -1, -1, '2025-09-11 16:34:33', '2025-10-05 10:58:18');
INSERT INTO `admin_module` VALUES (64, 1, 25, 'Member-Bank', -1, -1, '2025-09-12 18:46:20', '2025-10-05 10:58:20');
INSERT INTO `admin_module` VALUES (65, 1, 46, 'Closed-Trade', -1, -1, '2025-09-23 01:00:35', '2025-10-05 10:58:14');
INSERT INTO `admin_module` VALUES (66, 1, 37, 'share', -1, -1, '2025-10-01 16:28:22', NULL);
INSERT INTO `admin_module` VALUES (67, 0, 37, 'NMI', -1, -1, '2025-10-02 10:26:18', '2025-10-02 10:26:31');
INSERT INTO `admin_module` VALUES (68, 1, 37, 'NMI-Setting', -1, -1, '2025-10-02 11:11:36', '2025-10-05 10:58:09');
INSERT INTO `admin_module` VALUES (69, 1, 25, 'Retention-Queue', -1, -1, '2025-10-03 04:27:52', '2025-10-05 10:58:11');
INSERT INTO `admin_module` VALUES (70, 1, 32, 'Article', -1, -1, '2025-10-09 14:37:19', NULL);
INSERT INTO `admin_module` VALUES (73, 1, 47, 'Request IB', -1, -1, '2025-11-04 08:35:20', NULL);
INSERT INTO `admin_module` VALUES (74, 1, 25, 'MemberTree', -1, -1, '2025-11-08 17:00:10', NULL);
INSERT INTO `admin_module` VALUES (77, 1, 48, 'Account Structure', -1, -1, '2025-11-14 08:25:13', '2025-11-14 15:30:04');
INSERT INTO `admin_module` VALUES (78, 1, 36, 'SendEmail', -1, -1, '2025-11-17 16:39:05', NULL);
INSERT INTO `admin_module` VALUES (79, 0, 29, 'Adjustment Account', -1, -1, '2025-11-23 02:12:15', '2025-11-23 02:14:35');
INSERT INTO `admin_module` VALUES (80, 1, 48, 'branch', -1, -1, '2025-11-23 22:42:02', '2025-11-23 22:42:49');
INSERT INTO `admin_module` VALUES (81, 1, 36, 'Blast Email', -1, -1, '2026-01-19 14:38:07', NULL);
INSERT INTO `admin_module` VALUES (85, 0, 23, 'Sales Conditions', -1, -1, '2026-02-13 10:58:50', '2026-02-13 15:43:48');
INSERT INTO `admin_module` VALUES (87, 1, 50, 'Activity', -1, 0, '2026-04-24 17:04:17', NULL);
INSERT INTO `admin_module` VALUES (91, 1, 51, 'Trading Competition', -1, -1, '2026-05-12 15:12:54', '2026-05-13 14:00:26');
INSERT INTO `admin_module` VALUES (93, 0, 23, 'Progress Upgrade Standar Account', -1, -1, '2026-07-15 15:39:16', '2026-07-15 15:43:10');

SET FOREIGN_KEY_CHECKS = 1;
