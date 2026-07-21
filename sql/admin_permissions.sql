SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `admin_permissions` VALUES (1, 1, 'view', 'View Dashboard', '/dashboard', CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_permissions` VALUES (2, 2, 'view', 'View Investor List', '/investor/view', CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_permissions` VALUES (3, 2, 'create', 'Create Investor', '/investor/create', CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_permissions` VALUES (4, 2, 'update', 'Update Investor', '/investor/update/*', CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_permissions` VALUES (5, 2, 'delete', 'Delete Investor', '/investor/delete', CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_permissions` VALUES (6, 3, 'view', 'View System Settings', '/pengaturan/view', CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_permissions` VALUES (7, 3, 'update', 'Update System Settings', '/pengaturan/update', CURRENT_TIMESTAMP, NULL);

SET FOREIGN_KEY_CHECKS = 1;
