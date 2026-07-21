SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `admin_module` VALUES (1, 1, 1, 'Dashboard', -1, -1, CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_module` VALUES (2, 2, 2, 'Investor', -1, -1, CURRENT_TIMESTAMP, NULL);
INSERT INTO `admin_module` VALUES (3, 3, 2, 'Pengaturan', -1, -1, CURRENT_TIMESTAMP, NULL);

SET FOREIGN_KEY_CHECKS = 1;
