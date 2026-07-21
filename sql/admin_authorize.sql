SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `admin_authorize`;
CREATE TABLE `admin_authorize`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int UNSIGNED NOT NULL,
  `permission_id` int NOT NULL,
  `status` int NOT NULL DEFAULT -1,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_role`(`admin_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `fk_permission_id`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `admin_authorize_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_authorize_ibfk_3` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `admin_authorize` (`admin_id`, `permission_id`, `status`) VALUES (1, 1, -1);
INSERT INTO `admin_authorize` (`admin_id`, `permission_id`, `status`) VALUES (1, 2, -1);
INSERT INTO `admin_authorize` (`admin_id`, `permission_id`, `status`) VALUES (1, 3, -1);
INSERT INTO `admin_authorize` (`admin_id`, `permission_id`, `status`) VALUES (1, 4, -1);
INSERT INTO `admin_authorize` (`admin_id`, `permission_id`, `status`) VALUES (1, 5, -1);
INSERT INTO `admin_authorize` (`admin_id`, `permission_id`, `status`) VALUES (1, 6, -1);
INSERT INTO `admin_authorize` (`admin_id`, `permission_id`, `status`) VALUES (1, 7, -1);

SET FOREIGN_KEY_CHECKS = 1;
