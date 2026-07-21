SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `admin_module_group`;
CREATE TABLE `admin_module_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int UNSIGNED NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('single','dropdown') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'single',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `min_level` int NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `admin_module_group` VALUES (1, 1, 'Dashboard', 'single', 'ti-home sidemenu-icon menu-icon', 1);
INSERT INTO `admin_module_group` VALUES (2, 2, 'Toko Madura', 'dropdown', 'ti-server sidemenu-icon menu-icon', 1);

SET FOREIGN_KEY_CHECKS = 1;
