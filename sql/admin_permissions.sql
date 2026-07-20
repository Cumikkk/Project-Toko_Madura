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

 Date: 20/07/2026 16:38:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_id` int NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_module_id_on_permission`(`module_id` ASC) USING BTREE,
  CONSTRAINT `fk_module_id_on_permission` FOREIGN KEY (`module_id`) REFERENCES `admin_module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 468 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 1, 'view', 'View Dashboard', '/dashboard', '2025-06-18 11:32:19', '2025-06-18 16:56:23');
INSERT INTO `admin_permissions` VALUES (3, 2, 'view', 'View Group', '/developer/group/view', '2025-06-18 11:32:39', '2025-07-01 09:34:17');
INSERT INTO `admin_permissions` VALUES (5, 2, 'create', 'Create group', '/developer/group/create', '2025-06-19 10:55:38', '2025-07-23 10:13:35');
INSERT INTO `admin_permissions` VALUES (7, 2, 'update', 'Update group', '/developer/group/update', '2025-06-19 11:06:20', '2025-07-23 10:13:26');
INSERT INTO `admin_permissions` VALUES (8, 3, 'view', 'View Module', '/developer/module/view', '2025-06-18 11:49:42', '2025-07-01 09:35:28');
INSERT INTO `admin_permissions` VALUES (9, 3, 'update', 'view update Module', '/developer/module/update/*', '2025-06-19 09:21:39', '2025-07-23 15:26:35');
INSERT INTO `admin_permissions` VALUES (11, 3, 'create', 'view create module', '/developer/module/create', '2025-06-19 10:28:21', '2025-06-19 13:12:56');
INSERT INTO `admin_permissions` VALUES (13, 3, 'delete', 'Akses hapus module', '/developer/module/delete', '2025-06-19 10:37:53', '2025-06-25 08:50:47');
INSERT INTO `admin_permissions` VALUES (18, 7, 'view', 'View Admin', '/admin/view', '2025-06-19 13:31:43', '2025-07-23 17:27:49');
INSERT INTO `admin_permissions` VALUES (19, 7, 'create', 'Create Admin', '/admin/create', '2025-06-19 13:31:43', '2025-07-23 17:26:35');
INSERT INTO `admin_permissions` VALUES (20, 7, 'update', 'Update Admin', '/admin/update/*', '2025-06-19 13:31:43', '2025-07-23 17:26:47');
INSERT INTO `admin_permissions` VALUES (21, 7, 'delete', 'Delete Admin', '/admin/delete', '2025-06-19 13:31:43', '2025-07-23 17:27:22');
INSERT INTO `admin_permissions` VALUES (23, 7, 'update.permission', 'Control Admin Permission', '/admin/permission/*', '2025-06-19 16:31:20', '2025-07-23 17:39:20');
INSERT INTO `admin_permissions` VALUES (24, 7, 'update.permission.ajax', 'Action update permission', '/admin/permission/update', '2025-06-19 17:21:39', NULL);
INSERT INTO `admin_permissions` VALUES (26, 8, 'view', 'view Negara', '/master/negara/view', '2025-06-20 09:17:21', NULL);
INSERT INTO `admin_permissions` VALUES (27, 8, 'create', 'create Negara', '/master/negara/create', '2025-06-20 09:17:21', NULL);
INSERT INTO `admin_permissions` VALUES (28, 8, 'update', 'update Negara', '/master/negara/update', '2025-06-20 09:17:21', NULL);
INSERT INTO `admin_permissions` VALUES (29, 8, 'delete', 'delete Negara', '/master/negara/delete', '2025-06-20 09:17:21', NULL);
INSERT INTO `admin_permissions` VALUES (69, 2, 'delete', 'Delete Group', '/developer/group/delete', '2025-07-23 09:47:29', '2025-07-23 10:13:50');
INSERT INTO `admin_permissions` VALUES (94, 23, 'view', 'view Progress Real Account', '/account/progress_real_account/view', '2025-07-28 16:44:53', '2025-08-07 11:15:15');
INSERT INTO `admin_permissions` VALUES (95, 23, 'create', 'create Progress Real Account', '/account/progress_real_account/create', '2025-07-28 16:44:54', '2025-08-07 11:17:48');
INSERT INTO `admin_permissions` VALUES (96, 23, 'update', 'update Progress Real Account', '/account/progress_real_account/update', '2025-07-28 16:44:54', '2025-08-07 11:18:00');
INSERT INTO `admin_permissions` VALUES (97, 23, 'delete', 'delete Progress Real Account', '/account/progress_real_account/delete', '2025-07-28 16:44:54', '2025-08-07 11:18:10');
INSERT INTO `admin_permissions` VALUES (98, 24, 'view', 'view active-real-account', '/account/active_real_account/view', '2025-07-30 21:40:12', '2025-08-08 16:43:59');
INSERT INTO `admin_permissions` VALUES (99, 24, 'create', 'create active-real-account', '/account/active_real_account/create', '2025-07-30 21:40:12', '2025-08-08 16:44:09');
INSERT INTO `admin_permissions` VALUES (100, 24, 'update', 'update active-real-account', '/account/active_real_account/update', '2025-07-30 21:40:12', '2025-08-08 16:44:18');
INSERT INTO `admin_permissions` VALUES (101, 24, 'delete', 'delete active-real-account', '/account/active_real_account/delete', '2025-07-30 21:40:12', '2025-08-08 16:44:28');
INSERT INTO `admin_permissions` VALUES (102, 23, 'ndelok', 'Lihat', '/account/progress_real_account/ndelok', '2025-07-30 21:50:32', '2025-08-07 11:18:22');
INSERT INTO `admin_permissions` VALUES (103, 25, 'view', 'view User', '/member/user/view', '2025-08-04 11:29:10', '2025-08-04 12:05:47');
INSERT INTO `admin_permissions` VALUES (107, 26, 'view', 'view Password', '/password/view', '2025-08-04 14:00:17', '2025-08-04 14:03:22');
INSERT INTO `admin_permissions` VALUES (109, 26, 'update', 'update Password', '/password/update', '2025-08-04 14:00:17', '2025-08-04 14:04:54');
INSERT INTO `admin_permissions` VALUES (112, 27, 'view', 'view Banner', '/banner/view', '2025-08-04 16:11:01', '2025-08-04 16:20:10');
INSERT INTO `admin_permissions` VALUES (113, 27, 'create', 'create Banner', '/banner/create', '2025-08-04 16:11:01', '2025-08-04 16:20:22');
INSERT INTO `admin_permissions` VALUES (114, 27, 'update', 'update Banner', '/banner/update', '2025-08-04 16:11:01', '2025-08-04 16:20:35');
INSERT INTO `admin_permissions` VALUES (115, 27, 'delete', 'delete Banner', '/banner/delete', '2025-08-04 16:11:01', '2025-08-04 16:20:49');
INSERT INTO `admin_permissions` VALUES (119, 28, 'view', 'view Demo Link Account', '/member/demo_link_account/view', '2025-08-05 15:36:11', '2025-08-05 16:52:19');
INSERT INTO `admin_permissions` VALUES (120, 28, 'create', 'create Demo Link Account', '/member/demo_link_account/create', '2025-08-05 15:36:11', '2025-08-05 16:52:30');
INSERT INTO `admin_permissions` VALUES (121, 28, 'update', 'update Demo Link Account', '/member/demo_link_account/update', '2025-08-05 15:36:11', '2025-08-05 16:52:41');
INSERT INTO `admin_permissions` VALUES (122, 28, 'delete', 'delete Demo Link Account', '/member/demo_link_account/delete', '2025-08-05 15:36:11', '2025-08-05 16:52:50');
INSERT INTO `admin_permissions` VALUES (123, 29, 'view', 'view Real Account', '/metatrader/real_account/view', '2025-08-05 17:22:25', '2025-08-05 17:22:44');
INSERT INTO `admin_permissions` VALUES (127, 30, 'view', 'view Internal-transfer', '/transaction/internal_transfer/view', '2025-08-05 17:50:19', '2025-08-05 17:53:08');
INSERT INTO `admin_permissions` VALUES (128, 30, 'create', 'create Internal-transfer', '/transaction/internal_transfer/create', '2025-08-05 17:50:19', '2025-08-05 17:53:18');
INSERT INTO `admin_permissions` VALUES (129, 30, 'update', 'update Internal-transfer', '/transaction/internal_transfer/update', '2025-08-05 17:50:19', '2025-08-05 17:53:26');
INSERT INTO `admin_permissions` VALUES (130, 30, 'delete', 'delete Internal-transfer', '/transaction/internal_transfer/delete', '2025-08-05 17:50:19', '2025-08-05 17:53:33');
INSERT INTO `admin_permissions` VALUES (131, 31, 'view', 'view DTC', '/dtc/view', '2025-08-05 19:31:26', '2025-08-05 19:32:34');
INSERT INTO `admin_permissions` VALUES (132, 31, 'create', 'create DTC', '/dtc/create', '2025-08-05 19:31:26', '2025-08-05 19:32:42');
INSERT INTO `admin_permissions` VALUES (133, 31, 'update', 'update DTC', '/dtc/update', '2025-08-05 19:31:26', '2025-08-05 19:32:51');
INSERT INTO `admin_permissions` VALUES (134, 31, 'delete', 'delete DTC', '/dtc/delete', '2025-08-05 19:31:26', '2025-08-05 19:33:01');
INSERT INTO `admin_permissions` VALUES (135, 32, 'view', 'view Deposit', '/transaction/deposit/view', '2025-08-05 21:13:33', '2025-08-05 22:03:39');
INSERT INTO `admin_permissions` VALUES (136, 32, 'create', 'Create Deposit', '/transaction/deposit/create', '2025-08-05 21:13:33', '2026-01-02 08:23:15');
INSERT INTO `admin_permissions` VALUES (137, 32, 'update', 'update Deposit', '/transaction/deposit/update', '2025-08-05 21:13:33', NULL);
INSERT INTO `admin_permissions` VALUES (139, 33, 'view', 'view Withdrawal', '/transaction/withdrawal/view', '2025-08-05 21:14:49', NULL);
INSERT INTO `admin_permissions` VALUES (140, 33, 'create', 'Create Withdrawal', '/transaction/withdrawal/create', '2025-08-05 21:14:49', '2026-01-03 09:09:39');
INSERT INTO `admin_permissions` VALUES (141, 33, 'update', 'update Withdrawal', '/transaction/withdrawal/update', '2025-08-05 21:14:49', NULL);
INSERT INTO `admin_permissions` VALUES (143, 32, 'history', 'history Deposit', '/transaction/history', '2025-08-05 22:01:24', '2025-08-05 22:03:52');
INSERT INTO `admin_permissions` VALUES (145, 32, 'view.accounting', 'view accounting Deposit', '/transaction/accounting', '2025-08-06 12:59:51', NULL);
INSERT INTO `admin_permissions` VALUES (147, 33, 'history.withdrawal', 'history Withdrawal', '/transaction/withdrawal_history', '2025-08-06 14:20:35', '2025-08-06 14:21:38');
INSERT INTO `admin_permissions` VALUES (148, 33, 'view.withdrawal.accounting', 'view accounting Withdrawal', '/transaction/withdrawal_accounting', '2025-08-06 14:24:23', '2025-08-06 14:30:38');
INSERT INTO `admin_permissions` VALUES (149, 33, 'view.withdrawal.authorization', 'view authorization Withdrawal', '/transaction/withdrawal_authorization', '2025-08-06 14:25:15', '2025-08-06 14:30:27');
INSERT INTO `admin_permissions` VALUES (154, 23, 'wp.verification', 'WP Verificator', '/account/progress_real_account/wp_verification/*', '2025-08-07 11:47:28', NULL);
INSERT INTO `admin_permissions` VALUES (155, 23, 'wp.verification.action', 'Action WP Verificator', '/account/wp_verification_acion', '2025-08-07 14:36:51', '2025-08-07 14:37:25');
INSERT INTO `admin_permissions` VALUES (156, 23, 'temporary.detail', 'Temporary Detail', '/account/progress_real_account/temporary_detail/*', '2025-08-07 14:51:16', NULL);
INSERT INTO `admin_permissions` VALUES (157, 23, 'client.deposit', 'Client Deposit', '/account/progress_real_account/client_deposit/*', '2025-08-07 15:24:04', NULL);
INSERT INTO `admin_permissions` VALUES (158, 23, 'client.deposit.action', 'Action Client Deposit', '/account/client_deposit_acion', '2025-08-07 16:09:37', NULL);
INSERT INTO `admin_permissions` VALUES (159, 23, 'wp.check', 'WP Check', '/account/progress_real_account/wp_check/*', '2025-08-07 16:38:46', NULL);
INSERT INTO `admin_permissions` VALUES (160, 23, 'wp.check.action', 'WP Check Action', '/account/wp_check_action', '2025-08-08 10:34:21', '2025-08-08 10:34:54');
INSERT INTO `admin_permissions` VALUES (161, 23, 'accounting', 'Accounting', '/account/progress_real_account/accounting/*', '2025-08-08 11:36:08', NULL);
INSERT INTO `admin_permissions` VALUES (162, 23, 'accounting.action', 'Accounting Action', '/account/accounting_action', '2025-08-08 14:20:16', NULL);
INSERT INTO `admin_permissions` VALUES (163, 23, 'dealer', 'Dealer', '/account/progress_real_account/dealer/*', '2025-08-08 15:15:48', NULL);
INSERT INTO `admin_permissions` VALUES (164, 23, 'dealer.action', 'Dealer Action', '/account/dealer_action', '2025-08-08 16:00:04', NULL);
INSERT INTO `admin_permissions` VALUES (165, 24, 'dokumen', 'Dokumen', '/account/active_real_account/document/*', '2025-08-08 20:10:02', NULL);
INSERT INTO `admin_permissions` VALUES (166, 35, 'view', 'view Open Trade', '/metatrader/open_trade/view', '2025-08-08 21:25:23', '2025-08-08 21:30:42');
INSERT INTO `admin_permissions` VALUES (170, 39, 'view', 'view Close-Trade', '/metatrader/close_trade/view', '2025-08-08 21:46:18', '2025-08-08 21:48:32');
INSERT INTO `admin_permissions` VALUES (174, 40, 'view', 'view Fundamentals-and-Analysis', '/news/fundamentals-and-analysis/view', '2025-08-09 21:58:26', NULL);
INSERT INTO `admin_permissions` VALUES (175, 40, 'create', 'create Fundamentals-and-Analysis', '/news/fundamentals-and-analysis/create', '2025-08-09 21:58:26', NULL);
INSERT INTO `admin_permissions` VALUES (176, 40, 'update', 'update Fundamentals-and-Analysis', '/news/fundamentals-and-analysis/update', '2025-08-09 21:58:26', NULL);
INSERT INTO `admin_permissions` VALUES (177, 40, 'delete', 'delete Fundamentals-and-Analysis', '/news/fundamentals-and-analysis/delete', '2025-08-09 21:58:26', NULL);
INSERT INTO `admin_permissions` VALUES (178, 41, 'view', 'view News-Corner', '/news/news-corner/view', '2025-08-09 21:59:50', NULL);
INSERT INTO `admin_permissions` VALUES (179, 41, 'create', 'create News-Corner', '/news/news-corner/create', '2025-08-09 21:59:50', NULL);
INSERT INTO `admin_permissions` VALUES (180, 41, 'update', 'update News-Corner', '/news/news-corner/update', '2025-08-09 21:59:50', NULL);
INSERT INTO `admin_permissions` VALUES (181, 41, 'delete', 'delete News-Corner', '/news/news-corner/delete', '2025-08-09 21:59:50', NULL);
INSERT INTO `admin_permissions` VALUES (182, 42, 'view', 'view Profile-Perushaaan', '/tools/profile_perushaaan/view', '2025-08-10 00:24:53', '2025-08-12 11:52:50');
INSERT INTO `admin_permissions` VALUES (183, 42, 'create', 'create Profile-Perushaaan', '/tools/profile_perushaaan/create', '2025-08-10 00:24:53', '2025-08-12 11:52:53');
INSERT INTO `admin_permissions` VALUES (184, 42, 'update', 'update Profile-Perushaaan', '/tools/profile_perushaaan/update', '2025-08-10 00:24:53', '2025-08-12 11:52:56');
INSERT INTO `admin_permissions` VALUES (185, 42, 'delete', 'delete Profile-Perushaaan', '/tools/profile_perushaaan/delete', '2025-08-10 00:24:53', '2025-08-12 11:52:58');
INSERT INTO `admin_permissions` VALUES (186, 43, 'view', 'view Product', '/tools/product/view', '2025-08-10 00:26:47', NULL);
INSERT INTO `admin_permissions` VALUES (187, 43, 'create', 'create Product', '/tools/product/create', '2025-08-10 00:26:47', NULL);
INSERT INTO `admin_permissions` VALUES (188, 43, 'update', 'update Product', '/tools/product/update/*', '2025-08-10 00:26:47', '2025-08-12 13:31:21');
INSERT INTO `admin_permissions` VALUES (189, 43, 'delete', 'delete Product', '/tools/product/delete', '2025-08-10 00:26:47', NULL);
INSERT INTO `admin_permissions` VALUES (190, 44, 'view', 'view Wakil-Pialang', '/tools/wakil_pialang/view', '2025-08-10 00:26:59', '2025-08-13 14:33:23');
INSERT INTO `admin_permissions` VALUES (191, 44, 'create', 'create Wakil-Pialang', '/tools/wakil_pialang/create', '2025-08-10 00:26:59', '2025-08-13 14:33:40');
INSERT INTO `admin_permissions` VALUES (192, 44, 'update', 'update Wakil-Pialang', '/tools/wakil_pialang/update', '2025-08-10 00:26:59', '2025-08-13 14:33:49');
INSERT INTO `admin_permissions` VALUES (193, 44, 'delete', 'delete Wakil-Pialang', '/tools/wakil_pialang/delete', '2025-08-10 00:26:59', '2025-08-13 17:21:25');
INSERT INTO `admin_permissions` VALUES (194, 45, 'view', 'view Bank', '/tools/bank/view', '2025-08-10 00:28:18', NULL);
INSERT INTO `admin_permissions` VALUES (195, 45, 'create', 'create Bank', '/tools/bank/create', '2025-08-10 00:28:18', NULL);
INSERT INTO `admin_permissions` VALUES (196, 45, 'update', 'update Bank', '/tools/bank/update', '2025-08-10 00:28:18', NULL);
INSERT INTO `admin_permissions` VALUES (197, 45, 'delete', 'delete Bank', '/tools/bank/delete', '2025-08-10 00:28:18', NULL);
INSERT INTO `admin_permissions` VALUES (198, 23, 'edit.real.account', 'edit Real Account', '/account/progress_real_account/edit/*', '2025-08-11 11:10:25', '2025-08-11 11:11:12');
INSERT INTO `admin_permissions` VALUES (199, 24, 'edit.active.real.account', 'edit Real Account', '/account/active_real_account/edit/*', '2025-08-11 11:13:49', NULL);
INSERT INTO `admin_permissions` VALUES (200, 24, 'edit.profile.pribadi', 'Edit Profile Pribadi', '/account/edit_profile_pribadi', '2025-08-11 13:14:33', NULL);
INSERT INTO `admin_permissions` VALUES (201, 24, 'edit.other', 'Edit Other', '/account/edit_other', '2025-08-11 13:56:31', NULL);
INSERT INTO `admin_permissions` VALUES (202, 24, 'edit.kontak.darurat', 'Edit Kontak Darurat', '/account/edit_kontak_darurat', '2025-08-11 14:12:51', NULL);
INSERT INTO `admin_permissions` VALUES (203, 24, 'edit.pekerjaan', 'Edit Pekerjaan', '/account/edit_pekerjaan', '2025-08-11 14:29:37', NULL);
INSERT INTO `admin_permissions` VALUES (204, 24, 'edit.kekayaan', 'Edit Kekayaan', '/account/edit_kekayaan', '2025-08-11 14:45:12', NULL);
INSERT INTO `admin_permissions` VALUES (205, 24, 'edit.bank', 'Edit Bank', '/account/edit_bank', '2025-08-11 15:10:36', NULL);
INSERT INTO `admin_permissions` VALUES (206, 24, 'edit.document', 'Edit Document', '/account/edit_document', '2025-08-11 16:04:42', NULL);
INSERT INTO `admin_permissions` VALUES (207, 42, 'view_bank', 'view bank Profile-Perushaaan', '/tools/profile_perushaaan/bank/view', '2025-08-11 16:34:48', '2025-08-12 12:09:02');
INSERT INTO `admin_permissions` VALUES (208, 42, 'view_kantor', 'view kantor Profile-Perushaaan', '/tools/profile_perushaaan/view_kantor', '2025-08-11 16:35:33', '2025-08-12 11:52:10');
INSERT INTO `admin_permissions` VALUES (209, 42, 'view_company', 'view company Profile-Perushaaan', '/tools/profile_perushaaan/view_company', '2025-08-11 16:40:47', '2025-08-12 11:52:08');
INSERT INTO `admin_permissions` VALUES (210, 24, 'edit.additional', 'Edit Additional', '/account/edit_additional', '2025-08-11 17:03:09', NULL);
INSERT INTO `admin_permissions` VALUES (211, 42, 'create_bank', 'create bank Profile-Perushaaan', '/tools/profile_perushaaan/create_bank', '2025-08-12 08:56:12', '2025-08-12 11:52:06');
INSERT INTO `admin_permissions` VALUES (212, 42, 'create_kantor', 'create kantor Profile-Perushaaan', '/tools/profile_perushaaan/create_kantor', '2025-08-12 08:56:47', '2025-08-12 11:51:49');
INSERT INTO `admin_permissions` VALUES (213, 42, 'create_company', 'create company Profile-Perushaaan', '/tools/profile_perushaaan/create_company', '2025-08-12 08:57:21', '2025-08-12 11:51:40');
INSERT INTO `admin_permissions` VALUES (214, 42, 'update.company', 'Update Company', '/tools/profile_perushaaan/update_company', '2025-08-12 16:59:15', NULL);
INSERT INTO `admin_permissions` VALUES (216, 42, 'update.kantor', 'Update Kantor', '/tools/profile_perushaaan/update_kantor', '2025-08-13 12:41:48', NULL);
INSERT INTO `admin_permissions` VALUES (217, 42, 'delete.kantor', 'Hapus Kantor', '/tools/profile_perushaaan/delete_kantor', '2025-08-13 12:54:27', NULL);
INSERT INTO `admin_permissions` VALUES (218, 44, 'update.verificator', 'Update WPB verificator', '/tools/wakil_pialang/update_verificator', '2025-08-13 16:59:13', NULL);
INSERT INTO `admin_permissions` VALUES (219, 46, 'view', 'view Log', '/log/user/view', '2025-08-13 17:27:48', '2025-08-13 17:37:25');
INSERT INTO `admin_permissions` VALUES (223, 47, 'view', 'view Log Admin', '/log/admin/view', '2025-08-13 17:54:58', '2025-08-13 17:57:09');
INSERT INTO `admin_permissions` VALUES (227, 48, 'view', 'view Log Error', '/log/error/view', '2025-08-13 18:06:59', '2025-08-13 18:07:37');
INSERT INTO `admin_permissions` VALUES (231, 49, 'view', 'view Ticket', '/support/ticket/view', '2025-08-13 18:33:18', NULL);
INSERT INTO `admin_permissions` VALUES (232, 49, 'create', 'create Ticket', '/support/ticket/create', '2025-08-13 18:33:18', NULL);
INSERT INTO `admin_permissions` VALUES (233, 49, 'update', 'update Ticket', '/support/ticket/update', '2025-08-13 18:33:18', NULL);
INSERT INTO `admin_permissions` VALUES (234, 49, 'delete', 'delete Ticket', '/support/ticket/delete', '2025-08-13 18:33:18', NULL);
INSERT INTO `admin_permissions` VALUES (235, 49, 'ticket.detail', 'Ticket Detail', '/support/ticket/detail/*', '2025-08-13 18:49:55', NULL);
INSERT INTO `admin_permissions` VALUES (236, 49, 'view.chat', 'Chat View', '/support/ticket/view_chats', '2025-08-13 19:46:57', NULL);
INSERT INTO `admin_permissions` VALUES (237, 49, 'send.chat', 'Send Chat', '/support/ticket/send_chats', '2025-08-14 12:01:14', NULL);
INSERT INTO `admin_permissions` VALUES (238, 50, 'view', 'view Request IB', '/member/request_ib/view', '2025-08-17 21:51:34', '2025-08-17 21:51:58');
INSERT INTO `admin_permissions` VALUES (239, 50, 'action', 'Accept or Reject - request IB', '/member/request_ib/action', '2025-08-17 21:51:34', '2025-08-17 21:54:20');
INSERT INTO `admin_permissions` VALUES (242, 50, 'view.pending', 'List Pending Request IB', '/member/request_ib_pending/view', '2025-08-17 22:23:18', NULL);
INSERT INTO `admin_permissions` VALUES (243, 51, 'view', 'view Reject-real-account', '/account/reject_real_account/view', '2025-08-25 14:43:45', '2025-08-25 14:44:09');
INSERT INTO `admin_permissions` VALUES (244, 51, 'create', 'create Reject-real-account', '/account/reject_real_account/create', '2025-08-25 14:43:45', '2025-08-25 14:44:17');
INSERT INTO `admin_permissions` VALUES (245, 51, 'update', 'update Reject-real-account', '/account/reject_real_account/update', '2025-08-25 14:43:45', '2025-08-25 14:44:34');
INSERT INTO `admin_permissions` VALUES (246, 51, 'delete', 'delete Reject-real-account', '/account/reject_real_account/delete', '2025-08-25 14:43:45', '2025-08-25 14:44:44');
INSERT INTO `admin_permissions` VALUES (247, 51, 'detail.reject.account', 'Detail reject account', '/account/reject_real_account/detail/*', '2025-08-27 15:32:35', NULL);
INSERT INTO `admin_permissions` VALUES (248, 42, 'update.bank', 'Update bank', '/tools/profile_perushaaan/update_bank', '2025-08-27 17:30:27', NULL);
INSERT INTO `admin_permissions` VALUES (249, 42, 'delete.bank', 'Delete bank', '/tools/profile_perushaaan/delete_bank', '2025-08-27 17:58:33', NULL);
INSERT INTO `admin_permissions` VALUES (250, 52, 'view', 'view Symbol', '/tools/symbol/view', '2025-09-03 11:21:53', '2025-09-04 12:46:35');
INSERT INTO `admin_permissions` VALUES (251, 52, 'create', 'create Symbol', '/tools/symbol/create', '2025-09-03 11:21:53', '2025-09-04 12:46:37');
INSERT INTO `admin_permissions` VALUES (252, 52, 'update', 'update Symbol', '/tools/symbol/update', '2025-09-03 11:21:53', '2025-09-04 12:46:40');
INSERT INTO `admin_permissions` VALUES (253, 52, 'delete', 'delete Symbol', '/tools/symbol/delete', '2025-09-03 11:21:53', '2025-09-04 12:46:43');
INSERT INTO `admin_permissions` VALUES (254, 52, 'view.detail.symbolcategory', 'view detail symbolcategory', '/tools/symbolcategory/view', '2025-09-04 12:47:57', '2025-09-04 12:54:39');
INSERT INTO `admin_permissions` VALUES (255, 52, 'view.detail.symboldetail', 'view detail symboldetail', '/tools/symboldetail/view', '2025-09-04 12:55:12', NULL);
INSERT INTO `admin_permissions` VALUES (256, 52, 'create.detail.symbolcategory', 'create detail symbolcategory', '/tools/symbol/create_category', '2025-09-04 13:12:53', '2025-09-04 13:57:57');
INSERT INTO `admin_permissions` VALUES (257, 52, 'create.detail.symboldetail', 'create detail symboldetail', '/tools/symbol/create_detail', '2025-09-04 13:21:11', '2025-09-04 13:57:45');
INSERT INTO `admin_permissions` VALUES (258, 53, 'view', 'view Structure', '/commision/structure/view', '2025-09-06 01:29:15', NULL);
INSERT INTO `admin_permissions` VALUES (259, 53, 'create', 'create Structure', '/commision/structure/create', '2025-09-06 01:29:16', NULL);
INSERT INTO `admin_permissions` VALUES (260, 53, 'update', 'update Structure', '/commision/structure/update', '2025-09-06 01:29:16', NULL);
INSERT INTO `admin_permissions` VALUES (261, 53, 'delete', 'delete Structure', '/commision/structure/delete', '2025-09-06 01:29:16', NULL);
INSERT INTO `admin_permissions` VALUES (262, 54, 'view', 'view Rebate Setting', '/commision/rebatesetting/view', '2025-09-06 03:28:21', '2025-09-06 03:31:27');
INSERT INTO `admin_permissions` VALUES (263, 54, 'create', 'create Rebate Setting', '/commision/rebatesetting/create', '2025-09-06 03:28:21', '2025-09-06 03:31:15');
INSERT INTO `admin_permissions` VALUES (264, 54, 'update', 'update Rebate Setting', '/commision/rebatesetting/update', '2025-09-06 03:28:21', '2025-09-06 03:31:08');
INSERT INTO `admin_permissions` VALUES (265, 54, 'delete', 'delete Rebate Setting', '/commision/rebatesetting/delete', '2025-09-06 03:28:22', '2025-09-06 03:31:00');
INSERT INTO `admin_permissions` VALUES (274, 57, 'view', 'view Duplicate IP', '/brm/duplicateip/view', '2025-09-06 14:20:00', '2025-09-06 14:23:46');
INSERT INTO `admin_permissions` VALUES (278, 57, 'view.detail', 'view Detail Duplicate IP', '/brm/duplicateip/detail/*', '2025-09-06 14:20:00', '2025-09-07 03:38:06');
INSERT INTO `admin_permissions` VALUES (279, 58, 'view', 'view Scalpers', '/brm/scalpers/view', '2025-09-06 16:38:45', NULL);
INSERT INTO `admin_permissions` VALUES (283, 57, 'view.detail.duplicate', 'view Detail Duplicate IP list', '/brm/duplicateipdetail/view', '2025-09-07 03:19:41', NULL);
INSERT INTO `admin_permissions` VALUES (284, 59, 'view', 'view Hedging', '/brm/hedging/view', '2025-09-08 03:27:09', '2025-09-08 03:28:32');
INSERT INTO `admin_permissions` VALUES (288, 58, 'view.detail', 'view Detail Scalpers', '/brm/scalpers/detail/*', '2025-09-08 03:44:04', '2025-09-08 03:45:22');
INSERT INTO `admin_permissions` VALUES (289, 58, 'view.detail.scalpers', 'view Detail Scalpers list', '/brm/scalpersdetail/view', '2025-09-08 03:44:04', '2025-09-08 03:45:33');
INSERT INTO `admin_permissions` VALUES (290, 60, 'view', 'view NetMargin', '/brm/netmargin/view', '2025-09-10 13:57:13', NULL);
INSERT INTO `admin_permissions` VALUES (294, 23, 'update.document', 'Update User Document', '/account/update_document', '2025-09-10 23:45:22', NULL);
INSERT INTO `admin_permissions` VALUES (295, 61, 'view', 'view Delete User', '/member/delete_user/view', '2025-09-11 16:34:26', '2025-09-11 16:35:51');
INSERT INTO `admin_permissions` VALUES (296, 61, 'create', 'create Delete User', '/member/delete_user/create', '2025-09-11 16:34:26', '2025-09-11 16:35:44');
INSERT INTO `admin_permissions` VALUES (297, 61, 'update', 'update Delete User', '/member/delete_user/update', '2025-09-11 16:34:26', '2025-09-11 16:35:37');
INSERT INTO `admin_permissions` VALUES (298, 61, 'delete', 'delete Delete User', '/member/delete_user/delete', '2025-09-11 16:34:26', '2025-09-11 16:35:29');
INSERT INTO `admin_permissions` VALUES (299, 61, 'delete.user.action', 'Delete user action', '/member/delete_user_action', '2025-09-11 17:06:49', NULL);
INSERT INTO `admin_permissions` VALUES (300, 61, 'delete.user.history', 'Delete user history', '/member/delete_user_history', '2025-09-11 17:26:10', NULL);
INSERT INTO `admin_permissions` VALUES (301, 1, 'view.lostrangking', 'Lost Rangking', '/dashboard/lostrangking/view', '2025-09-12 08:10:51', '2025-09-13 07:36:16');
INSERT INTO `admin_permissions` VALUES (302, 1, 'view.profitrangking', 'Profit Rangking', '/dashboard/profitrangking/view', '2025-09-12 08:11:02', '2025-09-13 07:36:04');
INSERT INTO `admin_permissions` VALUES (303, 1, 'view.volumerangking', 'Volume Rangking', '/dashboard/volumerangking/view', '2025-09-12 08:11:16', '2025-09-13 07:35:51');
INSERT INTO `admin_permissions` VALUES (304, 1, 'view.symbolrangking', 'Symbol Rangking', '/dashboard/symbolrangking/view', '2025-09-12 08:11:27', '2025-09-13 07:28:32');
INSERT INTO `admin_permissions` VALUES (305, 1, 'view.balancerangking', 'Balance Rangking', '/dashboard/balancerangking/view', '2025-09-12 08:11:39', '2025-09-13 07:29:29');
INSERT INTO `admin_permissions` VALUES (306, 1, 'view.depositrangking', 'Deposit Rangking', '/dashboard/depositrangking/view', '2025-09-12 08:11:51', '2025-09-13 07:31:06');
INSERT INTO `admin_permissions` VALUES (307, 64, 'view', 'View Member Bank', '/member/member_bank/view', '2025-09-12 18:46:21', '2025-09-12 18:54:33');
INSERT INTO `admin_permissions` VALUES (308, 64, 'view.pending', 'List Pending Bank', '/member/member_bank/pending', '2025-09-12 18:46:21', '2025-09-12 18:53:24');
INSERT INTO `admin_permissions` VALUES (309, 64, 'view.history', 'History Bank Diterima', '/member/member_bank/history', '2025-09-12 18:46:21', '2025-09-12 19:49:51');
INSERT INTO `admin_permissions` VALUES (310, 64, 'action', 'Accept / Reject Pending Bank', '/member/member_bank/action', '2025-09-12 18:46:21', '2025-09-12 18:50:25');
INSERT INTO `admin_permissions` VALUES (311, 23, 'view.bank_verification', 'Bank Verification', '/account/progress_real_account/bank_verification/*', '2025-09-13 00:07:10', NULL);
INSERT INTO `admin_permissions` VALUES (313, 23, 'action.bank_verification', 'Action Bank Verification', '/account/bank_verification', '2025-09-13 02:17:16', '2025-09-13 02:20:33');
INSERT INTO `admin_permissions` VALUES (314, 52, 'edit.symbol.category', 'Edit symbol category', '/tools/symbol/edit_category', '2025-09-15 15:20:41', '2025-09-15 15:30:29');
INSERT INTO `admin_permissions` VALUES (315, 52, 'edit.detail.symboldetail', 'Edit symbol detail', '/tools/symbol/edit_detail', '2025-09-15 16:19:43', NULL);
INSERT INTO `admin_permissions` VALUES (316, 52, 'delete.detail.symboldetail', 'Delete detail category', '/tools/symbol/delete_detail', '2025-09-15 17:16:10', NULL);
INSERT INTO `admin_permissions` VALUES (317, 60, 'view.netmargindeposithighest', 'view Net Margin Deposit Highest', '/brm/netmargin_dphighest/view', '2025-09-19 07:13:45', '2025-09-19 07:59:34');
INSERT INTO `admin_permissions` VALUES (318, 60, 'view.netmargindepositlowest', 'view Net Margin Deposit Lowest', '/brm/netmargin_dplowest/view', '2025-09-19 07:13:45', '2025-09-19 07:59:37');
INSERT INTO `admin_permissions` VALUES (319, 60, 'view.netmarginwithdrawalhighest', 'view Net Margin Withdrawal Highest', '/brm/netmargin_wdhighest/view', '2025-09-19 07:13:45', '2025-09-19 07:59:39');
INSERT INTO `admin_permissions` VALUES (320, 60, 'view.netmarginwithdrawallowest', 'view Net Margin Withdrawal Lowest', '/brm/netmargin_wdlowest/view', '2025-09-19 07:13:45', '2025-09-19 07:59:42');
INSERT INTO `admin_permissions` VALUES (321, 25, 'view.update', 'View update user', '/member/user/update/*', '2025-09-20 04:16:52', '2025-09-20 04:30:42');
INSERT INTO `admin_permissions` VALUES (322, 25, 'view.update.personal_information', 'View update personal information', '/member/update/personal_information', '2025-09-20 07:24:28', '2025-09-20 07:53:51');
INSERT INTO `admin_permissions` VALUES (323, 25, 'view.update.security', 'View update security', '/member/update/security', '2025-09-20 07:33:08', '2025-09-20 07:58:31');
INSERT INTO `admin_permissions` VALUES (324, 25, 'view.update.refferal', 'View update refferal', '/member/update/refferal', '2025-09-20 07:33:10', '2025-09-20 07:58:44');
INSERT INTO `admin_permissions` VALUES (325, 25, 'view.update.account', 'View update account', '/member/update/account', '2025-09-20 07:33:15', '2025-09-20 07:58:58');
INSERT INTO `admin_permissions` VALUES (326, 25, 'view.update.transaction', 'View update transaction', '/member/update/transaction', '2025-09-20 07:33:53', '2025-09-20 07:59:09');
INSERT INTO `admin_permissions` VALUES (327, 25, 'view.update.log', 'View update log', '/member/update/log', '2025-09-20 07:33:54', '2025-09-20 07:59:20');
INSERT INTO `admin_permissions` VALUES (328, 25, 'view.update.change_email', 'View update change email', '/member/update/change_email', '2025-09-22 09:00:15', NULL);
INSERT INTO `admin_permissions` VALUES (329, 65, 'view', 'view ClosedTrade', '/brm/closedtrade/view', '2025-09-23 01:00:36', NULL);
INSERT INTO `admin_permissions` VALUES (333, 23, 'update.profile', 'Update Profile', '/account/update_profile', '2025-09-24 15:40:40', NULL);
INSERT INTO `admin_permissions` VALUES (334, 53, 'structure.configure.update', 'Update structure config', '/commision/structure/update_config', '2025-09-26 10:50:38', NULL);
INSERT INTO `admin_permissions` VALUES (335, 66, 'view', 'view share', '/commision/share/view', '2025-10-01 16:28:23', NULL);
INSERT INTO `admin_permissions` VALUES (336, 66, 'view.detail', 'Detail Share', '/commision/share/detail/*', '2025-10-01 16:28:23', '2025-10-01 19:40:26');
INSERT INTO `admin_permissions` VALUES (338, 66, 'share', 'Share Rebate', '/commision/share/create', '2025-10-01 16:28:23', '2025-10-01 23:47:21');
INSERT INTO `admin_permissions` VALUES (339, 66, 'datatable.detail.trade_history', 'Datatable detail Trade History', '/commision/detail/trade_history', '2025-10-01 20:24:32', NULL);
INSERT INTO `admin_permissions` VALUES (340, 66, 'datatable.detail.preview_share', 'Datatable detail Trade History', '/commision/detail/preview_share', '2025-10-01 21:11:02', '2025-10-01 21:12:06');
INSERT INTO `admin_permissions` VALUES (341, 67, 'view', 'view nmi', '/commision/nmi/view', '2025-10-02 10:26:18', NULL);
INSERT INTO `admin_permissions` VALUES (342, 67, 'view.detail', 'Detail Share NMI', '/commision/nmi/detail/*', '2025-10-02 10:26:18', '2025-10-02 15:05:34');
INSERT INTO `admin_permissions` VALUES (343, 67, 'share', 'Share NMI', '/commision/nmi/share', '2025-10-02 10:26:18', '2025-10-02 15:12:31');
INSERT INTO `admin_permissions` VALUES (344, 67, 'datatable.detail.list_downlines_nmi', 'Datatable List Downlines NMI', '/commision/nmi/list_downlines_nmi', '2025-10-02 10:26:18', '2025-10-02 15:31:09');
INSERT INTO `admin_permissions` VALUES (345, 68, 'view', 'view NMISetting', '/commision/nmisetting/view', '2025-10-02 11:11:33', NULL);
INSERT INTO `admin_permissions` VALUES (347, 68, 'update', 'update NMISetting', '/commision/nmisetting/update', '2025-10-02 11:11:33', NULL);
INSERT INTO `admin_permissions` VALUES (349, 69, 'view', 'view RetentionQueue', '/member/retentionqueue/view', '2025-10-03 04:27:52', NULL);
INSERT INTO `admin_permissions` VALUES (350, 69, 'confirm', 'confirm RetentionQueue', '/member/retentionqueue/confirm', '2025-10-03 04:27:52', '2025-10-03 04:28:39');
INSERT INTO `admin_permissions` VALUES (351, 69, 'release', 'release RetentionQueue', '/member/retentionqueue/release', '2025-10-03 04:27:52', '2025-10-03 04:30:41');
INSERT INTO `admin_permissions` VALUES (353, 69, 'action', 'action RetentionQueue', '/member/retentionqueue/action', '2025-10-03 04:52:05', NULL);
INSERT INTO `admin_permissions` VALUES (354, 70, 'view', 'view Article', '/news/article/view', '2025-10-09 14:37:19', NULL);
INSERT INTO `admin_permissions` VALUES (355, 70, 'create', 'create Article', '/news/article/create', '2025-10-09 14:37:19', NULL);
INSERT INTO `admin_permissions` VALUES (356, 70, 'update', 'update Article', '/news/article/update', '2025-10-09 14:37:20', NULL);
INSERT INTO `admin_permissions` VALUES (357, 70, 'delete', 'delete Article', '/news/article/delete', '2025-10-09 14:37:20', NULL);
INSERT INTO `admin_permissions` VALUES (362, 50, 'view.pending_new', 'List Pending Request IB new', '/member/request_ib_pending_new/view', '2025-10-28 06:47:44', NULL);
INSERT INTO `admin_permissions` VALUES (363, 50, 'action_new', 'Accept or Reject - request IB new', '/member/request_ib/action_new', '2025-10-28 06:48:16', NULL);
INSERT INTO `admin_permissions` VALUES (368, 73, 'view', 'View Request IB', '/structure_setting/request_ib/view', '2025-11-04 15:35:20', '2025-11-04 15:37:39');
INSERT INTO `admin_permissions` VALUES (369, 73, 'view.pending', 'List Pending Request IB', '/structure_setting/request_ib_pending/view', '2025-11-04 15:35:20', '2025-11-04 15:38:08');
INSERT INTO `admin_permissions` VALUES (370, 73, 'action', 'Accept / Reject Request IB', '/structure_setting/request_ib/action', '2025-11-04 15:35:20', '2025-11-04 15:38:30');
INSERT INTO `admin_permissions` VALUES (371, 73, 'delete', 'delete Request IB', '/structure setting/request ib/delete', '2025-11-04 15:35:20', NULL);
INSERT INTO `admin_permissions` VALUES (372, 74, 'view', 'view MemberTree', '/member/membertree/view', '2025-11-09 00:00:10', NULL);
INSERT INTO `admin_permissions` VALUES (373, 74, 'create', 'create MemberTree', '/member/membertree/create', '2025-11-09 00:00:10', NULL);
INSERT INTO `admin_permissions` VALUES (374, 74, 'update', 'update MemberTree', '/member/membertree/update', '2025-11-09 00:00:10', NULL);
INSERT INTO `admin_permissions` VALUES (375, 74, 'delete', 'delete MemberTree', '/member/membertree/delete', '2025-11-09 00:00:10', NULL);
INSERT INTO `admin_permissions` VALUES (376, 77, 'view', 'view AccountStructure', '/salesreporting/accountstructure/view', '2025-11-14 15:25:14', NULL);
INSERT INTO `admin_permissions` VALUES (377, 77, 'create', 'create AccountStructure', '/salesreporting/accountstructure/create', '2025-11-14 15:25:14', NULL);
INSERT INTO `admin_permissions` VALUES (378, 77, 'update', 'update AccountStructure', '/salesreporting/accountstructure/update', '2025-11-14 15:25:14', NULL);
INSERT INTO `admin_permissions` VALUES (379, 77, 'delete', 'delete AccountStructure', '/salesreporting/accountstructure/delete', '2025-11-14 15:25:14', NULL);
INSERT INTO `admin_permissions` VALUES (380, 78, 'view', 'view SendEmail', '/support/sendemail/view', '2025-11-17 16:39:04', NULL);
INSERT INTO `admin_permissions` VALUES (381, 78, 'create', 'create SendEmail', '/support/sendemail/create', '2025-11-17 16:39:04', NULL);
INSERT INTO `admin_permissions` VALUES (382, 78, 'update', 'update SendEmail', '/support/sendemail/update', '2025-11-17 16:39:04', NULL);
INSERT INTO `admin_permissions` VALUES (383, 78, 'delete', 'delete SendEmail', '/support/sendemail/delete', '2025-11-17 16:39:04', NULL);
INSERT INTO `admin_permissions` VALUES (384, 25, 'view.update.report', 'View update report', '/member/update/report', '2025-11-21 00:42:05', NULL);
INSERT INTO `admin_permissions` VALUES (385, 79, 'view', 'View Adjustment Account', '/transaction/adjustment_account/view', '2025-11-23 02:12:16', '2025-11-23 02:19:04');
INSERT INTO `admin_permissions` VALUES (386, 79, 'create', 'Create Adjustment Account', '/transaction/adjustment_account/create', '2025-11-23 02:12:16', '2025-11-23 02:18:49');
INSERT INTO `admin_permissions` VALUES (389, 79, 'rollback', 'Rollback', '/transaction/adjustment_account/rollback', '2025-11-23 02:17:47', NULL);
INSERT INTO `admin_permissions` VALUES (390, 80, 'view', 'view branch', '/salesreporting/branch/view', '2025-11-23 22:42:02', '2025-11-23 22:47:39');
INSERT INTO `admin_permissions` VALUES (391, 80, 'create', 'create branch', '/salesreporting/branch/create', '2025-11-23 22:42:02', '2025-11-23 22:47:41');
INSERT INTO `admin_permissions` VALUES (392, 80, 'update', 'update branch', '/salesreporting/branch/update', '2025-11-23 22:42:02', '2025-11-23 22:47:44');
INSERT INTO `admin_permissions` VALUES (393, 80, 'delete', 'delete branch', '/salesreporting/branch/delete', '2025-11-23 22:42:02', '2025-11-23 22:47:46');
INSERT INTO `admin_permissions` VALUES (394, 81, 'view', 'View Blast Email', '/support/blast_email/view', '2026-01-19 14:38:07', '2026-01-19 14:40:43');
INSERT INTO `admin_permissions` VALUES (395, 81, 'create', 'create Blast Email', '/support/blast email/create', '2026-01-19 14:38:07', NULL);
INSERT INTO `admin_permissions` VALUES (412, 85, 'view', 'View Sales Conditions', '/account/sales_conditions/view', '2026-02-13 10:58:50', '2026-02-13 14:14:34');
INSERT INTO `admin_permissions` VALUES (413, 85, 'action', 'Action Sales Conditions', '/account/action_sales_conditions', '2026-02-13 10:58:50', '2026-02-13 16:30:46');
INSERT INTO `admin_permissions` VALUES (416, 85, 'datatable.history', 'History Sales Conditions', '/account/history_sales_conditions', '2026-02-13 14:11:44', '2026-02-13 14:12:11');
INSERT INTO `admin_permissions` VALUES (417, 85, 'datatable.pending', 'Pending Sales Conditions', '/account/pending_sales_conditions', '2026-02-13 14:13:24', NULL);
INSERT INTO `admin_permissions` VALUES (418, 78, 'detail', 'Detail SendEmail', '/support/sendemail/detail', '2026-02-23 13:56:16', NULL);
INSERT INTO `admin_permissions` VALUES (419, 85, 'history_rebate', 'History Rebate Sales Conditions', '/account/sales_conditions/history_rebate', '2026-04-01 09:23:13', NULL);
INSERT INTO `admin_permissions` VALUES (420, 85, 'datatable.history_rebate', 'History Rebate Sales Conditions', '/account/history_rebate', '2026-04-01 10:06:11', NULL);
INSERT INTO `admin_permissions` VALUES (421, 85, 'datatable.history_rebate_recipient', 'History Rebate Recipient Sales Conditions', '/account/history_rebate_recipient', '2026-04-01 11:20:38', '2026-04-01 14:52:18');
INSERT INTO `admin_permissions` VALUES (422, 85, 'summary_rebate', 'View Summary Rebate', '/account/sales_conditions/summary_rebate', '2026-04-01 13:48:49', NULL);
INSERT INTO `admin_permissions` VALUES (423, 85, 'rebate_request_partner', 'View Rebate Request By Partner Sales Conditions', '/account/sales_conditions/rebate_request_partner', '2026-04-01 20:10:40', '2026-04-02 09:12:59');
INSERT INTO `admin_permissions` VALUES (424, 85, 'datatable.history_source_rebate', 'History Source Rebate Sales Conditions', '/account/history_source_rebate', '2026-04-02 11:07:23', NULL);
INSERT INTO `admin_permissions` VALUES (425, 25, 'view.update.controls', 'View update controls', '/member/update/controls', '2026-04-20 09:30:27', NULL);
INSERT INTO `admin_permissions` VALUES (435, 87, 'view', 'My Activity', '/activity/view', '2026-04-24 17:04:18', '2026-07-16 10:00:27');
INSERT INTO `admin_permissions` VALUES (436, 87, 'view_logs', 'View Activity', '/activity/logs', '2026-04-24 17:04:18', '2026-07-15 17:27:27');
INSERT INTO `admin_permissions` VALUES (451, 91, 'view', 'view Trading Competition', '/event/trading_competition/view', '2026-05-12 15:12:55', '2026-05-12 15:13:16');
INSERT INTO `admin_permissions` VALUES (453, 91, 'view.periode', 'Detail each Periode of Trading Competition', '/event/trading_competition/periode/*', '2026-05-12 15:12:55', '2026-05-13 11:23:09');
INSERT INTO `admin_permissions` VALUES (455, 25, 'view.update.history.trans', 'View update history transaksi', '/member/update/history_transaksi', '2026-06-19 00:52:19', NULL);
INSERT INTO `admin_permissions` VALUES (456, 25, 'view.update.history.it', 'View update history it', '/member/update/history_it_trans', '2026-06-19 04:00:50', NULL);
INSERT INTO `admin_permissions` VALUES (461, 91, 'create.event', 'Create Event Trading Competition', '/event/trading_competition/master/create', '2026-07-02 15:56:52', '2026-07-02 15:57:58');
INSERT INTO `admin_permissions` VALUES (462, 91, 'edit.event', 'Edit Event Data', '/event/trading_competition/master/edit', '2026-07-03 00:45:41', NULL);
INSERT INTO `admin_permissions` VALUES (463, 93, 'view', 'view Progress Upgrade Standar Account', '/account/progress_upgrade_standar_account/view', '2026-07-15 15:39:16', '2026-07-15 15:43:25');
INSERT INTO `admin_permissions` VALUES (464, 93, 'create', 'create Progress Upgrade Standar Account', '/account/progress_upgrade_standar_account/create', '2026-07-15 15:39:16', '2026-07-15 15:43:43');
INSERT INTO `admin_permissions` VALUES (465, 93, 'update', 'update Progress Upgrade Standar Account', '/account/progress_upgrade_standar_account/update', '2026-07-15 15:39:16', '2026-07-15 15:44:04');
INSERT INTO `admin_permissions` VALUES (466, 93, 'delete', 'delete Progress Upgrade Standar Account', '/account/progress_upgrade_standar_account/delete', '2026-07-15 15:39:16', '2026-07-15 15:44:17');
INSERT INTO `admin_permissions` VALUES (467, 23, 'wp.verification1', 'WP Verificator1', '/account/progress_real_account/wp_verification1/*', '2026-07-16 12:11:46', NULL);

SET FOREIGN_KEY_CHECKS = 1;
